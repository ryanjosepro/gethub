unit Datas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.SQLiteVDataSet,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait;

type
  TDataFactory = class(TDataModule)
    JSON: TFDStanStorageJSONLink;
    Table: TFDMemTable;
    TableChecked: TBooleanField;
    TableLink: TStringField;
    TablePath: TStringField;
    TableName: TStringField;
    TableLastAct: TStringField;
    TableMsg: TStringField;
    TableDescription: TStringField;
  end;

var
  DataFactory: TDataFactory;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
