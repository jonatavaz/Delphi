inherited frmCadCategoria: TfrmCadCategoria
  Tag = 2
  Caption = 'Cadastro de Categorias'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    ExplicitWidth = 1071
    ExplicitHeight = 668
    inherited tabListagem: TTabSheet
      inherited Label1: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnlListagemTopo: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 1063
        inherited lblIndice: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object edtCategoriaId: TLabeledEdit
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
      object edtDescricao: TLabeledEdit
        Left = 0
        Top = 128
        Width = 529
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
    end
  end
  inherited pnlRodape: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnFechar: TBitBtn
      Left = 956
      ExplicitLeft = 956
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT categoriaId,'
      '            descricao'
      'FROM categorias;')
    object QryListagemcategoriaId: TZIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TZUnicodeStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
