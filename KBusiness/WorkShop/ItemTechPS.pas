unit ItemTechPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, BaseGrdPS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2010Blue, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, dxSkinsdxBarPainter, frxClass, frxDBSet,
  cxGridCustomPopupMenu, cxGridPopupMenu, Menus, ADODB, dxBar,
  cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxGroupBox, cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL, cxTLData, cxSplitter,
  cxButtonEdit, cxLabel, cxMemo, ADOInt, cxCheckBox, dxSkinDevExpressStyle,
  dxSkinSpringTime, dxSkinValentine, dxBarBuiltInMenu, cxNavigator;

type
  TItemTechFM = class(TBaseGrdFM)
    pnl1: TPanel;
    cxLabel2: TcxLabel;
    cxBtnItemCode: TcxDBButtonEdit;
    qyHedAutoID: TLargeintField;
    qyHedAutoNo: TStringField;
    qyHedbSelect: TBooleanField;
    qyHedTechNo: TStringField;
    qyHedBuildDate: TDateTimeField;
    qyHedTechVerName: TStringField;
    qyHedItemId: TStringField;
    qyHedItemCode: TStringField;
    qyHedItemPYCode: TStringField;
    qyHedItemName: TStringField;
    qyHedItemSpc: TStringField;
    qyHedItemPic: TStringField;
    qyHedItemUnit: TStringField;
    qyHedSubUnit: TStringField;
    qyHediFlag: TIntegerField;
    qyHedExchRate: TFMTBCDField;
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
    qyDetAutoID: TLargeintField;
    qyDetAutoNo: TStringField;
    qyDetbSelect: TBooleanField;
    qyDetTechNo: TStringField;
    qyDetItemId: TStringField;
    qyDetItemCode: TStringField;
    qyDetItemPYCode: TStringField;
    qyDetItemName: TStringField;
    qyDetItemSpc: TStringField;
    qyDetItemPic: TStringField;
    qyDetItemUnit: TStringField;
    qyDetSubUnit: TStringField;
    qyDetiFlag: TIntegerField;
    qyDetExchRate: TFMTBCDField;
    qyDetOrdinal: TSmallintField;
    qyDetTechName: TStringField;
    qyDetTopTech: TStringField;
    qyDetNextTech: TStringField;
    qyDetTechParam: TStringField;
    qyDetDeptId: TStringField;
    qyDetDeptName: TStringField;
    qyDetbFirst: TBooleanField;
    qyDetbLast: TBooleanField;
    qyDetCurePrice: TFMTBCDField;
    qyDetSpoilPrice: TFMTBCDField;
    qyDetWastePrice: TFMTBCDField;
    qyDetRemark: TStringField;
    cxgrdtbvOrdinal: TcxGridDBColumn;
    cxgrdtbvTechName: TcxGridDBColumn;
    cxgrdtbvTopTech: TcxGridDBColumn;
    cxgrdtbvNextTech: TcxGridDBColumn;
    cxgrdtbvTechParam: TcxGridDBColumn;
    cxgrdtbvDeptId: TcxGridDBColumn;
    cxgrdtbvDeptName: TcxGridDBColumn;
    cxgrdtbvbFirst: TcxGridDBColumn;
    cxgrdtbvbLast: TcxGridDBColumn;
    cxgrdtbvCurePrice: TcxGridDBColumn;
    cxgrdtbvSpoilPrice: TcxGridDBColumn;
    cxgrdtbvWastePrice: TcxGridDBColumn;
    cxgrdtbvRemark: TcxGridDBColumn;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxEdt1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxEdt2: TcxDBTextEdit;
    lbl14: TLabel;
    cxMoRemark: TcxDBMemo;
    cxPupEdtRemark: TcxDBPopupEdit;
    cxSplitter1: TcxSplitter;
    cxPageControl1: TcxPageControl;
    ��ƷBOM: TcxTabSheet;
    qyBand: TADOQuery;
    strngfldBandPId: TStringField;
    strngfldBandCid: TStringField;
    strngfldBandItemId: TStringField;
    strngfldBandItemCode: TStringField;
    strngfldBandChildId: TStringField;
    strngfldBandChildCode: TStringField;
    strngfldBandItemName: TStringField;
    strngfldBandItemSpc: TStringField;
    strngfldBandItemUnit: TStringField;
    strngfldBandItemSource: TStringField;
    strngfldBandProType: TStringField;
    qyBandDosage: TFMTBCDField;
    qyBandSubDosage: TFMTBCDField;
    qyBandWasteRate: TFMTBCDField;
    strngfldBandTechName: TStringField;
    strngfldBandDrawDept: TStringField;
    strngfldBandDeptName: TStringField;
    strngfldBandRemark: TStringField;
    qyBandiLevel: TIntegerField;
    qyBandBillNo: TStringField;
    dsBand: TDataSource;
    lstBand: TcxDBTreeList;
    cxdbtrlstclmnDBTreeList1ChildCode: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1ItemName: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1ItemSpc: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1ItemUnit: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1ItemSource: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1ProType: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1Dosage: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1SubDosage: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1WasteRate: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1TechName: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1DrawDept: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1DeptName: TcxDBTreeListColumn;
    cxdbtrlstclmnDBTreeList1iLevel: TcxDBTreeListColumn;
    Panel1: TPanel;
    Label10: TLabel;
    cxdbTopBillNo: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btAddLClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btDelLClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btUnCheckClick(Sender: TObject);
    procedure cxBtnItemCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure qyHedItemIdChange(Sender: TField);
    procedure qyDetAfterInsert(DataSet: TDataSet);
    procedure qyDetItemIdChange(Sender: TField);
    procedure cxgrdtbvTechNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxEdtNoPropertiesChange(Sender: TObject);
    procedure lstBandClick(Sender: TObject);
    procedure btRefClick(Sender: TObject);
    procedure cxgrdtbvDeptIdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    iMaxOrdinal: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ItemTechFM: TItemTechFM;

