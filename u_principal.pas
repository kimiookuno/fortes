unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.DataSet, Vcl.Buttons, Vcl.ExtCtrls;

type
  TBomba = class
    cdregistro : Integer;
    cdbomba : Integer;
    cdtanque : Integer;
    data : tDate;
    litros : Real;
    valor : Real;
    imposto : Real;
  end;

  Tf_principal = class(TForm)
    Connection: TFDConnection;
    fd_posto: TFDQuery;
    fd_temp: TFDQuery;
    dsp_posto: TDataSetProvider;
    dsp_temp: TDataSetProvider;
    cds_posto: TClientDataSet;
    cds_temp: TClientDataSet;
    Label1: TLabel;
    cb_bomba: TComboBox;
    Label2: TLabel;
    cb_tanque: TComboBox;
    Label4: TLabel;
    mk_valor: TMaskEdit;
    Label5: TLabel;
    mk_imposto: TMaskEdit;
    Panel1: TPanel;
    btn_gravar: TBitBtn;
    btn_fechar: TBitBtn;
    cds_aux: TClientDataSet;
    dsp_aux: TDataSetProvider;
    fd_aux: TFDQuery;
    btn_relatorio: TBitBtn;
    mk_litros: TMaskEdit;
    Label6: TLabel;
    Label3: TLabel;
    cb_dtabastecimento: TDateTimePicker;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mk_valorExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_relatorioClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos;
    procedure PreencheBomba;
    procedure PreencheTanque;
    procedure GravaRegistro(bomba : tBomba);
  public
    { Public declarations }
    function muda_virgula(cadeia: String) : string;
  end;

var
  f_principal: Tf_principal;

implementation

{$R *.dfm}

uses u_relatorio, u_relatorioperiodo;

procedure Tf_principal.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tf_principal.btn_gravarClick(Sender: TObject);
var
  mCdRegistro, mCdBomba, mCdTanque : Integer;
  mBomba : TBomba;
begin
  if (Trim(cb_bomba.Text) <> '') and (Trim(cb_tanque.Text) <> '') and (Trim(mk_valor.Text) <> '') then
    begin
      cds_aux.Active := False;
      fd_aux.SQL.Text := 'select max(cdregistro) as maxcdregistro from registro';
      cds_aux.Active := True;
      if Trim(cds_aux.FieldByName('maxcdregistro').AsString) <> '' then
        mCdRegistro := cds_aux.FieldByName('maxcdregistro').AsInteger + 1
      else
        mCdRegistro := 0;

      cds_aux.Active := False;
      fd_aux.SQL.Text := 'select * from bomba where descrbomba = :mdescrbomba';
      fd_aux.ParamByName('mdescrbomba').Value := Trim(cb_bomba.Text);
      cds_aux.Active := True;
      if Trim(cds_aux.FieldByName('cdbomba').AsString) <> '' then
        mCdBomba := cds_aux.FieldByName('cdbomba').AsInteger
      else
        mCdBomba := 0;

      cds_aux.Active := False;
      fd_aux.SQL.Text := 'select * from tanque where descrtanque = :mdescrtanque';
      fd_aux.ParamByName('mdescrtanque').Value := Trim(cb_tanque.Text);
      cds_aux.Active := True;
      if Trim(cds_aux.FieldByName('cdtanque').AsString) <> '' then
        mCdTanque := cds_aux.FieldByName('cdtanque').AsInteger
      else
        mCdTanque := 0;

      mBomba := TBomba.Create;
      mBomba.cdregistro := mCdRegistro;
      mBomba.cdbomba := mCdBomba;
      mBomba.cdtanque := mCdTanque;
      mBomba.data := cb_dtabastecimento.Date;
      mBomba.litros := StrToFloat(mk_litros.Text);
      mBomba.valor := StrToFloat(mk_valor.Text);
      mBomba.imposto := StrToFloat(mk_imposto.Text);

      GravaRegistro(mBomba);
      Application.MessageBox('Registro gravado !!!', 'Atenção!', MB_ICONEXCLAMATION);

      LimpaCampos;
      cb_tanque.SetFocus;
    end;
