object DataFactory: TDataFactory
  OldCreateOrder = False
  Height = 132
  Width = 209
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
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 38
    Content = {
      414442530F006B256C020000FF00010001FF02FF0304000A0000005400610062
      006C006500050000000000060000070032000000080000FF09FF0A0B00020000
      00200004000200000020000C00010000000E000D000F00011000011100011200
      011300011400011500020000002000FEFF0A0B00080000004C0069006E006B00
      0400080000004C0069006E006B000C00020000000E00160017003C0000000F00
      011000011100011200011300011400011500080000004C0069006E006B001800
      3C000000FEFF0A0B00080000004E0061006D0065000400080000004E0061006D
      0065000C00030000000E00160017001E0000000F000110000111000119002600
      00004E006F006D006500200064006F0020005200650070006F00730069007400
      F300720069006F001200011300011400011500080000004E0061006D00650018
      001E000000FEFF0A0B000C00000053007400610074007500730004000C000000
      5300740061007400750073000C00040000000E00160017001E0000000F000110
      000111000119002A000000530074006100740075007300200064006F00200052
      00650070006F00730069007400F300720069006F001200011300011400011500
      0C00000053007400610074007500730018001E000000FEFF0A0B00060000004D
      00730067000400060000004D00730067000C00050000000E0016001700480000
      000F00011000011100011900240000004D0065006E0073006100670065006D00
      200064006F00200043006F006D006D0069007400120001130001140001150006
      0000004D0073006700180048000000FEFEFF1AFEFF1BFEFF1CFEFEFEFF1DFEFF
      1E1F0001000000FF20FEFEFE0E004D0061006E0061006700650072001E005500
      7000640061007400650073005200650067006900730074007200790012005400
      610062006C0065004C006900730074000A005400610062006C00650014005300
      6F0075007200630065004E0061006D0065000A00540061006200490044002400
      45006E0066006F0072006300650043006F006E00730074007200610069006E00
      740073001E004D0069006E0069006D0075006D00430061007000610063006900
      74007900180043006800650063006B004E006F0074004E0075006C006C001400
      43006F006C0075006D006E004C006900730074000C0043006F006C0075006D00
      6E0008004E0061006D006500100053006F007500720063006500490044001200
      6400740042006F006F006C00650061006E001000440061007400610054007900
      700065001400530065006100720063006800610062006C006500120041006C00
      6C006F0077004E0075006C006C000800420061007300650014004F0041006C00
      6C006F0077004E0075006C006C0012004F0049006E0055007000640061007400
      650010004F0049006E00570068006500720065001A004F007200690067006900
      6E0043006F006C004E0061006D00650018006400740041006E00730069005300
      7400720069006E0067000800530069007A006500140053006F00750072006300
      6500530069007A0065000E00430061007000740069006F006E001C0043006F00
      6E00730074007200610069006E0074004C006900730074001000560069006500
      77004C006900730074000E0052006F0077004C00690073007400180052006500
      6C006100740069006F006E004C006900730074001C0055007000640061007400
      650073004A006F00750072006E0061006C001200530061007600650050006F00
      69006E0074000E004300680061006E00670065007300}
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
      FieldKind = fkCalculated
      FieldName = 'Path'
      Visible = False
      Size = 70
      Calculated = True
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
    Left = 128
    Top = 40
  end
end
