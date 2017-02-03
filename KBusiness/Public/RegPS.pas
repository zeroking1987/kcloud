unit RegPS;

interface

uses Windows, Messages, SysUtils, registry, IniFiles, Dialogs, nb30, Forms;

function GetPhysicalAddress: string;
function GetRecNo: string; // ��ȡ���к�
function EncrypStr(Str: string): string;
function JudgeReg: Boolean;
function SoftReg(MachineNo, RegNo: string): Boolean;

const
  XorKey: array[0..7] of Byte = ($A3, $15, $BA, $55, $70, $6D, $44, $16);

var
  bReg: Boolean;
  SpareDays: Integer;
  Key: string;

implementation

uses PublicPS;

function GetPhysicalAddress: string;
// 0ָ����������������еĵ�һ��,����Ը��������
var
  NCB: TNCB; // Netbios control block file://NetBios���ƿ�
  adapter: TAdapterStatus; // Netbios adapter status//ȡ����״̬
  LANAENUM: TLANAENUM; // Netbios lana
  intIdx: Integer; // Temporary work value//��ʱ����
  cRC: AnsiChar; // Netbios return code//NetBios����ֵ
  strTemp: string; // Temporary string//��ʱ����
begin
  // Initialize
  Result := '';
  try
    // Zero control blocl
    ZeroMemory(@NCB, SizeOf(NCB));

    // Issue enum command
    NCB.ncb_command := chr(NCBENUM);
    cRC := NetBios(@NCB);

    // Reissue enum command
    NCB.ncb_buffer := @LANAENUM;
    NCB.ncb_length := SizeOf(LANAENUM);
    cRC := NetBios(@NCB);
    if Ord(cRC) <> 0 then
      exit;

    // Reset adapter
    ZeroMemory(@NCB, SizeOf(NCB));
    NCB.ncb_command := chr(NCBRESET);
    NCB.ncb_lana_num := LANAENUM.lana[0];
    cRC := NetBios(@NCB);
    if Ord(cRC) <> 0 then
      exit;

    // Get adapter address
    ZeroMemory(@NCB, SizeOf(NCB));
    NCB.ncb_command := chr(NCBASTAT);
    NCB.ncb_lana_num := LANAENUM.lana[0];
    StrPCopy(NCB.ncb_callname, '*');
    NCB.ncb_buffer := @adapter;
    NCB.ncb_length := SizeOf(adapter);
    cRC := NetBios(@NCB);

    // Convert it to string
    strTemp := '';
    for intIdx := 0 to 5 do
      strTemp := strTemp +
        IntToHex(Integer(adapter.adapter_address[intIdx]), 2);
    Result := strTemp;
  finally
  end;
end;

function GetRecNo: string; // ��ȡ���к�
var
  i, j: Integer;
  Str: string;
begin
  Result := '';
  Str := '';
  Str := GetPhysicalAddress;
  j := 0;
  for i := 1 to Length(Str) do
  begin
    if i mod 2 = 0 then
    begin
      Result := Result + IntToHex(Byte(Str[i]) xor XorKey[j], 2);
      j := (j + 1) mod 8;
    end;
  end;
end;

function EncrypStr(Str: string): string;
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

{function JudgeReg: Boolean;
var
  Reg: Tregistry;
  KeyName, sMachineNo, sRegNo, TempStr: string;
  Same: Integer;
  FirstDate, NowDate: Tdatetime;
  NumberOfDays: real;
begin
  Result := false;
  Key := 'HCSoftWare';
  bReg := false;
  NowDate := date; // ȡ������ʱϵͳ����
  try
    // ����ע����иü����ȡ�����򴴽�
    Reg := Tregistry.Create;
    Reg.RootKey := hkey_local_machine;
    KeyName := 'SoftWare\King\RegNo';
    if Reg.OpenKey(KeyName, true) then
    begin
      sMachineNo := Reg.ReadString('MachineNo');
      sRegNo := Reg.ReadString('RegNo');
      // ��ȡ�û�����ע���
      try
        FirstDate := Reg.ReadDate('Date');
        // �ǵ�һ��������һ������ʱ��
      except
        Reg.WriteDate('Date', NowDate);
        // ��Ϊ��һ�����У���д��ϵͳ����
        FirstDate := NowDate;
      end;
    end
    else
    begin
     if not Reg.KeyExists(KeyName)    then
        Reg.CreateKey(KeyName);
      FirstDate := NowDate;
    end;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
  TempStr := EncrypStr(sRegNo);
  // ͨ���Զ��庯��Encrypt()����ȡ���к�
  Same := CompareText(TempStr, sMachineNo);
  // �Ƚ�����
  if sMachineNo <> '' then
    if Same = 0 then
    begin
      bReg := true;
      Result := true; // ��֤ͨ��
    end;

  if not bReg then
  begin // ��δע��...
    NumberOfDays := NowDate - FirstDate;
    SpareDays := round(31 - NumberOfDays);
    if ((NumberOfDays > 31) or (NumberOfDays < -1)) then
    begin
      Result := false;
    end;
  end;
end;  }

