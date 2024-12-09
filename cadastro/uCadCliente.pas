unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    edtNome: TLabeledEdit;
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
    QryListagemdataNascimento: TZDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

end.
