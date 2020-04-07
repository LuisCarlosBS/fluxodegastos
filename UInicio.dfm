object InicioForm: TInicioForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Fluxo de Gastos - In'#237'cio'
  ClientHeight = 528
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object totalSalaryLabel: TLabel
    Left = 8
    Top = 10
    Width = 106
    Height = 19
    Caption = 'Sal'#225'rio: R$ -,--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object addedMoneyLabel: TLabel
    Left = 314
    Top = 8
    Width = 119
    Height = 19
    Caption = 'Entradas: R$ -,--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object withdrawMoneyLabel: TLabel
    Left = 164
    Top = 10
    Width = 123
    Height = 19
    Caption = 'Retiradas: R$ -,--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object totalMoneyLabel: TLabel
    Left = 472
    Top = 8
    Width = 94
    Height = 19
    Caption = 'Total: R$ -,--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lastSpendingLabel: TLabel
    Left = 8
    Top = 95
    Width = 190
    Height = 19
    Caption = #218'ltimas sa'#237'das registrados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 346
    Top = 95
    Width = 206
    Height = 19
    Caption = #218'ltimas entradas registradas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object greetingsLabel: TLabel
    Left = 8
    Top = 495
    Width = 159
    Height = 19
    Caption = '{GreetingPlaceHolder}'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object idPersonLabel: TLabel
    Left = 608
    Top = 88
    Width = 3
    Height = 13
    Visible = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 120
    Width = 300
    Height = 370
    BevelOuter = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object lastSpendingsDBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 305
      Height = 369
      DataSource = InicioDataModule.WithdrawDataSource
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object addSalaryButton: TButton
    Left = 8
    Top = 56
    Width = 93
    Height = 25
    Caption = 'Adicionar Sal'#225'rio'
    TabOrder = 1
    OnClick = addSalaryButtonClick
  end
  object withdrawButton: TButton
    Left = 164
    Top = 56
    Width = 103
    Height = 25
    Caption = 'Registrar Saida'
    TabOrder = 2
    OnClick = withdrawButtonClick
  end
  object addEntryButton: TButton
    Left = 314
    Top = 54
    Width = 113
    Height = 25
    Caption = 'Registrar Entrada'
    TabOrder = 3
    OnClick = addEntryButtonClick
  end
  object Button1: TButton
    Left = 613
    Top = 8
    Width = 80
    Height = 30
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Panel2: TPanel
    Left = 346
    Top = 120
    Width = 300
    Height = 370
    BevelOuter = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 5
    object lastAddedDBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 297
      Height = 369
      DataSource = InicioDataModule.EntryDataSource
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
