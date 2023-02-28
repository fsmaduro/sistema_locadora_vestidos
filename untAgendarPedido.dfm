object frmAgendarPedido: TfrmAgendarPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize, biHelp]
  Caption = 'AMVSystem 1.0 | Agendar Pedido'
  ClientHeight = 530
  ClientWidth = 1017
  Color = 12910591
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 697
    Top = 31
    Height = 460
    ExplicitLeft = 512
    ExplicitTop = 232
    ExplicitHeight = 100
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Caption = 'AGENDAR PEDIDO'
    Color = 7012351
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -23
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
  end
  object Panel2: TPanel
    Left = 0
    Top = 491
    Width = 1017
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      1017
      39)
    object Label3: TLabel
      Left = 5
      Top = 2
      Width = 130
      Height = 13
      Caption = 'Visualiza'#231#227'o do Calend'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cxButton2: TcxButton
      Left = 706
      Top = 2
      Width = 151
      Height = 36
      Anchors = [akTop, akRight]
      Caption = 'Agendar'
      TabOrder = 0
      OnClick = cxButton2Click
      LookAndFeel.SkinName = ''
    end
    object cxButton3: TcxButton
      Left = 863
      Top = 2
      Width = 151
      Height = 36
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = cxButton3Click
      LookAndFeel.SkinName = ''
    end
    object ComboBox1: TComboBox
      Left = 5
      Top = 15
      Width = 145
      Height = 21
      Color = 13828095
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 2
      Text = 'Semana'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Dias'
        'Semanas'
        'Semana'
        'Ano'
        'Gantt'
        'Grade de Tempo')
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 697
    Height = 460
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    ExplicitHeight = 464
    object grdPainel: TcxGrid
      Left = 0
      Top = 0
      Width = 697
      Height = 460
      Align = alClient
      TabOrder = 0
      LookAndFeel.SkinName = ''
      ExplicitHeight = 464
      object grdPainelDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataModeController.GridMode = True
        DataController.DataModeController.SmartRefresh = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        OptionsView.GroupByBox = False
        object grdPainelDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Options.Editing = False
          Options.ShowEditButtons = isebNever
          Styles.Content = cxStyle1
          Width = 28
          IsCaptionAssigned = True
        end
        object grdPainelDBTableView1DATAMELHORDIA: TcxGridDBColumn
          Caption = 'Melhor Dia'
          DataBinding.FieldName = 'DATAMELHORDIA'
          Options.Editing = False
          Options.ShowEditButtons = isebNever
          Styles.Content = cxStyle1
          Width = 80
        end
        object grdPainelDBTableView1HORAMELHORDIA: TcxGridDBColumn
          Caption = 'Melhor Hora'
          DataBinding.FieldName = 'HORAMELHORDIA'
          Options.Editing = False
          Options.ShowEditButtons = isebNever
          Styles.Content = cxStyle1
          Width = 63
        end
        object grdPainelDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'AGENDAR'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Width = 31
          IsCaptionAssigned = True
        end
        object grdPainelDBTableView1DATAAGENDA: TcxGridDBColumn
          Caption = 'Data Agendar'
          DataBinding.FieldName = 'DATAAGENDA'
          Width = 80
        end
        object grdPainelDBTableView1HORAAGENDA: TcxGridDBColumn
          Caption = 'Hora Agendar'
          DataBinding.FieldName = 'HORAAGENDA'
          Width = 72
        end
        object grdPainelDBTableView1TEMPOAGENDA: TcxGridDBColumn
          Caption = 'Tempo'
          DataBinding.FieldName = 'TEMPOAGENDA'
          Options.Editing = False
          Options.ShowEditButtons = isebNever
          Styles.Content = cxStyle1
          Width = 59
        end
        object grdPainelDBTableView1ACOMPANHANTES: TcxGridDBColumn
          Caption = 'Acomp.'
          DataBinding.FieldName = 'ACOMPANHANTES'
          Options.Editing = False
          Options.ShowEditButtons = isebNever
          Styles.Content = cxStyle1
          Width = 41
        end
        object grdPainelDBTableView1NOMEPERFIL: TcxGridDBColumn
          Caption = 'Nome do Perfil'
          DataBinding.FieldName = 'NOMEPERFIL'
          Options.Editing = False
          Options.ShowEditButtons = isebNever
          Styles.Content = cxStyle1
          Width = 250
        end
      end
      object grdPainelLevel1: TcxGridLevel
        GridView = grdPainelDBTableView1
      end
    end
  end
  object cxScheduler1: TcxScheduler
    Left = 700
    Top = 31
    Width = 317
    Height = 460
    DateNavigator.RowCount = 3
    ViewDay.Active = True
    ViewDay.AlwaysShowEventTime = True
    ViewDay.ShowAllDayEventsInContentArea = True
    ViewDay.TimeRulerMinutes = True
    ViewDay.WorkTimeOnly = True
    ViewTimeGrid.ShowMoreEventsButton = False
    ViewTimeGrid.EventDetailInfo = True
    ViewTimeGrid.ShowTimeAsClock = True
    ViewTimeGrid.WorkTimeOnly = True
    Align = alClient
    ContentPopupMenu.UseBuiltInPopupMenu = False
    ContentPopupMenu.Items = []
    ControlBox.Visible = False
    DialogsLookAndFeel.SkinName = 'UserSkin'
    EventOperations.ReadOnly = True
    EventOperations.Recurrence = False
    EventPopupMenu.UseBuiltInPopupMenu = False
    EventPopupMenu.Items = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.SkinName = ''
    OptionsView.ShowNavigationButtons = False
    OptionsView.WorkStart = 0.000000000000000000
    OptionsView.WorkFinish = 0.999305555555555600
    ResourceNavigator.Visibility = snvNever
    Storage = cxSchedulerDBStorage1
    TabOrder = 3
    OnDblClick = cxScheduler1DblClick
    ExplicitHeight = 464
    Splitters = {
      AD0000007E0000003C01000083000000A800000001000000AD000000CB010000}
    StoredClientBounds = {01000000010000003C010000CB010000}
  end
  object mmAgendas: TMemoryTable
    AfterScroll = mmAgendasAfterScroll
    Left = 472
    Top = 72
    object mmAgendasID: TIntegerField
      FieldName = 'ID'
    end
    object mmAgendasNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 100
    end
    object mmAgendasDATAMELHORDIA: TDateField
      FieldName = 'DATAMELHORDIA'
    end
    object mmAgendasHORAMELHORDIA: TTimeField
      FieldName = 'HORAMELHORDIA'
    end
    object mmAgendasDATAAGENDA: TDateField
      FieldName = 'DATAAGENDA'
    end
    object mmAgendasHORAAGENDA: TTimeField
      FieldName = 'HORAAGENDA'
    end
    object mmAgendasTEMPOAGENDA: TTimeField
      FieldName = 'TEMPOAGENDA'
    end
    object mmAgendasACOMPANHANTES: TIntegerField
      FieldName = 'ACOMPANHANTES'
    end
    object mmAgendasAGENDAR: TBooleanField
      FieldName = 'AGENDAR'
    end
  end
  object dtsSelecionados: TDataSource
    DataSet = mmAgendas
    Left = 504
    Top = 72
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14719638
    end
  end
  object qryAgenda: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    ForcedRefresh = True
    BeforeOpen = qryAgendaBeforeOpen
    SQL.Strings = (
      'SELECT '
      '   (A.DATA + A.HORA) AS INICIO,'
      '   (A.DATAFIM + A.HORAFIM) AS FINAL,'
      '   0 AS TIPO,'
      '   A.descricao AS NOMEACAO,'
      
        '  '#39'Perfil: '#39'||Coalesce(P.codigo,'#39#39')||'#39' - '#39'||Coalesce(P.NOME,'#39#39')|' +
        '|'#39' - '#39'||'
      
        '   Case when a.idpedidoagenda is null then '#39#39' else '#39' Pedido de A' +
        'genda: '#39'||A.idpedidoagenda end||'#39' - Situa'#231#227'o: '#39'||'
      
        '   Upper(Trim(Case when Coalesce(A.situacao,1) = 1 then '#39'Em Aber' +
        'to'#39
      
        '             when Coalesce(A.situacao,1) = 2 then '#39'Cancelada'#39'||'#39 +
        ' - Motivo: '#39'||Coalesce(a.motivocancelamento,'#39#39')'
      '             when Coalesce(A.situacao,1) = 3 then '#39'Confirmada'#39
      
        '             when Coalesce(A.situacao,1) = 4 then '#39'Finalizada'#39' e' +
        'lse '#39#39' End)) AS CAPTION,'
      '   2 AS OPCOES,'
      
        '   Case when a.situacao = 1 and Coalesce(a.idpedidoagenda,0) > 0' +
        ' then :CORAGENDAPEDIDO'
      
        '        when a.situacao = 1 and Coalesce(a.idpedidoagenda,0) = 0' +
        ' then :CORAGENDATRABALHO'
      '        when a.situacao = 2 then :CORAGENDACANCELADA'
      '        when a.situacao = 3 then :CORCONFIRMADA'
      '        when a.situacao = 4 then :CORFINALIZADA'
      '        else 6610596 end as COR,'
      '   Trim(Case when A.situacao = 1 then '#39'Em Aberto'#39
      '             when A.situacao = 2 then '#39'Cancelada'#39
      '             when A.situacao = 3 then '#39'Confirmada'#39
      
        '             when A.situacao = 4 then '#39'Finalizada'#39' else '#39#39' End) ' +
        'as NomeSituacao,'
      '   A.*'
      'FROM TABAGENDA A'
      'LEFT JOIN tabperfil P on a.idperfil = p.codigo'
      'left join tabprodutos pr on a.codigoproduto = pr.codigo'
      ''
      'where a.data >= current_date'
      '  and a.data <= :DATAEVENTO'
      '  and a.situacao in (1,3)'
      '  and IDPEDIDOAGENDA is not null'
      ''
      ''
      ''
      'ORDER BY A.DATA')
    Left = 722
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CORAGENDAPEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CORAGENDATRABALHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CORAGENDACANCELADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CORCONFIRMADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CORFINALIZADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataevento'
        ParamType = ptUnknown
      end>
    object qryAgendaINICIO: TDateTimeField
      FieldName = 'INICIO'
      ProviderFlags = []
    end
    object qryAgendaFINAL: TDateTimeField
      FieldName = 'FINAL'
      ProviderFlags = []
    end
    object qryAgendaTIPO: TIntegerField
      FieldName = 'TIPO'
      ProviderFlags = []
    end
    object qryAgendaNOMEACAO: TMemoField
      FieldName = 'NOMEACAO'
      Origin = '"TABAGENDA"."DESCRICAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryAgendaOPCOES: TIntegerField
      FieldName = 'OPCOES'
      ProviderFlags = []
    end
    object qryAgendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABAGENDA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgendaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"TABAGENDA"."DATA"'
    end
    object qryAgendaHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"TABAGENDA"."HORA"'
    end
    object qryAgendaIDPEDIDOAGENDA: TIntegerField
      FieldName = 'IDPEDIDOAGENDA'
      Origin = '"TABAGENDA"."IDPEDIDOAGENDA"'
    end
    object qryAgendaIDPERFIL: TIntegerField
      FieldName = 'IDPERFIL'
      Origin = '"TABAGENDA"."IDPERFIL"'
    end
    object qryAgendaCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = '"TABAGENDA"."CODIGOPRODUTO"'
    end
    object qryAgendaDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      Origin = '"TABAGENDA"."DESCRICAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryAgendaDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Origin = '"TABAGENDA"."DATAFIM"'
    end
    object qryAgendaHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = '"TABAGENDA"."HORAFIM"'
    end
    object qryAgendaCOR: TIntegerField
      FieldName = 'COR'
      ProviderFlags = []
    end
    object qryAgendaSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = '"TABAGENDA"."SITUACAO"'
    end
    object qryAgendaMOTIVOCANCELAMENTO: TIBStringField
      FieldName = 'MOTIVOCANCELAMENTO'
      Origin = '"TABAGENDA"."MOTIVOCANCELAMENTO"'
      Size = 200
    end
    object qryAgendaCAPTION: TIBStringField
      FieldName = 'CAPTION'
      ProviderFlags = []
      Size = 559
    end
    object qryAgendaNOMESITUACAO: TIBStringField
      FieldName = 'NOMESITUACAO'
      ProviderFlags = []
      Size = 10
    end
  end
  object dtsAgenda: TwwDataSource
    DataSet = qryAgenda
    Left = 688
    Top = 305
  end
  object cxSchedulerDBStorage1: TcxSchedulerDBStorage
    Reminders.ReminderWindowLookAndFeel.SkinName = 'UserSkin'
    Resources.Items = <>
    SmartRefresh = True
    CustomFields = <>
    DataSource = dtsAgenda
    FieldNames.ActualFinish = 'FINAL'
    FieldNames.ActualStart = 'INICIO'
    FieldNames.Caption = 'CAPTION'
    FieldNames.EventType = 'TIPO'
    FieldNames.Finish = 'FINAL'
    FieldNames.ID = 'CODIGO'
    FieldNames.LabelColor = 'COR'
    FieldNames.Message = 'NOMEACAO'
    FieldNames.Options = 'OPCOES'
    FieldNames.Start = 'INICIO'
    FieldNames.State = 'TERMINADA'
    Left = 896
    Top = 288
  end
  object qryPainel: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    AfterOpen = qryPainelAfterOpen
    BeforeOpen = qryPainelBeforeOpen
    SQL.Strings = (
      'select'
      '       a.id,'
      '       a.codigoperfil,'
      '       pr.nome as nomeperfil,'
      '       a.datamelhordia,'
      '       a.horamelhordia,'
      '       Case when a.id = 1 then'
      
        '          (select Count(a.id) from tabacompanhantespedidoagenda ' +
        'a where p.codigo = a.codigopedido and a.tipoagendamento = 2)'
      '       else 0 end as QtdeAcompanhantes'
      '  from tabpedidoagendamento p'
      
        '  left join tabacompanhantespedidoagenda a on p.codigo = a.codig' +
        'opedido'
      '  left join tabperfil pr on a.codigoperfil = pr.codigo'
      
        '  left join tabtipoconvidado tc on a.codigotipoconvidado = tc.co' +
        'digo'
      '  left join tabevento e on p.codigoevento = e.codigo'
      ' where a.tipoagendamento = 1'
      '   and p.codigo = :pedido'
      
        '   and not Exists(Select ag.codigo from tabagenda ag where ag.id' +
        'pedidoagenda = p.codigo and ag.idperfil = a.codigoperfil and ag.' +
        'situacao <> 2)'
      ''
      ' order by 1')
    Left = 279
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pedido'
        ParamType = ptUnknown
      end>
    object qryPainelID: TIntegerField
      FieldName = 'ID'
      Origin = '"TABACOMPANHANTESPEDIDOAGENDA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPainelCODIGOPERFIL: TIntegerField
      FieldName = 'CODIGOPERFIL'
      Origin = '"TABACOMPANHANTESPEDIDOAGENDA"."CODIGOPERFIL"'
    end
    object qryPainelNOMEPERFIL: TIBStringField
      FieldName = 'NOMEPERFIL'
      Origin = '"TABPERFIL"."NOME"'
      Size = 50
    end
    object qryPainelDATAMELHORDIA: TDateField
      FieldName = 'DATAMELHORDIA'
      Origin = '"TABACOMPANHANTESPEDIDOAGENDA"."DATAMELHORDIA"'
    end
    object qryPainelHORAMELHORDIA: TTimeField
      FieldName = 'HORAMELHORDIA'
      Origin = '"TABACOMPANHANTESPEDIDOAGENDA"."HORAMELHORDIA"'
    end
    object qryPainelQTDEACOMPANHANTES: TIntegerField
      FieldName = 'QTDEACOMPANHANTES'
      ProviderFlags = []
    end
  end
  object dtsPainel: TDataSource
    DataSet = qryPainel
    Left = 247
    Top = 208
  end
  object PopupMenu1: TPopupMenu
    Left = 409
    Top = 168
    object AgendarAqui1: TMenuItem
      Caption = 'Agendar Aqui'
      OnClick = AgendarAqui1Click
    end
  end
end
