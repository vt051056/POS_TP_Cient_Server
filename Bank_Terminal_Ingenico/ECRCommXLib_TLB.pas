unit ECRCommXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 18.10.2024 19:06:56 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\windows\SysWow64\ECRCommX.dll (1)
// LIBID: {484D5C85-D505-4BAF-A71D-7B7BD6D28B09}
// LCID: 0
// Helpfile: 
// HelpString: ECRCommX 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Error creating palette bitmap of (TBPOS1Lib) : Server C:\windows\SysWow64\ECRCommX.dll contains no icons
//   Error creating palette bitmap of (TBPOS0Lib) : Server C:\windows\SysWow64\ECRCommX.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ECRCommXLibMajorVersion = 1;
  ECRCommXLibMinorVersion = 0;

  LIBID_ECRCommXLib: TGUID = '{484D5C85-D505-4BAF-A71D-7B7BD6D28B09}';

  IID_IBPOS1Lib: TGUID = '{D7286B6D-C803-46B8-8A34-655BC2ED9C81}';
  CLASS_BPOS1Lib: TGUID = '{98333CF4-45FE-4996-B576-793BD1C08EA7}';
  IID_IBPOS0Lib: TGUID = '{8AEB6C5C-6FE9-48A5-8966-ACD1ED03FE18}';
  CLASS_BPOS0Lib: TGUID = '{7A6A9BFA-C73D-4575-8755-645DA60D77BF}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IBPOS1Lib = interface;
  IBPOS1LibDisp = dispinterface;
  IBPOS0Lib = interface;
  IBPOS0LibDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BPOS1Lib = IBPOS1Lib;
  BPOS0Lib = IBPOS0Lib;


// *********************************************************************//
// Interface: IBPOS1Lib
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D7286B6D-C803-46B8-8A34-655BC2ED9C81}
// *********************************************************************//
  IBPOS1Lib = interface(IDispatch)
    ['{D7286B6D-C803-46B8-8A34-655BC2ED9C81}']
    procedure CommOpen(bPort: Byte; lBaudRate: Integer); safecall;
    procedure CommOpenTCP(const bsIP: WideString; const bsPort: WideString); safecall;
    procedure CommOpenAuto(lBaudRate: Integer); safecall;
    procedure CommClose; safecall;
    procedure Purchase(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte); safecall;
    procedure Refund(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte; 
                     const bsRRN: WideString); safecall;
    procedure Void(ulInvoiceNum: LongWord; bMerchIdx: Byte); safecall;
    procedure Settlement(bMerchIdx: Byte); safecall;
    procedure PrintBatchTotals(bMerchIdx: Byte); safecall;
    procedure Confirm; safecall;
    procedure Cancel; safecall;
    function Get_LastResult: Byte; safecall;
    function Get_LastErrorCode: Byte; safecall;
    function Get_LastErrorDescription: WideString; safecall;
    function Get_LastStatMsgCode: Byte; safecall;
    function Get_LastStatMsgDescription: WideString; safecall;
    function Get_ResponseCode: LongWord; safecall;
    function Get_PAN: WideString; safecall;
    function Get_DateTime: WideString; safecall;
    function Get_TerminalID: WideString; safecall;
    function Get_MerchantID: WideString; safecall;
    function Get_AuthCode: WideString; safecall;
    function Get_ExpDate: WideString; safecall;
    function Get_CardHolder: WideString; safecall;
    function Get_IssuerName: WideString; safecall;
    function Get_InvoiceNum: LongWord; safecall;
    function Get_RRN: WideString; safecall;
    function Get_TotalsDebitAmt: LongWord; safecall;
    function Get_TotalsDebitNum: LongWord; safecall;
    function Get_TotalsCreditAmt: LongWord; safecall;
    function Get_TotalsCreditNum: LongWord; safecall;
    function Get_TotalsCancelledAmt: LongWord; safecall;
    function Get_TotalsCancelledNum: LongWord; safecall;
    function Get_SignVerif: Byte; safecall;
    function Get_TxnNum: LongWord; safecall;
    procedure GetTxnNum; safecall;
    procedure GetTxnDataByOrder(ulOrderNum: LongWord); safecall;
    procedure GetTxnDataByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte); safecall;
    procedure GetBatchTotals(bMerchIdx: Byte); safecall;
    procedure CheckConnection(bMerchIdx: Byte); safecall;
    procedure PrintLastSettleCopy(bMerchIdx: Byte); safecall;
    procedure PrintBatchJournal(bMerchIdx: Byte); safecall;
    function Get_Amount: LongWord; safecall;
    function Get_AddAmount: LongWord; safecall;
    procedure ReqCurrReceipt; safecall;
    function Get_Receipt: WideString; safecall;
    function Get_emvAID: WideString; safecall;
    function Get_EntryMode: Byte; safecall;
    function Get_TxnType: Byte; safecall;
    procedure ReqReceiptByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte); safecall;
    procedure SetErrorLang(bErrLanguage: Byte); safecall;
    procedure SetControlMode(isCtrlMode: WordBool); safecall;
    function Get_TermStatus: Byte; safecall;
    procedure ReadKey(bTimeOut: Byte); safecall;
    procedure DisplayText(bBeep: Byte); safecall;
    procedure SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte); safecall;
    function Get_Key: Byte; safecall;
    procedure ExchangeStatuses(bECRStatus: Byte); safecall;
    procedure Completion(bMerchIdx: Byte; ulAmount: LongWord; const bsRRN: WideString; 
                         ulInvoiceNum: LongWord); safecall;
    procedure ReadCard; safecall;
    function Get_Track3: WideString; safecall;
    procedure Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); safecall;
    procedure Deposit(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                      bAccNumber: Byte); safecall;
    function Get_TrnStatus: Byte; safecall;
    function Get_Currency: WideString; safecall;
    procedure PurchaseService(bMerchIdx: Byte; ulAmount: LongWord; const bsServiceParams: WideString); safecall;
    function Get_TrnBatchNum: LongWord; safecall;
    procedure IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); safecall;
    function Get_RNK: WideString; safecall;
    function Get_CurrencyCode: WideString; safecall;
    procedure POSGetInfo; safecall;
    procedure POSExTransaction; safecall;
    function Get_AddData: WideString; safecall;
    function Get_TerminalInfo: WideString; safecall;
    function Get_DiscountName: WideString; safecall;
    function Get_DiscountAttribute: LongWord; safecall;
    function Get_ECRDataTM: WideString; safecall;
    function Get_LibraryVersion: WideString; safecall;
    procedure SelectApp(const bsAppName: WideString; ulAppIdx: LongWord); safecall;
    procedure CloseApp; safecall;
    procedure StartScenario(ulScenarioID: LongWord; const bsScenarioData: WideString); safecall;
    function Get_ScenarioData: WideString; safecall;
    procedure SetExtraPrintData(const bsExtraPrintData: WideString); safecall;
    procedure useLogging(bLoggingLevel: Byte; const bsFilePath: WideString); safecall;
    procedure SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte); safecall;
    procedure SetScreen(ulScreenNumber: LongWord); safecall;
    procedure CorrectTransaction(ulAmount: LongWord; ulAddAmount: LongWord); safecall;
    procedure SetExtraXmlData(const bsExtraXmlData: WideString); safecall;
    function Get_CompletionInvoiceNum: LongWord; safecall;
    procedure CashAdvance(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                          bAccNumber: Byte); safecall;
    procedure ReadBankCard; safecall;
    function Get_FlagAcquirer: LongWord; safecall;
    function Get_CryptedData: WideString; safecall;
    function Get_ExtraCardData: WideString; safecall;
    procedure ReqDataFile; safecall;
    function Get_DataFile: OleVariant; safecall;
    procedure Ping; safecall;
    procedure CheckTerminal; safecall;
    function Get_PanHash: WideString; safecall;
    function Get_SlipPrinted: Byte; safecall;
    procedure UseMac(macType: Byte; const bsKey: WideString); safecall;
    property LastResult: Byte read Get_LastResult;
    property LastErrorCode: Byte read Get_LastErrorCode;
    property LastErrorDescription: WideString read Get_LastErrorDescription;
    property LastStatMsgCode: Byte read Get_LastStatMsgCode;
    property LastStatMsgDescription: WideString read Get_LastStatMsgDescription;
    property ResponseCode: LongWord read Get_ResponseCode;
    property PAN: WideString read Get_PAN;
    property DateTime: WideString read Get_DateTime;
    property TerminalID: WideString read Get_TerminalID;
    property MerchantID: WideString read Get_MerchantID;
    property AuthCode: WideString read Get_AuthCode;
    property ExpDate: WideString read Get_ExpDate;
    property CardHolder: WideString read Get_CardHolder;
    property IssuerName: WideString read Get_IssuerName;
    property InvoiceNum: LongWord read Get_InvoiceNum;
    property RRN: WideString read Get_RRN;
    property TotalsDebitAmt: LongWord read Get_TotalsDebitAmt;
    property TotalsDebitNum: LongWord read Get_TotalsDebitNum;
    property TotalsCreditAmt: LongWord read Get_TotalsCreditAmt;
    property TotalsCreditNum: LongWord read Get_TotalsCreditNum;
    property TotalsCancelledAmt: LongWord read Get_TotalsCancelledAmt;
    property TotalsCancelledNum: LongWord read Get_TotalsCancelledNum;
    property SignVerif: Byte read Get_SignVerif;
    property TxnNum: LongWord read Get_TxnNum;
    property Amount: LongWord read Get_Amount;
    property AddAmount: LongWord read Get_AddAmount;
    property Receipt: WideString read Get_Receipt;
    property emvAID: WideString read Get_emvAID;
    property EntryMode: Byte read Get_EntryMode;
    property TxnType: Byte read Get_TxnType;
    property TermStatus: Byte read Get_TermStatus;
    property Key: Byte read Get_Key;
    property Track3: WideString read Get_Track3;
    property TrnStatus: Byte read Get_TrnStatus;
    property Currency: WideString read Get_Currency;
    property TrnBatchNum: LongWord read Get_TrnBatchNum;
    property RNK: WideString read Get_RNK;
    property CurrencyCode: WideString read Get_CurrencyCode;
    property AddData: WideString read Get_AddData;
    property TerminalInfo: WideString read Get_TerminalInfo;
    property DiscountName: WideString read Get_DiscountName;
    property DiscountAttribute: LongWord read Get_DiscountAttribute;
    property ECRDataTM: WideString read Get_ECRDataTM;
    property LibraryVersion: WideString read Get_LibraryVersion;
    property ScenarioData: WideString read Get_ScenarioData;
    property CompletionInvoiceNum: LongWord read Get_CompletionInvoiceNum;
    property FlagAcquirer: LongWord read Get_FlagAcquirer;
    property CryptedData: WideString read Get_CryptedData;
    property ExtraCardData: WideString read Get_ExtraCardData;
    property DataFile: OleVariant read Get_DataFile;
    property PanHash: WideString read Get_PanHash;
    property SlipPrinted: Byte read Get_SlipPrinted;
  end;

