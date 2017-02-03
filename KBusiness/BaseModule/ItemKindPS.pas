unit ItemKindPS;

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
  cxDropDownEdit, AdoInt, cxMRUEdit, dxSkinOffice2010Blue, cxLabel,
  dxSkinDevExpressStyle, dxSkinSpringTime, dxSkinValentine;

type
  TItemKindFM = class(TBaseFM)
    pnlLeft: TPanel;
    pnlEdit: TPanel;
    tv: TdxDBTreeView;
    pnlTitle: TPanel;
    frxHed: TfrxDBDataset;
    qyHedAutoId: TAutoIncField;
    strngfldHedParentId: TStringField;
    strngfldHedRemark: TStringField;
    labTitle: TLabel;
    qyHedbSelect: TBooleanField;
    qyHedItemKindId: TStringField;
    qyHedItemKindCode: TStringField;
    qyHedItemKindName: TStringField;
    qyHedParam: TStringField;
    qyHedKindWare: TStringField;
    qyHedKindWareName: TStringField;
    lbl13: TLabel;
    lbl1: TLabel;
    cxdbEdtId: TcxDBTextEdit;
    cxdbEdtCode: TcxDBTextEdit;
    cxdbEdtName: TcxDBTextEdit;
    cxMruEdtParam: TcxDBMRUEdit;
    cxBtbtn2: TcxDBButtonEdit;
    cxlbl1: TcxLabel;
    cxlbl2: TcxLabel;
    cxlbl4: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    procedure btExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure GetItemKindId(InId: string; iFlag: Integer);
    procedure btCancelClick(Sender: TObject);
    procedure tvCustomDraw(Sender: TObject; TreeNode: TTreeNode; AFont: TFont; var AColor, ABkColor: TColor);
    procedure qyHedCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cxBtbtn2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ItemKindFM: TItemKindFM;

implementation

uses MainPS, PublicPS, DataPS, EmpQPS;
{$R *.dfm}

procedure TItemKindFM.btAddClick(Sender: TObject);
var
  sId: string;
begin
  try
    inherited;

    sId := '';
    cxdbEdtId.Properties.ReadOnly := true;
    sId := tv.GetKeyField.Text;
    qyHed.Append;
    GetItemKindId(sId, 2);
    //cxdbEdtName.SetFocus;
  except
  end;
end;

procedure TItemKindFM.btCancelClick(Sender: TObject);
begin
  qyHed.CancelBatch();
  TextReadOnly(Self, true);
  inherited;
end;

procedure TItemKindFM.btDelClick(Sender: TObject);
begin
  try
    inherited;
    if qyHed.FieldByName('ItemKindId').AsString = '00' then Exit;
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

procedure TItemKindFM.btEditClick(Sender: TObject);
begin
  try
    inherited;
    cxdbEdtId.Properties.ReadOnly := true;
    qyHed.Edit;
    if (tv.Selected <> nil) then
      tv.Selected.EditText;
    cxdbEdtName.SetFocus;
  except
  end;
end;

procedure TItemKindFM.btExitClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TItemKindFM.btSaveClick(Sender: TObject);
begin
  try
    if varIsNull(qyHed.FieldByName('ItemKindId').AsString) then
    begin
      if varIsNull(tv.DBTreeNodes.MaxKeyFieldValue) then
        qyHed.FieldByName('ItemKindId').AsInteger := 0;
      qyHed.FieldByName('ItemKindId').AsInteger := tv.DBTreeNodes.MaxKeyFieldValue + 1;
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

procedure TItemKindFM.cxBtbtn2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  WareSelect(btSave.Enabled, qyHed, 'KindWare', 2);
end;

procedure TItemKindFM.GetItemKindId(InId: string; iFlag: Integer);
begin
  try
    try
      with DataFM.spTemp do
      begin
        if Active then Close;
        Parameters.Clear;
        Procedurename := 'prGetItemKindId;1';
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
      qyHed.FieldByName('ItemKindCode').AsString := DataFM.spTemp.Parameters[3].Value;
      qyHed.FieldByName('ItemKindId').AsString := DataFM.spTemp.Parameters[3].Value;
    finally
      DataFM.spTemp.Close;
    end;
  except
    on E: Exception do
      showMessage(E.Message);
  end;
end;

procedure TItemKindFM.qyHedCalcFields(DataSet: TDataSet);
begin
  CalcField(qyHed, DataFM.qyWare, ['KindWare', 'KindWareName'], ['WareId', 'WareName']);
end;

procedure TItemKindFM.tvCustomDraw(Sender: TObject; TreeNode: TTreeNode; AFont: TFont; var AColor, ABkColor: TColor);
begin
  if (TreeNode.Index mod 2 = 0) then
    AColor := $00F14552
  else
    AColor := $005158E6;
end;

procedure TItemKindFM.FormCreate(Sender: TObject);
begin
  sFMId := 'ItemKindFM';
  sFMName := Self.Caption;
  qyHed.Open;
  //inherited;
  btSave.Enabled := false;
  btCancel.Enabled := false;
  btAddL.Enabled := false;
  btDelL.Enabled := false;
  btRefer.Enabled := false;
end;

procedure TItemKindFM.FormDestroy(Sender: TObject);
begin
  ItemKindFM := nil;
end;

procedure TItemKindFM.FormShow(Sender: TObject);
begin
  inherited;
  tvExpand(tv, dsHed, 'ItemKindId', 'ItemKindName', 'ParentId');
  tv.FullExpand;
  if btSave.Enabled then
   TextReadOnly(Self, False);
end;

end.
