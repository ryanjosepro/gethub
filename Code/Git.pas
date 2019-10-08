unit Git;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, ShellAPI, Vcl.Dialogs,
  Config, MyUtils, DAO;

type
  TGit = class
  public
    class function GitBin: string;
    class function ConfigCloseCmd: string;
    class function ConfigCloseStatus: string;
    class procedure ConfigGit;
    class procedure Clone(Link, Path: string);
    class procedure Status(Path: string);
    class procedure Pull(Path: string);
    class procedure Add(Path: string);
    class procedure Commit(Path, Msg: string);
    class procedure Checkout(Path: string);
    class procedure Push(Path: string);
  end;

implementation

{ TGit }

class function TGit.GitBin: string;
begin
  Result := TConfig.GetConfig('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin');
end;

class function TGit.ConfigCloseCmd: string;
begin
  Result := TUtils.Iif(TConfig.GetConfig('OPTIONS', 'CloseCmd') = '1', 'timeout -t 5', 'pause');
end;

class function TGit.ConfigCloseStatus: string;
begin
  if ConfigCloseCmd = 'pause' then
  begin
    Result := 'pause';
  end
  else
  begin
    Result := TUTils.Iif(TConfig.GetConfig('OPTIONS', 'CloseStatus') = '1', 'timeout -t 5', 'pause');
  end;
end;

class procedure TGit.ConfigGit;
var
  Name, Email, Comand: string;
begin
  Name := TConfig.GetConfig('ACCOUNT', 'Name');
  Email := TConfig.GetConfig('ACCOUNT', 'Email');
  Comand := '/C cd "' + GitBin + '" && git config --global user.name ' + Name + ' && git config --global user.email ' + Email;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 0);
end;

class procedure TGit.Clone(Link, Path: string);
var
  Comand: string;
begin
  Comand := '/C echo "Clone -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" clone ' + Link + ' .\ && ' + ConfigCloseCmd;
  ShowMessage(Comand);
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

class procedure TGit.Status(Path: string);
var
  Comand: string;
begin
  Comand := '/C echo "Status -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" status && ' + ConfigCloseStatus;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

class procedure TGit.Pull(Path: string);
var
  Comand: string;
begin
  Comand := '/C echo "Pull -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" pull && ' + ConfigCloseCmd;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

class procedure TGit.Add(Path: string);
var
  Comand: string;
begin
  Comand := '/C echo "Add -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" add . && ' + ConfigCloseCmd;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

class procedure TGit.Commit(Path, Msg: string);
var
  Comand: string;
begin
  Comand := '/C echo "Commit -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" commit -m "' + Msg + '" && ' + ConfigCloseCmd;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

class procedure TGit.Checkout(Path: string);
var
  Comand: string;
begin
  Comand := '/C echo "Checkout -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" checkout && ' + ConfigCloseCmd;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

class procedure TGit.Push(Path: string);
var
  Comand: string;
begin
  Comand := '/C echo "Push -> ' + Path + '" && cd "' + GitBin + '" && git -C "' + Path + '" push && ' + ConfigCloseCmd;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 1);
end;

end.