end;

procedure Tf_principal.btn_relatorioClick(Sender: TObject);
begin
  Application.CreateForm(tf_relatorioperiodo, f_relatorioperiodo);
  f_relatorioperiodo.ShowModal;
  f_relatorioperiodo.Free;
end;

procedure Tf_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Connection.Connected := False;
end;

procedure Tf_principal.FormCreate(Sender: TObject);
begin
  PreencheBomba;
  PreencheTanque;
end;

procedure Tf_principal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure Tf_principal.FormShow(Sender: TObject);
begin
  cb_dtabastecimento.Date := now;
  cb_dtabastecimento.SetFocus;
end;

procedure Tf_principal.GravaRegistro(bomba : tBomba);
var
  mBomba, mTanque : Integer;
begin
  cds_temp.Active := False;
  fd_temp.SQL.Text := 'Insert Into Registro (cdregistro, cdtanque, cdbomba, dtabastecimento, litros, valor, imposto) values ' +
                      '(:mcdregistro, :mcdtanque, :mcdbomba, :mdtabastecimento, ' +
                      muda_virgula(FloatToStr(bomba.litros)) + ', ' +
                      muda_virgula(FloatToStr(bomba.valor)) + ', ' +
                      muda_virgula(FloatToStr(bomba.imposto)) + ')';
  fd_temp.ParamByName('mcdregistro').Value := bomba.cdregistro;
  fd_temp.ParamByName('mcdtanque').Value := bomba.cdtanque;
  fd_temp.ParamByName('mcdbomba').Value := bomba.cdbomba;
  fd_temp.ParamByName('mdtabastecimento').Value := FormatDateTime('mm/dd/yyyy' ,bomba.data);
  fd_temp.Execute;
end;

procedure Tf_principal.LimpaCampos;
var
  i : Integer;
begin
//Contador que verifica todos os componentes do Form
  for i := 0 to ComponentCount - 1 do
    begin
      //Verifica se o objeto é do tipo ComboBox
      if (Components[i] is TComboBox) then
        (Components[i] as TComboBox).ItemIndex := -1;
      //Verifica se o objeto é do tipo MaskEdit
      if (Components[i] is TMaskEdit) then
        (Components[i] as TMaskEdit).Clear;
    end;
end;

procedure Tf_principal.mk_valorExit(Sender: TObject);
begin
  if Trim(mk_valor.Text) <> '' then
    mk_imposto.Text := FormatFloat('0.00', StrToFloat(mk_valor.Text) * 0.13)
  else
    mk_imposto.Clear;
end;

function Tf_principal.muda_virgula(cadeia: String): string;
begin
  if pos(',',cadeia) > 0 then
     result:=copy(cadeia,1,pos(',',cadeia)-1)+'.'+
             copy(cadeia,pos(',',cadeia)+1,length(cadeia) + 1)
  else
     result:=cadeia;
end;

procedure Tf_principal.PreencheBomba;
begin
  cb_bomba.Clear;
  cds_temp.Active := False;
  fd_temp.SQL.Text := 'select * from Bomba order by DescrBomba';
  cds_temp.Active := True;

  cds_temp.First;
  while not cds_temp.Eof do
    begin
      cb_bomba.Items.Add(Trim(cds_temp.FieldByName('DESCRBOMBA').AsString));
      cds_temp.Next;
    end;
  cds_temp.Active := False;
end;

procedure Tf_principal.PreencheTanque;
begin
  cb_tanque.Clear;
  cds_temp.Active := False;
  fd_temp.SQL.Text := 'select * from Tanque order by DescrTanque';
  cds_temp.Active := True;

  cds_temp.First;
  while not cds_temp.Eof do
    begin
      cb_tanque.Items.Add(Trim(cds_temp.FieldByName('DESCRTANQUE').AsString));
      cds_temp.Next;
    end;
  cds_temp.Active := False;
end;

end.
