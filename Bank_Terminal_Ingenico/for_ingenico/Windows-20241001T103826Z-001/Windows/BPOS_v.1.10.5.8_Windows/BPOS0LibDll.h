

class  CBPOS0LibDllI
{

public:
	virtual HRESULT(CommOpen)(BYTE bPort, LONG lBaudRate) = 0;
	virtual HRESULT(CommOpenTCP)(BSTR bsIP, BSTR bsPort) = 0;
	virtual HRESULT(CommOpenAuto)(LONG lBaudRate) = 0;
	virtual HRESULT(CommClose)(void) = 0;
	virtual HRESULT(Ping)(void) = 0;
	virtual HRESULT(CheckTerminal)(void) = 0;

	virtual HRESULT(Purchase)(LONG ulAmount, LONG ulAddAmount, BYTE bMerchIdx) = 0;
	virtual HRESULT(Refund)(LONG ulAmount, LONG ulAddAmount, BYTE bMerchIdx, BSTR bsRRN) = 0;
	virtual HRESULT(Void)(LONG ulInvoiceNum, BYTE bMerchIdx) = 0;
	virtual HRESULT(Settlement)(BYTE bMerchIdx) = 0;
	virtual HRESULT(PrintBatchTotals)(BYTE bMerchIdx) = 0;

	virtual HRESULT(Confirm)(void) = 0;
	virtual HRESULT(Cancel)(void) = 0;

	virtual HRESULT(GetTxnNum)(void) = 0;
	virtual HRESULT(GetTxnDataByOrder)(LONG ulOrderNum) = 0;
	virtual HRESULT(GetTxnDataByInv)(LONG ulInvoiceNum, BYTE bMerchIdx) = 0;
	virtual HRESULT(GetBatchTotals)(BYTE bMerchIdx) = 0;
	virtual HRESULT(CheckConnection)(BYTE bMerchIdx) = 0;
	virtual HRESULT(ReqCurrReceipt)(void) = 0;
	virtual HRESULT(ReqDataFile)(void) = 0;
	virtual HRESULT(PrintLastSettleCopy)(BYTE bMerchIdx) = 0;
	virtual HRESULT(PrintBatchJournal)(BYTE bMerchIdx) = 0;
	virtual HRESULT(ReqReceiptByInv)(LONG ulInvoiceNum, BYTE bMerchIdx) = 0;
	virtual HRESULT(SetErrorLang)(BYTE bErrLanguage) = 0;

	virtual HRESULT(SetControlMode)(VARIANT_BOOL isCtrlMode) = 0;
	virtual HRESULT(ReadKey)(BYTE bTimeOut) = 0;
	virtual HRESULT(DisplayText)(BYTE bBeep) = 0;
	virtual HRESULT(SetLine)(BYTE bRow, BYTE bCol, BSTR bsText, BYTE bInvert) = 0;
	virtual HRESULT(SetScreen)(LONG ulScreenNumber) = 0;
	virtual HRESULT(ExchangeStatuses)(BYTE bECRStatus) = 0;
	virtual HRESULT(Completion)(BYTE bMerchIdx, LONG ulAmount, BSTR bsRRN, LONG ulInvoiceNum) = 0;
	virtual HRESULT(ReadCard)(void) = 0;
	virtual HRESULT(ReadBankCard)(void) = 0;
	virtual HRESULT(Balance)(BYTE bMerchIdx, BSTR bsCurrCode, BYTE bAccNumber) = 0;
	virtual HRESULT(Deposit)(BYTE bMerchIdx, LONG ulAmount, BSTR bsCurrCode, BYTE bAccNumber) = 0;
	virtual HRESULT(CashAdvance)(BYTE bMerchIdx, LONG ulAmount, BSTR bsCurrCode, BYTE bAccNumber) = 0;
	virtual HRESULT(PurchaseService)(BYTE bMerchIdx, LONG ulAmount, BSTR bsServiceParams) = 0;
	virtual HRESULT(IdentifyCard)(BYTE bMerchIdx, BSTR bsCurrCode, BYTE bAccNumber) = 0;

	virtual HRESULT(SelectApp)(BSTR bsAppName, LONG ulAppIdx) = 0;
	virtual HRESULT(CloseApp)(void) = 0;
	virtual HRESULT(StartScenario)(LONG ulScenarioID, BSTR bsScenarioData) = 0;
	virtual HRESULT(SetExtraPrintData)(BSTR bsExtraPrintData) = 0;
	virtual HRESULT(SetExtraXmlData)(BSTR bsExtraXmlData) = 0;
	virtual HRESULT(SendFile)(BSTR bsFullPath, BYTE bECRDataType, BYTE bECRCommand) = 0;
	virtual HRESULT(CorrectTransaction)(LONG ulAmount, LONG ulAddAmount) = 0;

