object DataFactory: TDataFactory
  OldCreateOrder = False
  Height = 187
  Width = 217
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
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Msg'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 88
    Top = 70
    object TableCheck: TBooleanField
      DisplayWidth = 2
      FieldName = ' '
    end
    object TableLink: TStringField
      FieldName = 'Link'
      Visible = False
    end
    object TablePath: TStringField
      FieldKind = fkCalculated
      FieldName = 'Path'
      Visible = False
      Calculated = True
    end
    object TableNome: TStringField
      DisplayLabel = 'Nome do Reposit'#243'rio'
      DisplayWidth = 20
      FieldName = 'Nome'
    end
    object TableStatus: TStringField
      DisplayLabel = 'Status do Reposit'#243'rio'
      DisplayWidth = 20
      FieldName = 'Status'
    end
    object TableMsg: TStringField
      DisplayLabel = 'Mensagem do Commit'
      DisplayWidth = 20
      FieldName = 'Msg'
    end
  end
end