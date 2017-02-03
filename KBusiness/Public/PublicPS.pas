{ o(�s���t)o( ��o��?)2010-05-20  By  Zero  QQ:1348699188 (�s���t)

  `;-.          ___,
  `.`\_...._/`.-"`
  \        /      ,
  /()   () \    .' `-._
  |)  .    ()\  /   _.'
  \  -'-     ,; '. <
  ;.__     ,;|   > \
  / ,    / ,  |.-'.-'
  (_/    (_/ ,;|.<`
  \    ,     ;-`
  >   \    /
  (_,-'`> .'
  (_,'
}

unit PublicPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxNavigator, ToolWin, ComCtrls, ExtCtrls, DB, ADODB,
  OleDB, IOUtils, StrUtils, IdFTP, Clipbrd,
  cxDBNavigator, dxNavBar, XPMan, Menus, cxDBEdit, dxdbtree, cxDropdownEdit,
  DBCtrls, cxGrid, cxGridExportLink, IniFiles, ActiveX, WinSock,
  cxGridDBTableView, cxLookAndFeelPainters, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, DateUtils, cxTLExportLink,
  cxGridCustomTableView, cxGridTableView, cxGridDBBandedTableView, cxLookAndFeels,
  dxSkinsDefaultPainters, cxPC, dxBar, cxBarEditItem,
  cxDBLookupComboBox, AdoInt, StdCtrls, cxMRUEdit, cxDBRichEdit,
  ComObj, ADOConst, Registry, cxDBTL, cxTLData, cxButtonEdit, dxCustomTileControl, JPEG;

// (��o��)��(��o��)��(��o��)��(��o��)������( ��o��)��(��o��)��(��o��)��(��o��)��

// ��ȡ������һЩ��Ϣ ��IP��ַ����������
procedure GetLocalInfo();
// ��ʾ��Ϣ��
procedure ShowBox(Info: string);
// ��ʾ������Ϣ
procedure ShowWarn(Info: string);
// ��ʾ������Ϣ
procedure ShowError(Info: string);
// ���ϵͳʱ��
procedure GetServerTime;
// ��ʼ������������
procedure InitCbb(SqlStr: string; IniCbb: Tobject);
// ����������(cxGrid)�����������ļ�
procedure CxExport(cxgrd: TcxGrid; sTitle: string);
// ����������(cxDBTreeList)�����������ļ�
procedure CxTreeToFile(var cxDBTreeList: TcxDBTreeList; sTitle: string);
// �������������Ϣ
procedure GetConfig;
// ��ý���������Ϣ
procedure GetFMConfig;
// ����Ƥ�����
procedure SetSkinName(SkinName: string);
// ���ò˵����Ƿ���ʾ
procedure SetMenuShow;
// ���ɲ�����־
procedure SetLog(BillName, BillNo, ActionKind: string);
// ���ؼ���չ��
procedure tvExpand(tv: TdxDBTreeView; Ds: TDataSource; kField: string; lField: string; pField: string);
// ���ô����Ƿ�Ϊֻ��
procedure TextReadOnly(FM: TForm; bFlag: Boolean);
// ��������ϵ�����Ƿ�Ϊֻ��
procedure PanelReadOnly(Pnl: TPanel; bFlag: Boolean);
// ���������ϵ��ֶθ�����ɫ�趨�Ƿ�Ϊֻ��
procedure CxGridStyleReadOnly(cxgrdtbv: TcxGridDBTableView);
// ���ɶ�ѡ�ʽ�Ĵ���
procedure OpenFrom(FMName: TForm; TFMName: TFormClass);
// �رն�ѡ�ʽ�Ĵ���
procedure CloseFrom(FMName: TForm; TFMName: TFormClass);
// ��̬����ͼƬ
procedure LoadImg(FMName: TForm);
// �Զ������񲼾�
procedure CustomGrd(cxgrd: TcxGrid);
// �������񲼾�
procedure SaveGrd(FM: TForm; cxgrdtbv: TcxGridDBTableView);
// ������ͷ���񲼾�
procedure SaveBandGrd(FM: TForm; cxBandTbv: TcxGridDBBandedTableView);
// ��ȡ���񲼾��ļ�
procedure GetGrd(FM: TForm; cxgrdtbv: TcxGridDBTableView);
// ��ȡ���ͷ���񲼾��ļ�
procedure GetBandGrd(FM: TForm; cxBandTbv: TcxGridDBBandedTableView);
// ɾ�����񲼾��ļ�
procedure DelGrd(FM: TForm; cxgrdtbv: TcxGridDBTableView);
// ɾ�����ͷ���񲼾��ļ�
procedure DelBandGrd(FM: TForm; cxBandTbv: TcxGridDBBandedTableView);
// ����Ϊ��ѿ��
procedure FitGrd(cxTbv: TcxGridDBTableView);
//���Ƶ�Ԫ��
procedure CopyCellValue(cxgrdtbv: TcxGridDBTableView);
//ճ������
procedure CopyColumnValue(cxgrdtbv: TcxGridDBTableView);
// �����ֶθ�ֵ
procedure CalcField(qyHed, qyBase: TAdoquery; HedArr, BaseArr: array of string);
// ��Ʒ���ѡ��
procedure ItemKindSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
// �ֿ�ѡ��
procedure WareSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
// ����ѡ��
procedure ProTypeSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
// ��ɫѡ��
procedure ColorSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
// ��ȫѡ/��ѡ
procedure FindSelect(qyFind: TAdoquery; sField: string; bFlag: Boolean; iFlag: SmallInt);
// ��ȡ�������ڵķ���������\ʵ����(SQLServer2008��Ҫ���ָ�ʽ)
procedure GetServerName(Names: TStrings);
// ��ȡϵͳ����
procedure GetSysParam();
// �������ҳ����ʾ
procedure ShowTabSt(sFMId: string);
// ��Ʒѡ��
procedure SelectItem2(cxItem: TWinControl);
// ��Ʒѡ����ʽ
procedure SelectItem(cxItem: TWinControl; sParam: string = ''; sWhere: string = ''; iSelectKind: Integer = 2);
// ��Ӧ��ѡ��
procedure SelectPrv(cxPrv: TWinControl; dsTemp: TDataSource; FileName: string; iSelectKind: Integer);
// ��Ӧ��ѡ��2
procedure SelectPrv2(cxPrv: TWinControl);
// �ͻ�ѡ��
procedure SelectCust2(cxCust: TWinControl);
// ����ѡ��
procedure SelectDept2(cxDept: TWinControl);
// Ա��ѡ��
procedure SelectEmp2(cxEmp: TWinControl);
//��Ʒ���ѡ��
procedure SelectItemKind2(cxItemKind: TWinControl);
// ����ѡ��(Edt�ؼ�)
procedure SelectProTypeEdt(cxProType: TWinControl);
// ��ɫѡ��(Edt�ؼ�)
procedure SelectColorEdt(cxColor: TWinControl);

//�������ݸ���
procedure UpdateData(cxgrdtbv: TcxGridDBTableView; sField: string);
//Band�������ݸ���
procedure UpdateBandData(cxgrdbndtbv: TcxGridDBBandedTableView; sField: string);
//��EXCEL��������
procedure ImportFromExcel(sKind: string; DlgOpen: TOpenDialog);
//��ȡ�ֿ�Ȩ��
procedure GetWareRight;
//��״̬����ʾ��¼��
procedure ShowRecordCount(DataSet: TDataSet);
 //��״̬����������ѡ�������Sum��Avg
procedure ShowStatistics(cxgrdtbv: TcxGridDBTableView);
//cxGrid��ʾ���
procedure SetRowNumber(var ASender: TcxGridTableView; AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ACanvas: TcxCanvas; var ADone: boolean);
 //�����ݼ�
procedure OpenSQL(qyTemp: TAdoquery; SqlStr: string);
 //ִ��SQL���
procedure ExecSql(qyTemp: TAdoquery; SqlStr: string);
//ð����ʾ
procedure ShowHintMsg(Obj: Tobject; Str: string);
//����ͼƬ
procedure InsertImg(qyTemp: TAdoquery; ImgField: string);
//ȫ��ͼƬ
procedure FullImg(qyTemp: TAdoquery; ImgField: string);


// (��o��)��(��o��)��(��o��)��(��o��)������( ��o��)��(��o��)��(��o��)��(��o��)��

// ��ʾ�Ի���
function ShowDlg(Info: string): Boolean;
// �Զ������λ�ı����
function GetFiveNo(TableId, FieldName: string): string;
// �Զ����ǰ׺+����+��ŵı����
function GetTableNo(TableId, FieldName: string): string;
//���οؼ���ȡ�¼����
function GetTrvId(sTableId: string; InId: string; iFlag: Integer): string;
// �Զ����������+���
function GetItemId(KindCode: string): string;
// �����Ԥ����ӡ�����
function PrintReport(FileName: string; iPtFlag: Integer; iPtKind: Integer; dsHed: TDataSource): Boolean;
// ����1���������� 2������ʽ(Ԥ������ӡ�����) 3����������(FastReport��MachineReport) 4:��ʱds�ؼ������ݴ�ӡ����

// �򵥵ĵ���SQL���
function ExeSql(Str: string): Boolean;
// ���ƴ���� (ֻ��ת��һ�����֣�����ʹ��)
function GetPYCode(Str: string): string;
// ��ȡ�����������õ�
function CreateADOObject(const ClassID: TGUID): IUnknown;
// ��ȡ���������ݿ�ʵ����
function GetServerSLName(): string;
// �ж��Ƿ�ﵽ������
function HasGetMaxAudit(TableId: string; AuditFlag: Integer): Boolean;
// �������
function AuditBill(TableId, UserId, FMName, BillNo: string; qyHed: TAdoquery; iFlag: Integer): Boolean;
// ������
function OpenRecords(qyHed: TAdoquery; SqlStr: string): Boolean;
// �ж��Ƿ�������
function bHaveData(qyTemp: TAdoquery; sWhere: string): string;
// �ж��Ƿ��е��ݴ�Ȩ��
function HasShowRight(sTableId, UserId, sKind: string): string;
// �������ڻ�ø�ʽΪ   YYYYMM �����¸�ʽ
function GetYearMon(Dt: TDateTime): string;
// �жϱ���ĵ����Ƿ��Ѿ������
function CheckBillNoAudit(TableName, FileName, BillNo: string): Boolean;
// �жϵ������������·��Ƿ��½�
function CheckWareHasMonth(BillDate: TDateTime): Boolean;
//��Ŷ�ѡ
function GetMultiId(qyFind: TAdoquery; FileName: string): string;
//�ַ�������
function Encode(Str: string): string;
//�ַ�������
function Decode(Str: string): string;
//�жϲ���ϵͳ�汾
function GetSystemVer: WideString;
//������������һ���ַ���Ψһ���
function GetDateAutoNo(sTableId: string): string;
//��FTP���³���
function FtpUpdateExe: integer;


// ȫ�ֱ���
var

  LoginId: string; // ��½�߱��
  LoginName: string; // ��½������
  LoginPassWrod: string; // ��½������
  sUserPassWord: string; // ��½������  ����ini�� ���Ѿ����ܴ���
  LoginEmpId: string; // ��¼��Ա�����
  LoginEmpCode: string; // ��¼��Ա������
  LoginEmpName: string; // ��¼��Ա������
  LoginEmpDeptId: string; // ��¼��Ա�����ű��
  LoginEmpDeptName: string; // ��¼��Ա������

  ServerName: string; // ����������
  DataUserName: string; // ���ݿ��¼�û���
  DataUserPwd: string; // ���ݿ��¼����
  CWZtNo: string; // ���׺�(�����ݿ�����)
  CWZtName: string; // ��������(���ݿ����)
  DataBaseName: string; // ���ݿ�����
  ConStr: string; // ���ݿ�������Ϣ
  MachineNo: string;
  RegNo: string;
  FTime: string;

  bRecordPwd: Boolean; //�Ƿ��ס��¼����
  bAutoLogin: Boolean; //�Ƿ���Զ���¼

  sLocalIP: string; // ����IP��ַ
  sComputerName: string; // ��������
  sVer, sNewVer: string; //����汾��

  sFTPHost: string; //FTP������IP
  sFTPPort: string; //FTP�������˿ں�
  sFTPUserName: string; //FTP�������û���
  sFTPPassWord: string; //FTP����������
  sFTPDir: string; //FTP������Ŀ¼

  SysDateTime: TDateTime; // ϵͳʱ��
  UseEndDate: TDateTime; // ����ʱ��

  SkinName: string; // Ƥ������
  bMenuShow: Boolean; // �Ƿ���ʾ���߲˵�
  bNavBarCollapsed: Boolean; // �Ƿ�չ��������

  iReportFlag: Integer; // �������� 1��FastReport;2 MachinReport;
  sReportName: string; // ��������
  bLogin: Boolean; // ��½��־
  sGridNoDataInfoText: string; //������������ʾ��ˮӡ

  bCanClose: Boolean; // �Ƿ���Թرմ���

  //��������
  sCoName, sCoShortName, sCoAddress, sCoTel, sCoFax, sCoQQ: string; //��˾���� (����̧ͷ) ����ַ���绰�����桢QQ
  iQPageSize, iNumPoint, iPricePoint, iMoneyPoint: Integer; // ��ѯÿҳ��ʾ��¼�� ���������ۡ�������λ��
  iTaxRate: Double; // ˰��

  sProductInRfKind, sSaleOutRfKind, sProMode, sMatOutMode: string; //��Ʒ��ⵥ��������,���۳��ⵥ�������� ,����ģʽ,�ֿⷢ��ģʽ

  bMRPMakeRequire: Boolean; //������������Ƿ������빺��
  bStockInAutoInvoice, bSaleOutAutoInvoice: Boolean; //  �ɹ���⸴���Զ�����,���۳��⸴���Զ�����

  sWareStartMon, sStockStartMon, sSaleStartMon, sCWStartMon, sCNStartMon: string; // ��������
  WareRight: string; //�ֿ�Ȩ��
  bPayToCN: Boolean; //�˿����Զ����ɳ��ɵ�

  FRDtS, FRDtE: string; //��ӡ�����еĿ�ʼ���ںͽ������ڱ���

const
  CLSID_SQLOLEDB_ENUMERATOR: TGUID = '{DFA22B8E-E68D-11d0-97E4-00C04FC2AD98}';

  XorKey: array[0..7] of Byte = ($A3, $15, $BA, $55, $70, $6D, $44, $16); //�ַ���������

implementation

uses DataPS, RegPS, RegSetPS, LoginPS, MainPS, BasePS, ReportPS, ItemKindQPS,
  WareQPS, RequirePS, SaleOrderPS, ProTypeQPS, StockInPS, ProductInPS, OtherInPS,
  MatOutPS, ProductOutPS, OtherOutPS, SaleOutPS, SaleSenderPS, ItemBomPS, ItemQPS,
  StockOrderPS, PrvQPS, EmpQPS, CustQPS, WareCheckPS, AssistMovePS, ColorQPS, DeptQPS;

procedure GetLocalInfo();
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of AnsiChar;
  i: Integer;
  GInitData: TWSAData;

  pComputerName: pChar;
  ComputerNameLen: longword;
begin
  try
    // ��ȡIP��ַ
    WSAStartup($101, GInitData);
    sLocalIP := '';
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(Buffer);
    if phe = nil then
      Exit;
    pptr := PaPInAddr(phe^.h_addr_list);
    i := 0;
    while pptr^[i] <> nil do
    begin
      sLocalIP := inet_ntoa(pptr^[i]^);
      Inc(i);
    end;
    WSACleanup;
    // ��ȡ�������
    ComputerNameLen := 255;
    GetMem(pComputerName, ComputerNameLen);
    if not GetComputerName(pComputerName, ComputerNameLen) then
      pComputerName := 'No Computer Name ';
    sComputerName := pComputerName;

  finally
    FreeMem(pComputerName);
  end;
end;

procedure ShowBox(Info: string);
begin
  Application.MessageBox(pChar(Info), '����������ϵͳ', MB_OK + MB_ICONINFORMATION);
end;

procedure ShowWarn(Info: string);
begin
  Application.MessageBox(pChar(Info), '����������ϵͳ', MB_OK + MB_ICONWARNING);
end;


procedure ShowError(Info: string);
begin
  Application.MessageBox(pChar(Info), '����������ϵͳ', MB_OK + MB_ICONSTOP);
end;

procedure GetServerTime;
begin
  try
    with DataFM.qyTemp do
    begin
      if Active then
        Close;
      sql.Clear;
      sql.Text := 'select getdate()';
      open;
      SysDateTime := (Fields[0].AsDateTime);
    end;
  finally
    DataFM.qyTemp.Close;
  end;
end;

procedure InitCbb(SqlStr: string; IniCbb: Tobject);
begin
  try
    if IniCbb is TcxComboBox then
      TcxComboBox(IniCbb).Properties.Items.Clear
    else if IniCbb is TcxDBComboBox then
      TcxDBComboBox(IniCbb).Properties.Items.Clear
    else if IniCbb is TcxMRUEdit then
      TcxMRUEdit(IniCbb).Properties.LookupItems.Clear
    else if IniCbb is TcxDBMRUEdit then
      TcxDBMRUEdit(IniCbb).Properties.LookupItems.Clear
    else if IniCbb is TcxGridDBColumn then
    begin
      (TcxGridDBColumn(IniCbb).Properties as TcxComboBoxProperties).Items.Clear;
    end;
    with DataFM.qyTemp do
    begin
      if Active then Close;
      sql.Clear;
      sql.Text := SqlStr;
      open;
      First;
      if IniCbb is TcxComboBox then
      begin
        TcxComboBox(IniCbb).Properties.Items.Add('');
        while not eof do
        begin
          TcxComboBox(IniCbb).Properties.Items.Add(Fields[0].AsString);
          Next;
        end;
      end
      else if IniCbb is TcxDBComboBox then
      begin
        TcxDBComboBox(IniCbb).Properties.Items.Add('');
        while not eof do
        begin
          TcxDBComboBox(IniCbb).Properties.Items.Add(Fields[0].AsString);
          Next;
        end;
      end
      else if IniCbb is TcxMRUEdit then
      begin
        TcxMRUEdit(IniCbb).Properties.LookupItems.Add('');
        while not eof do
        begin
          TcxMRUEdit(IniCbb).Properties.LookupItems.Add(Fields[0].AsString);
          Next;
        end;
      end
      else if IniCbb is TcxDBMRUEdit then
      begin
        TcxDBMRUEdit(IniCbb).Properties.LookupItems.Add('');
        while not eof do
        begin
          TcxDBMRUEdit(IniCbb).Properties.LookupItems.Add(Fields[0].AsString);
          Next;
        end;
      end
      else if IniCbb is TcxGridDBColumn then
      begin
        (TcxGridDBColumn(IniCbb).Properties as TcxComboBoxProperties).Items.Add('');
        while not eof do
        begin
          (TcxGridDBColumn(IniCbb).Properties as TcxComboBoxProperties).Items.Add(Fields[0].AsString);
          Next;
        end;
      end;
    end;
  finally
    DataFM.qyTemp.Close;
  end;
end;

procedure CxExport(cxgrd: TcxGrid; sTitle: string);
var
  FileName: string;
begin
  try
    DataFM.DlgSave1.FileName := sTitle + FormatDateTime('YYYY-MM-DD', SysDateTime);
    if not DataFM.DlgSave1.Execute then
      Exit
    else
    begin
      FileName := DataFM.DlgSave1.FileName;

      case DataFM.DlgSave1.FilterIndex of
        1:
          begin
            ExportGridToExcel(FileName, cxgrd, true, true, true, 'xls');
          end;
        2:
          begin
            ExportGridToText(FileName, cxgrd, true, true, '', '', '', 'txt');
          end;
        3:
          begin
            ExportGridToXML(FileName, cxgrd, true, true, 'xml');
          end;
        4:
          begin
            ExportGridToHTML(FileName, cxgrd, true, true, 'html');
          end;
      else
        begin
          ShowBox('����ʧ�ܣ�');
          Exit;
        end;
      end;
      ShowBox('�����ɹ���');
    end;
  except
  end;
end;

procedure CxTreeToFile(var cxDBTreeList: TcxDBTreeList; sTitle: string);
var
  FileName: string;
begin
  try
    DataFM.DlgSave1.FileName := sTitle + FormatDateTime('YYYY-MM-DD', SysDateTime);
    if not DataFM.DlgSave1.Execute then
      Exit
    else
    begin
      FileName := DataFM.DlgSave1.FileName;

      case DataFM.DlgSave1.FilterIndex of
        1:
          begin
            cxExportTLToEXCEL(FileName, cxDBTreeList, true, true, true, 'xls');
          end;
        2:
          begin
            cxExportTLToText(FileName, cxDBTreeList, true, true, '', '', '', 'txt');
          end;
        3:
          begin
            cxExportTLToXML(FileName, cxDBTreeList, true, true, 'xml');
          end;
        4:
          begin
            cxExportTLToHTML(FileName, cxDBTreeList, true, true, 'html');
          end;
      else
        begin
          ShowBox('����ʧ�ܣ�');
          Exit;
        end;
      end;
      ShowBox('�����ɹ���');
    end;
  except
  end;
end;

procedure GetConfig;
var
  ConIni: TIniFile;
  ConFile: string;
begin
  try
    ConFile := ExtractFilePath(Application.ExeName) + 'Config.ini';
    ConIni := TIniFile.Create(ConFile);
    // ������������ļ�
    if not fileexists(ConFile) then
    begin
      ConIni.WriteString('����', 'Data Source', '');
      ConIni.WriteString('����', 'User Id', '');
      ConIni.WriteString('����', 'PassWord', '');
      ConIni.WriteString('����', 'Initial Catalog', '');
      ConIni.WriteString('����', 'LoginId', '');
      ConIni.WriteString('����', 'CWZtNo', '');
      ConIni.WriteString('����', 'CWZtName', '');
      ConIni.WriteBool('����', 'bRecordPwd', false);
      ConIni.WriteBool('����', 'bAutoLogin', false);
      ConIni.WriteString('����', 'UserPassWord', '');
    end;

    ServerName := ConIni.ReadString('����', 'Data Source', '');
    DataUserName := ConIni.ReadString('����', 'User ID', '');
    DataUserPwd := Decode(ConIni.ReadString('����', 'Password', ''));
    CWZtNo := ConIni.ReadString('����', 'CWZtNo', '');
    CWZtName := ConIni.ReadString('����', 'CWZtName', '');
    DataBaseName := ConIni.ReadString('����', 'Initial Catalog', '');
    LoginId := ConIni.ReadString('����', 'LoginId', '');
    bRecordPwd := ConIni.ReadBool('����', 'bRecordPwd', false);
    bAutoLogin := ConIni.ReadBool('����', 'bAutoLogin', false);
    sUserPassWord := Decode(ConIni.ReadString('����', 'UserPassWord', ''));

    ConStr := '';
    ConStr := 'Provider=SQLOLEDB.1;Persist Security Info=true;' + 'User Id=' + DataUserName + ';' + 'Data Source=' + ServerName +
      ';' + 'Initial Catalog=' + CWZtNo + ';' + 'PassWord=' + DataUserPwd + ';';
  except
  end;
end;

procedure GetFMConfig;
var
  LayOutIni: TIniFile;
  LayOutFile, LocalFile: string;
begin
  LayOutFile := ExtractFilePath(Application.ExeName) + 'Config\LayOut.ini';
  LocalFile := trim(ExtractFilePath(Application.ExeName) + '\Config\DevLocal.ini');
  LayOutIni := TIniFile.Create(LayOutFile);

  if not fileexists(LayOutFile) then
  begin
    LayOutIni.WriteString('����', 'Ƥ������', '');
    LayOutIni.WriteBool('����', '�˵���ʾ', true);
  end;

  SkinName := LayOutIni.ReadString('����', 'Ƥ������', '');
  bMenuShow := LayOutIni.ReadBool('����', '�˵���ʾ', true);
  bNavBarCollapsed := LayOutIni.ReadBool('����', '��������', true);
 { if not fileexists(LocalFile) then
  begin
    ShowBox('���������ļ�������');
  end;
  // ��ú����ļ�
  if fileexists(LocalFile) then
  begin
    MainFM.cxLocalizer.LoadFromFile(LocalFile);
    if GetSystemVer = 'Windows 7' then
      MainFM.cxLocalizer.Language := '����(���壬�й�)'
    else
      MainFM.cxLocalizer.Language := '����(�й�)';
    MainFM.cxLocalizer.Active := true;
  end;  }
  //�µļ���Ƥ��
  MainFM.skinCtl.NativeStyle := False;
  MainFM.skinCtl.UseSkins := true;
  MainFM.skinCtl.SkinName := SkinName;
  MainFM.Ribbon.ColorSchemeName := SkinName;

{  if SkinName <> 'Office2010Blue' then // �����Ĭ��Ƥ��(Blue)�򲻴�Ƥ����Դ�ļ����أ���Ϊ��dxNavBar������
  begin
    // ����Ƥ���ļ�
    dxSkinsUserSkinLoadFromFile(trim(ExtractFilePath(Application.ExeName)) + '\Skins\' + SkinName + '.skinres');
    // Ҫ����dxSkinsDefaultPainters��Ԫ
    MainFM.skinCtl.NativeStyle := False;
    MainFM.skinCtl.UseSkins := true;
    MainFM.skinCtl.SkinName := 'UserSkin'; // ����ط�������UserSkin,��Ȼ����������
    MainFM.Ribbon.ColorSchemeName := 'UserSkin';
  end;   }
  MainFM.Ribbon.ShowTabGroups := bMenuShow;
end;

procedure SetSkinName(SkinName: string);
var
  SkinIni: TIniFile;
begin
  try
   { if SkinName = 'Blue' then // �����Ĭ��Ƥ��(Blue)�򲻴�Ƥ����Դ�ļ����أ���Ϊ��dxNavBar������
    begin
      MainFM.skinCtl.NativeStyle := False;
      MainFM.skinCtl.UseSkins := true;
      MainFM.skinCtl.SkinName := 'Blue';
      MainFM.Ribbon.ColorSchemeName := 'Blue';

      // д��ini�ļ���
      SkinIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config\LayOut.ini');
      SkinIni.WriteString('����', 'Ƥ������', SkinName);
    end
    else  }
    if SkinName = '��' then
    begin
      MainFM.skinCtl.UseSkins := false;
      // д��ini�ļ���
      SkinIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config\LayOut.ini');
      SkinIni.WriteString('����', 'Ƥ������', SkinName);
    end
    else
    begin
      dxSkinsUserSkinLoadFromFile(trim(ExtractFilePath(Application.ExeName)) + '\Skins\' + SkinName + '.skinres');
      MainFM.skinCtl.NativeStyle := False;
      MainFM.skinCtl.UseSkins := true;
      MainFM.skinCtl.SkinName := 'UserSkin';
      MainFM.Ribbon.ColorSchemeName := 'UserSkin';
      // д��ini�ļ���
      SkinIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config\LayOut.ini');
      SkinIni.WriteString('����', 'Ƥ������', SkinName);
    end;
  except
  end;
end;

procedure SetMenuShow;
var
  ConfigIni: TIniFile;
begin
  try
    MainFM.Ribbon.ShowTabGroups := not MainFM.Ribbon.ShowTabGroups;
    ConfigIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config\LayOut.ini');
    ConfigIni.WriteBool('����', '�˵���ʾ', MainFM.Ribbon.ShowTabGroups);
  except
  end;
end;

procedure SetLog(BillName, BillNo, ActionKind: string);
begin
  try
    GetServerTime;
    ExeSql('Insert into SysLogTB(BillName,BillNo,ActionEmpId,ActionEmpName,ActionKind,ActionDate,IPAddress,ComputerName) ' +
      ' Values(' + QuotedStr(BillName) + ',' + QuotedStr(BillNo) + ',' + QuotedStr(LoginEmpId) + ',' + QuotedStr(LoginEmpName) +
      ',' + QuotedStr(ActionKind) + ',' + QuotedStr(FormatDatetime('yyyy-mm-dd  hh:nn:ss', SysDateTime)) + ',' +
      QuotedStr(sLocalIP) + ',' + QuotedStr(sComputerName) + ')');
  except
    on E: Exception do
    begin
      ShowError('���ɲ�����־����:' + E.Message);
    end;
  end;
end;

procedure tvExpand(tv: TdxDBTreeView; Ds: TDataSource; kField: string; lField: string; pField: string);
begin
  try
    tv.KeyField := '';
    tv.ListField := '';
    tv.ParentField := '';
    tv.DataSource := nil;
    tv.DataSource := Ds;
    tv.KeyField := kField;
    tv.ListField := lField;
    tv.ParentField := pField;
    Ds.DataSet.Active := true;
    tv.FullExpand;
  except
    ShowBox('����������ʧ�ܣ�');
  end
end;

procedure TextReadOnly(FM: TForm; bFlag: Boolean);
var
  i: Integer;
begin
  for i := FM.ComponentCount - 1 downto 0 do
  begin
    if (FM.Components[i] is TcxGridDBTableView) then
    begin
      // ���´�����Ϊ�������״̬�¿��Ը���ճ�����ݣ����ڸ��õ�Ԫ��˫���͸�������
      { TcxGridDBTableView(FM.Components[i]).OptionsData.Editing := true;
        for j := 0 to TcxGridDBTableView(FM.Components[i]).ColumnCount - 1 do
        begin
        if TcxGridDBTableView(FM.Components[i]).Columns[j].PropertiesClassName <> '' then
        begin
        if bFlag then
        TcxGridDBTableView(FM.Components[i]).Columns[j].Options.Editing := bFlag
        else
        TcxGridDBTableView(FM.Components[i]).Columns[j].Options.Editing := not bFlag;
        TcxGridDBTableView(FM.Components[i]).Columns[j].Properties.ReadOnly := bFlag;
        end
        else
        begin
        TcxGridDBTableView(FM.Components[i]).Columns[j].Options.Editing := not bFlag;
        //TcxGridDBTableView(FM.Components[i]).Columns[j].Properties.ReadOnly := bFlag;
        end;
        end; }
      TcxGridDBTableView(FM.Components[i]).OptionsData.Editing := not bFlag;
      CxGridStyleReadOnly(TcxGridDBTableView(FM.Components[i]));
      Continue;
    end;
    if (FM.Components[i] is TcxGridDBBandedTableView) then
    begin
      TcxGridDBBandedTableView(FM.Components[i]).OptionsData.Editing := not bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBTreeList) then
    begin
      TcxDBTreeList(FM.Components[i]).OptionsData.Editing := not bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBTextEdit) then
    begin
      TcxDBTextEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBDateEdit) then
    begin
      TcxDBDateEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBButtonEdit) then
    begin
      TcxDBButtonEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBCheckBox) then
    begin
      TcxDBCheckBox(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBComboBox) then
    begin
      TcxDBComboBox(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBMemo) then
    begin
      TcxDBMemo(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBPopupEdit) then
    begin
      TcxDBPopupEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBLookupComboBox) then
    begin
      TcxDBLookupComboBox(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBMRUEdit) then
    begin
      TcxDBMRUEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBRichEdit) then
    begin
      TcxDBRichEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBRadioGroup) then
    begin
      TcxDBRadioGroup(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBSpinEdit) then
    begin
      TcxDBSpinEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBImageComboBox) then
    begin
      TcxDBImageComboBox(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (FM.Components[i] is TcxDBCurrencyEdit) then
    begin
      TcxDBCurrencyEdit(FM.Components[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
  end;
end;

procedure PanelReadOnly(Pnl: TPanel; bFlag: Boolean);
var
  i: Integer;
begin
  for i := Pnl.ControlCount - 1 downto 0 do
  begin
    if (Pnl.Controls[i] is TcxDBTreeList) then
    begin
      TcxDBTreeList(Pnl.Controls[i]).OptionsData.Editing := not bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBTextEdit) then
    begin
      TcxDBTextEdit(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBDateEdit) then
    begin
      TcxDBDateEdit(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBButtonEdit) then
    begin
      TcxDBButtonEdit(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBCheckBox) then
    begin
      TcxDBCheckBox(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBComboBox) then
    begin
      TcxDBComboBox(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBMemo) then
    begin
      TcxDBMemo(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBLookupComboBox) then
    begin
      TcxDBLookupComboBox(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBMRUEdit) then
    begin
      TcxDBMRUEdit(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBRadioGroup) then
    begin
      TcxDBRadioGroup(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
    if (Pnl.Controls[i] is TcxDBSpinEdit) then
    begin
      TcxDBSpinEdit(Pnl.Controls[i]).Properties.ReadOnly := bFlag;
      Continue;
    end;
  end;
end;

procedure CxGridStyleReadOnly(cxgrdtbv: TcxGridDBTableView);
var i: Integer;
begin
  for i := 0 to cxgrdtbv.ColumnCount - 1 do
  begin
    if cxgrdtbv.Columns[i].Styles.Content = DataFM.cxStyNoEdit then
      cxgrdtbv.Columns[i].Options.Editing := False
    else
      cxgrdtbv.Columns[i].Options.Editing := true;
  end;
end;

procedure OpenFrom(FMName: TForm; TFMName: TFormClass);
var
  iPNo, iPCount, i: Integer;
  FormExist: Boolean;
  TabSt: TcxTabSheet;
begin
  FormExist := False;
  TabSt := TcxTabSheet.Create(Application);
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i].ClassType = TFMName then // �жϴ������
      FormExist := true;
  end;
  if not FormExist then
  begin
    iPCount := MainFM.cxPgcMain.PageCount;
    FMName := TFMName.Create(TabSt);
    TabSt.PageControl := MainFM.cxPgcMain;
    TabSt.Caption := FMName.Caption;
    TabSt.Hint := TFMName.ClassName;
    MainFM.cxPgcMain.Pages[iPCount].Show;
    TWinControl(FMName).Parent := MainFM.cxPgcMain.Pages[iPCount];
    FMName.Align := alClient;
    FMName.Show;
  end
  else
  begin
    for iPNo := MainFM.cxPgcMain.PageCount - 1 downto 0 do
    begin
      if MainFM.cxPgcMain.Pages[iPNo].Hint = TFMName.ClassName then
      begin
        MainFM.cxPgcMain.Pages[iPNo].Show;
        break;
      end
    end;
  end;
end;

procedure CloseFrom(FMName: TForm; TFMName: TFormClass);
var
  iPNo: Integer;
begin
  if not bCanClose then Exit;
  FMName.Close;
  for iPNo := MainFM.cxPgcMain.PageCount - 1 downto 0 do
  begin
    if MainFM.cxPgcMain.Pages[iPNo].Hint = TFMName.ClassName then
    begin
      MainFM.cxPgcMain.Pages[iPNo].Free;
      break;
    end;
  end;
end;



procedure LoadImg(FMName: TForm);
var
  i, Tag: Integer;
begin
  try
    for i := FMName.ComponentCount - 1 downto 0 do
    begin
      if (FMName.Components[i] is TImage) and
        fileexists(ExtractFilePath(ParamStr(0)) + 'Image\' + intToStr(TImage(FMName.Components[i]).Tag) + '.png') then
        TImage(FMName.Components[i]).Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Image\' +
          intToStr(TImage(FMName.Components[i]).Tag) + '.png');
    end;
  except
  end;
end;

procedure CustomGrd(cxgrd: TcxGrid);
begin
  with TcxCustomGridTableController(cxgrd.FocusedView.Controller) do
  begin
    Customization := true;
    // CustomizationForm.AlphaBlendValue := 200;
    // CustomizationForm.AlphaBlend := True;
  end;
end;

procedure SaveGrd(FM: TForm; cxgrdtbv: TcxGridDBTableView);
var
  IniFileName: string;
begin
  try
    IniFileName := ExtractFilePath(Application.ExeName) + 'Layout\' + FM.Name + cxgrdtbv.Name + '.ini';
    if not FileExists(ExtractFileDir(IniFileName), true) then
      CreateDir(ExtractFileDir(IniFileName));
    cxgrdtbv.StoreToIniFile(IniFileName);
    {//�ж���������
    if cxgrd.FocusedView.Controller.GridView.ClassType = TcxGridDBTableView then
      TcxGridDBTableView(cxgrd.FocusedView.Controller).StoreToIniFile(IniFileName);
    if cxgrd.FocusedView.Controller.GridView.ClassType = TcxGridDBBandedTableView then
      TcxGridDBBandedTableView(cxgrd.FocusedView.Controller).StoreToIniFile(IniFileName); }
  except
  end;
end;

procedure SaveBandGrd(FM: TForm; cxBandTbv: TcxGridDBBandedTableView);
var
  IniFileName: string;
begin
  try
    IniFileName := ExtractFilePath(Application.ExeName) + 'Layout\' + FM.Name + cxBandTbv.Name + '.ini';
    if not FileExists(ExtractFileDir(IniFileName), true) then
      CreateDir(ExtractFileDir(IniFileName));
    cxBandTbv.StoreToIniFile(IniFileName);
  except
  end;
end;

procedure GetGrd(FM: TForm; cxgrdtbv: TcxGridDBTableView);
var
  FilterFile, IniFileName: string;
begin
  try
    // FilterFile:=ExtractFilePath(Application.ExeName) + '\Layout\'  + '���˷���.flt';
    IniFileName := ExtractFilePath(Application.ExeName) + '\Layout\' + FM.Name + cxgrdtbv.Name + '.ini';
    if fileexists(IniFileName) then
    begin
      cxgrdtbv.RestoreFromIniFile(IniFileName) // �Ӳ����ļ��лָ�
    end;
  except
  end;
end;

procedure GetBandGrd(FM: TForm; cxBandTbv: TcxGridDBBandedTableView);
var
  FilterFile, IniFileName: string;
begin
  try
    IniFileName := ExtractFilePath(Application.ExeName) + '\Layout\' + FM.Name + cxBandTbv.Name + '.ini';
    if fileexists(IniFileName) then
    begin
      cxBandTbv.RestoreFromIniFile(IniFileName) // �Ӳ����ļ��лָ�
    end;
  except
  end;
end;

procedure DelGrd(FM: TForm; cxgrdtbv: TcxGridDBTableView);
var
  IniFileName: string;
begin
  try
    IniFileName := ExtractFilePath(Application.ExeName) + '\Layout\' + FM.Name + cxgrdtbv.Name + '.ini';
    if fileexists(IniFileName) then
      DeleteFile(IniFileName);
  except
  end;
end;

procedure DelBandGrd(FM: TForm; cxBandTbv: TcxGridDBBandedTableView);
var
  IniFileName: string;
begin
  try
    IniFileName := ExtractFilePath(Application.ExeName) + '\Layout\' + FM.Name + cxBandTbv.Name + '.ini';
    if fileexists(IniFileName) then
      DeleteFile(IniFileName);
  except
  end;
end;

procedure FitGrd(cxTbv: TcxGridDBTableView);
var
  i: Integer;
begin
  cxTbv.BeginUpdate;
  for i := 0 to cxTbv.ItemCount - 1 do
    cxTbv.Items[i].ApplyBestFit; // ����Ϊ��ѿ��
  cxTbv.EndUpdate;
end;

procedure CopyCellValue(cxgrdtbv: TcxGridDBTableView);
var
  j, k: Integer;
begin
  try
    k := cxgrdtbv.Controller.FocusedItem.Index;
    j := cxgrdtbv.Controller.FocusedRow.Index;
    Clipboard.AsText := trim(cxgrdtbv.DataController.GetRowValue(cxgrdtbv.DataController.GetRowInfo(j), k));
  except
    on E: Exception do
    begin
      if pos('Null', E.Message) > 0 then
      begin
        ShowError('��ֵ���踴��');
        Exit;
      end;
    end;
  end;
end;

procedure CopyColumnValue(cxgrdtbv: TcxGridDBTableView);
var iRec, i, j: Integer;
  CopyValue: variant;
  sField: string;
  qyTemp: TAdoQuery;
begin
  try
    qyTemp := TAdoQuery(cxgrdtbv.DataController.DataSource.DataSet);
    if qyTemp.RecordCount <= 0 then Exit;
    i := cxgrdtbv.Controller.FocusedItem.Index;
    j := cxgrdtbv.Controller.FocusedRow.Index;
    CopyValue := trim(cxgrdtbv.DataController.GetRowValue(cxgrdtbv.DataController.GetRowInfo(j), i));
    if CopyValue = null then Exit;

    //����������޸��в���ճ������
    if not TcxGridDBColumn(cxgrdtbv.Controller.FocusedColumn).Options.Editing then Exit;

    sField := TcxGridDBColumn(cxgrdtbv.Controller.FocusedColumn).DataBinding.FieldName;

    for iRec := qyTemp.RecNo to qyTemp.RecordCount do
    begin
      if qyTemp.State = dsBrowse then qyTemp.Edit;
      qyTemp.FieldByName(sField).Value := CopyValue;
      if TcxGridDBColumn(cxgrdtbv.Controller.FocusedColumn).PropertiesClassName <> '' then
      begin
        if Assigned(TcxGridDBColumn(cxgrdtbv.Controller.FocusedColumn).Properties.OnValidate) then
          UpdateData(cxgrdtbv, sField);
      end;
      qyTemp.Next;
    end;
  except
  end;
end;

procedure CalcField(qyHed, qyBase: TAdoquery; HedArr, BaseArr: array of string);
var
  i: Integer;
begin
  if not qyBase.Active then
    qyBase.open;
  qyBase.Requery();
  { qyBase.UpdateCursorPos;
    qyBase.Recordset.Resync(AdAffectcurrent, AdResyncAllValues);
    qyBase.Resync([]); }
  if qyBase.Locate(BaseArr[0], qyHed.FieldByName(HedArr[0]).AsString, []) then
  begin
    for i := 1 to Length(HedArr) - 1 do
      qyHed.FieldByName(HedArr[i]).Value := qyBase.FieldByName(BaseArr[i]).Value;
  end;
end;

procedure ItemKindSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
begin
  try
    if bFlag = False then
      Exit;
    try
      ItemKindQFM := TItemKindQFM.Create(nil);
      ItemKindQFM.ShowModal;
      if qyHed.State = dsBrowse then
        qyHed.Edit;
      qyHed.FieldByName(sField).AsString := ItemKindQFM.sId;
    finally
      ItemKindQFM.Free;
      ItemKindQFM := nil;
    end;
  except
  end;
end;



procedure WareSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
begin
  try
    if bFlag = False then Exit;
    try
      WareQFM := TWareQFM.Create(nil);
      WareQFM.iSelectKind := iFlag;
      WareQFM.ShowModal;
      if qyHed.State = dsBrowse then qyHed.Edit;
      if WareQFM.iFlag <> 3 then
        qyHed.FieldByName(sField).AsString := WareQFM.sId;
    finally
      WareQFM.Free;
      WareQFM := nil;
    end;
  except
  end;
end;

procedure ProTypeSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
begin
  try
    if bFlag = False then Exit;
    try
      ProTypeQFM := TProTypeQFM.Create(nil);
      ProTypeQFM.iSelectKind := iFlag;
      ProTypeQFM.ShowModal;
      if qyHed.State = dsBrowse then qyHed.Edit;
      if ProTypeQFM.iFlag <> 3 then
        qyHed.FieldByName(sField).AsString := ProTypeQFM.sName;
    finally
      ProTypeQFM.Free;
      ProTypeQFM := nil;
    end;
  except
  end;
end;

procedure ColorSelect(bFlag: Boolean; qyHed: TAdoquery; sField: string; iFlag: SmallInt);
begin
  try
    if bFlag = False then Exit;
    try
      ColorQFM := TColorQFM.Create(nil);
      ColorQFM.iSelectKind := iFlag;
      ColorQFM.ShowModal;
      if qyHed.State = dsBrowse then qyHed.Edit;
      if ColorQFM.iFlag <> 3 then
        qyHed.FieldByName(sField).AsString := ColorQFM.sName;
    finally
      ColorQFM.Free;
      ColorQFM := nil;
    end;
  except
  end;
end;

procedure FindSelect(qyFind: TAdoquery; sField: string; bFlag: Boolean; iFlag: SmallInt);
var
  i: Integer;
begin
  qyFind.First;
  for i := 0 to qyFind.RecordCount - 1 do
  begin
    if qyFind.State = dsBrowse then qyFind.Edit;
    qyFind.FieldByName(sField).AsBoolean := bFlag;
    qyFind.Next
  end;
end;

procedure GetServerName(Names: TStrings);
var
  RSCon: ADORecordsetConstruction;
  Rowset: IRowset;
  SourcesRowset: ISourcesRowset;
  SourcesRecordset: _Recordset;
  SourcesName, SourcesType: TField;
begin
  SourcesRecordset := CreateADOObject(CLASS_Recordset) as _Recordset;
  RSCon := SourcesRecordset as ADORecordsetConstruction;
  SourcesRowset := CreateComObject(CLSID_SQLOLEDB_ENUMERATOR) as ISourcesRowset;
  OleCheck(SourcesRowset.GetSourcesRowset(nil, IRowset, 0, nil, IUnknown(Rowset)));
  RSCon.Rowset := Rowset;
  with TADODataSet.Create(nil) do
  try
    Recordset := SourcesRecordset;
    First;
    SourcesName := FieldByName('SOURCES_NAME'); { do not localize }
    SourcesType := FieldByName('SOURCES_TYPE'); { do not localize }
    Names.BeginUpdate;
    try
      while not eof do
      begin
        if SourcesType.AsInteger = DBSOURCETYPE_DATASOURCE then
          Names.Add(SourcesName.AsString);
          //Names.Add(SourcesName.AsString + '\' + GetServerSLName());
        Next;
      end;
    finally
      Names.EndUpdate;
    end;
  finally
    Free;
  end;
end;

procedure GetSysParam();
begin
  with DataFM.qyTemp do
  begin
    if Active then Close;
    sql.Clear;
    sql.Add('select * from SysParamTB');
    open;
    if not eof then
    begin
      iQPageSize := FieldByName('iQPageSize').AsInteger;
      iNumPoint := FieldByName('iNumPoint').AsInteger;
      iPricePoint := FieldByName('iPricePoint').AsInteger;
      iMoneyPoint := FieldByName('iMoneyPoint').AsInteger;
      iTaxRate := FieldByName('iTaxRate').AsFloat;

      sWareStartMon := FieldByName('WareStartMon').AsString;
      sStockStartMon := FieldByName('StockStartMon').AsString;
      sSaleStartMon := FieldByName('SaleStartMon').AsString;
      sCWStartMon := FieldByName('CWStartMon').AsString;
      sCNStartMon := FieldByName('CNStartMon').AsString;

      sNewVer := FieldByName('sVer').AsString;
      UseEndDate := FieldByName('UseEndDate').AsDateTime;

      sFTPHost := FieldByName('sFTPHost').AsString;
      sFTPPort := FieldByName('sFTPPort').AsString;
      sFTPUserName := FieldByName('sFTPUserName').AsString;
      sFTPPassWord := FieldByName('sFTPPassWord').AsString;
      sFTPDir := FieldByName('sFTPDir').AsString;

      sCoName := FieldByName('CoName').AsString;
      sCoShortName := FieldByName('CoShortName').AsString;
      //���������ˮӡ
      if FieldByName('CoShortName').AsString <> '' then
        sGridNoDataInfoText := FieldByName('CoShortName').AsString
      else
        sGridNoDataInfoText := '������';
      sCoAddress := FieldByName('CoAddress').AsString;
      sCoTel := FieldByName('CoTel').AsString;
      sCoFax := FieldByName('CoFax').AsString;
      sCoQQ := FieldByName('CoQQ').AsString;

      sProductInRfKind := FieldByName('ProductInRfKind').AsString;
      sSaleOutRfKind := FieldByName('SaleOutRfKind').AsString;
      bStockInAutoInvoice := FieldByName('StockInAutoInvoice').AsBoolean;
      bSaleOutAutoInvoice := FieldByName('SaleOutAutoInvoice').AsBoolean;
      bMRPMakeRequire := FieldByName('bMRPMakeRequire').AsBoolean;
      sProMode := FieldByName('ProMode').AsString;
      sMatOutMode := FieldByName('MatOutMode').AsString;
      bPayToCN := FieldByName('bPayToCN').AsBoolean;
    end;
  end;
end;

procedure ShowTabSt(sFMId: string);
var
  iPNo: Integer;
begin
  for iPNo := MainFM.cxPgcMain.PageCount - 1 downto 0 do
  begin
    if MainFM.cxPgcMain.Pages[iPNo].Hint = sFMId then
    begin
      MainFM.cxPgcMain.Pages[iPNo].Show;
      break;
    end;
  end;
end;



procedure SelectItem2(cxItem: TWinControl);
begin
  try
    ItemQFM := TItemQFM.Create(nil);
    ItemQFM.iSelectKind := 2;
    ItemQFM.ShowModal;
    if cxItem is TcxButtonEdit then
    begin
      TcxButtonEdit(cxItem).Properties.LookupItems.Text := ItemQFM.sId;
      TcxButtonEdit(cxItem).Text := ItemQFM.sName;
      TcxButtonEdit(cxItem).Hint := ItemQFM.sId + '  ' + ItemQFM.sName;
    end;
  finally
    ItemQFM.Free;
    ItemQFM := nil;
  end;
end;

procedure SelectItem(cxItem: TWinControl; sParam: string = ''; sWhere: string = ''; iSelectKind: Integer = 2);
begin
  try
    ItemQFM := TItemQFM.Create(nil);
    ItemQFM.iSelectKind := iSelectKind;
    ItemQFM.sParam := sParam;
    ItemQFM.ShowModal;
    if cxItem is TcxButtonEdit then
    begin
      TcxButtonEdit(cxItem).Properties.LookupItems.Text := ItemQFM.sId;
      TcxButtonEdit(cxItem).Text := ItemQFM.sName;
      TcxButtonEdit(cxItem).Hint := ItemQFM.sId + '  ' + ItemQFM.sName;
    end;
  finally
    ItemQFM.Free;
    ItemQFM := nil;
  end;
end;

procedure SelectPrv(cxPrv: TWinControl; dsTemp: TDataSource; FileName: string; iSelectKind: Integer);
begin
  try
    PrvQFM := TPrvQFM.Create(nil);
    PrvQFM.iSelectKind := 2;
    PrvQFM.dsDet := dsTemp;
    // PrvQFM.cxName := cxPrv;
    // PrvQFM.FileName := FileName;
    PrvQFM.ShowModal;
  finally
    PrvQFM.Free;
    PrvQFM := nil;
  end;
end;

procedure SelectPrv2(cxPrv: TWinControl);
begin
  try
    PrvQFM := TPrvQFM.Create(nil);
    PrvQFM.iSelectKind := 2;
    PrvQFM.ShowModal;
    if cxPrv is TcxButtonEdit then
    begin
      TcxButtonEdit(cxPrv).Properties.LookupItems.Text := PrvQFM.sId;
      TcxButtonEdit(cxPrv).Text := PrvQFM.sName;
      TcxButtonEdit(cxPrv).Hint := PrvQFM.sId + '  ' + PrvQFM.sName;
    end;
  finally
    PrvQFM.Free;
    PrvQFM := nil;
  end;
end;

procedure SelectCust2(cxCust: TWinControl);
begin
  try
    CustQFM := TCustQFM.Create(nil);
    CustQFM.iSelectKind := 2;
    CustQFM.ShowModal;
    if cxCust is TcxButtonEdit then
    begin
      TcxButtonEdit(cxCust).Properties.LookupItems.Text := CustQFM.sId;
      TcxButtonEdit(cxCust).Text := CustQFM.sName;
      TcxButtonEdit(cxCust).Hint := CustQFM.sId + '  ' + CustQFM.sName;
    end;
  finally
    CustQFM.Free;
    CustQFM := nil;
  end;
end;

procedure SelectDept2(cxDept: TWinControl);
begin
  try
    DeptQFM := TDeptQFM.Create(nil);
    DeptQFM.iSelectKind := 2;
    DeptQFM.ShowModal;
    if cxDept is TcxButtonEdit then
    begin
      TcxButtonEdit(cxDept).Properties.LookupItems.Text := DeptQFM.sId;
      TcxButtonEdit(cxDept).Text := DeptQFM.sName;
      TcxButtonEdit(cxDept).Hint := DeptQFM.sId + '  ' + DeptQFM.sName;
    end;
  finally
    DeptQFM.Free;
    DeptQFM := nil;
  end;
end;

procedure SelectEmp2(cxEmp: TWinControl);
begin
  try
    EmpQFM := TEmpQFM.Create(nil);
    EmpQFM.iSelectKind := 2;
    EmpQFM.ShowModal;
    if cxEmp is TcxButtonEdit then
    begin
      TcxButtonEdit(cxEmp).Properties.LookupItems.Text := EmpQFM.sId;
      TcxButtonEdit(cxEmp).Text := EmpQFM.sName;
      TcxButtonEdit(cxEmp).Hint := EmpQFM.sId + '  ' + EmpQFM.sName;
    end;
  finally
    EmpQFM.Free;
    EmpQFM := nil;
  end;
end;

procedure SelectItemKind2(cxItemKind: TWinControl);
begin
  try
    ItemKindQFM := TItemKindQFM.Create(nil);
    ItemKindQFM.iSelectKind := 2;
    ItemKindQFM.ShowModal;
    if cxItemKind is TcxButtonEdit then
    begin
      TcxButtonEdit(cxItemKind).Properties.LookupItems.Text := ItemKindQFM.sId;
      TcxButtonEdit(cxItemKind).Text := ItemKindQFM.sName;
      TcxButtonEdit(cxItemKind).Hint := ItemKindQFM.sId + '  ' + ItemKindQFM.sName;
    end;
  finally
    ItemKindQFM.Free;
    ItemKindQFM := nil;
  end;
end;

procedure SelectProTypeEdt(cxProType: TWinControl);
begin
  try
    try
      ProTypeQFM := TProTypeQFM.Create(nil);
      ProTypeQFM.iSelectKind := 2;
      ProTypeQFM.ShowModal;
      if ProTypeQFM.iFlag <> 3 then
      begin
        TcxButtonEdit(cxProType).Properties.LookupItems.Text := ProTypeQFM.sId;
        TcxButtonEdit(cxProType).Text := ProTypeQFM.sName;
        TcxButtonEdit(cxProType).Hint := ProTypeQFM.sId + '  ' + ProTypeQFM.sName;
      end;
    finally
      ProTypeQFM.Free;
      ProTypeQFM := nil;
    end;
  except
  end;
end;

procedure SelectColorEdt(cxColor: TWinControl);
begin
  try
    try
      ColorQFM := TColorQFM.Create(nil);
      ColorQFM.iSelectKind := 2;
      ColorQFM.ShowModal;
      if ColorQFM.iFlag <> 3 then
      begin
        TcxButtonEdit(cxColor).Properties.LookupItems.Text := ColorQFM.sId;
        TcxButtonEdit(cxColor).Text := ColorQFM.sName;
        TcxButtonEdit(cxColor).Hint := ColorQFM.sId + '  ' + ColorQFM.sName;
      end;
    finally
      ColorQFM.Free;
      ColorQFM := nil;
    end;
  except
  end;
end;

procedure UpdateData(cxgrdtbv: TcxGridDBTableView; sField: string);
var
  DisplayValue: Variant;
  ErrorText: TCaption;
  Error: Boolean;
begin
  try
    DisplayValue := cxgrdtbv.DataController.DataSource.DataSet.FieldByName(sField).Value;
    Error := False;
    if Assigned(cxgrdtbv.GetColumnByFieldName(sField).Properties.OnValidate) then
      cxgrdtbv.GetColumnByFieldName(sField).Properties.OnValidate(cxgrdtbv, DisplayValue, ErrorText, Error);
  except
  end;
end;

procedure UpdateBandData(cxgrdbndtbv: TcxGridDBBandedTableView; sField: string);
var
  DisplayValue: Variant;
  ErrorText: TCaption;
  Error: Boolean;
begin
  try
    DisplayValue := cxgrdbndtbv.DataController.DataSource.DataSet.FieldByName(sField).Value;
    Error := False;
    if Assigned(cxgrdbndtbv.GetColumnByFieldName(sField).Properties.OnValidate) then
      cxgrdbndtbv.GetColumnByFieldName(sField).Properties.OnValidate(cxgrdbndtbv, DisplayValue, ErrorText, Error);
  except
  end;
end;

procedure ImportFromExcel(sKind: string; DlgOpen: TOpenDialog);
begin
  try
    if DlgOpen.Execute then
    begin
      with DataFM.qyTemp do
      begin
        if Active then Close;
        sql.Clear;
        sql.Add(' exec prImportFromExcel ' + QuotedStr(sKind) + ',' + QuotedStr(ExtractFilePath(DlgOpen.Filename) + ExtractFileName(DlgOpen.Filename)));
        ExecSQL;
      end;
      ShowBox(' ����ɹ�!');
    end;
  except
    on E: Exception do
      ShowError(E.Message);
    //ShowError(' ����ʧ��!');
  end;
end;

procedure GetWareRight;
var
  i: Integer;
begin
  WareRight := '';
  with DataFM.qyTemp do
  begin
    if Active then Close;
    sql.Clear;
    sql.Add('select * from WareEmpTB where EmpId=' + QuotedStr(LoginEmpId));
    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
      WareRight := WareRight + DataFM.qyTemp.FieldByName('WareId').AsString + ',';
      Next;
    end;
  end;
  if WareRight <> '' then
    WareRight := LeftStr(WareRight, Length(WareRight) - 1); //ȥ�����һ��','
end;

procedure ShowRecordCount(DataSet: TDataSet);
begin
  MainFM.dxStausBar.Panels[2].Text := '�ܼ�¼: ' + IntToStr(DataSet.RecordCount) + ' ��';
end;

procedure ShowStatistics(cxgrdtbv: TcxGridDBTableView);
var
  I, J, ASum: Integer;
  iRows, iColums: Integer;
  val: Variant;
  sRows, sColumns, sSum, sAvg, sCells: string;
begin
  iRows := 1;
  iColums := 0;
  sRows := FormatFloat('0', cxgrdtbv.Controller.SelectedRowCount);
  sColumns := FormatFloat('0', cxgrdtbv.Controller.SelectedColumnCount);
  sCells := FormatFloat('0', cxgrdtbv.Controller.SelectedRowCount * cxgrdtbv.Controller.SelectedColumnCount);
  ASum := 0;
  for I := 0 to cxgrdtbv.Controller.SelectedColumnCount - 1 do
  begin
    if (cxgrdtbv.Controller.SelectedColumns[I].DataBinding.ValueType = 'Integer')
      or (cxgrdtbv.Controller.SelectedColumns[I].DataBinding.ValueType = 'FMTBcd')
      or (cxgrdtbv.Controller.SelectedColumns[I].DataBinding.ValueType = 'Float') then
    begin
      iColums := iColums + 1;
      for J := 0 to cxgrdtbv.Controller.SelectedRowCount - 1 do
      begin
        val := cxgrdtbv.DataController.GetValue(cxgrdtbv.Controller.SelectedRows[J].RecordIndex, cxgrdtbv.Controller.SelectedColumns[I].Index);
        if not VarIsNull(val) then
          Inc(ASum, Integer(val));
      end;
    end;
  end;
  sSum := FormatFloat('0.0', ASum);
  if cxgrdtbv.Controller.SelectedRowCount * iColums > 0 then
    sAvg := FormatFloat('0.0', ASum / (cxgrdtbv.Controller.SelectedRowCount * iColums));
  MainFM.dxStausBar.Panels[3].Text := 'ѡ�м�¼: �ܺ�: ' + sSum + ' ƽ��:' + sAvg;
end;

procedure SetRowNumber(var ASender: TcxGridTableView; AViewInfo:
  TcxCustomGridIndicatorItemViewInfo;
  var ACanvas: TcxCanvas; var ADone: boolean);
var
  AIndicatorViewInfo: TcxGridIndicatorRowItemViewInfo;
  ATextRect: TRect;
  AFont: TFont;
  AFontTextColor, AColor: TColor;
begin
  AFont := ACanvas.Font;
  AColor := clBtnFace;
  AFontTextColor := clWindowText;
  if (AViewInfo is TcxGridIndicatorHeaderItemViewInfo) then
  begin
    ATextRect := AViewInfo.Bounds;
    InflateRect(ATextRect, -1, -1);

    ASender.LookAndFeelPainter.DrawHeader(ACanvas, AViewInfo.Bounds,
      ATextRect, [], cxBordersAll, cxbsNormal, taCenter, vaCenter,
      False, False, '���', AFont, AFontTextColor, AColor);
    ADone := True;
  end;
  if not (AViewInfo is TcxGridIndicatorRowItemViewInfo) then
    Exit;
  ATextRect := AViewInfo.ContentBounds;
  AIndicatorViewInfo := AViewInfo as TcxGridIndicatorRowItemViewInfo;
  InflateRect(ATextRect, -1, -1);

  if AIndicatorViewInfo.GridRecord.Selected then
    AFont.Style := ACanvas.Font.Style + [fsBold]
  else
    AFont.Style := ACanvas.Font.Style - [fsBold];

  ASender.LookAndFeelPainter.DrawHeader(ACanvas, AViewInfo.ContentBounds,
    ATextRect, [], [bBottom, bLeft, bRight], cxbsNormal, taCenter, vaCenter,
    False, False, IntToStr(AIndicatorViewInfo.GridRecord.Index + 1),
    AFont, AFontTextColor, AColor);
  ADone := True;
//  ASender.LookAndFeelPainter.DrawIndicatorImage(ACanvas, ATextRect,
//    AIndicatorViewInfo.IndicatorKind);
end;

procedure OpenSQL(qyTemp: TAdoquery; SqlStr: string);
begin
  try
    if qyTemp.Active then
      qyTemp.Close;
    qyTemp.sql.Clear;
    qyTemp.sql.Add(SqlStr);
    qyTemp.open;
  except
    on E: Exception do
    begin
      ShowWarn('ִ��SQL������:' + E.Message);
    end;
  end;
end;

procedure ExecSql(qyTemp: TAdoquery; SqlStr: string);
begin
  try
    if qyTemp.Active then qyTemp.Close;
    qyTemp.sql.Clear;
    qyTemp.sql.Add(SqlStr);
    qyTemp.ExecSQL;
  except
    on E: Exception do
    begin
      ShowWarn('ִ��SQL������:' + E.Message);
    end;
  end;
end;

procedure ShowHintMsg(Obj: Tobject; Str: string);
begin
  if Obj is TcxDBTextEdit then
    MainFM.cxHintCtr.ShowHint(TcxDBTextEdit(Obj).ClientOrigin.X + TcxDBTextEdit(Obj).Width div 2, TcxDBTextEdit(Obj).ClientOrigin.Y, '�����ʾ', Str);
  if Obj is TcxDBComboBox then
    MainFM.cxHintCtr.ShowHint(TcxDBComboBox(Obj).ClientOrigin.X + TcxDBComboBox(Obj).Width div 2, TcxDBComboBox(Obj).ClientOrigin.Y, '�����ʾ', Str);
  if Obj is TcxDBButtonEdit then
    MainFM.cxHintCtr.ShowHint(TcxDBButtonEdit(Obj).ClientOrigin.X + TcxDBButtonEdit(Obj).Width div 2, TcxDBButtonEdit(Obj).ClientOrigin.Y, '�����ʾ', Str);

  MainFM.Timer1.Enabled := True;
end;

procedure InsertImg(qyTemp: TAdoquery; ImgField: string);
var
  picStream: TAdoblobstream;
  bmppic: TBitMap;
  jpgpic: Tjpegimage;
  bmpStream: TMemoryStream;
  PicStyle: string;
begin
  try
    if DataFM.DlgOpenPic1.Execute then
    begin
      if qyTemp.State = dsBrowse then qyTemp.Edit;
      PicStyle := Uppercase(ExtractFileExt(DataFM.DlgOpenPic1.FileName));
      if (PicStyle = '.JPG') or (PicStyle = '.JPEG') then
      begin
        try
          jpgpic := TJpegimage.Create;
          bmppic := TBitMap.Create;
          bmpStream := TMemoryStream.Create;
          jpgpic.LoadFromFile(DataFM.DlgOpenPic1.FileName);
          bmppic.Assign(jpgpic);
          bmppic.SaveToStream(bmpstream);
          picStream := TAdoblobstream.Create(TBlobField(qyTemp.FieldByName(ImgField)), bmWrite);
          picStream.LoadFromStream(bmpStream);
          picStream.Position := 0;
          TBlobField(qyTemp.FieldByName(ImgField)).LoadFromStream(picStream);
        finally
          jpgpic.Free;
          bmppic.Free;
          bmpstream.Free;
          picstream.Free;
        end;
      end
      else
        TBlobField(qyTemp.FieldByName(ImgField)).LoadFromFile(DataFM.DlgOpenPic1.FileName)
    end;
  except
    ShowBox('����ͼƬ����');
  end;
end;

procedure FullImg(qyTemp: TAdoquery; ImgField: string);
begin
  {if not Assigned(ImageFullFM) then
    ImageFullFM := TImageFullFM.Create(Application);
  ImageFullFM.dsImage.DataSet := qyTemp;
  ImageFullFM.imageEN.DataField := ImgField;
  ImageFullFM.ShowModal;
  ImageFullFM.BringToFront;
  ImageFullFM.WindowState := wsMaximized;}
end;


function ShowDlg(Info: string): Boolean;
begin
  if Application.MessageBox(pChar(Info), pChar('����������ϵͳ'), MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON1) = ID_CANCEL then
    Result := False
  else
    Result := true;
end;


function GetFiveNo(TableId, FieldName: string): string;
begin
  try
    try
      with DataFM.spTemp do
      begin
        if Active then Close;
        Parameters.Clear;
        Procedurename := 'prGetFiveNo;1';
        Parameters.AddParameter.Name := '@TableId';
        Parameters[0].Direction := pdInPut;
        Parameters[0].DataType := ftString;
        Parameters[0].Size := 50;
        Parameters[0].Value := TableId;
        Parameters.AddParameter.Name := '@FieldName';
        Parameters[1].Direction := pdInPut;
        Parameters[1].DataType := ftString;
        Parameters[1].Size := 20;
        Parameters[1].Value := FieldName;
        Parameters.AddParameter.Name := '@BillNo';
        Parameters[2].Direction := pdOutPut;
        Parameters[2].DataType := ftString;
        Parameters[2].Size := 20;
        execproc;
      end;
      Result := DataFM.spTemp.Parameters[2].Value;
    finally
      DataFM.spTemp.Close;
    end;
  except
    on E: Exception do
      ShowBox(E.Message);
  end;
end;

function GetTableNo(TableId, FieldName: string): string;
begin
  {try
    with DataFM.qyTimeNo do
    begin
      if Active then Close;
      sql.Clear;
      sql.Add(' exec prGetTimeNo ' + QuotedStr(TableId) + ',' + QuotedStr(FieldName));
      Open;
    end;
    Result := DataFM.qyTimeNo.FieldByName('BillNo').AsString
  except
    on E: Exception do
      ShowWarn(E.Message);
  end; }
  try
    try
      with DataFM.spTemp do
      begin
        if Active then Close;
        Parameters.Clear;
        Procedurename := 'prGetTableNo;1';
        Parameters.AddParameter.Name := '@TableId';
        Parameters[0].Direction := pdInPut;
        Parameters[0].DataType := ftString;
        Parameters[0].Size := 50;
        Parameters[0].Value := TableId;
        Parameters.AddParameter.Name := '@FieldName';
        Parameters[1].Direction := pdInPut;
        Parameters[1].DataType := ftString;
        Parameters[1].Size := 20;
        Parameters[1].Value := FieldName;
        Parameters.AddParameter.Name := '@BillNo';
        Parameters[2].Direction := pdOutPut;
        Parameters[2].DataType := ftString;
        Parameters[2].Size := 20;
        Execproc;
      end;
      Result := DataFM.spTemp.Parameters[2].Value;
    finally
      DataFM.spTemp.Close;
    end;
  except
    on E: Exception do
      ShowWarn(E.Message);
  end;
end;


function GetTrvId(sTableId: string; InId: string; iFlag: Integer): string;
begin
  try
    try
      with DataFM.spTemp do
      begin
        if Active then Close;
        Parameters.Clear;
        Procedurename := 'PrGetTrvId;1';
        Parameters.AddParameter.Name := '@sTableId';
        Parameters[0].Direction := pdInPut;
        Parameters[0].DataType := ftString;
        Parameters[0].Size := 100;
        Parameters[0].Value := sTableId;
        Parameters.AddParameter.Name := '@InId';
        Parameters[1].Direction := pdInPut;
        Parameters[1].DataType := ftString;
        Parameters[1].Size := 50;
        Parameters[1].Value := InId;
        Parameters.AddParameter.Name := '@iFlag';
        Parameters[2].Direction := pdInPut;
        Parameters[2].DataType := ftString;
        Parameters[2].Size := 20;
        Parameters[2].Value := iFlag;
        Parameters.AddParameter.Name := '@ParentId';
        Parameters[3].Direction := pdOutPut;
        Parameters[3].DataType := ftString;
        Parameters[3].Size := 20;
        Parameters.AddParameter.Name := '@OutId';
        Parameters[4].Direction := pdOutPut;
        Parameters[4].DataType := ftString;
        Parameters[4].Size := 20;
        execproc;
      end;
      Result := DataFM.spTemp.Parameters[4].Value;
    finally
      DataFM.spTemp.Close;
    end;
  except
    on E: Exception do
      ShowError(E.Message);
  end;
end;

function GetItemId(KindCode: string): string;
begin
  try
    try
      with DataFM.spTemp do
      begin
        if Active then Close;
        Parameters.Clear;
        Procedurename := 'prGetItemId;1';
        Parameters.AddParameter.Name := '@KindCode';
        Parameters[0].Direction := pdInPut;
        Parameters[0].DataType := ftString;
        Parameters[0].Size := 50;
        Parameters[0].Value := KindCode;
        Parameters.AddParameter.Name := '@BillNo';
        Parameters[1].Direction := pdOutPut;
        Parameters[1].DataType := ftString;
        Parameters[1].Size := 20;
        execproc;
      end;
      Result := DataFM.spTemp.Parameters[1].Value;
    finally
      DataFM.spTemp.Close;
    end;
  except
    on E: Exception do
      ShowBox(E.Message);
  end;
end;


function PrintReport(FileName: string; iPtFlag: Integer; iPtKind: Integer; dsHed: TDataSource): Boolean;
begin
  try
    try
      ReportFM := TReportFM.Create(nil);
      ReportFM.dsTemp := dsHed;
      if iPtKind = 1 then
      begin
        ReportFM.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Report\' + FileName);
        if iPtFlag = 1 then
          ReportFM.frxReport1.ShowReport()
        else if iPtFlag = 2 then
        begin
          ReportFM.frxReport1.PrepareReport();
          ReportFM.frxReport1.Print;
        end
        else if iPtFlag = 3 then
          ReportFM.frxReport1.DesignReport();
      end;
      { else if iPtKind = 2 then
        begin
        ReportFM.RMReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Report\' + FileName);
        if iPtFlag = 1 then
        ReportFM.RMReport1.ShowReport()
        else if iPtFlag = 2 then
        ReportFM.RMReport1.PrintReport
        else if iPtFlag = 3 then
        ReportFM.RMReport1.DesignReport();
        end; }
    finally
      ReportFM.Free;
      ReportFM := nil;
    end;
    Result := true;
  except
  end;
end;

function ExeSql(Str: string): Boolean;
begin
  try
    try
      Result := False;
      with DataFM.qyTemp do
      begin
        if Active then Close;
        sql.Clear;
        sql.Text := Str;
        ExecSql;
      end;
    finally
      DataFM.qyTemp.Close;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      ShowError('ִ��SQL������:' + E.Message);
    end;
  end;
end;

function GetPYCode(Str: string): string;
var
  sPy, sAllPY: string;
  i: Integer;
  sHc: AnsiString;
  //vChar: AnsiChar;
begin
  try
    sAllPY := '';
    i := 1;
    while i <= Length(trim(Str)) do
    begin
      begin
        sHc := Copy(trim(Str), i, 1);
        if (Str[i] in ['a'..'z', 'A'..'Z', '0'..'9']) then // ��ĸ��ȡ��д
          sPy := Uppercase(sHc)
        else // һ������ȡ����ĸ
        begin
          case word(sHc[1]) shl 8 + word(sHc[2]) of
            $B0A1..$B0C4:
              sPy := 'A';
            $B0C5..$B2C0:
              sPy := 'B';
            $B2C1..$B4ED:
              sPy := 'C';
            $B4EE..$B6E9:
              sPy := 'D';
            $B6EA..$B7A1:
              sPy := 'E';
            $B7A2..$B8C0:
              sPy := 'F';
            $B8C1..$B9FD:
              sPy := 'G';
            $B9FE..$BBF6:
              sPy := 'H';
            $BBF7..$BFA5:
              sPy := 'J';
            $BFA6..$C0AB:
              sPy := 'K';
            $C0AC..$C2E7:
              sPy := 'L';
            $C2E8..$C4C2:
              sPy := 'M';
            $C4C3..$C5B5:
              sPy := 'N';
            $C5B6..$C5BD:
              sPy := 'O';
            $C5BE..$C6D9:
              sPy := 'P';
            $C6DA..$C8BA:
              sPy := 'Q';
            $C8BB..$C8F5:
              sPy := 'R';
            $C8F6..$CBF9:
              sPy := 'S';
            $CBFA..$CDD9:
              sPy := 'T';
            $CDDA..$CEF3:
              sPy := 'W';
            $CEF4..$D188:
              sPy := 'X';
            $D1B9..$D4D0:
              sPy := 'Y';
            $D4D1..$D7F9:
              sPy := 'Z';
          else
            sPy := Char(32);
          end;
        end;
        sAllPY := sAllPY + sPy;
        i := i + 1;
      end;
    end;
    Result := sAllPY;
  except
    on E: Exception do
      showMessage(E.Message);
  end;
end;

function CreateADOObject(const ClassID: TGUID): IUnknown;
var
  Status: HResult;
  FPUControlWord: word;
begin
  asm
    FNSTCW  FPUControlWord
  end;
  Status := CoCreateInstance(ClassID, nil, CLSCTX_INPROC_SERVER or CLSCTX_LOCAL_SERVER, IUnknown, Result);
  asm
    FNCLEX
    FLDCW FPUControlWord
  end;
  if (Status = REGDB_E_CLASSNOTREG) then
    raise Exception.CreateRes(@SADOCreateError)
  else
    OleCheck(Status);
end;

function GetServerSLName(): string;
var
  fReg: TRegistry;
  aBuffer: array[0..1024] of Char;
  lMuliString: string;
  lsSingle: string;
  bufferIndex: Integer;
  LastTimeIsZero: Boolean;
begin
  try
    lMuliString := '';
    fReg := TRegistry.Create;
    fReg.RootKey := HKEY_LOCAL_MACHINE;
    if fReg.OpenKey('SOFTWARE\Microsoft\Microsoft SQL Server', true) then
    begin
      fReg.ReadBinaryData('InstalledInstances', aBuffer, SizeOf(aBuffer));
      LastTimeIsZero := False;
      for bufferIndex := 0 to SizeOf(aBuffer) do
      begin
        lsSingle := string(aBuffer[bufferIndex]);
        if lsSingle = #0 then
        begin
          if LastTimeIsZero then
            break; // ������ǰ���������ǽ����ˡ�
          LastTimeIsZero := true;
          lsSingle := #13;
        end
        else
          LastTimeIsZero := False;
        lMuliString := lMuliString + lsSingle;
      end;
      if lMuliString <> '' then
        Result := lMuliString
      else
        Result := '';
    end;
  finally
    fReg.CloseKey;
    fReg.Free;
  end;
end;

function HasGetMaxAudit(TableId: string; AuditFlag: Integer): Boolean;
var
  MaxFlag: Integer;
begin
  try
    Result := False;
    with DataFM.qyTemp do
    begin
      if Active then
        Close;
      sql.Clear;
      sql.Add('select MaxAuditLevel,BillId,bAudit from SysBillSetTB where BillId=' + QuotedStr(TableId));
      open;
      if not eof then
      begin
        MaxFlag := Fields[0].AsInteger;
      end;
    end;
  finally
    DataFM.qyTemp.Close;
  end;
  if (MaxFlag <> 0) and (AuditFlag = MaxFlag) then
    Result := true;
end;

function AuditBill(TableId, UserId, FMName, BillNo: string; qyHed: TAdoquery; iFlag: Integer): Boolean;
var
  NowFlag, MaxFlag, AddFlag, DelFlag: Integer;
  sHasRightLevel: string;
  bNeedAudit, bHasCheckRight, bHasUnCheckRight: Boolean;
begin
  try
    NowFlag := qyHed.FieldByName('AuditFlag').AsInteger;
    AddFlag := qyHed.FieldByName('AuditFlag').AsInteger + 1;
    DelFlag := qyHed.FieldByName('AuditFlag').AsInteger - 1;
    bNeedAudit := False;
    bHasCheckRight := False;
    bHasUnCheckRight := False;
    sHasRightLevel := '';
    qyHed.UpdateCursorPos;
    qyHed.Recordset.Resync(AdAffectcurrent, AdResyncAllValues);
    qyHed.Resync([]);
    try
      with DataFM.qyTemp do
      begin
        if Active then
          Close;
        sql.Clear;
        sql.Add('select bCheck=IsNull(bCheck,0),bUnCheck=IsNull(bUnCheck,0),HasRightLevel=IsNull(HasRightLevel,'''') from UserRightTB where TableID='+ QuotedStr(TableId) + ' and UserId=' + QuotedStr(UserId));
        open;
        if not eof then
        begin
          bHasCheckRight := Fields[0].AsBoolean;
          bHasUnCheckRight := Fields[1].AsBoolean;
          sHasRightLevel := Fields[2].AsString;
        end;
      end;
    finally
      DataFM.qyTemp.Close;
    end;

    try
      with DataFM.qyTemp do
      begin
        if Active then Close;
        sql.Clear;
        sql.Add('select MaxAuditLevel,BillId,bAudit from SysBillSetTB where BillId=' + QuotedStr(TableId));
        open;
        if not eof then
        begin
          MaxFlag := Fields[0].AsInteger;
          bNeedAudit := Fields[2].AsBoolean;
        end;
      end;
    finally
      DataFM.qyTemp.Close;
    end;

    if iFlag = 1 then // ���
    begin
      if not bNeedAudit then
      begin
        ShowBox('�õ�����Ҫ���');
        Result := False;
        Exit;
      end;
      if (NowFlag = MaxFlag) or (qyHed.FieldByName('bMaxAudit').AsBoolean) then
      begin
        ShowBox('�õ��Ѿ������ϣ�');
        Result := False;
        Exit;
      end;
      if (not bHasCheckRight) or (pos(intToStr(AddFlag), sHasRightLevel) <= 0) then
      begin
        ShowBox('��û�иõ��ĵ� <' + intToStr(AddFlag) + '> �����Ȩ��');
        Result := False;
        Exit;
      end;
      GetServerTime;
      if qyHed.State = dsBrowse then
        qyHed.Edit;
      qyHed.FieldByName('AuditFlag').AsInteger := AddFlag;
      qyHed.FieldByName('AuditManName').AsString := qyHed.FieldByName('AuditManName').AsString + LoginEmpName + ';';
      qyHed.FieldByName('AuditDate').AsString := qyHed.FieldByName('AuditDate').AsString + FormatDatetime('yyyy-mm-dd hh:mm:ss', SysDateTime) + ';';
      if HasGetMaxAudit(TableId, AddFlag) then
      begin
        qyHed.FieldByName('MaxAuditDate').AsDateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:mm:ss', SysDateTime));
        qyHed.FieldByName('bMaxAudit').AsBoolean := true;
      end;
      qyHed.UpdateBatch();
      SetLog(FMName, BillNo, '���');
      Result := true;
      ShowBox('��˳ɹ�!');
    end
    else if iFlag = -1 then // �����
    begin
      if NowFlag = 0 then
      begin
        ShowBox('�õ���û����ˣ�');
        Result := False;
        Exit;
      end;
      if (not bHasUnCheckRight) or (pos(intToStr(NowFlag), sHasRightLevel) <= 0) then
      begin
        ShowBox('��û�иõ��ĵ� <' + intToStr(NowFlag) + '> �������Ȩ��');
        Result := False;
        Exit;
      end;
      if qyHed.State = dsBrowse then
        qyHed.Edit;
      qyHed.FieldByName('AuditFlag').AsInteger := DelFlag;
      qyHed.FieldByName('AuditManName').AsString := '';
      qyHed.FieldByName('AuditDate').AsString := '';
      qyHed.FieldByName('MaxAuditDate').Value := null;
      qyHed.FieldByName('bMaxAudit').AsBoolean := False;
      qyHed.UpdateBatch();
      SetLog(FMName, BillNo, '�����');
      Result := true;
      ShowBox('����˳ɹ�!');
    end;
  except
      on E: Exception do
      ShowWarn(E.Message);
  end;
end;

function OpenRecords(qyHed: TAdoquery; SqlStr: string): Boolean;
begin
  try
    if qyHed.Active then
      qyHed.Close;
    qyHed.sql.Clear;
    qyHed.sql.Add(SqlStr);
    qyHed.open;
    OpenRecords := true;
  except
    on E: Exception do
    begin
      ShowWarn('ִ��SQL������:' + E.Message);
      OpenRecords := False;
    end;
  end;
end;

function bHaveData(qyTemp: TAdoquery; sWhere: string): string;
begin
  try
    try
      with qyTemp do
      begin
        if Active then Close;
        sql.Clear;
        sql.Add(sWhere);
        open;
        if not eof then
          bHaveData := Fields[0].AsString
        else
          bHaveData := '';
      end;
    finally
      qyTemp.Close;
    end;
  except
  end;
end;

function HasShowRight(sTableId, UserId, sKind: string): string;
var
  bRight: Boolean;
begin
  try
    Result := '';
    if bHaveData(DataFM.qyTemp, 'select bRight from SysBillSetTB where IsNull(bRight,0)=1 and BillId=' + QuotedStr(sTableId) + '')<> '' then
      bRight := true
    else
      bRight := False;

    with DataFM.qyTemp do
    begin
      if Active then Close;
      sql.Clear;
      if LoginId <> 'admin' then
        sql.Add('select bFindAll from UserRightTB where ISNULL(bShow,0)=1 and UserId=' + QuotedStr(UserId) + ' and TableId=' + QuotedStr(sTableId))
      else
         sql.Add('select bFindAll=Convert(bit,1) from UserRightTB');
      open;
      if not eof then
      begin
        Result := '';
        if (bRight) and (Fields[0].AsBoolean = False) then
          Result := ' and MakeManName=' + QuotedStr(LoginName); // ���ֲ鿴Ȩ��
      end
      else
        Result := 'None';
    end;
  finally
    DataFM.qyTemp.Close;
  end;
end;

function GetYearMon(Dt: TDateTime): string;
var
  Year, Month: word;
begin
  try
    Result := '';
    Year := YearOf(Dt);
    Month := MonthOf(Dt);
    if Month > 9 then
      Result := intToStr(Year) + intToStr(Month)
    else
      Result := intToStr(Year) + '0' + intToStr(Month);
  finally
  end;
end;


function CheckBillNoAudit(TableName, FileName, BillNo: string): Boolean;
var
  TCheckqy: TAdoquery;
begin
  try
    TCheckqy := TAdoquery.Create(nil);
    TCheckqy.Connection := DataFM.Con;
    with TCheckqy do
    begin
      if Active then Close;
      sql.Clear;
      sql.Add('select ' + FileName + ' from ' + TableName + ' where isnull(AuditFlag,0)>0 and ' + FileName + '=' + QuotedStr(BillNo));
      open;
      if not eof then
        Result := true
      else
        Result := False;
    end;
  finally
    TCheckqy.Close;
    TCheckqy.Free;
  end;
end;

function CheckWareHasMonth(BillDate: TDateTime): Boolean;
begin
  try
    if bHaveData(DataFM.qyTemp, 'select * from FinanceDateTB where ISNULL(bAccount,0)=1 and ' + QuotedStr(DateTimeToStr(BillDate)) + '<=EndDate') <> '' then
      Result := true
    else
      Result := False;
  except
    ShowWarn('�жϲ����·ݴ���');
  end;
end;

function GetMultiId(qyFind: TAdoquery; FileName: string): string;
var
  sAllId: string;
  i: Integer;
begin
  sAllId := '';
  qyFind.Filter := ' bSelect=1';
  qyFind.Filtered := true;
  qyFind.First;
  for I := 0 to qyFind.RecordCount - 1 do
  begin
    if qyFind.FieldByName('bSelect').AsBoolean then
    begin
      sAllId := sAllId + '''' + qyFind.fieldByName(FileName).AsString + ''','; //��ѡȡ���Դ򹴵Ĳ�+','
    end;
    qyFind.Next;
  end;
  if sAllId <> '' then
    sAllId := LeftStr(sAllId, Length(sAllId) - 1); //ȥ�����һ��','
  qyFind.Filter := '';
  qyFind.Filtered := false;
  Result := sAllId;
end;

function Encode(Str: string): string; //�ַ����ܺ���   �@���õ�һ���������
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(Str) do
  begin
    Result := Result + IntToHex(Byte(Str[i]) xor XorKey[j], 2);
    j := (j + 1) mod 8;
  end;
end;

function Decode(Str: string): string; //����
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(Str) div 2 do
  begin
    Result := Result + Char(StrToInt('$' + Copy(Str, i * 2 - 1, 2)) xor XorKey[j]);
    j := (j + 1) mod 8;
  end;
end;

function GetSystemVer: WideString; //��ȡ����ϵͳ�汾
var
  AWin32Version: Extended;
begin
  AWin32Version := StrtoFloat(format('%d.%d', [Win32MajorVersion, Win32MinorVersion]));
  if Win32Platform = VER_PLATFORM_WIN32s then
    Result := 'Windows 32'
  else if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
  begin
    if AWin32Version = 4.0 then
      Result := 'Windows 95'
    else if AWin32Version = 4.1 then
      Result := 'Windows 98'
    else if AWin32Version = 4.9 then
      Result := 'Windows Me'
    else
      Result := 'Windows 9x'
  end
  else if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    if AWin32Version = 3.51 then
      Result := 'Windows NT 3.51'
    else if AWin32Version = 4.0 then
      Result := 'Windows NT 4.0'
    else if AWin32Version = 5.0 then
      Result := 'Windows 2000'
    else if AWin32Version = 5.1 then
      Result := 'Windows Xp'
    else if AWin32Version = 5.2 then
      Result := 'Windows 2003'
    else if AWin32Version = 6.0 then
      Result := 'Windows vista'
    else
      Result := 'Windows 7';
  end
// else if Win32Platform = VER_PLATFORM_WIN32_CE then
// Result := 'Windows CE'
  else
    Result := 'Windows ??';
end;

function GetDateAutoNo(sTableId: string): string;
begin
  GetServerTime;
  Result := sTableId + Formatdatetime('yymmddhhnnsszzz', SysDateTime);
end;


function FtpUpdateExe: integer;
  function FtpUpdateFile: integer;
  var
    LS: TStringList;
    i, j: Integer;
    sFileName, sLocalFile, sServerFile: string;
    tStream: TFileStream;
    BytesToTransfer: LongWord;
    IdFTPUpdate: TIdFTP;
  begin
    Result := 0;
    try
      IdFTPUpdate := TIdFTP.Create(nil);
      with IdFTPUpdate do
      begin
        try
          userName := sFtpUserName;
          password := sFtpPassWord;
          host := sFTPHost;
          port := StrToInt(sFtpPort);
          connect;
        except
          Result := 1;
          ShowWarn('���ӷ�����ʧ�ܣ�');
          exit;
        end;
      end;
      ls := TStringList.Create;
      Ls.Clear;
      IdFTPUpdate.ChangeDir('\' + sFTPDir); //ת����ӦĿ¼
      IdFTPUpdate.List(ls, '', false);
      for i := 0 to LS.Count - 1 do
      begin
        sServerFile := ls.Strings[i];
        j := IdFTPUpdate.Size(sServerFile);
        if j <> -1 then
        begin
          sFileName := sServerFile;
          sLocalFile := ExtractFileDir(Application.ExeName) + '\' + sFileName;
          begin
            tStream := TFileStream.Create(sLocalFile, fmCreate);
            BytesToTransfer := IdFTPUpdate.Size(sFileName);
            try
              tStream.Position := tStream.Size;
              IdFTPUpdate.Get(sFileName, tStream);
            finally
              tStream.Free;
            end;
          end
        end;
      end;
    finally
      IdFTPUpdate.Disconnect;
      IdFTPUpdate.Free;
    end;
  end;
var NewFileName: string;
begin
  try
    Result := 0;
    if ShowDlg('���ĳ��������°汾��ȷ�����³�����') = false then exit;
    NewFileName := ExtractFilePath(ParamStr(0)) + 'HCSoftWare.temp';
    if FileExists(NewFileName) then
    begin
      if DeleteFile(NewFileName) = false then
      begin
        ShowBox('ɾ���ļ�:' + NewFileName + 'ʧ��,��ȷ�ϳ��������ļ����Ƿ������޸�,�����ֹ�ɾ���ļ����ٸ���!');
        Exit;
      end;
    end;
    if RenameFile(Application.exename, NewFileName) then
    begin
      if FtpUpdateFile = 0 then //�ɹ�
      begin
        ShowBox('���³ɹ���');
        Screen.Cursor := crDefault;
        Application.Terminate;
        winexec(PAnsichar(Application.exename), sw_normal);
        Exit;
      end
      else
      begin
        ShowBox('�����ļ�ʧ�ܣ�');
        RenameFile(NewFileName, Application.exename);
      end;
    end
    else
      ShowBox('����������');
  except
    on E: Exception do
    begin
      ShowWarn(E.Message);
    end;
  end;
end;

initialization

  CoInitialize(nil); // ����˿�
  if (False) then
  begin
    if (SpareDays > 0) and (SpareDays < 31) then
    begin
      ShowWarn('����û��ע��  ʣ��' + FloatToStr(SpareDays) + '��');
      bLogin := False;
      GetConfig;
      DataFM := TDataFM.Create(Application);
      try
        LoginFM := TLoginFM.Create(nil);
        LoginFM.ShowModal;
      finally
        LoginFM.Free;
        LoginFM := nil;
      end;
    end
    else
    begin
      try
        RegSetFM := TRegSetFM.Create(nil);
        RegSetFM.ShowModal;
      finally
        RegSetFM.Free;
        RegSetFM := nil;
      end;
    end;
  end
  else
  begin
    bLogin := False;
    GetConfig;
    DataFM := TDataFM.Create(Application);
    try
      LoginFM := TLoginFM.Create(nil);
      LoginFM.ShowModal;
    finally
      LoginFM.Free;
      LoginFM := nil;
    end;
  end;

finalization

  CoUnInitialize;

end.

