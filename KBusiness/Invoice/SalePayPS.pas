unit SalePayPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseGrdPS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxSkinsdxBarPainter, cxGridCustomPopupMenu, cxGridPopupMenu,
  Menus, ADODB, dxBar, cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, StdCtrls, ExtCtrls, frxClass, frxDBSet,
  cxContainer, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxButtonEdit,
  cxLabel, cxDBLabel, cxButtons, cxGroupBox, cxDBLookupComboBox, cxGridBandedTableView,
  cxGridDBBandedTableView, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, ADOInt,
  cxRadioGroup, cxPCdxBarPopupMenu, cxCheckBox, dxSkinOffice2010Blue,
  cxCurrencyEdit, dxSkinDevExpressStyle, dxSkinSpringTime, dxSkinValentine,
  dxBarBuiltInMenu, cxNavigator, cxMRUEdit;

type
  TSalePayFM = class(TBaseGrdFM)
    Label13: TLabel;
    cbbPayMode: TcxDBComboBox;
    Label14: TLabel;
    cxRgpFlag: TcxDBRadioGroup;
    Label17: TLabel;
    qyHedAutoID: TLargeintField;
    qyHedPayNO: TStringField;
    qyHedPayDate: TDateTimeField;
    qyHedBillKind: TStringField;
    qyHedSignFlag: TSmallintField;
    qyHedCustId: TStringField;
    qyHedEmpId: TStringField;
    qyHedPayMode: TStringField;
    qyHedPayMoney: TFMTBCDField;
    qyHedFactMoney: TFMTBCDField;
    qyHedCompactNo: TStringField;
    qyHedSubjoinNo: TStringField;
    qyHedbSelect: TBooleanField;
    qyHedRemark: TStringField;
    qyHedbPrint: TBooleanField;
    qyHedPrintNum: TSmallintField;
    qyHedMakeDate: TDateTimeField;
    qyHedMakeMan: TStringField;
    qyHedMakeManName: TStringField;
    qyHedEditMan: TStringField;
    qyHedEditManName: TStringField;
    qyHedEditDate: TDateTimeField;
    qyHedAuditFlag: TSmallintField;
    qyHedbMaxAudit: TBooleanField;
    qyHedAuditManName: TStringField;
    qyHedAuditDate: TStringField;
    qyHedMaxAuditDate: TDateTimeField;
    qyHedCustName: TStringField;
    qyDetAutoID: TLargeintField;
    qyDetPayNO: TStringField;
    qyDetInvoiceNo: TStringField;
    qyDetCompactNo: TStringField;
    qyDetbPrint: TBooleanField;
    qyDetbPay: TBooleanField;
    qyDetInvoiceMoney: TFMTBCDField;
    qyDetHasPayMoney: TFMTBCDField;
    qyDetNoPayMoney: TFMTBCDField;
    qyDetNowPayMoney: TFMTBCDField;
    qyDetRemark: TStringField;
    cxgrdtbvInvoiceNo: TcxGridDBColumn;
    cxgrdtbvInvoiceMoney: TcxGridDBColumn;
    cxgrdtbvHasPayMoney: TcxGridDBColumn;
    cxgrdtbvNoPayMoney: TcxGridDBColumn;
    cxgrdtbvNowPayMoney: TcxGridDBColumn;
    cxgrdtbvRemark: TcxGridDBColumn;
    cxObject: TcxDBButtonEdit;
    cxRgpBillKind: TcxDBRadioGroup;
    cxPayM: TcxDBCurrencyEdit;
    cxLabel1: TcxLabel;
    Label10: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxlbl4: TcxLabel;
    qyHedNoPay: TFMTBCDField;
    cxNoPayM: TcxDBCurrencyEdit;
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btAddLClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDelLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure cxEdtNoPropertiesChange(Sender: TObject);
    procedure qyDetAfterInsert(DataSet: TDataSet);
    procedure btDelClick(Sender: TObject);
    procedure btCheckClick(Sender: TObject);
    procedure btUnCheckClick(Sender: TObject);
    procedure smlntfldHedPrintNumChange(Sender: TField);
    procedure btFindClick(Sender: TObject);
    procedure btReferClick(Sender: TObject);
    procedure qyHedPayMoneyChange(Sender: TField);
    procedure qyDetNowPayMoneyChange(Sender: TField);
    procedure btTempClick(Sender: TObject);
    procedure cxObjectPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure qyHedNewRecord(DataSet: TDataSet);
    procedure qyHedCustIdChange(Sender: TField);
    procedure qyHedCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public

    { Public declarations }
  end;
var
  SalePayFM: TSalePayFM;

implementation
uses PublicPS, DataPS, EmpQPS, ItemQPS, DeptQPS, CustQPS, SalePayFindPS, SalePayInvoiceRfPS, SGeneralPS, CNAccNameQPS, CNItemQPS;
{$R *.dfm}

