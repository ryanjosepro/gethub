unit DAO;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, FireDAC.Comp.Client, Vcl.Forms,
  FireDAC.Stan.Intf,
  Datas, Arrays, MyUtils;

type
  TDAO = class
  public
    class function Table: TFDMemTable;
    class procedure Load;
    class procedure Save;
    class function GetField(Name: string): variant;
    class procedure SetField(Name: string; Value: variant);
    class procedure Insert(Link, Path, Name: string);
    class procedure Edit(Link, Path, Name: string);
    class procedure Delete;
    class function GetChecked: TStringList;
    class function Count: integer;
  end;

implementation

{ TDAO }

class function TDAO.Table: TFDMemTable;
begin
  Result := DataFactory.Table;
end;

class procedure TDAO.Load;
begin
  Table.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Repositories.json', sfJSON);
end;

class procedure TDAO.Save;
begin
  Table.SaveToFile(ExtractFilePath(Application.ExeName) + 'Repositories.json', sfJSON);
end;

class function TDAO.GetField(Name: string): variant;
begin
  Result := Table.FieldByName(Name).AsVariant;
end;

class procedure TDAO.SetField(Name: string; Value: variant);
begin
  Table.Edit;
  Table.FieldByName(Name).AsVariant := Value;
  Table.Post;
  Save;
end;

class procedure TDAO.Insert(Link, Path, Name: string);
begin
  Table.Insert;
  Table.FieldByName(' ').AsVariant := false;
  Table.FieldByName('Link').AsVariant := Link;
  Table.FieldByName('Path').AsVariant := Path;
  Table.FieldByName('Name').AsVariant := Name;
  Table.Post;
  Save;
end;

class procedure TDAO.Edit(Link, Path, Name: string);
begin
  Table.Edit;
  Table.FieldByName('Link').AsVariant := Link;
  Table.FieldByName('Path').AsVariant := Path;
  Table.FieldByName('Name').AsVariant := Name;
  Table.Post;
  Save;
end;

class procedure TDAO.Delete;
begin
  Table.Delete;
  Save;
end;

class function TDAO.GetChecked: TStringList;
var
  Cont: integer;
begin
  Result := TStringList.Create;
  Table.First;
  while not Table.Eof do
  begin
    if GetField(' ') = true then
    begin
      Result.Add(GetField('Name'));
    end;
    Table.Next;
  end;
  Table.First;
end;

class function TDAO.Count: integer;
begin
  Result := Table.RecordCount;
end;

end.
