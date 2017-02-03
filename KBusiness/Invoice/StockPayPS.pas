unit StockPayPS;

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
  TStockPayFM = class(TBaseGrdFM)
    Label11: TLabel;
    cxBtReqMan: TcxDBButtonEdit;
    Label13: TLabel;
    cbbPayMode: TcxDBComboBox;
    Label15: TLabel;
    Label14: TLabel;
    cxMoRemark: TcxDBMemo;
    cxPupEdtRemark: TcxDBPopupEdit;
    cxRgpFlag: TcxDBRadioGroup;
    qyHedAutoID: TLargeintField;
    qyHedPayNO: TStringField;
    qyHedPayDate: TDateTimeField;
    qyHedBillKind: TStringField;
    qyHedSignFlag: TSmallintField;
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
    qyHedEmpName: TStringField;
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
    strngfldHedPrvId: TStringField;
    strngfldHedPrvName: TStringField;
    cxObject: TcxDBButtonEdit;
    cxPayM: TcxDBCurrencyEdit;
    cxLabel1: TcxLabel;
    cxFactM: TcxDBCurrencyEdit;
    cxLabel3: TcxLabel;
    cxRgpBillKind: TcxDBRadioGroup;
    Label12: TLabel;
    Label10: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxAccName: TcxDBMRUEdit;
    cxLabel4: TcxLabel;
    cxCNItemName: TcxDBMRUEdit;
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btAddLClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDelLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qyHedCalcFields(DataSet: TDataSet);
    procedure btSaveClick(Sender: TObject);
    procedure cxBt1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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
    procedure cxAccNamePropertiesButtonClick(Sender: TObject);
    procedure cxCNItemNamePropertiesButtonClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;
var
  StockPayFM: TStockPayFM;

implementation
uses PublicPS, DataPS, EmpQPS, ItemQPS, DeptQPS, PrvQPS, StockPayFindPS, StockPayInvoiceRfPS, SGeneralPS, CNAccNameQPS, CNItemQPS;
{$R *.dfm}

procedure TStockPayFM.btAddClick(Sender: TObject);
begin
  try
    if (bRight) and (bAdd = false) then
    begin
      ShowWarn('��û�б����ݵ����Ȩ��,���ܲ���');
    end;
    TextReadOnly(Self, false);
    inherited;
    qyHed.Append;
    qyHed.FieldByName('PayNo').AsString := GetTableNo(sTableId, 'PayNo');
    qyHed.FieldByName('PayDate').AsDateTime := StrToDateTime(FormatDateTime('yyyy-mm-dd', SysDateTime));
    qyHed.FieldByName('SignFlag').AsInteger := 1;
    qyHed.FieldByName('MakeMan').AsString := LoginEmpId;
    qyHed.FieldByName('MakeManName').AsString := LoginEmpName;
    qyHed.FieldByName('MakeDate').AsDateTime := SysDateTime;
    qyHed.FieldByName('AuditFlag').AsInteger := 0;
    //if qyDet.Active then qyDet.Edit;
  except
    on E: Exception do
      ShowWarn(E.Message);
  end;
end;

procedure TStockPayFM.btAddLClick(Sender: TObject);
begin
  try
    qyDet.Append;
  except
  end;
end;

procedure TStockPayFM.btCancelClick(Sender: TObject);
begin
  if qyDet.Active then qyDet.CancelBatch();
  qyHed.CancelBatch();
  TextReadOnly(Self, True);
  inherited;
end;

procedure TStockPayFM.btCheckClick(Sender: TObject);
begin
  //inherited;
  if bHaveData(DataFM.qyTemp, 'select AutoId from StockPayDTTB where PayNo=' + QuotedStr(Trim(cxEdtNo.Text)) + ' and IsNull(NoPayMoney,0)>0 and IsNull(NowPayMOney,0)=0') <> '' then
  begin
    ShowBox('�м�¼û�к������,����������ť');
    Exit;
  end;

  if AuditBill(sTableId, LoginId, sFMName, trim(cxEdtNo.text), qyHed, 1) then
  begin
    if bPayToCN then
    begin
      if cxAccName.Text = '' then
      begin
        ShowBox('��ѡ������˻���');
        Exit;
      end;
      if cxCNItemName.Text = '' then
      begin
        ShowBox('��ѡ����֧��Ŀ��');
        Exit;
      end;
      ExeSql('exec PrPayToCN ' + QuotedStr(Trim(cxEdtNo.Text)) + ',''���'' ');
    end;
  end;
  AuditBill(sTableId, LoginId, sFMName, trim(cxEdtNo.text), qyHed, 1);
  ShowFMInfo(sTableId, qyHed);
end;

procedure TStockPayFM.btDelClick(Sender: TObject);
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

procedure TStockPayFM.btDelLClick(Sender: TObject);
begin
  try
    qyDet.Delete;
  except
    ShowBox('ɾ��ʧ�ܣ�');
  end;
end;

