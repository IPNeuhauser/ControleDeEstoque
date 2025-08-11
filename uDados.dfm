object dmDados: TdmDados
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object fdcConexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'User_Name=root'
      'Password=1234'
      'Server=LocalHost'
      'DriverID=MySQL')
    LoginPrompt = False
    AfterConnect = fdcConexaoAfterConnect
    BeforeDisconnect = fdcConexaoBeforeDisconnect
    Left = 80
    Top = 144
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\ipneu\OneDrive\Documents\Embarcadero\Studio\Projects\Co' +
      'ntroleDeEstoque\Win32\Debug\lib\LIBMYSQL.DLL'
    Left = 80
    Top = 224
  end
  object tblProdutos: TFDTable
    IndexFieldNames = 'idProduto'
    Connection = fdcConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.produtos'
    Left = 240
    Top = 144
    object tblProdutosidProduto: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'idProduto'
      Origin = 'idProduto'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblProdutosNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 255
    end
    object tblProdutosPreçoDeCusto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Pre'#231'oDeCusto'
      Origin = '`Pre'#231'oDeCusto`'
      DisplayFormat = 'R$ .00'
      Precision = 10
      Size = 2
    end
    object tblProdutosUnidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Unidade'
      Origin = 'Unidade'
      Size = 50
    end
    object tblProdutosQuantidadeEstoque: TLargeintField
      FieldName = 'QuantidadeEstoque'
    end
  end
  object dsProdutos: TDataSource
    DataSet = tblProdutos
    Left = 240
    Top = 224
  end
  object tblComposicao: TFDTable
    Connection = fdcConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'composicao'
    Left = 347
    Top = 144
  end
  object dsComposicao: TDataSource
    DataSet = tblComposicao
    Left = 347
    Top = 224
  end
  object tblMateriaPrima: TFDTable
    IndexFieldNames = 'idMateriaPrima'
    Connection = fdcConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'materiaprima'
    Left = 469
    Top = 144
    object tblMateriaPrimaidMateriaPrima: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'idMateriaPrima'
      Origin = 'idMateriaPrima'
      ProviderFlags = [pfInWhere]
    end
    object tblMateriaPrimaNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 255
    end
    object tblMateriaPrimaUnd: TStringField
      FieldName = 'Und'
      Origin = 'Und'
      Required = True
      Size = 255
    end
    object tblMateriaPrimaPreçoDeCusto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Pre'#231'oDeCusto'
      Origin = '`Pre'#231'oDeCusto`'
      DisplayFormat = 'R$ .00'
      Precision = 10
      Size = 2
    end
    object tblMateriaPrimaQuantidadeEstoque: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QuantidadeEstoque'
      Origin = 'QuantidadeEstoque'
    end
  end
  object dsMateriaPrima: TDataSource
    DataSet = tblMateriaPrima
    Left = 466
    Top = 224
  end
  object dsMovProdutos: TDataSource
    DataSet = tblMovProdutos
    Left = 595
    Top = 224
  end
  object tblMovimentacoes: TFDTable
    BeforeDelete = tblMovimentacoesBeforeDelete
    IndexFieldNames = 'idMovimentacao'
    Connection = fdcConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'movimentacoes'
    Left = 726
    Top = 144
    object tblMovimentacoesidMovimentacao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idMovimentacao'
      Origin = 'idMovimentacao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblMovimentacoesTipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Tipo'
      Origin = 'Tipo'
    end
    object tblMovimentacoesDataHora: TDateTimeField
      FieldName = 'DataHora'
      Origin = 'DataHora'
      Required = True
    end
    object tblMovimentacoesObservacoes: TMemoField
      FieldName = 'Observacoes'
      Origin = 'Observacoes'
      Required = True
      BlobType = ftMemo
    end
    object tblMovimentacoesidVendedor: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idVendedor'
      Origin = 'idVendedor'
    end
  end
  object dsMovimentacoes: TDataSource
    DataSet = tblMovimentacoes
    Left = 723
    Top = 224
  end
  object tblVendedores: TFDTable
    IndexFieldNames = 'idVendedor'
    Connection = fdcConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.vendedores'
    Left = 862
    Top = 144
    object tblVendedoresidVendedor: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'idVendedor'
      Origin = 'idVendedor'
      ProviderFlags = [pfInWhere]
    end
    object tblVendedoresNome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object tblVendedoresCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '000.000.000-00;1;_'
      Size = 14
    end
    object tblVendedoresTelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Telefone'
      Origin = 'Telefone'
      EditMask = '(00)00000-0000'
      Size = 19
    end
    object tblVendedoresEmail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Email'
      Origin = 'Email'
      Size = 50
    end
  end
  object dsVendedores: TDataSource
    DataSet = tblVendedores
    Left = 859
    Top = 224
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = fdcConexao
    CommandText.Strings = (
      
        'UPDATE produtos SET QuantidadeEstoque = QuantidadeEstoque + :pQt' +
        'd WHERE idProduto = :pID')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pID'
        ParamType = ptInput
      end>
    Left = 72
    Top = 384
  end
  object sqlDiminuiEstoque: TFDCommand
    Connection = fdcConexao
    CommandText.Strings = (
      
        'UPDATE produtos SET QuantidadeEstoque = QuantidadeEstoque - :pQt' +
        'd WHERE idProduto = :pID'
      '')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pID'
        ParamType = ptInput
      end>
    Left = 72
    Top = 464
  end
  object dsSqlMovimentacoes: TDataSource
    Left = 272
    Top = 464
  end
  object sqlMovimentacoes: TFDQuery
    Connection = fdcConexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes')
    Left = 272
    Top = 384
  end
  object tblMovProdutos: TFDTable
    AfterPost = tblMovProdutosAfterPost
    BeforeDelete = tblMovProdutosBeforeDelete
    AfterDelete = tblMovProdutosAfterDelete
    IndexFieldNames = 'idMovimentacoes'
    MasterSource = dsMovimentacoes
    MasterFields = 'idMovimentacao'
    Connection = fdcConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.movimentacoes_produtos'
    Left = 592
    Top = 144
    object tblMovProdutosidProduto: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idProduto'
      Origin = 'idProduto'
    end
    object tblMovProdutosidMovimentacoes: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idMovimentacoes'
      Origin = 'idMovimentacoes'
    end
    object tblMovProdutosQuantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object tblMovProdutosnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tblProdutos
      LookupKeyFields = 'idProduto'
      LookupResultField = 'Nome'
      KeyFields = 'idProduto'
      Size = 50
      Lookup = True
    end
  end
end
