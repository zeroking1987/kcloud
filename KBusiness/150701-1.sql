
--ϵͳ�˵�SysBillSetTB��ʼ��
if not exists (select Tag from SysBillSetTB where Tag='00')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('00','00','00','�˵�����','',0,'',0,0,1,1) 
     --���ݲ���
if not exists (select Tag from SysBillSetTB where Tag='10')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('10','00','10','���ݲ���','',0,'',0,0,1,1) 
if not exists (select Tag from SysBillSetTB where Tag='1001')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1001','10','ItemTB','��Ʒ����','ItemTB',0,'G',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1004')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1004','10','ProviderTB','��Ӧ������','ProviderTB',0,'P',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1006')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1006','10','CustTB','�ͻ�����','CustTB',0,'C',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1008')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1008','10','EmployeeTB','Ա������','EmployeeTB',0,'E',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1010')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1010','10','OtherSetTB','��������','OtherSetTB',0,'',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1011')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1011','10','SaleOut','���۵�','WareInOutHDTB',1,'XS',1,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1013')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1013','10','SalePayHDTB','�տ','SalePayHDTB',1,'SK',1,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1021')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1021','10','StockIn','������','WareInOutHDTB',1,'JH',1,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1023')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1023','10','StockPayHDTB','���','StockPayHDTB',1,'FK',1,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1031')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1031','10','CNBillTB','������ˮ','CNBillTB',1,'CN',1,1,1,0)

     --������� 
if not exists (select Tag from SysBillSetTB where Tag='12')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('12','00','12','�������','',0,'',0,0,1,1) 
if not exists (select Tag from SysBillSetTB where Tag='1201')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1201','12','SaleOutQ','���۵���ѯ','',0,'',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1203')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1203','12','SaleAnalysis','Ӧ�շ���','',0,'',0,1,1,0)
if not exists (select Tag from SysBillSetTB where Tag='1205')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1205','12','SalePayQ','�տ��ѯ','',0,'',0,1,1,0)
if not exists (select Tag from SysBillSetTB where Tag='1207')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1207','12','CustNoPayQ','�ͻ�Ƿ���','',0,'',0,1,1,0)

if not exists (select Tag from SysBillSetTB where Tag='1211')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1211','12','StockInQ','��������ѯ','',0,'',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1213')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1213','12','StockAnalysis','Ӧ������','',0,'',0,1,1,0)
if not exists (select Tag from SysBillSetTB where Tag='1205')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1215','12','StockPayQ','�����ѯ','',0,'',0,1,1,0)
if not exists (select Tag from SysBillSetTB where Tag='1217')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1217','12','PrvNoPayQ','��Ӧ��Ƿ���','',0,'',0,1,1,0)

if not exists (select Tag from SysBillSetTB where Tag='1221')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1221','12','WareStroageQ','����ѯ','',0,'',0,1,1,0)
if not exists (select Tag from SysBillSetTB where Tag='1231')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1231','12','CNBillQ','�ʽ�ͳ��','',0,'',0,1,1,0)

     --ϵͳ����
if not exists (select Tag from SysBillSetTB where Tag='15')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('15','00','15','ϵͳ����','',0,'',0,0,1,1) 
if not exists (select Tag from SysBillSetTB where Tag='1501')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1501','15','SysSet','ϵͳ����','',0,'',0,1,1,1) 
if not exists (select Tag from SysBillSetTB where Tag='1503')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1503','15','PrintReportTB','��ӡģ��','',0,'',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1505')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1505','15','DataBack','����ά��','',0,'',0,1,1,0) 
if not exists (select Tag from SysBillSetTB where Tag='1507')
  insert into SysBillSetTB(Tag,pTag,BillId,BillName,TableName,MaxAuditLevel,BillPreFix,bAudit,bRight,bMenu,bShowPublic)
     Values('1507','15','ChangePass','�����޸�','',0,'',0,1,1,0) 

go


if not exists (select FMId from ReportSetTB where Tag='00')
   Insert Into ReportSetTB(FMId,FMName,ReportName,ReportFile,ReportKind,Tag,ParentTag)
     Values('00','��������','','',1,'00','')   --���봰������Ŀ¼
