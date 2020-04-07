object RegistrarEntradaDataModule: TRegistrarEntradaDataModule
  OldCreateOrder = False
  Height = 263
  Width = 408
  object Connection: TFDConnection
    Params.Strings = (
      'Database=fluxodegastosdelphi'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 64
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\lucar\Documents\Embarcadero\Studio\Projects\Flixo de Ga' +
      'stos Definitivo\libmysql.dll'
    Left = 72
    Top = 184
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 216
    Top = 64
  end
  object RegistrarEntradaQuery: TFDQuery
    Connection = Connection
    Left = 224
    Top = 168
  end
end