// *********************************************************************//
// DispIntf:  IBPOS1LibDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D7286B6D-C803-46B8-8A34-655BC2ED9C81}
// *********************************************************************//
  IBPOS1LibDisp = dispinterface
    ['{D7286B6D-C803-46B8-8A34-655BC2ED9C81}']
    procedure CommOpen(bPort: Byte; lBaudRate: Integer); dispid 1;
    procedure CommOpenTCP(const bsIP: WideString; const bsPort: WideString); dispid 2;
    procedure CommOpenAuto(lBaudRate: Integer); dispid 3;
    procedure CommClose; dispid 4;
    procedure Purchase(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte); dispid 5;
    procedure Refund(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte; 
                     const bsRRN: WideString); dispid 6;
    procedure Void(ulInvoiceNum: LongWord; bMerchIdx: Byte); dispid 7;
    procedure Settlement(bMerchIdx: Byte); dispid 8;
    procedure PrintBatchTotals(bMerchIdx: Byte); dispid 9;
    procedure Confirm; dispid 10;
    procedure Cancel; dispid 11;
    property LastResult: Byte readonly dispid 12;
    property LastErrorCode: Byte readonly dispid 13;
    property LastErrorDescription: WideString readonly dispid 14;
    property LastStatMsgCode: Byte readonly dispid 15;
    property LastStatMsgDescription: WideString readonly dispid 16;
    property ResponseCode: LongWord readonly dispid 17;
    property PAN: WideString readonly dispid 18;
    property DateTime: WideString readonly dispid 19;
    property TerminalID: WideString readonly dispid 20;
    property MerchantID: WideString readonly dispid 21;
    property AuthCode: WideString readonly dispid 22;
    property ExpDate: WideString readonly dispid 23;
    property CardHolder: WideString readonly dispid 24;
    property IssuerName: WideString readonly dispid 25;
    property InvoiceNum: LongWord readonly dispid 26;
    property RRN: WideString readonly dispid 27;
    property TotalsDebitAmt: LongWord readonly dispid 28;
    property TotalsDebitNum: LongWord readonly dispid 29;
    property TotalsCreditAmt: LongWord readonly dispid 30;
    property TotalsCreditNum: LongWord readonly dispid 31;
    property TotalsCancelledAmt: LongWord readonly dispid 32;
    property TotalsCancelledNum: LongWord readonly dispid 33;
    property SignVerif: Byte readonly dispid 34;
    property TxnNum: LongWord readonly dispid 35;
    procedure GetTxnNum; dispid 36;
    procedure GetTxnDataByOrder(ulOrderNum: LongWord); dispid 37;
    procedure GetTxnDataByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte); dispid 38;
    procedure GetBatchTotals(bMerchIdx: Byte); dispid 39;
    procedure CheckConnection(bMerchIdx: Byte); dispid 40;
    procedure PrintLastSettleCopy(bMerchIdx: Byte); dispid 41;
    procedure PrintBatchJournal(bMerchIdx: Byte); dispid 42;
    property Amount: LongWord readonly dispid 43;
    property AddAmount: LongWord readonly dispid 44;
    procedure ReqCurrReceipt; dispid 45;
    property Receipt: WideString readonly dispid 46;
    property emvAID: WideString readonly dispid 47;
    property EntryMode: Byte readonly dispid 48;
    property TxnType: Byte readonly dispid 49;
    procedure ReqReceiptByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte); dispid 50;
    procedure SetErrorLang(bErrLanguage: Byte); dispid 51;
    procedure SetControlMode(isCtrlMode: WordBool); dispid 52;
    property TermStatus: Byte readonly dispid 53;
    procedure ReadKey(bTimeOut: Byte); dispid 54;
    procedure DisplayText(bBeep: Byte); dispid 55;
    procedure SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte); dispid 56;
    property Key: Byte readonly dispid 57;
    procedure ExchangeStatuses(bECRStatus: Byte); dispid 58;
    procedure Completion(bMerchIdx: Byte; ulAmount: LongWord; const bsRRN: WideString; 
                         ulInvoiceNum: LongWord); dispid 59;
    procedure ReadCard; dispid 60;
    property Track3: WideString readonly dispid 61;
    procedure Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); dispid 62;
    procedure Deposit(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                      bAccNumber: Byte); dispid 63;
    property TrnStatus: Byte readonly dispid 64;
    property Currency: WideString readonly dispid 65;
    procedure PurchaseService(bMerchIdx: Byte; ulAmount: LongWord; const bsServiceParams: WideString); dispid 66;
    property TrnBatchNum: LongWord readonly dispid 67;
    procedure IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); dispid 68;
    property RNK: WideString readonly dispid 69;
    property CurrencyCode: WideString readonly dispid 70;
    procedure POSGetInfo; dispid 71;
    procedure POSExTransaction; dispid 72;
    property AddData: WideString readonly dispid 73;
    property TerminalInfo: WideString readonly dispid 74;
    property DiscountName: WideString readonly dispid 75;
    property DiscountAttribute: LongWord readonly dispid 76;
    property ECRDataTM: WideString readonly dispid 77;
    property LibraryVersion: WideString readonly dispid 78;
    procedure SelectApp(const bsAppName: WideString; ulAppIdx: LongWord); dispid 79;
    procedure CloseApp; dispid 80;
    procedure StartScenario(ulScenarioID: LongWord; const bsScenarioData: WideString); dispid 81;
    property ScenarioData: WideString readonly dispid 82;
    procedure SetExtraPrintData(const bsExtraPrintData: WideString); dispid 83;
    procedure useLogging(bLoggingLevel: Byte; const bsFilePath: WideString); dispid 84;
    procedure SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte); dispid 85;
    procedure SetScreen(ulScreenNumber: LongWord); dispid 86;
    procedure CorrectTransaction(ulAmount: LongWord; ulAddAmount: LongWord); dispid 87;
    procedure SetExtraXmlData(const bsExtraXmlData: WideString); dispid 88;
    property CompletionInvoiceNum: LongWord readonly dispid 89;
    procedure CashAdvance(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                          bAccNumber: Byte); dispid 90;
    procedure ReadBankCard; dispid 91;
    property FlagAcquirer: LongWord readonly dispid 92;
    property CryptedData: WideString readonly dispid 93;
    property ExtraCardData: WideString readonly dispid 94;
    procedure ReqDataFile; dispid 95;
    property DataFile: OleVariant readonly dispid 96;
    procedure Ping; dispid 97;
    procedure CheckTerminal; dispid 98;
    property PanHash: WideString readonly dispid 99;
    property SlipPrinted: Byte readonly dispid 100;
    procedure UseMac(macType: Byte; const bsKey: WideString); dispid 101;
  end;

