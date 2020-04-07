object AdicionarSalarioDataModule: TAdicionarSalarioDataModule
  OldCreateOrder = False
  Height = 302
  Width = 375
  object Connection: TFDConnection
    Params.Strings = (
      'Database=fluxodegastosdelphi'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 104
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 200
    Top = 112
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\lucar\Documents\Embarcadero\Studio\Projects\Flixo de Ga' +
      'stos Definitivo\libmysql.dll'
    Left = 96
    Top = 216
  end
  object AdicionarSalarioQuery: TFDQuery
    Connection = Connection
    Left = 224
    Top = 216
  end
end
