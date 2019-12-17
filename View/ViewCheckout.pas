unit ViewCheckout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CheckLst, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  MyUtils;

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
    function ShowModal(Name, Path: string): TStringList;
    procedure FormActivate(Sender: TObject);
  private
    Path: string;
  end;

var
  WindowCheckout: TWindowCheckout;
  Execute: boolean = false;

implementation

{$R *.dfm}

function TWindowCheckout.ShowModal(Name, Path: string): TStringList;
var
  Item: string;
begin
  Self.Path := Path;

  Self.Caption := 'Checkout - ' + Name;

  inherited ShowModal;

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
var
  FileName, Item: string;
  Exists: boolean;
begin
  OpenFile.DefaultFolder := Path;

  if OpenFile.Execute then
  begin
    for FileName in OpenFile.Files do
    begin
      if StartsStr(Path.ToUpper + '\', FileName.ToUpper) then
      begin
        for Item in ListFiles.Items do
        begin
          Exists := (Exists) or (ReplaceStr(FileName, Path + '\', '') = Item);
        end;

        if not Exists then
        begin
          ListFiles.Items.Add(ReplaceStr(FileName, Path + '\', ''));
        end;
      end
      else
      begin
        ShowMessage('Não é possível adicionar arquivos que estão fora da pasta do repositório!');
        Break;
      end;
    end;
  end;
end;

procedure TWindowCheckout.ActRemoveExecute(Sender: TObject);
var
  Index: integer;
begin
  Index := ListFiles.ItemIndex;
  ListFiles.DeleteSelected;
  if Index = 0 then
  begin
    ListFiles.ItemIndex := 0;
  end
  else
  begin
    ListFiles.ItemIndex := Index - 1;
  end;
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
