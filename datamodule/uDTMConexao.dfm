object dtmPrincipal: TdtmPrincipal
  Height = 750
  Width = 1000
  PixelsPerInch = 120
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
    Left = 336
    Top = 392
  end
end