--���Ϲ���
if not exists(select FMId from ReportSetTB where ReportFile='���ݲ���')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag )
     values('10','���ݲ���','','���ݲ���',1,'10','00')
if not exists(select FMId from ReportSetTB where ReportFile='��Ʒ����')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('ItemFM','��Ʒ����','','��Ʒ����',1,'1001','10')
if not exists(select FMId from ReportSetTB where ReportFile='��Ӧ������')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('ProviderFM','��Ӧ������','','��Ӧ������',1,'1004','10')
if not exists(select FMId from ReportSetTB where ReportFile='�ͻ�����')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('CustFM','�ͻ�����','','�ͻ�����',1,'1006','10')
if not exists(select FMId from ReportSetTB where ReportFile='Ա������')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('EmployeeFM','Ա������','','Ա������',1,'1008','10')
if not exists(select FMId from ReportSetTB where ReportFile='���۵�')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('SaleOutFM','���۵�','','���۵�',1,'1011','10')
if not exists(select FMId from ReportSetTB where ReportFile='�տ')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('SalePayFM','�տ','','�տ',1,'1013','10')
if not exists(select FMId from ReportSetTB where ReportFile='������')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('StockInFM','������','','������',1,'1021','10')
if not exists(select FMId from ReportSetTB where ReportFile='���')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('StockPayFM','���','','���',1,'1023','10')

if not exists(select FMId from ReportSetTB where ReportFile='�������')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag )
     values('12','�������','','�������',1,'12','00')
if not exists(select FMId from ReportSetTB where ReportFile='���۵���ѯ')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('SaleOutQFM','���۵���ѯ','','���۵���ѯ',1,'1201','12')
if not exists(select FMId from ReportSetTB where ReportFile='�տ��ѯ')
   Insert into  ReportSetTB (FMId ,FMName,ReportName ,ReportFile ,ReportKind ,Tag,ParentTag  )
     values('SalePayQFM','�տ��ѯ','','�տ��ѯ',1,'1205','12')
go



if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='ObjectCode')
    Alter Table WareInOutHDTB add ObjectCode nvarchar(100)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='ObjectName')
    Alter Table WareInOutHDTB add ObjectName nvarchar(200)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='ObjectLinkMan')
    Alter Table WareInOutHDTB add ObjectLinkMan nvarchar(50)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='ObjectMobile')
    Alter Table WareInOutHDTB add ObjectMobile nvarchar(100)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='ObjectTel')
    Alter Table WareInOutHDTB add ObjectTel nvarchar(100)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='ObjectFax')
    Alter Table WareInOutHDTB add ObjectFax nvarchar(100)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='FactMoney')
    Alter Table WareInOutHDTB add FactMoney Numeric(18,5)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='PayMoney')
    Alter Table WareInOutHDTB add PayMoney Numeric(18,5)
if not exists(select id from syscolumns where id=Object_ID('WareInOutHDTB') and name='DisCount')
    Alter Table WareInOutHDTB add DisCount Numeric(18,5)

if not exists(select id from syscolumns where id=Object_ID('SalePayHDTB') and name='CustName')
    Alter Table SalePayHDTB add CustName nvarchar(100)
go

--�ͻ�Ƿ��
if exists (Select Name from SysObjects where Name='vwCustNoPayM' and type='V')
 drop View dbo.vwCustNoPayM
go
Create View dbo.vwCustNoPayM
as
   select CustId=z.CustId,NoPayM=IsNull(Sum(a.SignFlag*ISNULL(a.FactMoney,0)),0)-ISNULL(m.PayMoney,0)
   from CustTB z left join  WareInOutHDTB a on z.CustId=a.ObjectId
   left join vwObject c on a.ObjectId=c.ObjectId
   left join (select CustId,PayMoney=SUM(SignFlag*ISNULL(PayMoney,0)) from SalePayHDTB group by CustId)m on z.CustId=m.CustId
   where 1=1
   group by z.CustId,m.PayMoney
go


