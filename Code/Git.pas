unit Git;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Variants, System.StrUtils, ShellAPI,
  DAO;

type
  TGit = class
  public
    class procedure Add(Path: string);
    class procedure Commit(Path, Msg: string);
    class procedure Checkout(Path: string);
    class procedure Push(Path: string);
  end;

implementation

{ TGit }

class procedure TGit.Add(Path: string);
var
  Comand: string;
begin
  Comand := '/C cd C:\Program Files\Git\Bin && git -C "' + Path + '" add .';
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 3);
end;

class procedure TGit.Commit(Path, Msg: string);
var
  Comand: string;
begin
  Comand := '/C cd C:\Program Files\Git\Bin && git -C "' + Path + '" commit -m' + Msg;
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 3);
end;

class procedure TGit.Checkout(Path: string);
var
  Comand: string;
begin
  Comand := '/C cd C:\Program Files\Git\Bin && git -C "' + Path + '" checkout';
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 3);
end;

class procedure TGit.Push(Path: string);
var
  Comand: string;
begin
  Comand := '/C cd C:\Program Files\Git\Bin && git -C "' + Path + '" push';
  ShellExecute(0, nil, 'cmd.exe', PWideChar(Comand), nil, 3);
end;

end.
