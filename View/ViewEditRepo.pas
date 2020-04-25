unit ViewEditRepo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList,
  MyDialogs, DAO, Git;

type
  TWindowEditRepo = class(TForm)
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
    ActSave: TAction;
    ActDiscard: TAction;
    ActEsc: TAction;
    OpenFile: TFileOpenDialog;
    TxtDescription: TEdit;
    LblDescription: TLabel;
    procedure ActDBFileExecute(Sender: TObject);
    procedure ActDiscardExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
    procedure ActDBFileHint(var HintStr: string; var CanShow: Boolean);
    procedure TxtChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure Changed;
    procedure Done;
  end;

var
  WindowEditRepo: TWindowEditRepo;
  DidChange: boolean;

implementation

{$R *.dfm}

procedure TWindowEditRepo.FormActivate(Sender: TObject);
begin
  TxtLink.Text := TDAO.GetField('Link');
  TxtPath.Text := TDAO.GetField('Path');
  TxtName.Text := TDAO.GetField('Name');
  TxtDescription.Text := TDAO.GetField('Description');
  Done;
end;

procedure TWindowEditRepo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DidChange then
  begin
    case TDialogs.YesNoCancel('Deseja salvar as alterações?') of
    mrYes:
      ActSave.Execute;
    mrCancel:
      Action := caNone;
    end;
  end
  else
  begin
    Close;
  end;
end;

procedure TWindowEditRepo.ActDBFileExecute(Sender: TObject);
begin
  if OpenFile.Execute then
  begin
    TxtPath.Text := OpenFile.FileName;
  end;
end;

procedure TWindowEditRepo.ActDBFileHint(var HintStr: string; var CanShow: Boolean);
begin
  if OpenFile.FileName <> '' then
  begin
    HintStr := OpenFile.FileName;
  end;
end;

procedure TWindowEditRepo.ActDiscardExecute(Sender: TObject);
begin
  if DidChange then
  begin
    if TDialogs.YesNo('Tem certeza que deseja descartar as alterações?', mbNo) = mrYes then
    begin
      Done;
      Close;
    end;
  end
  else
  begin
    Close;
  end;
end;

procedure TWindowEditRepo.ActSaveExecute(Sender: TObject);
var
  MsgErro: string;
  Repository: TRepository;
begin
  if TDAO.ValueExists('Link', TxtLink.Text, false) then
  begin
    MsgErro := MsgErro + 'Valor no campo "Link do Repositório" já existente!' + #13#10;
  end;
  if TDAO.ValueExists('Path', TxtPath.Text, false) then
  begin
    MsgErro := MsgErro + 'Valor no campo "Caminho do Repositório" já existente!' + #13#10;
  end;
  if TDAO.ValueExists('Name', TxtName.Text, false) then
  begin
    MsgErro := MsgErro + 'Valor no campo "Nome do Repositório" já existente!' + #13#10;
  end;

  if MsgErro = '' then
  begin
    Repository := TRepository.Create;
    Repository.Link := TxtLink.Text;
    Repository.Path := TxtPath.Text;
    Repository.Name := TxtName.Text;
    Repository.Desc := TxtDescription.Text;

    TDAO.Edit(Repository);
    Done;
    Close;
  end
  else
  begin
    ShowMessage(MsgErro);
  end;
end;

procedure TWindowEditRepo.ActEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowEditRepo.TxtChange(Sender: TObject);
var
  Link, Path, Name: boolean;
begin
  Changed;
end;

procedure TWindowEditRepo.Changed;
begin
  DidChange := true;
  ActSave.Enabled := true;
end;

procedure TWindowEditRepo.Done;
begin
  DidChange := false;
  ActSave.Enabled := false;
end;

end.