--��������
if exists (Select Name from SysObjects where Name='vwObject' and type='V')
 drop View dbo.vwObject
go
Create View dbo.vwObject
as
  Select  ObjectID=CustID,ObjectCode=CustCode,ObjectPYCode=dbo.fnGetPY(CustName),ObjectName=CustName,ObjectLinkMan=LinkMan,ObjectMobile=Mobile,ObjectTel=Tel,ObjectFax=Fax from CustTB
  Union all
  select ObjectID=PrvID,ObjectCode=PrvCode,ObjectPYCode=dbo.fnGetPY(PrvName),ObjectName=PrvName,ObjectLinkMan=LinkMan,ObjectMobile=Mobile,ObjectTel=Tel,ObjectFax=Fax from ProviderTB
  Union all
  select ObjectID=DeptID,ObjectCode=DeptCode,ObjectPYCode=dbo.fnGetPY(DeptName),ObjectName=DeptName,ObjectLinkMan='',ObjectMobile='',ObjectTel='',ObjectFax='' from DeptTB
  Union all
  select ObjectID=EmpID,ObjectCode=EmpCode,ObjectPYCode=dbo.fnGetPY(EmpName),ObjectName=EmpName,ObjectLinkMan='',ObjectMobile='',ObjectTel='',ObjectFax='' from EmployeeTB
go



--�˵���ѯ
if Exists (select Name from Sysobjects Where Name='prSysMenuQ' and type='P')
  Drop Procedure prSysMenuQ
go
Create Procedure prSysMenuQ @sLoginId Varchar(50)
As
begin
  if @sLoginId='admin' 
  begin
    select a.Tag,b.MetroInfo from SysBillSetTB a left join vwMetroInfo b on a.Tag=b.Tag
  end
  else
  begin
    select a.Tag,c.MetroInfo from SysBillSetTB a left join UserRightTB b on a.Tag=b.Tag
    left join vwMetroInfo c on a.Tag=c.Tag
    where b.UserId=@sLoginId and (ISNULL(b.bShow,0)=1 or ISNULL(a.bShowPublic,0)=1)
  end
  
end
--exec prSysMenuQ 'admin'
go

--�������ڻ�ô�ǰ׺�ı����(����ŷ���2)
if exists(select Name from sysobjects where Name='prGetTimeNo' and type='P')
  Drop procedure dbo.prGetTimeNo
Go
Create Procedure prGetTimeNo @BillId varchar(20),@FieldName varchar(20)
as
begin
    declare @Pre varchar(20),@TableName varchar(20),@TableDesc varchar(50)
	set @Pre='' 
	select @Pre=BillPreFix,@TableName=TableName,@TableDesc=BillName from SysBillSetTB where BillId=@BillId
	if (@Pre='')
	begin
	  raiserror('���ȵ�ϵͳ�������øõ���ǰ׺',16,1)
	  return
	end

    --Select BillNo=@Pre+dbo.GetDNH(GetDate())
    Select BillNo=@Pre+CONVERT(varchar(12) , GETDATE(), 12 )+Left(replace(CONVERT(varchar(12) , GETDATE(), 14 ),':',''),6)
	--print @BillNo
end
--exec prGetTimeNo 'SaleOut','BillNo'
go

--��ô�ǰ׺��5λ���
if exists(select Name from sysobjects where Name='prGetFiveNo' and type='P')
  Drop procedure dbo.prGetFiveNo
Go
Create Procedure prGetFiveNo @BillId varchar(20),@FieldName varchar(20),@BillNo varchar(20) Output
as
begin
	declare @Pre varchar(20),@TableName varchar(20),@TableDesc varchar(50)
 
	set @BillNo=''
	set @Pre='' 
	select @Pre=BillPreFix,@TableName=TableName,@TableDesc=BillName from SysBillSetTB where BillId=@BillId
	if (@Pre='')
	begin
	
	  raiserror('���ȵ�ϵͳ�������øõ���ǰ׺',16,1)
	  set @BillNo=null 
	  return
	end
	create Table #GetFiveNo(BillNo varchar(20))
	insert into #GetFiveNo
	  Exec('select '+@FieldName+' as BillNo from '+@TableName+' where '+@FieldName+' like '''+@Pre+'%''')
	if @@error<>0
	begin
	  raiserror ('�����ֶλ�����',16,1)
	  return
	end

	select @BillNo=max(right(BillNo,5)) from #GetFiveNo
	if (@BillNo is null)
	  set @BillNo='10000'
	set @BillNo=@BillNo+1
	set @BillNo=@Pre+@BillNo
	print @BillNo
