object WindowCheckout: TWindowCheckout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Checkout'
  ClientHeight = 453
  ClientWidth = 376
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
    376
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnCheckout: TSpeedButton
    Left = 272
    Top = 411
    Width = 97
    Height = 34
    Action = ActCheckout
    Anchors = [akRight, akBottom]
  end
  object BtnCancel: TSpeedButton
    Left = 169
    Top = 411
    Width = 97
    Height = 34
    Action = ActCancel
    Anchors = [akRight, akBottom]
  end
  object BtnAdd: TSpeedButton
    Left = 288
    Top = 8
    Width = 80
    Height = 33
    Action = ActAdd
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
    Width = 360
    Height = 358
    Anchors = [akLeft, akRight, akBottom]
    ItemHeight = 13
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
    object ActCheckout: TAction
      Caption = 'Checkout'
      OnExecute = ActCheckoutExecute
    end
    object ActCancel: TAction
      Caption = 'Cancelar (Esc)'
      OnExecute = ActCancelExecute
    end
    object ActEsc: TAction
      Caption = 'ActEsc'
      ShortCut = 27
    end
  end
  object OpenFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 272
    Top = 72
  end
end
