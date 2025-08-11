unit uCadMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
    {Uses do projeto}
  uDados, uCadastrarProdutosMovimentacoes;

type
  TfrmCadMovimentacoes = class(TForm)
    pnPrincipal: TPanel;
    pnCabecalho: TPanel;
    imgLogo: TImage;
    lblTitulo: TLabel;
    pnFormulario: TPanel;
    pnFormInfo: TPanel;
    lblTituloInfoMov: TLabel;
    lblTipo: TLabel;
    lblDataHora: TLabel;
    lblVendedor: TLabel;
    lblObservacao: TLabel;
    edtDataHora: TDBEdit;
    navCriarMovimentacao: TDBNavigator;
    pnConsultaMov: TPanel;
    lblTituloEdt: TLabel;
    navEdtMov: TDBNavigator;
    gridMovimentacoes: TDBGrid;
    cbTipoMovimentacao: TDBComboBox;
    memoObservacoes: TDBMemo;
    lookcbVendedores: TDBLookupComboBox;
    btnItens: TButton;
    procedure navCriarMovimentacaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnAddItensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMovimentacoes: TfrmCadMovimentacoes;

implementation

{$R *.dfm}

procedure TfrmCadMovimentacoes.btnAddItensClick(Sender: TObject);
begin
  frmCadProdutoMov.ShowModal;
end;

procedure TfrmCadMovimentacoes.navCriarMovimentacaoClick(Sender: TObject;
  Button: TNavigateBtn);
var
  LIdVendedor: Integer;
  LSql: string;
begin
  if button = nbInsert then
  begin
    dmDados.tblMovimentacoes.FieldByName('DataHora').Value := Now
  end;

  {
  if button = nbPost then
  begin
    LSql := 'SELECT idVendedor FROM Vendedores WHERE nome = ' + edtVendedor.Text;
    LIdVendedor := dmDados.tblVendedores.;
    dmDados.tblMovimentacoes.FieldByName('idVendedor').value := LIdVendedor;
  end;
  }
end;

end.
