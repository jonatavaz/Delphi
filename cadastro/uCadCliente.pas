unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, cCadCliente, uEnum;

type
  TfrmCadCliente = class(TfrmTelaHeranca)

    edtCategoriaId: TLabeledEdit;
    edtCEP: TMaskEdit;
    Label2: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    Label3: TLabel;
    edtEmail: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    Label4: TLabel;
    QryListagemclienteId: TZIntegerField;
    QryListagemnome: TZUnicodeStringField;
    QryListagemendereco: TZUnicodeStringField;
    QryListagemcidade: TZUnicodeStringField;
    QryListagembairro: TZUnicodeStringField;
    QryListagemestado: TZUnicodeStringField;
    QryListagemcep: TZUnicodeStringField;
    QryListagemtelefone: TZUnicodeStringField;
    QryListagememail: TZUnicodeStringField;
    QryListagemdatanascimento: TZDateTimeField;
    edtNome: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uDTMConexao;

{$region 'Override'}
function TfrmCadCliente.Apagar: Boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin
     Result:=oCliente.Apagar;
  end;
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
    if edtCategoriaId.Text<>EmptyStr then
       oCliente.codigo:=StrToInt(edtCategoriaId.Text)
    else
      oCliente.codigo:=0;

    oCliente.nome :=edtNome.Text;
    oCliente.cep :=edtCEP.Text;
    oCliente.endereco :=edtNome.Text;
    oCliente.bairro :=edtBairro.Text;
    oCliente.cidade :=edtCidade.Text;
    oCliente.telefone :=edtTelefone.Text;
    oCliente.email :=edtEmail.Text;
    oCliente.dataNascimento :=edtDataNascimento.Date;

    if (EstadoDoCadastro=ecInserir) then
       Result:=oCliente.Inserir
    else if (EstadoDoCadastro=ecAlterar) then
       Result:=oCliente.Atualizar;


end;
{#endregion}

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin
     edtCategoriaId.Text:=IntToStr(oCliente.codigo);
     edtNome.Text:=oCliente.nome;
     edtCEP.Text:=oCliente.cep;
     edtEndereco.Text:=oCliente.endereco;
     edtBairro.Text:=oCliente.bairro;
     edtCidade.Text:=oCliente.cidade;
     edtTelefone.Text:=oCliente.telefone;
     edtEmail.Text:=oCliente.email;
     edtDataNascimento.Date:=oCliente.dataNascimento;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';
end;

end.
