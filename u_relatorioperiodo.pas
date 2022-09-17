unit u_relatorioperiodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  Tf_relatorioperiodo = class(TForm)
    GroupBox1: TGroupBox;
    cb_dataini: TDateTimePicker;
    cb_datafin: TDateTimePicker;
    Label1: TLabel;
    btn_relatorio: TBitBtn;
    btn_fechar: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_relatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_relatorioperiodo: Tf_relatorioperiodo;

implementation

{$R *.dfm}

uses u_relatorio, u_principal;

procedure Tf_relatorioperiodo.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tf_relatorioperiodo.btn_relatorioClick(Sender: TObject);
begin
  Application.CreateForm(tf_relatorio, f_relatorio);
  f_principal.cds_temp.Active := False;
  f_principal.fd_temp.SQL.Text := 'select * from REGISTRO ' +
                      'join BOMBA on REGISTRO.CDBOMBA = BOMBA.CDBOMBA ' +
                      'join TANQUE on REGISTRO.CDTANQUE = TANQUE.CDTANQUE ' +
                      'where DTABASTECIMENTO between ''' +
                      FormatDateTime('mm/dd/yyyy', cb_dataini.Date) + ''' and  ''' + FormatDateTime('mm/dd/yyyy', cb_datafin.Date) + ''' ' +
                      'Order by DESCRTANQUE, DESCRBOMBA, DTABASTECIMENTO';
  f_principal.cds_temp.Active := True;

  if f_principal.cds_temp.RecordCount <> 0 then
    f_principal.cds_temp.First;

  while not f_principal.cds_temp.Eof do
    begin
      f_relatorio.cds_relatorio.Append;
      f_relatorio.cds_relatorio.FieldByName('DTABASTECIMENTO').Value := FormatDateTime('dd/mm/yyyy', f_principal.cds_temp.FieldByName('DTABASTECIMENTO').AsDateTime);
      f_relatorio.cds_relatorio.FieldByName('DESCRBOMBA').Value := Trim(f_principal.cds_temp.FieldByName('DESCRBOMBA').AsString);
      f_relatorio.cds_relatorio.FieldByName('DESCRTANQUE').Value := Trim(f_principal.cds_temp.FieldByName('DESCRTANQUE').AsString);
      f_relatorio.cds_relatorio.FieldByName('VALOR').Value := f_principal.cds_temp.FieldByName('VALOR').AsString;
      f_relatorio.cds_relatorio.Post;
      f_principal.cds_temp.Next;
    end;

  f_relatorio.RLReport1.Preview;

  f_principal.cds_temp.Active := False;
end;

procedure Tf_relatorioperiodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tf_relatorioperiodo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure Tf_relatorioperiodo.FormShow(Sender: TObject);
begin
  cb_dataini.Date := StrToDate('15/09/2022');
  cb_datafin.Date := StrToDate('16/09/2022');
end;

end.
