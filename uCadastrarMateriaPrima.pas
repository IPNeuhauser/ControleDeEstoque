unit uCadastrarMateriaPrima;

interface

uses
    {System uses}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
    {Project uses}
  uDados;

type
  TfrmCadMateriaPrima = class(TForm)
    pnPrincipal: TPanel;
    pnCabecalho: TPanel;
    imgLogo: TImage;
    lblTitulo: TLabel;
    pnFormulario: TPanel;
    pnFormInfo: TPanel;
    lblTituloInfoProd: TLabel;
    lblNome: TLabel;
    lblPreço: TLabel;
    lblUnidade: TLabel;
    edtNome: TDBEdit;
    edtPrecoCusto: TDBEdit;
    DBNavigator1: TDBNavigator;
    pnConsultaProd: TPanel;
    lblTituloEdtProd: TLabel;
    gridVendedores: TDBGrid;
    navEdtProd: TDBNavigator;
    cbUnidade: TDBComboBox;
    edtEstoqueAtual: TDBEdit;
    lblEstoque: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMateriaPrima: TfrmCadMateriaPrima;

implementation

{$R *.dfm}

end.
