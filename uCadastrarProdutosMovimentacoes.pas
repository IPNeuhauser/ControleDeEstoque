unit uCadastrarProdutosMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,

  udados;

type
  TfrmCadProdutoMov = class(TForm)
    pnPrincipal: TPanel;
    pnCabecalho: TPanel;
    imgLogo: TImage;
    lblTitulo: TLabel;
    pnFormulario: TPanel;
    pnFormInfo: TPanel;
    lblTituloProdMov: TLabel;
    lblNome: TLabel;
    lblQuantidade: TLabel;
    navCriarMovimentacao: TDBNavigator;
    lookcbProdutos: TDBLookupComboBox;
    pnConsultaProd: TPanel;
    lblTituloEdtProdMov: TLabel;
    navEdtProd: TDBNavigator;
    gridProdMov: TDBGrid;
    lblTotalItens: TLabel;
    edtQuantidade: TDBEdit;
    procedure navCriarMovimentacaoClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoMov: TfrmCadProdutoMov;

implementation

{$R *.dfm}

procedure TfrmCadProdutoMov.navCriarMovimentacaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  lblTotalItens.Caption := 'Total de itens: ' + dmDados.Total;
end;

end.
