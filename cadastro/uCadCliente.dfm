inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 448
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 487
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Height = 407
    ActivePage = tabManutencao
    ExplicitHeight = 407
    inherited tabListagem: TTabSheet
      ExplicitHeight = 377
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
        Height = 296
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Width = 543
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitHeight = 377
      object Label2: TLabel
        Left = 855
        Top = 107
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label3: TLabel
        Left = 855
        Top = 205
        Width = 44
        Height = 15
        Caption = 'Telefone'
      end
      object Label4: TLabel
        Left = 0
        Top = 307
        Width = 91
        Height = 15
        Caption = 'Data Nascimento'
      end
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
      object edtCEP: TMaskEdit
        Left = 855
        Top = 128
        Width = 200
        Height = 23
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  .   -   '
      end
      object edtEndereco: TLabeledEdit
        Left = 0
        Top = 176
        Width = 849
        Height = 23
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 2
        Text = ''
      end
      object edtBairro: TLabeledEdit
        Left = 855
        Top = 176
        Width = 200
        Height = 23
        EditLabel.Width = 31
        EditLabel.Height = 15
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 3
        Text = ''
      end
      object edtCidade: TLabeledEdit
        Left = 0
        Top = 224
        Width = 849
        Height = 23
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 4
        Text = ''
      end
      object edtTelefone: TMaskEdit
        Left = 855
        Top = 224
        Width = 197
        Height = 23
        EditMask = '(99) 9999-9999;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
      object edtEmail: TLabeledEdit
        Left = 0
        Top = 272
        Width = 849
        Height = 23
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 6
        Text = ''
      end
      object edtDataNascimento: TDateEdit
        Left = 0
        Top = 328
        Width = 121
        Height = 23
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 7
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 0
        Top = 128
        Width = 849
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 8
        Text = ''
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 407
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 407
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT clienteId,'
      #9'   nome,'
      #9'   endereco,'
      #9'   cidade,'
      #9'   bairro, '
      #9'   estado,'
      #9'   cep, '
      #9'   telefone, '
      #9'   email, '
      #9'   dataNascimento'
      'FROM clientes')
    object QryListagemclienteId: TZIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TZUnicodeStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemendereco: TZUnicodeStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 50
    end
    object QryListagemcidade: TZUnicodeStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object QryListagembairro: TZUnicodeStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemestado: TZUnicodeStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 2
    end
    object QryListagemcep: TZUnicodeStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TZUnicodeStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagememail: TZUnicodeStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdataNascimento: TZDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'dataNascimento'
    end
  end
end
