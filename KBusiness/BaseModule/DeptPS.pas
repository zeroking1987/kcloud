unit DeptPS;

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
  frxClass, frxDBSet, Menus, cxButtons, cxButtonEdit, Mask, cxMaskEdit,
  cxDropDownEdit, AdoInt, dxSkinOffice2010Blue, cxLabel;

type
  TDeptFM = class(TBaseFM)
    pnlLeft: TPanel;
    pnlEdit: TPanel;
    pnlGest: TPanel;
    tv: TdxDBTreeView;
    cxdbEdtId: TcxDBTextEdit;
    cxdbEdtCode: TcxDBTextEdit;
    cxdbEdtName: TcxDBTextEdit;
    cxdbEdtParentId: TcxDBTextEdit;
    cxdbMoRemark: TcxDBMemo;
    pnlTitle: TPanel;
    frxHed: TfrxDBDataset;
    qyHedAutoId: TAutoIncField;
    strngfldHedParentId: TStringField;
    strngfldHedRemark: TStringField;
    strngfldHedParentName: TStringField;
    qyHedDeptId: TStringField;
    qyHedDeptCode: TStringField;
    qyHedDeptName: TStringField;
    qyHedPrincipal: TStringField;
    labTitle: TLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxDBButtonEdit1: TcxDBButtonEdit;
    qyHedbSelect: TBooleanField;
    qyHedWareId: TStringField;
    qyHedWareName: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btAddLClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure GetDeptId(InId: string; iFlag: Integer);
    procedure btCancelClick(Sender: TObject);
    procedure tvCustomDraw(Sender: TObject; TreeNode: TTreeNode; AFont: TFont; var AColor, ABkColor: TColor);
    procedure qyHedCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeptFM: TDeptFM;

implementation

uses MainPS, PublicPS, DataPS;
{$R *.dfm}

procedure TDeptFM.btAddClick(Sender: TObject);
var
  sId: string;
begin
  try
    inherited;
    sId := '';
    cxdbEdtId.Properties.ReadOnly := true;
    cxdbEdtParentId.Properties.ReadOnly := true;
    sId := tv.GetKeyField.Text;
    qyHed.Append;
    GetDeptId(sId, 2);
    cxdbEdtName.SetFocus;
  except
  end;
end;

procedure TDeptFM.btAddLClick(Sender: TObject);
var
  sId: string;
begin
  try
    if tv.Selected.IsFirstNode then
    begin
      showbox('��Ŀ¼�������ͬ���ڵ�');
      exit;
    end;
    sId := '';
    TextReadOnly(Self, False);
    cxdbEdtId.Properties.ReadOnly := true;
    cxdbEdtParentId.Properties.ReadOnly := true;
    sId := tv.GetKeyField.Text;
    qyHed.Append;
    GetDeptId(sId, 1);
  except
    showbox('���ʧ��');
  end;
end;

procedure TDeptFM.btCancelClick(Sender: TObject);
begin
  qyHed.CancelBatch();
  TextReadOnly(Self, true);
  inherited;
end;

procedure TDeptFM.btDelClick(Sender: TObject);
begin
  try
    inherited;
    if qyHed.FieldByName('DeptId').AsString = '00' then Exit;
    if (tv.Selected <> nil) then
    begin
      if tv.Selected.GetLastChild <> nil then
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

procedure TDeptFM.btEditClick(Sender: TObject);
begin
  try
    inherited;
    cxdbEdtId.Properties.ReadOnly := true;
    cxdbEdtParentId.Properties.ReadOnly := true;
    qyHed.Edit;
    if (tv.Selected <> nil) then
      tv.Selected.EditText;
    cxdbEdtName.SetFocus;
  except
  end;
end;

procedure TDeptFM.btSaveClick(Sender: TObject);
begin
  try
    if varIsNull(qyHed.FieldByName('DeptId').AsString) then
    begin
      if varIsNull(tv.DBTreeNodes.MaxKeyFieldValue) then
        qyHed.FieldByName('DeptId').AsInteger := 0;
      qyHed.FieldByName('DeptId').AsInteger := tv.DBTreeNodes.MaxKeyFieldValue + 1;
    end;
    if cxdbEdtCode.Text = '' then
    begin
      showbox('���Ų���Ϊ��');
      exit;
    end;
    qyHed.UpdateBatch();
    showbox('����ɹ���');
    TextReadOnly(Self, true);
    inherited;
  except
    on E: Exception do
    begin
      if (pos('���в������ֵ', E.Message) > 0) or (pos('���ܽ�ֵNULL������', E.Message) > 0) then
        showbox('������Ϊ������')
      else if pos('�����ظ���', E.Message) > 0 then
      begin
        ShowWarn('���ܴ����ظ������ǲ�����ģ�');
        exit;
      end;
    end;
  end;
end;

procedure TDeptFM.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  WareSelect(btSave.Enabled, qyHed, 'WareId', 2);
end;

procedure TDeptFM.GetDeptId(InId: string; iFlag: Integer);
begin
  try
    try
      with DataFM.spTemp do
      begin
        if Active then Close;
        Parameters.Clear;
        Procedurename := 'PrGetDeptId;1';
        Parameters.AddParameter.Name := '@InId';
        Parameters[0].Direction := pdInPut;
        Parameters[0].DataType := ftString;
        Parameters[0].Size := 50;
        Parameters[0].Value := InId;
        Parameters.AddParameter.Name := '@iFlag';
        Parameters[1].Direction := pdInPut;
        Parameters[1].DataType := ftString;
        Parameters[1].Size := 20;
        Parameters[1].Value := iFlag;
        Parameters.AddParameter.Name := '@ParentId';
        Parameters[2].Direction := pdOutPut;
        Parameters[2].DataType := ftString;
        Parameters[2].Size := 20;
        Parameters.AddParameter.Name := '@OutId';
        Parameters[3].Direction := pdOutPut;
        Parameters[3].DataType := ftString;
        Parameters[3].Size := 20;
        execproc;
      end;
      if qyHed.State = dsBrowse then
        qyHed.Edit;
      qyHed.FieldByName('ParentId').AsString := DataFM.spTemp.Parameters[2].Value;
      qyHed.FieldByName('DeptCode').AsString := DataFM.spTemp.Parameters[3].Value;
      qyHed.FieldByName('DeptId').AsString := DataFM.spTemp.Parameters[3].Value;
    finally
      DataFM.spTemp.Close;
    end;
  except
    on E: Exception do
      showMessage(E.Message);
  end;
end;

procedure TDeptFM.qyHedCalcFields(DataSet: TDataSet);
begin
  CalcField(qyHed, DataFM.qyDept, ['ParentId', 'ParentName'], ['DeptId', 'DeptName']);
  CalcField(qyHed, DataFM.qyWare, ['WareId', 'WareName'], ['WareId', 'WareName']);
end;

procedure TDeptFM.tvCustomDraw(Sender: TObject; TreeNode: TTreeNode; AFont: TFont; var AColor, ABkColor: TColor);
begin
  if (TreeNode.Index mod 2 = 0) then
    AColor := $00F14552
  else
    AColor := $005158E6;
end;

procedure TDeptFM.FormCreate(Sender: TObject);
begin
  sFMId := 'DeptFM';
  sFMName := Self.Caption;
  inherited;
  qyHed.Open;
  tv.DisplayField := 'DeptId;DeptName';
end;

procedure TDeptFM.FormDestroy(Sender: TObject);
begin
  DeptFM := nil;
end;

procedure TDeptFM.FormShow(Sender: TObject);
begin
  inherited;
  tv.FullExpand;
end;

end.
