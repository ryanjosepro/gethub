unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.DBGrids, Vcl.CheckLst, Vcl.ButtonGroup,
  ViewConfigs, ViewAddRepo, ViewEditRepo, ViewCheckout, Config, MyUtils, MyDialogs, Git, DAO, Datas,
  Datasnap.DSHTTP, IOUtils, Vcl.Menus,
  MySets, MyArrays, Repository;

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
    ActConfigs: TAction;
    ActCheckout: TAction;
    LblLogo: TLabel;
    BtnConfigs: TSpeedButton;
    BtnEdit: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnAddRepository: TSpeedButton;
    BtnAdd: TSpeedButton;
    BtnCommit: TSpeedButton;
    BtnCheckout: TSpeedButton;
    BtnPush: TSpeedButton;
    OpenFile: TFileOpenDialog;
    CheckSelect: TDBCheckBox;
    Source: TDataSource;
    GridRepositories: TDBGrid;
    ActEsc: TAction;
    BtnPull: TSpeedButton;
    ActPull: TAction;
    CheckAll: TCheckBox;
    ActStatus: TAction;
    BtnStatus: TSpeedButton;
    ActClone: TAction;
    BtnClone: TSpeedButton;
    ActImport: TAction;
    ActExport: TAction;
    BtnImport: TSpeedButton;
    Btn: TSpeedButton;
    SaveFile: TFileSaveDialog;
    LblTotRepos: TLabel;
    TxtTotRepos: TLabel;
    ActCheckAll: TAction;
    MenuRepos: TPopupMenu;
    ItemRepoDir: TMenuItem;
    ActOpenDir: TAction;
    ItemEdit: TMenuItem;
    ItemDel: TMenuItem;
    BtnDetails: TSpeedButton;
    ActDetails: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure ActConfigsExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActCommitExecute(Sender: TObject);
    procedure ActCheckoutExecute(Sender: TObject);
    procedure ActPushExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridRepositoriesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridRepositoriesKeyPress(Sender: TObject; var Key: Char);
    procedure ActAddRepositoryExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
    procedure GridRepositoriesMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure CheckSelectClick(Sender: TObject);
    procedure ActPullExecute(Sender: TObject);
    procedure CheckAllClick(Sender: TObject);
    procedure ActStatusExecute(Sender: TObject);
    procedure GridRepositoriesCellClick(Column: TColumn);
    procedure ActCloneExecute(Sender: TObject);
    procedure ActExportExecute(Sender: TObject);
    procedure ActImportExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActCheckAllExecute(Sender: TObject);
    procedure ActOpenDirExecute(Sender: TObject);
    procedure GridRepositoriesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActDetailsExecute(Sender: TObject);
  private
    procedure UpdateButtons;
    procedure UpdateTotRepos;
    procedure SleepExec;
  end;

var
  WindowMain: TWindowMain;
  CellClicked: boolean = false;

implementation

{$R *.dfm}

procedure TWindowMain.FormActivate(Sender: TObject);
begin
  GridRepositories.SetFocus;
  TDAO.Load;
  TGit.ConfigGit;
  UpdateButtons;
  UpdateTotRepos;
end;

procedure TWindowMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GridRepositories.Enabled := true;
  CheckAll.Enabled := true;
  CheckSelect.Enabled := true;
  ActClone.Enabled := true;
  ActStatus.Enabled := true;
  ActPull.Enabled := true;
  ActAdd.Enabled := true;
  ActCommit.Enabled := true;
  ActCheckout.Enabled := true;
  ActPush.Enabled := true;
  Source.DataSet := nil;
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

