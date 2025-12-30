unit lpos_vfd_lcd;

// Описание функций экспортируемых из LPOS_VFD_LCD.dll

interface
Uses Windows;

Const
  ERROR_NO_ERROR		= 0;
  ERROR_FAILED			= 1;
	

  Function home_str():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function end_str():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function home_all():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function end_all():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function cursor_en():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function cursor_dis():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function moveXY(Offs_X, Offs_Y: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function owerwrite():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function horizontal():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function vertical():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function send_hex(hex_data:byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function clear_disp():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function send_char(char: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';

  Function send_str(str: Pointer; row, len: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';

  Function get_sym(bit_f: Pointer; font_val: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function load_sym(bit_f: Pointer; font_val: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function en_user_char():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function dis_user_char():integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function en_sym(font_val: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function dis_sym(font_val: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
  Function font_set(font_lo, font_hi, EEPROM_en: byte):integer; StdCall; External 'LPOS_VFD_LCD.dll';
implementation

end.
