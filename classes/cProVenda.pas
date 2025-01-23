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
     System.SysUtils;


type
  TVenda = class
  Private
    ConexaoDB:TZConnection;
    F_vendaId:Integer;
    F_clienteId:Integer;
    F_dataVenda:TDateTime;
    F_totalVenda: Double;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
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

function TVenda.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
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
    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TVenda.Inserir: Boolean;
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

      idVendaGerado:=Qry.FieldByName('ID').AsInteger;

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

function TVenda.Selecionar(id: Integer): Boolean;
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
