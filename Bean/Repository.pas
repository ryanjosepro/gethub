unit Repository;

interface

uses
  Vcl.Dialogs, System.Variants, System.Types, System.SysUtils, System.Classes;

type
  TRepository = class
  private
    FLink: string;
    FName: string;
    FPath: string;
    FMsg: string;
    FLastAct: string;
    procedure SetLink(const Value: string);
    procedure SetLastAct(const Value: string);
    procedure SetMsg(const Value: string);
    procedure SetName(const Value: string);
    procedure SetPath(const Value: string);

  public
    property Link: string read FLink write SetLink;
    property Path: string read FPath write SetPath;
    property Name: string read FName write SetName;
    property LastAct: string read FLastAct write SetLastAct;
    property Msg: string read FMsg write SetMsg;
  end;

implementation

{ TRepository }

procedure TRepository.SetLink(const Value: string);
begin
  FLink := Value;
end;

procedure TRepository.SetPath(const Value: string);
begin
  FPath := Value;
end;

procedure TRepository.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TRepository.SetLastAct(const Value: string);
begin
  FLastAct := Value;
end;

procedure TRepository.SetMsg(const Value: string);
begin
  FMsg := Value;
end;

end.
