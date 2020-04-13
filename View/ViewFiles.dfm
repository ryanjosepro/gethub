object WindowFiles: TWindowFiles
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 462
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  DesignSize = (
    419
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnFinalize: TSpeedButton
    Left = 314
    Top = 420
    Width = 97
    Height = 34
    Action = ActFinalize
    Anchors = [akRight, akBottom]
    Caption = 'Finalizar'
    ExplicitTop = 411
  end
  object BtnCancel: TSpeedButton
    Left = 211
    Top = 420
    Width = 97
    Height = 34
    Action = ActCancel
    Anchors = [akRight, akBottom]
    ExplicitTop = 411
  end
  object BtnAdd: TSpeedButton
    Left = 331
    Top = 8
    Width = 80
    Height = 33
    Action = ActAdd
    Anchors = [akTop, akRight]
  end
  object BtnRemove: TSpeedButton
    Left = 8
    Top = 8
    Width = 80
    Height = 33
    Action = ActRemove
  end
  object ListFiles: TListBox
    Left = 8
    Top = 47
    Width = 403
    Height = 367
    AutoCompleteDelay = 1000
    Anchors = [akLeft, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 0
  end
  object Actions: TActionList
    Left = 328
    Top = 72
    object ActAdd: TAction
      Caption = 'Adicionar (F2)'
      ShortCut = 113
      OnExecute = ActAddExecute
    end
    object ActRemove: TAction
      Caption = 'Remover (F4)'
      ShortCut = 115
      OnExecute = ActRemoveExecute
    end
    object ActFinalize: TAction
      Caption = 'Finalizar'#13#10
      Enabled = False
      OnExecute = ActFinalizeExecute
    end
    object ActCancel: TAction
      Caption = 'Cancelar (Esc)'
      OnExecute = ActCancelExecute
    end
    object ActEsc: TAction
      Caption = 'ActEsc'
      ShortCut = 27
      OnExecute = ActEscExecute
    end
  end
  object OpenFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoAllowMultiSelect]
    Left = 272
    Top = 72
  end
end
