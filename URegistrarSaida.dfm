object RegistrarSaidaForm: TRegistrarSaidaForm
  Left = 0
  Top = 0
  Caption = 'Fluxo de Gastos - Registrar Sa'#237'da'
  ClientHeight = 204
  ClientWidth = 174
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 36
    Height = 13
    Caption = 'Motivo:'
  end
  object Label2: TLabel
    Left = 8
    Top = 101
    Width = 86
    Height = 13
    Caption = 'Data da Retirada:'
  end
  object idPersonLabel: TLabel
    Left = 112
    Top = 8
    Width = 3
    Height = 13
    Visible = False
  end
  object retiradaLabeledEdit: TLabeledEdit
    Left = 10
    Top = 74
    Width = 156
    Height = 21
    EditLabel.Width = 110
    EditLabel.Height = 13
    EditLabel.Caption = 'Quantia a ser retirada:'
    TabOrder = 1
  end
  object motivoComboBox: TComboBox
    Left = 8
    Top = 24
    Width = 156
    Height = 21
    TabOrder = 0
  end
  object dataDaRetiradaDatePicker: TDatePicker
    Left = 8
    Top = 120
    Width = 156
    Date = 43915.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object cancelarButton: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = cancelarButtonClick
  end
  object retirarButton: TButton
    Left = 89
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Retirar'
    TabOrder = 3
    OnClick = retirarButtonClick
  end
end
