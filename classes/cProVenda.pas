unit cProVenda;

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
     Data.DB, Datasnap.DBClient,
     System.SysUtils;


type
  TVenda = class
  Private
    ConexaoDB:TZConnection;
    F_vendaId:Integer;
    F_clienteId:Integer;
    F_dataVenda:TDateTime;
    F_totalVenda: Double;
    function InserirItens(cds: TClientDataSet; IdVenda: Integer): Boolean;
    function ApagarItens(cds: TClientDataSet): Boolean;
    function InNot(cds: TClientDataSet): String;
    function EsteItemExiste(vendaId, produtoId: Integer): Boolean;
    function AtualizarItem(cds: TClientDataSet): Boolean;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir(cds:TClientDataSet):Boolean;
    function Atualizar(cds:TClientDataSet):Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer; var cds:TClientDataSet):Boolean;
  published
    property VendaId:Integer      read F_vendaId      write f_vendaId;
    property ClienteId:Integer    read F_clienteId    write f_clienteId;
    property DataVenda:TDateTime  read F_dataVenda    write f_dataVenda;
    property TotalVenda:Double    read F_totalVenda   write f_totalVenda;
  end;

implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TVenda.Create(aConexao: TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TVenda.Destroy;
begin

  inherited
end;

{$endRegion}

{$region 'CRUD'}
function TVenda.Apagar: Boolean;
var Qry:TZQuery;
begin
    if MessageDlg('Apagar o registro: '+#13+#13+ 'Venda Nro: ' + IntToStr(VendaId), mtConfirmation, [mbYes, mbNo], 0)=mrNo then begin
       Result:=false;
       abort;
    end;

    try
      Result:=true;
      ConexaoDB.StartTransaction;
      Qry:=TZQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      //Apaga os itens Primeiro
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM vendasItens '+
                  ' WHERE vendaId=:vendaId ');
      Qry.ParamByName('vendaId').AsInteger :=VendaId;
      Try
        Qry.ExecSQL;
        Qry.SQL.Clear;
        Qry.Sql.Add('DELETE FROM vendas '+
                    ' WHERE vendaId=:vendaId ');
        Qry.ParamByName('vendaId').AsInteger :=VendaId;
        Qry.ExecSQL;
        ConexaoDB.Commit;
      Except
        ConexaoDB.Rollback;
        Result:=false;
      End;

      finally
       if Assigned(Qry) then
          FreeAndNil(Qry);
      end;
  end;

function TVenda.Atualizar(cds:TClientDataSet): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    ConexaoDB.StartTransaction;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE vendas '+
                '   SET clienteId=:clienteId '+
                '         ,dataVenda=:dataVenda '+
                '         ,totalVenda:=totalVenda '+
                '   WHERE vendaId=:vendaId ');
    Qry.ParamByName('vendaId').AsInteger  :=Self.F_vendaId;
    Qry.ParamByName('clienteId').AsInteger  :=Self.F_clienteId;
    Qry.ParamByName('dataVenda').AsDateTime  :=Self.F_dataVenda;
    Qry.ParamByName('totalVenda').AsFloat  :=Self.F_totalVenda;

    Try
      Qry.ExecSQL;
      ApagarItens(cds);

      cds.First;
      while not cds.Eof do begin
        if EsteItemExiste(Self.F_vendaId, cds.FieldByName('produtoId').AsInteger) then begin

           AtualizarItem(cds);
        end
        else begin
           InserirItens(cds, Self.F_vendaId);
        end;
        cds.Next;
      end;
    Except
      Result:=false;
      ConexaoDB.Rollback;
    End;
     ConexaoDB.Commit;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TVenda.AtualizarItem(cds:TClientDataSet):Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE VendasItens  '+
                '   SET ValorUnitario=:ValorUnitario '+
                '      ,Quantidade=:Quantidade '+
                '      ,TotalProduto=:TotalProduto '+
                ' WHERE vendaId =:vendaId AND produtoId=:produtoId');
    Qry.ParamByName('vendaId').AsInteger   :=Self.F_vendaId;
    Qry.ParamByName('produtoId').AsInteger   :=cds.FieldByName('produtoId').AsInteger;
    Qry.ParamByName('ValorUnitario').AsFloat   :=cds.FieldByName('valorUnitario').AsFloat;
    Qry.ParamByName('Quantidade').AsFloat   :=cds.FieldByName('quantidade').AsFloat;
    Qry.ParamByName('TotalProduto').AsFloat   :=cds.FieldByName('valorTotalProduto').AsFloat;

  Try
    Qry.ExecSQL;
  Except
    Result:=false;
  End;

  finally
     if Assigned(Qry) then
        FreeAndNil(Qry);
  end;
end;

function TVenda.EsteItemExiste(vendaId: Integer; produtoId:Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT Count(VendaId) AS Qtde '+
                '    FROM VendasItens  '+
                ' WHERE vendaId=:vendaId and produtoId=:produtoId ');

    Qry.ParamByName('vendaId').AsInteger  :=vendaId;
    Qry.ParamByName('produtoId').AsInteger :=produtoId;

    Try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         Result:=true
      else
          Result:=False;

    Except
        Result:=false;
    End;
  finally
      if Assigned(Qry) then
         FreeAndNil(Qry);
  end;
end;

