unit uPrincipal;

interface

uses
    {System uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Data.DB, Vcl.DBGrids, Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.jpeg,
  Vcl.Mask, Vcl.DBCtrls,
    {Project uses}
  uDados, uCadastrarProduto, uCadastrarVendedor, uCadastrarMateriaPrima,
  uCadMovimentacoes;

type
  TfrmControleDeEstoque = class(TForm)
    pnPrincipal: TPanel;
    pnMostrarResultadoMenu: TPanel;
    MainMenu1: TMainMenu;
    menuMain: TMenuItem;
    menuCadastrar: TMenuItem;
    menuCadProdutos: TMenuItem;
    menuCadVendedores: TMenuItem;
    menuMovimentacoes: TMenuItem;
    menuCadMateriaPrima: TMenuItem;
    pnFiltros: TPanel;
    imgLogo: TImage;
    gridEstoqueAtual: TDBGrid;
    btnProdutos: TButton;
    btnMateriaPrima: TButton;
    procedure menuCadProdutosClick(Sender: TObject);
    procedure menuCadVendedoresClick(Sender: TObject);
    procedure menuCadMateriaPrimaClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnMateriaPrimaClick(Sender: TObject);
    procedure menuMovimentacoesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleDeEstoque: TfrmControleDeEstoque;

implementation

{$R *.dfm}


procedure TfrmControleDeEstoque.btnMateriaPrimaClick(Sender: TObject);
begin
  dmDados.tblMateriaPrima.Refresh;
  gridEstoqueAtual.DataSource := dmDados.dsMateriaPrima;
end;

procedure TfrmControleDeEstoque.btnProdutosClick(Sender: TObject);
begin
  dmDados.tblProdutos.Refresh;
  gridEstoqueAtual.DataSource := dmDados.dsProdutos;
end;

procedure TfrmControleDeEstoque.FormActivate(Sender: TObject);
begin
 if dmDados.fdcConexao.connected = false then
   dmDados.fdcConexao.Connected := true;

end;

procedure TfrmControleDeEstoque.menuCadMateriaPrimaClick(Sender: TObject);
begin
  frmCadMateriaPrima.ShowModal;
end;

procedure TfrmControleDeEstoque.menuCadProdutosClick(Sender: TObject);
begin
  frmCadProdutos.showModal;
end;

procedure TfrmControleDeEstoque.menuCadVendedoresClick(Sender: TObject);
begin
  frmCadVendedor.ShowModal;
end;

procedure TfrmControleDeEstoque.menuMovimentacoesClick(Sender: TObject);
begin
  frmCadMovimentacoes.ShowModal;
end;

end.
