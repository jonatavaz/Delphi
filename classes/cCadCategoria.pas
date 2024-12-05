unit cCadCategoria;

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
    TCategoria = class
    private
       ConexaoDB:TZConnection;
       F_categoriaId:Integer;
       F_descricao:String;
    function getCodigo: Integer;
    function getDescricao: String;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: String);
    public
      constructor Create(aConexao:TZConnection);
      destructor Destroy; override;
      function Inserir:Boolean;
      function Atualizar:Boolean;
      function Apagar:Boolean;
      function Selecionar(id:Integer):Boolean;
    published
      property codigo:Integer read getCodigo write setCodigo;
      property descricao:String read getDescricao write setDescricao;
    end;

implementation
{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TCategoria.Create(aConexao:TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TCategoria.Apagar: Boolean;
begin
    ShowMessage('Apagado');
    Result:=true;
end;

function TCategoria.Atualizar: Boolean;
begin
    ShowMessage('Atualizado');
    Result:=true;
end;

function TCategoria.Inserir: Boolean;
var QryGravar:TZQuery;
begin
  try
    QryGravar:=TZQuery.Create(nil);
    QryGravar.Connection:=ConexaoDB;
  finally
    if Assigned(QryGravar) then
       FreeAndNil(QryGravar);
       QryGravar.SQL.Clear;
       QryGravar.SQL.Add('');
  end;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
begin
    Result:=true;
end;

{$endRegion}

{$region 'Gets'}
function TCategoria.getCodigo: Integer;
begin
     Result:= Self.F_categoriaId;
end;

function TCategoria.getDescricao: String;
begin
   Result:= Self.F_descricao;
end;
{$endRegion}

{$region 'Sets'}
procedure TCategoria.setCodigo(const Value: Integer);
begin
   Self.F_categoriaId:= Value;
end;

procedure TCategoria.setDescricao(const Value: String);
begin
    Self.F_descricao:= Value;
end;
{$endRegion}
end
