unit gesturetracker;

{ ��������:
  GestureTracker��һ������Ļ�ϸ���������Ƶ�ʵ�ִ��룬Delphi/C++ Builder 2010��ʼ֧��
  ���ƣ����Է����������ص����Ժͷ���������ȴδ�ṩ���ն��û����ӻ�������򷽷���
  ��ģ�������ͼ�ֲ���һ�����һ���򵥵Ľ��������
  Ҫʹ�����Ƹ��٣�ֻ��Ҫ�򵥵Ľ�����Ԫ�������Delphi/C++ Builder��Ŀ���ɡ������ͨ��
  ȫ�ֱ���GlobalGestureTracker��������ز�����
  ����Ԫ������ʤ��(swish)�������й����������⣬�뷢���ʼ���chinawsb@sina.com
  ����Ԫ���������κ���;�������������������ԭ�ӵ�����Ҳ����:) ��Ȼǰ���������Ǳ��¡�
  ����������޸ı��������������Լ���Ŀ�ģ���ϣ�����ڷ����������ʲô�µĴ���ʱ���ܹ�
  ��֪��һ�������⣬���ܵ�����£�������Ӧ�İ�Ȩ��Ϣ��������Ҳû�о���ͷȥ�����ǲ���
  �����ҵĴ��룩��
  2009.9.2  ��������Windows7�²�����ȷ���ƹ켣�����⣨��ʱ�Խ������)
  2009.8.30 ������Application.MainFormOnTaskΪTrueʱ����������ʾ����
  English:
  GestureTracker is a path track helper implementation,From Delphi/C++ Builder 2010,
  The gesture support added.Use the property and method,it make support gesture is
  very easy.But no simple way to draw the gesture path in the screen,this unit is
  just used to do this.
  To use this unit,just add this unit to your project,and you can use the global
  variant GlobalGestureTracker to adjust the path parameters.
  This unit author is swish,from china.If have any problem,send mail to chinawsb@sina.com.
  This unit can be used and distribute by any method,If you want use it to make a
  atom bomb,YES,you can:)
  You can modify the source when you needed,I hope you can share your mind to me.
  The last,if possible,keep the copy right information.(In fact,I'll never search
  your code to find this).
  2009.9.2  Fixed bug under Windows 7(Template solution only)
  2009.8.30 Fixed when Application.MainFormOnTask=true,The task bar display error
}
interface

uses
  Classes,
  Controls,
  Messages,
  Graphics,
  Forms,
  AppEvnts;

type
  // TGestureTracker
  TGestureTracker = class(TComponent)
  private
    FTrackWidth: Cardinal; // ���ƹ켣ʱ�Ļ��ʿ��(Pen Width on draw the path)
    FForm, FLastActive: TForm; // �켣���ƴ���(The form to draw path)
    FEvents: TApplicationEvents; // Ӧ�ó����¼�������������Application.OnIdle�¼���Ӧ(Application Events used to Handle Application.OnIdle)
    FLastWndProc: TWndMethod; // �ض����ԭ���ڹ��̣������ػ񲢴���һЩ��Ϣ(The origin form WindowProc,used to process some message)
    FTrackColor: TColor; // �켣��ɫ(Track pen color)
    FHided: Boolean; // �ڲ���¼��ǰ��������״̬��־(Hide flags,Internal use only)
    FActive: Boolean; // �Ƿ񼤻�켣���Ʊ�־��Ĭ��ΪTrue(Track flags,Default is true)
    FXRes: Double;
    FYRes: Double;
    procedure SetTrackColor(const Value: TColor); // ����TrackColor��д����(The TrackColor property write method
    procedure WndProc(var Msg: TMessage); // �ض����Ĵ���(The new form WindowProc)
    procedure DoAppIdle(Sender: TObject; var Done: Boolean); // ϵͳ������Ӧ�����������ڴ˴�����Ʋ���(Application.OnIdle handler,we draw the path in here)
    procedure Hide; // �ڲ��������������ص�ǰ����(Internal function to hide the form)
    procedure AdjustSize; // �ڲ��������������������С����ֱ��ʷ��������(Internal function to adjust form size when display changed)
    procedure DrawTracks;
    procedure CalcRes;
  published
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // �켣��ɫ��Ĭ�Ϻ�ɫO
    property TrackColor
      : TColor read FTrackColor write SetTrackColor default clRed;
    // �켣��ȣ�Ĭ��5px
    property TrackWidth: Cardinal read FTrackWidth write FTrackWidth default 5;
    property Active: Boolean read FActive write FActive; // �Ƿ񼤻�
  end;

var
  GlobalGestureTracker: TGestureTracker; // ȫ�ֱ���

implementation

uses
  Types,
  Windows, Sysutils,
  Gestures;

type
  THackGestureEngine = class(TGestureEngine)
  end;

  THackFormVisible = class(TControl)
  end;

  { TGestureTracker }
procedure TGestureTracker.AdjustSize;
begin
  FForm.SetBounds(Screen.DesktopLeft, Screen.DesktopTop, Screen.DesktopWidth,
    Screen.DesktopWidth);
end;