	virtual HRESULT(useLogging)(BYTE bLoggingLevel, BSTR bsFilePath) = 0;

	virtual HRESULT(get_LastResult)(BYTE* pVal) = 0;
	virtual HRESULT(get_LastErrorCode)(BYTE* pVal) = 0;
	virtual HRESULT(get_LastErrorDescription)(BSTR* pVal) = 0;
	virtual HRESULT(get_LastStatMsgCode)(BYTE* pVal) = 0;
	virtual HRESULT(get_LastStatMsgDescription)(BSTR* pVal) = 0;

	virtual HRESULT(get_ResponseCode)(LONG* pVal) = 0;
	virtual HRESULT(get_PAN)(BSTR* pVal) = 0;
	virtual HRESULT(get_DateTime)(BSTR* pVal) = 0;
	virtual HRESULT(get_TerminalID)(BSTR* pVal) = 0;
	virtual HRESULT(get_MerchantID)(BSTR* pVal) = 0;
	virtual HRESULT(get_AuthCode)(BSTR* pVal) = 0;
	virtual HRESULT(get_ExpDate)(BSTR* pVal) = 0;
	virtual HRESULT(get_CardHolder)(BSTR* pVal) = 0;
	virtual HRESULT(get_IssuerName)(BSTR* pVal) = 0;
	virtual HRESULT(get_InvoiceNum)(LONG* pVal) = 0;
	virtual HRESULT(get_RRN)(BSTR* pVal) = 0;
	virtual HRESULT(get_TotalsDebitAmt)(LONG* pVal) = 0;
	virtual HRESULT(get_TotalsDebitNum)(LONG* pVal) = 0;
	virtual HRESULT(get_TotalsCreditAmt)(LONG* pVal) = 0;
	virtual HRESULT(get_TotalsCreditNum)(LONG* pVal) = 0;
	virtual HRESULT(get_TotalsCancelledAmt)(LONG* pVal) = 0;
	virtual HRESULT(get_TotalsCancelledNum)(LONG* pVal) = 0;
	virtual HRESULT(get_SignVerif)(BYTE* pVal) = 0;
	virtual HRESULT(get_TxnNum)(LONG* pVal) = 0;
	virtual HRESULT(get_Amount)(LONG* pVal) = 0;
	virtual HRESULT(get_AddAmount)(LONG* pVal) = 0;
	virtual HRESULT(get_Receipt)(BSTR* pVal) = 0;
	virtual HRESULT(get_DataFile)(VARIANT* pVals) = 0;
	virtual HRESULT(get_emvAID)(BSTR* pVal) = 0;
	virtual HRESULT(get_EntryMode)(BYTE* pVal) = 0;
	virtual HRESULT(get_TxnType)(BYTE* pVal) = 0;
	virtual HRESULT(get_ScenarioData)(BSTR* pVal) = 0;

	virtual HRESULT(get_TermStatus)(BYTE* pVal) = 0;
	virtual HRESULT(get_Key)(BYTE* pVal) = 0;
	virtual HRESULT(get_Track3)(BSTR* pVal) = 0;
	virtual HRESULT(get_TrnStatus)(BYTE* pVal) = 0;

	virtual HRESULT(get_Currency)(BSTR* pVal) = 0;
	virtual HRESULT(get_TrnBatchNum)(LONG* pVal) = 0;
	virtual HRESULT(get_RNK)(BSTR* pVal) = 0;
	virtual HRESULT(get_CurrencyCode)(BSTR* pVal) = 0;
	virtual HRESULT(POSGetInfo)(void) = 0;
	virtual HRESULT(POSExTransaction)(void) = 0;
	virtual HRESULT(get_AddData)(BSTR* pVal) = 0;
	virtual HRESULT(get_TerminalInfo)(BSTR* pVal) = 0;
	virtual HRESULT(get_DiscountName)(BSTR* pVal) = 0;
	virtual HRESULT(get_DiscountAttribute)(LONG* pVal) = 0;
	virtual HRESULT(get_ECRDataTM)(BSTR* pVal) = 0;
	virtual HRESULT(get_LibraryVersion)(BSTR* pVal) = 0;
	virtual HRESULT(get_CompletionInvoiceNum)(LONG* pVal) = 0;
	virtual HRESULT(get_FlagAcquirer)(LONG* pVal) = 0;
	virtual HRESULT(get_CryptedData)(BSTR* pVal) = 0;
	virtual HRESULT(get_ExtraCardData)(BSTR* pVal) = 0;
	virtual HRESULT(get_PanHash)(BSTR* pVal) = 0;
	virtual HRESULT(get_SlipPrinted)(BYTE* pVal) = 0;
};