function TVenda.ApagarItens(cds:TClientDataSet):Boolean;
var Qry:TZQuery;
begin
    try
      Result:=true;
      Qry:=TZQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE '+
                  '   FROM VendasItens '+
                  ' WHERE VendaId=:VendaId '+
                  '    AND produtoId NOT IN ('+ InNot(cds)+') ');

    Qry.ParamByName('vendaId').AsInteger  :=Self.F_vendaId;

    Try
      Qry.ExecSQL;
    Except
      Result:=false;
    End;
    finally
        if Assigned(Qry) then
           FreeAndNil(Qry);
    end;
end;

function TVenda.InNot(cds:TClientDataSet):String;
var sInNot:String;
begin
  sInNot:=EmptyStr;
  cds.First;
  while not cds.Eof do begin
    if sInNot=EmptyStr then
       sInNot := cds.FieldByName('produtoId').AsString
    else
       sInNot :=sInNot + ',' + cds.FieldByName('produtoId').AsString;

    cds.Next;
  end;
  Result:=sInNot;
end;

function TVenda.Inserir(cds:TClientDataSet): Boolean;
var Qry:TZQuery;
    IdVendaGerado:Integer;
begin
    try
      Result:=true;
      ConexaoDB.StartTransaction;
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO vendas  (clienteId, dataVenda, totalVenda) '+
                  '            VALUES  (:clienteId, :dataVenda, :totalVenda )');
      Qry.ParamByName('clienteId').AsInteger  :=Self.F_clienteId;
      Qry.ParamByName('dataVenda').AsDateTime  :=Self.F_dataVenda;
      Qry.ParamByName('totalVenda').AsFloat  :=Self.F_totalVenda;

    Try
      Qry.ExecSQL;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      Qry.Open;

      IdVendaGerado:=Qry.FieldByName('ID').AsInteger;

      {$region 'Gravar na tabela VendasItens'}
       cds.First;
       while not cds.Eof do begin
            InserirItens(cds, IdVendaGerado);
            cds.Next;
       end;
      {$endRegion}

      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TVenda.InserirItens(cds:TClientDataSet; IdVenda:Integer):Boolean;
var Qry:TZQuery;
begin
    try
      Result:=true;
      Qry:=TZQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Add('INSERT INTO VendasItens (VendaID, ProdutoID, ValorUnitario, Quantidade, TotalProduto)'+
                  '                  VALUES(:VendaId, :ProdutoID,:ValorUnitario,:Quantidade,:TotalProduto)');

      Qry.ParamByName('VendaID').AsInteger :=IdVenda;
      Qry.ParamByName('ProdutoID').AsInteger :=cds.FieldByName('produtoId').AsInteger;
      Qry.ParamByName('VendaID').AsFloat :=cds.FieldByName('valorUnitario').AsFloat;
      Qry.ParamByName('VendaID').AsFloat :=cds.FieldByName('quantidade').AsFloat;
      Qry.ParamByName('VendaID').AsFloat :=cds.FieldByName('valorTotalProduto').AsFloat;

      try
        Qry.ExecSQL;

      Except
        Result:=false;
      End;

    finally
      if Assigned(Qry) then
        FreeAndNil(Qry);
    end;
end;

function TVenda.Selecionar(id: Integer; var cds:TClientDataSet): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT vandaId '+
                '      ,clienteId '+
                '      ,dataVenda '+
                '      ,totalVenda '+
                'FROM  vendas'+
                'WHERE  vendaId=:vendaId');
    Qry.ParamByName('vendaId').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_vendaId :=Qry.FieldByName('vendaId').AsInteger;
      Self.F_clienteId :=Qry.FieldByName('clienteId').AsInteger;
      Self.F_dataVenda :=Qry.FieldByName('dataVenda').AsDateTime;
      Self.F_totalVenda :=Qry.FieldByName('totalVenda').AsFloat;

    {$region 'SELECIONAR na tabela VendasItens'}
     cds.First;
     while not cds.Eof do begin
        cds.Delete;
     end;

     Qry.Close;
     Qry.SQL.Clear;
     Qry.SQL.Add('SELECT VendasItens.ProdutoID, '+
                 '       Produtos.Nome,         '+
                 '       VendasItens.ValorUnitario, '+
                 '       VendasItens.Quantidade, '+
                 '       VendasItens.TotalProduto '+
                 ' FROM VendasItens  '+
                 '      INNER JOIN produtos ON Produtos.produtoId = VendasItens.produtoId '+
                 ' WHERE VendasItens.VendaID=:VendaID');

     Qry.ParamByName('VendaID').AsInteger :=Self.F_vendaId;
     Qry.Open;

     Qry.First;
     while not Qry.Eof do begin
        cds.Append;
        cds.FieldByName('produtoId').AsInteger         :=Qry.FieldByName('produtoID').AsInteger;
        cds.FieldByName('nomeProduto').AsString       :=Qry.FieldByName('Nome').AsString;
        cds.FieldByName('valorUnitario').AsFloat       :=Qry.FieldByName('ValorUnitario').AsFloat;
        cds.FieldByName('quantidade').AsFloat          :=Qry.FieldByName('Quantidade').AsFloat;
        cds.FieldByName('valorTotalProduto').AsFloat   :=Qry.FieldByName('TotalProduto').AsFloat;
        cds.Post;
        Qry.Next;
     end;
     cds.First;
    {$endRegion}

    Except
      Result:=false;
    End;

  finally
      if Assigned(Qry) then
         FreeAndNil(Qry);
  end;
end;
{$endregion}
end.