// *********************************************************************//
// Interface: IBPOS0Lib
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8AEB6C5C-6FE9-48A5-8966-ACD1ED03FE18}
// *********************************************************************//
  IBPOS0Lib = interface(IDispatch)
    ['{8AEB6C5C-6FE9-48A5-8966-ACD1ED03FE18}']
    procedure CommOpen(bPort: Byte; lBaudRate: Integer); safecall;
    procedure CommOpenTCP(const bsIP: WideString; const bsPort: WideString); safecall;
    procedure CommOpenAuto(lBaudRate: Integer); safecall;
    procedure CommClose; safecall;
    procedure Purchase(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte); safecall;
    procedure Refund(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte; 
                     const bsRRN: WideString); safecall;
    procedure Void(ulInvoiceNum: Integer; bMerchIdx: Byte); safecall;
    procedure Settlement(bMerchIdx: Byte); safecall;
    procedure PrintBatchTotals(bMerchIdx: Byte); safecall;
    procedure Confirm; safecall;
    procedure Cancel; safecall;
    function Get_LastResult: Byte; safecall;
    function Get_LastErrorCode: Byte; safecall;
    function Get_LastErrorDescription: WideString; safecall;
    function Get_LastStatMsgCode: Byte; safecall;
    function Get_LastStatMsgDescription: WideString; safecall;
    function Get_ResponseCode: Integer; safecall;
    function Get_PAN: WideString; safecall;
    function Get_DateTime: WideString; safecall;
    function Get_TerminalID: WideString; safecall;
    function Get_MerchantID: WideString; safecall;
    function Get_AuthCode: WideString; safecall;
    function Get_ExpDate: WideString; safecall;
    function Get_CardHolder: WideString; safecall;
    function Get_IssuerName: WideString; safecall;
    function Get_InvoiceNum: Integer; safecall;
    function Get_RRN: WideString; safecall;
    function Get_TotalsDebitAmt: Integer; safecall;
    function Get_TotalsDebitNum: Integer; safecall;
    function Get_TotalsCreditAmt: Integer; safecall;
    function Get_TotalsCreditNum: Integer; safecall;
    function Get_TotalsCancelledAmt: Integer; safecall;
    function Get_TotalsCancelledNum: Integer; safecall;
    function Get_SignVerif: Byte; safecall;
    function Get_TxnNum: Integer; safecall;
    procedure GetTxnNum; safecall;
    procedure GetTxnDataByOrder(ulOrderNum: Integer); safecall;
    procedure GetTxnDataByInv(ulInvoiceNum: Integer; bMerchIdx: Byte); safecall;
    procedure GetBatchTotals(bMerchIdx: Byte); safecall;
    procedure CheckConnection(bMerchIdx: Byte); safecall;
    procedure PrintLastSettleCopy(bMerchIdx: Byte); safecall;
    procedure PrintBatchJournal(bMerchIdx: Byte); safecall;
    function Get_Amount: Integer; safecall;
    function Get_AddAmount: Integer; safecall;
    procedure ReqCurrReceipt; safecall;
    function Get_Receipt: WideString; safecall;
    function Get_emvAID: WideString; safecall;
    function Get_EntryMode: Byte; safecall;
    function Get_TxnType: Byte; safecall;
    procedure ReqReceiptByInv(ulInvoiceNum: Integer; bMerchIdx: Byte); safecall;
    procedure SetErrorLang(bErrLanguage: Byte); safecall;
    procedure SetControlMode(isCtrlMode: WordBool); safecall;
    function Get_TermStatus: Byte; safecall;
    procedure ReadKey(bTimeOut: Byte); safecall;
    procedure DisplayText(bBeep: Byte); safecall;
    procedure SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte); safecall;
    function Get_Key: Byte; safecall;
    procedure ExchangeStatuses(bECRStatus: Byte); safecall;
    procedure Completion(bMerchIdx: Byte; ulAmount: Integer; const bsRRN: WideString; 
                         ulInvoiceNum: Integer); safecall;
    procedure ReadCard; safecall;
    function Get_Track3: WideString; safecall;
    procedure Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); safecall;
    procedure Deposit(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                      bAccNumber: Byte); safecall;
    function Get_TrnStatus: Byte; safecall;
    function Get_Currency: WideString; safecall;
    procedure PurchaseService(bMerchIdx: Byte; ulAmount: Integer; const bsServiceParams: WideString); safecall;
    function Get_TrnBatchNum: Integer; safecall;
    procedure IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); safecall;
    function Get_RNK: WideString; safecall;
    function Get_CurrencyCode: WideString; safecall;
    procedure POSGetInfo; safecall;
    procedure POSExTransaction; safecall;
    function Get_AddData: WideString; safecall;
    function Get_TerminalInfo: WideString; safecall;
    function Get_DiscountName: WideString; safecall;
    function Get_DiscountAttribute: Integer; safecall;
    function Get_ECRDataTM: WideString; safecall;
    function Get_LibraryVersion: WideString; safecall;
    procedure SelectApp(const bsAppName: WideString; ulAppIdx: Integer); safecall;
    procedure CloseApp; safecall;
    procedure StartScenario(ulScenarioID: Integer; const bsScenarioData: WideString); safecall;
    function Get_ScenarioData: WideString; safecall;
    procedure SetExtraPrintData(const bsExtraPrintData: WideString); safecall;
    procedure useLogging(bLoggingLevel: Byte; const bsFilePath: WideString); safecall;
    procedure SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte); safecall;
    procedure SetScreen(ulScreenNumber: Integer); safecall;
    procedure CorrectTransaction(ulAmount: Integer; ulAddAmount: Integer); safecall;
    procedure SetExtraXmlData(const bsExtraXmlData: WideString); safecall;
    function Get_CompletionInvoiceNum: Integer; safecall;
    procedure CashAdvance(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                          bAccNumber: Byte); safecall;
    procedure ReadBankCard; safecall;
    function Get_FlagAcquirer: Integer; safecall;
    function Get_CryptedData: WideString; safecall;
    function Get_ExtraCardData: WideString; safecall;
    procedure ReqDataFile; safecall;
    function Get_DataFile: OleVariant; safecall;
    procedure Ping; safecall;
    procedure CheckTerminal; safecall;
    function Get_PanHash: WideString; safecall;
    function Get_SlipPrinted: Byte; safecall;
    procedure UseMac(macType: Byte; const bsKey: WideString); safecall;
    property LastResult: Byte read Get_LastResult;
    property LastErrorCode: Byte read Get_LastErrorCode;
    property LastErrorDescription: WideString read Get_LastErrorDescription;
    property LastStatMsgCode: Byte read Get_LastStatMsgCode;
    property LastStatMsgDescription: WideString read Get_LastStatMsgDescription;
    property ResponseCode: Integer read Get_ResponseCode;
    property PAN: WideString read Get_PAN;
    property DateTime: WideString read Get_DateTime;
    property TerminalID: WideString read Get_TerminalID;
    property MerchantID: WideString read Get_MerchantID;
    property AuthCode: WideString read Get_AuthCode;
    property ExpDate: WideString read Get_ExpDate;
    property CardHolder: WideString read Get_CardHolder;
    property IssuerName: WideString read Get_IssuerName;
    property InvoiceNum: Integer read Get_InvoiceNum;
    property RRN: WideString read Get_RRN;
    property TotalsDebitAmt: Integer read Get_TotalsDebitAmt;
    property TotalsDebitNum: Integer read Get_TotalsDebitNum;
    property TotalsCreditAmt: Integer read Get_TotalsCreditAmt;
    property TotalsCreditNum: Integer read Get_TotalsCreditNum;
    property TotalsCancelledAmt: Integer read Get_TotalsCancelledAmt;
    property TotalsCancelledNum: Integer read Get_TotalsCancelledNum;
    property SignVerif: Byte read Get_SignVerif;
    property TxnNum: Integer read Get_TxnNum;
    property Amount: Integer read Get_Amount;
    property AddAmount: Integer read Get_AddAmount;
    property Receipt: WideString read Get_Receipt;
    property emvAID: WideString read Get_emvAID;
    property EntryMode: Byte read Get_EntryMode;
    property TxnType: Byte read Get_TxnType;
    property TermStatus: Byte read Get_TermStatus;
    property Key: Byte read Get_Key;
    property Track3: WideString read Get_Track3;
    property TrnStatus: Byte read Get_TrnStatus;
    property Currency: WideString read Get_Currency;
    property TrnBatchNum: Integer read Get_TrnBatchNum;
    property RNK: WideString read Get_RNK;
    property CurrencyCode: WideString read Get_CurrencyCode;
    property AddData: WideString read Get_AddData;
    property TerminalInfo: WideString read Get_TerminalInfo;
    property DiscountName: WideString read Get_DiscountName;
    property DiscountAttribute: Integer read Get_DiscountAttribute;
    property ECRDataTM: WideString read Get_ECRDataTM;
    property LibraryVersion: WideString read Get_LibraryVersion;
    property ScenarioData: WideString read Get_ScenarioData;
    property CompletionInvoiceNum: Integer read Get_CompletionInvoiceNum;
    property FlagAcquirer: Integer read Get_FlagAcquirer;
    property CryptedData: WideString read Get_CryptedData;
    property ExtraCardData: WideString read Get_ExtraCardData;
    property DataFile: OleVariant read Get_DataFile;
    property PanHash: WideString read Get_PanHash;
    property SlipPrinted: Byte read Get_SlipPrinted;
  end;

// *********************************************************************//
// DispIntf:  IBPOS0LibDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8AEB6C5C-6FE9-48A5-8966-ACD1ED03FE18}
// *********************************************************************//
  IBPOS0LibDisp = dispinterface
    ['{8AEB6C5C-6FE9-48A5-8966-ACD1ED03FE18}']
    procedure CommOpen(bPort: Byte; lBaudRate: Integer); dispid 1;
    procedure CommOpenTCP(const bsIP: WideString; const bsPort: WideString); dispid 2;
    procedure CommOpenAuto(lBaudRate: Integer); dispid 3;
    procedure CommClose; dispid 4;
    procedure Purchase(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte); dispid 5;
    procedure Refund(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte; 
                     const bsRRN: WideString); dispid 6;
    procedure Void(ulInvoiceNum: Integer; bMerchIdx: Byte); dispid 7;
    procedure Settlement(bMerchIdx: Byte); dispid 8;
    procedure PrintBatchTotals(bMerchIdx: Byte); dispid 9;
    procedure Confirm; dispid 10;
    procedure Cancel; dispid 11;
    property LastResult: Byte readonly dispid 12;
    property LastErrorCode: Byte readonly dispid 13;
    property LastErrorDescription: WideString readonly dispid 14;
    property LastStatMsgCode: Byte readonly dispid 15;
    property LastStatMsgDescription: WideString readonly dispid 16;
    property ResponseCode: Integer readonly dispid 17;
    property PAN: WideString readonly dispid 18;
    property DateTime: WideString readonly dispid 19;
    property TerminalID: WideString readonly dispid 20;
    property MerchantID: WideString readonly dispid 21;
    property AuthCode: WideString readonly dispid 22;
    property ExpDate: WideString readonly dispid 23;
    property CardHolder: WideString readonly dispid 24;
    property IssuerName: WideString readonly dispid 25;
    property InvoiceNum: Integer readonly dispid 26;
    property RRN: WideString readonly dispid 27;
    property TotalsDebitAmt: Integer readonly dispid 28;
    property TotalsDebitNum: Integer readonly dispid 29;
    property TotalsCreditAmt: Integer readonly dispid 30;
    property TotalsCreditNum: Integer readonly dispid 31;
    property TotalsCancelledAmt: Integer readonly dispid 32;
    property TotalsCancelledNum: Integer readonly dispid 33;
    property SignVerif: Byte readonly dispid 34;
    property TxnNum: Integer readonly dispid 35;
    procedure GetTxnNum; dispid 36;
    procedure GetTxnDataByOrder(ulOrderNum: Integer); dispid 37;
    procedure GetTxnDataByInv(ulInvoiceNum: Integer; bMerchIdx: Byte); dispid 38;
    procedure GetBatchTotals(bMerchIdx: Byte); dispid 39;
    procedure CheckConnection(bMerchIdx: Byte); dispid 40;
    procedure PrintLastSettleCopy(bMerchIdx: Byte); dispid 41;
    procedure PrintBatchJournal(bMerchIdx: Byte); dispid 42;
    property Amount: Integer readonly dispid 43;
    property AddAmount: Integer readonly dispid 44;
    procedure ReqCurrReceipt; dispid 45;
    property Receipt: WideString readonly dispid 46;
    property emvAID: WideString readonly dispid 47;
    property EntryMode: Byte readonly dispid 48;
    property TxnType: Byte readonly dispid 49;
    procedure ReqReceiptByInv(ulInvoiceNum: Integer; bMerchIdx: Byte); dispid 50;
    procedure SetErrorLang(bErrLanguage: Byte); dispid 51;
    procedure SetControlMode(isCtrlMode: WordBool); dispid 52;
    property TermStatus: Byte readonly dispid 53;
    procedure ReadKey(bTimeOut: Byte); dispid 54;
    procedure DisplayText(bBeep: Byte); dispid 55;
    procedure SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte); dispid 56;
    property Key: Byte readonly dispid 57;
    procedure ExchangeStatuses(bECRStatus: Byte); dispid 58;
    procedure Completion(bMerchIdx: Byte; ulAmount: Integer; const bsRRN: WideString; 
                         ulInvoiceNum: Integer); dispid 59;
    procedure ReadCard; dispid 60;
    property Track3: WideString readonly dispid 61;
    procedure Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); dispid 62;
    procedure Deposit(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                      bAccNumber: Byte); dispid 63;
    property TrnStatus: Byte readonly dispid 64;
    property Currency: WideString readonly dispid 65;
    procedure PurchaseService(bMerchIdx: Byte; ulAmount: Integer; const bsServiceParams: WideString); dispid 66;
    property TrnBatchNum: Integer readonly dispid 67;
    procedure IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte); dispid 68;
    property RNK: WideString readonly dispid 69;
    property CurrencyCode: WideString readonly dispid 70;
    procedure POSGetInfo; dispid 71;
    procedure POSExTransaction; dispid 72;
    property AddData: WideString readonly dispid 73;
    property TerminalInfo: WideString readonly dispid 74;
    property DiscountName: WideString readonly dispid 75;
    property DiscountAttribute: Integer readonly dispid 76;
    property ECRDataTM: WideString readonly dispid 77;
    property LibraryVersion: WideString readonly dispid 78;
    procedure SelectApp(const bsAppName: WideString; ulAppIdx: Integer); dispid 79;
    procedure CloseApp; dispid 80;
    procedure StartScenario(ulScenarioID: Integer; const bsScenarioData: WideString); dispid 81;
    property ScenarioData: WideString readonly dispid 82;
    procedure SetExtraPrintData(const bsExtraPrintData: WideString); dispid 83;
    procedure useLogging(bLoggingLevel: Byte; const bsFilePath: WideString); dispid 84;
    procedure SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte); dispid 85;
    procedure SetScreen(ulScreenNumber: Integer); dispid 86;
    procedure CorrectTransaction(ulAmount: Integer; ulAddAmount: Integer); dispid 87;
    procedure SetExtraXmlData(const bsExtraXmlData: WideString); dispid 88;
    property CompletionInvoiceNum: Integer readonly dispid 89;
    procedure CashAdvance(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                          bAccNumber: Byte); dispid 90;
    procedure ReadBankCard; dispid 91;
    property FlagAcquirer: Integer readonly dispid 92;
    property CryptedData: WideString readonly dispid 93;
    property ExtraCardData: WideString readonly dispid 94;
    procedure ReqDataFile; dispid 95;
    property DataFile: OleVariant readonly dispid 96;
    procedure Ping; dispid 97;
    procedure CheckTerminal; dispid 98;
    property PanHash: WideString readonly dispid 99;
    property SlipPrinted: Byte readonly dispid 100;
    procedure UseMac(macType: Byte; const bsKey: WideString); dispid 101;
  end;

