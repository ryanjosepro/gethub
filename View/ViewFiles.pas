unit ViewFiles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CheckLst, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  MyUtils, Git;

type
  TWindowFiles = class(TForm)
    ListFiles: TListBox;
    BtnFinalize: TSpeedButton;
    BtnCancel: TSpeedButton;
    Actions: TActionList;
    ActCancel: TAction;
    ActEsc: TAction;
    OpenFile: TFileOpenDialog;
    ActAdd: TAction;
    BtnAdd: TSpeedButton;
    ActRemove: TAction;
    BtnRemove: TSpeedButton;
    ActFinalize: TAction;
    procedure ActCancelExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActRemoveExecute(Sender: TObject);
    procedure ActFinalizeExecute(Sender: TObject);
    function ShowModal(Caption: string; Repository: TRepository): TStringList;
    procedure FormActivate(Sender: TObject);
  private
    Path: string;
    procedure UpdateButtons;
  end;

var
  WindowFiles: TWindowFiles;
  Execute: boolean = false;

implementation

{$R *.dfm}

function TWindowFiles.ShowModal(Caption: string; Repository: TRepository): TStringList;
var
  Item: string;
begin
  Self.Path := Repository.Path;

  Self.Caption := Caption;

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

procedure TWindowFiles.FormActivate(Sender: TObject);
begin
  ListFiles.Clear;
  UpdateButtons;
end;

procedure TWindowFiles.ActAddExecute(Sender: TObject);
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

  UpdateButtons;
end;

procedure TWindowFiles.ActRemoveExecute(Sender: TObject);
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

  UpdateButtons;
end;

procedure TWindowFiles.ActFinalizeExecute(Sender: TObject);
begin
  Execute := true;
  Close;
end;

procedure TWindowFiles.ActCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowFiles.ActEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TWindowFiles.UpdateButtons;
var
  Value: boolean;
begin
  Value := ListFiles.Count > 0;

  ActFinalize.Enabled := Value;
end;

end.
