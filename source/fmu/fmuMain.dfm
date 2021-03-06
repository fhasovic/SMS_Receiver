object frmMain: TfrmMain
  Left = 515
  Top = 286
  Width = 948
  Height = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 145
    Top = 0
    Width = 787
    Height = 494
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 494
    Align = alLeft
    Constraints.MaxWidth = 145
    Constraints.MinWidth = 145
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 143
      Height = 80
      Align = alTop
      Caption = 'Connect options'
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 24
        Width = 24
        Height = 13
        Caption = 'COM'
      end
      object Label2: TLabel
        Left = 16
        Top = 52
        Width = 40
        Height = 13
        Caption = 'TimeOut'
      end
      object seCOM: TSpinEdit
        Left = 61
        Top = 20
        Width = 65
        Height = 22
        MaxValue = 999999
        MinValue = 1
        TabOrder = 0
        Value = 6
        OnChange = seCOMChange
      end
      object seTimeOut: TSpinEdit
        Left = 61
        Top = 48
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 5000
        OnChange = seCOMChange
      end
    end
    object Button1: TButton
      Left = 16
      Top = 88
      Width = 113
      Height = 25
      Caption = 'Send SMS'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 120
      Width = 113
      Height = 25
      Caption = 'Get SMS'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 152
      Width = 113
      Height = 25
      Caption = 'Delete SMS'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 16
      Top = 184
      Width = 113
      Height = 25
      Caption = 'Get All SMS'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 16
      Top = 216
      Width = 113
      Height = 25
      Caption = 'Delete All SMS'
      TabOrder = 5
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 16
      Top = 392
      Width = 113
      Height = 25
      Caption = 'TimerWork'
      TabOrder = 6
      OnClick = Timer1Timer
    end
    object Button7: TButton
      Left = 16
      Top = 248
      Width = 113
      Height = 25
      Caption = 'Get Int SMS'
      TabOrder = 7
      OnClick = Button7Click
    end
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'mvk1:f:\base\abonent\ABONENT.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=crjhjktnj')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 368
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 408
    Top = 8
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 168
    Top = 8
  end
  object IBSQL_ins_wmval: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'INSERT INTO ACCOUNT_PHONE (CODE, ACCOUNT, WMVAL, PHONE, ACCEPT_D' +
        'ATE, DATE_SMS, TEXT_SMS, DOC, DOC_POS) VALUES (NULL, :ACCOUNT, :' +
        'WMVAL, :PHONE, NULL, :DATE_SMS, :TEXT_SMS, :DOC, :DOC_POS);'
      '')
    Transaction = IBTransaction1
    Left = 488
    Top = 8
  end
  object IBQ_check_account: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select coalesce((select code  from ACCOUNT where code = :account' +
        '), '#39'000'#39') as code_res,'
      
        'coalesce((select FIO  from ACCOUNT where code = :account), '#39'000'#39 +
        ') as fio_res  from rdb$database')
    Left = 448
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'account'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account'
        ParamType = ptUnknown
      end>
  end
  object ibq_cr_doc: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select dgsm.doc, dgsm.doc_pos from ZMVK_INSERT_GSM_DOC_54(:accou' +
        'nt, :wmvol, :phone, :fio, :text_sms) dgsm')
    Left = 448
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'account'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wmvol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TEXT_SMS'
        ParamType = ptUnknown
      end>
  end
end
