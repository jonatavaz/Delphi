object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 473
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mainPrincipal
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object mainPrincipal: TMainMenu
    Left = 640
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object Cliente1: TMenuItem
        Caption = 'CLIENTE'
        OnClick = Cliente1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = N2Click
      end
      object PRODUTO1: TMenuItem
        Caption = 'PRODUTO'
        OnClick = PRODUTO1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Caption = 'FECHAR'
        OnClick = mnuFecharClick
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#195'O'
      object VENDAS1: TMenuItem
        Caption = 'VENDAS'
        OnClick = VENDAS1Click
      end
    end
    object RELATRIO1: TMenuItem
      Caption = 'RELAT'#211'RIOS'
      object CATEGORIA1: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = CATEGORIA1Click
      end
      object CLIENTE2: TMenuItem
        Caption = 'CLIENTE'
      end
      object CLIENTE3: TMenuItem
        Caption = '-'
      end
      object PRODUTO2: TMenuItem
        Caption = 'PRODUTO'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object VENDASPORDATA1: TMenuItem
        Caption = 'VENDAS POR DATA'
      end
    end
  end
end