end
--exec prGetFiveNo 'ItemTB','ItemId',''
go

--��ô�ǰ׺��5λ���
if exists(select Name from sysobjects where Name='prGetTableNo' and type='P')
  Drop procedure dbo.prGetTableNo
Go
Create Procedure prGetTableNo @BillId varchar(20),@FieldName varchar(20),@BillNo varchar(20) Output

as
begin
	declare @Pre varchar(20),@TableName varchar(20),@TableDesc varchar(50) 
	set @BillNo=''
	set @Pre='' 
	select @Pre=BillPreFix,@TableName=TableName,@TableDesc=BillName from SysBillSetTB where BillId=@BillId
	if (@Pre='')
	begin
	  raiserror('���ȵ�ϵͳ�������øõ���ǰ׺',16,1)
	  set @BillNo=null 
	  return
	end
	create Table #GetTableNo(BillNo varchar(20))
	insert into #GetTableNo
	  Exec('select '+@FieldName+' as BillNo from '+@TableName+' where '+@FieldName+' like '''+@Pre+'%''')
	if @@error<>0
	begin
	  raiserror ('�����ֶλ��������',16,1)
	  return
	end

	select @BillNo=max(right(BillNo,10)) from #GetTableNo where SubString(Right(BillNo,10),1,2)=Right(Year(GetDate()),2) 
	       and SubString(Right(BillNo,10),3,2)=Month(GetDate()) and SubString(Right(BillNo,10),5,2)=Day(GetDate())
	if (@BillNo is null)
	  set @BillNo= Right(CONVERT(varchar(20),GETDATE(),112),6)+'0000'
    set @BillNo=left(@BillNo,6)+right(right(@BillNo,4)+10001,4)
    set @BillNo=@Pre+@BillNo
    print @BillNo
end
--exec prGetTableNo 'SaleOut','PayNo',''
go



--ͨ�ò�ѯ
if exists(select name from sysobjects where name='prGeneralQ' and type='P')
    drop procedure dbo.prGeneralQ
go
create procedure dbo.prGeneralQ 
  @sKindName varchar(100),@sWhere varchar(2000)