// *********************************************************************//
// The Class CoBPOS1Lib provides a Create and CreateRemote method to          
// create instances of the default interface IBPOS1Lib exposed by              
// the CoClass BPOS1Lib. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBPOS1Lib = class
    class function Create: IBPOS1Lib;
    class function CreateRemote(const MachineName: string): IBPOS1Lib;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBPOS1Lib
// Help String      : BPOS1Lib Class
// Default Interface: IBPOS1Lib
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TBPOS1Lib = class(TOleServer)
  private
    FIntf: IBPOS1Lib;
    function GetDefaultInterface: IBPOS1Lib;
  protected
    procedure InitServerData; override;
    function Get_LastResult: Byte;
    function Get_LastErrorCode: Byte;
    function Get_LastErrorDescription: WideString;
    function Get_LastStatMsgCode: Byte;
    function Get_LastStatMsgDescription: WideString;
    function Get_ResponseCode: LongWord;
    function Get_PAN: WideString;
    function Get_DateTime: WideString;
    function Get_TerminalID: WideString;
    function Get_MerchantID: WideString;
    function Get_AuthCode: WideString;
    function Get_ExpDate: WideString;
    function Get_CardHolder: WideString;
    function Get_IssuerName: WideString;
    function Get_InvoiceNum: LongWord;
    function Get_RRN: WideString;
    function Get_TotalsDebitAmt: LongWord;
    function Get_TotalsDebitNum: LongWord;
    function Get_TotalsCreditAmt: LongWord;
    function Get_TotalsCreditNum: LongWord;
    function Get_TotalsCancelledAmt: LongWord;
    function Get_TotalsCancelledNum: LongWord;
    function Get_SignVerif: Byte;
    function Get_TxnNum: LongWord;
    function Get_Amount: LongWord;
    function Get_AddAmount: LongWord;
    function Get_Receipt: WideString;
    function Get_emvAID: WideString;
    function Get_EntryMode: Byte;
    function Get_TxnType: Byte;
    function Get_TermStatus: Byte;
    function Get_Key: Byte;
    function Get_Track3: WideString;
    function Get_TrnStatus: Byte;
    function Get_Currency: WideString;
    function Get_TrnBatchNum: LongWord;
    function Get_RNK: WideString;
    function Get_CurrencyCode: WideString;
    function Get_AddData: WideString;
    function Get_TerminalInfo: WideString;
    function Get_DiscountName: WideString;
    function Get_DiscountAttribute: LongWord;
    function Get_ECRDataTM: WideString;
    function Get_LibraryVersion: WideString;
    function Get_ScenarioData: WideString;
    function Get_CompletionInvoiceNum: LongWord;
    function Get_FlagAcquirer: LongWord;
    function Get_CryptedData: WideString;
    function Get_ExtraCardData: WideString;
    function Get_DataFile: OleVariant;
    function Get_PanHash: WideString;
    function Get_SlipPrinted: Byte;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IBPOS1Lib);
    procedure Disconnect; override;
    procedure CommOpen(bPort: Byte; lBaudRate: Integer);
    procedure CommOpenTCP(const bsIP: WideString; const bsPort: WideString);
    procedure CommOpenAuto(lBaudRate: Integer);
    procedure CommClose;
    procedure Purchase(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte);
    procedure Refund(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte; 
                     const bsRRN: WideString);
    procedure Void(ulInvoiceNum: LongWord; bMerchIdx: Byte);
    procedure Settlement(bMerchIdx: Byte);
    procedure PrintBatchTotals(bMerchIdx: Byte);
    procedure Confirm;
    procedure Cancel;
    procedure GetTxnNum;
    procedure GetTxnDataByOrder(ulOrderNum: LongWord);
    procedure GetTxnDataByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte);
    procedure GetBatchTotals(bMerchIdx: Byte);
    procedure CheckConnection(bMerchIdx: Byte);
    procedure PrintLastSettleCopy(bMerchIdx: Byte);
    procedure PrintBatchJournal(bMerchIdx: Byte);
    procedure ReqCurrReceipt;
    procedure ReqReceiptByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte);
    procedure SetErrorLang(bErrLanguage: Byte);
    procedure SetControlMode(isCtrlMode: WordBool);
    procedure ReadKey(bTimeOut: Byte);
    procedure DisplayText(bBeep: Byte);
    procedure SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte);
    procedure ExchangeStatuses(bECRStatus: Byte);
    procedure Completion(bMerchIdx: Byte; ulAmount: LongWord; const bsRRN: WideString; 
                         ulInvoiceNum: LongWord);
    procedure ReadCard;
    procedure Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
    procedure Deposit(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                      bAccNumber: Byte);
    procedure PurchaseService(bMerchIdx: Byte; ulAmount: LongWord; const bsServiceParams: WideString);
    procedure IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
    procedure POSGetInfo;
    procedure POSExTransaction;
    procedure SelectApp(const bsAppName: WideString; ulAppIdx: LongWord);
    procedure CloseApp;
    procedure StartScenario(ulScenarioID: LongWord; const bsScenarioData: WideString);
    procedure SetExtraPrintData(const bsExtraPrintData: WideString);
    procedure useLogging(bLoggingLevel: Byte; const bsFilePath: WideString);
    procedure SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte);
    procedure SetScreen(ulScreenNumber: LongWord);
    procedure CorrectTransaction(ulAmount: LongWord; ulAddAmount: LongWord);
    procedure SetExtraXmlData(const bsExtraXmlData: WideString);
    procedure CashAdvance(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                          bAccNumber: Byte);
    procedure ReadBankCard;
    procedure ReqDataFile;
    procedure Ping;
    procedure CheckTerminal;
    procedure UseMac(macType: Byte; const bsKey: WideString);
    property DefaultInterface: IBPOS1Lib read GetDefaultInterface;
    property LastResult: Byte read Get_LastResult;
    property LastErrorCode: Byte read Get_LastErrorCode;
    property LastErrorDescription: WideString read Get_LastErrorDescription;
    property LastStatMsgCode: Byte read Get_LastStatMsgCode;
    property LastStatMsgDescription: WideString read Get_LastStatMsgDescription;
    property ResponseCode: LongWord read Get_ResponseCode;
    property PAN: WideString read Get_PAN;
    property DateTime: WideString read Get_DateTime;
    property TerminalID: WideString read Get_TerminalID;
    property MerchantID: WideString read Get_MerchantID;
    property AuthCode: WideString read Get_AuthCode;
    property ExpDate: WideString read Get_ExpDate;
    property CardHolder: WideString read Get_CardHolder;
    property IssuerName: WideString read Get_IssuerName;
    property InvoiceNum: LongWord read Get_InvoiceNum;
    property RRN: WideString read Get_RRN;
    property TotalsDebitAmt: LongWord read Get_TotalsDebitAmt;
    property TotalsDebitNum: LongWord read Get_TotalsDebitNum;
    property TotalsCreditAmt: LongWord read Get_TotalsCreditAmt;
    property TotalsCreditNum: LongWord read Get_TotalsCreditNum;
    property TotalsCancelledAmt: LongWord read Get_TotalsCancelledAmt;
    property TotalsCancelledNum: LongWord read Get_TotalsCancelledNum;
    property SignVerif: Byte read Get_SignVerif;
    property TxnNum: LongWord read Get_TxnNum;
    property Amount: LongWord read Get_Amount;
    property AddAmount: LongWord read Get_AddAmount;
    property Receipt: WideString read Get_Receipt;
    property emvAID: WideString read Get_emvAID;
    property EntryMode: Byte read Get_EntryMode;
    property TxnType: Byte read Get_TxnType;
    property TermStatus: Byte read Get_TermStatus;
    property Key: Byte read Get_Key;
    property Track3: WideString read Get_Track3;
    property TrnStatus: Byte read Get_TrnStatus;
    property Currency: WideString read Get_Currency;
    property TrnBatchNum: LongWord read Get_TrnBatchNum;
    property RNK: WideString read Get_RNK;
    property CurrencyCode: WideString read Get_CurrencyCode;
    property AddData: WideString read Get_AddData;
    property TerminalInfo: WideString read Get_TerminalInfo;
    property DiscountName: WideString read Get_DiscountName;
    property DiscountAttribute: LongWord read Get_DiscountAttribute;
    property ECRDataTM: WideString read Get_ECRDataTM;
    property LibraryVersion: WideString read Get_LibraryVersion;
    property ScenarioData: WideString read Get_ScenarioData;
    property CompletionInvoiceNum: LongWord read Get_CompletionInvoiceNum;
    property FlagAcquirer: LongWord read Get_FlagAcquirer;
    property CryptedData: WideString read Get_CryptedData;
    property ExtraCardData: WideString read Get_ExtraCardData;
    property DataFile: OleVariant read Get_DataFile;
    property PanHash: WideString read Get_PanHash;
    property SlipPrinted: Byte read Get_SlipPrinted;
  published
  end;

