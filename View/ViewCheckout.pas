unit ViewCheckout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CheckLst, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TWindowCheckout = class(TForm)
    ListFiles: TListBox;
    BtnCheckout: TSpeedButton;
    BtnCancel: TSpeedButton;
    Actions: TActionList;
    ActCancel: TAction;
    ActEsc: TAction;
    OpenFile: TFileOpenDialog;
    ActAdd: TAction;
    BtnAdd: TSpeedButton;
    ActRemove: TAction;
    BtnRemove: TSpeedButton;
    ActCheckout: TAction;
    procedure ActCancelExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActRemoveExecute(Sender: TObject);
    procedure ActCheckoutExecute(Sender: TObject);
    function ShowModal(Path: string): TStringList;
    procedure FormActivate(Sender: TObject);
  private
    Path: string;
  end;

var
  WindowCheckout: TWindowCheckout;
  Execute: boolean = false;

implementation

{$R *.dfm}

function TWindowCheckout.ShowModal(Path: string): TStringList;
var
  Item: string;
begin
  inherited ShowModal;

  Self.Path := Path;

  Result := TStringList.Create;

  if Execute then
  begin
    for Item in ListFiles.Items do
    begin
      Result.Add(Item);
    end;
  end;
end;

procedure TWindowCheckout.FormActivate(Sender: TObject);
begin
  ListFiles.Clear;
end;

procedure TWindowCheckout.ActAddExecute(Sender: TObject);
begin
  OpenFile.DefaultFolder := Path;
  if OpenFile.Execute then
  begin
    ListFiles.Items.Add(OpenFile.FileName);
  end;
end;

procedure TWindowCheckout.ActRemoveExecute(Sender: TObject);
begin
  ListFiles.DeleteSelected;
end;

procedure TWindowCheckout.ActCheckoutExecute(Sender: TObject);
begin
  Execute := true;
  Close;
end;

procedure TWindowCheckout.ActCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowCheckout.ActEscExecute(Sender: TObject);
begin
  Close;
end;

end.
