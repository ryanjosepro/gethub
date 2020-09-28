unit Config;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, Vcl.Forms, IniFiles,
  MyUtils, Git;

type
  TConfig = class
  private
    class procedure CreateFile(Path: string);
    class function Source: string;
  public
    class function GetConfig(const Section, Name: string; Default: string = ''): string;
    class procedure SetConfig(const Section, Name: string; Value: string = '');
    class procedure SetGlobalGitAccount;
    class function GetGitConfig: TGitConfig;
  end;

implementation

{ TConfigs }

class procedure TConfig.CreateFile(Path: string);
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
    Arq.WriteString('OPTIONS', 'ExecTime', '600');
  finally
    FreeAndNil(Arq);
  end;
end;

//Caminho das configurações
class function TConfig.Source: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'Config.ini';

  if not FileExists(Result) then
  begin
    CreateFile(Result);
  end;
end;

//Busca uma configuração específica
class function TConfig.GetConfig(const Section, Name: string; Default: string = ''): string;
var
  Arq: TIniFile;
begin
  Arq := TIniFile.Create(Source);

  try
    Result := Arq.ReadString(Section, Name, Default);
  finally
    FreeAndNil(Arq);
  end;
end;

//Define uma configuração específica
class procedure TConfig.SetConfig(const Section, Name: string; Value: string = '');
var
  Arq: TIniFile;
begin
  Arq := TIniFile.Create(Source);
  try
    Arq.WriteString(Section, Name, Value);
  finally
    FreeAndNil(Arq);
  end;
end;

class procedure TConfig.SetGlobalGitAccount;
var
  GitBin, Name, Email, Comand: string;
begin
  GitBin := GetConfig('SYSTEM', 'GitBin', 'C:\Program Files\Git\Bin');
  Name := GetConfig('ACCOUNT', 'Name');
  Email := GetConfig('ACCOUNT', 'Email');
  Comand := '/C cd "' + GitBin + '" && git config --global user.name ' + Name + ' && git config --global user.email ' + Email;
  TUtils.ExecCmd(Comand, false);
end;

class function TConfig.GetGitConfig: TGitConfig;
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
