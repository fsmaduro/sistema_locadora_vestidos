object frmMalaDireta: TfrmMalaDireta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Mala Direta'
  ClientHeight = 181
  ClientWidth = 402
  Color = 16312551
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    Color = 16312551
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      402
      177)
    object Label15: TLabel
      Left = 2
      Top = 2
      Width = 65
      Height = 13
      Caption = 'Tipo de Perfil:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label45: TLabel
      Left = 244
      Top = 2
      Width = 33
      Height = 13
      Caption = 'Status:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 2
      Top = 63
      Width = 218
      Height = 13
      Caption = 'Mensagem:  @@PERFIL@@ = Nome do Perfil'
    end
    object cbTipoPerfil: TRxDBLookupCombo
      Left = 2
      Top = 15
      Width = 236
      Height = 21
      DropDownCount = 5
      Color = 16644087
      DisplayEmpty = 'Selecione'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'CODIGO'
      LookupDisplay = 'DESCRICAO'
      LookupSource = dtsTipoPerfil
      ParentFont = False
      TabOrder = 0
    end
    object cbStatus: TRxDBLookupCombo
      Left = 244
      Top = 15
      Width = 156
      Height = 21
      DropDownCount = 5
      Color = 16644087
      DisplayEmpty = 'Selecione'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'CODIGO'
      LookupDisplay = 'DESCRICAO'
      LookupSource = dtsSituacao
      ParentFont = False
      TabOrder = 1
    end
    object chbSMS: TCheckBox
      Left = 26
      Top = 42
      Width = 97
      Height = 17
      Caption = 'Enviar SMS'
      TabOrder = 2
    end
    object chbEmail: TCheckBox
      Left = 122
      Top = 42
      Width = 97
      Height = 17
      Caption = 'Enviar Email'
      TabOrder = 3
    end
    object mmMensagem: TMemo
      Left = 2
      Top = 77
      Width = 398
      Height = 76
      Color = 16644087
      TabOrder = 4
    end
    object btnIniciar: TcxButton
      Left = 243
      Top = 154
      Width = 151
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'Registrar Mala Direta'
      TabOrder = 5
      OnClick = btnIniciarClick
      LookAndFeel.SkinName = 'UserSkin'
    end
    object cxButton1: TcxButton
      Left = 2
      Top = 154
      Width = 151
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'Limpar Mala Direta'
      TabOrder = 6
      OnClick = cxButton1Click
      LookAndFeel.SkinName = 'UserSkin'
    end
  end
  object qryTipoPerfil: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      'select *  from TABTIPOPERFIL'
      'order by DESCRICAO')
    Left = 155
    Top = 467
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABMUNICIPIOS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTipoPerfilDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TABTIPOPERFIL"."DESCRICAO"'
      Size = 100
    end
    object qryTipoPerfilTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = '"TABTIPOPERFIL"."TIPO"'
    end
  end
  object dtsTipoPerfil: TDataSource
    DataSet = qryTipoPerfil
    Left = 123
    Top = 467
  end
  object qrySituacao: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      'select *  from TABSITUACAOPRODUTO'
      'WHERE APLICACAO IN (2,99)'
      'order by DESCRICAO')
    Left = 294
    Top = 88
    object qrySituacaoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CODIGO'
      Origin = '"TABSITUACAOPRODUTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySituacaoDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = '"TABSITUACAOPRODUTO"."DESCRICAO"'
      Size = 200
    end
    object qrySituacaoAPLICACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'APLICACAO'
      Origin = '"TABSITUACAOPRODUTO"."APLICACAO"'
      Visible = False
    end
    object qrySituacaoOPERACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'OPERACAO'
      Origin = '"TABSITUACAOPRODUTO"."OPERACAO"'
      Visible = False
    end
    object qrySituacaoDIASREAVALIACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'DIASREAVALIACAO'
      Origin = '"TABSITUACAOPRODUTO"."DIASREAVALIACAO"'
      Visible = False
    end
  end
  object dtsSituacao: TDataSource
    DataSet = qrySituacao
    Left = 338
    Top = 86
  end
  object ACBrSMS1: TACBrSMS
    Ativo = False
    Modelo = modGenerico
    ATTimeOut = 10000
    ATResult = False
    IntervaloEntreMensagens = 0
    RecebeConfirmacao = False
    QuebraMensagens = False
    Left = 289
    Top = 48
  end
  object IBQuery1: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    Left = 320
    Top = 48
  end
end
