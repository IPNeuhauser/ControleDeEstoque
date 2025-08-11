unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, vcl.Dialogs;

type
  TdmDados = class(TDataModule)
    fdcConexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    tblProdutos: TFDTable;
    dsProdutos: TDataSource;
    tblComposicao: TFDTable;
    dsComposicao: TDataSource;
    tblMateriaPrima: TFDTable;
    dsMateriaPrima: TDataSource;
    dsMovProdutos: TDataSource;
    tblMovimentacoes: TFDTable;
    dsMovimentacoes: TDataSource;
    tblVendedores: TFDTable;
    dsVendedores: TDataSource;
    sqlAumentaEstoque: TFDCommand;
    sqlDiminuiEstoque: TFDCommand;
    dsSqlMovimentacoes: TDataSource;
    sqlMovimentacoes: TFDQuery;
    tblProdutosidProduto: TLargeintField;
    tblProdutosNome: TStringField;
    tblProdutosPreçoDeCusto: TBCDField;
    tblProdutosUnidade: TStringField;
    tblVendedoresidVendedor: TLargeintField;
    tblVendedoresNome: TStringField;
    tblVendedoresCPF: TStringField;
    tblVendedoresTelefone: TStringField;
    tblVendedoresEmail: TStringField;
    tblMateriaPrimaidMateriaPrima: TLargeintField;
    tblMateriaPrimaNome: TStringField;
    tblMateriaPrimaUnd: TStringField;
    tblProdutosQuantidadeEstoque: TLargeintField;
    tblMateriaPrimaPreçoDeCusto: TBCDField;
    tblMateriaPrimaQuantidadeEstoque: TLargeintField;
    tblMovimentacoesidMovimentacao: TLargeintField;
    tblMovimentacoesTipo: TStringField;
    tblMovimentacoesDataHora: TDateTimeField;
    tblMovimentacoesObservacoes: TMemoField;
    tblMovimentacoesidVendedor: TLargeintField;
    tblMovProdutos: TFDTable;
    tblMovProdutosidProduto: TLargeintField;
    tblMovProdutosidMovimentacoes: TLargeintField;
    tblMovProdutosQuantidade: TIntegerField;
    tblMovProdutosnomeProduto: TStringField;
    procedure fdcConexaoAfterConnect(Sender: TObject);
    procedure fdcConexaoBeforeDisconnect(Sender: TObject);
    procedure tblMovProdutosAfterDelete(DataSet: TDataSet);
    procedure tblMovProdutosAfterPost(DataSet: TDataSet);
    procedure CalcularTotais;
    procedure tblMovProdutosBeforeDelete(DataSet: TDataSet);
    procedure tblMovimentacoesBeforeDelete(DataSet: TDataSet);
  private
    FTotal: string;
    { Private declarations }
  public
    { Public declarations }
    Property Total: string Read FTotal Write FTotal;
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmDados }



procedure TdmDados.CalcularTotais;
var
  LTotais: Double;
begin
  tblMovProdutos.First;

  while not tblMovProdutos.Eof do
  begin
    LTotais := LTotais + tblMovProdutos.FieldByName('Quantidade').Value;
    tblMovProdutos.Next;
  end;

  Total := FloatToStr(LTotais);
end;

procedure TdmDados.fdcConexaoAfterConnect(Sender: TObject);
begin
  tblMovimentacoes.Active := True;
  tblProdutos.Active := True;
  tblVendedores.Active := True;
  tblMovProdutos.Active := True;
  tblMateriaPrima.Active := True;
end;

procedure TdmDados.fdcConexaoBeforeDisconnect(Sender: TObject);
begin
  tblMovimentacoes.Active := False;
  tblProdutos.Active := False;
  tblVendedores.Active := False;
  tblMovProdutos.Active := False;
  tblMateriaPrima.Active := False;
end;

procedure TdmDados.tblMovimentacoesBeforeDelete(DataSet: TDataSet);
begin
  if tblMovProdutos.RecordCount > 0 then
  begin
    ShowMessage('''
    Existem produtos cadastrados na movimentação!

    Exclua-os produtos primeiro.
    ''');
    Abort;
  end;
  
end;

procedure TdmDados.tblMovProdutosAfterDelete(DataSet: TDataSet);
begin
  CalcularTotais;
end;

procedure TdmDados.tblMovProdutosAfterPost(DataSet: TDataSet);
begin
  CalcularTotais;

  if (tblMovimentacoes.FieldByName('Tipo').Value = 'Entrada de Estoque') then
  begin                              
    sqlAumentaEstoque.ParamByName('pID').Value := tblMovProdutos.FieldByName('idProduto').Value;
    sqlAumentaEstoque.ParamByName('pQtd').value := tblMovProdutos.FieldByName('Quantidade').Value;
    sqlAumentaEstoque.Execute();
  end;

  if (tblMovimentacoes.FieldByName('Tipo').Value = 'Saída de Estoque') then
  begin
    sqlDiminuiEstoque.ParamByName('pID').Value := tblMovProdutos.FieldByName('idProduto').Value;
    sqlDiminuiEstoque.ParamByName('pQtd').value := tblMovProdutos.FieldByName('Quantidade').Value;
    sqlDiminuiEstoque.Execute();
  end;

  
end;

procedure TdmDados.tblMovProdutosBeforeDelete(DataSet: TDataSet);
begin

  if (tblMovimentacoes.FieldByName('Tipo').Value = 'Entrada de Estoque') then
  begin
   sqlDiminuiEstoque.ParamByName('pID').Value := tblMovProdutos.FieldByName('idProduto').Value;
   sqlDiminuiEstoque.ParamByName('pQtd').value := tblMovProdutos.FieldByName('Quantidade').Value;
   sqlDiminuiEstoque.Execute();                              
  end;

  if (tblMovimentacoes.FieldByName('Tipo').Value = 'Saída de Estoque') then
  begin
    sqlAumentaEstoque.ParamByName('pID').Value := tblMovProdutos.FieldByName('idProduto').Value;
    sqlAumentaEstoque.ParamByName('pQtd').value := tblMovProdutos.FieldByName('Quantidade').Value;
    sqlAumentaEstoque.Execute();
  end;
end;

end.
