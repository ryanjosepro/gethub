unit Config;

interface

uses
System.SysUtils, System.Classes, System.Types, System.Variants, Vcl.Forms, IniFiles,
  MyUtils;

type
  TConfig = class
  strict private
    class function Source: string;
    class procedure CreateFile(Path: string);
  public
    class function GetConfig(const Section, Name: string; Default: string = ''): string;
    class procedure SetConfig(const Section, Name: string; Value: string = '');
  end;

implementation

{ TConfigs }

//Caminho das configurações
class function TConfig.Source: string;
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + 'Config.ini';

  if not FileExists(Path) then
  begin
    CreateFile(Path);
  end;

  Result := Path;
end;

//Cria o arquivo Config.ini
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
    Arq.WriteString('OPTIONS', 'ExecTime', '0');
  finally
    FreeAndNil(Arq);
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

end.
