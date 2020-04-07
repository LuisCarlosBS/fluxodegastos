unit URegistrarSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers,
  FireDAC.Comp.Client,
  Vcl.ExtCtrls;

type
  TRegistrarSaidaForm = class(TForm)
    retiradaLabeledEdit: TLabeledEdit;
    motivoComboBox: TComboBox;
    Label1: TLabel;
    dataDaRetiradaDatePicker: TDatePicker;
    Label2: TLabel;
    cancelarButton: TButton;
    retirarButton: TButton;
    idPersonLabel: TLabel;
    procedure cancelarButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure retirarButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrarSaidaForm: TRegistrarSaidaForm;

implementation

{$R *.dfm}

uses URegistrarSaidaDataModule, UInicio;

procedure TRegistrarSaidaForm.cancelarButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TRegistrarSaidaForm.retirarButtonClick(Sender: TObject);
var
  query: TFDQuery;
  sqlRegistrarSaida, sqlGetIdMotivo, sqlGetAccountId: string;
  idMotivo, idPerson: integer;
  retirada: double;
begin
  try
    retirada := double.Parse(retiradaLabeledEdit.Text);
  except
    on E: Exception do
    begin
      ShowMessage('A retirada precisa ser um número');
      exit;
    end;
  end;
  if (motivoComboBox.Text = '') OR (retiradaLabeledEdit.Text = '') then
  begin
    ShowMessage('Todos os campos precisam estar preenchidos.');
    exit;
  end;
  idPerson := StrToInt(idPersonLabel.Caption);
  query := URegistrarSaidaDataModule.RegistrarSaidaDataModule.
    RegistrarSaidaQuery;
  query.SQL.Clear;
  query.Close;
  sqlGetIdMotivo := 'SELECT ID FROM Reasons WHERE Nome = :pNome;';
  query.SQL.Add(sqlGetIdMotivo);
  query.ParamByName('pNome').AsString := motivoComboBox.Text;
  query.Open;
  idMotivo := query.FieldByName('ID').AsInteger;

  sqlRegistrarSaida :=
    'INSERT INTO Withdraws (IDPerson, IDMotivo, Quantidade, DataDaRetirada)' +
    ' VALUES (:pIdPerson, :pIdMotivo, :pQuantidade, :pDataDaRetirada);';
  query.SQL.Clear;
  query.Close;
  query.SQL.Add(sqlRegistrarSaida);
  query.ParamByName('pIdPerson').AsInteger := idPerson;
  query.ParamByName('pIdMotivo').AsInteger := idMotivo;
  query.ParamByName('pQuantidade').AsFloat :=
    StrToFloat(retiradaLabeledEdit.Text);
  query.ParamByName('pDataDaRetirada').AsDate := dataDaRetiradaDatePicker.Date;
  query.ExecSQL;
  query.Close;

  sqlGetAccountId := 'SELECT IDAccount FROM Persons WHERE ID = :pId ';
  query.SQL.Clear;
  query.Close;
  query.SQL.Add(sqlGetAccountId);
  query.ParamByName('pId').AsInteger := idPerson;
  query.Open;
  UInicio.InicioForm.loadForm(query.FieldByName('IDAccount').AsInteger);
  query.Close;
  retiradaLabeledEdit.Clear;
  motivoComboBox.Clear;
  Close;
end;

procedure TRegistrarSaidaForm.FormShow(Sender: TObject);
var
  query: TFDQuery;
  sqlGetMotivos: string;
begin
  query := URegistrarSaidaDataModule.RegistrarSaidaDataModule.
    RegistrarSaidaQuery;
  sqlGetMotivos := 'SELECT Nome FROM Reasons';
  query.SQL.Clear;
  query.Close;
  query.SQL.Add(sqlGetMotivos);
  query.Open;
  while not query.Eof do
  begin
    motivoComboBox.Items.Add(query.Fields.Fields[0].AsString);
    query.Next;
  end;
  query.Close;
end;

end.