procedure TWindowMain.GridRepositoriesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = 40) then
  begin
    if TDAO.GetIndex = TDAO.Count then
    begin
      TDAO.Table.First;
      Key := Word(#0);
    end;
  end;

  if (Shift = [ssCtrl]) and (Key = 46) then
  begin
    Key := 0;
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

procedure TWindowMain.GridRepositoriesMouseWheel(Sender: TObject;Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  //
end;

procedure TWindowMain.GridRepositoriesCellClick(Column: TColumn);
begin
  if Column.FieldName = CheckSelect.Field.FieldName then
  begin
    CellClicked := true;
    TDAO.SetField('Checked', not CheckSelect.Checked);
  end;
end;

procedure TWindowMain.CheckSelectClick(Sender: TObject);
begin
  if Active then
  begin
    if not CellClicked then
    begin
      GridRepositories.SetFocus;
      TDAO.SetField('Checked', CheckSelect.Checked);
    end;
    CellClicked := false;
    UpdateButtons;
  end;
  TDAO.Table.Edit;
end;

procedure TWindowMain.ActCheckAllExecute(Sender: TObject);
begin
  CheckAll.Checked := not CheckAll.Checked;
end;

//REPOSITORIES MANAGEMENT

procedure TWindowMain.ActConfigsExecute(Sender: TObject);
begin
  WindowConfigs.ShowModal;
end;

procedure TWindowMain.ActAddRepositoryExecute(Sender: TObject);
begin
  WindowAddRepo.ShowModal;
  TDAO.Table.Refresh;
  UpdateButtons;
  UpdateTotRepos;
end;

procedure TWindowMain.ActEditExecute(Sender: TObject);
begin
  WindowEditRepo.ShowModal;
end;

procedure TWindowMain.ActDelExecute(Sender: TObject);
begin
  if TDialogs.YesNo('Tem certeza que deseja deletar este repositório?', mbYes) = mrYes then
  begin
    TDAO.Delete;
    UpdateButtons;
    UpdateTotRepos;
  end;
end;

procedure TWindowMain.ActDetailsExecute(Sender: TObject);
var
  Arq: TextFile;
  TextTemp, TextOut: String;
begin
  AssignFile(Arq, TDAO.GetField('Path') + '\README.md');

  Reset(Arq);

  while not Eof(Arq) do
  begin
    ReadLn(Arq, TextTemp);
    TextOut := TextOut + TextTemp + #13#10;
  end;

  ShowMessage(TextOut);
end;

procedure TWindowMain.ActImportExecute(Sender: TObject);
begin
  if OpenFile.Execute then
  begin
    TDAO.Load(OpenFile.FileName);
    TDAO.Save;
    ShowMessage('Importado com sucesso!');
    UpdateButtons;
    UpdateTotRepos;
  end;
end;

procedure TWindowMain.ActExportExecute(Sender: TObject);
begin
  if SaveFile.Execute then
  begin
    TDAO.Save(SaveFile.FileName);
    ShowMessage('Exportado com sucesso!');
  end;
end;

//GITHUB COMMANDS

procedure TWindowMain.ActCloneExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
begin
  Repositories := TDAO.GetCheckedRepositories;

  for I := 0 to Length(Repositories) - 1 do
  begin
    with Repositories[I] do
    begin
      if (not TDirectory.Exists(Path)) or (TDirectory.IsEmpty(Path)) then
      begin
        if not TDirectory.Exists(Path) then
        begin
          TDirectory.CreateDirectory(Path);
        end;

        TGit.Git(Repositories[I], gmClone);
        if I <> Length(Repositories) - 1 then
        begin
          SleepExec;
        end;
      end
      else
      begin
        if TDialogs.YesNo('O diretório "' + Path + '" já existe, deseja sobrescrevê-lo?') = mrYes then
        begin
          TDirectory.Delete(Path, true);

          Sleep(1000);

          if DirectoryExists(Path) then
          begin
            ShowMessage('Não foi possível sobreescrever o diretório "' + Path + '"');
          end
          else
          begin
            TDirectory.CreateDirectory(Path);

            TGit.Git(Repositories[I], gmClone);

            if I <> Length(Repositories) - 1 then
            begin
              SleepExec;
            end;
          end;
        end;
      end;
    end;
  end;

  TDAO.SetCheckeds('LastAct', 'Clone');
end;

procedure TWindowMain.ActStatusExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
begin
  Repositories := TDAO.GetCheckedRepositories;

  for I := 0 to Length(Repositories) - 1 do
  begin
    TGit.Git(Repositories[I], gmStatus);
    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAct', 'Status');
end;

procedure TWindowMain.ActPullExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
begin
  Repositories := TDAO.GetCheckedRepositories;

  for I := 0 to Length(Repositories) - 1 do
  begin
    TGit.Git(Repositories[I], gmPull);
    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAct', 'Pull');
end;

procedure TWindowMain.ActAddExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  DialogAnswer: integer;
begin
  Repositories := TDAO.GetCheckedRepositories;

  if Length(Repositories) = 1 then
  begin
    DialogAnswer := TDialogs.CustomDialog('Arquivos', mtConfirmation, [mbYes, mbNo], ['Todos', 'Específicos'], 'Git Add');
  end;

  if DialogAnswer = mrYes then
  begin
    for I := 0 to Length(Repositories) - 1 do
    begin
      TGit.Git(Repositories[I], gmAdd);
      if I <> Length(Repositories) - 1 then
      begin
        SleepExec;
      end;
    end;
  end
  else if DialogAnswer = mrNo then
  begin

  end;

  TDAO.SetCheckeds('LastAct', 'Add');
end;

procedure TWindowMain.ActCommitExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  Erro: boolean;
  MsgErro: string;
begin
  Repositories := TDAO.GetCheckedRepositories;

  Erro := false;
  MsgErro := 'Digite uma mensagem de commit para' + #13#10;

  for I := 0 to Length(Repositories) - 1 do
  begin
    with Repositories[I] do
    begin
      if Trim(Msg) = '' then
      begin
        Erro := true;
        MsgErro := MsgErro + ' -' + Name + #13#10;
      end;
    end;
  end;

  if Erro then
  begin
    ShowMessage(MsgErro);
  end
  else
  begin
    for I := 0 to Length(Repositories) - 1 do
    begin
      with Repositories[I] do
      begin
        TGit.Git(Repositories[I], gmCommit);

        if I <> Length(Repositories) - 1 then
        begin
          SleepExec;
        end;
      end;
    end;

    TDAO.SetCheckeds('LastAct', 'Commit');
  end;
end;

procedure TWindowMain.ActCheckoutExecute(Sender: TObject);
var
  Repositories: TRepositoryArray;
  Repository: TRepository;
  Files: TStringList;
  FileName: string;
begin
  try
    Repositories := TDAO.GetCheckedRepositories;

    if Length(Repositories) = 1 then
    begin
      Repository := Repositories[0];

      Files := WindowCheckout.ShowModal(Repository);

      if Files.Count > 0 then
      begin
        for FileName in Files do
        begin
          TGit.Git(Repository, gmCheckout, FileName);
        end;
      end;

      TDAO.SetCheckeds('LastAct', 'Checkout');
    end;
  finally
    FreeAndNil(Files);
  end;
end;

procedure TWindowMain.ActPushExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
begin
  Repositories := TDAO.GetCheckedRepositories;

  for I := 0 to Length(Repositories) - 1 do
  begin
    TGit.Git(Repositories[I], gmPush);
    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAct', 'Push');
end;

//OTHERS

procedure TWindowMain.CheckAllClick(Sender: TObject);
begin
  TDAO.SelectAll(CheckAll.Checked);
end;

procedure TWindowMain.ActEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowMain.UpdateButtons;
var
  Value: boolean;
begin
  if TDAO.Count > 0 then
  begin
    CheckAll.Enabled := true;
    CheckSelect.Enabled := true;
    GridRepositories.Enabled := true;
    ActOpenDir.Enabled := true;
    ActEdit.Enabled := true;
    ActDel.Enabled := true;
    ActDetails.Enabled := true;
    ActExport.Enabled := true;
  end;

  Value := (TDAO.Count > 0) and (TDAO.GetCheckeds('Checked').Count >= 1);

  ActClone.Enabled := Value;
  ActStatus.Enabled := Value;
  ActPull.Enabled := Value;
  ActAdd.Enabled := Value;
  ActCommit.Enabled := Value;
  ActCheckout.Enabled := TDAO.GetCheckeds('Checked').Count = 1;
  ActPush.Enabled := Value;
end;

procedure TWindowMain.UpdateTotRepos;
begin
  TxtTotRepos.Caption := TDAO.Count.ToString;
end;

procedure TWindowMain.SleepExec;
begin
  Sleep(StrToInt(TConfig.GetConfig('OPTIONS', 'ExecTime', '0')));
end;

//POPUP MENU

procedure TWindowMain.ActOpenDirExecute(Sender: TObject);
begin
  TUtils.OpenOnExplorer(TDAO.GetField('Path'));
end;

end.
