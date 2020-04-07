unit UInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Comp.Client;

type
  TInicioForm = class(TForm)
    totalSalaryLabel: TLabel;
    addedMoneyLabel: TLabel;
    withdrawMoneyLabel: TLabel;
    totalMoneyLabel: TLabel;
    lastSpendingLabel: TLabel;
    Label2: TLabel;
    greetingsLabel: TLabel;
    Panel1: TPanel;
    lastSpendingsDBGrid: TDBGrid;
    addSalaryButton: TButton;
    withdrawButton: TButton;
    addEntryButton: TButton;
    Button1: TButton;
    Panel2: TPanel;
    lastAddedDBGrid: TDBGrid;
    idPersonLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure loadForm(idAccount: integer);
    procedure addSalaryButtonClick(Sender: TObject);
    procedure withdrawButtonClick(Sender: TObject);
    procedure addEntryButtonClick(Sender: TObject);
  private
    { Private declarations }
    function loadPerson(idAccount: integer): integer;
    function loadWithdraws(idPerson: integer): double;
    function loadEntries(idPerson: integer): double;
  public
    { Public declarations }
  end;

var
  InicioForm: TInicioForm;

implementation

{$R *.dfm}

uses UEntrar, UInicioDataModule, UAdicionarSalario, URegistrarSaida,
  URegistrarEntrada;

procedure TInicioForm.addEntryButtonClick(Sender: TObject);
begin
  URegistrarEntrada.RegistrarEntradaForm.idPersonLabel.Caption := idPersonLabel.Caption;
  URegistrarEntrada.RegistrarEntradaForm.Show;
end;

procedure TInicioForm.addSalaryButtonClick(Sender: TObject);
begin
  UAdicionarSalario.AdicionarSalarioForm.idLabel.Caption := idPersonLabel.Caption;
  UAdicionarSalario.AdicionarSalarioForm.Show;
end;

procedure TInicioForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TInicioForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UEntrar.LoginForm.Show;
end;

function TInicioForm.loadEntries(idPerson: integer): double;
var
  entryQuery : TFDQuery;
  sqlGetEntry, SqlGetAllEntries : string;
  totalEntries : double;
begin
  entryQuery := UInicioDataModule.InicioDataModule.EntryQuery;
  entryQuery.SQL.Clear;
  entryQuery.Close;
  sqlGetEntry :=
    'SELECT Sum(Quantidade) FROM Entries WHERE IDPerson = :pIdPerson; ';
  entryQuery.SQL.Add(sqlGetEntry);
  entryQuery.ParamByName('pIdPerson').AsInteger := idPerson;
  entryQuery.Open;
  totalEntries := entryQuery.FieldByName('Sum(Quantidade)').AsFloat;
  addedMoneyLabel.Caption := 'Entradas: +R$ ' + FloatToStr(totalEntries);

  entryQuery.SQL.Clear;
  entryQuery.Close;
  SqlGetAllEntries :=
    'SELECT Quantidade, DataDaEntrada FROM Entries WHERE IDPerson = :pIdPerson; ';
  entryQuery.SQL.Add(SqlGetAllEntries);
  entryQuery.ParamByName('pIdPerson').AsInteger := idPerson;
  entryQuery.Open;
  lastAddedDBGrid.Columns[0].Width := 65;

  Result := totalEntries;
end;

procedure TInicioForm.loadForm(idAccount: integer);
var
  idPerson: integer;
  withdraw, added, totalSalary: double;
  totalSalaryRaw : string;
begin
  idPerson := loadPerson(idAccount);
  withdraw := loadWithdraws(idPerson);
  added := loadEntries(idPerson);
  totalSalaryRaw := totalSalaryLabel.Caption;
  totalSalary := StrToFloat(totalSalaryRaw.Split([' '])[2]);
  totalMoneyLabel.Caption := 'Total R$ ' + FloatToStr(totalSalary + added - withdraw);
  idPersonLabel.Caption := IntToStr(idPerson);
end;

function TInicioForm.loadPerson(idAccount: integer): integer;
var
  idPerson: integer;
  personQuery: TFDQuery;
  nome, sqlGetPerson: string;
  totalSalary: double;
begin
  personQuery := UInicioDataModule.InicioDataModule.PersonsQuery;
  sqlGetPerson :=
    'SELECT ID, Nome, SalarioTotal FROM Persons WHERE IDAccount = :pIdAccount; ';
  personQuery.SQL.Clear;
  personQuery.Close;
  personQuery.SQL.Add(sqlGetPerson);
  personQuery.ParamByName('pIdAccount').AsInteger := idAccount;
  personQuery.Open;
  nome := personQuery.FieldByName('Nome').AsString;
  totalSalary := personQuery.FieldByName('SalarioTotal').AsFloat;
  idPerson := personQuery.FieldByName('ID').AsInteger;
  greetingsLabel.Caption := 'Bem vindo ' + nome +
    ' e esse é o seu controle de gastos!';
  totalSalaryLabel.Caption := 'Salário: R$ ' + FloatToStr(totalSalary);
  Result := idPerson;
end;

function TInicioForm.loadWithdraws(idPerson: integer): double;
var
  withdrawQuery: TFDQuery;
  totalWithdraw: double;
  sqlGetAllWithdraw, sqlGetWithdraw: string;
begin
  withdrawQuery := UInicioDataModule.InicioDataModule.withdrawQuery;
  withdrawQuery.SQL.Clear;
  withdrawQuery.Close;
  sqlGetWithdraw :=
    'SELECT Sum(Quantidade) FROM Withdraws WHERE IDPerson = :pIdPerson; ';
  withdrawQuery.SQL.Add(sqlGetWithdraw);
  withdrawQuery.ParamByName('pIdPerson').AsInteger := idPerson;
  withdrawQuery.Open;
  totalWithdraw := withdrawQuery.FieldByName('Sum(Quantidade)').AsFloat;
  withdrawMoneyLabel.Caption := 'Retiradas -R$ ' + FloatToStr(totalWithdraw);

  withdrawQuery.SQL.Clear;
  withdrawQuery.Close;
  sqlGetAllWithdraw :=
    'SELECT r.Nome as Motivo, w.Quantidade, w.DataDaRetirada FROM Withdraws w INNER JOIN '
    +'Reasons r ON w.IDMotivo = r.ID WHERE w.IDPerson = :pIdPerson;';
  withdrawQuery.SQL.Add(sqlGetAllWithdraw);
  withdrawQuery.ParamByName('pIdPerson').AsInteger := idPerson;
  withdrawQuery.Open;
  lastSpendingsDBGrid.Columns[0].Width := 65;
  lastSpendingsDBGrid.Columns[1].Width := 65;

  Result := totalWithdraw;
end;

procedure TInicioForm.withdrawButtonClick(Sender: TObject);
begin
  URegistrarSaida.RegistrarSaidaForm.idPersonLabel.Caption := idPersonLabel.Caption;
  URegistrarSaida.RegistrarSaidaForm.Show;
end;

end.