implementation

uses PublicPS, ControlPublicPS, ItemQPS, DataPS, BaseTechQPS, ItemTechQPS,DeptQPS;
{$R *.dfm}

procedure TItemTechFM.btAddClick(Sender: TObject);
begin
  try
    if (bRight) and (bAdd = false) then
    begin
      ShowWarn('��û�б����ݵ����Ȩ��,���ܲ���');
      exit;
    end;
    TextReadOnly(Self, false);
    inherited;
    qyHed.Append;
    qyHed.FieldByName('TechNo').AsString := GetTableNo(sTableId, 'TechNo');
    qyHed.FieldByName('BuildDate').AsDateTime := StrToDateTime(FormatDateTime('yyyy-mm-dd', SysDateTime));
    qyHed.FieldByName('MakeMan').AsString := LoginEmpId;
    qyHed.FieldByName('MakeManName').AsString := LoginEmpName;
    qyHed.FieldByName('MakeDate').AsDateTime := SysDateTime;
    qyHed.FieldByName('AuditFlag').AsInteger := 0;
    qyDet.Last;
    iMaxOrdinal := qyDet.FieldByName('Ordinal').AsInteger;
    qyDet.Edit;
  except
    on E: Exception do
      ShowWarn(e.Message);
  end;
end;

procedure TItemTechFM.btAddLClick(Sender: TObject);
begin
  try
    if qyHed.FieldByName('ItemId').AsString = '' then
    begin
      ShowBox('����ѡ���Ʒ��');
      Exit;
    end;
    qyDet.Last;
    iMaxOrdinal := qyDet.FieldByName('Ordinal').AsInteger;
    qyDet.Append;
  except
  end;
end;

procedure TItemTechFM.btCancelClick(Sender: TObject);
begin
  qyDet.CancelBatch();
  qyHed.CancelBatch();
  TextReadOnly(Self, True);
  inherited;
end;

procedure TItemTechFM.btDelClick(Sender: TObject);
var
  i: Integer;
  sBiilNo: string;
begin
  if (cxEdtNo.Text = '') or (qyHed.Active = false) then exit;
  qyHed.UpdateCursorPos;
  qyHed.Recordset.Resync(AdAffectcurrent, AdResyncAllValues);
  qyHed.Resync([]);
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
      ExeSql('Delete ItemTechDTTB where TechNo=' + QuotedStr(sBiilNo));
      ExeSql('Delete ItemTechHDTB where TechNo=' + QuotedStr(sBiilNo));
      with qyHed do
      begin
        if Active then Close;
        SQL.Clear;
        sql.Add('select * from ItemTechHDTB where IsNull(bMaxAudit,0)=0 ');
        Open;
      end;
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

procedure TItemTechFM.btDelLClick(Sender: TObject);
begin
  try
    inherited;
    qyDet.Delete;
  except
    ShowBox('ɾ��ʧ�ܣ�');
  end;
