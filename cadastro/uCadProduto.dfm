inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 422
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 461
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Height = 381
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      ExplicitHeight = 351
      inherited Label1: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnlListagemTopo: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited lblIndice: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited grdListagem: TDBGrid
        Height = 270
        Columns = <
          item
            Expanded = False
            FieldName = 'C'#243'digo'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 181
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descri'#231#227'o da Categoria'
            Width = 394
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitHeight = 351
      object Label2: TLabel
        Left = 0
        Top = 168
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel
        Left = 3
        Top = 279
        Width = 26
        Height = 15
        Caption = 'Valor'
      end
      object Label4: TLabel
        Left = 148
        Top = 279
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 0
        Top = 128
        Width = 497
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
        Text = ''
      end
      object edtProdutoId: TLabeledEdit
        Tag = 1
        Left = 0
        Top = 64
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtDescricao: TMemo
        Left = 0
        Top = 184
        Width = 1060
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 0
        Top = 300
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 148
        Top = 300
        Width = 121
        Height = 23
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 516
        Top = 128
        Width = 544
        Height = 23
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 381
    StyleElements = [seFont, seClient, seBorder]
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT p.produtoId,'
      '     p.nome,'
      '     p.descricao,'
      '     p.valor,'
      '     p.quantidade,'
      '     p.categoriaId,'
      '     c.descricao AS DescricaoCategoria'
      'FROM produtos AS p'
      '    LEFT JOIN categorias AS C ON c.categoriaId = p.categoriaId')
    object QryListagemprodutoId: TZIntegerField
      FieldName = 'C'#243'digo'
      ReadOnly = True
    end
    object QryListagemnome: TZUnicodeStringField
      FieldName = 'Nome'
      Size = 60
    end
    object QryListagemdescricao: TZUnicodeStringField
      FieldName = 'Descri'#231#227'o'
      Size = 255
    end
    object QryListagemvalor: TZFMTBCDField
      FieldName = 'Valor'
      Precision = 18
      Size = 5
    end
    object QryListagemquantidade: TZFMTBCDField
      FieldName = 'Quantidade'
      Precision = 18
      Size = 5
    end
    object QryListagemcategoriaId: TZIntegerField
      FieldName = 'Cod. Categoria'
    end
    object QryListagemDescricaoCategoria: TZUnicodeStringField
      FieldName = 'Descri'#231#227'o da Categoria'
      Size = 30
    end
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'SELECT categoriaId, descricao FROM categorias')
    Params = <>
    Left = 700
    Top = 170
    object QryCategoriacategoriaId: TZIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriadescricao: TZUnicodeStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 796
    Top = 178
  end
end