// ����ֱ���
procedure TGestureTracker.CalcRes;
begin
  if FXRes < 0 then
  begin
    if (Win32MajorVersion >= 6) then
    begin // δ�ҵ����ʵķ������㣬ֱ��ȡ�̶�ֵ
      FXRes := 26.5;
      FYRes := 26.5;
    end
    else
    begin
      FXRes := 1;
      FYRes := 1;
    end;
  end;
end;

constructor TGestureTracker.Create(AOwner: TComponent);
begin
  inherited;
  FTrackColor := clRed;
  FTrackWidth := 5;
  FForm := TForm.Create(Self);
  FForm.TransparentColor := True;
  FForm.TransparentColorValue := clBlack;
  FForm.BorderStyle := bsNone;
  FForm.FormStyle := fsStayOnTop;
  FForm.DoubleBuffered := True;
  FForm.Color := clBlack;
  FLastWndProc := FForm.WindowProc;
  FForm.WindowProc := WndProc;
  AdjustSize;
  Hide;
  FEvents := TApplicationEvents.Create(Self);
  FEvents.OnIdle := DoAppIdle;
  FHided := True;
  FForm.Canvas.Brush.Color := FForm.TransparentColorValue;
  FForm.Canvas.FillRect(FForm.ClientRect);
  ShowWindow(FForm.Handle, SW_SHOWNOACTIVATE);
  FActive := True;
  FLastActive := nil;
  FXRes := -1;
  FYRes := -1;
end;

destructor TGestureTracker.Destroy;
begin
  inherited;
end;

procedure TGestureTracker.DoAppIdle(Sender: TObject; var Done: Boolean);
begin
  DrawTracks;
end;

procedure TGestureTracker.DrawTracks;
var
  ACtrl: TControl;
  AEngine: THackGestureEngine;
  APos, AClientPos: TPoint;
  AOffset: TSize;
  I: Integer;
begin
  if (Win32MajorVersion >= 6) and (FLastActive <> Screen.ActiveForm) then
  // ����Windows7��ʼ��ˢ�µ�����
  begin
    FLastActive := Screen.ActiveForm;
    ShowWindow(FForm.Handle, SW_HIDE);
    ShowWindow(FForm.Handle, SW_SHOWNOACTIVATE);
  end;
  if Active then
  begin
    ACtrl := GetCaptureControl();
    AEngine := nil;
    if Assigned(ACtrl) then
      AEngine := THackGestureEngine(ACtrl.Touch.GestureEngine);
    if Assigned(AEngine) and AEngine.Active then
    begin
      if (AEngine.PointCount > 0) and (not AEngine.TimerExpired) then
      begin
        FHided := False;
        CalcRes;
        APos := ACtrl.ClientToScreen(Point(0, 0));
        AOffset.cx := APos.X;
        AOffset.cy := APos.Y;
        // Draw the points
        APos := AEngine.Points[0];
        AClientPos := ACtrl.ScreenToClient(AEngine.InitialPoint);
        APos.X := AClientPos.X;
        APos.Y := AClientPos.Y;
        Inc(APos.X, AOffset.cx);
        Inc(APos.Y, AOffset.cy);
        FForm.Canvas.MoveTo(APos.X, APos.Y);
        FForm.Canvas.Pen.Color := FTrackColor;
        FForm.Canvas.Pen.Width := FTrackWidth;
        for I := 1 to AEngine.PointCount - 1 do
        begin
          APos := AEngine.Points[I];
          APos.X := Trunc(APos.X / FXRes);
          APos.Y := Trunc(APos.Y / FYRes);
          Inc(APos.X, AOffset.cx);
          Inc(APos.Y, AOffset.cy);
          FForm.Canvas.LineTo(APos.X, APos.Y);
        end;
      end
      else
        Hide;
    end
    else
      Hide;
  end;
end;

procedure TGestureTracker.Hide;
begin
  if not FHided then
  begin
    FForm.Canvas.Brush.Color := FForm.TransparentColorValue;
    FForm.Canvas.FillRect(FForm.ClientRect);
    FHided := True;
  end;
end;

procedure TGestureTracker.SetTrackColor(const Value: TColor);
begin
  if FTrackColor <> Value then
  begin
    FTrackColor := Value;
    if FTrackColor = clBlack then
      FForm.Color := clWhite
    else
      FForm.Color := clBlack;
    FForm.TransparentColorValue := FForm.Color;
  end;
end;

procedure TGestureTracker.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_NCHITTEST then
  begin
    Msg.Result := HTTRANSPARENT;
    PostMessage(FForm.Handle, WM_APP + 2, 1, 0)
  end
  else if Msg.Msg = (WM_APP + 1) then
    AdjustSize
  else if Msg.Msg = (WM_APP + 2) then
  begin
    // DrawTracks;
  end
  else
  begin
    FLastWndProc(Msg);
    if Msg.Msg = WM_DISPLAYCHANGE then
      PostMessage(FForm.Handle, WM_APP + 1, 0, 0)
    else if Msg.Msg = WM_WINDOWPOSCHANGED then // ���ִ�������ǰ���Ա�֤�ܹ����ǻ��ƹ켣��
      PostMessage(FForm.Handle, WM_APP + 2, 0, 0);
  end;
end;

initialization

GlobalGestureTracker := TGestureTracker.Create(nil);

finalization

GlobalGestureTracker.Free

end.
