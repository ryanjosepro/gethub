unit DAO;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, FireDAC.Comp.Client,
  Vcl.Forms, FireDAC.Stan.Intf, Vcl.Dialogs, FireDAC.Phys.SQLiteVDataSet, FireDAC.Phys.SQLite,
  MyUtils, Connection, Git;

type
  TRepositoriesFilterStatus = (rfOnlyActives, rfOnlyInactives, rfAll);

  TDAO = class
  public
    class function Table: TFDMemTable;
    class procedure Load(CleanChecked: boolean = true); overload;
    class procedure Save(CleanChecked: boolean = false); overload;

    class procedure Load(FileName: string; CleanChecked: boolean = true); overload;
    class procedure Save(FileName: string; CleanChecked: boolean = false); overload;

    class procedure Insert(Repository: TRepository);
    class procedure EditSelected(Repository: TRepository);
    class procedure Delete;

    class procedure Search(Name: string; FilterStatus: TRepositoriesFilterStatus);

    class procedure CheckAll(Checked: boolean = true);

    class procedure SetAllFields(Field: string; Value: Variant);
    class function GetSelectedField(Field: string): variant;
    class function GetSelectedStringField(Field: string): string;
    class procedure SetSelectedField(Field: string; Value: Variant);
    class function GetCheckedFields(Field: string): TStringList;
    class procedure SetCheckedFields(Field: string; Value: Variant);
    class function GetSelectedRepository: TRepository;
    class function GetCheckedRepositories: TRepositoryArray;

    class function ValueExists(Field: string; Value: Variant; ConsiderCurrent: boolean = true): boolean;

    class function Count: integer;
    class function CountCheckeds: integer;

    class function GetIndex: integer;
    class procedure SetIndex(Index: integer);

    class procedure Refresh;

    class procedure SetLastAction(Action: string);

    class procedure EnableFiltered;
    class procedure DisableFiltered;
  end;

implementation

var
  DataFileName: string = 'Data.json';

{ TDAO }

class function TDAO.Table: TFDMemTable;
begin
  Result := DataModuleConn.Table;
end;


class procedure TDAO.Load(CleanChecked: boolean = true);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + DataFileName;

  if FileExists(Path) then
  begin
    Table.LoadFromFile(Path);

    if CleanChecked then
    begin
      Table.DisableControls;

      Table.First;
      while not Table.Eof do
      begin
        SetSelectedField('Checked', false);
        SetSelectedField('Message', '');
        Table.Next;
      end;
      Table.First;

      Table.EnableControls;
    end;
  end
  else
  begin
    Table.Open;
  end;
end;

class procedure TDAO.Save(CleanChecked: boolean = false);
begin
  Table.DisableControls;

  DisableFiltered;

  if CleanChecked then
  begin
    var Index := GetIndex;

    Table.First;

    while not Table.Eof do
    begin
      SetSelectedField('Checked', false);
      SetSelectedField('Message', '');
      Table.Next;
    end;

    SetIndex(Index);
  end;

  Table.SaveToFile(TUtils.AppPath + DataFileName, sfJSON);

  EnableFiltered;

  Table.EnableControls;
end;

class procedure TDAO.Load(FileName: string; CleanChecked: boolean = true);
begin
  Table.LoadFromFile(FileName, sfJSON);

  if CleanChecked then
  begin
    Table.DisableControls;

    Table.First;
    while not Table.Eof do
    begin
      SetSelectedField('Checked', false);
      SetSelectedField('Message', '');
      Table.Next;
    end;
    Table.First;

    Table.EnableControls;
  end;
end;

class procedure TDAO.Save(FileName: string; CleanChecked: boolean = false);
begin
  Table.DisableControls;

  DisableFiltered;

  if CleanChecked then
  begin
    var Index := GetIndex;

    Table.First;

    while not Table.Eof do
    begin
      SetSelectedField('Checked', false);
      SetSelectedField('Message', '');
      Table.Next;
    end;

    SetIndex(Index);
  end;

  TUtils.CreateIfNotExistsDir(ExtractFileDir(FileName));

  Table.SaveToFile(FileName, sfJSON);

  EnableFiltered;

  Table.EnableControls;