function JudgeReg: Boolean;
var
  ConIni: TIniFile;
  FirstDate, NowDate: Tdatetime;
  Same: Integer;
  NumberOfDays: real;
  ConFile, TempStr: string;
begin
  try
    Result := false;
    bReg := false;
    NowDate := date; // ȡ������ʱϵͳ����
  //�ж���û�������ļ�,�����һ�θ���ʼ����
    ConFile := ExtractFilePath(Application.ExeName) + 'Reg.ini';
    ConIni := TIniFile.Create(ConFile);
    if not fileexists(ConFile) then
    begin
      ConIni.WriteString('����', 'MachineNo', '');
      ConIni.WriteString('����', 'RegNo', '');
      ConIni.WriteString('����', 'FTime', Encode(DateToStr(NowDate)));
    end;
    MachineNo := ConIni.ReadString('����', 'MachineNo', '');
    RegNo := ConIni.ReadString('����', 'RegNo', '');
    FTime := ConIni.ReadString('����', 'FTime', '');
    if FTime <> '' then
      FirstDate := StrToDate(Decode(FTime));
    TempStr := EncrypStr(RegNo); // ͨ���Զ��庯��Encrypt()����ȡ���к�
    Same := CompareText(TempStr, MachineNo); // �Ƚ�����
    if (MachineNo <> '') and (Same = 0) then
    begin
      if MachineNo <> GetRecNo then
      begin
        ShowWarn('ע����Ϣ����!');
      end
      else
      begin
        bReg := true;
        Result := true; // ��֤ͨ��
      end;
    end;
    if not bReg then
    begin // ��δע��...
      NumberOfDays := NowDate - FirstDate;
      SpareDays := round(30 - NumberOfDays);
      if ((NumberOfDays > 30) or (NumberOfDays < -1)) then
      begin
        Result := false;
      end;
    end;
  except
    ShowWarn('ע����Ϣ����');
    Result := false;
  end;
end;

function SoftReg(MachineNo, RegNo: string): Boolean;
var
  ConIni: TIniFile;
  ConFile, RealCode: string;
  Same: Integer;
begin
  if bReg then
  begin
    ShowBox('�Ѿ�ע��');
    exit;
  end;
  if RegNo <> '' then
  begin
    ConFile := ExtractFilePath(Application.ExeName) + 'Reg.ini';
    ConIni := TIniFile.Create(ConFile);
    RealCode := EncrypStr(RegNo);
    Same := CompareText(RealCode, MachineNo);
    if Same <> 0 then
    begin
      ShowError('ע�������!');
      Result := false;
    end
    else // ע��ɹ�
    begin
      ConIni.WriteString('����', 'MachineNo', MachineNo);
      ConIni.WriteString('����', 'RegNo', RegNo);
      bReg := true;
      Result := true;
    end
  end
  else
  begin
    ShowBox('����дע����');
    bReg := false;
    Result := false;
  end;
end;

{function SoftReg(MachineNo, RegNo: string): Boolean;
var
  RealCode: string;
  Same: Integer;
  Reg: Tregistry;
  KeyName: string;
begin
  if bReg then
  begin
    ShowBox('�Ѿ�ע��');
    exit;
  end;
  if RegNo <> '' then
  begin
    RealCode := EncrypStr(RegNo);
    Same := CompareText(RealCode, MachineNo);
    if Same <> 0 then
    begin
      ShowError('ע�������,ע��ʧ��');
      Result := false;
    end
    else // ע��ɹ�
    begin
      try
        Reg := Tregistry.Create;
        Reg.RootKey := hkey_local_machine;
        KeyName := 'SoftWare\King\RegNo';
        if Reg.OpenKey(KeyName, true) then
        begin
          Reg.WriteString('MachineNo', MachineNo);
          Reg.WriteString('RegNo', RegNo);
        end;
        Reg.CloseKey;
      finally
        Reg.Free;
      end;
      bReg := true;
      Result := true;
    end;
  end
  else
  begin
    ShowBox('����дע����');
    bReg := false;
    Result := false;
  end;
end; }

end.