// *********************************************************************//
// The Class CoBPOS0Lib provides a Create and CreateRemote method to          
// create instances of the default interface IBPOS0Lib exposed by              
// the CoClass BPOS0Lib. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBPOS0Lib = class
    class function Create: IBPOS0Lib;
    class function CreateRemote(const MachineName: string): IBPOS0Lib;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBPOS0Lib
// Help String      : BPOS0Lib Class
// Default Interface: IBPOS0Lib
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TBPOS0Lib = class(TOleServer)
  private
    FIntf: IBPOS0Lib;
    function GetDefaultInterface: IBPOS0Lib;
  protected
    procedure InitServerData; override;
    function Get_LastResult: Byte;
    function Get_LastErrorCode: Byte;
    function Get_LastErrorDescription: WideString;
    function Get_LastStatMsgCode: Byte;
    function Get_LastStatMsgDescription: WideString;
    function Get_ResponseCode: Integer;
    function Get_PAN: WideString;
    function Get_DateTime: WideString;
    function Get_TerminalID: WideString;
    function Get_MerchantID: WideString;
    function Get_AuthCode: WideString;
    function Get_ExpDate: WideString;
    function Get_CardHolder: WideString;
    function Get_IssuerName: WideString;
    function Get_InvoiceNum: Integer;
    function Get_RRN: WideString;
    function Get_TotalsDebitAmt: Integer;
    function Get_TotalsDebitNum: Integer;
    function Get_TotalsCreditAmt: Integer;
    function Get_TotalsCreditNum: Integer;
    function Get_TotalsCancelledAmt: Integer;
    function Get_TotalsCancelledNum: Integer;
    function Get_SignVerif: Byte;
    function Get_TxnNum: Integer;
    function Get_Amount: Integer;
    function Get_AddAmount: Integer;
    function Get_Receipt: WideString;
    function Get_emvAID: WideString;
    function Get_EntryMode: Byte;
    function Get_TxnType: Byte;
    function Get_TermStatus: Byte;
    function Get_Key: Byte;
    function Get_Track3: WideString;
    function Get_TrnStatus: Byte;
    function Get_Currency: WideString;
    function Get_TrnBatchNum: Integer;
    function Get_RNK: WideString;
    function Get_CurrencyCode: WideString;
    function Get_AddData: WideString;
    function Get_TerminalInfo: WideString;
    function Get_DiscountName: WideString;
    function Get_DiscountAttribute: Integer;
    function Get_ECRDataTM: WideString;
    function Get_LibraryVersion: WideString;
    function Get_ScenarioData: WideString;
    function Get_CompletionInvoiceNum: Integer;
    function Get_FlagAcquirer: Integer;
    function Get_CryptedData: WideString;
    function Get_ExtraCardData: WideString;
    function Get_DataFile: OleVariant;
    function Get_PanHash: WideString;
    function Get_SlipPrinted: Byte;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IBPOS0Lib);
    procedure Disconnect; override;
    procedure CommOpen(bPort: Byte; lBaudRate: Integer);
    procedure CommOpenTCP(const bsIP: WideString; const bsPort: WideString);
    procedure CommOpenAuto(lBaudRate: Integer);
    procedure CommClose;
    procedure Purchase(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte);
    procedure Refund(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte; 
                     const bsRRN: WideString);
    procedure Void(ulInvoiceNum: Integer; bMerchIdx: Byte);
    procedure Settlement(bMerchIdx: Byte);
    procedure PrintBatchTotals(bMerchIdx: Byte);
    procedure Confirm;
    procedure Cancel;
    procedure GetTxnNum;
    procedure GetTxnDataByOrder(ulOrderNum: Integer);
    procedure GetTxnDataByInv(ulInvoiceNum: Integer; bMerchIdx: Byte);
    procedure GetBatchTotals(bMerchIdx: Byte);
    procedure CheckConnection(bMerchIdx: Byte);
    procedure PrintLastSettleCopy(bMerchIdx: Byte);
    procedure PrintBatchJournal(bMerchIdx: Byte);
    procedure ReqCurrReceipt;
    procedure ReqReceiptByInv(ulInvoiceNum: Integer; bMerchIdx: Byte);
    procedure SetErrorLang(bErrLanguage: Byte);
    procedure SetControlMode(isCtrlMode: WordBool);
    procedure ReadKey(bTimeOut: Byte);
    procedure DisplayText(bBeep: Byte);
    procedure SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte);
    procedure ExchangeStatuses(bECRStatus: Byte);
    procedure Completion(bMerchIdx: Byte; ulAmount: Integer; const bsRRN: WideString; 
                         ulInvoiceNum: Integer);
    procedure ReadCard;
    procedure Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
    procedure Deposit(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                      bAccNumber: Byte);
    procedure PurchaseService(bMerchIdx: Byte; ulAmount: Integer; const bsServiceParams: WideString);
    procedure IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
    procedure POSGetInfo;
    procedure POSExTransaction;
    procedure SelectApp(const bsAppName: WideString; ulAppIdx: Integer);
    procedure CloseApp;
    procedure StartScenario(ulScenarioID: Integer; const bsScenarioData: WideString);
    procedure SetExtraPrintData(const bsExtraPrintData: WideString);
    procedure useLogging(bLoggingLevel: Byte; const bsFilePath: WideString);
    procedure SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte);
    procedure SetScreen(ulScreenNumber: Integer);
    procedure CorrectTransaction(ulAmount: Integer; ulAddAmount: Integer);
    procedure SetExtraXmlData(const bsExtraXmlData: WideString);
    procedure CashAdvance(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                          bAccNumber: Byte);
    procedure ReadBankCard;
    procedure ReqDataFile;
    procedure Ping;
    procedure CheckTerminal;
    procedure UseMac(macType: Byte; const bsKey: WideString);
    property DefaultInterface: IBPOS0Lib read GetDefaultInterface;
    property LastResult: Byte read Get_LastResult;
    property LastErrorCode: Byte read Get_LastErrorCode;
    property LastErrorDescription: WideString read Get_LastErrorDescription;
    property LastStatMsgCode: Byte read Get_LastStatMsgCode;
    property LastStatMsgDescription: WideString read Get_LastStatMsgDescription;
    property ResponseCode: Integer read Get_ResponseCode;
    property PAN: WideString read Get_PAN;
    property DateTime: WideString read Get_DateTime;
    property TerminalID: WideString read Get_TerminalID;
    property MerchantID: WideString read Get_MerchantID;
    property AuthCode: WideString read Get_AuthCode;
    property ExpDate: WideString read Get_ExpDate;
    property CardHolder: WideString read Get_CardHolder;
    property IssuerName: WideString read Get_IssuerName;
    property InvoiceNum: Integer read Get_InvoiceNum;
    property RRN: WideString read Get_RRN;
    property TotalsDebitAmt: Integer read Get_TotalsDebitAmt;
    property TotalsDebitNum: Integer read Get_TotalsDebitNum;
    property TotalsCreditAmt: Integer read Get_TotalsCreditAmt;
    property TotalsCreditNum: Integer read Get_TotalsCreditNum;
    property TotalsCancelledAmt: Integer read Get_TotalsCancelledAmt;
    property TotalsCancelledNum: Integer read Get_TotalsCancelledNum;
    property SignVerif: Byte read Get_SignVerif;
    property TxnNum: Integer read Get_TxnNum;
    property Amount: Integer read Get_Amount;
    property AddAmount: Integer read Get_AddAmount;
    property Receipt: WideString read Get_Receipt;
    property emvAID: WideString read Get_emvAID;
    property EntryMode: Byte read Get_EntryMode;
    property TxnType: Byte read Get_TxnType;
    property TermStatus: Byte read Get_TermStatus;
    property Key: Byte read Get_Key;
    property Track3: WideString read Get_Track3;
    property TrnStatus: Byte read Get_TrnStatus;
    property Currency: WideString read Get_Currency;
    property TrnBatchNum: Integer read Get_TrnBatchNum;
    property RNK: WideString read Get_RNK;
    property CurrencyCode: WideString read Get_CurrencyCode;
    property AddData: WideString read Get_AddData;
    property TerminalInfo: WideString read Get_TerminalInfo;
    property DiscountName: WideString read Get_DiscountName;
    property DiscountAttribute: Integer read Get_DiscountAttribute;
    property ECRDataTM: WideString read Get_ECRDataTM;
    property LibraryVersion: WideString read Get_LibraryVersion;
    property ScenarioData: WideString read Get_ScenarioData;
    property CompletionInvoiceNum: Integer read Get_CompletionInvoiceNum;
    property FlagAcquirer: Integer read Get_FlagAcquirer;
    property CryptedData: WideString read Get_CryptedData;
    property ExtraCardData: WideString read Get_ExtraCardData;
    property DataFile: OleVariant read Get_DataFile;
    property PanHash: WideString read Get_PanHash;
    property SlipPrinted: Byte read Get_SlipPrinted;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoBPOS1Lib.Create: IBPOS1Lib;
begin
  Result := CreateComObject(CLASS_BPOS1Lib) as IBPOS1Lib;
end;

class function CoBPOS1Lib.CreateRemote(const MachineName: string): IBPOS1Lib;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BPOS1Lib) as IBPOS1Lib;
end;

procedure TBPOS1Lib.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{98333CF4-45FE-4996-B576-793BD1C08EA7}';
    IntfIID:   '{D7286B6D-C803-46B8-8A34-655BC2ED9C81}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBPOS1Lib.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IBPOS1Lib;
  end;