procedure TSalePayFM.btAddClick(Sender: TObject);
begin
  try
    if (bRight) and (bAdd = false) then
    begin
      ShowWarn('��û�б����ݵ����Ȩ��,���ܲ���');
      exit;
    end;
    TextReadOnly(Self, false);
    cxNoPayM.Properties.ReadOnly:=true;
    inherited;
    qyHed.Append;
    qyHed.FieldByName('PayNo').AsString := GetTableNo(sTableId, 'PayNo');
    qyHed.FieldByName('PayDate').AsDateTime := StrToDateTime(FormatDateTime('yyyy-mm-dd', SysDateTime));
    qyHed.FieldByName('SignFlag').AsInteger := 1;
    qyHed.FieldByName('MakeMan').AsString := LoginId;
    qyHed.FieldByName('MakeManName').AsString := LoginName;
    qyHed.FieldByName('MakeDate').AsDateTime := SysDateTime;
    qyHed.FieldByName('AuditFlag').AsInteger := 0;

  except
    on E: Exception do
      ShowWarn(E.Message);
  end;
end;

procedure TSalePayFM.btAddLClick(Sender: TObject);
begin
  try
    qyDet.Append;
  except
  end;
end;

procedure TSalePayFM.btCancelClick(Sender: TObject);
begin
  if qyDet.Active then qyDet.CancelBatch();
  qyHed.CancelBatch();
  TextReadOnly(Self, True);
  inherited;
end;

procedure TSalePayFM.btCheckClick(Sender: TObject);
begin
  //inherited;
  if bHaveData(DataFM.qyTemp, 'select AutoId from SalePayDTTB where PayNo=' + QuotedStr(Trim(cxEdtNo.Text)) + ' and IsNull(NoPayMoney,0)>0 and IsNull(NowPayMOney,0)=0') <> '' then
  begin
    ShowBox('�м�¼û�к������,����������ť');
    Exit;
  end;
  AuditBill(sTableId, LoginId, sFMName, trim(cxEdtNo.text), qyHed, 1);
  ShowFMInfo(sTableId, qyHed);
end;

procedure TSalePayFM.btDelClick(Sender: TObject);
var
  i: Integer;
  sBiilNo: string;
begin
  if (cxEdtNo.Text = '') or (qyHed.Active = false) then exit;
  if qyHed.FieldByName('AuditFlag').asInteger > 0 then
  begin
    ShowWarn('�����Ѿ����,����ɾ��!');
    exit;
  end;
  if (bRight) and (bDelAll = false) and (qyHed.FieldByName('MakeMan').AsString <> LoginEmpId) then
  begin
    ShowWarn('��ֻ��ɾ���Լ����ĵ���!');
    exit;
  end;
  inherited;
  if ShowDlg('ȷʵҪɾ���õ�����?') then
  begin
    try
      sBiilNo := trim(cxEdtNo.Text);
      qyDet.First;
      for i := 0 to qyDet.RecordCount - 1 do
      begin
        qyDet.Delete;
        qyDet.Next;
      end;
      qyDet.UpdateBatch;
      qyHed.Delete;
      qyHed.UpdateBatch;
      SetLog(sFMName, sBiilNo, 'ɾ��');
      ShowBox('ɾ���ɹ�!');
    except
      on E: Exception do
      begin
        ShowBox('ɾ��ʧ��!');
      end;
    end;
  end;
end;

procedure TSalePayFM.btDelLClick(Sender: TObject);
begin
  try
    qyDet.Delete;
  except
    ShowBox('ɾ��ʧ�ܣ�');
  end;
end;

procedure TSalePayFM.btEditClick(Sender: TObject);
begin
  qyHed.UpdateCursorPos;
  qyHed.Recordset.Resync(AdAffectcurrent, AdResyncAllValues);
  qyHed.Resync([]);
  if qyHed.FieldByName('AuditFlag').asInteger > 0 then
  begin
    ShowWarn('�����Ѿ����,�������ٽ��б༭!');
    exit;
  end;
  if (bRight) and (bEditAll = false) and (qyHed.FieldByName('MakeMan').AsString <> LoginEmpId) then
  begin
    ShowWarn('��ֻ���޸��Լ����ĵ��ݣ������޸ı��˵�!');
    exit;
  end;
  TextReadOnly(Self, false);
  cxNoPayM.Properties.ReadOnly:=true;
  inherited;
  qyHed.Edit;
  qyHed.FieldByName('EditMan').AsString := LoginId;
  qyHed.FieldByName('EditManName').AsString := LoginName;
  qyHed.FieldByName('EditDate').AsDateTime := SysDateTime;
end;