procedure TStockPayFM.btEditClick(Sender: TObject);
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
  inherited;
  qyHed.Edit;
  qyHed.FieldByName('EditMan').AsString := LoginEmpId;
  qyHed.FieldByName('EditManName').AsString := LoginEmpName;
  qyHed.FieldByName('EditDate').AsDateTime := SysDateTime;
end;

procedure TStockPayFM.btFindClick(Sender: TObject);
begin
  inherited;
  try
    if not Assigned(StockPayFindFM) then
      StockPayFindFM := TStockPayFindFM.Create(Application);
    StockPayFindFM.ShowModal;
    if StockPayFindFM.sBillNo <> '' then
    begin
      with qyHed do
      begin
        if Active then Close;
        SQL.Clear;
        SQL.Add('select * from StockPayHDTB where PayNo in (' + StockPayFindFM.sBillNo + ')');
        Open;
      end;
    end;
  finally
    StockPayFindFM.Free;
    StockPayFindFM := nil
  end;
end;

procedure TStockPayFM.btReferClick(Sender: TObject);
var
  i: integer;
  sRfid: string;
begin
  try
    if cxObject.text = '' then
    begin
      ShowBox('����ѡ��Ӧ�̣�');
      Exit;
    end;
    try
      StockPayInvoiceRfFM := TStockPayInvoiceRfFM.Create(nil);
      StockPayInvoiceRfFM.btFindClick(self);
      StockPayInvoiceRfFM.ShowModal;
      if StockPayInvoiceRfFM.fFlag = 1 then
      begin
        StockPayInvoiceRfFM.qyFind.Filter := ' bSelect=1';
        StockPayInvoiceRfFM.qyFind.Filtered := true;
        StockPayInvoiceRfFM.qyFind.First;
        for i := 0 to StockPayInvoiceRfFM.qyFind.RecordCount - 1 do
        begin
          if i = 0 then
          begin
            qyDet.Edit;
            qyDetAfterInsert(qyDet);
          end
          else
            qyDet.Append;
          qyDet.FieldByName('InvoiceNo').AsString := StockPayInvoiceRfFM.qyFind.FieldByName('InvoiceNo').AsString;
          qyDet.FieldByName('InvoiceMoney').AsFloat := StockPayInvoiceRfFM.qyFind.FieldByName('InvoiceMoney').AsFloat;
          qyDet.FieldByName('HasPayMoney').AsFloat := StockPayInvoiceRfFM.qyFind.FieldByName('HasPayMoney').AsFloat;
          qyDet.FieldByName('NoPayMoney').AsFloat := StockPayInvoiceRfFM.qyFind.FieldByName('NoPayMoney').AsFloat;
          //qyDet.FieldByName('NowPayMoney').AsFloat := StockPayInvoiceRfFM.qyFind.FieldByName('NoPayMoney').AsFloat;
          qyDet.post;
          StockPayInvoiceRfFM.qyFind.Next;
        end;
      end;
    finally
      StockPayInvoiceRfFM.free;
      StockPayInvoiceRfFM := nil;
    end;
  except
  end;
end;

procedure TStockPayFM.btSaveClick(Sender: TObject);
var
  sNewNo: string;
  i: Integer;
begin
  try
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

procedure TStockPayFM.btTempClick(Sender: TObject);
var fNeedPayM, fHasPayM, fCanPayM: Double;
  i: Integer;
begin
  inherited;
  if qyDet.RecordCount = 0 then exit;
  if btSave.Enabled then
  begin
    //fNeedPayM := cxgrdtbv.DataController.Summary.FooterSummaryValues[3];
    cxFactM.SetFocus;
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


procedure TStockPayFM.btUnCheckClick(Sender: TObject);
begin
  inherited;
  if AuditBill(sTableId, LoginId, sFMName, trim(cxEdtNo.text), qyHed, -1) then
  begin
    if bPayToCN then
      ExeSql('Delete CNBillTB where SubjoinNo=' + QuotedStr(trim(cxEdtNo.text)));
  end;
  ShowFMInfo(sTableId, qyHed);
end;

procedure TStockPayFM.cxAccNamePropertiesButtonClick(Sender: TObject);
begin
  inherited;
  try
    try
      if not btSave.Enabled then Exit;
      CNAccNameQFM := TCNAccNameQFM.Create(nil);
      CNAccNameQFM.iSelectKind := 2;
      CNAccNameQFM.sPubWhere := '';
      CNAccNameQFM.ShowModal;
      if CNAccNameQFM.iFlag <> 3 then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('AccName').AsString := CNAccNameQFM.sName;
      end;
    finally
      CNAccNameQFM.Free;
      CNAccNameQFM := nil;
    end;
  except
  end;
end;

procedure TStockPayFM.cxBt1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  try
    if btSave.Enabled = False then Exit;
    try
      EmpQFM := TEmpQFM.Create(nil);
      EmpQFM.iSelectKind := 2; //��ѡ
      EmpQFM.ShowModal;
      if EmpQFM.sId <> '' then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('EmpId').AsString := EmpQFM.sId;
      end;
    finally
      EmpQFM.Free;
      EmpQFM := nil;
    end;
  except
  end;
