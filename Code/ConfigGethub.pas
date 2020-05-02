unit ConfigGethub;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, IniFiles,
  MyUtils, Config, Git;

type
  TConfigGethub = class(TConfig)
  protected
    class procedure CreateFile(Path: string);
  public
    class procedure SetGlobalGitAccount;
    class function GitConfig: TGitConfig;
  end;

implementation

{ TConfigGit }

class procedure TConfigGethub.CreateFile(Path: string);
var
  Arq: TIniFile;
begin
  Arq := TIniFile.Create(Path);
  try
    Arq.WriteString('ACCOUNT', 'Name', '');
    Arq.WriteString('ACCOUNT', 'Email', '');
    Arq.WriteString('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin');
    Arq.WriteString('OPTIONS', 'CloseCmd', '1');
    Arq.WriteString('OPTIONS', 'CloseStatus', '0');
    Arq.WriteString('OPTIONS', 'CloseTime', '5');
    Arq.WriteString('OPTIONS', 'ExecTime', '0');
  finally
    FreeAndNil(Arq);
  end;
end;

class procedure TConfigGethub.SetGlobalGitAccount;
var
  GitBin, Name, Email, Comand: string;
begin
  GitBin := GetConfig('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin');
  Name := GetConfig('ACCOUNT', 'Name');
  Email := GetConfig('ACCOUNT', 'Email');
  Comand := '/C cd "' + GitBin + '" && git config --global user.name ' + Name + ' && git config --global user.email ' + Email;
  TUtils.ExecCmd(Comand, false);
end;

class function TConfigGethub.GitConfig: TGitConfig;
begin
  Result := TGitConfig.Create;
  with Result do
  begin
    GitBin := GetConfig('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin');
    CloseCmd := GetConfig('OPTIONS', 'CloseCmd') = '1';
    CloseStatus := GetConfig('OPTIONS', 'CloseStatus') = '1';
    CloseTime := GetConfig('OPTIONS', 'CloseTime').ToInteger;
  end;
end;

end.
