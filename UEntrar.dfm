object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Fluxo de Gastos - Entrar'
  ClientHeight = 324
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object JvBehaviorLabel1: TJvBehaviorLabel
    Left = 88
    Top = 24
    Width = 126
    Height = 64
    Behavior = 'Typing'
    BehaviorOptions.MakeErrors = False
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object usuarioLabeledEdit: TLabeledEdit
    Left = 72
    Top = 152
    Width = 156
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Usu'#225'rio:'
    TabOrder = 0
  end
  object senhaLabeledEdit: TLabeledEdit
    Left = 72
    Top = 208
    Width = 156
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha:'
    PasswordChar = '*'
    TabOrder = 1
  end
  object entrarButton: TButton
    Left = 153
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = entrarButtonClick
  end
  object cadastrarButton: TButton
    Left = 72
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = cadastrarButtonClick
  end
end
