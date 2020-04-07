unit URegistrarEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.StdCtrls,
  FireDAC.Comp.Client,
  Vcl.ExtCtrls;

type
  TRegistrarEntradaForm = class(TForm)
    Label2: TLabel;
    entradaLabeledEdit: TLabeledEdit;
    cancelarButton: TButton;
    entrarButton: TButton;
    dataDaEntradaDatePicker: TDatePicker;
    idPersonLabel: TLabel;
    procedure cancelarButtonClick(Sender: TObject);
    procedure entrarButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrarEntradaForm: TRegistrarEntradaForm;

implementation

{$R *.dfm}

uses UInicio, URegistrarEntradaDataModule;

procedure TRegistrarEntradaForm.cancelarButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TRegistrarEntradaForm.entrarButtonClick(Sender: TObject);
var
  query: TFDQuery;
  idPerson: integer;
  entrada: double;
  sqlRegistrarEntrada, sqlGetAccountId: string;
begin
  try
    entrada := double.Parse(entradaLabeledEdit.Text);
  except
    on E: Exception do
    begin
      ShowMessage('A entrada precisa ser um número');
      exit;
    end;
  end;
  idPerson := StrToInt(idPersonLabel.Caption);
  query := URegistrarEntradaDataModule.RegistrarEntradaDataModule.
    RegistrarEntradaQuery;
  sqlRegistrarEntrada :=
    'INSERT INTO Entries (IDPerson, Quantidade, DataDaEntrada)' +
    ' VALUES (:pIdPerson, :pQuantidade, :pDataDaEntrada);';
  query.SQL.Clear;
  query.Close;
  query.SQL.Add(sqlRegistrarEntrada);
  query.ParamByName('pIdPerson').AsInteger := idPerson;
  query.ParamByName('pQuantidade').AsFloat :=
    StrToFloat(entradaLabeledEdit.Text);
  query.ParamByName('pDataDaEntrada').AsDate := dataDaEntradaDatePicker.Date;
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
  entradaLabeledEdit.Clear;
  Close;
end;

end.