end;

procedure TStockPayFM.cxCNItemNamePropertiesButtonClick(Sender: TObject);
begin
  inherited;
  try
    try
      if not btSave.Enabled then Exit;
      CNItemQFM := TCNItemQFM.Create(nil);
      CNItemQFM.iSelectKind := 2;
      CNItemQFM.sPubWhere := ' and (iFlag=0 or iFlag=-1)';
      CNItemQFM.ShowModal;
      if CNItemQFM.iFlag <> 3 then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('CNItemName').AsString := CNItemQFM.sName;
      end;
    finally
      CNItemQFM.Free;
      CNItemQFM := nil;
    end;
  except
  end;
end;

procedure TStockPayFM.cxEdtNoPropertiesChange(Sender: TObject);
begin
  inherited;
  with qyDet do
  begin
    if Active then Close;
    sql.Clear;
    sql.Add('select * from StockPayDTTB where PayNo=' + QuotedStr(trim(cxEdtNo.Text)));
    Open;
  end;
  if DataFM.qyPyCode.Active = false then DataFM.qyPyCode.Open;
  ShowFMInfo(sTableId, qyHed);
end;

procedure TStockPayFM.cxObjectPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if btSave.Enabled = false then exit;

  if AButtonIndex = 0 then // ���ù�Ӧ��
  begin
    try
      PrvQFM := TPrvQFM.Create(nil);
      PrvQFM.iSelectKind := 2; //��ѡ
      PrvQFM.ShowModal;
      if PrvQFM.sId <> '' then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('PrvId').AsString := PrvQFM.sId;
      end;
    finally
      PrvQFM.Free;
      PrvQFM := nil;
    end;
  end;
  if AButtonIndex = 1 then
  begin
    try
      SGeneralFM := TSGeneralFM.Create(nil);
      SGeneralFM.Caption := 'Ӧ������δ���Ӧ�̲�ѯ';
      SGeneralFM.ShowModal;
      if (SGeneralFM.bHasSelect) and (SGeneralFM.qyFind.RecordCount > 0) then
      begin
        if qyHed.State = dsBrowse then qyHed.Edit;
        qyHed.FieldByName('PrvId').AsString := SGeneralFM.qyFind.FieldByName('��Ӧ�̱��').AsString;
        btReferClick(Sender); end;
    finally
      SGeneralFM.free;
      SGeneralFM := nil;
    end;
  end;
end;

procedure TStockPayFM.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  sFMId := 'StockPayFM';
  sFMName := Self.Caption;
  sTableId := 'StockPayHDTB';
  inherited;
  InitCbb('select PayModeName from PayModeTB where PayModeKind like ''%����%''', cbbPayMode);
  qyHed.Open;
  cxgrdtbv.DataController.GetItemByFieldName('Remark').Options.Editing := false;
end;

procedure TStockPayFM.FormDestroy(Sender: TObject);
begin
  inherited;
  StockPayFM := nil;
end;

procedure TStockPayFM.FormShow(Sender: TObject);
begin
  inherited;
  TextReadOnly(Self, True);
  InItCbb('select AccName from CNAccNameTB Order by AccKind', cxAccName);
  InItCbb('select CNItemName from CNItemTB where (iFlag=0 or iFlag=-1) and Not Exists(select AutoID from CNItemTB m where CNItemTB.ID=m.ParentId) order by ID ', cxCNItemName);
end;

procedure TStockPayFM.qyDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qyDet.FieldByName('PayNo').AsString := qyHed.FieldByName('PayNo').AsString;
end;

procedure TStockPayFM.qyDetNowPayMoneyChange(Sender: TField);
begin
  inherited;
  //ShowBox(cxgrdtbv.DataController.Summary.FooterSummaryValues[3]);
  //ShowBox(IntToStr(cxgrdtbv.GetColumnByFieldName('NowPayMoney').Index));
end;

procedure TStockPayFM.qyHedCalcFields(DataSet: TDataSet);
begin
  inherited;
  CalcField(qyHed, DataFM.qyPrv, ['PrvId', 'PrvName'], ['PrvId', 'PrvName']);
  CalcField(qyHed, DataFM.qyEmp, ['EmpId', 'EmpName'], ['EmpId', 'EmpName']);
end;

procedure TStockPayFM.qyHedNewRecord(DataSet: TDataSet);
begin
  inherited;
  qyHed.Edit;
  qyHed.FieldByName('BillKind').AsString := '�ջ�����';
end;

procedure TStockPayFM.qyHedPayMoneyChange(Sender: TField);
begin
  inherited;
  if qyHed.State = dsBrowse then qyHed.Edit;
  qyHed.FieldByName('FactMoney').AsFloat := qyHed.FieldByName('PayMoney').AsFloat;
end;

procedure TStockPayFM.smlntfldHedPrintNumChange(Sender: TField);
begin
  inherited;
  ShowFMInfo(sTableId, qyHed);
end;

end.

