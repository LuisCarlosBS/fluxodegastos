object RegistrarSaidaDataModule: TRegistrarSaidaDataModule
  OldCreateOrder = False
  Height = 223
  Width = 306
  object Connection: TFDConnection
    Params.Strings = (
      'Database=fluxodegastosdelphi'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    Left = 48
    Top = 40
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\lucar\Documents\Embarcadero\Studio\Projects\Flixo de Ga' +
      'stos Definitivo\libmysql.dll'
    Left = 56
    Top = 128
  end
  object RegistrarSaidaQuery: TFDQuery
    Connection = Connection
    Left = 168
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 216
    Top = 144
  end
end
