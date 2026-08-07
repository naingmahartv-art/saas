VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC0000F8754DA1}#2.0#0"; "C:\WINDOWS\SysWow64\MSCOMCT2.OCX"
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Begin VB.Form frmTwo
  Caption = "    Between Two Count"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 4050
  ClientHeight = 2655
  BeginProperty Font
    Name = "Arial"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  ShowInTaskbar = 0   'False
  StartUpPosition = 1 'CenterOwner
  Begin VB.ComboBox cboTime
    Style = 2
    Left = 1560
    Top = 1410
    Width = 1125
    Height = 330
    TabIndex = 2
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin MSComCtl2.DTPicker cboStartCount
    Left = 1560
    Top = 360
    Width = 2265
    Height = 375
    TabIndex = 0
    OleObjectBlob = "frmTwo.frx":0000
  End
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmTwo.frx":00B8
    Left = 0
    Top = -90
  End
  Begin VB.CommandButton cmdOk
    Caption = "&Ok"
    Left = 1560
    Top = 2010
    Width = 885
    Height = 375
    TabIndex = 3
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2460
    Top = 2010
    Width = 885
    Height = 375
    TabIndex = 4
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin MSComCtl2.DTPicker cboEndCount
    Left = 1560
    Top = 900
    Width = 2265
    Height = 375
    TabIndex = 1
    OleObjectBlob = "frmTwo.frx":01AB
  End
  Begin VB.Label Label2
    Caption = "Time"
    Left = 270
    Top = 1440
    Width = 570
    Height = 285
    TabIndex = 7
    AutoSize = -1  'True
    BeginProperty Font
      Name = "MS Serif"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "End Count"
    Left = 270
    Top = 930
    Width = 1185
    Height = 285
    TabIndex = 6
    AutoSize = -1  'True
    BeginProperty Font
      Name = "MS Serif"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label26
    Caption = "Start Count"
    Left = 240
    Top = 420
    Width = 1260
    Height = 285
    TabIndex = 5
    AutoSize = -1  'True
    BeginProperty Font
      Name = "MS Serif"
      Size = 12
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmTwo"


Private Sub Form_Load() '602BA0
  loc_00602BA0: push ebp
  loc_00602BA1: mov ebp, esp
  loc_00602BA3: sub esp, 0000000Ch
  loc_00602BA6: push 00403B36h ; __vbaExceptHandler
  loc_00602BAB: mov eax, fs:[00000000h]
  loc_00602BB1: push eax
  loc_00602BB2: mov fs:[00000000h], esp
  loc_00602BB9: sub esp, 00000064h
  loc_00602BBC: push ebx
  loc_00602BBD: push esi
  loc_00602BBE: push edi
  loc_00602BBF: mov var_C, esp
  loc_00602BC2: mov var_8, 004034C8h
  loc_00602BC9: mov esi, Me
  loc_00602BCC: mov eax, esi
  loc_00602BCE: and eax, 00000001h
  loc_00602BD1: mov var_4, eax
  loc_00602BD4: and esi, FFFFFFFEh
  loc_00602BD7: push esi
  loc_00602BD8: mov Me, esi
  loc_00602BDB: mov ecx, [esi]
  loc_00602BDD: call [ecx+00000004h]
  loc_00602BE0: mov edx, [0061A0A0h]
  loc_00602BE6: xor eax, eax
  loc_00602BE8: push edx
  loc_00602BE9: push 00429778h ; "One"
  loc_00602BEE: mov var_18, eax
  loc_00602BF1: mov var_28, eax
  loc_00602BF4: mov var_38, eax
  loc_00602BF7: mov var_48, eax
  loc_00602BFA: mov var_58, eax
  loc_00602BFD: call [0040110Ch] ; __vbaStrCmp
  loc_00602C03: test eax, eax
  loc_00602C05: jnz 00602C8Bh
  loc_00602C0B: mov eax, [esi]
  loc_00602C0D: push esi
  loc_00602C0E: call [eax+0000030Ch]
  loc_00602C14: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00602C1A: lea ecx, var_18
  loc_00602C1D: push eax
  loc_00602C1E: push ecx
  loc_00602C1F: call ebx
  loc_00602C21: mov edi, eax
  loc_00602C23: push 00433938h ; "E Day"
  loc_00602C28: push edi
  loc_00602C29: mov edx, [edi]
  loc_00602C2B: call [edx+00000054h]
  loc_00602C2E: test eax, eax
  loc_00602C30: fnclex
  loc_00602C32: jge 00602C43h
  loc_00602C34: push 00000054h
  loc_00602C36: push 0041F62Ch
  loc_00602C3B: push edi
  loc_00602C3C: push eax
  loc_00602C3D: call [00401074h] ; __vbaHresultCheckObj
  loc_00602C43: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00602C49: lea ecx, var_18
  loc_00602C4C: call edi
  loc_00602C4E: mov eax, [esi]
  loc_00602C50: push esi
  loc_00602C51: call [eax+00000310h]
  loc_00602C57: lea ecx, var_18
  loc_00602C5A: push eax
  loc_00602C5B: push ecx
  loc_00602C5C: call ebx
  loc_00602C5E: mov edx, [eax]
  loc_00602C60: push 00433948h ; "M Day"
  loc_00602C65: push eax
  loc_00602C66: mov var_6C, eax
  loc_00602C69: call [edx+00000054h]
  loc_00602C6C: test eax, eax
  loc_00602C6E: fnclex
  loc_00602C70: jge 00602C84h
  loc_00602C72: mov ecx, var_6C
  loc_00602C75: push 00000054h
  loc_00602C77: push 0041F62Ch
  loc_00602C7C: push ecx
  loc_00602C7D: push eax
  loc_00602C7E: call [00401074h] ; __vbaHresultCheckObj
  loc_00602C84: lea ecx, var_18
  loc_00602C87: call edi
  loc_00602C89: jmp 00602C97h
  loc_00602C8B: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00602C91: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00602C97: mov edx, [esi]
  loc_00602C99: push esi
  loc_00602C9A: call [edx+000002FCh]
  loc_00602CA0: push eax
  loc_00602CA1: lea eax, var_18
  loc_00602CA4: push eax
  loc_00602CA5: call ebx
  loc_00602CA7: mov ecx, 0000000Ah
  loc_00602CAC: mov var_50, 80020004h
  loc_00602CB3: mov var_58, ecx
  loc_00602CB6: mov edx, [eax]
  loc_00602CB8: sub esp, 00000010h
  loc_00602CBB: mov var_6C, eax
  loc_00602CBE: mov eax, esp
  loc_00602CC0: push 0042FED4h ; "09:00"
  loc_00602CC5: mov [eax], ecx
  loc_00602CC7: mov ecx, var_54
  loc_00602CCA: mov [eax+00000004h], ecx
  loc_00602CCD: mov ecx, var_50
  loc_00602CD0: mov [eax+00000008h], ecx
  loc_00602CD3: mov ecx, var_4C
  loc_00602CD6: mov [eax+0000000Ch], ecx
  loc_00602CD9: mov eax, var_6C
  loc_00602CDC: push eax
  loc_00602CDD: call [edx+000001ECh]
  loc_00602CE3: test eax, eax
  loc_00602CE5: fnclex
  loc_00602CE7: jge 00602CFEh
  loc_00602CE9: mov ecx, var_6C
  loc_00602CEC: push 000001ECh
  loc_00602CF1: push 0041F844h
  loc_00602CF6: push ecx
  loc_00602CF7: push eax
  loc_00602CF8: call [00401074h] ; __vbaHresultCheckObj
  loc_00602CFE: lea ecx, var_18
  loc_00602D01: call edi
  loc_00602D03: mov edx, [esi]
  loc_00602D05: push esi
  loc_00602D06: call [edx+000002FCh]
  loc_00602D0C: push eax
  loc_00602D0D: lea eax, var_18
  loc_00602D10: push eax
  loc_00602D11: call ebx
  loc_00602D13: mov ecx, 0000000Ah
  loc_00602D18: mov var_50, 80020004h
  loc_00602D1F: mov var_58, ecx
  loc_00602D22: mov edx, [eax]
  loc_00602D24: sub esp, 00000010h
  loc_00602D27: mov var_6C, eax
  loc_00602D2A: mov eax, esp
  loc_00602D2C: push 0042FA2Ch ; "12:00"
  loc_00602D31: mov [eax], ecx
  loc_00602D33: mov ecx, var_54
  loc_00602D36: mov [eax+00000004h], ecx
  loc_00602D39: mov ecx, var_50
  loc_00602D3C: mov [eax+00000008h], ecx
  loc_00602D3F: mov ecx, var_4C
  loc_00602D42: mov [eax+0000000Ch], ecx
  loc_00602D45: mov eax, var_6C
  loc_00602D48: push eax
  loc_00602D49: call [edx+000001ECh]
  loc_00602D4F: test eax, eax
  loc_00602D51: fnclex
  loc_00602D53: jge 00602D6Ah
  loc_00602D55: mov ecx, var_6C
  loc_00602D58: push 000001ECh
  loc_00602D5D: push 0041F844h
  loc_00602D62: push ecx
  loc_00602D63: push eax
  loc_00602D64: call [00401074h] ; __vbaHresultCheckObj
  loc_00602D6A: lea ecx, var_18
  loc_00602D6D: call edi
  loc_00602D6F: mov edx, [esi]
  loc_00602D71: push esi
  loc_00602D72: call [edx+000002FCh]
  loc_00602D78: push eax
  loc_00602D79: lea eax, var_18
  loc_00602D7C: push eax
  loc_00602D7D: call ebx
  loc_00602D7F: mov ecx, 0000000Ah
  loc_00602D84: mov var_50, 80020004h
  loc_00602D8B: mov var_58, ecx
  loc_00602D8E: mov edx, [eax]
  loc_00602D90: sub esp, 00000010h
  loc_00602D93: mov var_6C, eax
  loc_00602D96: mov eax, esp
  loc_00602D98: push 0042FA3Ch ; "04:00"
  loc_00602D9D: mov [eax], ecx
  loc_00602D9F: mov ecx, var_54
  loc_00602DA2: mov [eax+00000004h], ecx
  loc_00602DA5: mov ecx, var_50
  loc_00602DA8: mov [eax+00000008h], ecx
  loc_00602DAB: mov ecx, var_4C
  loc_00602DAE: mov [eax+0000000Ch], ecx
  loc_00602DB1: mov eax, var_6C
  loc_00602DB4: push eax
  loc_00602DB5: call [edx+000001ECh]
  loc_00602DBB: test eax, eax
  loc_00602DBD: fnclex
  loc_00602DBF: jge 00602DD6h
  loc_00602DC1: mov ecx, var_6C
  loc_00602DC4: push 000001ECh
  loc_00602DC9: push 0041F844h
  loc_00602DCE: push ecx
  loc_00602DCF: push eax
  loc_00602DD0: call [00401074h] ; __vbaHresultCheckObj
  loc_00602DD6: lea ecx, var_18
  loc_00602DD9: call edi
  loc_00602DDB: mov edx, [esi]
  loc_00602DDD: push esi
  loc_00602DDE: call [edx+000002FCh]
  loc_00602DE4: push eax
  loc_00602DE5: lea eax, var_18
  loc_00602DE8: push eax
  loc_00602DE9: call ebx
  loc_00602DEB: mov ecx, 0000000Ah
  loc_00602DF0: mov var_50, 80020004h
  loc_00602DF7: mov var_58, ecx
  loc_00602DFA: mov edx, [eax]
  loc_00602DFC: sub esp, 00000010h
  loc_00602DFF: mov var_6C, eax
  loc_00602E02: mov eax, esp
  loc_00602E04: push 00432F64h ; "Full Day"
  loc_00602E09: mov [eax], ecx
  loc_00602E0B: mov ecx, var_54
  loc_00602E0E: mov [eax+00000004h], ecx
  loc_00602E11: mov ecx, var_50
  loc_00602E14: mov [eax+00000008h], ecx
  loc_00602E17: mov ecx, var_4C
  loc_00602E1A: mov [eax+0000000Ch], ecx
  loc_00602E1D: mov eax, var_6C
  loc_00602E20: push eax
  loc_00602E21: call [edx+000001ECh]
  loc_00602E27: test eax, eax
  loc_00602E29: fnclex
  loc_00602E2B: jge 00602E42h
  loc_00602E2D: mov ecx, var_6C
  loc_00602E30: push 000001ECh
  loc_00602E35: push 0041F844h
  loc_00602E3A: push ecx
  loc_00602E3B: push eax
  loc_00602E3C: call [00401074h] ; __vbaHresultCheckObj
  loc_00602E42: lea ecx, var_18
  loc_00602E45: call edi
  loc_00602E47: lea edx, var_28
  loc_00602E4A: push edx
  loc_00602E4B: call [00401224h] ; rtcGetDateVar
  loc_00602E51: lea edx, var_58
  loc_00602E54: lea ecx, var_38
  loc_00602E57: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_00602E5E: mov var_58, 00000008h
  loc_00602E65: call [00401240h] ; __vbaVarDup
  loc_00602E6B: push 00000001h
  loc_00602E6D: lea eax, var_38
  loc_00602E70: push 00000001h
  loc_00602E72: lea ecx, var_28
  loc_00602E75: push eax
  loc_00602E76: lea edx, var_48
  loc_00602E79: push ecx
  loc_00602E7A: push edx
  loc_00602E7B: call [00401060h] ; rtcVarFromFormatVar
  loc_00602E81: mov ecx, var_48
  loc_00602E84: mov edx, var_44
  loc_00602E87: sub esp, 00000010h
  loc_00602E8A: mov eax, esp
  loc_00602E8C: push 00000014h
  loc_00602E8E: push esi
  loc_00602E8F: mov [eax], ecx
  loc_00602E91: mov ecx, var_40
  loc_00602E94: mov [eax+00000004h], edx
  loc_00602E97: mov edx, var_3C
  loc_00602E9A: mov [eax+00000008h], ecx
  loc_00602E9D: mov [eax+0000000Ch], edx
  loc_00602EA0: mov eax, [esi]
  loc_00602EA2: call [eax+00000314h]
  loc_00602EA8: lea ecx, var_18
  loc_00602EAB: push eax
  loc_00602EAC: push ecx
  loc_00602EAD: call ebx
  loc_00602EAF: push eax
  loc_00602EB0: call [00401288h] ; __vbaLateIdSt
  loc_00602EB6: lea ecx, var_18
  loc_00602EB9: call edi
  loc_00602EBB: lea edx, var_48
  loc_00602EBE: lea eax, var_38
  loc_00602EC1: push edx
  loc_00602EC2: lea ecx, var_28
  loc_00602EC5: push eax
  loc_00602EC6: push ecx
  loc_00602EC7: push 00000003h
  loc_00602EC9: call [00401038h] ; __vbaFreeVarList
  loc_00602ECF: add esp, 00000010h
  loc_00602ED2: lea edx, var_28
  loc_00602ED5: push edx
  loc_00602ED6: call [00401224h] ; rtcGetDateVar
  loc_00602EDC: lea edx, var_58
  loc_00602EDF: lea ecx, var_38
  loc_00602EE2: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_00602EE9: mov var_58, 00000008h
  loc_00602EF0: call [00401240h] ; __vbaVarDup
  loc_00602EF6: push 00000001h
  loc_00602EF8: lea eax, var_38
  loc_00602EFB: push 00000001h
  loc_00602EFD: lea ecx, var_28
  loc_00602F00: push eax
  loc_00602F01: lea edx, var_48
  loc_00602F04: push ecx
  loc_00602F05: push edx
  loc_00602F06: call [00401060h] ; rtcVarFromFormatVar
  loc_00602F0C: mov ecx, var_48
  loc_00602F0F: mov edx, var_44
  loc_00602F12: sub esp, 00000010h
  loc_00602F15: mov eax, esp
  loc_00602F17: push 00000014h
  loc_00602F19: push esi
  loc_00602F1A: mov [eax], ecx
  loc_00602F1C: mov ecx, var_40
  loc_00602F1F: mov [eax+00000004h], edx
  loc_00602F22: mov edx, var_3C
  loc_00602F25: mov [eax+00000008h], ecx
  loc_00602F28: mov [eax+0000000Ch], edx
  loc_00602F2B: mov eax, [esi]
  loc_00602F2D: call [eax+0000031Ch]
  loc_00602F33: lea ecx, var_18
  loc_00602F36: push eax
  loc_00602F37: push ecx
  loc_00602F38: call ebx
  loc_00602F3A: push eax
  loc_00602F3B: call [00401288h] ; __vbaLateIdSt
  loc_00602F41: lea ecx, var_18
  loc_00602F44: call edi
  loc_00602F46: lea edx, var_48
  loc_00602F49: lea eax, var_38
  loc_00602F4C: push edx
  loc_00602F4D: lea ecx, var_28
  loc_00602F50: push eax
  loc_00602F51: push ecx
  loc_00602F52: push 00000003h
  loc_00602F54: call [00401038h] ; __vbaFreeVarList
  loc_00602F5A: add esp, 00000010h
  loc_00602F5D: mov var_4, 00000000h
  loc_00602F64: push 00602F8Dh
  loc_00602F69: jmp 00602F8Ch
  loc_00602F6B: lea ecx, var_18
  loc_00602F6E: call [004012B0h] ; __vbaFreeObj
  loc_00602F74: lea edx, var_48
  loc_00602F77: lea eax, var_38
  loc_00602F7A: push edx
  loc_00602F7B: lea ecx, var_28
  loc_00602F7E: push eax
  loc_00602F7F: push ecx
  loc_00602F80: push 00000003h
  loc_00602F82: call [00401038h] ; __vbaFreeVarList
  loc_00602F88: add esp, 00000010h
  loc_00602F8B: ret
  loc_00602F8C: ret
  loc_00602F8D: mov eax, Me
  loc_00602F90: push eax
  loc_00602F91: mov edx, [eax]
  loc_00602F93: call [edx+00000008h]
  loc_00602F96: mov eax, var_4
  loc_00602F99: mov ecx, var_14
  loc_00602F9C: pop edi
  loc_00602F9D: pop esi
  loc_00602F9E: mov fs:[00000000h], ecx
  loc_00602FA5: pop ebx
  loc_00602FA6: mov esp, ebp
  loc_00602FA8: pop ebp
  loc_00602FA9: retn 0004h
End Sub

Private Sub cboTime_KeyPress(KeyAscii As Integer) '5FC1C0
  loc_005FC1C0: push ebp
  loc_005FC1C1: mov ebp, esp
  loc_005FC1C3: sub esp, 0000000Ch
  loc_005FC1C6: push 00403B36h ; __vbaExceptHandler
  loc_005FC1CB: mov eax, fs:[00000000h]
  loc_005FC1D1: push eax
  loc_005FC1D2: mov fs:[00000000h], esp
  loc_005FC1D9: sub esp, 00000014h
  loc_005FC1DC: push ebx
  loc_005FC1DD: push esi
  loc_005FC1DE: push edi
  loc_005FC1DF: mov var_C, esp
  loc_005FC1E2: mov var_8, 00403438h
  loc_005FC1E9: mov esi, Me
  loc_005FC1EC: mov eax, esi
  loc_005FC1EE: and eax, 00000001h
  loc_005FC1F1: mov var_4, eax
  loc_005FC1F4: and esi, FFFFFFFEh
  loc_005FC1F7: push esi
  loc_005FC1F8: mov Me, esi
  loc_005FC1FB: mov ecx, [esi]
  loc_005FC1FD: call [ecx+00000004h]
  loc_005FC200: mov edx, KeyAscii
  loc_005FC203: xor edi, edi
  loc_005FC205: mov var_18, edi
  loc_005FC208: cmp [edx], 000Dh
  loc_005FC20C: jnz 005FC24Eh
  loc_005FC20E: mov eax, [esi]
  loc_005FC210: push esi
  loc_005FC211: call [eax+00000300h]
  loc_005FC217: lea ecx, var_18
  loc_005FC21A: push eax
  loc_005FC21B: push ecx
  loc_005FC21C: call [004010A0h] ; __vbaObjSet
  loc_005FC222: mov esi, eax
  loc_005FC224: push esi
  loc_005FC225: mov edx, [esi]
  loc_005FC227: call [edx+000001A4h]
  loc_005FC22D: cmp eax, edi
  loc_005FC22F: fnclex
  loc_005FC231: jge 005FC245h
  loc_005FC233: push 000001A4h
  loc_005FC238: push 0041EAACh
  loc_005FC23D: push esi
  loc_005FC23E: push eax
  loc_005FC23F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC245: lea ecx, var_18
  loc_005FC248: call [004012B0h] ; __vbaFreeObj
  loc_005FC24E: mov var_4, edi
  loc_005FC251: push 005FC263h
  loc_005FC256: jmp 005FC262h
  loc_005FC258: lea ecx, var_18
  loc_005FC25B: call [004012B0h] ; __vbaFreeObj
  loc_005FC261: ret
  loc_005FC262: ret
  loc_005FC263: mov eax, Me
  loc_005FC266: push eax
  loc_005FC267: mov ecx, [eax]
  loc_005FC269: call [ecx+00000008h]
  loc_005FC26C: mov eax, var_4
  loc_005FC26F: mov ecx, var_14
  loc_005FC272: pop edi
  loc_005FC273: pop esi
  loc_005FC274: mov fs:[00000000h], ecx
  loc_005FC27B: pop ebx
  loc_005FC27C: mov esp, ebp
  loc_005FC27E: pop ebp
  loc_005FC27F: retn 0008h
End Sub

Private Sub cmdCancel_Click() '5FC290
  loc_005FC290: push ebp
  loc_005FC291: mov ebp, esp
  loc_005FC293: sub esp, 0000000Ch
  loc_005FC296: push 00403B36h ; __vbaExceptHandler
  loc_005FC29B: mov eax, fs:[00000000h]
  loc_005FC2A1: push eax
  loc_005FC2A2: mov fs:[00000000h], esp
  loc_005FC2A9: sub esp, 00000018h
  loc_005FC2AC: push ebx
  loc_005FC2AD: push esi
  loc_005FC2AE: push edi
  loc_005FC2AF: mov var_C, esp
  loc_005FC2B2: mov var_8, 00403448h
  loc_005FC2B9: mov edi, Me
  loc_005FC2BC: mov eax, edi
  loc_005FC2BE: and eax, 00000001h
  loc_005FC2C1: mov var_4, eax
  loc_005FC2C4: and edi, FFFFFFFEh
  loc_005FC2C7: push edi
  loc_005FC2C8: mov Me, edi
  loc_005FC2CB: mov ecx, [edi]
  loc_005FC2CD: call [ecx+00000004h]
  loc_005FC2D0: mov eax, [0061B394h]
  loc_005FC2D5: xor ebx, ebx
  loc_005FC2D7: cmp eax, ebx
  loc_005FC2D9: mov var_18, ebx
  loc_005FC2DC: jnz 005FC2EEh
  loc_005FC2DE: push 0061B394h
  loc_005FC2E3: push 0041E4A0h
  loc_005FC2E8: call [004011DCh] ; __vbaNew2
  loc_005FC2EE: mov esi, [0061B394h]
  loc_005FC2F4: lea eax, var_18
  loc_005FC2F7: push edi
  loc_005FC2F8: push eax
  loc_005FC2F9: mov edx, [esi]
  loc_005FC2FB: mov var_2C, edx
  loc_005FC2FE: call [004010B8h] ; __vbaObjSetAddref
  loc_005FC304: mov ecx, var_2C
  loc_005FC307: push eax
  loc_005FC308: push esi
  loc_005FC309: call [ecx+00000010h]
  loc_005FC30C: cmp eax, ebx
  loc_005FC30E: fnclex
  loc_005FC310: jge 005FC321h
  loc_005FC312: push 00000010h
  loc_005FC314: push 0041E490h
  loc_005FC319: push esi
  loc_005FC31A: push eax
  loc_005FC31B: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC321: lea ecx, var_18
  loc_005FC324: call [004012B0h] ; __vbaFreeObj
  loc_005FC32A: mov var_4, ebx
  loc_005FC32D: push 005FC33Fh
  loc_005FC332: jmp 005FC33Eh
  loc_005FC334: lea ecx, var_18
  loc_005FC337: call [004012B0h] ; __vbaFreeObj
  loc_005FC33D: ret
  loc_005FC33E: ret
  loc_005FC33F: mov eax, Me
  loc_005FC342: push eax
  loc_005FC343: mov edx, [eax]
  loc_005FC345: call [edx+00000008h]
  loc_005FC348: mov eax, var_4
  loc_005FC34B: mov ecx, var_14
  loc_005FC34E: pop edi
  loc_005FC34F: pop esi
  loc_005FC350: mov fs:[00000000h], ecx
  loc_005FC357: pop ebx
  loc_005FC358: mov esp, ebp
  loc_005FC35A: pop ebp
  loc_005FC35B: retn 0004h
End Sub

Private Sub cmdOk_Click() '5FF7E0
  loc_005FF7E0: push ebp
  loc_005FF7E1: mov ebp, esp
  loc_005FF7E3: sub esp, 0000000Ch
  loc_005FF7E6: push 00403B36h ; __vbaExceptHandler
  loc_005FF7EB: mov eax, fs:[00000000h]
  loc_005FF7F1: push eax
  loc_005FF7F2: mov fs:[00000000h], esp
  loc_005FF7F9: sub esp, 0000005Ch
  loc_005FF7FC: push ebx
  loc_005FF7FD: push esi
  loc_005FF7FE: push edi
  loc_005FF7FF: mov var_C, esp
  loc_005FF802: mov var_8, 004034A8h
  loc_005FF809: mov esi, Me
  loc_005FF80C: mov eax, esi
  loc_005FF80E: and eax, 00000001h
  loc_005FF811: mov var_4, eax
  loc_005FF814: and esi, FFFFFFFEh
  loc_005FF817: push esi
  loc_005FF818: mov Me, esi
  loc_005FF81B: mov ecx, [esi]
  loc_005FF81D: call [ecx+00000004h]
  loc_005FF820: mov edi, [004010D4h] ; rtcTrimVar
  loc_005FF826: xor eax, eax
  loc_005FF828: mov var_18, eax
  loc_005FF82B: mov var_28, eax
  loc_005FF82E: mov var_38, eax
  loc_005FF831: mov var_48, eax
  loc_005FF834: mov var_60, eax
  loc_005FF837: lea edx, var_48
  loc_005FF83A: lea eax, var_28
  loc_005FF83D: push edx
  loc_005FF83E: push eax
  loc_005FF83F: mov var_40, 0061A0A0h
  loc_005FF846: mov var_48, 00004008h
  loc_005FF84D: call edi
  loc_005FF84F: lea edx, var_28
  loc_005FF852: lea ecx, var_60
  loc_005FF855: call [00401014h] ; __vbaVarMove
  loc_005FF85B: mov ebx, [00401110h] ; __vbaVarTstEq
  loc_005FF861: lea ecx, var_60
  loc_005FF864: lea edx, var_48
  loc_005FF867: push ecx
  loc_005FF868: push edx
  loc_005FF869: mov var_40, 00429820h ; "Sale"
  loc_005FF870: mov var_48, 00008008h
  loc_005FF877: call ebx
  loc_005FF879: test ax, ax
  loc_005FF87C: jz 005FF88Ch
  loc_005FF87E: mov eax, [esi]
  loc_005FF880: push esi
  loc_005FF881: call [eax+00000708h]
  loc_005FF887: jmp 005FFB53h
  loc_005FF88C: lea ecx, var_60
  loc_005FF88F: lea edx, var_48
  loc_005FF892: push ecx
  loc_005FF893: push edx
  loc_005FF894: mov var_40, 0042FE68h ; "Purchase"
  loc_005FF89B: mov var_48, 00008008h
  loc_005FF8A2: call ebx
  loc_005FF8A4: test ax, ax
  loc_005FF8A7: jz 005FF8B7h
  loc_005FF8A9: mov eax, [esi]
  loc_005FF8AB: push esi
  loc_005FF8AC: call [eax+00000718h]
  loc_005FF8B2: jmp 005FFB53h
  loc_005FF8B7: lea ecx, var_60
  loc_005FF8BA: lea edx, var_48
  loc_005FF8BD: push ecx
  loc_005FF8BE: push edx
  loc_005FF8BF: mov var_40, 0042A50Ch ; "Sale/Purchase"
  loc_005FF8C6: mov var_48, 00008008h
  loc_005FF8CD: call ebx
  loc_005FF8CF: test ax, ax
  loc_005FF8D2: jz 005FF8EBh
  loc_005FF8D4: mov eax, [esi]
  loc_005FF8D6: push esi
  loc_005FF8D7: call [eax+00000710h]
  loc_005FF8DD: mov ecx, [esi]
  loc_005FF8DF: push esi
  loc_005FF8E0: call [ecx+00000720h]
  loc_005FF8E6: jmp 005FFB53h
  loc_005FF8EB: lea edx, var_60
  loc_005FF8EE: lea eax, var_48
  loc_005FF8F1: push edx
  loc_005FF8F2: push eax
  loc_005FF8F3: mov var_40, 00429778h ; "One"
  loc_005FF8FA: mov var_48, 00008008h
  loc_005FF901: call ebx
  loc_005FF903: test ax, ax
  loc_005FF906: jz 005FF916h
  loc_005FF908: mov ecx, [esi]
  loc_005FF90A: push esi
  loc_005FF90B: call [ecx+0000070Ch]
  loc_005FF911: jmp 005FFB53h
  loc_005FF916: lea edx, var_60
  loc_005FF919: lea eax, var_48
  loc_005FF91C: push edx
  loc_005FF91D: push eax
  loc_005FF91E: mov var_40, 004295B8h ; "TwoDate"
  loc_005FF925: mov var_48, 00008008h
  loc_005FF92C: call ebx
  loc_005FF92E: test ax, ax
  loc_005FF931: jz 005FFA2Fh
  loc_005FF937: mov ecx, [esi]
  loc_005FF939: push 00000000h
  loc_005FF93B: push 00000014h
  loc_005FF93D: push esi
  loc_005FF93E: call [ecx+00000314h]
  loc_005FF944: mov ebx, [004010A0h] ; __vbaObjSet
  loc_005FF94A: lea edx, var_18
  loc_005FF94D: push eax
  loc_005FF94E: push edx
  loc_005FF94F: call ebx
  loc_005FF951: push eax
  loc_005FF952: lea eax, var_28
  loc_005FF955: push eax
  loc_005FF956: call [00401140h] ; __vbaLateIdCallLd
  loc_005FF95C: add esp, 00000010h
  loc_005FF95F: lea ecx, var_38
  loc_005FF962: push eax
  loc_005FF963: push ecx
  loc_005FF964: call edi
  loc_005FF966: lea edx, var_38
  loc_005FF969: push edx
  loc_005FF96A: call [004011B8h] ; __vbaDateVar
  loc_005FF970: fstp real8 ptr [0061A0F4h]
  loc_005FF976: lea ecx, var_18
  loc_005FF979: call [004012B0h] ; __vbaFreeObj
  loc_005FF97F: lea eax, var_38
  loc_005FF982: lea ecx, var_28
  loc_005FF985: push eax
  loc_005FF986: push ecx
  loc_005FF987: push 00000002h
  loc_005FF989: call [00401038h] ; __vbaFreeVarList
  loc_005FF98F: mov edx, [esi]
  loc_005FF991: add esp, 0000000Ch
  loc_005FF994: push 00000000h
  loc_005FF996: push 00000014h
  loc_005FF998: push esi
  loc_005FF999: call [edx+0000031Ch]
  loc_005FF99F: push eax
  loc_005FF9A0: lea eax, var_18
  loc_005FF9A3: push eax
  loc_005FF9A4: call ebx
  loc_005FF9A6: lea ecx, var_28
  loc_005FF9A9: push eax
  loc_005FF9AA: push ecx
  loc_005FF9AB: call [00401140h] ; __vbaLateIdCallLd
  loc_005FF9B1: add esp, 00000010h
  loc_005FF9B4: lea edx, var_38
  loc_005FF9B7: push eax
  loc_005FF9B8: push edx
  loc_005FF9B9: call edi
  loc_005FF9BB: lea eax, var_38
  loc_005FF9BE: push eax
  loc_005FF9BF: call [004011B8h] ; __vbaDateVar
  loc_005FF9C5: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005FF9CB: lea ecx, var_18
  loc_005FF9CE: fstp real8 ptr [0061A0FCh]
  loc_005FF9D4: call ebx
  loc_005FF9D6: lea ecx, var_38
  loc_005FF9D9: lea edx, var_28
  loc_005FF9DC: push ecx
  loc_005FF9DD: push edx
  loc_005FF9DE: push 00000002h
  loc_005FF9E0: call [00401038h] ; __vbaFreeVarList
  loc_005FF9E6: mov eax, [0061B394h]
  loc_005FF9EB: add esp, 0000000Ch
  loc_005FF9EE: test eax, eax
  loc_005FF9F0: jnz 005FFA02h
  loc_005FF9F2: push 0061B394h
  loc_005FF9F7: push 0041E4A0h
  loc_005FF9FC: call [004011DCh] ; __vbaNew2
  loc_005FFA02: mov edi, [0061B394h]
  loc_005FFA08: lea eax, var_18
  loc_005FFA0B: push esi
  loc_005FFA0C: push eax
  loc_005FFA0D: mov edx, [edi]
  loc_005FFA0F: mov var_6C, edx
  loc_005FFA12: call [004010B8h] ; __vbaObjSetAddref
  loc_005FFA18: mov ecx, var_6C
  loc_005FFA1B: push eax
  loc_005FFA1C: push edi
  loc_005FFA1D: call [ecx+00000010h]
  loc_005FFA20: test eax, eax
  loc_005FFA22: fnclex
  loc_005FFA24: jge 005FFB4Eh
  loc_005FFA2A: jmp 005FFB3Fh
  loc_005FFA2F: lea edx, var_60
  loc_005FFA32: lea eax, var_48
  loc_005FFA35: push edx
  loc_005FFA36: push eax
  loc_005FFA37: mov var_40, 00433760h ; "Receive"
  loc_005FFA3E: mov var_48, 00008008h
  loc_005FFA45: call ebx
  loc_005FFA47: test ax, ax
  loc_005FFA4A: jz 005FFB53h
  loc_005FFA50: mov ecx, [esi]
  loc_005FFA52: push 00000000h
  loc_005FFA54: push 00000014h
  loc_005FFA56: push esi
  loc_005FFA57: call [ecx+00000314h]
  loc_005FFA5D: mov ebx, [004010A0h] ; __vbaObjSet
  loc_005FFA63: lea edx, var_18
  loc_005FFA66: push eax
  loc_005FFA67: push edx
  loc_005FFA68: call ebx
  loc_005FFA6A: push eax
  loc_005FFA6B: lea eax, var_28
  loc_005FFA6E: push eax
  loc_005FFA6F: call [00401140h] ; __vbaLateIdCallLd
  loc_005FFA75: add esp, 00000010h
  loc_005FFA78: lea ecx, var_38
  loc_005FFA7B: push eax
  loc_005FFA7C: push ecx
  loc_005FFA7D: call edi
  loc_005FFA7F: lea edx, var_38
  loc_005FFA82: push edx
  loc_005FFA83: call [004011B8h] ; __vbaDateVar
  loc_005FFA89: fstp real8 ptr [0061A0F4h]
  loc_005FFA8F: lea ecx, var_18
  loc_005FFA92: call [004012B0h] ; __vbaFreeObj
  loc_005FFA98: lea eax, var_38
  loc_005FFA9B: lea ecx, var_28
  loc_005FFA9E: push eax
  loc_005FFA9F: push ecx
  loc_005FFAA0: push 00000002h
  loc_005FFAA2: call [00401038h] ; __vbaFreeVarList
  loc_005FFAA8: mov edx, [esi]
  loc_005FFAAA: add esp, 0000000Ch
  loc_005FFAAD: push 00000000h
  loc_005FFAAF: push 00000014h
  loc_005FFAB1: push esi
  loc_005FFAB2: call [edx+0000031Ch]
  loc_005FFAB8: push eax
  loc_005FFAB9: lea eax, var_18
  loc_005FFABC: push eax
  loc_005FFABD: call ebx
  loc_005FFABF: lea ecx, var_28
  loc_005FFAC2: push eax
  loc_005FFAC3: push ecx
  loc_005FFAC4: call [00401140h] ; __vbaLateIdCallLd
  loc_005FFACA: add esp, 00000010h
  loc_005FFACD: lea edx, var_38
  loc_005FFAD0: push eax
  loc_005FFAD1: push edx
  loc_005FFAD2: call edi
  loc_005FFAD4: lea eax, var_38
  loc_005FFAD7: push eax
  loc_005FFAD8: call [004011B8h] ; __vbaDateVar
  loc_005FFADE: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005FFAE4: lea ecx, var_18
  loc_005FFAE7: fstp real8 ptr [0061A0FCh]
  loc_005FFAED: call ebx
  loc_005FFAEF: lea ecx, var_38
  loc_005FFAF2: lea edx, var_28
  loc_005FFAF5: push ecx
  loc_005FFAF6: push edx
  loc_005FFAF7: push 00000002h
  loc_005FFAF9: call [00401038h] ; __vbaFreeVarList
  loc_005FFAFF: mov eax, [0061B394h]
  loc_005FFB04: add esp, 0000000Ch
  loc_005FFB07: test eax, eax
  loc_005FFB09: jnz 005FFB1Bh
  loc_005FFB0B: push 0061B394h
  loc_005FFB10: push 0041E4A0h
  loc_005FFB15: call [004011DCh] ; __vbaNew2
  loc_005FFB1B: mov edi, [0061B394h]
  loc_005FFB21: lea eax, var_18
  loc_005FFB24: push esi
  loc_005FFB25: push eax
  loc_005FFB26: mov edx, [edi]
  loc_005FFB28: mov var_70, edx
  loc_005FFB2B: call [004010B8h] ; __vbaObjSetAddref
  loc_005FFB31: mov ecx, var_70
  loc_005FFB34: push eax
  loc_005FFB35: push edi
  loc_005FFB36: call [ecx+00000010h]
  loc_005FFB39: test eax, eax
  loc_005FFB3B: fnclex
  loc_005FFB3D: jge 005FFB4Eh
  loc_005FFB3F: push 00000010h
  loc_005FFB41: push 0041E490h
  loc_005FFB46: push edi
  loc_005FFB47: push eax
  loc_005FFB48: call [00401074h] ; __vbaHresultCheckObj
  loc_005FFB4E: lea ecx, var_18
  loc_005FFB51: call ebx
  loc_005FFB53: mov var_4, 00000000h
  loc_005FFB5A: fwait
  loc_005FFB5B: push 005FFB89h
  loc_005FFB60: jmp 005FFB7Fh
  loc_005FFB62: lea ecx, var_18
  loc_005FFB65: call [004012B0h] ; __vbaFreeObj
  loc_005FFB6B: lea edx, var_38
  loc_005FFB6E: lea eax, var_28
  loc_005FFB71: push edx
  loc_005FFB72: push eax
  loc_005FFB73: push 00000002h
  loc_005FFB75: call [00401038h] ; __vbaFreeVarList
  loc_005FFB7B: add esp, 0000000Ch
  loc_005FFB7E: ret
  loc_005FFB7F: lea ecx, var_60
  loc_005FFB82: call [00401020h] ; __vbaFreeVar
  loc_005FFB88: ret
  loc_005FFB89: mov eax, Me
  loc_005FFB8C: push eax
  loc_005FFB8D: mov ecx, [eax]
  loc_005FFB8F: call [ecx+00000008h]
  loc_005FFB92: mov eax, var_4
  loc_005FFB95: mov ecx, var_14
  loc_005FFB98: pop edi
  loc_005FFB99: pop esi
  loc_005FFB9A: mov fs:[00000000h], ecx
  loc_005FFBA1: pop ebx
  loc_005FFBA2: mov esp, ebp
  loc_005FFBA4: pop ebp
  loc_005FFBA5: retn 0004h
End Sub

Private Sub cboEndCount_KeyDown(KeyCode As Integer, Shift As Integer) '5FC040
  loc_005FC040: push ebp
  loc_005FC041: mov ebp, esp
  loc_005FC043: sub esp, 0000000Ch
  loc_005FC046: push 00403B36h ; __vbaExceptHandler
  loc_005FC04B: mov eax, fs:[00000000h]
  loc_005FC051: push eax
  loc_005FC052: mov fs:[00000000h], esp
  loc_005FC059: sub esp, 00000014h
  loc_005FC05C: push ebx
  loc_005FC05D: push esi
  loc_005FC05E: push edi
  loc_005FC05F: mov var_C, esp
  loc_005FC062: mov var_8, 00403418h
  loc_005FC069: mov esi, Me
  loc_005FC06C: mov eax, esi
  loc_005FC06E: and eax, 00000001h
  loc_005FC071: mov var_4, eax
  loc_005FC074: and esi, FFFFFFFEh
  loc_005FC077: push esi
  loc_005FC078: mov Me, esi
  loc_005FC07B: mov ecx, [esi]
  loc_005FC07D: call [ecx+00000004h]
  loc_005FC080: mov edx, KeyCode
  loc_005FC083: xor edi, edi
  loc_005FC085: mov var_18, edi
  loc_005FC088: cmp [edx], 000Dh
  loc_005FC08C: jnz 005FC0CEh
  loc_005FC08E: mov eax, [esi]
  loc_005FC090: push esi
  loc_005FC091: call [eax+000002FCh]
  loc_005FC097: lea ecx, var_18
  loc_005FC09A: push eax
  loc_005FC09B: push ecx
  loc_005FC09C: call [004010A0h] ; __vbaObjSet
  loc_005FC0A2: mov esi, eax
  loc_005FC0A4: push esi
  loc_005FC0A5: mov edx, [esi]
  loc_005FC0A7: call [edx+000001F4h]
  loc_005FC0AD: cmp eax, edi
  loc_005FC0AF: fnclex
  loc_005FC0B1: jge 005FC0C5h
  loc_005FC0B3: push 000001F4h
  loc_005FC0B8: push 0041F844h
  loc_005FC0BD: push esi
  loc_005FC0BE: push eax
  loc_005FC0BF: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC0C5: lea ecx, var_18
  loc_005FC0C8: call [004012B0h] ; __vbaFreeObj
  loc_005FC0CE: mov var_4, edi
  loc_005FC0D1: push 005FC0E3h
  loc_005FC0D6: jmp 005FC0E2h
  loc_005FC0D8: lea ecx, var_18
  loc_005FC0DB: call [004012B0h] ; __vbaFreeObj
  loc_005FC0E1: ret
  loc_005FC0E2: ret
  loc_005FC0E3: mov eax, Me
  loc_005FC0E6: push eax
  loc_005FC0E7: mov ecx, [eax]
  loc_005FC0E9: call [ecx+00000008h]
  loc_005FC0EC: mov eax, var_4
  loc_005FC0EF: mov ecx, var_14
  loc_005FC0F2: pop edi
  loc_005FC0F3: pop esi
  loc_005FC0F4: mov fs:[00000000h], ecx
  loc_005FC0FB: pop ebx
  loc_005FC0FC: mov esp, ebp
  loc_005FC0FE: pop ebp
  loc_005FC0FF: retn 000Ch
End Sub

Private Sub cboStartCount_KeyDown(KeyCode As Integer, Shift As Integer) '5FC110
  loc_005FC110: push ebp
  loc_005FC111: mov ebp, esp
  loc_005FC113: sub esp, 0000000Ch
  loc_005FC116: push 00403B36h ; __vbaExceptHandler
  loc_005FC11B: mov eax, fs:[00000000h]
  loc_005FC121: push eax
  loc_005FC122: mov fs:[00000000h], esp
  loc_005FC129: sub esp, 0000000Ch
  loc_005FC12C: push ebx
  loc_005FC12D: push esi
  loc_005FC12E: push edi
  loc_005FC12F: mov var_C, esp
  loc_005FC132: mov var_8, 00403428h
  loc_005FC139: mov esi, Me
  loc_005FC13C: mov eax, esi
  loc_005FC13E: and eax, 00000001h
  loc_005FC141: mov var_4, eax
  loc_005FC144: and esi, FFFFFFFEh
  loc_005FC147: push esi
  loc_005FC148: mov Me, esi
  loc_005FC14B: mov ecx, [esi]
  loc_005FC14D: call [ecx+00000004h]
  loc_005FC150: mov edx, KeyCode
  loc_005FC153: xor edi, edi
  loc_005FC155: mov var_18, edi
  loc_005FC158: cmp [edx], 000Dh
  loc_005FC15C: jnz 005FC18Bh
  loc_005FC15E: mov eax, [esi]
  loc_005FC160: push edi
  loc_005FC161: push 80011000h
  loc_005FC166: push esi
  loc_005FC167: call [eax+0000031Ch]
  loc_005FC16D: lea ecx, var_18
  loc_005FC170: push eax
  loc_005FC171: push ecx
  loc_005FC172: call [004010A0h] ; __vbaObjSet
  loc_005FC178: push eax
  loc_005FC179: call [00401024h] ; __vbaLateIdCall
  loc_005FC17F: add esp, 0000000Ch
  loc_005FC182: lea ecx, var_18
  loc_005FC185: call [004012B0h] ; __vbaFreeObj
  loc_005FC18B: mov var_4, edi
  loc_005FC18E: push 005FC1A0h
  loc_005FC193: jmp 005FC19Fh
  loc_005FC195: lea ecx, var_18
  loc_005FC198: call [004012B0h] ; __vbaFreeObj
  loc_005FC19E: ret
  loc_005FC19F: ret
  loc_005FC1A0: mov eax, Me
  loc_005FC1A3: push eax
  loc_005FC1A4: mov edx, [eax]
  loc_005FC1A6: call [edx+00000008h]
  loc_005FC1A9: mov eax, var_4
  loc_005FC1AC: mov ecx, var_14
  loc_005FC1AF: pop edi
  loc_005FC1B0: pop esi
  loc_005FC1B1: mov fs:[00000000h], ecx
  loc_005FC1B8: pop ebx
  loc_005FC1B9: mov esp, ebp
  loc_005FC1BB: pop ebp
  loc_005FC1BC: retn 000Ch
End Sub

Private Sub Proc_26_6_5FC360() '5FC360
  loc_005FC360: push ebp
  loc_005FC361: mov ebp, esp
  loc_005FC363: sub esp, 00000008h
  loc_005FC366: push 00403B36h ; __vbaExceptHandler
  loc_005FC36B: mov eax, fs:[00000000h]
  loc_005FC371: push eax
  loc_005FC372: mov fs:[00000000h], esp
  loc_005FC379: sub esp, 00000080h
  loc_005FC37F: push ebx
  loc_005FC380: push esi
  loc_005FC381: push edi
  loc_005FC382: mov var_8, esp
  loc_005FC385: mov var_4, 00403458h
  loc_005FC38C: mov esi, Me
  loc_005FC38F: xor eax, eax
  loc_005FC391: mov var_14, eax
  loc_005FC394: mov var_18, eax
  loc_005FC397: mov var_1C, eax
  loc_005FC39A: mov var_2C, eax
  loc_005FC39D: mov var_3C, eax
  loc_005FC3A0: mov var_4C, eax
  loc_005FC3A3: mov eax, [esi]
  loc_005FC3A5: push esi
  loc_005FC3A6: call [eax+00000710h]
  loc_005FC3AC: sub esp, 00000010h
  loc_005FC3AF: mov edx, [0061A13Ch]
  loc_005FC3B5: mov ebx, esp
  loc_005FC3B7: mov ecx, 0000000Ah
  loc_005FC3BC: mov var_4C, ecx
  loc_005FC3BF: mov eax, 80020004h
  loc_005FC3C4: mov [ebx], ecx
  loc_005FC3C6: mov ecx, var_48
  loc_005FC3C9: mov var_44, eax
  loc_005FC3CC: mov edi, [edx]
  loc_005FC3CE: mov [ebx+00000004h], ecx
  loc_005FC3D1: push 0042A6D4h ; "Delete From TmpTotalWeek1"
  loc_005FC3D6: push edx
  loc_005FC3D7: mov [ebx+00000008h], eax
  loc_005FC3DA: mov eax, var_40
  loc_005FC3DD: mov [ebx+0000000Ch], eax
  loc_005FC3E0: call [edi+0000005Ch]
  loc_005FC3E3: test eax, eax
  loc_005FC3E5: fnclex
  loc_005FC3E7: jge 005FC3FEh
  loc_005FC3E9: mov ecx, [0061A13Ch]
  loc_005FC3EF: push 0000005Ch
  loc_005FC3F1: push 0041E928h
  loc_005FC3F6: push ecx
  loc_005FC3F7: push eax
  loc_005FC3F8: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC3FE: sub esp, 00000010h
  loc_005FC401: mov edx, [0061A13Ch]
  loc_005FC407: mov ebx, esp
  loc_005FC409: mov ecx, 0000000Ah
  loc_005FC40E: mov var_4C, ecx
  loc_005FC411: mov eax, 80020004h
  loc_005FC416: mov [ebx], ecx
  loc_005FC418: mov ecx, var_48
  loc_005FC41B: mov var_44, eax
  loc_005FC41E: mov edi, [edx]
  loc_005FC420: mov [ebx+00000004h], ecx
  loc_005FC423: push 0042A70Ch ; "INSERT INTO TmpTotalWeek1(Agent,Amount1,LAmount1,Amount2,LAmount2,Amount3,LAmount3,Amount4,LAmount4,Amount5,LAmount5,Type1) Select Agent,Sum(Amount1),Sum(LAmount1),Sum(Amount2),Sum(LAmount2),Sum(Amount3),Sum(LAmount3),Sum(Amount4),Sum(LAmount4),Sum(Amount5),Sum(LAmount5),Type1 From TmpTotalWeek Group By Agent,Type1"
  loc_005FC428: push edx
  loc_005FC429: mov [ebx+00000008h], eax
  loc_005FC42C: mov eax, var_40
  loc_005FC42F: mov [ebx+0000000Ch], eax
  loc_005FC432: call [edi+0000005Ch]
  loc_005FC435: test eax, eax
  loc_005FC437: fnclex
  loc_005FC439: jge 005FC450h
  loc_005FC43B: mov ecx, [0061A13Ch]
  loc_005FC441: push 0000005Ch
  loc_005FC443: push 0041E928h
  loc_005FC448: push ecx
  loc_005FC449: push eax
  loc_005FC44A: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC450: sub esp, 00000010h
  loc_005FC453: mov edx, [0061A13Ch]
  loc_005FC459: mov ebx, esp
  loc_005FC45B: mov ecx, 0000000Ah
  loc_005FC460: mov var_4C, ecx
  loc_005FC463: mov eax, 80020004h
  loc_005FC468: mov [ebx], ecx
  loc_005FC46A: mov ecx, var_48
  loc_005FC46D: mov var_44, eax
  loc_005FC470: mov edi, [edx]
  loc_005FC472: mov [ebx+00000004h], ecx
  loc_005FC475: push 0042A98Ch ; "Delete From TmpTotalWeek"
  loc_005FC47A: push edx
  loc_005FC47B: mov [ebx+00000008h], eax
  loc_005FC47E: mov eax, var_40
  loc_005FC481: mov [ebx+0000000Ch], eax
  loc_005FC484: call [edi+0000005Ch]
  loc_005FC487: test eax, eax
  loc_005FC489: fnclex
  loc_005FC48B: jge 005FC4A2h
  loc_005FC48D: mov ecx, [0061A13Ch]
  loc_005FC493: push 0000005Ch
  loc_005FC495: push 0041E928h
  loc_005FC49A: push ecx
  loc_005FC49B: push eax
  loc_005FC49C: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC4A2: mov edx, [esi]
  loc_005FC4A4: push 0000000Bh
  loc_005FC4A6: push esi
  loc_005FC4A7: call [edx+000000A4h]
  loc_005FC4AD: test eax, eax
  loc_005FC4AF: fnclex
  loc_005FC4B1: jge 005FC4C5h
  loc_005FC4B3: push 000000A4h
  loc_005FC4B8: push 00429194h
  loc_005FC4BD: push esi
  loc_005FC4BE: push eax
  loc_005FC4BF: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC4C5: mov eax, [esi]
  loc_005FC4C7: push 00000000h
  loc_005FC4C9: push 00000070h
  loc_005FC4CB: push esi
  loc_005FC4CC: call [eax+00000318h]
  loc_005FC4D2: mov edi, [004010A0h] ; __vbaObjSet
  loc_005FC4D8: lea ecx, var_18
  loc_005FC4DB: push eax
  loc_005FC4DC: push ecx
  loc_005FC4DD: call edi
  loc_005FC4DF: push eax
  loc_005FC4E0: call [00401024h] ; __vbaLateIdCall
  loc_005FC4E6: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005FC4EC: add esp, 0000000Ch
  loc_005FC4EF: lea ecx, var_18
  loc_005FC4F2: call ebx
  loc_005FC4F4: sub esp, 00000010h
  loc_005FC4F7: mov ecx, 0000000Bh
  loc_005FC4FC: mov edx, esp
  loc_005FC4FE: mov var_4C, ecx
  loc_005FC501: or eax, FFFFFFFFh
  loc_005FC504: push 0000007Dh
  loc_005FC506: mov [edx], ecx
  loc_005FC508: mov ecx, var_48
  loc_005FC50B: mov var_44, eax
  loc_005FC50E: push esi
  loc_005FC50F: mov [edx+00000004h], ecx
  loc_005FC512: mov ecx, [esi]
  loc_005FC514: mov [edx+00000008h], eax
  loc_005FC517: mov eax, var_40
  loc_005FC51A: mov [edx+0000000Ch], eax
  loc_005FC51D: call [ecx+00000318h]
  loc_005FC523: lea edx, var_18
  loc_005FC526: push eax
  loc_005FC527: push edx
  loc_005FC528: call edi
  loc_005FC52A: push eax
  loc_005FC52B: call [00401288h] ; __vbaLateIdSt
  loc_005FC531: lea ecx, var_18
  loc_005FC534: call ebx
  loc_005FC536: lea eax, var_4C
  loc_005FC539: lea ecx, var_2C
  loc_005FC53C: push eax
  loc_005FC53D: push ecx
  loc_005FC53E: mov var_44, 0061A150h
  loc_005FC545: mov var_4C, 00004008h
  loc_005FC54C: call [004010D4h] ; rtcTrimVar
  loc_005FC552: lea edx, var_2C
  loc_005FC555: push edx
  loc_005FC556: call [00401028h] ; __vbaStrVarMove
  loc_005FC55C: sub esp, 00000010h
  loc_005FC55F: mov ecx, 00000002h
  loc_005FC564: mov edx, esp
  loc_005FC566: sub esp, 00000010h
  loc_005FC569: mov var_3C, 00000008h
  loc_005FC570: mov var_34, eax
  loc_005FC573: mov [edx], ecx
  loc_005FC575: mov ecx, var_58
  loc_005FC578: mov [edx+00000004h], ecx
  loc_005FC57B: xor ecx, ecx
  loc_005FC57D: mov [edx+00000008h], ecx
  loc_005FC580: mov ecx, var_50
  loc_005FC583: mov [edx+0000000Ch], ecx
  loc_005FC586: mov ecx, var_3C
  loc_005FC589: mov edx, esp
  loc_005FC58B: push 00000001h
  loc_005FC58D: push 00000020h
  loc_005FC58F: push esi
  loc_005FC590: mov [edx], ecx
  loc_005FC592: mov ecx, var_38
  loc_005FC595: mov [edx+00000004h], ecx
  loc_005FC598: mov ecx, [esi]
  loc_005FC59A: mov [edx+00000008h], eax
  loc_005FC59D: mov eax, var_30
  loc_005FC5A0: mov [edx+0000000Ch], eax
  loc_005FC5A3: call [ecx+00000318h]
  loc_005FC5A9: lea edx, var_18
  loc_005FC5AC: push eax
  loc_005FC5AD: push edx
  loc_005FC5AE: call edi
  loc_005FC5B0: push eax
  loc_005FC5B1: call [00401160h] ; __vbaLateIdCallSt
  loc_005FC5B7: add esp, 0000002Ch
  loc_005FC5BA: lea ecx, var_18
  loc_005FC5BD: call ebx
  loc_005FC5BF: lea eax, var_3C
  loc_005FC5C2: lea ecx, var_2C
  loc_005FC5C5: push eax
  loc_005FC5C6: push ecx
  loc_005FC5C7: push 00000002h
  loc_005FC5C9: call [00401038h] ; __vbaFreeVarList
  loc_005FC5CF: mov eax, [0061B394h]
  loc_005FC5D4: add esp, 0000000Ch
  loc_005FC5D7: test eax, eax
  loc_005FC5D9: jnz 005FC5EBh
  loc_005FC5DB: push 0061B394h
  loc_005FC5E0: push 0041E4A0h
  loc_005FC5E5: call [004011DCh] ; __vbaNew2
  loc_005FC5EB: mov eax, [0061B394h]
  loc_005FC5F0: lea ecx, var_18
  loc_005FC5F3: push ecx
  loc_005FC5F4: push eax
  loc_005FC5F5: mov edx, [eax]
  loc_005FC5F7: mov var_80, eax
  loc_005FC5FA: call [edx+00000014h]
  loc_005FC5FD: test eax, eax
  loc_005FC5FF: fnclex
  loc_005FC601: jge 005FC615h
  loc_005FC603: mov edx, var_80
  loc_005FC606: push 00000014h
  loc_005FC608: push 0041E490h
  loc_005FC60D: push edx
  loc_005FC60E: push eax
  loc_005FC60F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC615: mov eax, var_18
  loc_005FC618: lea edx, var_14
  loc_005FC61B: push edx
  loc_005FC61C: push eax
  loc_005FC61D: mov ecx, [eax]
  loc_005FC61F: mov var_88, eax
  loc_005FC625: call [ecx+00000050h]
  loc_005FC628: test eax, eax
  loc_005FC62A: fnclex
  loc_005FC62C: jge 005FC643h
  loc_005FC62E: mov ecx, var_88
  loc_005FC634: push 00000050h
  loc_005FC636: push 0041F3A0h
  loc_005FC63B: push ecx
  loc_005FC63C: push eax
  loc_005FC63D: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC643: mov edx, var_14
  loc_005FC646: push edx
  loc_005FC647: push 0042A9C4h ; "\Reports\TotalWeek.rpt"
  loc_005FC64C: call [00401054h] ; __vbaStrCat
  loc_005FC652: sub esp, 00000010h
  loc_005FC655: mov ecx, 00000008h
  loc_005FC65A: mov edx, esp
  loc_005FC65C: mov var_2C, ecx
  loc_005FC65F: mov var_24, eax
  loc_005FC662: push 00000003h
  loc_005FC664: mov [edx], ecx
  loc_005FC666: mov ecx, var_28
  loc_005FC669: push esi
  loc_005FC66A: mov [edx+00000004h], ecx
  loc_005FC66D: mov ecx, [esi]
  loc_005FC66F: mov [edx+00000008h], eax
  loc_005FC672: mov eax, var_20
  loc_005FC675: mov [edx+0000000Ch], eax
  loc_005FC678: call [ecx+00000318h]
  loc_005FC67E: lea edx, var_1C
  loc_005FC681: push eax
  loc_005FC682: push edx
  loc_005FC683: call edi
  loc_005FC685: push eax
  loc_005FC686: call [00401288h] ; __vbaLateIdSt
  loc_005FC68C: lea ecx, var_14
  loc_005FC68F: call [004012ACh] ; __vbaFreeStr
  loc_005FC695: lea eax, var_1C
  loc_005FC698: lea ecx, var_18
  loc_005FC69B: push eax
  loc_005FC69C: push ecx
  loc_005FC69D: push 00000002h
  loc_005FC69F: call [00401040h] ; __vbaFreeObjList
  loc_005FC6A5: add esp, 0000000Ch
  loc_005FC6A8: lea ecx, var_2C
  loc_005FC6AB: call [00401020h] ; __vbaFreeVar
  loc_005FC6B1: sub esp, 00000010h
  loc_005FC6B4: mov ecx, 00000003h
  loc_005FC6B9: mov edx, esp
  loc_005FC6BB: mov var_4C, ecx
  loc_005FC6BE: mov eax, 00000002h
  loc_005FC6C3: push 00000043h
  loc_005FC6C5: mov [edx], ecx
  loc_005FC6C7: mov ecx, var_48
  loc_005FC6CA: mov var_44, eax
  loc_005FC6CD: push esi
  loc_005FC6CE: mov [edx+00000004h], ecx
  loc_005FC6D1: mov ecx, [esi]
  loc_005FC6D3: mov [edx+00000008h], eax
  loc_005FC6D6: mov eax, var_40
  loc_005FC6D9: mov [edx+0000000Ch], eax
  loc_005FC6DC: call [ecx+00000318h]
  loc_005FC6E2: lea edx, var_18
  loc_005FC6E5: push eax
  loc_005FC6E6: push edx
  loc_005FC6E7: call edi
  loc_005FC6E9: push eax
  loc_005FC6EA: call [00401288h] ; __vbaLateIdSt
  loc_005FC6F0: lea ecx, var_18
  loc_005FC6F3: call ebx
  loc_005FC6F5: sub esp, 00000010h
  loc_005FC6F8: mov ecx, 00000002h
  loc_005FC6FD: mov edx, esp
  loc_005FC6FF: mov var_4C, ecx
  loc_005FC702: mov eax, 00000001h
  loc_005FC707: push 00000011h
  loc_005FC709: mov [edx], ecx
  loc_005FC70B: mov ecx, var_48
  loc_005FC70E: mov var_44, eax
  loc_005FC711: push esi
  loc_005FC712: mov [edx+00000004h], ecx
  loc_005FC715: mov ecx, [esi]
  loc_005FC717: mov [edx+00000008h], eax
  loc_005FC71A: mov eax, var_40
  loc_005FC71D: mov [edx+0000000Ch], eax
  loc_005FC720: call [ecx+00000318h]
  loc_005FC726: lea edx, var_18
  loc_005FC729: push eax
  loc_005FC72A: push edx
  loc_005FC72B: call edi
  loc_005FC72D: push eax
  loc_005FC72E: call [00401288h] ; __vbaLateIdSt
  loc_005FC734: lea ecx, var_18
  loc_005FC737: call ebx
  loc_005FC739: mov eax, [esi]
  loc_005FC73B: push 00000001h
  loc_005FC73D: push esi
  loc_005FC73E: call [eax+000000A4h]
  loc_005FC744: test eax, eax
  loc_005FC746: fnclex
  loc_005FC748: jge 005FC75Ch
  loc_005FC74A: push 000000A4h
  loc_005FC74F: push 00429194h
  loc_005FC754: push esi
  loc_005FC755: push eax
  loc_005FC756: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC75C: push 005FC791h
  loc_005FC761: jmp 005FC790h
  loc_005FC763: lea ecx, var_14
  loc_005FC766: call [004012ACh] ; __vbaFreeStr
  loc_005FC76C: lea ecx, var_1C
  loc_005FC76F: lea edx, var_18
  loc_005FC772: push ecx
  loc_005FC773: push edx
  loc_005FC774: push 00000002h
  loc_005FC776: call [00401040h] ; __vbaFreeObjList
  loc_005FC77C: lea eax, var_3C
  loc_005FC77F: lea ecx, var_2C
  loc_005FC782: push eax
  loc_005FC783: push ecx
  loc_005FC784: push 00000002h
  loc_005FC786: call [00401038h] ; __vbaFreeVarList
  loc_005FC78C: add esp, 00000018h
  loc_005FC78F: ret
  loc_005FC790: ret
  loc_005FC791: mov ecx, var_10
  loc_005FC794: pop edi
  loc_005FC795: pop esi
  loc_005FC796: xor eax, eax
  loc_005FC798: mov fs:[00000000h], ecx
  loc_005FC79F: pop ebx
  loc_005FC7A0: mov esp, ebp
  loc_005FC7A2: pop ebp
  loc_005FC7A3: retn 0004h
End Sub

Private Sub Proc_26_7_5FC7B0() '5FC7B0
  loc_005FC7B0: push ebp
  loc_005FC7B1: mov ebp, esp
  loc_005FC7B3: sub esp, 00000008h
  loc_005FC7B6: push 00403B36h ; __vbaExceptHandler
  loc_005FC7BB: mov eax, fs:[00000000h]
  loc_005FC7C1: push eax
  loc_005FC7C2: mov fs:[00000000h], esp
  loc_005FC7C9: sub esp, 00000080h
  loc_005FC7CF: push ebx
  loc_005FC7D0: push esi
  loc_005FC7D1: push edi
  loc_005FC7D2: mov var_8, esp
  loc_005FC7D5: mov var_4, 00403468h
  loc_005FC7DC: mov esi, Me
  loc_005FC7DF: xor eax, eax
  loc_005FC7E1: mov var_14, eax
  loc_005FC7E4: mov var_18, eax
  loc_005FC7E7: mov var_1C, eax
  loc_005FC7EA: mov var_2C, eax
  loc_005FC7ED: mov var_3C, eax
  loc_005FC7F0: mov var_4C, eax
  loc_005FC7F3: mov eax, [esi]
  loc_005FC7F5: push esi
  loc_005FC7F6: call [eax+00000714h]
  loc_005FC7FC: sub esp, 00000010h
  loc_005FC7FF: mov edx, [0061A13Ch]
  loc_005FC805: mov ebx, esp
  loc_005FC807: mov ecx, 0000000Ah
  loc_005FC80C: mov var_4C, ecx
  loc_005FC80F: mov eax, 80020004h
  loc_005FC814: mov [ebx], ecx
  loc_005FC816: mov ecx, var_48
  loc_005FC819: mov var_44, eax
  loc_005FC81C: mov edi, [edx]
  loc_005FC81E: mov [ebx+00000004h], ecx
  loc_005FC821: push 0042A6D4h ; "Delete From TmpTotalWeek1"
  loc_005FC826: push edx
  loc_005FC827: mov [ebx+00000008h], eax
  loc_005FC82A: mov eax, var_40
  loc_005FC82D: mov [ebx+0000000Ch], eax
  loc_005FC830: call [edi+0000005Ch]
  loc_005FC833: test eax, eax
  loc_005FC835: fnclex
  loc_005FC837: jge 005FC84Eh
  loc_005FC839: mov ecx, [0061A13Ch]
  loc_005FC83F: push 0000005Ch
  loc_005FC841: push 0041E928h
  loc_005FC846: push ecx
  loc_005FC847: push eax
  loc_005FC848: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC84E: sub esp, 00000010h
  loc_005FC851: mov edx, [0061A13Ch]
  loc_005FC857: mov ebx, esp
  loc_005FC859: mov ecx, 0000000Ah
  loc_005FC85E: mov var_4C, ecx
  loc_005FC861: mov eax, 80020004h
  loc_005FC866: mov [ebx], ecx
  loc_005FC868: mov ecx, var_48
  loc_005FC86B: mov var_44, eax
  loc_005FC86E: mov edi, [edx]
  loc_005FC870: mov [ebx+00000004h], ecx
  loc_005FC873: push 0042A70Ch ; "INSERT INTO TmpTotalWeek1(Agent,Amount1,LAmount1,Amount2,LAmount2,Amount3,LAmount3,Amount4,LAmount4,Amount5,LAmount5,Type1) Select Agent,Sum(Amount1),Sum(LAmount1),Sum(Amount2),Sum(LAmount2),Sum(Amount3),Sum(LAmount3),Sum(Amount4),Sum(LAmount4),Sum(Amount5),Sum(LAmount5),Type1 From TmpTotalWeek Group By Agent,Type1"
  loc_005FC878: push edx
  loc_005FC879: mov [ebx+00000008h], eax
  loc_005FC87C: mov eax, var_40
  loc_005FC87F: mov [ebx+0000000Ch], eax
  loc_005FC882: call [edi+0000005Ch]
  loc_005FC885: test eax, eax
  loc_005FC887: fnclex
  loc_005FC889: jge 005FC8A0h
  loc_005FC88B: mov ecx, [0061A13Ch]
  loc_005FC891: push 0000005Ch
  loc_005FC893: push 0041E928h
  loc_005FC898: push ecx
  loc_005FC899: push eax
  loc_005FC89A: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC8A0: sub esp, 00000010h
  loc_005FC8A3: mov edx, [0061A13Ch]
  loc_005FC8A9: mov ebx, esp
  loc_005FC8AB: mov ecx, 0000000Ah
  loc_005FC8B0: mov var_4C, ecx
  loc_005FC8B3: mov eax, 80020004h
  loc_005FC8B8: mov [ebx], ecx
  loc_005FC8BA: mov ecx, var_48
  loc_005FC8BD: mov var_44, eax
  loc_005FC8C0: mov edi, [edx]
  loc_005FC8C2: mov [ebx+00000004h], ecx
  loc_005FC8C5: push 0042A98Ch ; "Delete From TmpTotalWeek"
  loc_005FC8CA: push edx
  loc_005FC8CB: mov [ebx+00000008h], eax
  loc_005FC8CE: mov eax, var_40
  loc_005FC8D1: mov [ebx+0000000Ch], eax
  loc_005FC8D4: call [edi+0000005Ch]
  loc_005FC8D7: test eax, eax
  loc_005FC8D9: fnclex
  loc_005FC8DB: jge 005FC8F2h
  loc_005FC8DD: mov ecx, [0061A13Ch]
  loc_005FC8E3: push 0000005Ch
  loc_005FC8E5: push 0041E928h
  loc_005FC8EA: push ecx
  loc_005FC8EB: push eax
  loc_005FC8EC: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC8F2: mov edx, [esi]
  loc_005FC8F4: push 0000000Bh
  loc_005FC8F6: push esi
  loc_005FC8F7: call [edx+000000A4h]
  loc_005FC8FD: test eax, eax
  loc_005FC8FF: fnclex
  loc_005FC901: jge 005FC915h
  loc_005FC903: push 000000A4h
  loc_005FC908: push 00429194h
  loc_005FC90D: push esi
  loc_005FC90E: push eax
  loc_005FC90F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FC915: mov eax, [esi]
  loc_005FC917: push 00000000h
  loc_005FC919: push 00000070h
  loc_005FC91B: push esi
  loc_005FC91C: call [eax+00000318h]
  loc_005FC922: mov edi, [004010A0h] ; __vbaObjSet
  loc_005FC928: lea ecx, var_18
  loc_005FC92B: push eax
  loc_005FC92C: push ecx
  loc_005FC92D: call edi
  loc_005FC92F: push eax
  loc_005FC930: call [00401024h] ; __vbaLateIdCall
  loc_005FC936: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_005FC93C: add esp, 0000000Ch
  loc_005FC93F: lea ecx, var_18
  loc_005FC942: call ebx
  loc_005FC944: sub esp, 00000010h
  loc_005FC947: mov ecx, 0000000Bh
  loc_005FC94C: mov edx, esp
  loc_005FC94E: mov var_4C, ecx
  loc_005FC951: or eax, FFFFFFFFh
  loc_005FC954: push 0000007Dh
  loc_005FC956: mov [edx], ecx
  loc_005FC958: mov ecx, var_48
  loc_005FC95B: mov var_44, eax
  loc_005FC95E: push esi
  loc_005FC95F: mov [edx+00000004h], ecx
  loc_005FC962: mov ecx, [esi]
  loc_005FC964: mov [edx+00000008h], eax
  loc_005FC967: mov eax, var_40
  loc_005FC96A: mov [edx+0000000Ch], eax
  loc_005FC96D: call [ecx+00000318h]
  loc_005FC973: lea edx, var_18
  loc_005FC976: push eax
  loc_005FC977: push edx
  loc_005FC978: call edi
  loc_005FC97A: push eax
  loc_005FC97B: call [00401288h] ; __vbaLateIdSt
  loc_005FC981: lea ecx, var_18
  loc_005FC984: call ebx
  loc_005FC986: lea eax, var_4C
  loc_005FC989: lea ecx, var_2C
  loc_005FC98C: push eax
  loc_005FC98D: push ecx
  loc_005FC98E: mov var_44, 0061A150h
  loc_005FC995: mov var_4C, 00004008h
  loc_005FC99C: call [004010D4h] ; rtcTrimVar
  loc_005FC9A2: lea edx, var_2C
  loc_005FC9A5: push edx
  loc_005FC9A6: call [00401028h] ; __vbaStrVarMove
  loc_005FC9AC: sub esp, 00000010h
  loc_005FC9AF: mov ecx, 00000002h
  loc_005FC9B4: mov edx, esp
  loc_005FC9B6: sub esp, 00000010h
  loc_005FC9B9: mov var_3C, 00000008h
  loc_005FC9C0: mov var_34, eax
  loc_005FC9C3: mov [edx], ecx
  loc_005FC9C5: mov ecx, var_58
  loc_005FC9C8: mov [edx+00000004h], ecx
  loc_005FC9CB: xor ecx, ecx
  loc_005FC9CD: mov [edx+00000008h], ecx
  loc_005FC9D0: mov ecx, var_50
  loc_005FC9D3: mov [edx+0000000Ch], ecx
  loc_005FC9D6: mov ecx, var_3C
  loc_005FC9D9: mov edx, esp
  loc_005FC9DB: push 00000001h
  loc_005FC9DD: push 00000020h
  loc_005FC9DF: push esi
  loc_005FC9E0: mov [edx], ecx
  loc_005FC9E2: mov ecx, var_38
  loc_005FC9E5: mov [edx+00000004h], ecx
  loc_005FC9E8: mov ecx, [esi]
  loc_005FC9EA: mov [edx+00000008h], eax
  loc_005FC9ED: mov eax, var_30
  loc_005FC9F0: mov [edx+0000000Ch], eax
  loc_005FC9F3: call [ecx+00000318h]
  loc_005FC9F9: lea edx, var_18
  loc_005FC9FC: push eax
  loc_005FC9FD: push edx
  loc_005FC9FE: call edi
  loc_005FCA00: push eax
  loc_005FCA01: call [00401160h] ; __vbaLateIdCallSt
  loc_005FCA07: add esp, 0000002Ch
  loc_005FCA0A: lea ecx, var_18
  loc_005FCA0D: call ebx
  loc_005FCA0F: lea eax, var_3C
  loc_005FCA12: lea ecx, var_2C
  loc_005FCA15: push eax
  loc_005FCA16: push ecx
  loc_005FCA17: push 00000002h
  loc_005FCA19: call [00401038h] ; __vbaFreeVarList
  loc_005FCA1F: mov eax, [0061B394h]
  loc_005FCA24: add esp, 0000000Ch
  loc_005FCA27: test eax, eax
  loc_005FCA29: jnz 005FCA3Bh
  loc_005FCA2B: push 0061B394h
  loc_005FCA30: push 0041E4A0h
  loc_005FCA35: call [004011DCh] ; __vbaNew2
  loc_005FCA3B: mov eax, [0061B394h]
  loc_005FCA40: lea ecx, var_18
  loc_005FCA43: push ecx
  loc_005FCA44: push eax
  loc_005FCA45: mov edx, [eax]
  loc_005FCA47: mov var_80, eax
  loc_005FCA4A: call [edx+00000014h]
  loc_005FCA4D: test eax, eax
  loc_005FCA4F: fnclex
  loc_005FCA51: jge 005FCA65h
  loc_005FCA53: mov edx, var_80
  loc_005FCA56: push 00000014h
  loc_005FCA58: push 0041E490h
  loc_005FCA5D: push edx
  loc_005FCA5E: push eax
  loc_005FCA5F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FCA65: mov eax, var_18
  loc_005FCA68: lea edx, var_14
  loc_005FCA6B: push edx
  loc_005FCA6C: push eax
  loc_005FCA6D: mov ecx, [eax]
  loc_005FCA6F: mov var_88, eax
  loc_005FCA75: call [ecx+00000050h]
  loc_005FCA78: test eax, eax
  loc_005FCA7A: fnclex
  loc_005FCA7C: jge 005FCA93h
  loc_005FCA7E: mov ecx, var_88
  loc_005FCA84: push 00000050h
  loc_005FCA86: push 0041F3A0h
  loc_005FCA8B: push ecx
  loc_005FCA8C: push eax
  loc_005FCA8D: call [00401074h] ; __vbaHresultCheckObj
  loc_005FCA93: mov edx, var_14
  loc_005FCA96: push edx
  loc_005FCA97: push 0042A9C4h ; "\Reports\TotalWeek.rpt"
  loc_005FCA9C: call [00401054h] ; __vbaStrCat
  loc_005FCAA2: sub esp, 00000010h
  loc_005FCAA5: mov ecx, 00000008h
  loc_005FCAAA: mov edx, esp
  loc_005FCAAC: mov var_2C, ecx
  loc_005FCAAF: mov var_24, eax
  loc_005FCAB2: push 00000003h
  loc_005FCAB4: mov [edx], ecx
  loc_005FCAB6: mov ecx, var_28
  loc_005FCAB9: push esi
  loc_005FCABA: mov [edx+00000004h], ecx
  loc_005FCABD: mov ecx, [esi]
  loc_005FCABF: mov [edx+00000008h], eax
  loc_005FCAC2: mov eax, var_20
  loc_005FCAC5: mov [edx+0000000Ch], eax
  loc_005FCAC8: call [ecx+00000318h]
  loc_005FCACE: lea edx, var_1C
  loc_005FCAD1: push eax
  loc_005FCAD2: push edx
  loc_005FCAD3: call edi
  loc_005FCAD5: push eax
  loc_005FCAD6: call [00401288h] ; __vbaLateIdSt
  loc_005FCADC: lea ecx, var_14
  loc_005FCADF: call [004012ACh] ; __vbaFreeStr
  loc_005FCAE5: lea eax, var_1C
  loc_005FCAE8: lea ecx, var_18
  loc_005FCAEB: push eax
  loc_005FCAEC: push ecx
  loc_005FCAED: push 00000002h
  loc_005FCAEF: call [00401040h] ; __vbaFreeObjList
  loc_005FCAF5: add esp, 0000000Ch
  loc_005FCAF8: lea ecx, var_2C
  loc_005FCAFB: call [00401020h] ; __vbaFreeVar
  loc_005FCB01: sub esp, 00000010h
  loc_005FCB04: mov ecx, 00000003h
  loc_005FCB09: mov edx, esp
  loc_005FCB0B: mov var_4C, ecx
  loc_005FCB0E: mov eax, 00000002h
  loc_005FCB13: push 00000043h
  loc_005FCB15: mov [edx], ecx
  loc_005FCB17: mov ecx, var_48
  loc_005FCB1A: mov var_44, eax
  loc_005FCB1D: push esi
  loc_005FCB1E: mov [edx+00000004h], ecx
  loc_005FCB21: mov ecx, [esi]
  loc_005FCB23: mov [edx+00000008h], eax
  loc_005FCB26: mov eax, var_40
  loc_005FCB29: mov [edx+0000000Ch], eax
  loc_005FCB2C: call [ecx+00000318h]
  loc_005FCB32: lea edx, var_18
  loc_005FCB35: push eax
  loc_005FCB36: push edx
  loc_005FCB37: call edi
  loc_005FCB39: push eax
  loc_005FCB3A: call [00401288h] ; __vbaLateIdSt
  loc_005FCB40: lea ecx, var_18
  loc_005FCB43: call ebx
  loc_005FCB45: sub esp, 00000010h
  loc_005FCB48: mov ecx, 00000002h
  loc_005FCB4D: mov edx, esp
  loc_005FCB4F: mov var_4C, ecx
  loc_005FCB52: mov eax, 00000001h
  loc_005FCB57: push 00000011h
  loc_005FCB59: mov [edx], ecx
  loc_005FCB5B: mov ecx, var_48
  loc_005FCB5E: mov var_44, eax
  loc_005FCB61: push esi
  loc_005FCB62: mov [edx+00000004h], ecx
  loc_005FCB65: mov ecx, [esi]
  loc_005FCB67: mov [edx+00000008h], eax
  loc_005FCB6A: mov eax, var_40
  loc_005FCB6D: mov [edx+0000000Ch], eax
  loc_005FCB70: call [ecx+00000318h]
  loc_005FCB76: lea edx, var_18
  loc_005FCB79: push eax
  loc_005FCB7A: push edx
  loc_005FCB7B: call edi
  loc_005FCB7D: push eax
  loc_005FCB7E: call [00401288h] ; __vbaLateIdSt
  loc_005FCB84: lea ecx, var_18
  loc_005FCB87: call ebx
  loc_005FCB89: mov eax, [esi]
  loc_005FCB8B: push 00000001h
  loc_005FCB8D: push esi
  loc_005FCB8E: call [eax+000000A4h]
  loc_005FCB94: test eax, eax
  loc_005FCB96: fnclex
  loc_005FCB98: jge 005FCBACh
  loc_005FCB9A: push 000000A4h
  loc_005FCB9F: push 00429194h
  loc_005FCBA4: push esi
  loc_005FCBA5: push eax
  loc_005FCBA6: call [00401074h] ; __vbaHresultCheckObj
  loc_005FCBAC: push 005FCBE1h
  loc_005FCBB1: jmp 005FCBE0h
  loc_005FCBB3: lea ecx, var_14
  loc_005FCBB6: call [004012ACh] ; __vbaFreeStr
  loc_005FCBBC: lea ecx, var_1C
  loc_005FCBBF: lea edx, var_18
  loc_005FCBC2: push ecx
  loc_005FCBC3: push edx
  loc_005FCBC4: push 00000002h
  loc_005FCBC6: call [00401040h] ; __vbaFreeObjList
  loc_005FCBCC: lea eax, var_3C
  loc_005FCBCF: lea ecx, var_2C
  loc_005FCBD2: push eax
  loc_005FCBD3: push ecx
  loc_005FCBD4: push 00000002h
  loc_005FCBD6: call [00401038h] ; __vbaFreeVarList
  loc_005FCBDC: add esp, 00000018h
  loc_005FCBDF: ret
  loc_005FCBE0: ret
  loc_005FCBE1: mov ecx, var_10
  loc_005FCBE4: pop edi
  loc_005FCBE5: pop esi
  loc_005FCBE6: xor eax, eax
  loc_005FCBE8: mov fs:[00000000h], ecx
  loc_005FCBEF: pop ebx
  loc_005FCBF0: mov esp, ebp
  loc_005FCBF2: pop ebp
  loc_005FCBF3: retn 0004h
End Sub

Private Sub Proc_26_8_5FCC00() '5FCC00
  loc_005FCC00: push ebp
  loc_005FCC01: mov ebp, esp
  loc_005FCC03: sub esp, 00000008h
  loc_005FCC06: push 00403B36h ; __vbaExceptHandler
  loc_005FCC0B: mov eax, fs:[00000000h]
  loc_005FCC11: push eax
  loc_005FCC12: mov fs:[00000000h], esp
  loc_005FCC19: sub esp, 000000CCh
  loc_005FCC1F: push ebx
  loc_005FCC20: push esi
  loc_005FCC21: push edi
  loc_005FCC22: mov var_8, esp
  loc_005FCC25: mov var_4, 00403478h
  loc_005FCC2C: sub esp, 00000010h
  loc_005FCC2F: mov edx, [0061A13Ch]
  loc_005FCC35: mov ebx, esp
  loc_005FCC37: mov ecx, 0000000Ah
  loc_005FCC3C: mov var_7C, ecx
  loc_005FCC3F: xor edi, edi
  loc_005FCC41: mov [ebx], ecx
  loc_005FCC43: mov ecx, var_78
  loc_005FCC46: mov eax, 80020004h
  loc_005FCC4B: mov var_20, edi
  loc_005FCC4E: mov [ebx+00000004h], ecx
  loc_005FCC51: mov var_1C, edi
  loc_005FCC54: mov var_24, edi
  loc_005FCC57: mov var_28, edi
  loc_005FCC5A: mov var_2C, edi
  loc_005FCC5D: mov var_3C, edi
  loc_005FCC60: mov var_4C, edi
  loc_005FCC63: mov var_5C, edi
  loc_005FCC66: mov var_6C, edi
  loc_005FCC69: mov var_8C, edi
  loc_005FCC6F: mov var_74, eax
  loc_005FCC72: mov esi, [edx]
  loc_005FCC74: mov [ebx+00000008h], eax
  loc_005FCC77: mov eax, var_70
  loc_005FCC7A: push 0042A9F8h ; "Delete * From TmpTotalWeek"
  loc_005FCC7F: push edx
  loc_005FCC80: mov var_9C, edi
  loc_005FCC86: mov [ebx+0000000Ch], eax
  loc_005FCC89: call [esi+0000005Ch]
  loc_005FCC8C: cmp eax, edi
  loc_005FCC8E: fnclex
  loc_005FCC90: jge 005FCCA7h
  loc_005FCC92: mov ecx, [0061A13Ch]
  loc_005FCC98: push 0000005Ch
  loc_005FCC9A: push 0041E928h
  loc_005FCC9F: push ecx
  loc_005FCCA0: push eax
  loc_005FCCA1: call [00401074h] ; __vbaHresultCheckObj
  loc_005FCCA7: mov ebx, Me
  loc_005FCCAA: push edi
  loc_005FCCAB: push 00000014h
  loc_005FCCAD: push ebx
  loc_005FCCAE: mov edx, [ebx]
  loc_005FCCB0: call [edx+00000314h]
  loc_005FCCB6: mov esi, [004010A0h] ; __vbaObjSet
  loc_005FCCBC: push eax
  loc_005FCCBD: lea eax, var_28
  loc_005FCCC0: push eax
  loc_005FCCC1: call __vbaObjSet
  loc_005FCCC3: lea ecx, var_3C
  loc_005FCCC6: push eax
  loc_005FCCC7: push ecx
  loc_005FCCC8: call [00401140h] ; __vbaLateIdCallLd
  loc_005FCCCE: add esp, 00000010h
  loc_005FCCD1: push eax
  loc_005FCCD2: call [004011B8h] ; __vbaDateVar
  loc_005FCCD8: fstp real8 ptr var_20
  loc_005FCCDB: lea ecx, var_28
  loc_005FCCDE: call [004012B0h] ; __vbaFreeObj
  loc_005FCCE4: lea ecx, var_3C
  loc_005FCCE7: call [00401020h] ; __vbaFreeVar
  loc_005FCCED: mov edx, [ebx]
  loc_005FCCEF: push edi
  loc_005FCCF0: push 00000014h
  loc_005FCCF2: push ebx
  loc_005FCCF3: call [edx+00000314h]
  loc_005FCCF9: push eax
  loc_005FCCFA: lea eax, var_28
  loc_005FCCFD: push eax
  loc_005FCCFE: call __vbaObjSet
  loc_005FCD00: lea ecx, var_3C
  loc_005FCD03: push eax
  loc_005FCD04: push ecx
  loc_005FCD05: call [00401140h] ; __vbaLateIdCallLd
  loc_005FCD0B: mov edx, [ebx]
  loc_005FCD0D: add esp, 00000010h
  loc_005FCD10: push ebx
  loc_005FCD11: call [edx+0000031Ch]
  loc_005FCD17: push eax
  loc_005FCD18: lea eax, var_2C
  loc_005FCD1B: push eax
  loc_005FCD1C: call __vbaObjSet
  loc_005FCD1E: mov eax, var_2C
  loc_005FCD21: push 00000001h
  loc_005FCD23: lea ecx, var_4C
  loc_005FCD26: push 00000001h
  loc_005FCD28: lea edx, var_3C
  loc_005FCD2B: mov var_44, eax
  loc_005FCD2E: push ecx
  loc_005FCD2F: push edx
  loc_005FCD30: lea eax, var_5C
  loc_005FCD33: push 0041FF78h ; "D"
  loc_005FCD38: push eax
  loc_005FCD39: mov var_2C, edi
  loc_005FCD3C: mov var_4C, 00000009h
  loc_005FCD43: call [00401070h] ; rtcDateDiff
  loc_005FCD49: lea ecx, var_5C
  loc_005FCD4C: push ecx
  loc_005FCD4D: call [00401294h] ; __vbaUI1Var
  loc_005FCD53: xor ecx, ecx
  loc_005FCD55: mov var_B0, al
  loc_005FCD5B: call [00401154h] ; __vbaUI1I2
  loc_005FCD61: mov var_18, al
  loc_005FCD64: lea edx, var_2C
  loc_005FCD67: lea eax, var_28
  loc_005FCD6A: push edx
  loc_005FCD6B: push eax
  loc_005FCD6C: push 00000002h
  loc_005FCD6E: call [00401040h] ; __vbaFreeObjList
  loc_005FCD74: lea ecx, var_5C
  loc_005FCD77: lea edx, var_4C
  loc_005FCD7A: push ecx
  loc_005FCD7B: lea eax, var_3C
  loc_005FCD7E: push edx
  loc_005FCD7F: push eax
  loc_005FCD80: push 00000003h
  loc_005FCD82: call [00401038h] ; __vbaFreeVarList
  loc_005FCD88: add esp, 0000001Ch
  loc_005FCD8B: mov cl, var_B0
  loc_005FCD91: mov al, var_18
  loc_005FCD94: cmp al, cl
  loc_005FCD96: ja 005FCE10h
  loc_005FCD98: mov edi, var_18
  loc_005FCD9B: and edi, 000000FFh
  loc_005FCDA1: cmp edi, 0000000Bh
  loc_005FCDA4: jb 005FCDACh
  loc_005FCDA6: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FCDAC: mov edx, [ebx+00000044h]
  loc_005FCDAF: mov eax, var_20
  loc_005FCDB2: mov [edx+edi*8], eax
  loc_005FCDB5: mov ecx, var_1C
  loc_005FCDB8: lea eax, var_7C
  loc_005FCDBB: push eax
  loc_005FCDBC: mov [edx+edi*8+00000004h], ecx
  loc_005FCDC0: push 3FF00000h
  loc_005FCDC5: push 00000000h
  loc_005FCDC7: lea ecx, var_3C
  loc_005FCDCA: lea edx, var_20
  loc_005FCDCD: push 00426734h ; "d"
  loc_005FCDD2: push ecx
  loc_005FCDD3: mov var_74, edx
  loc_005FCDD6: mov var_7C, 00004007h
  loc_005FCDDD: call [00401064h] ; rtcDateAdd
  loc_005FCDE3: lea edx, var_3C
  loc_005FCDE6: push edx
  loc_005FCDE7: call [004011B8h] ; __vbaDateVar
  loc_005FCDED: fstp real8 ptr var_20
  loc_005FCDF0: lea ecx, var_3C
  loc_005FCDF3: call [00401020h] ; __vbaFreeVar
  loc_005FCDF9: mov cl, var_18
  loc_005FCDFC: mov al, 01h
  loc_005FCDFE: add al, cl
  loc_005FCE00: jb 005FE0B8h
  loc_005FCE06: mov var_18, al
  loc_005FCE09: xor edi, edi
  loc_005FCE0B: jmp 005FCD8Bh
  loc_005FCE10: mov eax, [ebx]
  loc_005FCE12: push ebx
  loc_005FCE13: call [eax+000002FCh]
  loc_005FCE19: lea ecx, var_28
  loc_005FCE1C: push eax
  loc_005FCE1D: push ecx
  loc_005FCE1E: call __vbaObjSet
  loc_005FCE20: mov edx, [eax]
  loc_005FCE22: lea ecx, var_24
  loc_005FCE25: push ecx
  loc_005FCE26: push eax
  loc_005FCE27: mov var_A0, eax
  loc_005FCE2D: call [edx+000000A8h]
  loc_005FCE33: cmp eax, edi
  loc_005FCE35: fnclex
  loc_005FCE37: jge 005FCE51h
  loc_005FCE39: mov edx, var_A0
  loc_005FCE3F: push 000000A8h
  loc_005FCE44: push 0041F844h
  loc_005FCE49: push edx
  loc_005FCE4A: push eax
  loc_005FCE4B: call [00401074h] ; __vbaHresultCheckObj
  loc_005FCE51: mov eax, var_24
  loc_005FCE54: push eax
  loc_005FCE55: push 0042BBE4h ; "AM"
  loc_005FCE5A: call [0040110Ch] ; __vbaStrCmp
  loc_005FCE60: neg eax
  loc_005FCE62: sbb eax, eax
  loc_005FCE64: lea ecx, var_24
  loc_005FCE67: inc eax
  loc_005FCE68: neg eax
  loc_005FCE6A: mov var_A8, eax
  loc_005FCE70: call [004012ACh] ; __vbaFreeStr
  loc_005FCE76: lea ecx, var_28
  loc_005FCE79: call [004012B0h] ; __vbaFreeObj
  loc_005FCE7F: cmp var_A8, di
  loc_005FCE86: jz 005FD71Ch
  loc_005FCE8C: mov ecx, [ebx]
  loc_005FCE8E: push edi
  loc_005FCE8F: push 00000014h
  loc_005FCE91: push ebx
  loc_005FCE92: call [ecx+00000314h]
  loc_005FCE98: lea edx, var_28
  loc_005FCE9B: push eax
  loc_005FCE9C: push edx
  loc_005FCE9D: call __vbaObjSet
  loc_005FCE9F: push eax
  loc_005FCEA0: lea eax, var_3C
  loc_005FCEA3: push eax
  loc_005FCEA4: call [00401140h] ; __vbaLateIdCallLd
  loc_005FCEAA: mov ecx, [ebx]
  loc_005FCEAC: add esp, 00000010h
  loc_005FCEAF: push ebx
  loc_005FCEB0: call [ecx+0000031Ch]
  loc_005FCEB6: lea edx, var_2C
  loc_005FCEB9: push eax
  loc_005FCEBA: push edx
  loc_005FCEBB: call __vbaObjSet
  loc_005FCEBD: mov eax, var_2C
  loc_005FCEC0: push 00000001h
  loc_005FCEC2: mov var_44, eax
  loc_005FCEC5: lea eax, var_4C
  loc_005FCEC8: push 00000001h
  loc_005FCECA: lea ecx, var_3C
  loc_005FCECD: push eax
  loc_005FCECE: push ecx
  loc_005FCECF: lea edx, var_5C
  loc_005FCED2: push 0041FF78h ; "D"
  loc_005FCED7: push edx
  loc_005FCED8: mov var_2C, edi
  loc_005FCEDB: mov var_4C, 00000009h
  loc_005FCEE2: call [00401070h] ; rtcDateDiff
  loc_005FCEE8: lea eax, var_5C
  loc_005FCEEB: push eax
  loc_005FCEEC: call [00401294h] ; __vbaUI1Var
  loc_005FCEF2: xor ecx, ecx
  loc_005FCEF4: mov var_B8, al
  loc_005FCEFA: call [00401154h] ; __vbaUI1I2
  loc_005FCF00: lea ecx, var_2C
  loc_005FCF03: lea edx, var_28
  loc_005FCF06: push ecx
  loc_005FCF07: push edx
  loc_005FCF08: push 00000002h
  loc_005FCF0A: mov var_18, al
  loc_005FCF0D: call [00401040h] ; __vbaFreeObjList
  loc_005FCF13: lea eax, var_5C
  loc_005FCF16: lea ecx, var_4C
  loc_005FCF19: push eax
  loc_005FCF1A: lea edx, var_3C
  loc_005FCF1D: push ecx
  loc_005FCF1E: push edx
  loc_005FCF1F: push 00000003h
  loc_005FCF21: call [00401038h] ; __vbaFreeVarList
  loc_005FCF27: mov esi, [004011B4h] ; __vbaVarCat
  loc_005FCF2D: add esp, 0000001Ch
  loc_005FCF30: mov edi, 00000008h
  loc_005FCF35: mov al, var_18
  loc_005FCF38: mov cl, var_B8
  loc_005FCF3E: cmp al, cl
  loc_005FCF40: ja 005FD727h
  loc_005FCF46: movzx ax, al
  loc_005FCF4A: add ax, 0001h
  loc_005FCF4E: jo 005FE0B8h
  loc_005FCF54: movsx eax, ax
  loc_005FCF57: dec eax
  loc_005FCF58: cmp eax, 00000004h
  loc_005FCF5B: ja 005FD707h
  loc_005FCF61: jmp [eax*4+005FE090h]
  loc_005FCF68: mov eax, var_18
  loc_005FCF6B: and eax, 000000FFh
  loc_005FCF70: cmp eax, 0000000Bh
  loc_005FCF73: mov var_DC, eax
  loc_005FCF79: jb 005FCF81h
  loc_005FCF7B: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FCF81: mov ecx, [ebx+00000044h]
  loc_005FCF84: mov eax, var_DC
  loc_005FCF8A: mov edx, [ecx+eax*8+00000004h]
  loc_005FCF8E: push edx
  loc_005FCF8F: mov eax, [ecx+eax*8]
  loc_005FCF92: push eax
  loc_005FCF93: call [00401068h] ; __vbaStrDate
  loc_005FCF99: lea ecx, var_3C
  loc_005FCF9C: lea edx, var_4C
  loc_005FCF9F: push ecx
  loc_005FCFA0: push edx
  loc_005FCFA1: mov var_34, eax
  loc_005FCFA4: mov var_3C, edi
  loc_005FCFA7: call [004010D4h] ; rtcTrimVar
  loc_005FCFAD: mov edx, [0061A13Ch]
  loc_005FCFB3: mov var_74, 004320A0h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FCFBA: mov var_7C, edi
  loc_005FCFBD: mov var_84, 004321A8h ; "# and Type1='S' and AMPM='AM'"
  loc_005FCFC7: mov var_8C, edi
  loc_005FCFCD: mov ebx, [edx]
  loc_005FCFCF: sub esp, 00000010h
  loc_005FCFD2: mov ecx, 0000000Ah
  loc_005FCFD7: mov edx, esp
  loc_005FCFD9: mov eax, 80020004h
  loc_005FCFDE: mov [edx], ecx
  loc_005FCFE0: mov ecx, var_98
  loc_005FCFE6: mov [edx+00000004h], ecx
  loc_005FCFE9: lea ecx, var_7C
  loc_005FCFEC: push ecx
  loc_005FCFED: mov [edx+00000008h], eax
  loc_005FCFF0: mov eax, var_90
  loc_005FCFF6: mov [edx+0000000Ch], eax
  loc_005FCFF9: lea edx, var_4C
  loc_005FCFFC: lea eax, var_5C
  loc_005FCFFF: push edx
  loc_005FD000: push eax
  loc_005FD001: call __vbaVarCat
  loc_005FD003: lea ecx, var_8C
  loc_005FD009: push eax
  loc_005FD00A: lea edx, var_6C
  loc_005FD00D: push ecx
  loc_005FD00E: push edx
  loc_005FD00F: call __vbaVarCat
  loc_005FD011: push eax
  loc_005FD012: lea eax, var_24
  loc_005FD015: push eax
  loc_005FD016: call [004011B0h] ; __vbaStrVarVal
  loc_005FD01C: mov ecx, [0061A13Ch]
  loc_005FD022: push eax
  loc_005FD023: push ecx
  loc_005FD024: call [ebx+0000005Ch]
  loc_005FD027: test eax, eax
  loc_005FD029: fnclex
  loc_005FD02B: jge 005FD042h
  loc_005FD02D: mov edx, [0061A13Ch]
  loc_005FD033: push 0000005Ch
  loc_005FD035: push 0041E928h
  loc_005FD03A: push edx
  loc_005FD03B: push eax
  loc_005FD03C: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD042: lea ecx, var_24
  loc_005FD045: call [004012ACh] ; __vbaFreeStr
  loc_005FD04B: lea eax, var_6C
  loc_005FD04E: lea ecx, var_5C
  loc_005FD051: push eax
  loc_005FD052: lea edx, var_4C
  loc_005FD055: push ecx
  loc_005FD056: lea eax, var_3C
  loc_005FD059: push edx
  loc_005FD05A: push eax
  loc_005FD05B: push 00000004h
  loc_005FD05D: call [00401038h] ; __vbaFreeVarList
  loc_005FD063: mov ebx, var_DC
  loc_005FD069: add esp, 00000014h
  loc_005FD06C: cmp ebx, 0000000Bh
  loc_005FD06F: jb 005FD077h
  loc_005FD071: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD077: mov ecx, Me
  loc_005FD07A: mov edx, [ecx+00000044h]
  loc_005FD07D: mov eax, [edx+ebx*8+00000004h]
  loc_005FD081: push eax
  loc_005FD082: mov ecx, [edx+ebx*8]
  loc_005FD085: push ecx
  loc_005FD086: call [00401068h] ; __vbaStrDate
  loc_005FD08C: mov var_34, eax
  loc_005FD08F: lea edx, var_3C
  loc_005FD092: lea eax, var_4C
  loc_005FD095: push edx
  loc_005FD096: push eax
  loc_005FD097: mov var_3C, edi
  loc_005FD09A: call [004010D4h] ; rtcTrimVar
  loc_005FD0A0: mov eax, 80020004h
  loc_005FD0A5: mov ecx, 0000000Ah
  loc_005FD0AA: mov var_74, 00432280h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FD0B1: jmp 005FD49Bh
  loc_005FD0B6: mov eax, var_18
  loc_005FD0B9: and eax, 000000FFh
  loc_005FD0BE: cmp eax, 0000000Bh
  loc_005FD0C1: mov var_DC, eax
  loc_005FD0C7: jb 005FD0CFh
  loc_005FD0C9: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD0CF: mov ecx, [ebx+00000044h]
  loc_005FD0D2: mov eax, var_DC
  loc_005FD0D8: mov edx, [ecx+eax*8+00000004h]
  loc_005FD0DC: push edx
  loc_005FD0DD: mov eax, [ecx+eax*8]
  loc_005FD0E0: push eax
  loc_005FD0E1: call [00401068h] ; __vbaStrDate
  loc_005FD0E7: lea ecx, var_3C
  loc_005FD0EA: lea edx, var_4C
  loc_005FD0ED: push ecx
  loc_005FD0EE: push edx
  loc_005FD0EF: mov var_34, eax
  loc_005FD0F2: mov var_3C, edi
  loc_005FD0F5: call [004010D4h] ; rtcTrimVar
  loc_005FD0FB: mov edx, [0061A13Ch]
  loc_005FD101: mov var_74, 0043246Ch ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FD108: mov var_7C, edi
  loc_005FD10B: mov var_84, 004321A8h ; "# and Type1='S' and AMPM='AM'"
  loc_005FD115: mov var_8C, edi
  loc_005FD11B: mov ebx, [edx]
  loc_005FD11D: sub esp, 00000010h
  loc_005FD120: mov ecx, 0000000Ah
  loc_005FD125: mov edx, esp
  loc_005FD127: mov eax, 80020004h
  loc_005FD12C: mov [edx], ecx
  loc_005FD12E: mov ecx, var_98
  loc_005FD134: mov [edx+00000004h], ecx
  loc_005FD137: lea ecx, var_7C
  loc_005FD13A: push ecx
  loc_005FD13B: mov [edx+00000008h], eax
  loc_005FD13E: mov eax, var_90
  loc_005FD144: mov [edx+0000000Ch], eax
  loc_005FD147: lea edx, var_4C
  loc_005FD14A: lea eax, var_5C
  loc_005FD14D: push edx
  loc_005FD14E: push eax
  loc_005FD14F: call __vbaVarCat
  loc_005FD151: lea ecx, var_8C
  loc_005FD157: push eax
  loc_005FD158: lea edx, var_6C
  loc_005FD15B: push ecx
  loc_005FD15C: push edx
  loc_005FD15D: call __vbaVarCat
  loc_005FD15F: push eax
  loc_005FD160: lea eax, var_24
  loc_005FD163: push eax
  loc_005FD164: call [004011B0h] ; __vbaStrVarVal
  loc_005FD16A: mov ecx, [0061A13Ch]
  loc_005FD170: push eax
  loc_005FD171: push ecx
  loc_005FD172: call [ebx+0000005Ch]
  loc_005FD175: test eax, eax
  loc_005FD177: fnclex
  loc_005FD179: jge 005FD190h
  loc_005FD17B: mov edx, [0061A13Ch]
  loc_005FD181: push 0000005Ch
  loc_005FD183: push 0041E928h
  loc_005FD188: push edx
  loc_005FD189: push eax
  loc_005FD18A: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD190: lea ecx, var_24
  loc_005FD193: call [004012ACh] ; __vbaFreeStr
  loc_005FD199: lea eax, var_6C
  loc_005FD19C: lea ecx, var_5C
  loc_005FD19F: push eax
  loc_005FD1A0: lea edx, var_4C
  loc_005FD1A3: push ecx
  loc_005FD1A4: lea eax, var_3C
  loc_005FD1A7: push edx
  loc_005FD1A8: push eax
  loc_005FD1A9: push 00000004h
  loc_005FD1AB: call [00401038h] ; __vbaFreeVarList
  loc_005FD1B1: mov ebx, var_DC
  loc_005FD1B7: add esp, 00000014h
  loc_005FD1BA: cmp ebx, 0000000Bh
  loc_005FD1BD: jb 005FD1C5h
  loc_005FD1BF: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD1C5: mov ecx, Me
  loc_005FD1C8: mov edx, [ecx+00000044h]
  loc_005FD1CB: mov eax, [edx+ebx*8+00000004h]
  loc_005FD1CF: push eax
  loc_005FD1D0: mov ecx, [edx+ebx*8]
  loc_005FD1D3: push ecx
  loc_005FD1D4: call [00401068h] ; __vbaStrDate
  loc_005FD1DA: mov var_34, eax
  loc_005FD1DD: lea edx, var_3C
  loc_005FD1E0: lea eax, var_4C
  loc_005FD1E3: push edx
  loc_005FD1E4: push eax
  loc_005FD1E5: mov var_3C, edi
  loc_005FD1E8: call [004010D4h] ; rtcTrimVar
  loc_005FD1EE: mov eax, 80020004h
  loc_005FD1F3: mov ecx, 0000000Ah
  loc_005FD1F8: mov var_74, 00432594h ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FD1FF: jmp 005FD49Bh
  loc_005FD204: mov eax, var_18
  loc_005FD207: and eax, 000000FFh
  loc_005FD20C: cmp eax, 0000000Bh
  loc_005FD20F: mov var_DC, eax
  loc_005FD215: jb 005FD21Dh
  loc_005FD217: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD21D: mov ecx, [ebx+00000044h]
  loc_005FD220: mov eax, var_DC
  loc_005FD226: mov edx, [ecx+eax*8+00000004h]
  loc_005FD22A: push edx
  loc_005FD22B: mov eax, [ecx+eax*8]
  loc_005FD22E: push eax
  loc_005FD22F: call [00401068h] ; __vbaStrDate
  loc_005FD235: lea ecx, var_3C
  loc_005FD238: lea edx, var_4C
  loc_005FD23B: push ecx
  loc_005FD23C: push edx
  loc_005FD23D: mov var_34, eax
  loc_005FD240: mov var_3C, edi
  loc_005FD243: call [004010D4h] ; rtcTrimVar
  loc_005FD249: mov edx, [0061A13Ch]
  loc_005FD24F: mov var_74, 004326E0h ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FD256: mov var_7C, edi
  loc_005FD259: mov var_84, 004321A8h ; "# and Type1='S' and AMPM='AM'"
  loc_005FD263: mov var_8C, edi
  loc_005FD269: mov ebx, [edx]
  loc_005FD26B: sub esp, 00000010h
  loc_005FD26E: mov ecx, 0000000Ah
  loc_005FD273: mov edx, esp
  loc_005FD275: mov eax, 80020004h
  loc_005FD27A: mov [edx], ecx
  loc_005FD27C: mov ecx, var_98
  loc_005FD282: mov [edx+00000004h], ecx
  loc_005FD285: lea ecx, var_7C
  loc_005FD288: push ecx
  loc_005FD289: mov [edx+00000008h], eax
  loc_005FD28C: mov eax, var_90
  loc_005FD292: mov [edx+0000000Ch], eax
  loc_005FD295: lea edx, var_4C
  loc_005FD298: lea eax, var_5C
  loc_005FD29B: push edx
  loc_005FD29C: push eax
  loc_005FD29D: call __vbaVarCat
  loc_005FD29F: lea ecx, var_8C
  loc_005FD2A5: push eax
  loc_005FD2A6: lea edx, var_6C
  loc_005FD2A9: push ecx
  loc_005FD2AA: push edx
  loc_005FD2AB: call __vbaVarCat
  loc_005FD2AD: push eax
  loc_005FD2AE: lea eax, var_24
  loc_005FD2B1: push eax
  loc_005FD2B2: call [004011B0h] ; __vbaStrVarVal
  loc_005FD2B8: mov ecx, [0061A13Ch]
  loc_005FD2BE: push eax
  loc_005FD2BF: push ecx
  loc_005FD2C0: call [ebx+0000005Ch]
  loc_005FD2C3: test eax, eax
  loc_005FD2C5: fnclex
  loc_005FD2C7: jge 005FD2DEh
  loc_005FD2C9: mov edx, [0061A13Ch]
  loc_005FD2CF: push 0000005Ch
  loc_005FD2D1: push 0041E928h
  loc_005FD2D6: push edx
  loc_005FD2D7: push eax
  loc_005FD2D8: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD2DE: lea ecx, var_24
  loc_005FD2E1: call [004012ACh] ; __vbaFreeStr
  loc_005FD2E7: lea eax, var_6C
  loc_005FD2EA: lea ecx, var_5C
  loc_005FD2ED: push eax
  loc_005FD2EE: lea edx, var_4C
  loc_005FD2F1: push ecx
  loc_005FD2F2: lea eax, var_3C
  loc_005FD2F5: push edx
  loc_005FD2F6: push eax
  loc_005FD2F7: push 00000004h
  loc_005FD2F9: call [00401038h] ; __vbaFreeVarList
  loc_005FD2FF: mov ebx, var_DC
  loc_005FD305: add esp, 00000014h
  loc_005FD308: cmp ebx, 0000000Bh
  loc_005FD30B: jb 005FD313h
  loc_005FD30D: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD313: mov ecx, Me
  loc_005FD316: mov edx, [ecx+00000044h]
  loc_005FD319: mov eax, [edx+ebx*8+00000004h]
  loc_005FD31D: push eax
  loc_005FD31E: mov ecx, [edx+ebx*8]
  loc_005FD321: push ecx
  loc_005FD322: call [00401068h] ; __vbaStrDate
  loc_005FD328: mov var_34, eax
  loc_005FD32B: lea edx, var_3C
  loc_005FD32E: lea eax, var_4C
  loc_005FD331: push edx
  loc_005FD332: push eax
  loc_005FD333: mov var_3C, edi
  loc_005FD336: call [004010D4h] ; rtcTrimVar
  loc_005FD33C: mov eax, 80020004h
  loc_005FD341: mov ecx, 0000000Ah
  loc_005FD346: mov var_74, 004328C4h ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FD34D: jmp 005FD49Bh
  loc_005FD352: mov eax, var_18
  loc_005FD355: and eax, 000000FFh
  loc_005FD35A: cmp eax, 0000000Bh
  loc_005FD35D: mov var_DC, eax
  loc_005FD363: jb 005FD36Bh
  loc_005FD365: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD36B: mov ecx, [ebx+00000044h]
  loc_005FD36E: mov eax, var_DC
  loc_005FD374: mov edx, [ecx+eax*8+00000004h]
  loc_005FD378: push edx
  loc_005FD379: mov eax, [ecx+eax*8]
  loc_005FD37C: push eax
  loc_005FD37D: call [00401068h] ; __vbaStrDate
  loc_005FD383: lea ecx, var_3C
  loc_005FD386: lea edx, var_4C
  loc_005FD389: push ecx
  loc_005FD38A: push edx
  loc_005FD38B: mov var_34, eax
  loc_005FD38E: mov var_3C, edi
  loc_005FD391: call [004010D4h] ; rtcTrimVar
  loc_005FD397: mov edx, [0061A13Ch]
  loc_005FD39D: mov var_74, 00432A94h ; "INSERT INTO TmpTotalWeek(Agent,Amount4,LAmount4,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FD3A4: mov var_7C, edi
  loc_005FD3A7: mov var_84, 004321A8h ; "# and Type1='S' and AMPM='AM'"
  loc_005FD3B1: mov var_8C, edi
  loc_005FD3B7: mov ebx, [edx]
  loc_005FD3B9: sub esp, 00000010h
  loc_005FD3BC: mov ecx, 0000000Ah
  loc_005FD3C1: mov edx, esp
  loc_005FD3C3: mov eax, 80020004h
  loc_005FD3C8: mov [edx], ecx
  loc_005FD3CA: mov ecx, var_98
  loc_005FD3D0: mov [edx+00000004h], ecx
  loc_005FD3D3: lea ecx, var_7C
  loc_005FD3D6: push ecx
  loc_005FD3D7: mov [edx+00000008h], eax
  loc_005FD3DA: mov eax, var_90
  loc_005FD3E0: mov [edx+0000000Ch], eax
  loc_005FD3E3: lea edx, var_4C
  loc_005FD3E6: lea eax, var_5C
  loc_005FD3E9: push edx
  loc_005FD3EA: push eax
  loc_005FD3EB: call __vbaVarCat
  loc_005FD3ED: lea ecx, var_8C
  loc_005FD3F3: push eax
  loc_005FD3F4: lea edx, var_6C
  loc_005FD3F7: push ecx
  loc_005FD3F8: push edx
  loc_005FD3F9: call __vbaVarCat
  loc_005FD3FB: push eax
  loc_005FD3FC: lea eax, var_24
  loc_005FD3FF: push eax
  loc_005FD400: call [004011B0h] ; __vbaStrVarVal
  loc_005FD406: mov ecx, [0061A13Ch]
  loc_005FD40C: push eax
  loc_005FD40D: push ecx
  loc_005FD40E: call [ebx+0000005Ch]
  loc_005FD411: test eax, eax
  loc_005FD413: fnclex
  loc_005FD415: jge 005FD42Ch
  loc_005FD417: mov edx, [0061A13Ch]
  loc_005FD41D: push 0000005Ch
  loc_005FD41F: push 0041E928h
  loc_005FD424: push edx
  loc_005FD425: push eax
  loc_005FD426: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD42C: lea ecx, var_24
  loc_005FD42F: call [004012ACh] ; __vbaFreeStr
  loc_005FD435: lea eax, var_6C
  loc_005FD438: lea ecx, var_5C
  loc_005FD43B: push eax
  loc_005FD43C: lea edx, var_4C
  loc_005FD43F: push ecx
  loc_005FD440: lea eax, var_3C
  loc_005FD443: push edx
  loc_005FD444: push eax
  loc_005FD445: push 00000004h
  loc_005FD447: call [00401038h] ; __vbaFreeVarList
  loc_005FD44D: mov ebx, var_DC
  loc_005FD453: add esp, 00000014h
  loc_005FD456: cmp ebx, 0000000Bh
  loc_005FD459: jb 005FD461h
  loc_005FD45B: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD461: mov ecx, Me
  loc_005FD464: mov edx, [ecx+00000044h]
  loc_005FD467: mov eax, [edx+ebx*8+00000004h]
  loc_005FD46B: push eax
  loc_005FD46C: mov ecx, [edx+ebx*8]
  loc_005FD46F: push ecx
  loc_005FD470: call [00401068h] ; __vbaStrDate
  loc_005FD476: mov var_34, eax
  loc_005FD479: lea edx, var_3C
  loc_005FD47C: lea eax, var_4C
  loc_005FD47F: push edx
  loc_005FD480: push eax
  loc_005FD481: mov var_3C, edi
  loc_005FD484: call [004010D4h] ; rtcTrimVar
  loc_005FD48A: mov eax, 80020004h
  loc_005FD48F: mov ecx, 0000000Ah
  loc_005FD494: mov var_74, 00432C78h ; "INSERT INTO TmpTotalWeek(Agent,Amount4,LAmount4,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FD49B: mov edx, [0061A13Ch]
  loc_005FD4A1: mov var_7C, edi
  loc_005FD4A4: mov var_84, 00432394h ; "# and Type1='P' and AMPM='AM'"
  loc_005FD4AE: mov var_8C, edi
  loc_005FD4B4: mov ebx, [edx]
  loc_005FD4B6: sub esp, 00000010h
  loc_005FD4B9: mov edx, esp
  loc_005FD4BB: mov [edx], ecx
  loc_005FD4BD: mov ecx, var_98
  loc_005FD4C3: mov [edx+00000004h], ecx
  loc_005FD4C6: lea ecx, var_7C
  loc_005FD4C9: push ecx
  loc_005FD4CA: mov [edx+00000008h], eax
  loc_005FD4CD: mov eax, var_90
  loc_005FD4D3: mov [edx+0000000Ch], eax
  loc_005FD4D6: lea edx, var_4C
  loc_005FD4D9: lea eax, var_5C
  loc_005FD4DC: push edx
  loc_005FD4DD: push eax
  loc_005FD4DE: call __vbaVarCat
  loc_005FD4E0: lea ecx, var_8C
  loc_005FD4E6: push eax
  loc_005FD4E7: lea edx, var_6C
  loc_005FD4EA: push ecx
  loc_005FD4EB: push edx
  loc_005FD4EC: call __vbaVarCat
  loc_005FD4EE: push eax
  loc_005FD4EF: lea eax, var_24
  loc_005FD4F2: push eax
  loc_005FD4F3: call [004011B0h] ; __vbaStrVarVal
  loc_005FD4F9: mov ecx, [0061A13Ch]
  loc_005FD4FF: push eax
  loc_005FD500: push ecx
  loc_005FD501: call [ebx+0000005Ch]
  loc_005FD504: test eax, eax
  loc_005FD506: fnclex
  loc_005FD508: jge 005FD6E0h
  loc_005FD50E: jmp 005FD6CBh
  loc_005FD513: mov eax, var_18
  loc_005FD516: and eax, 000000FFh
  loc_005FD51B: cmp eax, 0000000Bh
  loc_005FD51E: mov var_DC, eax
  loc_005FD524: jb 005FD52Ch
  loc_005FD526: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD52C: mov ecx, [ebx+00000044h]
  loc_005FD52F: mov eax, var_DC
  loc_005FD535: mov edx, [ecx+eax*8+00000004h]
  loc_005FD539: push edx
  loc_005FD53A: mov eax, [ecx+eax*8]
  loc_005FD53D: push eax
  loc_005FD53E: call [00401068h] ; __vbaStrDate
  loc_005FD544: lea ecx, var_3C
  loc_005FD547: lea edx, var_4C
  loc_005FD54A: push ecx
  loc_005FD54B: push edx
  loc_005FD54C: mov var_34, eax
  loc_005FD54F: mov var_3C, edi
  loc_005FD552: call [004010D4h] ; rtcTrimVar
  loc_005FD558: mov edx, [0061A13Ch]
  loc_005FD55E: mov var_74, 00432E5Ch ; "INSERT INTO TmpTotalWeek(Agent,Amount5,LAmount5,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FD565: mov var_7C, edi
  loc_005FD568: mov var_84, 004321A8h ; "# and Type1='S' and AMPM='AM'"
  loc_005FD572: mov var_8C, edi
  loc_005FD578: mov ebx, [edx]
  loc_005FD57A: sub esp, 00000010h
  loc_005FD57D: mov ecx, 0000000Ah
  loc_005FD582: mov edx, esp
  loc_005FD584: mov eax, 80020004h
  loc_005FD589: mov [edx], ecx
  loc_005FD58B: mov ecx, var_98
  loc_005FD591: mov [edx+00000004h], ecx
  loc_005FD594: lea ecx, var_7C
  loc_005FD597: push ecx
  loc_005FD598: mov [edx+00000008h], eax
  loc_005FD59B: mov eax, var_90
  loc_005FD5A1: mov [edx+0000000Ch], eax
  loc_005FD5A4: lea edx, var_4C
  loc_005FD5A7: lea eax, var_5C
  loc_005FD5AA: push edx
  loc_005FD5AB: push eax
  loc_005FD5AC: call __vbaVarCat
  loc_005FD5AE: lea ecx, var_8C
  loc_005FD5B4: push eax
  loc_005FD5B5: lea edx, var_6C
  loc_005FD5B8: push ecx
  loc_005FD5B9: push edx
  loc_005FD5BA: call __vbaVarCat
  loc_005FD5BC: push eax
  loc_005FD5BD: lea eax, var_24
  loc_005FD5C0: push eax
  loc_005FD5C1: call [004011B0h] ; __vbaStrVarVal
  loc_005FD5C7: mov ecx, [0061A13Ch]
  loc_005FD5CD: push eax
  loc_005FD5CE: push ecx
  loc_005FD5CF: call [ebx+0000005Ch]
  loc_005FD5D2: test eax, eax
  loc_005FD5D4: fnclex
  loc_005FD5D6: jge 005FD5EDh
  loc_005FD5D8: mov edx, [0061A13Ch]
  loc_005FD5DE: push 0000005Ch
  loc_005FD5E0: push 0041E928h
  loc_005FD5E5: push edx
  loc_005FD5E6: push eax
  loc_005FD5E7: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD5ED: lea ecx, var_24
  loc_005FD5F0: call [004012ACh] ; __vbaFreeStr
  loc_005FD5F6: lea eax, var_6C
  loc_005FD5F9: lea ecx, var_5C
  loc_005FD5FC: push eax
  loc_005FD5FD: lea edx, var_4C
  loc_005FD600: push ecx
  loc_005FD601: lea eax, var_3C
  loc_005FD604: push edx
  loc_005FD605: push eax
  loc_005FD606: push 00000004h
  loc_005FD608: call [00401038h] ; __vbaFreeVarList
  loc_005FD60E: mov ebx, var_DC
  loc_005FD614: add esp, 00000014h
  loc_005FD617: cmp ebx, 0000000Bh
  loc_005FD61A: jb 005FD622h
  loc_005FD61C: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD622: mov ecx, Me
  loc_005FD625: mov edx, [ecx+00000044h]
  loc_005FD628: mov eax, [edx+ebx*8+00000004h]
  loc_005FD62C: push eax
  loc_005FD62D: mov ecx, [edx+ebx*8]
  loc_005FD630: push ecx
  loc_005FD631: call [00401068h] ; __vbaStrDate
  loc_005FD637: mov var_34, eax
  loc_005FD63A: lea edx, var_3C
  loc_005FD63D: lea eax, var_4C
  loc_005FD640: push edx
  loc_005FD641: push eax
  loc_005FD642: mov var_3C, edi
  loc_005FD645: call [004010D4h] ; rtcTrimVar
  loc_005FD64B: mov edx, [0061A13Ch]
  loc_005FD651: mov var_74, 00433044h ; "INSERT INTO TmpTotalWeek(Agent,Amount5,LAmount5,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FD658: mov var_7C, edi
  loc_005FD65B: mov var_84, 00432394h ; "# and Type1='P' and AMPM='AM'"
  loc_005FD665: mov var_8C, edi
  loc_005FD66B: mov ebx, [edx]
  loc_005FD66D: sub esp, 00000010h
  loc_005FD670: mov ecx, 0000000Ah
  loc_005FD675: mov edx, esp
  loc_005FD677: mov eax, 80020004h
  loc_005FD67C: mov [edx], ecx
  loc_005FD67E: mov ecx, var_98
  loc_005FD684: mov [edx+00000004h], ecx
  loc_005FD687: lea ecx, var_7C
  loc_005FD68A: push ecx
  loc_005FD68B: mov [edx+00000008h], eax
  loc_005FD68E: mov eax, var_90
  loc_005FD694: mov [edx+0000000Ch], eax
  loc_005FD697: lea edx, var_4C
  loc_005FD69A: lea eax, var_5C
  loc_005FD69D: push edx
  loc_005FD69E: push eax
  loc_005FD69F: call __vbaVarCat
  loc_005FD6A1: lea ecx, var_8C
  loc_005FD6A7: push eax
  loc_005FD6A8: lea edx, var_6C
  loc_005FD6AB: push ecx
  loc_005FD6AC: push edx
  loc_005FD6AD: call __vbaVarCat
  loc_005FD6AF: push eax
  loc_005FD6B0: lea eax, var_24
  loc_005FD6B3: push eax
  loc_005FD6B4: call [004011B0h] ; __vbaStrVarVal
  loc_005FD6BA: mov ecx, [0061A13Ch]
  loc_005FD6C0: push eax
  loc_005FD6C1: push ecx
  loc_005FD6C2: call [ebx+0000005Ch]
  loc_005FD6C5: test eax, eax
  loc_005FD6C7: fnclex
  loc_005FD6C9: jge 005FD6E0h
  loc_005FD6CB: mov edx, [0061A13Ch]
  loc_005FD6D1: push 0000005Ch
  loc_005FD6D3: push 0041E928h
  loc_005FD6D8: push edx
  loc_005FD6D9: push eax
  loc_005FD6DA: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD6E0: lea ecx, var_24
  loc_005FD6E3: call [004012ACh] ; __vbaFreeStr
  loc_005FD6E9: lea eax, var_6C
  loc_005FD6EC: lea ecx, var_5C
  loc_005FD6EF: push eax
  loc_005FD6F0: lea edx, var_4C
  loc_005FD6F3: push ecx
  loc_005FD6F4: lea eax, var_3C
  loc_005FD6F7: push edx
  loc_005FD6F8: push eax
  loc_005FD6F9: push 00000004h
  loc_005FD6FB: call [00401038h] ; __vbaFreeVarList
  loc_005FD701: mov ebx, Me
  loc_005FD704: add esp, 00000014h
  loc_005FD707: mov cl, var_18
  loc_005FD70A: mov al, 01h
  loc_005FD70C: add al, cl
  loc_005FD70E: jb 005FE0B8h
  loc_005FD714: mov var_18, al
  loc_005FD717: jmp 005FCF35h
  loc_005FD71C: mov esi, [004011B4h] ; __vbaVarCat
  loc_005FD722: mov edi, 00000008h
  loc_005FD727: mov ecx, [ebx]
  loc_005FD729: push ebx
  loc_005FD72A: call [ecx+000002FCh]
  loc_005FD730: lea edx, var_28
  loc_005FD733: push eax
  loc_005FD734: push edx
  loc_005FD735: call [004010A0h] ; __vbaObjSet
  loc_005FD73B: mov ecx, [eax]
  loc_005FD73D: lea edx, var_24
  loc_005FD740: push edx
  loc_005FD741: push eax
  loc_005FD742: mov var_A0, eax
  loc_005FD748: call [ecx+000000A8h]
  loc_005FD74E: test eax, eax
  loc_005FD750: fnclex
  loc_005FD752: jge 005FD76Ch
  loc_005FD754: mov ecx, var_A0
  loc_005FD75A: push 000000A8h
  loc_005FD75F: push 0041F844h
  loc_005FD764: push ecx
  loc_005FD765: push eax
  loc_005FD766: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD76C: mov edx, var_24
  loc_005FD76F: push edx
  loc_005FD770: push 00433158h ; "PM"
  loc_005FD775: call [0040110Ch] ; __vbaStrCmp
  loc_005FD77B: neg eax
  loc_005FD77D: sbb eax, eax
  loc_005FD77F: lea ecx, var_24
  loc_005FD782: inc eax
  loc_005FD783: neg eax
  loc_005FD785: mov var_A8, eax
  loc_005FD78B: call [004012ACh] ; __vbaFreeStr
  loc_005FD791: lea ecx, var_28
  loc_005FD794: call [004012B0h] ; __vbaFreeObj
  loc_005FD79A: cmp var_A8, 0000h
  loc_005FD7A2: jz 005FE03Ah
  loc_005FD7A8: mov eax, [ebx]
  loc_005FD7AA: push 00000000h
  loc_005FD7AC: push 00000014h
  loc_005FD7AE: push ebx
  loc_005FD7AF: call [eax+00000314h]
  loc_005FD7B5: lea ecx, var_28
  loc_005FD7B8: push eax
  loc_005FD7B9: push ecx
  loc_005FD7BA: call [004010A0h] ; __vbaObjSet
  loc_005FD7C0: lea edx, var_3C
  loc_005FD7C3: push eax
  loc_005FD7C4: push edx
  loc_005FD7C5: call [00401140h] ; __vbaLateIdCallLd
  loc_005FD7CB: mov eax, [ebx]
  loc_005FD7CD: add esp, 00000010h
  loc_005FD7D0: push ebx
  loc_005FD7D1: call [eax+0000031Ch]
  loc_005FD7D7: lea ecx, var_2C
  loc_005FD7DA: push eax
  loc_005FD7DB: push ecx
  loc_005FD7DC: call [004010A0h] ; __vbaObjSet
  loc_005FD7E2: mov eax, var_2C
  loc_005FD7E5: push 00000001h
  loc_005FD7E7: mov var_44, eax
  loc_005FD7EA: lea edx, var_4C
  loc_005FD7ED: push 00000001h
  loc_005FD7EF: lea eax, var_3C
  loc_005FD7F2: push edx
  loc_005FD7F3: push eax
  loc_005FD7F4: lea ecx, var_5C
  loc_005FD7F7: push 0041FF78h ; "D"
  loc_005FD7FC: push ecx
  loc_005FD7FD: mov var_2C, 00000000h
  loc_005FD804: mov var_4C, 00000009h
  loc_005FD80B: call [00401070h] ; rtcDateDiff
  loc_005FD811: lea edx, var_5C
  loc_005FD814: push edx
  loc_005FD815: call [00401294h] ; __vbaUI1Var
  loc_005FD81B: xor ecx, ecx
  loc_005FD81D: mov var_C4, al
  loc_005FD823: call [00401154h] ; __vbaUI1I2
  loc_005FD829: mov var_18, al
  loc_005FD82C: lea eax, var_2C
  loc_005FD82F: lea ecx, var_28
  loc_005FD832: push eax
  loc_005FD833: push ecx
  loc_005FD834: push 00000002h
  loc_005FD836: call [00401040h] ; __vbaFreeObjList
  loc_005FD83C: lea edx, var_5C
  loc_005FD83F: lea eax, var_4C
  loc_005FD842: push edx
  loc_005FD843: lea ecx, var_3C
  loc_005FD846: push eax
  loc_005FD847: push ecx
  loc_005FD848: push 00000003h
  loc_005FD84A: call [00401038h] ; __vbaFreeVarList
  loc_005FD850: add esp, 0000001Ch
  loc_005FD853: mov al, var_18
  loc_005FD856: mov cl, var_C4
  loc_005FD85C: cmp al, cl
  loc_005FD85E: ja 005FE03Ah
  loc_005FD864: movzx ax, al
  loc_005FD868: add ax, 0001h
  loc_005FD86C: jo 005FE0B8h
  loc_005FD872: movsx eax, ax
  loc_005FD875: dec eax
  loc_005FD876: cmp eax, 00000004h
  loc_005FD879: ja 005FE025h
  loc_005FD87F: jmp [eax*4+005FE0A4h]
  loc_005FD886: mov eax, var_18
  loc_005FD889: and eax, 000000FFh
  loc_005FD88E: cmp eax, 0000000Bh
  loc_005FD891: mov var_DC, eax
  loc_005FD897: jb 005FD89Fh
  loc_005FD899: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD89F: mov edx, [ebx+00000044h]
  loc_005FD8A2: mov eax, var_DC
  loc_005FD8A8: mov ecx, [edx+eax*8+00000004h]
  loc_005FD8AC: push ecx
  loc_005FD8AD: mov edx, [edx+eax*8]
  loc_005FD8B0: push edx
  loc_005FD8B1: call [00401068h] ; __vbaStrDate
  loc_005FD8B7: mov var_34, eax
  loc_005FD8BA: lea eax, var_3C
  loc_005FD8BD: lea ecx, var_4C
  loc_005FD8C0: push eax
  loc_005FD8C1: push ecx
  loc_005FD8C2: mov var_3C, edi
  loc_005FD8C5: call [004010D4h] ; rtcTrimVar
  loc_005FD8CB: mov edx, [0061A13Ch]
  loc_005FD8D1: mov var_74, 004320A0h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FD8D8: mov var_7C, edi
  loc_005FD8DB: mov var_84, 00433164h ; "# and Type1='S' and AMPM='PM'"
  loc_005FD8E5: mov var_8C, edi
  loc_005FD8EB: mov ebx, [edx]
  loc_005FD8ED: sub esp, 00000010h
  loc_005FD8F0: mov ecx, 0000000Ah
  loc_005FD8F5: mov edx, esp
  loc_005FD8F7: mov eax, 80020004h
  loc_005FD8FC: mov [edx], ecx
  loc_005FD8FE: mov ecx, var_98
  loc_005FD904: mov [edx+00000004h], ecx
  loc_005FD907: lea ecx, var_7C
  loc_005FD90A: push ecx
  loc_005FD90B: mov [edx+00000008h], eax
  loc_005FD90E: mov eax, var_90
  loc_005FD914: mov [edx+0000000Ch], eax
  loc_005FD917: lea edx, var_4C
  loc_005FD91A: lea eax, var_5C
  loc_005FD91D: push edx
  loc_005FD91E: push eax
  loc_005FD91F: call __vbaVarCat
  loc_005FD921: lea ecx, var_8C
  loc_005FD927: push eax
  loc_005FD928: lea edx, var_6C
  loc_005FD92B: push ecx
  loc_005FD92C: push edx
  loc_005FD92D: call __vbaVarCat
  loc_005FD92F: push eax
  loc_005FD930: lea eax, var_24
  loc_005FD933: push eax
  loc_005FD934: call [004011B0h] ; __vbaStrVarVal
  loc_005FD93A: mov ecx, [0061A13Ch]
  loc_005FD940: push eax
  loc_005FD941: push ecx
  loc_005FD942: call [ebx+0000005Ch]
  loc_005FD945: test eax, eax
  loc_005FD947: fnclex
  loc_005FD949: jge 005FD960h
  loc_005FD94B: mov edx, [0061A13Ch]
  loc_005FD951: push 0000005Ch
  loc_005FD953: push 0041E928h
  loc_005FD958: push edx
  loc_005FD959: push eax
  loc_005FD95A: call [00401074h] ; __vbaHresultCheckObj
  loc_005FD960: lea ecx, var_24
  loc_005FD963: call [004012ACh] ; __vbaFreeStr
  loc_005FD969: lea eax, var_6C
  loc_005FD96C: lea ecx, var_5C
  loc_005FD96F: push eax
  loc_005FD970: lea edx, var_4C
  loc_005FD973: push ecx
  loc_005FD974: lea eax, var_3C
  loc_005FD977: push edx
  loc_005FD978: push eax
  loc_005FD979: push 00000004h
  loc_005FD97B: call [00401038h] ; __vbaFreeVarList
  loc_005FD981: mov ebx, var_DC
  loc_005FD987: add esp, 00000014h
  loc_005FD98A: cmp ebx, 0000000Bh
  loc_005FD98D: jb 005FD995h
  loc_005FD98F: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD995: mov ecx, Me
  loc_005FD998: mov edx, [ecx+00000044h]
  loc_005FD99B: mov eax, [edx+ebx*8+00000004h]
  loc_005FD99F: push eax
  loc_005FD9A0: mov ecx, [edx+ebx*8]
  loc_005FD9A3: push ecx
  loc_005FD9A4: call [00401068h] ; __vbaStrDate
  loc_005FD9AA: mov var_34, eax
  loc_005FD9AD: lea edx, var_3C
  loc_005FD9B0: lea eax, var_4C
  loc_005FD9B3: push edx
  loc_005FD9B4: push eax
  loc_005FD9B5: mov var_3C, edi
  loc_005FD9B8: call [004010D4h] ; rtcTrimVar
  loc_005FD9BE: mov eax, 80020004h
  loc_005FD9C3: mov ecx, 0000000Ah
  loc_005FD9C8: mov var_74, 00432280h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FD9CF: jmp 005FDDB9h
  loc_005FD9D4: mov eax, var_18
  loc_005FD9D7: and eax, 000000FFh
  loc_005FD9DC: cmp eax, 0000000Bh
  loc_005FD9DF: mov var_DC, eax
  loc_005FD9E5: jb 005FD9EDh
  loc_005FD9E7: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FD9ED: mov ecx, [ebx+00000044h]
  loc_005FD9F0: mov eax, var_DC
  loc_005FD9F6: mov edx, [ecx+eax*8+00000004h]
  loc_005FD9FA: push edx
  loc_005FD9FB: mov eax, [ecx+eax*8]
  loc_005FD9FE: push eax
  loc_005FD9FF: call [00401068h] ; __vbaStrDate
  loc_005FDA05: lea ecx, var_3C
  loc_005FDA08: lea edx, var_4C
  loc_005FDA0B: push ecx
  loc_005FDA0C: push edx
  loc_005FDA0D: mov var_34, eax
  loc_005FDA10: mov var_3C, edi
  loc_005FDA13: call [004010D4h] ; rtcTrimVar
  loc_005FDA19: mov edx, [0061A13Ch]
  loc_005FDA1F: mov var_74, 0043246Ch ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FDA26: mov var_7C, edi
  loc_005FDA29: mov var_84, 00433164h ; "# and Type1='S' and AMPM='PM'"
  loc_005FDA33: mov var_8C, edi
  loc_005FDA39: mov ebx, [edx]
  loc_005FDA3B: sub esp, 00000010h
  loc_005FDA3E: mov ecx, 0000000Ah
  loc_005FDA43: mov edx, esp
  loc_005FDA45: mov eax, 80020004h
  loc_005FDA4A: mov [edx], ecx
  loc_005FDA4C: mov ecx, var_98
  loc_005FDA52: mov [edx+00000004h], ecx
  loc_005FDA55: lea ecx, var_7C
  loc_005FDA58: push ecx
  loc_005FDA59: mov [edx+00000008h], eax
  loc_005FDA5C: mov eax, var_90
  loc_005FDA62: mov [edx+0000000Ch], eax
  loc_005FDA65: lea edx, var_4C
  loc_005FDA68: lea eax, var_5C
  loc_005FDA6B: push edx
  loc_005FDA6C: push eax
  loc_005FDA6D: call __vbaVarCat
  loc_005FDA6F: lea ecx, var_8C
  loc_005FDA75: push eax
  loc_005FDA76: lea edx, var_6C
  loc_005FDA79: push ecx
  loc_005FDA7A: push edx
  loc_005FDA7B: call __vbaVarCat
  loc_005FDA7D: push eax
  loc_005FDA7E: lea eax, var_24
  loc_005FDA81: push eax
  loc_005FDA82: call [004011B0h] ; __vbaStrVarVal
  loc_005FDA88: mov ecx, [0061A13Ch]
  loc_005FDA8E: push eax
  loc_005FDA8F: push ecx
  loc_005FDA90: call [ebx+0000005Ch]
  loc_005FDA93: test eax, eax
  loc_005FDA95: fnclex
  loc_005FDA97: jge 005FDAAEh
  loc_005FDA99: mov edx, [0061A13Ch]
  loc_005FDA9F: push 0000005Ch
  loc_005FDAA1: push 0041E928h
  loc_005FDAA6: push edx
  loc_005FDAA7: push eax
  loc_005FDAA8: call [00401074h] ; __vbaHresultCheckObj
  loc_005FDAAE: lea ecx, var_24
  loc_005FDAB1: call [004012ACh] ; __vbaFreeStr
  loc_005FDAB7: lea eax, var_6C
  loc_005FDABA: lea ecx, var_5C
  loc_005FDABD: push eax
  loc_005FDABE: lea edx, var_4C
  loc_005FDAC1: push ecx
  loc_005FDAC2: lea eax, var_3C
  loc_005FDAC5: push edx
  loc_005FDAC6: push eax
  loc_005FDAC7: push 00000004h
  loc_005FDAC9: call [00401038h] ; __vbaFreeVarList
  loc_005FDACF: mov ebx, var_DC
  loc_005FDAD5: add esp, 00000014h
  loc_005FDAD8: cmp ebx, 0000000Bh
  loc_005FDADB: jb 005FDAE3h
  loc_005FDADD: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDAE3: mov ecx, Me
  loc_005FDAE6: mov edx, [ecx+00000044h]
  loc_005FDAE9: mov eax, [edx+ebx*8+00000004h]
  loc_005FDAED: push eax
  loc_005FDAEE: mov ecx, [edx+ebx*8]
  loc_005FDAF1: push ecx
  loc_005FDAF2: call [00401068h] ; __vbaStrDate
  loc_005FDAF8: mov var_34, eax
  loc_005FDAFB: lea edx, var_3C
  loc_005FDAFE: lea eax, var_4C
  loc_005FDB01: push edx
  loc_005FDB02: push eax
  loc_005FDB03: mov var_3C, edi
  loc_005FDB06: call [004010D4h] ; rtcTrimVar
  loc_005FDB0C: mov eax, 80020004h
  loc_005FDB11: mov ecx, 0000000Ah
  loc_005FDB16: mov var_74, 00432594h ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FDB1D: jmp 005FDDB9h
  loc_005FDB22: mov eax, var_18
  loc_005FDB25: and eax, 000000FFh
  loc_005FDB2A: cmp eax, 0000000Bh
  loc_005FDB2D: mov var_DC, eax
  loc_005FDB33: jb 005FDB3Bh
  loc_005FDB35: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDB3B: mov ecx, [ebx+00000044h]
  loc_005FDB3E: mov eax, var_DC
  loc_005FDB44: mov edx, [ecx+eax*8+00000004h]
  loc_005FDB48: push edx
  loc_005FDB49: mov eax, [ecx+eax*8]
  loc_005FDB4C: push eax
  loc_005FDB4D: call [00401068h] ; __vbaStrDate
  loc_005FDB53: lea ecx, var_3C
  loc_005FDB56: lea edx, var_4C
  loc_005FDB59: push ecx
  loc_005FDB5A: push edx
  loc_005FDB5B: mov var_34, eax
  loc_005FDB5E: mov var_3C, edi
  loc_005FDB61: call [004010D4h] ; rtcTrimVar
  loc_005FDB67: mov edx, [0061A13Ch]
  loc_005FDB6D: mov var_74, 004326E0h ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FDB74: mov var_7C, edi
  loc_005FDB77: mov var_84, 00433164h ; "# and Type1='S' and AMPM='PM'"
  loc_005FDB81: mov var_8C, edi
  loc_005FDB87: mov ebx, [edx]
  loc_005FDB89: sub esp, 00000010h
  loc_005FDB8C: mov ecx, 0000000Ah
  loc_005FDB91: mov edx, esp
  loc_005FDB93: mov eax, 80020004h
  loc_005FDB98: mov [edx], ecx
  loc_005FDB9A: mov ecx, var_98
  loc_005FDBA0: mov [edx+00000004h], ecx
  loc_005FDBA3: lea ecx, var_7C
  loc_005FDBA6: push ecx
  loc_005FDBA7: mov [edx+00000008h], eax
  loc_005FDBAA: mov eax, var_90
  loc_005FDBB0: mov [edx+0000000Ch], eax
  loc_005FDBB3: lea edx, var_4C
  loc_005FDBB6: lea eax, var_5C
  loc_005FDBB9: push edx
  loc_005FDBBA: push eax
  loc_005FDBBB: call __vbaVarCat
  loc_005FDBBD: lea ecx, var_8C
  loc_005FDBC3: push eax
  loc_005FDBC4: lea edx, var_6C
  loc_005FDBC7: push ecx
  loc_005FDBC8: push edx
  loc_005FDBC9: call __vbaVarCat
  loc_005FDBCB: push eax
  loc_005FDBCC: lea eax, var_24
  loc_005FDBCF: push eax
  loc_005FDBD0: call [004011B0h] ; __vbaStrVarVal
  loc_005FDBD6: mov ecx, [0061A13Ch]
  loc_005FDBDC: push eax
  loc_005FDBDD: push ecx
  loc_005FDBDE: call [ebx+0000005Ch]
  loc_005FDBE1: test eax, eax
  loc_005FDBE3: fnclex
  loc_005FDBE5: jge 005FDBFCh
  loc_005FDBE7: mov edx, [0061A13Ch]
  loc_005FDBED: push 0000005Ch
  loc_005FDBEF: push 0041E928h
  loc_005FDBF4: push edx
  loc_005FDBF5: push eax
  loc_005FDBF6: call [00401074h] ; __vbaHresultCheckObj
  loc_005FDBFC: lea ecx, var_24
  loc_005FDBFF: call [004012ACh] ; __vbaFreeStr
  loc_005FDC05: lea eax, var_6C
  loc_005FDC08: lea ecx, var_5C
  loc_005FDC0B: push eax
  loc_005FDC0C: lea edx, var_4C
  loc_005FDC0F: push ecx
  loc_005FDC10: lea eax, var_3C
  loc_005FDC13: push edx
  loc_005FDC14: push eax
  loc_005FDC15: push 00000004h
  loc_005FDC17: call [00401038h] ; __vbaFreeVarList
  loc_005FDC1D: mov ebx, var_DC
  loc_005FDC23: add esp, 00000014h
  loc_005FDC26: cmp ebx, 0000000Bh
  loc_005FDC29: jb 005FDC31h
  loc_005FDC2B: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDC31: mov ecx, Me
  loc_005FDC34: mov edx, [ecx+00000044h]
  loc_005FDC37: mov eax, [edx+ebx*8+00000004h]
  loc_005FDC3B: push eax
  loc_005FDC3C: mov ecx, [edx+ebx*8]
  loc_005FDC3F: push ecx
  loc_005FDC40: call [00401068h] ; __vbaStrDate
  loc_005FDC46: mov var_34, eax
  loc_005FDC49: lea edx, var_3C
  loc_005FDC4C: lea eax, var_4C
  loc_005FDC4F: push edx
  loc_005FDC50: push eax
  loc_005FDC51: mov var_3C, edi
  loc_005FDC54: call [004010D4h] ; rtcTrimVar
  loc_005FDC5A: mov eax, 80020004h
  loc_005FDC5F: mov ecx, 0000000Ah
  loc_005FDC64: mov var_74, 004328C4h ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FDC6B: jmp 005FDDB9h
  loc_005FDC70: mov eax, var_18
  loc_005FDC73: and eax, 000000FFh
  loc_005FDC78: cmp eax, 0000000Bh
  loc_005FDC7B: mov var_DC, eax
  loc_005FDC81: jb 005FDC89h
  loc_005FDC83: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDC89: mov ecx, [ebx+00000044h]
  loc_005FDC8C: mov eax, var_DC
  loc_005FDC92: mov edx, [ecx+eax*8+00000004h]
  loc_005FDC96: push edx
  loc_005FDC97: mov eax, [ecx+eax*8]
  loc_005FDC9A: push eax
  loc_005FDC9B: call [00401068h] ; __vbaStrDate
  loc_005FDCA1: lea ecx, var_3C
  loc_005FDCA4: lea edx, var_4C
  loc_005FDCA7: push ecx
  loc_005FDCA8: push edx
  loc_005FDCA9: mov var_34, eax
  loc_005FDCAC: mov var_3C, edi
  loc_005FDCAF: call [004010D4h] ; rtcTrimVar
  loc_005FDCB5: mov edx, [0061A13Ch]
  loc_005FDCBB: mov var_74, 00432A94h ; "INSERT INTO TmpTotalWeek(Agent,Amount4,LAmount4,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FDCC2: mov var_7C, edi
  loc_005FDCC5: mov var_84, 004331E4h ; "# and Type1='S'and AMPM='PM'"
  loc_005FDCCF: mov var_8C, edi
  loc_005FDCD5: mov ebx, [edx]
  loc_005FDCD7: sub esp, 00000010h
  loc_005FDCDA: mov ecx, 0000000Ah
  loc_005FDCDF: mov edx, esp
  loc_005FDCE1: mov eax, 80020004h
  loc_005FDCE6: mov [edx], ecx
  loc_005FDCE8: mov ecx, var_98
  loc_005FDCEE: mov [edx+00000004h], ecx
  loc_005FDCF1: lea ecx, var_7C
  loc_005FDCF4: push ecx
  loc_005FDCF5: mov [edx+00000008h], eax
  loc_005FDCF8: mov eax, var_90
  loc_005FDCFE: mov [edx+0000000Ch], eax
  loc_005FDD01: lea edx, var_4C
  loc_005FDD04: lea eax, var_5C
  loc_005FDD07: push edx
  loc_005FDD08: push eax
  loc_005FDD09: call __vbaVarCat
  loc_005FDD0B: lea ecx, var_8C
  loc_005FDD11: push eax
  loc_005FDD12: lea edx, var_6C
  loc_005FDD15: push ecx
  loc_005FDD16: push edx
  loc_005FDD17: call __vbaVarCat
  loc_005FDD19: push eax
  loc_005FDD1A: lea eax, var_24
  loc_005FDD1D: push eax
  loc_005FDD1E: call [004011B0h] ; __vbaStrVarVal
  loc_005FDD24: mov ecx, [0061A13Ch]
  loc_005FDD2A: push eax
  loc_005FDD2B: push ecx
  loc_005FDD2C: call [ebx+0000005Ch]
  loc_005FDD2F: test eax, eax
  loc_005FDD31: fnclex
  loc_005FDD33: jge 005FDD4Ah
  loc_005FDD35: mov edx, [0061A13Ch]
  loc_005FDD3B: push 0000005Ch
  loc_005FDD3D: push 0041E928h
  loc_005FDD42: push edx
  loc_005FDD43: push eax
  loc_005FDD44: call [00401074h] ; __vbaHresultCheckObj
  loc_005FDD4A: lea ecx, var_24
  loc_005FDD4D: call [004012ACh] ; __vbaFreeStr
  loc_005FDD53: lea eax, var_6C
  loc_005FDD56: lea ecx, var_5C
  loc_005FDD59: push eax
  loc_005FDD5A: lea edx, var_4C
  loc_005FDD5D: push ecx
  loc_005FDD5E: lea eax, var_3C
  loc_005FDD61: push edx
  loc_005FDD62: push eax
  loc_005FDD63: push 00000004h
  loc_005FDD65: call [00401038h] ; __vbaFreeVarList
  loc_005FDD6B: mov ebx, var_DC
  loc_005FDD71: add esp, 00000014h
  loc_005FDD74: cmp ebx, 0000000Bh
  loc_005FDD77: jb 005FDD7Fh
  loc_005FDD79: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDD7F: mov ecx, Me
  loc_005FDD82: mov edx, [ecx+00000044h]
  loc_005FDD85: mov eax, [edx+ebx*8+00000004h]
  loc_005FDD89: push eax
  loc_005FDD8A: mov ecx, [edx+ebx*8]
  loc_005FDD8D: push ecx
  loc_005FDD8E: call [00401068h] ; __vbaStrDate
  loc_005FDD94: mov var_34, eax
  loc_005FDD97: lea edx, var_3C
  loc_005FDD9A: lea eax, var_4C
  loc_005FDD9D: push edx
  loc_005FDD9E: push eax
  loc_005FDD9F: mov var_3C, edi
  loc_005FDDA2: call [004010D4h] ; rtcTrimVar
  loc_005FDDA8: mov eax, 80020004h
  loc_005FDDAD: mov ecx, 0000000Ah
  loc_005FDDB2: mov var_74, 00432C78h ; "INSERT INTO TmpTotalWeek(Agent,Amount4,LAmount4,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FDDB9: mov edx, [0061A13Ch]
  loc_005FDDBF: mov var_7C, edi
  loc_005FDDC2: mov var_84, 004331A4h ; "# and Type1='P' and AMPM='PM'"
  loc_005FDDCC: mov var_8C, edi
  loc_005FDDD2: mov ebx, [edx]
  loc_005FDDD4: sub esp, 00000010h
  loc_005FDDD7: mov edx, esp
  loc_005FDDD9: mov [edx], ecx
  loc_005FDDDB: mov ecx, var_98
  loc_005FDDE1: mov [edx+00000004h], ecx
  loc_005FDDE4: lea ecx, var_7C
  loc_005FDDE7: push ecx
  loc_005FDDE8: mov [edx+00000008h], eax
  loc_005FDDEB: mov eax, var_90
  loc_005FDDF1: mov [edx+0000000Ch], eax
  loc_005FDDF4: lea edx, var_4C
  loc_005FDDF7: lea eax, var_5C
  loc_005FDDFA: push edx
  loc_005FDDFB: push eax
  loc_005FDDFC: call __vbaVarCat
  loc_005FDDFE: lea ecx, var_8C
  loc_005FDE04: push eax
  loc_005FDE05: lea edx, var_6C
  loc_005FDE08: push ecx
  loc_005FDE09: push edx
  loc_005FDE0A: call __vbaVarCat
  loc_005FDE0C: push eax
  loc_005FDE0D: lea eax, var_24
  loc_005FDE10: push eax
  loc_005FDE11: call [004011B0h] ; __vbaStrVarVal
  loc_005FDE17: mov ecx, [0061A13Ch]
  loc_005FDE1D: push eax
  loc_005FDE1E: push ecx
  loc_005FDE1F: call [ebx+0000005Ch]
  loc_005FDE22: test eax, eax
  loc_005FDE24: fnclex
  loc_005FDE26: jge 005FDFFEh
  loc_005FDE2C: jmp 005FDFE9h
  loc_005FDE31: mov eax, var_18
  loc_005FDE34: and eax, 000000FFh
  loc_005FDE39: cmp eax, 0000000Bh
  loc_005FDE3C: mov var_DC, eax
  loc_005FDE42: jb 005FDE4Ah
  loc_005FDE44: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDE4A: mov ecx, [ebx+00000044h]
  loc_005FDE4D: mov eax, var_DC
  loc_005FDE53: mov edx, [ecx+eax*8+00000004h]
  loc_005FDE57: push edx
  loc_005FDE58: mov eax, [ecx+eax*8]
  loc_005FDE5B: push eax
  loc_005FDE5C: call [00401068h] ; __vbaStrDate
  loc_005FDE62: lea ecx, var_3C
  loc_005FDE65: lea edx, var_4C
  loc_005FDE68: push ecx
  loc_005FDE69: push edx
  loc_005FDE6A: mov var_34, eax
  loc_005FDE6D: mov var_3C, edi
  loc_005FDE70: call [004010D4h] ; rtcTrimVar
  loc_005FDE76: mov edx, [0061A13Ch]
  loc_005FDE7C: mov var_74, 00432E5Ch ; "INSERT INTO TmpTotalWeek(Agent,Amount5,LAmount5,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount=#"
  loc_005FDE83: mov var_7C, edi
  loc_005FDE86: mov var_84, 00433164h ; "# and Type1='S' and AMPM='PM'"
  loc_005FDE90: mov var_8C, edi
  loc_005FDE96: mov ebx, [edx]
  loc_005FDE98: sub esp, 00000010h
  loc_005FDE9B: mov ecx, 0000000Ah
  loc_005FDEA0: mov edx, esp
  loc_005FDEA2: mov eax, 80020004h
  loc_005FDEA7: mov [edx], ecx
  loc_005FDEA9: mov ecx, var_98
  loc_005FDEAF: mov [edx+00000004h], ecx
  loc_005FDEB2: lea ecx, var_7C
  loc_005FDEB5: push ecx
  loc_005FDEB6: mov [edx+00000008h], eax
  loc_005FDEB9: mov eax, var_90
  loc_005FDEBF: mov [edx+0000000Ch], eax
  loc_005FDEC2: lea edx, var_4C
  loc_005FDEC5: lea eax, var_5C
  loc_005FDEC8: push edx
  loc_005FDEC9: push eax
  loc_005FDECA: call __vbaVarCat
  loc_005FDECC: lea ecx, var_8C
  loc_005FDED2: push eax
  loc_005FDED3: lea edx, var_6C
  loc_005FDED6: push ecx
  loc_005FDED7: push edx
  loc_005FDED8: call __vbaVarCat
  loc_005FDEDA: push eax
  loc_005FDEDB: lea eax, var_24
  loc_005FDEDE: push eax
  loc_005FDEDF: call [004011B0h] ; __vbaStrVarVal
  loc_005FDEE5: mov ecx, [0061A13Ch]
  loc_005FDEEB: push eax
  loc_005FDEEC: push ecx
  loc_005FDEED: call [ebx+0000005Ch]
  loc_005FDEF0: test eax, eax
  loc_005FDEF2: fnclex
  loc_005FDEF4: jge 005FDF0Bh
  loc_005FDEF6: mov edx, [0061A13Ch]
  loc_005FDEFC: push 0000005Ch
  loc_005FDEFE: push 0041E928h
  loc_005FDF03: push edx
  loc_005FDF04: push eax
  loc_005FDF05: call [00401074h] ; __vbaHresultCheckObj
  loc_005FDF0B: lea ecx, var_24
  loc_005FDF0E: call [004012ACh] ; __vbaFreeStr
  loc_005FDF14: lea eax, var_6C
  loc_005FDF17: lea ecx, var_5C
  loc_005FDF1A: push eax
  loc_005FDF1B: lea edx, var_4C
  loc_005FDF1E: push ecx
  loc_005FDF1F: lea eax, var_3C
  loc_005FDF22: push edx
  loc_005FDF23: push eax
  loc_005FDF24: push 00000004h
  loc_005FDF26: call [00401038h] ; __vbaFreeVarList
  loc_005FDF2C: mov ebx, var_DC
  loc_005FDF32: add esp, 00000014h
  loc_005FDF35: cmp ebx, 0000000Bh
  loc_005FDF38: jb 005FDF40h
  loc_005FDF3A: call [00401100h] ; __vbaGenerateBoundsError
  loc_005FDF40: mov ecx, Me
  loc_005FDF43: mov edx, [ecx+00000044h]
  loc_005FDF46: mov eax, [edx+ebx*8+00000004h]
  loc_005FDF4A: push eax
  loc_005FDF4B: mov ecx, [edx+ebx*8]
  loc_005FDF4E: push ecx
  loc_005FDF4F: call [00401068h] ; __vbaStrDate
  loc_005FDF55: mov var_34, eax
  loc_005FDF58: lea edx, var_3C
  loc_005FDF5B: lea eax, var_4C
  loc_005FDF5E: push edx
  loc_005FDF5F: push eax
  loc_005FDF60: mov var_3C, edi
  loc_005FDF63: call [004010D4h] ; rtcTrimVar
  loc_005FDF69: mov edx, [0061A13Ch]
  loc_005FDF6F: mov var_74, 00433044h ; "INSERT INTO TmpTotalWeek(Agent,Amount5,LAmount5,Type1) Select AgentName,TotalAmount,LuckyAmount * -1,'S' From TotalPLG Where OnCount=#"
  loc_005FDF76: mov var_7C, edi
  loc_005FDF79: mov var_84, 004331A4h ; "# and Type1='P' and AMPM='PM'"
  loc_005FDF83: mov var_8C, edi
  loc_005FDF89: mov ebx, [edx]
  loc_005FDF8B: sub esp, 00000010h
  loc_005FDF8E: mov ecx, 0000000Ah
  loc_005FDF93: mov edx, esp
  loc_005FDF95: mov eax, 80020004h
  loc_005FDF9A: mov [edx], ecx
  loc_005FDF9C: mov ecx, var_98
  loc_005FDFA2: mov [edx+00000004h], ecx
  loc_005FDFA5: lea ecx, var_7C
  loc_005FDFA8: push ecx
  loc_005FDFA9: mov [edx+00000008h], eax
  loc_005FDFAC: mov eax, var_90
  loc_005FDFB2: mov [edx+0000000Ch], eax
  loc_005FDFB5: lea edx, var_4C
  loc_005FDFB8: lea eax, var_5C
  loc_005FDFBB: push edx
  loc_005FDFBC: push eax
  loc_005FDFBD: call __vbaVarCat
  loc_005FDFBF: lea ecx, var_8C
  loc_005FDFC5: push eax
  loc_005FDFC6: lea edx, var_6C
  loc_005FDFC9: push ecx
  loc_005FDFCA: push edx
  loc_005FDFCB: call __vbaVarCat
  loc_005FDFCD: push eax
  loc_005FDFCE: lea eax, var_24
  loc_005FDFD1: push eax
  loc_005FDFD2: call [004011B0h] ; __vbaStrVarVal
  loc_005FDFD8: mov ecx, [0061A13Ch]
  loc_005FDFDE: push eax
  loc_005FDFDF: push ecx
  loc_005FDFE0: call [ebx+0000005Ch]
  loc_005FDFE3: test eax, eax
  loc_005FDFE5: fnclex
  loc_005FDFE7: jge 005FDFFEh
  loc_005FDFE9: mov edx, [0061A13Ch]
  loc_005FDFEF: push 0000005Ch
  loc_005FDFF1: push 0041E928h
  loc_005FDFF6: push edx
  loc_005FDFF7: push eax
  loc_005FDFF8: call [00401074h] ; __vbaHresultCheckObj
  loc_005FDFFE: lea ecx, var_24
  loc_005FE001: call [004012ACh] ; __vbaFreeStr
  loc_005FE007: lea eax, var_6C
  loc_005FE00A: lea ecx, var_5C
  loc_005FE00D: push eax
  loc_005FE00E: lea edx, var_4C
  loc_005FE011: push ecx
  loc_005FE012: lea eax, var_3C
  loc_005FE015: push edx
  loc_005FE016: push eax
  loc_005FE017: push 00000004h
  loc_005FE019: call [00401038h] ; __vbaFreeVarList
  loc_005FE01F: mov ebx, Me
  loc_005FE022: add esp, 00000014h
  loc_005FE025: mov cl, var_18
  loc_005FE028: mov al, 01h
  loc_005FE02A: add al, cl
  loc_005FE02C: jb 005FE0B8h
  loc_005FE032: mov var_18, al
  loc_005FE035: jmp 005FD853h
  loc_005FE03A: fwait
  loc_005FE03B: push 005FE078h
  loc_005FE040: jmp 005FE077h
  loc_005FE042: lea ecx, var_24
  loc_005FE045: call [004012ACh] ; __vbaFreeStr
  loc_005FE04B: lea ecx, var_2C
  loc_005FE04E: lea edx, var_28
  loc_005FE051: push ecx
  loc_005FE052: push edx
  loc_005FE053: push 00000002h
  loc_005FE055: call [00401040h] ; __vbaFreeObjList
  loc_005FE05B: lea eax, var_6C
  loc_005FE05E: lea ecx, var_5C
  loc_005FE061: push eax
  loc_005FE062: lea edx, var_4C
  loc_005FE065: push ecx
  loc_005FE066: lea eax, var_3C
  loc_005FE069: push edx
  loc_005FE06A: push eax
  loc_005FE06B: push 00000004h
  loc_005FE06D: call [00401038h] ; __vbaFreeVarList
  loc_005FE073: add esp, 00000020h
  loc_005FE076: ret
  loc_005FE077: ret
  loc_005FE078: mov ecx, var_10
  loc_005FE07B: pop edi
  loc_005FE07C: pop esi
  loc_005FE07D: xor eax, eax
  loc_005FE07F: mov fs:[00000000h], ecx
  loc_005FE086: pop ebx
  loc_005FE087: mov esp, ebp
  loc_005FE089: pop ebp
  loc_005FE08A: retn 0004h
End Sub

Private Sub Proc_26_9_5FE0C0() '5FE0C0
  loc_005FE0C0: push ebp
  loc_005FE0C1: mov ebp, esp
  loc_005FE0C3: sub esp, 00000008h
  loc_005FE0C6: push 00403B36h ; __vbaExceptHandler
  loc_005FE0CB: mov eax, fs:[00000000h]
  loc_005FE0D1: push eax
  loc_005FE0D2: mov fs:[00000000h], esp
  loc_005FE0D9: sub esp, 000000FCh
  loc_005FE0DF: push ebx
  loc_005FE0E0: push esi
  loc_005FE0E1: push edi
  loc_005FE0E2: mov var_8, esp
  loc_005FE0E5: mov var_4, 00403488h
  loc_005FE0EC: sub esp, 00000010h
  loc_005FE0EF: mov edx, [0061A13Ch]
  loc_005FE0F5: mov ebx, esp
  loc_005FE0F7: mov ecx, 0000000Ah
  loc_005FE0FC: mov var_C8, ecx
  loc_005FE102: xor edi, edi
  loc_005FE104: mov [ebx], ecx
  loc_005FE106: mov ecx, var_C4
  loc_005FE10C: mov eax, 80020004h
  loc_005FE111: mov var_2C, edi
  loc_005FE114: mov [ebx+00000004h], ecx
  loc_005FE117: mov var_30, edi
  loc_005FE11A: mov var_34, edi
  loc_005FE11D: mov var_38, edi
  loc_005FE120: mov var_48, edi
  loc_005FE123: mov var_58, edi
  loc_005FE126: mov var_68, edi
  loc_005FE129: mov var_78, edi
  loc_005FE12C: mov var_88, edi
  loc_005FE132: mov var_98, edi
  loc_005FE138: mov var_A8, edi
  loc_005FE13E: mov var_B8, edi
  loc_005FE144: mov var_D8, edi
  loc_005FE14A: mov var_E8, edi
  loc_005FE150: mov var_C0, eax
  loc_005FE156: mov esi, [edx]
  loc_005FE158: mov [ebx+00000008h], eax
  loc_005FE15B: mov eax, var_BC
  loc_005FE161: push 0042A9F8h ; "Delete * From TmpTotalWeek"
  loc_005FE166: push edx
  loc_005FE167: mov var_F8, edi
  loc_005FE16D: mov [ebx+0000000Ch], eax
  loc_005FE170: call [esi+0000005Ch]
  loc_005FE173: cmp eax, edi
  loc_005FE175: fnclex
  loc_005FE177: jge 005FE18Eh
  loc_005FE179: mov ecx, [0061A13Ch]
  loc_005FE17F: push 0000005Ch
  loc_005FE181: push 0041E928h
  loc_005FE186: push ecx
  loc_005FE187: push eax
  loc_005FE188: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE18E: mov esi, Me
  loc_005FE191: push edi
  loc_005FE192: push 00000014h
  loc_005FE194: push esi
  loc_005FE195: mov edx, [esi]
  loc_005FE197: call [edx+00000314h]
  loc_005FE19D: mov ebx, [004010A0h] ; __vbaObjSet
  loc_005FE1A3: push eax
  loc_005FE1A4: lea eax, var_34
  loc_005FE1A7: push eax
  loc_005FE1A8: call ebx
  loc_005FE1AA: lea ecx, var_48
  loc_005FE1AD: push eax
  loc_005FE1AE: push ecx
  loc_005FE1AF: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE1B5: add esp, 00000010h
  loc_005FE1B8: push eax
  loc_005FE1B9: call [004011B8h] ; __vbaDateVar
  loc_005FE1BF: lea ecx, var_34
  loc_005FE1C2: fstp st0
  loc_005FE1C4: call [004012B0h] ; __vbaFreeObj
  loc_005FE1CA: lea ecx, var_48
  loc_005FE1CD: call [00401020h] ; __vbaFreeVar
  loc_005FE1D3: mov edx, [esi]
  loc_005FE1D5: push esi
  loc_005FE1D6: call [edx+000002FCh]
  loc_005FE1DC: push eax
  loc_005FE1DD: lea eax, var_34
  loc_005FE1E0: push eax
  loc_005FE1E1: call ebx
  loc_005FE1E3: mov ecx, [eax]
  loc_005FE1E5: lea edx, var_2C
  loc_005FE1E8: push edx
  loc_005FE1E9: push eax
  loc_005FE1EA: mov var_FC, eax
  loc_005FE1F0: call [ecx+000000A8h]
  loc_005FE1F6: cmp eax, edi
  loc_005FE1F8: fnclex
  loc_005FE1FA: jge 005FE214h
  loc_005FE1FC: mov ecx, var_FC
  loc_005FE202: push 000000A8h
  loc_005FE207: push 0041F844h
  loc_005FE20C: push ecx
  loc_005FE20D: push eax
  loc_005FE20E: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE214: mov edx, var_2C
  loc_005FE217: push edx
  loc_005FE218: push 00432F64h ; "Full Day"
  loc_005FE21D: call [0040110Ch] ; __vbaStrCmp
  loc_005FE223: neg eax
  loc_005FE225: sbb eax, eax
  loc_005FE227: lea ecx, var_2C
  loc_005FE22A: inc eax
  loc_005FE22B: neg eax
  loc_005FE22D: mov var_104, ax
  loc_005FE234: call [004012ACh] ; __vbaFreeStr
  loc_005FE23A: lea ecx, var_34
  loc_005FE23D: call [004012B0h] ; __vbaFreeObj
  loc_005FE243: cmp var_104, di
  loc_005FE24A: jz 005FE8EAh
  loc_005FE250: mov eax, [esi]
  loc_005FE252: push edi
  loc_005FE253: push 00000014h
  loc_005FE255: push esi
  loc_005FE256: mov var_E0, 80020004h
  loc_005FE260: mov var_E8, 0000000Ah
  loc_005FE26A: mov var_C0, 0042AA34h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount='"
  loc_005FE274: mov var_C8, 00000008h
  loc_005FE27E: call [eax+00000314h]
  loc_005FE284: lea ecx, var_34
  loc_005FE287: push eax
  loc_005FE288: push ecx
  loc_005FE289: call ebx
  loc_005FE28B: lea edx, var_48
  loc_005FE28E: push eax
  loc_005FE28F: push edx
  loc_005FE290: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE296: add esp, 00000010h
  loc_005FE299: push eax
  loc_005FE29A: lea eax, var_58
  loc_005FE29D: push eax
  loc_005FE29E: call [004010D4h] ; rtcTrimVar
  loc_005FE2A4: mov ecx, [0061A13Ch]
  loc_005FE2AA: mov eax, var_E8
  loc_005FE2B0: sub esp, 00000010h
  loc_005FE2B3: mov var_D0, 00432F7Ch ; "' And AMPM='09:00' and Type1='S'"
  loc_005FE2BD: mov edx, esp
  loc_005FE2BF: mov var_D8, 00000008h
  loc_005FE2C9: mov ebx, [ecx]
  loc_005FE2CB: mov ecx, var_E4
  loc_005FE2D1: mov [edx], eax
  loc_005FE2D3: mov eax, var_E0
  loc_005FE2D9: mov edi, [004011B4h] ; __vbaVarCat
  loc_005FE2DF: mov [edx+00000004h], ecx
  loc_005FE2E2: mov ecx, var_DC
  loc_005FE2E8: mov [edx+00000008h], eax
  loc_005FE2EB: lea eax, var_58
  loc_005FE2EE: mov [edx+0000000Ch], ecx
  loc_005FE2F1: lea edx, var_C8
  loc_005FE2F7: push edx
  loc_005FE2F8: lea ecx, var_68
  loc_005FE2FB: push eax
  loc_005FE2FC: push ecx
  loc_005FE2FD: call edi
  loc_005FE2FF: push eax
  loc_005FE300: lea edx, var_D8
  loc_005FE306: lea eax, var_78
  loc_005FE309: push edx
  loc_005FE30A: push eax
  loc_005FE30B: call edi
  loc_005FE30D: lea ecx, var_2C
  loc_005FE310: push eax
  loc_005FE311: push ecx
  loc_005FE312: call [004011B0h] ; __vbaStrVarVal
  loc_005FE318: mov edx, [0061A13Ch]
  loc_005FE31E: push eax
  loc_005FE31F: push edx
  loc_005FE320: call [ebx+0000005Ch]
  loc_005FE323: test eax, eax
  loc_005FE325: fnclex
  loc_005FE327: jge 005FE33Eh
  loc_005FE329: mov ecx, [0061A13Ch]
  loc_005FE32F: push 0000005Ch
  loc_005FE331: push 0041E928h
  loc_005FE336: push ecx
  loc_005FE337: push eax
  loc_005FE338: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE33E: lea ecx, var_2C
  loc_005FE341: call [004012ACh] ; __vbaFreeStr
  loc_005FE347: lea ecx, var_34
  loc_005FE34A: call [004012B0h] ; __vbaFreeObj
  loc_005FE350: lea edx, var_78
  loc_005FE353: lea eax, var_68
  loc_005FE356: push edx
  loc_005FE357: lea ecx, var_58
  loc_005FE35A: push eax
  loc_005FE35B: lea edx, var_48
  loc_005FE35E: push ecx
  loc_005FE35F: push edx
  loc_005FE360: push 00000004h
  loc_005FE362: call [00401038h] ; __vbaFreeVarList
  loc_005FE368: mov eax, [esi]
  loc_005FE36A: add esp, 00000014h
  loc_005FE36D: mov ebx, 00000008h
  loc_005FE372: mov var_E0, 80020004h
  loc_005FE37C: push 00000000h
  loc_005FE37E: push 00000014h
  loc_005FE380: push esi
  loc_005FE381: mov var_E8, 0000000Ah
  loc_005FE38B: mov var_C0, 0042AD14h ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount='"
  loc_005FE395: mov var_C8, ebx
  loc_005FE39B: call [eax+00000314h]
  loc_005FE3A1: lea ecx, var_34
  loc_005FE3A4: push eax
  loc_005FE3A5: push ecx
  loc_005FE3A6: call [004010A0h] ; __vbaObjSet
  loc_005FE3AC: lea edx, var_48
  loc_005FE3AF: push eax
  loc_005FE3B0: push edx
  loc_005FE3B1: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE3B7: add esp, 00000010h
  loc_005FE3BA: push eax
  loc_005FE3BB: lea eax, var_58
  loc_005FE3BE: push eax
  loc_005FE3BF: call [004010D4h] ; rtcTrimVar
  loc_005FE3C5: mov ecx, [0061A13Ch]
  loc_005FE3CB: mov eax, var_E8
  loc_005FE3D1: sub esp, 00000010h
  loc_005FE3D4: mov var_D0, 00432FC4h ; "' And AMPM='12:00' and Type1='S'"
  loc_005FE3DE: mov edx, esp
  loc_005FE3E0: mov var_D8, ebx
  loc_005FE3E6: mov ebx, [ecx]
  loc_005FE3E8: mov ecx, var_E4
  loc_005FE3EE: mov [edx], eax
  loc_005FE3F0: mov eax, var_E0
  loc_005FE3F6: mov [edx+00000004h], ecx
  loc_005FE3F9: mov ecx, var_DC
  loc_005FE3FF: mov [edx+00000008h], eax
  loc_005FE402: lea eax, var_58
  loc_005FE405: mov [edx+0000000Ch], ecx
  loc_005FE408: lea edx, var_C8
  loc_005FE40E: push edx
  loc_005FE40F: lea ecx, var_68
  loc_005FE412: push eax
  loc_005FE413: push ecx
  loc_005FE414: call edi
  loc_005FE416: push eax
  loc_005FE417: lea edx, var_D8
  loc_005FE41D: lea eax, var_78
  loc_005FE420: push edx
  loc_005FE421: push eax
  loc_005FE422: call edi
  loc_005FE424: lea ecx, var_2C
  loc_005FE427: push eax
  loc_005FE428: push ecx
  loc_005FE429: call [004011B0h] ; __vbaStrVarVal
  loc_005FE42F: mov edx, [0061A13Ch]
  loc_005FE435: push eax
  loc_005FE436: push edx
  loc_005FE437: call [ebx+0000005Ch]
  loc_005FE43A: test eax, eax
  loc_005FE43C: fnclex
  loc_005FE43E: jge 005FE455h
  loc_005FE440: mov ecx, [0061A13Ch]
  loc_005FE446: push 0000005Ch
  loc_005FE448: push 0041E928h
  loc_005FE44D: push ecx
  loc_005FE44E: push eax
  loc_005FE44F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE455: lea ecx, var_2C
  loc_005FE458: call [004012ACh] ; __vbaFreeStr
  loc_005FE45E: lea ecx, var_34
  loc_005FE461: call [004012B0h] ; __vbaFreeObj
  loc_005FE467: lea edx, var_78
  loc_005FE46A: lea eax, var_68
  loc_005FE46D: push edx
  loc_005FE46E: lea ecx, var_58
  loc_005FE471: push eax
  loc_005FE472: lea edx, var_48
  loc_005FE475: push ecx
  loc_005FE476: push edx
  loc_005FE477: push 00000004h
  loc_005FE479: call [00401038h] ; __vbaFreeVarList
  loc_005FE47F: mov eax, [esi]
  loc_005FE481: add esp, 00000014h
  loc_005FE484: mov ebx, 00000008h
  loc_005FE489: mov var_E0, 80020004h
  loc_005FE493: push 00000000h
  loc_005FE495: push 00000014h
  loc_005FE497: push esi
  loc_005FE498: mov var_E8, 0000000Ah
  loc_005FE4A2: mov var_C0, 0042B0E8h ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount='"
  loc_005FE4AC: mov var_C8, ebx
  loc_005FE4B2: call [eax+00000314h]
  loc_005FE4B8: lea ecx, var_34
  loc_005FE4BB: push eax
  loc_005FE4BC: push ecx
  loc_005FE4BD: call [004010A0h] ; __vbaObjSet
  loc_005FE4C3: lea edx, var_48
  loc_005FE4C6: push eax
  loc_005FE4C7: push edx
  loc_005FE4C8: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE4CE: add esp, 00000010h
  loc_005FE4D1: push eax
  loc_005FE4D2: lea eax, var_58
  loc_005FE4D5: push eax
  loc_005FE4D6: call [004010D4h] ; rtcTrimVar
  loc_005FE4DC: mov ecx, [0061A13Ch]
  loc_005FE4E2: mov eax, var_E8
  loc_005FE4E8: sub esp, 00000010h
  loc_005FE4EB: mov var_D0, 00432D8Ch ; "' And AMPM='04:00' and Type1='S'"
  loc_005FE4F5: mov edx, esp
  loc_005FE4F7: mov var_D8, ebx
  loc_005FE4FD: mov ebx, [ecx]
  loc_005FE4FF: mov ecx, var_E4
  loc_005FE505: mov [edx], eax
  loc_005FE507: mov eax, var_E0
  loc_005FE50D: mov [edx+00000004h], ecx
  loc_005FE510: mov ecx, var_DC
  loc_005FE516: mov [edx+00000008h], eax
  loc_005FE519: lea eax, var_58
  loc_005FE51C: mov [edx+0000000Ch], ecx
  loc_005FE51F: lea edx, var_C8
  loc_005FE525: push edx
  loc_005FE526: lea ecx, var_68
  loc_005FE529: push eax
  loc_005FE52A: push ecx
  loc_005FE52B: call edi
  loc_005FE52D: push eax
  loc_005FE52E: lea edx, var_D8
  loc_005FE534: lea eax, var_78
  loc_005FE537: push edx
  loc_005FE538: push eax
  loc_005FE539: call edi
  loc_005FE53B: lea ecx, var_2C
  loc_005FE53E: push eax
  loc_005FE53F: push ecx
  loc_005FE540: call [004011B0h] ; __vbaStrVarVal
  loc_005FE546: mov edx, [0061A13Ch]
  loc_005FE54C: push eax
  loc_005FE54D: push edx
  loc_005FE54E: call [ebx+0000005Ch]
  loc_005FE551: test eax, eax
  loc_005FE553: fnclex
  loc_005FE555: jge 005FE56Ch
  loc_005FE557: mov ecx, [0061A13Ch]
  loc_005FE55D: push 0000005Ch
  loc_005FE55F: push 0041E928h
  loc_005FE564: push ecx
  loc_005FE565: push eax
  loc_005FE566: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE56C: lea ecx, var_2C
  loc_005FE56F: call [004012ACh] ; __vbaFreeStr
  loc_005FE575: lea ecx, var_34
  loc_005FE578: call [004012B0h] ; __vbaFreeObj
  loc_005FE57E: lea edx, var_78
  loc_005FE581: lea eax, var_68
  loc_005FE584: push edx
  loc_005FE585: lea ecx, var_58
  loc_005FE588: push eax
  loc_005FE589: lea edx, var_48
  loc_005FE58C: push ecx
  loc_005FE58D: push edx
  loc_005FE58E: push 00000004h
  loc_005FE590: call [00401038h] ; __vbaFreeVarList
  loc_005FE596: mov eax, [esi]
  loc_005FE598: add esp, 00000014h
  loc_005FE59B: mov ebx, 00000008h
  loc_005FE5A0: mov var_E0, 80020004h
  loc_005FE5AA: push 00000000h
  loc_005FE5AC: push 00000014h
  loc_005FE5AE: push esi
  loc_005FE5AF: mov var_E8, 0000000Ah
  loc_005FE5B9: mov var_C0, 00433224h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount,'P' From TotalPLG Where OnCount='"
  loc_005FE5C3: mov var_C8, ebx
  loc_005FE5C9: call [eax+00000314h]
  loc_005FE5CF: lea ecx, var_34
  loc_005FE5D2: push eax
  loc_005FE5D3: push ecx
  loc_005FE5D4: call [004010A0h] ; __vbaObjSet
  loc_005FE5DA: lea edx, var_48
  loc_005FE5DD: push eax
  loc_005FE5DE: push edx
  loc_005FE5DF: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE5E5: add esp, 00000010h
  loc_005FE5E8: push eax
  loc_005FE5E9: lea eax, var_58
  loc_005FE5EC: push eax
  loc_005FE5ED: call [004010D4h] ; rtcTrimVar
  loc_005FE5F3: mov ecx, [0061A13Ch]
  loc_005FE5F9: mov eax, var_E8
  loc_005FE5FF: sub esp, 00000010h
  loc_005FE602: mov var_D0, 0043332Ch ; "' And AMPM='09:00' and Type1='P'"
  loc_005FE60C: mov edx, esp
  loc_005FE60E: mov var_D8, ebx
  loc_005FE614: mov ebx, [ecx]
  loc_005FE616: mov ecx, var_E4
  loc_005FE61C: mov [edx], eax
  loc_005FE61E: mov eax, var_E0
  loc_005FE624: mov [edx+00000004h], ecx
  loc_005FE627: mov ecx, var_DC
  loc_005FE62D: mov [edx+00000008h], eax
  loc_005FE630: lea eax, var_58
  loc_005FE633: mov [edx+0000000Ch], ecx
  loc_005FE636: lea edx, var_C8
  loc_005FE63C: push edx
  loc_005FE63D: lea ecx, var_68
  loc_005FE640: push eax
  loc_005FE641: push ecx
  loc_005FE642: call edi
  loc_005FE644: push eax
  loc_005FE645: lea edx, var_D8
  loc_005FE64B: lea eax, var_78
  loc_005FE64E: push edx
  loc_005FE64F: push eax
  loc_005FE650: call edi
  loc_005FE652: lea ecx, var_2C
  loc_005FE655: push eax
  loc_005FE656: push ecx
  loc_005FE657: call [004011B0h] ; __vbaStrVarVal
  loc_005FE65D: mov edx, [0061A13Ch]
  loc_005FE663: push eax
  loc_005FE664: push edx
  loc_005FE665: call [ebx+0000005Ch]
  loc_005FE668: test eax, eax
  loc_005FE66A: fnclex
  loc_005FE66C: jge 005FE683h
  loc_005FE66E: mov ecx, [0061A13Ch]
  loc_005FE674: push 0000005Ch
  loc_005FE676: push 0041E928h
  loc_005FE67B: push ecx
  loc_005FE67C: push eax
  loc_005FE67D: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE683: lea ecx, var_2C
  loc_005FE686: call [004012ACh] ; __vbaFreeStr
  loc_005FE68C: lea ecx, var_34
  loc_005FE68F: call [004012B0h] ; __vbaFreeObj
  loc_005FE695: lea edx, var_78
  loc_005FE698: lea eax, var_68
  loc_005FE69B: push edx
  loc_005FE69C: lea ecx, var_58
  loc_005FE69F: push eax
  loc_005FE6A0: lea edx, var_48
  loc_005FE6A3: push ecx
  loc_005FE6A4: push edx
  loc_005FE6A5: push 00000004h
  loc_005FE6A7: call [00401038h] ; __vbaFreeVarList
  loc_005FE6AD: mov eax, [esi]
  loc_005FE6AF: add esp, 00000014h
  loc_005FE6B2: mov ebx, 00000008h
  loc_005FE6B7: mov var_E0, 80020004h
  loc_005FE6C1: push 00000000h
  loc_005FE6C3: push 00000014h
  loc_005FE6C5: push esi
  loc_005FE6C6: mov var_E8, 0000000Ah
  loc_005FE6D0: mov var_C0, 00433408h ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2,Type1) Select AgentName,TotalAmount,LuckyAmount,'P' From TotalPLG Where OnCount='"
  loc_005FE6DA: mov var_C8, ebx
  loc_005FE6E0: call [eax+00000314h]
  loc_005FE6E6: lea ecx, var_34
  loc_005FE6E9: push eax
  loc_005FE6EA: push ecx
  loc_005FE6EB: call [004010A0h] ; __vbaObjSet
  loc_005FE6F1: lea edx, var_48
  loc_005FE6F4: push eax
  loc_005FE6F5: push edx
  loc_005FE6F6: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE6FC: add esp, 00000010h
  loc_005FE6FF: push eax
  loc_005FE700: lea eax, var_58
  loc_005FE703: push eax
  loc_005FE704: call [004010D4h] ; rtcTrimVar
  loc_005FE70A: mov ecx, [0061A13Ch]
  loc_005FE710: mov eax, var_E8
  loc_005FE716: sub esp, 00000010h
  loc_005FE719: mov var_D0, 00433510h ; "' And AMPM='12:00' and Type1='P'"
  loc_005FE723: mov edx, esp
  loc_005FE725: mov var_D8, ebx
  loc_005FE72B: mov ebx, [ecx]
  loc_005FE72D: mov ecx, var_E4
  loc_005FE733: mov [edx], eax
  loc_005FE735: mov eax, var_E0
  loc_005FE73B: mov [edx+00000004h], ecx
  loc_005FE73E: mov ecx, var_DC
  loc_005FE744: mov [edx+00000008h], eax
  loc_005FE747: lea eax, var_58
  loc_005FE74A: mov [edx+0000000Ch], ecx
  loc_005FE74D: lea edx, var_C8
  loc_005FE753: push edx
  loc_005FE754: lea ecx, var_68
  loc_005FE757: push eax
  loc_005FE758: push ecx
  loc_005FE759: call edi
  loc_005FE75B: push eax
  loc_005FE75C: lea edx, var_D8
  loc_005FE762: lea eax, var_78
  loc_005FE765: push edx
  loc_005FE766: push eax
  loc_005FE767: call edi
  loc_005FE769: lea ecx, var_2C
  loc_005FE76C: push eax
  loc_005FE76D: push ecx
  loc_005FE76E: call [004011B0h] ; __vbaStrVarVal
  loc_005FE774: mov edx, [0061A13Ch]
  loc_005FE77A: push eax
  loc_005FE77B: push edx
  loc_005FE77C: call [ebx+0000005Ch]
  loc_005FE77F: test eax, eax
  loc_005FE781: fnclex
  loc_005FE783: jge 005FE79Ah
  loc_005FE785: mov ecx, [0061A13Ch]
  loc_005FE78B: push 0000005Ch
  loc_005FE78D: push 0041E928h
  loc_005FE792: push ecx
  loc_005FE793: push eax
  loc_005FE794: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE79A: lea ecx, var_2C
  loc_005FE79D: call [004012ACh] ; __vbaFreeStr
  loc_005FE7A3: lea ecx, var_34
  loc_005FE7A6: call [004012B0h] ; __vbaFreeObj
  loc_005FE7AC: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_005FE7B2: lea edx, var_78
  loc_005FE7B5: lea eax, var_68
  loc_005FE7B8: push edx
  loc_005FE7B9: lea ecx, var_58
  loc_005FE7BC: push eax
  loc_005FE7BD: lea edx, var_48
  loc_005FE7C0: push ecx
  loc_005FE7C1: push edx
  loc_005FE7C2: push 00000004h
  loc_005FE7C4: call ebx
  loc_005FE7C6: mov eax, [esi]
  loc_005FE7C8: add esp, 00000014h
  loc_005FE7CB: mov var_E0, 80020004h
  loc_005FE7D5: mov var_E8, 0000000Ah
  loc_005FE7DF: push 00000000h
  loc_005FE7E1: push 00000014h
  loc_005FE7E3: push esi
  loc_005FE7E4: mov var_C0, 004335ECh ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3,Type1) Select AgentName,TotalAmount,LuckyAmount,'P' From TotalPLG Where OnCount='"
  loc_005FE7EE: mov var_C8, 00000008h
  loc_005FE7F8: call [eax+00000314h]
  loc_005FE7FE: lea ecx, var_34
  loc_005FE801: push eax
  loc_005FE802: push ecx
  loc_005FE803: call [004010A0h] ; __vbaObjSet
  loc_005FE809: lea edx, var_48
  loc_005FE80C: push eax
  loc_005FE80D: push edx
  loc_005FE80E: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE814: add esp, 00000010h
  loc_005FE817: push eax
  loc_005FE818: lea eax, var_58
  loc_005FE81B: push eax
  loc_005FE81C: call [004010D4h] ; rtcTrimVar
  loc_005FE822: mov ecx, [0061A13Ch]
  loc_005FE828: mov eax, var_E8
  loc_005FE82E: sub esp, 00000010h
  loc_005FE831: mov var_D0, 004336F4h ; "' And AMPM='04:00' and Type1='P'"
  loc_005FE83B: mov edx, esp
  loc_005FE83D: mov var_D8, 00000008h
  loc_005FE847: mov esi, [ecx]
  loc_005FE849: mov ecx, var_E4
  loc_005FE84F: mov [edx], eax
  loc_005FE851: mov eax, var_E0
  loc_005FE857: mov [edx+00000004h], ecx
  loc_005FE85A: mov ecx, var_DC
  loc_005FE860: mov [edx+00000008h], eax
  loc_005FE863: lea eax, var_58
  loc_005FE866: mov [edx+0000000Ch], ecx
  loc_005FE869: lea edx, var_C8
  loc_005FE86F: push edx
  loc_005FE870: lea ecx, var_68
  loc_005FE873: push eax
  loc_005FE874: push ecx
  loc_005FE875: call edi
  loc_005FE877: push eax
  loc_005FE878: lea edx, var_D8
  loc_005FE87E: lea eax, var_78
  loc_005FE881: push edx
  loc_005FE882: push eax
  loc_005FE883: call edi
  loc_005FE885: lea ecx, var_2C
  loc_005FE888: push eax
  loc_005FE889: push ecx
  loc_005FE88A: call [004011B0h] ; __vbaStrVarVal
  loc_005FE890: mov edx, [0061A13Ch]
  loc_005FE896: push eax
  loc_005FE897: push edx
  loc_005FE898: call [esi+0000005Ch]
  loc_005FE89B: test eax, eax
  loc_005FE89D: fnclex
  loc_005FE89F: jge 005FE8B6h
  loc_005FE8A1: mov ecx, [0061A13Ch]
  loc_005FE8A7: push 0000005Ch
  loc_005FE8A9: push 0041E928h
  loc_005FE8AE: push ecx
  loc_005FE8AF: push eax
  loc_005FE8B0: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE8B6: lea ecx, var_2C
  loc_005FE8B9: call [004012ACh] ; __vbaFreeStr
  loc_005FE8BF: lea ecx, var_34
  loc_005FE8C2: call [004012B0h] ; __vbaFreeObj
  loc_005FE8C8: lea edx, var_78
  loc_005FE8CB: lea eax, var_68
  loc_005FE8CE: push edx
  loc_005FE8CF: lea ecx, var_58
  loc_005FE8D2: push eax
  loc_005FE8D3: lea edx, var_48
  loc_005FE8D6: push ecx
  loc_005FE8D7: push edx
  loc_005FE8D8: push 00000004h
  loc_005FE8DA: call ebx
  loc_005FE8DC: add esp, 00000014h
  loc_005FE8DF: fwait
  loc_005FE8E0: push 005FEC98h
  loc_005FE8E5: jmp 005FEC97h
  loc_005FE8EA: mov eax, [esi]
  loc_005FE8EC: push edi
  loc_005FE8ED: push 00000014h
  loc_005FE8EF: push esi
  loc_005FE8F0: mov var_F0, 80020004h
  loc_005FE8FA: mov var_F8, 0000000Ah
  loc_005FE904: mov var_C0, 0042AA34h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount,'S' From TotalPLG Where OnCount='"
  loc_005FE90E: mov var_C8, 00000008h
  loc_005FE918: call [eax+00000314h]
  loc_005FE91E: lea ecx, var_34
  loc_005FE921: push eax
  loc_005FE922: push ecx
  loc_005FE923: call ebx
  loc_005FE925: lea edx, var_48
  loc_005FE928: push eax
  loc_005FE929: push edx
  loc_005FE92A: call [00401140h] ; __vbaLateIdCallLd
  loc_005FE930: add esp, 00000010h
  loc_005FE933: push eax
  loc_005FE934: lea eax, var_58
  loc_005FE937: push eax
  loc_005FE938: call [004010D4h] ; rtcTrimVar
  loc_005FE93E: mov ecx, [esi]
  loc_005FE940: push esi
  loc_005FE941: mov var_D0, 0041ECD0h ; "' And AMPM='"
  loc_005FE94B: mov var_D8, 00000008h
  loc_005FE955: call [ecx+000002FCh]
  loc_005FE95B: lea edx, var_38
  loc_005FE95E: push eax
  loc_005FE95F: push edx
  loc_005FE960: call ebx
  loc_005FE962: mov ebx, eax
  loc_005FE964: lea ecx, var_2C
  loc_005FE967: push ecx
  loc_005FE968: push ebx
  loc_005FE969: mov eax, [ebx]
  loc_005FE96B: call [eax+000000A8h]
  loc_005FE971: cmp eax, edi
  loc_005FE973: fnclex
  loc_005FE975: jge 005FE989h
  loc_005FE977: push 000000A8h
  loc_005FE97C: push 0041F844h
  loc_005FE981: push ebx
  loc_005FE982: push eax
  loc_005FE983: call [00401074h] ; __vbaHresultCheckObj
  loc_005FE989: mov eax, var_2C
  loc_005FE98C: lea edx, var_88
  loc_005FE992: mov var_80, eax
  loc_005FE995: mov var_2C, edi
  loc_005FE998: lea eax, var_98
  loc_005FE99E: mov edi, 00000008h
  loc_005FE9A3: push edx
  loc_005FE9A4: push eax
  loc_005FE9A5: mov var_88, edi
  loc_005FE9AB: call [004010D4h] ; rtcTrimVar
  loc_005FE9B1: mov ecx, [0061A13Ch]
  loc_005FE9B7: mov eax, var_F8
  loc_005FE9BD: sub esp, 00000010h
  loc_005FE9C0: mov var_E0, 0043373Ch ; "' and Type1='S'"
  loc_005FE9CA: mov edx, esp
  loc_005FE9CC: mov var_E8, edi
  loc_005FE9D2: mov ebx, [ecx]
  loc_005FE9D4: mov ecx, var_F4
  loc_005FE9DA: mov [edx], eax
  loc_005FE9DC: mov eax, var_F0
  loc_005FE9E2: mov edi, [004011B4h] ; __vbaVarCat
  loc_005FE9E8: mov [edx+00000004h], ecx
  loc_005FE9EB: mov ecx, var_EC
  loc_005FE9F1: mov [edx+00000008h], eax
  loc_005FE9F4: lea eax, var_58
  loc_005FE9F7: mov [edx+0000000Ch], ecx
  loc_005FE9FA: lea edx, var_C8
  loc_005FEA00: push edx
  loc_005FEA01: lea ecx, var_68
  loc_005FEA04: push eax
  loc_005FEA05: push ecx
  loc_005FEA06: call edi
  loc_005FEA08: push eax
  loc_005FEA09: lea edx, var_D8
  loc_005FEA0F: lea eax, var_78
  loc_005FEA12: push edx
  loc_005FEA13: push eax
  loc_005FEA14: call edi
  loc_005FEA16: lea ecx, var_98
  loc_005FEA1C: push eax
  loc_005FEA1D: lea edx, var_A8
  loc_005FEA23: push ecx
  loc_005FEA24: push edx
  loc_005FEA25: call edi
  loc_005FEA27: push eax
  loc_005FEA28: lea eax, var_E8
  loc_005FEA2E: lea ecx, var_B8
  loc_005FEA34: push eax
  loc_005FEA35: push ecx
  loc_005FEA36: call edi
  loc_005FEA38: lea edx, var_30
  loc_005FEA3B: push eax
  loc_005FEA3C: push edx
  loc_005FEA3D: call [004011B0h] ; __vbaStrVarVal
  loc_005FEA43: push eax
  loc_005FEA44: mov eax, [0061A13Ch]
  loc_005FEA49: push eax
  loc_005FEA4A: call [ebx+0000005Ch]
  loc_005FEA4D: test eax, eax
  loc_005FEA4F: fnclex
  loc_005FEA51: jge 005FEA68h
  loc_005FEA53: mov ecx, [0061A13Ch]
  loc_005FEA59: push 0000005Ch
  loc_005FEA5B: push 0041E928h
  loc_005FEA60: push ecx
  loc_005FEA61: push eax
  loc_005FEA62: call [00401074h] ; __vbaHresultCheckObj
  loc_005FEA68: lea ecx, var_30
  loc_005FEA6B: call [004012ACh] ; __vbaFreeStr
  loc_005FEA71: lea edx, var_38
  loc_005FEA74: lea eax, var_34
  loc_005FEA77: push edx
  loc_005FEA78: push eax
  loc_005FEA79: push 00000002h
  loc_005FEA7B: call [00401040h] ; __vbaFreeObjList
  loc_005FEA81: lea ecx, var_B8
  loc_005FEA87: lea edx, var_A8
  loc_005FEA8D: push ecx
  loc_005FEA8E: lea eax, var_98
  loc_005FEA94: push edx
  loc_005FEA95: lea ecx, var_78
  loc_005FEA98: push eax
  loc_005FEA99: lea edx, var_88
  loc_005FEA9F: push ecx
  loc_005FEAA0: lea eax, var_68
  loc_005FEAA3: push edx
  loc_005FEAA4: lea ecx, var_58
  loc_005FEAA7: push eax
  loc_005FEAA8: lea edx, var_48
  loc_005FEAAB: push ecx
  loc_005FEAAC: push edx
  loc_005FEAAD: push 00000008h
  loc_005FEAAF: call [00401038h] ; __vbaFreeVarList
  loc_005FEAB5: mov eax, [esi]
  loc_005FEAB7: add esp, 00000030h
  loc_005FEABA: mov ebx, 80020004h
  loc_005FEABF: mov var_C0, 00433224h ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1,Type1) Select AgentName,TotalAmount,LuckyAmount,'P' From TotalPLG Where OnCount='"
  loc_005FEAC9: push 00000000h
  loc_005FEACB: push 00000014h
  loc_005FEACD: push esi
  loc_005FEACE: mov var_C8, 00000008h
  loc_005FEAD8: call [eax+00000314h]
  loc_005FEADE: lea ecx, var_34
  loc_005FEAE1: push eax
  loc_005FEAE2: push ecx
  loc_005FEAE3: call [004010A0h] ; __vbaObjSet
  loc_005FEAE9: lea edx, var_48
  loc_005FEAEC: push eax
  loc_005FEAED: push edx
  loc_005FEAEE: call [00401140h] ; __vbaLateIdCallLd
  loc_005FEAF4: add esp, 00000010h
  loc_005FEAF7: push eax
  loc_005FEAF8: lea eax, var_58
  loc_005FEAFB: push eax
  loc_005FEAFC: call [004010D4h] ; rtcTrimVar
  loc_005FEB02: mov ecx, [esi]
  loc_005FEB04: push esi
  loc_005FEB05: mov var_D0, 0041ECD0h ; "' And AMPM='"
  loc_005FEB0F: mov var_D8, 00000008h
  loc_005FEB19: call [ecx+000002FCh]
  loc_005FEB1F: mov var_80, eax
  loc_005FEB22: lea edx, var_88
  loc_005FEB28: lea eax, var_98
  loc_005FEB2E: push edx
  loc_005FEB2F: push eax
  loc_005FEB30: mov var_88, 00000009h
  loc_005FEB3A: call [004010D4h] ; rtcTrimVar
  loc_005FEB40: mov ecx, [0061A13Ch]
  loc_005FEB46: sub esp, 00000010h
  loc_005FEB49: mov edx, esp
  loc_005FEB4B: mov eax, 0000000Ah
  loc_005FEB50: mov var_E0, 0042FE10h ; "' and Type1='P'"
  loc_005FEB5A: mov var_E8, 00000008h
  loc_005FEB64: mov esi, [ecx]
  loc_005FEB66: mov ecx, var_EC
  loc_005FEB6C: mov [edx], eax
  loc_005FEB6E: mov eax, var_F4
  loc_005FEB74: mov [edx+00000004h], eax
  loc_005FEB77: lea eax, var_58
  loc_005FEB7A: mov [edx+00000008h], ebx
  loc_005FEB7D: mov [edx+0000000Ch], ecx
  loc_005FEB80: lea edx, var_C8
  loc_005FEB86: push edx
  loc_005FEB87: lea ecx, var_68
  loc_005FEB8A: push eax
  loc_005FEB8B: push ecx
  loc_005FEB8C: call edi
  loc_005FEB8E: push eax
  loc_005FEB8F: lea edx, var_D8
  loc_005FEB95: lea eax, var_78
  loc_005FEB98: push edx
  loc_005FEB99: push eax
  loc_005FEB9A: call edi
  loc_005FEB9C: lea ecx, var_98
  loc_005FEBA2: push eax
  loc_005FEBA3: lea edx, var_A8
  loc_005FEBA9: push ecx
  loc_005FEBAA: push edx
  loc_005FEBAB: call edi
  loc_005FEBAD: push eax
  loc_005FEBAE: lea eax, var_E8
  loc_005FEBB4: lea ecx, var_B8
  loc_005FEBBA: push eax
  loc_005FEBBB: push ecx
  loc_005FEBBC: call edi
  loc_005FEBBE: lea edx, var_2C
  loc_005FEBC1: push eax
  loc_005FEBC2: push edx
  loc_005FEBC3: call [004011B0h] ; __vbaStrVarVal
  loc_005FEBC9: push eax
  loc_005FEBCA: mov eax, [0061A13Ch]
  loc_005FEBCF: push eax
  loc_005FEBD0: call [esi+0000005Ch]
  loc_005FEBD3: test eax, eax
  loc_005FEBD5: fnclex
  loc_005FEBD7: jge 005FEBEEh
  loc_005FEBD9: mov ecx, [0061A13Ch]
  loc_005FEBDF: push 0000005Ch
  loc_005FEBE1: push 0041E928h
  loc_005FEBE6: push ecx
  loc_005FEBE7: push eax
  loc_005FEBE8: call [00401074h] ; __vbaHresultCheckObj
  loc_005FEBEE: lea ecx, var_2C
  loc_005FEBF1: call [004012ACh] ; __vbaFreeStr
  loc_005FEBF7: lea ecx, var_34
  loc_005FEBFA: call [004012B0h] ; __vbaFreeObj
  loc_005FEC00: lea edx, var_B8
  loc_005FEC06: lea eax, var_A8
  loc_005FEC0C: push edx
  loc_005FEC0D: lea ecx, var_98
  loc_005FEC13: push eax
  loc_005FEC14: lea edx, var_78
  loc_005FEC17: push ecx
  loc_005FEC18: lea eax, var_88
  loc_005FEC1E: push edx
  loc_005FEC1F: lea ecx, var_68
  loc_005FEC22: push eax
  loc_005FEC23: lea edx, var_58
  loc_005FEC26: push ecx
  loc_005FEC27: lea eax, var_48
  loc_005FEC2A: push edx
  loc_005FEC2B: push eax
  loc_005FEC2C: push 00000008h
  loc_005FEC2E: call [00401038h] ; __vbaFreeVarList
  loc_005FEC34: add esp, 00000024h
  loc_005FEC37: fwait
  loc_005FEC38: push 005FEC98h
  loc_005FEC3D: jmp 005FEC97h
  loc_005FEC3F: lea ecx, var_30
  loc_005FEC42: lea edx, var_2C
  loc_005FEC45: push ecx
  loc_005FEC46: push edx
  loc_005FEC47: push 00000002h
  loc_005FEC49: call [004011FCh] ; __vbaFreeStrList
  loc_005FEC4F: lea eax, var_38
  loc_005FEC52: lea ecx, var_34
  loc_005FEC55: push eax
  loc_005FEC56: push ecx
  loc_005FEC57: push 00000002h
  loc_005FEC59: call [00401040h] ; __vbaFreeObjList
  loc_005FEC5F: lea edx, var_B8
  loc_005FEC65: lea eax, var_A8
  loc_005FEC6B: push edx
  loc_005FEC6C: lea ecx, var_98
  loc_005FEC72: push eax
  loc_005FEC73: lea edx, var_88
  loc_005FEC79: push ecx
  loc_005FEC7A: lea eax, var_78
  loc_005FEC7D: push edx
  loc_005FEC7E: lea ecx, var_68
  loc_005FEC81: push eax
  loc_005FEC82: lea edx, var_58
  loc_005FEC85: push ecx
  loc_005FEC86: lea eax, var_48
  loc_005FEC89: push edx
  loc_005FEC8A: push eax
  loc_005FEC8B: push 00000008h
  loc_005FEC8D: call [00401038h] ; __vbaFreeVarList
  loc_005FEC93: add esp, 0000003Ch
  loc_005FEC96: ret
  loc_005FEC97: ret
  loc_005FEC98: mov ecx, var_10
  loc_005FEC9B: pop edi
  loc_005FEC9C: pop esi
  loc_005FEC9D: xor eax, eax
  loc_005FEC9F: mov fs:[00000000h], ecx
  loc_005FECA6: pop ebx
  loc_005FECA7: mov esp, ebp
  loc_005FECA9: pop ebp
  loc_005FECAA: retn 0004h
End Sub

Private Sub Proc_26_10_5FECB0() '5FECB0
  loc_005FECB0: push ebp
  loc_005FECB1: mov ebp, esp
  loc_005FECB3: sub esp, 00000008h
  loc_005FECB6: push 00403B36h ; __vbaExceptHandler
  loc_005FECBB: mov eax, fs:[00000000h]
  loc_005FECC1: push eax
  loc_005FECC2: mov fs:[00000000h], esp
  loc_005FECC9: sub esp, 000000C4h
  loc_005FECCF: push ebx
  loc_005FECD0: push esi
  loc_005FECD1: push edi
  loc_005FECD2: mov var_8, esp
  loc_005FECD5: mov var_4, 00403498h
  loc_005FECDC: sub esp, 00000010h
  loc_005FECDF: mov edx, [0061A13Ch]
  loc_005FECE5: mov edi, esp
  loc_005FECE7: mov ecx, 0000000Ah
  loc_005FECEC: mov var_70, ecx
  loc_005FECEF: xor ebx, ebx
  loc_005FECF1: mov [edi], ecx
  loc_005FECF3: mov ecx, var_6C
  loc_005FECF6: mov eax, 80020004h
  loc_005FECFB: mov var_1C, ebx
  loc_005FECFE: mov [edi+00000004h], ecx
  loc_005FED01: mov var_20, ebx
  loc_005FED04: mov var_24, ebx
  loc_005FED07: mov var_28, ebx
  loc_005FED0A: mov var_2C, ebx
  loc_005FED0D: mov var_30, ebx
  loc_005FED10: mov var_40, ebx
  loc_005FED13: mov var_50, ebx
  loc_005FED16: mov var_60, ebx
  loc_005FED19: mov var_80, ebx
  loc_005FED1C: mov var_90, ebx
  loc_005FED22: mov var_68, eax
  loc_005FED25: mov esi, [edx]
  loc_005FED27: mov [edi+00000008h], eax
  loc_005FED2A: mov eax, var_64
  loc_005FED2D: push 0042A9F8h ; "Delete * From TmpTotalWeek"
  loc_005FED32: push edx
  loc_005FED33: mov var_A0, ebx
  loc_005FED39: mov [edi+0000000Ch], eax
  loc_005FED3C: call [esi+0000005Ch]
  loc_005FED3F: cmp eax, ebx
  loc_005FED41: fnclex
  loc_005FED43: jge 005FED5Ah
  loc_005FED45: mov ecx, [0061A13Ch]
  loc_005FED4B: push 0000005Ch
  loc_005FED4D: push 0041E928h
  loc_005FED52: push ecx
  loc_005FED53: push eax
  loc_005FED54: call [00401074h] ; __vbaHresultCheckObj
  loc_005FED5A: mov esi, Me
  loc_005FED5D: push ebx
  loc_005FED5E: push 00000014h
  loc_005FED60: push esi
  loc_005FED61: mov edx, [esi]
  loc_005FED63: call [edx+00000314h]
  loc_005FED69: push eax
  loc_005FED6A: lea eax, var_2C
  loc_005FED6D: push eax
  loc_005FED6E: call [004010A0h] ; __vbaObjSet
  loc_005FED74: mov edi, [00401140h] ; __vbaLateIdCallLd
  loc_005FED7A: lea ecx, var_40
  loc_005FED7D: push eax
  loc_005FED7E: push ecx
  loc_005FED7F: call edi
  loc_005FED81: mov edx, [esi]
  loc_005FED83: add esp, 00000010h
  loc_005FED86: push ebx
  loc_005FED87: push 00000014h
  loc_005FED89: push esi
  loc_005FED8A: call [edx+0000031Ch]
  loc_005FED90: push eax
  loc_005FED91: lea eax, var_30
  loc_005FED94: push eax
  loc_005FED95: call [004010A0h] ; __vbaObjSet
  loc_005FED9B: lea ecx, var_50
  loc_005FED9E: push eax
  loc_005FED9F: push ecx
  loc_005FEDA0: call edi
  loc_005FEDA2: add esp, 00000010h
  loc_005FEDA5: lea edx, var_50
  loc_005FEDA8: lea eax, var_40
  loc_005FEDAB: lea ecx, var_60
  loc_005FEDAE: push 00000001h
  loc_005FEDB0: push 00000001h
  loc_005FEDB2: push edx
  loc_005FEDB3: push eax
  loc_005FEDB4: push 00426734h ; "d"
  loc_005FEDB9: push ecx
  loc_005FEDBA: call [00401070h] ; rtcDateDiff
  loc_005FEDC0: lea edx, var_60
  loc_005FEDC3: push edx
  loc_005FEDC4: call [00401028h] ; __vbaStrVarMove
  loc_005FEDCA: mov edi, [00401270h] ; __vbaStrMove
  loc_005FEDD0: mov edx, eax
  loc_005FEDD2: mov ecx, 0061A048h
  loc_005FEDD7: call edi
  loc_005FEDD9: lea eax, var_30
  loc_005FEDDC: lea ecx, var_2C
  loc_005FEDDF: push eax
  loc_005FEDE0: push ecx
  loc_005FEDE1: push 00000002h
  loc_005FEDE3: call [00401040h] ; __vbaFreeObjList
  loc_005FEDE9: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_005FEDEF: lea edx, var_60
  loc_005FEDF2: lea eax, var_50
  loc_005FEDF5: push edx
  loc_005FEDF6: lea ecx, var_40
  loc_005FEDF9: push eax
  loc_005FEDFA: push ecx
  loc_005FEDFB: push 00000003h
  loc_005FEDFD: call ebx
  loc_005FEDFF: mov edx, [0061A048h]
  loc_005FEE05: add esp, 0000001Ch
  loc_005FEE08: push edx
  loc_005FEE09: call [004011D8h] ; __vbaR8Str
  loc_005FEE0F: fadd st0, real8 ptr [004015F8h]
  loc_005FEE15: sub esp, 00000008h
  loc_005FEE18: fnstsw ax
  loc_005FEE1A: test al, 0Dh
  loc_005FEE1C: jnz 005FF7CCh
  loc_005FEE22: fstp real8 ptr [esp]
  loc_005FEE25: call [00401144h] ; __vbaStrR8
  loc_005FEE2B: mov edx, eax
  loc_005FEE2D: mov ecx, 0061A048h
  loc_005FEE32: call edi
  loc_005FEE34: mov eax, [0061A048h]
  loc_005FEE39: push eax
  loc_005FEE3A: call [0040126Ch] ; __vbaUI1Str
  loc_005FEE40: mov ecx, 00000001h
  loc_005FEE45: mov var_B8, al
  loc_005FEE4B: call [00401154h] ; __vbaUI1I2
  loc_005FEE51: mov edi, [004011B4h] ; __vbaVarCat
  loc_005FEE57: mov var_14, al
  loc_005FEE5A: mov cl, var_14
  loc_005FEE5D: mov al, var_B8
  loc_005FEE63: cmp cl, al
  loc_005FEE65: ja 005FF442h
  loc_005FEE6B: mov ecx, 00000001h
  loc_005FEE70: call [00401154h] ; __vbaUI1I2
  loc_005FEE76: cmp var_14, al
  loc_005FEE79: jnz 005FEF7Fh
  loc_005FEE7F: mov edx, [esi]
  loc_005FEE81: push esi
  loc_005FEE82: call [edx+00000314h]
  loc_005FEE88: mov var_38, eax
  loc_005FEE8B: lea eax, var_40
  loc_005FEE8E: lea ecx, var_50
  loc_005FEE91: push eax
  loc_005FEE92: push ecx
  loc_005FEE93: mov var_40, 00000009h
  loc_005FEE9A: call [004010D4h] ; rtcTrimVar
  loc_005FEEA0: lea edx, var_50
  loc_005FEEA3: push edx
  loc_005FEEA4: call [00401028h] ; __vbaStrVarMove
  loc_005FEEAA: mov edx, eax
  loc_005FEEAC: mov ecx, 0061A0A4h
  loc_005FEEB1: call [00401270h] ; __vbaStrMove
  loc_005FEEB7: lea eax, var_50
  loc_005FEEBA: lea ecx, var_40
  loc_005FEEBD: push eax
  loc_005FEEBE: push ecx
  loc_005FEEBF: push 00000002h
  loc_005FEEC1: call ebx
  loc_005FEEC3: add esp, 0000000Ch
  loc_005FEEC6: lea edx, var_70
  loc_005FEEC9: lea eax, var_40
  loc_005FEECC: mov ebx, 80020004h
  loc_005FEED1: push edx
  loc_005FEED2: push eax
  loc_005FEED3: mov var_78, 0042FC0Ch ; "INSERT INTO TmpTotalWeek(Agent,Amount1,LAmount1) Select AgentName,TotalAmount,LuckyAmount From TotalPLG Where OnCount='"
  loc_005FEEDA: mov var_80, 00000008h
  loc_005FEEE1: mov var_68, 0061A0A4h
  loc_005FEEE8: mov var_70, 00004008h
  loc_005FEEEF: call [004010D4h] ; rtcTrimVar
  loc_005FEEF5: mov ecx, [0061A13Ch]
  loc_005FEEFB: mov var_88, 0042FE10h ; "' and Type1='P'"
  loc_005FEF05: mov var_90, 00000008h
  loc_005FEF0F: sub esp, 00000010h
  loc_005FEF12: mov edx, [ecx]
  loc_005FEF14: mov ecx, esp
  loc_005FEF16: mov eax, 0000000Ah
  loc_005FEF1B: mov var_C4, edx
  loc_005FEF21: mov [ecx], eax
  loc_005FEF23: mov eax, var_9C
  loc_005FEF29: mov [ecx+00000004h], eax
  loc_005FEF2C: mov eax, var_94
  loc_005FEF32: mov [ecx+00000008h], ebx
  loc_005FEF35: mov [ecx+0000000Ch], eax
  loc_005FEF38: lea ecx, var_80
  loc_005FEF3B: push ecx
  loc_005FEF3C: lea eax, var_40
  loc_005FEF3F: lea ecx, var_50
  loc_005FEF42: push eax
  loc_005FEF43: push ecx
  loc_005FEF44: call edi
  loc_005FEF46: push eax
  loc_005FEF47: lea edx, var_90
  loc_005FEF4D: lea eax, var_60
  loc_005FEF50: push edx
  loc_005FEF51: push eax
  loc_005FEF52: call edi
  loc_005FEF54: lea ecx, var_28
  loc_005FEF57: push eax
  loc_005FEF58: push ecx
  loc_005FEF59: call [004011B0h] ; __vbaStrVarVal
  loc_005FEF5F: mov edx, [0061A13Ch]
  loc_005FEF65: push eax
  loc_005FEF66: mov eax, var_C4
  loc_005FEF6C: push edx
  loc_005FEF6D: call [eax+0000005Ch]
  loc_005FEF70: test eax, eax
  loc_005FEF72: fnclex
  loc_005FEF74: jge 005FF40Bh
  loc_005FEF7A: jmp 005FF3F6h
  loc_005FEF7F: mov ecx, 00000002h
  loc_005FEF84: call [00401154h] ; __vbaUI1I2
  loc_005FEF8A: cmp var_14, al
  loc_005FEF8D: jnz 005FF09Fh
  loc_005FEF93: mov edx, [esi]
  loc_005FEF95: push esi
  loc_005FEF96: call [edx+00000314h]
  loc_005FEF9C: mov var_38, eax
  loc_005FEF9F: lea eax, var_40
  loc_005FEFA2: push eax
  loc_005FEFA3: push 3FF00000h
  loc_005FEFA8: push 00000000h
  loc_005FEFAA: lea ecx, var_50
  loc_005FEFAD: push 00426734h ; "d"
  loc_005FEFB2: push ecx
  loc_005FEFB3: mov var_40, 00000009h
  loc_005FEFBA: call [00401064h] ; rtcDateAdd
  loc_005FEFC0: lea edx, var_50
  loc_005FEFC3: push edx
  loc_005FEFC4: call [00401028h] ; __vbaStrVarMove
  loc_005FEFCA: mov edx, eax
  loc_005FEFCC: mov ecx, 0061A0A4h
  loc_005FEFD1: call [00401270h] ; __vbaStrMove
  loc_005FEFD7: lea eax, var_50
  loc_005FEFDA: lea ecx, var_40
  loc_005FEFDD: push eax
  loc_005FEFDE: push ecx
  loc_005FEFDF: push 00000002h
  loc_005FEFE1: call ebx
  loc_005FEFE3: add esp, 0000000Ch
  loc_005FEFE6: lea edx, var_70
  loc_005FEFE9: lea eax, var_40
  loc_005FEFEC: mov ebx, 80020004h
  loc_005FEFF1: push edx
  loc_005FEFF2: push eax
  loc_005FEFF3: mov var_78, 0042F830h ; "INSERT INTO TmpTotalWeek(Agent,Amount2,LAmount2) Select AgentName,TotalAmount,LuckyAmount From TotalPLG Where OnCount='"
  loc_005FEFFA: mov var_80, 00000008h
  loc_005FF001: mov var_68, 0061A0A4h
  loc_005FF008: mov var_70, 00004008h
  loc_005FF00F: call [004010D4h] ; rtcTrimVar
  loc_005FF015: mov ecx, [0061A13Ch]
  loc_005FF01B: mov var_88, 0042FE10h ; "' and Type1='P'"
  loc_005FF025: mov var_90, 00000008h
  loc_005FF02F: sub esp, 00000010h
  loc_005FF032: mov edx, [ecx]
  loc_005FF034: mov ecx, esp
  loc_005FF036: mov eax, 0000000Ah
  loc_005FF03B: mov var_C8, edx
  loc_005FF041: mov [ecx], eax
  loc_005FF043: mov eax, var_9C
  loc_005FF049: mov [ecx+00000004h], eax
  loc_005FF04C: mov eax, var_94
  loc_005FF052: mov [ecx+00000008h], ebx
  loc_005FF055: mov [ecx+0000000Ch], eax
  loc_005FF058: lea ecx, var_80
  loc_005FF05B: push ecx
  loc_005FF05C: lea eax, var_40
  loc_005FF05F: lea ecx, var_50
  loc_005FF062: push eax
  loc_005FF063: push ecx
  loc_005FF064: call edi
  loc_005FF066: push eax
  loc_005FF067: lea edx, var_90
  loc_005FF06D: lea eax, var_60
  loc_005FF070: push edx
  loc_005FF071: push eax
  loc_005FF072: call edi
  loc_005FF074: lea ecx, var_28
  loc_005FF077: push eax
  loc_005FF078: push ecx
  loc_005FF079: call [004011B0h] ; __vbaStrVarVal
  loc_005FF07F: mov edx, [0061A13Ch]
  loc_005FF085: push eax
  loc_005FF086: mov eax, var_C8
  loc_005FF08C: push edx
  loc_005FF08D: call [eax+0000005Ch]
  loc_005FF090: test eax, eax
  loc_005FF092: fnclex
  loc_005FF094: jge 005FF40Bh
  loc_005FF09A: jmp 005FF3F6h
  loc_005FF09F: mov ecx, 00000003h
  loc_005FF0A4: call [00401154h] ; __vbaUI1I2
  loc_005FF0AA: cmp var_14, al
  loc_005FF0AD: jnz 005FF1BFh
  loc_005FF0B3: mov edx, [esi]
  loc_005FF0B5: push esi
  loc_005FF0B6: call [edx+00000314h]
  loc_005FF0BC: mov var_38, eax
  loc_005FF0BF: lea eax, var_40
  loc_005FF0C2: push eax
  loc_005FF0C3: push 40000000h
  loc_005FF0C8: push 00000000h
  loc_005FF0CA: lea ecx, var_50
  loc_005FF0CD: push 00426734h ; "d"
  loc_005FF0D2: push ecx
  loc_005FF0D3: mov var_40, 00000009h
  loc_005FF0DA: call [00401064h] ; rtcDateAdd
  loc_005FF0E0: lea edx, var_50
  loc_005FF0E3: push edx
  loc_005FF0E4: call [00401028h] ; __vbaStrVarMove
  loc_005FF0EA: mov edx, eax
  loc_005FF0EC: mov ecx, 0061A0A4h
  loc_005FF0F1: call [00401270h] ; __vbaStrMove
  loc_005FF0F7: lea eax, var_50
  loc_005FF0FA: lea ecx, var_40
  loc_005FF0FD: push eax
  loc_005FF0FE: push ecx
  loc_005FF0FF: push 00000002h
  loc_005FF101: call ebx
  loc_005FF103: add esp, 0000000Ch
  loc_005FF106: lea edx, var_70
  loc_005FF109: lea eax, var_40
  loc_005FF10C: mov ebx, 80020004h
  loc_005FF111: push edx
  loc_005FF112: push eax
  loc_005FF113: mov var_78, 0042ECB4h ; "INSERT INTO TmpTotalWeek(Agent,Amount3,LAmount3) Select AgentName,TotalAmount,LuckyAmount From TotalPLG Where OnCount='"
  loc_005FF11A: mov var_80, 00000008h
  loc_005FF121: mov var_68, 0061A0A4h
  loc_005FF128: mov var_70, 00004008h
  loc_005FF12F: call [004010D4h] ; rtcTrimVar
  loc_005FF135: mov ecx, [0061A13Ch]
  loc_005FF13B: mov var_88, 0042FE10h ; "' and Type1='P'"
  loc_005FF145: mov var_90, 00000008h
  loc_005FF14F: sub esp, 00000010h
  loc_005FF152: mov edx, [ecx]
  loc_005FF154: mov ecx, esp
  loc_005FF156: mov eax, 0000000Ah
  loc_005FF15B: mov var_CC, edx
  loc_005FF161: mov [ecx], eax
  loc_005FF163: mov eax, var_9C
  loc_005FF169: mov [ecx+00000004h], eax
  loc_005FF16C: mov eax, var_94
  loc_005FF172: mov [ecx+00000008h], ebx
  loc_005FF175: mov [ecx+0000000Ch], eax
  loc_005FF178: lea ecx, var_80
  loc_005FF17B: push ecx
  loc_005FF17C: lea eax, var_40
  loc_005FF17F: lea ecx, var_50
  loc_005FF182: push eax
  loc_005FF183: push ecx
  loc_005FF184: call edi
  loc_005FF186: push eax
  loc_005FF187: lea edx, var_90
  loc_005FF18D: lea eax, var_60
  loc_005FF190: push edx
  loc_005FF191: push eax
  loc_005FF192: call edi
  loc_005FF194: lea ecx, var_28
  loc_005FF197: push eax
  loc_005FF198: push ecx
  loc_005FF199: call [004011B0h] ; __vbaStrVarVal
  loc_005FF19F: mov edx, [0061A13Ch]
  loc_005FF1A5: push eax
  loc_005FF1A6: mov eax, var_CC
  loc_005FF1AC: push edx
  loc_005FF1AD: call [eax+0000005Ch]
  loc_005FF1B0: test eax, eax
  loc_005FF1B2: fnclex
  loc_005FF1B4: jge 005FF40Bh
  loc_005FF1BA: jmp 005FF3F6h
  loc_005FF1BF: mov ecx, 00000004h
  loc_005FF1C4: call [00401154h] ; __vbaUI1I2
  loc_005FF1CA: cmp var_14, al
  loc_005FF1CD: jnz 005FF2DFh
  loc_005FF1D3: mov edx, [esi]
  loc_005FF1D5: push esi
  loc_005FF1D6: call [edx+00000314h]
  loc_005FF1DC: mov var_38, eax
  loc_005FF1DF: lea eax, var_40
  loc_005FF1E2: push eax
  loc_005FF1E3: push 40080000h
  loc_005FF1E8: push 00000000h
  loc_005FF1EA: lea ecx, var_50
  loc_005FF1ED: push 00426734h ; "d"
  loc_005FF1F2: push ecx
  loc_005FF1F3: mov var_40, 00000009h
  loc_005FF1FA: call [00401064h] ; rtcDateAdd
  loc_005FF200: lea edx, var_50
  loc_005FF203: push edx
  loc_005FF204: call [00401028h] ; __vbaStrVarMove
  loc_005FF20A: mov edx, eax
  loc_005FF20C: mov ecx, 0061A0A4h
  loc_005FF211: call [00401270h] ; __vbaStrMove
  loc_005FF217: lea eax, var_50
  loc_005FF21A: lea ecx, var_40
  loc_005FF21D: push eax
  loc_005FF21E: push ecx
  loc_005FF21F: push 00000002h
  loc_005FF221: call ebx
  loc_005FF223: add esp, 0000000Ch
  loc_005FF226: lea edx, var_70
  loc_005FF229: lea eax, var_40
  loc_005FF22C: mov ebx, 80020004h
  loc_005FF231: push edx
  loc_005FF232: push eax
  loc_005FF233: mov var_78, 0042FEE8h ; "INSERT INTO TmpTotalWeek(Agent,Amount4,LAmount4) Select AgentName,TotalAmount,LuckyAmount From TotalPLG Where OnCount='"
  loc_005FF23A: mov var_80, 00000008h
  loc_005FF241: mov var_68, 0061A0A4h
  loc_005FF248: mov var_70, 00004008h
  loc_005FF24F: call [004010D4h] ; rtcTrimVar
  loc_005FF255: mov ecx, [0061A13Ch]
  loc_005FF25B: mov var_88, 0042FE10h ; "' and Type1='P'"
  loc_005FF265: mov var_90, 00000008h
  loc_005FF26F: sub esp, 00000010h
  loc_005FF272: mov edx, [ecx]
  loc_005FF274: mov ecx, esp
  loc_005FF276: mov eax, 0000000Ah
  loc_005FF27B: mov var_D0, edx
  loc_005FF281: mov [ecx], eax
  loc_005FF283: mov eax, var_9C
  loc_005FF289: mov [ecx+00000004h], eax
  loc_005FF28C: mov eax, var_94
  loc_005FF292: mov [ecx+00000008h], ebx
  loc_005FF295: mov [ecx+0000000Ch], eax
  loc_005FF298: lea ecx, var_80
  loc_005FF29B: push ecx
  loc_005FF29C: lea eax, var_40
  loc_005FF29F: lea ecx, var_50
  loc_005FF2A2: push eax
  loc_005FF2A3: push ecx
  loc_005FF2A4: call edi
  loc_005FF2A6: push eax
  loc_005FF2A7: lea edx, var_90
  loc_005FF2AD: lea eax, var_60
  loc_005FF2B0: push edx
  loc_005FF2B1: push eax
  loc_005FF2B2: call edi
  loc_005FF2B4: lea ecx, var_28
  loc_005FF2B7: push eax
  loc_005FF2B8: push ecx
  loc_005FF2B9: call [004011B0h] ; __vbaStrVarVal
  loc_005FF2BF: mov edx, [0061A13Ch]
  loc_005FF2C5: push eax
  loc_005FF2C6: mov eax, var_D0
  loc_005FF2CC: push edx
  loc_005FF2CD: call [eax+0000005Ch]
  loc_005FF2D0: test eax, eax
  loc_005FF2D2: fnclex
  loc_005FF2D4: jge 005FF40Bh
  loc_005FF2DA: jmp 005FF3F6h
  loc_005FF2DF: mov ecx, 00000005h
  loc_005FF2E4: call [00401154h] ; __vbaUI1I2
  loc_005FF2EA: cmp var_14, al
  loc_005FF2ED: jnz 005FF42Dh
  loc_005FF2F3: mov edx, [esi]
  loc_005FF2F5: push esi
  loc_005FF2F6: call [edx+00000314h]
  loc_005FF2FC: mov var_38, eax
  loc_005FF2FF: lea eax, var_40
  loc_005FF302: push eax
  loc_005FF303: push 40100000h
  loc_005FF308: push 00000000h
  loc_005FF30A: lea ecx, var_50
  loc_005FF30D: push 00426734h ; "d"
  loc_005FF312: push ecx
  loc_005FF313: mov var_40, 00000009h
  loc_005FF31A: call [00401064h] ; rtcDateAdd
  loc_005FF320: lea edx, var_50
  loc_005FF323: push edx
  loc_005FF324: call [00401028h] ; __vbaStrVarMove
  loc_005FF32A: mov edx, eax
  loc_005FF32C: mov ecx, 0061A0A4h
  loc_005FF331: call [00401270h] ; __vbaStrMove
  loc_005FF337: lea eax, var_50
  loc_005FF33A: lea ecx, var_40
  loc_005FF33D: push eax
  loc_005FF33E: push ecx
  loc_005FF33F: push 00000002h
  loc_005FF341: call ebx
  loc_005FF343: add esp, 0000000Ch
  loc_005FF346: lea edx, var_70
  loc_005FF349: lea eax, var_40
  loc_005FF34C: mov ebx, 80020004h
  loc_005FF351: push edx
  loc_005FF352: push eax
  loc_005FF353: mov var_78, 0042FFDCh ; "INSERT INTO TmpTotalWeek(Agent,Amount5,LAmount5) Select AgentName,TotalAmount,LuckyAmount From TotalPLG Where OnCount='"
  loc_005FF35A: mov var_80, 00000008h
  loc_005FF361: mov var_68, 0061A0A4h
  loc_005FF368: mov var_70, 00004008h
  loc_005FF36F: call [004010D4h] ; rtcTrimVar
  loc_005FF375: mov ecx, [0061A13Ch]
  loc_005FF37B: mov var_88, 0042FE10h ; "' and Type1='P'"
  loc_005FF385: mov var_90, 00000008h
  loc_005FF38F: sub esp, 00000010h
  loc_005FF392: mov edx, [ecx]
  loc_005FF394: mov ecx, esp
  loc_005FF396: mov eax, 0000000Ah
  loc_005FF39B: mov var_D4, edx
  loc_005FF3A1: mov [ecx], eax
  loc_005FF3A3: mov eax, var_9C
  loc_005FF3A9: mov [ecx+00000004h], eax
  loc_005FF3AC: mov eax, var_94
  loc_005FF3B2: mov [ecx+00000008h], ebx
  loc_005FF3B5: mov [ecx+0000000Ch], eax
  loc_005FF3B8: lea ecx, var_80
  loc_005FF3BB: push ecx
  loc_005FF3BC: lea eax, var_40
  loc_005FF3BF: lea ecx, var_50
  loc_005FF3C2: push eax
  loc_005FF3C3: push ecx
  loc_005FF3C4: call edi
  loc_005FF3C6: push eax
  loc_005FF3C7: lea edx, var_90
  loc_005FF3CD: lea eax, var_60
  loc_005FF3D0: push edx
  loc_005FF3D1: push eax
  loc_005FF3D2: call edi
  loc_005FF3D4: lea ecx, var_28
  loc_005FF3D7: push eax
  loc_005FF3D8: push ecx
  loc_005FF3D9: call [004011B0h] ; __vbaStrVarVal
  loc_005FF3DF: mov edx, [0061A13Ch]
  loc_005FF3E5: push eax
  loc_005FF3E6: mov eax, var_D4
  loc_005FF3EC: push edx
  loc_005FF3ED: call [eax+0000005Ch]
  loc_005FF3F0: test eax, eax
  loc_005FF3F2: fnclex
  loc_005FF3F4: jge 005FF40Bh
  loc_005FF3F6: mov ecx, [0061A13Ch]
  loc_005FF3FC: push 0000005Ch
  loc_005FF3FE: push 0041E928h
  loc_005FF403: push ecx
  loc_005FF404: push eax
  loc_005FF405: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF40B: lea ecx, var_28
  loc_005FF40E: call [004012ACh] ; __vbaFreeStr
  loc_005FF414: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_005FF41A: lea edx, var_60
  loc_005FF41D: lea eax, var_50
  loc_005FF420: push edx
  loc_005FF421: lea ecx, var_40
  loc_005FF424: push eax
  loc_005FF425: push ecx
  loc_005FF426: push 00000003h
  loc_005FF428: call ebx
  loc_005FF42A: add esp, 00000010h
  loc_005FF42D: mov cl, var_14
  loc_005FF430: mov al, 01h
  loc_005FF432: add al, cl
  loc_005FF434: jb 005FF7D1h
  loc_005FF43A: mov var_14, al
  loc_005FF43D: jmp 005FEE5Ah
  loc_005FF442: sub esp, 00000010h
  loc_005FF445: mov edx, [0061A13Ch]
  loc_005FF44B: mov edi, esp
  loc_005FF44D: mov ecx, 0000000Ah
  loc_005FF452: mov var_70, ecx
  loc_005FF455: mov eax, 80020004h
  loc_005FF45A: mov [edi], ecx
  loc_005FF45C: mov ecx, var_6C
  loc_005FF45F: mov var_68, eax
  loc_005FF462: mov edx, [edx]
  loc_005FF464: mov [edi+00000004h], ecx
  loc_005FF467: mov ecx, [0061A13Ch]
  loc_005FF46D: push 0042A6D4h ; "Delete From TmpTotalWeek1"
  loc_005FF472: push ecx
  loc_005FF473: mov [edi+00000008h], eax
  loc_005FF476: mov eax, var_64
  loc_005FF479: mov [edi+0000000Ch], eax
  loc_005FF47C: call [edx+0000005Ch]
  loc_005FF47F: test eax, eax
  loc_005FF481: fnclex
  loc_005FF483: jge 005FF49Ah
  loc_005FF485: mov edx, [0061A13Ch]
  loc_005FF48B: push 0000005Ch
  loc_005FF48D: push 0041E928h
  loc_005FF492: push edx
  loc_005FF493: push eax
  loc_005FF494: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF49A: sub esp, 00000010h
  loc_005FF49D: mov edx, [0061A13Ch]
  loc_005FF4A3: mov edi, esp
  loc_005FF4A5: mov ecx, 0000000Ah
  loc_005FF4AA: mov var_70, ecx
  loc_005FF4AD: mov eax, 80020004h
  loc_005FF4B2: mov [edi], ecx
  loc_005FF4B4: mov ecx, var_6C
  loc_005FF4B7: mov var_68, eax
  loc_005FF4BA: mov edx, [edx]
  loc_005FF4BC: mov [edi+00000004h], ecx
  loc_005FF4BF: mov ecx, [0061A13Ch]
  loc_005FF4C5: push 004300D0h ; "INSERT INTO TmpTotalWeek1(Agent,Amount1,LAmount1,Amount2,LAmount2,Amount3,LAmount3,Amount4,LAmount4,Amount5,LAmount5) Select Agent,Sum(Amount1),Sum(LAmount1),Sum(Amount2),Sum(LAmount2),Sum(Amount3),Sum(LAmount3),Sum(Amount4),Sum(LAmount4),Sum(Amount5),Sum(LAmount5) From TmpTotalWeek Group By Agent"
  loc_005FF4CA: push ecx
  loc_005FF4CB: mov [edi+00000008h], eax
  loc_005FF4CE: mov eax, var_64
  loc_005FF4D1: mov [edi+0000000Ch], eax
  loc_005FF4D4: call [edx+0000005Ch]
  loc_005FF4D7: test eax, eax
  loc_005FF4D9: fnclex
  loc_005FF4DB: jge 005FF4F2h
  loc_005FF4DD: mov edx, [0061A13Ch]
  loc_005FF4E3: push 0000005Ch
  loc_005FF4E5: push 0041E928h
  loc_005FF4EA: push edx
  loc_005FF4EB: push eax
  loc_005FF4EC: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF4F2: mov eax, [esi]
  loc_005FF4F4: push 0000000Bh
  loc_005FF4F6: push esi
  loc_005FF4F7: call [eax+000000A4h]
  loc_005FF4FD: test eax, eax
  loc_005FF4FF: fnclex
  loc_005FF501: jge 005FF515h
  loc_005FF503: push 000000A4h
  loc_005FF508: push 00429194h
  loc_005FF50D: push esi
  loc_005FF50E: push eax
  loc_005FF50F: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF515: mov ecx, [esi]
  loc_005FF517: push 00000000h
  loc_005FF519: push 00000070h
  loc_005FF51B: push esi
  loc_005FF51C: call [ecx+00000318h]
  loc_005FF522: mov edi, [004010A0h] ; __vbaObjSet
  loc_005FF528: lea edx, var_2C
  loc_005FF52B: push eax
  loc_005FF52C: push edx
  loc_005FF52D: call edi
  loc_005FF52F: push eax
  loc_005FF530: call [00401024h] ; __vbaLateIdCall
  loc_005FF536: add esp, 0000000Ch
  loc_005FF539: lea ecx, var_2C
  loc_005FF53C: call [004012B0h] ; __vbaFreeObj
  loc_005FF542: lea eax, var_70
  loc_005FF545: lea ecx, var_40
  loc_005FF548: push eax
  loc_005FF549: push ecx
  loc_005FF54A: mov var_78, 00000000h
  loc_005FF551: mov var_80, 00000002h
  loc_005FF558: mov var_68, 0061A150h
  loc_005FF55F: mov var_70, 00004008h
  loc_005FF566: call [004010D4h] ; rtcTrimVar
  loc_005FF56C: lea edx, var_40
  loc_005FF56F: push edx
  loc_005FF570: call [00401028h] ; __vbaStrVarMove
  loc_005FF576: mov edx, var_80
  loc_005FF579: sub esp, 00000010h
  loc_005FF57C: mov ecx, esp
  loc_005FF57E: sub esp, 00000010h
  loc_005FF581: mov var_50, 00000008h
  loc_005FF588: mov var_48, eax
  loc_005FF58B: mov [ecx], edx
  loc_005FF58D: mov edx, var_7C
  loc_005FF590: mov [ecx+00000004h], edx
  loc_005FF593: mov edx, var_78
  loc_005FF596: mov [ecx+00000008h], edx
  loc_005FF599: mov edx, var_74
  loc_005FF59C: mov [ecx+0000000Ch], edx
  loc_005FF59F: mov edx, var_50
  loc_005FF5A2: mov ecx, esp
  loc_005FF5A4: push 00000001h
  loc_005FF5A6: push 00000020h
  loc_005FF5A8: push esi
  loc_005FF5A9: mov [ecx], edx
  loc_005FF5AB: mov edx, var_4C
  loc_005FF5AE: mov [ecx+00000004h], edx
  loc_005FF5B1: mov [ecx+00000008h], eax
  loc_005FF5B4: mov eax, var_44
  loc_005FF5B7: mov [ecx+0000000Ch], eax
  loc_005FF5BA: mov ecx, [esi]
  loc_005FF5BC: call [ecx+00000318h]
  loc_005FF5C2: lea edx, var_2C
  loc_005FF5C5: push eax
  loc_005FF5C6: push edx
  loc_005FF5C7: call edi
  loc_005FF5C9: push eax
  loc_005FF5CA: call [00401160h] ; __vbaLateIdCallSt
  loc_005FF5D0: add esp, 0000002Ch
  loc_005FF5D3: lea ecx, var_2C
  loc_005FF5D6: call [004012B0h] ; __vbaFreeObj
  loc_005FF5DC: lea eax, var_50
  loc_005FF5DF: lea ecx, var_40
  loc_005FF5E2: push eax
  loc_005FF5E3: push ecx
  loc_005FF5E4: push 00000002h
  loc_005FF5E6: call ebx
  loc_005FF5E8: mov eax, [0061B394h]
  loc_005FF5ED: add esp, 0000000Ch
  loc_005FF5F0: test eax, eax
  loc_005FF5F2: jnz 005FF604h
  loc_005FF5F4: push 0061B394h
  loc_005FF5F9: push 0041E4A0h
  loc_005FF5FE: call [004011DCh] ; __vbaNew2
  loc_005FF604: mov ebx, [0061B394h]
  loc_005FF60A: lea eax, var_2C
  loc_005FF60D: push eax
  loc_005FF60E: push ebx
  loc_005FF60F: mov edx, [ebx]
  loc_005FF611: call [edx+00000014h]
  loc_005FF614: test eax, eax
  loc_005FF616: fnclex
  loc_005FF618: jge 005FF629h
  loc_005FF61A: push 00000014h
  loc_005FF61C: push 0041E490h
  loc_005FF621: push ebx
  loc_005FF622: push eax
  loc_005FF623: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF629: mov eax, var_2C
  loc_005FF62C: lea edx, var_28
  loc_005FF62F: push edx
  loc_005FF630: push eax
  loc_005FF631: mov ecx, [eax]
  loc_005FF633: mov ebx, eax
  loc_005FF635: call [ecx+00000050h]
  loc_005FF638: test eax, eax
  loc_005FF63A: fnclex
  loc_005FF63C: jge 005FF64Dh
  loc_005FF63E: push 00000050h
  loc_005FF640: push 0041F3A0h
  loc_005FF645: push ebx
  loc_005FF646: push eax
  loc_005FF647: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF64D: mov eax, var_28
  loc_005FF650: push eax
  loc_005FF651: push 0042FE34h ; "\Reports\TotalWeekP.rpt"
  loc_005FF656: call [00401054h] ; __vbaStrCat
  loc_005FF65C: sub esp, 00000010h
  loc_005FF65F: mov ecx, 00000008h
  loc_005FF664: mov edx, esp
  loc_005FF666: mov var_40, ecx
  loc_005FF669: mov var_38, eax
  loc_005FF66C: push 00000003h
  loc_005FF66E: mov [edx], ecx
  loc_005FF670: mov ecx, var_3C
  loc_005FF673: push esi
  loc_005FF674: mov [edx+00000004h], ecx
  loc_005FF677: mov ecx, [esi]
  loc_005FF679: mov [edx+00000008h], eax
  loc_005FF67C: mov eax, var_34
  loc_005FF67F: mov [edx+0000000Ch], eax
  loc_005FF682: call [ecx+00000318h]
  loc_005FF688: lea edx, var_30
  loc_005FF68B: push eax
  loc_005FF68C: push edx
  loc_005FF68D: call edi
  loc_005FF68F: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_005FF695: push eax
  loc_005FF696: call ebx
  loc_005FF698: lea ecx, var_28
  loc_005FF69B: call [004012ACh] ; __vbaFreeStr
  loc_005FF6A1: lea eax, var_30
  loc_005FF6A4: lea ecx, var_2C
  loc_005FF6A7: push eax
  loc_005FF6A8: push ecx
  loc_005FF6A9: push 00000002h
  loc_005FF6AB: call [00401040h] ; __vbaFreeObjList
  loc_005FF6B1: add esp, 0000000Ch
  loc_005FF6B4: lea ecx, var_40
  loc_005FF6B7: call [00401020h] ; __vbaFreeVar
  loc_005FF6BD: sub esp, 00000010h
  loc_005FF6C0: mov ecx, 00000003h
  loc_005FF6C5: mov edx, esp
  loc_005FF6C7: mov var_70, ecx
  loc_005FF6CA: mov eax, 00000002h
  loc_005FF6CF: push 00000043h
  loc_005FF6D1: mov [edx], ecx
  loc_005FF6D3: mov ecx, var_6C
  loc_005FF6D6: mov var_68, eax
  loc_005FF6D9: push esi
  loc_005FF6DA: mov [edx+00000004h], ecx
  loc_005FF6DD: mov ecx, [esi]
  loc_005FF6DF: mov [edx+00000008h], eax
  loc_005FF6E2: mov eax, var_64
  loc_005FF6E5: mov [edx+0000000Ch], eax
  loc_005FF6E8: call [ecx+00000318h]
  loc_005FF6EE: lea edx, var_2C
  loc_005FF6F1: push eax
  loc_005FF6F2: push edx
  loc_005FF6F3: call edi
  loc_005FF6F5: push eax
  loc_005FF6F6: call ebx
  loc_005FF6F8: lea ecx, var_2C
  loc_005FF6FB: call [004012B0h] ; __vbaFreeObj
  loc_005FF701: sub esp, 00000010h
  loc_005FF704: mov ecx, 00000002h
  loc_005FF709: mov edx, esp
  loc_005FF70B: mov var_70, ecx
  loc_005FF70E: mov eax, 00000001h
  loc_005FF713: push 00000011h
  loc_005FF715: mov [edx], ecx
  loc_005FF717: mov ecx, var_6C
  loc_005FF71A: mov var_68, eax
  loc_005FF71D: push esi
  loc_005FF71E: mov [edx+00000004h], ecx
  loc_005FF721: mov ecx, [esi]
  loc_005FF723: mov [edx+00000008h], eax
  loc_005FF726: mov eax, var_64
  loc_005FF729: mov [edx+0000000Ch], eax
  loc_005FF72C: call [ecx+00000318h]
  loc_005FF732: lea edx, var_2C
  loc_005FF735: push eax
  loc_005FF736: push edx
  loc_005FF737: call edi
  loc_005FF739: push eax
  loc_005FF73A: call ebx
  loc_005FF73C: lea ecx, var_2C
  loc_005FF73F: call [004012B0h] ; __vbaFreeObj
  loc_005FF745: mov eax, [esi]
  loc_005FF747: push 00000001h
  loc_005FF749: push esi
  loc_005FF74A: call [eax+000000A4h]
  loc_005FF750: test eax, eax
  loc_005FF752: fnclex
  loc_005FF754: jge 005FF768h
  loc_005FF756: push 000000A4h
  loc_005FF75B: push 00429194h
  loc_005FF760: push esi
  loc_005FF761: push eax
  loc_005FF762: call [00401074h] ; __vbaHresultCheckObj
  loc_005FF768: fwait
  loc_005FF769: push 005FF7B7h
  loc_005FF76E: jmp 005FF7A1h
  loc_005FF770: lea ecx, var_28
  loc_005FF773: call [004012ACh] ; __vbaFreeStr
  loc_005FF779: lea ecx, var_30
  loc_005FF77C: lea edx, var_2C
  loc_005FF77F: push ecx
  loc_005FF780: push edx
  loc_005FF781: push 00000002h
  loc_005FF783: call [00401040h] ; __vbaFreeObjList
  loc_005FF789: lea eax, var_60
  loc_005FF78C: lea ecx, var_50
  loc_005FF78F: push eax
  loc_005FF790: lea edx, var_40
  loc_005FF793: push ecx
  loc_005FF794: push edx
  loc_005FF795: push 00000003h
  loc_005FF797: call [00401038h] ; __vbaFreeVarList
  loc_005FF79D: add esp, 0000001Ch
  loc_005FF7A0: ret
  loc_005FF7A1: mov esi, [004012B0h] ; __vbaFreeObj
  loc_005FF7A7: lea ecx, var_1C
  loc_005FF7AA: call __vbaFreeObj
  loc_005FF7AC: lea ecx, var_20
  loc_005FF7AF: call __vbaFreeObj
  loc_005FF7B1: lea ecx, var_24
  loc_005FF7B4: call __vbaFreeObj
  loc_005FF7B6: ret
  loc_005FF7B7: mov ecx, var_10
  loc_005FF7BA: pop edi
  loc_005FF7BB: pop esi
  loc_005FF7BC: xor eax, eax
  loc_005FF7BE: mov fs:[00000000h], ecx
  loc_005FF7C5: pop ebx
  loc_005FF7C6: mov esp, ebp
  loc_005FF7C8: pop ebp
  loc_005FF7C9: retn 0004h
End Sub

Private Sub Proc_26_11_5FFBB0() '5FFBB0
  loc_005FFBB0: push ebp
  loc_005FFBB1: mov ebp, esp
  loc_005FFBB3: sub esp, 00000008h
  loc_005FFBB6: push 00403B36h ; __vbaExceptHandler
  loc_005FFBBB: mov eax, fs:[00000000h]
  loc_005FFBC1: push eax
  loc_005FFBC2: mov fs:[00000000h], esp
  loc_005FFBC9: sub esp, 00000340h
  loc_005FFBCF: push ebx
  loc_005FFBD0: push esi
  loc_005FFBD1: push edi
  loc_005FFBD2: mov var_8, esp
  loc_005FFBD5: mov var_4, 004034B8h
  loc_005FFBDC: sub esp, 00000010h
  loc_005FFBDF: mov edx, [0061A13Ch]
  loc_005FFBE5: mov edi, esp
  loc_005FFBE7: mov ecx, 0000000Ah
  loc_005FFBEC: mov var_248, ecx
  loc_005FFBF2: xor ebx, ebx
  loc_005FFBF4: mov [edi], ecx
  loc_005FFBF6: mov ecx, var_244
  loc_005FFBFC: mov eax, 80020004h
  loc_005FFC01: mov var_24, ebx
  loc_005FFC04: mov [edi+00000004h], ecx
  loc_005FFC07: mov var_34, ebx
  loc_005FFC0A: mov var_44, ebx
  loc_005FFC0D: mov var_48, ebx
  loc_005FFC10: mov var_58, ebx
  loc_005FFC13: mov var_68, ebx
  loc_005FFC16: mov var_78, ebx
  loc_005FFC19: mov var_7C, ebx
  loc_005FFC1C: mov var_8C, ebx
  loc_005FFC22: mov var_A0, ebx
  loc_005FFC28: mov var_B0, ebx
  loc_005FFC2E: mov var_C4, ebx
  loc_005FFC34: mov var_D4, ebx
  loc_005FFC3A: mov var_E4, ebx
  loc_005FFC40: mov var_F4, ebx
  loc_005FFC46: mov var_108, ebx
  loc_005FFC4C: mov var_118, ebx
  loc_005FFC52: mov var_128, ebx
  loc_005FFC58: mov var_138, ebx
  loc_005FFC5E: mov var_148, ebx
  loc_005FFC64: mov var_158, ebx
  loc_005FFC6A: mov var_168, ebx
  loc_005FFC70: mov var_17C, ebx
  loc_005FFC76: mov var_180, ebx
  loc_005FFC7C: mov var_184, ebx
  loc_005FFC82: mov var_188, ebx
  loc_005FFC88: mov var_18C, ebx
  loc_005FFC8E: mov var_190, ebx
  loc_005FFC94: mov var_194, ebx
  loc_005FFC9A: mov var_198, ebx
  loc_005FFCA0: mov var_19C, ebx
  loc_005FFCA6: mov var_1A0, ebx
  loc_005FFCAC: mov var_1A4, ebx
  loc_005FFCB2: mov var_1A8, ebx
  loc_005FFCB8: mov var_1B8, ebx
  loc_005FFCBE: mov var_1C8, ebx
  loc_005FFCC4: mov var_1D8, ebx
  loc_005FFCCA: mov var_1E8, ebx
  loc_005FFCD0: mov var_1F8, ebx
  loc_005FFCD6: mov var_208, ebx
  loc_005FFCDC: mov var_218, ebx
  loc_005FFCE2: mov var_228, ebx
  loc_005FFCE8: mov var_238, ebx
  loc_005FFCEE: mov var_258, ebx
  loc_005FFCF4: mov var_268, ebx
  loc_005FFCFA: mov var_28C, ebx
  loc_005FFD00: mov var_300, ebx
  loc_005FFD06: mov var_240, eax
  loc_005FFD0C: mov esi, [edx]
  loc_005FFD0E: mov [edi+00000008h], eax
  loc_005FFD11: mov eax, var_23C
  loc_005FFD17: push 0042A6D4h ; "Delete From TmpTotalWeek1"
  loc_005FFD1C: push edx
  loc_005FFD1D: mov var_278, ebx
  loc_005FFD23: mov var_288, ebx
  loc_005FFD29: mov [edi+0000000Ch], eax
  loc_005FFD2C: call [esi+0000005Ch]
  loc_005FFD2F: cmp eax, ebx
  loc_005FFD31: fnclex
  loc_005FFD33: jge 005FFD4Eh
  loc_005FFD35: mov ecx, [0061A13Ch]
  loc_005FFD3B: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005FFD41: push 0000005Ch
  loc_005FFD43: push 0041E928h
  loc_005FFD48: push ecx
  loc_005FFD49: push eax
  loc_005FFD4A: call edi
  loc_005FFD4C: jmp 005FFD54h
  loc_005FFD4E: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005FFD54: sub esp, 00000010h
  loc_005FFD57: mov edx, [0061A13Ch]
  loc_005FFD5D: mov esi, esp
  loc_005FFD5F: mov ecx, 0000000Ah
  loc_005FFD64: mov var_248, ecx
  loc_005FFD6A: mov eax, 80020004h
  loc_005FFD6F: mov [esi], ecx
  loc_005FFD71: mov ecx, var_244
  loc_005FFD77: mov var_240, eax
  loc_005FFD7D: mov edx, [edx]
  loc_005FFD7F: mov [esi+00000004h], ecx
  loc_005FFD82: mov ecx, [0061A13Ch]
  loc_005FFD88: push 00430ABCh ; "Delete From TmpTotalWeek2"
  loc_005FFD8D: push ecx
  loc_005FFD8E: mov [esi+00000008h], eax
  loc_005FFD91: mov eax, var_23C
  loc_005FFD97: mov [esi+0000000Ch], eax
  loc_005FFD9A: call [edx+0000005Ch]
  loc_005FFD9D: cmp eax, ebx
  loc_005FFD9F: fnclex
  loc_005FFDA1: jge 005FFDB4h
  loc_005FFDA3: mov edx, [0061A13Ch]
  loc_005FFDA9: push 0000005Ch
  loc_005FFDAB: push 0041E928h
  loc_005FFDB0: push edx
  loc_005FFDB1: push eax
  loc_005FFDB2: call edi
  loc_005FFDB4: sub esp, 00000010h
  loc_005FFDB7: mov edx, [0061A13Ch]
  loc_005FFDBD: mov esi, esp
  loc_005FFDBF: mov ecx, 0000000Ah
  loc_005FFDC4: mov var_248, ecx
  loc_005FFDCA: mov eax, 80020004h
  loc_005FFDCF: mov [esi], ecx
  loc_005FFDD1: mov ecx, var_244
  loc_005FFDD7: mov var_240, eax
  loc_005FFDDD: mov edx, [edx]
  loc_005FFDDF: mov [esi+00000004h], ecx
  loc_005FFDE2: mov ecx, [0061A13Ch]
  loc_005FFDE8: push 0042A70Ch ; "INSERT INTO TmpTotalWeek1(Agent,Amount1,LAmount1,Amount2,LAmount2,Amount3,LAmount3,Amount4,LAmount4,Amount5,LAmount5,Type1) Select Agent,Sum(Amount1),Sum(LAmount1),Sum(Amount2),Sum(LAmount2),Sum(Amount3),Sum(LAmount3),Sum(Amount4),Sum(LAmount4),Sum(Amount5),Sum(LAmount5),Type1 From TmpTotalWeek Group By Agent,Type1"
  loc_005FFDED: push ecx
  loc_005FFDEE: mov [esi+00000008h], eax
  loc_005FFDF1: mov eax, var_23C
  loc_005FFDF7: mov [esi+0000000Ch], eax
  loc_005FFDFA: call [edx+0000005Ch]
  loc_005FFDFD: cmp eax, ebx
  loc_005FFDFF: fnclex
  loc_005FFE01: jge 005FFE14h
  loc_005FFE03: mov edx, [0061A13Ch]
  loc_005FFE09: push 0000005Ch
  loc_005FFE0B: push 0041E928h
  loc_005FFE10: push edx
  loc_005FFE11: push eax
  loc_005FFE12: call edi
  loc_005FFE14: lea esi, var_184
  loc_005FFE1A: mov ecx, 0000000Ah
  loc_005FFE1F: push esi
  loc_005FFE20: mov var_268, ecx
  loc_005FFE26: sub esp, 00000010h
  loc_005FFE29: mov var_258, ecx
  loc_005FFE2F: mov esi, esp
  loc_005FFE31: mov eax, 80020004h
  loc_005FFE36: mov var_260, eax
  loc_005FFE3C: mov var_250, eax
  loc_005FFE42: mov [esi], ecx
  loc_005FFE44: mov ecx, var_264
  loc_005FFE4A: sub esp, 00000010h
  loc_005FFE4D: mov var_248, 00000003h
  loc_005FFE57: mov [esi+00000004h], ecx
  loc_005FFE5A: mov ecx, esp
  loc_005FFE5C: sub esp, 00000010h
  loc_005FFE5F: mov edx, [0061A13Ch]
  loc_005FFE65: mov [esi+00000008h], eax
  loc_005FFE68: mov eax, var_25C
  loc_005FFE6E: mov var_240, 00000004h
  loc_005FFE78: mov edx, [edx]
  loc_005FFE7A: mov [esi+0000000Ch], eax
  loc_005FFE7D: mov eax, var_258
  loc_005FFE83: mov [ecx], eax
  loc_005FFE85: mov eax, var_254
  loc_005FFE8B: mov [ecx+00000004h], eax
  loc_005FFE8E: mov eax, var_250
  loc_005FFE94: mov [ecx+00000008h], eax
  loc_005FFE97: mov eax, var_24C
  loc_005FFE9D: mov [ecx+0000000Ch], eax
  loc_005FFEA0: mov eax, var_248
  loc_005FFEA6: mov ecx, esp
  loc_005FFEA8: push 0041F1ACh ; "Select * From AgentThai"
  loc_005FFEAD: mov [ecx], eax
  loc_005FFEAF: mov eax, var_244
  loc_005FFEB5: mov [ecx+00000004h], eax
  loc_005FFEB8: mov eax, var_240
  loc_005FFEBE: mov [ecx+00000008h], eax
  loc_005FFEC1: mov eax, var_23C
  loc_005FFEC7: mov [ecx+0000000Ch], eax
  loc_005FFECA: mov ecx, [0061A13Ch]
  loc_005FFED0: push ecx
  loc_005FFED1: call [edx+000000BCh]
  loc_005FFED7: cmp eax, ebx
  loc_005FFED9: fnclex
  loc_005FFEDB: jge 005FFEF1h
  loc_005FFEDD: mov edx, [0061A13Ch]
  loc_005FFEE3: push 000000BCh
  loc_005FFEE8: push 0041E928h
  loc_005FFEED: push edx
  loc_005FFEEE: push eax
  loc_005FFEEF: call edi
  loc_005FFEF1: mov eax, var_184
  loc_005FFEF7: mov var_184, ebx
  loc_005FFEFD: push eax
  loc_005FFEFE: lea eax, var_7C
  loc_005FFF01: push eax
  loc_005FFF02: call [004010A0h] ; __vbaObjSet
  loc_005FFF08: lea esi, var_184
  loc_005FFF0E: mov ecx, 0000000Ah
  loc_005FFF13: push esi
  loc_005FFF14: mov var_268, ecx
  loc_005FFF1A: sub esp, 00000010h
  loc_005FFF1D: mov var_258, ecx
  loc_005FFF23: mov esi, esp
  loc_005FFF25: mov eax, 80020004h
  loc_005FFF2A: mov var_260, eax
  loc_005FFF30: mov var_250, eax
  loc_005FFF36: mov [esi], ecx
  loc_005FFF38: mov ecx, var_264
  loc_005FFF3E: sub esp, 00000010h
  loc_005FFF41: mov var_248, 00000003h
  loc_005FFF4B: mov [esi+00000004h], ecx
  loc_005FFF4E: mov ecx, esp
  loc_005FFF50: sub esp, 00000010h
  loc_005FFF53: mov edx, [0061A13Ch]
  loc_005FFF59: mov [esi+00000008h], eax
  loc_005FFF5C: mov eax, var_25C
  loc_005FFF62: mov var_240, 00000002h
  loc_005FFF6C: mov edx, [edx]
  loc_005FFF6E: mov [esi+0000000Ch], eax
  loc_005FFF71: mov eax, var_258
  loc_005FFF77: mov [ecx], eax
  loc_005FFF79: mov eax, var_254
  loc_005FFF7F: mov [ecx+00000004h], eax
  loc_005FFF82: mov eax, var_250
  loc_005FFF88: mov [ecx+00000008h], eax
  loc_005FFF8B: mov eax, var_24C
  loc_005FFF91: mov [ecx+0000000Ch], eax
  loc_005FFF94: mov eax, var_248
  loc_005FFF9A: mov ecx, esp
  loc_005FFF9C: push 0042D08Ch ; "Select * From TmpTotalWeek1 Order By Agent"
  loc_005FFFA1: mov [ecx], eax
  loc_005FFFA3: mov eax, var_244
  loc_005FFFA9: mov [ecx+00000004h], eax
  loc_005FFFAC: mov eax, var_240
  loc_005FFFB2: mov [ecx+00000008h], eax
  loc_005FFFB5: mov eax, var_23C
  loc_005FFFBB: mov [ecx+0000000Ch], eax
  loc_005FFFBE: mov ecx, [0061A13Ch]
  loc_005FFFC4: push ecx
  loc_005FFFC5: call [edx+000000BCh]
  loc_005FFFCB: cmp eax, ebx
  loc_005FFFCD: fnclex
  loc_005FFFCF: jge 005FFFE5h
  loc_005FFFD1: mov edx, [0061A13Ch]
  loc_005FFFD7: push 000000BCh
  loc_005FFFDC: push 0041E928h
  loc_005FFFE1: push edx
  loc_005FFFE2: push eax
  loc_005FFFE3: call edi
  loc_005FFFE5: mov eax, var_184
  loc_005FFFEB: mov var_184, ebx
  loc_005FFFF1: push eax
  loc_005FFFF2: lea eax, var_48
  loc_005FFFF5: push eax
  loc_005FFFF6: call [004010A0h] ; __vbaObjSet
  loc_005FFFFC: mov eax, var_48
  loc_005FFFFF: lea edx, var_28C
  loc_00600005: push edx
  loc_00600006: push eax
  loc_00600007: mov ecx, [eax]
  loc_00600009: call [ecx+00000034h]
  loc_0060000C: cmp eax, ebx
  loc_0060000E: fnclex
  loc_00600010: jge 00600020h
  loc_00600012: mov ecx, var_48
  loc_00600015: push 00000034h
  loc_00600017: push 0041E938h
  loc_0060001C: push ecx
  loc_0060001D: push eax
  loc_0060001E: call edi
  loc_00600020: mov eax, var_48
  loc_00600023: cmp var_28C, bx
  loc_0060002A: mov edx, [eax]
  loc_0060002C: jnz 00602574h
  loc_00600032: lea ecx, var_184
  loc_00600038: push ecx
  loc_00600039: push eax
  loc_0060003A: call [edx+000000B4h]
  loc_00600040: cmp eax, ebx
  loc_00600042: fnclex
  loc_00600044: jge 00600057h
  loc_00600046: mov edx, var_48
  loc_00600049: push 000000B4h
  loc_0060004E: push 0041E938h
  loc_00600053: push edx
  loc_00600054: push eax
  loc_00600055: call edi
  loc_00600057: lea esi, var_188
  loc_0060005D: mov eax, var_184
  loc_00600063: push esi
  loc_00600064: mov ecx, 00000008h
  loc_00600069: sub esp, 00000010h
  loc_0060006C: mov var_248, ecx
  loc_00600072: mov esi, esp
  loc_00600074: mov var_240, 00430500h ; "Amount1"
  loc_0060007E: mov edx, [eax]
  loc_00600080: push eax
  loc_00600081: mov [esi], ecx
  loc_00600083: mov ecx, var_244
  loc_00600089: mov var_294, eax
  loc_0060008F: mov [esi+00000004h], ecx
  loc_00600092: mov ecx, var_240
  loc_00600098: mov [esi+00000008h], ecx
  loc_0060009B: mov ecx, var_23C
  loc_006000A1: mov [esi+0000000Ch], ecx
  loc_006000A4: call [edx+00000030h]
  loc_006000A7: cmp eax, ebx
  loc_006000A9: fnclex
  loc_006000AB: jge 006000BEh
  loc_006000AD: mov edx, var_294
  loc_006000B3: push 00000030h
  loc_006000B5: push 0041EA14h ; "S"
  loc_006000BA: push edx
  loc_006000BB: push eax
  loc_006000BC: call edi
  loc_006000BE: mov eax, var_188
  loc_006000C4: lea edx, var_1C8
  loc_006000CA: push edx
  loc_006000CB: push eax
  loc_006000CC: mov ecx, [eax]
  loc_006000CE: mov esi, eax
  loc_006000D0: call [ecx+00000044h]
  loc_006000D3: cmp eax, ebx
  loc_006000D5: fnclex
  loc_006000D7: jge 006000E4h
  loc_006000D9: push 00000044h
  loc_006000DB: push 0041EA48h
  loc_006000E0: push esi
  loc_006000E1: push eax
  loc_006000E2: call edi
  loc_006000E4: mov eax, var_48
  loc_006000E7: lea edx, var_18C
  loc_006000ED: push edx
  loc_006000EE: push eax
  loc_006000EF: mov ecx, [eax]
  loc_006000F1: call [ecx+000000B4h]
  loc_006000F7: cmp eax, ebx
  loc_006000F9: fnclex
  loc_006000FB: jge 0060010Eh
  loc_006000FD: mov ecx, var_48
  loc_00600100: push 000000B4h
  loc_00600105: push 0041E938h
  loc_0060010A: push ecx
  loc_0060010B: push eax
  loc_0060010C: call edi
  loc_0060010E: lea esi, var_190
  loc_00600114: mov eax, var_18C
  loc_0060011A: push esi
  loc_0060011B: mov ecx, 00000008h
  loc_00600120: sub esp, 00000010h
  loc_00600123: mov var_258, ecx
  loc_00600129: mov esi, esp
  loc_0060012B: mov var_250, 0042DC28h ; "Amount2"
  loc_00600135: mov edx, [eax]
  loc_00600137: push eax
  loc_00600138: mov [esi], ecx
  loc_0060013A: mov ecx, var_254
  loc_00600140: mov var_2A8, eax
  loc_00600146: mov [esi+00000004h], ecx
  loc_00600149: mov ecx, var_250
  loc_0060014F: mov [esi+00000008h], ecx
  loc_00600152: mov ecx, var_24C
  loc_00600158: mov [esi+0000000Ch], ecx
  loc_0060015B: call [edx+00000030h]
  loc_0060015E: cmp eax, ebx
  loc_00600160: fnclex
  loc_00600162: jge 00600175h
  loc_00600164: mov edx, var_2A8
  loc_0060016A: push 00000030h
  loc_0060016C: push 0041EA14h ; "S"
  loc_00600171: push edx
  loc_00600172: push eax
  loc_00600173: call edi
  loc_00600175: mov eax, var_190
  loc_0060017B: lea edx, var_1B8
  loc_00600181: push edx
  loc_00600182: push eax
  loc_00600183: mov ecx, [eax]
  loc_00600185: mov esi, eax
  loc_00600187: call [ecx+00000044h]
  loc_0060018A: cmp eax, ebx
  loc_0060018C: fnclex
  loc_0060018E: jge 0060019Bh
  loc_00600190: push 00000044h
  loc_00600192: push 0041EA48h
  loc_00600197: push esi
  loc_00600198: push eax
  loc_00600199: call edi
  loc_0060019B: mov eax, var_48
  loc_0060019E: lea edx, var_194
  loc_006001A4: push edx
  loc_006001A5: push eax
  loc_006001A6: mov ecx, [eax]
  loc_006001A8: call [ecx+000000B4h]
  loc_006001AE: cmp eax, ebx
  loc_006001B0: fnclex
  loc_006001B2: jge 006001C5h
  loc_006001B4: mov ecx, var_48
  loc_006001B7: push 000000B4h
  loc_006001BC: push 0041E938h
  loc_006001C1: push ecx
  loc_006001C2: push eax
  loc_006001C3: call edi
  loc_006001C5: lea esi, var_198
  loc_006001CB: mov eax, var_194
  loc_006001D1: push esi
  loc_006001D2: mov ecx, 00000008h
  loc_006001D7: sub esp, 00000010h
  loc_006001DA: mov var_268, ecx
  loc_006001E0: mov esi, esp
  loc_006001E2: mov var_260, 0042DC3Ch ; "Amount3"
  loc_006001EC: mov edx, [eax]
  loc_006001EE: push eax
  loc_006001EF: mov [esi], ecx
  loc_006001F1: mov ecx, var_264
  loc_006001F7: mov var_2BC, eax
  loc_006001FD: mov [esi+00000004h], ecx
  loc_00600200: mov ecx, var_260
  loc_00600206: mov [esi+00000008h], ecx
  loc_00600209: mov ecx, var_25C
  loc_0060020F: mov [esi+0000000Ch], ecx
  loc_00600212: call [edx+00000030h]
  loc_00600215: cmp eax, ebx
  loc_00600217: fnclex
  loc_00600219: jge 0060022Ch
  loc_0060021B: mov edx, var_2BC
  loc_00600221: push 00000030h
  loc_00600223: push 0041EA14h ; "S"
  loc_00600228: push edx
  loc_00600229: push eax
  loc_0060022A: call edi
  loc_0060022C: mov eax, var_198
  loc_00600232: lea edx, var_1E8
  loc_00600238: push edx
  loc_00600239: push eax
  loc_0060023A: mov ecx, [eax]
  loc_0060023C: mov esi, eax
  loc_0060023E: call [ecx+00000044h]
  loc_00600241: cmp eax, ebx
  loc_00600243: fnclex
  loc_00600245: jge 00600252h
  loc_00600247: push 00000044h
  loc_00600249: push 0041EA48h
  loc_0060024E: push esi
  loc_0060024F: push eax
  loc_00600250: call edi
  loc_00600252: mov eax, var_48
  loc_00600255: lea edx, var_19C
  loc_0060025B: push edx
  loc_0060025C: push eax
  loc_0060025D: mov ecx, [eax]
  loc_0060025F: call [ecx+000000B4h]
  loc_00600265: cmp eax, ebx
  loc_00600267: fnclex
  loc_00600269: jge 0060027Ch
  loc_0060026B: mov ecx, var_48
  loc_0060026E: push 000000B4h
  loc_00600273: push 0041E938h
  loc_00600278: push ecx
  loc_00600279: push eax
  loc_0060027A: call edi
  loc_0060027C: lea esi, var_1A0
  loc_00600282: mov eax, var_19C
  loc_00600288: push esi
  loc_00600289: mov ecx, 00000008h
  loc_0060028E: sub esp, 00000010h
  loc_00600291: mov edx, [eax]
  loc_00600293: mov esi, esp
  loc_00600295: mov var_2D0, eax
  loc_0060029B: push eax
  loc_0060029C: mov [esi], ecx
  loc_0060029E: mov ecx, var_274
  loc_006002A4: mov [esi+00000004h], ecx
  loc_006002A7: mov ecx, 0042DC50h ; "Amount4"
  loc_006002AC: mov [esi+00000008h], ecx
  loc_006002AF: mov ecx, var_26C
  loc_006002B5: mov [esi+0000000Ch], ecx
  loc_006002B8: call [edx+00000030h]
  loc_006002BB: cmp eax, ebx
  loc_006002BD: fnclex
  loc_006002BF: jge 006002D2h
  loc_006002C1: mov edx, var_2D0
  loc_006002C7: push 00000030h
  loc_006002C9: push 0041EA14h ; "S"
  loc_006002CE: push edx
  loc_006002CF: push eax
  loc_006002D0: call edi
  loc_006002D2: mov eax, var_1A0
  loc_006002D8: lea edx, var_208
  loc_006002DE: push edx
  loc_006002DF: push eax
  loc_006002E0: mov ecx, [eax]
  loc_006002E2: mov esi, eax
  loc_006002E4: call [ecx+00000044h]
  loc_006002E7: cmp eax, ebx
  loc_006002E9: fnclex
  loc_006002EB: jge 006002F8h
  loc_006002ED: push 00000044h
  loc_006002EF: push 0041EA48h
  loc_006002F4: push esi
  loc_006002F5: push eax
  loc_006002F6: call edi
  loc_006002F8: mov eax, var_48
  loc_006002FB: lea edx, var_1A4
  loc_00600301: push edx
  loc_00600302: push eax
  loc_00600303: mov ecx, [eax]
  loc_00600305: call [ecx+000000B4h]
  loc_0060030B: cmp eax, ebx
  loc_0060030D: fnclex
  loc_0060030F: jge 00600322h
  loc_00600311: mov ecx, var_48
  loc_00600314: push 000000B4h
  loc_00600319: push 0041E938h
  loc_0060031E: push ecx
  loc_0060031F: push eax
  loc_00600320: call edi
  loc_00600322: lea ebx, var_1A8
  loc_00600328: mov eax, var_1A4
  loc_0060032E: push ebx
  loc_0060032F: mov edx, 00000008h
  loc_00600334: sub esp, 00000010h
  loc_00600337: mov esi, [eax]
  loc_00600339: mov ebx, esp
  loc_0060033B: mov ecx, 0042E020h ; "Amount5"
  loc_00600340: push eax
  loc_00600341: mov var_2E4, eax
  loc_00600347: mov [ebx], edx
  loc_00600349: mov edx, var_284
  loc_0060034F: mov [ebx+00000004h], edx
  loc_00600352: mov [ebx+00000008h], ecx
  loc_00600355: mov ecx, var_27C
  loc_0060035B: mov [ebx+0000000Ch], ecx
  loc_0060035E: call [esi+00000030h]
  loc_00600361: test eax, eax
  loc_00600363: fnclex
  loc_00600365: jge 00600378h
  loc_00600367: mov edx, var_2E4
  loc_0060036D: push 00000030h
  loc_0060036F: push 0041EA14h ; "S"
  loc_00600374: push edx
  loc_00600375: push eax
  loc_00600376: call edi
  loc_00600378: mov eax, var_1A8
  loc_0060037E: lea edx, var_228
  loc_00600384: push edx
  loc_00600385: push eax
  loc_00600386: mov ecx, [eax]
  loc_00600388: mov esi, eax
  loc_0060038A: call [ecx+00000044h]
  loc_0060038D: test eax, eax
  loc_0060038F: fnclex
  loc_00600391: jge 0060039Eh
  loc_00600393: push 00000044h
  loc_00600395: push 0041EA48h
  loc_0060039A: push esi
  loc_0060039B: push eax
  loc_0060039C: call edi
  loc_0060039E: mov esi, [00401234h] ; __vbaVarAdd
  loc_006003A4: lea eax, var_1C8
  loc_006003AA: lea ecx, var_1B8
  loc_006003B0: push eax
  loc_006003B1: lea edx, var_1D8
  loc_006003B7: push ecx
  loc_006003B8: push edx
  loc_006003B9: call __vbaVarAdd
  loc_006003BB: push eax
  loc_006003BC: lea eax, var_1E8
  loc_006003C2: lea ecx, var_1F8
  loc_006003C8: push eax
  loc_006003C9: push ecx
  loc_006003CA: call __vbaVarAdd
  loc_006003CC: push eax
  loc_006003CD: lea edx, var_208
  loc_006003D3: lea eax, var_218
  loc_006003D9: push edx
  loc_006003DA: push eax
  loc_006003DB: call __vbaVarAdd
  loc_006003DD: lea ecx, var_228
  loc_006003E3: push eax
  loc_006003E4: lea edx, var_238
  loc_006003EA: push ecx
  loc_006003EB: push edx
  loc_006003EC: call __vbaVarAdd
  loc_006003EE: mov esi, [00401014h] ; __vbaVarMove
  loc_006003F4: mov edx, eax
  loc_006003F6: lea ecx, var_78
  loc_006003F9: call __vbaVarMove
  loc_006003FB: lea eax, var_1A8
  loc_00600401: lea ecx, var_1A4
  loc_00600407: push eax
  loc_00600408: lea edx, var_1A0
  loc_0060040E: push ecx
  loc_0060040F: lea eax, var_19C
  loc_00600415: push edx
  loc_00600416: lea ecx, var_198
  loc_0060041C: push eax
  loc_0060041D: lea edx, var_194
  loc_00600423: push ecx
  loc_00600424: lea eax, var_188
  loc_0060042A: push edx
  loc_0060042B: lea ecx, var_190
  loc_00600431: push eax
  loc_00600432: lea edx, var_18C
  loc_00600438: push ecx
  loc_00600439: lea eax, var_184
  loc_0060043F: push edx
  loc_00600440: push eax
  loc_00600441: push 0000000Ah
  loc_00600443: call [00401040h] ; __vbaFreeObjList
  loc_00600449: lea ecx, var_228
  loc_0060044F: lea edx, var_218
  loc_00600455: push ecx
  loc_00600456: lea eax, var_208
  loc_0060045C: push edx
  loc_0060045D: lea ecx, var_1F8
  loc_00600463: push eax
  loc_00600464: lea edx, var_1E8
  loc_0060046A: push ecx
  loc_0060046B: lea eax, var_1D8
  loc_00600471: push edx
  loc_00600472: lea ecx, var_1B8
  loc_00600478: push eax
  loc_00600479: lea edx, var_1C8
  loc_0060047F: push ecx
  loc_00600480: push edx
  loc_00600481: push 00000008h
  loc_00600483: call [00401038h] ; __vbaFreeVarList
  loc_00600489: mov ebx, 00000002h
  loc_0060048E: add esp, 00000050h
  loc_00600491: lea edx, var_248
  loc_00600497: lea ecx, var_118
  loc_0060049D: mov var_240, 00000000h
  loc_006004A7: mov var_248, ebx
  loc_006004AD: call __vbaVarMove
  loc_006004AF: xor eax, eax
  loc_006004B1: mov var_248, ebx
  loc_006004B7: mov var_B4, eax
  loc_006004BD: mov var_240, eax
  loc_006004C3: lea edx, var_248
  loc_006004C9: lea ecx, var_F4
  loc_006004CF: call __vbaVarMove
  loc_006004D1: mov eax, var_48
  loc_006004D4: lea edx, var_184
  loc_006004DA: mov var_250, 00429148h ; "AgentName='"
  loc_006004E4: mov var_258, 00000008h
  loc_006004EE: mov ecx, [eax]
  loc_006004F0: push edx
  loc_006004F1: push eax
  loc_006004F2: call [ecx+000000B4h]
  loc_006004F8: test eax, eax
  loc_006004FA: fnclex
  loc_006004FC: jge 0060050Fh
  loc_006004FE: mov ecx, var_48
  loc_00600501: push 000000B4h
  loc_00600506: push 0041E938h
  loc_0060050B: push ecx
  loc_0060050C: push eax
  loc_0060050D: call edi
  loc_0060050F: lea ebx, var_188
  loc_00600515: mov eax, var_184
  loc_0060051B: push ebx
  loc_0060051C: mov edx, 00000008h
  loc_00600521: sub esp, 00000010h
  loc_00600524: mov var_248, edx
  loc_0060052A: mov ebx, esp
  loc_0060052C: mov ecx, 0041F3E0h ; "Agent"
  loc_00600531: mov var_240, ecx
  loc_00600537: mov esi, [eax]
  loc_00600539: mov [ebx], edx
  loc_0060053B: mov edx, var_244
  loc_00600541: push eax
  loc_00600542: mov var_294, eax
  loc_00600548: mov [ebx+00000004h], edx
  loc_0060054B: mov [ebx+00000008h], ecx
  loc_0060054E: mov ecx, var_23C
  loc_00600554: mov [ebx+0000000Ch], ecx
  loc_00600557: call [esi+00000030h]
  loc_0060055A: test eax, eax
  loc_0060055C: fnclex
  loc_0060055E: jge 00600571h
  loc_00600560: mov edx, var_294
  loc_00600566: push 00000030h
  loc_00600568: push 0041EA14h ; "S"
  loc_0060056D: push edx
  loc_0060056E: push eax
  loc_0060056F: call edi
  loc_00600571: mov eax, var_188
  loc_00600577: lea ecx, var_1C8
  loc_0060057D: mov var_1B0, eax
  loc_00600583: lea eax, var_1B8
  loc_00600589: push eax
  loc_0060058A: push ecx
  loc_0060058B: mov var_188, 00000000h
  loc_00600595: mov var_1B8, 00000009h
  loc_0060059F: call [004010D4h] ; rtcTrimVar
  loc_006005A5: mov edx, var_7C
  loc_006005A8: mov esi, [004011B4h] ; __vbaVarCat
  loc_006005AE: mov var_260, 0041E890h ; "'"
  loc_006005B8: mov var_268, 00000008h
  loc_006005C2: mov ebx, [edx]
  loc_006005C4: lea eax, var_258
  loc_006005CA: lea ecx, var_1C8
  loc_006005D0: push eax
  loc_006005D1: lea edx, var_1D8
  loc_006005D7: push ecx
  loc_006005D8: push edx
  loc_006005D9: call __vbaVarCat
  loc_006005DB: push eax
  loc_006005DC: lea eax, var_268
  loc_006005E2: lea ecx, var_1E8
  loc_006005E8: push eax
  loc_006005E9: push ecx
  loc_006005EA: call __vbaVarCat
  loc_006005EC: lea edx, var_180
  loc_006005F2: push eax
  loc_006005F3: push edx
  loc_006005F4: call [004011B0h] ; __vbaStrVarVal
  loc_006005FA: push eax
  loc_006005FB: mov eax, var_7C
  loc_006005FE: push eax
  loc_006005FF: call [ebx+000000D4h]
  loc_00600605: test eax, eax
  loc_00600607: fnclex
  loc_00600609: jge 0060061Ch
  loc_0060060B: mov ecx, var_7C
  loc_0060060E: push 000000D4h
  loc_00600613: push 0041E938h
  loc_00600618: push ecx
  loc_00600619: push eax
  loc_0060061A: call edi
  loc_0060061C: lea ecx, var_180
  loc_00600622: call [004012ACh] ; __vbaFreeStr
  loc_00600628: lea ecx, var_184
  loc_0060062E: call [004012B0h] ; __vbaFreeObj
  loc_00600634: lea edx, var_1E8
  loc_0060063A: lea eax, var_1D8
  loc_00600640: push edx
  loc_00600641: lea ecx, var_1C8
  loc_00600647: push eax
  loc_00600648: lea edx, var_1B8
  loc_0060064E: push ecx
  loc_0060064F: push edx
  loc_00600650: push 00000004h
  loc_00600652: call [00401038h] ; __vbaFreeVarList
  loc_00600658: mov eax, var_7C
  loc_0060065B: add esp, 00000014h
  loc_0060065E: lea edx, var_28C
  loc_00600664: mov ecx, [eax]
  loc_00600666: push edx
  loc_00600667: push eax
  loc_00600668: call [ecx+0000005Ch]
  loc_0060066B: test eax, eax
  loc_0060066D: fnclex
  loc_0060066F: jge 0060067Fh
  loc_00600671: mov ecx, var_7C
  loc_00600674: push 0000005Ch
  loc_00600676: push 0041E938h
  loc_0060067B: push ecx
  loc_0060067C: push eax
  loc_0060067D: call edi
  loc_0060067F: cmp var_28C, 0000h
  loc_00600687: jnz 00600967h
  loc_0060068D: mov eax, var_7C
  loc_00600690: lea ecx, var_184
  loc_00600696: push ecx
  loc_00600697: push eax
  loc_00600698: mov edx, [eax]
  loc_0060069A: call [edx+000000B4h]
  loc_006006A0: test eax, eax
  loc_006006A2: fnclex
  loc_006006A4: jge 006006B7h
  loc_006006A6: mov edx, var_7C
  loc_006006A9: push 000000B4h
  loc_006006AE: push 0041E938h
  loc_006006B3: push edx
  loc_006006B4: push eax
  loc_006006B5: call edi
  loc_006006B7: lea ebx, var_188
  loc_006006BD: mov eax, var_184
  loc_006006C3: push ebx
  loc_006006C4: mov edx, 00000008h
  loc_006006C9: sub esp, 00000010h
  loc_006006CC: mov var_248, edx
  loc_006006D2: mov ebx, esp
  loc_006006D4: mov ecx, 0041F20Ch ; "Commision"
  loc_006006D9: mov var_240, ecx
  loc_006006DF: mov esi, [eax]
  loc_006006E1: mov [ebx], edx
  loc_006006E3: mov edx, var_244
  loc_006006E9: push eax
  loc_006006EA: mov var_294, eax
  loc_006006F0: mov [ebx+00000004h], edx
  loc_006006F3: mov [ebx+00000008h], ecx
  loc_006006F6: mov ecx, var_23C
  loc_006006FC: mov [ebx+0000000Ch], ecx
  loc_006006FF: call [esi+00000030h]
  loc_00600702: test eax, eax
  loc_00600704: fnclex
  loc_00600706: jge 00600719h
  loc_00600708: mov edx, var_294
  loc_0060070E: push 00000030h
  loc_00600710: push 0041EA14h ; "S"
  loc_00600715: push edx
  loc_00600716: push eax
  loc_00600717: call edi
  loc_00600719: mov eax, var_188
  loc_0060071F: lea edx, var_1B8
  loc_00600725: push edx
  loc_00600726: push eax
  loc_00600727: mov ecx, [eax]
  loc_00600729: mov esi, eax
  loc_0060072B: call [ecx+00000044h]
  loc_0060072E: test eax, eax
  loc_00600730: fnclex
  loc_00600732: jge 0060073Fh
  loc_00600734: push 00000044h
  loc_00600736: push 0041EA48h
  loc_0060073B: push esi
  loc_0060073C: push eax
  loc_0060073D: call edi
  loc_0060073F: lea eax, var_78
  loc_00600742: lea ecx, var_1B8
  loc_00600748: push eax
  loc_00600749: lea edx, var_1C8
  loc_0060074F: push ecx
  loc_00600750: push edx
  loc_00600751: mov var_250, 00000064h
  loc_0060075B: mov var_258, 00000002h
  loc_00600765: call [00401170h] ; __vbaVarMul
  loc_0060076B: push eax
  loc_0060076C: lea eax, var_258
  loc_00600772: lea ecx, var_1D8
  loc_00600778: push eax
  loc_00600779: push ecx
  loc_0060077A: call [00401198h] ; __vbaVarDiv
  loc_00600780: mov edx, eax
  loc_00600782: lea ecx, var_8C
  loc_00600788: call [00401014h] ; __vbaVarMove
  loc_0060078E: lea edx, var_188
  loc_00600794: lea eax, var_184
  loc_0060079A: push edx
  loc_0060079B: push eax
  loc_0060079C: push 00000002h
  loc_0060079E: call [00401040h] ; __vbaFreeObjList
  loc_006007A4: add esp, 0000000Ch
  loc_006007A7: lea ecx, var_1B8
  loc_006007AD: call [00401020h] ; __vbaFreeVar
  loc_006007B3: mov eax, var_7C
  loc_006007B6: lea edx, var_184
  loc_006007BC: push edx
  loc_006007BD: push eax
  loc_006007BE: mov ecx, [eax]
  loc_006007C0: call [ecx+000000B4h]
  loc_006007C6: test eax, eax
  loc_006007C8: fnclex
  loc_006007CA: jge 006007DDh
  loc_006007CC: mov ecx, var_7C
  loc_006007CF: push 000000B4h
  loc_006007D4: push 0041E938h
  loc_006007D9: push ecx
  loc_006007DA: push eax
  loc_006007DB: call edi
  loc_006007DD: lea ebx, var_188
  loc_006007E3: mov eax, var_184
  loc_006007E9: push ebx
  loc_006007EA: mov edx, 00000008h
  loc_006007EF: sub esp, 00000010h
  loc_006007F2: mov var_248, edx
  loc_006007F8: mov ebx, esp
  loc_006007FA: mov ecx, 0041F224h ; "Rate"
  loc_006007FF: mov var_240, ecx
  loc_00600805: mov esi, [eax]
  loc_00600807: mov [ebx], edx
  loc_00600809: mov edx, var_244
  loc_0060080F: push eax
  loc_00600810: mov var_294, eax
  loc_00600816: mov [ebx+00000004h], edx
  loc_00600819: mov [ebx+00000008h], ecx
  loc_0060081C: mov ecx, var_23C
  loc_00600822: mov [ebx+0000000Ch], ecx
  loc_00600825: call [esi+00000030h]
  loc_00600828: test eax, eax
  loc_0060082A: fnclex
  loc_0060082C: jge 0060083Fh
  loc_0060082E: mov edx, var_294
  loc_00600834: push 00000030h
  loc_00600836: push 0041EA14h ; "S"
  loc_0060083B: push edx
  loc_0060083C: push eax
  loc_0060083D: call edi
  loc_0060083F: mov eax, var_188
  loc_00600845: lea edx, var_1B8
  loc_0060084B: lea ecx, var_118
  loc_00600851: mov var_188, 00000000h
  loc_0060085B: mov var_1B0, eax
  loc_00600861: mov var_1B8, 00000009h
  loc_0060086B: call [00401014h] ; __vbaVarMove
  loc_00600871: lea ecx, var_184
  loc_00600877: call [004012B0h] ; __vbaFreeObj
  loc_0060087D: mov eax, var_7C
  loc_00600880: lea edx, var_184
  loc_00600886: push edx
  loc_00600887: push eax
  loc_00600888: mov ecx, [eax]
  loc_0060088A: call [ecx+000000B4h]
  loc_00600890: test eax, eax
  loc_00600892: fnclex
  loc_00600894: jge 006008A7h
  loc_00600896: mov ecx, var_7C
  loc_00600899: push 000000B4h
  loc_0060089E: push 0041E938h
  loc_006008A3: push ecx
  loc_006008A4: push eax
  loc_006008A5: call edi
  loc_006008A7: lea ebx, var_188
  loc_006008AD: mov eax, var_184
  loc_006008B3: push ebx
  loc_006008B4: mov edx, 00000008h
  loc_006008B9: sub esp, 00000010h
  loc_006008BC: mov var_248, edx
  loc_006008C2: mov ebx, esp
  loc_006008C4: mov ecx, 0041F20Ch ; "Commision"
  loc_006008C9: mov var_240, ecx
  loc_006008CF: mov esi, [eax]
  loc_006008D1: mov [ebx], edx
  loc_006008D3: mov edx, var_244
  loc_006008D9: push eax
  loc_006008DA: mov var_294, eax
  loc_006008E0: mov [ebx+00000004h], edx
  loc_006008E3: mov [ebx+00000008h], ecx
  loc_006008E6: mov ecx, var_23C
  loc_006008EC: mov [ebx+0000000Ch], ecx
  loc_006008EF: call [esi+00000030h]
  loc_006008F2: test eax, eax
  loc_006008F4: fnclex
  loc_006008F6: jge 00600909h
  loc_006008F8: mov edx, var_294
  loc_006008FE: push 00000030h
  loc_00600900: push 0041EA14h ; "S"
  loc_00600905: push edx
  loc_00600906: push eax
  loc_00600907: call edi
  loc_00600909: mov eax, var_188
  loc_0060090F: lea edx, var_1B8
  loc_00600915: push edx
  loc_00600916: push eax
  loc_00600917: mov ecx, [eax]
  loc_00600919: mov esi, eax
  loc_0060091B: call [ecx+00000044h]
  loc_0060091E: test eax, eax
  loc_00600920: fnclex
  loc_00600922: jge 0060092Fh
  loc_00600924: push 00000044h
  loc_00600926: push 0041EA48h
  loc_0060092B: push esi
  loc_0060092C: push eax
  loc_0060092D: call edi
  loc_0060092F: lea eax, var_1B8
  loc_00600935: push eax
  loc_00600936: call [004011C0h] ; __vbaI2Var
  loc_0060093C: lea ecx, var_188
  loc_00600942: lea edx, var_184
  loc_00600948: push ecx
  loc_00600949: push edx
  loc_0060094A: push 00000002h
  loc_0060094C: mov var_B4, eax
  loc_00600952: call [00401040h] ; __vbaFreeObjList
  loc_00600958: add esp, 0000000Ch
  loc_0060095B: lea ecx, var_1B8
  loc_00600961: call [00401020h] ; __vbaFreeVar
  loc_00600967: mov eax, var_48
  loc_0060096A: lea edx, var_184
  loc_00600970: push edx
  loc_00600971: push eax
  loc_00600972: mov ecx, [eax]
  loc_00600974: call [ecx+000000B4h]
  loc_0060097A: test eax, eax
  loc_0060097C: fnclex
  loc_0060097E: jge 00600991h
  loc_00600980: mov ecx, var_48
  loc_00600983: push 000000B4h
  loc_00600988: push 0041E938h
  loc_0060098D: push ecx
  loc_0060098E: push eax
  loc_0060098F: call edi
  loc_00600991: lea ebx, var_188
  loc_00600997: mov eax, var_184
  loc_0060099D: push ebx
  loc_0060099E: mov edx, 00000008h
  loc_006009A3: sub esp, 00000010h
  loc_006009A6: mov var_248, edx
  loc_006009AC: mov ebx, esp
  loc_006009AE: mov ecx, 0042F71Ch ; "LAmount1"
  loc_006009B3: mov var_240, ecx
  loc_006009B9: mov esi, [eax]
  loc_006009BB: mov [ebx], edx
  loc_006009BD: mov edx, var_244
  loc_006009C3: push eax
  loc_006009C4: mov var_294, eax
  loc_006009CA: mov [ebx+00000004h], edx
  loc_006009CD: mov [ebx+00000008h], ecx
  loc_006009D0: mov ecx, var_23C
  loc_006009D6: mov [ebx+0000000Ch], ecx
  loc_006009D9: call [esi+00000030h]
  loc_006009DC: test eax, eax
  loc_006009DE: fnclex
  loc_006009E0: jge 006009F3h
  loc_006009E2: mov edx, var_294
  loc_006009E8: push 00000030h
  loc_006009EA: push 0041EA14h ; "S"
  loc_006009EF: push edx
  loc_006009F0: push eax
  loc_006009F1: call edi
  loc_006009F3: mov eax, var_188
  loc_006009F9: lea edx, var_1C8
  loc_006009FF: push edx
  loc_00600A00: push eax
  loc_00600A01: mov ecx, [eax]
  loc_00600A03: mov esi, eax
  loc_00600A05: call [ecx+00000044h]
  loc_00600A08: test eax, eax
  loc_00600A0A: fnclex
  loc_00600A0C: jge 00600A19h
  loc_00600A0E: push 00000044h
  loc_00600A10: push 0041EA48h
  loc_00600A15: push esi
  loc_00600A16: push eax
  loc_00600A17: call edi
  loc_00600A19: mov eax, var_48
  loc_00600A1C: lea edx, var_18C
  loc_00600A22: push edx
  loc_00600A23: push eax
  loc_00600A24: mov ecx, [eax]
  loc_00600A26: call [ecx+000000B4h]
  loc_00600A2C: test eax, eax
  loc_00600A2E: fnclex
  loc_00600A30: jge 00600A43h
  loc_00600A32: mov ecx, var_48
  loc_00600A35: push 000000B4h
  loc_00600A3A: push 0041E938h
  loc_00600A3F: push ecx
  loc_00600A40: push eax
  loc_00600A41: call edi
  loc_00600A43: lea ebx, var_190
  loc_00600A49: mov eax, var_18C
  loc_00600A4F: push ebx
  loc_00600A50: mov edx, 00000008h
  loc_00600A55: sub esp, 00000010h
  loc_00600A58: mov var_258, edx
  loc_00600A5E: mov ebx, esp
  loc_00600A60: mov ecx, 0042CE80h ; "LAmount2"
  loc_00600A65: mov var_250, ecx
  loc_00600A6B: mov esi, [eax]
  loc_00600A6D: mov [ebx], edx
  loc_00600A6F: mov edx, var_254
  loc_00600A75: push eax
  loc_00600A76: mov var_2A8, eax
  loc_00600A7C: mov [ebx+00000004h], edx
  loc_00600A7F: mov [ebx+00000008h], ecx
  loc_00600A82: mov ecx, var_24C
  loc_00600A88: mov [ebx+0000000Ch], ecx
  loc_00600A8B: call [esi+00000030h]
  loc_00600A8E: test eax, eax
  loc_00600A90: fnclex
  loc_00600A92: jge 00600AA5h
  loc_00600A94: mov edx, var_2A8
  loc_00600A9A: push 00000030h
  loc_00600A9C: push 0041EA14h ; "S"
  loc_00600AA1: push edx
  loc_00600AA2: push eax
  loc_00600AA3: call edi
  loc_00600AA5: mov eax, var_190
  loc_00600AAB: lea edx, var_1B8
  loc_00600AB1: push edx
  loc_00600AB2: push eax
  loc_00600AB3: mov ecx, [eax]
  loc_00600AB5: mov esi, eax
  loc_00600AB7: call [ecx+00000044h]
  loc_00600ABA: test eax, eax
  loc_00600ABC: fnclex
  loc_00600ABE: jge 00600ACBh
  loc_00600AC0: push 00000044h
  loc_00600AC2: push 0041EA48h
  loc_00600AC7: push esi
  loc_00600AC8: push eax
  loc_00600AC9: call edi
  loc_00600ACB: mov eax, var_48
  loc_00600ACE: lea edx, var_194
  loc_00600AD4: push edx
  loc_00600AD5: push eax
  loc_00600AD6: mov ecx, [eax]
  loc_00600AD8: call [ecx+000000B4h]
  loc_00600ADE: test eax, eax
  loc_00600AE0: fnclex
  loc_00600AE2: jge 00600AF5h
  loc_00600AE4: mov ecx, var_48
  loc_00600AE7: push 000000B4h
  loc_00600AEC: push 0041E938h
  loc_00600AF1: push ecx
  loc_00600AF2: push eax
  loc_00600AF3: call edi
  loc_00600AF5: lea ebx, var_198
  loc_00600AFB: mov eax, var_194
  loc_00600B01: push ebx
  loc_00600B02: mov edx, 00000008h
  loc_00600B07: sub esp, 00000010h
  loc_00600B0A: mov var_268, edx
  loc_00600B10: mov ebx, esp
  loc_00600B12: mov ecx, 0042CE98h ; "LAmount3"
  loc_00600B17: mov var_260, ecx
  loc_00600B1D: mov esi, [eax]
  loc_00600B1F: mov [ebx], edx
  loc_00600B21: mov edx, var_264
  loc_00600B27: push eax
  loc_00600B28: mov var_2BC, eax
  loc_00600B2E: mov [ebx+00000004h], edx
  loc_00600B31: mov [ebx+00000008h], ecx
  loc_00600B34: mov ecx, var_25C
  loc_00600B3A: mov [ebx+0000000Ch], ecx
  loc_00600B3D: call [esi+00000030h]
  loc_00600B40: test eax, eax
  loc_00600B42: fnclex
  loc_00600B44: jge 00600B57h
  loc_00600B46: mov edx, var_2BC
  loc_00600B4C: push 00000030h
  loc_00600B4E: push 0041EA14h ; "S"
  loc_00600B53: push edx
  loc_00600B54: push eax
  loc_00600B55: call edi
  loc_00600B57: mov eax, var_198
  loc_00600B5D: lea edx, var_1E8
  loc_00600B63: push edx
  loc_00600B64: push eax
  loc_00600B65: mov ecx, [eax]
  loc_00600B67: mov esi, eax
  loc_00600B69: call [ecx+00000044h]
  loc_00600B6C: test eax, eax
  loc_00600B6E: fnclex
  loc_00600B70: jge 00600B7Dh
  loc_00600B72: push 00000044h
  loc_00600B74: push 0041EA48h
  loc_00600B79: push esi
  loc_00600B7A: push eax
  loc_00600B7B: call edi
  loc_00600B7D: mov eax, var_48
  loc_00600B80: lea edx, var_19C
  loc_00600B86: push edx
  loc_00600B87: push eax
  loc_00600B88: mov ecx, [eax]
  loc_00600B8A: call [ecx+000000B4h]
  loc_00600B90: test eax, eax
  loc_00600B92: fnclex
  loc_00600B94: jge 00600BA7h
  loc_00600B96: mov ecx, var_48
  loc_00600B99: push 000000B4h
  loc_00600B9E: push 0041E938h
  loc_00600BA3: push ecx
  loc_00600BA4: push eax
  loc_00600BA5: call edi
  loc_00600BA7: lea ebx, var_1A0
  loc_00600BAD: mov eax, var_19C
  loc_00600BB3: push ebx
  loc_00600BB4: mov edx, 00000008h
  loc_00600BB9: sub esp, 00000010h
  loc_00600BBC: mov esi, [eax]
  loc_00600BBE: mov ebx, esp
  loc_00600BC0: mov ecx, 0042CEB0h ; "LAmount4"
  loc_00600BC5: push eax
  loc_00600BC6: mov var_2D0, eax
  loc_00600BCC: mov [ebx], edx
  loc_00600BCE: mov edx, var_274
  loc_00600BD4: mov [ebx+00000004h], edx
  loc_00600BD7: mov [ebx+00000008h], ecx
  loc_00600BDA: mov ecx, var_26C
  loc_00600BE0: mov [ebx+0000000Ch], ecx
  loc_00600BE3: call [esi+00000030h]
  loc_00600BE6: test eax, eax
  loc_00600BE8: fnclex
  loc_00600BEA: jge 00600BFDh
  loc_00600BEC: mov edx, var_2D0
  loc_00600BF2: push 00000030h
  loc_00600BF4: push 0041EA14h ; "S"
  loc_00600BF9: push edx
  loc_00600BFA: push eax
  loc_00600BFB: call edi
  loc_00600BFD: mov eax, var_1A0
  loc_00600C03: lea edx, var_208
  loc_00600C09: push edx
  loc_00600C0A: push eax
  loc_00600C0B: mov ecx, [eax]
  loc_00600C0D: mov esi, eax
  loc_00600C0F: call [ecx+00000044h]
  loc_00600C12: test eax, eax
  loc_00600C14: fnclex
  loc_00600C16: jge 00600C23h
  loc_00600C18: push 00000044h
  loc_00600C1A: push 0041EA48h
  loc_00600C1F: push esi
  loc_00600C20: push eax
  loc_00600C21: call edi
  loc_00600C23: mov eax, var_48
  loc_00600C26: lea edx, var_1A4
  loc_00600C2C: push edx
  loc_00600C2D: push eax
  loc_00600C2E: mov ecx, [eax]
  loc_00600C30: call [ecx+000000B4h]
  loc_00600C36: test eax, eax
  loc_00600C38: fnclex
  loc_00600C3A: jge 00600C4Dh
  loc_00600C3C: mov ecx, var_48
  loc_00600C3F: push 000000B4h
  loc_00600C44: push 0041E938h
  loc_00600C49: push ecx
  loc_00600C4A: push eax
  loc_00600C4B: call edi
  loc_00600C4D: lea ebx, var_1A8
  loc_00600C53: mov eax, var_1A4
  loc_00600C59: push ebx
  loc_00600C5A: mov edx, 00000008h
  loc_00600C5F: sub esp, 00000010h
  loc_00600C62: mov esi, [eax]
  loc_00600C64: mov ebx, esp
  loc_00600C66: mov ecx, 0042CEC8h ; "LAmount5"
  loc_00600C6B: push eax
  loc_00600C6C: mov var_2E4, eax
  loc_00600C72: mov [ebx], edx
  loc_00600C74: mov edx, var_284
  loc_00600C7A: mov [ebx+00000004h], edx
  loc_00600C7D: mov [ebx+00000008h], ecx
  loc_00600C80: mov ecx, var_27C
  loc_00600C86: mov [ebx+0000000Ch], ecx
  loc_00600C89: call [esi+00000030h]
  loc_00600C8C: test eax, eax
  loc_00600C8E: fnclex
  loc_00600C90: jge 00600CA3h
  loc_00600C92: mov edx, var_2E4
  loc_00600C98: push 00000030h
  loc_00600C9A: push 0041EA14h ; "S"
  loc_00600C9F: push edx
  loc_00600CA0: push eax
  loc_00600CA1: call edi
  loc_00600CA3: mov eax, var_1A8
  loc_00600CA9: lea edx, var_228
  loc_00600CAF: push edx
  loc_00600CB0: push eax
  loc_00600CB1: mov ecx, [eax]
  loc_00600CB3: mov esi, eax
  loc_00600CB5: call [ecx+00000044h]
  loc_00600CB8: test eax, eax
  loc_00600CBA: fnclex
  loc_00600CBC: jge 00600CC9h
  loc_00600CBE: push 00000044h
  loc_00600CC0: push 0041EA48h
  loc_00600CC5: push esi
  loc_00600CC6: push eax
  loc_00600CC7: call edi
  loc_00600CC9: mov esi, [00401234h] ; __vbaVarAdd
  loc_00600CCF: lea eax, var_1C8
  loc_00600CD5: lea ecx, var_1B8
  loc_00600CDB: push eax
  loc_00600CDC: lea edx, var_1D8
  loc_00600CE2: push ecx
  loc_00600CE3: push edx
  loc_00600CE4: call __vbaVarAdd
  loc_00600CE6: push eax
  loc_00600CE7: lea eax, var_1E8
  loc_00600CED: lea ecx, var_1F8
  loc_00600CF3: push eax
  loc_00600CF4: push ecx
  loc_00600CF5: call __vbaVarAdd
  loc_00600CF7: push eax
  loc_00600CF8: lea edx, var_208
  loc_00600CFE: lea eax, var_218
  loc_00600D04: push edx
  loc_00600D05: push eax
  loc_00600D06: call __vbaVarAdd
  loc_00600D08: lea ecx, var_228
  loc_00600D0E: push eax
  loc_00600D0F: lea edx, var_238
  loc_00600D15: push ecx
  loc_00600D16: push edx
  loc_00600D17: call __vbaVarAdd
  loc_00600D19: mov esi, [00401014h] ; __vbaVarMove
  loc_00600D1F: mov edx, eax
  loc_00600D21: lea ecx, var_24
  loc_00600D24: call __vbaVarMove
  loc_00600D26: lea eax, var_1A8
  loc_00600D2C: lea ecx, var_1A4
  loc_00600D32: push eax
  loc_00600D33: lea edx, var_1A0
  loc_00600D39: push ecx
  loc_00600D3A: lea eax, var_19C
  loc_00600D40: push edx
  loc_00600D41: lea ecx, var_198
  loc_00600D47: push eax
  loc_00600D48: lea edx, var_194
  loc_00600D4E: push ecx
  loc_00600D4F: lea eax, var_188
  loc_00600D55: push edx
  loc_00600D56: lea ecx, var_190
  loc_00600D5C: push eax
  loc_00600D5D: lea edx, var_18C
  loc_00600D63: push ecx
  loc_00600D64: lea eax, var_184
  loc_00600D6A: push edx
  loc_00600D6B: push eax
  loc_00600D6C: push 0000000Ah
  loc_00600D6E: call [00401040h] ; __vbaFreeObjList
  loc_00600D74: lea ecx, var_228
  loc_00600D7A: lea edx, var_218
  loc_00600D80: push ecx
  loc_00600D81: lea eax, var_208
  loc_00600D87: push edx
  loc_00600D88: lea ecx, var_1F8
  loc_00600D8E: push eax
  loc_00600D8F: lea edx, var_1E8
  loc_00600D95: push ecx
  loc_00600D96: lea eax, var_1D8
  loc_00600D9C: push edx
  loc_00600D9D: lea ecx, var_1B8
  loc_00600DA3: push eax
  loc_00600DA4: lea edx, var_1C8
  loc_00600DAA: push ecx
  loc_00600DAB: push edx
  loc_00600DAC: push 00000008h
  loc_00600DAE: call [00401038h] ; __vbaFreeVarList
  loc_00600DB4: mov eax, var_48
  loc_00600DB7: add esp, 00000050h
  loc_00600DBA: lea edx, var_184
  loc_00600DC0: mov ecx, [eax]
  loc_00600DC2: push edx
  loc_00600DC3: push eax
  loc_00600DC4: call [ecx+000000B4h]
  loc_00600DCA: test eax, eax
  loc_00600DCC: fnclex
  loc_00600DCE: jge 00600DE1h
  loc_00600DD0: mov ecx, var_48
  loc_00600DD3: push 000000B4h
  loc_00600DD8: push 0041E938h
  loc_00600DDD: push ecx
  loc_00600DDE: push eax
  loc_00600DDF: call edi
  loc_00600DE1: lea ebx, var_188
  loc_00600DE7: mov eax, var_184
  loc_00600DED: push ebx
  loc_00600DEE: mov ecx, 00000008h
  loc_00600DF3: sub esp, 00000010h
  loc_00600DF6: mov var_248, ecx
  loc_00600DFC: mov ebx, esp
  loc_00600DFE: mov var_240, 0042A170h ; "Type1"
  loc_00600E08: mov edx, [eax]
  loc_00600E0A: push eax
  loc_00600E0B: mov [ebx], ecx
  loc_00600E0D: mov ecx, var_244
  loc_00600E13: mov var_294, eax
  loc_00600E19: mov [ebx+00000004h], ecx
  loc_00600E1C: mov ecx, var_240
  loc_00600E22: mov [ebx+00000008h], ecx
  loc_00600E25: mov ecx, var_23C
  loc_00600E2B: mov [ebx+0000000Ch], ecx
  loc_00600E2E: call [edx+00000030h]
  loc_00600E31: test eax, eax
  loc_00600E33: fnclex
  loc_00600E35: jge 00600E48h
  loc_00600E37: mov edx, var_294
  loc_00600E3D: push 00000030h
  loc_00600E3F: push 0041EA14h ; "S"
  loc_00600E44: push edx
  loc_00600E45: push eax
  loc_00600E46: call edi
  loc_00600E48: mov eax, var_188
  loc_00600E4E: lea edx, var_1B8
  loc_00600E54: push edx
  loc_00600E55: push eax
  loc_00600E56: mov ecx, [eax]
  loc_00600E58: mov ebx, eax
  loc_00600E5A: call [ecx+00000044h]
  loc_00600E5D: test eax, eax
  loc_00600E5F: fnclex
  loc_00600E61: jge 00600E6Eh
  loc_00600E63: push 00000044h
  loc_00600E65: push 0041EA48h
  loc_00600E6A: push ebx
  loc_00600E6B: push eax
  loc_00600E6C: call edi
  loc_00600E6E: lea edx, var_1B8
  loc_00600E74: lea ecx, var_300
  loc_00600E7A: call __vbaVarMove
  loc_00600E7C: lea eax, var_188
  loc_00600E82: lea ecx, var_184
  loc_00600E88: push eax
  loc_00600E89: push ecx
  loc_00600E8A: push 00000002h
  loc_00600E8C: call [00401040h] ; __vbaFreeObjList
  loc_00600E92: mov ebx, [00401110h] ; __vbaVarTstEq
  loc_00600E98: add esp, 0000000Ch
  loc_00600E9B: lea edx, var_300
  loc_00600EA1: lea eax, var_248
  loc_00600EA7: push edx
  loc_00600EA8: push eax
  loc_00600EA9: mov var_240, 004288FCh ; "S"
  loc_00600EB3: mov var_248, 00008008h
  loc_00600EBD: call ebx
  loc_00600EBF: test ax, ax
  loc_00600EC2: jz 00600F03h
  loc_00600EC4: mov ebx, [00401000h] ; __vbaVarSub
  loc_00600ECA: lea ecx, var_78
  loc_00600ECD: lea edx, var_8C
  loc_00600ED3: push ecx
  loc_00600ED4: lea eax, var_1B8
  loc_00600EDA: push edx
  loc_00600EDB: push eax
  loc_00600EDC: call ebx
  loc_00600EDE: lea ecx, var_24
  loc_00600EE1: push eax
  loc_00600EE2: lea edx, var_118
  loc_00600EE8: push ecx
  loc_00600EE9: lea eax, var_1C8
  loc_00600EEF: push edx
  loc_00600EF0: push eax
  loc_00600EF1: call [00401170h] ; __vbaVarMul
  loc_00600EF7: lea ecx, var_1D8
  loc_00600EFD: push eax
  loc_00600EFE: push ecx
  loc_00600EFF: call ebx
  loc_00600F01: jmp 00600F6Bh
  loc_00600F03: lea edx, var_300
  loc_00600F09: lea eax, var_248
  loc_00600F0F: push edx
  loc_00600F10: push eax
  loc_00600F11: mov var_240, 004219ACh
  loc_00600F1B: mov var_248, 00008008h
  loc_00600F25: call ebx
  loc_00600F27: test ax, ax
  loc_00600F2A: jz 00600F75h
  loc_00600F2C: lea ecx, var_78
  loc_00600F2F: lea edx, var_8C
  loc_00600F35: push ecx
  loc_00600F36: lea eax, var_1B8
  loc_00600F3C: push edx
  loc_00600F3D: push eax
  loc_00600F3E: call [00401000h] ; __vbaVarSub
  loc_00600F44: lea ecx, var_24
  loc_00600F47: push eax
  loc_00600F48: lea edx, var_118
  loc_00600F4E: push ecx
  loc_00600F4F: lea eax, var_1C8
  loc_00600F55: push edx
  loc_00600F56: push eax
  loc_00600F57: call [00401170h] ; __vbaVarMul
  loc_00600F5D: lea ecx, var_1D8
  loc_00600F63: push eax
  loc_00600F64: push ecx
  loc_00600F65: call [00401234h] ; __vbaVarAdd
  loc_00600F6B: mov edx, eax
  loc_00600F6D: lea ecx, var_F4
  loc_00600F73: call __vbaVarMove
  loc_00600F75: mov eax, var_48
  loc_00600F78: lea ecx, var_184
  loc_00600F7E: push ecx
  loc_00600F7F: push eax
  loc_00600F80: mov edx, [eax]
  loc_00600F82: call [edx+000000B4h]
  loc_00600F88: test eax, eax
  loc_00600F8A: fnclex
  loc_00600F8C: jge 00600F9Fh
  loc_00600F8E: mov edx, var_48
  loc_00600F91: push 000000B4h
  loc_00600F96: push 0041E938h
  loc_00600F9B: push edx
  loc_00600F9C: push eax
  loc_00600F9D: call edi
  loc_00600F9F: lea ebx, var_188
  loc_00600FA5: mov eax, var_184
  loc_00600FAB: push ebx
  loc_00600FAC: mov ecx, 00000008h
  loc_00600FB1: sub esp, 00000010h
  loc_00600FB4: mov var_248, ecx
  loc_00600FBA: mov ebx, esp
  loc_00600FBC: mov var_240, 00430500h ; "Amount1"
  loc_00600FC6: mov edx, [eax]
  loc_00600FC8: push eax
  loc_00600FC9: mov [ebx], ecx
  loc_00600FCB: mov ecx, var_244
  loc_00600FD1: mov var_294, eax
  loc_00600FD7: mov [ebx+00000004h], ecx
  loc_00600FDA: mov ecx, var_240
  loc_00600FE0: mov [ebx+00000008h], ecx
  loc_00600FE3: mov ecx, var_23C
  loc_00600FE9: mov [ebx+0000000Ch], ecx
  loc_00600FEC: call [edx+00000030h]
  loc_00600FEF: test eax, eax
  loc_00600FF1: fnclex
  loc_00600FF3: jge 00601006h
  loc_00600FF5: mov edx, var_294
  loc_00600FFB: push 00000030h
  loc_00600FFD: push 0041EA14h ; "S"
  loc_00601002: push edx
  loc_00601003: push eax
  loc_00601004: call edi
  loc_00601006: mov eax, var_188
  loc_0060100C: lea edx, var_1B8
  loc_00601012: lea ecx, var_34
  loc_00601015: mov var_188, 00000000h
  loc_0060101F: mov var_1B0, eax
  loc_00601025: mov var_1B8, 00000009h
  loc_0060102F: call __vbaVarMove
  loc_00601031: lea ecx, var_184
  loc_00601037: call [004012B0h] ; __vbaFreeObj
  loc_0060103D: mov ax, var_B4
  loc_00601044: lea ecx, var_34
  loc_00601047: mov var_240, ax
  loc_0060104E: mov eax, 00000002h
  loc_00601053: mov var_248, eax
  loc_00601059: mov var_258, eax
  loc_0060105F: lea edx, var_248
  loc_00601065: push ecx
  loc_00601066: lea eax, var_1B8
  loc_0060106C: push edx
  loc_0060106D: push eax
  loc_0060106E: mov var_250, 00000064h
  loc_00601078: call [00401170h] ; __vbaVarMul
  loc_0060107E: lea ecx, var_258
  loc_00601084: push eax
  loc_00601085: lea edx, var_1C8
  loc_0060108B: push ecx
  loc_0060108C: push edx
  loc_0060108D: call [00401198h] ; __vbaVarDiv
  loc_00601093: mov edx, eax
  loc_00601095: lea ecx, var_E4
  loc_0060109B: call __vbaVarMove
  loc_0060109D: mov eax, var_48
  loc_006010A0: lea edx, var_184
  loc_006010A6: push edx
  loc_006010A7: push eax
  loc_006010A8: mov ecx, [eax]
  loc_006010AA: call [ecx+000000B4h]
  loc_006010B0: test eax, eax
  loc_006010B2: fnclex
  loc_006010B4: jge 006010C7h
  loc_006010B6: mov ecx, var_48
  loc_006010B9: push 000000B4h
  loc_006010BE: push 0041E938h
  loc_006010C3: push ecx
  loc_006010C4: push eax
  loc_006010C5: call edi
  loc_006010C7: lea ebx, var_188
  loc_006010CD: mov eax, var_184
  loc_006010D3: push ebx
  loc_006010D4: mov ecx, 00000008h
  loc_006010D9: sub esp, 00000010h
  loc_006010DC: mov var_248, ecx
  loc_006010E2: mov ebx, esp
  loc_006010E4: mov var_240, 0042F71Ch ; "LAmount1"
  loc_006010EE: mov edx, [eax]
  loc_006010F0: push eax
  loc_006010F1: mov [ebx], ecx
  loc_006010F3: mov ecx, var_244
  loc_006010F9: mov var_294, eax
  loc_006010FF: mov [ebx+00000004h], ecx
  loc_00601102: mov ecx, var_240
  loc_00601108: mov [ebx+00000008h], ecx
  loc_0060110B: mov ecx, var_23C
  loc_00601111: mov [ebx+0000000Ch], ecx
  loc_00601114: call [edx+00000030h]
  loc_00601117: test eax, eax
  loc_00601119: fnclex
  loc_0060111B: jge 0060112Eh
  loc_0060111D: mov edx, var_294
  loc_00601123: push 00000030h
  loc_00601125: push 0041EA14h ; "S"
  loc_0060112A: push edx
  loc_0060112B: push eax
  loc_0060112C: call edi
  loc_0060112E: mov eax, var_188
  loc_00601134: lea edx, var_1B8
  loc_0060113A: lea ecx, var_A0
  loc_00601140: mov var_188, 00000000h
  loc_0060114A: mov var_1B0, eax
  loc_00601150: mov var_1B8, 00000009h
  loc_0060115A: call __vbaVarMove
  loc_0060115C: lea ecx, var_184
  loc_00601162: call [004012B0h] ; __vbaFreeObj
  loc_00601168: mov eax, var_48
  loc_0060116B: lea edx, var_184
  loc_00601171: push edx
  loc_00601172: push eax
  loc_00601173: mov ecx, [eax]
  loc_00601175: call [ecx+000000B4h]
  loc_0060117B: test eax, eax
  loc_0060117D: fnclex
  loc_0060117F: jge 00601192h
  loc_00601181: mov ecx, var_48
  loc_00601184: push 000000B4h
  loc_00601189: push 0041E938h
  loc_0060118E: push ecx
  loc_0060118F: push eax
  loc_00601190: call edi
  loc_00601192: lea ebx, var_188
  loc_00601198: mov eax, var_184
  loc_0060119E: push ebx
  loc_0060119F: mov ecx, 00000008h
  loc_006011A4: sub esp, 00000010h
  loc_006011A7: mov var_248, ecx
  loc_006011AD: mov ebx, esp
  loc_006011AF: mov var_240, 0042A170h ; "Type1"
  loc_006011B9: mov edx, [eax]
  loc_006011BB: push eax
  loc_006011BC: mov [ebx], ecx
  loc_006011BE: mov ecx, var_244
  loc_006011C4: mov var_294, eax
  loc_006011CA: mov [ebx+00000004h], ecx
  loc_006011CD: mov ecx, var_240
  loc_006011D3: mov [ebx+00000008h], ecx
  loc_006011D6: mov ecx, var_23C
  loc_006011DC: mov [ebx+0000000Ch], ecx
  loc_006011DF: call [edx+00000030h]
  loc_006011E2: test eax, eax
  loc_006011E4: fnclex
  loc_006011E6: jge 006011F9h
  loc_006011E8: mov edx, var_294
  loc_006011EE: push 00000030h
  loc_006011F0: push 0041EA14h ; "S"
  loc_006011F5: push edx
  loc_006011F6: push eax
  loc_006011F7: call edi
  loc_006011F9: mov eax, var_188
  loc_006011FF: lea edx, var_1B8
  loc_00601205: push edx
  loc_00601206: push eax
  loc_00601207: mov ecx, [eax]
  loc_00601209: mov ebx, eax
  loc_0060120B: call [ecx+00000044h]
  loc_0060120E: test eax, eax
  loc_00601210: fnclex
  loc_00601212: jge 0060121Fh
  loc_00601214: push 00000044h
  loc_00601216: push 0041EA48h
  loc_0060121B: push ebx
  loc_0060121C: push eax
  loc_0060121D: call edi
  loc_0060121F: lea eax, var_1B8
  loc_00601225: lea ecx, var_258
  loc_0060122B: push eax
  loc_0060122C: push ecx
  loc_0060122D: mov var_250, 004288FCh ; "S"
  loc_00601237: mov var_258, 00008008h
  loc_00601241: call [00401110h] ; __vbaVarTstEq
  loc_00601247: mov ebx, eax
  loc_00601249: lea edx, var_188
  loc_0060124F: lea eax, var_184
  loc_00601255: push edx
  loc_00601256: push eax
  loc_00601257: push 00000002h
  loc_00601259: call [00401040h] ; __vbaFreeObjList
  loc_0060125F: add esp, 0000000Ch
  loc_00601262: lea ecx, var_1B8
  loc_00601268: call [00401020h] ; __vbaFreeVar
  loc_0060126E: test bx, bx
  loc_00601271: jz 006012B5h
  loc_00601273: mov ebx, [00401000h] ; __vbaVarSub
  loc_00601279: lea ecx, var_34
  loc_0060127C: lea edx, var_E4
  loc_00601282: push ecx
  loc_00601283: lea eax, var_1B8
  loc_00601289: push edx
  loc_0060128A: push eax
  loc_0060128B: call ebx
  loc_0060128D: lea ecx, var_A0
  loc_00601293: push eax
  loc_00601294: lea edx, var_118
  loc_0060129A: push ecx
  loc_0060129B: lea eax, var_1C8
  loc_006012A1: push edx
  loc_006012A2: push eax
  loc_006012A3: call [00401170h] ; __vbaVarMul
  loc_006012A9: lea ecx, var_1D8
  loc_006012AF: push eax
  loc_006012B0: push ecx
  loc_006012B1: call ebx
  loc_006012B3: jmp 006012F7h
  loc_006012B5: lea edx, var_34
  loc_006012B8: lea eax, var_E4
  loc_006012BE: push edx
  loc_006012BF: lea ecx, var_1B8
  loc_006012C5: push eax
  loc_006012C6: push ecx
  loc_006012C7: call [00401000h] ; __vbaVarSub
  loc_006012CD: push eax
  loc_006012CE: lea edx, var_A0
  loc_006012D4: lea eax, var_118
  loc_006012DA: push edx
  loc_006012DB: lea ecx, var_1C8
  loc_006012E1: push eax
  loc_006012E2: push ecx
  loc_006012E3: call [00401170h] ; __vbaVarMul
  loc_006012E9: lea edx, var_1D8
  loc_006012EF: push eax
  loc_006012F0: push edx
  loc_006012F1: call [00401234h] ; __vbaVarAdd
  loc_006012F7: mov edx, eax
  loc_006012F9: lea ecx, var_128
  loc_006012FF: call __vbaVarMove
  loc_00601301: mov eax, var_48
  loc_00601304: lea edx, var_184
  loc_0060130A: push edx
  loc_0060130B: push eax
  loc_0060130C: mov ecx, [eax]
  loc_0060130E: call [ecx+000000B4h]
  loc_00601314: test eax, eax
  loc_00601316: fnclex
  loc_00601318: jge 0060132Bh
  loc_0060131A: mov ecx, var_48
  loc_0060131D: push 000000B4h
  loc_00601322: push 0041E938h
  loc_00601327: push ecx
  loc_00601328: push eax
  loc_00601329: call edi
  loc_0060132B: lea ebx, var_188
  loc_00601331: mov eax, var_184
  loc_00601337: push ebx
  loc_00601338: mov ecx, 00000008h
  loc_0060133D: sub esp, 00000010h
  loc_00601340: mov var_248, ecx
  loc_00601346: mov ebx, esp
  loc_00601348: mov var_240, 0042DC28h ; "Amount2"
  loc_00601352: mov edx, [eax]
  loc_00601354: push eax
  loc_00601355: mov [ebx], ecx
  loc_00601357: mov ecx, var_244
  loc_0060135D: mov var_294, eax
  loc_00601363: mov [ebx+00000004h], ecx
  loc_00601366: mov ecx, var_240
  loc_0060136C: mov [ebx+00000008h], ecx
  loc_0060136F: mov ecx, var_23C
  loc_00601375: mov [ebx+0000000Ch], ecx
  loc_00601378: call [edx+00000030h]
  loc_0060137B: test eax, eax
  loc_0060137D: fnclex
  loc_0060137F: jge 00601392h
  loc_00601381: mov edx, var_294
  loc_00601387: push 00000030h
  loc_00601389: push 0041EA14h ; "S"
  loc_0060138E: push edx
  loc_0060138F: push eax
  loc_00601390: call edi
  loc_00601392: mov eax, var_188
  loc_00601398: lea edx, var_1B8
  loc_0060139E: lea ecx, var_44
  loc_006013A1: mov var_188, 00000000h
  loc_006013AB: mov var_1B0, eax
  loc_006013B1: mov var_1B8, 00000009h
  loc_006013BB: call __vbaVarMove
  loc_006013BD: lea ecx, var_184
  loc_006013C3: call [004012B0h] ; __vbaFreeObj
  loc_006013C9: mov ax, var_B4
  loc_006013D0: lea ecx, var_44
  loc_006013D3: mov var_240, ax
  loc_006013DA: mov eax, 00000002h
  loc_006013DF: mov var_248, eax
  loc_006013E5: mov var_258, eax
  loc_006013EB: lea edx, var_248
  loc_006013F1: push ecx
  loc_006013F2: lea eax, var_1B8
  loc_006013F8: push edx
  loc_006013F9: push eax
  loc_006013FA: mov var_250, 00000064h
  loc_00601404: call [00401170h] ; __vbaVarMul
  loc_0060140A: lea ecx, var_258
  loc_00601410: push eax
  loc_00601411: lea edx, var_1C8
  loc_00601417: push ecx
  loc_00601418: push edx
  loc_00601419: call [00401198h] ; __vbaVarDiv
  loc_0060141F: mov edx, eax
  loc_00601421: lea ecx, var_108
  loc_00601427: call __vbaVarMove
  loc_00601429: mov eax, var_48
  loc_0060142C: lea edx, var_184
  loc_00601432: push edx
  loc_00601433: push eax
  loc_00601434: mov ecx, [eax]
  loc_00601436: call [ecx+000000B4h]
  loc_0060143C: test eax, eax
  loc_0060143E: fnclex
  loc_00601440: jge 00601453h
  loc_00601442: mov ecx, var_48
  loc_00601445: push 000000B4h
  loc_0060144A: push 0041E938h
  loc_0060144F: push ecx
  loc_00601450: push eax
  loc_00601451: call edi
  loc_00601453: lea ebx, var_188
  loc_00601459: mov eax, var_184
  loc_0060145F: push ebx
  loc_00601460: mov ecx, 00000008h
  loc_00601465: sub esp, 00000010h
  loc_00601468: mov var_248, ecx
  loc_0060146E: mov ebx, esp
  loc_00601470: mov var_240, 0042CE80h ; "LAmount2"
  loc_0060147A: mov edx, [eax]
  loc_0060147C: push eax
  loc_0060147D: mov [ebx], ecx
  loc_0060147F: mov ecx, var_244
  loc_00601485: mov var_294, eax
  loc_0060148B: mov [ebx+00000004h], ecx
  loc_0060148E: mov ecx, var_240
  loc_00601494: mov [ebx+00000008h], ecx
  loc_00601497: mov ecx, var_23C
  loc_0060149D: mov [ebx+0000000Ch], ecx
  loc_006014A0: call [edx+00000030h]
  loc_006014A3: test eax, eax
  loc_006014A5: fnclex
  loc_006014A7: jge 006014BAh
  loc_006014A9: mov edx, var_294
  loc_006014AF: push 00000030h
  loc_006014B1: push 0041EA14h ; "S"
  loc_006014B6: push edx
  loc_006014B7: push eax
  loc_006014B8: call edi
  loc_006014BA: mov eax, var_188
  loc_006014C0: lea edx, var_1B8
  loc_006014C6: lea ecx, var_B0
  loc_006014CC: mov var_188, 00000000h
  loc_006014D6: mov var_1B0, eax
  loc_006014DC: mov var_1B8, 00000009h
  loc_006014E6: call __vbaVarMove
  loc_006014E8: lea ecx, var_184
  loc_006014EE: call [004012B0h] ; __vbaFreeObj
  loc_006014F4: mov eax, var_48
  loc_006014F7: lea edx, var_184
  loc_006014FD: push edx
  loc_006014FE: push eax
  loc_006014FF: mov ecx, [eax]
  loc_00601501: call [ecx+000000B4h]
  loc_00601507: test eax, eax
  loc_00601509: fnclex
  loc_0060150B: jge 0060151Eh
  loc_0060150D: mov ecx, var_48
  loc_00601510: push 000000B4h
  loc_00601515: push 0041E938h
  loc_0060151A: push ecx
  loc_0060151B: push eax
  loc_0060151C: call edi
  loc_0060151E: lea ebx, var_188
  loc_00601524: mov eax, var_184
  loc_0060152A: push ebx
  loc_0060152B: mov ecx, 00000008h
  loc_00601530: sub esp, 00000010h
  loc_00601533: mov var_248, ecx
  loc_00601539: mov ebx, esp
  loc_0060153B: mov var_240, 0042A170h ; "Type1"
  loc_00601545: mov edx, [eax]
  loc_00601547: push eax
  loc_00601548: mov [ebx], ecx
  loc_0060154A: mov ecx, var_244
  loc_00601550: mov var_294, eax
  loc_00601556: mov [ebx+00000004h], ecx
  loc_00601559: mov ecx, var_240
  loc_0060155F: mov [ebx+00000008h], ecx
  loc_00601562: mov ecx, var_23C
  loc_00601568: mov [ebx+0000000Ch], ecx
  loc_0060156B: call [edx+00000030h]
  loc_0060156E: test eax, eax
  loc_00601570: fnclex
  loc_00601572: jge 00601585h
  loc_00601574: mov edx, var_294
  loc_0060157A: push 00000030h
  loc_0060157C: push 0041EA14h ; "S"
  loc_00601581: push edx
  loc_00601582: push eax
  loc_00601583: call edi
  loc_00601585: mov eax, var_188
  loc_0060158B: lea edx, var_1B8
  loc_00601591: push edx
  loc_00601592: push eax
  loc_00601593: mov ecx, [eax]
  loc_00601595: mov ebx, eax
  loc_00601597: call [ecx+00000044h]
  loc_0060159A: test eax, eax
  loc_0060159C: fnclex
  loc_0060159E: jge 006015ABh
  loc_006015A0: push 00000044h
  loc_006015A2: push 0041EA48h
  loc_006015A7: push ebx
  loc_006015A8: push eax
  loc_006015A9: call edi
  loc_006015AB: lea eax, var_1B8
  loc_006015B1: lea ecx, var_258
  loc_006015B7: push eax
  loc_006015B8: push ecx
  loc_006015B9: mov var_250, 004288FCh ; "S"
  loc_006015C3: mov var_258, 00008008h
  loc_006015CD: call [00401110h] ; __vbaVarTstEq
  loc_006015D3: mov ebx, eax
  loc_006015D5: lea edx, var_188
  loc_006015DB: lea eax, var_184
  loc_006015E1: push edx
  loc_006015E2: push eax
  loc_006015E3: push 00000002h
  loc_006015E5: call [00401040h] ; __vbaFreeObjList
  loc_006015EB: add esp, 0000000Ch
  loc_006015EE: lea ecx, var_1B8
  loc_006015F4: call [00401020h] ; __vbaFreeVar
  loc_006015FA: test bx, bx
  loc_006015FD: jz 00601641h
  loc_006015FF: mov ebx, [00401000h] ; __vbaVarSub
  loc_00601605: lea ecx, var_44
  loc_00601608: lea edx, var_108
  loc_0060160E: push ecx
  loc_0060160F: lea eax, var_1B8
  loc_00601615: push edx
  loc_00601616: push eax
  loc_00601617: call ebx
  loc_00601619: lea ecx, var_B0
  loc_0060161F: push eax
  loc_00601620: lea edx, var_118
  loc_00601626: push ecx
  loc_00601627: lea eax, var_1C8
  loc_0060162D: push edx
  loc_0060162E: push eax
  loc_0060162F: call [00401170h] ; __vbaVarMul
  loc_00601635: lea ecx, var_1D8
  loc_0060163B: push eax
  loc_0060163C: push ecx
  loc_0060163D: call ebx
  loc_0060163F: jmp 00601683h
  loc_00601641: lea edx, var_44
  loc_00601644: lea eax, var_108
  loc_0060164A: push edx
  loc_0060164B: lea ecx, var_1B8
  loc_00601651: push eax
  loc_00601652: push ecx
  loc_00601653: call [00401000h] ; __vbaVarSub
  loc_00601659: push eax
  loc_0060165A: lea edx, var_B0
  loc_00601660: lea eax, var_118
  loc_00601666: push edx
  loc_00601667: lea ecx, var_1C8
  loc_0060166D: push eax
  loc_0060166E: push ecx
  loc_0060166F: call [00401170h] ; __vbaVarMul
  loc_00601675: lea edx, var_1D8
  loc_0060167B: push eax
  loc_0060167C: push edx
  loc_0060167D: call [00401234h] ; __vbaVarAdd
  loc_00601683: mov edx, eax
  loc_00601685: lea ecx, var_148
  loc_0060168B: call __vbaVarMove
  loc_0060168D: mov eax, var_48
  loc_00601690: lea edx, var_184
  loc_00601696: push edx
  loc_00601697: push eax
  loc_00601698: mov ecx, [eax]
  loc_0060169A: call [ecx+000000B4h]
  loc_006016A0: test eax, eax
  loc_006016A2: fnclex
  loc_006016A4: jge 006016B7h
  loc_006016A6: mov ecx, var_48
  loc_006016A9: push 000000B4h
  loc_006016AE: push 0041E938h
  loc_006016B3: push ecx
  loc_006016B4: push eax
  loc_006016B5: call edi
  loc_006016B7: lea ebx, var_188
  loc_006016BD: mov eax, var_184
  loc_006016C3: push ebx
  loc_006016C4: mov ecx, 00000008h
  loc_006016C9: sub esp, 00000010h
  loc_006016CC: mov var_248, ecx
  loc_006016D2: mov ebx, esp
  loc_006016D4: mov var_240, 0042DC3Ch ; "Amount3"
  loc_006016DE: mov edx, [eax]
  loc_006016E0: push eax
  loc_006016E1: mov [ebx], ecx
  loc_006016E3: mov ecx, var_244
  loc_006016E9: mov var_294, eax
  loc_006016EF: mov [ebx+00000004h], ecx
  loc_006016F2: mov ecx, var_240
  loc_006016F8: mov [ebx+00000008h], ecx
  loc_006016FB: mov ecx, var_23C
  loc_00601701: mov [ebx+0000000Ch], ecx
  loc_00601704: call [edx+00000030h]
  loc_00601707: test eax, eax
  loc_00601709: fnclex
  loc_0060170B: jge 0060171Eh
  loc_0060170D: mov edx, var_294
  loc_00601713: push 00000030h
  loc_00601715: push 0041EA14h ; "S"
  loc_0060171A: push edx
  loc_0060171B: push eax
  loc_0060171C: call edi
  loc_0060171E: mov eax, var_188
  loc_00601724: lea edx, var_1B8
  loc_0060172A: lea ecx, var_58
  loc_0060172D: mov var_188, 00000000h
  loc_00601737: mov var_1B0, eax
  loc_0060173D: mov var_1B8, 00000009h
  loc_00601747: call __vbaVarMove
  loc_00601749: lea ecx, var_184
  loc_0060174F: call [004012B0h] ; __vbaFreeObj
  loc_00601755: mov ax, var_B4
  loc_0060175C: lea ecx, var_58
  loc_0060175F: mov var_240, ax
  loc_00601766: mov eax, 00000002h
  loc_0060176B: mov var_248, eax
  loc_00601771: mov var_258, eax
  loc_00601777: lea edx, var_248
  loc_0060177D: push ecx
  loc_0060177E: lea eax, var_1B8
  loc_00601784: push edx
  loc_00601785: push eax
  loc_00601786: mov var_250, 00000064h
  loc_00601790: call [00401170h] ; __vbaVarMul
  loc_00601796: lea ecx, var_258
  loc_0060179C: push eax
  loc_0060179D: lea edx, var_1C8
  loc_006017A3: push ecx
  loc_006017A4: push edx
  loc_006017A5: call [00401198h] ; __vbaVarDiv
  loc_006017AB: mov edx, eax
  loc_006017AD: lea ecx, var_138
  loc_006017B3: call __vbaVarMove
  loc_006017B5: mov eax, var_48
  loc_006017B8: lea edx, var_184
  loc_006017BE: push edx
  loc_006017BF: push eax
  loc_006017C0: mov ecx, [eax]
  loc_006017C2: call [ecx+000000B4h]
  loc_006017C8: test eax, eax
  loc_006017CA: fnclex
  loc_006017CC: jge 006017DFh
  loc_006017CE: mov ecx, var_48
  loc_006017D1: push 000000B4h
  loc_006017D6: push 0041E938h
  loc_006017DB: push ecx
  loc_006017DC: push eax
  loc_006017DD: call edi
  loc_006017DF: lea ebx, var_188
  loc_006017E5: mov eax, var_184
  loc_006017EB: push ebx
  loc_006017EC: mov ecx, 00000008h
  loc_006017F1: sub esp, 00000010h
  loc_006017F4: mov var_248, ecx
  loc_006017FA: mov ebx, esp
  loc_006017FC: mov var_240, 0042CE98h ; "LAmount3"
  loc_00601806: mov edx, [eax]
  loc_00601808: push eax
  loc_00601809: mov [ebx], ecx
  loc_0060180B: mov ecx, var_244
  loc_00601811: mov var_294, eax
  loc_00601817: mov [ebx+00000004h], ecx
  loc_0060181A: mov ecx, var_240
  loc_00601820: mov [ebx+00000008h], ecx
  loc_00601823: mov ecx, var_23C
  loc_00601829: mov [ebx+0000000Ch], ecx
  loc_0060182C: call [edx+00000030h]
  loc_0060182F: test eax, eax
  loc_00601831: fnclex
  loc_00601833: jge 00601846h
  loc_00601835: mov edx, var_294
  loc_0060183B: push 00000030h
  loc_0060183D: push 0041EA14h ; "S"
  loc_00601842: push edx
  loc_00601843: push eax
  loc_00601844: call edi
  loc_00601846: mov eax, var_188
  loc_0060184C: lea edx, var_1B8
  loc_00601852: lea ecx, var_C4
  loc_00601858: mov var_188, 00000000h
  loc_00601862: mov var_1B0, eax
  loc_00601868: mov var_1B8, 00000009h
  loc_00601872: call __vbaVarMove
  loc_00601874: lea ecx, var_184
  loc_0060187A: call [004012B0h] ; __vbaFreeObj
  loc_00601880: mov eax, var_48
  loc_00601883: lea edx, var_184
  loc_00601889: push edx
  loc_0060188A: push eax
  loc_0060188B: mov ecx, [eax]
  loc_0060188D: call [ecx+000000B4h]
  loc_00601893: test eax, eax
  loc_00601895: fnclex
  loc_00601897: jge 006018AAh
  loc_00601899: mov ecx, var_48
  loc_0060189C: push 000000B4h
  loc_006018A1: push 0041E938h
  loc_006018A6: push ecx
  loc_006018A7: push eax
  loc_006018A8: call edi
  loc_006018AA: lea ebx, var_188
  loc_006018B0: mov eax, var_184
  loc_006018B6: push ebx
  loc_006018B7: mov ecx, 00000008h
  loc_006018BC: sub esp, 00000010h
  loc_006018BF: mov var_248, ecx
  loc_006018C5: mov ebx, esp
  loc_006018C7: mov var_240, 0042A170h ; "Type1"
  loc_006018D1: mov edx, [eax]
  loc_006018D3: push eax
  loc_006018D4: mov [ebx], ecx
  loc_006018D6: mov ecx, var_244
  loc_006018DC: mov var_294, eax
  loc_006018E2: mov [ebx+00000004h], ecx
  loc_006018E5: mov ecx, var_240
  loc_006018EB: mov [ebx+00000008h], ecx
  loc_006018EE: mov ecx, var_23C
  loc_006018F4: mov [ebx+0000000Ch], ecx
  loc_006018F7: call [edx+00000030h]
  loc_006018FA: test eax, eax
  loc_006018FC: fnclex
  loc_006018FE: jge 00601911h
  loc_00601900: mov edx, var_294
  loc_00601906: push 00000030h
  loc_00601908: push 0041EA14h ; "S"
  loc_0060190D: push edx
  loc_0060190E: push eax
  loc_0060190F: call edi
  loc_00601911: mov eax, var_188
  loc_00601917: lea edx, var_1B8
  loc_0060191D: push edx
  loc_0060191E: push eax
  loc_0060191F: mov ecx, [eax]
  loc_00601921: mov ebx, eax
  loc_00601923: call [ecx+00000044h]
  loc_00601926: test eax, eax
  loc_00601928: fnclex
  loc_0060192A: jge 00601937h
  loc_0060192C: push 00000044h
  loc_0060192E: push 0041EA48h
  loc_00601933: push ebx
  loc_00601934: push eax
  loc_00601935: call edi
  loc_00601937: lea eax, var_1B8
  loc_0060193D: lea ecx, var_258
  loc_00601943: push eax
  loc_00601944: push ecx
  loc_00601945: mov var_250, 004288FCh ; "S"
  loc_0060194F: mov var_258, 00008008h
  loc_00601959: call [00401110h] ; __vbaVarTstEq
  loc_0060195F: mov ebx, eax
  loc_00601961: lea edx, var_188
  loc_00601967: lea eax, var_184
  loc_0060196D: push edx
  loc_0060196E: push eax
  loc_0060196F: push 00000002h
  loc_00601971: call [00401040h] ; __vbaFreeObjList
  loc_00601977: add esp, 0000000Ch
  loc_0060197A: lea ecx, var_1B8
  loc_00601980: call [00401020h] ; __vbaFreeVar
  loc_00601986: test bx, bx
  loc_00601989: jz 006019CDh
  loc_0060198B: mov ebx, [00401000h] ; __vbaVarSub
  loc_00601991: lea ecx, var_58
  loc_00601994: lea edx, var_138
  loc_0060199A: push ecx
  loc_0060199B: lea eax, var_1B8
  loc_006019A1: push edx
  loc_006019A2: push eax
  loc_006019A3: call ebx
  loc_006019A5: lea ecx, var_C4
  loc_006019AB: push eax
  loc_006019AC: lea edx, var_118
  loc_006019B2: push ecx
  loc_006019B3: lea eax, var_1C8
  loc_006019B9: push edx
  loc_006019BA: push eax
  loc_006019BB: call [00401170h] ; __vbaVarMul
  loc_006019C1: lea ecx, var_1D8
  loc_006019C7: push eax
  loc_006019C8: push ecx
  loc_006019C9: call ebx
  loc_006019CB: jmp 00601A0Fh
  loc_006019CD: lea edx, var_58
  loc_006019D0: lea eax, var_138
  loc_006019D6: push edx
  loc_006019D7: lea ecx, var_1B8
  loc_006019DD: push eax
  loc_006019DE: push ecx
  loc_006019DF: call [00401000h] ; __vbaVarSub
  loc_006019E5: push eax
  loc_006019E6: lea edx, var_C4
  loc_006019EC: lea eax, var_118
  loc_006019F2: push edx
  loc_006019F3: lea ecx, var_1C8
  loc_006019F9: push eax
  loc_006019FA: push ecx
  loc_006019FB: call [00401170h] ; __vbaVarMul
  loc_00601A01: lea edx, var_1D8
  loc_00601A07: push eax
  loc_00601A08: push edx
  loc_00601A09: call [00401234h] ; __vbaVarAdd
  loc_00601A0F: mov edx, eax
  loc_00601A11: lea ecx, var_168
  loc_00601A17: call __vbaVarMove
  loc_00601A19: mov eax, var_48
  loc_00601A1C: lea edx, var_184
  loc_00601A22: push edx
  loc_00601A23: push eax
  loc_00601A24: mov ecx, [eax]
  loc_00601A26: call [ecx+000000B4h]
  loc_00601A2C: test eax, eax
  loc_00601A2E: fnclex
  loc_00601A30: jge 00601A43h
  loc_00601A32: mov ecx, var_48
  loc_00601A35: push 000000B4h
  loc_00601A3A: push 0041E938h
  loc_00601A3F: push ecx
  loc_00601A40: push eax
  loc_00601A41: call edi
  loc_00601A43: lea ebx, var_188
  loc_00601A49: mov eax, var_184
  loc_00601A4F: push ebx
  loc_00601A50: mov ecx, 00000008h
  loc_00601A55: sub esp, 00000010h
  loc_00601A58: mov var_248, ecx
  loc_00601A5E: mov ebx, esp
  loc_00601A60: mov var_240, 0042DC50h ; "Amount4"
  loc_00601A6A: mov edx, [eax]
  loc_00601A6C: push eax
  loc_00601A6D: mov [ebx], ecx
  loc_00601A6F: mov ecx, var_244
  loc_00601A75: mov var_294, eax
  loc_00601A7B: mov [ebx+00000004h], ecx
  loc_00601A7E: mov ecx, var_240
  loc_00601A84: mov [ebx+00000008h], ecx
  loc_00601A87: mov ecx, var_23C
  loc_00601A8D: mov [ebx+0000000Ch], ecx
  loc_00601A90: call [edx+00000030h]
  loc_00601A93: test eax, eax
  loc_00601A95: fnclex
  loc_00601A97: jge 00601AAAh
  loc_00601A99: mov edx, var_294
  loc_00601A9F: push 00000030h
  loc_00601AA1: push 0041EA14h ; "S"
  loc_00601AA6: push edx
  loc_00601AA7: push eax
  loc_00601AA8: call edi
  loc_00601AAA: mov eax, var_188
  loc_00601AB0: lea edx, var_1B8
  loc_00601AB6: lea ecx, var_68
  loc_00601AB9: mov var_188, 00000000h
  loc_00601AC3: mov var_1B0, eax
  loc_00601AC9: mov var_1B8, 00000009h
  loc_00601AD3: call __vbaVarMove
  loc_00601AD5: lea ecx, var_184
  loc_00601ADB: call [004012B0h] ; __vbaFreeObj
  loc_00601AE1: mov ax, var_B4
  loc_00601AE8: lea ecx, var_68
  loc_00601AEB: mov var_240, ax
  loc_00601AF2: mov eax, 00000002h
  loc_00601AF7: mov var_248, eax
  loc_00601AFD: mov var_258, eax
  loc_00601B03: lea edx, var_248
  loc_00601B09: push ecx
  loc_00601B0A: lea eax, var_1B8
  loc_00601B10: push edx
  loc_00601B11: push eax
  loc_00601B12: mov var_250, 00000064h
  loc_00601B1C: call [00401170h] ; __vbaVarMul
  loc_00601B22: lea ecx, var_258
  loc_00601B28: push eax
  loc_00601B29: lea edx, var_1C8
  loc_00601B2F: push ecx
  loc_00601B30: push edx
  loc_00601B31: call [00401198h] ; __vbaVarDiv
  loc_00601B37: mov edx, eax
  loc_00601B39: lea ecx, var_158
  loc_00601B3F: call __vbaVarMove
  loc_00601B41: mov eax, var_48
  loc_00601B44: lea edx, var_184
  loc_00601B4A: push edx
  loc_00601B4B: push eax
  loc_00601B4C: mov ecx, [eax]
  loc_00601B4E: call [ecx+000000B4h]
  loc_00601B54: test eax, eax
  loc_00601B56: fnclex
  loc_00601B58: jge 00601B6Bh
  loc_00601B5A: mov ecx, var_48
  loc_00601B5D: push 000000B4h
  loc_00601B62: push 0041E938h
  loc_00601B67: push ecx
  loc_00601B68: push eax
  loc_00601B69: call edi
  loc_00601B6B: lea ebx, var_188
  loc_00601B71: mov eax, var_184
  loc_00601B77: push ebx
  loc_00601B78: mov ecx, 00000008h
  loc_00601B7D: sub esp, 00000010h
  loc_00601B80: mov var_248, ecx
  loc_00601B86: mov ebx, esp
  loc_00601B88: mov var_240, 0042CEB0h ; "LAmount4"
  loc_00601B92: mov edx, [eax]
  loc_00601B94: push eax
  loc_00601B95: mov [ebx], ecx
  loc_00601B97: mov ecx, var_244
  loc_00601B9D: mov var_294, eax
  loc_00601BA3: mov [ebx+00000004h], ecx
  loc_00601BA6: mov ecx, var_240
  loc_00601BAC: mov [ebx+00000008h], ecx
  loc_00601BAF: mov ecx, var_23C
  loc_00601BB5: mov [ebx+0000000Ch], ecx
  loc_00601BB8: call [edx+00000030h]
  loc_00601BBB: test eax, eax
  loc_00601BBD: fnclex
  loc_00601BBF: jge 00601BD2h
  loc_00601BC1: mov edx, var_294
  loc_00601BC7: push 00000030h
  loc_00601BC9: push 0041EA14h ; "S"
  loc_00601BCE: push edx
  loc_00601BCF: push eax
  loc_00601BD0: call edi
  loc_00601BD2: mov eax, var_188
  loc_00601BD8: lea edx, var_1B8
  loc_00601BDE: lea ecx, var_D4
  loc_00601BE4: mov var_188, 00000000h
  loc_00601BEE: mov var_1B0, eax
  loc_00601BF4: mov var_1B8, 00000009h
  loc_00601BFE: call __vbaVarMove
  loc_00601C00: lea ecx, var_184
  loc_00601C06: call [004012B0h] ; __vbaFreeObj
  loc_00601C0C: mov eax, var_48
  loc_00601C0F: lea edx, var_184
  loc_00601C15: push edx
  loc_00601C16: push eax
  loc_00601C17: mov ecx, [eax]
  loc_00601C19: call [ecx+000000B4h]
  loc_00601C1F: test eax, eax
  loc_00601C21: fnclex
  loc_00601C23: jge 00601C36h
  loc_00601C25: mov ecx, var_48
  loc_00601C28: push 000000B4h
  loc_00601C2D: push 0041E938h
  loc_00601C32: push ecx
  loc_00601C33: push eax
  loc_00601C34: call edi
  loc_00601C36: lea ebx, var_188
  loc_00601C3C: mov eax, var_184
  loc_00601C42: push ebx
  loc_00601C43: mov edx, 00000008h
  loc_00601C48: sub esp, 00000010h
  loc_00601C4B: mov var_248, edx
  loc_00601C51: mov ebx, esp
  loc_00601C53: mov ecx, 0042A170h ; "Type1"
  loc_00601C58: mov var_240, ecx
  loc_00601C5E: mov esi, [eax]
  loc_00601C60: mov [ebx], edx
  loc_00601C62: mov edx, var_244
  loc_00601C68: push eax
  loc_00601C69: mov var_294, eax
  loc_00601C6F: mov [ebx+00000004h], edx
  loc_00601C72: mov [ebx+00000008h], ecx
  loc_00601C75: mov ecx, var_23C
  loc_00601C7B: mov [ebx+0000000Ch], ecx
  loc_00601C7E: call [esi+00000030h]
  loc_00601C81: test eax, eax
  loc_00601C83: fnclex
  loc_00601C85: jge 00601C98h
  loc_00601C87: mov edx, var_294
  loc_00601C8D: push 00000030h
  loc_00601C8F: push 0041EA14h ; "S"
  loc_00601C94: push edx
  loc_00601C95: push eax
  loc_00601C96: call edi
  loc_00601C98: mov eax, var_188
  loc_00601C9E: lea edx, var_1B8
  loc_00601CA4: push edx
  loc_00601CA5: push eax
  loc_00601CA6: mov ecx, [eax]
  loc_00601CA8: mov esi, eax
  loc_00601CAA: call [ecx+00000044h]
  loc_00601CAD: test eax, eax
  loc_00601CAF: fnclex
  loc_00601CB1: jge 00601CBEh
  loc_00601CB3: push 00000044h
  loc_00601CB5: push 0041EA48h
  loc_00601CBA: push esi
  loc_00601CBB: push eax
  loc_00601CBC: call edi
  loc_00601CBE: lea eax, var_1B8
  loc_00601CC4: lea ecx, var_258
  loc_00601CCA: push eax
  loc_00601CCB: push ecx
  loc_00601CCC: mov var_250, 004288FCh ; "S"
  loc_00601CD6: mov var_258, 00008008h
  loc_00601CE0: call [00401110h] ; __vbaVarTstEq
  loc_00601CE6: mov esi, eax
  loc_00601CE8: lea edx, var_188
  loc_00601CEE: lea eax, var_184
  loc_00601CF4: push edx
  loc_00601CF5: push eax
  loc_00601CF6: push 00000002h
  loc_00601CF8: call [00401040h] ; __vbaFreeObjList
  loc_00601CFE: add esp, 0000000Ch
  loc_00601D01: lea ecx, var_1B8
  loc_00601D07: call [00401020h] ; __vbaFreeVar
  loc_00601D0D: test si, si
  loc_00601D10: jz 00601D54h
  loc_00601D12: mov esi, [00401000h] ; __vbaVarSub
  loc_00601D18: lea ecx, var_68
  loc_00601D1B: lea edx, var_158
  loc_00601D21: push ecx
  loc_00601D22: lea eax, var_1B8
  loc_00601D28: push edx
  loc_00601D29: push eax
  loc_00601D2A: call __vbaVarSub
  loc_00601D2C: lea ecx, var_D4
  loc_00601D32: push eax
  loc_00601D33: lea edx, var_118
  loc_00601D39: push ecx
  loc_00601D3A: lea eax, var_1C8
  loc_00601D40: push edx
  loc_00601D41: push eax
  loc_00601D42: call [00401170h] ; __vbaVarMul
  loc_00601D48: lea ecx, var_1D8
  loc_00601D4E: push eax
  loc_00601D4F: push ecx
  loc_00601D50: call __vbaVarSub
  loc_00601D52: jmp 00601D96h
  loc_00601D54: lea edx, var_68
  loc_00601D57: lea eax, var_158
  loc_00601D5D: push edx
  loc_00601D5E: lea ecx, var_1B8
  loc_00601D64: push eax
  loc_00601D65: push ecx
  loc_00601D66: call [00401000h] ; __vbaVarSub
  loc_00601D6C: push eax
  loc_00601D6D: lea edx, var_D4
  loc_00601D73: lea eax, var_118
  loc_00601D79: push edx
  loc_00601D7A: lea ecx, var_1C8
  loc_00601D80: push eax
  loc_00601D81: push ecx
  loc_00601D82: call [00401170h] ; __vbaVarMul
  loc_00601D88: lea edx, var_1D8
  loc_00601D8E: push eax
  loc_00601D8F: push edx
  loc_00601D90: call [00401234h] ; __vbaVarAdd
  loc_00601D96: mov edx, eax
  loc_00601D98: lea ecx, var_17C
  loc_00601D9E: call [00401014h] ; __vbaVarMove
  loc_00601DA4: mov eax, var_48
  loc_00601DA7: lea edx, var_184
  loc_00601DAD: push edx
  loc_00601DAE: push eax
  loc_00601DAF: mov ecx, [eax]
  loc_00601DB1: call [ecx+000000B4h]
  loc_00601DB7: test eax, eax
  loc_00601DB9: fnclex
  loc_00601DBB: jge 00601DCEh
  loc_00601DBD: mov ecx, var_48
  loc_00601DC0: push 000000B4h
  loc_00601DC5: push 0041E938h
  loc_00601DCA: push ecx
  loc_00601DCB: push eax
  loc_00601DCC: call edi
  loc_00601DCE: lea ebx, var_188
  loc_00601DD4: mov eax, var_184
  loc_00601DDA: push ebx
  loc_00601DDB: mov edx, 00000008h
  loc_00601DE0: sub esp, 00000010h
  loc_00601DE3: mov var_248, edx
  loc_00601DE9: mov ebx, esp
  loc_00601DEB: mov ecx, 0042E020h ; "Amount5"
  loc_00601DF0: mov var_240, ecx
  loc_00601DF6: mov esi, [eax]
  loc_00601DF8: mov [ebx], edx
  loc_00601DFA: mov edx, var_244
  loc_00601E00: push eax
  loc_00601E01: mov var_294, eax
  loc_00601E07: mov [ebx+00000004h], edx
  loc_00601E0A: mov [ebx+00000008h], ecx
  loc_00601E0D: mov ecx, var_23C
  loc_00601E13: mov [ebx+0000000Ch], ecx
  loc_00601E16: call [esi+00000030h]
  loc_00601E19: test eax, eax
  loc_00601E1B: fnclex
  loc_00601E1D: jge 00601E30h
  loc_00601E1F: mov edx, var_294
  loc_00601E25: push 00000030h
  loc_00601E27: push 0041EA14h ; "S"
  loc_00601E2C: push edx
  loc_00601E2D: push eax
  loc_00601E2E: call edi
  loc_00601E30: mov eax, var_188
  loc_00601E36: lea edx, var_1B8
  loc_00601E3C: push edx
  loc_00601E3D: push eax
  loc_00601E3E: mov ecx, [eax]
  loc_00601E40: mov esi, eax
  loc_00601E42: call [ecx+00000044h]
  loc_00601E45: test eax, eax
  loc_00601E47: fnclex
  loc_00601E49: jge 00601E56h
  loc_00601E4B: push 00000044h
  loc_00601E4D: push 0041EA48h
  loc_00601E52: push esi
  loc_00601E53: push eax
  loc_00601E54: call edi
  loc_00601E56: lea eax, var_1B8
  loc_00601E5C: push eax
  loc_00601E5D: call [0040121Ch] ; __vbaI4Var
  loc_00601E63: lea ecx, var_188
  loc_00601E69: lea edx, var_184
  loc_00601E6F: push ecx
  loc_00601E70: mov esi, eax
  loc_00601E72: push edx
  loc_00601E73: push 00000002h
  loc_00601E75: mov var_90, esi
  loc_00601E7B: call [00401040h] ; __vbaFreeObjList
  loc_00601E81: add esp, 0000000Ch
  loc_00601E84: lea ecx, var_1B8
  loc_00601E8A: call [00401020h] ; __vbaFreeVar
  loc_00601E90: movsx eax, var_B4
  loc_00601E97: imul eax, esi
  loc_00601E9A: jo 00602B93h
  loc_00601EA0: mov var_338, eax
  loc_00601EA6: lea edx, var_184
  loc_00601EAC: fild real4 ptr var_338
  loc_00601EB2: push edx
  loc_00601EB3: fstp real8 ptr var_340
  loc_00601EB9: fld real8 ptr var_340
  loc_00601EBF: cmp [0061A000h], 00000000h
  loc_00601EC6: jnz 00601ED0h
  loc_00601EC8: fdiv st0, real8 ptr [00402EA8h]
  loc_00601ECE: jmp 00601EE1h
  loc_00601ED0: push [00402EACh]
  loc_00601ED6: push [00402EA8h]
  loc_00601EDC: call 00403B54h ; _adj_fdiv_m64
  loc_00601EE1: fstp real4 ptr var_16C
  loc_00601EE7: fnstsw ax
  loc_00601EE9: test al, 0Dh
  loc_00601EEB: jnz 00602B8Eh
  loc_00601EF1: mov eax, var_48
  loc_00601EF4: push eax
  loc_00601EF5: mov ecx, [eax]
  loc_00601EF7: call [ecx+000000B4h]
  loc_00601EFD: test eax, eax
  loc_00601EFF: fnclex
  loc_00601F01: jge 00601F14h
  loc_00601F03: mov ecx, var_48
  loc_00601F06: push 000000B4h
  loc_00601F0B: push 0041E938h
  loc_00601F10: push ecx
  loc_00601F11: push eax
  loc_00601F12: call edi
  loc_00601F14: lea ebx, var_188
  loc_00601F1A: mov eax, var_184
  loc_00601F20: push ebx
  loc_00601F21: mov edx, 00000008h
  loc_00601F26: sub esp, 00000010h
  loc_00601F29: mov var_248, edx
  loc_00601F2F: mov ebx, esp
  loc_00601F31: mov ecx, 0042CEC8h ; "LAmount5"
  loc_00601F36: mov var_240, ecx
  loc_00601F3C: mov esi, [eax]
  loc_00601F3E: mov [ebx], edx
  loc_00601F40: mov edx, var_244
  loc_00601F46: push eax
  loc_00601F47: mov var_294, eax
  loc_00601F4D: mov [ebx+00000004h], edx
  loc_00601F50: mov [ebx+00000008h], ecx
  loc_00601F53: mov ecx, var_23C
  loc_00601F59: mov [ebx+0000000Ch], ecx
  loc_00601F5C: call [esi+00000030h]
  loc_00601F5F: test eax, eax
  loc_00601F61: fnclex
  loc_00601F63: jge 00601F76h
  loc_00601F65: mov edx, var_294
  loc_00601F6B: push 00000030h
  loc_00601F6D: push 0041EA14h ; "S"
  loc_00601F72: push edx
  loc_00601F73: push eax
  loc_00601F74: call edi
  loc_00601F76: mov eax, var_188
  loc_00601F7C: lea edx, var_1B8
  loc_00601F82: push edx
  loc_00601F83: push eax
  loc_00601F84: mov ecx, [eax]
  loc_00601F86: mov esi, eax
  loc_00601F88: call [ecx+00000044h]
  loc_00601F8B: test eax, eax
  loc_00601F8D: fnclex
  loc_00601F8F: jge 00601F9Ch
  loc_00601F91: push 00000044h
  loc_00601F93: push 0041EA48h
  loc_00601F98: push esi
  loc_00601F99: push eax
  loc_00601F9A: call edi
  loc_00601F9C: lea eax, var_1B8
  loc_00601FA2: push eax
  loc_00601FA3: call [0040121Ch] ; __vbaI4Var
  loc_00601FA9: lea ecx, var_188
  loc_00601FAF: lea edx, var_184
  loc_00601FB5: push ecx
  loc_00601FB6: push edx
  loc_00601FB7: push 00000002h
  loc_00601FB9: mov var_F8, eax
  loc_00601FBF: call [00401040h] ; __vbaFreeObjList
  loc_00601FC5: add esp, 0000000Ch
  loc_00601FC8: lea ecx, var_1B8
  loc_00601FCE: call [00401020h] ; __vbaFreeVar
  loc_00601FD4: mov eax, var_48
  loc_00601FD7: lea edx, var_184
  loc_00601FDD: push edx
  loc_00601FDE: push eax
  loc_00601FDF: mov ecx, [eax]
  loc_00601FE1: call [ecx+000000B4h]
  loc_00601FE7: test eax, eax
  loc_00601FE9: fnclex
  loc_00601FEB: jge 00601FFEh
  loc_00601FED: mov ecx, var_48
  loc_00601FF0: push 000000B4h
  loc_00601FF5: push 0041E938h
  loc_00601FFA: push ecx
  loc_00601FFB: push eax
  loc_00601FFC: call edi
  loc_00601FFE: lea ebx, var_188
  loc_00602004: mov eax, var_184
  loc_0060200A: push ebx
  loc_0060200B: mov edx, 00000008h
  loc_00602010: sub esp, 00000010h
  loc_00602013: mov var_248, edx
  loc_00602019: mov ebx, esp
  loc_0060201B: mov ecx, 0042A170h ; "Type1"
  loc_00602020: mov var_240, ecx
  loc_00602026: mov esi, [eax]
  loc_00602028: mov [ebx], edx
  loc_0060202A: mov edx, var_244
  loc_00602030: push eax
  loc_00602031: mov var_294, eax
  loc_00602037: mov [ebx+00000004h], edx
  loc_0060203A: mov [ebx+00000008h], ecx
  loc_0060203D: mov ecx, var_23C
  loc_00602043: mov [ebx+0000000Ch], ecx
  loc_00602046: call [esi+00000030h]
  loc_00602049: test eax, eax
  loc_0060204B: fnclex
  loc_0060204D: jge 00602060h
  loc_0060204F: mov edx, var_294
  loc_00602055: push 00000030h
  loc_00602057: push 0041EA14h ; "S"
  loc_0060205C: push edx
  loc_0060205D: push eax
  loc_0060205E: call edi
  loc_00602060: mov eax, var_188
  loc_00602066: lea edx, var_1B8
  loc_0060206C: push edx
  loc_0060206D: push eax
  loc_0060206E: mov ecx, [eax]
  loc_00602070: mov esi, eax
  loc_00602072: call [ecx+00000044h]
  loc_00602075: test eax, eax
  loc_00602077: fnclex
  loc_00602079: jge 00602086h
  loc_0060207B: push 00000044h
  loc_0060207D: push 0041EA48h
  loc_00602082: push esi
  loc_00602083: push eax
  loc_00602084: call edi
  loc_00602086: lea eax, var_1B8
  loc_0060208C: lea ecx, var_258
  loc_00602092: push eax
  loc_00602093: push ecx
  loc_00602094: mov var_250, 004288FCh ; "S"
  loc_0060209E: mov var_258, 00008008h
  loc_006020A8: call [00401110h] ; __vbaVarTstEq
  loc_006020AE: mov esi, eax
  loc_006020B0: lea edx, var_188
  loc_006020B6: lea eax, var_184
  loc_006020BC: push edx
  loc_006020BD: push eax
  loc_006020BE: push 00000002h
  loc_006020C0: call [00401040h] ; __vbaFreeObjList
  loc_006020C6: mov ebx, [00401020h] ; __vbaFreeVar
  loc_006020CC: add esp, 0000000Ch
  loc_006020CF: lea ecx, var_1B8
  loc_006020D5: call ebx
  loc_006020D7: fild real4 ptr var_90
  loc_006020DD: test si, si
  loc_006020E0: jz 00602167h
  loc_006020E6: fstp real8 ptr var_348
  loc_006020EC: fld real4 ptr var_16C
  loc_006020F2: fsubr st0, real8 ptr var_348
  loc_006020F8: mov ecx, var_F8
  loc_006020FE: lea edx, var_258
  loc_00602104: mov var_240, ecx
  loc_0060210A: push edx
  loc_0060210B: fstp real8 ptr var_250
  loc_00602111: fnstsw ax
  loc_00602113: test al, 0Dh
  loc_00602115: jnz 00602B8Eh
  loc_0060211B: lea eax, var_248
  loc_00602121: lea ecx, var_118
  loc_00602127: push eax
  loc_00602128: lea edx, var_1B8
  loc_0060212E: push ecx
  loc_0060212F: push edx
  loc_00602130: mov var_258, 00000005h
  loc_0060213A: mov var_248, 00000003h
  loc_00602144: call [00401170h] ; __vbaVarMul
  loc_0060214A: push eax
  loc_0060214B: lea eax, var_1C8
  loc_00602151: push eax
  loc_00602152: call [00401000h] ; __vbaVarSub
  loc_00602158: push eax
  loc_00602159: call [0040121Ch] ; __vbaI4Var
  loc_0060215F: mov var_14, eax
  loc_00602162: jmp 006021EBh
  loc_00602167: fstp real8 ptr var_350
  loc_0060216D: fld real4 ptr var_16C
  loc_00602173: fsubr st0, real8 ptr var_350
  loc_00602179: mov ecx, var_F8
  loc_0060217F: lea edx, var_258
  loc_00602185: mov var_240, ecx
  loc_0060218B: push edx
  loc_0060218C: fstp real8 ptr var_250
  loc_00602192: fnstsw ax
  loc_00602194: test al, 0Dh
  loc_00602196: jnz 00602B8Eh
  loc_0060219C: lea eax, var_248
  loc_006021A2: lea ecx, var_118
  loc_006021A8: push eax
  loc_006021A9: lea edx, var_1B8
  loc_006021AF: push ecx
  loc_006021B0: push edx
  loc_006021B1: mov var_258, 00000005h
  loc_006021BB: mov var_248, 00000003h
  loc_006021C5: call [00401170h] ; __vbaVarMul
  loc_006021CB: push eax
  loc_006021CC: lea eax, var_1C8
  loc_006021D2: push eax
  loc_006021D3: call [00401234h] ; __vbaVarAdd
  loc_006021D9: push eax
  loc_006021DA: call [0040121Ch] ; __vbaI4Var
  loc_006021E0: lea ecx, var_1C8
  loc_006021E6: mov var_14, eax
  loc_006021E9: call ebx
  loc_006021EB: mov eax, var_48
  loc_006021EE: push eax
  loc_006021EF: mov ecx, [eax]
  loc_006021F1: call [ecx+000000D0h]
  loc_006021F7: test eax, eax
  loc_006021F9: fnclex
  loc_006021FB: jge 0060220Eh
  loc_006021FD: mov edx, var_48
  loc_00602200: push 000000D0h
  loc_00602205: push 0041E938h
  loc_0060220A: push edx
  loc_0060220B: push eax
  loc_0060220C: call edi
  loc_0060220E: mov ebx, var_128
  loc_00602214: sub esp, 00000010h
  loc_00602217: mov esi, esp
  loc_00602219: sub esp, 00000010h
  loc_0060221C: mov edx, var_48
  loc_0060221F: mov ecx, 00000008h
  loc_00602224: mov [esi], ebx
  loc_00602226: mov ebx, var_124
  loc_0060222C: mov var_248, ecx
  loc_00602232: mov eax, 00430500h ; "Amount1"
  loc_00602237: mov [esi+00000004h], ebx
  loc_0060223A: mov ebx, var_120
  loc_00602240: mov var_240, eax
  loc_00602246: mov edx, [edx]
  loc_00602248: mov [esi+00000008h], ebx
  loc_0060224B: mov ebx, var_11C
  loc_00602251: mov [esi+0000000Ch], ebx
  loc_00602254: mov esi, esp
  loc_00602256: mov [esi], ecx
  loc_00602258: mov ecx, var_244
  loc_0060225E: mov [esi+00000004h], ecx
  loc_00602261: mov ecx, var_48
  loc_00602264: push ecx
  loc_00602265: mov [esi+00000008h], eax
  loc_00602268: mov eax, var_23C
  loc_0060226E: mov [esi+0000000Ch], eax
  loc_00602271: call [edx+00000128h]
  loc_00602277: test eax, eax
  loc_00602279: fnclex
  loc_0060227B: jge 0060228Eh
  loc_0060227D: mov edx, var_48
  loc_00602280: push 00000128h
  loc_00602285: push 0041E938h
  loc_0060228A: push edx
  loc_0060228B: push eax
  loc_0060228C: call edi
  loc_0060228E: mov ebx, var_148
  loc_00602294: sub esp, 00000010h
  loc_00602297: mov esi, esp
  loc_00602299: sub esp, 00000010h
  loc_0060229C: mov edx, var_48
  loc_0060229F: mov ecx, 00000008h
  loc_006022A4: mov [esi], ebx
  loc_006022A6: mov ebx, var_144
  loc_006022AC: mov var_248, ecx
  loc_006022B2: mov eax, 0042DC28h ; "Amount2"
  loc_006022B7: mov [esi+00000004h], ebx
  loc_006022BA: mov ebx, var_140
  loc_006022C0: mov var_240, eax
  loc_006022C6: mov edx, [edx]
  loc_006022C8: mov [esi+00000008h], ebx
  loc_006022CB: mov ebx, var_13C
  loc_006022D1: mov [esi+0000000Ch], ebx
  loc_006022D4: mov esi, esp
  loc_006022D6: mov [esi], ecx
  loc_006022D8: mov ecx, var_244
  loc_006022DE: mov [esi+00000004h], ecx
  loc_006022E1: mov ecx, var_48
  loc_006022E4: push ecx
  loc_006022E5: mov [esi+00000008h], eax
  loc_006022E8: mov eax, var_23C
  loc_006022EE: mov [esi+0000000Ch], eax
  loc_006022F1: call [edx+00000128h]
  loc_006022F7: test eax, eax
  loc_006022F9: fnclex
  loc_006022FB: jge 0060230Eh
  loc_006022FD: mov edx, var_48
  loc_00602300: push 00000128h
  loc_00602305: push 0041E938h
  loc_0060230A: push edx
  loc_0060230B: push eax
  loc_0060230C: call edi
  loc_0060230E: mov ebx, var_168
  loc_00602314: sub esp, 00000010h
  loc_00602317: mov esi, esp
  loc_00602319: sub esp, 00000010h
  loc_0060231C: mov edx, var_48
  loc_0060231F: mov ecx, 00000008h
  loc_00602324: mov [esi], ebx
  loc_00602326: mov ebx, var_164
  loc_0060232C: mov var_248, ecx
  loc_00602332: mov eax, 0042DC3Ch ; "Amount3"
  loc_00602337: mov [esi+00000004h], ebx
  loc_0060233A: mov ebx, var_160
  loc_00602340: mov var_240, eax
  loc_00602346: mov edx, [edx]
  loc_00602348: mov [esi+00000008h], ebx
  loc_0060234B: mov ebx, var_15C
  loc_00602351: mov [esi+0000000Ch], ebx
  loc_00602354: mov esi, esp
  loc_00602356: mov [esi], ecx
  loc_00602358: mov ecx, var_244
  loc_0060235E: mov [esi+00000004h], ecx
  loc_00602361: mov ecx, var_48
  loc_00602364: push ecx
  loc_00602365: mov [esi+00000008h], eax
  loc_00602368: mov eax, var_23C
  loc_0060236E: mov [esi+0000000Ch], eax
  loc_00602371: call [edx+00000128h]
  loc_00602377: test eax, eax
  loc_00602379: fnclex
  loc_0060237B: jge 0060238Eh
  loc_0060237D: mov edx, var_48
  loc_00602380: push 00000128h
  loc_00602385: push 0041E938h
  loc_0060238A: push edx
  loc_0060238B: push eax
  loc_0060238C: call edi
  loc_0060238E: mov ebx, var_17C
  loc_00602394: sub esp, 00000010h
  loc_00602397: mov esi, esp
  loc_00602399: sub esp, 00000010h
  loc_0060239C: mov edx, var_48
  loc_0060239F: mov ecx, 00000008h
  loc_006023A4: mov [esi], ebx
  loc_006023A6: mov ebx, var_178
  loc_006023AC: mov var_248, ecx
  loc_006023B2: mov eax, 0042DC50h ; "Amount4"
  loc_006023B7: mov [esi+00000004h], ebx
  loc_006023BA: mov ebx, var_174
  loc_006023C0: mov var_240, eax
  loc_006023C6: mov edx, [edx]
  loc_006023C8: mov [esi+00000008h], ebx
  loc_006023CB: mov ebx, var_170
  loc_006023D1: mov [esi+0000000Ch], ebx
  loc_006023D4: mov esi, esp
  loc_006023D6: mov [esi], ecx
  loc_006023D8: mov ecx, var_244
  loc_006023DE: mov [esi+00000004h], ecx
  loc_006023E1: mov ecx, var_48
  loc_006023E4: push ecx
  loc_006023E5: mov [esi+00000008h], eax
  loc_006023E8: mov eax, var_23C
  loc_006023EE: mov [esi+0000000Ch], eax
  loc_006023F1: call [edx+00000128h]
  loc_006023F7: test eax, eax
  loc_006023F9: fnclex
  loc_006023FB: jge 0060240Eh
  loc_006023FD: mov edx, var_48
  loc_00602400: push 00000128h
  loc_00602405: push 0041E938h
  loc_0060240A: push edx
  loc_0060240B: push eax
  loc_0060240C: call edi
  loc_0060240E: sub esp, 00000010h
  loc_00602411: mov eax, var_14
  loc_00602414: mov ebx, esp
  loc_00602416: mov ecx, 00000003h
  loc_0060241B: mov var_258, ecx
  loc_00602421: mov var_250, eax
  loc_00602427: mov [ebx], ecx
  loc_00602429: mov ecx, var_254
  loc_0060242F: sub esp, 00000010h
  loc_00602432: mov esi, var_48
  loc_00602435: mov [ebx+00000004h], ecx
  loc_00602438: mov var_248, 00000008h
  loc_00602442: mov ecx, esp
  loc_00602444: mov edx, 0042E020h ; "Amount5"
  loc_00602449: mov [ebx+00000008h], eax
  loc_0060244C: mov eax, var_24C
  loc_00602452: mov var_240, edx
  loc_00602458: mov esi, [esi]
  loc_0060245A: mov [ebx+0000000Ch], eax
  loc_0060245D: mov eax, var_248
  loc_00602463: mov [ecx], eax
  loc_00602465: mov eax, var_244
  loc_0060246B: mov [ecx+00000004h], eax
  loc_0060246E: mov eax, var_48
  loc_00602471: push eax
  loc_00602472: mov [ecx+00000008h], edx
  loc_00602475: mov edx, var_23C
  loc_0060247B: mov [ecx+0000000Ch], edx
  loc_0060247E: call [esi+00000128h]
  loc_00602484: xor ebx, ebx
  loc_00602486: cmp eax, ebx
  loc_00602488: fnclex
  loc_0060248A: jge 0060249Dh
  loc_0060248C: mov ecx, var_48
  loc_0060248F: push 00000128h
  loc_00602494: push 0041E938h
  loc_00602499: push ecx
  loc_0060249A: push eax
  loc_0060249B: call edi
  loc_0060249D: mov edx, var_48
  loc_006024A0: mov esi, var_F4
  loc_006024A6: mov eax, 0042CCC4h ; "NetAmount"
  loc_006024AB: mov var_248, 00000008h
  loc_006024B5: mov var_240, eax
  loc_006024BB: mov ecx, [edx]
  loc_006024BD: sub esp, 00000010h
  loc_006024C0: mov edx, esp
  loc_006024C2: sub esp, 00000010h
  loc_006024C5: mov [edx], esi
  loc_006024C7: mov esi, var_F0
  loc_006024CD: mov [edx+00000004h], esi
  loc_006024D0: mov esi, var_EC
  loc_006024D6: mov [edx+00000008h], esi
  loc_006024D9: mov esi, var_E8
  loc_006024DF: mov [edx+0000000Ch], esi
  loc_006024E2: mov esi, var_248
  loc_006024E8: mov edx, esp
  loc_006024EA: mov [edx], esi
  loc_006024EC: mov esi, var_244
  loc_006024F2: mov [edx+00000004h], esi
  loc_006024F5: mov [edx+00000008h], eax
  loc_006024F8: mov eax, var_23C
  loc_006024FE: mov [edx+0000000Ch], eax
  loc_00602501: mov edx, var_48
  loc_00602504: push edx
  loc_00602505: call [ecx+00000128h]
  loc_0060250B: cmp eax, ebx
  loc_0060250D: fnclex
  loc_0060250F: jge 00602522h
  loc_00602511: mov ecx, var_48
  loc_00602514: push 00000128h
  loc_00602519: push 0041E938h
  loc_0060251E: push ecx
  loc_0060251F: push eax
  loc_00602520: call edi
  loc_00602522: mov eax, var_48
  loc_00602525: push ebx
  loc_00602526: push 00000001h
  loc_00602528: push eax
  loc_00602529: mov edx, [eax]
  loc_0060252B: call [edx+00000164h]
  loc_00602531: cmp eax, ebx
  loc_00602533: fnclex
  loc_00602535: jge 00602548h
  loc_00602537: mov ecx, var_48
  loc_0060253A: push 00000164h
  loc_0060253F: push 0041E938h
  loc_00602544: push ecx
  loc_00602545: push eax
  loc_00602546: call edi
  loc_00602548: mov eax, var_48
  loc_0060254B: push eax
  loc_0060254C: mov edx, [eax]
  loc_0060254E: call [edx+000000ECh]
  loc_00602554: cmp eax, ebx
  loc_00602556: fnclex
  loc_00602558: jge 005FFFFCh
  loc_0060255E: mov ecx, var_48
  loc_00602561: push 000000ECh
  loc_00602566: push 0041E938h
  loc_0060256B: push ecx
  loc_0060256C: push eax
  loc_0060256D: call edi
  loc_0060256F: jmp 005FFFFCh
  loc_00602574: push eax
  loc_00602575: call [edx+000000C4h]
  loc_0060257B: cmp eax, ebx
  loc_0060257D: fnclex
  loc_0060257F: jge 00602592h
  loc_00602581: mov ecx, var_48
  loc_00602584: push 000000C4h
  loc_00602589: push 0041E938h
  loc_0060258E: push ecx
  loc_0060258F: push eax
  loc_00602590: call edi
  loc_00602592: mov esi, [00401274h] ; __vbaCastObj
  loc_00602598: push 0041E938h
  loc_0060259D: push ebx
  loc_0060259E: call __vbaCastObj
  loc_006025A0: lea edx, var_48
  loc_006025A3: push eax
  loc_006025A4: push edx
  loc_006025A5: call [004010A0h] ; __vbaObjSet
  loc_006025AB: mov eax, var_7C
  loc_006025AE: push eax
  loc_006025AF: mov ecx, [eax]
  loc_006025B1: call [ecx+000000C4h]
  loc_006025B7: cmp eax, ebx
  loc_006025B9: fnclex
  loc_006025BB: jge 006025CEh
  loc_006025BD: mov edx, var_7C
  loc_006025C0: push 000000C4h
  loc_006025C5: push 0041E938h
  loc_006025CA: push edx
  loc_006025CB: push eax
  loc_006025CC: call edi
  loc_006025CE: push 0041E938h
  loc_006025D3: push ebx
  loc_006025D4: call __vbaCastObj
  loc_006025D6: push eax
  loc_006025D7: lea eax, var_7C
  loc_006025DA: push eax
  loc_006025DB: call [004010A0h] ; __vbaObjSet
  loc_006025E1: sub esp, 00000010h
  loc_006025E4: mov edx, [0061A13Ch]
  loc_006025EA: mov esi, esp
  loc_006025EC: mov ecx, 0000000Ah
  loc_006025F1: mov var_248, ecx
  loc_006025F7: mov eax, 80020004h
  loc_006025FC: mov [esi], ecx
  loc_006025FE: mov ecx, var_244
  loc_00602604: mov var_240, eax
  loc_0060260A: mov edx, [edx]
  loc_0060260C: mov [esi+00000004h], ecx
  loc_0060260F: mov ecx, [0061A13Ch]
  loc_00602615: push 004337C0h ; "INSERT INTO TmpTotalWeek2(Agent,Amount1,Amount2,Amount3,Amount4,Amount5) Select Agent,Sum(Amount1),Sum(Amount2),Sum(Amount3),Sum(Amount4),Sum(Amount5) From TmpTotalWeek1 Group By Agent"
  loc_0060261A: push ecx
  loc_0060261B: mov [esi+00000008h], eax
  loc_0060261E: mov eax, var_23C
  loc_00602624: mov [esi+0000000Ch], eax
  loc_00602627: call [edx+0000005Ch]
  loc_0060262A: cmp eax, ebx
  loc_0060262C: fnclex
  loc_0060262E: jge 00602641h
  loc_00602630: mov edx, [0061A13Ch]
  loc_00602636: push 0000005Ch
  loc_00602638: push 0041E928h
  loc_0060263D: push edx
  loc_0060263E: push eax
  loc_0060263F: call edi
  loc_00602641: sub esp, 00000010h
  loc_00602644: mov edx, [0061A13Ch]
  loc_0060264A: mov esi, esp
  loc_0060264C: mov ecx, 0000000Ah
  loc_00602651: mov var_248, ecx
  loc_00602657: mov eax, 80020004h
  loc_0060265C: mov [esi], ecx
  loc_0060265E: mov ecx, var_244
  loc_00602664: mov var_240, eax
  loc_0060266A: mov edx, [edx]
  loc_0060266C: mov [esi+00000004h], ecx
  loc_0060266F: mov ecx, [0061A13Ch]
  loc_00602675: push 0042A98Ch ; "Delete From TmpTotalWeek"
  loc_0060267A: push ecx
  loc_0060267B: mov [esi+00000008h], eax
  loc_0060267E: mov eax, var_23C
  loc_00602684: mov [esi+0000000Ch], eax
  loc_00602687: call [edx+0000005Ch]
  loc_0060268A: cmp eax, ebx
  loc_0060268C: fnclex
  loc_0060268E: jge 006026A1h
  loc_00602690: mov edx, [0061A13Ch]
  loc_00602696: push 0000005Ch
  loc_00602698: push 0041E928h
  loc_0060269D: push edx
  loc_0060269E: push eax
  loc_0060269F: call edi
  loc_006026A1: mov esi, Me
  loc_006026A4: push 0000000Bh
  loc_006026A6: push esi
  loc_006026A7: mov eax, [esi]
  loc_006026A9: call [eax+000000A4h]
  loc_006026AF: cmp eax, ebx
  loc_006026B1: fnclex
  loc_006026B3: jge 006026C3h
  loc_006026B5: push 000000A4h
  loc_006026BA: push 00429194h
  loc_006026BF: push esi
  loc_006026C0: push eax
  loc_006026C1: call edi
  loc_006026C3: mov ecx, [esi]
  loc_006026C5: push 00000000h
  loc_006026C7: push 00000070h
  loc_006026C9: push esi
  loc_006026CA: call [ecx+00000318h]
  loc_006026D0: mov ebx, [004010A0h] ; __vbaObjSet
  loc_006026D6: lea edx, var_184
  loc_006026DC: push eax
  loc_006026DD: push edx
  loc_006026DE: call ebx
  loc_006026E0: push eax
  loc_006026E1: call [00401024h] ; __vbaLateIdCall
  loc_006026E7: add esp, 0000000Ch
  loc_006026EA: lea ecx, var_184
  loc_006026F0: call [004012B0h] ; __vbaFreeObj
  loc_006026F6: sub esp, 00000010h
  loc_006026F9: mov ecx, 0000000Bh
  loc_006026FE: mov edx, esp
  loc_00602700: mov var_248, ecx
  loc_00602706: or eax, FFFFFFFFh
  loc_00602709: push 0000007Dh
  loc_0060270B: mov [edx], ecx
  loc_0060270D: mov ecx, var_244
  loc_00602713: mov var_240, eax
  loc_00602719: push esi
  loc_0060271A: mov [edx+00000004h], ecx
  loc_0060271D: mov ecx, [esi]
  loc_0060271F: mov [edx+00000008h], eax
  loc_00602722: mov eax, var_23C
  loc_00602728: mov [edx+0000000Ch], eax
  loc_0060272B: call [ecx+00000318h]
  loc_00602731: lea edx, var_184
  loc_00602737: push eax
  loc_00602738: push edx
  loc_00602739: call ebx
  loc_0060273B: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_00602741: push eax
  loc_00602742: call ebx
  loc_00602744: lea ecx, var_184
  loc_0060274A: call [004012B0h] ; __vbaFreeObj
  loc_00602750: lea eax, var_248
  loc_00602756: lea ecx, var_1B8
  loc_0060275C: push eax
  loc_0060275D: push ecx
  loc_0060275E: mov var_250, 00000000h
  loc_00602768: mov var_258, 00000002h
  loc_00602772: mov var_240, 0061A150h
  loc_0060277C: mov var_248, 00004008h
  loc_00602786: call [004010D4h] ; rtcTrimVar
  loc_0060278C: lea edx, var_1B8
  loc_00602792: push edx
  loc_00602793: call [00401028h] ; __vbaStrVarMove
  loc_00602799: mov edx, var_258
  loc_0060279F: sub esp, 00000010h
  loc_006027A2: mov ecx, esp
  loc_006027A4: sub esp, 00000010h
  loc_006027A7: mov var_1C8, 00000008h
  loc_006027B1: mov var_1C0, eax
  loc_006027B7: mov [ecx], edx
  loc_006027B9: mov edx, var_254
  loc_006027BF: mov [ecx+00000004h], edx
  loc_006027C2: mov edx, var_250
  loc_006027C8: mov [ecx+00000008h], edx
  loc_006027CB: mov edx, var_24C
  loc_006027D1: mov [ecx+0000000Ch], edx
  loc_006027D4: mov edx, var_1C8
  loc_006027DA: mov ecx, esp
  loc_006027DC: push 00000001h
  loc_006027DE: push 00000020h
  loc_006027E0: push esi
  loc_006027E1: mov [ecx], edx
  loc_006027E3: mov edx, var_1C4
  loc_006027E9: mov [ecx+00000004h], edx
  loc_006027EC: mov [ecx+00000008h], eax
  loc_006027EF: mov eax, var_1BC
  loc_006027F5: mov [ecx+0000000Ch], eax
  loc_006027F8: mov ecx, [esi]
  loc_006027FA: call [ecx+00000318h]
  loc_00602800: lea edx, var_184
  loc_00602806: push eax
  loc_00602807: push edx
  loc_00602808: call [004010A0h] ; __vbaObjSet
  loc_0060280E: push eax
  loc_0060280F: call [00401160h] ; __vbaLateIdCallSt
  loc_00602815: add esp, 0000002Ch
  loc_00602818: lea ecx, var_184
  loc_0060281E: call [004012B0h] ; __vbaFreeObj
  loc_00602824: lea eax, var_1C8
  loc_0060282A: lea ecx, var_1B8
  loc_00602830: push eax
  loc_00602831: push ecx
  loc_00602832: push 00000002h
  loc_00602834: call [00401038h] ; __vbaFreeVarList
  loc_0060283A: mov eax, [0061B394h]
  loc_0060283F: add esp, 0000000Ch
  loc_00602842: test eax, eax
  loc_00602844: jnz 00602856h
  loc_00602846: push 0061B394h
  loc_0060284B: push 0041E4A0h
  loc_00602850: call [004011DCh] ; __vbaNew2
  loc_00602856: mov eax, [0061B394h]
  loc_0060285B: lea ecx, var_184
  loc_00602861: push ecx
  loc_00602862: push eax
  loc_00602863: mov edx, [eax]
  loc_00602865: mov var_290, eax
  loc_0060286B: call [edx+00000014h]
  loc_0060286E: test eax, eax
  loc_00602870: fnclex
  loc_00602872: jge 00602885h
  loc_00602874: mov edx, var_290
  loc_0060287A: push 00000014h
  loc_0060287C: push 0041E490h
  loc_00602881: push edx
  loc_00602882: push eax
  loc_00602883: call edi
  loc_00602885: mov eax, var_184
  loc_0060288B: lea edx, var_180
  loc_00602891: push edx
  loc_00602892: push eax
  loc_00602893: mov ecx, [eax]
  loc_00602895: mov var_298, eax
  loc_0060289B: call [ecx+00000050h]
  loc_0060289E: test eax, eax
  loc_006028A0: fnclex
  loc_006028A2: jge 006028B5h
  loc_006028A4: mov ecx, var_298
  loc_006028AA: push 00000050h
  loc_006028AC: push 0041F3A0h
  loc_006028B1: push ecx
  loc_006028B2: push eax
  loc_006028B3: call edi
  loc_006028B5: mov edx, var_180
  loc_006028BB: push edx
  loc_006028BC: push 0042CCF8h ; "\Reports\TotalWeek1.rpt"
  loc_006028C1: call [00401054h] ; __vbaStrCat
  loc_006028C7: sub esp, 00000010h
  loc_006028CA: mov ecx, 00000008h
  loc_006028CF: mov edx, esp
  loc_006028D1: mov var_1B8, ecx
  loc_006028D7: mov var_1B0, eax
  loc_006028DD: push 00000003h
  loc_006028DF: mov [edx], ecx
  loc_006028E1: mov ecx, var_1B4
  loc_006028E7: push esi
  loc_006028E8: mov [edx+00000004h], ecx
  loc_006028EB: mov ecx, [esi]
  loc_006028ED: mov [edx+00000008h], eax
  loc_006028F0: mov eax, var_1AC
  loc_006028F6: mov [edx+0000000Ch], eax
  loc_006028F9: call [ecx+00000318h]
  loc_006028FF: lea edx, var_188
  loc_00602905: push eax
  loc_00602906: push edx
  loc_00602907: call [004010A0h] ; __vbaObjSet
  loc_0060290D: push eax
  loc_0060290E: call ebx
  loc_00602910: lea ecx, var_180
  loc_00602916: call [004012ACh] ; __vbaFreeStr
  loc_0060291C: lea eax, var_188
  loc_00602922: lea ecx, var_184
  loc_00602928: push eax
  loc_00602929: push ecx
  loc_0060292A: push 00000002h
  loc_0060292C: call [00401040h] ; __vbaFreeObjList
  loc_00602932: add esp, 0000000Ch
  loc_00602935: lea ecx, var_1B8
  loc_0060293B: call [00401020h] ; __vbaFreeVar
  loc_00602941: sub esp, 00000010h
  loc_00602944: mov ecx, 00000003h
  loc_00602949: mov edx, esp
  loc_0060294B: mov var_248, ecx
  loc_00602951: mov eax, 00000002h
  loc_00602956: push 00000043h
  loc_00602958: mov [edx], ecx
  loc_0060295A: mov ecx, var_244
  loc_00602960: mov var_240, eax
  loc_00602966: push esi
  loc_00602967: mov [edx+00000004h], ecx
  loc_0060296A: mov ecx, [esi]
  loc_0060296C: mov [edx+00000008h], eax
  loc_0060296F: mov eax, var_23C
  loc_00602975: mov [edx+0000000Ch], eax
  loc_00602978: call [ecx+00000318h]
  loc_0060297E: lea edx, var_184
  loc_00602984: push eax
  loc_00602985: push edx
  loc_00602986: call [004010A0h] ; __vbaObjSet
  loc_0060298C: push eax
  loc_0060298D: call ebx
  loc_0060298F: lea ecx, var_184
  loc_00602995: call [004012B0h] ; __vbaFreeObj
  loc_0060299B: sub esp, 00000010h
  loc_0060299E: mov ecx, 00000002h
  loc_006029A3: mov edx, esp
  loc_006029A5: mov var_248, ecx
  loc_006029AB: mov eax, 00000001h
  loc_006029B0: push 00000011h
  loc_006029B2: mov [edx], ecx
  loc_006029B4: mov ecx, var_244
  loc_006029BA: mov var_240, eax
  loc_006029C0: push esi
  loc_006029C1: mov [edx+00000004h], ecx
  loc_006029C4: mov ecx, [esi]
  loc_006029C6: mov [edx+00000008h], eax
  loc_006029C9: mov eax, var_23C
  loc_006029CF: mov [edx+0000000Ch], eax
  loc_006029D2: call [ecx+00000318h]
  loc_006029D8: lea edx, var_184
  loc_006029DE: push eax
  loc_006029DF: push edx
  loc_006029E0: call [004010A0h] ; __vbaObjSet
  loc_006029E6: push eax
  loc_006029E7: call ebx
  loc_006029E9: lea ecx, var_184
  loc_006029EF: call [004012B0h] ; __vbaFreeObj
  loc_006029F5: mov eax, [esi]
  loc_006029F7: push 00000001h
  loc_006029F9: push esi
  loc_006029FA: call [eax+000000A4h]
  loc_00602A00: test eax, eax
  loc_00602A02: fnclex
  loc_00602A04: jge 00602A14h
  loc_00602A06: push 000000A4h
  loc_00602A0B: push 00429194h
  loc_00602A10: push esi
  loc_00602A11: push eax
  loc_00602A12: call edi
  loc_00602A14: fwait
  loc_00602A15: push 00602B79h
  loc_00602A1A: jmp 00602AC4h
  loc_00602A1F: lea ecx, var_180
  loc_00602A25: call [004012ACh] ; __vbaFreeStr
  loc_00602A2B: lea ecx, var_1A8
  loc_00602A31: lea edx, var_1A4
  loc_00602A37: push ecx
  loc_00602A38: lea eax, var_1A0
  loc_00602A3E: push edx
  loc_00602A3F: lea ecx, var_19C
  loc_00602A45: push eax
  loc_00602A46: lea edx, var_198
  loc_00602A4C: push ecx
  loc_00602A4D: lea eax, var_194
  loc_00602A53: push edx
  loc_00602A54: lea ecx, var_190
  loc_00602A5A: push eax
  loc_00602A5B: lea edx, var_18C
  loc_00602A61: push ecx
  loc_00602A62: lea eax, var_188
  loc_00602A68: push edx
  loc_00602A69: lea ecx, var_184
  loc_00602A6F: push eax
  loc_00602A70: push ecx
  loc_00602A71: push 0000000Ah
  loc_00602A73: call [00401040h] ; __vbaFreeObjList
  loc_00602A79: lea edx, var_238
  loc_00602A7F: lea eax, var_228
  loc_00602A85: push edx
  loc_00602A86: lea ecx, var_218
  loc_00602A8C: push eax
  loc_00602A8D: lea edx, var_208
  loc_00602A93: push ecx
  loc_00602A94: lea eax, var_1F8
  loc_00602A9A: push edx
  loc_00602A9B: lea ecx, var_1E8
  loc_00602AA1: push eax
  loc_00602AA2: lea edx, var_1D8
  loc_00602AA8: push ecx
  loc_00602AA9: lea eax, var_1C8
  loc_00602AAF: push edx
  loc_00602AB0: lea ecx, var_1B8
  loc_00602AB6: push eax
  loc_00602AB7: push ecx
  loc_00602AB8: push 00000009h
  loc_00602ABA: call [00401038h] ; __vbaFreeVarList
  loc_00602AC0: add esp, 00000054h
  loc_00602AC3: ret
  loc_00602AC4: mov esi, [00401020h] ; __vbaFreeVar
  loc_00602ACA: lea ecx, var_300
  loc_00602AD0: call __vbaFreeVar
  loc_00602AD2: lea ecx, var_24
  loc_00602AD5: call __vbaFreeVar
  loc_00602AD7: lea ecx, var_34
  loc_00602ADA: call __vbaFreeVar
  loc_00602ADC: lea ecx, var_44
  loc_00602ADF: call __vbaFreeVar
  loc_00602AE1: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00602AE7: lea ecx, var_48
  loc_00602AEA: call edi
  loc_00602AEC: lea ecx, var_58
  loc_00602AEF: call __vbaFreeVar
  loc_00602AF1: lea ecx, var_68
  loc_00602AF4: call __vbaFreeVar
  loc_00602AF6: lea ecx, var_78
  loc_00602AF9: call __vbaFreeVar
  loc_00602AFB: lea ecx, var_7C
  loc_00602AFE: call edi
  loc_00602B00: lea ecx, var_8C
  loc_00602B06: call __vbaFreeVar
  loc_00602B08: lea ecx, var_A0
  loc_00602B0E: call __vbaFreeVar
  loc_00602B10: lea ecx, var_B0
  loc_00602B16: call __vbaFreeVar
  loc_00602B18: lea ecx, var_C4
  loc_00602B1E: call __vbaFreeVar
  loc_00602B20: lea ecx, var_D4
  loc_00602B26: call __vbaFreeVar
  loc_00602B28: lea ecx, var_E4
  loc_00602B2E: call __vbaFreeVar
  loc_00602B30: lea ecx, var_F4
  loc_00602B36: call __vbaFreeVar
  loc_00602B38: lea ecx, var_108
  loc_00602B3E: call __vbaFreeVar
  loc_00602B40: lea ecx, var_118
  loc_00602B46: call __vbaFreeVar
  loc_00602B48: lea ecx, var_128
  loc_00602B4E: call __vbaFreeVar
  loc_00602B50: lea ecx, var_138
  loc_00602B56: call __vbaFreeVar
  loc_00602B58: lea ecx, var_148
  loc_00602B5E: call __vbaFreeVar
  loc_00602B60: lea ecx, var_158
  loc_00602B66: call __vbaFreeVar
  loc_00602B68: lea ecx, var_168
  loc_00602B6E: call __vbaFreeVar
  loc_00602B70: lea ecx, var_17C
  loc_00602B76: call __vbaFreeVar
  loc_00602B78: ret
  loc_00602B79: mov ecx, var_10
  loc_00602B7C: pop edi
  loc_00602B7D: pop esi
  loc_00602B7E: xor eax, eax
  loc_00602B80: mov fs:[00000000h], ecx
  loc_00602B87: pop ebx
  loc_00602B88: mov esp, ebp
  loc_00602B8A: pop ebp
  loc_00602B8B: retn 0004h
End Sub
