program FluxoDeGastos;

uses
  Vcl.Forms,
  UEntrar in 'UEntrar.pas' {LoginForm},
  UCadastro in 'UCadastro.pas' {CadastroForm},
  UInicio in 'UInicio.pas' {InicioForm},
  UCadastroDataModule in 'UCadastroDataModule.pas' {CadastroDataModule: TDataModule},
  UEntrarDataModule in 'UEntrarDataModule.pas' {EntrarDataModule: TDataModule},
  UInicioDataModule in 'UInicioDataModule.pas' {InicioDataModule: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  UAdicionarSalario in 'UAdicionarSalario.pas' {AdicionarSalarioForm},
  UAdicionarSalarioDataModule in 'UAdicionarSalarioDataModule.pas' {AdicionarSalarioDataModule: TDataModule},
  URegistrarSaida in 'URegistrarSaida.pas' {RegistrarSaidaForm},
  URegistrarSaidaDataModule in 'URegistrarSaidaDataModule.pas' {RegistrarSaidaDataModule: TDataModule},
  URegistrarEntrada in 'URegistrarEntrada.pas' {RegistrarEntradaForm},
  URegistrarEntradaDataModule in 'URegistrarEntradaDataModule.pas' {RegistrarEntradaDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCadastroForm, CadastroForm);
  Application.CreateForm(TInicioForm, InicioForm);
  Application.CreateForm(TCadastroDataModule, CadastroDataModule);
  Application.CreateForm(TEntrarDataModule, EntrarDataModule);
  Application.CreateForm(TInicioDataModule, InicioDataModule);
  Application.CreateForm(TAdicionarSalarioForm, AdicionarSalarioForm);
  Application.CreateForm(TAdicionarSalarioDataModule, AdicionarSalarioDataModule);
  Application.CreateForm(TRegistrarSaidaForm, RegistrarSaidaForm);
  Application.CreateForm(TRegistrarSaidaDataModule, RegistrarSaidaDataModule);
  Application.CreateForm(TRegistrarEntradaForm, RegistrarEntradaForm);
  Application.CreateForm(TRegistrarEntradaDataModule, RegistrarEntradaDataModule);
  Application.Run;
end.
