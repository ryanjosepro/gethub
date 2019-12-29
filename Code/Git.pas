unit Git;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, Vcl.Dialogs,
  Config, MyUtils, MySets, DAO, Repository;

type
  TGit = class
  public
    class function GitBin: string;
    class procedure ConfigGit;
    class function CloseCmdConfig: string;
    class function CloseStatusConfig: string;

    class procedure Git(Repository: TRepository; Mode: TGitMode; CheckoutFile: string = '');
  end;

implementation

{ TGit }

class function TGit.GitBin: string;
begin
  Result := TConfig.GetConfig('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin');
end;

class procedure TGit.ConfigGit;
var
  Name, Email, Comand: string;
begin
  Name := TConfig.GetConfig('ACCOUNT', 'Name');
  Email := TConfig.GetConfig('ACCOUNT', 'Email');
  Comand := '/C cd "' + GitBin + '" && git config --global user.name ' + Name + ' && git config --global user.email ' + Email;
  TUtils.ExecCmd(Comand, 0);
end;

class function TGit.CloseCmdConfig: string;
begin
  Result := TUtils.Iif(TConfig.GetConfig('OPTIONS', 'CloseCmd') = '1', 'timeout -t ' + TConfig.GetConfig('OPTIONS', 'CloseTime'), 'pause');
end;

class function TGit.CloseStatusConfig: string;
begin
  if CloseCmdConfig = 'pause' then
  begin
    Result := 'pause';
  end
  else
  begin
    Result := TUTils.Iif(TConfig.GetConfig('OPTIONS', 'CloseStatus') = '1', 'timeout -t ' + TConfig.GetConfig('OPTIONS', 'CloseTime'), 'pause');
  end;
end;

class procedure TGit.Git(Repository: TRepository; Mode: TGitMode; CheckoutFile: string);
var
  StrMode, GitCommand, CmdTitle, EchoMessage, CloseCommand, Command: string;
begin
  case Mode of
    gmClone:
    begin
      StrMode := 'Clone';
      GitCommand := 'clone ' + Repository.Link + ' .\';
    end;

    gmStatus:
    begin
      StrMode := 'Status';
      GitCommand := 'status'
    end;

    gmPull:
    begin
      StrMode := 'Pull';
      GitCommand := 'pull';
    end;

    gmAdd:
    begin
      StrMode := 'Add';
      GitCommand := 'add .';
    end;

    gmCommit:
    begin
      StrMode := 'Commit';
      GitCommand := 'commit -m "' + Repository.Msg + '"';
    end;

    gmCheckout:
    begin
      StrMode := 'Checkout';
      GitCommand := 'checkout -- "' + CheckoutFile + '"';
    end;

    gmPush:
    begin
      StrMode := 'Push';
      GitCommand := 'push'
    end;
  end;

  CmdTitle := StrMode + ' ' + Repository.Name;

  EchoMessage := StrMode + ' -> ' + Repository.Path;

  CloseCommand := TUtils.Iif(Mode in [gmStatus], CloseStatusConfig, CloseCmdConfig);

  Command := '/K title ' + CmdTitle +
  ' && echo "' + EchoMessage + '"' +
  ' && cd "' + GitBin + '"' +
  ' && git -C "' + Repository.Path + '" ' + GitCommand +
  ' && ' + CloseCommand +
  ' && exit';

  TUtils.ExecCmd(Command);
end;

end.