end;

procedure TItemTechFM.btEditClick(Sender: TObject);
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
  lstBand.OptionsData.Editing := False;
  qyHed.Edit;
  qyHed.FieldByName('EditMan').AsString := LoginEmpId;
  qyHed.FieldByName('EditManName').AsString := LoginEmpName;
  qyHed.FieldByName('EditDate').AsDateTime := SysDateTime;
end;

procedure TItemTechFM.btRefClick(Sender: TObject);
begin
  inherited;
  cxEdtNoPropertiesChange(Sender);
end;

procedure TItemTechFM.btSaveClick(Sender: TObject);
var
  sNewNo: string;
  i: Integer;
begin
  try
    qyHed.UpdateBatch;
    qyDet.UpdateBatch;
    TextReadOnly(Self, True);
    cxEdtNoPropertiesChange(Sender);
    if cxEdtEditManName.Text <> '' then
      SetLog(sFMName, trim(cxEdtNo.Text), '�޸�')
    else
      SetLog(sFMName, trim(cxEdtNo.Text), '���');
    //�������µ�����
    with DataFM.qyTemp do
    begin
      if active then close;
      sql.Clear;
      sql.Add('Exec prUpdateItemTech ' + QuotedStr(Trim(cxEdtNo.Text)));
      Open;
    end;
    btRefClick(Sender);
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
          sNewNo := GetTableNO(sTableId, 'TechNo');
          if qyHed.FieldByName('TechNo').AsString = sNewNo then
          begin
            ShowBox('�����ظ�����!');
            Exit;
          end;
          if qyHed.State = dsBrowse then qyHed.Edit;
          if qyDet.State = dsBrowse then qyDet.Edit;

          qyHed.FieldByName('TechNo').AsString := sNewNo;
          qyDet.First;
          for i := 0 to qyDet.RecordCount - 1 do
          begin
            if qyDet.State = dsBrowse then qyDet.Edit;
            qyDet.FieldByName('TechNo').AsString := sNewNo;
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

procedure TItemTechFM.btUnCheckClick(Sender: TObject);
begin
  inherited;
  AuditBill(sTableId, LoginId, sFMName, trim(cxEdtNo.text), qyHed, -1);
  ShowFMInfo(sTableId,qyHed);
end;

procedure TItemTechFM.cxBtnItemCodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if btSave.Enabled = False then Exit;
  try
    ItemQFM := TItemQFM.Create(nil);
    ItemQFM.sParam := '��Ʒ���Ʒ';
    ItemQFM.iSelectKind := 2;
    ItemQFM.ShowModal;
    if ItemQFM.bHasSelect then
    begin
      qyHed.FieldByName('ItemId').AsString := ItemQFM.qyFind.FieldByName('ItemId').AsString;
    end;
  finally
    ItemQFM.Free;
    ItemQFM := nil;
  end;
end;

procedure TItemTechFM.cxEdtNoPropertiesChange(Sender: TObject);
begin
  inherited;
  with qyDet do
  begin
    if Active then Close;
    sql.Clear;
    sql.Add('select * from ItemTechDTTB where TechNo=' + QuotedStr(trim(cxEdtNo.Text)) + ' Order by Ordinal');
    Open;
  end;
  if DataFM.qyPyCode.Active = false then DataFM.qyPyCode.Open;
  ShowFMInfo(sTableId,qyHed);
end;

procedure TItemTechFM.cxgrdtbvDeptIdPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
    try
      DeptQFM := TDeptQFM.Create(nil);
      DeptQFM.iSelectKind := 2;
      DeptQFM.ShowModal;
      if DeptQFM.sId <> '' then
      begin
        if qyDet.State = dsBrowse then qyDet.Edit;
        qyDet.FieldByName('DeptId').AsString := DeptQFM.sId;
        qyDet.FieldByName('DeptName').AsString := DeptQFM.sName;
      end;
    finally
      DeptQFM.Free;
      DeptQFM := nil;
    end;
end;

