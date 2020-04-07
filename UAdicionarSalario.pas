unit UAdicionarSalario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.Client;

type
  TAdicionarSalarioForm = class(TForm)
    salarioTotalLabeledEdit: TLabeledEdit;
    cancelarButton: TButton;
    adicionarButton: TButton;
    idLabel: TLabel;
    procedure cancelarButtonClick(Sender: TObject);
    procedure adicionarButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdicionarSalarioForm: TAdicionarSalarioForm;

implementation

{$R *.dfm}

uses UAdicionarSalarioDataModule, UInicio;

procedure TAdicionarSalarioForm.adicionarButtonClick(Sender: TObject);
var
  query: TFDQuery;
  idPerson, idAccount: integer;
  sqlAdicionarSalario, sqlGetAccountId: string;
  salario: double;
begin
  try
    salario := double.Parse(salarioTotalLabeledEdit.Text);
  except
    on E: Exception do
    begin
      ShowMessage('O salário precisa ser um número');
      exit;
    end;
  end;
  query := UAdicionarSalarioDataModule.AdicionarSalarioDataModule.
    AdicionarSalarioQuery;
  idPerson := StrToInt(idLabel.Caption);
  sqlAdicionarSalario :=
    'UPDATE Persons SET SalarioTotal = :pSalarioTotal WHERE ID = :pIdPerson; ';
  query.SQL.Clear;
  query.Close;
  query.SQL.Add(sqlAdicionarSalario);
  query.ParamByName('pSalarioTotal').AsFloat :=
    StrToFloat(salarioTotalLabeledEdit.Text);
  query.ParamByName('pIdPerson').AsInteger := idPerson;
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
  salarioTotalLabeledEdit.Clear;
  Close;

end;

procedure TAdicionarSalarioForm.cancelarButtonClick(Sender: TObject);
begin
  Close;
end;

end.
