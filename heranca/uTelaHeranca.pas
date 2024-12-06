unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDtmConexao, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPequisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    Label1: TLabel;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }


    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar:TBitBtn; bntNavigator:TDBNavigator; pgcPrincipal: TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
  public
    { Public declarations }
    IndiceAtual:string;
    EstadoDoCadastro:TEstadoDoCadastro;
    function Apagar:Boolean; virtual;
    function Gravar(EstadoDoCadastro:TEstadodoCadastro):Boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}
{$region 'OBSERVAÇÕES'}
//TAG: 1 - Chave Primária - PK
//TAG: 2 - Campos Obrigatórios
{$endregion}

{$region 'FUNÇÕES E PROCEDURES'}
//Screen Control procedure
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar:TBitBtn; bntNavigator:TDBNavigator; pgcPrincipal: TPageControl; Flag:Boolean);
begin
  btnNovo.Enabled :=Flag;
  btnApagar.Enabled :=Flag;
  btnAlterar.Enabled :=Flag;
  btnNavigator.Enabled :=Flag;
  pgcPrincipal.Pages[0].TabVisible :=Flag;
  btnCancelar.Enabled :=not(Flag);
  btnGravar.Enabled :=not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
begin
    if (pgcPrincipal.Pages[Indice].TabVisible) then
        pgcPrincipal.TabIndex:=0;

end;

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:String):String;
var i: Integer;
begin
  for I := 0 to QryListagem.Fields.Count-1 do begin
    if lowercase(QryListagem.Fields[i].FieldName)=lowercase(Campo) then begin
      Result:= QryListagem.Fields[i].DisplayLabel;
      Break;
    end;
  end;
end;



procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
    aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i:Integer;
begin
  Result:=false;
  for i := 0 to ComponentCount - 1 do begin
     if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag = 2) and (TLabeledEdit(Components[i]).Text=EmptyStr) then begin
         MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatório', mtInformation, [mbOK], 0);
         TLabeledEdit(Components[i]).SetFocus;
         Result:=true;
         Break;
       end;

     end;

  end;

end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var i:Integer;
begin
  for i := 0 to ComponentCount - 1 do begin
     if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag = 1) then begin
        TLabeledEdit(Components[i]).Enabled:=false;
        Break;
       end;
     end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
var i:Integer;
begin
  for i := 0 to ComponentCount - 1 do begin
     if (Components[i] is TLabeledEdit) then
        TLabeledEdit(Components[i]).Text:=EmptyStr
     else if (Components[i] is TEdit) then
        TEdit(Components[i]).Text:=' ';
  end;
end;
{$endregion}

{$region 'MÉTODOS VIRTUAIS'}
function TfrmTelaHeranca.Apagar: Boolean;
begin
    ShowMessage('DELETADO');
    Result := True;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro:TEstadodoCadastro):Boolean;
begin
    if(EstadoDoCadastro=ecInserir) then
      showmessage('Inserir')
    else if(EstadoDoCadastro=ecAlterar) then
      showMessage('Alterado');
    Result := True;
end;
{$endregion}

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal,false);
  EstadoDoCadastro:= ecInserir;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro:= ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  Try
  if (Apagar) then begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, true);
    ControlarIndiceTab(pgcPrincipal, 0);
    LimparEdits;
    QryListagem.Refresh;
  end
  else
  begin
       MessageDlg('Erro na Exclusão', mtError, [mbok], 0);
  end;
  Finally
    EstadoDoCadastro:= ecNenhum;
  End;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, true);
    ControlarIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro:= ecNenhum;
    LimparEdits;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  if ExisteCampoObrigatorio then
    abort;

  Try
    if Gravar(EstadoDoCadastro) then begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal,true);
      ControlarIndiceTab(pgcPrincipal, 0);
      EstadoDoCadastro:= ecNenhum;
      LimparEdits;
      QryListagem.Refresh;
    end
    else
    begin
      MessageDlg('Erro na Gravação', mtError, [mbok], 0);
    end;
  finally

  End;

end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
    Close;
end;



procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
     QryListagem.Connection:=dtmPrincipal.ConexaoDB;
     dtsListagem.DataSet:=QryListagem;
     grdListagem.DataSource:=dtsListagem;
     grdListagem.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
    if(QryListagem.SQL.Text<>EmptyStr) then begin
      QryListagem.IndexFieldNames:=IndiceAtual;
      ExibirLabelIndice(IndiceAtual, lblIndice);
      QryListagem.Open;
    end;
    ControlarIndiceTab(pgcPrincipal, 0);
    DesabilitarEditPK;
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal,true);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
     btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual:= Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
   QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

end.
