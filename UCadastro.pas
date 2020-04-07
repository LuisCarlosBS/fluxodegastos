unit UCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Comp.Client;

type
  TCadastroForm = class(TForm)
    SpeedButton1: TSpeedButton;
    usernameLabeledEdit: TLabeledEdit;
    passwordLabeledEdit: TLabeledEdit;
    nameLabeledEdit: TLabeledEdit;
    cadastrarButton: TButton;
    cancelarButton: TButton;
    repeatedPasswordLabeledEdit: TLabeledEdit;
    procedure cadastrarButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure limparCampos();
    procedure cancelarButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroForm: TCadastroForm;

implementation

{$R *.dfm}

uses UEntrar, UCadastroDataModule;

procedure TCadastroForm.cadastrarButtonClick(Sender: TObject);
var
  sql, sqlGetId, sqlCreatePerson, sqlValidateUsername: string;
  query: TFDQuery;
  id: integer;
begin
  if (usernameLabeledEdit.Text = '') OR (passwordLabeledEdit.Text = '') OR
    (repeatedPasswordLabeledEdit.Text = '') OR (nameLabeledEdit.Text = '') then
  begin
    ShowMessage('Todos os campos precisam estar preenchidos');
    exit;
  end;

  if not(passwordLabeledEdit.Text = repeatedPasswordLabeledEdit.Text) then
  begin
    ShowMessage('Ambas as senhas precisam ser iguais');
    exit;
  end;

  query := UCadastroDataModule.CadastroDataModule.CadastroQuery;
  query.Close;
  query.sql.Clear;
  sqlValidateUsername := 'SELECT ID FROM Accounts WHERE Username = :pUsername';
  query.sql.Add(sqlValidateUsername);
  query.ParamByName('pUsername').AsString := usernameLabeledEdit.Text;
  query.Open;
  if not query.IsEmpty then
  begin
    ShowMessage('Esse usuário ja existe.');
    exit;
  end;

  try
    query.Close;
    query.sql.Clear;
    sql := 'INSERT INTO Accounts (Username, Password) VALUES (:pUsername, :pPassword); ';
    sqlGetId := 'SELECT LAST_INSERT_ID(); ';
    sqlCreatePerson :=
      'INSERT INTO Persons (IDAccount, Nome) VALUES (:pId, :pNome); ';
    query.sql.Add(sql);
    query.ParamByName('pUsername').AsString := usernameLabeledEdit.Text;
    query.ParamByName('pPassword').AsString := passwordLabeledEdit.Text;
    query.sql.Add(sqlGetId);
    query.Open;
    id := query.FieldByName('LAST_INSERT_ID()').AsInteger;
    query.sql.Clear;
    query.sql.Add(sqlCreatePerson);
    query.ParamByName('pId').AsInteger := id;
    query.ParamByName('pNome').AsString := nameLabeledEdit.Text;
    query.ExecSQL;
    query.Close;
    ShowMessage('Cadastro realizado com sucesso!');
    limparCampos;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cadastrar');
      query.Close;
    end;
  end;
end;

procedure TCadastroForm.cancelarButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TCadastroForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  limparCampos;
  UEntrar.LoginForm.Show;
end;

procedure TCadastroForm.limparCampos;
begin
  usernameLabeledEdit.Clear;
  passwordLabeledEdit.Clear;
  repeatedPasswordLabeledEdit.Clear;
  nameLabeledEdit.Clear;
end;

procedure TCadastroForm.SpeedButton1Click(Sender: TObject);
begin
  if passwordLabeledEdit.PasswordChar = #0 then
  begin
    passwordLabeledEdit.PasswordChar := '*';
  end
  else
  begin
    passwordLabeledEdit.PasswordChar := #0;
  end;
end;

end.
