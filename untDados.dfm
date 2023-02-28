object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 474
  Width = 503
  object IBDatabase: TIBDatabase
    DatabaseName = 'D:\bd\AMVSYSTEM.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    AfterConnect = IBDatabaseAfterConnect
    Left = 25
    Top = 8
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 24
    Top = 64
  end
  object Geral: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Left = 80
    Top = 8
  end
  object qryLog: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    AfterPost = qryLogAfterPost
    OnNewRecord = qryLogNewRecord
    SQL.Strings = (
      'select *  from TABLOG')
    UpdateObject = udpLog
    Left = 136
    Top = 8
    object qryLogCODIGOUSUARIO: TIntegerField
      FieldName = 'CODIGOUSUARIO'
      Origin = '"TABLOG"."CODIGOUSUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLogDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABLOG"."DATA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLogHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"TABLOG"."HORA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLogID: TIntegerField
      FieldName = 'ID'
      Origin = 'TABLOG.ID'
      Required = True
    end
    object qryLogTEXTO: TMemoField
      FieldName = 'TEXTO'
      Origin = '"TABLOG"."TEXTO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object udpLog: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGOUSUARIO,'
      '  DATA,'
      '  HORA,'
      '  TEXTO,'
      '  ID'
      'from TABLOG '
      'where'
      '  CODIGOUSUARIO = :CODIGOUSUARIO and'
      '  DATA = :DATA and'
      '  HORA = :HORA and'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update TABLOG'
      'set'
      '  CODIGOUSUARIO = :CODIGOUSUARIO,'
      '  DATA = :DATA,'
      '  HORA = :HORA,'
      '  TEXTO = :TEXTO,'
      '  ID = :ID'
      'where'
      '  CODIGOUSUARIO = :OLD_CODIGOUSUARIO and'
      '  DATA = :OLD_DATA and'
      '  HORA = :OLD_HORA and'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into TABLOG'
      '  (CODIGOUSUARIO, DATA, HORA, TEXTO, ID)'
      'values'
      '  (:CODIGOUSUARIO, :DATA, :HORA, :TEXTO, :ID)')
    DeleteSQL.Strings = (
      'delete from TABLOG'
      'where'
      '  CODIGOUSUARIO = :OLD_CODIGOUSUARIO and'
      '  DATA = :OLD_DATA and'
      '  HORA = :OLD_HORA and'
      '  ID = :OLD_ID')
    Left = 136
    Top = 56
  end
  object dtsLog: TDataSource
    DataSet = qryLog
    Left = 136
    Top = 104
  end
  object qryRelatorios: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'Select CODIGO, NOMELIVRO from TABMATERIALDIDADITO')
    Left = 200
    Top = 8
  end
  object qryComunidade: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BeforeOpen = qryComunidadeBeforeOpen
    SQL.Strings = (
      'Select first 1'
      '   E.NOMECOMUNIDADE,'
      '   E.NOMEPAROQUIA,'
      '   E.NOMEDIOCESE,'
      '   E.URLLOGO,'
      '   E.CNPJ,'
      '  (CASE WHEN C.ENDERECO IS NOT NULL THEN C.ENDERECO END || '
      '   CASE WHEN E.NUMERO IS NOT NULL THEN'
      '     CASE WHEN C.ENDERECO IS NOT NULL THEN '#39' - '#39' END ||E.NUMERO'
      '   END ||'
      '   CASE WHEN E.COMPLEMENTO IS NOT NULL THEN'
      
        '     CASE WHEN (E.NUMERO IS NOT NULL) or (C.ENDERECO IS NOT NULL' +
        ' ) THEN '#39' - '#39' END ||E.COMPLEMENTO'
      '   END) AS ENDERECO1,'
      '   '
      '  (CASE WHEN C.BAIRRO IS NOT NULL THEN C.BAIRRO END ||'
      '   CASE WHEN M.NOME IS NOT NULL THEN'
      '     CASE WHEN C.BAIRRO IS NOT NULL THEN '#39' - '#39' END ||M.NOME'
      '   END ||'
      '   CASE WHEN M.UF IS NOT NULL THEN'
      '     CASE WHEN M.NOME IS NOT NULL THEN '#39' / '#39' ELSE'
      '       CASE WHEN C.BAIRRO IS NOT NULL THEN '#39' - '#39' END'
      '     END ||M.UF'
      '   END ||'
      '   CASE WHEN E.CEP IS NOT NULL THEN'
      '      CASE WHEN (M.UF IS NOT NULL)'
      '             or (M.NOME IS NOT NULL)'
      
        '             or (C.BAIRRO IS NOT NULL) THEN '#39' - CEP.: '#39' ELSE '#39' C' +
        'EP.: '#39' END ||E.CEP'
      '   END) AS ENDERECO2,'
      '   '
      '  (CASE WHEN E.TELA IS NOT NULL THEN E.TELA END ||'
      '   CASE WHEN E.TELB IS NOT NULL THEN'
      '     CASE WHEN E.TELA IS NOT NULL THEN '#39' - '#39' END ||E.TELB'
      '   END ||'
      '   CASE WHEN E.TELC IS NOT NULL THEN'
      
        '     CASE WHEN (E.TELA IS NOT NULL) or (E.TELB IS NOT NULL) THEN' +
        ' '#39' - '#39' END ||E.TELC'
      '   END) AS TELEFONES,'
      '   '
      
        '  (CASE WHEN E.EMAIL IS NOT NULL THEN '#39'Email: '#39' || E.EMAIL END |' +
        '|'
      
        '   CASE WHEN E.SITE IS NOT NULL THEN '#39' Site: '#39' || E.SITE END) AS' +
        ' EMAILSITE'
      '   '
      ' FROM TABCOMUNIDADE E'
      ' LEFT JOIN TABCEP C ON E.CEP = C.CEP'
      ' LEFT JOIN tabmunicipios M ON C.CODIGOMUNICIPIO = M.CODIGO'
      ''
      'where 1=1'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 298
    Top = 8
    object qryComunidadeNOMECOMUNIDADE: TIBStringField
      FieldName = 'NOMECOMUNIDADE'
      Origin = '"TABCOMUNIDADE"."NOMECOMUNIDADE"'
      Size = 100
    end
    object qryComunidadeNOMEPAROQUIA: TIBStringField
      FieldName = 'NOMEPAROQUIA'
      Origin = '"TABCOMUNIDADE"."NOMEPAROQUIA"'
      Size = 100
    end
    object qryComunidadeNOMEDIOCESE: TIBStringField
      FieldName = 'NOMEDIOCESE'
      Origin = '"TABCOMUNIDADE"."NOMEDIOCESE"'
      Size = 100
    end
    object qryComunidadeURLLOGO: TMemoField
      FieldName = 'URLLOGO'
      Origin = '"TABCOMUNIDADE"."URLLOGO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryComunidadeENDERECO1: TIBStringField
      FieldName = 'ENDERECO1'
      ProviderFlags = []
      Size = 86
    end
    object qryComunidadeENDERECO2: TIBStringField
      FieldName = 'ENDERECO2'
      ProviderFlags = []
      Size = 107
    end
    object qryComunidadeTELEFONES: TIBStringField
      FieldName = 'TELEFONES'
      ProviderFlags = []
      Size = 51
    end
    object qryComunidadeEMAILSITE: TIBStringField
      FieldName = 'EMAILSITE'
      ProviderFlags = []
      Size = 114
    end
    object qryComunidadeCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"TABCOMUNIDADE"."CNPJ"'
    end
  end
  object qryRelParcFinanceiro: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    OnCalcFields = qryRelParcFinanceiroCalcFields
    SQL.Strings = (
      'select a.nome as NomeAluno,'
      '       t.nometurma,'
      '       a.NomeResponsavel,'
      '       pf.vencimento,'
      '       pf.valor,'
      '       lp.valorpago,'
      '       lp.CODIGOPARCELARENEGOCIACAO,'
      '       pf.codigo as Parcela,'
      '       f.codigo as Financeiro,'
      '       f.tipo,'
      '       pf.ParcelaOriginal,'
      '       pf.DescricaoFPG,'
      '       pf.NUMEROCHEQUE'
      'FROM tabfinanceiro f'
      
        'left join tabmatricularturma mt on mt.codigo = f.CODIGOMATRICULA' +
        'MD'
      'left join tabturmas t on t.codigo = mt.codigoturma'
      'left join tabalunos a on a.codigo = mt.codigoaluno'
      'left join tabparcfinanceiro pf on pf.codigofinanceiro = f.codigo'
      
        'left join tabliquidarparcfinanceiro lp on lp.codigofinanceiro = ' +
        'f.codigo and lp.codigoparcela = pf.codigo'
      'where'
      '  F.CODIGOMATRICULAMD IS NOT NULL'
      '  and f.tipo = 1'
      '--Filtro1'
      '  AND LP.VALORPAGO + LP.VALORACRECIMO >= PF.VALOR'
      'union'
      'select a.nome as NomeAluno,'
      '       t.nometurma,'
      '       a.NomeResponsavel,'
      '       pf.vencimento,'
      '       pf.valor,'
      '       lp.valorpago,'
      '       lp.CODIGOPARCELARENEGOCIACAO,'
      '       pf.codigo as Parcela,'
      '       f.codigo as Financeiro,'
      '       f.tipo,'
      '       pf.ParcelaOriginal,'
      '       pf.DescricaoFPG,'
      '       pf.NUMEROCHEQUE'
      'FROM tabfinanceiro f'
      
        'left join tablancmaterialdidatico md on md.codigo = f.CODIGOMATR' +
        'ICULAMD'
      'left join tabturmas t on t.codigo = md.codigoturma'
      'left join tabalunos a on a.codigo = md.codigoaluno'
      'left join tabparcfinanceiro pf on pf.codigofinanceiro = f.codigo'
      
        'left join tabliquidarparcfinanceiro lp on lp.codigofinanceiro = ' +
        'f.codigo and lp.codigoparcela = pf.codigo'
      'where 1=1'
      '  AND F.CODIGOMATRICULAMD IS NOT NULL'
      '  and f.tipo = 2'
      '--Filtro2'
      '  AND LP.VALORPAGO + LP.VALORACRECIMO >= PF.VALOR'
      'order by'
      '   2,1,10,8')
    Left = 40
    Top = 128
    object qryRelParcFinanceiroNOMEALUNO: TIBStringField
      FieldName = 'NOMEALUNO'
      Origin = 'TABALUNOS.NOME'
      Size = 50
    end
    object qryRelParcFinanceiroNOMETURMA: TIBStringField
      FieldName = 'NOMETURMA'
      Origin = 'TABTURMAS.NOMETURMA'
      Size = 30
    end
    object qryRelParcFinanceiroNOMERESPONSAVEL: TIBStringField
      FieldName = 'NOMERESPONSAVEL'
      Origin = 'TABALUNOS.NOMERESPONSAVEL'
      Size = 50
    end
    object qryRelParcFinanceiroVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'TABPARCFINANCEIRO.VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryRelParcFinanceiroVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'TABPARCFINANCEIRO.VALOR'
      DisplayFormat = 'R$ #,##0.00'
      EditFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object qryRelParcFinanceiroVALORPAGO: TIBBCDField
      FieldName = 'VALORPAGO'
      Origin = 'TABLIQUIDARPARCFINANCEIRO.VALORPAGO'
      DisplayFormat = 'R$ #,##0.00'
      EditFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object qryRelParcFinanceiroCODIGOPARCELARENEGOCIACAO: TIntegerField
      FieldName = 'CODIGOPARCELARENEGOCIACAO'
      Origin = 'TABLIQUIDARPARCFINANCEIRO.CODIGOPARCELARENEGOCIACAO'
    end
    object qryRelParcFinanceiroPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'TABPARCFINANCEIRO.CODIGO'
    end
    object qryRelParcFinanceiroFINANCEIRO: TIntegerField
      FieldName = 'FINANCEIRO'
      Origin = 'TABFINANCEIRO.CODIGO'
      Required = True
    end
    object qryRelParcFinanceiroTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TABFINANCEIRO.TIPO'
    end
    object qryRelParcFinanceiroPARCELAORIGINAL: TIntegerField
      FieldName = 'PARCELAORIGINAL'
      Origin = 'TABPARCFINANCEIRO.PARCELAORIGINAL'
    end
    object qryRelParcFinanceiroDESCRICAOFPG: TIBStringField
      FieldName = 'DESCRICAOFPG'
      Origin = 'TABPARCFINANCEIRO.DESCRICAOFPG'
    end
    object qryRelParcFinanceiroDESCRICAOTELA: TStringField
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'DESCRICAOTELA'
      Size = 60
      Calculated = True
    end
    object qryRelParcFinanceiroDIAS: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'DIAS'
      Calculated = True
    end
    object qryRelParcFinanceiroNUMEROCHEQUE: TIBStringField
      FieldName = 'NUMEROCHEQUE'
      Origin = 'TABPARCFINANCEIRO.NUMEROCHEQUE'
      Size = 10
    end
  end
  object dtsGeral: TDataSource
    DataSet = Geral
    Left = 88
    Top = 64
  end
  object pipComunidade: TppDBPipeline
    DataSource = dtsComunidade
    OpenDataSource = False
    UserName = 'pipComunidade'
    Left = 296
    Top = 112
    object pipComunidadeppField1: TppField
      FieldAlias = 'NOMECOMUNIDADE'
      FieldName = 'NOMECOMUNIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField2: TppField
      FieldAlias = 'NOMEPAROQUIA'
      FieldName = 'NOMEPAROQUIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField3: TppField
      FieldAlias = 'NOMEDIOCESE'
      FieldName = 'NOMEDIOCESE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField4: TppField
      FieldAlias = 'URLLOGO'
      FieldName = 'URLLOGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField5: TppField
      FieldAlias = 'ENDERECO1'
      FieldName = 'ENDERECO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField6: TppField
      FieldAlias = 'ENDERECO2'
      FieldName = 'ENDERECO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField7: TppField
      FieldAlias = 'TELEFONES'
      FieldName = 'TELEFONES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField8: TppField
      FieldAlias = 'EMAILSITE'
      FieldName = 'EMAILSITE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pipComunidadeppField9: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object dtsComunidade: TDataSource
    DataSet = qryComunidade
    Left = 296
    Top = 56
  end
  object ReportBase: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 104
    Top = 216
    Version = '16.01'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppImage1: TppImage
        OnPrint = ppImage1Print
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 265
        mmWidth = 26723
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NOMECOMUNIDADE'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 5165
        mmLeft = 30163
        mmTop = 794
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOMEPAROQUIA'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 6350
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NOMEDIOCESE'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 10848
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 30163
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object OME: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'OME'
        HyperlinkEnabled = False
        Caption = 'NOME DO RELAT'#211'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5165
        mmLeft = 75711
        mmTop = 24606
        mmWidth = 46228
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 34925
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'ENDERECO1'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3725
        mmLeft = 30163
        mmTop = 15346
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'ENDERECO2'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3725
        mmLeft = 30163
        mmTop = 19579
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 29549
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 175155
        mmTop = 1058
        mmWidth = 19812
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryLista: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'Select * from TabDizimista'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 242
    Top = 240
  end
  object pipLista: TppDBPipeline
    DataSource = dtsLista
    OpenDataSource = False
    UserName = 'pipLista'
    Left = 240
    Top = 336
  end
  object dtsLista: TDataSource
    DataSet = qryLista
    Left = 240
    Top = 288
  end
  object rbiLista: TppReport
    AutoStop = False
    DataPipeline = pipLista
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 241
    Top = 384
    Version = '16.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipLista'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppImage2: TppImage
        OnPrint = ppImage2Print
        DesignLayer = ppDesignLayer2
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 265
        mmWidth = 26723
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NOMECOMUNIDADE'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 5165
        mmLeft = 30163
        mmTop = 794
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOMEPAROQUIA'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 6350
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NOMEDIOCESE'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 10848
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 30163
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object lblNomeRelatorio: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'OME'
        HyperlinkEnabled = False
        Caption = 'NOME DO RELAT'#211'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5165
        mmLeft = 75711
        mmTop = 24606
        mmWidth = 46228
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 34925
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'ENDERECO1'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3725
        mmLeft = 30163
        mmTop = 15346
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'ENDERECO2'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3725
        mmLeft = 30163
        mmTop = 19579
        mmWidth = 165365
        BandType = 0
        LayerName = Foreground1
      end
      object lblNomeCodigo: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblNomeCodigo'
        HyperlinkEnabled = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 30427
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground1
      end
      object lblNomeNome: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblNomeNome'
        HyperlinkEnabled = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 32279
        mmTop = 30427
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground1
      end
      object lblCampoExtra: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblNomeNome1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 30427
        mmWidth = 41804
        BandType = 0
        LayerName = Foreground1
      end
      object esquerda: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'esquerda'
        HyperlinkEnabled = False
        Caption = 'esquerda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 136525
        mmTop = 25135
        mmWidth = 14023
        BandType = 0
        LayerName = Foreground1
      end
      object direita: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'direita'
        HyperlinkEnabled = False
        Caption = 'direita'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 150813
        mmTop = 25135
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object CampoCodigo: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'CampoCodigo'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'CODIGO'
        DataPipeline = pipLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipLista'
        mmHeight = 3598
        mmLeft = 3704
        mmTop = 0
        mmWidth = 1778
        BandType = 4
        LayerName = Foreground1
      end
      object CampoNome: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'CampoNome'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = pipLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipLista'
        mmHeight = 3598
        mmLeft = 32279
        mmTop = 0
        mmWidth = 49699
        BandType = 4
        LayerName = Foreground1
      end
      object CampoExtra: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'CampoNome1'
        HyperlinkEnabled = False
        DataField = 'VALORCONTRIBUICAO'
        DataPipeline = pipLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipLista'
        mmHeight = 3598
        mmLeft = 153723
        mmTop = 265
        mmWidth = 41804
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 29549
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 175155
        mmTop = 1058
        mmWidth = 19812
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object qryRelLog: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'Select L.*, u.username, D.Nome'
      'from tablog l'
      'left join tabusuarios u on l.codigousuario = u.codigo'
      'left join tabperfil D on u.CODIGOFUNCIONARIO = D.codigo'
      'where 1=1'
      ''
      ''
      'Order by U.username, L.Data, L.Hora'
      '')
    Left = 386
    Top = 8
    object qryRelLogID: TIntegerField
      FieldName = 'ID'
      Origin = '"TABLOG"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelLogDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABLOG"."DATA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelLogHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"TABLOG"."HORA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelLogCODIGOUSUARIO: TIntegerField
      FieldName = 'CODIGOUSUARIO'
      Origin = '"TABLOG"."CODIGOUSUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelLogTEXTO: TMemoField
      FieldName = 'TEXTO'
      Origin = '"TABLOG"."TEXTO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryRelLogUSERNAME: TIBStringField
      FieldName = 'USERNAME'
      Origin = '"TABUSUARIOS"."USERNAME"'
    end
    object qryRelLogNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TABSERVOS"."NOME"'
      Size = 50
    end
  end
  object pipRelLog: TppDBPipeline
    DataSource = dtsRelLog
    OpenDataSource = False
    UserName = 'pipRelLog'
    Left = 384
    Top = 104
  end
  object dtsRelLog: TDataSource
    DataSet = qryRelLog
    Left = 384
    Top = 56
  end
  object rbiLog: TppReport
    AutoStop = False
    DataPipeline = pipRelLog
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 384
    Top = 152
    Version = '16.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipRelLog'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'OME'
        HyperlinkEnabled = False
        Caption = 'LOG DO USU'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 80304
        mmTop = 794
        mmWidth = 37042
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText18: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = pipRelLog
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipRelLog'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 529
        mmWidth = 21696
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'HORA'
        DataPipeline = pipRelLog
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipRelLog'
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 529
        mmWidth = 21696
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText9'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'TEXTO'
        DataPipeline = pipRelLog
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelLog'
        mmHeight = 4233
        mmLeft = 48419
        mmTop = 529
        mmWidth = 10583
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
        LayerName = Foreground2
      end
      object ppSystemVariable5: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 29549
        BandType = 8
        LayerName = Foreground2
      end
      object ppSystemVariable6: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3725
        mmLeft = 175155
        mmTop = 1058
        mmWidth = 19812
        BandType = 8
        LayerName = Foreground2
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODIGOUSUARIO'
      DataPipeline = pipRelLog
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pipRelLog'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLine11: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 6615
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label1'
          HyperlinkEnabled = False
          Caption = 'Usu'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5292
          mmLeft = 12435
          mmTop = 794
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine13: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line13'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label2'
          HyperlinkEnabled = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 8996
          mmTop = 6879
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label5'
          HyperlinkEnabled = False
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 32015
          mmTop = 6879
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 48419
          mmTop = 6879
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBText16: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'USERNAME'
          DataPipeline = pipRelLog
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pipRelLog'
          mmHeight = 5027
          mmLeft = 30692
          mmTop = 794
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel7: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5292
          mmLeft = 55033
          mmTop = 794
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBText17: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText17'
          HyperlinkEnabled = False
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pipRelLog
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pipRelLog'
          mmHeight = 5027
          mmLeft = 57944
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object rbiFechamentoTurno: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Fechamento de Turno'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 1000
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 1000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 85000
    PrinterSetup.PaperSize = 256
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Printer'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowPrintDialog = False
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 384
    Top = 368
    Version = '16.01'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      BeforeGenerate = ppHeaderBand4BeforeGenerate
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 147902
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NOMECOMUNIDADE'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3429
        mmLeft = 0
        mmTop = 794
        mmWidth = 71702
        BandType = 0
        LayerName = Foreground3
      end
      object ppDBText22: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOMEPAROQUIA'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3429
        mmLeft = 0
        mmTop = 6350
        mmWidth = 71702
        BandType = 0
        LayerName = Foreground3
      end
      object ppDBText23: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NOMEDIOCESE'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3429
        mmLeft = 0
        mmTop = 10848
        mmWidth = 71702
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 24077
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine15: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 30163
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'OME'
        HyperlinkEnabled = False
        Caption = 'F E C H A M E N T O  D E  T U R N O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3683
        mmLeft = 2381
        mmTop = 25400
        mmWidth = 66675
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine16: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 60590
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppDBText24: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'ENDERECO1'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3302
        mmLeft = 0
        mmTop = 15346
        mmWidth = 71702
        BandType = 0
        LayerName = Foreground3
      end
      object ppDBText25: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'ENDERECO2'
        DataPipeline = pipComunidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipComunidade'
        mmHeight = 3302
        mmLeft = 0
        mmTop = 19579
        mmWidth = 71702
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'TURNO........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 39952
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'RESPONSAVEL..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 47096
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'DATA.........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 53975
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object varNomeTurno: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varNomeTurno'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        Transparent = True
        mmHeight = 3175
        mmLeft = 29898
        mmTop = 39952
        mmWidth = 19812
        BandType = 0
        LayerName = Foreground3
      end
      object varNomeServo: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varNomeServo'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        Transparent = True
        mmHeight = 3175
        mmLeft = 29898
        mmTop = 47096
        mmWidth = 19812
        BandType = 0
        LayerName = Foreground3
      end
      object varDataEmissao: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varDataEmissao'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        Transparent = True
        mmHeight = 3175
        mmLeft = 29898
        mmTop = 53975
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine18: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 67998
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'OME1'
        HyperlinkEnabled = False
        Caption = 'D E T A L H A M E N T O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3683
        mmLeft = 13758
        mmTop = 62442
        mmWidth = 43815
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'D'#205'ZIMOS.................:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 69850
        mmWidth = 41275
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'COLETAS DA COMUNIDADE...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 76994
        mmWidth = 41275
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label101'
        HyperlinkEnabled = False
        Caption = 'COLETAS ESPECIAIS.......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 83873
        mmWidth = 41275
        BandType = 0
        LayerName = Foreground3
      end
      object varTotalDizimo: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotalDizimo'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 3
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 69850
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object varTotalColetasComunidade: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotalColetasComunidade'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 4
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 76994
        mmWidth = 41275
        BandType = 0
        LayerName = Foreground3
      end
      object varTotalColetasEspeciais: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotalColetasEspeciais'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 5
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 32015
        mmTop = 83873
        mmWidth = 39624
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'OUTRAS COLETAS..........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 90488
        mmWidth = 41275
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'FESTAS..................:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 97631
        mmWidth = 41275
        BandType = 0
        LayerName = Foreground3
      end
      object varTotalOutrasOfertas: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotalOutrasOfertas'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 6
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 37042
        mmTop = 90488
        mmWidth = 34671
        BandType = 0
        LayerName = Foreground3
      end
      object varTotalFestas: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotalFestas'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 7
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 97631
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine19: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 105834
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine20: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line20'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 113242
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'T O T A I S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3683
        mmLeft = 25400
        mmTop = 107686
        mmWidth = 20955
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label19'
        HyperlinkEnabled = False
        Caption = 'COLETAS + FESTAS............:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 115094
        mmWidth = 47879
        BandType = 0
        LayerName = Foreground3
      end
      object varTotal1: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotal1'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 8
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 56886
        mmTop = 115094
        mmWidth = 14859
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label20'
        HyperlinkEnabled = False
        Caption = 'D'#205'ZIMOS + COLETAS + FESTAS..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 121709
        mmWidth = 47879
        BandType = 0
        LayerName = Foreground3
      end
      object varTotal2: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotal2'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 9
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 56886
        mmTop = 121709
        mmWidth = 14859
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label201'
        HyperlinkEnabled = False
        Caption = 'OUTRAS OFERTAS..............:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 128323
        mmWidth = 47879
        BandType = 0
        LayerName = Foreground3
      end
      object varTotal3: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotal3'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 10
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 56886
        mmTop = 128323
        mmWidth = 14859
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label22'
        HyperlinkEnabled = False
        Caption = 'TOTAL GERAL.................:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 134938
        mmWidth = 47879
        BandType = 0
        LayerName = Foreground3
      end
      object varTotal4: TppVariable
        DesignLayer = ppDesignLayer4
        UserName = 'varTotal4'
        HyperlinkEnabled = False
        BlankWhenZero = False
        CalcOrder = 11
        DataType = dtCurrency
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetType = veGroupEnd
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 56886
        mmTop = 134938
        mmWidth = 14859
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine21: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line201'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 142611
        mmWidth = 83000
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine22: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line5'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 42863
        mmTop = 120386
        mmWidth = 29898
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine23: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line23'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 42863
        mmTop = 133879
        mmWidth = 29898
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'N'#186' CONTROLE..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 32808
        mmWidth = 23114
        BandType = 0
        LayerName = Foreground3
      end
      object ppDBText26: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText26'
        HyperlinkEnabled = False
        DataField = 'SEQUENCIAFECHAMENTOTURNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 29898
        mmTop = 32808
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object BackupFile1: TBackupFile
    Version = '3.00'
    BackupMode = bmAll
    CompressionLevel = clFastest
    RestoreMode = rmAll
    MaxSize = 0
    SetArchiveFlag = False
    RestoreFullPath = False
    SaveFileID = False
    Left = 418
    Top = 304
  end
  object TcpClient1: TTcpClient
    Left = 296
    Top = 152
  end
  object ibsScript: TIBScript
    Database = IBDatabase
    Transaction = IBTransaction
    Terminator = ';;'
    Left = 360
    Top = 240
  end
  object GetConfig: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Left = 32
    Top = 192
  end
  object ImageList1: TImageList
    Left = 184
    Top = 256
    Bitmap = {
      494C01010C00D400D80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000002952000029
      5200002952000029520000295200002952000029520000295200002952000029
      52000029520000295200000000000000000000000000636E7B0000000000C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A40000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C0090909000000000000000000000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A00000000000073BD005ACEEF000073
      BD000073BD000073BD000073BD000073BD000073BD000073BD000073BD000073
      BD000073BD000073BD0000295200000000005E98C7003489D0007F859D00C2A6
      A400FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00FEFCFB00C2A6A40000000000000000009C9C9C00EBEBEB00E0E0
      E000DBDBDB00D7D7D700D2D2D200CDCDCD00C9C9C900C3C3C300C2C2C200C2C2
      C200C6C6C60090909000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A00000000000073BD00C6AD9C004A29
      18004A2918004A2918004A2918004A2918004A2918004A2918004A2918004A29
      18004A2918000073BD000029520000000000000000004BB6FF00288BE0008584
      9800FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00FEFCFB00C2A6A400000000000000000095959500F0F0F000E5E5
      E500E0E0E000DCDCDC00C6C6C6009595950095959500C0C0C000C4C4C400C2C2
      C200C6C6C60090909000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A00000000000073BD00C6AD9C00F7EF
      E700EFE7DE00E7DED600E7D6CE00DECEC600DEC6BD00B5BDEF00D6BDAD00D6BD
      AD004A2918000073BD00002952000000000000000000000000004DB5FF00278B
      DE0079819A00FEFBF700FEFBF700FEFBF700FEFBF700FEFBF700FEFBF700FEFB
      F700FEFBF700FEFBF700C2A6A400000000000000000095959500F5F5F500E9E9
      E90095959500CCCCCC0095959500C6C6C600C6C6C60095959500C0C0C000C4C4
      C400C5C5C50090909000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A00000000000073BD00C6A59400FFF7
      F700CE842900CE842900CE842900E7DED600B5BDEF000008B500B5BDEF00D6BD
      AD004A2918000073BD0000295200000000000000000000000000000000004CB9
      FF005A91BF00E0CCC800C4A39F00B0878300C4A39F00E0CCC800FEF9F400FEF9
      F400FEF9F400FEF9F400C2A6A40000000000000000009F9F9F00F9F9F900EFEF
      EF009595950095959500CCCCCC00DBDBDB00D7D7D700C0C0C00095959500C8C8
      C800C7C7C70090909000000000000000000000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A00000000000073BD00BDA59400FFFF
      FF00FFF7F700F7EFEF00EFE7E700EFE7DE000008B500E7D6CE000008B500B5BD
      EF004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400D1B7B200B8908A00D3B5A800EFDBC300D2B1A000B78E8600E0CBC500FEF7
      F000FEF7F000FEF7F000C2A6A40000000000000000009F9F9F00FEFEFE00F3F3
      F300959595009595950095959500DFDFDF00DBDBDB00D7D7D700D1D1D100CCCC
      CC00CCCCCC0090909000000000000000000000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A00000000000073BD00BDA59400FFFF
      FF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00B5BDEF00E7D6CE000008
      B5004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400C4A29D00D4B9B100F9EADA00F8E7D200FFFFF700D2B0A000C4A29D00FEF5
      EC00FEF5EC00FEF5EC00C2A6A4000000000000000000A6A6A600FFFFFF00F9F9
      F900F3F3F300EEEEEE00E9E9E900E5E5E500959595009595950095959500D2D2
      D200D1D1D10090909000000000000000000000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD525200000000000073BD00BDA59400FFFF
      FF00CE842900CE842900CE842900F7EFEF00B5BDEF000008B500B5BDEF00E7D6
      CE004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400B0868200F5EAE300F9EFE300F8EADA00FFFFF000F0DAC400B0868200FEF3
      E900FEF3E900FEF3E900C2A6A4000000000000000000A6A6A600FFFFFF00FEFE
      FE0095959500D6D6D600EEEEEE00E9E9E900C9C9C9009595950095959500D6D6
      D600D6D6D60090909000000000000000000000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A00000000000073BD00BDA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F7000008B500EFE7E7000008B500B5BD
      EF004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400C4A19B00D6BFBA00FBF3EB00FAEFE200FFFFDE00D3B5A800C4A19B00FFF1
      E500FFF1E500FFF1E500C2A6A4000000000000000000B1B1B100FFFFFF00FFFF
      FF00DCDCDC0095959500D6D6D600CECECE0095959500C9C9C90095959500DCDC
      DC00D3D3D30090909000000000000000000000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A00000000000073BD00BDA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E7000008
      B5004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400E0C7BC00B8928F00D6BFBA00F5EAE200D4B9B100B8908A00CBB2A800DDCF
      C200DDCFC200DDCFC200C2A6A4000000000000000000B1B1B100FFFFFF00FFFF
      FF00FFFFFF00DCDCDC009595950095959500CECECE00EBEBEB00EAEAEA00D5D5
      D500B7B7B70090909000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A00000000000073BD00BDA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7
      E7004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400FFEEDE00E0C5BA00C4A09900B0868200C4A09900E0C5BA00C5B5A900C3B4
      A800C2B3A700C1B2A600C2A6A4000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00F8F8F800F4F4F400E3E3E300A4A4A400A4A4
      A400A4A4A400A4A4A400000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A00000000000073BD00BDA59400FFFF
      FF00004284000029520000295200002952000029520000295200002952000029
      52004A2918000073BD000029520000000000000000000000000000000000C2A6
      A400FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00B0A29600B0A2
      9600B0A29600B0A29600C2A6A4000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FCFCFC00D6D6D600A4A4A400ACAC
      AC00A3A3A300ABABAB00000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A00000000000073BD00BDA59400BDA5
      9400004284007BE7F70052C6E7000029520052C6E70031ADDE00007BBD000029
      5200BDA594000073BD000029520000000000000000000000000000000000C2A6
      A400FFEAD700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FBF8F400FBF8
      F400E6DAD900C2A6A400000000000000000000000000BFBFBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDBDB00A4A4A400B8B8
      B800ABABAB0000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A00000000000073BD007BE7F7007BE7
      F7007BE7F700004284007BE7F700002952000029520052C6E700002952007BE7
      F70073DEF7006BD6EF000029520000000000000000000000000000000000C2A6
      A400FFE8D300FFE8D300FFE8D300FFE8D300FFE8D300C9B9AC00FBF8F400DFCE
      C700C2A6A40000000000000000000000000000000000BFBFBF00F8F8F800F7F7
      F700F7F7F700F7F7F700F6F6F600F6F6F600F6F6F600D7D7D700A4A4A400ABAB
      AB000000000000000000000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A0000000000000000000073BD000073
      BD000073BD000073BD00004284007BE7F7007BE7F700002952000073BD000073
      BD000073BD000073BD000000000000000000000000000000000000000000C2A6
      A400FFE6D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DFCEC700C2A6
      A4000000000000000000000000000000000000000000BFBFBF00BABABA00BABA
      BA00BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00A4A4A4000000
      0000000000000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A00000000000000000000000000000000000000
      0000000000000000000000428400004284000042840000428400000000000000
      000000000000000000000000000000000000000000000000000000000000C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005A080000630800005A0800005A0800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008841800109C210010A5210008A5180008A5180008A51800089410000063
      0800000000000000000000000000000000000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      840086848400000000000000000000000000AB7E6200A4775A00955F3F008E57
      39007E4020007E402000000000000000000000000000AB7E6200A4775A00955F
      3F008E5739007E4020007E4020000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B66000000000000000000000000000000000000000000108C
      210029BD420021B5310018B5310010AD290010A5210008A5180008A5180008AD
      180008730800000000000000000000000000000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C600868484008684840086848400AB7E6200FCFAFA00E3C8B800CDA3
      8C00AC7655007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00AC7655007E4020000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B6600000000000000000000000000000000001094210031C6
      520029C64A0029C6420021BD420021BD310018B5290010AD210008AD210008AD
      180008AD18000873080000000000000000000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA008684840000000000AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E4020000000000000000000B4817600FEF3E300F8E7
      D300F5E3CB00F5DFC300CFCF9F00018A0200018A0200CCC68B00EECC9A00EECC
      9700F3D19900986B66000000000000000000000000001094180039CE630031C6
      5A0039C6520031BD520031B54A0029B5420021AD390018AD310018A52900109C
      210008A5180008AD1800006308000000000086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C00AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E4020000000000000000000B4817600FFF7EB00F9EB
      DA00018A0200D1D6AC00018A0200D0CF9E00CECC9800018A0200CCC68900EFCD
      9900F3D19800986B660000000000000000000000000031BD4A0042D66B0039CE
      5A00396B4200316B420031634200316339003163390029633100295A3100295A
      290008A5180008AD1800089410000000000086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C00AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E4020000000000000000000BA8E8500FFFCF400FAEF
      E400018A0200018A0200D1D5AD00F5DFC200F4DBBB00CDCC9800018A0200F0D0
      A100F3D29B00986B66000000000000000000089C180042CE6B0042D66B0042CE
      630039CE630039CE630039CE5A0031C6520029C64A0021BD390018B5310010AD
      290010AD210008A5180008A51800005A080086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A50086838300AB7E62009F6B4E009F6B4E009153
      3100915331007E4020007E4020006F432400AB7E62009F6B4E009F6B4E009153
      3100915331007E4020007E4020000000000000000000BA8E8500FFFFFD00FBF4
      EC00018A0200018A0200018A0200F5E3C900F5DFC200F4DBBA00F2D7B100F0D4
      A900F5D5A300986B6600000000000000000010A521005ADE840052D67B0042D6
      6B0039CE630039D6630039CE5A0031C6520029BD4A0029BD420021BD390018B5
      310018AD290010AD210010A51800005A0800000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D00086848400DDC5A900AB7E6200ECD8CD00ECD8
      CD00CAA08900AC7655007E4020009F6B4E00AB7E6200ECD8CD00ECD8CD00CAA0
      8900AC7655007E402000906060000000000000000000CB9A8200FFFFFF00FEF9
      F500FBF3EC00FAEFE200F9EADA00F8E7D200018A0200018A0200018A0200F2D8
      B200F6D9AC00986B6600000000000000000010A5210084E7A50063DE8C004AD6
      730042D66B0039A55A0039BD5A0039CE5A0031C6520029BD4A002994390021AD
      390018B5310018AD290010AD2100006308000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF00868484000000000000000000AB7E6200FFFFFF00F1E8
      E500EED2C100AC7655007E402000C8989000AB7E6200FFFFFF00F1E8E500EED2
      C100AC76550090606000000000000000000000000000CB9A8200FFFFFF00FFFE
      FD00018A0200D6E3C900F9EFE300F8EADA00D2D9B300018A0200018A0200F4DB
      B900F8DDB400986B6600000000000000000010A518008CE7AD008CEFAD0052E7
      7B0042AD630031213100396B420039D6630039D65A00319C4A0031213100315A
      390021BD390021B5310018AD2900005A08000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      9600868484008684840000000000000000000000000000000000AB7E62009F6B
      4E00955F3F007E4020007E4020009F6B4E00AB7E62009F6B4E00955F3F007E40
      20007E40200000000000000000000000000000000000DCA88700FFFFFF00FFFF
      FF00D9EDD800018A0200D6E3C800D5E0C100018A0200D3D8B200018A0200F7E1
      C200F0DAB700986B66000000000000000000000000006BD68400C6F7D60073EF
      9C00428C5A00291029003952420042D66B0039DE6300398C4A00311831003142
      390029BD420029BD420018A52900000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      0000000000000000000000000000000000000000000000000000AB7E6200FCFA
      FA00DEC3B100AC7655007E40200000000000AB7E6200FCFAFA00DEC3B100AC76
      55007E40200000000000000000000000000000000000DCA88700FFFFFF00FFFF
      FF00FFFFFF00D9EDD800018A0200018A0200D5DFC100FAEDDC00FCEFD900E6D9
      C400C6BCA900986B660000000000000000000000000021AD3100BDF7D600C6FF
      D60063CE8400314A3900428C52004ADE730042D66B0039BD5A0031423900317B
      420031C64A0031C64A00087B100000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000AB7E62009F6B
      4E00955F3F007E4020009F6B4E0000000000AB7E62009F6B4E00955F3F007E40
      20009F6B4E0000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B4817600B481
      7600B4817600B48176000000000000000000000000000000000031B54200D6FF
      E700CEFFDE0084EFA5005AE784004ADE7B004AD6730042D66B0042CE630042CE
      630039CE5A00108C21000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      000000000000000000000000000000000000000000000000000000000000AB7E
      6200FCFAFA007E402000000000000000000000000000AB7E6200FCFAFA007E40
      20000000000000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A00C5876800000000000000000000000000000000000000000031BD
      4200C6F7D600DEFFEF00C6F7D600A5EFBD0094EFAD008CE7A5007BE7940052D6
      7B00189C29000000000000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      000000000000000000000000000000000000000000000000000000000000AB7E
      6200AB7E62009F6B4E00000000000000000000000000AB7E6200AB7E62009F6B
      4E000000000000000000000000000000000000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD9377000000000000000000000000000000000000000000000000000000
      000021AD31006BD68400A5EFB500ADEFC600A5EFBD0084E79C004AC663001094
      2100000000000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      8600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010A5210010A5210010A52100089C1800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000A5000000A5000000A5000000A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C3100009429
      0000942900000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000AAABAB00999C
      9D00999C9D00999C9D00999C9D00999C9D00999C9D00999C9D00999C9D00999C
      9D00999C9D00999C9D00999C9D00000000000000000000000000000000000000
      00000010CE000010C6000008C6000000BD000000BD000000BD000000B5000000
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C3100009C3100009C310000FFAD
      4200CE520000CE5200009C420800000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000AAABAB00FEFE
      FD00FDFDFC00FAFAF900F6F6F500F3F3F200F0F0EF00ECECEB00E9E9E800E4E4
      E400DBDBDB00D2D2D200999C9D000000000000000000000000000021DE000021
      E7000021E7000018DE000010D6000008CE000000BD000000BD000000BD000000
      BD000000B50000009C0000000000000000000000000000000000000000000000
      00000000000000000000000000009C2900009C310000FF940000FF9C0000FFAD
      2100FFBD4A00FFCE7300A5310000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000AAABAB00FEFE
      FD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600DBDBDB00999C9D000000000000000000000000000031F7000839
      F7000839F7000831F7000021E7000018DE000010CE000008C6000008C6000808
      BD000808B5000000B50000000000000000000000000000000000000000000000
      00000000000000000000000000009C29000094210000FFB53100FF940000A531
      0000DE841000FFBD5200A5310000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A00000000000000000000000000AAABAB00FEFE
      FD002D2D2D0058534E00D6C6BD00FAFAF900F6F6F500F3F3F200F0F0EF00ECEC
      EB00E9E9E800E4E4E400999C9D0000000000000000000031F7001042FF001042
      FF0021398C001039E7001039F7000831EF000829E7000829DE000821C6002129
      7B000810BD000000C6000000A500000000000000000000000000000000000000
      000000000000000000009C2900009C290000E7AD7300FFCE7B00CE6B08000000
      00008C180000F79C2100FFB54A00A531000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6300000000000000000000000000AAABAB00FEFE
      FD0058534E004544420051606100D6C6BD00FAFAF900F6F6F500F3F3F200F0F0
      EF00ECECEB00E9E9E800999C9D000000000000000000184AFF00184AFF001042
      FF001839B500293973001839AD001031E7001031E7001829A500293163001821
      9C000008C6000000BD000000B50000000000000000000000000000000000006B
      A50000528C00108CB50073522900BD4A0000EFBD8C00FFE7AD00CE7B39000000
      00008C180000F7940000FFAD2900A531000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000AAABAB00FEFE
      FD00C6C6C60054777B001A9CC20018556F00425A9400C6B5B500C6C6C600C6C6
      C600C6C6C600ECECEB00999C9D00000000000839FF00295AFF00295AFF001852
      FF001042FF001042E7002139940021317B0021317B00213184001021BD000010
      D6000008CE000000C6000000BD0000009C0000000000006BA500006BA500006B
      A50010A5D60063E7FF00008CCE00008CCE0073736300FFE7AD00EFBD8400A539
      0000CE6B0000FF940000A53100000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B7300000000000000000000000000AAABAB00FEFE
      FD00FEFEFD0054777B0029799A00947E75001A9CC200425A9400D6C6BD00F6F6
      F500F3F3F200F0F0EF00999C9D00000000001042FF004A7BFF003163FF00295A
      FF001852FF00104AFF000839FF000839FF000031F7000029F7000021F7000018
      E7000010D6000010CE000008C6000000A5000000000000528C000084B50000D6
      FF0010D6FF0039DEFF006BE7FF0094EFFF00008CCE00FFE7AD00FFE7AD00FFDE
      A500FFC65A00FFA51000A53100000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B7300000000000000000000000000AAABAB00FEFE
      FD00FEFEFD00FEFEFD0098B9D70027D1FC0004B8EC001A9CC200425A9400D6C6
      BD00F8F8F700F3F3F200999C9D0000000000184AFF007B9CFF00527BFF003163
      FF00295AFF00294ABD00184AE7001042FF000039FF000031FF001029B5000829
      D6000018E7000018DE000010CE000000A5000000000000528C00088CBD0039DE
      FF0000B5E700006BA50029B5DE006BE7FF00008CCE00D6843900D6842900FFE7
      AD00CE520000CE520000CE5200000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B5847300000000000000000000000000AAABAB00FEFE
      FD00C6C6C600C6C6C60098B9D700ACEDFC0027D1FC0004B8EC001A9CC200425A
      9400C6B5B500F8F8F700999C9D00000000001042FF0094ADFF007B9CFF003973
      FF00315AC6003131210029427B001852FF001042FF001039C600393121002131
      73000021F7000021E7000018DE000000A50000528C00189CC600B5EFFF0084EF
      FF0000000000005A940000639C004AE7FF006BE7FF00397B8C00CE520000CE52
      00000000000000000000000000000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000000000000AAABAB00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD0098B9D700ACEDFC0027D1FC0004B8EC001A9C
      C200425A9400D6C6BD00999C9D0000000000000000007394FF00B5CEFF005A8C
      FF0039529C003129080031395A00295AF7001852FF002142A500393110002931
      4A000029F7000029F7000018D6000000000000528C000894C600BDF7FF00BDF7
      FF00000000000063A500006BA50021DEFF0042DEFF00187BA500000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B0000000000000000000000000000000000AAABAB00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD0098B9D700ACEDFC0027D1FC0004B8
      EC001A9CC200425A9400999C9D000000000000000000295AFF00C6D6FF00ADC6
      FF005273DE0031394A00314A9C00316BFF00295AFF002152DE0031314A002139
      9C000039FF000031FF000010C6000000000000000000005A940029ADD600C6FF
      FF0094DEF7000884B50018C6F70000D6FF00187BA50000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD8484000000000000000000000000000000000000000000AAABAB00FEFE
      FD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60098B9D700ACEDFC0027D1
      FC0035A8F500222F9B00110875000000000000000000000000005A7BFF00D6E7
      FF00BDD6FF007394F7004A7BFF004273FF003163FF003163FF00295AF7001852
      FF00104AFF000029E700000000000000000000000000005A940029ADD600C6F7
      FF00C6FFFF00ADF7FF006BE7FF0018D6FF00187BA50000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      0000000000000000000000000000000000000000000000000000AAABAB00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD0098B9D7004A9E
      ED00455FC400455FC400222F9B001108750000000000000000000839FF005A7B
      FF00C6D6FF00DEE7FF00BDCEFF009CB5FF008CA5FF007B9CFF00638CFF00396B
      FF001039EF000018CE0000000000000000000000000000000000005A94000063
      940052C6DE00C6FFFF00187BA500187BA5000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      0000000000000000000000000000000000000000000000000000AAABAB00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00455F
      C400889FE1008997DF00455FC400000000000000000000000000000000000000
      0000315AFF006B8CFF009CB5FF00ADC6FF009CB5FF007B9CFF003963FF001039
      EF00000000000000000000000000000000000000000000000000000000000000
      0000005A94000063940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000AAABAB00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00999C
      9D00455FC400455FC40000000000000000000000000000000000000000000000
      000000000000000000000839FF001842FF001042FF000839FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000AAABAB00999C
      9D00999C9D00999C9D00999C9D00999C9D00999C9D00999C9D00999C9D00999C
      9D0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFC001C003A0018003800080010001
      8003800080018001800380008001C001800380008001E001800380008001E001
      800380008001E001800380008001E001800380008001E001800380008001E001
      800380008001E001800380008001E001800380008001E003800780008001E007
      800F8000C003E00F801FC001FC3FE01FFC3FF33FFFFFFFFFF00FE00703818003
      E007C00003818003C00380010381800380010000038180038001000003818003
      000000000001800300008000000180030000E001800380030000F003C0078003
      8001F01FC10780038001E03FC1078003C003E03FE38F8003E007C03FE38F8007
      F00FC07FFFFF800FFC3FF8FFFFFF801FFC3FFFC7F801C001F00FFF01F801C001
      C003FE01F801C001C003FE01F801C0018001FC108001C0018001E0108001C001
      000080018001C001000080018001C001000080018001C0010000080F8001C001
      8001083F8003C0018001807F8007C001C003807F801FC000C003C0FF801FC001
      F00FF3FF803FC003FC3FFFFF807FC00F00000000000000000000000000000000
      000000000000}
  end
  object updHistoricoSituacao: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGOORIGEM,'
      '  ID,'
      '  TIPO,'
      '  DATA,'
      '  HORA,'
      '  CODIGOSITUACAO,'
      '  DESCRICAOSITUACAO,'
      '  DATAFIM,'
      '  HORAFIM,'
      '  CODIGOUSUARIO,'
      '  HISTORICOTRANSFERENCIA,'
      '  CODIGOQUESTIONARIO'
      'from TABHISTORICOSITUACAO '
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update TABHISTORICOSITUACAO'
      'set'
      '  CODIGOORIGEM = :CODIGOORIGEM,'
      '  CODIGOQUESTIONARIO = :CODIGOQUESTIONARIO,'
      '  CODIGOSITUACAO = :CODIGOSITUACAO,'
      '  CODIGOUSUARIO = :CODIGOUSUARIO,'
      '  DATA = :DATA,'
      '  DATAFIM = :DATAFIM,'
      '  DESCRICAOSITUACAO = :DESCRICAOSITUACAO,'
      '  HISTORICOTRANSFERENCIA = :HISTORICOTRANSFERENCIA,'
      '  HORA = :HORA,'
      '  HORAFIM = :HORAFIM,'
      '  ID = :ID,'
      '  TIPO = :TIPO'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into TABHISTORICOSITUACAO'
      
        '  (CODIGOORIGEM, CODIGOQUESTIONARIO, CODIGOSITUACAO, CODIGOUSUAR' +
        'IO, DATA, '
      
        '   DATAFIM, DESCRICAOSITUACAO, HISTORICOTRANSFERENCIA, HORA, HOR' +
        'AFIM, ID, '
      '   TIPO)'
      'values'
      
        '  (:CODIGOORIGEM, :CODIGOQUESTIONARIO, :CODIGOSITUACAO, :CODIGOU' +
        'SUARIO, '
      
        '   :DATA, :DATAFIM, :DESCRICAOSITUACAO, :HISTORICOTRANSFERENCIA,' +
        ' :HORA, '
      '   :HORAFIM, :ID, :TIPO)')
    DeleteSQL.Strings = (
      'delete from TABHISTORICOSITUACAO'
      'where'
      '  ID = :OLD_ID')
    Left = 42
    Top = 407
  end
  object dtsHistoricoSituacao: TDataSource
    DataSet = qryHistoricoSituacao
    Left = 36
    Top = 341
  end
  object qryHistoricoSituacao: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      '   FROM TABHISTORICOSITUACAO'
      ''
      'WHERE 1 = 1'
      ''
      '--AND'
      ''
      ''
      ''
      'ORDER BY ID')
    UpdateObject = updHistoricoSituacao
    Left = 34
    Top = 287
    object qryHistoricoSituacaoCODIGOORIGEM: TIntegerField
      FieldName = 'CODIGOORIGEM'
      Origin = '"TABHISTORICOSITUACAO"."CODIGOORIGEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistoricoSituacaoID: TIntegerField
      FieldName = 'ID'
      Origin = '"TABHISTORICOSITUACAO"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistoricoSituacaoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = '"TABHISTORICOSITUACAO"."TIPO"'
    end
    object qryHistoricoSituacaoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABHISTORICOSITUACAO"."DATA"'
    end
    object qryHistoricoSituacaoHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"TABHISTORICOSITUACAO"."HORA"'
    end
    object qryHistoricoSituacaoCODIGOSITUACAO: TIntegerField
      FieldName = 'CODIGOSITUACAO'
      Origin = '"TABHISTORICOSITUACAO"."CODIGOSITUACAO"'
    end
    object qryHistoricoSituacaoDESCRICAOSITUACAO: TIBStringField
      FieldName = 'DESCRICAOSITUACAO'
      Origin = '"TABHISTORICOSITUACAO"."DESCRICAOSITUACAO"'
      Size = 100
    end
    object qryHistoricoSituacaoDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Origin = '"TABHISTORICOSITUACAO"."DATAFIM"'
    end
    object qryHistoricoSituacaoHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = '"TABHISTORICOSITUACAO"."HORAFIM"'
    end
    object qryHistoricoSituacaoCODIGOUSUARIO: TIntegerField
      FieldName = 'CODIGOUSUARIO'
      Origin = '"TABHISTORICOSITUACAO"."CODIGOUSUARIO"'
    end
    object qryHistoricoSituacaoHISTORICOTRANSFERENCIA: TIBStringField
      FieldName = 'HISTORICOTRANSFERENCIA'
      Origin = '"TABHISTORICOSITUACAO"."HISTORICOTRANSFERENCIA"'
      Size = 500
    end
    object qryHistoricoSituacaoCODIGOQUESTIONARIO: TIntegerField
      FieldName = 'CODIGOQUESTIONARIO'
      Origin = '"TABHISTORICOSITUACAO"."CODIGOQUESTIONARIO"'
    end
  end
  object Geral2: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Left = 224
    Top = 120
  end
  object Geral3: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    Left = 224
    Top = 176
  end
end