procedure TSalePayFM.btFindClick(Sender: TObject);
begin
  inherited;
  try
    if not Assigned(SalePayFindFM) then
      SalePayFindFM := TSalePayFindFM.Create(Application);
    SalePayFindFM.ShowModal;
  finally
    SalePayFindFM.Free;
    SalePayFindFM := nil
  end;
end;

procedure TSalePayFM.btReferClick(Sender: TObject);
var
  i: integer;
  sRfid: string;
begin
  try
    if cxObject.text = '' then
    begin
      ShowBox('����ѡ��ͻ���');
      Exit;
    end;
    try
      SalePayInvoiceRfFM := TSalePayInvoiceRfFM.Create(nil);
      SalePayInvoiceRfFM.sObjectId := qyHed.FieldByName('CustId').asString;
      SalePayInvoiceRfFM.btFindClick(self);
      SalePayInvoiceRfFM.ShowModal;
      if SalePayInvoiceRfFM.fFlag = 1 then
      begin
        SalePayInvoiceRfFM.qyFind.Filter := ' bSelect=1';
        SalePayInvoiceRfFM.qyFind.Filtered := true;
        SalePayInvoiceRfFM.qyFind.First;
        for i := 0 to SalePayInvoiceRfFM.qyFind.RecordCount - 1 do
        begin
          if i = 0 then
            qyDet.Edit
          else
            qyDet.Append;
          qyDet.FieldByName('InvoiceNo').AsString := SalePayInvoiceRfFM.qyFind.FieldByName('BillNo').AsString;
          qyDet.FieldByName('InvoiceMoney').AsFloat := SalePayInvoiceRfFM.qyFind.FieldByName('InvoiceMoney').AsFloat;
          qyDet.FieldByName('HasPayMoney').AsFloat := SalePayInvoiceRfFM.qyFind.FieldByName('HasPayMoney').AsFloat;
          qyDet.FieldByName('NoPayMoney').AsFloat := SalePayInvoiceRfFM.qyFind.FieldByName('NoPayMoney').AsFloat;
          //qyDet.FieldByName('NowPayMoney').AsFloat := SalePayInvoiceRfFM.qyFind.FieldByName('NoPayMoney').AsFloat;
          qyDet.post;
          SalePayInvoiceRfFM.qyFind.Next;
        end;
      end;
    finally
      SalePayInvoiceRfFM.free;
      SalePayInvoiceRfFM := nil;
    end;
  except
  end;
end;

procedure TSalePayFM.btSaveClick(Sender: TObject);
var
  sNewNo: string;
  i: Integer;
begin
  try
    if cxPayM.Text='' then
    begin
      ShowBox('������д�տ���');
      Exit;
    end;
    qyHed.UpdateBatch;
    qyDet.UpdateBatch;
    TextReadOnly(Self, True);
    if cxEdtEditManName.Text <> '' then
      SetLog(sFMName, trim(cxEdtNo.Text), '�޸�')
    else
      SetLog(sFMName, trim(cxEdtNo.Text), '���');
    inherited;
    ShowBox('����ɹ�!');
  except
    on E: Exception do
    begin
      if pos('���ܽ�ֵ', E.Message) > 0 then
        ShowBox('�뽫��������д����!')
      else if pos('�����ظ���', e.Message) > 0 then
      begin
        try
          sNewNo := GetTableNO(sTableId, 'PayNo');
          if qyHed.FieldByName('PayNo').AsString = sNewNo then
          begin
            ShowBox('�������ظ�!');
            Exit;
          end;
          if qyHed.State = dsBrowse then qyHed.Edit;
          if qyDet.State = dsBrowse then qyDet.Edit;

          qyHed.FieldByName('PayNo').AsString := sNewNo;
          qyDet.First;
          for i := 0 to qyDet.RecordCount - 1 do
          begin
            if qyDet.State = dsBrowse then qyDet.Edit;
            qyDet.FieldByName('PayNo').AsString := sNewNo;
            qyDet.Next;
          end;
          qyHed.UpdateBatch;
          qyDet.UpdateBatch;
          TextReadOnly(Self, true);

          inherited;
          ShowBox('����ɹ�!');
        except
          ShowError('����ʧ��!');
        end;
      end;
    end;
  end;
end;

procedure TSalePayFM.btTempClick(Sender: TObject);
var fNeedPayM, fHasPayM, fCanPayM: Double;
  i: Integer;
