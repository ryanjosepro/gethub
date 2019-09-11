program ProjectGethub;

uses
  Vcl.Forms,
  ViewMain in 'View\ViewMain.pas' {WindowMain},
  Arrays in 'Code\Arrays.pas',
  MyUtils in 'Code\MyUtils.pas',
  ViewEditRepo in 'View\ViewEditRepo.pas' {WindowEditRepo},
  ViewAccount in 'View\ViewAccount.pas' {WindowAccount},
  Datas in 'Datas\Datas.pas' {DataFactory: TDataModule},
  DAO in 'Datas\DAO.pas',
  ViewAddRepo in 'View\ViewAddRepo.pas' {WindowAddRepo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWindowMain, WindowMain);
  Application.CreateForm(TWindowEditRepo, WindowEditRepo);
  Application.CreateForm(TWindowAccount, WindowAccount);
  Application.CreateForm(TDataFactory, DataFactory);
  Application.CreateForm(TWindowAddRepo, WindowAddRepo);
  Application.Run;
end.
