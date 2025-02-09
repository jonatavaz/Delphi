unit uDTMVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVendas = class(TDataModule)
    QryCliente: TZQuery;
    QryClienteclienteId: TZIntegerField;
    QryClientenome: TZUnicodeStringField;
    QryProdutos: TZQuery;
    QryProdutosprodutoId: TZIntegerField;
    QryProdutosnome: TZUnicodeStringField;
    QryProdutosvalor: TZFMTBCDField;
    QryProdutosquantidade: TZFMTBCDField;
    cdsItensVendas: TClientDataSet;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensVendasprodutoId: TIntegerField;
    cdsItensVendasNomeProduto: TStringField;
    cdsItensVendasquantidade: TFloatField;
    cdsItensVendasvalor: TFloatField;
    cdsItensVendasvalorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendas: TdtmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDTMConexao;

{$R *.dfm}

procedure TdtmVendas.DataModuleCreate(Sender: TObject);
begin
    cdsItensVendas.CreateDataSet;
    QryCliente.Open;
    QryProdutos.Open;
end;

procedure TdtmVendas.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVendas.Close;
  QryCliente.Close;
  QryProdutos.Close;
end;

end.
