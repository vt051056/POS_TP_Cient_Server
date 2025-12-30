unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TClientModule1 = class(TDataModule)
    DS_Doc_Type: TDataSource;
    CDS_Doc_Type: TClientDataSet;
    CDS_Doc_TypeID_DOC_TYPE: TAutoIncField;
    CDS_Doc_TypeNAMEDOC: TWideStringField;
    CDS_Doc_TypeNEXT_NO: TIntegerField;
    CDS_Doc_TypeID_SCH_D: TStringField;
    CDS_Doc_TypeCLI_D: TWideStringField;
    CDS_Doc_TypeID_SCH_K: TStringField;
    CDS_Doc_TypeCLI_K: TWideStringField;
    CDS_Doc_TypeID_CLI_D: TIntegerField;
    CDS_Doc_TypeID_CLI_K: TIntegerField;
    CDS_Doc_TypeID_CHAR_DOC: TIntegerField;
    CDS_Doc_TypeCHAR_DOC: TWideStringField;
    CDS_Doc_TypeNDS_PER: TFloatField;
    CDS_Doc_TypeID_PROV_CASE: TIntegerField;
    CDS_Doc_TypeID_GRTOV: TIntegerField;
    CDS_Doc_TypeGRUPTOV: TWideStringField;
    CDS_Doc_TypeID_KATEG_CLI: TIntegerField;
    CDS_Doc_TypeKATEGOR: TWideStringField;
    CDS_Doc_TypeID_KATEG_CLI_K: TIntegerField;
    CDS_Doc_TypeKATEGOR_K: TWideStringField;
    CDS_Doc_TypeSALES_CATEGOR: TIntegerField;
    CDS_Doc_TypeWITH_NDS: TIntegerField;
    CDS_Doc_TypeTIME_DEFAULT: TDateTimeField;
    CDS_Doc_TypeFORM_PRN: TIntegerField;
    CDS_Doc_TypeID_SUPPL: TIntegerField;
    CDS_Doc_TypeSUPPL: TWideStringField;
    CDS_Doc_TypeID_LINK_DOC: TIntegerField;
    CDS_Doc_TypeLINK_CHAR_DOC: TWideStringField;
    CDS_Doc_TypeID_LINK_CH_DOC: TIntegerField;
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    function GetServerMethods1Client: TServerMethods1Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TClientModule1.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
  begin
    SQLConnection1.Open;
    FServerMethods1Client:= TServerMethods1Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FServerMethods1Client;
end;

end.
