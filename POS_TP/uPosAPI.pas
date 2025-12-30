unit uPosApi;

interface

uses
  Windows;
  
type
  POS_HANDLE = Pointer;

//-----------------------------------------------
const POS_NONE = Nil;

//** Available actions.
const ACTION_BREAK: integer      = $0001;
const ACTION_TEST: integer       = $0002;
const ACTION_STATUS: integer   	 = $0003;
const ACTION_REVISION: integer 	 = $0004;
const ACTION_HOST_ECHO_TEST: integer 	 = $0005;

const ACTION_CASH: integer       = $0101;
const ACTION_DEPOSIT: integer    = $0102;
const ACTION_PAYMENT: integer    = $0103;
const ACTION_REVERSAL: integer   = $0104;
const ACTION_RETURN: integer     = $0105;
const ACTION_PREAUTH: integer    = $0106;
const ACTION_COMPLETE: integer   = $0107;
const ACTION_PARTIAL_REVERSAL: integer = $0108;
const ACTION_CREDIT_VOUCHER: integer = $0109;
const ACTION_PAYMENT_WITH_CASH: integer = $0110;

const ACTION_BALANCE: integer    = $0201;
const ACTION_CLOSE_DAY: integer  = $0301;
const ACTION_REPORT: integer   	 = $0302;
const ACTION_COPY_RECEIPT: integer 		= $0303;
const ACTION_COPY_CLOSE_DAY: integer 	= $0304;
const ACTION_READ_CARD: integer  = $0305;
const ACTION_GET_VERIF_CODE: integer  = $0306;
const ACTION_CARD_VERIFICATION: integer  = $0307;
const ACTION_CHANGE_VERIF_CODE: integer  = $0308;

const ACTION_FUEL_PAYMENT: integer	= $0401;
const ACTION_FUEL_REVERSAL: integer	= $0402;
const ACTION_FUEL_RETURN: integer	= $0403;
const ACTION_FUEL_PIN_RETURN: integer = $0404;
const ACTION_FUEL_PREAUTH: integer	= $0405;
const ACTION_FUEL_COMPLETE: integer	= $0406;
const ACTION_FUEL_VOICE_AUTH: integer	= $0407;
const ACTION_FUEL_COUPON_PAYMENT: integer = $0408;
const ACTION_FUEL_COUPON_VOICE_AUTH: integer = $0409;

const ACTION_PRINT_DATA: integer	= $0500;
const ACTION_SHOW_QR_CODE: integer	= $0501;
const ACTION_SIGNATURE: integer	= $0502;

//** Available responses.
const RESP_ERROR	= $0000;
const RESP_BREAK        = $0001;
const RESP_TIMEOUT      = $0002;
const RESP_CONFIRM      = $0003;
const RESP_DECLINE      = $0004;
const RESP_MESSAGE      = $0005;
const RESP_INPUT        = $0006;
const RESP_IDENTIFIER   = $0007;
const RESP_KEEPALIVE	= $0008;
const RESP_WRONG_MAC	= $0009;

//** Available error codes. 
const ERR_NONE		= $0000;
const ERR_FAILURE	= $0001;

//** Available parameters.
const POS_AMOUNT: PAnsiChar         = 'amount';
const POS_CURRENCY: PAnsiChar       = 'currency';
const POS_PROFILE: PAnsiChar        = 'profile';
const POS_TRANS_ID: PAnsiChar       = 'receipt';
const POS_TRANS_CODE: PAnsiChar     = 'rrn';
const POS_TRANS_RECEIPT: PAnsiChar  = 'trans_rcpt';
const POS_TRANS_APPROVAL: PAnsiChar = 'approval';
const POS_TRANS_STATUS: PAnsiChar   = 'status';
const POS_TRANS_ACTION: PAnsiChar   = 'action';
const POS_TRANS_MSGCODE: PAnsiChar  = 'mtid';

const POS_DATE_TIME: PAnsiChar      = 'date_time';
const POS_CARD_PAN: PAnsiChar       = 'card_pan';
const POS_CARD_EXPIRY: PAnsiChar    = 'card_exp';
const POS_CARD_HOLDER: PAnsiChar    = 'card_holder';
const POS_CARD_TRACK1: PAnsiChar    = 'track1';
const POS_CARD_TRACK2: PAnsiChar    = 'track2';
const POS_CARD_TRACK3: PAnsiChar    = 'track3';
const POS_MSG_TITLE: PAnsiChar      = 'msg_title';
const POS_MSG_BODY: PAnsiChar       = 'msg_body';
const POS_MSG_BREAK: PAnsiChar      = 'msg_break';
const POS_PRINT: PAnsiChar          = 'print';
const POS_STATUS: PAnsiChar         = 'status_code';
const POS_REVISION_SIGN: PAnsiChar  = 'revision';
const POS_REPORT: PAnsiChar         = 'report';