end;

procedure TBPOS1Lib.ConnectTo(svrIntf: IBPOS1Lib);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBPOS1Lib.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBPOS1Lib.GetDefaultInterface: IBPOS1Lib;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TBPOS1Lib.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TBPOS1Lib.Destroy;
begin
  inherited Destroy;
end;

function TBPOS1Lib.Get_LastResult: Byte;
begin
  Result := DefaultInterface.LastResult;
end;

function TBPOS1Lib.Get_LastErrorCode: Byte;
begin
  Result := DefaultInterface.LastErrorCode;
end;

function TBPOS1Lib.Get_LastErrorDescription: WideString;
begin
  Result := DefaultInterface.LastErrorDescription;
end;

function TBPOS1Lib.Get_LastStatMsgCode: Byte;
begin
  Result := DefaultInterface.LastStatMsgCode;
end;

function TBPOS1Lib.Get_LastStatMsgDescription: WideString;
begin
  Result := DefaultInterface.LastStatMsgDescription;
end;

function TBPOS1Lib.Get_ResponseCode: LongWord;
begin
  Result := DefaultInterface.ResponseCode;
end;

function TBPOS1Lib.Get_PAN: WideString;
begin
  Result := DefaultInterface.PAN;
end;

function TBPOS1Lib.Get_DateTime: WideString;
begin
  Result := DefaultInterface.DateTime;
end;

function TBPOS1Lib.Get_TerminalID: WideString;
begin
  Result := DefaultInterface.TerminalID;
end;

function TBPOS1Lib.Get_MerchantID: WideString;
begin
  Result := DefaultInterface.MerchantID;
end;

function TBPOS1Lib.Get_AuthCode: WideString;
begin
  Result := DefaultInterface.AuthCode;
end;

function TBPOS1Lib.Get_ExpDate: WideString;
begin
  Result := DefaultInterface.ExpDate;
end;

function TBPOS1Lib.Get_CardHolder: WideString;
begin
  Result := DefaultInterface.CardHolder;
end;

function TBPOS1Lib.Get_IssuerName: WideString;
begin
  Result := DefaultInterface.IssuerName;
end;

function TBPOS1Lib.Get_InvoiceNum: LongWord;
begin
  Result := DefaultInterface.InvoiceNum;
end;

function TBPOS1Lib.Get_RRN: WideString;
begin
  Result := DefaultInterface.RRN;
end;

function TBPOS1Lib.Get_TotalsDebitAmt: LongWord;
begin
  Result := DefaultInterface.TotalsDebitAmt;
end;

function TBPOS1Lib.Get_TotalsDebitNum: LongWord;
begin
  Result := DefaultInterface.TotalsDebitNum;
end;

function TBPOS1Lib.Get_TotalsCreditAmt: LongWord;
begin
  Result := DefaultInterface.TotalsCreditAmt;
end;

function TBPOS1Lib.Get_TotalsCreditNum: LongWord;
begin
  Result := DefaultInterface.TotalsCreditNum;
end;

function TBPOS1Lib.Get_TotalsCancelledAmt: LongWord;
begin
  Result := DefaultInterface.TotalsCancelledAmt;
end;

function TBPOS1Lib.Get_TotalsCancelledNum: LongWord;
begin
  Result := DefaultInterface.TotalsCancelledNum;
end;

function TBPOS1Lib.Get_SignVerif: Byte;
begin
  Result := DefaultInterface.SignVerif;
end;

function TBPOS1Lib.Get_TxnNum: LongWord;
begin
  Result := DefaultInterface.TxnNum;
end;

function TBPOS1Lib.Get_Amount: LongWord;
begin
  Result := DefaultInterface.Amount;
end;

function TBPOS1Lib.Get_AddAmount: LongWord;
begin
  Result := DefaultInterface.AddAmount;
end;

function TBPOS1Lib.Get_Receipt: WideString;
begin
  Result := DefaultInterface.Receipt;
end;

function TBPOS1Lib.Get_emvAID: WideString;
begin
  Result := DefaultInterface.emvAID;
end;

function TBPOS1Lib.Get_EntryMode: Byte;
begin
  Result := DefaultInterface.EntryMode;
end;

function TBPOS1Lib.Get_TxnType: Byte;
begin
  Result := DefaultInterface.TxnType;
end;

function TBPOS1Lib.Get_TermStatus: Byte;
begin
  Result := DefaultInterface.TermStatus;
end;

function TBPOS1Lib.Get_Key: Byte;
begin
  Result := DefaultInterface.Key;
end;

function TBPOS1Lib.Get_Track3: WideString;
begin
  Result := DefaultInterface.Track3;
end;

function TBPOS1Lib.Get_TrnStatus: Byte;
begin
  Result := DefaultInterface.TrnStatus;
end;

function TBPOS1Lib.Get_Currency: WideString;
begin
  Result := DefaultInterface.Currency;
end;

function TBPOS1Lib.Get_TrnBatchNum: LongWord;
begin
  Result := DefaultInterface.TrnBatchNum;
end;

function TBPOS1Lib.Get_RNK: WideString;
begin
  Result := DefaultInterface.RNK;
end;

function TBPOS1Lib.Get_CurrencyCode: WideString;
begin
  Result := DefaultInterface.CurrencyCode;
end;

function TBPOS1Lib.Get_AddData: WideString;
begin
  Result := DefaultInterface.AddData;
end;

function TBPOS1Lib.Get_TerminalInfo: WideString;
begin
  Result := DefaultInterface.TerminalInfo;
end;

function TBPOS1Lib.Get_DiscountName: WideString;
begin
  Result := DefaultInterface.DiscountName;
end;

function TBPOS1Lib.Get_DiscountAttribute: LongWord;
begin
  Result := DefaultInterface.DiscountAttribute;
end;

function TBPOS1Lib.Get_ECRDataTM: WideString;
begin
  Result := DefaultInterface.ECRDataTM;
end;

function TBPOS1Lib.Get_LibraryVersion: WideString;
begin
  Result := DefaultInterface.LibraryVersion;
end;

function TBPOS1Lib.Get_ScenarioData: WideString;
begin
  Result := DefaultInterface.ScenarioData;
end;

function TBPOS1Lib.Get_CompletionInvoiceNum: LongWord;
begin
  Result := DefaultInterface.CompletionInvoiceNum;
end;

function TBPOS1Lib.Get_FlagAcquirer: LongWord;
begin
  Result := DefaultInterface.FlagAcquirer;
end;

function TBPOS1Lib.Get_CryptedData: WideString;
begin
  Result := DefaultInterface.CryptedData;
end;

function TBPOS1Lib.Get_ExtraCardData: WideString;
begin
  Result := DefaultInterface.ExtraCardData;
end;

function TBPOS1Lib.Get_DataFile: OleVariant;
begin
  Result := DefaultInterface.DataFile;
end;

function TBPOS1Lib.Get_PanHash: WideString;
begin
  Result := DefaultInterface.PanHash;
end;

function TBPOS1Lib.Get_SlipPrinted: Byte;
begin
  Result := DefaultInterface.SlipPrinted;
end;

procedure TBPOS1Lib.CommOpen(bPort: Byte; lBaudRate: Integer);
begin
  DefaultInterface.CommOpen(bPort, lBaudRate);
end;

procedure TBPOS1Lib.CommOpenTCP(const bsIP: WideString; const bsPort: WideString);
begin
  DefaultInterface.CommOpenTCP(bsIP, bsPort);
end;

procedure TBPOS1Lib.CommOpenAuto(lBaudRate: Integer);
begin
  DefaultInterface.CommOpenAuto(lBaudRate);
end;

procedure TBPOS1Lib.CommClose;
begin
  DefaultInterface.CommClose;
end;

procedure TBPOS1Lib.Purchase(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte);
begin
  DefaultInterface.Purchase(ulAmount, ulAddAmount, bMerchIdx);
end;

procedure TBPOS1Lib.Refund(ulAmount: LongWord; ulAddAmount: LongWord; bMerchIdx: Byte; 
                           const bsRRN: WideString);
begin
  DefaultInterface.Refund(ulAmount, ulAddAmount, bMerchIdx, bsRRN);
end;

procedure TBPOS1Lib.Void(ulInvoiceNum: LongWord; bMerchIdx: Byte);
begin
  DefaultInterface.Void(ulInvoiceNum, bMerchIdx);
end;

procedure TBPOS1Lib.Settlement(bMerchIdx: Byte);
begin
  DefaultInterface.Settlement(bMerchIdx);
end;

procedure TBPOS1Lib.PrintBatchTotals(bMerchIdx: Byte);
begin
  DefaultInterface.PrintBatchTotals(bMerchIdx);
end;

procedure TBPOS1Lib.Confirm;
begin
  DefaultInterface.Confirm;
end;

procedure TBPOS1Lib.Cancel;
begin
  DefaultInterface.Cancel;
end;

procedure TBPOS1Lib.GetTxnNum;
begin
  DefaultInterface.GetTxnNum;
end;

procedure TBPOS1Lib.GetTxnDataByOrder(ulOrderNum: LongWord);
begin
  DefaultInterface.GetTxnDataByOrder(ulOrderNum);
end;

procedure TBPOS1Lib.GetTxnDataByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte);
begin
  DefaultInterface.GetTxnDataByInv(ulInvoiceNum, bMerchIdx);
end;

procedure TBPOS1Lib.GetBatchTotals(bMerchIdx: Byte);
begin
  DefaultInterface.GetBatchTotals(bMerchIdx);
end;

procedure TBPOS1Lib.CheckConnection(bMerchIdx: Byte);
begin
  DefaultInterface.CheckConnection(bMerchIdx);
end;

procedure TBPOS1Lib.PrintLastSettleCopy(bMerchIdx: Byte);
begin
  DefaultInterface.PrintLastSettleCopy(bMerchIdx);
end;

procedure TBPOS1Lib.PrintBatchJournal(bMerchIdx: Byte);
begin
  DefaultInterface.PrintBatchJournal(bMerchIdx);
end;

procedure TBPOS1Lib.ReqCurrReceipt;
begin
  DefaultInterface.ReqCurrReceipt;
end;

procedure TBPOS1Lib.ReqReceiptByInv(ulInvoiceNum: LongWord; bMerchIdx: Byte);
begin
  DefaultInterface.ReqReceiptByInv(ulInvoiceNum, bMerchIdx);
end;

