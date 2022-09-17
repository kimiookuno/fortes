object f_principal: Tf_principal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Projeto Avalia'#231#227'o - Fortes Tecnologia'
  ClientHeight = 249
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 12
    Top = 124
    Width = 39
    Height = 16
    Caption = 'Bomba'
  end
  object Label2: TLabel
    Left = 12
    Top = 90
    Width = 43
    Height = 16
    Caption = 'Tanque'
  end
  object Label4: TLabel
    Left = 12
    Top = 190
    Width = 30
    Height = 16
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 12
    Top = 220
    Width = 46
    Height = 16
    Caption = 'Imposto'
  end
  object Label6: TLabel
    Left = 12
    Top = 155
    Width = 31
    Height = 16
    Caption = 'Litros'
  end
  object Label3: TLabel
    Left = 12
    Top = 60
    Width = 26
    Height = 16
    Caption = 'Data'
  end
  object cb_bomba: TComboBox
    Left = 79
    Top = 121
    Width = 138
    Height = 24
    Style = csDropDownList
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object cb_tanque: TComboBox
    Left = 79
    Top = 87
    Width = 138
    Height = 24
    Style = csDropDownList
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object mk_valor: TMaskEdit
    Left = 79
    Top = 187
    Width = 138
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = ''
    OnExit = mk_valorExit
  end
  object mk_imposto: TMaskEdit
    Left = 79
    Top = 217
    Width = 138
    Height = 24
    CharCase = ecUpperCase
    Color = clMenu
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = ''
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 41
    Align = alTop
    Caption = 'POSTO ABC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object btn_gravar: TBitBtn
    Left = 240
    Top = 59
    Width = 105
    Height = 41
    Caption = 'Gravar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
      333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
      C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
      F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
      F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
      00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
      3333333373FF7333333333333000333333333333377733333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btn_gravarClick
  end
  object btn_fechar: TBitBtn
    Left = 240
    Top = 178
    Width = 105
    Height = 41
    Caption = 'Fechar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btn_fecharClick
  end
  object btn_relatorio: TBitBtn
    Left = 240
    Top = 106
    Width = 105
    Height = 41
    Caption = 'Relatorio'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btn_relatorioClick
  end
  object mk_litros: TMaskEdit
    Left = 79
    Top = 152
    Width = 138
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = ''
    OnExit = mk_valorExit
  end
  object cb_dtabastecimento: TDateTimePicker
    Left = 79
    Top = 52
    Width = 138
    Height = 24
    Date = 44819.947794965280000000
    Time = 44819.947794965280000000
    TabOrder = 0
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=D:\Fortes\DBPOSTO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 8
    Top = 6
  end
  object fd_posto: TFDQuery
    Connection = Connection
    Left = 168
    Top = 6
  end
  object fd_temp: TFDQuery
    Connection = Connection
    Left = 168
    Top = 54
  end
  object dsp_posto: TDataSetProvider
    DataSet = fd_posto
    Left = 112
    Top = 6
  end
  object dsp_temp: TDataSetProvider
    DataSet = fd_temp
    Left = 112
    Top = 54
  end
  object cds_posto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_posto'
    Left = 64
    Top = 6
  end
  object cds_temp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_temp'
    Left = 64
    Top = 54
  end
  object cds_aux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_aux'
    Left = 64
    Top = 110
  end
  object dsp_aux: TDataSetProvider
    DataSet = fd_aux
    Left = 112
    Top = 110
  end
  object fd_aux: TFDQuery
    Connection = Connection
    Left = 168
    Top = 110
  end
end