const POS_GOODS_ID: PAnsiChar       = 'goods_id';
const POS_GOODS_NAME: PAnsiChar     = 'goods_name';
const POS_GOODS_QUANTITY: PAnsiChar = 'goods_quant';
const POS_GOODS_PRICE: PAnsiChar    = 'goods_price';
const POS_GOODS_AMOUNT: PAnsiChar   = 'goods_amount';
const POS_ADD_GOODS: PAnsiChar      = 'add_goods';

const POS_GOODS_RESP_CODE: PAnsiChar = 'goods_rcode';
const POS_GOODS_RESP_DATA: PAnsiChar = 'goods_rdata';

const POS_GOODS_DISCOUNT: PAnsiChar  = 'goods_discnt';
const POS_ORIG_AMOUNT: PAnsiChar     = 'orig_amount';
const POS_CARD_PAYMENT: PAnsiChar    = 'card_payment';

const POS_CARD_VERIF_CODE: PAnsiChar  = 'verif_code';
const POS_CARD_NEW_VERIF_CODE: PAnsiChar  = 'verif_ncode';
const POS_ENCRYPTION_SIGN: PAnsiChar  = 'encrypt_sign';

const POS_PRINT_DATA: PAnsiChar  = 'print_data';
const POS_CARD_ID_NUMBER: PAnsiChar  = 'card_id_nmb';

const POS_CARD_CVV2: PAnsiChar  = 'card_cvv2';
const POS_PRINT_RECEIPT: PAnsiChar  = 'prn_receipt';

const POS_BEFORE_PRINT: PAnsiChar  = 'before_prn';
const POS_CARD_LOYALTY_CODE: PAnsiChar = 'loyal_code';

const POS_CARD_PAN_SHA256: PAnsiChar  = 'pan_sha256';
const POS_TIPS: PAnsiChar = 'tips';
const POS_MERCHANT_ID: PAnsiChar = 'merchant_id';
const POS_TERMINAL_ID: PAnsiChar = 'terminal_id';

const POS_DATA: PAnsiChar = 'data';
const POS_TIMEOUT: PAnsiChar = 'timeout';
const POS_OPTION: PAnsiChar = 'option';

const POS_SOFT_VER: PAnsiChar = 'soft_ver';
const POS_BANK_ACQUIRER: PAnsiChar = 'bank_acquir';
const POS_CARD_PAYMENT_SYS: PAnsiChar = 'payment_sys';
const POS_TRANS_ACTION_NAME: PAnsiChar = 'action_name';
const POS_CLIENT_CHECK_TYPE: PAnsiChar = 'client_check';
const POS_CARD_EMV_AID: PAnsiChar = 'emv_aid';
const POS_CARD_CTLS_INFO: PAnsiChar = 'ctls_info';

const POS_DOCUMENT: PAnsiChar = 'document';
const POS_FONT_SIZE: PAnsiChar = 'fnt_size';
const POS_SIGNATURE: PAnsiChar = 'signature';

const POS_MAC_KEY: PAnsiChar = 'mac_key';
//const POS_MAC_KEY: PAnsiChar = 'cshbk_amount';

const POS_CARD_TYPE: PAnsiChar = 'card_type';
//-----------------------------------------------

const
  posapi  = 'posapi.dll';

function pos_open_with_timeout(var handle_p: POS_HANDLE; const name: PAnsiChar; const log: PAnsiChar; timeout: Integer): ByteBool;  cdecl; external posapi;
function pos_open(var handle_p: POS_HANDLE; const name: PAnsiChar; const log: PAnsiChar = Nil): ByteBool;  cdecl; external posapi;
function pos_close(var handle_p: POS_HANDLE): ByteBool; cdecl; external posapi;

function pos_send(handle: POS_HANDLE; action: Integer): ByteBool; cdecl; external posapi;
function pos_receive(handle: POS_HANDLE; timeout: Integer): Integer; cdecl; external posapi;

function pos_set(handle: POS_HANDLE; const param: PAnsiChar; const val: PAnsiChar): ByteBool; cdecl; external posapi;
function pos_get(handle: POS_HANDLE; const param: PAnsiChar; val: PAnsiChar; val_size: Integer): ByteBool; cdecl; external posapi;

function pos_get_first(handle: POS_HANDLE; param: PAnsiChar; param_size: Integer; val: PAnsiChar; val_size: Integer): ByteBool; cdecl; external posapi;
function pos_get_next(handle: POS_HANDLE; param: PAnsiChar; param_size: Integer; val: PAnsiChar; val_size: Integer): ByteBool;  cdecl; external posapi;

function pos_error(handle: POS_HANDLE): Integer;  cdecl; external posapi;

implementation

end.
