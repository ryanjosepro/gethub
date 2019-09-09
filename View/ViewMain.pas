unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.DBGrids,
  ViewAccount, ViewAddRepo, ViewEditRepo, MyUtils, DAO, Datas;

type
  TWindowMain = class(TForm)
    Actions: TActionList;
    Images: TImageList;
    ActAddRepository: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActCommit: TAction;
    ActPush: TAction;
    ActAdd: TAction;
    ActConfigAccount: TAction;
    ActCheckout: TAction;
    LblLogo: TLabel;
    BtnConfigAccount: TSpeedButton;
    BtnEdit: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnAddRepository: TSpeedButton;
    BtnAdd: TSpeedButton;
    BtnCommit: TSpeedButton;
    BtnCheckout: TSpeedButton;
    BtnPush: TSpeedButton;
    OpenFile: TFileOpenDialog;
    BarStatus: TProgressBar;
    CheckSelect: TDBCheckBox;
    Source: TDataSource;
    GridRepositories: TDBGrid;
    ActEsc: TAction;
    procedure ActConfigAccountExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActCommitExecute(Sender: TObject);
    procedure ActCheckoutExecute(Sender: TObject);
    procedure ActPushExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridRepositoriesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridRepositoriesColExit(Sender: TObject);
    procedure GridRepositoriesKeyPress(Sender: TObject; var Key: Char);
    procedure ActAddRepositoryExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
  end;

var
  WindowMain: TWindowMain;

implementation

{$R *.dfm}

procedure TWindowMain.FormActivate(Sender: TObject);
begin
  Source.DataSet := TDAO.Table;
  //TDAO.Load;
  TDAO.Insert('https://github.com/buckcell/ProjectBooklin', 'C:\Users\Ryan\Documents\Delphi Projects\ProjectBooklin', 'ProjectBooklin');
  TDAO.Insert('https://github.com/buckcell/ProjectGethub', 'C:\Users\Ryan\Documents\Delphi Projects\ProjectGethub', 'ProjectGethub');
  TDAO.Insert('https://github.com/buckcell/ProjectMigrator', 'C:\Users\Ryan\Documents\Delphi Projects\ProjectMigrator', 'ProjectMigrator');
  TDAO.Insert('https://github.com/buckcell/ProjectReport', 'C:\Users\Ryan\Documents\Delphi Projects\ProjectReport', 'ProjectReport');
end;

//GRID DRAWN

procedure TWindowMain.GridRepositoriesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked : array[Boolean] of Integer =(DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    CheckSelect.Visible := true;
    CheckSelect.Left := 13 + GridRepositories.Left + 2;
    CheckSelect.Top := Rect.Top + GridRepositories.top + 2;
    CheckSelect.Width := 15;
    CheckSelect.Height := Rect.Bottom - Rect.Top;
    if Column.Field.FieldName = CheckSelect.Field.FieldName then
    begin
      //TDAO.SetField(' ', not CheckSelect.Field.Value);
    end;
  end
  else
  begin
    if (Column.Field.FieldName = CheckSelect.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);
      DrawState := ISChecked[Column.Field.AsBoolean];
      GridRepositories.Canvas.FillRect(Rect);
      DrawFrameControl(GridRepositories.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TWindowMain.GridRepositoriesColExit(Sender: TObject);
begin
  if GridRepositories.SelectedField.FieldName = CheckSelect.DataField then
  begin
    CheckSelect.Visible := False;
  end;
end;

procedure TWindowMain.GridRepositoriesKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = Chr(9)) then
  begin
    Exit;
  end;
  if (GridRepositories.SelectedField.FieldName = CheckSelect.DataField) then
  begin
    CheckSelect.SetFocus;
    SendMessage(CheckSelect.Handle, WM_Char, word(Key), 0);
  end;
end;

//GRID DRAWN

procedure TWindowMain.ActAddRepositoryExecute(Sender: TObject);
begin
  WindowAddRepo.ShowModal;
end;

procedure TWindowMain.ActConfigAccountExecute(Sender: TObject);
begin
  WindowAccount.ShowModal;
end;

procedure TWindowMain.ActEditExecute(Sender: TObject);
begin
  WindowEditRepo.ShowModal;
end;

procedure TWindowMain.ActDelExecute(Sender: TObject);
begin
  //
end;

procedure TWindowMain.ActAddExecute(Sender: TObject);
begin
  //
end;

procedure TWindowMain.ActCommitExecute(Sender: TObject);
begin
  //
end;

procedure TWindowMain.ActCheckoutExecute(Sender: TObject);
begin
  //
end;

procedure TWindowMain.ActPushExecute(Sender: TObject);
begin
  //
end;

procedure TWindowMain.ActEscExecute(Sender: TObject);
begin
  Close;
end;

end.
