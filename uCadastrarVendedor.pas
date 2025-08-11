unit uCadastrarVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, uDados,
  Vcl.Imaging.jpeg;

type
  TfrmCadVendedor = class(TForm)
    pnPrincipal: TPanel;
    pnCabecalho: TPanel;
    imgLogo: TImage;
    Label1: TLabel;
    pnFormulario: TPanel;
    pnFormInfo: TPanel;
    lblTituloInfoProd: TLabel;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    edtEmail: TDBEdit;
    DBNavigator1: TDBNavigator;
    pnConsultaProd: TPanel;
    lblTituloEdtProd: TLabel;
    gridVendedores: TDBGrid;
    navEdtProd: TDBNavigator;
    edtTelefone: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVendedor: TfrmCadVendedor;

implementation

{$R *.dfm}

end.
