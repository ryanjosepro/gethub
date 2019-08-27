unit DAO;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, FireDAC.Comp.Client,
  Datas;

type
  TDAO = class
  private
    class function Table: TFDMemTable;
    class procedure SetField(Name, Value: string);
  public
    class procedure Insert(Link, Path, Nome: string);

  end;

implementation

{ TDAO }

class function TDAO.Table: TFDMemTable;
begin
  Result := DataFactory.Table;
end;

class procedure TDAO.SetField(Name, Value: string);
begin
  Table.FieldByName(Name).AsString := Value;
end;

class procedure TDAO.Insert(Link, Path, Nome: string);
begin
  Table.Insert;
  SetField('Link', Link);
  SetField('Path', Path);
  SetField('Nome', Nome);
  Table.Post;
end;

end.