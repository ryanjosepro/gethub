unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.StdCtrls;

type
  TWindowMain = class(TForm)
    GridRepositories: TStringGrid;
    Actions: TActionList;
    Images: TImageList;
    BtnAddRepository: TButton;
    BtnDel: TButton;
    BtnEdit: TButton;
    ActAddRepository: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActCommit: TAction;
    ActPush: TAction;
    ActAdd: TAction;
    ActConfigAccount: TAction;
    ActCheckout: TAction;
    BtnCommit: TButton;
    BtnAdd: TButton;
    BtnPush: TButton;
    BtnCheckout: TButton;
    LblLogo: TLabel;
    BtnAccount: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WindowMain: TWindowMain;

implementation

{$R *.dfm}

end.
