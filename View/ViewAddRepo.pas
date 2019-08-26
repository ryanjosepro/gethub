unit ViewAddRepo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList;

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
    ActDiscard: TAction;
    ActEsc: TAction;
    OpenFile: TFileOpenDialog;
    procedure ActDBFileExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActDiscardExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WindowAddRepo: TWindowAddRepo;

implementation

{$R *.dfm}

procedure TWindowAddRepo.ActDBFileExecute(Sender: TObject);
begin
  if OpenFile.Execute then
  begin
    TxtPath.Text := OpenFile.FileName;
  end;
end;

procedure TWindowAddRepo.ActAddExecute(Sender: TObject);
begin
  //
end;

procedure TWindowAddRepo.ActDiscardExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowAddRepo.ActEscExecute(Sender: TObject);
begin
  Close;
end;

end.