end;


class procedure TDAO.Insert(Repository: TRepository);
begin
  if TDAO.Count = 0 then
  begin
    EditSelected(Repository);
  end
  else
  begin
    Table.UpdateOptions.EnableInsert := true;
    Table.Insert;
    Table.FieldByName('Checked').AsBoolean := false;
    Table.FieldByName('Link').AsString := Repository.Link;
    Table.FieldByName('Branch').AsString:= Repository.Branch;
    Table.FieldByName('Path').AsString := Repository.Path;
    Table.FieldByName('Name').AsString := Repository.Name;
    Table.FieldByName('Description').AsString := Repository.Desc;
    Table.FieldByName('Active').AsBoolean := Repository.Active;
    Table.Post;
    Save;
    Table.UpdateOptions.EnableInsert := false;
  end;
end;

class procedure TDAO.EditSelected(Repository: TRepository);
begin
  Table.Edit;
  Table.FieldByName('Link').AsString := Repository.Link;
  Table.FieldByName('Branch').AsString:= Repository.Branch;
  Table.FieldByName('Path').AsString := Repository.Path;
  Table.FieldByName('Name').AsString := Repository.Name;
  Table.FieldByName('Description').AsString := Repository.Desc;
  Table.FieldByName('Active').AsBoolean := Repository.Active;
  Table.Post;
  Save;
end;

class procedure TDAO.Delete;
begin
  Table.Delete;
  Save;
end;

class procedure TDAO.Search(Name: string; FilterStatus: TRepositoriesFilterStatus);
var
  ActivesFilter: string;
begin
 case FilterStatus of
    rfOnlyActives:
      ActivesFilter := ' Active = true';
    rfOnlyInactives:
      ActivesFilter := ' Active = false';
    rfAll:
      ActivesFilter := ' Active = true or Active = false'
  end;

  Table.Filter := 'Name like ''%' + Name + '%'' and ' + ActivesFilter;
  Table.Filtered := true;

  Table.Last;

  Table.First;
end;


class procedure TDAO.CheckAll(Checked: boolean = true);
var
  Index: integer;
begin
  Index := GetIndex;

  Table.DisableControls;

  Table.First;

  while not Table.Eof do
  begin
    SetSelectedField('Checked', Checked);
    Table.Next;
  end;

  SetIndex(Index);

  Table.EnableControls;
end;


class procedure TDAO.SetAllFields(Field: string; Value: Variant);
var
  Index: integer;
begin
  Index := GetIndex;

  try
    Table.DisableControls;

    Table.Filtered := false;

    Table.First;

    while not Table.Eof do
    begin
      SetSelectedField(Field, Value);

      Table.Next;
    end;

    Save;
  finally
    Table.Filtered := true;

    SetIndex(Index);

    Table.EnableControls;
  end;
end;

class function TDAO.GetSelectedField(Field: string): variant;
begin
  if Count <> 0 then
  begin
    if not Table.FieldByName(Field).IsNull then
    begin
      Result := Table.FieldByName(Field).AsVariant;
    end
    else
    begin
      Result := '';
    end;
  end;
end;

class function TDAO.GetSelectedStringField(Field: string): string;
begin
  if not Table.FieldByName(Field).IsNull then
  begin
    Result := Table.FieldByName(Field).AsString;
  end
  else
  begin
    Result := '';
  end;
end;

class procedure TDAO.SetSelectedField(Field: string; Value: variant);
begin
  Table.Edit;
  Table.FieldByName(Field).AsVariant := Value;
  Table.Post;
end;

class function TDAO.GetCheckedFields(Field: string): TStringList;
var
  Index: integer;
begin
  Index := GetIndex;

  Table.DisableControls;

  Table.First;

  Result := TStringList.Create;

  while not Table.Eof do
  begin
    if GetSelectedField('Checked') = true then
    begin
      Result.Add(GetSelectedField(Field));
    end;
    Table.Next;
  end;

  SetIndex(Index);

  Table.EnableControls;