as
begin
  if  @sKindName='�ɹ�����δ��⹩Ӧ�̲�ѯ'  --δ������ͻ�
  begin
     select ��Ӧ�̱��=a.PrvId,��Ӧ������=c.PrvName,δ�������=Sum(IsNull(b.OrderNum,0))-Sum(IsNull(m.InNum,0)),
     ������=Sum(IsNull(b.OrderNum,0)),�������=Sum(IsNull(m.InNum,0))  
     from StockOrderHDTB a left join StockOrderDTTB b on a.StockOrderNO=b.StockOrderNo 
     left join (select InNum=SUM(ISNULL(b.MainNum,0)),b.StockId from WareInOutHDTB a left join WareInOutDTTB b on a.BillNO=b.BillNO
     where a.WKindID='StockIn' and b.StockId is not null group by b.StockId)m on b.AutoNO=m.StockId 
     left join ProviderTB c on a.PrvId=c.PrvId 
     where IsNull(b.OrderNum,0)>IsNull(m.InNum,0) group by a.PrvId,c.PrvName
  end
  if  @sKindName='���۶���δ�����ͻ���ѯ'  --δ������ͻ�
  begin
     Exec('select �ͻ����=a.CustId,�ͻ�����=c.CustName,δ��������=Sum(IsNull(b.OrderNum,0))-Sum(IsNull(m.SenderNum,0)),
		 ������=Sum(IsNull(b.OrderNum,0)),�ѷ�����=Sum(IsNull(m.SenderNum,0)) 
		 from SaleOrderHDTB a left join SaleOrderDTTB b on a.SaleOrderNO=b.SaleOrderNo 
		 left join (select SenderNum=SUM(ISNULL(b.SenderNum,0)),b.SaleOrderId from SaleSenderHDTB a left join SaleSenderDTTB b on a.SenderNo=b.SenderNo
		 where  b.SaleOrderId is not null group by b.SaleOrderId)m on b.AutoNo=m.SaleOrderId  
		 left join CustTB c on a.CustId=c.CustId 
		 where IsNull(b.bStop,0)=0 and IsNull(b.OrderNum,0)>IsNull(m.SenderNum,0) '+@sWhere+'
		 group by a.CustId,c.CustName')
  end
  if  @sKindName='���۶���δ����ͻ���ѯ'  --δ���۳���ͻ�
  begin
     select �ͻ����=a.CustId,�ͻ�����=d.CustName,����δ��������=Sum(IsNull(b.OrderNum,0))-Sum(IsNull(m.OutNum,0)),
            ������=Sum(IsNull(b.OrderNum,0)),�ѳ�����=Sum(IsNull(m.OutNum,0))
     from SaleOrderHDTB a left join SaleOrderDTTB b on a.SaleOrderNo=b.SaleOrderNo
     left join CustTB d on a.CustId=d.CustId
     left join (select OutNum=SUM(ISNULL(b.MainNum,0)),b.SaleOrderId from WareInOutHDTB a left join WareInOutDTTB b on a.BillNO=b.BillNO
     where a.WKindID='SaleOut' and b.SaleOrderId is not null group by b.SaleOrderId)m on b.AutoNo=m.SaleOrderId 
     where IsNull(b.bStop,0)=0 and IsNull(b.OrderNum,0)>IsNull(m.OutNum,0)
     group by a.CustId,d.CustName
  end
  if  @sKindName='���۷�����δ����ͻ���ѯ'  --δ���۳���ͻ�
  begin
     select �ͻ����=a.CustId,�ͻ�����=d.CustName,����δ��������=Sum(IsNull(b.SenderNum,0))-Sum(IsNull(m.OutNum,0)),
            ������=Sum(IsNull(b.SenderNum,0)),�ѳ�����=Sum(IsNull(m.OutNum,0))
     from SaleSenderHDTB a left join SaleSenderDTTB b on a.SenderNo=b.SenderNo
     left join CustTB d on a.CustId=d.CustId
     left join (select OutNum=SUM(ISNULL(b.MainNum,0)),b.SaleSenderId from WareInOutHDTB a left join WareInOutDTTB b on a.BillNO=b.BillNO
     where a.WKindID='SaleOut' and b.SaleSenderId is not null group by b.SaleSenderId)m on b.AutoNo=m.SaleSenderId 
     where IsNull(b.bStop,0)=0 and  IsNull(b.SenderNum,0)>IsNull(m.OutNum,0)
     group by a.CustId,d.CustName
  end     
  if  @sKindName='�ɹ����δ���˹�Ӧ�̲�ѯ'   --δӦ�����˹�Ӧ��
  begin
      select ��Ӧ�̱��=a.ObjectID,��Ӧ������=d.ObjectName,δ��������=Sum(IsNull(b.MainNum,0))-Sum(IsNull(m.InvoiceNum,0)),
      ���δ�����ܽ��=Sum(IsNull(b.AllMOney,0))-Sum(IsNull(m.AllMOney,0))
      from WareInOutHDTB a left join WareInOutDTTB b on a.BillNO=b.BillNO
      left join vwObject d on a.ObjectID=d.ObjectID
      left join (select InvoiceNum=SUM(ISNULL(b.InvoiceNum,0)),AllMOney=SUM(ISNULL(b.AllMOney,0)),b.IoNo,b.IoId from SaleInvoiceHDTB a left join SaleInvoiceDTTB b on a.InvoiceNo=b.InvoiceNo 
      where b.IoId is not null group by b.IoNo,b.IoId)m on b.BillNO=m.IoNo and b.AutoNo=m.IoId
      where a.WKindID='StockIn' and IsNull(a.bMaxAudit,0)=1 and ISNULL(a.bCashDeal,0)=0
      and IsNull(b.MainNum,0)>IsNull(m.InvoiceNum,0)
      group by a.ObjectID,d.ObjectName 
  end
  if  @sKindName='���۳���δ���˿ͻ���ѯ'   --δӦ�ռ��˿ͻ�
  begin
      select �ͻ����=a.ObjectId,�ͻ�����=d.ObjectName,����δ��������=Sum(IsNull(b.MainNum,0))-Sum(IsNull(m.InvoiceNum,0)), 
      ����δ�����ܽ��=Sum(IsNull(b.AllMOney,0))-Sum(IsNull(m.AllMOney,0))
      from WareInOutHDTB a left join WareInOutDTTB b on a.BillNO=b.BillNO 
      left join ItemTB c on b.ItemId=c.ItemId 
      left join vwObject d on a.ObjectID=d.ObjectID
      left join (select InvoiceNum=SUM(ISNULL(b.InvoiceNum,0)),AllMOney=SUM(ISNULL(b.AllMOney,0)),b.IoNo,b.IoId from SaleInvoiceHDTB a left join SaleInvoiceDTTB b on a.InvoiceNo=b.InvoiceNo 
      where b.IoId is not null group by b.IoNo,b.IoId)m on b.BillNO=m.IoNo and b.AutoNo=m.IoId 
      where a.WKindID='SaleOut' and IsNull(a.bMaxAudit,0)=1 and ISNULL(a.bCashDeal,0)=0 
      and IsNull(b.MainNum,0)>IsNull(m.InvoiceNum,0)
      group by a.ObjectId,d.ObjectName 
  end 
  if  @sKindName='Ӧ�ռ���δ�տ�ͻ���ѯ'   --δ�տ�ͻ�
  begin 
	    select �ͻ����=a.ObjectId,�ͻ�����=c.ObjectName,δ�տ���=Sum(a.SignFlag*ISNULL(b.MainMoney,0))-ISNULL(m.PayMoney,0),
		���˽��=Sum(a.SignFlag*ISNULL(b.MainMoney,0)),���տ���=ISNULL(m.PayMoney,0),
		�տ���=ISNULL(m.PayMoney,0)/dbo.IsZero(Sum(a.SignFlag*ISNULL(b.MainMoney,0)),null)*100
		from WareInOutHDTB a left join WareInOutDTTB b on a.BillNo=b.BillNo
		left join vwObject c on a.ObjectId=c.ObjectId
		left join (select InvoiceNo,PayMoney=SUM(ISNULL(NowPayMoney,0)) from SalePayDTTB group by InvoiceNo)m on a.BillNo=m.InvoiceNo
		where 1=1
		group by a.ObjectId,c.ObjectName,m.PayMoney
		Having Sum(a.SignFlag*ISNULL(b.MainMoney,0))>ISNULL(m.PayMoney,0)
  end   
  if  @sKindName='Ӧ������δ���Ӧ�̲�ѯ'   --δ���Ӧ��
  begin 
	    select ��Ӧ�̱��=a.PrvId,��Ӧ������=c.PrvName,δ������=Sum(a.SignFlag*ISNULL(b.InvoiceMoney,0))-ISNULL(m.PayMoney,0),
		���˽��=Sum(a.SignFlag*ISNULL(b.InvoiceMoney,0)),�Ѹ�����=ISNULL(m.PayMoney,0),
		������=ISNULL(m.PayMoney,0)/dbo.IsZero(Sum(a.SignFlag*ISNULL(b.InvoiceMoney,0)),null)*100
		from StockInvoiceHDTB a left join StockInvoiceDTTB b on a.InvoiceNo=b.InvoiceNO
		left join ProviderTB c on a.PrvId=c.PrvId
		left join (select InvoiceNo,PayMoney=SUM(ISNULL(NowPayMoney,0)) from StockPayDTTB group by InvoiceNo)m on a.InvoiceNo=m.InvoiceNo
		where ISNULL(a.bMaxAudit,0)=1 
		group by a.PrvId,c.PrvName,m.PayMoney
		Having Sum(a.SignFlag*ISNULL(b.InvoiceMoney,0))>ISNULL(m.PayMoney,0)
  end     
  if  @sKindName='��Ʒ�����ѯ'  
  begin 
      Exec (' select [�����]=b.Ordinal,[��������]=b.TechName,[�ϵ�����]=b.TopTech,[�µ�����]=b.NextTech,[��������]=b.TechParam,[�Ƿ��׵�]=b.bFirst,
      [��Ʒ����]=c.ItemCode,[��Ʒ����]=c.ItemName,[��Ʒ���]=c.ItemSpc,[��Ʒ���]=a.ItemId
      from ItemTechHDTB a left join ItemTechDTTB b on a.TechNo=b.TechNo
      left join ItemTB c on a.ItemId=c.ItemId
      where 1=1 '+@sWhere)
  end     
end

--Exec prGeneralQ 'Ӧ�ռ���δ�տ�ͻ���ѯ',''
go

if Exists (select Name from Sysobjects Where Name='PrSalePaySaleInvoiceRf' and type='P')
  Drop Procedure PrSalePaySaleInvoiceRf
go
Create Procedure PrSalePaySaleInvoiceRf @sWhere Varchar(2000)
As  --δ�տ�Ӧ�ռ��˲�ѯ
begin
  exec('select a.bSelect,a.BillNo,a.BillDate,a.ObjectId,c.ObjectName,
		NoPayMoney=Sum(a.SignFlag*ISNULL(b.MainMoney,0))-ISNULL(m.PayMoney,0),
		InvoiceMoney=Sum(a.SignFlag*ISNULL(b.MainMoney,0)),HasPayMoney=ISNULL(m.PayMoney,0),
		PayPre=ISNULL(m.PayMoney,0)/dbo.IsZero(Sum(a.SignFlag*ISNULL(b.MainMoney,0)),null)*100
		from WareInOutHDTB a left join WareInOutDTTB b on a.BillNo=b.BillNo
		left join vwObject c on a.ObjectId=c.ObjectId
		left join (select InvoiceNo,PayMoney=SUM(ISNULL(NowPayMoney,0)) from SalePayDTTB group by InvoiceNo)m on a.BillNo=m.InvoiceNo
		where 1=1 '+@sWhere+'
		group by a.bSelect,a.BillNo,a.BillDate,a.ObjectId,c.ObjectName,m.PayMoney
		Having Sum(a.SignFlag*ISNULL(b.MainMoney,0))>ISNULL(m.PayMoney,0)')
end
--exec PrSalePaySaleInvoiceRf ''
go


if Exists (select Name from Sysobjects Where Name='PrInvoiceToPay' and type='P')
  Drop Procedure PrInvoiceToPay
go
Create procedure PrInvoiceToPay @BillNo varchar(30),@IFlag int
as
begin
  DECLARE @PayNo VARCHAR(50),@String varchar(100),@MaxAudit smallint,@bMaxAudit bit

  Set @PayNo=''

  BEGIN TRANSACTION
  --����
  if @IFlag=1 
  begin
      --����Ѿ����ھ�ֱ�Ӹ��½��
      select @PayNo=PayNo from SalePayHDTB where SubjoinNo=@BillNo
      if @PayNo<>''
      begin
          Update SalePayHDTB Set PayMode=m.PayMode,PayMoney=IsNull(m.PayMoney,0),FactMoney=IsNull(m.PayMoney,0),CustId=m.ObjectId,CustName=m.ObjectName,
                 PayDate=Convert(varchar(20),BillDate,23),SignFlag=m.SignFlag
          from WareInOutHDTB m where SalePayHDTB.PayNo=@PayNo and m.BillNo=@BillNo and SalePayHDTB.SubjoinNo=m.BillNo

          Update SalePayDTTB Set InvoiceMoney=m.PayMoney,NowPayMoney=m.PayMoney
          from WareInOutHDTB m where SalePayDTTB.PayNo=@PayNo and SalePayDTTB.InvoiceNo=m.BillNo and IsNull(HasPayMoney,0)=0
      end
      else
      begin
          Set @PayNo=''
	  exec prGetTableNo 'SalePayHDTB','PayNo',@PayNo OUTPUT
	  if @PayNo is null
	  begin
		  ROLLBACK TRANSACTION 
		  set @string='�տǰ׺û������!'
		  RAISERROR(@string,16,1)
		  return     
	  end
	  --select @MaxAudit=MaxAuditLevel from SysTableSetTB where TableId='SalePayHDTB'
	  --�տ��ͷ
	  insert into SalePayHDTB(PayNO,PayDate,SignFlag,CustId,CustName,SubjoinNo,BillKind,PayMode,PayMoney,FactMoney,
							  MakeDate,MakeMan,MakeManName,AuditFlag,bMaxAudit,AuditManName,AuditDate,MaxAuditDate,Remark)       
	  select @PayNo,Convert(varchar(20),BillDate,23),SignFlag,CustId=a.ObjectId,CustName=a.ObjectName,BillNo,BillKind='�����տ�',PayMode,PayMoney,PayMoney,
	          getdate(),MakeMan,MakeManName,0,0,AuditManName,null,null,'' 
	   from WareInOutHDTB a where IsNull(a.WKindId,'')='SaleOut' and  BillNo=@BillNo
	  if @@error<>0
	  begin
		  ROLLBACK TRANSACTION 
		  set @string='�����տ��ͷ����'
		  RAISERROR(@string,16,1)
		  return 
	  end
	  --�տ����
	  insert into SalePayDTTB (AutoNo,PayNo,InvoiceNo,HasPayMoney,InvoiceMoney,NowPayMoney)
	  select dbo.fnGetAutoNo('SalePayHDTB',GetDate()),@PayNo,a.BillNo,HasPayMoney=0,a.PayMoney,a.PayMoney
	  from WareInOutHDTB a 
	  where IsNull(a.WKindId,'')='SaleOut' and a.BillNo=@BillNo
      end   
  end
  --ȡ������
  else if @IFlag=-1 
  begin  
     set @PayNo=''
     select @PayNo=PayNo,@bMaxAudit=bMaxAudit from SalePayHDTB where SubjoinNo=@BillNo 
     
     delete SalePayDTTB where PayNo=@PayNo     
     delete SalePayHDTB where PayNo=@PayNo
  end
  commit Tran
  select null
end 

--Exec PrInvoiceToPay 'KPSK1412140001',-1 

GO

--���۵���ѯ
if Exists (select Name from Sysobjects Where Name='PrSaleOutQ' and type='P')
  Drop Procedure PrSaleOutQ
go
Create Procedure PrSaleOutQ @sWhere Varchar(2000)
As
begin
  exec('select a.BillNo,a.BillDate,SingFlag=Case a.SignFlag when 1 then ''����'' else ''�˻�'' end,a.ObjectId,a.ObjectName,
	b.ItemCode,b.ItemName,b.ItemSpc,b.ItemUnit,b.MainNum,b.MainPrice,b.MainMoney,b.Remark
	from WareInOutHDTB a left join WareInOutDTTB b on a.BillNo=b.BillNo
	where a.WKindId=''SaleOut'''+@sWhere+' order by a.BillNo Desc')
end
--exec PrSaleOutQ ''
go


--�տ��ѯ
if Exists (select Name from Sysobjects Where Name='PrSalePayQ' and type='P')
  Drop Procedure PrSalePayQ
go
Create Procedure PrSalePayQ @sWhere Varchar(2000)
As
begin
  exec('select a.PayNo,a.PayDate,a.BillKind,SignFlag=Case a.SignFlag when 1 then ''�տ�'' else ''�˿�'' end,
	a.CustId,a.CustName,a.PayMode,a.PayMoney,b.NoPayM,a.Remark
	from SalePayHDTB a left join vwCustNoPayM b on a.CustId=b.CustId
	where 1=1  '+@sWhere+' order by a.PayNo Desc')
end
--exec PrSalePayQ ''
go
