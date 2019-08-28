unit DAO;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, FireDAC.Comp.Client,
  Datas;

type
  TDAO = class
  public
    class function Table: TFDMemTable;
    class function GetField(Name: string): variant;
    class procedure SetField(Name: string; Value: variant);
    class procedure Insert(Link, Path, Nome: string);
  end;

implementation

{ TDAO }

class function TDAO.Table: TFDMemTable;
begin
  Result := DataFactory.Table;
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
end;

class procedure TDAO.Insert(Link, Path, Nome: string);
begin
  Table.Insert;
  Table.FieldByName(' ').AsVariant := false;
  Table.FieldByName('Link').AsVariant := Link;
  Table.FieldByName('Path').AsVariant := Path;
  Table.FieldByName('Nome').AsVariant := Nome;
  Table.Post;
end;

end.
