unit cCadProduto;

interface

uses System.Classes,
      Vcl.Controls,
      Vcl.ExtCtrls,
      Vcl.Dialogs,
      ZAbstractConnection,
      ZConnection,
      ZAbstractRODataset,
      ZAbstractDataset,
      ZDataset,
      System.SysUtils;

type
  TProduto = class
  private
    ConexaoDB:TZConnection;
    F_produtoId: Integer;
    F_nome: String;
    F_descricao: string;
    F_valor: Double;
    F_quantidade: Double;
    F_categoriaId: Integer;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar: Boolean;
    function Selecionar(id:Integer):Boolean;
  published
    property codigo        :Integer     read F_produtoId       write F_produtoId;
    property nome          :string      read F_nome            write F_nome;
    property descricao     :string      read F_descricao       write F_descricao;
    property valor         :Double      read F_valor           write F_valor;
    property quantidade    :Double      read F_quantidade      write F_quantidade;
    property categoriaId   :Integer     read F_categoriaId     write F_categoriaId;
  end;

implementation

{$region 'Constructor and Destructor'}
constructor TProduto.Create(aConexao: TZConnection);
begin
  ConexaoDB:=aConexao;
end;
destructor TProduto.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TProduto.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg()
end;
{$endRegion}

end.
