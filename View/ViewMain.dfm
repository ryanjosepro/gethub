object WindowMain: TWindowMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gethub'
  ClientHeight = 535
  ClientWidth = 577
  Color = clBtnFace
  Constraints.MaxWidth = 583
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    577
    535)
  PixelsPerInch = 96
  TextHeight = 13
  object LblLogo: TLabel
    Left = 8
    Top = 8
    Width = 187
    Height = 54
    Caption = 'GETHUB'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Kristen ITC'
    Font.Style = []
    ParentFont = False
  end
  object GridRepositories: TStringGrid
    Left = 8
    Top = 136
    Width = 561
    Height = 351
    Anchors = [akLeft, akBottom]
    ColCount = 2
    DefaultColWidth = 280
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goThumbTracking]
    TabOrder = 0
    ExplicitTop = 210
    RowHeights = (
      24)
  end
  object BtnAddRepository: TButton
    Left = 8
    Top = 72
    Width = 58
    Height = 58
    Action = ActAddRepository
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    ExplicitTop = 146
  end
  object BtnDel: TButton
    Left = 499
    Top = 104
    Width = 70
    Height = 26
    Action = ActDel
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    ExplicitTop = 178
  end
  object BtnEdit: TButton
    Left = 425
    Top = 104
    Width = 70
    Height = 26
    Action = ActEdit
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    ExplicitTop = 200
  end
  object BtnCommit: TButton
    Left = 347
    Top = 493
    Width = 70
    Height = 34
    Action = ActCommit
    Anchors = [akLeft, akBottom]
    TabOrder = 4
    ExplicitTop = 567
  end
  object BtnAdd: TButton
    Left = 271
    Top = 493
    Width = 70
    Height = 34
    Action = ActAdd
    Anchors = [akLeft, akBottom]
    TabOrder = 5
    ExplicitTop = 567
  end
  object BtnPush: TButton
    Left = 499
    Top = 493
    Width = 70
    Height = 34
    Action = ActPush
    Anchors = [akLeft, akBottom]
    TabOrder = 6
    ExplicitTop = 567
  end
  object BtnCheckout: TButton
    Left = 423
    Top = 493
    Width = 70
    Height = 34
    Action = ActCheckout
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    ExplicitTop = 567
  end
  object BtnAccount: TButton
    Left = 528
    Top = 8
    Width = 41
    Height = 41
    Action = ActConfigAccount
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object Actions: TActionList
    Left = 312
    Top = 8
    object ActConfigAccount: TAction
    end
    object ActAddRepository: TAction
      Caption = '+'
    end
    object ActEdit: TAction
      Caption = 'Editar'
    end
    object ActDel: TAction
      Caption = 'Remover'
    end
    object ActAdd: TAction
      Caption = 'Add .'
    end
    object ActCommit: TAction
      Caption = 'Commit'
    end
    object ActCheckout: TAction
      Caption = 'Checkout'
    end
    object ActPush: TAction
      Caption = 'Push'
    end
  end
  object Images: TImageList
    Left = 264
    Top = 8
  end
end
