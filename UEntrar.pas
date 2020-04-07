unit UEntrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, JvExStdCtrls,
  JvBehaviorLabel;

type
  TLoginForm = class(TForm)
    JvBehaviorLabel1: TJvBehaviorLabel;
    usuarioLabeledEdit: TLabeledEdit;
    senhaLabeledEdit: TLabeledEdit;
    entrarButton: TButton;
    cadastrarButton: TButton;
    procedure cadastrarButtonClick(Sender: TObject);
    procedure entrarButtonClick(Sender: TObject);
    procedure limparCampos();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses UCadastro, UInicio, UEntrarDataModule;

procedure TLoginForm.cadastrarButtonClick(Sender: TObject);
begin
  Hide;
  UCadastro.CadastroForm.Show;
end;

procedure TLoginForm.entrarButtonClick(Sender: TObject);
var
  sql, sqlGetAccountId: string;
  query: TFDQuery;
  id : integer;
begin
  if (usuarioLabeledEdit.Text = '') OR (senhaLabeledEdit.Text = '') then
  begin
    ShowMessage('Ambos os campos precisam ser preenchidos.');
    exit;
  end;
  try
    query := UEntrarDataModule.EntrarDataModule.ValidateLoginQuery;
    query.Close;
    query.sql.Clear;
    sql := 'SELECT ID FROM Accounts WHERE Username = :pUsername AND `Password` = :pPassword';
    query.sql.Add(sql);
    query.ParamByName('pUsername').AsString := usuarioLabeledEdit.Text;
    query.ParamByName('pPassword').AsString := senhaLabeledEdit.Text;
    query.Open;
    if query.IsEmpty then
    begin
      ShowMessage('Usuário ou senha incorreto.');
      exit;
    end;
    sqlGetAccountId :=
      'SELECT a.ID FROM Persons p'
      + ' INNER JOIN Accounts a ON p.IDAccount = a.ID WHERE a.Username = :pUsername';
    query.sql.Clear;
    query.sql.Add(sqlGetAccountId);
    query.ParamByName('pUsername').AsString := usuarioLabeledEdit.Text;
    query.Open;
    id := query.FieldByName('ID').AsInteger;
    UInicio.InicioForm.loadForm(id);
    limparCampos;
    Hide;
    UInicio.InicioForm.Show;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TLoginForm.limparCampos;
begin
  usuarioLabeledEdit.Clear;
  senhaLabeledEdit.Clear;
end;

end.
