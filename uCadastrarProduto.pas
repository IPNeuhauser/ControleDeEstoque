unit uCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, uDados;

type
  TfrmCadProdutos = class(TForm)
    pnCabecalho: TPanel;
    pnFormulario: TPanel;
    pnPrincipal: TPanel;
    imgLogo: TImage;
    Label1: TLabel;
    pnFormInfo: TPanel;
    pnConsultaProd: TPanel;
    navEscolherProduto: TDBNavigator;
    lblTituloEdtProd: TLabel;
    edtNome: TDBEdit;
    edtPrecoCusto: TDBEdit;
    lblTituloInfoProd: TLabel;
    edtQntdEstoque: TDBEdit;
    lblNome: TLabel;
    lblPrecoCusto: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbUnidade: TDBComboBox;
    navCriarProduto: TDBNavigator;
    gridVendedores: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

end.
