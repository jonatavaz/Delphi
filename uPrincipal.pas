unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter, uFrmAtualizaDB;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIO1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    PRODUTO1: TMenuItem;
    N3: TMenuItem;
    mnuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    CLIENTE3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDASPORDATA1: TMenuItem;
    CATEGORIA1: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto, uProVenda, uRelCategoria, ufrmRelCategoria;

procedure TfrmPrincipal.N2Click(Sender: TObject);
begin
  frmCadCategoria:=TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
    frmCadProduto:=TfrmCadProduto.Create(Self);
    frmCadProduto.ShowModal;
    frmCadProduto.Release;
end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
begin
    frmProVenda:=TfrmProVenda.Create(Self);
    frmProVenda.ShowModal;
    frmProVenda.Release;
end;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
   frmRelCategoria:=TfrmRelCategotia.Create(Self);
   frmRelCategoria.Relatorio.PreviewModal;
   frmRelCategoria.Release;

end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
    frmCadCliente:=TfrmCadCliente.Create(Self);
    frmCadCliente.ShowModal;
    frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     frmAtualizaDB:=TfrmAtualizaDB.Create(self);
     frmAtualizaDB.Show;
     frmAtualizaDB.Refresh;
     dtmPrincipal := TdtmPrincipal.Create(Self);
     dtmPrincipal.ConexaoDB.SQLHourGlass:=True;
     dtmPrincipal.ConexaoDB.Connected:=True;

    AtualizacaoBancoDados(frmAtualizaDB);
    frmAtualizaDB.Free;


    TeclaEnter:= TMREnter.Create(Self);
    TeclaEnter.FocusEnabled:=true;
    TeclaEnter.FocusColor:=clInfoBk;

end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
    Close;

end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TFrmAtualizaDB);
begin
  aForm.chkConexao.Checked := true;
  aForm.Refresh;
  Sleep(500);
  DtmPrincipal.QryScriptCategorias.ExecSQL;
  aForm.chkCategoria.Checked := true;
  aForm.Refresh;
  Sleep(500);

  DtmPrincipal.QryScriptProdutos.ExecSQL;
  aForm.chkProduto.Checked := true;
  aForm.Refresh;
  Sleep(500);

  DtmPrincipal.QryScriptClientes.ExecSQL;
  aForm.chkCliente.Checked := true;
  aForm.Refresh;
  Sleep(500);

  DtmPrincipal.QryScriptVendas.ExecSQL;
  aForm.chkVendas.Checked := true;
  aForm.Refresh;
  Sleep(500);
  DtmPrincipal.QryScriptItensVendas.ExecSQL;
  aForm.chkItensVenda.Checked := true;
  aForm.Refresh;
  Sleep(500);
end;

end.
