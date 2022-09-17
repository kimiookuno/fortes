unit u_relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Datasnap.DBClient;

type
  Tf_relatorio = class(TForm)
    cds_relatorio: TClientDataSet;
    ds: TDataSource;
    cds_relatorioDTABASTECIMENTO: TDateField;
    cds_relatorioBOMBA: TStringField;
    cds_relatorioTANQUE: TStringField;
    cds_relatorioVALOR: TFloatField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand7: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel5: TRLLabel;
    RLGroup2: TRLGroup;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand5: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand6: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand8: TRLBand;
    RLBand3: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RLBand5AfterPrint(Sender: TObject);
    procedure RLBand6AfterPrint(Sender: TObject);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2AfterPrint(Sender: TObject);
    procedure RLBand7AfterPrint(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    mTOTAL, mTOTALBOMBA, mTOTALRELATORIO : Real;
  end;

var
  f_relatorio: Tf_relatorio;

implementation

{$R *.dfm}

procedure Tf_relatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cds_relatorio.Active := False;
  Action := caFree;
end;

procedure Tf_relatorio.FormCreate(Sender: TObject);
begin
  cds_relatorio.Active := False;
  cds_relatorio.CreateDataSet;
  cds_relatorio.EmptyDataSet;
  cds_relatorio.Active := True;

  mTOTAL := 0;
  mTOTALBOMBA := 0;
  mTOTALRELATORIO := 0;
end;

procedure Tf_relatorio.RLBand2AfterPrint(Sender: TObject);
begin
  mTOTALBOMBA := 0;
end;

procedure Tf_relatorio.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel11.Caption := 'R$ ' + FormatFloat('0.00', mTOTALRELATORIO);
end;

procedure Tf_relatorio.RLBand5AfterPrint(Sender: TObject);
begin
  mTOTAL := mTOTAL + cds_relatorio.FieldByName('VALOR').AsFloat;
end;

procedure Tf_relatorio.RLBand6AfterPrint(Sender: TObject);
begin
  mTOTALBOMBA := mTOTALBOMBA + mTOTAL;
  mTOTAL := 0;
end;

procedure Tf_relatorio.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel2.Caption := 'R$ ' + FormatFloat('0.00', mTOTAL);
end;

procedure Tf_relatorio.RLBand7AfterPrint(Sender: TObject);
begin
  mTOTALRELATORIO := mTOTALRELATORIO + mTOTALBOMBA;
end;

procedure Tf_relatorio.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel3.Caption := 'R$ ' + FormatFloat('0.00', mTOTALBOMBA);
end;

end.
