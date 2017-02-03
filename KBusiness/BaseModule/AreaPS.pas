unit AreaPS;

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
  cxMaskEdit;

type
  TAreaFM = class(TBaseFM)
    pnlGest: TPanel;
    pnlTitle: TPanel;
    qyHedAutoId: TAutoIncField;
    strngfldHedAreaId: TStringField;
    strngfldHedAreaCode: TStringField;
    strngfldHedAreaName: TStringField;
    strngfldHedParentId: TStringField;
    strngfldHedRemark: TStringField;
    strngfldHedParentName: TStringField;
    labTitle: TLabel;
    frxdt1: TfrxDBDataset;
    Panel1: TPanel;
    cxTrl: TcxDBTreeList;
    cxDBTreeList1AreaCode: TcxDBTreeListColumn;
    cxDBTreeList1AreaName: TcxDBTreeListColumn;
    cxDBTreeList1Remark: TcxDBTreeListColumn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btAddLClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure GetAreaId(InId: string; iFlag: Integer);
    procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    {Private declarations}
  public
    {Public declarations}
  end;

var
  AreaFM: TAreaFM;

implementation

uses MainPS, PublicPS, DataPS;
{$R *.dfm}

procedure TAreaFM.btAddClick(Sender: TObject);
var
  sId: string;
begin
  try
    inherited;
    sId := qyHed.FieldByName('AreaId').AsString;
    qyHed.Append;
    GetAreaId(sId, 2)
  except
  end;
end;

procedure TAreaFM.btAddLClick(Sender: TObject);
var
  sId: string;
begin
  try
    sId := qyHed.FieldByName('AreaId').AsString;
    TextReadOnly(Self, False);
    qyHed.Append;
    GetAreaId(sId, 1);
  except
    ShowWarn('���ʧ��');
  end;
end;

procedure TAreaFM.btCancelClick(Sender: TObject);
begin
  qyHed.CancelBatch();
  TextReadOnly(Self, true);
  inherited;
end;

procedure TAreaFM.btDelClick(Sender: TObject);
begin
  try
    inherited;
    if qyHed.FieldByName('AreaId').AsString = '00' then Exit;
    if (not qyHed.IsEmpty) then
    begin
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

procedure TAreaFM.btEditClick(Sender: TObject);
begin
  try
    inherited;
    qyHed.Edit;
    cxTrl.Columns[1].Focused := true;
  except
  end;
end;

procedure TAreaFM.btSaveClick(Sender: TObject);
begin
  try
    if qyHed.FieldByName('AreaName').AsString = '' then
    begin
      showbox('���Ʋ���Ϊ��');
      exit;
    end;
    qyHed.UpdateBatch();
    showbox('����ɹ���');
    TextReadOnly(Self, true);
    inherited;
  except
    on E: Exception do
    begin
      if pos('���в������ֵ', E.Message) > 0 then
        showbox('�뽫�����������д����');
      if pos('�����ظ���', E.Message) > 0 then
      begin
        ShowWarn('���ܴ����ظ������ǲ�����ģ�');
        exit;
      end;
    end;
  end;
end;

procedure TAreaFM.GetAreaId(InId: string; iFlag: Integer);
begin
  try
    with DataFM.qyTemp do
    begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('Exec PrGetAreaId ' + QuotedStr(InId) + ',' + QuotedStr(IntToStr(iFlag)));
      Open;
    end;
    if DataFM.qyTemp.RecordCount > 0 then
    begin
      if qyHed.State = dsBrowse then
        qyHed.Edit;
      qyHed.FieldByName('ParentId').AsString := DataFM.qyTemp.FieldByName('ParentId').AsString;
      qyHed.FieldByName('AreaCode').AsString := DataFM.qyTemp.FieldByName('OutId').AsString;
      qyHed.FieldByName('AreaId').AsString := DataFM.qyTemp.FieldByName('OutId').AsString;
    end;
  except
    on E: Exception do
      ShowWarn(E.Message);
  end;
end;

procedure TAreaFM.FormCreate(Sender: TObject);
begin
  sFMId := 'AreaFM';
  sFMName := Self.Caption;
  inherited;
  if not qyHed.Active then
    qyHed.Open;
end;

procedure TAreaFM.FormDestroy(Sender: TObject);
begin
  AreaFM := nil;
end;

procedure TAreaFM.FormShow(Sender: TObject);
begin
  inherited;
  cxtrl.FullExpand;
end;

end.
