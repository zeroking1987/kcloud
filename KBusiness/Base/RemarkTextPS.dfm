object RemarkTextFM: TRemarkTextFM
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 525
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 484
    Width = 618
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 480
    ExplicitWidth = 608
    object btnClose: TcxButton
      Left = 503
      Top = 6
      Width = 75
      Height = 25
      Caption = #20851'  '#38381
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000040404060D0D
        0D14151515201B1B1B2A20202032212121342929294029292940292929402929
        294021212134202020321B1B1B2A151515200D0D0D14040404061E1E1E2E4C4C
        4C765F5F5F936A6A6AA5717171AF787878BB7A7A7ABD7A7A7ABD7A7E83CB7C83
        8CD978797BBF717171AF6A6A6AA55F5F5F934C4C4C761E1E1E2E000000000000
        0000000000000000000000000000000E357C2E427DF35A668DF33C6AA4FB346C
        AAFF336AA8FD2C5E99EF255391EF1F498AEF0D2A65C900010308000000000000
        0000000000000000000000000000001653BFAAB0BEFFBFBFBFFF5E88B8FF366E
        ACFF356CAAFF336BA9FF3269A7FF3269A7FF2A5D9EFF00041024000000000000
        0000000000000000000000000000011957BFAFB4C1FFBFBFBFFF5F8AB9FF3770
        AEFF366EACFF356DABFF336BA9FF3269A7FF2B60A0FF00051024000000000000
        00000000000000000000574419870C245DCDAFB5C2FFBFBFBFFF608BBBFF3971
        AFFF3870AEFF366EACFF356DABFF346BA9FF2C61A2FF000511240F0C0516896B
        2BC7896B2BC7896B2BC7AA8536F99A7D3FFFB8B2A4FFBFBFBFFF618CBCFF3A73
        B1FF3972B0FF3870AEFF366FADFF356DABFF2E63A4FF0106122417120820B992
        41FFB99241FFB99241FFB99241FFB99241FFB99242FFBDA87EFF628DBDFF3C75
        B3FF3B73B1FF3972B0FF3870AEFF376FADFF2F65A6FF0107132419140A20C69C
        4CFFC69C4CFFC69C4CFFC69C4CFFC69C4CFFCCA75EFFC5B89BFF638EBEFF1D4A
        93FF346AABFF3B74B2FF3972B0FF3870AEFF3168A9FF010713240C0A060E7B67
        3F8F7B673F8F7B673F8FCAA258F3AF9B72FFBEBDBBFFBFBFBFFF6490C0FF3A74
        B4FF3D77B5FF3C75B3FF3B74B2FF3A72B0FF326AABFF01081424000000000000
        000000000000000000005F50326A0B3172C5B0B8C6FFBFBFBFFF6591C1FF407A
        B8FF3F79B7FF3E77B5FF3C76B4FF3B74B2FF346CADFF01091524000000000000
        0000000000000000000000000000073174BFB0B9C7FFBFBFBFFF6692C2FF427C
        BAFF407BB9FF3F79B7FF3E77B5FF3C76B4FF356EAFFF01091624000000000000
        0000000000000000000000000000083578BFB0BAC8FFBFBFBFFF6793C3FF437E
        BCFF427CBAFF417BB9FF3F79B7FF3E78B6FF3670B2FF020A1724000000000000
        00000000000000000000000000000A397CBF9FADC2FFBFBFBFFF6895C5FF4580
        BEFF437EBCFF427DBBFF417BB9FF3F79B7FF3771B4FF020B1724000000000000
        0000000000000000000000000000143C72A32E65B1FF4974B0FF6090C8FF568C
        C6FF568CC5FF5D90C8FF578AC5FF4E82C2FF3068B1F501060D14000000000000
        0000000000000000000000000000000204060310223203112334071425340916
        2634031123340312263803122638031226380209131C00000000}
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object cxrchContent: TcxRichEdit
    Left = 0
    Top = 0
    Align = alClient
    ParentFont = False
    ParentShowHint = False
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    ExplicitLeft = 208
    ExplicitTop = 192
    ExplicitWidth = 185
    ExplicitHeight = 89
    Height = 484
    Width = 618
  end
end
