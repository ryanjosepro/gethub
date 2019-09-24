unit ViewAddRepo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList,
  DAO;

type
  TWindowAddRepo = class(TForm)
    LblName: TLabel;
    LblPath: TLabel;
    LblLink: TLabel;
    TxtLink: TEdit;
    TxtPath: TEdit;
    TxtName: TEdit;
    BtnSave: TSpeedButton;
    BtnDiscard: TSpeedButton;
    BtnDBFile: TSpeedButton;
    Images: TImageList;
    Actions: TActionList;
    ActDBFile: TAction;
    ActAdd: TAction;
    ActCancel: TAction;
    ActEsc: TAction;
    OpenFile: TFileOpenDialog;
    procedure ActDBFileExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
    procedure ActDBFileHint(var HintStr: string; var CanShow: Boolean);
    procedure TxtChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  public
    procedure Changed;
    procedure Done;
  end;

var
  WindowAddRepo: TWindowAddRepo;
  DidChange: boolean;

implementation

{$R *.dfm}

procedure TWindowAddRepo.FormActivate(Sender: TObject);
begin
  TxtLink.Clear;
  TxtPath.Clear;
  TxtName.Clear;
  TxtLink.SetFocus;
  Done;
end;

procedure TWindowAddRepo.ActDBFileExecute(Sender: TObject);
begin
  if OpenFile.Execute then
  begin
    TxtPath.Text := OpenFile.FileName;
  end;
end;

procedure TWindowAddRepo.ActDBFileHint(var HintStr: string; var CanShow: Boolean);
begin
  if OpenFile.FileName <> '' then
  begin
    HintStr := OpenFile.FileName;
  end;
end;

procedure TWindowAddRepo.ActAddExecute(Sender: TObject);
var
  LinkExists, PathExists, NameExists: boolean;
  MsgErro: string;
begin
  if TDAO.ValueExists('Link', TxtLink.Text) then
  begin
    MsgErro := MsgErro + 'Valor no campo "Link do Repositório" já existente!' + #13#10;
  end;
  if TDAO.ValueExists('Path', TxtPath.Text) then
  begin
    MsgErro := MsgErro + 'Valor no campo "Caminho do Repositório" já existente!' + #13#10;
  end;
  if TDAO.ValueExists('Name', TxtName.Text) then
  begin
    MsgErro := MsgErro + 'Valor no campo "Nome do Repositório" já existente!' + #13#10;
  end;

  if MsgErro = '' then
  begin
    TDAO.Insert(TxtLink.Text, TxtPath.Text, TxtName.Text);
    Close;
  end
  else
  begin
    ShowMessage(MsgErro);
  end;
end;

procedure TWindowAddRepo.ActCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowAddRepo.ActEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowAddRepo.TxtChange(Sender: TObject);
var
  Link, Path, Name: boolean;
begin
  Link := Trim(TxtLink.Text) <> '';
  Path := Trim(TxtPath.Text) <> '';
  Name := Trim(TxtName.Text) <> '';
  ActAdd.Enabled := Link and Path and Name;
end;

procedure TWindowAddRepo.Changed;
begin
  DidChange := true;
  ActAdd.Enabled := true;
end;

procedure TWindowAddRepo.Done;
begin
  DidChange := false;
  ActAdd.Enabled := false;
end;

end.
