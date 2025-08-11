program ControleDeEstoque;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmControleDeEstoque},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uBDConnection in 'uBDConnection.pas',
  uCadastrarProduto in 'uCadastrarProduto.pas' {frmCadProdutos},
  uCadastrarVendedor in 'uCadastrarVendedor.pas' {frmCadVendedor},
  uCadastrarMateriaPrima in 'uCadastrarMateriaPrima.pas' {frmCadMateriaPrima},
  uCadMovimentacoes in 'uCadMovimentacoes.pas' {frmCadMovimentacoes},
  uCadastrarProdutosMovimentacoes in 'uCadastrarProdutosMovimentacoes.pas' {frmCadProdutoMov};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmControleDeEstoque, frmControleDeEstoque);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.CreateForm(TfrmCadVendedor, frmCadVendedor);
  Application.CreateForm(TfrmCadMateriaPrima, frmCadMateriaPrima);
  Application.CreateForm(TfrmCadMovimentacoes, frmCadMovimentacoes);
  Application.CreateForm(TfrmCadProdutoMov, frmCadProdutoMov);
  Application.Run;
end.
