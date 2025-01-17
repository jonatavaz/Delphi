object dtmPrincipal: TdtmPrincipal
  Height = 446
  Width = 800
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    SQLHourGlass = True
    DisableSavepoints = False
    HostName = ''
    Port = 0
    Database = 
      'Provider=SQLOLEDB.1;Password=root;Persist Security Info=True;Use' +
      'r ID=sa;Initial Catalog=Vendas;Data Source=NTBSTUDY\TRABALHODELP' +
      'HI'
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 13
    Top = 19
  end
  object QryScriptCategorias: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'categorias'#39') IS NULL '
      'BEGIN'
      #9'CREATE TABLE categorias('
      #9'   categoriaId int IDENTITY(1,1) NOT NULL,'
      #9'   descricao  varchar(30) NULL,'
      #9'   PRIMARY KEY (categoriaId)'
      ')'
      'END')
    Params = <>
    Left = 115
    Top = 19
  end
  object QryScriptClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_id ('#39'clientes'#39') IS NULL'
      'BEGIN'
      '  CREATE TABLE clientes('
      '    clienteId int IDENTITY(1, 1) NOT NULL,'
      '    nome varchar(60) NULL,'
      '    endereco varchar(60) NULL,'
      '    cidade varchar(50) NULL,'
      '    bairro varchar(40) NULL,'
      '    estado varchar(2) NULL,'
      '    cep varchar(10) NULL,'
      '    telefone varchar(14) NULL,'
      '    email varchar(100) NULL,'
      '    dataNascimento datetime NULL,'
      '    PRIMARY KEY (clienteId)'
      ')'
      'END')
    Params = <>
    Left = 218
    Top = 19
  end
  object QryScriptProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'produtos'#39') IS NULL '
      'BEGIN'
      #9'CREATE TABLE produtos('
      #9#9'produtoId int IDENTITY(1,1) NOT NULL,'
      #9#9'nome varchar(60) NULL,'
      #9#9'descricao varchar(255) null,'
      #9#9'valor decimal(18,5) default 0.00000 null,'
      #9#9'quantidade decimal(18,5) default 0.00000 null,'
      #9#9'categoriaId int null,'
      #9#9'PRIMARY KEY (produtoId),'
      #9#9'CONSTRAINT FK_ProdutosCategorias '
      #9#9'FOREIGN KEY (categoriaId) references categorias(categoriaId)'
      #9')'
      'END')
    Params = <>
    Left = 326
    Top = 19
  end
  object QryScriptVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'vendas'#39') IS NULL '
      'BEGIN'
      #9'Create table vendas ('
      #9'  vendaId int identity(1,1) not null,'
      #9'  clienteId int not null,'
      #9'  dataVenda datetime default getdate(),'
      #9'  totalVenda decimal(18,5) default 0.00000,'
      ''
      ''
      #9'  PRIMARY KEY (vendaId),'
      #9'  CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId)'
      #9#9'REFERENCES clientes(clienteId)'
      #9')'
      'END;')
    Params = <>
    Left = 429
    Top = 19
  end
  object QryScriptItensVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'vendasItens'#39') IS NULL '
      'BEGIN'
      #9'Create table vendasItens ('
      #9'  vendaId int not null,'
      #9'  produtoId int not null,'
      #9'  valorUnitario decimal (18,5) default 0.00000,'
      #9'  quantidade decimal (18,5) default 0.00000,'
      #9'  totalProduto decimal (18,5) default 0.00000,'
      #9'  PRIMARY KEY (vendaId,produtoId),'
      #9'  CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)'
      #9#9'REFERENCES produtos(produtoId)'
      #9')'
      'END')
    Params = <>
    Left = 538
    Top = 19
  end
end
