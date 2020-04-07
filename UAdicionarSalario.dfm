object AdicionarSalarioForm: TAdicionarSalarioForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Fluxo de Gastos - Adicionar Sal'#225'rio'
  ClientHeight = 94
  ClientWidth = 177
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
  object idLabel: TLabel
    Left = 136
    Top = 8
    Width = 3
    Height = 13
    Visible = False
  end
  object salarioTotalLabeledEdit: TLabeledEdit
    Left = 8
    Top = 24
    Width = 156
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Sal'#225'rio:'
    TabOrder = 0
  end
  object cancelarButton: TButton
    Left = 8
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = cancelarButtonClick
  end
  object adicionarButton: TButton
    Left = 89
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = adicionarButtonClick
  end
end
