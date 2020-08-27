unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.DBGrids, Vcl.CheckLst, Vcl.ButtonGroup,
  Datasnap.DSHTTP, IOUtils, Vcl.Menus,
  ViewConfigs, ViewAddRepo, ViewEditRepo, ViewFiles, Config, MyDialogs, MyUtils, DAO, Git;

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
    ActRestore: TAction;
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
    BtnSwitch: TSpeedButton;
    BtnDiff: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ActGitBash: TAction;
    GitBash1: TMenuItem;
    ActSwitch: TAction;
    ActDiff: TAction;
    BtnGitBash: TSpeedButton;
    procedure ActConfigsExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActCommitExecute(Sender: TObject);
    procedure ActRestoreExecute(Sender: TObject);
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
    procedure ActGitBashExecute(Sender: TObject);
    procedure ActSwitchExecute(Sender: TObject);
    procedure ActDiffExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  Source.DataSet := TDAO.Table;
  TConfig.SetGlobalGitAccount;
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
  ActRestore.Enabled := true;
  ActPush.Enabled := true;
  ActSwitch.Enabled := true;
  ActDiff.Enabled := true;
  Source.DataSet := nil;
end;

procedure TWindowMain.FormCreate(Sender: TObject);
begin

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
  case Key of
  38:
    if TDAO.GetIndex = 1 then
    begin
      TDAO.Table.Last;
      Key := Word(#0);
    end;
  40:
    if TDAO.GetIndex = TDAO.Count then
    begin
      TDAO.Table.First;
      Key := Word(#0);
    end;
  46:
    if (Shift = [ssCtrl]) then
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

//GIT COMMANDS

procedure TWindowMain.ActCloneExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaClone;
  GitExecution.Config := TConfig.GetGitConfig;

  for I := 0 to Length(Repositories) - 1 do
  begin
    with Repositories[I] do
    begin
      GitExecution.Repository := Repositories[I];

      if (not TDirectory.Exists(Path)) or (TDirectory.IsEmpty(Path)) then
      begin
        TDirectory.CreateDirectory(Path);

        TGit.GitExec(GitExecution);
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

            TGit.GitExec(GitExecution);
          end;
        end;
      end;

    end;

    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAction', 'Clone');
end;

procedure TWindowMain.ActStatusExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaStatus;
  GitExecution.Config := TConfig.GetGitConfig;

  for I := 0 to Length(Repositories) - 1 do
  begin
    GitExecution.Repository := Repositories[I];

    TGit.GitExec(GitExecution);

    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAction', 'Status');
end;

procedure TWindowMain.ActPullExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaPull;
  GitExecution.Config := TConfig.GetGitConfig;

  for I := 0 to Length(Repositories) - 1 do
  begin
    GitExecution.Repository := Repositories[I];

    TGit.GitExec(GitExecution);

    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAction', 'Pull');
end;

procedure TWindowMain.ActAddExecute(Sender: TObject);
var
  I, DialogAnswer: integer;
  Repositories: TRepositoryArray;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaAdd;
  GitExecution.Config := TConfig.GetGitConfig;

  DialogAnswer := mrYes;

  if Length(Repositories) = 1 then
  begin
    DialogAnswer := TDialogs.CustomDialog('Arquivos', mtConfirmation, [mbYes, mbNo], ['Todos', 'Específicos'], 'Git Add');
  end;

  if DialogAnswer = mrYes then
  begin
    GitExecution.Files := TStringList.Create;

    GitExecution.Files.Add('.');

    for I := 0 to Length(Repositories) - 1 do
    begin
      GitExecution.Repository := Repositories[I];

      TGit.GitExec(GitExecution);

      if I <> Length(Repositories) - 1 then
      begin
        SleepExec;
      end;
    end;
  end
  else if DialogAnswer = mrNo then
  begin
    GitExecution.Files := WindowFiles.ShowModal('Restore - ' + Repositories[0].Name, Repositories[0]);

    if GitExecution.Files.Count > 0 then
    begin
      GitExecution.Repository := Repositories[0];

      TGit.GitExec(GitExecution);
    end;
  end;

  TDAO.SetCheckeds('LastAction', 'Add');
end;

procedure TWindowMain.ActCommitExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  Erro: boolean;
  MsgErro: string;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  Erro := false;
  MsgErro := 'Digite uma mensagem de commit para:' + #13#10;

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
    GitExecution := TGitExecution.Create;
    GitExecution.Action := gaCommit;
    GitExecution.Config := TConfig.GetGitConfig;

    for I := 0 to Length(Repositories) - 1 do
    begin
      with Repositories[I] do
      begin
        GitExecution.Repository := Repositories[I];

        TGit.GitExec(GitExecution);

        if I <> Length(Repositories) - 1 then
        begin
          SleepExec;
        end;
      end;
    end;

    TDAO.SetCheckeds('LastAction', 'Commit');
  end;
end;

procedure TWindowMain.ActRestoreExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  DialogAnswer: integer;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaRestore;
  GitExecution.Config := TConfig.GetGitConfig;

  DialogAnswer := mrYes;

  if Length(Repositories) = 1 then
  begin
    DialogAnswer := TDialogs.CustomDialog('Arquivos', mtConfirmation, [mbYes, mbNo], ['Todos', 'Específicos'], 'Git Restore');
  end;

  if DialogAnswer = mrYes then
  begin
    GitExecution.Files := TStringList.Create;
    GitExecution.Files.Add('.');

    for I := 0 to Length(Repositories) - 1 do
    begin
      GitExecution.Repository := Repositories[I];

      TGit.GitExec(GitExecution);

      TDAO.SetCheckeds('LastAction', 'Checkout');


    end;
  end
  else if DialogAnswer = mrNo then
  begin
    GitExecution.Files := WindowFiles.ShowModal('Restore - ' + Repositories[0].Name, Repositories[0]);

    if GitExecution.Files.Count > 0 then
    begin
      GitExecution.Repository := Repositories[0];

      TGit.GitExec(GitExecution);
    end;
  end;
end;

procedure TWindowMain.ActPushExecute(Sender: TObject);
var
  I: integer;
  GitExecution: TGitExecution;
  Repositories: TRepositoryArray;
  Branch: string;
  DialogAnswer: boolean;
begin
  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaPush;
  GitExecution.Config := TConfig.GetGitConfig;

  Repositories := TDAO.GetCheckedRepositories;

  DialogAnswer := true;

  if Length(Repositories) = 1 then
  begin
    Branch := 'master';

    DialogAnswer := InputQuery('Upstream', 'Branch', Branch);
  end;

  if DialogAnswer then
  begin
    Repositories[0].Branch := Branch;

    for I := 0 to Length(Repositories) - 1 do
    begin
      GitExecution.Repository := Repositories[I];

      TGit.GitExec(GitExecution);

      if I <> Length(Repositories) - 1 then
      begin
        SleepExec;
      end;
    end;

    TDAO.SetCheckeds('LastAction', 'Push');
  end;
end;

procedure TWindowMain.ActSwitchExecute(Sender: TObject);
var
  Repository: TRepository;
  GitExecution: TGitExecution;
  Branch: string;
begin
  Repository := TDAO.GetCheckedRepositories[0];

  if InputQuery('Para qual branch você deseja mudar?', 'Branch:', Branch) then
  begin
    Repository.Branch := Branch;

    if Repository.Branch <> '' then
    begin
      GitExecution := TGitExecution.Create;
      GitExecution.Repository := Repository;
      GitExecution.Action := gaSwitch;
      GitExecution.Config := TConfig.GetGitConfig;

      TGit.GitExec(GitExecution);

      TDAO.SetCheckeds('LastAction', 'Switch');
    end;
  end;
end;

procedure TWindowMain.ActDiffExecute(Sender: TObject);
var
  I: integer;
  Repositories: TRepositoryArray;
  GitExecution: TGitExecution;
begin
  Repositories := TDAO.GetCheckedRepositories;

  GitExecution := TGitExecution.Create;
  GitExecution.Action := gaDiff;
  GitExecution.Config := TConfig.GetGitConfig;

  for I := 0 to Length(Repositories) - 1 do
  begin
    GitExecution.Repository := Repositories[I];

    TGit.GitExec(GitExecution);

    if I <> Length(Repositories) - 1 then
    begin
      SleepExec;
    end;
  end;

  TDAO.SetCheckeds('LastAction', 'Diff');
end;

//OTHERS

procedure TWindowMain.CheckAllClick(Sender: TObject);
begin
  TDAO.SelectAll(CheckAll.Checked);
  UpdateButtons;
end;

procedure TWindowMain.ActEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowMain.UpdateButtons;
var
  AnySelected: boolean;
begin
  if TDAO.Count > 0 then
  begin
    CheckAll.Enabled := true;
    CheckSelect.Enabled := true;
    GridRepositories.Enabled := true;
    ActOpenDir.Enabled := true;
    ActEdit.Enabled := true;
    ActDel.Enabled := true;
    ActGitBash.Enabled := true;
    ActDetails.Enabled := true;
    ActExport.Enabled := true;
  end;

  AnySelected := (TDAO.Count > 0) and (TDAO.CountChecked >= 1);

  ActClone.Enabled := AnySelected;
  ActStatus.Enabled := AnySelected;
  ActPull.Enabled := AnySelected;
  ActAdd.Enabled := AnySelected;
  ActCommit.Enabled := AnySelected;
  ActRestore.Enabled := AnySelected;
  ActPush.Enabled := AnySelected;
  ActDiff.Enabled := AnySelected;

  ActSwitch.Enabled := TDAO.CountChecked = 1;

  if (TDAO.Count > 0) and (TDAO.CountChecked = 1) then
  begin
    ActAdd.Caption := 'Add (F7)*';
    ActRestore.Caption := 'Restore*';
    ActPush.Caption := 'Push(F9)*';
    //ActDiff.Caption := 'Diff*';
  end
  else
  begin
    ActAdd.Caption := 'Add (F7)';
    ActRestore.Caption := 'Restore';
    ActPush.Caption := 'Push(F9)';
    //ActDiff.Caption := 'Diff';
  end;
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

procedure TWindowMain.ActGitBashExecute(Sender: TObject);
var
  Comando: string;
begin
  Comando := '/K cd "' + TDAO.GetField('Path') + '" && "' + TConfig.GetConfig('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin') + '\bash"';
  TUtils.ExecCmd(Comando);
end;

end.