procedure TBPOS1Lib.SetErrorLang(bErrLanguage: Byte);
begin
  DefaultInterface.SetErrorLang(bErrLanguage);
end;

procedure TBPOS1Lib.SetControlMode(isCtrlMode: WordBool);
begin
  DefaultInterface.SetControlMode(isCtrlMode);
end;

procedure TBPOS1Lib.ReadKey(bTimeOut: Byte);
begin
  DefaultInterface.ReadKey(bTimeOut);
end;

procedure TBPOS1Lib.DisplayText(bBeep: Byte);
begin
  DefaultInterface.DisplayText(bBeep);
end;

procedure TBPOS1Lib.SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte);
begin
  DefaultInterface.SetLine(bRow, bCol, bsText, bInvert);
end;

procedure TBPOS1Lib.ExchangeStatuses(bECRStatus: Byte);
begin
  DefaultInterface.ExchangeStatuses(bECRStatus);
end;

procedure TBPOS1Lib.Completion(bMerchIdx: Byte; ulAmount: LongWord; const bsRRN: WideString; 
                               ulInvoiceNum: LongWord);
begin
  DefaultInterface.Completion(bMerchIdx, ulAmount, bsRRN, ulInvoiceNum);
end;

procedure TBPOS1Lib.ReadCard;
begin
  DefaultInterface.ReadCard;
end;

procedure TBPOS1Lib.Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
begin
  DefaultInterface.Balance(bMerchIdx, bsCurrCode, bAccNumber);
end;

procedure TBPOS1Lib.Deposit(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                            bAccNumber: Byte);
begin
  DefaultInterface.Deposit(bMerchIdx, ulAmount, bsCurrCode, bAccNumber);
end;

procedure TBPOS1Lib.PurchaseService(bMerchIdx: Byte; ulAmount: LongWord; 
                                    const bsServiceParams: WideString);
begin
  DefaultInterface.PurchaseService(bMerchIdx, ulAmount, bsServiceParams);
end;

procedure TBPOS1Lib.IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
begin
  DefaultInterface.IdentifyCard(bMerchIdx, bsCurrCode, bAccNumber);
end;

procedure TBPOS1Lib.POSGetInfo;
begin
  DefaultInterface.POSGetInfo;
end;

procedure TBPOS1Lib.POSExTransaction;
begin
  DefaultInterface.POSExTransaction;
end;

procedure TBPOS1Lib.SelectApp(const bsAppName: WideString; ulAppIdx: LongWord);
begin
  DefaultInterface.SelectApp(bsAppName, ulAppIdx);
end;

procedure TBPOS1Lib.CloseApp;
begin
  DefaultInterface.CloseApp;
end;

procedure TBPOS1Lib.StartScenario(ulScenarioID: LongWord; const bsScenarioData: WideString);
begin
  DefaultInterface.StartScenario(ulScenarioID, bsScenarioData);
end;

procedure TBPOS1Lib.SetExtraPrintData(const bsExtraPrintData: WideString);
begin
  DefaultInterface.SetExtraPrintData(bsExtraPrintData);
end;

procedure TBPOS1Lib.useLogging(bLoggingLevel: Byte; const bsFilePath: WideString);
begin
  DefaultInterface.useLogging(bLoggingLevel, bsFilePath);
end;

procedure TBPOS1Lib.SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte);
begin
  DefaultInterface.SendFile(bsFullPath, bECRDataType, bECRCommand);
end;

procedure TBPOS1Lib.SetScreen(ulScreenNumber: LongWord);
begin
  DefaultInterface.SetScreen(ulScreenNumber);
end;

procedure TBPOS1Lib.CorrectTransaction(ulAmount: LongWord; ulAddAmount: LongWord);
begin
  DefaultInterface.CorrectTransaction(ulAmount, ulAddAmount);
end;

procedure TBPOS1Lib.SetExtraXmlData(const bsExtraXmlData: WideString);
begin
  DefaultInterface.SetExtraXmlData(bsExtraXmlData);
end;

procedure TBPOS1Lib.CashAdvance(bMerchIdx: Byte; ulAmount: LongWord; const bsCurrCode: WideString; 
                                bAccNumber: Byte);
begin
  DefaultInterface.CashAdvance(bMerchIdx, ulAmount, bsCurrCode, bAccNumber);
end;

procedure TBPOS1Lib.ReadBankCard;
begin
  DefaultInterface.ReadBankCard;
end;

procedure TBPOS1Lib.ReqDataFile;
begin
  DefaultInterface.ReqDataFile;
end;

procedure TBPOS1Lib.Ping;
begin
  DefaultInterface.Ping;
end;

procedure TBPOS1Lib.CheckTerminal;
begin
  DefaultInterface.CheckTerminal;
end;

procedure TBPOS1Lib.UseMac(macType: Byte; const bsKey: WideString);
begin
  DefaultInterface.UseMac(macType, bsKey);
end;

class function CoBPOS0Lib.Create: IBPOS0Lib;
begin
  Result := CreateComObject(CLASS_BPOS0Lib) as IBPOS0Lib;
end;

class function CoBPOS0Lib.CreateRemote(const MachineName: string): IBPOS0Lib;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BPOS0Lib) as IBPOS0Lib;
end;

procedure TBPOS0Lib.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7A6A9BFA-C73D-4575-8755-645DA60D77BF}';
    IntfIID:   '{8AEB6C5C-6FE9-48A5-8966-ACD1ED03FE18}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBPOS0Lib.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IBPOS0Lib;
  end;
end;

procedure TBPOS0Lib.ConnectTo(svrIntf: IBPOS0Lib);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBPOS0Lib.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBPOS0Lib.GetDefaultInterface: IBPOS0Lib;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TBPOS0Lib.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TBPOS0Lib.Destroy;
begin
  inherited Destroy;
end;

function TBPOS0Lib.Get_LastResult: Byte;
begin
  Result := DefaultInterface.LastResult;
end;

function TBPOS0Lib.Get_LastErrorCode: Byte;
begin
  Result := DefaultInterface.LastErrorCode;
end;

function TBPOS0Lib.Get_LastErrorDescription: WideString;
begin
  Result := DefaultInterface.LastErrorDescription;
end;

function TBPOS0Lib.Get_LastStatMsgCode: Byte;
begin
  Result := DefaultInterface.LastStatMsgCode;
end;

function TBPOS0Lib.Get_LastStatMsgDescription: WideString;
begin
  Result := DefaultInterface.LastStatMsgDescription;
end;

function TBPOS0Lib.Get_ResponseCode: Integer;
begin
  Result := DefaultInterface.ResponseCode;
end;

function TBPOS0Lib.Get_PAN: WideString;
begin
  Result := DefaultInterface.PAN;
end;

function TBPOS0Lib.Get_DateTime: WideString;
begin
  Result := DefaultInterface.DateTime;
end;

function TBPOS0Lib.Get_TerminalID: WideString;
begin
  Result := DefaultInterface.TerminalID;
end;

function TBPOS0Lib.Get_MerchantID: WideString;
begin
  Result := DefaultInterface.MerchantID;
end;

function TBPOS0Lib.Get_AuthCode: WideString;
begin
  Result := DefaultInterface.AuthCode;
end;

function TBPOS0Lib.Get_ExpDate: WideString;
begin
  Result := DefaultInterface.ExpDate;
end;

function TBPOS0Lib.Get_CardHolder: WideString;
begin
  Result := DefaultInterface.CardHolder;
end;

function TBPOS0Lib.Get_IssuerName: WideString;
begin
  Result := DefaultInterface.IssuerName;
end;

function TBPOS0Lib.Get_InvoiceNum: Integer;
begin
  Result := DefaultInterface.InvoiceNum;
end;

function TBPOS0Lib.Get_RRN: WideString;
begin
  Result := DefaultInterface.RRN;
end;

function TBPOS0Lib.Get_TotalsDebitAmt: Integer;
begin
  Result := DefaultInterface.TotalsDebitAmt;
end;

function TBPOS0Lib.Get_TotalsDebitNum: Integer;
begin
  Result := DefaultInterface.TotalsDebitNum;
end;

function TBPOS0Lib.Get_TotalsCreditAmt: Integer;
begin
  Result := DefaultInterface.TotalsCreditAmt;
end;

function TBPOS0Lib.Get_TotalsCreditNum: Integer;
begin
  Result := DefaultInterface.TotalsCreditNum;
end;

function TBPOS0Lib.Get_TotalsCancelledAmt: Integer;
begin
  Result := DefaultInterface.TotalsCancelledAmt;
end;

function TBPOS0Lib.Get_TotalsCancelledNum: Integer;
begin
  Result := DefaultInterface.TotalsCancelledNum;
end;

function TBPOS0Lib.Get_SignVerif: Byte;
begin
  Result := DefaultInterface.SignVerif;
end;

function TBPOS0Lib.Get_TxnNum: Integer;
begin
  Result := DefaultInterface.TxnNum;
end;

function TBPOS0Lib.Get_Amount: Integer;
begin
  Result := DefaultInterface.Amount;
end;

function TBPOS0Lib.Get_AddAmount: Integer;
begin
  Result := DefaultInterface.AddAmount;
end;

function TBPOS0Lib.Get_Receipt: WideString;
begin
  Result := DefaultInterface.Receipt;
end;

function TBPOS0Lib.Get_emvAID: WideString;
begin
  Result := DefaultInterface.emvAID;
end;

function TBPOS0Lib.Get_EntryMode: Byte;
begin
  Result := DefaultInterface.EntryMode;
end;

function TBPOS0Lib.Get_TxnType: Byte;
begin
  Result := DefaultInterface.TxnType;
end;

function TBPOS0Lib.Get_TermStatus: Byte;
begin
  Result := DefaultInterface.TermStatus;
end;

function TBPOS0Lib.Get_Key: Byte;
begin
  Result := DefaultInterface.Key;
end;

function TBPOS0Lib.Get_Track3: WideString;
begin
  Result := DefaultInterface.Track3;
end;

function TBPOS0Lib.Get_TrnStatus: Byte;
begin
  Result := DefaultInterface.TrnStatus;
end;

function TBPOS0Lib.Get_Currency: WideString;
begin
  Result := DefaultInterface.Currency;
end;

function TBPOS0Lib.Get_TrnBatchNum: Integer;
begin
  Result := DefaultInterface.TrnBatchNum;
end;

function TBPOS0Lib.Get_RNK: WideString;
begin
  Result := DefaultInterface.RNK;
end;

