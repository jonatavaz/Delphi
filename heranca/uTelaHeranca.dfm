object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'INFORME AQUI O T'#205'TULO'
  ClientHeight = 709
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1071
    Height = 668
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object Label1: TLabel
        Left = 168
        Top = 216
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 1063
        Height = 81
        Align = alTop
        TabOrder = 0
        object lblIndice: TLabel
          Left = 8
          Top = 3
          Width = 85
          Height = 15
          Caption = 'CampoPesquisa'
        end
        object mskPesquisar: TMaskEdit
          Left = 8
          Top = 24
          Width = 441
          Height = 23
          TabOrder = 0
          Text = 'Digite sua Pesquisa'
        end
        object btnPequisar: TBitBtn
          Left = 455
          Top = 23
          Width = 75
          Height = 25
          Caption = '&PESQUISAR'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 81
        Width = 1063
        Height = 557
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 668
    Width = 1071
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      1071
      41)
    object btnNovo: TBitBtn
      Left = 12
      Top = 7
      Width = 75
      Height = 25
      Caption = '&NOVO'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 93
      Top = 7
      Width = 75
      Height = 25
      Caption = '&ALTERAR'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 174
      Top = 7
      Width = 75
      Height = 25
      Caption = '&CANCELAR'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 255
      Top = 7
      Width = 75
      Height = 25
      Caption = '&GRAVAR'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 336
      Top = 7
      Width = 75
      Height = 25
      Caption = 'APAGA&R'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 974
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&FECHAR'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 417
      Top = 7
      Width = 224
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object QryListagem: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Params = <>
    Left = 568
    Top = 48
  end
  object dtsListagem: TDataSource
    DataSet = QryListagem
    Left = 652
    Top = 50
  end
end
