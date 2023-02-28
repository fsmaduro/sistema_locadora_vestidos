object frmDtmRelatorios: TfrmDtmRelatorios
  Left = 0
  Top = 0
  Caption = 'frmDtmRelatorios'
  ClientHeight = 415
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object qryRelArara: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      'Select A.codigo,'
      '       A.dataregistro,'
      '       A.codigoagenda,'
      '       ag.data,'
      '       ag.hora,'
      '       A.codigoperfil||'#39' - '#39'||p.nome as Perfil,'
      '       p.urlfoto as FotoPerfil,'
      '       e.nome as Evento,'
      '       tc.nome as TipoConvidado,'
      '       ad.codigoproduto||'#39' - '#39'||pr.descricao as Produto,'
      '       (Select First 1 pf.urlfoto'
      '          from tabprodutofotos pf'
      
        '          left join tabtipofoto tf on pf.codigotipofoto = tf.cod' +
        'igo'
      '         where pf.codigoproduto = ad.codigoproduto'
      '           and tf.usarnaarara = 1'
      '         order by pf.id) as UrlFoto'
      '  from TabArara a'
      '  left join tabperfil p on a.codigoperfil = p.codigo'
      '  left join tabagenda ag on a.codigoagenda = ag.codigo'
      
        '  left join tabpedidoagendamento pa on ag.idpedidoagenda = pa.co' +
        'digo'
      
        '  left join tabacompanhantespedidoagenda ac on pa.codigo = ac.co' +
        'digopedido and a.codigoperfil = ac.codigoperfil'
      '  left join tabevento e on pa.codigoevento = e.codigo'
      
        '  left join tabtipoconvidado tc on ac.codigotipoconvidado = tc.c' +
        'odigo'
      '  left join tabararadetalhe ad on a.codigo = ad.codigoarara'
      '  left join tabprodutos pr on ad.codigoproduto = pr.codigo'
      'where A.codigo = :codigoArara'
      ''
      'order by ad.codigoproduto')
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoArara'
        ParamType = ptUnknown
      end>
    object qryRelAraraCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABARARA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelAraraDATAREGISTRO: TDateField
      FieldName = 'DATAREGISTRO'
      Origin = '"TABARARA"."DATAREGISTRO"'
    end
    object qryRelAraraCODIGOAGENDA: TIntegerField
      FieldName = 'CODIGOAGENDA'
      Origin = '"TABARARA"."CODIGOAGENDA"'
    end
    object qryRelAraraDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABAGENDA"."DATA"'
    end
    object qryRelAraraHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"TABAGENDA"."HORA"'
    end
    object qryRelAraraPERFIL: TIBStringField
      FieldName = 'PERFIL'
      ProviderFlags = []
      Size = 64
    end
    object qryRelAraraEVENTO: TIBStringField
      FieldName = 'EVENTO'
      Origin = '"TABEVENTO"."NOME"'
      Size = 50
    end
    object qryRelAraraTIPOCONVIDADO: TIBStringField
      FieldName = 'TIPOCONVIDADO'
      Origin = '"TABTIPOCONVIDADO"."NOME"'
    end
    object qryRelAraraPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      ProviderFlags = []
      Size = 214
    end
    object qryRelAraraURLFOTO: TMemoField
      FieldName = 'URLFOTO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object qryRelAraraFOTOPERFIL: TIBStringField
      FieldName = 'FOTOPERFIL'
      Origin = '"TABPERFIL"."URLFOTO"'
      Size = 200
    end
  end
  object dtsRelArara: TDataSource
    DataSet = qryRelArara
    Left = 96
    Top = 24
  end
  object pipRelArara: TppDBPipeline
    DataSource = dtsRelArara
    OpenDataSource = False
    UserName = 'pipRelArara'
    Left = 128
    Top = 24
    object pipRelArarappField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField2: TppField
      FieldAlias = 'DATAREGISTRO'
      FieldName = 'DATAREGISTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField3: TppField
      FieldAlias = 'CODIGOAGENDA'
      FieldName = 'CODIGOAGENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField5: TppField
      FieldAlias = 'HORA'
      FieldName = 'HORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField6: TppField
      FieldAlias = 'PERFIL'
      FieldName = 'PERFIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField7: TppField
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField8: TppField
      FieldAlias = 'TIPOCONVIDADO'
      FieldName = 'TIPOCONVIDADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField9: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField10: TppField
      FieldAlias = 'URLFOTO'
      FieldName = 'URLFOTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pipRelArarappField11: TppField
      FieldAlias = 'FOTOPERFIL'
      FieldName = 'FOTOPERFIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object rbiRelArara: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '6350'
      '101115'
      '195880')
    DataPipeline = pipRelArara
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Portuguese (Brazil)'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = False
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
    Left = 160
    Top = 24
    Version = '16.01'
    mmColumnWidth = 94766
    DataPipelineName = 'pipRelArara'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 27517
        mmLeft = 0
        mmTop = 10583
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground
      end
      object ppShape2: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 10583
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground
      end
      object ppShape4: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape4'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 37831
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        Caption = 'PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127793
        mmTop = 38360
        mmWidth = 28840
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'FICHA DE ATENDIMENTO - ARARA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7673
        mmLeft = 88900
        mmTop = 794
        mmWidth = 106627
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'CODIGO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 5821
        mmLeft = 23813
        mmTop = 19844
        mmWidth = 29104
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 2646
        mmTop = 19844
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Data de Reg.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 28575
        mmWidth = 22754
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'DATAREGISTRO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 26458
        mmTop = 28575
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 27517
        mmLeft = 54240
        mmTop = 10583
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Caption = 'Dados da Arara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 15610
        mmTop = 11377
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'Dados da Agenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 82815
        mmTop = 11377
        mmWidth = 29633
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 27517
        mmLeft = 141552
        mmTop = 10583
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 55563
        mmTop = 17463
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'CODIGOAGENDA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 55827
        mmTop = 21960
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'DATA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 78846
        mmTop = 21960
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'HORA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 110067
        mmTop = 21960
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 17463
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 54240
        mmTop = 27252
        mmWidth = 202142
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 76729
        mmTop = 16404
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 107686
        mmTop = 16404
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        Caption = 'Evento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 28046
        mmWidth = 10848
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'EVENTO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 78581
        mmTop = 32544
        mmWidth = 61913
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Caption = 'Dados do Perfil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 186002
        mmTop = 11377
        mmWidth = 25665
        BandType = 0
        LayerName = Foreground
      end
      object ppShape3: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape3'
        mmHeight = 27517
        mmLeft = 256382
        mmTop = 10583
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppImage1: TppImage
        OnPrint = ppImage1Print
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 26987
        mmLeft = 256647
        mmTop = 10848
        mmWidth = 27516
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Caption = 'Perfil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 143404
        mmTop = 17463
        mmWidth = 8732
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'PERFIL'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 143669
        mmTop = 21960
        mmWidth = 111654
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        Caption = 'Tipo de Convidado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 143404
        mmTop = 28046
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'TIPOCONVIDADO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 143404
        mmTop = 32544
        mmWidth = 111919
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        Caption = 'Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 55563
        mmTop = 28046
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        DataField = 'CODIGOAGENDA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 55827
        mmTop = 32544
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 142875
      mmPrintPosition = 0
      object ppShape5: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape5'
        mmHeight = 48419
        mmLeft = 790
        mmTop = 94444
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        DataField = 'PRODUTO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 18257
        mmLeft = 10848
        mmTop = 793
        mmWidth = 82550
        BandType = 4
        LayerName = Foreground
      end
      object ppImage2: TppImage
        OnPrint = ppImage2Print
        DesignLayer = ppDesignLayer1
        UserName = 'Image2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 74083
        mmLeft = 791
        mmTop = 20107
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        Caption = 'Anota'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 2646
        mmTop = 95515
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 103451
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 108209
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 117731
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 112971
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 137831
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 132806
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 127781
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppLine13: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 790
        mmTop = 122756
        mmWidth = 92604
        BandType = 4
        LayerName = Foreground
      end
      object ppShape6: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape6'
        mmHeight = 6615
        mmLeft = 1589
        mmTop = 1852
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261938
        mmTop = 1323
        mmWidth = 20108
        BandType = 8
        LayerName = Foreground
      end
      object ppLine17: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        VarType = vtPrintDateTime
        DisplayFormat = #39'Impresso em'#39' dd '#39'de'#39' MMMM '#39'de'#39' yyyy '#39#224's'#39' hh:mm:ss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 68263
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label16'
        Caption = 'AMVSystem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 133615
        mmTop = 1323
        mmWidth = 16933
        BandType = 8
        LayerName = Foreground
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650614
        44657461696C4265666F726547656E65726174650B50726F6772616D54797065
        070B747450726F63656475726506536F75726365066970726F63656475726520
        44657461696C4265666F726547656E65726174653B0D0A626567696E0D0A2020
        202F2F496D616765322E506963747572652E4C6F616446726F6D46696C652870
        697052656C41726172615B2755524C464F544F275D293B0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060644657461696C094576656E744E616D6506
        0E4265666F726547656E6572617465074576656E744944021A08436172657450
        6F730102060203000001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D6506144865616465724265666F726547656E65726174650B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365066770
        726F636564757265204865616465724265666F726547656E65726174653B0D0A
        626567696E0D0A20202F2F496D616765312E506963747572652E4C6F61644672
        6F6D46696C652870697052656C41726172615B2750455246494C275D293B0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060648656164657209457665
        6E744E616D65060E4265666F726547656E6572617465074576656E744944021A
        084361726574506F730102050203000000}
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryOrdemServico: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      'Select o.codigo,'
      '  o.codigoperfil||'#39' - '#39'||p.nome as Perfil,'
      '  d.CODIGOSERVICO||'#39' - '#39'||s.decricao as Servico,'
      '  o.detalhamento, '
      '  o.numeroprestador,'
      '  o.data,'
      '  o.datainicio,'
      '  o.horainicio,'
      '  o.datafim,'
      '  o.horafim,'
      '  o.observacoes,'
      '  Trim(Case when o.situacao = 1 then '#39'Em Aberto'#39
      '            when o.situacao = 2 then '#39'Agendada'#39
      '            when o.situacao = 3 then '#39'Finalizada'#39
      '            when o.situacao = 4 then '#39'Cancelada'#39
      '            else '#39#39' end) as Situacao,'
      '  d.codigoproduto,'
      '  pr.descricao,'
      '  d.valorservico,'
      '  Coalesce(c.endereco,'#39#39')||'#39', '#39'||'
      '  Coalesce(p.numero,'#39'S/N'#39')||'#39' - '#39'||'
      '  Coalesce(c.bairro,'#39#39')||'#39' - '#39'||'
      '  Coalesce(m.nome,'#39#39')||'#39' / '#39'||'
      '  Coalesce(m.uf,'#39#39')||'#39' - CEP.: '#39'||'
      '  Coalesce(p.cep,'#39#39') as endereco,'
      '  '#39'Res.: '#39'||Coalesce(P.telresidencial,'#39#39')||'#39' - Cel.: '#39'||'
      '  Coalesce(p.telcelular,'#39#39')||'#39' - Com.: '#39'||'
      '  Coalesce(p.telcomercial,'#39#39')||'#39' - Rec.: '#39'||'
      
        '  Coalesce(p.telrecado,'#39#39')||'#39' ('#39'||Coalesce(p.pessoarecado,'#39#39')||'#39 +
        ')'#39' as Telefones,'
      '  p.email1, p.PESSOARECADO'
      ''
      'from tabos O'
      'left join tabperfil p on o.codigoperfil = p.codigo'
      'left join tabcep c on p.cep = c.cep'
      'left join tabmunicipios m on c.codigomunicipio = m.codigo'
      'left join tabosdetalhe d on o.codigo = d.codigoos'
      'left join tabservico s on d.CODIGOSERVICO = s.codigo'
      'left join tabprodutos pr on d.codigoproduto = pr.codigo'
      'where o.codigo = :codigoos'
      ''
      'order by o.codigo')
    Left = 64
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoos'
        ParamType = ptUnknown
      end>
    object qryOrdemServicoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABOS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrdemServicoPERFIL: TIBStringField
      FieldName = 'PERFIL'
      ProviderFlags = []
      Size = 64
    end
    object qryOrdemServicoSERVICO: TIBStringField
      FieldName = 'SERVICO'
      ProviderFlags = []
      Size = 114
    end
    object qryOrdemServicoDETALHAMENTO: TIBStringField
      FieldName = 'DETALHAMENTO'
      Origin = '"TABSERVICO"."DETALHAMENTO"'
      ProviderFlags = []
      Size = 200
    end
    object qryOrdemServicoNUMEROPRESTADOR: TIBStringField
      FieldName = 'NUMEROPRESTADOR'
      Origin = '"TABOS"."NUMEROPRESTADOR"'
    end
    object qryOrdemServicoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABOS"."DATA"'
    end
    object qryOrdemServicoDATAINICIO: TDateField
      FieldName = 'DATAINICIO'
      Origin = '"TABOS"."DATAINICIO"'
    end
    object qryOrdemServicoHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = '"TABOS"."HORAINICIO"'
    end
    object qryOrdemServicoDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Origin = '"TABOS"."DATAFIM"'
    end
    object qryOrdemServicoHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = '"TABOS"."HORAFIM"'
    end
    object qryOrdemServicoSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      ProviderFlags = []
      Size = 10
    end
    object qryOrdemServicoCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = '"TABOSDETALHE"."CODIGOPRODUTO"'
    end
    object qryOrdemServicoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TABPRODUTOS"."DESCRICAO"'
      Size = 200
    end
    object qryOrdemServicoVALORSERVICO: TIBBCDField
      FieldName = 'VALORSERVICO'
      Origin = '"TABOSDETALHE"."VALORSERVICO"'
      Precision = 18
      Size = 2
    end
    object qryOrdemServicoOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = '"TABOS"."OBSERVACOES"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryOrdemServicoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      ProviderFlags = []
      Size = 173
    end
    object qryOrdemServicoTELEFONES: TIBStringField
      FieldName = 'TELEFONES'
      ProviderFlags = []
      Size = 116
    end
    object qryOrdemServicoEMAIL1: TIBStringField
      FieldName = 'EMAIL1'
      Origin = '"TABPERFIL"."EMAIL1"'
      Size = 50
    end
    object qryOrdemServicoPESSOARECADO: TIBStringField
      FieldName = 'PESSOARECADO'
      Origin = '"TABPERFIL"."PESSOARECADO"'
    end
  end
  object dtsOrdemServico: TDataSource
    DataSet = qryOrdemServico
    Left = 96
    Top = 56
  end
  object pipOrdemServico: TppDBPipeline
    DataSource = dtsOrdemServico
    OpenDataSource = False
    UserName = 'pipOrdemServico'
    Left = 128
    Top = 56
    object pipOrdemServicoppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField2: TppField
      FieldAlias = 'PERFIL'
      FieldName = 'PERFIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField3: TppField
      FieldAlias = 'SERVICO'
      FieldName = 'SERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField4: TppField
      FieldAlias = 'DETALHAMENTO'
      FieldName = 'DETALHAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField5: TppField
      FieldAlias = 'NUMEROPRESTADOR'
      FieldName = 'NUMEROPRESTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField6: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField7: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField8: TppField
      FieldAlias = 'HORAINICIO'
      FieldName = 'HORAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField9: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField10: TppField
      FieldAlias = 'HORAFIM'
      FieldName = 'HORAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField11: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField12: TppField
      FieldAlias = 'CODIGOPRODUTO'
      FieldName = 'CODIGOPRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField13: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField14: TppField
      FieldAlias = 'VALORSERVICO'
      FieldName = 'VALORSERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField15: TppField
      FieldAlias = 'OBSERVACOES'
      FieldName = 'OBSERVACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField16: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField17: TppField
      FieldAlias = 'TELEFONES'
      FieldName = 'TELEFONES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField18: TppField
      FieldAlias = 'EMAIL1'
      FieldName = 'EMAIL1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pipOrdemServicoppField19: TppField
      FieldAlias = 'PESSOARECADO'
      FieldName = 'PESSOARECADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object rbiOrdemServico: TppReport
    AutoStop = False
    DataPipeline = pipOS
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
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = rbiOrdemServicoBeforePrint
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = False
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
    Left = 160
    Top = 56
    Version = '16.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipOS'
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 117475
      mmPrintPosition = 0
      object ppSubReport3: TppSubReport
        DesignLayer = ppDesignLayer2
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 72683
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pipOrdemServico
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
          Version = '16.01'
          mmColumnWidth = 0
          DataPipelineName = 'pipOrdemServico'
          object ppHeaderBand3: TppHeaderBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object ppLabel28: TppLabel
              DesignLayer = ppDesignLayer7
              UserName = 'Label28'
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 3969
              mmLeft = 4498
              mmTop = 0
              mmWidth = 11906
              BandType = 0
              LayerName = Foreground5
            end
            object ppLabel29: TppLabel
              DesignLayer = ppDesignLayer7
              UserName = 'Label29'
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 3969
              mmLeft = 24077
              mmTop = 0
              mmWidth = 15346
              BandType = 0
              LayerName = Foreground5
            end
            object ppLabel30: TppLabel
              DesignLayer = ppDesignLayer7
              UserName = 'Label30'
              Caption = 'Valor do Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              FormField = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 166688
              mmTop = 0
              mmWidth = 24606
              BandType = 0
              LayerName = Foreground5
            end
            object ppLine15: TppLine
              DesignLayer = ppDesignLayer7
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 259
              mmLeft = 0
              mmTop = 8731
              mmWidth = 197300
              BandType = 0
              LayerName = Foreground5
            end
            object ppLabel104: TppLabel
              DesignLayer = ppDesignLayer7
              UserName = 'Label104'
              Caption = 'Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 3969
              mmLeft = 24077
              mmTop = 4498
              mmWidth = 11377
              BandType = 0
              LayerName = Foreground5
            end
          end
          object ppDetailBand7: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 10848
            mmPrintPosition = 0
            object ppDBText11: TppDBText
              DesignLayer = ppDesignLayer7
              UserName = 'DBText11'
              DataField = 'CODIGOPRODUTO'
              DataPipeline = pipOrdemServico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pipOrdemServico'
              mmHeight = 4498
              mmLeft = 4498
              mmTop = 529
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground5
            end
            object ppDBText12: TppDBText
              DesignLayer = ppDesignLayer7
              UserName = 'DBText12'
              DataField = 'DESCRICAO'
              DataPipeline = pipOrdemServico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pipOrdemServico'
              mmHeight = 4498
              mmLeft = 24077
              mmTop = 529
              mmWidth = 140229
              BandType = 4
              LayerName = Foreground5
            end
            object ppDBText13: TppDBText
              DesignLayer = ppDesignLayer7
              UserName = 'DBText13'
              DataField = 'VALORSERVICO'
              DataPipeline = pipOrdemServico
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pipOrdemServico'
              mmHeight = 4498
              mmLeft = 166688
              mmTop = 529
              mmWidth = 24606
              BandType = 4
              LayerName = Foreground5
            end
            object ppDBText78: TppDBText
              DesignLayer = ppDesignLayer7
              UserName = 'DBText78'
              DataField = 'SERVICO'
              DataPipeline = pipOrdemServico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pipOrdemServico'
              mmHeight = 4498
              mmLeft = 24077
              mmTop = 5556
              mmWidth = 167217
              BandType = 4
              LayerName = Foreground5
            end
            object ppLine113: TppLine
              DesignLayer = ppDesignLayer7
              UserName = 'Line113'
              Pen.Style = psDot
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 259
              mmLeft = 0
              mmTop = 10587
              mmWidth = 197300
              BandType = 4
              LayerName = Foreground5
            end
          end
          object ppSummaryBand1: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object ppLabel31: TppLabel
              DesignLayer = ppDesignLayer7
              UserName = 'Label31'
              Caption = 'Total dos Servi'#231'os:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 4233
              mmLeft = 4498
              mmTop = 529
              mmWidth = 31750
              BandType = 7
              LayerName = Foreground5
            end
            object ppLine16: TppLine
              DesignLayer = ppDesignLayer7
              UserName = 'Line2'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 259
              mmLeft = 0
              mmTop = 5821
              mmWidth = 197300
              BandType = 7
              LayerName = Foreground5
            end
            object ppDBCalc1: TppDBCalc
              DesignLayer = ppDesignLayer7
              UserName = 'DBCalc1'
              DataField = 'VALORSERVICO'
              DataPipeline = pipOrdemServico
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pipOrdemServico'
              mmHeight = 4498
              mmLeft = 145786
              mmTop = 529
              mmWidth = 45508
              BandType = 7
              LayerName = Foreground5
            end
          end
          object ppDesignLayers7: TppDesignLayers
            object ppDesignLayer7: TppDesignLayer
              UserName = 'Foreground5'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 0
        mmTop = 17927
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label17'
        Caption = 'ORDEM DE SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 67314
        mmTop = 6692
        mmWidth = 45220
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 18989
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label19'
        Caption = 'N'#250'mero no Prestador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 18989
        mmWidth = 36777
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        DataField = 'CODIGO'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4498
        mmLeft = 20108
        mmTop = 18989
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText15'
        DataField = 'NUMEROPRESTADOR'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4498
        mmLeft = 139171
        mmTop = 18989
        mmWidth = 52095
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel36: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label36'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 54769
        mmTop = 18989
        mmWidth = 8731
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText22: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText22'
        DataField = 'DATA'
        DataPipeline = pipOrdemServico
        DisplayFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4498
        mmLeft = 65088
        mmTop = 18989
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground1
      end
      object ppShape7: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape7'
        Brush.Color = 13092807
        mmHeight = 24357
        mmLeft = 1852
        mmTop = 24303
        mmWidth = 191294
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label20'
        Caption = 'Prestador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 25097
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label201'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 12435
        mmTop = 29859
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label22'
        Caption = 'E-Mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 16404
        mmTop = 34622
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label23'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 11113
        mmTop = 43882
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'PERFIL'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 25097
        mmWidth = 11113
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText23: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText23'
        AutoSize = True
        DataField = 'TELEFONES'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 3705
        mmLeft = 29369
        mmTop = 29859
        mmWidth = 15346
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText24: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'EMAIL1'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 34887
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBMemo3: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'ENDERECO'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 3998
        mmLeft = 29369
        mmTop = 43640
        mmWidth = 161926
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel75: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label75'
        Caption = 'Contato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 13758
        mmTop = 39120
        mmWidth = 12436
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText57: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText57'
        AutoSize = True
        DataField = 'PESSOARECADO'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 3705
        mmLeft = 29369
        mmTop = 39384
        mmWidth = 74613
        BandType = 4
        LayerName = Foreground1
      end
      object ppShape8: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape8'
        Brush.Color = 14540253
        mmHeight = 17939
        mmLeft = 1852
        mmTop = 48432
        mmWidth = 191294
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel25: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label25'
        Caption = 'Detalhamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 49559
        mmWidth = 21696
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBMemo2: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'DETALHAMENTO'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 15875
        mmLeft = 29369
        mmTop = 49559
        mmWidth = 161926
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel27: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label27'
        Caption = 'Data / Hora de Envio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 67276
        mmWidth = 30427
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel26: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label26'
        Caption = 'Data / Hora de Retorno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 91811
        mmTop = 67276
        mmWidth = 34396
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText18'
        DataField = 'DATAINICIO'
        DataPipeline = pipOrdemServico
        DisplayFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4498
        mmLeft = 36248
        mmTop = 67276
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText19'
        DataField = 'HORAINICIO'
        DataPipeline = pipOrdemServico
        DisplayFormat = 'hh:mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4498
        mmLeft = 58738
        mmTop = 67276
        mmWidth = 19818
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText20'
        DataField = 'HORAFIM'
        DataPipeline = pipOS
        DisplayFormat = 'hh:mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipOS'
        mmHeight = 4498
        mmLeft = 150284
        mmTop = 67276
        mmWidth = 17285
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText21'
        DataField = 'DATAFIM'
        DataPipeline = pipOrdemServico
        DisplayFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4498
        mmLeft = 127529
        mmTop = 67276
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground1
      end
      object ppRegion1: TppRegion
        DesignLayer = ppDesignLayer2
        UserName = 'Region1'
        Brush.Style = bsClear
        ParentWidth = True
        Pen.Style = psClear
        ShiftRelativeTo = ppSubReport3
        Stretch = True
        Transparent = True
        mmHeight = 31088
        mmLeft = 0
        mmTop = 79111
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLine18: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1791
          mmLeft = 9264
          mmTop = 104031
          mmWidth = 75936
          BandType = 4
          LayerName = Foreground1
        end
        object ppLabel33: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label33'
          Caption = 'ACHEI MEU VESTIDO EIRELI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4234
          mmLeft = 24871
          mmTop = 104032
          mmWidth = 46831
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText58: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText58'
          AutoSize = True
          DataField = 'PERFIL'
          DataPipeline = pipOS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pipOS'
          mmHeight = 4234
          mmLeft = 141817
          mmTop = 104032
          mmWidth = 12171
          BandType = 4
          LayerName = Foreground1
        end
        object ppLine19: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 2114
          mmLeft = 109812
          mmTop = 104031
          mmWidth = 75936
          BandType = 4
          LayerName = Foreground1
        end
        object ppLabel32: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label32'
          Caption = 'Observa'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 81907
          mmWidth = 22490
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBMemo1: TppDBMemo
          DesignLayer = ppDesignLayer2
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'OBSERVACOES'
          DataPipeline = pipOrdemServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          RemoveEmptyLines = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'pipOrdemServico'
          mmHeight = 10054
          mmLeft = 25135
          mmTop = 81907
          mmWidth = 167482
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          mmLeading = 0
        end
      end
      object ppLine35: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line35'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel77: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label77'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 114155
        mmTop = 6692
        mmWidth = 4762
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText60: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText60'
        DataField = 'CODIGO'
        DataPipeline = pipOrdemServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipOrdemServico'
        mmHeight = 4982
        mmLeft = 119498
        mmTop = 6692
        mmWidth = 11632
        BandType = 4
        LayerName = Foreground1
      end
      object ppImage4: TppImage
        DesignLayer = ppDesignLayer2
        UserName = 'Image4'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D6170B6260000424DB62600000000000036000000280000003A00
          000038000000010018000000000080260000C40E0000C40E0000000000000000
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D0
          46F6D045F6D244F7D344F7D345F6D246F6D046F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D046F6D042F8D53CFADC38FCE234FDE639FCE145F6D14BF3C94BF3C945F6D139
          FCE134FDE638FCE23CFADC42F8D546F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D044F7D33BFBDE32FFEA5FEBB199D169C7BE31EDAD01
          FFA400FFA100FFA100FFA100FFA100FFA400EDAD01C7BE3199D1695FEBB132FF
          EA3BFBDE44F7D347F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D043F7D336FDE44AF4CBA4CD
          5BF5AA00FFA100FFA200FFA100F4AA00D5B81FC0C039B8C443B8C443C0C039D5
          B81FF4AA00FFA100FFA200FFA100F5AA00A4CD5C4AF4CB36FDE443F7D347F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046
          F6D039FBE049F5CDBDC23DFFA200FFA200FDA600B7C5457ADF9046F5CF34FEE7
          36FDE438FCE139FBE039FBE038FCE136FDE434FEE746F5CF7ADF90B7C545FDA6
          00FFA200FFA200BDC23D49F5CD39FBE046F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D043F7D432FFE99DD065FFA300FFA200E7B00980DC
          8836FDE438FCE13FF9D944F7D246F6D047F6D047F6D047F6D047F6D047F6D047
          F6D046F6D044F7D23FF9D938FCE136FDE480DC88E7B009FFA200FFA3009DD065
          32FEE943F7D447F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D03EF9DA47F5CEE4
          B10DFFA200F7A9007FDD8A2FFFEC3EF9DA46F6D147F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6
          D13EF9DA2FFFEC7FDD8AF7A900FFA200E4B10D48F5CE3EF9DA47F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D03AFBDF62EAAEFFA500FFA200BFC13B39FCE13DFADB46F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D03DFADB39FCE1BFC13B
          FFA200FFA50061EAAE3AFBDF47F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D03AFBDF6EE59FFFA300FFA20086
          DA8131FFEA45F6D147F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D045F6D131FFEA87DA81FFA200FFA3006DE5A03AFBDF47
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          3DF9DB64E9ABFFA200FFA30068E7A638FCE246F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D0
          38FCE268E7A6FFA300FFA20064E9AB3DF9DB47F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D042F7D54AF4CCFFA500FFA20067E7A73AFBDF46
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D046F6D03AFBDF67E7A7FFA200FFA5004A
          F4CC42F7D547F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D133FEE7
          E8AF07FFA20081DC8738FCE147F6D046F6D043F7D443F7D443F7D443F7D443F7
          D443F7D443F7D346F6D047F6D047F6D047F6D047F6D046F6D046F6D047F6D047
          F6D047F6D047F6D044F7D343F7D443F7D443F7D443F7D443F7D443F7D443F7D4
          46F6D047F6D038FCE181DC87FFA200E8AF0733FEE746F6D147F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D037FCE2A7CC59FFA200B7C54532FEE946F6D046F6D044
          F7D365E8A95EEBB354EFBF53F0C053F0C059EDB864E9AB44F7D346F6D047F6D0
          47F6D046F6D044F7D348F5CE46F6D047F6D047F6D044F7D35DECB45CECB453F0
          C053F0C053F0C054F0BF5EEBB365E8A944F7D346F6D046F6D032FEE9B7C544FF
          A200A6CC5937FCE247F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D043F7D450F1C4FFA200
          F3AA0035FDE545F6D147F6D046F6D043F7D475E196A8CB57FF9E00FFA400FFA2
          00DDB4166EE49F42F7D546F6D047F6D047F6D03EF9DA93D4718DD7783FF9D947
          F6D047F6D043F7D462EAAEC2C037FFA100FFA500FFA400FF9E00ABCA5376E195
          43F7D446F6D047F6D045F6D135FDE5F3AA00FFA20050F1C443F7D447F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D046F6D034FEE6C9BD2EFFA20073E2983EF9DA47F6D047F6D047F6D046
          F6D041F8D637FCE35CECB5FFA400FFA50052F0C13DFADB46F6D047F6D047F6D0
          46F6D030FFEBEDAD02CDBB2935FDE647F6D047F6D047F6D042F7D52DFFEFFFA4
          00EFAC00FFA4005FEBB236FDE441F8D646F6D047F6D047F6D047F6D03EF9DA73
          E298FFA200C9BD2E34FEE646F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D043F7D454F0BFFFA100DCB516
          31FFEB46F6D047F6D047F6D047F6D047F6D047F6D046F6D034FDE6B5C647FFA4
          0084DB843EF9DA47F6D047F6D047F6D040F8D76BE6A3FFA400FFA30049F4CC44
          F7D347F6D047F6D042F8D65EECB3FFA500F6A900BAC34034FEE746F6D047F6D0
          47F6D047F6D047F6D047F6D046F6D031FFEBDCB516FFA10054F0BF43F7D447F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D039FBE0B2C74AFFA20074E2973FF9D847F6D047F6D047F6D047F6D047
          F6D047F6D047F6D043F7D451F1C3FFA200E3B20E31FFEB46F6D047F6D046F6D0
          34FEE6CDBB29F5AA00FFA500A9CB5639FBE047F6D047F6D038FCE2B7C544F6A9
          00FFA40057EEBA42F7D547F6D047F6D047F6D047F6D047F6D047F6D047F6D03F
          F9D874E297FFA200B2C74B39FBE047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D046F6D137FCE3FDA600F4AA0033FEE8
          46F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D034FEE7CDBB
          2AFFA10060EAB041F8D647F6D043F7D450F1C3FFA300F6A90099D26AFFA2003A
          FBDF45F6D145F6D13CFADDFFA500F4AA00D5B81F32FEE846F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D046F6D033FEE8F4AA00FDA60037FCE346F6
          D147F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D040F8D76FE49EFFA200A9CB553AFBDF47F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D041F8D767E8A8FFA100BEC23C37FCE347F6D038FCE1
          B2C74AFEA600B9C44131FFEAFF9F0092D5723CFADC3DF9DB8CD87AFBA700FFA5
          0071E39A40F8D847F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D03AFBDFA9CA55FFA2006FE49E40F8D747F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D03BFBDEA9CB56FFA2006BE6A241F8D7
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D032FF
          E9E3B20EFFA30041F8D643F7D43EF9DAFFA500FFA40062EAAD31FFEAC0C139F7
          A90033FEE831FFEAE3B20DF5AA00ECAE0333FEE846F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D041F8D76BE5A2FFA200A9CB563BFB
          DE47F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D036FDE4D7B71DFFA2003AFBDF45F6D147F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D03EF9DA7FDD8AFFA10098D26B31FFEA96D36C
          FEA600E7B00931FFEA41F8D660EAB0FF9D0074E29758EEBAFFA400FBA7008DD7
          783DFADB47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D045F6D13AFBDFFFA200D7B71D36FDE447F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D046F6D033FEE8FEA600E5B00B33FEE747F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6
          D032FEE8F7A900F2AB001FFFFFF4AA00FDA6008ED7773DFADB46F6D031FFEAE6
          B00AD4B81FA8CB57F7A900FDA60037FCE245F6D147F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D033FEE7E5B00BFEA60033FE
          E846F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D045F6
          D245F6D1FFA200C5BE3338FCE247F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D03CFADD97D36CFFA300B0C84DF8A800
          FFA5003DFADB45F6D247F6D03EF9DA85DA82FFA400F2AB00F8A800A9CB563AFB
          E047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D038FCE2C5BE33FFA20045F6D145F6D247F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D043F7D456EEBCFFA100B1C74C3AFBDF47F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D045F6D23DFADCFFA600F6A900F6A900BAC44037FCE247F6D047F6D045F6D138
          FCE1FAA700F1AC00FFA40049F4CC44F7D347F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D03AFBDFB1C74CFFA10056EE
          BC43F7D447F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D042F7
          D55DECB4FFA100A9CA563BFBDE47F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D038FCE1AFC84EF7A900FFA400
          60EBAF41F8D647F6D047F6D047F6D039FBE1B1C74BFEA600BCC33E35FDE547F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D03BFBDEA9CA56FFA1005DECB442F7D547F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D042F7D55DECB4FFA100A9CA563BFBDE47F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D041F8D653F1C0FFA200DEB41331FFEA46F6D047F6D047F6D046F6D03B
          FBDE54EFBFFF9F00A6CC5938FCE147F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D03BFBDEA9CA56FFA1005DEC
          B442F7D547F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D043F7
          D456EEBCFFA100B1C74C3AFBDF47F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D045F6D14AF4CB2FFFEDCFBA27FBA700
          38FCE245F6D147F6D047F6D03DFADC94D46F27FFF7D8B71CFFA3003DFADC45F6
          D247F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D03AFBDFB1C74CFFA10056EEBC43F7D447F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D045F6D245F6D1FFA200C5BE3338FCE247F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D03AFBDFBAC3415FEBB162EAAEFF9E0085DA823EF9DA47F6D045F6D23DFADBFF
          9C004BF4CA6FE49DFFA00097D36C3CFADD47F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D038FCE2C5BE33FFA20045F6
          D145F6D247F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D046F6
          D033FEE8FEA600E5B00B33FEE747F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D045F6D137FCE2FFA300C1C03821FFFEE2B20F
          E6B00A31FFEA46F6D03DFADB8ED777FFA300B4C64727FFF7F2AB00F7A90032FE
          E846F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D033FEE7E5B00BFEA60033FEE846F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D036FDE4D7B71DFFA2003AFBDF45F6D1
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D03DFA
          DB8DD778FCA700FFA2003EF9DA77E093FF9D0060EAB041F8D631FFEAE7B009FE
          A6009DD06432FFE998D26AFFA1007FDD8A3EF9DA47F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D045F6D13AFBDFFFA200D7B71D36FD
          E447F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D03BFBDEA9CB56FFA2006BE6A241F8D747F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D046F6D033FEE8ECAE03F5AA00E4B10D34FDE633FEE8
          F7A900C0C13931FFEA62EAADFFA400FFA5003EF9DA43F7D441F8D6FFA300E3B2
          0E32FFE946F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D041F8D76BE5A2FFA200A9CB563BFBDE47F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D040F8D76FE49EFFA200A9CB553AFBDF
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D040F8D871E3
          9AFFA500FBA7008BD87A3DF9DB3CFADC92D572FF9F0031FFEAB9C441FEA600B2
          C74A38FCE147F6D037FCE3BEC23CFFA10067E8A841F8D747F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D03AFBDFA9CA55FFA2006FE49E40F8
          D747F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D046F6D137FCE3FDA600F4AA0033FEE846F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D046F6D032FEE8D5B81FF4AA00FFA5003CFADD45F6D145F6D1
          3AFBDFFFA20099D26AF6A900FFA30050F1C343F7D447F6D041F8D660EAB0FFA1
          00CDBB2A34FEE747F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046
          F6D033FEE8F4AA00FDA60037FCE346F6D147F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D039FBE0B2C74AFFA20074E297
          3FF9D847F6D047F6D047F6D047F6D047F6D047F6D047F6D042F7D558EEBAFFA4
          00F6A900B7C54438FCE247F6D047F6D039FBE0A9CB56FFA500F5AA00CDBB2934
          FEE646F6D047F6D046F6D031FFEBE3B20EFFA20051F1C343F7D447F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D03FF9D874E297FFA200B2C74B39FBE047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D043F7D454F0BFFFA100DCB51631FFEB46F6D047F6D047F6D047F6D047
          F6D047F6D046F6D034FEE7BAC341F6A900FFA5005EECB342F8D647F6D047F6D0
          44F7D349F4CCFFA300FFA4006AE6A340F8D747F6D047F6D047F6D03EF9DA84DB
          84FFA400B5C64734FDE646F6D047F6D047F6D047F6D047F6D047F6D046F6D031
          FFEBDCB516FFA10054F0BF43F7D447F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D046F6D034FEE6C9BD2EFFA200
          73E2983EF9DA47F6D047F6D047F6D046F6D041F8D636FDE45FEBB1FFA400EFAC
          00FFA4002DFFEF42F7D547F6D047F6D047F6D035FDE6CDBB29EDAD0231FFEB46
          F6D047F6D047F6D046F6D03DFADB52F0C0FFA500FFA4005CECB537FCE341F8D6
          46F6D047F6D047F6D047F6D03EF9DA73E298FFA200C9BD2E34FEE646F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D043F7D450F1C4FFA200F3AA0035FDE545F6D147F6D046F6D043
          F7D476E195ABCA53FF9E00FFA400FFA500FFA100C2C03762EAAE43F7D447F6D0
          47F6D03FF9D98DD77893D4713EF9DA47F6D047F6D046F6D042F7D56EE49FDCB4
          16FFA200FFA400FF9E00A8CB5775E19643F7D446F6D047F6D045F6D135FDE5F3
          AA00FFA20050F1C443F7D447F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D037FCE2A7CC59
          FFA200B7C54532FEE946F6D046F6D044F7D365E8A95EEBB354EFBF53F0C053F0
          C053F0C05DECB45DECB444F7D347F6D047F6D046F6D048F5CE44F7D346F6D047
          F6D047F6D046F6D044F7D364E9AB59EDB853F0C053F0C054EFBE5EEBB365E8A9
          44F7D346F6D046F6D032FEE9B7C544FFA200A6CC5937FCE247F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D046F6D133FEE7E8AF07FFA20081DC8738FCE147F6D046
          F6D043F7D443F7D443F7D443F7D443F7D443F7D443F7D444F7D347F6D047F6D0
          47F6D047F6D046F6D046F6D047F6D047F6D047F6D047F6D046F6D043F7D343F7
          D443F7D443F7D443F7D443F7D443F7D446F6D047F6D038FCE181DC87FFA200E8
          AF0733FEE746F6D147F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D042F7D5
          4AF4CCFFA500FFA20067E7A73AFBDF46F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          46F6D03AFBDF67E7A7FFA200FFA5004AF4CC42F7D547F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D03DF9DB64E9ABFFA200FFA30068E7A638
          FCE246F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D046F6D038FCE268E7A6FFA300FFA20064E9AB3D
          F9DB47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D03AFBDF6DE5A0FFA300FFA20086DA8131FFEA45F6D147F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D045F6D131FFEA
          87DA81FFA200FFA3006EE59F3AFBDF47F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D03AFBDF62EAAEFFA500FF
          A200BFC13B39FCE13DFADB46F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D046F6D03DFADB39FCE1BFC13BFFA200FFA50061EAAE3AFBDF47F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D03EF9DA47F5CEE4B10DFFA200F7A9007EDD8A2FFFEC3EF9
          DA46F6D147F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D046F6D13EF9DA2FFFEC7EDD8AF7A900FFA200
          E4B10D48F5CE3EF9DA47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D043F7D432
          FFE99DD065FFA300FFA200E7B00980DD8836FDE438FCE13FF9D944F7D246F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D046F6D044F7D23FF9D938FCE136FD
          E480DD88E7B009FFA200FFA3009DD06532FEE943F7D447F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D046F6D039FBE049F5CDBDC23DFFA200FFA2
          00FDA600B7C5457ADF9046F5CF34FEE736FDE438FCE139FBE039FBE038FCE136
          FDE434FEE746F5CF7ADF90B7C545FDA600FFA200FFA200BDC23D49F5CD39FBE0
          46F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D043F7D336FDE44AF4CBA4CD5BF5AA00FFA100FFA200FFA100F4AA00
          D5B81FC0C039B8C443B8C443C0C039D5B81FF4AA00FFA100FFA200FFA100F5AA
          00A4CD5C4AF4CB36FDE443F7D347F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D044F7D33BFB
          DE32FFEA5FEBB199D169C7BE31EDAD01FFA400FFA100FFA100FFA100FFA100FF
          A400EDAD01C7BE3199D1695FEBB132FFEA3BFBDE44F7D347F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D046F6D042F8D53CFADC38FCE234FDE6
          39FCE145F6D14BF3C94BF3C945F6D139FCE134FDE638FCE23CFADC42F8D546F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D046F6D046F6D045F6D244F7D344F7D345F6D246
          F6D046F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          0000}
        mmHeight = 17359
        mmLeft = 242
        mmTop = 445
        mmWidth = 24622
        BandType = 4
        LayerName = Foreground1
      end
      object ppRegion3: TppRegion
        DesignLayer = ppDesignLayer2
        UserName = 'Region3'
        Pen.Style = psClear
        ShiftRelativeTo = ppRegion1
        mmHeight = 6124
        mmLeft = 0
        mmTop = 110822
        mmWidth = 197957
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLine45: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line45'
          Pen.Style = psDot
          ParentWidth = True
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 3243
          mmLeft = 0
          mmTop = 112251
          mmWidth = 197957
          BandType = 4
          LayerName = Foreground1
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 1323
        mmWidth = 20108
        BandType = 8
        LayerName = Foreground1
      end
      object ppLabel35: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label35'
        Caption = 'AMVSystem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 112447
        mmTop = 1323
        mmWidth = 16933
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable4'
        VarType = vtPrintDateTime
        DisplayFormat = #39'Impresso em'#39' dd '#39'de'#39' MMMM '#39'de'#39' yyyy '#39#224's'#39' hh:mm:ss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 68263
        BandType = 8
        LayerName = Foreground1
      end
      object ppLine20: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line20'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
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
    object ppParameterList2: TppParameterList
    end
  end
  object ppDBOrcamentoDetalhe: TppDBPipeline
    DataSource = dtsOrcamentoDetalhe
    UserName = 'ppDBOrcamentoDetalhe'
    Left = 136
    Top = 154
  end
  object ppDBOrcamento: TppDBPipeline
    DataSource = dtsOrcamento
    UserName = 'ppDBOrcamento'
    Left = 134
    Top = 111
  end
  object rbiOrcamento: TppReport
    AutoStop = False
    DataPipeline = ppDBOrcamento
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
    BeforePrint = rbiOrcamentoBeforePrint
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = rbiOrcamentoPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 171
    Top = 112
    Version = '16.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDBOrcamento'
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 66411
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        DesignLayer = ppDesignLayer3
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBOrcamentoDetalhe'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 29362
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground2
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDBOrcamentoDetalhe
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
          Version = '16.01'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBOrcamentoDetalhe'
          object ppTitleBand6: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLine28: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line28'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 259
              mmLeft = 0
              mmTop = 4239
              mmWidth = 197300
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine27: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line27'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 259
              mmLeft = 0
              mmTop = 4239
              mmWidth = 197300
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine29: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line29'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 0
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine30: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line30'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 4498
              mmLeft = 193411
              mmTop = 0
              mmWidth = 4233
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine31: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line31'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 10319
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine32: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line32'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 28575
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine33: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line33'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 121973
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine34: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line34'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 149754
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground4
            end
            object ppLabel42: TppLabel
              DesignLayer = ppDesignLayer8
              UserName = 'Label42'
              Caption = 'Id'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 3969
              mmTop = 575
              mmWidth = 3175
              BandType = 1
              LayerName = Foreground4
            end
            object ppLabel43: TppLabel
              DesignLayer = ppDesignLayer8
              UserName = 'Label43'
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 13758
              mmTop = 575
              mmWidth = 11907
              BandType = 1
              LayerName = Foreground4
            end
            object ppLabel44: TppLabel
              DesignLayer = ppDesignLayer8
              UserName = 'Label44'
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 68792
              mmTop = 575
              mmWidth = 14552
              BandType = 1
              LayerName = Foreground4
            end
            object ppLabel45: TppLabel
              DesignLayer = ppDesignLayer8
              UserName = 'Label45'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 132292
              mmTop = 575
              mmWidth = 7673
              BandType = 1
              LayerName = Foreground4
            end
            object ppLine111: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line111'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 1549
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 1
              LayerName = Foreground4
            end
          end
          object ppDetailBand8: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppLine36: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line36'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 0
              mmTop = 0
              mmWidth = 3977
              BandType = 4
              LayerName = Foreground4
            end
            object ppLine37: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line37'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 1077
              mmLeft = 0
              mmTop = 3682
              mmWidth = 197300
              BandType = 4
              LayerName = Foreground4
            end
            object ppLine38: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line102'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 4741
              mmLeft = 193675
              mmTop = 0
              mmWidth = 3954
              BandType = 4
              LayerName = Foreground4
            end
            object ppDBText30: TppDBText
              DesignLayer = ppDesignLayer8
              UserName = 'DBText30'
              DataField = 'ID'
              DataPipeline = ppDBOrcamentoDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBOrcamentoDetalhe'
              mmHeight = 3703
              mmLeft = 1588
              mmTop = 484
              mmWidth = 7658
              BandType = 4
              LayerName = Foreground4
            end
            object ppLine39: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line39'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4453
              mmLeft = 10319
              mmTop = 0
              mmWidth = 1039
              BandType = 4
              LayerName = Foreground4
            end
            object ppLine40: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line203'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4453
              mmLeft = 28575
              mmTop = 0
              mmWidth = 1039
              BandType = 4
              LayerName = Foreground4
            end
            object ppDBText31: TppDBText
              DesignLayer = ppDesignLayer8
              UserName = 'DBText31'
              DataField = 'CODIGOPRODUTO'
              DataPipeline = ppDBOrcamentoDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBOrcamentoDetalhe'
              mmHeight = 3703
              mmLeft = 11906
              mmTop = 484
              mmWidth = 15608
              BandType = 4
              LayerName = Foreground4
            end
            object ppDBText32: TppDBText
              DesignLayer = ppDesignLayer8
              UserName = 'DBText32'
              DataField = 'NOMEPRODUTO'
              DataPipeline = ppDBOrcamentoDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBOrcamentoDetalhe'
              mmHeight = 3703
              mmLeft = 30427
              mmTop = 484
              mmWidth = 90073
              BandType = 4
              LayerName = Foreground4
            end
            object ppDBText33: TppDBText
              DesignLayer = ppDesignLayer8
              UserName = 'DBText33'
              DataField = 'VALOR'
              DataPipeline = ppDBOrcamentoDetalhe
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBOrcamentoDetalhe'
              mmHeight = 3704
              mmLeft = 124354
              mmTop = 484
              mmWidth = 24620
              BandType = 4
              LayerName = Foreground4
            end
            object ppLine41: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line41'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4453
              mmLeft = 121973
              mmTop = 0
              mmWidth = 1834
              BandType = 4
              LayerName = Foreground4
            end
            object ppLine42: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line42'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4453
              mmLeft = 149754
              mmTop = 0
              mmWidth = 1834
              BandType = 4
              LayerName = Foreground4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            Background.Brush.Style = bsClear
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 10583
            mmPrintPosition = 0
            object ppDBCalc2: TppDBCalc
              DesignLayer = ppDesignLayer8
              UserName = 'DBCalc2'
              DataField = 'VALOR'
              DataPipeline = ppDBOrcamentoDetalhe
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBOrcamentoDetalhe'
              mmHeight = 4498
              mmLeft = 124354
              mmTop = 0
              mmWidth = 24088
              BandType = 7
              LayerName = Foreground4
            end
            object ppLine47: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line47'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 0
              mmTop = 0
              mmWidth = 4219
              BandType = 7
              LayerName = Foreground4
            end
            object ppLine48: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line48'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 1077
              mmLeft = 0
              mmTop = 3659
              mmWidth = 197300
              BandType = 7
              LayerName = Foreground4
            end
            object ppLine49: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line49'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 193675
              mmTop = 0
              mmWidth = 3954
              BandType = 7
              LayerName = Foreground4
            end
            object ppMemo3: TppMemo
              DesignLayer = ppDesignLayer8
              UserName = 'Memo3'
              Caption = 'Memo3'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 9
              Font.Style = [fsBold]
              Lines.Strings = (
                'Obs: O Or'#231'amento n'#227'o garante a reserva dos produtos.')
              RemoveEmptyLines = False
              Stretch = True
              Transparent = True
              mmHeight = 3817
              mmLeft = 1452
              mmTop = 0
              mmWidth = 89477
              BandType = 7
              LayerName = Foreground4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmMinHeight = 0
              mmLeading = 0
            end
            object ppLine44: TppLine
              DesignLayer = ppDesignLayer8
              UserName = 'Line44'
              Visible = False
              Weight = 0.750000000000000000
              mmHeight = 3969
              mmLeft = 1588
              mmTop = 9525
              mmWidth = 13229
              BandType = 7
              LayerName = Foreground4
            end
          end
          object ppDesignLayers8: TppDesignLayers
            object ppDesignLayer8: TppDesignLayer
              UserName = 'Foreground4'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppLine21: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17321
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine22: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine23: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line3'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13229
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine24: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 27969
        mmLeft = 193411
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel37: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label37'
        Caption = 'OR'#199'AMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 13
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5556
        mmLeft = 85461
        mmTop = 6085
        mmWidth = 31018
        BandType = 4
        LayerName = Foreground2
      end
      object ppImage3: TppImage
        DesignLayer = ppDesignLayer3
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D6170B6260000424DB62600000000000036000000280000003A00
          000038000000010018000000000080260000C40E0000C40E0000000000000000
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D0
          46F6D045F6D244F7D344F7D345F6D246F6D046F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D046F6D042F8D53CFADC38FCE234FDE639FCE145F6D14BF3C94BF3C945F6D139
          FCE134FDE638FCE23CFADC42F8D546F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D044F7D33BFBDE32FFEA5FEBB199D169C7BE31EDAD01
          FFA400FFA100FFA100FFA100FFA100FFA400EDAD01C7BE3199D1695FEBB132FF
          EA3BFBDE44F7D347F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D043F7D336FDE44AF4CBA4CD
          5BF5AA00FFA100FFA200FFA100F4AA00D5B81FC0C039B8C443B8C443C0C039D5
          B81FF4AA00FFA100FFA200FFA100F5AA00A4CD5C4AF4CB36FDE443F7D347F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046
          F6D039FBE049F5CDBDC23DFFA200FFA200FDA600B7C5457ADF9046F5CF34FEE7
          36FDE438FCE139FBE039FBE038FCE136FDE434FEE746F5CF7ADF90B7C545FDA6
          00FFA200FFA200BDC23D49F5CD39FBE046F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D043F7D432FFE99DD065FFA300FFA200E7B00980DC
          8836FDE438FCE13FF9D944F7D246F6D047F6D047F6D047F6D047F6D047F6D047
          F6D046F6D044F7D23FF9D938FCE136FDE480DC88E7B009FFA200FFA3009DD065
          32FEE943F7D447F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D03EF9DA47F5CEE4
          B10DFFA200F7A9007FDD8A2FFFEC3EF9DA46F6D147F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6
          D13EF9DA2FFFEC7FDD8AF7A900FFA200E4B10D48F5CE3EF9DA47F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D03AFBDF62EAAEFFA500FFA200BFC13B39FCE13DFADB46F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D03DFADB39FCE1BFC13B
          FFA200FFA50061EAAE3AFBDF47F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D03AFBDF6EE59FFFA300FFA20086
          DA8131FFEA45F6D147F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D045F6D131FFEA87DA81FFA200FFA3006DE5A03AFBDF47
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          3DF9DB64E9ABFFA200FFA30068E7A638FCE246F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D0
          38FCE268E7A6FFA300FFA20064E9AB3DF9DB47F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D042F7D54AF4CCFFA500FFA20067E7A73AFBDF46
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D046F6D03AFBDF67E7A7FFA200FFA5004A
          F4CC42F7D547F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D133FEE7
          E8AF07FFA20081DC8738FCE147F6D046F6D043F7D443F7D443F7D443F7D443F7
          D443F7D443F7D346F6D047F6D047F6D047F6D047F6D046F6D046F6D047F6D047
          F6D047F6D047F6D044F7D343F7D443F7D443F7D443F7D443F7D443F7D443F7D4
          46F6D047F6D038FCE181DC87FFA200E8AF0733FEE746F6D147F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D037FCE2A7CC59FFA200B7C54532FEE946F6D046F6D044
          F7D365E8A95EEBB354EFBF53F0C053F0C059EDB864E9AB44F7D346F6D047F6D0
          47F6D046F6D044F7D348F5CE46F6D047F6D047F6D044F7D35DECB45CECB453F0
          C053F0C053F0C054F0BF5EEBB365E8A944F7D346F6D046F6D032FEE9B7C544FF
          A200A6CC5937FCE247F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D043F7D450F1C4FFA200
          F3AA0035FDE545F6D147F6D046F6D043F7D475E196A8CB57FF9E00FFA400FFA2
          00DDB4166EE49F42F7D546F6D047F6D047F6D03EF9DA93D4718DD7783FF9D947
          F6D047F6D043F7D462EAAEC2C037FFA100FFA500FFA400FF9E00ABCA5376E195
          43F7D446F6D047F6D045F6D135FDE5F3AA00FFA20050F1C443F7D447F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D046F6D034FEE6C9BD2EFFA20073E2983EF9DA47F6D047F6D047F6D046
          F6D041F8D637FCE35CECB5FFA400FFA50052F0C13DFADB46F6D047F6D047F6D0
          46F6D030FFEBEDAD02CDBB2935FDE647F6D047F6D047F6D042F7D52DFFEFFFA4
          00EFAC00FFA4005FEBB236FDE441F8D646F6D047F6D047F6D047F6D03EF9DA73
          E298FFA200C9BD2E34FEE646F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D043F7D454F0BFFFA100DCB516
          31FFEB46F6D047F6D047F6D047F6D047F6D047F6D046F6D034FDE6B5C647FFA4
          0084DB843EF9DA47F6D047F6D047F6D040F8D76BE6A3FFA400FFA30049F4CC44
          F7D347F6D047F6D042F8D65EECB3FFA500F6A900BAC34034FEE746F6D047F6D0
          47F6D047F6D047F6D047F6D046F6D031FFEBDCB516FFA10054F0BF43F7D447F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D039FBE0B2C74AFFA20074E2973FF9D847F6D047F6D047F6D047F6D047
          F6D047F6D047F6D043F7D451F1C3FFA200E3B20E31FFEB46F6D047F6D046F6D0
          34FEE6CDBB29F5AA00FFA500A9CB5639FBE047F6D047F6D038FCE2B7C544F6A9
          00FFA40057EEBA42F7D547F6D047F6D047F6D047F6D047F6D047F6D047F6D03F
          F9D874E297FFA200B2C74B39FBE047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D046F6D137FCE3FDA600F4AA0033FEE8
          46F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D034FEE7CDBB
          2AFFA10060EAB041F8D647F6D043F7D450F1C3FFA300F6A90099D26AFFA2003A
          FBDF45F6D145F6D13CFADDFFA500F4AA00D5B81F32FEE846F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D046F6D033FEE8F4AA00FDA60037FCE346F6
          D147F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D040F8D76FE49EFFA200A9CB553AFBDF47F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D041F8D767E8A8FFA100BEC23C37FCE347F6D038FCE1
          B2C74AFEA600B9C44131FFEAFF9F0092D5723CFADC3DF9DB8CD87AFBA700FFA5
          0071E39A40F8D847F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D03AFBDFA9CA55FFA2006FE49E40F8D747F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D03BFBDEA9CB56FFA2006BE6A241F8D7
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6D032FF
          E9E3B20EFFA30041F8D643F7D43EF9DAFFA500FFA40062EAAD31FFEAC0C139F7
          A90033FEE831FFEAE3B20DF5AA00ECAE0333FEE846F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D041F8D76BE5A2FFA200A9CB563BFB
          DE47F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D036FDE4D7B71DFFA2003AFBDF45F6D147F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D03EF9DA7FDD8AFFA10098D26B31FFEA96D36C
          FEA600E7B00931FFEA41F8D660EAB0FF9D0074E29758EEBAFFA400FBA7008DD7
          783DFADB47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D045F6D13AFBDFFFA200D7B71D36FDE447F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D046F6D033FEE8FEA600E5B00B33FEE747F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046F6
          D032FEE8F7A900F2AB001FFFFFF4AA00FDA6008ED7773DFADB46F6D031FFEAE6
          B00AD4B81FA8CB57F7A900FDA60037FCE245F6D147F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D033FEE7E5B00BFEA60033FE
          E846F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D045F6
          D245F6D1FFA200C5BE3338FCE247F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D03CFADD97D36CFFA300B0C84DF8A800
          FFA5003DFADB45F6D247F6D03EF9DA85DA82FFA400F2AB00F8A800A9CB563AFB
          E047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D038FCE2C5BE33FFA20045F6D145F6D247F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D043F7D456EEBCFFA100B1C74C3AFBDF47F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D045F6D23DFADCFFA600F6A900F6A900BAC44037FCE247F6D047F6D045F6D138
          FCE1FAA700F1AC00FFA40049F4CC44F7D347F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D03AFBDFB1C74CFFA10056EE
          BC43F7D447F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D042F7
          D55DECB4FFA100A9CA563BFBDE47F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D038FCE1AFC84EF7A900FFA400
          60EBAF41F8D647F6D047F6D047F6D039FBE1B1C74BFEA600BCC33E35FDE547F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D03BFBDEA9CA56FFA1005DECB442F7D547F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D042F7D55DECB4FFA100A9CA563BFBDE47F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D041F8D653F1C0FFA200DEB41331FFEA46F6D047F6D047F6D046F6D03B
          FBDE54EFBFFF9F00A6CC5938FCE147F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D03BFBDEA9CA56FFA1005DEC
          B442F7D547F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D043F7
          D456EEBCFFA100B1C74C3AFBDF47F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D045F6D14AF4CB2FFFEDCFBA27FBA700
          38FCE245F6D147F6D047F6D03DFADC94D46F27FFF7D8B71CFFA3003DFADC45F6
          D247F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D03AFBDFB1C74CFFA10056EEBC43F7D447F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D045F6D245F6D1FFA200C5BE3338FCE247F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D03AFBDFBAC3415FEBB162EAAEFF9E0085DA823EF9DA47F6D045F6D23DFADBFF
          9C004BF4CA6FE49DFFA00097D36C3CFADD47F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D038FCE2C5BE33FFA20045F6
          D145F6D247F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D046F6
          D033FEE8FEA600E5B00B33FEE747F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D045F6D137FCE2FFA300C1C03821FFFEE2B20F
          E6B00A31FFEA46F6D03DFADB8ED777FFA300B4C64727FFF7F2AB00F7A90032FE
          E846F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D033FEE7E5B00BFEA60033FEE846F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D036FDE4D7B71DFFA2003AFBDF45F6D1
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D03DFA
          DB8DD778FCA700FFA2003EF9DA77E093FF9D0060EAB041F8D631FFEAE7B009FE
          A6009DD06432FFE998D26AFFA1007FDD8A3EF9DA47F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D045F6D13AFBDFFFA200D7B71D36FD
          E447F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D03BFBDEA9CB56FFA2006BE6A241F8D747F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D046F6D033FEE8ECAE03F5AA00E4B10D34FDE633FEE8
          F7A900C0C13931FFEA62EAADFFA400FFA5003EF9DA43F7D441F8D6FFA300E3B2
          0E32FFE946F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D041F8D76BE5A2FFA200A9CB563BFBDE47F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D040F8D76FE49EFFA200A9CB553AFBDF
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D040F8D871E3
          9AFFA500FBA7008BD87A3DF9DB3CFADC92D572FF9F0031FFEAB9C441FEA600B2
          C74A38FCE147F6D037FCE3BEC23CFFA10067E8A841F8D747F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D03AFBDFA9CA55FFA2006FE49E40F8
          D747F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D046F6D137FCE3FDA600F4AA0033FEE846F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D046F6D032FEE8D5B81FF4AA00FFA5003CFADD45F6D145F6D1
          3AFBDFFFA20099D26AF6A900FFA30050F1C343F7D447F6D041F8D660EAB0FFA1
          00CDBB2A34FEE747F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D046
          F6D033FEE8F4AA00FDA60037FCE346F6D147F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D039FBE0B2C74AFFA20074E297
          3FF9D847F6D047F6D047F6D047F6D047F6D047F6D047F6D042F7D558EEBAFFA4
          00F6A900B7C54438FCE247F6D047F6D039FBE0A9CB56FFA500F5AA00CDBB2934
          FEE646F6D047F6D046F6D031FFEBE3B20EFFA20051F1C343F7D447F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D03FF9D874E297FFA200B2C74B39FBE047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D043F7D454F0BFFFA100DCB51631FFEB46F6D047F6D047F6D047F6D047
          F6D047F6D046F6D034FEE7BAC341F6A900FFA5005EECB342F8D647F6D047F6D0
          44F7D349F4CCFFA300FFA4006AE6A340F8D747F6D047F6D047F6D03EF9DA84DB
          84FFA400B5C64734FDE646F6D047F6D047F6D047F6D047F6D047F6D046F6D031
          FFEBDCB516FFA10054F0BF43F7D447F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D046F6D034FEE6C9BD2EFFA200
          73E2983EF9DA47F6D047F6D047F6D046F6D041F8D636FDE45FEBB1FFA400EFAC
          00FFA4002DFFEF42F7D547F6D047F6D047F6D035FDE6CDBB29EDAD0231FFEB46
          F6D047F6D047F6D046F6D03DFADB52F0C0FFA500FFA4005CECB537FCE341F8D6
          46F6D047F6D047F6D047F6D03EF9DA73E298FFA200C9BD2E34FEE646F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D043F7D450F1C4FFA200F3AA0035FDE545F6D147F6D046F6D043
          F7D476E195ABCA53FF9E00FFA400FFA500FFA100C2C03762EAAE43F7D447F6D0
          47F6D03FF9D98DD77893D4713EF9DA47F6D047F6D046F6D042F7D56EE49FDCB4
          16FFA200FFA400FF9E00A8CB5775E19643F7D446F6D047F6D045F6D135FDE5F3
          AA00FFA20050F1C443F7D447F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D037FCE2A7CC59
          FFA200B7C54532FEE946F6D046F6D044F7D365E8A95EEBB354EFBF53F0C053F0
          C053F0C05DECB45DECB444F7D347F6D047F6D046F6D048F5CE44F7D346F6D047
          F6D047F6D046F6D044F7D364E9AB59EDB853F0C053F0C054EFBE5EEBB365E8A9
          44F7D346F6D046F6D032FEE9B7C544FFA200A6CC5937FCE247F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D046F6D133FEE7E8AF07FFA20081DC8738FCE147F6D046
          F6D043F7D443F7D443F7D443F7D443F7D443F7D443F7D444F7D347F6D047F6D0
          47F6D047F6D046F6D046F6D047F6D047F6D047F6D047F6D046F6D043F7D343F7
          D443F7D443F7D443F7D443F7D443F7D446F6D047F6D038FCE181DC87FFA200E8
          AF0733FEE746F6D147F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D042F7D5
          4AF4CCFFA500FFA20067E7A73AFBDF46F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          46F6D03AFBDF67E7A7FFA200FFA5004AF4CC42F7D547F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D03DF9DB64E9ABFFA200FFA30068E7A638
          FCE246F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D046F6D038FCE268E7A6FFA300FFA20064E9AB3D
          F9DB47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D03AFBDF6DE5A0FFA300FFA20086DA8131FFEA45F6D147F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D045F6D131FFEA
          87DA81FFA200FFA3006EE59F3AFBDF47F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D03AFBDF62EAAEFFA500FF
          A200BFC13B39FCE13DFADB46F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D046F6D03DFADB39FCE1BFC13BFFA200FFA50061EAAE3AFBDF47F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D03EF9DA47F5CEE4B10DFFA200F7A9007EDD8A2FFFEC3EF9
          DA46F6D147F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D046F6D13EF9DA2FFFEC7EDD8AF7A900FFA200
          E4B10D48F5CE3EF9DA47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D043F7D432
          FFE99DD065FFA300FFA200E7B00980DD8836FDE438FCE13FF9D944F7D246F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D046F6D044F7D23FF9D938FCE136FD
          E480DD88E7B009FFA200FFA3009DD06532FEE943F7D447F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D046F6D039FBE049F5CDBDC23DFFA200FFA2
          00FDA600B7C5457ADF9046F5CF34FEE736FDE438FCE139FBE039FBE038FCE136
          FDE434FEE746F5CF7ADF90B7C545FDA600FFA200FFA200BDC23D49F5CD39FBE0
          46F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D043F7D336FDE44AF4CBA4CD5BF5AA00FFA100FFA200FFA100F4AA00
          D5B81FC0C039B8C443B8C443C0C039D5B81FF4AA00FFA100FFA200FFA100F5AA
          00A4CD5C4AF4CB36FDE443F7D347F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D044F7D33BFB
          DE32FFEA5FEBB199D169C7BE31EDAD01FFA400FFA100FFA100FFA100FFA100FF
          A400EDAD01C7BE3199D1695FEBB132FFEA3BFBDE44F7D347F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D046F6D042F8D53CFADC38FCE234FDE6
          39FCE145F6D14BF3C94BF3C945F6D139FCE134FDE638FCE23CFADC42F8D546F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D046F6D046F6D045F6D244F7D344F7D345F6D246
          F6D046F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          000047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D0000047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          47F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6
          D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047
          F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D047F6D0
          0000}
        mmHeight = 16617
        mmLeft = 529
        mmTop = 265
        mmWidth = 21941
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel34: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label1'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 13
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5557
        mmLeft = 117740
        mmTop = 6350
        mmWidth = 5821
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText59: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText59'
        DataField = 'CODIGO'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 13
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 5466
        mmLeft = 123825
        mmTop = 6350
        mmWidth = 9862
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine25: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10583
        mmLeft = 0
        mmTop = 17195
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine26: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line26'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 25665
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel38: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label38'
        Caption = 'Or'#231'amento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 1323
        mmTop = 17992
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText25: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText25'
        DataField = 'CODIGO'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 3440
        mmLeft = 17782
        mmTop = 17921
        mmWidth = 12508
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel39: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label39'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 167217
        mmTop = 17921
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText26: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText26'
        DataField = 'DATACADASTRO'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 3440
        mmLeft = 175948
        mmTop = 17921
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel40: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label40'
        Caption = 'Operador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 1346
        mmTop = 23003
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText27: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText27'
        DataField = 'USERNAME'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 3440
        mmLeft = 16427
        mmTop = 23122
        mmWidth = 51329
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel41: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label41'
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 35454
        mmTop = 17921
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText28: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText28'
        DataField = 'NOMCLIENTE'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 3440
        mmLeft = 46302
        mmTop = 17921
        mmWidth = 69586
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel46: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label101'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 17921
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText29: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText29'
        DataField = 'TELEFONE'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 3440
        mmLeft = 134673
        mmTop = 17921
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel47: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label47'
        OnGetText = ppLabel47GetText
        Caption = 'Label47'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 120915
        mmTop = 23019
        mmWidth = 11642
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBMemo4: TppDBMemo
        DesignLayer = ppDesignLayer3
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSERVACOES'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        ShiftRelativeTo = ppSubReport2
        Stretch = True
        TextAlignment = taFullJustified
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 13713
        mmLeft = 0
        mmTop = 35073
        mmWidth = 196057
        BandType = 4
        LayerName = Foreground2
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppRegion2: TppRegion
        DesignLayer = ppDesignLayer3
        UserName = 'Region2'
        Pen.Style = psClear
        ShiftRelativeTo = ppDBMemo4
        mmHeight = 9754
        mmLeft = 0
        mmTop = 56340
        mmWidth = 196995
        BandType = 4
        LayerName = Foreground2
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLine43: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line43'
          Pen.Style = psDot
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 1307
          mmLeft = 0
          mmTop = 60545
          mmWidth = 196995
          BandType = 4
          LayerName = Foreground2
        end
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppSystemVariable5: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 0
        mmWidth = 20108
        BandType = 8
        LayerName = Foreground2
      end
      object ppLabel78: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label78'
        Caption = 'AMVSystem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 112448
        mmTop = 0
        mmWidth = 16933
        BandType = 8
        LayerName = Foreground2
      end
      object ppSystemVariable6: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable6'
        VarType = vtPrintDateTime
        DisplayFormat = #39'Impresso em'#39' dd '#39'de'#39' MMMM '#39'de'#39' yyyy '#39#224's'#39' hh:mm:ss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 0
        mmWidth = 68263
        BandType = 8
        LayerName = Foreground2
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object dtsOrcamento: TDataSource
    DataSet = qryOrcamento
    Left = 98
    Top = 111
  end
  object qryOrcamento: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      
        'select O.*, P.NOME AS NOMCLIENTE, U.USERNAME, COALESCE(P.TELRESI' +
        'DENCIAL,P.TELCELULAR) AS TELEFONE   from TABORCAMENTO O'
      'LEFT JOIN TABPERFIL P ON (O.CODIGOCLIENTE = P.CODIGO)'
      'LEFT JOIN TABUSUARIOS U ON (O.CODIGOUSUARIO = U.CODIGO)'
      'where O.CODIGO = :CODIGO'
      'order by O.Codigo')
    Left = 62
    Top = 111
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABORCAMENTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = '"TABORCAMENTO"."DATACADASTRO"'
    end
    object qryOrcamentoCODIGOUSUARIO: TIntegerField
      FieldName = 'CODIGOUSUARIO'
      Origin = '"TABORCAMENTO"."CODIGOUSUARIO"'
    end
    object qryOrcamentoCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = '"TABORCAMENTO"."CODIGOCLIENTE"'
    end
    object qryOrcamentoOBSERVACOES: TIBStringField
      FieldName = 'OBSERVACOES'
      Origin = '"TABORCAMENTO"."OBSERVACOES"'
      Size = 100
    end
    object qryOrcamentoCODIGOSITUACAO: TIntegerField
      FieldName = 'CODIGOSITUACAO'
      Origin = '"TABORCAMENTO"."CODIGOSITUACAO"'
    end
    object qryOrcamentoCODIGOPEDIDO: TIntegerField
      FieldName = 'CODIGOPEDIDO'
      Origin = '"TABORCAMENTO"."CODIGOPEDIDO"'
    end
    object qryOrcamentoNOMCLIENTE: TIBStringField
      FieldName = 'NOMCLIENTE'
      Origin = '"TABPERFIL"."NOME"'
      Size = 50
    end
    object qryOrcamentoUSERNAME: TIBStringField
      FieldName = 'USERNAME'
      Origin = '"TABUSUARIOS"."USERNAME"'
    end
    object qryOrcamentoTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      ProviderFlags = []
      Size = 15
    end
  end
  object qryOrcamentoDetalhe: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    DataSource = dtsOrcamento
    SQL.Strings = (
      
        'select D.*, P.DESCRICAO AS NOMEPRODUTO from TABORCAMENTODETALHE ' +
        ' D'
      'LEFT JOIN TABPRODUTOS P ON (D.CODIGOPRODUTO = P.CODIGO)'
      'where D.CODIGO= :CODIGO'
      'order by D.ID')
    Left = 59
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryOrcamentoDetalheCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABORCAMENTODETALHE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoDetalheID: TIntegerField
      FieldName = 'ID'
      Origin = '"TABORCAMENTODETALHE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoDetalheCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = '"TABORCAMENTODETALHE"."CODIGOPRODUTO"'
    end
    object qryOrcamentoDetalheVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"TABORCAMENTODETALHE"."VALOR"'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoDetalheNOMEPRODUTO: TIBStringField
      FieldName = 'NOMEPRODUTO'
      Origin = '"TABPRODUTOS"."DESCRICAO"'
      Size = 200
    end
  end
  object dtsOrcamentoDetalhe: TDataSource
    DataSet = qryOrcamentoDetalhe
    Left = 98
    Top = 157
  end
  object qryBoleto: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      
        'SELECT F.CODIGO, F.DATA, F.CODIGOCLIENTE, P.NOME AS NOMECLIENTE,' +
        ' P.CPF,'
      
        '       P.CODIGOBANCO, P.NOME AS NOMEBANCO, P.OPERACAO_CONTA, P.A' +
        'GENCIA, P.NUMERO_CONTA,'
      '       SUM(D.VALOR) AS VALOR'
      '  FROM TABFINANCEIRO F'
      ' INNER JOIN TABFINANCEIRODETALHE D ON (F.CODIGO = D.CODIGO)'
      ' INNER JOIN TABPERFIL P ON (F.CODIGOCLIENTE = P.CODIGO)'
      '  LEFT JOIN TABBANCO B ON (P.CODIGOBANCO = B.CODIGO)'
      ''
      'WHERE F.CODIGO = :CODIGO'
      ''
      ''
      ' GROUP BY 1,2,3,4,5,6,7,8,9,10'
      '')
    Left = 51
    Top = 226
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryBoletoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABFINANCEIRO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBoletoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABFINANCEIRO"."DATA"'
    end
    object qryBoletoCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = '"TABFINANCEIRO"."CODIGOCLIENTE"'
    end
    object qryBoletoNOMECLIENTE: TIBStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 50
    end
    object qryBoletoCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"TABPERFIL"."CPF"'
      Size = 15
    end
    object qryBoletoCODIGOBANCO: TIntegerField
      FieldName = 'CODIGOBANCO'
      Origin = '"TABPERFIL"."CODIGOBANCO"'
    end
    object qryBoletoNOMEBANCO: TIBStringField
      FieldName = 'NOMEBANCO'
      ProviderFlags = []
      Size = 50
    end
    object qryBoletoOPERACAO_CONTA: TIBStringField
      FieldName = 'OPERACAO_CONTA'
      Origin = '"TABPERFIL"."OPERACAO_CONTA"'
      Size = 10
    end
    object qryBoletoAGENCIA: TIBStringField
      FieldName = 'AGENCIA'
      Origin = '"TABPERFIL"."AGENCIA"'
      Size = 10
    end
    object qryBoletoNUMERO_CONTA: TIBStringField
      FieldName = 'NUMERO_CONTA'
      Origin = '"TABPERFIL"."NUMERO_CONTA"'
    end
    object qryBoletoVALOR: TIBBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 4
    end
  end
  object qryBoletoDetalhe: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      
        'SELECT C.CODIGO AS CODIGOCONTRATO, D.CODIGOPRODUTO, P.DESCRICAO ' +
        'AS NOMEPRODUTO, D.VALOR'
      '  FROM TABFINANCEIRO F'
      
        ' INNER JOIN TABMOVIMENTACAOCONTRATO M ON (F.CODIGO = M.CODIGOREG' +
        'ISTRO AND M.TIPO = 6)'
      ' INNER JOIN TABCONTRATO C ON (C.CODIGO = M.CODIGO)'
      ' INNER JOIN TABCONTRATODETALHE D ON (C.CODIGO = D.CODIGO)'
      ' INNER JOIN TABPRODUTOS P ON (D.CODIGOPRODUTO = P.CODIGO)'
      ''
      'WHERE F.CODIGO = :CODIGO'
      ''
      'ORDER BY D.CODIGOPRODUTO')
    Left = 49
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryBoletoDetalheCODIGOCONTRATO: TIntegerField
      FieldName = 'CODIGOCONTRATO'
      Origin = '"TABCONTRATO"."CODIGO"'
      Required = True
    end
    object qryBoletoDetalheCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = '"TABCONTRATODETALHE"."CODIGOPRODUTO"'
    end
    object qryBoletoDetalheNOMEPRODUTO: TIBStringField
      FieldName = 'NOMEPRODUTO'
      Origin = '"TABPRODUTOS"."DESCRICAO"'
      Size = 200
    end
    object qryBoletoDetalheVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"TABCONTRATODETALHE"."VALOR"'
      Precision = 18
      Size = 2
    end
  end
  object dtsBoletoDetalhe: TDataSource
    DataSet = qryBoletoDetalhe
    Left = 87
    Top = 272
  end
  object dtsBoleto: TDataSource
    DataSet = qryBoleto
    Left = 87
    Top = 226
  end
  object pipBoleto: TppDBPipeline
    DataSource = dtsBoleto
    UserName = 'pipBoleto'
    Left = 123
    Top = 226
  end
  object pipBoletoDetalhe: TppDBPipeline
    DataSource = dtsBoletoDetalhe
    UserName = 'pipBoletoDetalhe'
    Left = 125
    Top = 269
  end
  object rbiBoleto: TppReport
    AutoStop = False
    DataPipeline = pipBoleto
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
    LanguageID = 'Default'
    OnPreviewFormCreate = rbiOrcamentoPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 160
    Top = 224
    Version = '16.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipBoleto'
    object ppTitleBand2: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine50: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 1
        LayerName = BandLayer4
      end
      object ppLine51: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 1
        LayerName = BandLayer4
      end
      object ppLine52: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line3'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 8991
        mmWidth = 197300
        BandType = 1
        LayerName = BandLayer4
      end
      object ppLine53: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line4'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 193411
        mmTop = 0
        mmWidth = 4233
        BandType = 1
        LayerName = BandLayer4
      end
      object ppLabel48: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        Caption = 'BOLETO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 13
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5557
        mmLeft = 85461
        mmTop = 4233
        mmWidth = 17991
        BandType = 1
        LayerName = BandLayer4
      end
    end
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 42598
      mmPrintPosition = 0
      object ppLabel49: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label49'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 42575
        mmTop = 3954
        mmWidth = 5556
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText34: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText34'
        DataField = 'VALOR'
        DataPipeline = pipBoleto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 5027
        mmLeft = 50512
        mmTop = 3954
        mmWidth = 34396
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel53: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label53'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 90752
        mmTop = 3953
        mmWidth = 9261
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText38: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText38'
        DataField = 'DATA'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 5027
        mmLeft = 102400
        mmTop = 3953
        mmWidth = 34396
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel54: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label54'
        Caption = 'Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 13481
        mmWidth = 12435
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel55: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label55'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 17979
        mmWidth = 5556
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel56: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label56'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 22477
        mmWidth = 8731
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel57: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label57'
        Caption = 'Opera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 26975
        mmWidth = 13758
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel58: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label58'
        Caption = 'Ag'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 31473
        mmWidth = 11641
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel59: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label59'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 35971
        mmWidth = 8466
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText39: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText39'
        DataField = 'NOMECLIENTE'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 3703
        mmLeft = 16930
        mmTop = 13485
        mmWidth = 78846
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText40: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText40'
        DataField = 'CPF'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 3703
        mmLeft = 16930
        mmTop = 17983
        mmWidth = 39423
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText41: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText401'
        DataField = 'NOMEBANCO'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 3703
        mmLeft = 16930
        mmTop = 22480
        mmWidth = 39423
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText42: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText42'
        DataField = 'OPERACAO_CONTA'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 3703
        mmLeft = 16930
        mmTop = 26978
        mmWidth = 39423
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText43: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText43'
        DataField = 'AGENCIA'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 3703
        mmLeft = 16930
        mmTop = 31476
        mmWidth = 39423
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText44: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText44'
        DataField = 'NUMERO_CONTA'
        DataPipeline = pipBoleto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipBoleto'
        mmHeight = 3703
        mmLeft = 16930
        mmTop = 35971
        mmWidth = 39423
        BandType = 0
        LayerName = BandLayer4
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer4
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pipBoletoDetalhe'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        LayerName = BandLayer4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pipBoletoDetalhe
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
          Version = '16.01'
          mmColumnWidth = 0
          DataPipelineName = 'pipBoletoDetalhe'
          object ppTitleBand3: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLine83: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line83'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 259
              mmLeft = 0
              mmTop = 4220
              mmWidth = 197300
              BandType = 1
              LayerName = Foreground3
            end
            object ppLine85: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line85'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 0
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground3
            end
            object ppLine86: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line86'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 4498
              mmLeft = 193411
              mmTop = 0
              mmWidth = 4233
              BandType = 1
              LayerName = Foreground3
            end
            object ppLine88: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line88'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 17710
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground3
            end
            object ppLine89: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line89'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 110313
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground3
            end
            object ppLine90: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line90'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4499
              mmLeft = 138359
              mmTop = 0
              mmWidth = 4219
              BandType = 1
              LayerName = Foreground3
            end
            object ppLabel50: TppLabel
              DesignLayer = ppDesignLayer5
              UserName = 'Label50'
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 2893
              mmTop = 780
              mmWidth = 11907
              BandType = 1
              LayerName = Foreground3
            end
            object ppLabel51: TppLabel
              DesignLayer = ppDesignLayer5
              UserName = 'Label51'
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 57662
              mmTop = 780
              mmWidth = 14552
              BandType = 1
              LayerName = Foreground3
            end
            object ppLabel52: TppLabel
              DesignLayer = ppDesignLayer5
              UserName = 'Label52'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = [fsBold]
              FormField = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 120632
              mmTop = 780
              mmWidth = 7673
              BandType = 1
              LayerName = Foreground3
            end
            object ppLine91: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line91'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 2114
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 1
              LayerName = Foreground3
            end
          end
          object ppDetailBand5: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppLine54: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line54'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 4219
              BandType = 4
              LayerName = Foreground3
            end
            object ppLine55: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line55'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 1319
              mmLeft = 0
              mmTop = 2646
              mmWidth = 197300
              BandType = 4
              LayerName = Foreground3
            end
            object ppLine64: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line101'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 3969
              mmLeft = 193675
              mmTop = 0
              mmWidth = 3954
              BandType = 4
              LayerName = Foreground3
            end
            object ppLine80: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line202'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3969
              mmLeft = 17710
              mmTop = 0
              mmWidth = 1039
              BandType = 4
              LayerName = Foreground3
            end
            object ppDBText35: TppDBText
              DesignLayer = ppDesignLayer5
              UserName = 'DBText35'
              DataField = 'CODIGOPRODUTO'
              DataPipeline = pipBoletoDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pipBoletoDetalhe'
              mmHeight = 3703
              mmLeft = 1041
              mmTop = 0
              mmWidth = 15608
              BandType = 4
              LayerName = Foreground3
            end
            object ppDBText36: TppDBText
              DesignLayer = ppDesignLayer5
              UserName = 'DBText36'
              DataField = 'NOMEPRODUTO'
              DataPipeline = pipBoletoDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pipBoletoDetalhe'
              mmHeight = 3703
              mmLeft = 19297
              mmTop = 0
              mmWidth = 90073
              BandType = 4
              LayerName = Foreground3
            end
            object ppDBText37: TppDBText
              DesignLayer = ppDesignLayer5
              UserName = 'DBText37'
              DataField = 'VALOR'
              DataPipeline = pipBoletoDetalhe
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pipBoletoDetalhe'
              mmHeight = 3704
              mmLeft = 112694
              mmTop = 0
              mmWidth = 24620
              BandType = 4
              LayerName = Foreground3
            end
            object ppLine81: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line81'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3969
              mmLeft = 110313
              mmTop = 0
              mmWidth = 1834
              BandType = 4
              LayerName = Foreground3
            end
            object ppLine82: TppLine
              DesignLayer = ppDesignLayer5
              UserName = 'Line82'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3969
              mmLeft = 138359
              mmTop = 0
              mmWidth = 1834
              BandType = 4
              LayerName = Foreground3
            end
          end
          object ppSummaryBand3: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDesignLayers5: TppDesignLayers
            object ppDesignLayer5: TppDesignLayer
              UserName = 'Foreground3'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label60'
        Caption = 'Pago em: _____/_____/_________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 0
        mmTop = 529
        mmWidth = 54504
        BandType = 8
        LayerName = BandLayer4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'BandLayer4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object qryContratoTerceiro: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      
        'select T.CODIGO, T.versao, T.CODIGOFORNECEDOR, pe.nome as nomefo' +
        'rnecedor, pe.cpf, COALESCE(Pe.TELRESIDENCIAL,Pe.TELCELULAR) AS T' +
        'ELEFONE,'
      
        '       P.DATAAQUISICAO, P.CODIGO AS CODIGOPRODUTO, P.DESCRICAO A' +
        'S NOMEPRODUTO, P.VALORALUGUEL1'
      ''
      'from TABCONTRATOTERCEIROS T'
      'left join TABPRODUTOS P on (P.IDPERFIL = T.CODIGOFORNECEDOR)'
      'left join tabperfil pe on (t.codigofornecedor = pe.codigo)'
      'where P.ORIGEM = '#39'T'#39
      ''
      'AND T.CODIGO = :CODIGO'
      '  ')
    Left = 47
    Top = 326
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryContratoTerceiroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABCONTRATOTERCEIROS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContratoTerceiroVERSAO: TIntegerField
      FieldName = 'VERSAO'
      Origin = '"TABCONTRATOTERCEIROS"."VERSAO"'
    end
    object qryContratoTerceiroCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      Origin = '"TABCONTRATOTERCEIROS"."CODIGOFORNECEDOR"'
    end
    object qryContratoTerceiroNOMEFORNECEDOR: TIBStringField
      FieldName = 'NOMEFORNECEDOR'
      Origin = '"TABPERFIL"."NOME"'
      Size = 50
    end
    object qryContratoTerceiroCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"TABPERFIL"."CPF"'
      Size = 15
    end
    object qryContratoTerceiroTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      ProviderFlags = []
      Size = 15
    end
    object qryContratoTerceiroDATAAQUISICAO: TDateField
      FieldName = 'DATAAQUISICAO'
      Origin = '"TABPRODUTOS"."DATAAQUISICAO"'
    end
    object qryContratoTerceiroCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = '"TABPRODUTOS"."CODIGO"'
    end
    object qryContratoTerceiroNOMEPRODUTO: TIBStringField
      FieldName = 'NOMEPRODUTO'
      Origin = '"TABPERFIL"."NOME"'
      Size = 50
    end
    object qryContratoTerceiroVALORALUGUEL1: TIBBCDField
      FieldName = 'VALORALUGUEL1'
      Origin = '"TABPRODUTOS"."VALORALUGUEL1"'
      Precision = 18
      Size = 2
    end
  end
  object dtsContratoTerceiro: TDataSource
    DataSet = qryContratoTerceiro
    Left = 83
    Top = 326
  end
  object pipContratoTerceiro: TppDBPipeline
    DataSource = dtsContratoTerceiro
    UserName = 'pipContratoTerceiro'
    Left = 119
    Top = 326
  end
  object rbiContratoTerceiro: TppReport
    AutoStop = False
    DataPipeline = pipContratoTerceiro
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
    LanguageID = 'Default'
    OnPreviewFormCreate = rbiOrcamentoPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 154
    Top = 325
    Version = '16.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipContratoTerceiro'
    object ppTitleBand4: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine56: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 1
        LayerName = BandLayer6
      end
      object ppLine57: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 1
        LayerName = BandLayer6
      end
      object ppLine58: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line3'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 8991
        mmWidth = 197300
        BandType = 1
        LayerName = BandLayer6
      end
      object ppLine59: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line4'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 193411
        mmTop = 0
        mmWidth = 4233
        BandType = 1
        LayerName = BandLayer6
      end
      object ppLabel61: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label1'
        Caption = 'CONTRATO de TERCEIRO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 13
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5557
        mmLeft = 74596
        mmTop = 4233
        mmWidth = 57150
        BandType = 1
        LayerName = BandLayer6
      end
    end
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 53181
      mmPrintPosition = 0
      object ppLine60: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 48953
        mmLeft = 0
        mmTop = 0
        mmWidth = 4219
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel62: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label2'
        Caption = 'CT N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 7408
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText45: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText1'
        DataField = 'CODIGO'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3438
        mmLeft = 10048
        mmTop = 1056
        mmWidth = 17198
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel64: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label4'
        Caption = 'ID-AMV n'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 1588
        mmTop = 5821
        mmWidth = 13229
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText47: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText3'
        DataField = 'CODIGOFORNECEDOR'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3440
        mmLeft = 15608
        mmTop = 5818
        mmWidth = 14552
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine62: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 0
        mmTop = 48736
        mmWidth = 197300
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine63: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line12'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 0
        mmTop = 52921
        mmWidth = 197300
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine65: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4499
        mmLeft = 0
        mmTop = 48682
        mmWidth = 4219
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine66: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line14'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 193415
        mmTop = 48682
        mmWidth = 4233
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine67: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4499
        mmLeft = 20137
        mmTop = 48682
        mmWidth = 4219
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine68: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4499
        mmLeft = 38405
        mmTop = 48682
        mmWidth = 4219
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine69: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4499
        mmLeft = 131664
        mmTop = 48682
        mmWidth = 4219
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine70: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4499
        mmLeft = 167302
        mmTop = 48682
        mmWidth = 4219
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel66: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label6'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 3969
        mmTop = 49213
        mmWidth = 7144
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel67: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label7'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3439
        mmLeft = 23813
        mmTop = 49213
        mmWidth = 10054
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel68: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label8'
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 78581
        mmTop = 49213
        mmWidth = 11907
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel69: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label9'
        Caption = 'Valor m'#225'ximo aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3439
        mmLeft = 133624
        mmTop = 49213
        mmWidth = 32279
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine71: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 48949
        mmLeft = 193411
        mmTop = 0
        mmWidth = 4233
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel70: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label10'
        Caption = 'VERS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 38365
        mmTop = 1058
        mmWidth = 10583
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText49: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText9'
        DataField = 'VERSAO'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3440
        mmLeft = 50538
        mmTop = 1058
        mmWidth = 17198
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel72: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label72'
        Caption = 'CEDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 38368
        mmTop = 5821
        mmWidth = 11906
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel63: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label63'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 10842
        mmWidth = 5027
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel65: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label65'
        Caption = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 38362
        mmTop = 10848
        mmWidth = 7144
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText46: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText46'
        DataField = 'NOMEFORNECEDOR'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3440
        mmLeft = 51333
        mmTop = 5821
        mmWidth = 91017
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText48: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText48'
        DataField = 'CPF'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3440
        mmLeft = 7392
        mmTop = 10853
        mmWidth = 29657
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText54: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText54'
        DataField = 'TELEFONE'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3440
        mmLeft = 46567
        mmTop = 10848
        mmWidth = 28046
        BandType = 0
        LayerName = BandLayer6
      end
      object ppMemo1: TppMemo
        DesignLayer = ppDesignLayer6
        UserName = 'Memo1'
        ForceJustifyLastLine = True
        Caption = 'Memo1'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            'Venho atrav'#233's deste colocar os produtos abaixo '#224' disposi'#231#227'o da A' +
            'MV para alugar em troca de uma remunera'#231#227'o por aluguel de 25% do' +
            ' valor l'#237'quido '
          'cobrado pelo aluguel. '
          
            'Valor esse a ser depositado na minha conta corrente ou outra aut' +
            'orizada, conforme dados preenchidos por mim, no cadastro de perf' +
            'il da AMV sob a '
          'ID-AMV n'#176)
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 13751
        mmLeft = 1585
        mmTop = 17463
        mmWidth = 194469
        BandType = 0
        LayerName = BandLayer6
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBText55: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText55'
        DataField = 'CODIGO'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3703
        mmLeft = 16140
        mmTop = 27509
        mmWidth = 17198
        BandType = 0
        LayerName = BandLayer6
      end
      object ppMemo2: TppMemo
        DesignLayer = ppDesignLayer6
        UserName = 'Memo2'
        ForceJustifyLastLine = True
        Caption = 'Memo2'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            'Valor esse a ser depositado  at'#233' no m'#225'ximo 30 dias , ap'#243's total ' +
            'recebimento  e ter sido liberado na conta da AMV. '
          ' '
          
            'Eu cedente assumo total responsabilidade pelo desgaste do produt' +
            'o com essa atividade , e desde j'#225' isento qualquer responsabilida' +
            'de e pedido de '
          'indeniza'#231#227'o a AMV. ')
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 15053
        mmLeft = 1590
        mmTop = 32270
        mmWidth = 194469
        BandType = 0
        LayerName = BandLayer6
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine72: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 4219
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine73: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line9'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1319
        mmLeft = 0
        mmTop = 2648
        mmWidth = 197300
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine74: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line10'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 193707
        mmTop = 0
        mmWidth = 3954
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText50: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText5'
        DataField = 'DATAAQUISICAO'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3703
        mmLeft = 1582
        mmTop = 0
        mmWidth = 17463
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine75: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 20123
        mmTop = 0
        mmWidth = 1039
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine76: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 38405
        mmTop = 0
        mmWidth = 1039
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText51: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText6'
        DataField = 'CODIGOPRODUTO'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3703
        mmLeft = 21724
        mmTop = 0
        mmWidth = 15608
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText52: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText7'
        DataField = 'NOMEPRODUTO'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3703
        mmLeft = 40258
        mmTop = 0
        mmWidth = 90073
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText53: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText8'
        DataField = 'VALORALUGUEL1'
        DataPipeline = pipContratoTerceiro
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3704
        mmLeft = 134161
        mmTop = 0
        mmWidth = 31510
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine77: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 131657
        mmTop = 0
        mmWidth = 1834
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine78: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 167285
        mmTop = 0
        mmWidth = 1834
        BandType = 4
        LayerName = BandLayer6
      end
    end
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 52652
      mmPrintPosition = 0
      object ppLabel71: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label71'
        Caption = 'VIT'#211'RIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 70921
        mmTop = 6611
        mmWidth = 11113
        BandType = 8
        LayerName = BandLayer6
      end
      object ppLabel73: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label73'
        Caption = '____/_____/_________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 84415
        mmTop = 6611
        mmWidth = 30692
        BandType = 8
        LayerName = BandLayer6
      end
      object ppLine61: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line61'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 56631
        mmTop = 22759
        mmWidth = 78581
        BandType = 8
        LayerName = BandLayer6
      end
      object ppLabel74: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label74'
        Caption = 'Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 89703
        mmTop = 23816
        mmWidth = 10848
        BandType = 8
        LayerName = BandLayer6
      end
      object ppDBText56: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText56'
        DataField = 'NOMEFORNECEDOR'
        DataPipeline = pipContratoTerceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipContratoTerceiro'
        mmHeight = 3440
        mmLeft = 51329
        mmTop = 27516
        mmWidth = 91017
        BandType = 8
        LayerName = BandLayer6
      end
      object ppLabel76: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label76'
        Caption = 'ACHEI MEU VESTIDO EIRELI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 78581
        mmTop = 39424
        mmWidth = 35983
        BandType = 8
        LayerName = BandLayer6
      end
      object ppLine79: TppLine
        DesignLayer = ppDesignLayer6
        UserName = 'Line79'
        Weight = 0.750000000000000000
        mmHeight = 2379
        mmLeft = 56627
        mmTop = 38640
        mmWidth = 78581
        BandType = 8
        LayerName = BandLayer6
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer6: TppDesignLayer
        UserName = 'BandLayer6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList5: TppParameterList
    end
  end
  object qryOS: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      'SELECT * '
      '  FROM tabos O'
      'where o.codigo = :codigoos'
      ''
      'order by o.codigo')
    Left = 240
    Top = 61
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoos'
        ParamType = ptUnknown
      end>
    object qryOSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABOS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOSCODIGOUSUARIO: TIntegerField
      FieldName = 'CODIGOUSUARIO'
      Origin = '"TABOS"."CODIGOUSUARIO"'
    end
    object qryOSSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = '"TABOS"."SITUACAO"'
    end
    object qryOSNUMEROPRESTADOR: TIBStringField
      FieldName = 'NUMEROPRESTADOR'
      Origin = '"TABOS"."NUMEROPRESTADOR"'
    end
    object qryOSDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABOS"."DATA"'
    end
    object qryOSCODIGOPERFIL: TIntegerField
      FieldName = 'CODIGOPERFIL'
      Origin = '"TABOS"."CODIGOPERFIL"'
    end
    object qryOSCODIGOSERVICO: TIntegerField
      FieldName = 'CODIGOSERVICO'
      Origin = '"TABOS"."CODIGOSERVICO"'
    end
    object qryOSDATAINICIO: TDateField
      FieldName = 'DATAINICIO'
      Origin = '"TABOS"."DATAINICIO"'
    end
    object qryOSHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = '"TABOS"."HORAINICIO"'
    end
    object qryOSDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Origin = '"TABOS"."DATAFIM"'
    end
    object qryOSHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = '"TABOS"."HORAFIM"'
    end
    object qryOSOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = '"TABOS"."OBSERVACOES"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryOSCODIGOAGENDA: TIntegerField
      FieldName = 'CODIGOAGENDA'
      Origin = '"TABOS"."CODIGOAGENDA"'
    end
  end
  object dtsOS: TDataSource
    DataSet = qryOS
    Left = 272
    Top = 62
  end
  object pipOS: TppDBPipeline
    DataSource = dtsOS
    OpenDataSource = False
    UserName = 'pipOS'
    Left = 304
    Top = 62
    object pipOSppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipOSppField2: TppField
      FieldAlias = 'CODIGOUSUARIO'
      FieldName = 'CODIGOUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipOSppField3: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipOSppField4: TppField
      FieldAlias = 'NUMEROPRESTADOR'
      FieldName = 'NUMEROPRESTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pipOSppField5: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pipOSppField6: TppField
      FieldAlias = 'CODIGOPERFIL'
      FieldName = 'CODIGOPERFIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pipOSppField7: TppField
      FieldAlias = 'CODIGOSERVICO'
      FieldName = 'CODIGOSERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pipOSppField8: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pipOSppField9: TppField
      FieldAlias = 'HORAINICIO'
      FieldName = 'HORAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pipOSppField10: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pipOSppField11: TppField
      FieldAlias = 'HORAFIM'
      FieldName = 'HORAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pipOSppField12: TppField
      FieldAlias = 'OBSERVACOES'
      FieldName = 'OBSERVACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pipOSppField13: TppField
      FieldAlias = 'CODIGOAGENDA'
      FieldName = 'CODIGOAGENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object qryAluguelTerceiros: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      
        'SELECT C.CODIGO AS CODIGOCONTRATO, PE.CODIGO AS CODIGOFORNECEDOR' +
        ', PE.NOME NOMEFORNECEDOR, PE.CPF, PE.telcelular, PE.EMAIL1 AS EM' +
        'AIL, C.DATA,'
      '       LIST('#39' - '#39'||P.DESCRICAO,ASCII_CHAR(13)) AS NOMEPRODUTO'
      '  FROM TABCONTRATODETALHE D'
      ' INNER JOIN TABCONTRATO C ON (D.CODIGO = C.CODIGO)'
      ' INNER JOIN TABPRODUTOS P ON (D.CODIGOPRODUTO = P.CODIGO)'
      ' INNER JOIN TABPERFIL PE ON (P.IDPERFIL = PE.CODIGO)'
      ' WHERE  P.ORIGEM = '#39'T'#39
      ''
      '--AND'
      ''
      'GROUP BY 1,2,3,4,5,6,7')
    Left = 310
    Top = 205
    object qryAluguelTerceirosCODIGOFORNECEDOR: TIntegerField
      FieldName = 'CODIGOFORNECEDOR'
      ProviderFlags = []
    end
    object qryAluguelTerceirosNOMEFORNECEDOR: TIBStringField
      FieldName = 'NOMEFORNECEDOR'
      ProviderFlags = []
      Size = 50
    end
    object qryAluguelTerceirosCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"TABPERFIL"."CPF"'
      Size = 15
    end
    object qryAluguelTerceirosTELCELULAR: TIBStringField
      FieldName = 'TELCELULAR'
      Origin = '"TABPERFIL"."TELCELULAR"'
      Size = 15
    end
    object qryAluguelTerceirosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      ProviderFlags = []
      Size = 50
    end
    object qryAluguelTerceirosDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABCONTRATO"."DATA"'
    end
    object qryAluguelTerceirosNOMEPRODUTO: TMemoField
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object qryAluguelTerceirosCODIGOCONTRATO: TIntegerField
      FieldName = 'CODIGOCONTRATO'
      ProviderFlags = []
    end
  end
  object dtsAluguelTerceiros: TDataSource
    DataSet = qryAluguelTerceiros
    Left = 347
    Top = 205
  end
  object pipAluguelTerceiros: TppDBPipeline
    DataSource = dtsAluguelTerceiros
    UserName = 'pipAluguelTerceiros'
    Left = 383
    Top = 204
    object pipAluguelTerceirosppField1: TppField
      FieldAlias = 'CODIGOFORNECEDOR'
      FieldName = 'CODIGOFORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField2: TppField
      FieldAlias = 'NOMEFORNECEDOR'
      FieldName = 'NOMEFORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField3: TppField
      FieldAlias = 'EMAIL'
      FieldName = 'EMAIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField4: TppField
      FieldAlias = 'NOMEPRODUTO'
      FieldName = 'NOMEPRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField5: TppField
      FieldAlias = 'CODIGOCONTRATO'
      FieldName = 'CODIGOCONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField6: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField7: TppField
      FieldAlias = 'TELCELULAR'
      FieldName = 'TELCELULAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pipAluguelTerceirosppField8: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object rbiAluguelTerceiros: TppReport
    AutoStop = False
    DataPipeline = pipAluguelTerceiros
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
    LanguageID = 'Default'
    OnPreviewFormCreate = rbiOrcamentoPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = False
    ThumbnailSettings.Visible = False
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
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 417
    Top = 203
    Version = '16.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipAluguelTerceiros'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine46: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 1
        LayerName = BandLayer9
      end
      object ppLine84: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 1
        LayerName = BandLayer9
      end
      object ppLine87: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line3'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 8991
        mmWidth = 197300
        BandType = 1
        LayerName = BandLayer9
      end
      object ppLine92: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line4'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 193001
        mmTop = 0
        mmWidth = 4233
        BandType = 1
        LayerName = BandLayer9
      end
      object ppLabel79: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label1'
        Caption = 'ALUGUEL DE TERCEIROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 13
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5352
        mmLeft = 75671
        mmTop = 4233
        mmWidth = 55827
        BandType = 1
        LayerName = BandLayer9
      end
    end
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand9: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 95515
      mmPrintPosition = 0
      object ppLine93: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 95284
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLabel80: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label2'
        Caption = 'CT N'#186':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 6085
        mmWidth = 9757
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText61: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText1'
        DataField = 'CODIGOCONTRATO'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 3440
        mmLeft = 12872
        mmTop = 6085
        mmWidth = 17198
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLabel81: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label4'
        Caption = 'ID-AMV N'#186':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 16405
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText62: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText3'
        DataField = 'CODIGOFORNECEDOR'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 3440
        mmLeft = 20418
        mmTop = 1058
        mmWidth = 14552
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLine102: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 95311
        mmLeft = 192964
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLabel87: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label72'
        Caption = 'CEDENTE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 37855
        mmTop = 1058
        mmWidth = 14869
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLabel88: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label63'
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 122436
        mmTop = 1058
        mmWidth = 6495
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLabel89: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label65'
        Caption = 'TEL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 159947
        mmTop = 1058
        mmWidth = 5821
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText64: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText46'
        DataField = 'NOMEFORNECEDOR'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 3440
        mmLeft = 52929
        mmTop = 1058
        mmWidth = 69056
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText65: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText48'
        DataField = 'CPF'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 3440
        mmLeft = 129341
        mmTop = 1058
        mmWidth = 29633
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText66: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText54'
        DataField = 'TELEFONE'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 3440
        mmLeft = 166390
        mmTop = 1058
        mmWidth = 28046
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLabel86: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label86'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 32808
        mmTop = 6085
        mmWidth = 7938
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText63: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText63'
        DataField = 'DATA'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 3440
        mmLeft = 41540
        mmTop = 6085
        mmWidth = 17198
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLine94: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line94'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2739
        mmLeft = 0
        mmTop = 8335
        mmWidth = 197215
        BandType = 4
        LayerName = BandLayer9
      end
      object ppMemo4: TppMemo
        DesignLayer = ppDesignLayer9
        UserName = 'Memo4'
        Caption = 'Memo4'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        mmHeight = 23548
        mmLeft = 615
        mmTop = 13494
        mmWidth = 196190
        BandType = 4
        LayerName = BandLayer9
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel82: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label82'
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3439
        mmLeft = 708
        mmTop = 40198
        mmWidth = 14287
        BandType = 4
        LayerName = BandLayer9
      end
      object ppLine95: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line95'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 91281
        mmWidth = 196989
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBMemo5: TppDBMemo
        DesignLayer = ppDesignLayer9
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'NOMEPRODUTO'
        DataPipeline = pipAluguelTerceiros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'pipAluguelTerceiros'
        mmHeight = 13026
        mmLeft = 615
        mmTop = 44166
        mmWidth = 196606
        BandType = 4
        LayerName = BandLayer9
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppSubReport4: TppSubReport
        DesignLayer = ppDesignLayer9
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppDBMemo5
        TraverseAllData = False
        DataPipelineName = 'pipPagamentoAluguel'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 59302
        mmWidth = 197300
        BandType = 4
        LayerName = BandLayer9
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pipPagamentoAluguel
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
          Version = '16.01'
          mmColumnWidth = 0
          DataPipelineName = 'pipPagamentoAluguel'
          object ppTitleBand5: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 15346
            mmPrintPosition = 0
            object ppLine97: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line97'
              Weight = 0.750000000000000000
              mmHeight = 2033
              mmLeft = 0
              mmTop = 7995
              mmWidth = 197201
              BandType = 1
              LayerName = Foreground6
            end
            object ppLine98: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line98'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 2033
              mmLeft = 0
              mmTop = 13107
              mmWidth = 197107
              BandType = 1
              LayerName = Foreground6
            end
            object ppLabel83: TppLabel
              DesignLayer = ppDesignLayer10
              UserName = 'Label83'
              Caption = 'Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 10
              Font.Style = [fsBold]
              FormField = False
              Transparent = True
              mmHeight = 4233
              mmLeft = 1852
              mmTop = 9525
              mmWidth = 19315
              BandType = 1
              LayerName = Foreground6
            end
          end
          object ppHeaderBand6: TppHeaderBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppLine106: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line106'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 2329
              mmLeft = 0
              mmTop = 2212
              mmWidth = 197009
              BandType = 0
              LayerName = Foreground6
            end
            object ppLabel84: TppLabel
              DesignLayer = ppDesignLayer10
              UserName = 'Label84'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              FormField = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 8558
              mmTop = 529
              mmWidth = 6085
              BandType = 0
              LayerName = Foreground6
            end
            object ppLine107: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line107'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4584
              mmLeft = 23019
              mmTop = 0
              mmWidth = 2979
              BandType = 0
              LayerName = Foreground6
            end
            object ppLabel85: TppLabel
              DesignLayer = ppDesignLayer10
              UserName = 'Label85'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              FormField = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 32279
              mmTop = 529
              mmWidth = 6350
              BandType = 0
              LayerName = Foreground6
            end
            object ppLine99: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line99'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4584
              mmLeft = 45688
              mmTop = 0
              mmWidth = 2979
              BandType = 0
              LayerName = Foreground6
            end
          end
          object ppDetailBand10: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLine101: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line1'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 0
              mmTop = 2380
              mmWidth = 197029
              BandType = 4
              LayerName = Foreground6
            end
            object ppDBText67: TppDBText
              DesignLayer = ppDesignLayer10
              UserName = 'DBText67'
              DataField = 'DATAVENCIMENTO'
              DataPipeline = pipPagamentoAluguel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pipPagamentoAluguel'
              mmHeight = 4293
              mmLeft = 1595
              mmTop = 0
              mmWidth = 19863
              BandType = 4
              LayerName = Foreground6
            end
            object ppLine108: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line108'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4616
              mmLeft = 23019
              mmTop = 0
              mmWidth = 2979
              BandType = 4
              LayerName = Foreground6
            end
            object ppLine100: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line100'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4616
              mmLeft = 45688
              mmTop = 0
              mmWidth = 2979
              BandType = 4
              LayerName = Foreground6
            end
            object ppDBText68: TppDBText
              DesignLayer = ppDesignLayer10
              UserName = 'DBText68'
              DataField = 'VALOR'
              DataPipeline = pipPagamentoAluguel
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pipPagamentoAluguel'
              mmHeight = 4293
              mmLeft = 24478
              mmTop = 0
              mmWidth = 20526
              BandType = 4
              LayerName = Foreground6
            end
          end
          object ppFooterBand6: TppFooterBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLine103: TppLine
              DesignLayer = ppDesignLayer10
              UserName = 'Line103'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 0
              mmTop = 2381
              mmWidth = 197029
              BandType = 8
              LayerName = Foreground6
            end
            object ppDBCalc3: TppDBCalc
              DesignLayer = ppDesignLayer10
              UserName = 'DBCalc3'
              DataField = 'VALOR'
              DataPipeline = pipPagamentoAluguel
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pipPagamentoAluguel'
              mmHeight = 4498
              mmLeft = 24429
              mmTop = 0
              mmWidth = 20513
              BandType = 8
              LayerName = Foreground6
            end
          end
          object ppDesignLayers10: TppDesignLayers
            object ppDesignLayer10: TppDesignLayer
              UserName = 'Foreground6'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppLine96: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line96'
        Pen.Style = psDot
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3559
        mmLeft = 0
        mmTop = 36229
        mmWidth = 197217
        BandType = 4
        LayerName = BandLayer9
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers9: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'BandLayer9'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object qryPagamentoAluguel: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    SQL.Strings = (
      
        'SELECT DATAVENCIMENTO, SUM(VALOR * PORCENTAGEM_TERCEIRO/100) AS ' +
        'VALOR'
      '  FROM('
      ''
      
        'SELECT D.CODIGOPRODUTO, D.VALOR, P.PORCENTAGEM_TERCEIRO,  MAX(M.' +
        'DATA) +'
      '--DIAS'
      '0 '
      ''
      'AS DATAVENCIMENTO'
      ''
      '  FROM TABCONTRATO C'
      ' INNER JOIN TABCONTRATOPREVISAO M ON (C.CODIGO = M.CODIGO)'
      ' INNER JOIN TABCONTRATODETALHE D ON (C.CODIGO = D.CODIGO)'
      ' INNER JOIN TABPRODUTOS P ON (D.CODIGOPRODUTO = P.CODIGO)'
      ' INNER JOIN TABPERFIL PE ON (P.IDPERFIL = PE.CODIGO)'
      ' WHERE  P.ORIGEM = '#39'T'#39
      ''
      '--AND'
      ''
      'GROUP BY 1,2,3'
      ''
      ') X'
      ''
      ''
      ''
      'GROUP BY 1'
      '')
    Left = 315
    Top = 256
    object qryPagamentoAluguelDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Origin = '"TABFINANCEIRODETALHE"."DATAVENCIMENTO"'
    end
    object qryPagamentoAluguelVALOR: TIBBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 4
    end
  end
  object dtsPagamentoAluguel: TDataSource
    DataSet = qryPagamentoAluguel
    Left = 350
    Top = 255
  end
  object pipPagamentoAluguel: TppDBPipeline
    DataSource = dtsPagamentoAluguel
    UserName = 'pipPagamentoAluguel'
    Left = 386
    Top = 256
  end
  object rbiAraraSemFoto: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '6350'
      '101115'
      '195880')
    DataPipeline = pipRelArara
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.Enabled = True
    LanguageID = 'Portuguese (Brazil)'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = False
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
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 200
    Top = 24
    Version = '16.01'
    mmColumnWidth = 94766
    DataPipelineName = 'pipRelArara'
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object ppShape9: TppShape
        DesignLayer = ppDesignLayer11
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 27517
        mmLeft = 0
        mmTop = 10583
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground7
      end
      object ppShape10: TppShape
        DesignLayer = ppDesignLayer11
        UserName = 'Shape2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 10583
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground7
      end
      object ppShape11: TppShape
        DesignLayer = ppDesignLayer11
        UserName = 'Shape4'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 37831
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel90: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label14'
        Caption = 'PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127793
        mmTop = 38360
        mmWidth = 28840
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel91: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label1'
        Caption = 'FICHA DE ATENDIMENTO - ARARA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7673
        mmLeft = 88900
        mmTop = 794
        mmWidth = 106627
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText69: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText1'
        DataField = 'CODIGO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 5821
        mmLeft = 23813
        mmTop = 19844
        mmWidth = 29104
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel92: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label2'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 2646
        mmTop = 19844
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel93: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label3'
        Caption = 'Data de Reg.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 28575
        mmWidth = 22754
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText70: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText2'
        DataField = 'DATAREGISTRO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 26458
        mmTop = 28575
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine104: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 27517
        mmLeft = 54240
        mmTop = 10583
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel94: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label4'
        Caption = 'Dados da Arara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 15610
        mmTop = 11377
        mmWidth = 25929
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel95: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label5'
        Caption = 'Dados da Agenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 82815
        mmTop = 11377
        mmWidth = 29633
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine105: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 27517
        mmLeft = 141552
        mmTop = 10583
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel96: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label6'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 55563
        mmTop = 17463
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText71: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText3'
        DataField = 'CODIGOAGENDA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 55827
        mmTop = 21960
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText72: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText4'
        DataField = 'DATA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 78846
        mmTop = 21960
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel97: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label7'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText73: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText5'
        DataField = 'HORA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 110067
        mmTop = 21960
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel98: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label8'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 17463
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine109: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 54240
        mmTop = 27252
        mmWidth = 202142
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine110: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 76729
        mmTop = 16404
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine112: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 107686
        mmTop = 16404
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel99: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label9'
        Caption = 'Evento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 28046
        mmWidth = 10848
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText74: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText6'
        DataField = 'EVENTO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 78581
        mmTop = 32544
        mmWidth = 61913
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel100: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label10'
        Caption = 'Dados do Perfil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 186002
        mmTop = 11377
        mmWidth = 25665
        BandType = 0
        LayerName = Foreground7
      end
      object ppShape12: TppShape
        DesignLayer = ppDesignLayer11
        UserName = 'Shape3'
        mmHeight = 27517
        mmLeft = 256382
        mmTop = 10583
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground7
      end
      object ppImage5: TppImage
        OnPrint = ppImage1Print
        DesignLayer = ppDesignLayer11
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 26987
        mmLeft = 256647
        mmTop = 10848
        mmWidth = 27516
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel101: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label11'
        Caption = 'Perfil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 143404
        mmTop = 17463
        mmWidth = 8732
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText75: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText7'
        DataField = 'PERFIL'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 143669
        mmTop = 21960
        mmWidth = 111654
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel102: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label12'
        Caption = 'Tipo de Convidado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 143404
        mmTop = 28046
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText76: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText8'
        DataField = 'TIPOCONVIDADO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 143404
        mmTop = 32544
        mmWidth = 111919
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel103: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label13'
        Caption = 'Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 55563
        mmTop = 28046
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground7
      end
      object ppDBText77: TppDBText
        DesignLayer = ppDesignLayer11
        UserName = 'DBText9'
        DataField = 'CODIGOAGENDA'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 4498
        mmLeft = 55827
        mmTop = 32544
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground7
      end
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand11: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppShape14: TppShape
        DesignLayer = ppDesignLayer11
        UserName = 'Shape6'
        mmHeight = 6615
        mmLeft = 1589
        mmTop = 1587
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBMemo6: TppDBMemo
        DesignLayer = ppDesignLayer11
        UserName = 'DBMemo6'
        CharWrap = True
        DataField = 'PRODUTO'
        DataPipeline = pipRelArara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'pipRelArara'
        mmHeight = 7118
        mmLeft = 10586
        mmTop = 1321
        mmWidth = 81808
        BandType = 4
        LayerName = Foreground7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
    end
    object ppColumnFooterBand2: TppColumnFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand7: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        DesignLayer = ppDesignLayer11
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261938
        mmTop = 1323
        mmWidth = 20108
        BandType = 8
        LayerName = Foreground7
      end
      object ppLine121: TppLine
        DesignLayer = ppDesignLayer11
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
        LayerName = Foreground7
      end
      object ppSystemVariable8: TppSystemVariable
        DesignLayer = ppDesignLayer11
        UserName = 'SystemVariable2'
        VarType = vtPrintDateTime
        DisplayFormat = #39'Impresso em'#39' dd '#39'de'#39' MMMM '#39'de'#39' yyyy '#39#224's'#39' hh:mm:ss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 68263
        BandType = 8
        LayerName = Foreground7
      end
      object ppLabel105: TppLabel
        DesignLayer = ppDesignLayer11
        UserName = 'Label16'
        Caption = 'AMVSystem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 133615
        mmTop = 1323
        mmWidth = 16933
        BandType = 8
        LayerName = Foreground7
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650614
        44657461696C4265666F726547656E65726174650B50726F6772616D54797065
        070B747450726F63656475726506536F75726365066970726F63656475726520
        44657461696C4265666F726547656E65726174653B0D0A626567696E0D0A2020
        202F2F496D616765322E506963747572652E4C6F616446726F6D46696C652870
        697052656C41726172615B2755524C464F544F275D293B0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060644657461696C094576656E744E616D6506
        0E4265666F726547656E6572617465074576656E744944021A08436172657450
        6F730102060203000001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D6506144865616465724265666F726547656E65726174650B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365066770
        726F636564757265204865616465724265666F726547656E65726174653B0D0A
        626567696E0D0A20202F2F496D616765312E506963747572652E4C6F61644672
        6F6D46696C652870697052656C41726172615B2750455246494C275D293B0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060648656164657209457665
        6E744E616D65060E4265666F726547656E6572617465074576656E744944021A
        084361726574506F730102050203000000}
    end
    object ppDesignLayers11: TppDesignLayers
      object ppDesignLayer11: TppDesignLayer
        UserName = 'Foreground7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
end
