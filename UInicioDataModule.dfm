object InicioDataModule: TInicioDataModule
  OldCreateOrder = False
  Height = 523
  Width = 637
  object Connection: TFDConnection
    Params.Strings = (
      'Database=fluxodegastosdelphi'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 80
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 200
    Top = 72
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\lucar\Documents\Embarcadero\Studio\Projects\Flixo de Ga' +
      'stos Definitivo\libmysql.dll'
    Left = 72
    Top = 184
  end
  object EntryQuery: TFDQuery
    Connection = Connection
    Left = 216
    Top = 136
  end
  object WithdrawQuery: TFDQuery
    Connection = Connection
    Left = 216
    Top = 192
  end
  object PersonsQuery: TFDQuery
    Connection = Connection
    Left = 216
    Top = 248
  end
  object EntryDataSource: TDataSource
    DataSet = EntryQuery
    Left = 336
    Top = 96
  end
  object WithdrawDataSource: TDataSource
    DataSet = WithdrawQuery
    Left = 344
    Top = 168
  end
end
