object CadastroDataModule: TCadastroDataModule
  OldCreateOrder = False
  Height = 194
  Width = 252
  object Connection: TFDConnection
    Params.Strings = (
      'Database=fluxodegastosdelphi'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 120
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\lucar\Documents\Embarcadero\Studio\Projects\Flixo de Ga' +
      'stos Definitivo\libmysql.dll'
    Left = 32
    Top = 88
  end
  object CadastroQuery: TFDQuery
    Connection = Connection
    SQL.Strings = (
      
        'INSERT INTO Accounts (Username, Password) VALUES ('#39'luisc'#39','#39'12345' +
        #39');'
      'SELECT LAST_INSERT_ID();')
    Left = 152
    Top = 88
  end
end
