object DataModuleConn: TDataModuleConn
  OldCreateOrder = False
  Height = 538
  Width = 855
  object JSON: TFDStanStorageJSONLink
    Left = 424
    Top = 240
  end
  object Table: TFDMemTable
    FieldOptions.AutoCreateMode = acCombineComputed
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
    Left = 360
    Top = 240
    object TableChecked: TBooleanField
      FieldName = 'Checked'
    end
    object TableLink: TStringField
      FieldName = 'Link'
      Size = 300
    end
    object TablePath: TStringField
      DisplayWidth = 500
      FieldName = 'Path'
      Size = 500
    end
    object TableName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object TableDescription: TStringField
      FieldName = 'Description'
      Size = 70
    end
    object TableMsg: TStringField
      FieldName = 'Message'
      Size = 72
    end
    object TableLastAct: TStringField
      FieldName = 'LastAction'
    end
    object TableBranch: TStringField
      FieldName = 'Branch'
      Size = 30
    end
    object TableActive: TBooleanField
      FieldName = 'Active'
    end
  end
end
