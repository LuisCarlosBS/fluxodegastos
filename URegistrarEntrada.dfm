object RegistrarEntradaForm: TRegistrarEntradaForm
  Left = 0
  Top = 0
  Caption = 'Fluxo de Gastos - Registrar Entrada'
  ClientHeight = 157
  ClientWidth = 176
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
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 83
    Height = 13
    Caption = 'Data da Entrada:'
  end
  object idPersonLabel: TLabel
    Left = 144
    Top = 8
    Width = 3
    Height = 13
    Visible = False
  end
  object entradaLabeledEdit: TLabeledEdit
    Left = 8
    Top = 26
    Width = 158
    Height = 21
    EditLabel.Width = 110
    EditLabel.Height = 13
    EditLabel.Caption = 'Quantia a ser entrada:'
    TabOrder = 0
  end
  object cancelarButton: TButton
    Left = 8
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = cancelarButtonClick
  end
  object entrarButton: TButton
    Left = 89
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = entrarButtonClick
  end
  object dataDaEntradaDatePicker: TDatePicker
    Left = 8
    Top = 72
    Width = 158
    Date = 43915.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
end
