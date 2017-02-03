unit CNItemPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasePS, dxSkinsCore, dxSkinsdxBarPainter,
  dxSkinsDefaultPainters, DB, ADODB, dxBar, cxClasses, ComCtrls, dxtree,
  dxdbtree, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxTLData, cxDBTL, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, StdCtrls, cxMemo, cxCheckBox, dxSkinscxPCPainter, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  frxClass, frxDBSet, Menus, cxButtons, dxSkinOffice2010Blue, cxLabel,
  cxMaskEdit, dxSkinDevExpressStyle, dxSkinSpringTime, dxSkinValentine,
  cxDropDownEdit;

type
  TCNItemFM = class(TBaseFM)
    pnlGest: TPanel;
    pnlTitle: TPanel;
    frxdt1: TfrxDBDataset;
    Panel1: TPanel;
    cxTrl: TcxDBTreeList;
    cxLabel1: TcxLabel;
    qyHedAutoID: TAutoIncField;
    qyHedID: TStringField;
    qyHedParentId: TStringField;
    qyHedbSelect: TBooleanField;
    qyHedCNItemName: TStringField;
    qyHediFlag: TSmallintField;
    qyHedFZObject: TStringField;
    qyHedAccSubjectId: TStringField;
    qyHedRemark: TStringField;
    qyHedMakeDate: TDateTimeField;
    qyHedMakeMan: TStringField;
    qyHedMakeManName: TStringField;
    cxTrlCNItemName: TcxDBTreeListColumn;
    cxTrliFlag: TcxDBTreeListColumn;
    cxTrlFZObject: TcxDBTreeListColumn;
    cxTrlAccSubjectId: TcxDBTreeListColumn;
    cxTrlRemark: TcxDBTreeListColumn;
    qyHedsFlag: TStringField;
    Panel2: TPanel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btAddLClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qyHedsFlagChange(Sender: TField);
    procedure qyHedAfterInsert(DataSet: TDataSet);
  private
    {Private declarations}
    sFlag:String;
    procedure GetTreeId(InId: string; iFlag: Integer);
  public
    {Public declarations}
  end;

var
  CNItemFM: TCNItemFM;

implementation

uses MainPS, PublicPS, DataPS;
{$R *.dfm}

procedure TCNItemFM.btAddClick(Sender: TObject);
var
  sId: string;
begin
  try
    inherited;
    sId := qyHed.FieldByName('Id').AsString;
    sFlag:= qyHed.FieldByName('sFlag').AsString;
    qyHed.Append;
    GetTreeId(sId, 2)
  except
  end;
end;

procedure TCNItemFM.btAddLClick(Sender: TObject);
var
  sId: string;
begin
  try
    sId := qyHed.FieldByName('Id').AsString;
    TextReadOnly(Self, False);
    qyHed.Append;
    GetTreeId(sId, 1);
  except
    ShowWarn('���ʧ��');
  end;
end;

procedure TCNItemFM.btCancelClick(Sender: TObject);
begin
  qyHed.CancelBatch();
  TextReadOnly(Self, true);
  inherited;
end;

procedure TCNItemFM.btDelClick(Sender: TObject);
begin
  try
    inherited;
    if qyHed.FieldByName('Id').AsString = '000' then Exit;
    if (not qyHed.IsEmpty) then
    begin
      if bHaveData(DataFM.qyTemp,'select AutoId from CNBillTB where CNItemName='+QuotedStr(qyHed.FieldByName('CNItemName').AsString))<>'' then
      begin
        ShowBox('����֧��Ŀ�Ѿ������ɼ���ʹ��');
        Exit;
      end;
      if cxTrl.FocusedNode.HasChildren then
      begin
        showbox('�����¼����ݣ�����ɾ����');
        exit;
      end
      else
      begin
        if ShowDlg('ȷ��Ҫɾ����') then
        begin
          qyHed.Delete;
          qyHed.UpdateBatch();
        end;
      end;
    end;
  finally
  end;
end;

procedure TCNItemFM.btEditClick(Sender: TObject);
begin
  try
    inherited;
    qyHed.Edit;
    cxTrl.Columns[1].Focused := true;
  except
  end;
end;

procedure TCNItemFM.btSaveClick(Sender: TObject);
begin
  try
    if qyHed.FieldByName('CNItemName').AsString = '' then
    begin
      showbox('��֧��Ŀ���Ʋ���Ϊ��');
      exit;
    end;
    qyHed.UpdateBatch();
    //ˢ��DataFM������
    with DataFM.qyCNItem do
    begin
      if Active then  Close;
      SQL.Clear;
      SQL.Add('select * from CNItemTB');
      Open;
    end;
    showbox('����ɹ���');
    TextReadOnly(Self, true);
    inherited;
  except
    on E: Exception do
    begin
      if pos('���в������ֵ', E.Message) > 0 then
        showbox('�뽫�����������д����')
      else
        ShowWarn(E.Message);
    end;
  end;
end;

procedure TCNItemFM.GetTreeId(InId: string; iFlag: Integer);
begin
  try
    with DataFM.qyTemp do
    begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('Exec PrGetTreeId ' + QuotedStr(InId) + ',' + QuotedStr(IntToStr(iFlag))+ ',' +'''CNItemTB''');
      Open;
    end;
    if DataFM.qyTemp.RecordCount > 0 then
    begin
      if qyHed.State = dsBrowse then
        qyHed.Edit;
      qyHed.FieldByName('ParentId').AsString := DataFM.qyTemp.FieldByName('ParentId').AsString;
      qyHed.FieldByName('Id').AsString := DataFM.qyTemp.FieldByName('OutId').AsString;
    end;
  except
    on E: Exception do
      ShowWarn(E.Message);
  end;
end;

procedure TCNItemFM.qyHedAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qyHed.FieldByName('sFlag').AsString:=sFlag;
end;

procedure TCNItemFM.qyHedsFlagChange(Sender: TField);
begin
  inherited;
  if qyHed.State = dsBrowse then qyHed.Edit;
  if qyHed.FieldByName('sFlag').AsString='��' then
      qyHed.FieldByName('iFlag').AsInteger :=1;
  if qyHed.FieldByName('sFlag').AsString='֧' then
      qyHed.FieldByName('iFlag').AsInteger :=-1;
end;

procedure TCNItemFM.FormCreate(Sender: TObject);
begin
  sFMId := 'CNItemFM';
  sFMName := Self.Caption;
  inherited;
  if not qyHed.Active then
    qyHed.Open;
end;

procedure TCNItemFM.FormDestroy(Sender: TObject);
begin
  CNItemFM := nil;
end;

procedure TCNItemFM.FormShow(Sender: TObject);
begin
  inherited;
  cxtrl.FullExpand;
end;

end.
