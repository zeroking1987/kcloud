unit AMMsgPS;

interface

uses
  SysUtils;
// ����AM��Ϣ
procedure SendAMMsg(sSubject, sBody, sRecvLoginId: string);
// ����Ԥ������Ϣ
procedure SendPreMsg(sAcitonKind, sBillNo: string);

implementation

uses ASIMLib_TLB, PublicPS, DataPS;

procedure SendAMMsg(sSubject, sBody, sRecvLoginId: string);
var
  AMIM: IIM;
  AMMsg: IMsg;
  nResult: Integer;
  HostName, LoginName, Password: string;
  //RecvLoginId,SendLoginId: String;
  Name: string;
begin
  try
    AMIM := CoIM.Create;
    AMMsg := CoMsg.Create;
    AMMsg.ContentType := 'text/text';
    AMMsg.Subject := sSubject;
    AMMsg.Body := sBody;
    AMIM.Port := 5001;
    HostName := sFTPHost;
    LoginName := LoginId;
    Password := LoginPassWrod;
    AMIM.Init(HostName, LoginName, Password);
    //nResult := AMIM.SendMsgEx( AMMsg, 'wangcheng;4156302f589848a(1)' );
    nResult := AMIM.SendMsgEx(AMMsg, sRecvLoginId);
    if nResult = 1 then
      ShowBox('������Ϣ�ɹ�');
  except
    ShowWarn('������Ϣʧ��');
  end;
end;

procedure SendPreMsg(sAcitonKind, sBillNo: string);
var
  sRecvLoginId, sSubject, sBody: string;
  i: Integer;
begin
  sRecvLoginId := '';
  sSubject := '';
  sBody := '';
  with DataFM.qyTemp do
  begin
    if Active then Close;
    sql.Clear;
    SQL.Add('select a.Title1,a.Content1,UserId from PreSendMsgTB a left join PreSendMsgEmpTB b on a.SendId=b.SendId where IsNull(a.bStart,0)=1 and a.AcitonKind=' + QuotedStr(sAcitonKind));
    Open;
  end;
  if not DataFM.qyTemp.Eof then
  begin
    DataFM.qyTemp.First;
    sSubject := DataFM.qyTemp.FieldByName('Title1').AsString;
    sBody := DataFM.qyTemp.FieldByName('Content1').AsString;
    for i := 0 to DataFM.qyTemp.RecordCount - 1 do
    begin
      sRecvLoginId := sRecvLoginId + DataFM.qyTemp.FieldByName('UserId').AsString + ';';
      DataFM.qyTemp.Next;
    end;
    SendAMMsg(sSubject, sBody + ' ����:' + sBillNo, sRecvLoginId);
  end;
end;


end.
