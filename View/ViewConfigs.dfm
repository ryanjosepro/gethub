﻿object WindowConfigs: TWindowConfigs
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 330
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    257
    330)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnDBFile: TSpeedButton
    Left = 304
    Top = 173
    Width = 27
    Height = 24
    Cursor = crHandPoint
    Anchors = [akTop]
    ParentShowHint = False
    ShowHint = True
    ExplicitLeft = 294
  end
  object BtnSave: TSpeedButton
    Left = 144
    Top = 297
    Width = 97
    Height = 25
    Action = ActSave
  end
  object BtnDiscard: TSpeedButton
    Left = 8
    Top = 297
    Width = 97
    Height = 25
    Action = ActCancel
  end
  object PageConfigs: TPageControl
    Left = 0
    Top = 0
    Width = 257
    Height = 297
    ActivePage = TabConta
    TabOrder = 0
    TabStop = False
    object TabConta: TTabSheet
      Caption = 'Conta'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LblEmail: TLabel
        Left = 3
        Top = 55
        Width = 36
        Height = 16
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblName: TLabel
        Left = 3
        Top = 3
        Width = 38
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TxtEmail: TEdit
        Left = 3
        Top = 77
        Width = 243
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = ConfigChange
      end
      object TxtUserName: TEdit
        Left = 3
        Top = 25
        Width = 243
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = ConfigChange
      end
    end
    object TabSistema: TTabSheet
      Caption = 'Sistema'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        249
        269)
      object BtnGitBin: TSpeedButton
        Left = 218
        Top = 25
        Width = 27
        Height = 24
        Cursor = crHandPoint
        Action = ActGitBin
        Anchors = [akTop]
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 211
      end
      object LblPath: TLabel
        Left = 3
        Top = 3
        Width = 72
        Height = 16
        Caption = 'Pasta Git\Bin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TxtGitBin: TEdit
        Left = 3
        Top = 25
        Width = 216
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = ConfigChange
      end
    end
    object Opções: TTabSheet
      Caption = 'Op'#231#245'es'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelCloseCmd: TPanel
        Left = 3
        Top = 3
        Width = 243
        Height = 110
        TabOrder = 0
        object LblCloseSeconds: TLabel
          Left = 9
          Top = 23
          Width = 107
          Height = 13
          Caption = 'Tempo de fechamento'
        end
        object LblSeconds: TLabel
          Left = 122
          Top = 46
          Width = 54
          Height = 13
          Caption = '(segundos)'
        end
        object CheckCloseStatus: TCheckBox
          Left = 9
          Top = 84
          Width = 222
          Height = 17
          Caption = 'Incluir prompt de git status'
          TabOrder = 2
          OnClick = ConfigChange
        end
        object CheckCloseCmd: TCheckBox
          Left = 0
          Top = 0
          Width = 234
          Height = 17
          Caption = 'Fechar prompt de comando autom'#225'ticamente'
          TabOrder = 0
          OnClick = ConfigChange
        end
        object TxtCloseTime: TEdit
          Left = 9
          Top = 42
          Width = 112
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          Text = '5'
          OnChange = ConfigChange
        end
      end
      object PanelExecTime: TPanel
        Left = 3
        Top = 119
        Width = 243
        Height = 98
        TabOrder = 1
        object LblExecTime: TLabel
          Left = 1
          Top = 0
          Width = 235
          Height = 13
          Caption = 'Tempo de execu'#231#227'o de cada prompt de comando'
        end
        object LblMiliseconds: TLabel
          Left = 122
          Top = 23
          Width = 73
          Height = 13
          Caption = '(milissegundos)'
        end
        object TxtExecTime: TEdit
          Left = 9
          Top = 19
          Width = 112
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          Text = '0'
          OnChange = ConfigChange
        end
      end
    end
  end
  object Actions: TActionList
    Images = Images
    Left = 56
    Top = 248
    object ActSave: TAction
      Caption = 'Salvar (Ctrl + S)'
      Enabled = False
      ShortCut = 16467
      OnExecute = ActSaveExecute
    end
    object ActCancel: TAction
      Caption = 'Cancelar (Esc)'
      OnExecute = ActCancelExecute
    end
    object ActEsc: TAction
      ShortCut = 27
      OnExecute = ActEscExecute
    end
    object ActGitBin: TAction
      ImageIndex = 0
      OnExecute = ActGitBinExecute
    end
  end
  object Images: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    Left = 104
    Top = 248
    Bitmap = {
      494C010101000800040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006500000088000000880000
      0088000000880000008800000088000000880000008800000088000000880000
      0088000000820000001100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000A800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001C0000007600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000F30000000E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000009000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BA00000061000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000005D00000033000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000091000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000B00000084000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000075000000200000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000008D000000050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000880000001A000000760000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000450000004B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000910000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000020000008C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000088000000000000005B0000
      0063000000440000004400000044000000440000004400000044000000440000
      0044000000440000004400000044000000A40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000030000
      003F000000440000004400000044000000440000004400000044000000440000
      0044000000440000005D0000008F0000002A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000002200000065000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000000000
      000000000000000000000000006D000000890000008800000088000000880000
      0088000000880000008B00000022000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008B00000000000000000000
      0000000000000000003400000074000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006300000088000000880000
      0088000000880000007C00000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 8
    Top = 248
  end
end
