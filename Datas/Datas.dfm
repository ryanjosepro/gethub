object DataFactory: TDataFactory
  OldCreateOrder = False
  Height = 77
  Width = 149
  object Table: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = ' '
        DataType = ftBoolean
      end
      item
        Name = 'Link'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Path'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Msg'
        DataType = ftString
        Size = 72
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvEInsert, uvCheckRequired, uvCheckReadOnly, uvAutoCommitUpdates]
    UpdateOptions.EnableInsert = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 24
    Top = 14
    Content = {
      414442530F00FC1FC1020000FF00010001FF02FF0304000A0000005400610062
      006C006500050000000000060000070032000000080000FF09FF0A0B00020000
      00200004000200000020000C00010000000E000D000F00011000011100011200
      011300011400011500020000002000FEFF0A0B00080000004C0069006E006B00
      0400080000004C0069006E006B000C00020000000E00160017003C0000000F00
      011000011100011200011300011400011500080000004C0069006E006B001800
      3C000000FEFF0A0B000800000050006100740068000400080000005000610074
      0068000C00030000000E0016001700460000000F000110000111000112000113
      00011400011500080000005000610074006800180046000000FEFF0A0B000800
      00004E0061006D0065000400080000004E0061006D0065000C00040000000E00
      160017001E0000000F00011000011100011900260000004E006F006D00650020
      0064006F0020005200650070006F00730069007400F300720069006F00120001
      1300011400011500080000004E0061006D00650018001E000000FEFF0A0B000C
      00000053007400610074007500730004000C0000005300740061007400750073
      000C00050000000E00160017001E0000000F000110000111000119002A000000
      530074006100740075007300200064006F0020005200650070006F0073006900
      7400F300720069006F0012000113000114000115000C00000053007400610074
      007500730018001E000000FEFF0A0B00060000004D0073006700040006000000
      4D00730067000C00060000000E0016001700480000000F000110000111000119
      00240000004D0065006E0073006100670065006D00200064006F00200043006F
      006D006D00690074001200011300011400011500060000004D00730067001800
      48000000FEFEFF1AFEFF1BFEFF1CFEFEFEFF1DFEFF1E1F0001000000FF20FEFE
      FE0E004D0061006E0061006700650072001E0055007000640061007400650073
      005200650067006900730074007200790012005400610062006C0065004C0069
      00730074000A005400610062006C006500140053006F0075007200630065004E
      0061006D0065000A0054006100620049004400240045006E0066006F00720063
      00650043006F006E00730074007200610069006E00740073001E004D0069006E
      0069006D0075006D004300610070006100630069007400790018004300680065
      0063006B004E006F0074004E0075006C006C00140043006F006C0075006D006E
      004C006900730074000C0043006F006C0075006D006E0008004E0061006D0065
      00100053006F0075007200630065004900440012006400740042006F006F006C
      00650061006E0010004400610074006100540079007000650014005300650061
      00720063006800610062006C006500120041006C006C006F0077004E0075006C
      006C000800420061007300650014004F0041006C006C006F0077004E0075006C
      006C0012004F0049006E0055007000640061007400650010004F0049006E0057
      0068006500720065001A004F0072006900670069006E0043006F006C004E0061
      006D00650018006400740041006E007300690053007400720069006E00670008
      00530069007A006500140053006F007500720063006500530069007A0065000E
      00430061007000740069006F006E001C0043006F006E00730074007200610069
      006E0074004C00690073007400100056006900650077004C006900730074000E
      0052006F0077004C006900730074001800520065006C006100740069006F006E
      004C006900730074001C0055007000640061007400650073004A006F00750072
      006E0061006C001200530061007600650050006F0069006E0074000E00430068
      0061006E00670065007300}
    object TableCheck: TBooleanField
      DisplayWidth = 2
      FieldName = ' '
    end
    object TableLink: TStringField
      FieldName = 'Link'
      Visible = False
      Size = 60
    end
    object TablePath: TStringField
      FieldName = 'Path'
      Visible = False
      Size = 70
    end
    object TableName: TStringField
      DisplayLabel = 'Nome do Reposit'#243'rio'
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 30
    end
    object TableStatus: TStringField
      DisplayLabel = 'Status do Reposit'#243'rio'
      DisplayWidth = 20
      FieldName = 'Status'
      Size = 30
    end
    object TableMsg: TStringField
      DisplayLabel = 'Mensagem do Commit'
      DisplayWidth = 20
      FieldName = 'Msg'
      Size = 72
    end
  end
  object JSON: TFDStanStorageJSONLink
    Left = 96
    Top = 16
  end
end
