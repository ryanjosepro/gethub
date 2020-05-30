unit DAO;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, FireDAC.Comp.Client,
  Vcl.Forms, FireDAC.Stan.Intf, Vcl.Dialogs, FireDAC.Phys.SQLiteVDataSet, FireDAC.Phys.SQLite,
  MyUtils, Connection, Git;

type
  TDAO = class
  public
    class function Table: TFDMemTable;
    class procedure Load(CleanChecked: boolean = true); overload;
    class procedure Save(CleanChecked: boolean = true); overload;

    class procedure Load(Path: string; CleanChecked: boolean = true); overload;
    class procedure Save(Path: string; CleanChecked: boolean = true); overload;

    class function GetField(Field: string): variant;
    class procedure SetField(Field: string; Value: variant);

    class procedure Insert(Repository: TRepository);
    class procedure Edit(Repository: TRepository);
    class procedure Delete;

    class procedure SelectAll(Checked: boolean = true);
    class function GetCheckeds(Field: string): TStringList;
    class procedure SetCheckeds(Field, Value: string);

    class function GetCheckedRepositories: TRepositoryArray;

    class function ValueExists(Field: string; Value: Variant; ConsiderCurrent: boolean = true): boolean;

    class function Count: integer;
    class function CountChecked: integer;

    class function GetIndex: integer;
    class procedure SetIndex(Index: integer);

    class procedure Refresh;
  end;

implementation

var
  DataPath: string = 'Data.json';

{ TDAO }

class function TDAO.Table: TFDMemTable;
begin
  Result := DataModuleConn.Table;
end;

class procedure TDAO.Load(CleanChecked: boolean = true);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + DataPath;

  if FileExists(Path) then
  begin
    Table.LoadFromFile(Path);

    if CleanChecked then
    begin
      Table.DisableControls;

      Table.First;
      while not Table.Eof do
      begin
        SetField('Checked', false);
        SetField('Message', '');
        Table.Next;
      end;
      Table.First;

      Table.EnableControls;
    end;
  end;
end;

class procedure TDAO.Save(CleanChecked: boolean = true);
var
  Index: integer;
begin
  if CleanChecked then
  begin
    Index := GetIndex;

    Table.DisableControls;

    Table.First;
    while not Table.Eof do
    begin
      SetField('Checked', false);
      SetField('Message', '');
      Table.Next;
    end;

    SetIndex(Index);

    Table.EnableControls;
  end;

  //TUtils.CreateIfNotExistsDir(TUtils.AppPath + 'Data');

  Table.SaveToFile(TUtils.AppPath + DataPath, sfJSON);
end;

class procedure TDAO.Load(Path: string; CleanChecked: boolean = true);
begin
  Table.LoadFromFile(Path, sfJSON);

  if CleanChecked then
  begin
    Table.DisableControls;

    Table.First;
    while not Table.Eof do
    begin
      SetField('Checked', false);
      SetField('Message', '');
      Table.Next;
    end;
    Table.First;

    Table.EnableControls;
  end;
end;

class procedure TDAO.Save(Path: string; CleanChecked: boolean = true);
var
  Index: integer;
begin
  if CleanChecked then
  begin
    Index := GetIndex;

    Table.DisableControls;

    Table.First;
    while not Table.Eof do
    begin
      SetField('Checked', false);
      SetField('Message', '');
      Table.Next;
    end;

    SetIndex(Index);

    Table.EnableControls;
  end;

  TUtils.CreateIfNotExistsDir(Path);

  Table.SaveToFile(Path, sfJSON);
end;

class function TDAO.GetField(Field: string): variant;
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

class procedure TDAO.SetField(Field: string; Value: variant);
begin
  Table.Edit;
  Table.FieldByName(Field).AsVariant := Value;
  Table.Post;
end;

class procedure TDAO.Insert(Repository: TRepository);
begin
  Table.UpdateOptions.EnableInsert := true;
  Table.Insert;
  Table.FieldByName('Checked').AsVariant := false;
  Table.FieldByName('Link').AsVariant := Repository.Link;
  Table.FieldByName('Path').AsVariant := Repository.Path;
  Table.FieldByName('Name').AsVariant := Repository.Name;
  Table.FieldByName('Description').AsVariant := Repository.Desc;
  Table.Post;
  Save;
  Table.UpdateOptions.EnableInsert := false;
end;

class procedure TDAO.Edit(Repository: TRepository);
begin
  Table.Edit;
  Table.FieldByName('Link').AsVariant := Repository.Link;
  Table.FieldByName('Path').AsVariant := Repository.Path;
  Table.FieldByName('Name').AsVariant := Repository.Name;
  Table.FieldByName('Description').AsVariant := Repository.Desc;
  Table.Post;
  Save;
end;

class procedure TDAO.Delete;
begin
  Table.Delete;
  Save;
end;

class procedure TDAO.SelectAll(Checked: boolean = true);
var
  Index: integer;
begin
  Index := GetIndex;

  Table.DisableControls;

  Table.First;

  while not Table.Eof do
  begin
    SetField('Checked', Checked);
    Table.Next;
  end;

  SetIndex(Index);

  Table.EnableControls;
end;

class function TDAO.GetCheckeds(Field: string): TStringList;
var
  Index: integer;
begin
  Index := GetIndex;

  Table.DisableControls;

  Table.First;

  Result := TStringList.Create;

  while not Table.Eof do
  begin
    if GetField('Checked') = true then
    begin
      Result.Add(GetField(Field));
    end;
    Table.Next;
  end;

  SetIndex(Index);

  Table.EnableControls;
end;

class procedure TDAO.SetCheckeds(Field, Value: string);
var
  Index: integer;
begin
  Index := GetIndex;

  Table.DisableControls;

  Table.First;

  while not Table.Eof do
  begin
    if GetField('Checked') = true then
    begin
      SetField(Field, Value);
    end;
    Table.Next;
  end;

  Save(false);

  SetIndex(Index);

  Table.EnableControls;
end;

class function TDAO.GetCheckedRepositories: TRepositoryArray;
var
  I: integer;
  Links, Paths, Names, Descriptions, LastActs, Msgs: TStringList;
begin
  SetLength(Result, GetCheckeds('Checked').Count);

  try
    Links := GetCheckeds('Link');
    Paths := GetCheckeds('Path');
    Names := GetCheckeds('Name');
    Descriptions := GetCheckeds('Description');
    LastActs := GetCheckeds('LastAction');
    Msgs := GetCheckeds('Message');

    for I := 0 to Length(Result) - 1 do
    begin
      Result[I] := TRepository.Create;
      Result[I].Link := Links[I];
      Result[I].Path := Paths[I];
      Result[I].Name := Names[I];
      Result[I].Desc := Descriptions[I];
      Result[I].LastAct := LastActs[I];
      Result[I].Msg := Msgs[I];
    end;
  finally
    FreeAndNil(Links);
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
end;

class function TDAO.CountChecked: integer;
begin
  Result := GetCheckeds('Checked').Count;
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

end.
