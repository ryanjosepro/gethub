unit Git;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, Vcl.Dialogs,
  MyUtils;

type
  TGitAction = (gaClone, gaStatus, gaPull, gaAdd, gaCommit, gaRestore, gaPush, gaSwitch, gaDiff);

  TStringArray = array of string;

  TRepository = class
  private
    FLink: string;
    FName: string;
    FPath: string;
    FMsg: string;
    FLastAct: string;
    FDesc: string;
    FBranch: string;
    procedure SetLink(const Value: string);
    procedure SetLastAct(const Value: string);
    procedure SetMsg(const Value: string);
    procedure SetName(const Value: string);
    procedure SetPath(const Value: string);
    procedure SetDesc(const Value: string);
    procedure SetBranch(const Value: string);

  public
    property Link: string read FLink write SetLink;
    property Path: string read FPath write SetPath;
    property Name: string read FName write SetName;
    property Desc: string read FDesc write SetDesc;
    property LastAct: string read FLastAct write SetLastAct;
    property Msg: string read FMsg write SetMsg;
    property Branch: string read FBranch write SetBranch;
  end;

  TRepositoryArray = array of TRepository;

  TGitConfig = class
  private
    FGitBin: string;
    FCloseCmd: boolean;
    FCloseStatus: boolean;
    FCloseTime: integer;
    procedure SetGitBin(const Value: string);
    procedure SetCloseCmd(const Value: boolean);
    procedure SetCloseStatus(const Value: boolean);
    procedure SetCloseTime(const Value: integer);

  public
    property GitBin: string read FGitBin write SetGitBin;
    property CloseCmd: boolean read FCloseCmd write SetCloseCmd;
    property CloseStatus: boolean read FCloseStatus write SetCloseStatus;
    property CloseTime: integer read FCloseTime write SetCloseTime;

    constructor Create;
  end;

  TGitExecution = class
  private
    FRepository: TRepository;
    FAction: TGitAction;
    FFiles: TStringList;
    FConfig: TGitConfig;
    procedure SetRepository(const Value: TRepository);
    procedure SetAction(const Value: TGitAction);
    procedure SetFiles(const Value: TStringList);
    procedure SetConfig(const Value: TGitConfig);
  public
    property Repository: TRepository read FRepository write SetRepository;
    property Action: TGitAction read FAction write SetAction;
    property Files: TStringList read FFiles write SetFiles;
    property Config: TGitConfig read FConfig write SetConfig;

  end;

  TGit = class
  public
    class procedure GitExec(Execution: TGitExecution);
    class procedure SetLocalGitAccount(Repository: TRepository; Config: TGitConfig);
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

procedure TRepository.SetBranch(const Value: string);
begin
  FBranch := Value;
end;

procedure TRepository.SetDesc(const Value: string);
begin
  FDesc := Value;
end;

procedure TRepository.SetLastAct(const Value: string);
begin
  FLastAct := Value;
end;

procedure TRepository.SetMsg(const Value: string);
begin
  FMsg := Value;
end;

{ TGitConfig }

procedure TGitConfig.SetGitBin(const Value: string);
begin
  FGitBin := Value;
end;

procedure TGitConfig.SetCloseCmd(const Value: boolean);
begin
  FCloseCmd := Value;
end;

procedure TGitConfig.SetCloseStatus(const Value: boolean);
begin
  FCloseStatus := Value;
end;

procedure TGitConfig.SetCloseTime(const Value: integer);
begin
  FCloseTime := Value;
end;

constructor TGitConfig.Create;
begin
  self.GitBin := 'C:\Program Files\Git\Bin';
end;

{ TGitExecution }

procedure TGitExecution.SetRepository(const Value: TRepository);
begin
  FRepository := Value;
end;

procedure TGitExecution.SetAction(const Value: TGitAction);
begin
  FAction := Value;
end;

procedure TGitExecution.SetFiles(const Value: TStringList);
begin
  FFiles := Value;
end;

procedure TGitExecution.SetConfig(const Value: TGitConfig);
begin
  FConfig := Value;
end;

{ TGit }

class procedure TGit.GitExec(Execution: TGitExecution);
var
  StrMode, GitCommand, CmdTitle, EchoMessage, CloseCommand, Command: string;
begin
  with Execution do
  begin
    case Action of
      gaClone:
      begin
        StrMode := 'Clone';
        GitCommand := 'clone ' + Repository.Link + ' .\';
      end;

      gaStatus:
      begin
        StrMode := 'Status';
        GitCommand := 'status'
      end;

      gaPull:
      begin
        StrMode := 'Pull';
        GitCommand := 'pull';
      end;

      gaAdd:
      begin
        StrMode := 'Add';
        Files.Delimiter := ' ';
        GitCommand := 'add ' + Files.DelimitedText;
      end;

      gaCommit:
      begin
        StrMode := 'Commit';
        GitCommand := 'commit -m "' + Repository.Msg + '"';
      end;

      gaRestore:
      begin
        StrMode := 'Checkout';
        Files.Delimiter := ' ';
        GitCommand := 'restore ' + Files.DelimitedText;
      end;

      gaPush:
      begin
        StrMode := 'Push';
        GitCommand := 'push';
      end;

      gaSwitch:
      begin
        StrMode := 'Switch';
        GitCommand := 'switch ' + Repository.Branch;
      end;

      gaDiff:
      begin
        StrMode := 'Diff';
        GitCommand := 'diff'
      end;
    end;

    CmdTitle := StrMode + ' ' + Repository.Name;

    EchoMessage := StrMode + ' -> ' + Repository.Path;

    if Config.CloseCmd then
    begin
      if Action in [gaStatus] then
      begin
        if Config.CloseStatus then
        begin
          CloseCommand := 'timeout -t ' + IntToStr(Config.CloseTime);
        end
        else
        begin
          CloseCommand := 'pause';
        end;
      end
      else
      begin
        CloseCommand := 'timeout -t ' + IntToStr(Config.CloseTime);
      end;
    end
    else
    begin
      CloseCommand := 'pause';
    end;

    Command := '/K title ' + CmdTitle +
    ' && echo "' + EchoMessage + '"' +
    ' && cd "' + Config.GitBin + '"' +
    ' && git -C "' + Repository.Path + '" ' + GitCommand +
    ' && ' + CloseCommand +
    ' && exit';
  end;

  TUtils.ExecCmd(Command);
end;

class procedure TGit.SetLocalGitAccount(Repository: TRepository; Config: TGitConfig);
var
  GitCommand, Command: string;
begin
  GitCommand := 'git config --local user.name && git config --local user.email ';

  Command := '/C cd ' + Config.GitBin +
  ' && git -C "' + Repository.Path + '" ' + GitCommand;

  TUtils.ExecCmd(Command);
end;

end.
