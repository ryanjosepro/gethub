program ProjectGethub;

uses
  Vcl.Forms,
  ViewMain in 'View\ViewMain.pas' {WindowMain},
  Arrays in 'Code\Arrays.pas',
  MyUtils in 'Code\MyUtils.pas',
  ViewAddRepo in 'View\ViewAddRepo.pas' {WindowAddRepo},
  Repositories in 'Code\Repositories.pas',
  ViewAccount in 'View\ViewAccount.pas' {WindowAccount};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWindowMain, WindowMain);
  Application.CreateForm(TWindowAddRepo, WindowAddRepo);
  Application.CreateForm(TWindowAccount, WindowAccount);
  Application.Run;
end.
