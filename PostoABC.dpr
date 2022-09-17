program PostoABC;

uses
  Vcl.Forms,
  u_principal in 'u_principal.pas' {f_principal},
  u_relatorio in 'u_relatorio.pas' {f_relatorio},
  u_relatorioperiodo in 'u_relatorioperiodo.pas' {f_relatorioperiodo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tf_principal, f_principal);
  Application.Run;
end.
