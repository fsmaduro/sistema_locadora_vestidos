object frmArarasAgenda: TfrmArarasAgenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'AMVSystem 1.0 | ARARAS DA AGENDA'
  ClientHeight = 361
  ClientWidth = 586
  Color = 12910591
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 125
    Height = 322
    Align = alLeft
    BevelOuter = bvNone
    Color = 9961471
    ParentBackground = False
    TabOrder = 0
    object Panel5: TPanel
      Left = 3
      Top = 6
      Width = 119
      Height = 19
      BevelOuter = bvNone
      Caption = 'C'#243'digo'
      Color = 56797
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 3
      Top = 24
      Width = 119
      Height = 27
      BevelOuter = bvNone
      Color = 16644087
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object DBText1: TDBText
        Left = 0
        Top = 0
        Width = 119
        Height = 27
        Align = alClient
        Alignment = taCenter
        Color = clYellow
        DataField = 'CODIGO'
        DataSource = dtsPainel
        ParentColor = False
        ExplicitLeft = -3
        ExplicitTop = -2
      end
    end
    object cxButton6: TcxButton
      Left = 3
      Top = 57
      Width = 119
      Height = 65
      Caption = 'Abrir Arara'
      TabOrder = 2
      OnClick = cxButton6Click
      LookAndFeel.SkinName = ''
    end
    object cxButton1: TcxButton
      Left = 3
      Top = 146
      Width = 119
      Height = 48
      Caption = 'Imprimir Arara'
      TabOrder = 3
      OnClick = cxButton1Click
      LookAndFeel.SkinName = ''
    end
    object chbSemFoto: TCheckBox
      Left = 4
      Top = 126
      Width = 113
      Height = 17
      Caption = 'Imprimir sem Foto'
      TabOrder = 4
    end
  end
  object grdPainel: TcxGrid
    Left = 125
    Top = 0
    Width = 461
    Height = 322
    Align = alClient
    TabOrder = 1
    LookAndFeel.SkinName = ''
    ExplicitLeft = 123
    ExplicitWidth = 463
    ExplicitHeight = 326
    object grdPainelDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsPainel
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object grdPainelDBTableView1CODIGO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODIGO'
      end
      object grdPainelDBTableView1PERFIL: TcxGridDBColumn
        Caption = 'Perfil'
        DataBinding.FieldName = 'PERFIL'
      end
      object grdPainelDBTableView1PRODUTOS: TcxGridDBColumn
        Caption = 'Produtos'
        DataBinding.FieldName = 'PRODUTOS'
      end
    end
    object grdPainelLevel1: TcxGridLevel
      GridView = grdPainelDBTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 322
    Width = 586
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      586
      39)
    object cxButton5: TcxButton
      Left = 431
      Top = 2
      Width = 151
      Height = 36
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = cxButton5Click
      LookAndFeel.SkinName = ''
    end
  end
  object qryPainel: TIBQuery
    Database = Dados.IBDatabase
    Transaction = Dados.IBTransaction
    BeforeOpen = qryPainelBeforeOpen
    SQL.Strings = (
      
        'Select a.codigo, p.nome as Perfil, count(d.codigoproduto) as Pro' +
        'dutos'
      ' from TABARARA a'
      ' left join tabperfil p on a.codigoperfil = p.codigo'
      ' left join tabararadetalhe d on a.codigo = d.codigoarara'
      'where a.codigoagenda = :codigoAgenda'
      ''
      'group by 1,2'
      'order by a.codigo')
    Left = 279
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoAgenda'
        ParamType = ptUnknown
      end>
    object qryPainelCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TABARARA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPainelPERFIL: TIBStringField
      FieldName = 'PERFIL'
      ProviderFlags = []
      Size = 50
    end
    object qryPainelPRODUTOS: TIntegerField
      FieldName = 'PRODUTOS'
      ProviderFlags = []
    end
  end
  object dtsPainel: TDataSource
    DataSet = qryPainel
    Left = 247
    Top = 208
  end
end
