object DataModuleConn: TDataModuleConn
  OldCreateOrder = False
  Height = 83
  Width = 144
  object JSON: TFDStanStorageJSONLink
    Left = 88
    Top = 16
  end
  object Table: TFDMemTable
    FieldDefs = <>
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
    Left = 24
    Top = 16
    object TableChecked: TBooleanField
      FieldName = 'Checked'
    end
    object TableLink: TStringField
      FieldName = 'Link'
      Size = 60
    end
    object TablePath: TStringField
      DisplayWidth = 150
      FieldName = 'Path'
      Size = 150
    end
    object TableName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object TableDescription: TStringField
      FieldName = 'Description'
      Size = 40
    end
    object TableMsg: TStringField
      FieldName = 'Message'
      Size = 72
    end
    object TableLastAct: TStringField
      FieldName = 'LastAction'
    end
  end
end
