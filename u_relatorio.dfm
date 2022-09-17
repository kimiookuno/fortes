object f_relatorio: Tf_relatorio
  Left = 0
  Top = 0
  Caption = 'f_relatorio'
  ClientHeight = 392
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 8
    Width = 794
    Height = 1123
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 32
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 3
        Top = 3
        Width = 194
        Height = 23
        Caption = 'Relat'#243'rio  Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSkyBlue
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 5
        Top = 5
        Width = 194
        Height = 23
        Caption = 'Relat'#243'rio  Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 70
      Width = 718
      Height = 113
      DataFields = 'DESCRTANQUE'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        BandType = btHeader
        AfterPrint = RLBand2AfterPrint
        object RLDBText2: TRLDBText
          Left = 73
          Top = 0
          Width = 101
          Height = 16
          DataField = 'DESCRTANQUE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 12
          Top = 0
          Width = 60
          Height = 16
          Caption = 'Tanque :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 74
        Width = 718
        Height = 20
        BandType = btFooter
        AfterPrint = RLBand7AfterPrint
        BeforePrint = RLBand7BeforePrint
        object RLLabel9: TRLLabel
          Left = 507
          Top = 1
          Width = 96
          Height = 16
          Caption = 'Total Tanque :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 605
          Top = 1
          Width = 64
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLGroup2: TRLGroup
        Left = 0
        Top = 19
        Width = 718
        Height = 55
        DataFields = 'DESCRBOMBA'
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          BandType = btHeader
          object RLLabel4: TRLLabel
            Left = 38
            Top = 2
            Width = 57
            Height = 16
            Caption = 'Bomba :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 97
            Top = 2
            Width = 96
            Height = 16
            DataField = 'DESCRBOMBA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 18
          Width = 718
          Height = 18
          AfterPrint = RLBand5AfterPrint
          object RLDBText3: TRLDBText
            Left = 605
            Top = 0
            Width = 48
            Height = 16
            DataField = 'VALOR'
            DataSource = ds
            DisplayMask = 'R$ 0.00'
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 192
            Top = 1
            Width = 130
            Height = 16
            DataField = 'DTABASTECIMENTO'
            DataSource = ds
            Text = ''
          end
          object RLLabel6: TRLLabel
            Left = 50
            Top = 0
            Width = 139
            Height = 16
            Caption = 'Data Abastecimento :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 557
            Top = 0
            Width = 46
            Height = 16
            Caption = 'Valor :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 36
          Width = 718
          Height = 19
          BandType = btFooter
          AfterPrint = RLBand6AfterPrint
          BeforePrint = RLBand6BeforePrint
          object RLLabel2: TRLLabel
            Left = 605
            Top = 2
            Width = 64
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 510
            Top = 2
            Width = 93
            Height = 16
            Caption = 'Total Bomba :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 94
        Width = 718
        Height = 20
        BandType = btFooter
        BeforePrint = RLBand3BeforePrint
        object RLLabel10: TRLLabel
          Left = 497
          Top = 3
          Width = 106
          Height = 16
          Caption = 'Total Relat'#243'rio :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 605
          Top = 3
          Width = 71
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 183
      Width = 718
      Height = 26
      BandType = btSummary
    end
  end
  object cds_relatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 160
    object cds_relatorioDTABASTECIMENTO: TDateField
      FieldName = 'DTABASTECIMENTO'
    end
    object cds_relatorioBOMBA: TStringField
      FieldName = 'DESCRBOMBA'
    end
    object cds_relatorioTANQUE: TStringField
      FieldName = 'DESCRTANQUE'
    end
    object cds_relatorioVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object ds: TDataSource
    DataSet = cds_relatorio
    Left = 168
    Top = 160
  end
end
