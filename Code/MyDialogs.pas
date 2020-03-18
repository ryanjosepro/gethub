unit MyDialogs;

interface

uses
  System.SysUtils, System.Classes, System.Types, Vcl.Dialogs, Vcl.Forms,
  Vcl.StdCtrls;

type
  TDialogs = class
  public
    class function YesNo(Msg: string; BtnDefault: TMsgDlgBtn = mbNo): integer;
    class function YesNoCancel(Msg: string; BtnDefault: TMsgDlgBtn = mbCancel): integer;
    class function CustomDialog(CONST Msg: string; DlgType: TmsgDlgType; Button: TMsgDlgButtons; ButtonsCaption: ARRAY OF string; dlgcaption: string): Integer;
  end;

implementation

{ TMyDialogs }

class function TDialogs.YesNo(Msg: string; BtnDefault: TMsgDlgBtn): integer;
begin
  Result := MessageDlg(Msg, mtWarning, mbYesNo, 0, BtnDefault);
end;

class function TDialogs.YesNoCancel(Msg: string; BtnDefault: TMsgDlgBtn): integer;
begin
  Result := MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0, BtnDefault);
end;

class function TDialogs.CustomDialog(CONST Msg: string; DlgType: TmsgDlgType; Button: TMsgDlgButtons; ButtonsCaption: ARRAY OF string; dlgcaption: string): Integer;
var
  aMsgdlg: TForm;
  i: Integer;
  Dlgbutton: Tbutton;
  Captionindex: Integer;
begin
  aMsgdlg := createMessageDialog(Msg, DlgType, button);
  aMsgdlg.Caption := dlgcaption;
  aMsgdlg.BiDiMode := bdRightToLeft;
  Captionindex := 0;
  for i := 0 to aMsgdlg.componentcount - 1 Do
  begin
    if (aMsgdlg.components[i] is Tbutton) then
    Begin
      Dlgbutton := Tbutton(aMsgdlg.components[i]);
      if Captionindex <= High(ButtonsCaption) then
        Dlgbutton.Caption := ButtonsCaption[Captionindex];
      inc(Captionindex);
    end;
  end;
  Result := aMsgdlg.Showmodal;
end;

end.