begin
  inherited;
  if qyDet.RecordCount = 0 then exit;
  if btSave.Enabled then
  begin
    //fNeedPayM := cxgrdtbv.DataController.Summary.FooterSummaryValues[3];
    cxObject.SetFocus;
    fCanPayM := qyHed.FieldByName('PayMoney').AsFloat;
    fHasPayM := 0;
    qyDet.First;
    for I := 0 to qyDet.RecordCount - 1 do
    begin
      fCanPayM := qyHed.FieldByName('PayMoney').AsFloat - fHasPayM;
      if fCanPayM >= qyDet.FieldByName('NoPayMoney').AsFloat then
      begin
        qyDet.Edit;
        qyDet.FieldByName('NowPayMoney').AsFloat := qyDet.FieldByName('NoPayMoney').AsFloat;
        fHasPayM := fHasPayM + qyDet.FieldByName('NoPayMoney').AsFloat;
      end
      else
      begin
        if fCanPayM > 0 then
        begin
          qyDet.Edit;
          qyDet.FieldByName('NowPayMoney').AsFloat := fCanPayM;
          fHasPayM := fHasPayM + fCanPayM;
        end
        else
        begin
          qyDet.Edit;
          qyDet.FieldByName('NowPayMoney').AsFloat := 0;
        end;
      end;
      qyDet.Next;
    end;
    btSaveClick(Sender);
  end;
end;

procedure TSalePayFM.btUnCheckClick(Sender: TObject);
begin
  inherited;
  AuditBill(sTableId, LoginId, sFMName, trim(cxEdtNo.text), qyHed, -1);
  ShowFMInfo(sTableId, qyHed);
end;

procedure TSalePayFM.cxEdtNoPropertiesChange(Sender: TObject);
begin
  inherited;
  with qyDet do
  begin
    if Active then Close;
    sql.Clear;
    sql.Add('select * from SalePayDTTB where PayNo=' + QuotedStr(trim(cxEdtNo.Text)));
    Open;
  end;
  ShowFMInfo(sTableId, qyHed);
end;

procedure TSalePayFM.cxObjectPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if btSave.Enabled = false then exit;

  if AButtonIndex = 0 then // ���ÿͻ�
  begin
    try
      CustQFM := TCustQFM.Create(nil);
      CustQFM.iSelectKind := 2; //��ѡ
      CustQFM.ShowModal;
      if CustQFM.sId <> '' then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('CustId').AsString := CustQFM.sId;
      end;
    finally
      CustQFM.Free;
      CustQFM := nil;
    end;
  end;
  if AButtonIndex = 1 then
  begin
    try
      SGeneralFM := TSGeneralFM.Create(nil);
      SGeneralFM.Caption := 'Ӧ�ռ���δ�տ�ͻ���ѯ';
      SGeneralFM.ShowModal;
      if (SGeneralFM.bHasSelect) and (SGeneralFM.qyFind.RecordCount > 0) then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('CustId').AsString := SGeneralFM.qyFind.FieldByName('�ͻ����').AsString;
        btReferClick(Sender); end;
    finally
      SGeneralFM.free;
      SGeneralFM := nil;
    end;
  end;
end;

procedure TSalePayFM.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  sFMId := 'SalePayFM';
  sFMName := Self.Caption;
  sTableId := 'SalePayHDTB';
  inherited;
  InitCbb('select PayModeName from PayModeTB where PayModeKind like ''%�տ�%''', cbbPayMode);
  qyHed.Open;
end;

procedure TSalePayFM.FormDestroy(Sender: TObject);
begin
  inherited;
  SalePayFM := nil;
end;

procedure TSalePayFM.FormShow(Sender: TObject);
begin
  inherited;
  TextReadOnly(Self, True);
end;

procedure TSalePayFM.qyDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qyDet.FieldByName('PayNo').AsString := qyHed.FieldByName('PayNo').AsString;
end;

procedure TSalePayFM.qyDetNowPayMoneyChange(Sender: TField);
begin
  inherited;
  //ShowBox(cxgrdtbv.DataController.Summary.FooterSummaryValues[3]);
  //ShowBox(IntToStr(cxgrdtbv.GetColumnByFieldName('NowPayMoney').Index));
end;

procedure TSalePayFM.qyHedCalcFields(DataSet: TDataSet);
begin
  inherited;
  CalcField(qyHed, DataFM.qyCust, ['CustId', 'NoPayM'], ['CustId', 'NoPayM']);
end;

procedure TSalePayFM.qyHedCustIdChange(Sender: TField);
begin
  inherited;
  CalcField(qyHed, DataFM.qyCust, ['CustId', 'CustName'], ['CustId', 'CustName']);
end;

procedure TSalePayFM.qyHedNewRecord(DataSet: TDataSet);
begin
  inherited;
  qyHed.Edit;
  qyHed.FieldByName('BillKind').AsString := '�����տ�';
end;

procedure TSalePayFM.qyHedPayMoneyChange(Sender: TField);
begin
  inherited;
  if qyHed.State = dsBrowse then qyHed.Edit;
  qyHed.FieldByName('FactMoney').AsFloat := qyHed.FieldByName('PayMoney').AsFloat;
end;

procedure TSalePayFM.smlntfldHedPrintNumChange(Sender: TField);
begin
  inherited;
  ShowFMInfo(sTableId, qyHed);
end;

end.

