inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
  StyleElements = [seFont, seClient, seBorder]
  OnKeyDown = dbGridItensVendaKeyDown
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
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
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaId'
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Width = 294
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 295
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalvenda'
            Width = 411
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object Label5: TLabel
        Left = 170
        Top = 38
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label4: TLabel
        Left = 920
        Top = 40
        Width = 59
        Height = 15
        Caption = 'Data Venda'
      end
      object Label7: TLabel
        Left = 8
        Top = 105
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label8: TLabel
        Left = 8
        Top = 118
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label9: TLabel
        Left = 3
        Top = 87
        Width = 43
        Height = 15
        Caption = 'Produto'
      end
      object Label10: TLabel
        Left = 381
        Top = 87
        Width = 71
        Height = 15
        Caption = 'Valor Unit'#225'rio'
      end
      object Label11: TLabel
        Left = 513
        Top = 87
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object Label12: TLabel
        Left = 656
        Top = 87
        Width = 88
        Height = 15
        Caption = 'Total do Produto'
      end
      object edtVendaId: TLabeledEdit
        Tag = 1
        Left = 0
        Top = 56
        Width = 164
        Height = 23
        EditLabel.Width = 79
        EditLabel.Height = 15
        EditLabel.Caption = 'N'#250'mero Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 1
        Text = ''
      end
      object lkpCliente: TDBLookupComboBox
        Left = 170
        Top = 56
        Width = 735
        Height = 23
        KeyField = 'clienteId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 2
      end
      object edtDataVenda: TDateEdit
        Left = 920
        Top = 57
        Width = 121
        Height = 23
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 0
        Top = 104
        Width = 1063
        Height = 534
        Align = alBottom
        TabOrder = 4
        object Panel3: TPanel
          Left = 1
          Top = 42
          Width = 1061
          Height = 450
          Align = alClient
          TabOrder = 1
          object Label2: TLabel
            Left = 897
            Top = 451
            Width = 26
            Height = 15
            Caption = 'Valor'
          end
          object dbGridItensVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 1059
            Height = 448
            Align = alClient
            DataSource = dtmVenda.dtsItensVenda
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = dbGridItensVendaDblClick
            OnKeyDown = grdListagemKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'produtoId'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Width = 273
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Width = 179
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Width = 197
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorTotalProduto'
                Width = 483
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 492
          Width = 1061
          Height = 41
          Align = alBottom
          TabOrder = 2
          object Label3: TLabel
            Left = 939
            Top = 14
            Width = 26
            Height = 15
            Caption = 'Valor'
          end
          object Label6: TLabel
            Left = 853
            Top = 14
            Width = 81
            Height = 15
            Caption = 'Valor da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotal: TCurrencyEdit
            Left = 936
            Top = 6
            Width = 121
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 1061
          Height = 41
          Align = alTop
          TabOrder = 0
          object edtValorUnitario: TCurrencyEdit
            Left = 380
            Top = 9
            Width = 121
            Height = 23
            DisplayFormat = ',0.00;-,0.00'
            TabOrder = 1
          end
          object edtQuantidade: TCurrencyEdit
            Left = 507
            Top = 12
            Width = 121
            Height = 23
            DisplayFormat = ',0.00;-,0.00'
            TabOrder = 2
            OnEnter = edtQuantidadeEnter
            OnExit = edtQuantidadeExit
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 655
            Top = 9
            Width = 121
            Height = 23
            TabStop = False
            DisplayFormat = ',0.00;-,0.00'
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object btnApagarItem: TBitBtn
            Left = 936
            Top = 7
            Width = 121
            Height = 25
            Caption = 'RE&MOVER'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              2D2BAA252595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0101
              60000073FF00FFFF00FFFF00FF3836B61111B81C1CB82F2FA4FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF06066D01018A00008B020074FF00FF3F3FBB1616C5
              0A0AC20A0AC02222C43737ADFF00FFFF00FFFF00FFFF00FF11117B0505910000
              9000009000008B0200743B3BB22C2CD30D0DD00D0DCE0C0CC92828CC3D3DB4FF
              00FFFF00FF1F1F8E0C0C9F00009200009000009000008800005DFF00FF4747C1
              3333DE1111DA0F0FD50D0DCF2A2AD13C3CB42F2FA41717B40303A30101990000
              91010189010160FF00FFFF00FFFF00FF5454CC3C3CE71313E11111DA0E0ED328
              28CF2222C60707B50505AA0303A0060693050566FF00FFFF00FFFF00FFFF00FF
              FF00FF5C5CD33F3FEA1414E31111DC0E0ED10C0CC70909BC0606B10D0DA40E0E
              77FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5BD03D3DE61414E311
              11DA0D0DCF0A0AC21616B5181886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF6E6ECE5B5BE92020E71313E10F0FD40C0CC91616B7181887FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7878CE7474E75353EE4848ED35
              35E92020DD1111CE0A0ABF0F0FAB0E0E79FF00FFFF00FFFF00FFFF00FFFF00FF
              7F7FCB8787E56D6DF26363F05757EF5C5CDE5252D83B3BDA2D2DCE1F1FC01818
              A5111176FF00FFFF00FFFF00FF8484C79797E38484F47B7BF37070F27272E05B
              5BBB4D4DB15151CF4141D43838C92F2FBD2929A51B1B78FF00FF8686C2A0A0E0
              9999F69191F68888F48383DE6767BCFF00FFFF00FF4747A55050C54242CB3737
              C02E2EB52929A01D1D7A9393B7A5A5EAA1A1F79A9AF69292DD6E6EBDFF00FFFF
              00FFFF00FFFF00FF3F3F9C4A4ABC3B3BC03232B52D2DA92B2B8EFF00FF9594B6
              A7A7E99D9DDC7676BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3C3C984141
              B53535B0343495FF00FFFF00FFFF00FF9796B68080C0FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF3636933E3E9AFF00FFFF00FF}
            TabOrder = 0
            TabStop = False
            OnClick = btnApagarItemClick
          end
          object btnAdicionarItem: TBitBtn
            Left = 800
            Top = 7
            Width = 123
            Height = 25
            Caption = '&Adicionar'
            TabOrder = 4
            OnClick = btnAdicionarItemClick
          end
        end
      end
      object lkpProduto: TDBLookupComboBox
        Left = 9
        Top = 114
        Width = 366
        Height = 23
        DataField = 'nome'
        DataSource = dtsListagem
        KeyField = 'produtoId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsProdutos
        TabOrder = 0
        OnExit = lkpProdutoExit
      end
    end
  end
  inherited pnlRodape: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnFechar: TBitBtn
      Left = 952
      ExplicitLeft = 952
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT vendas.vendaId,'
      #9'   vendas.clienteId,'
      #9'   clientes.nome,'
      #9'   vendas.dataVenda,'
      #9'   vendas.totalvenda'
      'FROM vendas'
      'INNER JOIN clientes ON clientes.clienteId = vendas.clienteId')
    object QryListagemvendaId: TZIntegerField
      DisplayLabel = 'N'#250'mero Venda'
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object QryListagemclienteId: TZIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'clienteId'
      Required = True
    end
    object QryListagemnome: TZUnicodeStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdataVenda: TZDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'dataVenda'
    end
    object QryListagemtotalvenda: TZFMTBCDField
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalvenda'
      Precision = 18
      Size = 5
    end
  end
end
