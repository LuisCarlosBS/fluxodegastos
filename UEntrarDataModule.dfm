object EntrarDataModule: TEntrarDataModule
  OldCreateOrder = False
  Height = 220
  Width = 318
  object Connection: TFDConnection
    Params.Strings = (
      'Database=fluxodegastosdelphi'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\lucar\Documents\Embarcadero\Studio\Projects\Flixo de Ga' +
      'stos Definitivo\libmysql.dll'
    Left = 80
    Top = 136
  end
  object ValidateLoginQuery: TFDQuery
    Connection = Connection
    Left = 184
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 216
    Top = 136
  end
end