function TBPOS0Lib.Get_CurrencyCode: WideString;
begin
  Result := DefaultInterface.CurrencyCode;
end;

function TBPOS0Lib.Get_AddData: WideString;
begin
  Result := DefaultInterface.AddData;
end;

function TBPOS0Lib.Get_TerminalInfo: WideString;
begin
  Result := DefaultInterface.TerminalInfo;
end;

function TBPOS0Lib.Get_DiscountName: WideString;
begin
  Result := DefaultInterface.DiscountName;
end;

function TBPOS0Lib.Get_DiscountAttribute: Integer;
begin
  Result := DefaultInterface.DiscountAttribute;
end;

function TBPOS0Lib.Get_ECRDataTM: WideString;
begin
  Result := DefaultInterface.ECRDataTM;
end;

function TBPOS0Lib.Get_LibraryVersion: WideString;
begin
  Result := DefaultInterface.LibraryVersion;
end;

function TBPOS0Lib.Get_ScenarioData: WideString;
begin
  Result := DefaultInterface.ScenarioData;
end;

function TBPOS0Lib.Get_CompletionInvoiceNum: Integer;
begin
  Result := DefaultInterface.CompletionInvoiceNum;
end;

function TBPOS0Lib.Get_FlagAcquirer: Integer;
begin
  Result := DefaultInterface.FlagAcquirer;
end;

function TBPOS0Lib.Get_CryptedData: WideString;
begin
  Result := DefaultInterface.CryptedData;
end;

function TBPOS0Lib.Get_ExtraCardData: WideString;
begin
  Result := DefaultInterface.ExtraCardData;
end;

function TBPOS0Lib.Get_DataFile: OleVariant;
begin
  Result := DefaultInterface.DataFile;
end;

function TBPOS0Lib.Get_PanHash: WideString;
begin
  Result := DefaultInterface.PanHash;
end;

function TBPOS0Lib.Get_SlipPrinted: Byte;
begin
  Result := DefaultInterface.SlipPrinted;
end;

procedure TBPOS0Lib.CommOpen(bPort: Byte; lBaudRate: Integer);
begin
  DefaultInterface.CommOpen(bPort, lBaudRate);
end;

procedure TBPOS0Lib.CommOpenTCP(const bsIP: WideString; const bsPort: WideString);
begin
  DefaultInterface.CommOpenTCP(bsIP, bsPort);
end;

procedure TBPOS0Lib.CommOpenAuto(lBaudRate: Integer);
begin
  DefaultInterface.CommOpenAuto(lBaudRate);
end;

procedure TBPOS0Lib.CommClose;
begin
  DefaultInterface.CommClose;
end;

procedure TBPOS0Lib.Purchase(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte);
begin
  DefaultInterface.Purchase(ulAmount, ulAddAmount, bMerchIdx);
end;

procedure TBPOS0Lib.Refund(ulAmount: Integer; ulAddAmount: Integer; bMerchIdx: Byte; 
                           const bsRRN: WideString);
begin
  DefaultInterface.Refund(ulAmount, ulAddAmount, bMerchIdx, bsRRN);
end;

procedure TBPOS0Lib.Void(ulInvoiceNum: Integer; bMerchIdx: Byte);
begin
  DefaultInterface.Void(ulInvoiceNum, bMerchIdx);
end;

procedure TBPOS0Lib.Settlement(bMerchIdx: Byte);
begin
  DefaultInterface.Settlement(bMerchIdx);
end;

procedure TBPOS0Lib.PrintBatchTotals(bMerchIdx: Byte);
begin
  DefaultInterface.PrintBatchTotals(bMerchIdx);
end;

procedure TBPOS0Lib.Confirm;
begin
  DefaultInterface.Confirm;
end;

procedure TBPOS0Lib.Cancel;
begin
  DefaultInterface.Cancel;
end;

procedure TBPOS0Lib.GetTxnNum;
begin
  DefaultInterface.GetTxnNum;
end;

procedure TBPOS0Lib.GetTxnDataByOrder(ulOrderNum: Integer);
begin
  DefaultInterface.GetTxnDataByOrder(ulOrderNum);
end;

procedure TBPOS0Lib.GetTxnDataByInv(ulInvoiceNum: Integer; bMerchIdx: Byte);
begin
  DefaultInterface.GetTxnDataByInv(ulInvoiceNum, bMerchIdx);
end;

procedure TBPOS0Lib.GetBatchTotals(bMerchIdx: Byte);
begin
  DefaultInterface.GetBatchTotals(bMerchIdx);
end;

procedure TBPOS0Lib.CheckConnection(bMerchIdx: Byte);
begin
  DefaultInterface.CheckConnection(bMerchIdx);
end;

procedure TBPOS0Lib.PrintLastSettleCopy(bMerchIdx: Byte);
begin
  DefaultInterface.PrintLastSettleCopy(bMerchIdx);
end;

procedure TBPOS0Lib.PrintBatchJournal(bMerchIdx: Byte);
begin
  DefaultInterface.PrintBatchJournal(bMerchIdx);
end;

procedure TBPOS0Lib.ReqCurrReceipt;
begin
  DefaultInterface.ReqCurrReceipt;
end;

procedure TBPOS0Lib.ReqReceiptByInv(ulInvoiceNum: Integer; bMerchIdx: Byte);
begin
  DefaultInterface.ReqReceiptByInv(ulInvoiceNum, bMerchIdx);
end;

procedure TBPOS0Lib.SetErrorLang(bErrLanguage: Byte);
begin
  DefaultInterface.SetErrorLang(bErrLanguage);
end;

procedure TBPOS0Lib.SetControlMode(isCtrlMode: WordBool);
begin
  DefaultInterface.SetControlMode(isCtrlMode);
end;

procedure TBPOS0Lib.ReadKey(bTimeOut: Byte);
begin
  DefaultInterface.ReadKey(bTimeOut);
end;

procedure TBPOS0Lib.DisplayText(bBeep: Byte);
begin
  DefaultInterface.DisplayText(bBeep);
end;

procedure TBPOS0Lib.SetLine(bRow: Byte; bCol: Byte; const bsText: WideString; bInvert: Byte);
begin
  DefaultInterface.SetLine(bRow, bCol, bsText, bInvert);
end;

procedure TBPOS0Lib.ExchangeStatuses(bECRStatus: Byte);
begin
  DefaultInterface.ExchangeStatuses(bECRStatus);
end;

procedure TBPOS0Lib.Completion(bMerchIdx: Byte; ulAmount: Integer; const bsRRN: WideString; 
                               ulInvoiceNum: Integer);
begin
  DefaultInterface.Completion(bMerchIdx, ulAmount, bsRRN, ulInvoiceNum);
end;

procedure TBPOS0Lib.ReadCard;
begin
  DefaultInterface.ReadCard;
end;

procedure TBPOS0Lib.Balance(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
begin
  DefaultInterface.Balance(bMerchIdx, bsCurrCode, bAccNumber);
end;

procedure TBPOS0Lib.Deposit(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                            bAccNumber: Byte);
begin
  DefaultInterface.Deposit(bMerchIdx, ulAmount, bsCurrCode, bAccNumber);
end;

procedure TBPOS0Lib.PurchaseService(bMerchIdx: Byte; ulAmount: Integer; 
                                    const bsServiceParams: WideString);
begin
  DefaultInterface.PurchaseService(bMerchIdx, ulAmount, bsServiceParams);
end;

procedure TBPOS0Lib.IdentifyCard(bMerchIdx: Byte; const bsCurrCode: WideString; bAccNumber: Byte);
begin
  DefaultInterface.IdentifyCard(bMerchIdx, bsCurrCode, bAccNumber);
end;

procedure TBPOS0Lib.POSGetInfo;
begin
  DefaultInterface.POSGetInfo;
end;

procedure TBPOS0Lib.POSExTransaction;
begin
  DefaultInterface.POSExTransaction;
end;

procedure TBPOS0Lib.SelectApp(const bsAppName: WideString; ulAppIdx: Integer);
begin
  DefaultInterface.SelectApp(bsAppName, ulAppIdx);
end;

procedure TBPOS0Lib.CloseApp;
begin
  DefaultInterface.CloseApp;
end;

procedure TBPOS0Lib.StartScenario(ulScenarioID: Integer; const bsScenarioData: WideString);
begin
  DefaultInterface.StartScenario(ulScenarioID, bsScenarioData);
end;

procedure TBPOS0Lib.SetExtraPrintData(const bsExtraPrintData: WideString);
begin
  DefaultInterface.SetExtraPrintData(bsExtraPrintData);
end;

procedure TBPOS0Lib.useLogging(bLoggingLevel: Byte; const bsFilePath: WideString);
begin
  DefaultInterface.useLogging(bLoggingLevel, bsFilePath);
end;

procedure TBPOS0Lib.SendFile(const bsFullPath: WideString; bECRDataType: Byte; bECRCommand: Byte);
begin
  DefaultInterface.SendFile(bsFullPath, bECRDataType, bECRCommand);
end;

procedure TBPOS0Lib.SetScreen(ulScreenNumber: Integer);
begin
  DefaultInterface.SetScreen(ulScreenNumber);
end;

procedure TBPOS0Lib.CorrectTransaction(ulAmount: Integer; ulAddAmount: Integer);
begin
  DefaultInterface.CorrectTransaction(ulAmount, ulAddAmount);
end;

procedure TBPOS0Lib.SetExtraXmlData(const bsExtraXmlData: WideString);
begin
  DefaultInterface.SetExtraXmlData(bsExtraXmlData);
end;

procedure TBPOS0Lib.CashAdvance(bMerchIdx: Byte; ulAmount: Integer; const bsCurrCode: WideString; 
                                bAccNumber: Byte);
begin
  DefaultInterface.CashAdvance(bMerchIdx, ulAmount, bsCurrCode, bAccNumber);
end;

procedure TBPOS0Lib.ReadBankCard;
begin
  DefaultInterface.ReadBankCard;
end;

procedure TBPOS0Lib.ReqDataFile;
begin
  DefaultInterface.ReqDataFile;
end;

procedure TBPOS0Lib.Ping;
begin
  DefaultInterface.Ping;
end;

procedure TBPOS0Lib.CheckTerminal;
begin
  DefaultInterface.CheckTerminal;
end;

procedure TBPOS0Lib.UseMac(macType: Byte; const bsKey: WideString);
begin
  DefaultInterface.UseMac(macType, bsKey);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TBPOS1Lib, TBPOS0Lib]);
end;

end.