end;

class procedure TDAO.SetCheckedFields(Field: string; Value: Variant);
var
  Index: integer;
begin
  Index := GetIndex;

  try
    Table.DisableControls;

    Table.Filtered := false;

    Table.First;

    while not Table.Eof do
    begin
      if GetSelectedField('Checked') = true then
        SetSelectedField(Field, Value);

      Table.Next;
    end;

    Save;
  finally
    Table.Filtered := true;

    SetIndex(Index);

    Table.EnableControls;
  end;
end;

class function TDAO.GetSelectedRepository: TRepository;
begin
  Result := TRepository.Create;

  Result.Link := GetSelectedField('Link');
  Result.Branch := GetSelectedField('Branch');
  Result.Path := GetSelectedField('Path');
  Result.Name := GetSelectedField('Name');
  Result.Desc := GetSelectedField('Description');
  Result.LastAct := GetSelectedField('LastAction');
  Result.Msg := GetSelectedField('Message');
end;

class function TDAO.GetCheckedRepositories: TRepositoryArray;
var
  I: integer;
  Links, Branchs, Paths, Names, Descriptions, LastActs, Msgs: TStringList;
begin
  SetLength(Result, GetCheckedFields('Checked').Count);

  try
    Links := GetCheckedFields('Link');
    Branchs := GetCheckedFields('Branch');
    Paths := GetCheckedFields('Path');
    Names := GetCheckedFields('Name');
    Descriptions := GetCheckedFields('Description');
    LastActs := GetCheckedFields('LastAction');
    Msgs := GetCheckedFields('Message');

    for I := 0 to Length(Result) - 1 do
    begin
      Result[I] := TRepository.Create;
      Result[I].Link := Links[I];
      Result[I].Branch := Branchs[I];
      Result[I].Path := Paths[I];
      Result[I].Name := Names[I];
      Result[I].Desc := Descriptions[I];
      Result[I].LastAct := LastActs[I];
      Result[I].Msg := Msgs[I];
    end;
  finally
    FreeAndNil(Links);
    FreeAndNil(Branchs);
    FreeAndNil(Paths);
    FreeAndNil(Names);
    FreeAndNil(Descriptions);
    FreeAndNil(LastActs);
    FreeAndNil(Msgs);
  end;
end;


class function TDAO.ValueExists(Field: string; Value: Variant; ConsiderCurrent: boolean = true): boolean;
var
  Index, Cont: integer;
begin
  Index := GetIndex;

  Result := false;

  Table.DisableControls;

  Cont := 1;

  Table.First;

  while not Table.Eof do
  begin
    if ConsiderCurrent then
    begin
      Result := Result or (Table.FieldByName(Field).AsVariant = Value);
    end
    else
    begin
      if Cont <> Index then
      begin
        Result := Result or (Table.FieldByName(Field).AsVariant = Value);
      end;
    end;

    Inc(Cont, 1);
    Table.Next;
  end;

  SetIndex(Index);

  Table.EnableControls;
end;


class function TDAO.Count: integer;
begin
  Result := Table.RecordCount;

  if Result = 1 then
  begin
    Table.First;

    if GetSelectedStringField('Link') = '' then
      Result := 0;
  end;
end;

class function TDAO.CountCheckeds: integer;
begin
  Result := GetCheckedFields('Checked').Count;
end;


class function TDAO.GetIndex: integer;
begin
  Result := Table.RecNo;
end;

class procedure TDAO.SetIndex(Index: integer);
begin
  Table.RecNo := Index;
end;


class procedure TDAO.Refresh;
begin
  Table.Refresh;
end;

class procedure TDAO.SetLastAction(Action: string);
begin
  SetCheckedFields('LastAction', Action);
end;

class procedure TDAO.EnableFiltered;
begin
  Table.Filtered := true;
end;

class procedure TDAO.DisableFiltered;
begin
  Table.Filtered := false;
end;

end.
