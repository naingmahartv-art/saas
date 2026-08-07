VERSION 5.00
Begin VB.Form frmSoundSetting
  Caption = "Sound/Alarm Setting"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 7170
  ClientHeight = 2760
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdExit
    Caption = "E&xit"
    Left = 5580
    Top = 2250
    Width = 1005
    Height = 375
    TabIndex = 8
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 4590
    Top = 2250
    Width = 1005
    Height = 375
    TabIndex = 7
  End
  Begin VB.CheckBox Check3
    Caption = "YES"
    Left = 5715
    Top = 1620
    Width = 735
    Height = 195
    TabIndex = 6
  End
  Begin VB.CheckBox Check2
    Caption = "YES"
    Left = 5715
    Top = 1170
    Width = 735
    Height = 195
    TabIndex = 4
  End
  Begin VB.CheckBox Check1
    Caption = "YES"
    Left = 5715
    Top = 720
    Width = 735
    Height = 195
    TabIndex = 2
  End
  Begin VB.Line Line2
    X1 = 90
    Y1 = 1530
    X2 = 7065
    Y2 = 1530
  End
  Begin VB.Line Line1
    X1 = 90
    Y1 = 990
    X2 = 7065
    Y2 = 990
  End
  Begin VB.Shape Shape1
    Left = 90
    Top = 540
    Width = 6990
    Height = 1545
    BorderWidth = 2
  End
  Begin VB.Label Label4
    Caption = "Lucky Music"
    ForeColor = &H0&
    Left = 180
    Top = 1575
    Width = 3135
    Height = 360
    TabIndex = 5
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 11.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label2
    Caption = "Wrong Number Typing Alarm"
    ForeColor = &H0&
    Left = 180
    Top = 1125
    Width = 4260
    Height = 360
    TabIndex = 3
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 11.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "Hot Key Alarm"
    ForeColor = &H0&
    Left = 180
    Top = 675
    Width = 3135
    Height = 360
    TabIndex = 1
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 11.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label3
    Caption = "Description                                                                   Sound"
    ForeColor = &HFFFFFF&
    Left = 225
    Top = 135
    Width = 6825
    Height = 360
    TabIndex = 0
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Shape Shape2
    BackColor = &H808000&
    BorderColor = &HFFFFFF&
    Left = 45
    Top = 45
    Width = 7065
    Height = 480
    BackStyle = 1 'Opaque
  End
End

Attribute VB_Name = "frmSoundSetting"


Private Sub cmdExit_Click() '608BE0
  loc_00608BE0: push ebp
  loc_00608BE1: mov ebp, esp
  loc_00608BE3: sub esp, 0000000Ch
  loc_00608BE6: push 00403B36h ; __vbaExceptHandler
  loc_00608BEB: mov eax, fs:[00000000h]
  loc_00608BF1: push eax
  loc_00608BF2: mov fs:[00000000h], esp
  loc_00608BF9: sub esp, 00000018h
  loc_00608BFC: push ebx
  loc_00608BFD: push esi
  loc_00608BFE: push edi
  loc_00608BFF: mov var_C, esp
  loc_00608C02: mov var_8, 004036C8h
  loc_00608C09: mov edi, Me
  loc_00608C0C: mov eax, edi
  loc_00608C0E: and eax, 00000001h
  loc_00608C11: mov var_4, eax
  loc_00608C14: and edi, FFFFFFFEh
  loc_00608C17: push edi
  loc_00608C18: mov Me, edi
  loc_00608C1B: mov ecx, [edi]
  loc_00608C1D: call [ecx+00000004h]
  loc_00608C20: mov eax, [0061B394h]
  loc_00608C25: xor ebx, ebx
  loc_00608C27: cmp eax, ebx
  loc_00608C29: mov var_18, ebx
  loc_00608C2C: jnz 00608C3Eh
  loc_00608C2E: push 0061B394h
  loc_00608C33: push 0041E4A0h
  loc_00608C38: call [004011DCh] ; __vbaNew2
  loc_00608C3E: mov esi, [0061B394h]
  loc_00608C44: lea eax, var_18
  loc_00608C47: push edi
  loc_00608C48: push eax
  loc_00608C49: mov edx, [esi]
  loc_00608C4B: mov var_2C, edx
  loc_00608C4E: call [004010B8h] ; __vbaObjSetAddref
  loc_00608C54: mov ecx, var_2C
  loc_00608C57: push eax
  loc_00608C58: push esi
  loc_00608C59: call [ecx+00000010h]
  loc_00608C5C: cmp eax, ebx
  loc_00608C5E: fnclex
  loc_00608C60: jge 00608C71h
  loc_00608C62: push 00000010h
  loc_00608C64: push 0041E490h
  loc_00608C69: push esi
  loc_00608C6A: push eax
  loc_00608C6B: call [00401074h] ; __vbaHresultCheckObj
  loc_00608C71: lea ecx, var_18
  loc_00608C74: call [004012B0h] ; __vbaFreeObj
  loc_00608C7A: mov var_4, ebx
  loc_00608C7D: push 00608C8Fh
  loc_00608C82: jmp 00608C8Eh
  loc_00608C84: lea ecx, var_18
  loc_00608C87: call [004012B0h] ; __vbaFreeObj
  loc_00608C8D: ret
  loc_00608C8E: ret
  loc_00608C8F: mov eax, Me
  loc_00608C92: push eax
  loc_00608C93: mov edx, [eax]
  loc_00608C95: call [edx+00000008h]
  loc_00608C98: mov eax, var_4
  loc_00608C9B: mov ecx, var_14
  loc_00608C9E: pop edi
  loc_00608C9F: pop esi
  loc_00608CA0: mov fs:[00000000h], ecx
  loc_00608CA7: pop ebx
  loc_00608CA8: mov esp, ebp
  loc_00608CAA: pop ebp
  loc_00608CAB: retn 0004h
End Sub
