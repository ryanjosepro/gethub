program ProjectGethub;

uses
  Vcl.Forms,
  ViewMain in 'View\ViewMain.pas' {WindowMain},
  MyUtils in 'Code\MyUtils.pas',
  ViewEditRepo in 'View\ViewEditRepo.pas' {WindowEditRepo},
  ViewConfigs in 'View\ViewConfigs.pas' {WindowConfigs},
  Datas in 'Datas\Datas.pas' {DataFactory: TDataModule},
  DAO in 'Datas\DAO.pas',
  ViewAddRepo in 'View\ViewAddRepo.pas' {WindowAddRepo},
  MyDialogs in 'Code\MyDialogs.pas',
  Config in 'Code\Config.pas',
  Git in 'Code\Git.pas',
  ViewFiles in 'View\ViewFiles.pas' {WindowFiles};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWindowMain, WindowMain);
  Application.CreateForm(TWindowEditRepo, WindowEditRepo);
  Application.CreateForm(TWindowConfigs, WindowConfigs);
  Application.CreateForm(TDataFactory, DataFactory);
  Application.CreateForm(TWindowAddRepo, WindowAddRepo);
  Application.CreateForm(TWindowFiles, WindowFiles);
  Application.Run;
end.
