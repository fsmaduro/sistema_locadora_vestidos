object AniversariantesDia: TAniversariantesDia
  Left = 185
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aniversariantes do Dia'
  ClientHeight = 547
  ClientWidth = 429
  Color = 12910591
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPergunta: TLabel
    Left = 4
    Top = 6
    Width = 158
    Height = 16
    Alignment = taCenter
    Caption = 'Aniversatiantes do Dia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 28
    Width = 421
    Height = 515
    Color = 12910591
    DataSource = Dados.dtsGeral
    FixedColor = 9699327
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