procedure TItemTechFM.cxgrdtbvTechNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  i: Integer;
begin
  if btSave.Enabled = False then Exit;
  if qyHed.FieldByName('ItemId').AsString = '' then
  begin
    ShowBox('����ѡ���Ʒ��');
    Exit;
  end;
  try
    BaseTechQFM := TBaseTechQFM.Create(nil);
    BaseTechQFM.iSelectKind := 2;
    BaseTechQFM.ShowModal;

    if BaseTechQFM.iFlag <> 3 then
    begin
      BaseTechQFM.qyFind.Filter := ' bSelect=1';
      BaseTechQFM.qyFind.Filtered := true;
      BaseTechQFM.qyFind.First;
      for i := 0 to BaseTechQFM.qyFind.RecordCount - 1 do
      begin
        if i = 0 then
        begin
          qyDet.Edit;
          qyDetAfterInsert(qyDet);
        end
        else
          qyDet.Append;
        qyDet.FieldByName('TechName').AsString := BaseTechQFM.qyFind.FieldByName('TechName').AsString;
        qyDet.FieldByName('TechParam').AsString := BaseTechQFM.qyFind.FieldByName('TechParam').AsString;
        qyDet.FieldByName('DeptId').AsString := BaseTechQFM.qyFind.FieldByName('DeptId').AsString;
        qyDet.FieldByName('DeptName').AsString := BaseTechQFM.qyFind.FieldByName('DeptName').AsString;
        qyDet.FieldByName('CurePrice').AsFloat := BaseTechQFM.qyFind.FieldByName('CurePrice').AsFloat;
        qyDet.FieldByName('SpoilPrice').AsFloat := BaseTechQFM.qyFind.FieldByName('SpoilPrice').AsFloat;
        qyDet.FieldByName('WastePrice').AsFloat := BaseTechQFM.qyFind.FieldByName('WastePrice').AsFloat;
        //UpdateData(cxgrdtbv, 'Dosage');
        qyDet.post;
        BaseTechQFM.qyFind.Next;
      end;
    end;
  finally
    BaseTechQFM.Free;
    BaseTechQFM := nil;
  end;
end;

procedure TItemTechFM.FormCreate(Sender: TObject);
begin
  sFMId := 'ItemTechFM';
  sFMName := Self.Caption;
  sTableId := 'ItemTechHDTB';
  inherited;
  qyHed.Open;
end;

procedure TItemTechFM.FormDestroy(Sender: TObject);
begin
  inherited;
  ItemTechFM := nil;
end;

procedure TItemTechFM.FormShow(Sender: TObject);
begin
  inherited;
  with qyBand do
  begin
    if active then close;
    sql.Clear;
    sql.Add('Exec prBomOpen ' + QuotedStr(Trim(cxdbTopBillNo.Text)));
    Open;
    lstBand.FullExpand;
  end;
end;

procedure TItemTechFM.lstBandClick(Sender: TObject);
begin
  inherited;
  with qyHed do
  begin
    if Active then Close;
    sql.Clear;
    sql.Add('select * from ItemTechHDTB where ItemId=' + QuotedStr(qyBand.FieldByName('ChildId').AsString));
    Open;
  end;
end;

procedure TItemTechFM.qyDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qyDet.FieldByName('TechNo').AsString := qyHed.FieldByName('TechNo').AsString;
  qyDet.FieldByName('ItemId').AsString := qyHed.FieldByName('ItemId').AsString;
  qyDet.FieldByName('Ordinal').AsInteger := iMaxOrdinal - (iMaxOrdinal mod 10) + 10;
  qyDet.FieldByName('bFirst').AsBoolean := False;
  qyDet.FieldByName('bLast').AsBoolean := False;
end;

procedure TItemTechFM.qyDetItemIdChange(Sender: TField);
begin
  inherited;
  CalcField(qyHed, DataFM.qyItem, ['ItemId', 'ItemCode', 'ItemPYCode', 'ItemName', 'ItemSpc', 'ItemPic', 'ItemUnit', 'SubUnit', 'ExchRate', 'iFlag'], ['ItemId', 'ItemCode', 'ItemPYCode', 'ItemName', 'ItemSpc', 'ItemPic', 'ItemUnit', 'SubUnit', 'ExchRate', 'iFlag']);
end;

procedure TItemTechFM.qyHedItemIdChange(Sender: TField);
begin
  inherited;
  CalcField(qyHed, DataFM.qyItem, ['ItemId', 'ItemCode', 'ItemPYCode', 'ItemName', 'ItemSpc', 'ItemPic', 'ItemUnit', 'SubUnit', 'ExchRate', 'iFlag'], ['ItemId', 'ItemCode', 'ItemPYCode', 'ItemName', 'ItemSpc', 'ItemPic', 'ItemUnit', 'SubUnit', 'ExchRate', 'iFlag']);
end;

end.

