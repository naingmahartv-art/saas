VERSION 5.00
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC0000F8754DA1}#2.0#0"; "C:\WINDOWS\SysWow64\MSCOMCT2.OCX"
Begin VB.Form frmReceive
  Caption = "Receive ...."
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 7860
  ClientHeight = 3735
  BeginProperty Font
    Name = "Arial"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 2 'CenterScreen
  Begin VB.ComboBox txtName
    Left = 930
    Top = 1200
    Width = 2115
    Height = 360
    TabIndex = 18
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmReceive.frx":0000
    Left = 6990
    Top = 150
  End
  Begin VB.TextBox txtSrNo
    Left = 930
    Top = 390
    Width = 1875
    Height = 415
    TabIndex = 1
    Locked = -1  'True
  End
  Begin VB.CheckBox chkLanguage
    Caption = "E"
    Left = 7080
    Top = 1890
    Width = 345
    Height = 435
    TabIndex = 15
    Style = 1
  End
  Begin VB.TextBox txtAmount
    Left = 4200
    Top = 1140
    Width = 2085
    Height = 415
    TabIndex = 2
    BeginProperty Font
      Name = "Arial"
      Size = 9.75
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtRemark
    Left = 930
    Top = 1890
    Width = 6105
    Height = 415
    TabIndex = 3
  End
  Begin VB.CommandButton cmdSearch
    Caption = "Se&arch"
    Left = 1830
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 6
  End
  Begin VB.CommandButton cmdNew
    Caption = "&New"
    Left = 930
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 0
  End
  Begin VB.CommandButton cmdExit
    Caption = "E&xit"
    Left = 5430
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 10
  End
  Begin VB.CommandButton cmdReport
    Caption = "&Report"
    Left = 4530
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 9
  End
  Begin VB.CommandButton cmdEdit
    Caption = "&Edit"
    Left = 2730
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 7
  End
  Begin VB.CommandButton cmdDelete
    Caption = "&Delete"
    Left = 3630
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 8
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 1830
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 5
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 930
    Top = 2910
    Width = 900
    Height = 405
    TabIndex = 4
  End
  Begin MSComCtl2.DTPicker txtDate
    Left = 4200
    Top = 420
    Width = 2085
    Height = 405
    TabIndex = 17
    OleObjectBlob = "frmReceive.frx":00F3
  End
  Begin VB.Label Label5
    Caption = "Sr No."
    Left = 270
    Top = 480
    Width = 705
    Height = 285
    TabIndex = 16
  End
  Begin VB.Label Label4
    Caption = "Amount"
    Left = 3510
    Top = 1215
    Width = 1065
    Height = 315
    TabIndex = 14
  End
  Begin VB.Label Label3
    Caption = "Remark"
    Left = 240
    Top = 2010
    Width = 645
    Height = 255
    TabIndex = 13
  End
  Begin VB.Label Label2
    Caption = "Date."
    Left = 3510
    Top = 495
    Width = 675
    Height = 315
    TabIndex = 12
  End
  Begin VB.Label Label1
    Caption = "Name"
    Left = 240
    Top = 1260
    Width = 705
    Height = 285
    TabIndex = 11
  End
End

Attribute VB_Name = "frmReceive"


Private Sub txtDate_KeyUp(KeyCode As Integer, Shift As Integer) '611FE0
  loc_00611FE0: push ebp
  loc_00611FE1: mov ebp, esp
  loc_00611FE3: sub esp, 0000000Ch
  loc_00611FE6: push 00403B36h ; __vbaExceptHandler
  loc_00611FEB: mov eax, fs:[00000000h]
  loc_00611FF1: push eax
  loc_00611FF2: mov fs:[00000000h], esp
  loc_00611FF9: sub esp, 00000014h
  loc_00611FFC: push ebx
  loc_00611FFD: push esi
  loc_00611FFE: push edi
  loc_00611FFF: mov var_C, esp
  loc_00612002: mov var_8, 004039D0h
  loc_00612009: mov esi, Me
  loc_0061200C: mov eax, esi
  loc_0061200E: and eax, 00000001h
  loc_00612011: mov var_4, eax
  loc_00612014: and esi, FFFFFFFEh
  loc_00612017: push esi
  loc_00612018: mov Me, esi
  loc_0061201B: mov ecx, [esi]
  loc_0061201D: call [ecx+00000004h]
  loc_00612020: mov edx, KeyCode
  loc_00612023: xor edi, edi
  loc_00612025: mov var_18, edi
  loc_00612028: cmp [edx], 000Dh
  loc_0061202C: jnz 0061206Eh
  loc_0061202E: mov eax, [esi]
  loc_00612030: push esi
  loc_00612031: call [eax+000002FCh]
  loc_00612037: lea ecx, var_18
  loc_0061203A: push eax
  loc_0061203B: push ecx
  loc_0061203C: call [004010A0h] ; __vbaObjSet
  loc_00612042: mov esi, eax
  loc_00612044: push esi
  loc_00612045: mov edx, [esi]
  loc_00612047: call [edx+000001F4h]
  loc_0061204D: cmp eax, edi
  loc_0061204F: fnclex
  loc_00612051: jge 00612065h
  loc_00612053: push 000001F4h
  loc_00612058: push 0041F844h
  loc_0061205D: push esi
  loc_0061205E: push eax
  loc_0061205F: call [00401074h] ; __vbaHresultCheckObj
  loc_00612065: lea ecx, var_18
  loc_00612068: call [004012B0h] ; __vbaFreeObj
  loc_0061206E: mov var_4, edi
  loc_00612071: push 00612083h
  loc_00612076: jmp 00612082h
  loc_00612078: lea ecx, var_18
  loc_0061207B: call [004012B0h] ; __vbaFreeObj
  loc_00612081: ret
  loc_00612082: ret
  loc_00612083: mov eax, Me
  loc_00612086: push eax
  loc_00612087: mov ecx, [eax]
  loc_00612089: call [ecx+00000008h]
  loc_0061208C: mov eax, var_4
  loc_0061208F: mov ecx, var_14
  loc_00612092: pop edi
  loc_00612093: pop esi
  loc_00612094: mov fs:[00000000h], ecx
  loc_0061209B: pop ebx
  loc_0061209C: mov esp, ebp
  loc_0061209E: pop ebp
  loc_0061209F: retn 000Ch
End Sub

Private Sub txtDate_KeyPress(KeyAscii As Integer) '611F10
  loc_00611F10: push ebp
  loc_00611F11: mov ebp, esp
  loc_00611F13: sub esp, 0000000Ch
  loc_00611F16: push 00403B36h ; __vbaExceptHandler
  loc_00611F1B: mov eax, fs:[00000000h]
  loc_00611F21: push eax
  loc_00611F22: mov fs:[00000000h], esp
  loc_00611F29: sub esp, 00000014h
  loc_00611F2C: push ebx
  loc_00611F2D: push esi
  loc_00611F2E: push edi
  loc_00611F2F: mov var_C, esp
  loc_00611F32: mov var_8, 004039C0h
  loc_00611F39: mov esi, Me
  loc_00611F3C: mov eax, esi
  loc_00611F3E: and eax, 00000001h
  loc_00611F41: mov var_4, eax
  loc_00611F44: and esi, FFFFFFFEh
  loc_00611F47: push esi
  loc_00611F48: mov Me, esi
  loc_00611F4B: mov ecx, [esi]
  loc_00611F4D: call [ecx+00000004h]
  loc_00611F50: mov edx, KeyAscii
  loc_00611F53: xor edi, edi
  loc_00611F55: mov var_18, edi
  loc_00611F58: cmp [edx], 000Dh
  loc_00611F5C: jnz 00611F9Eh
  loc_00611F5E: mov eax, [esi]
  loc_00611F60: push esi
  loc_00611F61: call [eax+000002FCh]
  loc_00611F67: lea ecx, var_18
  loc_00611F6A: push eax
  loc_00611F6B: push ecx
  loc_00611F6C: call [004010A0h] ; __vbaObjSet
  loc_00611F72: mov esi, eax
  loc_00611F74: push esi
  loc_00611F75: mov edx, [esi]
  loc_00611F77: call [edx+000001F4h]
  loc_00611F7D: cmp eax, edi
  loc_00611F7F: fnclex
  loc_00611F81: jge 00611F95h
  loc_00611F83: push 000001F4h
  loc_00611F88: push 0041F844h
  loc_00611F8D: push esi
  loc_00611F8E: push eax
  loc_00611F8F: call [00401074h] ; __vbaHresultCheckObj
  loc_00611F95: lea ecx, var_18
  loc_00611F98: call [004012B0h] ; __vbaFreeObj
  loc_00611F9E: mov var_4, edi
  loc_00611FA1: push 00611FB3h
  loc_00611FA6: jmp 00611FB2h
  loc_00611FA8: lea ecx, var_18
  loc_00611FAB: call [004012B0h] ; __vbaFreeObj
  loc_00611FB1: ret
  loc_00611FB2: ret
  loc_00611FB3: mov eax, Me
  loc_00611FB6: push eax
  loc_00611FB7: mov ecx, [eax]
  loc_00611FB9: call [ecx+00000008h]
  loc_00611FBC: mov eax, var_4
  loc_00611FBF: mov ecx, var_14
  loc_00611FC2: pop edi
  loc_00611FC3: pop esi
  loc_00611FC4: mov fs:[00000000h], ecx
  loc_00611FCB: pop ebx
  loc_00611FCC: mov esp, ebp
  loc_00611FCE: pop ebp
  loc_00611FCF: retn 0008h
End Sub

Private Sub cmdSave_Click() '611070
  loc_00611070: push ebp
  loc_00611071: mov ebp, esp
  loc_00611073: sub esp, 0000000Ch
  loc_00611076: push 00403B36h ; __vbaExceptHandler
  loc_0061107B: mov eax, fs:[00000000h]
  loc_00611081: push eax
  loc_00611082: mov fs:[00000000h], esp
  loc_00611089: sub esp, 00000008h
  loc_0061108C: push ebx
  loc_0061108D: push esi
  loc_0061108E: push edi
  loc_0061108F: mov var_C, esp
  loc_00611092: mov var_8, 00403948h
  loc_00611099: mov esi, Me
  loc_0061109C: mov eax, esi
  loc_0061109E: and eax, 00000001h
  loc_006110A1: mov var_4, eax
  loc_006110A4: and esi, FFFFFFFEh
  loc_006110A7: push esi
  loc_006110A8: mov Me, esi
  loc_006110AB: mov ecx, [esi]
  loc_006110AD: call [ecx+00000004h]
  loc_006110B0: cmp [esi+00000038h], FFFFFFh
  loc_006110B5: jnz 006110C2h
  loc_006110B7: mov edx, [esi]
  loc_006110B9: push esi
  loc_006110BA: call [edx+00000750h]
  loc_006110C0: jmp 006110CBh
  loc_006110C2: mov eax, [esi]
  loc_006110C4: push esi
  loc_006110C5: call [eax+0000074Ch]
  loc_006110CB: mov var_4, 00000000h
  loc_006110D2: mov eax, Me
  loc_006110D5: push eax
  loc_006110D6: mov ecx, [eax]
  loc_006110D8: call [ecx+00000008h]
  loc_006110DB: mov eax, var_4
  loc_006110DE: mov ecx, var_14
  loc_006110E1: pop edi
  loc_006110E2: pop esi
  loc_006110E3: mov fs:[00000000h], ecx
  loc_006110EA: pop ebx
  loc_006110EB: mov esp, ebp
  loc_006110ED: pop ebp
  loc_006110EE: retn 0004h
End Sub

Private Sub cmdNew_Click() '60FAB0
  loc_0060FAB0: push ebp
  loc_0060FAB1: mov ebp, esp
  loc_0060FAB3: sub esp, 0000000Ch
  loc_0060FAB6: push 00403B36h ; __vbaExceptHandler
  loc_0060FABB: mov eax, fs:[00000000h]
  loc_0060FAC1: push eax
  loc_0060FAC2: mov fs:[00000000h], esp
  loc_0060FAC9: sub esp, 00000020h
  loc_0060FACC: push ebx
  loc_0060FACD: push esi
  loc_0060FACE: push edi
  loc_0060FACF: mov var_C, esp
  loc_0060FAD2: mov var_8, 00403918h
  loc_0060FAD9: mov esi, Me
  loc_0060FADC: mov eax, esi
  loc_0060FADE: and eax, 00000001h
  loc_0060FAE1: mov var_4, eax
  loc_0060FAE4: and esi, FFFFFFFEh
  loc_0060FAE7: push esi
  loc_0060FAE8: mov Me, esi
  loc_0060FAEB: mov ecx, [esi]
  loc_0060FAED: call [ecx+00000004h]
  loc_0060FAF0: mov edx, [esi]
  loc_0060FAF2: xor edi, edi
  loc_0060FAF4: push esi
  loc_0060FAF5: mov var_18, edi
  loc_0060FAF8: mov var_28, edi
  loc_0060FAFB: mov var_2C, edi
  loc_0060FAFE: mov [esi+00000038h], di
  loc_0060FB02: call [edx+00000738h]
  loc_0060FB08: mov eax, [esi]
  loc_0060FB0A: lea ecx, var_2C
  loc_0060FB0D: push ecx
  loc_0060FB0E: push esi
  loc_0060FB0F: mov var_2C, FFFFFFFFh
  loc_0060FB16: call [eax+00000734h]
  loc_0060FB1C: mov edx, [esi]
  loc_0060FB1E: lea eax, var_28
  loc_0060FB21: lea ecx, var_2C
  loc_0060FB24: push eax
  loc_0060FB25: push ecx
  loc_0060FB26: push esi
  loc_0060FB27: mov var_2C, edi
  loc_0060FB2A: call [edx+00000730h]
  loc_0060FB30: lea ecx, var_28
  loc_0060FB33: call [00401020h] ; __vbaFreeVar
  loc_0060FB39: mov edx, [esi]
  loc_0060FB3B: push esi
  loc_0060FB3C: call [edx+00000714h]
  loc_0060FB42: mov eax, [esi]
  loc_0060FB44: push edi
  loc_0060FB45: push 80011000h
  loc_0060FB4A: push esi
  loc_0060FB4B: call [eax+00000348h]
  loc_0060FB51: lea ecx, var_18
  loc_0060FB54: push eax
  loc_0060FB55: push ecx
  loc_0060FB56: call [004010A0h] ; __vbaObjSet
  loc_0060FB5C: push eax
  loc_0060FB5D: call [00401024h] ; __vbaLateIdCall
  loc_0060FB63: add esp, 0000000Ch
  loc_0060FB66: lea ecx, var_18
  loc_0060FB69: call [004012B0h] ; __vbaFreeObj
  loc_0060FB6F: mov var_4, edi
  loc_0060FB72: push 0060FB8Dh
  loc_0060FB77: jmp 0060FB8Ch
  loc_0060FB79: lea ecx, var_18
  loc_0060FB7C: call [004012B0h] ; __vbaFreeObj
  loc_0060FB82: lea ecx, var_28
  loc_0060FB85: call [00401020h] ; __vbaFreeVar
  loc_0060FB8B: ret
  loc_0060FB8C: ret
  loc_0060FB8D: mov eax, Me
  loc_0060FB90: push eax
  loc_0060FB91: mov edx, [eax]
  loc_0060FB93: call [edx+00000008h]
  loc_0060FB96: mov eax, var_4
  loc_0060FB99: mov ecx, var_14
  loc_0060FB9C: pop edi
  loc_0060FB9D: pop esi
  loc_0060FB9E: mov fs:[00000000h], ecx
  loc_0060FBA5: pop ebx
  loc_0060FBA6: mov esp, ebp
  loc_0060FBA8: pop ebp
  loc_0060FBA9: retn 0004h
End Sub

Private Sub cmdCancel_Click() '60EDC0
  loc_0060EDC0: push ebp
  loc_0060EDC1: mov ebp, esp
  loc_0060EDC3: sub esp, 0000000Ch
  loc_0060EDC6: push 00403B36h ; __vbaExceptHandler
  loc_0060EDCB: mov eax, fs:[00000000h]
  loc_0060EDD1: push eax
  loc_0060EDD2: mov fs:[00000000h], esp
  loc_0060EDD9: sub esp, 00000028h
  loc_0060EDDC: push ebx
  loc_0060EDDD: push esi
  loc_0060EDDE: push edi
  loc_0060EDDF: mov var_C, esp
  loc_0060EDE2: mov var_8, 004038D8h
  loc_0060EDE9: mov esi, Me
  loc_0060EDEC: mov eax, esi
  loc_0060EDEE: and eax, 00000001h
  loc_0060EDF1: mov var_4, eax
  loc_0060EDF4: and esi, FFFFFFFEh
  loc_0060EDF7: push esi
  loc_0060EDF8: mov Me, esi
  loc_0060EDFB: mov ecx, [esi]
  loc_0060EDFD: call [ecx+00000004h]
  loc_0060EE00: mov edx, [esi]
  loc_0060EE02: lea eax, var_28
  loc_0060EE05: lea ecx, var_2C
  loc_0060EE08: xor edi, edi
  loc_0060EE0A: push eax
  loc_0060EE0B: push ecx
  loc_0060EE0C: mov var_2C, edi
  loc_0060EE0F: push esi
  loc_0060EE10: mov var_18, edi
  loc_0060EE13: mov var_28, edi
  loc_0060EE16: mov [esi+00000038h], di
  loc_0060EE1A: mov var_2C, FFFFFFFFh
  loc_0060EE21: call [edx+00000730h]
  loc_0060EE27: lea ecx, var_28
  loc_0060EE2A: call [00401020h] ; __vbaFreeVar
  loc_0060EE30: mov edx, [esi]
  loc_0060EE32: lea eax, var_2C
  loc_0060EE35: push eax
  loc_0060EE36: push esi
  loc_0060EE37: mov var_2C, edi
  loc_0060EE3A: call [edx+00000734h]
  loc_0060EE40: mov ecx, [esi]
  loc_0060EE42: push esi
  loc_0060EE43: call [ecx+00000314h]
  loc_0060EE49: lea edx, var_18
  loc_0060EE4C: push eax
  loc_0060EE4D: push edx
  loc_0060EE4E: call [004010A0h] ; __vbaObjSet
  loc_0060EE54: mov esi, eax
  loc_0060EE56: push esi
  loc_0060EE57: mov eax, [esi]
  loc_0060EE59: call [eax+000001A4h]
  loc_0060EE5F: cmp eax, edi
  loc_0060EE61: fnclex
  loc_0060EE63: jge 0060EE77h
  loc_0060EE65: push 000001A4h
  loc_0060EE6A: push 0041EAACh
  loc_0060EE6F: push esi
  loc_0060EE70: push eax
  loc_0060EE71: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EE77: lea ecx, var_18
  loc_0060EE7A: call [004012B0h] ; __vbaFreeObj
  loc_0060EE80: mov var_4, edi
  loc_0060EE83: push 0060EE9Eh
  loc_0060EE88: jmp 0060EE9Dh
  loc_0060EE8A: lea ecx, var_18
  loc_0060EE8D: call [004012B0h] ; __vbaFreeObj
  loc_0060EE93: lea ecx, var_28
  loc_0060EE96: call [00401020h] ; __vbaFreeVar
  loc_0060EE9C: ret
  loc_0060EE9D: ret
  loc_0060EE9E: mov eax, Me
  loc_0060EEA1: push eax
  loc_0060EEA2: mov ecx, [eax]
  loc_0060EEA4: call [ecx+00000008h]
  loc_0060EEA7: mov eax, var_4
  loc_0060EEAA: mov ecx, var_14
  loc_0060EEAD: pop edi
  loc_0060EEAE: pop esi
  loc_0060EEAF: mov fs:[00000000h], ecx
  loc_0060EEB6: pop ebx
  loc_0060EEB7: mov esp, ebp
  loc_0060EEB9: pop ebp
  loc_0060EEBA: retn 0004h
End Sub

Private Sub cmdEdit_Click() '60F810
  loc_0060F810: push ebp
  loc_0060F811: mov ebp, esp
  loc_0060F813: sub esp, 0000000Ch
  loc_0060F816: push 00403B36h ; __vbaExceptHandler
  loc_0060F81B: mov eax, fs:[00000000h]
  loc_0060F821: push eax
  loc_0060F822: mov fs:[00000000h], esp
  loc_0060F829: sub esp, 00000054h
  loc_0060F82C: push ebx
  loc_0060F82D: push esi
  loc_0060F82E: push edi
  loc_0060F82F: mov var_C, esp
  loc_0060F832: mov var_8, 004038F8h
  loc_0060F839: mov esi, Me
  loc_0060F83C: mov eax, esi
  loc_0060F83E: and eax, 00000001h
  loc_0060F841: mov var_4, eax
  loc_0060F844: and esi, FFFFFFFEh
  loc_0060F847: push esi
  loc_0060F848: mov Me, esi
  loc_0060F84B: mov ecx, [esi]
  loc_0060F84D: call [ecx+00000004h]
  loc_0060F850: xor edi, edi
  loc_0060F852: mov edx, 00433760h ; "Receive"
  loc_0060F857: mov ecx, 0061A0A0h
  loc_0060F85C: mov var_24, edi
  loc_0060F85F: mov var_34, edi
  loc_0060F862: mov var_44, edi
  loc_0060F865: mov var_54, edi
  loc_0060F868: mov var_58, edi
  loc_0060F86B: call [004011ECh] ; __vbaStrCopy
  loc_0060F871: cmp [0061A404h], edi
  loc_0060F877: jnz 0060F889h
  loc_0060F879: push 0061A404h
  loc_0060F87E: push 0040B064h
  loc_0060F883: call [004011DCh] ; __vbaNew2
  loc_0060F889: sub esp, 00000010h
  loc_0060F88C: mov ecx, 0000000Ah
  loc_0060F891: mov ebx, esp
  loc_0060F893: mov var_54, ecx
  loc_0060F896: mov eax, 80020004h
  loc_0060F89B: sub esp, 00000010h
  loc_0060F89E: mov [ebx], ecx
  loc_0060F8A0: mov ecx, var_50
  loc_0060F8A3: mov var_4C, eax
  loc_0060F8A6: mov edi, [0061A404h]
  loc_0060F8AC: mov [ebx+00000004h], ecx
  loc_0060F8AF: mov var_44, 00000002h
  loc_0060F8B6: mov ecx, esp
  loc_0060F8B8: mov var_3C, 00000001h
  loc_0060F8BF: mov [ebx+00000008h], eax
  loc_0060F8C2: mov eax, var_48
  loc_0060F8C5: mov edx, [edi]
  loc_0060F8C7: push edi
  loc_0060F8C8: mov [ebx+0000000Ch], eax
  loc_0060F8CB: mov eax, var_44
  loc_0060F8CE: mov [ecx], eax
  loc_0060F8D0: mov eax, var_40
  loc_0060F8D3: mov [ecx+00000004h], eax
  loc_0060F8D6: mov eax, var_3C
  loc_0060F8D9: mov [ecx+00000008h], eax
  loc_0060F8DC: mov eax, var_38
  loc_0060F8DF: mov [ecx+0000000Ch], eax
  loc_0060F8E2: call [edx+000002B0h]
  loc_0060F8E8: test eax, eax
  loc_0060F8EA: fnclex
  loc_0060F8EC: jge 0060F900h
  loc_0060F8EE: push 000002B0h
  loc_0060F8F3: push 0042B80Ch
  loc_0060F8F8: push edi
  loc_0060F8F9: push eax
  loc_0060F8FA: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F900: lea ecx, var_44
  loc_0060F903: lea edx, var_24
  loc_0060F906: push ecx
  loc_0060F907: push edx
  loc_0060F908: mov var_3C, 0061A058h
  loc_0060F90F: mov var_44, 00004008h
  loc_0060F916: call [004010D4h] ; rtcTrimVar
  loc_0060F91C: lea eax, var_24
  loc_0060F91F: lea ecx, var_54
  loc_0060F922: push eax
  loc_0060F923: push ecx
  loc_0060F924: mov var_4C, 0041E5D4h
  loc_0060F92B: mov var_54, 00008008h
  loc_0060F932: call [00401218h] ; __vbaVarTstNe
  loc_0060F938: mov edi, [00401020h] ; __vbaFreeVar
  loc_0060F93E: lea ecx, var_24
  loc_0060F941: mov ebx, eax
  loc_0060F943: call edi
  loc_0060F945: test bx, bx
  loc_0060F948: jz 0060F990h
  loc_0060F94A: mov edx, [esi]
  loc_0060F94C: push esi
  loc_0060F94D: call [edx+00000738h]
  loc_0060F953: mov eax, [esi]
  loc_0060F955: push esi
  loc_0060F956: call [eax+00000758h]
  loc_0060F95C: mov ecx, [esi]
  loc_0060F95E: lea edx, var_58
  loc_0060F961: or ebx, FFFFFFFFh
  loc_0060F964: push edx
  loc_0060F965: push esi
  loc_0060F966: mov var_58, ebx
  loc_0060F969: call [ecx+00000734h]
  loc_0060F96F: mov eax, [esi]
  loc_0060F971: lea ecx, var_24
  loc_0060F974: lea edx, var_58
  loc_0060F977: push ecx
  loc_0060F978: push edx
  loc_0060F979: push esi
  loc_0060F97A: mov var_58, 00000000h
  loc_0060F981: call [eax+00000730h]
  loc_0060F987: lea ecx, var_24
  loc_0060F98A: call edi
  loc_0060F98C: mov [esi+00000038h], bx
  loc_0060F990: mov var_4, 00000000h
  loc_0060F997: push 0060F9B3h
  loc_0060F99C: jmp 0060F9B2h
  loc_0060F99E: lea eax, var_34
  loc_0060F9A1: lea ecx, var_24
  loc_0060F9A4: push eax
  loc_0060F9A5: push ecx
  loc_0060F9A6: push 00000002h
  loc_0060F9A8: call [00401038h] ; __vbaFreeVarList
  loc_0060F9AE: add esp, 0000000Ch
  loc_0060F9B1: ret
  loc_0060F9B2: ret
  loc_0060F9B3: mov eax, Me
  loc_0060F9B6: push eax
  loc_0060F9B7: mov edx, [eax]
  loc_0060F9B9: call [edx+00000008h]
  loc_0060F9BC: mov eax, var_4
  loc_0060F9BF: mov ecx, var_14
  loc_0060F9C2: pop edi
  loc_0060F9C3: pop esi
  loc_0060F9C4: mov fs:[00000000h], ecx
  loc_0060F9CB: pop ebx
  loc_0060F9CC: mov esp, ebp
  loc_0060F9CE: pop ebp
  loc_0060F9CF: retn 0004h
End Sub

Private Sub cmdDelete_Click() '60EEC0
  loc_0060EEC0: push ebp
  loc_0060EEC1: mov ebp, esp
  loc_0060EEC3: sub esp, 0000000Ch
  loc_0060EEC6: push 00403B36h ; __vbaExceptHandler
  loc_0060EECB: mov eax, fs:[00000000h]
  loc_0060EED1: push eax
  loc_0060EED2: mov fs:[00000000h], esp
  loc_0060EED9: sub esp, 000000D4h
  loc_0060EEDF: push ebx
  loc_0060EEE0: push esi
  loc_0060EEE1: push edi
  loc_0060EEE2: mov var_C, esp
  loc_0060EEE5: mov var_8, 004038E8h
  loc_0060EEEC: mov esi, Me
  loc_0060EEEF: mov eax, esi
  loc_0060EEF1: and eax, 00000001h
  loc_0060EEF4: mov var_4, eax
  loc_0060EEF7: and esi, FFFFFFFEh
  loc_0060EEFA: push esi
  loc_0060EEFB: mov Me, esi
  loc_0060EEFE: mov ecx, [esi]
  loc_0060EF00: call [ecx+00000004h]
  loc_0060EF03: xor edi, edi
  loc_0060EF05: mov edx, 00433760h ; "Receive"
  loc_0060EF0A: mov ecx, 0061A0A0h
  loc_0060EF0F: mov var_18, edi
  loc_0060EF12: mov var_1C, edi
  loc_0060EF15: mov var_20, edi
  loc_0060EF18: mov var_24, edi
  loc_0060EF1B: mov var_28, edi
  loc_0060EF1E: mov var_2C, edi
  loc_0060EF21: mov var_3C, edi
  loc_0060EF24: mov var_4C, edi
  loc_0060EF27: mov var_5C, edi
  loc_0060EF2A: mov var_6C, edi
  loc_0060EF2D: mov var_7C, edi
  loc_0060EF30: mov var_8C, edi
  loc_0060EF36: mov var_9C, edi
  loc_0060EF3C: mov var_AC, edi
  loc_0060EF42: mov var_BC, edi
  loc_0060EF48: call [004011ECh] ; __vbaStrCopy
  loc_0060EF4E: cmp [0061A404h], edi
  loc_0060EF54: jnz 0060EF66h
  loc_0060EF56: push 0061A404h
  loc_0060EF5B: push 0040B064h
  loc_0060EF60: call [004011DCh] ; __vbaNew2
  loc_0060EF66: mov ecx, var_98
  loc_0060EF6C: sub esp, 00000010h
  loc_0060EF6F: mov eax, esp
  loc_0060EF71: mov ebx, 0000000Ah
  loc_0060EF76: mov var_94, 80020004h
  loc_0060EF80: sub esp, 00000010h
  loc_0060EF83: mov [eax], ebx
  loc_0060EF85: mov edi, [0061A404h]
  loc_0060EF8B: mov var_8C, 00000002h
  loc_0060EF95: mov var_84, 00000001h
  loc_0060EF9F: mov [eax+00000004h], ecx
  loc_0060EFA2: mov ecx, var_94
  loc_0060EFA8: mov var_9C, ebx
  loc_0060EFAE: mov edx, [edi]
  loc_0060EFB0: mov [eax+00000008h], ecx
  loc_0060EFB3: mov ecx, var_90
  loc_0060EFB9: mov [eax+0000000Ch], ecx
  loc_0060EFBC: mov ecx, var_8C
  loc_0060EFC2: mov eax, esp
  loc_0060EFC4: push edi
  loc_0060EFC5: mov [eax], ecx
  loc_0060EFC7: mov ecx, var_88
  loc_0060EFCD: mov [eax+00000004h], ecx
  loc_0060EFD0: mov ecx, var_84
  loc_0060EFD6: mov [eax+00000008h], ecx
  loc_0060EFD9: mov ecx, var_80
  loc_0060EFDC: mov [eax+0000000Ch], ecx
  loc_0060EFDF: call [edx+000002B0h]
  loc_0060EFE5: test eax, eax
  loc_0060EFE7: fnclex
  loc_0060EFE9: jge 0060EFFDh
  loc_0060EFEB: push 000002B0h
  loc_0060EFF0: push 0042B80Ch
  loc_0060EFF5: push edi
  loc_0060EFF6: push eax
  loc_0060EFF7: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EFFD: lea edx, var_8C
  loc_0060F003: lea eax, var_3C
  loc_0060F006: push edx
  loc_0060F007: push eax
  loc_0060F008: mov var_84, 0061A058h
  loc_0060F012: mov var_8C, 00004008h
  loc_0060F01C: call [004010D4h] ; rtcTrimVar
  loc_0060F022: lea ecx, var_3C
  loc_0060F025: lea edx, var_9C
  loc_0060F02B: push ecx
  loc_0060F02C: push edx
  loc_0060F02D: mov var_94, 0041E5D4h
  loc_0060F037: mov var_9C, 00008008h
  loc_0060F041: call [00401218h] ; __vbaVarTstNe
  loc_0060F047: lea ecx, var_3C
  loc_0060F04A: mov di, ax
  loc_0060F04D: call [00401020h] ; __vbaFreeVar
  loc_0060F053: test di, di
  loc_0060F056: jz 0060F78Bh
  loc_0060F05C: mov eax, [esi]
  loc_0060F05E: push esi
  loc_0060F05F: call [eax+00000738h]
  loc_0060F065: mov ecx, [esi]
  loc_0060F067: push esi
  loc_0060F068: call [ecx+00000758h]
  loc_0060F06E: mov eax, 80020004h
  loc_0060F073: lea edx, var_8C
  loc_0060F079: lea ecx, var_3C
  loc_0060F07C: mov var_64, eax
  loc_0060F07F: mov var_6C, ebx
  loc_0060F082: mov var_54, eax
  loc_0060F085: mov var_5C, ebx
  loc_0060F088: mov var_44, eax
  loc_0060F08B: mov var_4C, ebx
  loc_0060F08E: mov var_84, 0042B5B0h ; "Are your sure to Delete!"
  loc_0060F098: mov var_8C, 00000008h
  loc_0060F0A2: call [00401240h] ; __vbaVarDup
  loc_0060F0A8: lea edx, var_6C
  loc_0060F0AB: lea eax, var_5C
  loc_0060F0AE: push edx
  loc_0060F0AF: lea ecx, var_4C
  loc_0060F0B2: push eax
  loc_0060F0B3: push ecx
  loc_0060F0B4: lea edx, var_3C
  loc_0060F0B7: push 00000144h
  loc_0060F0BC: push edx
  loc_0060F0BD: call [004010A4h] ; rtcMsgBox
  loc_0060F0C3: xor ecx, ecx
  loc_0060F0C5: cmp eax, 00000006h
  loc_0060F0C8: setz cl
  loc_0060F0CB: mov edi, [00401038h] ; __vbaFreeVarList
  loc_0060F0D1: lea edx, var_6C
  loc_0060F0D4: neg ecx
  loc_0060F0D6: mov var_C0, cx
  loc_0060F0DD: lea eax, var_5C
  loc_0060F0E0: push edx
  loc_0060F0E1: lea ecx, var_4C
  loc_0060F0E4: push eax
  loc_0060F0E5: lea edx, var_3C
  loc_0060F0E8: push ecx
  loc_0060F0E9: push edx
  loc_0060F0EA: push 00000004h
  loc_0060F0EC: call edi
  loc_0060F0EE: add esp, 00000014h
  loc_0060F0F1: cmp var_C0, 0000h
  loc_0060F0F9: jz 0060F722h
  loc_0060F0FF: mov eax, [esi]
  loc_0060F101: push esi
  loc_0060F102: mov var_94, 80020004h
  loc_0060F10C: mov var_9C, ebx
  loc_0060F112: call [eax+00000308h]
  loc_0060F118: lea ecx, var_28
  loc_0060F11B: push eax
  loc_0060F11C: push ecx
  loc_0060F11D: call [004010A0h] ; __vbaObjSet
  loc_0060F123: mov ebx, eax
  loc_0060F125: lea eax, var_18
  loc_0060F128: push eax
  loc_0060F129: push ebx
  loc_0060F12A: mov edx, [ebx]
  loc_0060F12C: call [edx+000000A0h]
  loc_0060F132: test eax, eax
  loc_0060F134: fnclex
  loc_0060F136: jge 0060F14Ah
  loc_0060F138: push 000000A0h
  loc_0060F13D: push 0041E5E8h
  loc_0060F142: push ebx
  loc_0060F143: push eax
  loc_0060F144: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F14A: mov ecx, var_18
  loc_0060F14D: mov ebx, [00401054h] ; __vbaStrCat
  loc_0060F153: push 0042B5E8h ; "Update Balance SET Amount=Amount+"
  loc_0060F158: push ecx
  loc_0060F159: call ebx
  loc_0060F15B: mov edx, eax
  loc_0060F15D: lea ecx, var_1C
  loc_0060F160: call [00401270h] ; __vbaStrMove
  loc_0060F166: push eax
  loc_0060F167: push 0042B630h ; " Where Name='"
  loc_0060F16C: call ebx
  loc_0060F16E: mov edx, [esi]
  loc_0060F170: mov ebx, 00000008h
  loc_0060F175: push esi
  loc_0060F176: mov var_54, eax
  loc_0060F179: mov var_5C, ebx
  loc_0060F17C: call [edx+000002FCh]
  loc_0060F182: push eax
  loc_0060F183: lea eax, var_2C
  loc_0060F186: push eax
  loc_0060F187: call [004010A0h] ; __vbaObjSet
  loc_0060F18D: mov esi, eax
  loc_0060F18F: lea edx, var_20
  loc_0060F192: push edx
  loc_0060F193: push esi
  loc_0060F194: mov ecx, [esi]
  loc_0060F196: call [ecx+000000A8h]
  loc_0060F19C: test eax, eax
  loc_0060F19E: fnclex
  loc_0060F1A0: jge 0060F1B4h
  loc_0060F1A2: push 000000A8h
  loc_0060F1A7: push 0041F844h
  loc_0060F1AC: push esi
  loc_0060F1AD: push eax
  loc_0060F1AE: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F1B4: mov eax, var_20
  loc_0060F1B7: lea ecx, var_4C
  loc_0060F1BA: mov var_34, eax
  loc_0060F1BD: lea eax, var_3C
  loc_0060F1C0: push eax
  loc_0060F1C1: push ecx
  loc_0060F1C2: mov var_20, 00000000h
  loc_0060F1C9: mov var_3C, ebx
  loc_0060F1CC: call [004010D4h] ; rtcTrimVar
  loc_0060F1D2: mov edx, [0061A13Ch]
  loc_0060F1D8: mov ecx, var_9C
  loc_0060F1DE: sub esp, 00000010h
  loc_0060F1E1: mov var_84, 0041E890h ; "'"
  loc_0060F1EB: mov eax, esp
  loc_0060F1ED: mov var_8C, ebx
  loc_0060F1F3: mov ebx, [edx]
  loc_0060F1F5: mov edx, var_98
  loc_0060F1FB: mov [eax], ecx
  loc_0060F1FD: mov ecx, var_94
  loc_0060F203: mov esi, [004011B4h] ; __vbaVarCat
  loc_0060F209: mov [eax+00000004h], edx
  loc_0060F20C: mov edx, var_90
  loc_0060F212: mov [eax+00000008h], ecx
  loc_0060F215: lea ecx, var_4C
  loc_0060F218: mov [eax+0000000Ch], edx
  loc_0060F21B: lea eax, var_5C
  loc_0060F21E: push eax
  loc_0060F21F: lea edx, var_6C
  loc_0060F222: push ecx
  loc_0060F223: push edx
  loc_0060F224: call __vbaVarCat
  loc_0060F226: push eax
  loc_0060F227: lea eax, var_8C
  loc_0060F22D: lea ecx, var_7C
  loc_0060F230: push eax
  loc_0060F231: push ecx
  loc_0060F232: call __vbaVarCat
  loc_0060F234: lea edx, var_24
  loc_0060F237: push eax
  loc_0060F238: push edx
  loc_0060F239: call [004011B0h] ; __vbaStrVarVal
  loc_0060F23F: push eax
  loc_0060F240: mov eax, [0061A13Ch]
  loc_0060F245: push eax
  loc_0060F246: call [ebx+0000005Ch]
  loc_0060F249: test eax, eax
  loc_0060F24B: fnclex
  loc_0060F24D: jge 0060F264h
  loc_0060F24F: mov ecx, [0061A13Ch]
  loc_0060F255: push 0000005Ch
  loc_0060F257: push 0041E928h
  loc_0060F25C: push ecx
  loc_0060F25D: push eax
  loc_0060F25E: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F264: lea edx, var_24
  loc_0060F267: lea eax, var_1C
  loc_0060F26A: push edx
  loc_0060F26B: lea ecx, var_18
  loc_0060F26E: push eax
  loc_0060F26F: push ecx
  loc_0060F270: push 00000003h
  loc_0060F272: call [004011FCh] ; __vbaFreeStrList
  loc_0060F278: lea edx, var_2C
  loc_0060F27B: lea eax, var_28
  loc_0060F27E: push edx
  loc_0060F27F: push eax
  loc_0060F280: push 00000002h
  loc_0060F282: call [00401040h] ; __vbaFreeObjList
  loc_0060F288: lea ecx, var_7C
  loc_0060F28B: lea edx, var_6C
  loc_0060F28E: push ecx
  loc_0060F28F: lea eax, var_4C
  loc_0060F292: push edx
  loc_0060F293: lea ecx, var_5C
  loc_0060F296: push eax
  loc_0060F297: lea edx, var_3C
  loc_0060F29A: push ecx
  loc_0060F29B: push edx
  loc_0060F29C: push 00000005h
  loc_0060F29E: call edi
  loc_0060F2A0: add esp, 00000034h
  loc_0060F2A3: lea eax, var_8C
  loc_0060F2A9: lea ecx, var_3C
  loc_0060F2AC: mov var_A4, 80020004h
  loc_0060F2B6: push eax
  loc_0060F2B7: push ecx
  loc_0060F2B8: mov var_AC, 0000000Ah
  loc_0060F2C2: mov var_94, 0042B650h ; "Delete From Receive Where SrNo="
  loc_0060F2CC: mov var_9C, 00000008h
  loc_0060F2D6: mov var_84, 0061A058h
  loc_0060F2E0: mov var_8C, 00004008h
  loc_0060F2EA: call [004010D4h] ; rtcTrimVar
  loc_0060F2F0: mov edx, [0061A13Ch]
  loc_0060F2F6: mov ecx, var_AC
  loc_0060F2FC: sub esp, 00000010h
  loc_0060F2FF: mov ebx, [edx]
  loc_0060F301: mov edx, var_A8
  loc_0060F307: mov eax, esp
  loc_0060F309: mov [eax], ecx
  loc_0060F30B: mov ecx, var_A4
  loc_0060F311: mov [eax+00000004h], edx
  loc_0060F314: mov edx, var_A0
  loc_0060F31A: mov [eax+00000008h], ecx
  loc_0060F31D: lea ecx, var_3C
  loc_0060F320: mov [eax+0000000Ch], edx
  loc_0060F323: lea eax, var_9C
  loc_0060F329: push eax
  loc_0060F32A: lea edx, var_4C
  loc_0060F32D: push ecx
  loc_0060F32E: push edx
  loc_0060F32F: call __vbaVarCat
  loc_0060F331: push eax
  loc_0060F332: lea eax, var_18
  loc_0060F335: push eax
  loc_0060F336: call [004011B0h] ; __vbaStrVarVal
  loc_0060F33C: mov ecx, [0061A13Ch]
  loc_0060F342: push eax
  loc_0060F343: push ecx
  loc_0060F344: call [ebx+0000005Ch]
  loc_0060F347: test eax, eax
  loc_0060F349: fnclex
  loc_0060F34B: jge 0060F362h
  loc_0060F34D: mov edx, [0061A13Ch]
  loc_0060F353: push 0000005Ch
  loc_0060F355: push 0041E928h
  loc_0060F35A: push edx
  loc_0060F35B: push eax
  loc_0060F35C: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F362: lea ecx, var_18
  loc_0060F365: call [004012ACh] ; __vbaFreeStr
  loc_0060F36B: lea eax, var_4C
  loc_0060F36E: lea ecx, var_3C
  loc_0060F371: push eax
  loc_0060F372: push ecx
  loc_0060F373: push 00000002h
  loc_0060F375: call edi
  loc_0060F377: add esp, 0000000Ch
  loc_0060F37A: lea edx, var_8C
  loc_0060F380: lea eax, var_3C
  loc_0060F383: mov ebx, 80020004h
  loc_0060F388: push edx
  loc_0060F389: push eax
  loc_0060F38A: mov var_94, 0042F140h ; "DELETE FROM BALANCE IN '"
  loc_0060F394: mov var_9C, 00000008h
  loc_0060F39E: mov var_84, 0061A09Ch
  loc_0060F3A8: mov var_8C, 00004008h
  loc_0060F3B2: call [004010D4h] ; rtcTrimVar
  loc_0060F3B8: mov ecx, [0061A13Ch]
  loc_0060F3BE: mov var_A4, 0041E890h ; "'"
  loc_0060F3C8: mov var_AC, 00000008h
  loc_0060F3D2: sub esp, 00000010h
  loc_0060F3D5: mov edx, [ecx]
  loc_0060F3D7: mov ecx, esp
  loc_0060F3D9: mov eax, 0000000Ah
  loc_0060F3DE: mov var_E0, edx
  loc_0060F3E4: mov [ecx], eax
  loc_0060F3E6: mov eax, var_B8
  loc_0060F3EC: mov [ecx+00000004h], eax
  loc_0060F3EF: mov eax, var_B0
  loc_0060F3F5: mov [ecx+00000008h], ebx
  loc_0060F3F8: mov [ecx+0000000Ch], eax
  loc_0060F3FB: lea ecx, var_9C
  loc_0060F401: push ecx
  loc_0060F402: lea eax, var_3C
  loc_0060F405: lea ecx, var_4C
  loc_0060F408: push eax
  loc_0060F409: push ecx
  loc_0060F40A: call __vbaVarCat
  loc_0060F40C: push eax
  loc_0060F40D: lea edx, var_AC
  loc_0060F413: lea eax, var_5C
  loc_0060F416: push edx
  loc_0060F417: push eax
  loc_0060F418: call __vbaVarCat
  loc_0060F41A: lea ecx, var_18
  loc_0060F41D: push eax
  loc_0060F41E: push ecx
  loc_0060F41F: call [004011B0h] ; __vbaStrVarVal
  loc_0060F425: mov edx, [0061A13Ch]
  loc_0060F42B: push eax
  loc_0060F42C: mov eax, var_E0
  loc_0060F432: push edx
  loc_0060F433: call [eax+0000005Ch]
  loc_0060F436: test eax, eax
  loc_0060F438: fnclex
  loc_0060F43A: jge 0060F451h
  loc_0060F43C: mov ecx, [0061A13Ch]
  loc_0060F442: push 0000005Ch
  loc_0060F444: push 0041E928h
  loc_0060F449: push ecx
  loc_0060F44A: push eax
  loc_0060F44B: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F451: lea ecx, var_18
  loc_0060F454: call [004012ACh] ; __vbaFreeStr
  loc_0060F45A: lea edx, var_5C
  loc_0060F45D: lea eax, var_4C
  loc_0060F460: push edx
  loc_0060F461: lea ecx, var_3C
  loc_0060F464: push eax
  loc_0060F465: push ecx
  loc_0060F466: push 00000003h
  loc_0060F468: call edi
  loc_0060F46A: add esp, 00000010h
  loc_0060F46D: lea edx, var_8C
  loc_0060F473: lea eax, var_3C
  loc_0060F476: mov ebx, 80020004h
  loc_0060F47B: push edx
  loc_0060F47C: push eax
  loc_0060F47D: mov var_94, 0042EF00h ; "INSERT INTO Balance IN '"
  loc_0060F487: mov var_9C, 00000008h
  loc_0060F491: mov var_84, 0061A09Ch
  loc_0060F49B: mov var_8C, 00004008h
  loc_0060F4A5: call [004010D4h] ; rtcTrimVar
  loc_0060F4AB: mov ecx, [0061A13Ch]
  loc_0060F4B1: mov var_A4, 0042EF38h ; "' SELECT * FROM Balance"
  loc_0060F4BB: mov var_AC, 00000008h
  loc_0060F4C5: sub esp, 00000010h
  loc_0060F4C8: mov edx, [ecx]
  loc_0060F4CA: mov ecx, esp
  loc_0060F4CC: mov eax, 0000000Ah
  loc_0060F4D1: mov var_E4, edx
  loc_0060F4D7: mov [ecx], eax
  loc_0060F4D9: mov eax, var_B8
  loc_0060F4DF: mov [ecx+00000004h], eax
  loc_0060F4E2: mov eax, var_B0
  loc_0060F4E8: mov [ecx+00000008h], ebx
  loc_0060F4EB: mov [ecx+0000000Ch], eax
  loc_0060F4EE: lea ecx, var_9C
  loc_0060F4F4: push ecx
  loc_0060F4F5: lea eax, var_3C
  loc_0060F4F8: lea ecx, var_4C
  loc_0060F4FB: push eax
  loc_0060F4FC: push ecx
  loc_0060F4FD: call __vbaVarCat
  loc_0060F4FF: push eax
  loc_0060F500: lea edx, var_AC
  loc_0060F506: lea eax, var_5C
  loc_0060F509: push edx
  loc_0060F50A: push eax
  loc_0060F50B: call __vbaVarCat
  loc_0060F50D: lea ecx, var_18
  loc_0060F510: push eax
  loc_0060F511: push ecx
  loc_0060F512: call [004011B0h] ; __vbaStrVarVal
  loc_0060F518: mov edx, [0061A13Ch]
  loc_0060F51E: push eax
  loc_0060F51F: mov eax, var_E4
  loc_0060F525: push edx
  loc_0060F526: call [eax+0000005Ch]
  loc_0060F529: test eax, eax
  loc_0060F52B: fnclex
  loc_0060F52D: jge 0060F544h
  loc_0060F52F: mov ecx, [0061A13Ch]
  loc_0060F535: push 0000005Ch
  loc_0060F537: push 0041E928h
  loc_0060F53C: push ecx
  loc_0060F53D: push eax
  loc_0060F53E: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F544: lea ecx, var_18
  loc_0060F547: call [004012ACh] ; __vbaFreeStr
  loc_0060F54D: lea edx, var_5C
  loc_0060F550: lea eax, var_4C
  loc_0060F553: push edx
  loc_0060F554: lea ecx, var_3C
  loc_0060F557: push eax
  loc_0060F558: push ecx
  loc_0060F559: push 00000003h
  loc_0060F55B: call edi
  loc_0060F55D: mov edx, [0061A13Ch]
  loc_0060F563: mov ebx, esp
  loc_0060F565: mov ecx, 0000000Ah
  loc_0060F56A: mov eax, 80020004h
  loc_0060F56F: mov var_8C, ecx
  loc_0060F575: mov [ebx], ecx
  loc_0060F577: mov ecx, var_88
  loc_0060F57D: mov var_84, eax
  loc_0060F583: mov edx, [edx]
  loc_0060F585: mov [ebx+00000004h], ecx
  loc_0060F588: mov ecx, [0061A13Ch]
  loc_0060F58E: push 00433018h ; "Delete From Balance"
  loc_0060F593: mov [ebx+00000008h], eax
  loc_0060F596: mov eax, var_80
  loc_0060F599: push ecx
  loc_0060F59A: mov [ebx+0000000Ch], eax
  loc_0060F59D: call [edx+0000005Ch]
  loc_0060F5A0: test eax, eax
  loc_0060F5A2: fnclex
  loc_0060F5A4: jge 0060F5BBh
  loc_0060F5A6: mov edx, [0061A13Ch]
  loc_0060F5AC: push 0000005Ch
  loc_0060F5AE: push 0041E928h
  loc_0060F5B3: push edx
  loc_0060F5B4: push eax
  loc_0060F5B5: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F5BB: lea eax, var_8C
  loc_0060F5C1: lea ecx, var_3C
  loc_0060F5C4: push eax
  loc_0060F5C5: push ecx
  loc_0060F5C6: mov ebx, 80020004h
  loc_0060F5CB: mov var_BC, 0000000Ah
  loc_0060F5D5: mov var_94, 0042B3ECh ; "INSERT INTO Balance SELECT * FROM Balance IN '"
  loc_0060F5DF: mov var_9C, 00000008h
  loc_0060F5E9: mov var_84, 0061A09Ch
  loc_0060F5F3: mov var_8C, 00004008h
  loc_0060F5FD: call [004010D4h] ; rtcTrimVar
  loc_0060F603: mov ecx, var_BC
  loc_0060F609: sub esp, 00000010h
  loc_0060F60C: mov eax, esp
  loc_0060F60E: mov edx, [0061A13Ch]
  loc_0060F614: mov var_A4, 0041E890h ; "'"
  loc_0060F61E: mov var_AC, 00000008h
  loc_0060F628: mov [eax], ecx
  loc_0060F62A: mov ecx, var_B8
  loc_0060F630: mov edx, [edx]
  loc_0060F632: mov [eax+00000004h], ecx
  loc_0060F635: mov ecx, var_B0
  loc_0060F63B: mov var_E8, edx
  loc_0060F641: mov [eax+00000008h], ebx
  loc_0060F644: mov [eax+0000000Ch], ecx
  loc_0060F647: lea eax, var_9C
  loc_0060F64D: push eax
  loc_0060F64E: lea ecx, var_3C
  loc_0060F651: lea eax, var_4C
  loc_0060F654: push ecx
  loc_0060F655: push eax
  loc_0060F656: call __vbaVarCat
  loc_0060F658: lea ecx, var_AC
  loc_0060F65E: push eax
  loc_0060F65F: lea edx, var_5C
  loc_0060F662: push ecx
  loc_0060F663: push edx
  loc_0060F664: call __vbaVarCat
  loc_0060F666: push eax
  loc_0060F667: lea eax, var_18
  loc_0060F66A: push eax
  loc_0060F66B: call [004011B0h] ; __vbaStrVarVal
  loc_0060F671: mov ecx, [0061A13Ch]
  loc_0060F677: mov edx, var_E8
  loc_0060F67D: push eax
  loc_0060F67E: push ecx
  loc_0060F67F: call [edx+0000005Ch]
  loc_0060F682: test eax, eax
  loc_0060F684: fnclex
  loc_0060F686: jge 0060F69Dh
  loc_0060F688: mov ecx, [0061A13Ch]
  loc_0060F68E: push 0000005Ch
  loc_0060F690: push 0041E928h
  loc_0060F695: push ecx
  loc_0060F696: push eax
  loc_0060F697: call [00401074h] ; __vbaHresultCheckObj
  loc_0060F69D: lea ecx, var_18
  loc_0060F6A0: call [004012ACh] ; __vbaFreeStr
  loc_0060F6A6: lea edx, var_5C
  loc_0060F6A9: lea eax, var_4C
  loc_0060F6AC: push edx
  loc_0060F6AD: lea ecx, var_3C
  loc_0060F6B0: push eax
  loc_0060F6B1: push ecx
  loc_0060F6B2: push 00000003h
  loc_0060F6B4: call edi
  loc_0060F6B6: mov ecx, 80020004h
  loc_0060F6BB: mov eax, 0000000Ah
  loc_0060F6C0: mov var_64, ecx
  loc_0060F6C3: mov var_54, ecx
  loc_0060F6C6: mov var_44, ecx
  loc_0060F6C9: add esp, 00000010h
  loc_0060F6CC: lea edx, var_8C
  loc_0060F6D2: lea ecx, var_3C
  loc_0060F6D5: mov var_6C, eax
  loc_0060F6D8: mov var_5C, eax
  loc_0060F6DB: mov var_4C, eax
  loc_0060F6DE: mov var_84, 004249F4h ; "Delete Successfully."
  loc_0060F6E8: mov var_8C, 00000008h
  loc_0060F6F2: call [00401240h] ; __vbaVarDup
  loc_0060F6F8: lea edx, var_6C
  loc_0060F6FB: lea eax, var_5C
  loc_0060F6FE: push edx
  loc_0060F6FF: lea ecx, var_4C
  loc_0060F702: push eax
  loc_0060F703: push ecx
  loc_0060F704: lea edx, var_3C
  loc_0060F707: push 00000040h
  loc_0060F709: push edx
  loc_0060F70A: call [004010A4h] ; rtcMsgBox
  loc_0060F710: lea eax, var_6C
  loc_0060F713: lea ecx, var_5C
  loc_0060F716: push eax
  loc_0060F717: lea edx, var_4C
  loc_0060F71A: push ecx
  loc_0060F71B: lea eax, var_3C
  loc_0060F71E: push edx
  loc_0060F71F: push eax
  loc_0060F720: jmp 0060F784h
  loc_0060F722: mov eax, 80020004h
  loc_0060F727: lea edx, var_8C
  loc_0060F72D: lea ecx, var_3C
  loc_0060F730: mov var_64, eax
  loc_0060F733: mov var_6C, ebx
  loc_0060F736: mov var_54, eax
  loc_0060F739: mov var_5C, ebx
  loc_0060F73C: mov var_44, eax
  loc_0060F73F: mov var_4C, ebx
  loc_0060F742: mov var_84, 00429030h ; "Cann't Delete Successfully."
  loc_0060F74C: mov var_8C, 00000008h
  loc_0060F756: call [00401240h] ; __vbaVarDup
  loc_0060F75C: lea ecx, var_6C
  loc_0060F75F: lea edx, var_5C
  loc_0060F762: push ecx
  loc_0060F763: lea eax, var_4C
  loc_0060F766: push edx
  loc_0060F767: push eax
  loc_0060F768: lea ecx, var_3C
  loc_0060F76B: push 00000040h
  loc_0060F76D: push ecx
  loc_0060F76E: call [004010A4h] ; rtcMsgBox
  loc_0060F774: lea edx, var_6C
  loc_0060F777: lea eax, var_5C
  loc_0060F77A: push edx
  loc_0060F77B: lea ecx, var_4C
  loc_0060F77E: push eax
  loc_0060F77F: lea edx, var_3C
  loc_0060F782: push ecx
  loc_0060F783: push edx
  loc_0060F784: push 00000004h
  loc_0060F786: call edi
  loc_0060F788: add esp, 00000014h
  loc_0060F78B: mov var_4, 00000000h
  loc_0060F792: push 0060F7E2h
  loc_0060F797: jmp 0060F7E1h
  loc_0060F799: lea eax, var_24
  loc_0060F79C: lea ecx, var_20
  loc_0060F79F: push eax
  loc_0060F7A0: lea edx, var_1C
  loc_0060F7A3: push ecx
  loc_0060F7A4: lea eax, var_18
  loc_0060F7A7: push edx
  loc_0060F7A8: push eax
  loc_0060F7A9: push 00000004h
  loc_0060F7AB: call [004011FCh] ; __vbaFreeStrList
  loc_0060F7B1: lea ecx, var_2C
  loc_0060F7B4: lea edx, var_28
  loc_0060F7B7: push ecx
  loc_0060F7B8: push edx
  loc_0060F7B9: push 00000002h
  loc_0060F7BB: call [00401040h] ; __vbaFreeObjList
  loc_0060F7C1: lea eax, var_7C
  loc_0060F7C4: lea ecx, var_6C
  loc_0060F7C7: push eax
  loc_0060F7C8: lea edx, var_5C
  loc_0060F7CB: push ecx
  loc_0060F7CC: lea eax, var_4C
  loc_0060F7CF: push edx
  loc_0060F7D0: lea ecx, var_3C
  loc_0060F7D3: push eax
  loc_0060F7D4: push ecx
  loc_0060F7D5: push 00000005h
  loc_0060F7D7: call [00401038h] ; __vbaFreeVarList
  loc_0060F7DD: add esp, 00000038h
  loc_0060F7E0: ret
  loc_0060F7E1: ret
  loc_0060F7E2: mov eax, Me
  loc_0060F7E5: push eax
  loc_0060F7E6: mov edx, [eax]
  loc_0060F7E8: call [edx+00000008h]
  loc_0060F7EB: mov eax, var_4
  loc_0060F7EE: mov ecx, var_14
  loc_0060F7F1: pop edi
  loc_0060F7F2: pop esi
  loc_0060F7F3: mov fs:[00000000h], ecx
  loc_0060F7FA: pop ebx
  loc_0060F7FB: mov esp, ebp
  loc_0060F7FD: pop ebp
  loc_0060F7FE: retn 0004h
End Sub

Private Sub cmdExit_Click() '60F9E0
  loc_0060F9E0: push ebp
  loc_0060F9E1: mov ebp, esp
  loc_0060F9E3: sub esp, 0000000Ch
  loc_0060F9E6: push 00403B36h ; __vbaExceptHandler
  loc_0060F9EB: mov eax, fs:[00000000h]
  loc_0060F9F1: push eax
  loc_0060F9F2: mov fs:[00000000h], esp
  loc_0060F9F9: sub esp, 00000018h
  loc_0060F9FC: push ebx
  loc_0060F9FD: push esi
  loc_0060F9FE: push edi
  loc_0060F9FF: mov var_C, esp
  loc_0060FA02: mov var_8, 00403908h
  loc_0060FA09: mov edi, Me
  loc_0060FA0C: mov eax, edi
  loc_0060FA0E: and eax, 00000001h
  loc_0060FA11: mov var_4, eax
  loc_0060FA14: and edi, FFFFFFFEh
  loc_0060FA17: push edi
  loc_0060FA18: mov Me, edi
  loc_0060FA1B: mov ecx, [edi]
  loc_0060FA1D: call [ecx+00000004h]
  loc_0060FA20: mov eax, [0061B394h]
  loc_0060FA25: xor ebx, ebx
  loc_0060FA27: cmp eax, ebx
  loc_0060FA29: mov var_18, ebx
  loc_0060FA2C: jnz 0060FA3Eh
  loc_0060FA2E: push 0061B394h
  loc_0060FA33: push 0041E4A0h
  loc_0060FA38: call [004011DCh] ; __vbaNew2
  loc_0060FA3E: mov esi, [0061B394h]
  loc_0060FA44: lea eax, var_18
  loc_0060FA47: push edi
  loc_0060FA48: push eax
  loc_0060FA49: mov edx, [esi]
  loc_0060FA4B: mov var_2C, edx
  loc_0060FA4E: call [004010B8h] ; __vbaObjSetAddref
  loc_0060FA54: mov ecx, var_2C
  loc_0060FA57: push eax
  loc_0060FA58: push esi
  loc_0060FA59: call [ecx+00000010h]
  loc_0060FA5C: cmp eax, ebx
  loc_0060FA5E: fnclex
  loc_0060FA60: jge 0060FA71h
  loc_0060FA62: push 00000010h
  loc_0060FA64: push 0041E490h
  loc_0060FA69: push esi
  loc_0060FA6A: push eax
  loc_0060FA6B: call [00401074h] ; __vbaHresultCheckObj
  loc_0060FA71: lea ecx, var_18
  loc_0060FA74: call [004012B0h] ; __vbaFreeObj
  loc_0060FA7A: mov var_4, ebx
  loc_0060FA7D: push 0060FA8Fh
  loc_0060FA82: jmp 0060FA8Eh
  loc_0060FA84: lea ecx, var_18
  loc_0060FA87: call [004012B0h] ; __vbaFreeObj
  loc_0060FA8D: ret
  loc_0060FA8E: ret
  loc_0060FA8F: mov eax, Me
  loc_0060FA92: push eax
  loc_0060FA93: mov edx, [eax]
  loc_0060FA95: call [edx+00000008h]
  loc_0060FA98: mov eax, var_4
  loc_0060FA9B: mov ecx, var_14
  loc_0060FA9E: pop edi
  loc_0060FA9F: pop esi
  loc_0060FAA0: mov fs:[00000000h], ecx
  loc_0060FAA7: pop ebx
  loc_0060FAA8: mov esp, ebp
  loc_0060FAAA: pop ebp
  loc_0060FAAB: retn 0004h
End Sub

Private Sub txtName_KeyPress(KeyAscii As Integer) '6120B0
  loc_006120B0: push ebp
  loc_006120B1: mov ebp, esp
  loc_006120B3: sub esp, 0000000Ch
  loc_006120B6: push 00403B36h ; __vbaExceptHandler
  loc_006120BB: mov eax, fs:[00000000h]
  loc_006120C1: push eax
  loc_006120C2: mov fs:[00000000h], esp
  loc_006120C9: sub esp, 00000014h
  loc_006120CC: push ebx
  loc_006120CD: push esi
  loc_006120CE: push edi
  loc_006120CF: mov var_C, esp
  loc_006120D2: mov var_8, 004039E0h
  loc_006120D9: mov esi, Me
  loc_006120DC: mov eax, esi
  loc_006120DE: and eax, 00000001h
  loc_006120E1: mov var_4, eax
  loc_006120E4: and esi, FFFFFFFEh
  loc_006120E7: push esi
  loc_006120E8: mov Me, esi
  loc_006120EB: mov ecx, [esi]
  loc_006120ED: call [ecx+00000004h]
  loc_006120F0: mov edx, KeyAscii
  loc_006120F3: xor edi, edi
  loc_006120F5: mov var_18, edi
  loc_006120F8: cmp [edx], 000Dh
  loc_006120FC: jnz 0061213Eh
  loc_006120FE: mov eax, [esi]
  loc_00612100: push esi
  loc_00612101: call [eax+00000308h]
  loc_00612107: lea ecx, var_18
  loc_0061210A: push eax
  loc_0061210B: push ecx
  loc_0061210C: call [004010A0h] ; __vbaObjSet
  loc_00612112: mov esi, eax
  loc_00612114: push esi
  loc_00612115: mov edx, [esi]
  loc_00612117: call [edx+00000204h]
  loc_0061211D: cmp eax, edi
  loc_0061211F: fnclex
  loc_00612121: jge 00612135h
  loc_00612123: push 00000204h
  loc_00612128: push 0041E5E8h
  loc_0061212D: push esi
  loc_0061212E: push eax
  loc_0061212F: call [00401074h] ; __vbaHresultCheckObj
  loc_00612135: lea ecx, var_18
  loc_00612138: call [004012B0h] ; __vbaFreeObj
  loc_0061213E: mov var_4, edi
  loc_00612141: push 00612153h
  loc_00612146: jmp 00612152h
  loc_00612148: lea ecx, var_18
  loc_0061214B: call [004012B0h] ; __vbaFreeObj
  loc_00612151: ret
  loc_00612152: ret
  loc_00612153: mov eax, Me
  loc_00612156: push eax
  loc_00612157: mov ecx, [eax]
  loc_00612159: call [ecx+00000008h]
  loc_0061215C: mov eax, var_4
  loc_0061215F: mov ecx, var_14
  loc_00612162: pop edi
  loc_00612163: pop esi
  loc_00612164: mov fs:[00000000h], ecx
  loc_0061216B: pop ebx
  loc_0061216C: mov esp, ebp
  loc_0061216E: pop ebp
  loc_0061216F: retn 0008h
End Sub

Private Sub txtName_LostFocus() '612180
  loc_00612180: push ebp
  loc_00612181: mov ebp, esp
  loc_00612183: sub esp, 0000000Ch
  loc_00612186: push 00403B36h ; __vbaExceptHandler
  loc_0061218B: mov eax, fs:[00000000h]
  loc_00612191: push eax
  loc_00612192: mov fs:[00000000h], esp
  loc_00612199: sub esp, 000000C0h
  loc_0061219F: push ebx
  loc_006121A0: push esi
  loc_006121A1: push edi
  loc_006121A2: mov var_C, esp
  loc_006121A5: mov var_8, 004039F0h
  loc_006121AC: mov esi, Me
  loc_006121AF: mov eax, esi
  loc_006121B1: and eax, 00000001h
  loc_006121B4: mov var_4, eax
  loc_006121B7: and esi, FFFFFFFEh
  loc_006121BA: push esi
  loc_006121BB: mov Me, esi
  loc_006121BE: mov ecx, [esi]
  loc_006121C0: call [ecx+00000004h]
  loc_006121C3: mov edx, [esi]
  loc_006121C5: xor ebx, ebx
  loc_006121C7: push esi
  loc_006121C8: mov var_18, ebx
  loc_006121CB: mov var_1C, ebx
  loc_006121CE: mov var_20, ebx
  loc_006121D1: mov var_24, ebx
  loc_006121D4: mov var_34, ebx
  loc_006121D7: mov var_44, ebx
  loc_006121DA: mov var_54, ebx
  loc_006121DD: mov var_64, ebx
  loc_006121E0: mov var_74, ebx
  loc_006121E3: mov var_84, ebx
  loc_006121E9: mov var_94, ebx
  loc_006121EF: mov var_A4, ebx
  loc_006121F5: mov var_B4, ebx
  loc_006121FB: mov var_B8, ebx
  loc_00612201: mov var_BC, ebx
  loc_00612207: call [edx+000002FCh]
  loc_0061220D: push eax
  loc_0061220E: lea eax, var_20
  loc_00612211: push eax
  loc_00612212: call [004010A0h] ; __vbaObjSet
  loc_00612218: mov edi, eax
  loc_0061221A: lea edx, var_18
  loc_0061221D: push edx
  loc_0061221E: push edi
  loc_0061221F: mov ecx, [edi]
  loc_00612221: call [ecx+000000A8h]
  loc_00612227: cmp eax, ebx
  loc_00612229: fnclex
  loc_0061222B: jge 0061223Fh
  loc_0061222D: push 000000A8h
  loc_00612232: push 0041F844h
  loc_00612237: push edi
  loc_00612238: push eax
  loc_00612239: call [00401074h] ; __vbaHresultCheckObj
  loc_0061223F: mov eax, var_18
  loc_00612242: push eax
  loc_00612243: push 0041E5D4h
  loc_00612248: call [0040110Ch] ; __vbaStrCmp
  loc_0061224E: mov edi, eax
  loc_00612250: lea ecx, var_18
  loc_00612253: neg edi
  loc_00612255: sbb edi, edi
  loc_00612257: inc edi
  loc_00612258: neg edi
  loc_0061225A: call [004012ACh] ; __vbaFreeStr
  loc_00612260: lea ecx, var_20
  loc_00612263: call [004012B0h] ; __vbaFreeObj
  loc_00612269: cmp di, bx
  loc_0061226C: jnz 006125B3h
  loc_00612272: mov ecx, [esi]
  loc_00612274: push esi
  loc_00612275: call [ecx+000002FCh]
  loc_0061227B: lea edx, var_20
  loc_0061227E: push eax
  loc_0061227F: push edx
  loc_00612280: call [004010A0h] ; __vbaObjSet
  loc_00612286: mov edi, eax
  loc_00612288: lea ecx, var_18
  loc_0061228B: push ecx
  loc_0061228C: push edi
  loc_0061228D: mov eax, [edi]
  loc_0061228F: call [eax+000000A8h]
  loc_00612295: cmp eax, ebx
  loc_00612297: fnclex
  loc_00612299: jge 006122ADh
  loc_0061229B: push 000000A8h
  loc_006122A0: push 0041F844h
  loc_006122A5: push edi
  loc_006122A6: push eax
  loc_006122A7: call [00401074h] ; __vbaHresultCheckObj
  loc_006122AD: mov eax, var_18
  loc_006122B0: lea edx, var_34
  loc_006122B3: mov var_2C, eax
  loc_006122B6: lea eax, var_44
  loc_006122B9: mov edi, 00000008h
  loc_006122BE: push edx
  loc_006122BF: push eax
  loc_006122C0: mov var_18, ebx
  loc_006122C3: mov var_34, edi
  loc_006122C6: call [004010D4h] ; rtcTrimVar
  loc_006122CC: mov edx, [0061A13Ch]
  loc_006122D2: mov var_6C, 0041F300h ; "Select * From AgentThai Where AgentName='"
  loc_006122D9: mov var_74, edi
  loc_006122DC: mov var_7C, 0041E890h ; "'"
  loc_006122E3: mov var_84, edi
  loc_006122E9: mov edi, [edx]
  loc_006122EB: lea edx, var_24
  loc_006122EE: mov ecx, 0000000Ah
  loc_006122F3: push edx
  loc_006122F4: mov var_A4, ecx
  loc_006122FA: sub esp, 00000010h
  loc_006122FD: mov eax, 80020004h
  loc_00612302: mov edx, esp
  loc_00612304: mov var_9C, eax
  loc_0061230A: sub esp, 00000010h
  loc_0061230D: mov [edx], ecx
  loc_0061230F: mov ecx, var_B0
  loc_00612315: mov [edx+00000004h], ecx
  loc_00612318: mov ecx, esp
  loc_0061231A: sub esp, 00000010h
  loc_0061231D: mov [edx+00000008h], eax
  loc_00612320: mov eax, var_A8
  loc_00612326: mov [edx+0000000Ch], eax
  loc_00612329: mov edx, var_A4
  loc_0061232F: mov eax, var_A0
  loc_00612335: mov [ecx], edx
  loc_00612337: mov edx, var_9C
  loc_0061233D: mov [ecx+00000004h], eax
  loc_00612340: mov eax, var_98
  loc_00612346: mov [ecx+00000008h], edx
  loc_00612349: mov edx, var_90
  loc_0061234F: mov [ecx+0000000Ch], eax
  loc_00612352: mov ecx, esp
  loc_00612354: mov eax, 00000003h
  loc_00612359: mov [ecx], eax
  loc_0061235B: mov eax, 00000004h
  loc_00612360: mov [ecx+00000004h], edx
  loc_00612363: lea edx, var_44
  loc_00612366: mov [ecx+00000008h], eax
  loc_00612369: mov eax, var_88
  loc_0061236F: mov [ecx+0000000Ch], eax
  loc_00612372: lea ecx, var_74
  loc_00612375: push ecx
  loc_00612376: lea eax, var_54
  loc_00612379: push edx
  loc_0061237A: push eax
  loc_0061237B: call [004011B4h] ; __vbaVarCat
  loc_00612381: lea ecx, var_84
  loc_00612387: push eax
  loc_00612388: lea edx, var_64
  loc_0061238B: push ecx
  loc_0061238C: push edx
  loc_0061238D: call [004011B4h] ; __vbaVarCat
  loc_00612393: push eax
  loc_00612394: lea eax, var_1C
  loc_00612397: push eax
  loc_00612398: call [004011B0h] ; __vbaStrVarVal
  loc_0061239E: mov ecx, [0061A13Ch]
  loc_006123A4: push eax
  loc_006123A5: push ecx
  loc_006123A6: call [edi+000000BCh]
  loc_006123AC: cmp eax, ebx
  loc_006123AE: fnclex
  loc_006123B0: jge 006123CAh
  loc_006123B2: mov edx, [0061A13Ch]
  loc_006123B8: push 000000BCh
  loc_006123BD: push 0041E928h
  loc_006123C2: push edx
  loc_006123C3: push eax
  loc_006123C4: call [00401074h] ; __vbaHresultCheckObj
  loc_006123CA: mov eax, var_24
  loc_006123CD: lea edi, [esi+00000034h]
  loc_006123D0: push eax
  loc_006123D1: push edi
  loc_006123D2: call [004010B8h] ; __vbaObjSetAddref
  loc_006123D8: lea ecx, var_1C
  loc_006123DB: call [004012ACh] ; __vbaFreeStr
  loc_006123E1: lea ecx, var_24
  loc_006123E4: lea edx, var_20
  loc_006123E7: push ecx
  loc_006123E8: push edx
  loc_006123E9: push 00000002h
  loc_006123EB: call [00401040h] ; __vbaFreeObjList
  loc_006123F1: lea eax, var_64
  loc_006123F4: lea ecx, var_54
  loc_006123F7: push eax
  loc_006123F8: lea edx, var_44
  loc_006123FB: push ecx
  loc_006123FC: lea eax, var_34
  loc_006123FF: push edx
  loc_00612400: push eax
  loc_00612401: push 00000004h
  loc_00612403: call [00401038h] ; __vbaFreeVarList
  loc_00612409: mov eax, [edi]
  loc_0061240B: add esp, 00000020h
  loc_0061240E: lea edx, var_B8
  loc_00612414: mov ecx, [eax]
  loc_00612416: push edx
  loc_00612417: push eax
  loc_00612418: call [ecx+00000020h]
  loc_0061241B: cmp eax, ebx
  loc_0061241D: fnclex
  loc_0061241F: jge 00612432h
  loc_00612421: mov ecx, [edi]
  loc_00612423: push 00000020h
  loc_00612425: push 0041E938h
  loc_0061242A: push ecx
  loc_0061242B: push eax
  loc_0061242C: call [00401074h] ; __vbaHresultCheckObj
  loc_00612432: mov eax, [edi]
  loc_00612434: lea ecx, var_BC
  loc_0061243A: push ecx
  loc_0061243B: push eax
  loc_0061243C: mov edx, [eax]
  loc_0061243E: call [edx+00000034h]
  loc_00612441: cmp eax, ebx
  loc_00612443: fnclex
  loc_00612445: jge 00612458h
  loc_00612447: mov edx, [edi]
  loc_00612449: push 00000034h
  loc_0061244B: push 0041E938h
  loc_00612450: push edx
  loc_00612451: push eax
  loc_00612452: call [00401074h] ; __vbaHresultCheckObj
  loc_00612458: xor eax, eax
  loc_0061245A: cmp var_BC, bx
  loc_00612461: setz al
  loc_00612464: xor ecx, ecx
  loc_00612466: cmp var_B8, bx
  loc_0061246D: setz cl
  loc_00612470: or eax, ecx
  loc_00612472: jnz 00612566h
  loc_00612478: mov ecx, 0000000Ah
  loc_0061247D: mov eax, 80020004h
  loc_00612482: mov var_64, ecx
  loc_00612485: mov var_54, ecx
  loc_00612488: mov var_44, ecx
  loc_0061248B: lea edx, var_74
  loc_0061248E: lea ecx, var_34
  loc_00612491: mov var_5C, eax
  loc_00612494: mov var_4C, eax
  loc_00612497: mov var_3C, eax
  loc_0061249A: mov var_6C, 0042B2B4h ; "Name Not found!"
  loc_006124A1: mov var_74, 00000008h
  loc_006124A8: call [00401240h] ; __vbaVarDup
  loc_006124AE: lea edx, var_64
  loc_006124B1: lea eax, var_54
  loc_006124B4: push edx
  loc_006124B5: lea ecx, var_44
  loc_006124B8: push eax
  loc_006124B9: push ecx
  loc_006124BA: lea edx, var_34
  loc_006124BD: push 00000030h
  loc_006124BF: push edx
  loc_006124C0: call [004010A4h] ; rtcMsgBox
  loc_006124C6: lea eax, var_64
  loc_006124C9: lea ecx, var_54
  loc_006124CC: push eax
  loc_006124CD: lea edx, var_44
  loc_006124D0: push ecx
  loc_006124D1: lea eax, var_34
  loc_006124D4: push edx
  loc_006124D5: push eax
  loc_006124D6: push 00000004h
  loc_006124D8: call [00401038h] ; __vbaFreeVarList
  loc_006124DE: mov ecx, [esi]
  loc_006124E0: add esp, 00000014h
  loc_006124E3: push esi
  loc_006124E4: call [ecx+000002FCh]
  loc_006124EA: lea edx, var_20
  loc_006124ED: push eax
  loc_006124EE: push edx
  loc_006124EF: call [004010A0h] ; __vbaObjSet
  loc_006124F5: mov ebx, eax
  loc_006124F7: push 0041E5D4h
  loc_006124FC: push ebx
  loc_006124FD: mov eax, [ebx]
  loc_006124FF: call [eax+000000ACh]
  loc_00612505: test eax, eax
  loc_00612507: fnclex
  loc_00612509: jge 0061251Dh
  loc_0061250B: push 000000ACh
  loc_00612510: push 0041F844h
  loc_00612515: push ebx
  loc_00612516: push eax
  loc_00612517: call [00401074h] ; __vbaHresultCheckObj
  loc_0061251D: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_00612523: lea ecx, var_20
  loc_00612526: call ebx
  loc_00612528: mov ecx, [esi]
  loc_0061252A: push esi
  loc_0061252B: call [ecx+000002FCh]
  loc_00612531: lea edx, var_20
  loc_00612534: push eax
  loc_00612535: push edx
  loc_00612536: call [004010A0h] ; __vbaObjSet
  loc_0061253C: mov esi, eax
  loc_0061253E: push esi
  loc_0061253F: mov eax, [esi]
  loc_00612541: call [eax+000001F4h]
  loc_00612547: test eax, eax
  loc_00612549: fnclex
  loc_0061254B: jge 0061255Fh
  loc_0061254D: push 000001F4h
  loc_00612552: push 0041F844h
  loc_00612557: push esi
  loc_00612558: push eax
  loc_00612559: call [00401074h] ; __vbaHresultCheckObj
  loc_0061255F: lea ecx, var_20
  loc_00612562: call ebx
  loc_00612564: xor ebx, ebx
  loc_00612566: mov eax, [edi]
  loc_00612568: push eax
  loc_00612569: mov ecx, [eax]
  loc_0061256B: call [ecx+000000C4h]
  loc_00612571: cmp eax, ebx
  loc_00612573: fnclex
  loc_00612575: jge 0061258Bh
  loc_00612577: mov edx, [edi]
  loc_00612579: push 000000C4h
  loc_0061257E: push 0041E938h
  loc_00612583: push edx
  loc_00612584: push eax
  loc_00612585: call [00401074h] ; __vbaHresultCheckObj
  loc_0061258B: push 0041E938h
  loc_00612590: push ebx
  loc_00612591: call [00401274h] ; __vbaCastObj
  loc_00612597: push eax
  loc_00612598: lea eax, var_20
  loc_0061259B: push eax
  loc_0061259C: call [004010A0h] ; __vbaObjSet
  loc_006125A2: push eax
  loc_006125A3: push edi
  loc_006125A4: call [004010B8h] ; __vbaObjSetAddref
  loc_006125AA: lea ecx, var_20
  loc_006125AD: call [004012B0h] ; __vbaFreeObj
  loc_006125B3: mov var_4, ebx
  loc_006125B6: push 006125FAh
  loc_006125BB: jmp 006125F9h
  loc_006125BD: lea ecx, var_1C
  loc_006125C0: lea edx, var_18
  loc_006125C3: push ecx
  loc_006125C4: push edx
  loc_006125C5: push 00000002h
  loc_006125C7: call [004011FCh] ; __vbaFreeStrList
  loc_006125CD: lea eax, var_24
  loc_006125D0: lea ecx, var_20
  loc_006125D3: push eax
  loc_006125D4: push ecx
  loc_006125D5: push 00000002h
  loc_006125D7: call [00401040h] ; __vbaFreeObjList
  loc_006125DD: lea edx, var_64
  loc_006125E0: lea eax, var_54
  loc_006125E3: push edx
  loc_006125E4: lea ecx, var_44
  loc_006125E7: push eax
  loc_006125E8: lea edx, var_34
  loc_006125EB: push ecx
  loc_006125EC: push edx
  loc_006125ED: push 00000004h
  loc_006125EF: call [00401038h] ; __vbaFreeVarList
  loc_006125F5: add esp, 0000002Ch
  loc_006125F8: ret
  loc_006125F9: ret
  loc_006125FA: mov eax, Me
  loc_006125FD: push eax
  loc_006125FE: mov ecx, [eax]
  loc_00612600: call [ecx+00000008h]
  loc_00612603: mov eax, var_4
  loc_00612606: mov ecx, var_14
  loc_00612609: pop edi
  loc_0061260A: pop esi
  loc_0061260B: mov fs:[00000000h], ecx
  loc_00612612: pop ebx
  loc_00612613: mov esp, ebp
  loc_00612615: pop ebp
  loc_00612616: retn 0004h
End Sub

Private Sub txtAmount_KeyPress(KeyAscii As Integer) '611700
  loc_00611700: push ebp
  loc_00611701: mov ebp, esp
  loc_00611703: sub esp, 0000000Ch
  loc_00611706: push 00403B36h ; __vbaExceptHandler
  loc_0061170B: mov eax, fs:[00000000h]
  loc_00611711: push eax
  loc_00611712: mov fs:[00000000h], esp
  loc_00611719: sub esp, 000000A8h
  loc_0061171F: push ebx
  loc_00611720: push esi
  loc_00611721: push edi
  loc_00611722: mov var_C, esp
  loc_00611725: mov var_8, 00403980h
  loc_0061172C: mov edi, Me
  loc_0061172F: mov eax, edi
  loc_00611731: and eax, 00000001h
  loc_00611734: mov var_4, eax
  loc_00611737: and edi, FFFFFFFEh
  loc_0061173A: push edi
  loc_0061173B: mov Me, edi
  loc_0061173E: mov ecx, [edi]
  loc_00611740: call [ecx+00000004h]
  loc_00611743: xor esi, esi
  loc_00611745: mov edx, 0043244Ch ; "-0123456789."
  loc_0061174A: lea ecx, var_18
  loc_0061174D: mov var_18, esi
  loc_00611750: mov var_1C, esi
  loc_00611753: mov var_2C, esi
  loc_00611756: mov var_3C, esi
  loc_00611759: mov var_4C, esi
  loc_0061175C: mov var_5C, esi
  loc_0061175F: mov var_6C, esi
  loc_00611762: mov var_7C, esi
  loc_00611765: mov var_8C, esi
  loc_0061176B: mov var_9C, esi
  loc_00611771: mov var_AC, esi
  loc_00611777: call [004011ECh] ; __vbaStrCopy
  loc_0061177D: mov ebx, KeyAscii
  loc_00611780: mov edx, var_18
  loc_00611783: lea ecx, var_2C
  loc_00611786: mov var_74, edx
  loc_00611789: movsx eax, [ebx]
  loc_0061178C: push eax
  loc_0061178D: push ecx
  loc_0061178E: mov var_7C, 00000008h
  loc_00611795: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_0061179B: mov ax, [ebx]
  loc_0061179E: xor edx, edx
  loc_006117A0: cmp ax, 000Dh
  loc_006117A4: mov ecx, 0000000Bh
  loc_006117A9: setz dl
  loc_006117AC: neg edx
  loc_006117AE: mov var_94, dx
  loc_006117B5: xor edx, edx
  loc_006117B7: cmp ax, 0008h
  loc_006117BB: mov var_9C, ecx
  loc_006117C1: setz dl
  loc_006117C4: neg edx
  loc_006117C6: mov var_AC, ecx
  loc_006117CC: lea eax, var_7C
  loc_006117CF: push 00000001h
  loc_006117D1: lea ecx, var_2C
  loc_006117D4: mov var_A4, dx
  loc_006117DB: push eax
  loc_006117DC: push ecx
  loc_006117DD: lea edx, var_3C
  loc_006117E0: push esi
  loc_006117E1: push edx
  loc_006117E2: mov var_84, esi
  loc_006117E8: mov var_8C, 00008002h
  loc_006117F2: call [004011A8h] ; __vbaInStrVar
  loc_006117F8: push eax
  loc_006117F9: lea eax, var_8C
  loc_006117FF: lea ecx, var_4C
  loc_00611802: push eax
  loc_00611803: push ecx
  loc_00611804: call [00401050h] ; __vbaVarCmpNe
  loc_0061180A: push eax
  loc_0061180B: lea edx, var_9C
  loc_00611811: lea eax, var_5C
  loc_00611814: push edx
  loc_00611815: push eax
  loc_00611816: call [0040112Ch] ; __vbaVarOr
  loc_0061181C: lea ecx, var_AC
  loc_00611822: push eax
  loc_00611823: lea edx, var_6C
  loc_00611826: push ecx
  loc_00611827: push edx
  loc_00611828: call [0040112Ch] ; __vbaVarOr
  loc_0061182E: push eax
  loc_0061182F: call [004010E0h] ; __vbaBoolVarNull
  loc_00611835: mov var_B0, ax
  loc_0061183C: lea eax, var_AC
  loc_00611842: lea ecx, var_9C
  loc_00611848: push eax
  loc_00611849: lea edx, var_3C
  loc_0061184C: push ecx
  loc_0061184D: lea eax, var_2C
  loc_00611850: push edx
  loc_00611851: push eax
  loc_00611852: push 00000004h
  loc_00611854: call [00401038h] ; __vbaFreeVarList
  loc_0061185A: add esp, 00000014h
  loc_0061185D: cmp var_B0, si
  loc_00611864: jz 006118B4h
  loc_00611866: mov ax, [ebx]
  loc_00611869: cmp ax, 000Dh
  loc_0061186D: mov [ebx], ax
  loc_00611870: jnz 006118B7h
  loc_00611872: mov ecx, [edi]
  loc_00611874: push edi
  loc_00611875: call [ecx+0000030Ch]
  loc_0061187B: lea edx, var_1C
  loc_0061187E: push eax
  loc_0061187F: push edx
  loc_00611880: call [004010A0h] ; __vbaObjSet
  loc_00611886: mov edi, eax
  loc_00611888: push edi
  loc_00611889: mov eax, [edi]
  loc_0061188B: call [eax+00000204h]
  loc_00611891: cmp eax, esi
  loc_00611893: fnclex
  loc_00611895: jge 006118A9h
  loc_00611897: push 00000204h
  loc_0061189C: push 0041E5E8h
  loc_006118A1: push edi
  loc_006118A2: push eax
  loc_006118A3: call [00401074h] ; __vbaHresultCheckObj
  loc_006118A9: lea ecx, var_1C
  loc_006118AC: call [004012B0h] ; __vbaFreeObj
  loc_006118B2: jmp 006118B7h
  loc_006118B4: mov [ebx], si
  loc_006118B7: mov var_4, esi
  loc_006118BA: push 006118F4h
  loc_006118BF: jmp 006118EAh
  loc_006118C1: lea ecx, var_1C
  loc_006118C4: call [004012B0h] ; __vbaFreeObj
  loc_006118CA: lea ecx, var_6C
  loc_006118CD: lea edx, var_5C
  loc_006118D0: push ecx
  loc_006118D1: lea eax, var_4C
  loc_006118D4: push edx
  loc_006118D5: lea ecx, var_3C
  loc_006118D8: push eax
  loc_006118D9: lea edx, var_2C
  loc_006118DC: push ecx
  loc_006118DD: push edx
  loc_006118DE: push 00000005h
  loc_006118E0: call [00401038h] ; __vbaFreeVarList
  loc_006118E6: add esp, 00000018h
  loc_006118E9: ret
  loc_006118EA: lea ecx, var_18
  loc_006118ED: call [004012ACh] ; __vbaFreeStr
  loc_006118F3: ret
  loc_006118F4: mov eax, Me
  loc_006118F7: push eax
  loc_006118F8: mov ecx, [eax]
  loc_006118FA: call [ecx+00000008h]
  loc_006118FD: mov eax, var_4
  loc_00611900: mov ecx, var_14
  loc_00611903: pop edi
  loc_00611904: pop esi
  loc_00611905: mov fs:[00000000h], ecx
  loc_0061190C: pop ebx
  loc_0061190D: mov esp, ebp
  loc_0061190F: pop ebp
  loc_00611910: retn 0008h
End Sub

Private Sub Form_Load() '611290
  loc_00611290: push ebp
  loc_00611291: mov ebp, esp
  loc_00611293: sub esp, 0000000Ch
  loc_00611296: push 00403B36h ; __vbaExceptHandler
  loc_0061129B: mov eax, fs:[00000000h]
  loc_006112A1: push eax
  loc_006112A2: mov fs:[00000000h], esp
  loc_006112A9: sub esp, 00000060h
  loc_006112AC: push ebx
  loc_006112AD: push esi
  loc_006112AE: push edi
  loc_006112AF: mov var_C, esp
  loc_006112B2: mov var_8, 00403960h
  loc_006112B9: mov esi, Me
  loc_006112BC: mov eax, esi
  loc_006112BE: and eax, 00000001h
  loc_006112C1: mov var_4, eax
  loc_006112C4: and esi, FFFFFFFEh
  loc_006112C7: push esi
  loc_006112C8: mov Me, esi
  loc_006112CB: mov ecx, [esi]
  loc_006112CD: call [ecx+00000004h]
  loc_006112D0: mov edx, [esi]
  loc_006112D2: lea eax, var_6C
  loc_006112D5: xor edi, edi
  loc_006112D7: push eax
  loc_006112D8: mov var_6C, edi
  loc_006112DB: push esi
  loc_006112DC: mov var_18, edi
  loc_006112DF: mov var_28, edi
  loc_006112E2: mov var_38, edi
  loc_006112E5: mov var_48, edi
  loc_006112E8: mov var_58, edi
  loc_006112EB: mov var_6C, edi
  loc_006112EE: call [edx+00000734h]
  loc_006112F4: lea ecx, var_28
  loc_006112F7: push ecx
  loc_006112F8: call [00401224h] ; rtcGetDateVar
  loc_006112FE: lea edx, var_58
  loc_00611301: lea ecx, var_38
  loc_00611304: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_0061130B: mov var_58, 00000008h
  loc_00611312: call [00401240h] ; __vbaVarDup
  loc_00611318: push 00000001h
  loc_0061131A: lea edx, var_38
  loc_0061131D: push 00000001h
  loc_0061131F: lea eax, var_28
  loc_00611322: push edx
  loc_00611323: lea ecx, var_48
  loc_00611326: push eax
  loc_00611327: push ecx
  loc_00611328: call [00401060h] ; rtcVarFromFormatVar
  loc_0061132E: mov eax, var_48
  loc_00611331: mov ecx, var_44
  loc_00611334: sub esp, 00000010h
  loc_00611337: mov edx, esp
  loc_00611339: push 00000014h
  loc_0061133B: push esi
  loc_0061133C: mov [edx], eax
  loc_0061133E: mov eax, var_40
  loc_00611341: mov [edx+00000004h], ecx
  loc_00611344: mov ecx, var_3C
  loc_00611347: mov [edx+00000008h], eax
  loc_0061134A: mov [edx+0000000Ch], ecx
  loc_0061134D: mov edx, [esi]
  loc_0061134F: call [edx+00000348h]
  loc_00611355: push eax
  loc_00611356: lea eax, var_18
  loc_00611359: push eax
  loc_0061135A: call [004010A0h] ; __vbaObjSet
  loc_00611360: push eax
  loc_00611361: call [00401288h] ; __vbaLateIdSt
  loc_00611367: lea ecx, var_18
  loc_0061136A: call [004012B0h] ; __vbaFreeObj
  loc_00611370: lea ecx, var_48
  loc_00611373: lea edx, var_38
  loc_00611376: push ecx
  loc_00611377: lea eax, var_28
  loc_0061137A: push edx
  loc_0061137B: push eax
  loc_0061137C: push 00000003h
  loc_0061137E: call [00401038h] ; __vbaFreeVarList
  loc_00611384: mov ecx, [esi]
  loc_00611386: add esp, 00000010h
  loc_00611389: push esi
  loc_0061138A: call [ecx+00000728h]
  loc_00611390: mov var_4, edi
  loc_00611393: push 006113BCh
  loc_00611398: jmp 006113BBh
  loc_0061139A: lea ecx, var_18
  loc_0061139D: call [004012B0h] ; __vbaFreeObj
  loc_006113A3: lea edx, var_48
  loc_006113A6: lea eax, var_38
  loc_006113A9: push edx
  loc_006113AA: lea ecx, var_28
  loc_006113AD: push eax
  loc_006113AE: push ecx
  loc_006113AF: push 00000003h
  loc_006113B1: call [00401038h] ; __vbaFreeVarList
  loc_006113B7: add esp, 00000010h
  loc_006113BA: ret
  loc_006113BB: ret
  loc_006113BC: mov eax, Me
  loc_006113BF: push eax
  loc_006113C0: mov edx, [eax]
  loc_006113C2: call [edx+00000008h]
  loc_006113C5: mov eax, var_4
  loc_006113C8: mov ecx, var_14
  loc_006113CB: pop edi
  loc_006113CC: pop esi
  loc_006113CD: mov fs:[00000000h], ecx
  loc_006113D4: pop ebx
  loc_006113D5: mov esp, ebp
  loc_006113D7: pop ebp
  loc_006113D8: retn 0004h
End Sub

Private Sub cmdSearch_Click() '611100
  loc_00611100: push ebp
  loc_00611101: mov ebp, esp
  loc_00611103: sub esp, 0000000Ch
  loc_00611106: push 00403B36h ; __vbaExceptHandler
  loc_0061110B: mov eax, fs:[00000000h]
  loc_00611111: push eax
  loc_00611112: mov fs:[00000000h], esp
  loc_00611119: sub esp, 00000050h
  loc_0061111C: push ebx
  loc_0061111D: push esi
  loc_0061111E: push edi
  loc_0061111F: mov var_C, esp
  loc_00611122: mov var_8, 00403950h
  loc_00611129: mov eax, Me
  loc_0061112C: mov ecx, eax
  loc_0061112E: and ecx, 00000001h
  loc_00611131: mov var_4, ecx
  loc_00611134: and al, FEh
  loc_00611136: push eax
  loc_00611137: mov Me, eax
  loc_0061113A: mov edx, [eax]
  loc_0061113C: call [edx+00000004h]
  loc_0061113F: xor esi, esi
  loc_00611141: mov edx, 00433760h ; "Receive"
  loc_00611146: mov ecx, 0061A0A0h
  loc_0061114B: mov var_24, esi
  loc_0061114E: mov var_34, esi
  loc_00611151: mov var_44, esi
  loc_00611154: mov var_54, esi
  loc_00611157: call [004011ECh] ; __vbaStrCopy
  loc_0061115D: cmp [0061A404h], esi
  loc_00611163: jnz 00611175h
  loc_00611165: push 0061A404h
  loc_0061116A: push 0040B064h
  loc_0061116F: call [004011DCh] ; __vbaNew2
  loc_00611175: sub esp, 00000010h
  loc_00611178: mov ecx, 0000000Ah
  loc_0061117D: mov ebx, esp
  loc_0061117F: mov var_54, ecx
  loc_00611182: mov eax, 80020004h
  loc_00611187: sub esp, 00000010h
  loc_0061118A: mov [ebx], ecx
  loc_0061118C: mov ecx, var_50
  loc_0061118F: mov var_4C, eax
  loc_00611192: mov esi, [0061A404h]
  loc_00611198: mov [ebx+00000004h], ecx
  loc_0061119B: mov var_44, 00000002h
  loc_006111A2: mov ecx, esp
  loc_006111A4: mov edx, 00000001h
  loc_006111A9: mov [ebx+00000008h], eax
  loc_006111AC: mov eax, var_48
  loc_006111AF: mov var_3C, edx
  loc_006111B2: mov edi, [esi]
  loc_006111B4: mov [ebx+0000000Ch], eax
  loc_006111B7: mov eax, var_44
  loc_006111BA: mov [ecx], eax
  loc_006111BC: mov eax, var_40
  loc_006111BF: push esi
  loc_006111C0: mov [ecx+00000004h], eax
  loc_006111C3: mov [ecx+00000008h], edx
  loc_006111C6: mov edx, var_38
  loc_006111C9: mov [ecx+0000000Ch], edx
  loc_006111CC: call [edi+000002B0h]
  loc_006111D2: test eax, eax
  loc_006111D4: fnclex
  loc_006111D6: jge 006111EAh
  loc_006111D8: push 000002B0h
  loc_006111DD: push 0042B80Ch
  loc_006111E2: push esi
  loc_006111E3: push eax
  loc_006111E4: call [00401074h] ; __vbaHresultCheckObj
  loc_006111EA: lea eax, var_44
  loc_006111ED: lea ecx, var_24
  loc_006111F0: push eax
  loc_006111F1: push ecx
  loc_006111F2: mov var_3C, 0061A058h
  loc_006111F9: mov var_44, 00004008h
  loc_00611200: call [004010D4h] ; rtcTrimVar
  loc_00611206: lea edx, var_24
  loc_00611209: lea eax, var_54
  loc_0061120C: push edx
  loc_0061120D: push eax
  loc_0061120E: mov var_4C, 0041E5D4h
  loc_00611215: mov var_54, 00008008h
  loc_0061121C: call [00401218h] ; __vbaVarTstNe
  loc_00611222: lea ecx, var_24
  loc_00611225: mov esi, eax
  loc_00611227: call [00401020h] ; __vbaFreeVar
  loc_0061122D: test si, si
  loc_00611230: jz 00611247h
  loc_00611232: mov esi, Me
  loc_00611235: push esi
  loc_00611236: mov ecx, [esi]
  loc_00611238: call [ecx+00000738h]
  loc_0061123E: mov edx, [esi]
  loc_00611240: push esi
  loc_00611241: call [edx+00000758h]
  loc_00611247: mov var_4, 00000000h
  loc_0061124E: push 0061126Ah
  loc_00611253: jmp 00611269h
  loc_00611255: lea eax, var_34
  loc_00611258: lea ecx, var_24
  loc_0061125B: push eax
  loc_0061125C: push ecx
  loc_0061125D: push 00000002h
  loc_0061125F: call [00401038h] ; __vbaFreeVarList
  loc_00611265: add esp, 0000000Ch
  loc_00611268: ret
  loc_00611269: ret
  loc_0061126A: mov eax, Me
  loc_0061126D: push eax
  loc_0061126E: mov edx, [eax]
  loc_00611270: call [edx+00000008h]
  loc_00611273: mov eax, var_4
  loc_00611276: mov ecx, var_14
  loc_00611279: pop edi
  loc_0061127A: pop esi
  loc_0061127B: mov fs:[00000000h], ecx
  loc_00611282: pop ebx
  loc_00611283: mov esp, ebp
  loc_00611285: pop ebp
  loc_00611286: retn 0004h
End Sub

Private Sub cmdReport_Click() '60FF60
  loc_0060FF60: push ebp
  loc_0060FF61: mov ebp, esp
  loc_0060FF63: sub esp, 0000000Ch
  loc_0060FF66: push 00403B36h ; __vbaExceptHandler
  loc_0060FF6B: mov eax, fs:[00000000h]
  loc_0060FF71: push eax
  loc_0060FF72: mov fs:[00000000h], esp
  loc_0060FF79: sub esp, 00000138h
  loc_0060FF7F: push ebx
  loc_0060FF80: push esi
  loc_0060FF81: push edi
  loc_0060FF82: mov var_C, esp
  loc_0060FF85: mov var_8, 00403938h
  loc_0060FF8C: mov esi, Me
  loc_0060FF8F: mov eax, esi
  loc_0060FF91: and eax, 00000001h
  loc_0060FF94: mov var_4, eax
  loc_0060FF97: and esi, FFFFFFFEh
  loc_0060FF9A: push esi
  loc_0060FF9B: mov Me, esi
  loc_0060FF9E: mov ecx, [esi]
  loc_0060FFA0: call [ecx+00000004h]
  loc_0060FFA3: xor edi, edi
  loc_0060FFA5: lea edx, var_34
  loc_0060FFA8: mov eax, 80020004h
  loc_0060FFAD: mov ecx, 0000000Ah
  loc_0060FFB2: mov ebx, 00000008h
  loc_0060FFB7: push 0000000Dh
  loc_0060FFB9: mov var_64, edi
  loc_0060FFBC: mov var_74, edi
  loc_0060FFBF: mov var_84, edi
  loc_0060FFC5: mov var_94, edi
  loc_0060FFCB: mov var_A4, edi
  loc_0060FFD1: mov var_B4, edi
  loc_0060FFD7: mov var_C4, edi
  loc_0060FFDD: push edx
  loc_0060FFDE: mov var_18, edi
  loc_0060FFE1: mov var_1C, edi
  loc_0060FFE4: mov var_20, edi
  loc_0060FFE7: mov var_24, edi
  loc_0060FFEA: mov var_34, edi
  loc_0060FFED: mov var_44, edi
  loc_0060FFF0: mov var_54, edi
  loc_0060FFF3: mov var_D4, edi
  loc_0060FFF9: mov var_E4, edi
  loc_0060FFFF: mov var_F4, edi
  loc_00610005: mov var_104, edi
  loc_0061000B: mov var_114, edi
  loc_00610011: mov var_124, edi
  loc_00610017: mov var_134, edi
  loc_0061001D: mov var_AC, eax
  loc_00610023: mov var_B4, ecx
  loc_00610029: mov var_9C, eax
  loc_0061002F: mov var_A4, ecx
  loc_00610035: mov var_8C, eax
  loc_0061003B: mov var_94, ecx
  loc_00610041: mov var_7C, eax
  loc_00610044: mov var_84, ecx
  loc_0061004A: mov var_6C, eax
  loc_0061004D: mov var_74, ecx
  loc_00610050: mov var_5C, eax
  loc_00610053: mov var_64, ecx
  loc_00610056: mov var_BC, 0042B1F0h ; "1. Receive & Issue Listing (All Customer) "
  loc_00610060: mov var_C4, ebx
  loc_00610066: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_0061006C: lea eax, var_B4
  loc_00610072: lea ecx, var_A4
  loc_00610078: push eax
  loc_00610079: lea edx, var_94
  loc_0061007F: push ecx
  loc_00610080: lea eax, var_84
  loc_00610086: push edx
  loc_00610087: lea ecx, var_74
  loc_0061008A: push eax
  loc_0061008B: lea edx, var_64
  loc_0061008E: push ecx
  loc_0061008F: lea eax, var_C4
  loc_00610095: push edx
  loc_00610096: lea ecx, var_34
  loc_00610099: push eax
  loc_0061009A: lea edx, var_44
  loc_0061009D: mov var_D4, ebx
  loc_006100A3: mov ebx, [004011B4h] ; __vbaVarCat
  loc_006100A9: push ecx
  loc_006100AA: push edx
  loc_006100AB: mov var_CC, 0042B24Ch ; "2. Receive & Issue Listing (Individual Customer)"
  loc_006100B5: call ebx
  loc_006100B7: push eax
  loc_006100B8: lea eax, var_D4
  loc_006100BE: lea ecx, var_54
  loc_006100C1: push eax
  loc_006100C2: push ecx
  loc_006100C3: call ebx
  loc_006100C5: push eax
  loc_006100C6: call [004010B0h] ; rtcInputBox
  loc_006100CC: mov edx, eax
  loc_006100CE: lea ecx, var_18
  loc_006100D1: call [00401270h] ; __vbaStrMove
  loc_006100D7: lea edx, var_B4
  loc_006100DD: lea eax, var_A4
  loc_006100E3: push edx
  loc_006100E4: lea ecx, var_94
  loc_006100EA: push eax
  loc_006100EB: lea edx, var_84
  loc_006100F1: push ecx
  loc_006100F2: lea eax, var_74
  loc_006100F5: push edx
  loc_006100F6: lea ecx, var_64
  loc_006100F9: push eax
  loc_006100FA: lea edx, var_54
  loc_006100FD: push ecx
  loc_006100FE: lea eax, var_44
  loc_00610101: push edx
  loc_00610102: lea ecx, var_34
  loc_00610105: push eax
  loc_00610106: push ecx
  loc_00610107: push 00000009h
  loc_00610109: call [00401038h] ; __vbaFreeVarList
  loc_0061010F: add esp, 00000028h
  loc_00610112: lea eax, var_C4
  loc_00610118: lea edx, var_18
  loc_0061011B: mov var_C4, 00004008h
  loc_00610125: push eax
  loc_00610126: mov var_BC, edx
  loc_0061012C: call [0040111Ch] ; rtcIsNumeric
  loc_00610132: test ax, ax
  loc_00610135: jz 00610FC4h
  loc_0061013B: mov ecx, var_18
  loc_0061013E: push ecx
  loc_0061013F: call [004011D8h] ; __vbaR8Str
  loc_00610145: fcomp real8 ptr [004015F8h]
  loc_0061014B: fnstsw ax
  loc_0061014D: test ah, 40h
  loc_00610150: jz 00610FCFh
  loc_00610156: mov edx, 00433760h ; "Receive"
  loc_0061015B: mov ecx, 0061A0A0h
  loc_00610160: call [004011ECh] ; __vbaStrCopy
  loc_00610166: cmp [0061A2D8h], edi
  loc_0061016C: jnz 0061017Eh
  loc_0061016E: push 0061A2D8h
  loc_00610173: push 00409C2Ch
  loc_00610178: call [004011DCh] ; __vbaNew2
  loc_0061017E: sub esp, 00000010h
  loc_00610181: mov eax, 0000000Ah
  loc_00610186: mov ecx, esp
  loc_00610188: mov var_D4, eax
  loc_0061018E: mov var_CC, 80020004h
  loc_00610198: sub esp, 00000010h
  loc_0061019B: mov [ecx], eax
  loc_0061019D: mov eax, var_D0
  loc_006101A3: mov ebx, [0061A2D8h]
  loc_006101A9: mov var_C4, 00000002h
  loc_006101B3: mov [ecx+00000004h], eax
  loc_006101B6: mov eax, var_CC
  loc_006101BC: mov var_BC, 00000001h
  loc_006101C6: mov edx, [ebx]
  loc_006101C8: mov [ecx+00000008h], eax
  loc_006101CB: mov eax, var_C8
  loc_006101D1: mov [ecx+0000000Ch], eax
  loc_006101D4: mov eax, var_C4
  loc_006101DA: mov ecx, esp
  loc_006101DC: push ebx
  loc_006101DD: mov [ecx], eax
  loc_006101DF: mov eax, var_C0
  loc_006101E5: mov [ecx+00000004h], eax
  loc_006101E8: mov eax, var_BC
  loc_006101EE: mov [ecx+00000008h], eax
  loc_006101F1: mov eax, var_B8
  loc_006101F7: mov [ecx+0000000Ch], eax
  loc_006101FA: call [edx+000002B0h]
  loc_00610200: cmp eax, edi
  loc_00610202: fnclex
  loc_00610204: jge 00610218h
  loc_00610206: push 000002B0h
  loc_0061020B: push 00429194h
  loc_00610210: push ebx
  loc_00610211: push eax
  loc_00610212: call [00401074h] ; __vbaHresultCheckObj
  loc_00610218: mov ebx, [004010D4h] ; rtcTrimVar
  loc_0061021E: lea ecx, var_C4
  loc_00610224: lea edx, var_34
  loc_00610227: push ecx
  loc_00610228: push edx
  loc_00610229: mov var_BC, 0061A0F4h
  loc_00610233: mov var_C4, 00004007h
  loc_0061023D: call ebx
  loc_0061023F: lea eax, var_E4
  loc_00610245: lea ecx, var_54
  loc_00610248: push eax
  loc_00610249: push ecx
  loc_0061024A: mov var_CC, 0041E5D4h
  loc_00610254: mov var_D4, 00008008h
  loc_0061025E: mov var_DC, 0061A0FCh
  loc_00610268: mov var_E4, 00004007h
  loc_00610272: call ebx
  loc_00610274: lea edx, var_34
  loc_00610277: lea eax, var_D4
  loc_0061027D: push edx
  loc_0061027E: lea ecx, var_44
  loc_00610281: push eax
  loc_00610282: push ecx
  loc_00610283: mov var_EC, 0041E5D4h
  loc_0061028D: mov var_F4, 00008008h
  loc_00610297: call [00401050h] ; __vbaVarCmpNe
  loc_0061029D: push eax
  loc_0061029E: lea edx, var_54
  loc_006102A1: lea eax, var_F4
  loc_006102A7: push edx
  loc_006102A8: lea ecx, var_64
  loc_006102AB: push eax
  loc_006102AC: push ecx
  loc_006102AD: call [00401050h] ; __vbaVarCmpNe
  loc_006102B3: lea edx, var_74
  loc_006102B6: push eax
  loc_006102B7: push edx
  loc_006102B8: call [0040115Ch] ; __vbaVarAnd
  loc_006102BE: push eax
  loc_006102BF: call [004010E0h] ; __vbaBoolVarNull
  loc_006102C5: mov var_138, ax
  loc_006102CC: lea eax, var_54
  loc_006102CF: lea ecx, var_34
  loc_006102D2: push eax
  loc_006102D3: push ecx
  loc_006102D4: push 00000002h
  loc_006102D6: call [00401038h] ; __vbaFreeVarList
  loc_006102DC: add esp, 0000000Ch
  loc_006102DF: cmp var_138, di
  loc_006102E6: jz 00610FDAh
  loc_006102EC: mov edx, [0061A13Ch]
  loc_006102F2: mov eax, 0000000Ah
  loc_006102F7: mov var_BC, 80020004h
  loc_00610301: mov var_C4, eax
  loc_00610307: mov ecx, [edx]
  loc_00610309: sub esp, 00000010h
  loc_0061030C: mov edx, esp
  loc_0061030E: push 0042B00Ch ; "Delete From TmpReceive"
  loc_00610313: mov [edx], eax
  loc_00610315: mov eax, var_C0
  loc_0061031B: mov [edx+00000004h], eax
  loc_0061031E: mov eax, var_BC
  loc_00610324: mov [edx+00000008h], eax
  loc_00610327: mov eax, var_B8
  loc_0061032D: mov [edx+0000000Ch], eax
  loc_00610330: mov edx, [0061A13Ch]
  loc_00610336: push edx
  loc_00610337: call [ecx+0000005Ch]
  loc_0061033A: cmp eax, edi
  loc_0061033C: fnclex
  loc_0061033E: jge 00610355h
  loc_00610340: mov ecx, [0061A13Ch]
  loc_00610346: push 0000005Ch
  loc_00610348: push 0041E928h
  loc_0061034D: push ecx
  loc_0061034E: push eax
  loc_0061034F: call [00401074h] ; __vbaHresultCheckObj
  loc_00610355: lea edx, var_C4
  loc_0061035B: lea eax, var_34
  loc_0061035E: push edx
  loc_0061035F: push eax
  loc_00610360: mov var_10C, 80020004h
  loc_0061036A: mov var_114, 0000000Ah
  loc_00610374: mov var_CC, 0042B040h ; "Insert Into TmpReceive select * From Receive Where OnDate Between #"
  loc_0061037E: mov var_D4, 00000008h
  loc_00610388: mov var_BC, 0061A0F4h
  loc_00610392: mov var_C4, 00004007h
  loc_0061039C: call ebx
  loc_0061039E: lea ecx, var_F4
  loc_006103A4: lea edx, var_64
  loc_006103A7: push ecx
  loc_006103A8: push edx
  loc_006103A9: mov var_DC, 004296A4h ; "# and #"
  loc_006103B3: mov var_E4, 00000008h
  loc_006103BD: mov var_EC, 0061A0FCh
  loc_006103C7: mov var_F4, 00004007h
  loc_006103D1: call ebx
  loc_006103D3: mov eax, [0061A13Ch]
  loc_006103D8: mov edx, var_114
  loc_006103DE: sub esp, 00000010h
  loc_006103E1: mov var_FC, 004216BCh ; "#"
  loc_006103EB: mov ecx, esp
  loc_006103ED: mov var_104, 00000008h
  loc_006103F7: mov ebx, [eax]
  loc_006103F9: mov eax, var_110
  loc_006103FF: mov [ecx], edx
  loc_00610401: mov edx, var_10C
  loc_00610407: mov [ecx+00000004h], eax
  loc_0061040A: mov eax, var_108
  loc_00610410: mov [ecx+00000008h], edx
  loc_00610413: lea edx, var_34
  loc_00610416: mov [ecx+0000000Ch], eax
  loc_00610419: lea ecx, var_D4
  loc_0061041F: push ecx
  loc_00610420: lea eax, var_44
  loc_00610423: push edx
  loc_00610424: push eax
  loc_00610425: call [004011B4h] ; __vbaVarCat
  loc_0061042B: lea ecx, var_E4
  loc_00610431: push eax
  loc_00610432: lea edx, var_54
  loc_00610435: push ecx
  loc_00610436: push edx
  loc_00610437: call [004011B4h] ; __vbaVarCat
  loc_0061043D: push eax
  loc_0061043E: lea eax, var_64
  loc_00610441: lea ecx, var_74
  loc_00610444: push eax
  loc_00610445: push ecx
  loc_00610446: call [004011B4h] ; __vbaVarCat
  loc_0061044C: push eax
  loc_0061044D: lea edx, var_104
  loc_00610453: lea eax, var_84
  loc_00610459: push edx
  loc_0061045A: push eax
  loc_0061045B: call [004011B4h] ; __vbaVarCat
  loc_00610461: lea ecx, var_1C
  loc_00610464: push eax
  loc_00610465: push ecx
  loc_00610466: call [004011B0h] ; __vbaStrVarVal
  loc_0061046C: mov edx, [0061A13Ch]
  loc_00610472: push eax
  loc_00610473: push edx
  loc_00610474: call [ebx+0000005Ch]
  loc_00610477: cmp eax, edi
  loc_00610479: fnclex
  loc_0061047B: jge 00610492h
  loc_0061047D: mov ecx, [0061A13Ch]
  loc_00610483: push 0000005Ch
  loc_00610485: push 0041E928h
  loc_0061048A: push ecx
  loc_0061048B: push eax
  loc_0061048C: call [00401074h] ; __vbaHresultCheckObj
  loc_00610492: lea ecx, var_1C
  loc_00610495: call [004012ACh] ; __vbaFreeStr
  loc_0061049B: lea edx, var_84
  loc_006104A1: lea eax, var_74
  loc_006104A4: push edx
  loc_006104A5: lea ecx, var_64
  loc_006104A8: push eax
  loc_006104A9: lea edx, var_54
  loc_006104AC: push ecx
  loc_006104AD: lea eax, var_44
  loc_006104B0: push edx
  loc_006104B1: lea ecx, var_34
  loc_006104B4: push eax
  loc_006104B5: push ecx
  loc_006104B6: push 00000006h
  loc_006104B8: call [00401038h] ; __vbaFreeVarList
  loc_006104BE: mov edx, [esi]
  loc_006104C0: add esp, 0000001Ch
  loc_006104C3: push 0000000Bh
  loc_006104C5: push esi
  loc_006104C6: call [edx+000000A4h]
  loc_006104CC: cmp eax, edi
  loc_006104CE: fnclex
  loc_006104D0: jge 006104E4h
  loc_006104D2: push 000000A4h
  loc_006104D7: push 00429704h
  loc_006104DC: push esi
  loc_006104DD: push eax
  loc_006104DE: call [00401074h] ; __vbaHresultCheckObj
  loc_006104E4: mov eax, [esi]
  loc_006104E6: push edi
  loc_006104E7: push 00000070h
  loc_006104E9: push esi
  loc_006104EA: call [eax+00000344h]
  loc_006104F0: mov edi, [004010A0h] ; __vbaObjSet
  loc_006104F6: lea ecx, var_20
  loc_006104F9: push eax
  loc_006104FA: push ecx
  loc_006104FB: call edi
  loc_006104FD: push eax
  loc_006104FE: call [00401024h] ; __vbaLateIdCall
  loc_00610504: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0061050A: add esp, 0000000Ch
  loc_0061050D: lea ecx, var_20
  loc_00610510: call ebx
  loc_00610512: sub esp, 00000010h
  loc_00610515: mov ecx, 0000000Bh
  loc_0061051A: mov edx, esp
  loc_0061051C: mov var_C4, ecx
  loc_00610522: or eax, FFFFFFFFh
  loc_00610525: push 00000073h
  loc_00610527: mov [edx], ecx
  loc_00610529: mov ecx, var_C0
  loc_0061052F: mov var_BC, eax
  loc_00610535: push esi
  loc_00610536: mov [edx+00000004h], ecx
  loc_00610539: mov ecx, [esi]
  loc_0061053B: mov [edx+00000008h], eax
  loc_0061053E: mov eax, var_B8
  loc_00610544: mov [edx+0000000Ch], eax
  loc_00610547: call [ecx+00000344h]
  loc_0061054D: lea edx, var_20
  loc_00610550: push eax
  loc_00610551: push edx
  loc_00610552: call edi
  loc_00610554: push eax
  loc_00610555: call [00401288h] ; __vbaLateIdSt
  loc_0061055B: lea ecx, var_20
  loc_0061055E: call ebx
  loc_00610560: lea eax, var_C4
  loc_00610566: lea ecx, var_34
  loc_00610569: push eax
  loc_0061056A: push ecx
  loc_0061056B: mov var_CC, 00000000h
  loc_00610575: mov var_D4, 00000002h
  loc_0061057F: mov var_BC, 0061A150h
  loc_00610589: mov var_C4, 00004008h
  loc_00610593: call [004010D4h] ; rtcTrimVar
  loc_00610599: lea edx, var_34
  loc_0061059C: push edx
  loc_0061059D: call [00401028h] ; __vbaStrVarMove
  loc_006105A3: mov edx, var_D4
  loc_006105A9: sub esp, 00000010h
  loc_006105AC: mov ecx, esp
  loc_006105AE: sub esp, 00000010h
  loc_006105B1: mov var_44, 00000008h
  loc_006105B8: mov var_3C, eax
  loc_006105BB: mov [ecx], edx
  loc_006105BD: mov edx, var_D0
  loc_006105C3: mov [ecx+00000004h], edx
  loc_006105C6: mov edx, var_CC
  loc_006105CC: mov [ecx+00000008h], edx
  loc_006105CF: mov edx, var_C8
  loc_006105D5: mov [ecx+0000000Ch], edx
  loc_006105D8: mov edx, var_44
  loc_006105DB: mov ecx, esp
  loc_006105DD: push 00000001h
  loc_006105DF: push 00000020h
  loc_006105E1: push esi
  loc_006105E2: mov [ecx], edx
  loc_006105E4: mov edx, var_40
  loc_006105E7: mov [ecx+00000004h], edx
  loc_006105EA: mov [ecx+00000008h], eax
  loc_006105ED: mov eax, var_38
  loc_006105F0: mov [ecx+0000000Ch], eax
  loc_006105F3: mov ecx, [esi]
  loc_006105F5: call [ecx+00000344h]
  loc_006105FB: lea edx, var_20
  loc_006105FE: push eax
  loc_006105FF: push edx
  loc_00610600: call edi
  loc_00610602: push eax
  loc_00610603: call [00401160h] ; __vbaLateIdCallSt
  loc_00610609: add esp, 0000002Ch
  loc_0061060C: lea ecx, var_20
  loc_0061060F: call ebx
  loc_00610611: lea eax, var_44
  loc_00610614: lea ecx, var_34
  loc_00610617: push eax
  loc_00610618: push ecx
  loc_00610619: push 00000002h
  loc_0061061B: call [00401038h] ; __vbaFreeVarList
  loc_00610621: mov eax, [0061B394h]
  loc_00610626: add esp, 0000000Ch
  loc_00610629: test eax, eax
  loc_0061062B: jnz 0061063Dh
  loc_0061062D: push 0061B394h
  loc_00610632: push 0041E4A0h
  loc_00610637: call [004011DCh] ; __vbaNew2
  loc_0061063D: mov eax, [0061B394h]
  loc_00610642: lea ecx, var_20
  loc_00610645: push ecx
  loc_00610646: push eax
  loc_00610647: mov edx, [eax]
  loc_00610649: mov var_138, eax
  loc_0061064F: call [edx+00000014h]
  loc_00610652: test eax, eax
  loc_00610654: fnclex
  loc_00610656: jge 0061066Dh
  loc_00610658: mov edx, var_138
  loc_0061065E: push 00000014h
  loc_00610660: push 0041E490h
  loc_00610665: push edx
  loc_00610666: push eax
  loc_00610667: call [00401074h] ; __vbaHresultCheckObj
  loc_0061066D: mov eax, var_20
  loc_00610670: lea edx, var_1C
  loc_00610673: push edx
  loc_00610674: push eax
  loc_00610675: mov ecx, [eax]
  loc_00610677: mov var_140, eax
  loc_0061067D: call [ecx+00000050h]
  loc_00610680: test eax, eax
  loc_00610682: fnclex
  loc_00610684: jge 0061069Bh
  loc_00610686: mov ecx, var_140
  loc_0061068C: push 00000050h
  loc_0061068E: push 0041F3A0h
  loc_00610693: push ecx
  loc_00610694: push eax
  loc_00610695: call [00401074h] ; __vbaHresultCheckObj
  loc_0061069B: mov edx, var_1C
  loc_0061069E: push edx
  loc_0061069F: push 0042AE1Ch ; "\Reports\Receive.rpt"
  loc_006106A4: call [00401054h] ; __vbaStrCat
  loc_006106AA: sub esp, 00000010h
  loc_006106AD: mov ecx, 00000008h
  loc_006106B2: mov edx, esp
  loc_006106B4: mov var_34, ecx
  loc_006106B7: mov var_2C, eax
  loc_006106BA: push 00000003h
  loc_006106BC: mov [edx], ecx
  loc_006106BE: mov ecx, var_30
  loc_006106C1: push esi
  loc_006106C2: mov [edx+00000004h], ecx
  loc_006106C5: mov ecx, [esi]
  loc_006106C7: mov [edx+00000008h], eax
  loc_006106CA: mov eax, var_28
  loc_006106CD: mov [edx+0000000Ch], eax
  loc_006106D0: call [ecx+00000344h]
  loc_006106D6: lea edx, var_24
  loc_006106D9: push eax
  loc_006106DA: push edx
  loc_006106DB: call edi
  loc_006106DD: push eax
  loc_006106DE: call [00401288h] ; __vbaLateIdSt
  loc_006106E4: lea ecx, var_1C
  loc_006106E7: call [004012ACh] ; __vbaFreeStr
  loc_006106ED: lea eax, var_24
  loc_006106F0: lea ecx, var_20
  loc_006106F3: push eax
  loc_006106F4: push ecx
  loc_006106F5: push 00000002h
  loc_006106F7: call [00401040h] ; __vbaFreeObjList
  loc_006106FD: add esp, 0000000Ch
  loc_00610700: lea ecx, var_34
  loc_00610703: call [00401020h] ; __vbaFreeVar
  loc_00610709: sub esp, 00000010h
  loc_0061070C: mov ecx, 00000003h
  loc_00610711: mov edx, esp
  loc_00610713: mov var_C4, ecx
  loc_00610719: mov eax, 00000002h
  loc_0061071E: push 00000043h
  loc_00610720: mov [edx], ecx
  loc_00610722: mov ecx, var_C0
  loc_00610728: mov var_BC, eax
  loc_0061072E: push esi
  loc_0061072F: mov [edx+00000004h], ecx
  loc_00610732: mov ecx, [esi]
  loc_00610734: mov [edx+00000008h], eax
  loc_00610737: mov eax, var_B8
  loc_0061073D: mov [edx+0000000Ch], eax
  loc_00610740: call [ecx+00000344h]
  loc_00610746: lea edx, var_20
  loc_00610749: push eax
  loc_0061074A: push edx
  loc_0061074B: call edi
  loc_0061074D: push eax
  loc_0061074E: call [00401288h] ; __vbaLateIdSt
  loc_00610754: lea ecx, var_20
  loc_00610757: call ebx
  loc_00610759: sub esp, 00000010h
  loc_0061075C: mov ecx, 00000002h
  loc_00610761: mov edx, esp
  loc_00610763: mov var_C4, ecx
  loc_00610769: mov eax, 00000001h
  loc_0061076E: push 00000011h
  loc_00610770: mov [edx], ecx
  loc_00610772: mov ecx, var_C0
  loc_00610778: mov var_BC, eax
  loc_0061077E: push esi
  loc_0061077F: mov [edx+00000004h], ecx
  loc_00610782: mov ecx, [esi]
  loc_00610784: mov [edx+00000008h], eax
  loc_00610787: mov eax, var_B8
  loc_0061078D: mov [edx+0000000Ch], eax
  loc_00610790: call [ecx+00000344h]
  loc_00610796: lea edx, var_20
  loc_00610799: push eax
  loc_0061079A: push edx
  loc_0061079B: call edi
  loc_0061079D: push eax
  loc_0061079E: call [00401288h] ; __vbaLateIdSt
  loc_006107A4: lea ecx, var_20
  loc_006107A7: call ebx
  loc_006107A9: mov eax, [esi]
  loc_006107AB: push 00000001h
  loc_006107AD: push esi
  loc_006107AE: call [eax+000000A4h]
  loc_006107B4: test eax, eax
  loc_006107B6: fnclex
  loc_006107B8: jge 006107CCh
  loc_006107BA: push 000000A4h
  loc_006107BF: push 00429704h
  loc_006107C4: push esi
  loc_006107C5: push eax
  loc_006107C6: call [00401074h] ; __vbaHresultCheckObj
  loc_006107CC: mov ebx, [004010D4h] ; rtcTrimVar
  loc_006107D2: mov ecx, var_18
  loc_006107D5: push ecx
  loc_006107D6: call [004011D8h] ; __vbaR8Str
  loc_006107DC: fcomp real8 ptr [004019B8h]
  loc_006107E2: fnstsw ax
  loc_006107E4: test ah, 40h
  loc_006107E7: jz 00610FC2h
  loc_006107ED: mov edx, 0041F258h ; "AThai"
  loc_006107F2: mov ecx, 0061A0A0h
  loc_006107F7: call [004011ECh] ; __vbaStrCopy
  loc_006107FD: mov eax, [0061A11Ch]
  loc_00610802: test eax, eax
  loc_00610804: jnz 00610816h
  loc_00610806: push 0061A11Ch
  loc_0061080B: push 004069CCh
  loc_00610810: call [004011DCh] ; __vbaNew2
  loc_00610816: mov ecx, [0061A11Ch]
  loc_0061081C: mov eax, 0000000Ah
  loc_00610821: mov var_CC, 80020004h
  loc_0061082B: mov var_D4, eax
  loc_00610831: mov var_BC, 00000001h
  loc_0061083B: mov var_C4, 00000002h
  loc_00610845: mov edx, [ecx]
  loc_00610847: sub esp, 00000010h
  loc_0061084A: mov var_138, ecx
  loc_00610850: mov ecx, esp
  loc_00610852: sub esp, 00000010h
  loc_00610855: mov [ecx], eax
  loc_00610857: mov eax, var_D0
  loc_0061085D: mov [ecx+00000004h], eax
  loc_00610860: mov eax, var_CC
  loc_00610866: mov [ecx+00000008h], eax
  loc_00610869: mov eax, var_C8
  loc_0061086F: mov [ecx+0000000Ch], eax
  loc_00610872: mov eax, var_C4
  loc_00610878: mov ecx, esp
  loc_0061087A: mov [ecx], eax
  loc_0061087C: mov eax, var_C0
  loc_00610882: mov [ecx+00000004h], eax
  loc_00610885: mov eax, var_BC
  loc_0061088B: mov [ecx+00000008h], eax
  loc_0061088E: mov eax, var_B8
  loc_00610894: mov [ecx+0000000Ch], eax
  loc_00610897: mov ecx, var_138
  loc_0061089D: push ecx
  loc_0061089E: call [edx+000002B0h]
  loc_006108A4: test eax, eax
  loc_006108A6: fnclex
  loc_006108A8: jge 006108C2h
  loc_006108AA: mov edx, var_138
  loc_006108B0: push 000002B0h
  loc_006108B5: push 0041E6D0h
  loc_006108BA: push edx
  loc_006108BB: push eax
  loc_006108BC: call [00401074h] ; __vbaHresultCheckObj
  loc_006108C2: mov eax, [0061A0B8h]
  loc_006108C7: push eax
  loc_006108C8: push 0041E5D4h
  loc_006108CD: call [0040110Ch] ; __vbaStrCmp
  loc_006108D3: neg eax
  loc_006108D5: sbb eax, eax
  loc_006108D7: lea ecx, var_C4
  loc_006108DD: neg eax
  loc_006108DF: lea edx, var_34
  loc_006108E2: push ecx
  loc_006108E3: neg eax
  loc_006108E5: push edx
  loc_006108E6: mov var_BC, ax
  loc_006108ED: mov var_C4, 0000000Bh
  loc_006108F7: call ebx
  loc_006108F9: lea eax, var_34
  loc_006108FC: push eax
  loc_006108FD: call [004010E0h] ; __vbaBoolVarNull
  loc_00610903: lea ecx, var_34
  loc_00610906: lea edx, var_C4
  loc_0061090C: push ecx
  loc_0061090D: push edx
  loc_0061090E: push 00000002h
  loc_00610910: mov var_138, ax
  loc_00610917: call [00401038h] ; __vbaFreeVarList
  loc_0061091D: add esp, 0000000Ch
  loc_00610920: cmp var_138, 0000h
  loc_00610928: jz 00610FC2h
  loc_0061092E: mov edx, 00433760h ; "Receive"
  loc_00610933: mov ecx, 0061A0A0h
  loc_00610938: call [004011ECh] ; __vbaStrCopy
  loc_0061093E: mov eax, [0061A2D8h]
  loc_00610943: test eax, eax
  loc_00610945: jnz 00610957h
  loc_00610947: push 0061A2D8h
  loc_0061094C: push 00409C2Ch
  loc_00610951: call [004011DCh] ; __vbaNew2
  loc_00610957: sub esp, 00000010h
  loc_0061095A: mov eax, 0000000Ah
  loc_0061095F: mov edx, esp
  loc_00610961: mov var_D4, eax
  loc_00610967: mov var_CC, 80020004h
  loc_00610971: sub esp, 00000010h
  loc_00610974: mov [edx], eax
  loc_00610976: mov eax, var_D0
  loc_0061097C: mov var_C4, 00000002h
  loc_00610986: mov ecx, [0061A2D8h]
  loc_0061098C: mov [edx+00000004h], eax
  loc_0061098F: mov eax, var_CC
  loc_00610995: mov var_BC, 00000001h
  loc_0061099F: mov var_138, ecx
  loc_006109A5: mov [edx+00000008h], eax
  loc_006109A8: mov eax, var_C8
  loc_006109AE: mov ecx, [ecx]
  loc_006109B0: mov [edx+0000000Ch], eax
  loc_006109B3: mov eax, var_C4
  loc_006109B9: mov edx, esp
  loc_006109BB: mov [edx], eax
  loc_006109BD: mov eax, var_C0
  loc_006109C3: mov [edx+00000004h], eax
  loc_006109C6: mov eax, var_BC
  loc_006109CC: mov [edx+00000008h], eax
  loc_006109CF: mov eax, var_B8
  loc_006109D5: mov [edx+0000000Ch], eax
  loc_006109D8: mov edx, var_138
  loc_006109DE: push edx
  loc_006109DF: call [ecx+000002B0h]
  loc_006109E5: test eax, eax
  loc_006109E7: fnclex
  loc_006109E9: jge 00610A03h
  loc_006109EB: mov ecx, var_138
  loc_006109F1: push 000002B0h
  loc_006109F6: push 00429194h
  loc_006109FB: push ecx
  loc_006109FC: push eax
  loc_006109FD: call [00401074h] ; __vbaHresultCheckObj
  loc_00610A03: lea edx, var_C4
  loc_00610A09: lea eax, var_34
  loc_00610A0C: push edx
  loc_00610A0D: push eax
  loc_00610A0E: mov var_BC, 0061A0F4h
  loc_00610A18: mov var_C4, 00004007h
  loc_00610A22: call ebx
  loc_00610A24: lea ecx, var_E4
  loc_00610A2A: lea edx, var_54
  loc_00610A2D: push ecx
  loc_00610A2E: push edx
  loc_00610A2F: mov var_CC, 0041E5D4h
  loc_00610A39: mov var_D4, 00008008h
  loc_00610A43: mov var_DC, 0061A0FCh
  loc_00610A4D: mov var_E4, 00004007h
  loc_00610A57: call ebx
  loc_00610A59: lea eax, var_34
  loc_00610A5C: lea ecx, var_D4
  loc_00610A62: push eax
  loc_00610A63: lea edx, var_44
  loc_00610A66: push ecx
  loc_00610A67: push edx
  loc_00610A68: mov var_EC, 0041E5D4h
  loc_00610A72: mov var_F4, 00008008h
  loc_00610A7C: call [00401050h] ; __vbaVarCmpNe
  loc_00610A82: push eax
  loc_00610A83: lea eax, var_54
  loc_00610A86: lea ecx, var_F4
  loc_00610A8C: push eax
  loc_00610A8D: lea edx, var_64
  loc_00610A90: push ecx
  loc_00610A91: push edx
  loc_00610A92: call [00401050h] ; __vbaVarCmpNe
  loc_00610A98: push eax
  loc_00610A99: lea eax, var_74
  loc_00610A9C: push eax
  loc_00610A9D: call [0040115Ch] ; __vbaVarAnd
  loc_00610AA3: push eax
  loc_00610AA4: call [004010E0h] ; __vbaBoolVarNull
  loc_00610AAA: lea ecx, var_54
  loc_00610AAD: lea edx, var_34
  loc_00610AB0: push ecx
  loc_00610AB1: push edx
  loc_00610AB2: push 00000002h
  loc_00610AB4: mov var_138, ax
  loc_00610ABB: call [00401038h] ; __vbaFreeVarList
  loc_00610AC1: add esp, 0000000Ch
  loc_00610AC4: cmp var_138, 0000h
  loc_00610ACC: jz 00610FC2h
  loc_00610AD2: mov ecx, [0061A13Ch]
  loc_00610AD8: mov eax, 0000000Ah
  loc_00610ADD: mov var_BC, 80020004h
  loc_00610AE7: mov var_C4, eax
  loc_00610AED: mov edx, [ecx]
  loc_00610AEF: sub esp, 00000010h
  loc_00610AF2: mov ecx, esp
  loc_00610AF4: push 0042B00Ch ; "Delete From TmpReceive"
  loc_00610AF9: mov [ecx], eax
  loc_00610AFB: mov eax, var_C0
  loc_00610B01: mov [ecx+00000004h], eax
  loc_00610B04: mov eax, var_BC
  loc_00610B0A: mov [ecx+00000008h], eax
  loc_00610B0D: mov eax, var_B8
  loc_00610B13: mov [ecx+0000000Ch], eax
  loc_00610B16: mov ecx, [0061A13Ch]
  loc_00610B1C: push ecx
  loc_00610B1D: call [edx+0000005Ch]
  loc_00610B20: test eax, eax
  loc_00610B22: fnclex
  loc_00610B24: jge 00610B3Bh
  loc_00610B26: mov edx, [0061A13Ch]
  loc_00610B2C: push 0000005Ch
  loc_00610B2E: push 0041E928h
  loc_00610B33: push edx
  loc_00610B34: push eax
  loc_00610B35: call [00401074h] ; __vbaHresultCheckObj
  loc_00610B3B: lea eax, var_C4
  loc_00610B41: lea ecx, var_34
  loc_00610B44: push eax
  loc_00610B45: push ecx
  loc_00610B46: mov var_12C, 80020004h
  loc_00610B50: mov var_134, 0000000Ah
  loc_00610B5A: mov var_CC, 0042B040h ; "Insert Into TmpReceive select * From Receive Where OnDate Between #"
  loc_00610B64: mov var_D4, 00000008h
  loc_00610B6E: mov var_BC, 0061A0F4h
  loc_00610B78: mov var_C4, 00004007h
  loc_00610B82: call ebx
  loc_00610B84: lea edx, var_F4
  loc_00610B8A: lea eax, var_64
  loc_00610B8D: push edx
  loc_00610B8E: push eax
  loc_00610B8F: mov var_DC, 004296A4h ; "# and #"
  loc_00610B99: mov var_E4, 00000008h
  loc_00610BA3: mov var_EC, 0061A0FCh
  loc_00610BAD: mov var_F4, 00004007h
  loc_00610BB7: call ebx
  loc_00610BB9: lea ecx, var_114
  loc_00610BBF: lea edx, var_94
  loc_00610BC5: push ecx
  loc_00610BC6: push edx
  loc_00610BC7: mov var_FC, 0042AE4Ch ; "# and Name='"
  loc_00610BD1: mov var_104, 00000008h
  loc_00610BDB: mov var_10C, 0061A0B8h
  loc_00610BE5: mov var_114, 00004008h
  loc_00610BEF: call ebx
  loc_00610BF1: mov eax, [0061A13Ch]
  loc_00610BF6: mov edx, var_134
  loc_00610BFC: sub esp, 00000010h
  loc_00610BFF: mov var_11C, 0041E890h ; "'"
  loc_00610C09: mov ecx, esp
  loc_00610C0B: mov var_124, 00000008h
  loc_00610C15: mov ebx, [eax]
  loc_00610C17: mov eax, var_130
  loc_00610C1D: mov [ecx], edx
  loc_00610C1F: mov edx, var_12C
  loc_00610C25: mov [ecx+00000004h], eax
  loc_00610C28: mov eax, var_128
  loc_00610C2E: mov [ecx+00000008h], edx
  loc_00610C31: lea edx, var_34
  loc_00610C34: mov [ecx+0000000Ch], eax
  loc_00610C37: lea ecx, var_D4
  loc_00610C3D: push ecx
  loc_00610C3E: lea eax, var_44
  loc_00610C41: push edx
  loc_00610C42: push eax
  loc_00610C43: call [004011B4h] ; __vbaVarCat
  loc_00610C49: lea ecx, var_E4
  loc_00610C4F: push eax
  loc_00610C50: lea edx, var_54
  loc_00610C53: push ecx
  loc_00610C54: push edx
  loc_00610C55: call [004011B4h] ; __vbaVarCat
  loc_00610C5B: push eax
  loc_00610C5C: lea eax, var_64
  loc_00610C5F: lea ecx, var_74
  loc_00610C62: push eax
  loc_00610C63: push ecx
  loc_00610C64: call [004011B4h] ; __vbaVarCat
  loc_00610C6A: push eax
  loc_00610C6B: lea edx, var_104
  loc_00610C71: lea eax, var_84
  loc_00610C77: push edx
  loc_00610C78: push eax
  loc_00610C79: call [004011B4h] ; __vbaVarCat
  loc_00610C7F: lea ecx, var_94
  loc_00610C85: push eax
  loc_00610C86: lea edx, var_A4
  loc_00610C8C: push ecx
  loc_00610C8D: push edx
  loc_00610C8E: call [004011B4h] ; __vbaVarCat
  loc_00610C94: push eax
  loc_00610C95: lea eax, var_124
  loc_00610C9B: lea ecx, var_B4
  loc_00610CA1: push eax
  loc_00610CA2: push ecx
  loc_00610CA3: call [004011B4h] ; __vbaVarCat
  loc_00610CA9: push eax
  loc_00610CAA: lea edx, var_1C
  loc_00610CAD: push edx
  loc_00610CAE: call [004011B0h] ; __vbaStrVarVal
  loc_00610CB4: push eax
  loc_00610CB5: mov eax, [0061A13Ch]
  loc_00610CBA: push eax
  loc_00610CBB: call [ebx+0000005Ch]
  loc_00610CBE: test eax, eax
  loc_00610CC0: fnclex
  loc_00610CC2: jge 00610CD9h
  loc_00610CC4: mov ecx, [0061A13Ch]
  loc_00610CCA: push 0000005Ch
  loc_00610CCC: push 0041E928h
  loc_00610CD1: push ecx
  loc_00610CD2: push eax
  loc_00610CD3: call [00401074h] ; __vbaHresultCheckObj
  loc_00610CD9: lea ecx, var_1C
  loc_00610CDC: call [004012ACh] ; __vbaFreeStr
  loc_00610CE2: lea edx, var_B4
  loc_00610CE8: lea eax, var_A4
  loc_00610CEE: push edx
  loc_00610CEF: lea ecx, var_94
  loc_00610CF5: push eax
  loc_00610CF6: lea edx, var_84
  loc_00610CFC: push ecx
  loc_00610CFD: lea eax, var_74
  loc_00610D00: push edx
  loc_00610D01: lea ecx, var_64
  loc_00610D04: push eax
  loc_00610D05: lea edx, var_54
  loc_00610D08: push ecx
  loc_00610D09: lea eax, var_44
  loc_00610D0C: push edx
  loc_00610D0D: lea ecx, var_34
  loc_00610D10: push eax
  loc_00610D11: push ecx
  loc_00610D12: push 00000009h
  loc_00610D14: call [00401038h] ; __vbaFreeVarList
  loc_00610D1A: mov edx, [esi]
  loc_00610D1C: add esp, 00000028h
  loc_00610D1F: push 0000000Bh
  loc_00610D21: push esi
  loc_00610D22: call [edx+000000A4h]
  loc_00610D28: test eax, eax
  loc_00610D2A: fnclex
  loc_00610D2C: jge 00610D40h
  loc_00610D2E: push 000000A4h
  loc_00610D33: push 00429704h
  loc_00610D38: push esi
  loc_00610D39: push eax
  loc_00610D3A: call [00401074h] ; __vbaHresultCheckObj
  loc_00610D40: mov eax, [esi]
  loc_00610D42: push 00000000h
  loc_00610D44: push 00000070h
  loc_00610D46: push esi
  loc_00610D47: call [eax+00000344h]
  loc_00610D4D: lea ecx, var_20
  loc_00610D50: push eax
  loc_00610D51: push ecx
  loc_00610D52: call edi
  loc_00610D54: push eax
  loc_00610D55: call [00401024h] ; __vbaLateIdCall
  loc_00610D5B: add esp, 0000000Ch
  loc_00610D5E: lea ecx, var_20
  loc_00610D61: call [004012B0h] ; __vbaFreeObj
  loc_00610D67: lea edx, var_C4
  loc_00610D6D: lea eax, var_34
  loc_00610D70: push edx
  loc_00610D71: push eax
  loc_00610D72: mov var_CC, 00000000h
  loc_00610D7C: mov var_D4, 00000002h
  loc_00610D86: mov var_BC, 0061A150h
  loc_00610D90: mov var_C4, 00004008h
  loc_00610D9A: call [004010D4h] ; rtcTrimVar
  loc_00610DA0: lea ecx, var_34
  loc_00610DA3: push ecx
  loc_00610DA4: call [00401028h] ; __vbaStrVarMove
  loc_00610DAA: mov ebx, var_D4
  loc_00610DB0: sub esp, 00000010h
  loc_00610DB3: mov edx, esp
  loc_00610DB5: sub esp, 00000010h
  loc_00610DB8: mov ecx, 00000008h
  loc_00610DBD: mov var_3C, eax
  loc_00610DC0: mov [edx], ebx
  loc_00610DC2: mov ebx, var_D0
  loc_00610DC8: mov var_44, ecx
  loc_00610DCB: mov [edx+00000004h], ebx
  loc_00610DCE: mov ebx, var_CC
  loc_00610DD4: mov [edx+00000008h], ebx
  loc_00610DD7: mov ebx, var_C8
  loc_00610DDD: mov [edx+0000000Ch], ebx
  loc_00610DE0: mov edx, esp
  loc_00610DE2: push 00000001h
  loc_00610DE4: push 00000020h
  loc_00610DE6: mov [edx], ecx
  loc_00610DE8: mov ecx, var_40
  loc_00610DEB: push esi
  loc_00610DEC: mov [edx+00000004h], ecx
  loc_00610DEF: mov ecx, [esi]
  loc_00610DF1: mov [edx+00000008h], eax
  loc_00610DF4: mov eax, var_38
  loc_00610DF7: mov [edx+0000000Ch], eax
  loc_00610DFA: call [ecx+00000344h]
  loc_00610E00: lea edx, var_20
  loc_00610E03: push eax
  loc_00610E04: push edx
  loc_00610E05: call edi
  loc_00610E07: push eax
  loc_00610E08: call [00401160h] ; __vbaLateIdCallSt
  loc_00610E0E: add esp, 0000002Ch
  loc_00610E11: lea ecx, var_20
  loc_00610E14: call [004012B0h] ; __vbaFreeObj
  loc_00610E1A: lea eax, var_44
  loc_00610E1D: lea ecx, var_34
  loc_00610E20: push eax
  loc_00610E21: push ecx
  loc_00610E22: push 00000002h
  loc_00610E24: call [00401038h] ; __vbaFreeVarList
  loc_00610E2A: mov eax, [0061B394h]
  loc_00610E2F: add esp, 0000000Ch
  loc_00610E32: test eax, eax
  loc_00610E34: jnz 00610E46h
  loc_00610E36: push 0061B394h
  loc_00610E3B: push 0041E4A0h
  loc_00610E40: call [004011DCh] ; __vbaNew2
  loc_00610E46: mov ebx, [0061B394h]
  loc_00610E4C: lea eax, var_20
  loc_00610E4F: push eax
  loc_00610E50: push ebx
  loc_00610E51: mov edx, [ebx]
  loc_00610E53: call [edx+00000014h]
  loc_00610E56: test eax, eax
  loc_00610E58: fnclex
  loc_00610E5A: jge 00610E6Bh
  loc_00610E5C: push 00000014h
  loc_00610E5E: push 0041E490h
  loc_00610E63: push ebx
  loc_00610E64: push eax
  loc_00610E65: call [00401074h] ; __vbaHresultCheckObj
  loc_00610E6B: mov eax, var_20
  loc_00610E6E: lea edx, var_1C
  loc_00610E71: push edx
  loc_00610E72: push eax
  loc_00610E73: mov ecx, [eax]
  loc_00610E75: mov ebx, eax
  loc_00610E77: call [ecx+00000050h]
  loc_00610E7A: test eax, eax
  loc_00610E7C: fnclex
  loc_00610E7E: jge 00610E8Fh
  loc_00610E80: push 00000050h
  loc_00610E82: push 0041F3A0h
  loc_00610E87: push ebx
  loc_00610E88: push eax
  loc_00610E89: call [00401074h] ; __vbaHresultCheckObj
  loc_00610E8F: mov eax, var_1C
  loc_00610E92: push eax
  loc_00610E93: push 0042AE6Ch ; "\Reports\Receive1.rpt"
  loc_00610E98: call [00401054h] ; __vbaStrCat
  loc_00610E9E: sub esp, 00000010h
  loc_00610EA1: mov ecx, 00000008h
  loc_00610EA6: mov edx, esp
  loc_00610EA8: mov var_34, ecx
  loc_00610EAB: mov var_2C, eax
  loc_00610EAE: push 00000003h
  loc_00610EB0: mov [edx], ecx
  loc_00610EB2: mov ecx, var_30
  loc_00610EB5: push esi
  loc_00610EB6: mov [edx+00000004h], ecx
  loc_00610EB9: mov ecx, [esi]
  loc_00610EBB: mov [edx+00000008h], eax
  loc_00610EBE: mov eax, var_28
  loc_00610EC1: mov [edx+0000000Ch], eax
  loc_00610EC4: call [ecx+00000344h]
  loc_00610ECA: lea edx, var_24
  loc_00610ECD: push eax
  loc_00610ECE: push edx
  loc_00610ECF: call edi
  loc_00610ED1: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_00610ED7: push eax
  loc_00610ED8: call ebx
  loc_00610EDA: lea ecx, var_1C
  loc_00610EDD: call [004012ACh] ; __vbaFreeStr
  loc_00610EE3: lea eax, var_24
  loc_00610EE6: lea ecx, var_20
  loc_00610EE9: push eax
  loc_00610EEA: push ecx
  loc_00610EEB: push 00000002h
  loc_00610EED: call [00401040h] ; __vbaFreeObjList
  loc_00610EF3: add esp, 0000000Ch
  loc_00610EF6: lea ecx, var_34
  loc_00610EF9: call [00401020h] ; __vbaFreeVar
  loc_00610EFF: sub esp, 00000010h
  loc_00610F02: mov ecx, 00000003h
  loc_00610F07: mov edx, esp
  loc_00610F09: mov var_C4, ecx
  loc_00610F0F: mov eax, 00000002h
  loc_00610F14: push 00000043h
  loc_00610F16: mov [edx], ecx
  loc_00610F18: mov ecx, var_C0
  loc_00610F1E: mov var_BC, eax
  loc_00610F24: push esi
  loc_00610F25: mov [edx+00000004h], ecx
  loc_00610F28: mov ecx, [esi]
  loc_00610F2A: mov [edx+00000008h], eax
  loc_00610F2D: mov eax, var_B8
  loc_00610F33: mov [edx+0000000Ch], eax
  loc_00610F36: call [ecx+00000344h]
  loc_00610F3C: lea edx, var_20
  loc_00610F3F: push eax
  loc_00610F40: push edx
  loc_00610F41: call edi
  loc_00610F43: push eax
  loc_00610F44: call ebx
  loc_00610F46: lea ecx, var_20
  loc_00610F49: call [004012B0h] ; __vbaFreeObj
  loc_00610F4F: sub esp, 00000010h
  loc_00610F52: mov ecx, 00000002h
  loc_00610F57: mov edx, esp
  loc_00610F59: mov var_C4, ecx
  loc_00610F5F: mov eax, 00000001h
  loc_00610F64: push 00000011h
  loc_00610F66: mov [edx], ecx
  loc_00610F68: mov ecx, var_C0
  loc_00610F6E: mov var_BC, eax
  loc_00610F74: push esi
  loc_00610F75: mov [edx+00000004h], ecx
  loc_00610F78: mov ecx, [esi]
  loc_00610F7A: mov [edx+00000008h], eax
  loc_00610F7D: mov eax, var_B8
  loc_00610F83: mov [edx+0000000Ch], eax
  loc_00610F86: call [ecx+00000344h]
  loc_00610F8C: lea edx, var_20
  loc_00610F8F: push eax
  loc_00610F90: push edx
  loc_00610F91: call edi
  loc_00610F93: push eax
  loc_00610F94: call ebx
  loc_00610F96: lea ecx, var_20
  loc_00610F99: call [004012B0h] ; __vbaFreeObj
  loc_00610F9F: mov eax, [esi]
  loc_00610FA1: push 00000001h
  loc_00610FA3: push esi
  loc_00610FA4: call [eax+000000A4h]
  loc_00610FAA: test eax, eax
  loc_00610FAC: fnclex
  loc_00610FAE: jge 00610FC2h
  loc_00610FB0: push 000000A4h
  loc_00610FB5: push 00429704h
  loc_00610FBA: push esi
  loc_00610FBB: push eax
  loc_00610FBC: call [00401074h] ; __vbaHresultCheckObj
  loc_00610FC2: xor edi, edi
  loc_00610FC4: mov var_4, edi
  loc_00610FC7: fwait
  loc_00610FC8: push 00611044h
  loc_00610FCD: jmp 0061103Ah
  loc_00610FCF: mov edi, [004010A0h] ; __vbaObjSet
  loc_00610FD5: jmp 006107CCh
  loc_00610FDA: mov edi, [004010A0h] ; __vbaObjSet
  loc_00610FE0: jmp 006107D2h
  loc_00610FE5: lea ecx, var_1C
  loc_00610FE8: call [004012ACh] ; __vbaFreeStr
  loc_00610FEE: lea ecx, var_24
  loc_00610FF1: lea edx, var_20
  loc_00610FF4: push ecx
  loc_00610FF5: push edx
  loc_00610FF6: push 00000002h
  loc_00610FF8: call [00401040h] ; __vbaFreeObjList
  loc_00610FFE: lea eax, var_B4
  loc_00611004: lea ecx, var_A4
  loc_0061100A: push eax
  loc_0061100B: lea edx, var_94
  loc_00611011: push ecx
  loc_00611012: lea eax, var_84
  loc_00611018: push edx
  loc_00611019: lea ecx, var_74
  loc_0061101C: push eax
  loc_0061101D: lea edx, var_64
  loc_00611020: push ecx
  loc_00611021: lea eax, var_54
  loc_00611024: push edx
  loc_00611025: lea ecx, var_44
  loc_00611028: push eax
  loc_00611029: lea edx, var_34
  loc_0061102C: push ecx
  loc_0061102D: push edx
  loc_0061102E: push 00000009h
  loc_00611030: call [00401038h] ; __vbaFreeVarList
  loc_00611036: add esp, 00000034h
  loc_00611039: ret
  loc_0061103A: lea ecx, var_18
  loc_0061103D: call [004012ACh] ; __vbaFreeStr
  loc_00611043: ret
  loc_00611044: mov eax, Me
  loc_00611047: push eax
  loc_00611048: mov ecx, [eax]
  loc_0061104A: call [ecx+00000008h]
  loc_0061104D: mov eax, var_4
  loc_00611050: mov ecx, var_14
  loc_00611053: pop edi
  loc_00611054: pop esi
  loc_00611055: mov fs:[00000000h], ecx
  loc_0061105C: pop ebx
  loc_0061105D: mov esp, ebp
  loc_0061105F: pop ebp
  loc_00611060: retn 0004h
End Sub

Private Sub chkLanguage_Click() '60E980
  loc_0060E980: push ebp
  loc_0060E981: mov ebp, esp
  loc_0060E983: sub esp, 0000000Ch
  loc_0060E986: push 00403B36h ; __vbaExceptHandler
  loc_0060E98B: mov eax, fs:[00000000h]
  loc_0060E991: push eax
  loc_0060E992: mov fs:[00000000h], esp
  loc_0060E999: sub esp, 0000001Ch
  loc_0060E99C: push ebx
  loc_0060E99D: push esi
  loc_0060E99E: push edi
  loc_0060E99F: mov var_C, esp
  loc_0060E9A2: mov var_8, 004038B8h
  loc_0060E9A9: mov esi, Me
  loc_0060E9AC: mov eax, esi
  loc_0060E9AE: and eax, 00000001h
  loc_0060E9B1: mov var_4, eax
  loc_0060E9B4: and esi, FFFFFFFEh
  loc_0060E9B7: push esi
  loc_0060E9B8: mov Me, esi
  loc_0060E9BB: mov ecx, [esi]
  loc_0060E9BD: call [ecx+00000004h]
  loc_0060E9C0: mov edx, [esi]
  loc_0060E9C2: xor eax, eax
  loc_0060E9C4: push esi
  loc_0060E9C5: mov var_18, eax
  loc_0060E9C8: mov var_1C, eax
  loc_0060E9CB: call [edx+00000304h]
  loc_0060E9D1: mov edi, [004010A0h] ; __vbaObjSet
  loc_0060E9D7: push eax
  loc_0060E9D8: lea eax, var_18
  loc_0060E9DB: push eax
  loc_0060E9DC: call edi
  loc_0060E9DE: mov ebx, eax
  loc_0060E9E0: lea edx, var_1C
  loc_0060E9E3: push edx
  loc_0060E9E4: push ebx
  loc_0060E9E5: mov ecx, [ebx]
  loc_0060E9E7: call [ecx+000000E0h]
  loc_0060E9ED: test eax, eax
  loc_0060E9EF: fnclex
  loc_0060E9F1: jge 0060EA05h
  loc_0060E9F3: push 000000E0h
  loc_0060E9F8: push 004270A8h
  loc_0060E9FD: push ebx
  loc_0060E9FE: push eax
  loc_0060E9FF: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EA05: xor ebx, ebx
  loc_0060EA07: cmp var_1C, 0001h
  loc_0060EA0C: lea ecx, var_18
  loc_0060EA0F: setz bl
  loc_0060EA12: neg ebx
  loc_0060EA14: call [004012B0h] ; __vbaFreeObj
  loc_0060EA1A: mov eax, [esi]
  loc_0060EA1C: push esi
  loc_0060EA1D: test bx, bx
  loc_0060EA20: jz 0060EAD0h
  loc_0060EA26: call [eax+00000304h]
  loc_0060EA2C: lea ecx, var_18
  loc_0060EA2F: push eax
  loc_0060EA30: push ecx
  loc_0060EA31: call edi
  loc_0060EA33: mov ebx, eax
  loc_0060EA35: push 0042B800h ; "M"
  loc_0060EA3A: push ebx
  loc_0060EA3B: mov edx, [ebx]
  loc_0060EA3D: call [edx+00000054h]
  loc_0060EA40: test eax, eax
  loc_0060EA42: fnclex
  loc_0060EA44: jge 0060EA55h
  loc_0060EA46: push 00000054h
  loc_0060EA48: push 004270A8h
  loc_0060EA4D: push ebx
  loc_0060EA4E: push eax
  loc_0060EA4F: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EA55: lea ecx, var_18
  loc_0060EA58: call [004012B0h] ; __vbaFreeObj
  loc_0060EA5E: mov eax, [esi]
  loc_0060EA60: push esi
  loc_0060EA61: call [eax+0000030Ch]
  loc_0060EA67: lea ecx, var_18
  loc_0060EA6A: push eax
  loc_0060EA6B: push ecx
  loc_0060EA6C: call edi
  loc_0060EA6E: mov ebx, eax
  loc_0060EA70: push 00426F2Ch ; "WinHaka"
  loc_0060EA75: push ebx
  loc_0060EA76: mov edx, [ebx]
  loc_0060EA78: call [edx+000000ACh]
  loc_0060EA7E: test eax, eax
  loc_0060EA80: fnclex
  loc_0060EA82: jge 0060EA96h
  loc_0060EA84: push 000000ACh
  loc_0060EA89: push 0041E5E8h
  loc_0060EA8E: push ebx
  loc_0060EA8F: push eax
  loc_0060EA90: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EA96: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0060EA9C: lea ecx, var_18
  loc_0060EA9F: call ebx
  loc_0060EAA1: mov eax, [esi]
  loc_0060EAA3: push esi
  loc_0060EAA4: call [eax+0000030Ch]
  loc_0060EAAA: lea ecx, var_18
  loc_0060EAAD: push eax
  loc_0060EAAE: push ecx
  loc_0060EAAF: call edi
  loc_0060EAB1: mov esi, eax
  loc_0060EAB3: push 41400000h
  loc_0060EAB8: push esi
  loc_0060EAB9: mov edx, [esi]
  loc_0060EABB: call [edx+000000B4h]
  loc_0060EAC1: test eax, eax
  loc_0060EAC3: fnclex
  loc_0060EAC5: jge 0060EB83h
  loc_0060EACB: jmp 0060EB71h
  loc_0060EAD0: call [eax+00000304h]
  loc_0060EAD6: lea ecx, var_18
  loc_0060EAD9: push eax
  loc_0060EADA: push ecx
  loc_0060EADB: call edi
  loc_0060EADD: mov ebx, eax
  loc_0060EADF: push 0042B808h
  loc_0060EAE4: push ebx
  loc_0060EAE5: mov edx, [ebx]
  loc_0060EAE7: call [edx+00000054h]
  loc_0060EAEA: test eax, eax
  loc_0060EAEC: fnclex
  loc_0060EAEE: jge 0060EAFFh
  loc_0060EAF0: push 00000054h
  loc_0060EAF2: push 004270A8h
  loc_0060EAF7: push ebx
  loc_0060EAF8: push eax
  loc_0060EAF9: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EAFF: lea ecx, var_18
  loc_0060EB02: call [004012B0h] ; __vbaFreeObj
  loc_0060EB08: mov eax, [esi]
  loc_0060EB0A: push esi
  loc_0060EB0B: call [eax+0000030Ch]
  loc_0060EB11: lea ecx, var_18
  loc_0060EB14: push eax
  loc_0060EB15: push ecx
  loc_0060EB16: call edi
  loc_0060EB18: mov ebx, eax
  loc_0060EB1A: push 00421668h ; "Arial"
  loc_0060EB1F: push ebx
  loc_0060EB20: mov edx, [ebx]
  loc_0060EB22: call [edx+000000ACh]
  loc_0060EB28: test eax, eax
  loc_0060EB2A: fnclex
  loc_0060EB2C: jge 0060EB40h
  loc_0060EB2E: push 000000ACh
  loc_0060EB33: push 0041E5E8h
  loc_0060EB38: push ebx
  loc_0060EB39: push eax
  loc_0060EB3A: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EB40: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_0060EB46: lea ecx, var_18
  loc_0060EB49: call ebx
  loc_0060EB4B: mov eax, [esi]
  loc_0060EB4D: push esi
  loc_0060EB4E: call [eax+0000030Ch]
  loc_0060EB54: lea ecx, var_18
  loc_0060EB57: push eax
  loc_0060EB58: push ecx
  loc_0060EB59: call edi
  loc_0060EB5B: mov esi, eax
  loc_0060EB5D: push 41000000h
  loc_0060EB62: push esi
  loc_0060EB63: mov edx, [esi]
  loc_0060EB65: call [edx+000000B4h]
  loc_0060EB6B: test eax, eax
  loc_0060EB6D: fnclex
  loc_0060EB6F: jge 0060EB83h
  loc_0060EB71: push 000000B4h
  loc_0060EB76: push 0041E5E8h
  loc_0060EB7B: push esi
  loc_0060EB7C: push eax
  loc_0060EB7D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060EB83: lea ecx, var_18
  loc_0060EB86: call ebx
  loc_0060EB88: mov var_4, 00000000h
  loc_0060EB8F: fwait
  loc_0060EB90: push 0060EBA2h
  loc_0060EB95: jmp 0060EBA1h
  loc_0060EB97: lea ecx, var_18
  loc_0060EB9A: call [004012B0h] ; __vbaFreeObj
  loc_0060EBA0: ret
  loc_0060EBA1: ret
  loc_0060EBA2: mov eax, Me
  loc_0060EBA5: push eax
  loc_0060EBA6: mov ecx, [eax]
  loc_0060EBA8: call [ecx+00000008h]
  loc_0060EBAB: mov eax, var_4
  loc_0060EBAE: mov ecx, var_14
  loc_0060EBB1: pop edi
  loc_0060EBB2: pop esi
  loc_0060EBB3: mov fs:[00000000h], ecx
  loc_0060EBBA: pop ebx
  loc_0060EBBB: mov esp, ebp
  loc_0060EBBD: pop ebp
  loc_0060EBBE: retn 0004h
End Sub

Private Sub txtRemark_KeyPress(KeyAscii As Integer) '614DE0
  loc_00614DE0: push ebp
  loc_00614DE1: mov ebp, esp
  loc_00614DE3: sub esp, 0000000Ch
  loc_00614DE6: push 00403B36h ; __vbaExceptHandler
  loc_00614DEB: mov eax, fs:[00000000h]
  loc_00614DF1: push eax
  loc_00614DF2: mov fs:[00000000h], esp
  loc_00614DF9: sub esp, 00000014h
  loc_00614DFC: push ebx
  loc_00614DFD: push esi
  loc_00614DFE: push edi
  loc_00614DFF: mov var_C, esp
  loc_00614E02: mov var_8, 00403A20h
  loc_00614E09: mov esi, Me
  loc_00614E0C: mov eax, esi
  loc_00614E0E: and eax, 00000001h
  loc_00614E11: mov var_4, eax
  loc_00614E14: and esi, FFFFFFFEh
  loc_00614E17: push esi
  loc_00614E18: mov Me, esi
  loc_00614E1B: mov ecx, [esi]
  loc_00614E1D: call [ecx+00000004h]
  loc_00614E20: mov edx, KeyAscii
  loc_00614E23: xor edi, edi
  loc_00614E25: mov var_18, edi
  loc_00614E28: cmp [edx], 000Dh
  loc_00614E2C: jnz 00614E6Eh
  loc_00614E2E: mov eax, [esi]
  loc_00614E30: push esi
  loc_00614E31: call [eax+0000032Ch]
  loc_00614E37: lea ecx, var_18
  loc_00614E3A: push eax
  loc_00614E3B: push ecx
  loc_00614E3C: call [004010A0h] ; __vbaObjSet
  loc_00614E42: mov esi, eax
  loc_00614E44: push esi
  loc_00614E45: mov edx, [esi]
  loc_00614E47: call [edx+000001A4h]
  loc_00614E4D: cmp eax, edi
  loc_00614E4F: fnclex
  loc_00614E51: jge 00614E65h
  loc_00614E53: push 000001A4h
  loc_00614E58: push 0041EAACh
  loc_00614E5D: push esi
  loc_00614E5E: push eax
  loc_00614E5F: call [00401074h] ; __vbaHresultCheckObj
  loc_00614E65: lea ecx, var_18
  loc_00614E68: call [004012B0h] ; __vbaFreeObj
  loc_00614E6E: mov var_4, edi
  loc_00614E71: push 00614E83h
  loc_00614E76: jmp 00614E82h
  loc_00614E78: lea ecx, var_18
  loc_00614E7B: call [004012B0h] ; __vbaFreeObj
  loc_00614E81: ret
  loc_00614E82: ret
  loc_00614E83: mov eax, Me
  loc_00614E86: push eax
  loc_00614E87: mov ecx, [eax]
  loc_00614E89: call [ecx+00000008h]
  loc_00614E8C: mov eax, var_4
  loc_00614E8F: mov ecx, var_14
  loc_00614E92: pop edi
  loc_00614E93: pop esi
  loc_00614E94: mov fs:[00000000h], ecx
  loc_00614E9B: pop ebx
  loc_00614E9C: mov esp, ebp
  loc_00614E9E: pop ebp
  loc_00614E9F: retn 0008h
End Sub

Private Sub Proc_37_16_60EBD0() '60EBD0
  loc_0060EBD0: push ebp
  loc_0060EBD1: mov ebp, esp
  loc_0060EBD3: sub esp, 00000008h
  loc_0060EBD6: push 00403B36h ; __vbaExceptHandler
  loc_0060EBDB: mov eax, fs:[00000000h]
  loc_0060EBE1: push eax
  loc_0060EBE2: mov fs:[00000000h], esp
  loc_0060EBE9: sub esp, 00000054h
  loc_0060EBEC: push ebx
  loc_0060EBED: push esi
  loc_0060EBEE: push edi
  loc_0060EBEF: mov var_8, esp
  loc_0060EBF2: mov var_4, 004038C8h
  loc_0060EBF9: xor esi, esi
  loc_0060EBFB: mov edx, 0041F3E0h ; "Agent"
  loc_0060EC00: mov ecx, 0061A0A0h
  loc_0060EC05: mov var_14, esi
  loc_0060EC08: mov var_18, esi
  loc_0060EC0B: mov var_28, esi
  loc_0060EC0E: mov var_38, esi
  loc_0060EC11: mov var_48, esi
  loc_0060EC14: mov var_58, esi
  loc_0060EC17: call [004011ECh] ; __vbaStrCopy
  loc_0060EC1D: cmp [0061A11Ch], esi
  loc_0060EC23: jnz 0060EC35h
  loc_0060EC25: push 0061A11Ch
  loc_0060EC2A: push 004069CCh
  loc_0060EC2F: call [004011DCh] ; __vbaNew2
  loc_0060EC35: sub esp, 00000010h
  loc_0060EC38: mov ecx, 0000000Ah
  loc_0060EC3D: mov ebx, esp
  loc_0060EC3F: mov var_58, ecx
  loc_0060EC42: mov eax, 80020004h
  loc_0060EC47: sub esp, 00000010h
  loc_0060EC4A: mov [ebx], ecx
  loc_0060EC4C: mov ecx, var_54
  loc_0060EC4F: mov var_50, eax
  loc_0060EC52: mov esi, [0061A11Ch]
  loc_0060EC58: mov [ebx+00000004h], ecx
  loc_0060EC5B: mov var_48, 00000002h
  loc_0060EC62: mov ecx, esp
  loc_0060EC64: mov edx, 00000001h
  loc_0060EC69: mov [ebx+00000008h], eax
  loc_0060EC6C: mov eax, var_4C
  loc_0060EC6F: mov var_40, edx
  loc_0060EC72: mov edi, [esi]
  loc_0060EC74: mov [ebx+0000000Ch], eax
  loc_0060EC77: mov eax, var_48
  loc_0060EC7A: mov [ecx], eax
  loc_0060EC7C: mov eax, var_44
  loc_0060EC7F: push esi
  loc_0060EC80: mov [ecx+00000004h], eax
  loc_0060EC83: mov [ecx+00000008h], edx
  loc_0060EC86: mov edx, var_3C
  loc_0060EC89: mov [ecx+0000000Ch], edx
  loc_0060EC8C: call [edi+000002B0h]
  loc_0060EC92: test eax, eax
  loc_0060EC94: fnclex
  loc_0060EC96: jge 0060ECAAh
  loc_0060EC98: push 000002B0h
  loc_0060EC9D: push 0041E6D0h
  loc_0060ECA2: push esi
  loc_0060ECA3: push eax
  loc_0060ECA4: call [00401074h] ; __vbaHresultCheckObj
  loc_0060ECAA: mov edi, [004010D4h] ; rtcTrimVar
  loc_0060ECB0: lea eax, var_48
  loc_0060ECB3: lea ecx, var_28
  loc_0060ECB6: mov ebx, 00004008h
  loc_0060ECBB: push eax
  loc_0060ECBC: push ecx
  loc_0060ECBD: mov var_40, 0061A0B8h
  loc_0060ECC4: mov var_48, ebx
  loc_0060ECC7: call edi
  loc_0060ECC9: lea edx, var_28
  loc_0060ECCC: lea eax, var_58
  loc_0060ECCF: push edx
  loc_0060ECD0: push eax
  loc_0060ECD1: mov var_50, 0041E5D4h
  loc_0060ECD8: mov var_58, 00008008h
  loc_0060ECDF: call [00401218h] ; __vbaVarTstNe
  loc_0060ECE5: lea ecx, var_28
  loc_0060ECE8: mov si, ax
  loc_0060ECEB: call [00401020h] ; __vbaFreeVar
  loc_0060ECF1: test si, si
  loc_0060ECF4: jz 0060ED6Eh
  loc_0060ECF6: mov eax, Me
  loc_0060ECF9: push eax
  loc_0060ECFA: mov ecx, [eax]
  loc_0060ECFC: call [ecx+000002FCh]
  loc_0060ED02: lea edx, var_18
  loc_0060ED05: push eax
  loc_0060ED06: push edx
  loc_0060ED07: call [004010A0h] ; __vbaObjSet
  loc_0060ED0D: mov esi, eax
  loc_0060ED0F: lea eax, var_48
  loc_0060ED12: lea ecx, var_28
  loc_0060ED15: push eax
  loc_0060ED16: push ecx
  loc_0060ED17: mov var_40, 0061A0B8h
  loc_0060ED1E: mov var_48, ebx
  loc_0060ED21: call edi
  loc_0060ED23: mov edi, [esi]
  loc_0060ED25: lea edx, var_28
  loc_0060ED28: lea eax, var_14
  loc_0060ED2B: push edx
  loc_0060ED2C: push eax
  loc_0060ED2D: call [004011B0h] ; __vbaStrVarVal
  loc_0060ED33: push eax
  loc_0060ED34: push esi
  loc_0060ED35: call [edi+000000ACh]
  loc_0060ED3B: test eax, eax
  loc_0060ED3D: fnclex
  loc_0060ED3F: jge 0060ED53h
  loc_0060ED41: push 000000ACh
  loc_0060ED46: push 0041F844h
  loc_0060ED4B: push esi
  loc_0060ED4C: push eax
  loc_0060ED4D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060ED53: lea ecx, var_14
  loc_0060ED56: call [004012ACh] ; __vbaFreeStr
  loc_0060ED5C: lea ecx, var_18
  loc_0060ED5F: call [004012B0h] ; __vbaFreeObj
  loc_0060ED65: lea ecx, var_28
  loc_0060ED68: call [00401020h] ; __vbaFreeVar
  loc_0060ED6E: push 0060ED9Ch
  loc_0060ED73: jmp 0060ED9Bh
  loc_0060ED75: lea ecx, var_14
  loc_0060ED78: call [004012ACh] ; __vbaFreeStr
  loc_0060ED7E: lea ecx, var_18
  loc_0060ED81: call [004012B0h] ; __vbaFreeObj
  loc_0060ED87: lea ecx, var_38
  loc_0060ED8A: lea edx, var_28
  loc_0060ED8D: push ecx
  loc_0060ED8E: push edx
  loc_0060ED8F: push 00000002h
  loc_0060ED91: call [00401038h] ; __vbaFreeVarList
  loc_0060ED97: add esp, 0000000Ch
  loc_0060ED9A: ret
  loc_0060ED9B: ret
  loc_0060ED9C: mov ecx, var_10
  loc_0060ED9F: pop edi
  loc_0060EDA0: pop esi
  loc_0060EDA1: xor eax, eax
  loc_0060EDA3: mov fs:[00000000h], ecx
  loc_0060EDAA: pop ebx
  loc_0060EDAB: mov esp, ebp
  loc_0060EDAD: pop ebp
  loc_0060EDAE: retn 0004h
End Sub

Private Sub Proc_37_17_60FBB0() '60FBB0
  loc_0060FBB0: push ebp
  loc_0060FBB1: mov ebp, esp
  loc_0060FBB3: sub esp, 00000008h
  loc_0060FBB6: push 00403B36h ; __vbaExceptHandler
  loc_0060FBBB: mov eax, fs:[00000000h]
  loc_0060FBC1: push eax
  loc_0060FBC2: mov fs:[00000000h], esp
  loc_0060FBC9: sub esp, 00000090h
  loc_0060FBCF: push ebx
  loc_0060FBD0: push esi
  loc_0060FBD1: push edi
  loc_0060FBD2: mov var_8, esp
  loc_0060FBD5: mov var_4, 00403928h
  loc_0060FBDC: lea ebx, var_18
  loc_0060FBDF: mov ecx, 0000000Ah
  loc_0060FBE4: push ebx
  loc_0060FBE5: mov var_60, ecx
  loc_0060FBE8: sub esp, 00000010h
  loc_0060FBEB: mov eax, 80020004h
  loc_0060FBF0: mov ebx, esp
  loc_0060FBF2: mov edx, eax
  loc_0060FBF4: sub esp, 00000010h
  loc_0060FBF7: mov var_58, edx
  loc_0060FBFA: mov [ebx], ecx
  loc_0060FBFC: mov ecx, var_6C
  loc_0060FBFF: mov esi, [0061A13Ch]
  loc_0060FC05: xor edi, edi
  loc_0060FC07: mov [ebx+00000004h], ecx
  loc_0060FC0A: mov ecx, esp
  loc_0060FC0C: sub esp, 00000010h
  loc_0060FC0F: mov var_14, edi
  loc_0060FC12: mov [ebx+00000008h], eax
  loc_0060FC15: mov eax, var_64
  loc_0060FC18: mov var_18, edi
  loc_0060FC1B: mov var_1C, edi
  loc_0060FC1E: mov [ebx+0000000Ch], eax
  loc_0060FC21: mov eax, var_60
  loc_0060FC24: mov [ecx], eax
  loc_0060FC26: mov eax, var_5C
  loc_0060FC29: mov var_20, edi
  loc_0060FC2C: mov var_30, edi
  loc_0060FC2F: mov [ecx+00000004h], eax
  loc_0060FC32: mov eax, 00000003h
  loc_0060FC37: mov var_40, edi
  loc_0060FC3A: mov var_74, edi
  loc_0060FC3D: mov [ecx+00000008h], edx
  loc_0060FC40: mov edx, var_54
  loc_0060FC43: mov var_78, edi
  loc_0060FC46: mov esi, [esi]
  loc_0060FC48: mov [ecx+0000000Ch], edx
  loc_0060FC4B: mov edx, var_4C
  loc_0060FC4E: mov ecx, esp
  loc_0060FC50: push 0042B450h ; "Select * from Receive Order by SrNo Desc"
  loc_0060FC55: mov [ecx], eax
  loc_0060FC57: mov eax, 00000004h
  loc_0060FC5C: mov [ecx+00000004h], edx
  loc_0060FC5F: mov [ecx+00000008h], eax
  loc_0060FC62: mov eax, var_44
  loc_0060FC65: mov [ecx+0000000Ch], eax
  loc_0060FC68: mov ecx, [0061A13Ch]
  loc_0060FC6E: push ecx
  loc_0060FC6F: call [esi+000000BCh]
  loc_0060FC75: cmp eax, edi
  loc_0060FC77: fnclex
  loc_0060FC79: jge 0060FC93h
  loc_0060FC7B: mov edx, [0061A13Ch]
  loc_0060FC81: push 000000BCh
  loc_0060FC86: push 0041E928h
  loc_0060FC8B: push edx
  loc_0060FC8C: push eax
  loc_0060FC8D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060FC93: mov ebx, Me
  loc_0060FC96: mov eax, var_18
  loc_0060FC99: push eax
  loc_0060FC9A: lea esi, [ebx+00000034h]
  loc_0060FC9D: push esi
  loc_0060FC9E: call [004010B8h] ; __vbaObjSetAddref
  loc_0060FCA4: lea ecx, var_18
  loc_0060FCA7: call [004012B0h] ; __vbaFreeObj
  loc_0060FCAD: mov ecx, [ebx]
  loc_0060FCAF: push ebx
  loc_0060FCB0: call [ecx+00000300h]
  loc_0060FCB6: lea edx, var_18
  loc_0060FCB9: push eax
  loc_0060FCBA: push edx
  loc_0060FCBB: call [004010A0h] ; __vbaObjSet
  loc_0060FCC1: mov ebx, [eax]
  loc_0060FCC3: push 00000001h
  loc_0060FCC5: mov var_7C, eax
  loc_0060FCC8: call [00401008h] ; __vbaStrI2
  loc_0060FCCE: mov edx, eax
  loc_0060FCD0: lea ecx, var_14
  loc_0060FCD3: call [00401270h] ; __vbaStrMove
  loc_0060FCD9: mov var_9C, ebx
  loc_0060FCDF: mov ebx, var_7C
  loc_0060FCE2: push eax
  loc_0060FCE3: mov eax, var_9C
  loc_0060FCE9: push ebx
  loc_0060FCEA: call [eax+000000A4h]
  loc_0060FCF0: cmp eax, edi
  loc_0060FCF2: fnclex
  loc_0060FCF4: jge 0060FD0Ch
  loc_0060FCF6: push 000000A4h
  loc_0060FCFB: push 0041E5E8h
  loc_0060FD00: push ebx
  loc_0060FD01: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060FD07: push eax
  loc_0060FD08: call ebx
  loc_0060FD0A: jmp 0060FD12h
  loc_0060FD0C: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060FD12: lea ecx, var_14
  loc_0060FD15: call [004012ACh] ; __vbaFreeStr
  loc_0060FD1B: lea ecx, var_18
  loc_0060FD1E: call [004012B0h] ; __vbaFreeObj
  loc_0060FD24: mov eax, [esi]
  loc_0060FD26: lea edx, var_74
  loc_0060FD29: push edx
  loc_0060FD2A: push eax
  loc_0060FD2B: mov ecx, [eax]
  loc_0060FD2D: call [ecx+00000020h]
  loc_0060FD30: cmp eax, edi
  loc_0060FD32: fnclex
  loc_0060FD34: jge 0060FD43h
  loc_0060FD36: mov ecx, [esi]
  loc_0060FD38: push 00000020h
  loc_0060FD3A: push 0041E938h
  loc_0060FD3F: push ecx
  loc_0060FD40: push eax
  loc_0060FD41: call ebx
  loc_0060FD43: mov eax, [esi]
  loc_0060FD45: lea ecx, var_78
  loc_0060FD48: push ecx
  loc_0060FD49: push eax
  loc_0060FD4A: mov edx, [eax]
  loc_0060FD4C: call [edx+00000034h]
  loc_0060FD4F: cmp eax, edi
  loc_0060FD51: fnclex
  loc_0060FD53: jge 0060FD62h
  loc_0060FD55: mov edx, [esi]
  loc_0060FD57: push 00000034h
  loc_0060FD59: push 0041E938h
  loc_0060FD5E: push edx
  loc_0060FD5F: push eax
  loc_0060FD60: call ebx
  loc_0060FD62: xor eax, eax
  loc_0060FD64: cmp var_78, di
  loc_0060FD68: setz al
  loc_0060FD6B: xor ecx, ecx
  loc_0060FD6D: cmp var_74, di
  loc_0060FD71: setz cl
  loc_0060FD74: or eax, ecx
  loc_0060FD76: jz 0060FEBFh
  loc_0060FD7C: mov eax, Me
  loc_0060FD7F: push eax
  loc_0060FD80: mov edx, [eax]
  loc_0060FD82: call [edx+00000300h]
  loc_0060FD88: push eax
  loc_0060FD89: lea eax, var_20
  loc_0060FD8C: push eax
  loc_0060FD8D: call [004010A0h] ; __vbaObjSet
  loc_0060FD93: mov var_90, eax
  loc_0060FD99: mov eax, [esi]
  loc_0060FD9B: lea edx, var_18
  loc_0060FD9E: mov ecx, [eax]
  loc_0060FDA0: push edx
  loc_0060FDA1: push eax
  loc_0060FDA2: call [ecx+000000B4h]
  loc_0060FDA8: cmp eax, edi
  loc_0060FDAA: fnclex
  loc_0060FDAC: jge 0060FDBEh
  loc_0060FDAE: mov ecx, [esi]
  loc_0060FDB0: push 000000B4h
  loc_0060FDB5: push 0041E938h
  loc_0060FDBA: push ecx
  loc_0060FDBB: push eax
  loc_0060FDBC: call ebx
  loc_0060FDBE: lea ebx, var_1C
  loc_0060FDC1: mov eax, var_18
  loc_0060FDC4: push ebx
  loc_0060FDC5: mov ecx, 00000008h
  loc_0060FDCA: sub esp, 00000010h
  loc_0060FDCD: mov edx, [eax]
  loc_0060FDCF: mov ebx, esp
  loc_0060FDD1: mov var_80, eax
  loc_0060FDD4: push eax
  loc_0060FDD5: mov [ebx], ecx
  loc_0060FDD7: mov ecx, var_4C
  loc_0060FDDA: mov [ebx+00000004h], ecx
  loc_0060FDDD: mov ecx, 0041EDD8h ; "SrNo"
  loc_0060FDE2: mov [ebx+00000008h], ecx
  loc_0060FDE5: mov ecx, var_44
  loc_0060FDE8: mov [ebx+0000000Ch], ecx
  loc_0060FDEB: call [edx+00000030h]
  loc_0060FDEE: cmp eax, edi
  loc_0060FDF0: fnclex
  loc_0060FDF2: jge 0060FE06h
  loc_0060FDF4: mov edx, var_80
  loc_0060FDF7: push 00000030h
  loc_0060FDF9: push 0041EA14h ; "S"
  loc_0060FDFE: push edx
  loc_0060FDFF: push eax
  loc_0060FE00: call [00401074h] ; __vbaHresultCheckObj
  loc_0060FE06: mov eax, var_1C
  loc_0060FE09: lea edx, var_30
  loc_0060FE0C: push edx
  loc_0060FE0D: push eax
  loc_0060FE0E: mov ecx, [eax]
  loc_0060FE10: mov ebx, eax
  loc_0060FE12: call [ecx+00000044h]
  loc_0060FE15: cmp eax, edi
  loc_0060FE17: fnclex
  loc_0060FE19: jge 0060FE2Ah
  loc_0060FE1B: push 00000044h
  loc_0060FE1D: push 0041EA48h
  loc_0060FE22: push ebx
  loc_0060FE23: push eax
  loc_0060FE24: call [00401074h] ; __vbaHresultCheckObj
  loc_0060FE2A: mov eax, var_90
  loc_0060FE30: mov var_58, 00000001h
  loc_0060FE37: mov var_60, 00000002h
  loc_0060FE3E: lea ecx, var_30
  loc_0060FE41: mov ebx, [eax]
  loc_0060FE43: lea edx, var_60
  loc_0060FE46: push ecx
  loc_0060FE47: lea eax, var_40
  loc_0060FE4A: push edx
  loc_0060FE4B: push eax
  loc_0060FE4C: call [00401234h] ; __vbaVarAdd
  loc_0060FE52: lea ecx, var_14
  loc_0060FE55: push eax
  loc_0060FE56: push ecx
  loc_0060FE57: call [004011B0h] ; __vbaStrVarVal
  loc_0060FE5D: mov edx, ebx
  loc_0060FE5F: mov ebx, var_90
  loc_0060FE65: push eax
  loc_0060FE66: push ebx
  loc_0060FE67: call [edx+000000A4h]
  loc_0060FE6D: cmp eax, edi
  loc_0060FE6F: fnclex
  loc_0060FE71: jge 0060FE89h
  loc_0060FE73: push 000000A4h
  loc_0060FE78: push 0041E5E8h
  loc_0060FE7D: push ebx
  loc_0060FE7E: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060FE84: push eax
  loc_0060FE85: call ebx
  loc_0060FE87: jmp 0060FE8Fh
  loc_0060FE89: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_0060FE8F: lea ecx, var_14
  loc_0060FE92: call [004012ACh] ; __vbaFreeStr
  loc_0060FE98: lea eax, var_20
  loc_0060FE9B: lea ecx, var_1C
  loc_0060FE9E: push eax
  loc_0060FE9F: lea edx, var_18
  loc_0060FEA2: push ecx
  loc_0060FEA3: push edx
  loc_0060FEA4: push 00000003h
  loc_0060FEA6: call [00401040h] ; __vbaFreeObjList
  loc_0060FEAC: lea eax, var_40
  loc_0060FEAF: lea ecx, var_30
  loc_0060FEB2: push eax
  loc_0060FEB3: push ecx
  loc_0060FEB4: push 00000002h
  loc_0060FEB6: call [00401038h] ; __vbaFreeVarList
  loc_0060FEBC: add esp, 0000001Ch
  loc_0060FEBF: mov eax, [esi]
  loc_0060FEC1: push eax
  loc_0060FEC2: mov edx, [eax]
  loc_0060FEC4: call [edx+000000C4h]
  loc_0060FECA: cmp eax, edi
  loc_0060FECC: fnclex
  loc_0060FECE: jge 0060FEE0h
  loc_0060FED0: mov ecx, [esi]
  loc_0060FED2: push 000000C4h
  loc_0060FED7: push 0041E938h
  loc_0060FEDC: push ecx
  loc_0060FEDD: push eax
  loc_0060FEDE: call ebx
  loc_0060FEE0: push 0041E938h
  loc_0060FEE5: push edi
  loc_0060FEE6: call [00401274h] ; __vbaCastObj
  loc_0060FEEC: lea edx, var_18
  loc_0060FEEF: push eax
  loc_0060FEF0: push edx
  loc_0060FEF1: call [004010A0h] ; __vbaObjSet
  loc_0060FEF7: push eax
  loc_0060FEF8: push esi
  loc_0060FEF9: call [004010B8h] ; __vbaObjSetAddref
  loc_0060FEFF: lea ecx, var_18
  loc_0060FF02: call [004012B0h] ; __vbaFreeObj
  loc_0060FF08: push 0060FF41h
  loc_0060FF0D: jmp 0060FF40h
  loc_0060FF0F: lea ecx, var_14
  loc_0060FF12: call [004012ACh] ; __vbaFreeStr
  loc_0060FF18: lea eax, var_20
  loc_0060FF1B: lea ecx, var_1C
  loc_0060FF1E: push eax
  loc_0060FF1F: lea edx, var_18
  loc_0060FF22: push ecx
  loc_0060FF23: push edx
  loc_0060FF24: push 00000003h
  loc_0060FF26: call [00401040h] ; __vbaFreeObjList
  loc_0060FF2C: lea eax, var_40
  loc_0060FF2F: lea ecx, var_30
  loc_0060FF32: push eax
  loc_0060FF33: push ecx
  loc_0060FF34: push 00000002h
  loc_0060FF36: call [00401038h] ; __vbaFreeVarList
  loc_0060FF3C: add esp, 0000001Ch
  loc_0060FF3F: ret
  loc_0060FF40: ret
  loc_0060FF41: mov ecx, var_10
  loc_0060FF44: pop edi
  loc_0060FF45: pop esi
  loc_0060FF46: xor eax, eax
  loc_0060FF48: mov fs:[00000000h], ecx
  loc_0060FF4F: pop ebx
  loc_0060FF50: mov esp, ebp
  loc_0060FF52: pop ebp
  loc_0060FF53: retn 0004h
End Sub

Private Sub Proc_37_18_6113E0() '6113E0
  loc_006113E0: push ebp
  loc_006113E1: mov ebp, esp
  loc_006113E3: sub esp, 00000008h
  loc_006113E6: push 00403B36h ; __vbaExceptHandler
  loc_006113EB: mov eax, fs:[00000000h]
  loc_006113F1: push eax
  loc_006113F2: mov fs:[00000000h], esp
  loc_006113F9: sub esp, 00000080h
  loc_006113FF: push ebx
  loc_00611400: push esi
  loc_00611401: push edi
  loc_00611402: mov var_8, esp
  loc_00611405: mov var_4, 00403970h
  loc_0061140C: lea ebx, var_18
  loc_0061140F: mov ecx, 0000000Ah
  loc_00611414: push ebx
  loc_00611415: mov esi, ecx
  loc_00611417: sub esp, 00000010h
  loc_0061141A: xor eax, eax
  loc_0061141C: mov ebx, esp
  loc_0061141E: mov var_14, eax
  loc_00611421: mov var_18, eax
  loc_00611424: mov var_1C, eax
  loc_00611427: mov [ebx], ecx
  loc_00611429: mov ecx, var_6C
  loc_0061142C: mov var_20, eax
  loc_0061142F: mov var_30, eax
  loc_00611432: mov var_40, eax
  loc_00611435: mov var_74, eax
  loc_00611438: mov [ebx+00000004h], ecx
  loc_0061143B: mov eax, 80020004h
  loc_00611440: sub esp, 00000010h
  loc_00611443: mov edx, eax
  loc_00611445: mov [ebx+00000008h], eax
  loc_00611448: mov eax, var_64
  loc_0061144B: mov ecx, esp
  loc_0061144D: sub esp, 00000010h
  loc_00611450: mov [ebx+0000000Ch], eax
  loc_00611453: mov eax, var_5C
  loc_00611456: mov [ecx], esi
  loc_00611458: mov edi, [0061A13Ch]
  loc_0061145E: mov [ecx+00000004h], eax
  loc_00611461: mov eax, 00000003h
  loc_00611466: mov edi, [edi]
  loc_00611468: mov [ecx+00000008h], edx
  loc_0061146B: mov edx, var_54
  loc_0061146E: mov [ecx+0000000Ch], edx
  loc_00611471: mov edx, var_4C
  loc_00611474: mov ecx, esp
  loc_00611476: push 0042AE9Ch ; "Select * From  AgentThai ORder by AgentName"
  loc_0061147B: mov [ecx], eax
  loc_0061147D: mov eax, 00000004h
  loc_00611482: mov [ecx+00000004h], edx
  loc_00611485: mov [ecx+00000008h], eax
  loc_00611488: mov eax, var_44
  loc_0061148B: mov [ecx+0000000Ch], eax
  loc_0061148E: mov ecx, [0061A13Ch]
  loc_00611494: push ecx
  loc_00611495: call [edi+000000BCh]
  loc_0061149B: test eax, eax
  loc_0061149D: fnclex
  loc_0061149F: jge 006114BDh
  loc_006114A1: mov edx, [0061A13Ch]
  loc_006114A7: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_006114AD: push 000000BCh
  loc_006114B2: push 0041E928h
  loc_006114B7: push edx
  loc_006114B8: push eax
  loc_006114B9: call ebx
  loc_006114BB: jmp 006114C3h
  loc_006114BD: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_006114C3: mov eax, Me
  loc_006114C6: mov ecx, var_18
  loc_006114C9: push ecx
  loc_006114CA: lea esi, [eax+00000034h]
  loc_006114CD: push esi
  loc_006114CE: call [004010B8h] ; __vbaObjSetAddref
  loc_006114D4: lea ecx, var_18
  loc_006114D7: call [004012B0h] ; __vbaFreeObj
  loc_006114DD: mov eax, [esi]
  loc_006114DF: lea ecx, var_74
  loc_006114E2: push ecx
  loc_006114E3: push eax
  loc_006114E4: mov edx, [eax]
  loc_006114E6: call [edx+00000034h]
  loc_006114E9: test eax, eax
  loc_006114EB: fnclex
  loc_006114ED: jge 006114FCh
  loc_006114EF: mov edx, [esi]
  loc_006114F1: push 00000034h
  loc_006114F3: push 0041E938h
  loc_006114F8: push edx
  loc_006114F9: push eax
  loc_006114FA: call ebx
  loc_006114FC: cmp var_74, 0000h
  loc_00611501: jnz 0061165Fh
  loc_00611507: mov eax, Me
  loc_0061150A: push eax
  loc_0061150B: mov ecx, [eax]
  loc_0061150D: call [ecx+000002FCh]
  loc_00611513: lea edx, var_20
  loc_00611516: push eax
  loc_00611517: push edx
  loc_00611518: call [004010A0h] ; __vbaObjSet
  loc_0061151E: mov edi, eax
  loc_00611520: mov eax, [esi]
  loc_00611522: lea edx, var_18
  loc_00611525: mov ecx, [eax]
  loc_00611527: push edx
  loc_00611528: push eax
  loc_00611529: call [ecx+000000B4h]
  loc_0061152F: test eax, eax
  loc_00611531: fnclex
  loc_00611533: jge 00611545h
  loc_00611535: mov ecx, [esi]
  loc_00611537: push 000000B4h
  loc_0061153C: push 0041E938h
  loc_00611541: push ecx
  loc_00611542: push eax
  loc_00611543: call ebx
  loc_00611545: lea ebx, var_1C
  loc_00611548: mov eax, var_18
  loc_0061154B: push ebx
  loc_0061154C: mov ecx, 00000008h
  loc_00611551: sub esp, 00000010h
  loc_00611554: mov edx, [eax]
  loc_00611556: mov ebx, esp
  loc_00611558: mov var_7C, eax
  loc_0061155B: push eax
  loc_0061155C: mov [ebx], ecx
  loc_0061155E: mov ecx, var_4C
  loc_00611561: mov [ebx+00000004h], ecx
  loc_00611564: mov ecx, 0041EB18h ; "AgentName"
  loc_00611569: mov [ebx+00000008h], ecx
  loc_0061156C: mov ecx, var_44
  loc_0061156F: mov [ebx+0000000Ch], ecx
  loc_00611572: call [edx+00000030h]
  loc_00611575: test eax, eax
  loc_00611577: fnclex
  loc_00611579: jge 0061158Dh
  loc_0061157B: mov edx, var_7C
  loc_0061157E: push 00000030h
  loc_00611580: push 0041EA14h ; "S"
  loc_00611585: push edx
  loc_00611586: push eax
  loc_00611587: call [00401074h] ; __vbaHresultCheckObj
  loc_0061158D: mov eax, var_1C
  loc_00611590: lea ecx, var_40
  loc_00611593: mov var_28, eax
  loc_00611596: lea eax, var_30
  loc_00611599: push eax
  loc_0061159A: push ecx
  loc_0061159B: mov var_1C, 00000000h
  loc_006115A2: mov var_30, 00000009h
  loc_006115A9: call [004010D4h] ; rtcTrimVar
  loc_006115AF: sub esp, 00000010h
  loc_006115B2: mov eax, 0000000Ah
  loc_006115B7: mov edx, esp
  loc_006115B9: mov ecx, var_54
  loc_006115BC: mov ebx, [edi]
  loc_006115BE: mov [edx], eax
  loc_006115C0: mov eax, var_5C
  loc_006115C3: mov [edx+00000004h], eax
  loc_006115C6: mov eax, 80020004h
  loc_006115CB: mov [edx+00000008h], eax
  loc_006115CE: lea eax, var_14
  loc_006115D1: mov [edx+0000000Ch], ecx
  loc_006115D4: lea edx, var_40
  loc_006115D7: push edx
  loc_006115D8: push eax
  loc_006115D9: call [004011B0h] ; __vbaStrVarVal
  loc_006115DF: push eax
  loc_006115E0: push edi
  loc_006115E1: call [ebx+000001ECh]
  loc_006115E7: test eax, eax
  loc_006115E9: fnclex
  loc_006115EB: jge 00611603h
  loc_006115ED: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_006115F3: push 000001ECh
  loc_006115F8: push 0041F844h
  loc_006115FD: push edi
  loc_006115FE: push eax
  loc_006115FF: call ebx
  loc_00611601: jmp 00611609h
  loc_00611603: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00611609: lea ecx, var_14
  loc_0061160C: call [004012ACh] ; __vbaFreeStr
  loc_00611612: lea ecx, var_20
  loc_00611615: lea edx, var_18
  loc_00611618: push ecx
  loc_00611619: push edx
  loc_0061161A: push 00000002h
  loc_0061161C: call [00401040h] ; __vbaFreeObjList
  loc_00611622: lea eax, var_40
  loc_00611625: lea ecx, var_30
  loc_00611628: push eax
  loc_00611629: push ecx
  loc_0061162A: push 00000002h
  loc_0061162C: call [00401038h] ; __vbaFreeVarList
  loc_00611632: mov eax, [esi]
  loc_00611634: add esp, 00000018h
  loc_00611637: mov edx, [eax]
  loc_00611639: push eax
  loc_0061163A: call [edx+000000ECh]
  loc_00611640: test eax, eax
  loc_00611642: fnclex
  loc_00611644: jge 006114DDh
  loc_0061164A: mov ecx, [esi]
  loc_0061164C: push 000000ECh
  loc_00611651: push 0041E938h
  loc_00611656: push ecx
  loc_00611657: push eax
  loc_00611658: call ebx
  loc_0061165A: jmp 006114DDh
  loc_0061165F: mov eax, [esi]
  loc_00611661: push eax
  loc_00611662: mov edx, [eax]
  loc_00611664: call [edx+000000C4h]
  loc_0061166A: test eax, eax
  loc_0061166C: fnclex
  loc_0061166E: jge 00611680h
  loc_00611670: mov ecx, [esi]
  loc_00611672: push 000000C4h
  loc_00611677: push 0041E938h
  loc_0061167C: push ecx
  loc_0061167D: push eax
  loc_0061167E: call ebx
  loc_00611680: push 0041E938h
  loc_00611685: push 00000000h
  loc_00611687: call [00401274h] ; __vbaCastObj
  loc_0061168D: lea edx, var_18
  loc_00611690: push eax
  loc_00611691: push edx
  loc_00611692: call [004010A0h] ; __vbaObjSet
  loc_00611698: push eax
  loc_00611699: push esi
  loc_0061169A: call [004010B8h] ; __vbaObjSetAddref
  loc_006116A0: lea ecx, var_18
  loc_006116A3: call [004012B0h] ; __vbaFreeObj
  loc_006116A9: push 006116E2h
  loc_006116AE: jmp 006116E1h
  loc_006116B0: lea ecx, var_14
  loc_006116B3: call [004012ACh] ; __vbaFreeStr
  loc_006116B9: lea eax, var_20
  loc_006116BC: lea ecx, var_1C
  loc_006116BF: push eax
  loc_006116C0: lea edx, var_18
  loc_006116C3: push ecx
  loc_006116C4: push edx
  loc_006116C5: push 00000003h
  loc_006116C7: call [00401040h] ; __vbaFreeObjList
  loc_006116CD: lea eax, var_40
  loc_006116D0: lea ecx, var_30
  loc_006116D3: push eax
  loc_006116D4: push ecx
  loc_006116D5: push 00000002h
  loc_006116D7: call [00401038h] ; __vbaFreeVarList
  loc_006116DD: add esp, 0000001Ch
  loc_006116E0: ret
  loc_006116E1: ret
  loc_006116E2: mov ecx, var_10
  loc_006116E5: pop edi
  loc_006116E6: pop esi
  loc_006116E7: xor eax, eax
  loc_006116E9: mov fs:[00000000h], ecx
  loc_006116F0: pop ebx
  loc_006116F1: mov esp, ebp
  loc_006116F3: pop ebp
  loc_006116F4: retn 0004h
End Sub

Private Sub Proc_37_19_611920(arg_C, arg_10) '611920
  loc_00611920: push ebp
  loc_00611921: mov ebp, esp
  loc_00611923: sub esp, 0000000Ch
  loc_00611926: push 00403B36h ; __vbaExceptHandler
  loc_0061192B: mov eax, fs:[00000000h]
  loc_00611931: push eax
  loc_00611932: mov fs:[00000000h], esp
  loc_00611939: sub esp, 00000024h
  loc_0061193C: push ebx
  loc_0061193D: push esi
  loc_0061193E: push edi
  loc_0061193F: mov var_C, esp
  loc_00611942: mov var_8, 00403990h
  loc_00611949: mov ecx, arg_10
  loc_0061194C: mov esi, Me
  loc_0061194F: xor eax, eax
  loc_00611951: push esi
  loc_00611952: mov [ecx], eax
  loc_00611954: mov edx, [esi]
  loc_00611956: mov var_24, eax
  loc_00611959: mov var_28, eax
  loc_0061195C: call [edx+0000032Ch]
  loc_00611962: mov edi, [004010A0h] ; __vbaObjSet
  loc_00611968: push eax
  loc_00611969: lea eax, var_28
  loc_0061196C: push eax
  loc_0061196D: call edi
  loc_0061196F: mov ebx, arg_C
  loc_00611972: mov ecx, [eax]
  loc_00611974: mov var_2C, eax
  loc_00611977: mov dx, [ebx]
  loc_0061197A: not dx
  loc_0061197D: push edx
  loc_0061197E: push eax
  loc_0061197F: call [ecx+00000094h]
  loc_00611985: test eax, eax
  loc_00611987: fnclex
  loc_00611989: jge 006119A0h
  loc_0061198B: mov ecx, var_2C
  loc_0061198E: push 00000094h
  loc_00611993: push 0041EAACh
  loc_00611998: push ecx
  loc_00611999: push eax
  loc_0061199A: call [00401074h] ; __vbaHresultCheckObj
  loc_006119A0: lea ecx, var_28
  loc_006119A3: call [004012B0h] ; __vbaFreeObj
  loc_006119A9: mov edx, [esi]
  loc_006119AB: push esi
  loc_006119AC: call [edx+00000328h]
  loc_006119B2: push eax
  loc_006119B3: lea eax, var_28
  loc_006119B6: push eax
  loc_006119B7: call edi
  loc_006119B9: mov dx, [ebx]
  loc_006119BC: mov ecx, [eax]
  loc_006119BE: not dx
  loc_006119C1: push edx
  loc_006119C2: push eax
  loc_006119C3: mov var_2C, eax
  loc_006119C6: call [ecx+00000094h]
  loc_006119CC: test eax, eax
  loc_006119CE: fnclex
  loc_006119D0: jge 006119E7h
  loc_006119D2: mov ecx, var_2C
  loc_006119D5: push 00000094h
  loc_006119DA: push 0041EAACh
  loc_006119DF: push ecx
  loc_006119E0: push eax
  loc_006119E1: call [00401074h] ; __vbaHresultCheckObj
  loc_006119E7: lea ecx, var_28
  loc_006119EA: call [004012B0h] ; __vbaFreeObj
  loc_006119F0: mov edx, [esi]
  loc_006119F2: push esi
  loc_006119F3: call [edx+00000314h]
  loc_006119F9: push eax
  loc_006119FA: lea eax, var_28
  loc_006119FD: push eax
  loc_006119FE: call edi
  loc_00611A00: mov dx, [ebx]
  loc_00611A03: mov ecx, [eax]
  loc_00611A05: push edx
  loc_00611A06: push eax
  loc_00611A07: mov var_2C, eax
  loc_00611A0A: call [ecx+00000094h]
  loc_00611A10: test eax, eax
  loc_00611A12: fnclex
  loc_00611A14: jge 00611A2Bh
  loc_00611A16: mov ecx, var_2C
  loc_00611A19: push 00000094h
  loc_00611A1E: push 0041EAACh
  loc_00611A23: push ecx
  loc_00611A24: push eax
  loc_00611A25: call [00401074h] ; __vbaHresultCheckObj
  loc_00611A2B: lea ecx, var_28
  loc_00611A2E: call [004012B0h] ; __vbaFreeObj
  loc_00611A34: mov edx, [esi]
  loc_00611A36: push esi
  loc_00611A37: call [edx+00000320h]
  loc_00611A3D: push eax
  loc_00611A3E: lea eax, var_28
  loc_00611A41: push eax
  loc_00611A42: call edi
  loc_00611A44: mov dx, [ebx]
  loc_00611A47: mov ecx, [eax]
  loc_00611A49: push edx
  loc_00611A4A: push eax
  loc_00611A4B: mov var_2C, eax
  loc_00611A4E: call [ecx+00000094h]
  loc_00611A54: test eax, eax
  loc_00611A56: fnclex
  loc_00611A58: jge 00611A6Fh
  loc_00611A5A: mov ecx, var_2C
  loc_00611A5D: push 00000094h
  loc_00611A62: push 0041EAACh
  loc_00611A67: push ecx
  loc_00611A68: push eax
  loc_00611A69: call [00401074h] ; __vbaHresultCheckObj
  loc_00611A6F: lea ecx, var_28
  loc_00611A72: call [004012B0h] ; __vbaFreeObj
  loc_00611A78: mov edx, [esi]
  loc_00611A7A: push esi
  loc_00611A7B: call [edx+00000310h]
  loc_00611A81: push eax
  loc_00611A82: lea eax, var_28
  loc_00611A85: push eax
  loc_00611A86: call edi
  loc_00611A88: mov dx, [ebx]
  loc_00611A8B: mov ecx, [eax]
  loc_00611A8D: push edx
  loc_00611A8E: push eax
  loc_00611A8F: mov var_2C, eax
  loc_00611A92: call [ecx+00000094h]
  loc_00611A98: test eax, eax
  loc_00611A9A: fnclex
  loc_00611A9C: jge 00611AB3h
  loc_00611A9E: mov ecx, var_2C
  loc_00611AA1: push 00000094h
  loc_00611AA6: push 0041EAACh
  loc_00611AAB: push ecx
  loc_00611AAC: push eax
  loc_00611AAD: call [00401074h] ; __vbaHresultCheckObj
  loc_00611AB3: lea ecx, var_28
  loc_00611AB6: call [004012B0h] ; __vbaFreeObj
  loc_00611ABC: mov edx, [esi]
  loc_00611ABE: push esi
  loc_00611ABF: call [edx+00000324h]
  loc_00611AC5: push eax
  loc_00611AC6: lea eax, var_28
  loc_00611AC9: push eax
  loc_00611ACA: call edi
  loc_00611ACC: mov dx, [ebx]
  loc_00611ACF: mov ecx, [eax]
  loc_00611AD1: push edx
  loc_00611AD2: push eax
  loc_00611AD3: mov var_2C, eax
  loc_00611AD6: call [ecx+00000094h]
  loc_00611ADC: test eax, eax
  loc_00611ADE: fnclex
  loc_00611AE0: jge 00611AF7h
  loc_00611AE2: mov ecx, var_2C
  loc_00611AE5: push 00000094h
  loc_00611AEA: push 0041EAACh
  loc_00611AEF: push ecx
  loc_00611AF0: push eax
  loc_00611AF1: call [00401074h] ; __vbaHresultCheckObj
  loc_00611AF7: lea ecx, var_28
  loc_00611AFA: call [004012B0h] ; __vbaFreeObj
  loc_00611B00: mov edx, [esi]
  loc_00611B02: push esi
  loc_00611B03: call [edx+0000031Ch]
  loc_00611B09: push eax
  loc_00611B0A: lea eax, var_28
  loc_00611B0D: push eax
  loc_00611B0E: call edi
  loc_00611B10: mov dx, [ebx]
  loc_00611B13: mov ecx, [eax]
  loc_00611B15: push edx
  loc_00611B16: push eax
  loc_00611B17: mov var_2C, eax
  loc_00611B1A: call [ecx+00000094h]
  loc_00611B20: test eax, eax
  loc_00611B22: fnclex
  loc_00611B24: jge 00611B3Bh
  loc_00611B26: mov ecx, var_2C
  loc_00611B29: push 00000094h
  loc_00611B2E: push 0041EAACh
  loc_00611B33: push ecx
  loc_00611B34: push eax
  loc_00611B35: call [00401074h] ; __vbaHresultCheckObj
  loc_00611B3B: lea ecx, var_28
  loc_00611B3E: call [004012B0h] ; __vbaFreeObj
  loc_00611B44: mov edx, [esi]
  loc_00611B46: push esi
  loc_00611B47: call [edx+00000318h]
  loc_00611B4D: push eax
  loc_00611B4E: lea eax, var_28
  loc_00611B51: push eax
  loc_00611B52: call edi
  loc_00611B54: mov dx, [ebx]
  loc_00611B57: mov esi, eax
  loc_00611B59: push edx
  loc_00611B5A: push esi
  loc_00611B5B: mov ecx, [esi]
  loc_00611B5D: call [ecx+00000094h]
  loc_00611B63: test eax, eax
  loc_00611B65: fnclex
  loc_00611B67: jge 00611B7Bh
  loc_00611B69: push 00000094h
  loc_00611B6E: push 0041EAACh
  loc_00611B73: push esi
  loc_00611B74: push eax
  loc_00611B75: call [00401074h] ; __vbaHresultCheckObj
  loc_00611B7B: lea ecx, var_28
  loc_00611B7E: call [004012B0h] ; __vbaFreeObj
  loc_00611B84: push 00611BA5h
  loc_00611B89: jmp 00611BA4h
  loc_00611B8B: test var_4, 04h
  loc_00611B8F: jz 00611B9Ah
  loc_00611B91: lea ecx, var_24
  loc_00611B94: call [00401020h] ; __vbaFreeVar
  loc_00611B9A: lea ecx, var_28
  loc_00611B9D: call [004012B0h] ; __vbaFreeObj
  loc_00611BA3: ret
  loc_00611BA4: ret
  loc_00611BA5: mov eax, arg_10
  loc_00611BA8: mov ecx, var_24
  loc_00611BAB: mov edx, var_20
  loc_00611BAE: pop edi
  loc_00611BAF: mov [eax], ecx
  loc_00611BB1: mov ecx, var_1C
  loc_00611BB4: pop esi
  loc_00611BB5: pop ebx
  loc_00611BB6: mov [eax+00000004h], edx
  loc_00611BB9: mov edx, var_18
  loc_00611BBC: mov [eax+00000008h], ecx
  loc_00611BBF: mov ecx, var_14
  loc_00611BC2: mov [eax+0000000Ch], edx
  loc_00611BC5: xor eax, eax
  loc_00611BC7: mov fs:[00000000h], ecx
  loc_00611BCE: mov esp, ebp
  loc_00611BD0: pop ebp
  loc_00611BD1: retn 000Ch
End Sub

Private Sub Proc_37_20_611BE0(arg_C) '611BE0
  loc_00611BE0: push ebp
  loc_00611BE1: mov ebp, esp
  loc_00611BE3: sub esp, 00000008h
  loc_00611BE6: push 00403B36h ; __vbaExceptHandler
  loc_00611BEB: mov eax, fs:[00000000h]
  loc_00611BF1: push eax
  loc_00611BF2: mov fs:[00000000h], esp
  loc_00611BF9: sub esp, 00000020h
  loc_00611BFC: push ebx
  loc_00611BFD: push esi
  loc_00611BFE: push edi
  loc_00611BFF: mov var_8, esp
  loc_00611C02: mov var_4, 004039A0h
  loc_00611C09: mov esi, Me
  loc_00611C0C: mov var_14, 00000000h
  loc_00611C13: push esi
  loc_00611C14: mov eax, [esi]
  loc_00611C16: call [eax+00000300h]
  loc_00611C1C: mov edi, [004010A0h] ; __vbaObjSet
  loc_00611C22: lea ecx, var_14
  loc_00611C25: push eax
  loc_00611C26: push ecx
  loc_00611C27: call edi
  loc_00611C29: mov ebx, arg_C
  loc_00611C2C: mov edx, [eax]
  loc_00611C2E: mov var_28, eax
  loc_00611C31: mov cx, [ebx]
  loc_00611C34: push ecx
  loc_00611C35: push eax
  loc_00611C36: call [edx+0000008Ch]
  loc_00611C3C: test eax, eax
  loc_00611C3E: fnclex
  loc_00611C40: jge 00611C57h
  loc_00611C42: mov edx, var_28
  loc_00611C45: push 0000008Ch
  loc_00611C4A: push 0041E5E8h
  loc_00611C4F: push edx
  loc_00611C50: push eax
  loc_00611C51: call [00401074h] ; __vbaHresultCheckObj
  loc_00611C57: lea ecx, var_14
  loc_00611C5A: call [004012B0h] ; __vbaFreeObj
  loc_00611C60: mov eax, [esi]
  loc_00611C62: push esi
  loc_00611C63: call [eax+000002FCh]
  loc_00611C69: lea ecx, var_14
  loc_00611C6C: push eax
  loc_00611C6D: push ecx
  loc_00611C6E: call edi
  loc_00611C70: mov cx, [ebx]
  loc_00611C73: mov edx, [eax]
  loc_00611C75: push ecx
  loc_00611C76: push eax
  loc_00611C77: mov var_28, eax
  loc_00611C7A: call [edx+00000094h]
  loc_00611C80: test eax, eax
  loc_00611C82: fnclex
  loc_00611C84: jge 00611C9Bh
  loc_00611C86: mov edx, var_28
  loc_00611C89: push 00000094h
  loc_00611C8E: push 0041F844h
  loc_00611C93: push edx
  loc_00611C94: push eax
  loc_00611C95: call [00401074h] ; __vbaHresultCheckObj
  loc_00611C9B: lea ecx, var_14
  loc_00611C9E: call [004012B0h] ; __vbaFreeObj
  loc_00611CA4: mov edx, var_20
  loc_00611CA7: sub esp, 00000010h
  loc_00611CAA: mov ecx, esp
  loc_00611CAC: mov eax, 0000400Bh
  loc_00611CB1: push 8001000Dh
  loc_00611CB6: push esi
  loc_00611CB7: mov [ecx], eax
  loc_00611CB9: mov eax, var_18
  loc_00611CBC: mov [ecx+00000004h], edx
  loc_00611CBF: mov [ecx+00000008h], ebx
  loc_00611CC2: mov [ecx+0000000Ch], eax
  loc_00611CC5: mov ecx, [esi]
  loc_00611CC7: call [ecx+00000348h]
  loc_00611CCD: lea edx, var_14
  loc_00611CD0: push eax
  loc_00611CD1: push edx
  loc_00611CD2: call edi
  loc_00611CD4: push eax
  loc_00611CD5: call [00401288h] ; __vbaLateIdSt
  loc_00611CDB: lea ecx, var_14
  loc_00611CDE: call [004012B0h] ; __vbaFreeObj
  loc_00611CE4: mov eax, [esi]
  loc_00611CE6: push esi
  loc_00611CE7: call [eax+00000308h]
  loc_00611CED: lea ecx, var_14
  loc_00611CF0: push eax
  loc_00611CF1: push ecx
  loc_00611CF2: call edi
  loc_00611CF4: mov cx, [ebx]
  loc_00611CF7: mov edx, [eax]
  loc_00611CF9: push ecx
  loc_00611CFA: push eax
  loc_00611CFB: mov var_28, eax
  loc_00611CFE: call [edx+0000008Ch]
  loc_00611D04: test eax, eax
  loc_00611D06: fnclex
  loc_00611D08: jge 00611D1Fh
  loc_00611D0A: mov edx, var_28
  loc_00611D0D: push 0000008Ch
  loc_00611D12: push 0041E5E8h
  loc_00611D17: push edx
  loc_00611D18: push eax
  loc_00611D19: call [00401074h] ; __vbaHresultCheckObj
  loc_00611D1F: lea ecx, var_14
  loc_00611D22: call [004012B0h] ; __vbaFreeObj
  loc_00611D28: mov eax, [esi]
  loc_00611D2A: push esi
  loc_00611D2B: call [eax+0000030Ch]
  loc_00611D31: lea ecx, var_14
  loc_00611D34: push eax
  loc_00611D35: push ecx
  loc_00611D36: call edi
  loc_00611D38: mov cx, [ebx]
  loc_00611D3B: mov edx, [eax]
  loc_00611D3D: push ecx
  loc_00611D3E: push eax
  loc_00611D3F: mov var_28, eax
  loc_00611D42: call [edx+0000008Ch]
  loc_00611D48: test eax, eax
  loc_00611D4A: fnclex
  loc_00611D4C: jge 00611D63h
  loc_00611D4E: mov edx, var_28
  loc_00611D51: push 0000008Ch
  loc_00611D56: push 0041E5E8h
  loc_00611D5B: push edx
  loc_00611D5C: push eax
  loc_00611D5D: call [00401074h] ; __vbaHresultCheckObj
  loc_00611D63: lea ecx, var_14
  loc_00611D66: call [004012B0h] ; __vbaFreeObj
  loc_00611D6C: mov eax, [esi]
  loc_00611D6E: push esi
  loc_00611D6F: call [eax+00000304h]
  loc_00611D75: lea ecx, var_14
  loc_00611D78: push eax
  loc_00611D79: push ecx
  loc_00611D7A: call edi
  loc_00611D7C: mov esi, eax
  loc_00611D7E: mov ax, [ebx]
  loc_00611D81: push eax
  loc_00611D82: push esi
  loc_00611D83: mov edx, [esi]
  loc_00611D85: call [edx+00000094h]
  loc_00611D8B: test eax, eax
  loc_00611D8D: fnclex
  loc_00611D8F: jge 00611DA3h
  loc_00611D91: push 00000094h
  loc_00611D96: push 004270A8h
  loc_00611D9B: push esi
  loc_00611D9C: push eax
  loc_00611D9D: call [00401074h] ; __vbaHresultCheckObj
  loc_00611DA3: lea ecx, var_14
  loc_00611DA6: call [004012B0h] ; __vbaFreeObj
  loc_00611DAC: push 00611DBEh
  loc_00611DB1: jmp 00611DBDh
  loc_00611DB3: lea ecx, var_14
  loc_00611DB6: call [004012B0h] ; __vbaFreeObj
  loc_00611DBC: ret
  loc_00611DBD: ret
  loc_00611DBE: mov ecx, var_10
  loc_00611DC1: pop edi
  loc_00611DC2: pop esi
  loc_00611DC3: xor eax, eax
  loc_00611DC5: mov fs:[00000000h], ecx
  loc_00611DCC: pop ebx
  loc_00611DCD: mov esp, ebp
  loc_00611DCF: pop ebp
  loc_00611DD0: retn 0008h
End Sub

Private Sub Proc_37_21_611DE0() '611DE0
  loc_00611DE0: push ebp
  loc_00611DE1: mov ebp, esp
  loc_00611DE3: sub esp, 00000008h
  loc_00611DE6: push 00403B36h ; __vbaExceptHandler
  loc_00611DEB: mov eax, fs:[00000000h]
  loc_00611DF1: push eax
  loc_00611DF2: mov fs:[00000000h], esp
  loc_00611DF9: sub esp, 00000010h
  loc_00611DFC: push ebx
  loc_00611DFD: push esi
  loc_00611DFE: push edi
  loc_00611DFF: mov var_8, esp
  loc_00611E02: mov var_4, 004039B0h
  loc_00611E09: mov esi, Me
  loc_00611E0C: mov var_14, 00000000h
  loc_00611E13: push esi
  loc_00611E14: mov eax, [esi]
  loc_00611E16: call [eax+000002FCh]
  loc_00611E1C: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00611E22: lea ecx, var_14
  loc_00611E25: push eax
  loc_00611E26: push ecx
  loc_00611E27: call ebx
  loc_00611E29: mov edi, eax
  loc_00611E2B: push 0041E5D4h
  loc_00611E30: push edi
  loc_00611E31: mov edx, [edi]
  loc_00611E33: call [edx+000000ACh]
  loc_00611E39: test eax, eax
  loc_00611E3B: fnclex
  loc_00611E3D: jge 00611E51h
  loc_00611E3F: push 000000ACh
  loc_00611E44: push 0041F844h
  loc_00611E49: push edi
  loc_00611E4A: push eax
  loc_00611E4B: call [00401074h] ; __vbaHresultCheckObj
  loc_00611E51: lea ecx, var_14
  loc_00611E54: call [004012B0h] ; __vbaFreeObj
  loc_00611E5A: mov eax, [esi]
  loc_00611E5C: push esi
  loc_00611E5D: call [eax+00000308h]
  loc_00611E63: lea ecx, var_14
  loc_00611E66: push eax
  loc_00611E67: push ecx
  loc_00611E68: call ebx
  loc_00611E6A: mov edi, eax
  loc_00611E6C: push 0041E5D4h
  loc_00611E71: push edi
  loc_00611E72: mov edx, [edi]
  loc_00611E74: call [edx+000000A4h]
  loc_00611E7A: test eax, eax
  loc_00611E7C: fnclex
  loc_00611E7E: jge 00611E92h
  loc_00611E80: push 000000A4h
  loc_00611E85: push 0041E5E8h
  loc_00611E8A: push edi
  loc_00611E8B: push eax
  loc_00611E8C: call [00401074h] ; __vbaHresultCheckObj
  loc_00611E92: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00611E98: lea ecx, var_14
  loc_00611E9B: call edi
  loc_00611E9D: mov eax, [esi]
  loc_00611E9F: push esi
  loc_00611EA0: call [eax+0000030Ch]
  loc_00611EA6: lea ecx, var_14
  loc_00611EA9: push eax
  loc_00611EAA: push ecx
  loc_00611EAB: call ebx
  loc_00611EAD: mov esi, eax
  loc_00611EAF: push 0041E5D4h
  loc_00611EB4: push esi
  loc_00611EB5: mov edx, [esi]
  loc_00611EB7: call [edx+000000A4h]
  loc_00611EBD: test eax, eax
  loc_00611EBF: fnclex
  loc_00611EC1: jge 00611ED5h
  loc_00611EC3: push 000000A4h
  loc_00611EC8: push 0041E5E8h
  loc_00611ECD: push esi
  loc_00611ECE: push eax
  loc_00611ECF: call [00401074h] ; __vbaHresultCheckObj
  loc_00611ED5: lea ecx, var_14
  loc_00611ED8: call edi
  loc_00611EDA: push 00611EECh
  loc_00611EDF: jmp 00611EEBh
  loc_00611EE1: lea ecx, var_14
  loc_00611EE4: call [004012B0h] ; __vbaFreeObj
  loc_00611EEA: ret
  loc_00611EEB: ret
  loc_00611EEC: mov ecx, var_10
  loc_00611EEF: pop edi
  loc_00611EF0: pop esi
  loc_00611EF1: xor eax, eax
  loc_00611EF3: mov fs:[00000000h], ecx
  loc_00611EFA: pop ebx
  loc_00611EFB: mov esp, ebp
  loc_00611EFD: pop ebp
  loc_00611EFE: retn 0004h
End Sub

Private Sub Proc_37_22_612620() '612620
  loc_00612620: push ebp
  loc_00612621: mov ebp, esp
  loc_00612623: sub esp, 00000008h
  loc_00612626: push 00403B36h ; __vbaExceptHandler
  loc_0061262B: mov eax, fs:[00000000h]
  loc_00612631: push eax
  loc_00612632: mov fs:[00000000h], esp
  loc_00612639: sub esp, 0000015Ch
  loc_0061263F: push ebx
  loc_00612640: push esi
  loc_00612641: push edi
  loc_00612642: mov var_8, esp
  loc_00612645: mov var_4, 00403A00h
  loc_0061264C: mov esi, Me
  loc_0061264F: xor edi, edi
  loc_00612651: push edi
  loc_00612652: push 00000014h
  loc_00612654: mov eax, [esi]
  loc_00612656: push esi
  loc_00612657: mov var_14, edi
  loc_0061265A: mov var_18, edi
  loc_0061265D: mov var_1C, edi
  loc_00612660: mov var_20, edi
  loc_00612663: mov var_24, edi
  loc_00612666: mov var_28, edi
  loc_00612669: mov var_2C, edi
  loc_0061266C: mov var_30, edi
  loc_0061266F: mov var_40, edi
  loc_00612672: mov var_50, edi
  loc_00612675: mov var_60, edi
  loc_00612678: mov var_70, edi
  loc_0061267B: mov var_80, edi
  loc_0061267E: mov var_90, edi
  loc_00612684: mov var_A0, edi
  loc_0061268A: mov var_B0, edi
  loc_00612690: mov var_C0, edi
  loc_00612696: mov var_D0, edi
  loc_0061269C: mov var_E0, edi
  loc_006126A2: mov var_F0, edi
  loc_006126A8: mov var_100, edi
  loc_006126AE: mov var_110, edi
  loc_006126B4: mov var_120, edi
  loc_006126BA: mov var_124, edi
  loc_006126C0: call [eax+00000348h]
  loc_006126C6: mov ebx, [004010A0h] ; __vbaObjSet
  loc_006126CC: lea ecx, var_28
  loc_006126CF: push eax
  loc_006126D0: push ecx
  loc_006126D1: call ebx
  loc_006126D3: lea edx, var_40
  loc_006126D6: push eax
  loc_006126D7: push edx
  loc_006126D8: call [00401140h] ; __vbaLateIdCallLd
  loc_006126DE: add esp, 00000010h
  loc_006126E1: push eax
  loc_006126E2: lea eax, var_50
  loc_006126E5: push eax
  loc_006126E6: call [004010D4h] ; rtcTrimVar
  loc_006126EC: mov ecx, [esi]
  loc_006126EE: push esi
  loc_006126EF: mov var_E8, 0041E5D4h
  loc_006126F9: mov var_F0, 00008008h
  loc_00612703: call [ecx+000002FCh]
  loc_00612709: lea edx, var_2C
  loc_0061270C: push eax
  loc_0061270D: push edx
  loc_0061270E: call ebx
  loc_00612710: mov ebx, eax
  loc_00612712: lea ecx, var_14
  loc_00612715: push ecx
  loc_00612716: push ebx
  loc_00612717: mov eax, [ebx]
  loc_00612719: call [eax+000000A8h]
  loc_0061271F: cmp eax, edi
  loc_00612721: fnclex
  loc_00612723: jge 00612737h
  loc_00612725: push 000000A8h
  loc_0061272A: push 0041F844h
  loc_0061272F: push ebx
  loc_00612730: push eax
  loc_00612731: call [00401074h] ; __vbaHresultCheckObj
  loc_00612737: mov eax, var_14
  loc_0061273A: lea edx, var_70
  loc_0061273D: mov var_68, eax
  loc_00612740: lea eax, var_80
  loc_00612743: push edx
  loc_00612744: push eax
  loc_00612745: mov var_14, edi
  loc_00612748: mov var_70, 00000008h
  loc_0061274F: call [004010D4h] ; rtcTrimVar
  loc_00612755: mov ecx, [esi]
  loc_00612757: push esi
  loc_00612758: mov var_F8, 0041E5D4h
  loc_00612762: mov var_100, 00008008h
  loc_0061276C: call [ecx+00000308h]
  loc_00612772: lea edx, var_30
  loc_00612775: push eax
  loc_00612776: push edx
  loc_00612777: call [004010A0h] ; __vbaObjSet
  loc_0061277D: mov ebx, eax
  loc_0061277F: lea ecx, var_18
  loc_00612782: push ecx
  loc_00612783: push ebx
  loc_00612784: mov eax, [ebx]
  loc_00612786: call [eax+000000A0h]
  loc_0061278C: cmp eax, edi
  loc_0061278E: fnclex
  loc_00612790: jge 006127A4h
  loc_00612792: push 000000A0h
  loc_00612797: push 0041E5E8h
  loc_0061279C: push ebx
  loc_0061279D: push eax
  loc_0061279E: call [00401074h] ; __vbaHresultCheckObj
  loc_006127A4: mov eax, var_18
  loc_006127A7: lea edx, var_B0
  loc_006127AD: mov var_A8, eax
  loc_006127B3: lea eax, var_C0
  loc_006127B9: push edx
  loc_006127BA: push eax
  loc_006127BB: mov var_18, edi
  loc_006127BE: mov var_B0, 00000008h
  loc_006127C8: call [004010D4h] ; rtcTrimVar
  loc_006127CE: mov ebx, [00401050h] ; __vbaVarCmpNe
  loc_006127D4: lea ecx, var_50
  loc_006127D7: lea edx, var_F0
  loc_006127DD: push ecx
  loc_006127DE: lea eax, var_60
  loc_006127E1: push edx
  loc_006127E2: push eax
  loc_006127E3: mov var_108, 0041E5D4h
  loc_006127ED: mov var_110, 00008008h
  loc_006127F7: call ebx
  loc_006127F9: lea ecx, var_80
  loc_006127FC: push eax
  loc_006127FD: lea edx, var_100
  loc_00612803: push ecx
  loc_00612804: lea eax, var_90
  loc_0061280A: push edx
  loc_0061280B: push eax
  loc_0061280C: call ebx
  loc_0061280E: lea ecx, var_A0
  loc_00612814: push eax
  loc_00612815: push ecx
  loc_00612816: call [0040115Ch] ; __vbaVarAnd
  loc_0061281C: push eax
  loc_0061281D: lea edx, var_C0
  loc_00612823: lea eax, var_110
  loc_00612829: push edx
  loc_0061282A: lea ecx, var_D0
  loc_00612830: push eax
  loc_00612831: push ecx
  loc_00612832: call ebx
  loc_00612834: lea edx, var_E0
  loc_0061283A: push eax
  loc_0061283B: push edx
  loc_0061283C: call [0040115Ch] ; __vbaVarAnd
  loc_00612842: push eax
  loc_00612843: call [004010E0h] ; __vbaBoolVarNull
  loc_00612849: mov bx, ax
  loc_0061284C: lea eax, var_30
  loc_0061284F: lea ecx, var_2C
  loc_00612852: push eax
  loc_00612853: lea edx, var_28
  loc_00612856: push ecx
  loc_00612857: push edx
  loc_00612858: push 00000003h
  loc_0061285A: call [00401040h] ; __vbaFreeObjList
  loc_00612860: lea eax, var_C0
  loc_00612866: lea ecx, var_B0
  loc_0061286C: push eax
  loc_0061286D: lea edx, var_80
  loc_00612870: push ecx
  loc_00612871: lea eax, var_70
  loc_00612874: push edx
  loc_00612875: lea ecx, var_50
  loc_00612878: push eax
  loc_00612879: lea edx, var_40
  loc_0061287C: push ecx
  loc_0061287D: push edx
  loc_0061287E: push 00000006h
  loc_00612880: call [00401038h] ; __vbaFreeVarList
  loc_00612886: add esp, 0000002Ch
  loc_00612889: cmp bx, di
  loc_0061288C: jz 0061368Fh
  loc_00612892: mov eax, [esi]
  loc_00612894: push esi
  loc_00612895: mov var_F8, 80020004h
  loc_0061289F: mov var_100, 0000000Ah
  loc_006128A9: mov var_E8, 0042B650h ; "Delete From Receive Where SrNo="
  loc_006128B3: mov var_F0, 00000008h
  loc_006128BD: call [eax+00000300h]
  loc_006128C3: lea ecx, var_28
  loc_006128C6: push eax
  loc_006128C7: push ecx
  loc_006128C8: call [004010A0h] ; __vbaObjSet
  loc_006128CE: mov ebx, eax
  loc_006128D0: lea eax, var_14
  loc_006128D3: push eax
  loc_006128D4: push ebx
  loc_006128D5: mov edx, [ebx]
  loc_006128D7: call [edx+000000A0h]
  loc_006128DD: cmp eax, edi
  loc_006128DF: fnclex
  loc_006128E1: jge 006128F5h
  loc_006128E3: push 000000A0h
  loc_006128E8: push 0041E5E8h
  loc_006128ED: push ebx
  loc_006128EE: push eax
  loc_006128EF: call [00401074h] ; __vbaHresultCheckObj
  loc_006128F5: mov eax, var_14
  loc_006128F8: lea ecx, var_40
  loc_006128FB: lea edx, var_50
  loc_006128FE: push ecx
  loc_006128FF: push edx
  loc_00612900: mov var_14, edi
  loc_00612903: mov var_38, eax
  loc_00612906: mov var_40, 00000008h
  loc_0061290D: call [004010D4h] ; rtcTrimVar
  loc_00612913: mov eax, [0061A13Ch]
  loc_00612918: mov edx, var_100
  loc_0061291E: sub esp, 00000010h
  loc_00612921: mov ebx, [eax]
  loc_00612923: mov eax, var_FC
  loc_00612929: mov ecx, esp
  loc_0061292B: mov [ecx], edx
  loc_0061292D: mov edx, var_F8
  loc_00612933: mov [ecx+00000004h], eax
  loc_00612936: mov eax, var_F4
  loc_0061293C: mov [ecx+00000008h], edx
  loc_0061293F: lea edx, var_50
  loc_00612942: mov [ecx+0000000Ch], eax
  loc_00612945: lea ecx, var_F0
  loc_0061294B: push ecx
  loc_0061294C: lea eax, var_60
  loc_0061294F: push edx
  loc_00612950: push eax
  loc_00612951: call [004011B4h] ; __vbaVarCat
  loc_00612957: lea ecx, var_18
  loc_0061295A: push eax
  loc_0061295B: push ecx
  loc_0061295C: call [004011B0h] ; __vbaStrVarVal
  loc_00612962: mov edx, [0061A13Ch]
  loc_00612968: push eax
  loc_00612969: push edx
  loc_0061296A: call [ebx+0000005Ch]
  loc_0061296D: cmp eax, edi
  loc_0061296F: fnclex
  loc_00612971: jge 00612988h
  loc_00612973: mov ecx, [0061A13Ch]
  loc_00612979: push 0000005Ch
  loc_0061297B: push 0041E928h
  loc_00612980: push ecx
  loc_00612981: push eax
  loc_00612982: call [00401074h] ; __vbaHresultCheckObj
  loc_00612988: lea ecx, var_18
  loc_0061298B: call [004012ACh] ; __vbaFreeStr
  loc_00612991: lea ecx, var_28
  loc_00612994: call [004012B0h] ; __vbaFreeObj
  loc_0061299A: lea edx, var_60
  loc_0061299D: lea eax, var_50
  loc_006129A0: push edx
  loc_006129A1: lea ecx, var_40
  loc_006129A4: push eax
  loc_006129A5: push ecx
  loc_006129A6: push 00000003h
  loc_006129A8: call [00401038h] ; __vbaFreeVarList
  loc_006129AE: add esp, 00000010h
  loc_006129B1: lea ebx, var_28
  loc_006129B4: mov ecx, 0000000Ah
  loc_006129B9: mov eax, 80020004h
  loc_006129BE: push ebx
  loc_006129BF: mov var_110, ecx
  loc_006129C5: sub esp, 00000010h
  loc_006129C8: mov var_100, ecx
  loc_006129CE: mov ebx, esp
  loc_006129D0: mov var_108, eax
  loc_006129D6: mov var_F8, eax
  loc_006129DC: sub esp, 00000010h
  loc_006129DF: mov [ebx], ecx
  loc_006129E1: mov ecx, var_10C
  loc_006129E7: mov var_F0, 00000003h
  loc_006129F1: mov edx, [0061A13Ch]
  loc_006129F7: mov [ebx+00000004h], ecx
  loc_006129FA: mov ecx, esp
  loc_006129FC: sub esp, 00000010h
  loc_006129FF: mov var_E8, 00000002h
  loc_00612A09: mov [ebx+00000008h], eax
  loc_00612A0C: mov eax, var_104
  loc_00612A12: mov edx, [edx]
  loc_00612A14: mov [ebx+0000000Ch], eax
  loc_00612A17: mov eax, var_100
  loc_00612A1D: mov [ecx], eax
  loc_00612A1F: mov eax, var_FC
  loc_00612A25: mov [ecx+00000004h], eax
  loc_00612A28: mov eax, var_F8
  loc_00612A2E: mov [ecx+00000008h], eax
  loc_00612A31: mov eax, var_F4
  loc_00612A37: mov [ecx+0000000Ch], eax
  loc_00612A3A: mov eax, var_F0
  loc_00612A40: mov ecx, esp
  loc_00612A42: push 0042ACD0h ; "Select * From Receive"
  loc_00612A47: mov [ecx], eax
  loc_00612A49: mov eax, var_EC
  loc_00612A4F: mov [ecx+00000004h], eax
  loc_00612A52: mov eax, var_E8
  loc_00612A58: mov [ecx+00000008h], eax
  loc_00612A5B: mov eax, var_E4
  loc_00612A61: mov [ecx+0000000Ch], eax
  loc_00612A64: mov ecx, [0061A13Ch]
  loc_00612A6A: push ecx
  loc_00612A6B: call [edx+000000BCh]
  loc_00612A71: cmp eax, edi
  loc_00612A73: fnclex
  loc_00612A75: jge 00612A8Fh
  loc_00612A77: mov edx, [0061A13Ch]
  loc_00612A7D: push 000000BCh
  loc_00612A82: push 0041E928h
  loc_00612A87: push edx
  loc_00612A88: push eax
  loc_00612A89: call [00401074h] ; __vbaHresultCheckObj
  loc_00612A8F: mov eax, var_28
  loc_00612A92: lea ebx, [esi+00000034h]
  loc_00612A95: push eax
  loc_00612A96: push ebx
  loc_00612A97: call [004010B8h] ; __vbaObjSetAddref
  loc_00612A9D: lea ecx, var_28
  loc_00612AA0: call [004012B0h] ; __vbaFreeObj
  loc_00612AA6: mov eax, [ebx]
  loc_00612AA8: push eax
  loc_00612AA9: mov ecx, [eax]
  loc_00612AAB: call [ecx+000000C0h]
  loc_00612AB1: cmp eax, edi
  loc_00612AB3: fnclex
  loc_00612AB5: jge 00612ACBh
  loc_00612AB7: mov edx, [ebx]
  loc_00612AB9: push 000000C0h
  loc_00612ABE: push 0041E938h
  loc_00612AC3: push edx
  loc_00612AC4: push eax
  loc_00612AC5: call [00401074h] ; __vbaHresultCheckObj
  loc_00612ACB: mov eax, [esi]
  loc_00612ACD: push esi
  loc_00612ACE: call [eax+00000300h]
  loc_00612AD4: lea ecx, var_28
  loc_00612AD7: push eax
  loc_00612AD8: push ecx
  loc_00612AD9: call [004010A0h] ; __vbaObjSet
  loc_00612ADF: mov edx, [eax]
  loc_00612AE1: lea ecx, var_14
  loc_00612AE4: push ecx
  loc_00612AE5: push eax
  loc_00612AE6: mov var_128, eax
  loc_00612AEC: call [edx+000000A0h]
  loc_00612AF2: cmp eax, edi
  loc_00612AF4: fnclex
  loc_00612AF6: jge 00612B10h
  loc_00612AF8: mov edx, var_128
  loc_00612AFE: push 000000A0h
  loc_00612B03: push 0041E5E8h
  loc_00612B08: push edx
  loc_00612B09: push eax
  loc_00612B0A: call [00401074h] ; __vbaHresultCheckObj
  loc_00612B10: mov eax, var_14
  loc_00612B13: lea ecx, var_50
  loc_00612B16: mov var_38, eax
  loc_00612B19: lea eax, var_40
  loc_00612B1C: push eax
  loc_00612B1D: push ecx
  loc_00612B1E: mov var_14, edi
  loc_00612B21: mov var_40, 00000008h
  loc_00612B28: call [004010D4h] ; rtcTrimVar
  loc_00612B2E: mov eax, [ebx]
  loc_00612B30: mov ecx, var_50
  loc_00612B33: mov var_E8, 0041EDD8h ; "SrNo"
  loc_00612B3D: mov var_F0, 00000008h
  loc_00612B47: mov edx, [eax]
  loc_00612B49: sub esp, 00000010h
  loc_00612B4C: mov eax, esp
  loc_00612B4E: sub esp, 00000010h
  loc_00612B51: mov [eax], ecx
  loc_00612B53: mov ecx, var_4C
  loc_00612B56: mov [eax+00000004h], ecx
  loc_00612B59: mov ecx, var_48
  loc_00612B5C: mov [eax+00000008h], ecx
  loc_00612B5F: mov ecx, var_44
  loc_00612B62: mov [eax+0000000Ch], ecx
  loc_00612B65: mov ecx, var_F0
  loc_00612B6B: mov eax, esp
  loc_00612B6D: mov [eax], ecx
  loc_00612B6F: mov ecx, var_EC
  loc_00612B75: mov [eax+00000004h], ecx
  loc_00612B78: mov ecx, var_E8
  loc_00612B7E: mov [eax+00000008h], ecx
  loc_00612B81: mov ecx, var_E4
  loc_00612B87: mov [eax+0000000Ch], ecx
  loc_00612B8A: mov eax, [ebx]
  loc_00612B8C: push eax
  loc_00612B8D: call [edx+00000128h]
  loc_00612B93: cmp eax, edi
  loc_00612B95: fnclex
  loc_00612B97: jge 00612BADh
  loc_00612B99: mov edx, [ebx]
  loc_00612B9B: push 00000128h
  loc_00612BA0: push 0041E938h
  loc_00612BA5: push edx
  loc_00612BA6: push eax
  loc_00612BA7: call [00401074h] ; __vbaHresultCheckObj
  loc_00612BAD: lea ecx, var_28
  loc_00612BB0: call [004012B0h] ; __vbaFreeObj
  loc_00612BB6: lea eax, var_50
  loc_00612BB9: lea ecx, var_40
  loc_00612BBC: push eax
  loc_00612BBD: push ecx
  loc_00612BBE: push 00000002h
  loc_00612BC0: call [00401038h] ; __vbaFreeVarList
  loc_00612BC6: mov edx, [esi]
  loc_00612BC8: add esp, 0000000Ch
  loc_00612BCB: push edi
  loc_00612BCC: push 00000014h
  loc_00612BCE: push esi
  loc_00612BCF: call [edx+00000348h]
  loc_00612BD5: push eax
  loc_00612BD6: lea eax, var_28
  loc_00612BD9: push eax
  loc_00612BDA: call [004010A0h] ; __vbaObjSet
  loc_00612BE0: lea ecx, var_40
  loc_00612BE3: push eax
  loc_00612BE4: push ecx
  loc_00612BE5: call [00401140h] ; __vbaLateIdCallLd
  loc_00612BEB: add esp, 00000010h
  loc_00612BEE: lea edx, var_50
  loc_00612BF1: push eax
  loc_00612BF2: push edx
  loc_00612BF3: call [004010D4h] ; rtcTrimVar
  loc_00612BF9: mov eax, [ebx]
  loc_00612BFB: sub esp, 00000010h
  loc_00612BFE: mov var_E8, 0041FBA8h ; "OnDate"
  loc_00612C08: mov var_F0, 00000008h
  loc_00612C12: mov ecx, [eax]
  loc_00612C14: mov eax, var_50
  loc_00612C17: mov edx, esp
  loc_00612C19: sub esp, 00000010h
  loc_00612C1C: mov [edx], eax
  loc_00612C1E: mov eax, var_4C
  loc_00612C21: mov [edx+00000004h], eax
  loc_00612C24: mov eax, var_48
  loc_00612C27: mov [edx+00000008h], eax
  loc_00612C2A: mov eax, var_44
  loc_00612C2D: mov [edx+0000000Ch], eax
  loc_00612C30: mov eax, var_F0
  loc_00612C36: mov edx, esp
  loc_00612C38: mov [edx], eax
  loc_00612C3A: mov eax, var_EC
  loc_00612C40: mov [edx+00000004h], eax
  loc_00612C43: mov eax, var_E8
  loc_00612C49: mov [edx+00000008h], eax
  loc_00612C4C: mov eax, var_E4
  loc_00612C52: mov [edx+0000000Ch], eax
  loc_00612C55: mov eax, [ebx]
  loc_00612C57: push eax
  loc_00612C58: call [ecx+00000128h]
  loc_00612C5E: cmp eax, edi
  loc_00612C60: fnclex
  loc_00612C62: jge 00612C78h
  loc_00612C64: mov ecx, [ebx]
  loc_00612C66: push 00000128h
  loc_00612C6B: push 0041E938h
  loc_00612C70: push ecx
  loc_00612C71: push eax
  loc_00612C72: call [00401074h] ; __vbaHresultCheckObj
  loc_00612C78: lea ecx, var_28
  loc_00612C7B: call [004012B0h] ; __vbaFreeObj
  loc_00612C81: lea edx, var_50
  loc_00612C84: lea eax, var_40
  loc_00612C87: push edx
  loc_00612C88: push eax
  loc_00612C89: push 00000002h
  loc_00612C8B: call [00401038h] ; __vbaFreeVarList
  loc_00612C91: mov ecx, [esi]
  loc_00612C93: add esp, 0000000Ch
  loc_00612C96: push esi
  loc_00612C97: call [ecx+000002FCh]
  loc_00612C9D: lea edx, var_28
  loc_00612CA0: push eax
  loc_00612CA1: push edx
  loc_00612CA2: call [004010A0h] ; __vbaObjSet
  loc_00612CA8: mov ecx, [eax]
  loc_00612CAA: lea edx, var_14
  loc_00612CAD: push edx
  loc_00612CAE: push eax
  loc_00612CAF: mov var_128, eax
  loc_00612CB5: call [ecx+000000A8h]
  loc_00612CBB: cmp eax, edi
  loc_00612CBD: fnclex
  loc_00612CBF: jge 00612CD9h
  loc_00612CC1: mov ecx, var_128
  loc_00612CC7: push 000000A8h
  loc_00612CCC: push 0041F844h
  loc_00612CD1: push ecx
  loc_00612CD2: push eax
  loc_00612CD3: call [00401074h] ; __vbaHresultCheckObj
  loc_00612CD9: mov eax, var_14
  loc_00612CDC: lea edx, var_40
  loc_00612CDF: mov var_38, eax
  loc_00612CE2: lea eax, var_50
  loc_00612CE5: push edx
  loc_00612CE6: push eax
  loc_00612CE7: mov var_14, edi
  loc_00612CEA: mov var_40, 00000008h
  loc_00612CF1: call [004010D4h] ; rtcTrimVar
  loc_00612CF7: mov eax, [ebx]
  loc_00612CF9: sub esp, 00000010h
  loc_00612CFC: mov var_E8, 0041EA08h ; "Name"
  loc_00612D06: mov var_F0, 00000008h
  loc_00612D10: mov ecx, [eax]
  loc_00612D12: mov eax, var_50
  loc_00612D15: mov edx, esp
  loc_00612D17: sub esp, 00000010h
  loc_00612D1A: mov [edx], eax
  loc_00612D1C: mov eax, var_4C
  loc_00612D1F: mov [edx+00000004h], eax
  loc_00612D22: mov eax, var_48
  loc_00612D25: mov [edx+00000008h], eax
  loc_00612D28: mov eax, var_44
  loc_00612D2B: mov [edx+0000000Ch], eax
  loc_00612D2E: mov eax, var_F0
  loc_00612D34: mov edx, esp
  loc_00612D36: mov [edx], eax
  loc_00612D38: mov eax, var_EC
  loc_00612D3E: mov [edx+00000004h], eax
  loc_00612D41: mov eax, var_E8
  loc_00612D47: mov [edx+00000008h], eax
  loc_00612D4A: mov eax, var_E4
  loc_00612D50: mov [edx+0000000Ch], eax
  loc_00612D53: mov eax, [ebx]
  loc_00612D55: push eax
  loc_00612D56: call [ecx+00000128h]
  loc_00612D5C: cmp eax, edi
  loc_00612D5E: fnclex
  loc_00612D60: jge 00612D76h
  loc_00612D62: mov ecx, [ebx]
  loc_00612D64: push 00000128h
  loc_00612D69: push 0041E938h
  loc_00612D6E: push ecx
  loc_00612D6F: push eax
  loc_00612D70: call [00401074h] ; __vbaHresultCheckObj
  loc_00612D76: lea ecx, var_28
  loc_00612D79: call [004012B0h] ; __vbaFreeObj
  loc_00612D7F: lea edx, var_50
  loc_00612D82: lea eax, var_40
  loc_00612D85: push edx
  loc_00612D86: push eax
  loc_00612D87: push 00000002h
  loc_00612D89: call [00401038h] ; __vbaFreeVarList
  loc_00612D8F: mov ecx, [esi]
  loc_00612D91: add esp, 0000000Ch
  loc_00612D94: push esi
  loc_00612D95: call [ecx+00000308h]
  loc_00612D9B: lea edx, var_28
  loc_00612D9E: push eax
  loc_00612D9F: push edx
  loc_00612DA0: call [004010A0h] ; __vbaObjSet
  loc_00612DA6: mov ecx, [eax]
  loc_00612DA8: lea edx, var_14
  loc_00612DAB: push edx
  loc_00612DAC: push eax
  loc_00612DAD: mov var_128, eax
  loc_00612DB3: call [ecx+000000A0h]
  loc_00612DB9: cmp eax, edi
  loc_00612DBB: fnclex
  loc_00612DBD: jge 00612DD7h
  loc_00612DBF: mov ecx, var_128
  loc_00612DC5: push 000000A0h
  loc_00612DCA: push 0041E5E8h
  loc_00612DCF: push ecx
  loc_00612DD0: push eax
  loc_00612DD1: call [00401074h] ; __vbaHresultCheckObj
  loc_00612DD7: mov eax, var_14
  loc_00612DDA: lea edx, var_40
  loc_00612DDD: mov var_38, eax
  loc_00612DE0: lea eax, var_50
  loc_00612DE3: push edx
  loc_00612DE4: push eax
  loc_00612DE5: mov var_14, edi
  loc_00612DE8: mov var_40, 00000008h
  loc_00612DEF: call [004010D4h] ; rtcTrimVar
  loc_00612DF5: mov eax, [ebx]
  loc_00612DF7: sub esp, 00000010h
  loc_00612DFA: mov var_E8, 0042043Ch ; "Amount"
  loc_00612E04: mov var_F0, 00000008h
  loc_00612E0E: mov ecx, [eax]
  loc_00612E10: mov eax, var_50
  loc_00612E13: mov edx, esp
  loc_00612E15: sub esp, 00000010h
  loc_00612E18: mov [edx], eax
  loc_00612E1A: mov eax, var_4C
  loc_00612E1D: mov [edx+00000004h], eax
  loc_00612E20: mov eax, var_48
  loc_00612E23: mov [edx+00000008h], eax
  loc_00612E26: mov eax, var_44
  loc_00612E29: mov [edx+0000000Ch], eax
  loc_00612E2C: mov eax, var_F0
  loc_00612E32: mov edx, esp
  loc_00612E34: mov [edx], eax
  loc_00612E36: mov eax, var_EC
  loc_00612E3C: mov [edx+00000004h], eax
  loc_00612E3F: mov eax, var_E8
  loc_00612E45: mov [edx+00000008h], eax
  loc_00612E48: mov eax, var_E4
  loc_00612E4E: mov [edx+0000000Ch], eax
  loc_00612E51: mov eax, [ebx]
  loc_00612E53: push eax
  loc_00612E54: call [ecx+00000128h]
  loc_00612E5A: cmp eax, edi
  loc_00612E5C: fnclex
  loc_00612E5E: jge 00612E74h
  loc_00612E60: mov ecx, [ebx]
  loc_00612E62: push 00000128h
  loc_00612E67: push 0041E938h
  loc_00612E6C: push ecx
  loc_00612E6D: push eax
  loc_00612E6E: call [00401074h] ; __vbaHresultCheckObj
  loc_00612E74: lea ecx, var_28
  loc_00612E77: call [004012B0h] ; __vbaFreeObj
  loc_00612E7D: lea edx, var_50
  loc_00612E80: lea eax, var_40
  loc_00612E83: push edx
  loc_00612E84: push eax
  loc_00612E85: push 00000002h
  loc_00612E87: call [00401038h] ; __vbaFreeVarList
  loc_00612E8D: mov ecx, [esi]
  loc_00612E8F: add esp, 0000000Ch
  loc_00612E92: push esi
  loc_00612E93: call [ecx+0000030Ch]
  loc_00612E99: lea edx, var_28
  loc_00612E9C: push eax
  loc_00612E9D: push edx
  loc_00612E9E: call [004010A0h] ; __vbaObjSet
  loc_00612EA4: mov ecx, [eax]
  loc_00612EA6: lea edx, var_14
  loc_00612EA9: push edx
  loc_00612EAA: push eax
  loc_00612EAB: mov var_128, eax
  loc_00612EB1: call [ecx+000000A0h]
  loc_00612EB7: cmp eax, edi
  loc_00612EB9: fnclex
  loc_00612EBB: jge 00612ED5h
  loc_00612EBD: mov ecx, var_128
  loc_00612EC3: push 000000A0h
  loc_00612EC8: push 0041E5E8h
  loc_00612ECD: push ecx
  loc_00612ECE: push eax
  loc_00612ECF: call [00401074h] ; __vbaHresultCheckObj
  loc_00612ED5: mov eax, var_14
  loc_00612ED8: lea edx, var_40
  loc_00612EDB: mov var_38, eax
  loc_00612EDE: lea eax, var_50
  loc_00612EE1: push edx
  loc_00612EE2: push eax
  loc_00612EE3: mov var_14, edi
  loc_00612EE6: mov var_40, 00000008h
  loc_00612EED: call [004010D4h] ; rtcTrimVar
  loc_00612EF3: mov ecx, [esi]
  loc_00612EF5: push esi
  loc_00612EF6: call [ecx+0000030Ch]
  loc_00612EFC: lea edx, var_2C
  loc_00612EFF: push eax
  loc_00612F00: push edx
  loc_00612F01: call [004010A0h] ; __vbaObjSet
  loc_00612F07: mov ecx, [eax]
  loc_00612F09: lea edx, var_18
  loc_00612F0C: push edx
  loc_00612F0D: push eax
  loc_00612F0E: mov var_130, eax
  loc_00612F14: call [ecx+000000A0h]
  loc_00612F1A: cmp eax, edi
  loc_00612F1C: fnclex
  loc_00612F1E: jge 00612F38h
  loc_00612F20: mov ecx, var_130
  loc_00612F26: push 000000A0h
  loc_00612F2B: push 0041E5E8h
  loc_00612F30: push ecx
  loc_00612F31: push eax
  loc_00612F32: call [00401074h] ; __vbaHresultCheckObj
  loc_00612F38: mov eax, var_18
  loc_00612F3B: lea edx, var_70
  loc_00612F3E: mov var_68, eax
  loc_00612F41: lea eax, var_80
  loc_00612F44: push edx
  loc_00612F45: push eax
  loc_00612F46: mov var_18, edi
  loc_00612F49: mov var_70, 00000008h
  loc_00612F50: call [004010D4h] ; rtcTrimVar
  loc_00612F56: lea edx, var_100
  loc_00612F5C: lea ecx, var_A0
  loc_00612F62: mov var_F8, 0041F1E0h ; "-"
  loc_00612F6C: mov var_100, 00000008h
  loc_00612F76: call [00401240h] ; __vbaVarDup
  loc_00612F7C: lea ecx, var_50
  loc_00612F7F: lea edx, var_F0
  loc_00612F85: push ecx
  loc_00612F86: lea eax, var_60
  loc_00612F89: push edx
  loc_00612F8A: push eax
  loc_00612F8B: mov var_E8, 0041E5D4h
  loc_00612F95: mov var_F0, 00008008h
  loc_00612F9F: call [00401050h] ; __vbaVarCmpNe
  loc_00612FA5: mov edx, eax
  loc_00612FA7: lea ecx, var_90
  loc_00612FAD: call [00401014h] ; __vbaVarMove
  loc_00612FB3: lea ecx, var_A0
  loc_00612FB9: lea edx, var_80
  loc_00612FBC: push ecx
  loc_00612FBD: lea eax, var_90
  loc_00612FC3: push edx
  loc_00612FC4: lea ecx, var_B0
  loc_00612FCA: push eax
  loc_00612FCB: push ecx
  loc_00612FCC: call [004011F0h] ; rtcImmediateIf
  loc_00612FD2: mov eax, [ebx]
  loc_00612FD4: mov ecx, var_B0
  loc_00612FDA: mov var_108, 0042AD00h ; "Remark"
  loc_00612FE4: mov var_110, 00000008h
  loc_00612FEE: mov edx, [eax]
  loc_00612FF0: sub esp, 00000010h
  loc_00612FF3: mov eax, esp
  loc_00612FF5: sub esp, 00000010h
  loc_00612FF8: mov [eax], ecx
  loc_00612FFA: mov ecx, var_AC
  loc_00613000: mov [eax+00000004h], ecx
  loc_00613003: mov ecx, var_A8
  loc_00613009: mov [eax+00000008h], ecx
  loc_0061300C: mov ecx, var_A4
  loc_00613012: mov [eax+0000000Ch], ecx
  loc_00613015: mov ecx, var_110
  loc_0061301B: mov eax, esp
  loc_0061301D: mov [eax], ecx
  loc_0061301F: mov ecx, var_10C
  loc_00613025: mov [eax+00000004h], ecx
  loc_00613028: mov ecx, var_108
  loc_0061302E: mov [eax+00000008h], ecx
  loc_00613031: mov ecx, var_104
  loc_00613037: mov [eax+0000000Ch], ecx
  loc_0061303A: mov eax, [ebx]
  loc_0061303C: push eax
  loc_0061303D: call [edx+00000128h]
  loc_00613043: cmp eax, edi
  loc_00613045: fnclex
  loc_00613047: jge 0061305Dh
  loc_00613049: mov edx, [ebx]
  loc_0061304B: push 00000128h
  loc_00613050: push 0041E938h
  loc_00613055: push edx
  loc_00613056: push eax
  loc_00613057: call [00401074h] ; __vbaHresultCheckObj
  loc_0061305D: lea eax, var_2C
  loc_00613060: lea ecx, var_28
  loc_00613063: push eax
  loc_00613064: push ecx
  loc_00613065: push 00000002h
  loc_00613067: call [00401040h] ; __vbaFreeObjList
  loc_0061306D: lea edx, var_B0
  loc_00613073: lea eax, var_A0
  loc_00613079: push edx
  loc_0061307A: lea ecx, var_80
  loc_0061307D: push eax
  loc_0061307E: lea edx, var_90
  loc_00613084: push ecx
  loc_00613085: lea eax, var_70
  loc_00613088: push edx
  loc_00613089: lea ecx, var_50
  loc_0061308C: push eax
  loc_0061308D: lea edx, var_40
  loc_00613090: push ecx
  loc_00613091: push edx
  loc_00613092: push 00000007h
  loc_00613094: call [00401038h] ; __vbaFreeVarList
  loc_0061309A: mov eax, [esi]
  loc_0061309C: add esp, 0000002Ch
  loc_0061309F: push esi
  loc_006130A0: call [eax+00000304h]
  loc_006130A6: lea ecx, var_28
  loc_006130A9: push eax
  loc_006130AA: push ecx
  loc_006130AB: call [004010A0h] ; __vbaObjSet
  loc_006130B1: mov edx, [eax]
  loc_006130B3: lea ecx, var_14
  loc_006130B6: push ecx
  loc_006130B7: push eax
  loc_006130B8: mov var_128, eax
  loc_006130BE: call [edx+00000050h]
  loc_006130C1: cmp eax, edi
  loc_006130C3: fnclex
  loc_006130C5: jge 006130DCh
  loc_006130C7: mov edx, var_128
  loc_006130CD: push 00000050h
  loc_006130CF: push 004270A8h
  loc_006130D4: push edx
  loc_006130D5: push eax
  loc_006130D6: call [00401074h] ; __vbaHresultCheckObj
  loc_006130DC: mov eax, var_14
  loc_006130DF: lea ecx, var_50
  loc_006130E2: mov var_38, eax
  loc_006130E5: lea eax, var_40
  loc_006130E8: push eax
  loc_006130E9: push ecx
  loc_006130EA: mov var_14, edi
  loc_006130ED: mov var_40, 00000008h
  loc_006130F4: call [004010D4h] ; rtcTrimVar
  loc_006130FA: mov eax, [ebx]
  loc_006130FC: mov ecx, var_50
  loc_006130FF: mov var_E8, 0042B0CCh ; "Language"
  loc_00613109: mov var_F0, 00000008h
  loc_00613113: mov edx, [eax]
  loc_00613115: sub esp, 00000010h
  loc_00613118: mov eax, esp
  loc_0061311A: sub esp, 00000010h
  loc_0061311D: mov [eax], ecx
  loc_0061311F: mov ecx, var_4C
  loc_00613122: mov [eax+00000004h], ecx
  loc_00613125: mov ecx, var_48
  loc_00613128: mov [eax+00000008h], ecx
  loc_0061312B: mov ecx, var_44
  loc_0061312E: mov [eax+0000000Ch], ecx
  loc_00613131: mov ecx, var_F0
  loc_00613137: mov eax, esp
  loc_00613139: mov [eax], ecx
  loc_0061313B: mov ecx, var_EC
  loc_00613141: mov [eax+00000004h], ecx
  loc_00613144: mov ecx, var_E8
  loc_0061314A: mov [eax+00000008h], ecx
  loc_0061314D: mov ecx, var_E4
  loc_00613153: mov [eax+0000000Ch], ecx
  loc_00613156: mov eax, [ebx]
  loc_00613158: push eax
  loc_00613159: call [edx+00000128h]
  loc_0061315F: cmp eax, edi
  loc_00613161: fnclex
  loc_00613163: jge 00613179h
  loc_00613165: mov edx, [ebx]
  loc_00613167: push 00000128h
  loc_0061316C: push 0041E938h
  loc_00613171: push edx
  loc_00613172: push eax
  loc_00613173: call [00401074h] ; __vbaHresultCheckObj
  loc_00613179: lea ecx, var_28
  loc_0061317C: call [004012B0h] ; __vbaFreeObj
  loc_00613182: lea eax, var_50
  loc_00613185: lea ecx, var_40
  loc_00613188: push eax
  loc_00613189: push ecx
  loc_0061318A: push 00000002h
  loc_0061318C: call [00401038h] ; __vbaFreeVarList
  loc_00613192: mov eax, [ebx]
  loc_00613194: add esp, 0000000Ch
  loc_00613197: mov edx, [eax]
  loc_00613199: push edi
  loc_0061319A: push 00000001h
  loc_0061319C: push eax
  loc_0061319D: call [edx+00000164h]
  loc_006131A3: cmp eax, edi
  loc_006131A5: fnclex
  loc_006131A7: jge 006131BDh
  loc_006131A9: mov ecx, [ebx]
  loc_006131AB: push 00000164h
  loc_006131B0: push 0041E938h
  loc_006131B5: push ecx
  loc_006131B6: push eax
  loc_006131B7: call [00401074h] ; __vbaHresultCheckObj
  loc_006131BD: mov eax, [ebx]
  loc_006131BF: push eax
  loc_006131C0: mov edx, [eax]
  loc_006131C2: call [edx+000000C4h]
  loc_006131C8: cmp eax, edi
  loc_006131CA: fnclex
  loc_006131CC: jge 006131E2h
  loc_006131CE: mov ecx, [ebx]
  loc_006131D0: push 000000C4h
  loc_006131D5: push 0041E938h
  loc_006131DA: push ecx
  loc_006131DB: push eax
  loc_006131DC: call [00401074h] ; __vbaHresultCheckObj
  loc_006131E2: push 0041E938h
  loc_006131E7: push edi
  loc_006131E8: call [00401274h] ; __vbaCastObj
  loc_006131EE: lea edx, var_28
  loc_006131F1: push eax
  loc_006131F2: push edx
  loc_006131F3: call [004010A0h] ; __vbaObjSet
  loc_006131F9: push eax
  loc_006131FA: push ebx
  loc_006131FB: call [004010B8h] ; __vbaObjSetAddref
  loc_00613201: lea ecx, var_28
  loc_00613204: call [004012B0h] ; __vbaFreeObj
  loc_0061320A: mov eax, [esi]
  loc_0061320C: push esi
  loc_0061320D: call [eax+00000308h]
  loc_00613213: lea ecx, var_28
  loc_00613216: push eax
  loc_00613217: push ecx
  loc_00613218: call [004010A0h] ; __vbaObjSet
  loc_0061321E: mov ebx, eax
  loc_00613220: lea eax, var_14
  loc_00613223: push eax
  loc_00613224: push ebx
  loc_00613225: mov edx, [ebx]
  loc_00613227: call [edx+000000A0h]
  loc_0061322D: cmp eax, edi
  loc_0061322F: fnclex
  loc_00613231: jge 00613245h
  loc_00613233: push 000000A0h
  loc_00613238: push 0041E5E8h
  loc_0061323D: push ebx
  loc_0061323E: push eax
  loc_0061323F: call [00401074h] ; __vbaHresultCheckObj
  loc_00613245: mov ecx, [esi]
  loc_00613247: push esi
  loc_00613248: call [ecx+000002FCh]
  loc_0061324E: lea edx, var_2C
  loc_00613251: push eax
  loc_00613252: push edx
  loc_00613253: call [004010A0h] ; __vbaObjSet
  loc_00613259: mov ebx, eax
  loc_0061325B: lea ecx, var_20
  loc_0061325E: push ecx
  loc_0061325F: push ebx
  loc_00613260: mov eax, [ebx]
  loc_00613262: call [eax+000000A8h]
  loc_00613268: cmp eax, edi
  loc_0061326A: fnclex
  loc_0061326C: jge 00613280h
  loc_0061326E: push 000000A8h
  loc_00613273: push 0041F844h
  loc_00613278: push ebx
  loc_00613279: push eax
  loc_0061327A: call [00401074h] ; __vbaHresultCheckObj
  loc_00613280: mov eax, var_20
  loc_00613283: lea edx, var_40
  loc_00613286: mov var_38, eax
  loc_00613289: lea eax, var_50
  loc_0061328C: push edx
  loc_0061328D: push eax
  loc_0061328E: mov var_20, edi
  loc_00613291: mov var_40, 00000008h
  loc_00613298: call [004010D4h] ; rtcTrimVar
  loc_0061329E: mov ecx, var_14
  loc_006132A1: push 004339A4h ; "Update Balance SET Amount=Amount-"
  loc_006132A6: push ecx
  loc_006132A7: mov var_F8, 80020004h
  loc_006132B1: mov var_100, 0000000Ah
  loc_006132BB: call [004011D8h] ; __vbaR8Str
  loc_006132C1: sub esp, 00000008h
  loc_006132C4: fstp real8 ptr [esp]
  loc_006132C7: call [00401144h] ; __vbaStrR8
  loc_006132CD: mov ebx, [00401270h] ; __vbaStrMove
  loc_006132D3: mov edx, eax
  loc_006132D5: lea ecx, var_18
  loc_006132D8: call ebx
  loc_006132DA: push eax
  loc_006132DB: call [00401054h] ; __vbaStrCat
  loc_006132E1: mov edx, eax
  loc_006132E3: lea ecx, var_1C
  loc_006132E6: call ebx
  loc_006132E8: push eax
  loc_006132E9: push 0042B630h ; " Where Name='"
  loc_006132EE: call [00401054h] ; __vbaStrCat
  loc_006132F4: mov edx, [0061A13Ch]
  loc_006132FA: mov ecx, var_100
  loc_00613300: mov var_58, eax
  loc_00613303: mov eax, 00000008h
  loc_00613308: sub esp, 00000010h
  loc_0061330B: mov var_60, eax
  loc_0061330E: mov var_F0, eax
  loc_00613314: mov eax, esp
  loc_00613316: mov var_E8, 0041E890h ; "'"
  loc_00613320: mov ebx, [edx]
  loc_00613322: mov edx, var_FC
  loc_00613328: mov [eax], ecx
  loc_0061332A: mov ecx, var_F8
  loc_00613330: mov [eax+00000004h], edx
  loc_00613333: mov edx, var_F4
  loc_00613339: mov [eax+00000008h], ecx
  loc_0061333C: lea ecx, var_50
  loc_0061333F: mov [eax+0000000Ch], edx
  loc_00613342: lea eax, var_60
  loc_00613345: push eax
  loc_00613346: lea edx, var_70
  loc_00613349: push ecx
  loc_0061334A: push edx
  loc_0061334B: call [004011B4h] ; __vbaVarCat
  loc_00613351: push eax
  loc_00613352: lea eax, var_F0
  loc_00613358: lea ecx, var_80
  loc_0061335B: push eax
  loc_0061335C: push ecx
  loc_0061335D: call [004011B4h] ; __vbaVarCat
  loc_00613363: lea edx, var_24
  loc_00613366: push eax
  loc_00613367: push edx
  loc_00613368: call [004011B0h] ; __vbaStrVarVal
  loc_0061336E: push eax
  loc_0061336F: mov eax, [0061A13Ch]
  loc_00613374: push eax
  loc_00613375: call [ebx+0000005Ch]
  loc_00613378: cmp eax, edi
  loc_0061337A: fnclex
  loc_0061337C: jge 00613393h
  loc_0061337E: mov ecx, [0061A13Ch]
  loc_00613384: push 0000005Ch
  loc_00613386: push 0041E928h
  loc_0061338B: push ecx
  loc_0061338C: push eax
  loc_0061338D: call [00401074h] ; __vbaHresultCheckObj
  loc_00613393: lea edx, var_24
  loc_00613396: lea eax, var_1C
  loc_00613399: push edx
  loc_0061339A: lea ecx, var_18
  loc_0061339D: push eax
  loc_0061339E: lea edx, var_14
  loc_006133A1: push ecx
  loc_006133A2: push edx
  loc_006133A3: push 00000004h
  loc_006133A5: call [004011FCh] ; __vbaFreeStrList
  loc_006133AB: lea eax, var_2C
  loc_006133AE: lea ecx, var_28
  loc_006133B1: push eax
  loc_006133B2: push ecx
  loc_006133B3: push 00000002h
  loc_006133B5: call [00401040h] ; __vbaFreeObjList
  loc_006133BB: lea edx, var_80
  loc_006133BE: lea eax, var_70
  loc_006133C1: push edx
  loc_006133C2: lea ecx, var_50
  loc_006133C5: push eax
  loc_006133C6: lea edx, var_60
  loc_006133C9: push ecx
  loc_006133CA: lea eax, var_40
  loc_006133CD: push edx
  loc_006133CE: push eax
  loc_006133CF: push 00000005h
  loc_006133D1: call [00401038h] ; __vbaFreeVarList
  loc_006133D7: add esp, 00000038h
  loc_006133DA: lea ecx, var_F0
  loc_006133E0: lea edx, var_40
  loc_006133E3: mov ebx, 80020004h
  loc_006133E8: push ecx
  loc_006133E9: push edx
  loc_006133EA: mov var_F8, 004321E8h ; "DELETE * FROM BALANCE IN '"
  loc_006133F4: mov var_100, 00000008h
  loc_006133FE: mov var_E8, 0061A09Ch
  loc_00613408: mov var_F0, 00004008h
  loc_00613412: call [004010D4h] ; rtcTrimVar
  loc_00613418: mov eax, [0061A13Ch]
  loc_0061341D: sub esp, 00000010h
  loc_00613420: mov var_108, 0041E890h ; "'"
  loc_0061342A: mov var_110, 00000008h
  loc_00613434: mov edx, [eax]
  loc_00613436: mov ecx, esp
  loc_00613438: mov eax, 0000000Ah
  loc_0061343D: mov var_168, edx
  loc_00613443: mov [ecx], eax
  loc_00613445: mov eax, var_11C
  loc_0061344B: mov [ecx+00000004h], eax
  loc_0061344E: mov eax, var_114
  loc_00613454: mov [ecx+00000008h], ebx
  loc_00613457: mov [ecx+0000000Ch], eax
  loc_0061345A: lea ecx, var_100
  loc_00613460: push ecx
  loc_00613461: lea eax, var_40
  loc_00613464: lea ecx, var_50
  loc_00613467: push eax
  loc_00613468: push ecx
  loc_00613469: call [004011B4h] ; __vbaVarCat
  loc_0061346F: push eax
  loc_00613470: lea edx, var_110
  loc_00613476: lea eax, var_60
  loc_00613479: push edx
  loc_0061347A: push eax
  loc_0061347B: call [004011B4h] ; __vbaVarCat
  loc_00613481: lea ecx, var_14
  loc_00613484: push eax
  loc_00613485: push ecx
  loc_00613486: call [004011B0h] ; __vbaStrVarVal
  loc_0061348C: mov edx, [0061A13Ch]
  loc_00613492: push eax
  loc_00613493: mov eax, var_168
  loc_00613499: push edx
  loc_0061349A: call [eax+0000005Ch]
  loc_0061349D: cmp eax, edi
  loc_0061349F: fnclex
  loc_006134A1: jge 006134B8h
  loc_006134A3: mov ecx, [0061A13Ch]
  loc_006134A9: push 0000005Ch
  loc_006134AB: push 0041E928h
  loc_006134B0: push ecx
  loc_006134B1: push eax
  loc_006134B2: call [00401074h] ; __vbaHresultCheckObj
  loc_006134B8: lea ecx, var_14
  loc_006134BB: call [004012ACh] ; __vbaFreeStr
  loc_006134C1: lea edx, var_60
  loc_006134C4: lea eax, var_50
  loc_006134C7: push edx
  loc_006134C8: lea ecx, var_40
  loc_006134CB: push eax
  loc_006134CC: push ecx
  loc_006134CD: push 00000003h
  loc_006134CF: call [00401038h] ; __vbaFreeVarList
  loc_006134D5: add esp, 00000010h
  loc_006134D8: lea edx, var_F0
  loc_006134DE: lea eax, var_40
  loc_006134E1: mov ebx, 80020004h
  loc_006134E6: push edx
  loc_006134E7: push eax
  loc_006134E8: mov var_F8, 0042EF00h ; "INSERT INTO Balance IN '"
  loc_006134F2: mov var_100, 00000008h
  loc_006134FC: mov var_E8, 0061A09Ch
  loc_00613506: mov var_F0, 00004008h
  loc_00613510: call [004010D4h] ; rtcTrimVar
  loc_00613516: mov ecx, [0061A13Ch]
  loc_0061351C: mov var_108, 0042EF38h ; "' SELECT * FROM Balance"
  loc_00613526: mov var_110, 00000008h
  loc_00613530: sub esp, 00000010h
  loc_00613533: mov edx, [ecx]
  loc_00613535: mov ecx, esp
  loc_00613537: mov eax, 0000000Ah
  loc_0061353C: mov var_16C, edx
  loc_00613542: mov [ecx], eax
  loc_00613544: mov eax, var_11C
  loc_0061354A: mov [ecx+00000004h], eax
  loc_0061354D: mov eax, var_114
  loc_00613553: mov [ecx+00000008h], ebx
  loc_00613556: mov [ecx+0000000Ch], eax
  loc_00613559: lea ecx, var_100
  loc_0061355F: push ecx
  loc_00613560: lea eax, var_40
  loc_00613563: lea ecx, var_50
  loc_00613566: push eax
  loc_00613567: push ecx
  loc_00613568: call [004011B4h] ; __vbaVarCat
  loc_0061356E: push eax
  loc_0061356F: lea edx, var_110
  loc_00613575: lea eax, var_60
  loc_00613578: push edx
  loc_00613579: push eax
  loc_0061357A: call [004011B4h] ; __vbaVarCat
  loc_00613580: lea ecx, var_14
  loc_00613583: push eax
  loc_00613584: push ecx
  loc_00613585: call [004011B0h] ; __vbaStrVarVal
  loc_0061358B: mov edx, [0061A13Ch]
  loc_00613591: push eax
  loc_00613592: mov eax, var_16C
  loc_00613598: push edx
  loc_00613599: call [eax+0000005Ch]
  loc_0061359C: cmp eax, edi
  loc_0061359E: fnclex
  loc_006135A0: jge 006135B7h
  loc_006135A2: mov ecx, [0061A13Ch]
  loc_006135A8: push 0000005Ch
  loc_006135AA: push 0041E928h
  loc_006135AF: push ecx
  loc_006135B0: push eax
  loc_006135B1: call [00401074h] ; __vbaHresultCheckObj
  loc_006135B7: lea ecx, var_14
  loc_006135BA: call [004012ACh] ; __vbaFreeStr
  loc_006135C0: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_006135C6: lea edx, var_60
  loc_006135C9: lea eax, var_50
  loc_006135CC: push edx
  loc_006135CD: lea ecx, var_40
  loc_006135D0: push eax
  loc_006135D1: push ecx
  loc_006135D2: push 00000003h
  loc_006135D4: call ebx
  loc_006135D6: mov ecx, 80020004h
  loc_006135DB: mov eax, 0000000Ah
  loc_006135E0: mov var_68, ecx
  loc_006135E3: mov var_58, ecx
  loc_006135E6: mov var_48, ecx
  loc_006135E9: add esp, 00000010h
  loc_006135EC: lea edx, var_F0
  loc_006135F2: lea ecx, var_40
  loc_006135F5: mov var_70, eax
  loc_006135F8: mov var_60, eax
  loc_006135FB: mov var_50, eax
  loc_006135FE: mov var_E8, 0041F378h ; "Save Successfully."
  loc_00613608: mov var_F0, 00000008h
  loc_00613612: call [00401240h] ; __vbaVarDup
  loc_00613618: lea edx, var_70
  loc_0061361B: lea eax, var_60
  loc_0061361E: push edx
  loc_0061361F: lea ecx, var_50
  loc_00613622: push eax
  loc_00613623: push ecx
  loc_00613624: lea edx, var_40
  loc_00613627: push 00000040h
  loc_00613629: push edx
  loc_0061362A: call [004010A4h] ; rtcMsgBox
  loc_00613630: lea eax, var_70
  loc_00613633: lea ecx, var_60
  loc_00613636: push eax
  loc_00613637: lea edx, var_50
  loc_0061363A: push ecx
  loc_0061363B: lea eax, var_40
  loc_0061363E: push edx
  loc_0061363F: push eax
  loc_00613640: push 00000004h
  loc_00613642: call ebx
  loc_00613644: mov ecx, [esi]
  loc_00613646: add esp, 00000014h
  loc_00613649: lea edx, var_40
  loc_0061364C: lea eax, var_124
  loc_00613652: push edx
  loc_00613653: push eax
  loc_00613654: push esi
  loc_00613655: mov var_124, FFFFFFFFh
  loc_0061365F: call [ecx+00000730h]
  loc_00613665: lea ecx, var_40
  loc_00613668: call [00401020h] ; __vbaFreeVar
  loc_0061366E: mov ecx, [esi]
  loc_00613670: lea edx, var_124
  loc_00613676: push edx
  loc_00613677: push esi
  loc_00613678: mov var_124, edi
  loc_0061367E: call [ecx+00000734h]
  loc_00613684: fwait
  loc_00613685: push 00613784h
  loc_0061368A: jmp 00613783h
  loc_0061368F: mov ecx, 80020004h
  loc_00613694: mov eax, 0000000Ah
  loc_00613699: mov var_68, ecx
  loc_0061369C: mov var_58, ecx
  loc_0061369F: mov var_48, ecx
  loc_006136A2: lea edx, var_F0
  loc_006136A8: lea ecx, var_40
  loc_006136AB: mov var_70, eax
  loc_006136AE: mov var_60, eax
  loc_006136B1: mov var_50, eax
  loc_006136B4: mov var_E8, 0041EA5Ch ; "Cann't Save Successfully."
  loc_006136BE: mov var_F0, 00000008h
  loc_006136C8: call [00401240h] ; __vbaVarDup
  loc_006136CE: lea eax, var_70
  loc_006136D1: lea ecx, var_60
  loc_006136D4: push eax
  loc_006136D5: lea edx, var_50
  loc_006136D8: push ecx
  loc_006136D9: push edx
  loc_006136DA: lea eax, var_40
  loc_006136DD: push 00000030h
  loc_006136DF: push eax
  loc_006136E0: call [004010A4h] ; rtcMsgBox
  loc_006136E6: lea ecx, var_70
  loc_006136E9: lea edx, var_60
  loc_006136EC: push ecx
  loc_006136ED: lea eax, var_50
  loc_006136F0: push edx
  loc_006136F1: lea ecx, var_40
  loc_006136F4: push eax
  loc_006136F5: push ecx
  loc_006136F6: push 00000004h
  loc_006136F8: call [00401038h] ; __vbaFreeVarList
  loc_006136FE: add esp, 00000014h
  loc_00613701: fwait
  loc_00613702: push 00613784h
  loc_00613707: jmp 00613783h
  loc_00613709: lea edx, var_24
  loc_0061370C: lea eax, var_20
  loc_0061370F: push edx
  loc_00613710: lea ecx, var_1C
  loc_00613713: push eax
  loc_00613714: lea edx, var_18
  loc_00613717: push ecx
  loc_00613718: lea eax, var_14
  loc_0061371B: push edx
  loc_0061371C: push eax
  loc_0061371D: push 00000005h
  loc_0061371F: call [004011FCh] ; __vbaFreeStrList
  loc_00613725: lea ecx, var_30
  loc_00613728: lea edx, var_2C
  loc_0061372B: push ecx
  loc_0061372C: lea eax, var_28
  loc_0061372F: push edx
  loc_00613730: push eax
  loc_00613731: push 00000003h
  loc_00613733: call [00401040h] ; __vbaFreeObjList
  loc_00613739: lea ecx, var_E0
  loc_0061373F: lea edx, var_D0
  loc_00613745: push ecx
  loc_00613746: lea eax, var_C0
  loc_0061374C: push edx
  loc_0061374D: lea ecx, var_B0
  loc_00613753: push eax
  loc_00613754: lea edx, var_A0
  loc_0061375A: push ecx
  loc_0061375B: lea eax, var_90
  loc_00613761: push edx
  loc_00613762: lea ecx, var_80
  loc_00613765: push eax
  loc_00613766: lea edx, var_70
  loc_00613769: push ecx
  loc_0061376A: lea eax, var_60
  loc_0061376D: push edx
  loc_0061376E: lea ecx, var_50
  loc_00613771: push eax
  loc_00613772: lea edx, var_40
  loc_00613775: push ecx
  loc_00613776: push edx
  loc_00613777: push 0000000Bh
  loc_00613779: call [00401038h] ; __vbaFreeVarList
  loc_0061377F: add esp, 00000058h
  loc_00613782: ret
  loc_00613783: ret
  loc_00613784: mov ecx, var_10
  loc_00613787: pop edi
  loc_00613788: pop esi
  loc_00613789: xor eax, eax
  loc_0061378B: mov fs:[00000000h], ecx
  loc_00613792: pop ebx
  loc_00613793: mov esp, ebp
  loc_00613795: pop ebp
  loc_00613796: retn 0004h
End Sub

Private Sub Proc_37_23_6137A0() '6137A0
  loc_006137A0: push ebp
  loc_006137A1: mov ebp, esp
  loc_006137A3: sub esp, 00000008h
  loc_006137A6: push 00403B36h ; __vbaExceptHandler
  loc_006137AB: mov eax, fs:[00000000h]
  loc_006137B1: push eax
  loc_006137B2: mov fs:[00000000h], esp
  loc_006137B9: sub esp, 00000198h
  loc_006137BF: push ebx
  loc_006137C0: push esi
  loc_006137C1: push edi
  loc_006137C2: mov var_8, esp
  loc_006137C5: mov var_4, 00403A10h
  loc_006137CC: mov ebx, Me
  loc_006137CF: xor edi, edi
  loc_006137D1: push edi
  loc_006137D2: push 00000014h
  loc_006137D4: mov eax, [ebx]
  loc_006137D6: push ebx
  loc_006137D7: mov var_14, edi
  loc_006137DA: mov var_18, edi
  loc_006137DD: mov var_1C, edi
  loc_006137E0: mov var_20, edi
  loc_006137E3: mov var_24, edi
  loc_006137E6: mov var_28, edi
  loc_006137E9: mov var_2C, edi
  loc_006137EC: mov var_30, edi
  loc_006137EF: mov var_40, edi
  loc_006137F2: mov var_50, edi
  loc_006137F5: mov var_60, edi
  loc_006137F8: mov var_70, edi
  loc_006137FB: mov var_80, edi
  loc_006137FE: mov var_90, edi
  loc_00613804: mov var_A0, edi
  loc_0061380A: mov var_B0, edi
  loc_00613810: mov var_C0, edi
  loc_00613816: mov var_D0, edi
  loc_0061381C: mov var_E0, edi
  loc_00613822: mov var_F0, edi
  loc_00613828: mov var_100, edi
  loc_0061382E: mov var_110, edi
  loc_00613834: mov var_120, edi
  loc_0061383A: mov var_130, edi
  loc_00613840: mov var_140, edi
  loc_00613846: mov var_144, edi
  loc_0061384C: mov var_148, edi
  loc_00613852: call [eax+00000348h]
  loc_00613858: mov esi, [004010A0h] ; __vbaObjSet
  loc_0061385E: lea ecx, var_24
  loc_00613861: push eax
  loc_00613862: push ecx
  loc_00613863: call __vbaObjSet
  loc_00613865: lea edx, var_40
  loc_00613868: push eax
  loc_00613869: push edx
  loc_0061386A: call [00401140h] ; __vbaLateIdCallLd
  loc_00613870: add esp, 00000010h
  loc_00613873: push eax
  loc_00613874: lea eax, var_50
  loc_00613877: push eax
  loc_00613878: call [004010D4h] ; rtcTrimVar
  loc_0061387E: mov ecx, [ebx]
  loc_00613880: push ebx
  loc_00613881: mov var_E8, 0041E5D4h
  loc_0061388B: mov var_F0, 00008008h
  loc_00613895: call [ecx+000002FCh]
  loc_0061389B: lea edx, var_28
  loc_0061389E: push eax
  loc_0061389F: push edx
  loc_006138A0: call __vbaObjSet
  loc_006138A2: mov esi, eax
  loc_006138A4: lea ecx, var_14
  loc_006138A7: push ecx
  loc_006138A8: push esi
  loc_006138A9: mov eax, [esi]
  loc_006138AB: call [eax+000000A8h]
  loc_006138B1: cmp eax, edi
  loc_006138B3: fnclex
  loc_006138B5: jge 006138C9h
  loc_006138B7: push 000000A8h
  loc_006138BC: push 0041F844h
  loc_006138C1: push esi
  loc_006138C2: push eax
  loc_006138C3: call [00401074h] ; __vbaHresultCheckObj
  loc_006138C9: mov eax, var_14
  loc_006138CC: lea edx, var_70
  loc_006138CF: mov var_68, eax
  loc_006138D2: lea eax, var_80
  loc_006138D5: push edx
  loc_006138D6: push eax
  loc_006138D7: mov var_14, edi
  loc_006138DA: mov var_70, 00000008h
  loc_006138E1: call [004010D4h] ; rtcTrimVar
  loc_006138E7: mov ecx, [ebx]
  loc_006138E9: push ebx
  loc_006138EA: mov var_F8, 0041E5D4h
  loc_006138F4: mov var_100, 00008008h
  loc_006138FE: call [ecx+00000308h]
  loc_00613904: lea edx, var_2C
  loc_00613907: push eax
  loc_00613908: push edx
  loc_00613909: call [004010A0h] ; __vbaObjSet
  loc_0061390F: mov esi, eax
  loc_00613911: lea ecx, var_18
  loc_00613914: push ecx
  loc_00613915: push esi
  loc_00613916: mov eax, [esi]
  loc_00613918: call [eax+000000A0h]
  loc_0061391E: cmp eax, edi
  loc_00613920: fnclex
  loc_00613922: jge 00613936h
  loc_00613924: push 000000A0h
  loc_00613929: push 0041E5E8h
  loc_0061392E: push esi
  loc_0061392F: push eax
  loc_00613930: call [00401074h] ; __vbaHresultCheckObj
  loc_00613936: mov eax, var_18
  loc_00613939: lea edx, var_B0
  loc_0061393F: mov var_A8, eax
  loc_00613945: lea eax, var_C0
  loc_0061394B: push edx
  loc_0061394C: push eax
  loc_0061394D: mov var_18, edi
  loc_00613950: mov var_B0, 00000008h
  loc_0061395A: call [004010D4h] ; rtcTrimVar
  loc_00613960: mov esi, [00401050h] ; __vbaVarCmpNe
  loc_00613966: lea ecx, var_50
  loc_00613969: lea edx, var_F0
  loc_0061396F: push ecx
  loc_00613970: lea eax, var_60
  loc_00613973: push edx
  loc_00613974: push eax
  loc_00613975: mov var_108, 0041E5D4h
  loc_0061397F: mov var_110, 00008008h
  loc_00613989: call __vbaVarCmpNe
  loc_0061398B: lea ecx, var_80
  loc_0061398E: push eax
  loc_0061398F: lea edx, var_100
  loc_00613995: push ecx
  loc_00613996: lea eax, var_90
  loc_0061399C: push edx
  loc_0061399D: push eax
  loc_0061399E: call __vbaVarCmpNe
  loc_006139A0: lea ecx, var_A0
  loc_006139A6: push eax
  loc_006139A7: push ecx
  loc_006139A8: call [0040115Ch] ; __vbaVarAnd
  loc_006139AE: push eax
  loc_006139AF: lea edx, var_C0
  loc_006139B5: lea eax, var_110
  loc_006139BB: push edx
  loc_006139BC: lea ecx, var_D0
  loc_006139C2: push eax
  loc_006139C3: push ecx
  loc_006139C4: call __vbaVarCmpNe
  loc_006139C6: lea edx, var_E0
  loc_006139CC: push eax
  loc_006139CD: push edx
  loc_006139CE: call [0040115Ch] ; __vbaVarAnd
  loc_006139D4: push eax
  loc_006139D5: call [004010E0h] ; __vbaBoolVarNull
  loc_006139DB: mov si, ax
  loc_006139DE: lea eax, var_2C
  loc_006139E1: lea ecx, var_28
  loc_006139E4: push eax
  loc_006139E5: lea edx, var_24
  loc_006139E8: push ecx
  loc_006139E9: push edx
  loc_006139EA: push 00000003h
  loc_006139EC: call [00401040h] ; __vbaFreeObjList
  loc_006139F2: lea eax, var_C0
  loc_006139F8: lea ecx, var_B0
  loc_006139FE: push eax
  loc_006139FF: lea edx, var_80
  loc_00613A02: push ecx
  loc_00613A03: lea eax, var_70
  loc_00613A06: push edx
  loc_00613A07: lea ecx, var_50
  loc_00613A0A: push eax
  loc_00613A0B: lea edx, var_40
  loc_00613A0E: push ecx
  loc_00613A0F: push edx
  loc_00613A10: push 00000006h
  loc_00613A12: call [00401038h] ; __vbaFreeVarList
  loc_00613A18: add esp, 0000002Ch
  loc_00613A1B: cmp si, di
  loc_00613A1E: jz 00614CD5h
  loc_00613A24: mov eax, [ebx]
  loc_00613A26: push ebx
  loc_00613A27: call [eax+00000300h]
  loc_00613A2D: lea ecx, var_24
  loc_00613A30: push eax
  loc_00613A31: push ecx
  loc_00613A32: call [004010A0h] ; __vbaObjSet
  loc_00613A38: mov esi, eax
  loc_00613A3A: lea eax, var_14
  loc_00613A3D: push eax
  loc_00613A3E: push esi
  loc_00613A3F: mov edx, [esi]
  loc_00613A41: call [edx+000000A0h]
  loc_00613A47: cmp eax, edi
  loc_00613A49: fnclex
  loc_00613A4B: jge 00613A5Fh
  loc_00613A4D: push 000000A0h
  loc_00613A52: push 0041E5E8h
  loc_00613A57: push esi
  loc_00613A58: push eax
  loc_00613A59: call [00401074h] ; __vbaHresultCheckObj
  loc_00613A5F: mov eax, var_14
  loc_00613A62: lea ecx, var_40
  loc_00613A65: lea edx, var_50
  loc_00613A68: mov esi, 00000008h
  loc_00613A6D: push ecx
  loc_00613A6E: push edx
  loc_00613A6F: mov var_14, edi
  loc_00613A72: mov var_38, eax
  loc_00613A75: mov var_40, esi
  loc_00613A78: call [004010D4h] ; rtcTrimVar
  loc_00613A7E: mov edx, [0061A13Ch]
  loc_00613A84: mov eax, 80020004h
  loc_00613A89: mov ecx, 0000000Ah
  loc_00613A8E: mov var_108, eax
  loc_00613A94: mov var_110, ecx
  loc_00613A9A: mov var_F8, 00000002h
  loc_00613AA4: mov var_100, 00000003h
  loc_00613AAE: mov var_E8, 004339ECh ; "Select * From Receive Where SrNo="
  loc_00613AB8: mov var_F0, esi
  loc_00613ABE: mov esi, [edx]
  loc_00613AC0: lea edx, var_28
  loc_00613AC3: push edx
  loc_00613AC4: sub esp, 00000010h
  loc_00613AC7: mov edx, esp
  loc_00613AC9: sub esp, 00000010h
  loc_00613ACC: mov [edx], ecx
  loc_00613ACE: mov ecx, var_11C
  loc_00613AD4: mov [edx+00000004h], ecx
  loc_00613AD7: mov ecx, esp
  loc_00613AD9: sub esp, 00000010h
  loc_00613ADC: mov [edx+00000008h], eax
  loc_00613ADF: mov eax, var_114
  loc_00613AE5: mov [edx+0000000Ch], eax
  loc_00613AE8: mov edx, var_110
  loc_00613AEE: mov eax, var_10C
  loc_00613AF4: mov [ecx], edx
  loc_00613AF6: mov edx, var_108
  loc_00613AFC: mov [ecx+00000004h], eax
  loc_00613AFF: mov eax, var_104
  loc_00613B05: mov [ecx+00000008h], edx
  loc_00613B08: mov edx, var_100
  loc_00613B0E: mov [ecx+0000000Ch], eax
  loc_00613B11: mov eax, var_FC
  loc_00613B17: mov ecx, esp
  loc_00613B19: mov [ecx], edx
  loc_00613B1B: mov edx, var_F8
  loc_00613B21: mov [ecx+00000004h], eax
  loc_00613B24: mov eax, var_F4
  loc_00613B2A: mov [ecx+00000008h], edx
  loc_00613B2D: lea edx, var_50
  loc_00613B30: mov [ecx+0000000Ch], eax
  loc_00613B33: lea ecx, var_F0
  loc_00613B39: push ecx
  loc_00613B3A: lea eax, var_60
  loc_00613B3D: push edx
  loc_00613B3E: push eax
  loc_00613B3F: call [004011B4h] ; __vbaVarCat
  loc_00613B45: lea ecx, var_18
  loc_00613B48: push eax
  loc_00613B49: push ecx
  loc_00613B4A: call [004011B0h] ; __vbaStrVarVal
  loc_00613B50: mov edx, [0061A13Ch]
  loc_00613B56: push eax
  loc_00613B57: push edx
  loc_00613B58: call [esi+000000BCh]
  loc_00613B5E: cmp eax, edi
  loc_00613B60: fnclex
  loc_00613B62: jge 00613B7Ch
  loc_00613B64: mov ecx, [0061A13Ch]
  loc_00613B6A: push 000000BCh
  loc_00613B6F: push 0041E928h
  loc_00613B74: push ecx
  loc_00613B75: push eax
  loc_00613B76: call [00401074h] ; __vbaHresultCheckObj
  loc_00613B7C: mov edx, var_28
  loc_00613B7F: lea esi, [ebx+00000034h]
  loc_00613B82: push edx
  loc_00613B83: push esi
  loc_00613B84: call [004010B8h] ; __vbaObjSetAddref
  loc_00613B8A: lea ecx, var_18
  loc_00613B8D: call [004012ACh] ; __vbaFreeStr
  loc_00613B93: lea eax, var_28
  loc_00613B96: lea ecx, var_24
  loc_00613B99: push eax
  loc_00613B9A: push ecx
  loc_00613B9B: push 00000002h
  loc_00613B9D: call [00401040h] ; __vbaFreeObjList
  loc_00613BA3: lea edx, var_60
  loc_00613BA6: lea eax, var_50
  loc_00613BA9: push edx
  loc_00613BAA: lea ecx, var_40
  loc_00613BAD: push eax
  loc_00613BAE: push ecx
  loc_00613BAF: push 00000003h
  loc_00613BB1: call [00401038h] ; __vbaFreeVarList
  loc_00613BB7: mov eax, [esi]
  loc_00613BB9: add esp, 0000001Ch
  loc_00613BBC: lea ecx, var_144
  loc_00613BC2: mov edx, [eax]
  loc_00613BC4: push ecx
  loc_00613BC5: push eax
  loc_00613BC6: call [edx+00000020h]
  loc_00613BC9: cmp eax, edi
  loc_00613BCB: fnclex
  loc_00613BCD: jge 00613BE0h
  loc_00613BCF: mov edx, [esi]
  loc_00613BD1: push 00000020h
  loc_00613BD3: push 0041E938h
  loc_00613BD8: push edx
  loc_00613BD9: push eax
  loc_00613BDA: call [00401074h] ; __vbaHresultCheckObj
  loc_00613BE0: mov eax, [esi]
  loc_00613BE2: lea edx, var_148
  loc_00613BE8: push edx
  loc_00613BE9: push eax
  loc_00613BEA: mov ecx, [eax]
  loc_00613BEC: call [ecx+00000034h]
  loc_00613BEF: cmp eax, edi
  loc_00613BF1: fnclex
  loc_00613BF3: jge 00613C06h
  loc_00613BF5: mov ecx, [esi]
  loc_00613BF7: push 00000034h
  loc_00613BF9: push 0041E938h
  loc_00613BFE: push ecx
  loc_00613BFF: push eax
  loc_00613C00: call [00401074h] ; __vbaHresultCheckObj
  loc_00613C06: xor edx, edx
  loc_00613C08: cmp var_148, di
  loc_00613C0F: setz dl
  loc_00613C12: xor eax, eax
  loc_00613C14: cmp var_144, di
  loc_00613C1B: setz al
  loc_00613C1E: or edx, eax
  loc_00613C20: jz 00613EA9h
  loc_00613C26: mov eax, [esi]
  loc_00613C28: lea edx, var_24
  loc_00613C2B: mov var_F8, 0042B5E8h ; "Update Balance SET Amount=Amount+"
  loc_00613C35: mov var_100, 00000008h
  loc_00613C3F: mov ecx, [eax]
  loc_00613C41: push edx
  loc_00613C42: push eax
  loc_00613C43: call [ecx+000000B4h]
  loc_00613C49: cmp eax, edi
  loc_00613C4B: fnclex
  loc_00613C4D: jge 00613C63h
  loc_00613C4F: mov ecx, [esi]
  loc_00613C51: push 000000B4h
  loc_00613C56: push 0041E938h
  loc_00613C5B: push ecx
  loc_00613C5C: push eax
  loc_00613C5D: call [00401074h] ; __vbaHresultCheckObj
  loc_00613C63: lea ebx, var_28
  loc_00613C66: mov eax, var_24
  loc_00613C69: push ebx
  loc_00613C6A: mov ecx, 00000008h
  loc_00613C6F: sub esp, 00000010h
  loc_00613C72: mov var_F0, ecx
  loc_00613C78: mov ebx, esp
  loc_00613C7A: mov var_E8, 0042043Ch ; "Amount"
  loc_00613C84: mov edx, [eax]
  loc_00613C86: push eax
  loc_00613C87: mov [ebx], ecx
  loc_00613C89: mov ecx, var_EC
  loc_00613C8F: mov var_150, eax
  loc_00613C95: mov [ebx+00000004h], ecx
  loc_00613C98: mov ecx, var_E8
  loc_00613C9E: mov [ebx+00000008h], ecx
  loc_00613CA1: mov ecx, var_E4
  loc_00613CA7: mov [ebx+0000000Ch], ecx
  loc_00613CAA: call [edx+00000030h]
  loc_00613CAD: cmp eax, edi
  loc_00613CAF: fnclex
  loc_00613CB1: jge 00613CC8h
  loc_00613CB3: mov edx, var_150
  loc_00613CB9: push 00000030h
  loc_00613CBB: push 0041EA14h ; "S"
  loc_00613CC0: push edx
  loc_00613CC1: push eax
  loc_00613CC2: call [00401074h] ; __vbaHresultCheckObj
  loc_00613CC8: mov eax, var_28
  loc_00613CCB: lea edx, var_40
  loc_00613CCE: push edx
  loc_00613CCF: push eax
  loc_00613CD0: mov ecx, [eax]
  loc_00613CD2: mov ebx, eax
  loc_00613CD4: call [ecx+00000044h]
  loc_00613CD7: cmp eax, edi
  loc_00613CD9: fnclex
  loc_00613CDB: jge 00613CECh
  loc_00613CDD: push 00000044h
  loc_00613CDF: push 0041EA48h
  loc_00613CE4: push ebx
  loc_00613CE5: push eax
  loc_00613CE6: call [00401074h] ; __vbaHresultCheckObj
  loc_00613CEC: mov eax, [esi]
  loc_00613CEE: lea edx, var_2C
  loc_00613CF1: mov var_108, 0042B630h ; " Where Name='"
  loc_00613CFB: mov var_110, 00000008h
  loc_00613D05: mov ecx, [eax]
  loc_00613D07: push edx
  loc_00613D08: push eax
  loc_00613D09: call [ecx+000000B4h]
  loc_00613D0F: cmp eax, edi
  loc_00613D11: fnclex
  loc_00613D13: jge 00613D29h
  loc_00613D15: mov ecx, [esi]
  loc_00613D17: push 000000B4h
  loc_00613D1C: push 0041E938h
  loc_00613D21: push ecx
  loc_00613D22: push eax
  loc_00613D23: call [00401074h] ; __vbaHresultCheckObj
  loc_00613D29: lea ebx, var_30
  loc_00613D2C: mov eax, var_2C
  loc_00613D2F: push ebx
  loc_00613D30: mov ecx, 00000008h
  loc_00613D35: sub esp, 00000010h
  loc_00613D38: mov edx, [eax]
  loc_00613D3A: mov ebx, esp
  loc_00613D3C: mov var_164, eax
  loc_00613D42: push eax
  loc_00613D43: mov [ebx], ecx
  loc_00613D45: mov ecx, var_11C
  loc_00613D4B: mov [ebx+00000004h], ecx
  loc_00613D4E: mov ecx, 0041EA08h ; "Name"
  loc_00613D53: mov [ebx+00000008h], ecx
  loc_00613D56: mov ecx, var_114
  loc_00613D5C: mov [ebx+0000000Ch], ecx
  loc_00613D5F: call [edx+00000030h]
  loc_00613D62: cmp eax, edi
  loc_00613D64: fnclex
  loc_00613D66: jge 00613D7Dh
  loc_00613D68: mov edx, var_164
  loc_00613D6E: push 00000030h
  loc_00613D70: push 0041EA14h ; "S"
  loc_00613D75: push edx
  loc_00613D76: push eax
  loc_00613D77: call [00401074h] ; __vbaHresultCheckObj
  loc_00613D7D: mov eax, var_30
  loc_00613D80: lea ecx, var_80
  loc_00613D83: mov var_68, eax
  loc_00613D86: lea eax, var_70
  loc_00613D89: push eax
  loc_00613D8A: push ecx
  loc_00613D8B: mov var_30, edi
  loc_00613D8E: mov var_70, 00000009h
  loc_00613D95: call [004010D4h] ; rtcTrimVar
  loc_00613D9B: mov edx, [0061A13Ch]
  loc_00613DA1: sub esp, 00000010h
  loc_00613DA4: mov ecx, esp
  loc_00613DA6: mov eax, 0000000Ah
  loc_00613DAB: mov var_128, 0041E890h ; "'"
  loc_00613DB5: mov var_130, 00000008h
  loc_00613DBF: mov ebx, [edx]
  loc_00613DC1: mov edx, var_13C
  loc_00613DC7: mov [ecx], eax
  loc_00613DC9: mov eax, 80020004h
  loc_00613DCE: mov [ecx+00000004h], edx
  loc_00613DD1: lea edx, var_40
  loc_00613DD4: mov [ecx+00000008h], eax
  loc_00613DD7: mov eax, var_134
  loc_00613DDD: mov [ecx+0000000Ch], eax
  loc_00613DE0: lea ecx, var_100
  loc_00613DE6: push ecx
  loc_00613DE7: lea eax, var_50
  loc_00613DEA: push edx
  loc_00613DEB: push eax
  loc_00613DEC: call [004011B4h] ; __vbaVarCat
  loc_00613DF2: lea ecx, var_110
  loc_00613DF8: push eax
  loc_00613DF9: lea edx, var_60
  loc_00613DFC: push ecx
  loc_00613DFD: push edx
  loc_00613DFE: call [004011B4h] ; __vbaVarCat
  loc_00613E04: push eax
  loc_00613E05: lea eax, var_80
  loc_00613E08: lea ecx, var_90
  loc_00613E0E: push eax
  loc_00613E0F: push ecx
  loc_00613E10: call [004011B4h] ; __vbaVarCat
  loc_00613E16: push eax
  loc_00613E17: lea edx, var_130
  loc_00613E1D: lea eax, var_A0
  loc_00613E23: push edx
  loc_00613E24: push eax
  loc_00613E25: call [004011B4h] ; __vbaVarCat
  loc_00613E2B: lea ecx, var_14
  loc_00613E2E: push eax
  loc_00613E2F: push ecx
  loc_00613E30: call [004011B0h] ; __vbaStrVarVal
  loc_00613E36: mov edx, [0061A13Ch]
  loc_00613E3C: push eax
  loc_00613E3D: push edx
  loc_00613E3E: call [ebx+0000005Ch]
  loc_00613E41: cmp eax, edi
  loc_00613E43: fnclex
  loc_00613E45: jge 00613E5Ch
  loc_00613E47: mov ecx, [0061A13Ch]
  loc_00613E4D: push 0000005Ch
  loc_00613E4F: push 0041E928h
  loc_00613E54: push ecx
  loc_00613E55: push eax
  loc_00613E56: call [00401074h] ; __vbaHresultCheckObj
  loc_00613E5C: lea ecx, var_14
  loc_00613E5F: call [004012ACh] ; __vbaFreeStr
  loc_00613E65: lea edx, var_2C
  loc_00613E68: lea eax, var_28
  loc_00613E6B: push edx
  loc_00613E6C: lea ecx, var_24
  loc_00613E6F: push eax
  loc_00613E70: push ecx
  loc_00613E71: push 00000003h
  loc_00613E73: call [00401040h] ; __vbaFreeObjList
  loc_00613E79: lea edx, var_A0
  loc_00613E7F: lea eax, var_90
  loc_00613E85: push edx
  loc_00613E86: lea ecx, var_80
  loc_00613E89: push eax
  loc_00613E8A: lea edx, var_60
  loc_00613E8D: push ecx
  loc_00613E8E: lea eax, var_70
  loc_00613E91: push edx
  loc_00613E92: lea ecx, var_50
  loc_00613E95: push eax
  loc_00613E96: lea edx, var_40
  loc_00613E99: push ecx
  loc_00613E9A: push edx
  loc_00613E9B: push 00000007h
  loc_00613E9D: call [00401038h] ; __vbaFreeVarList
  loc_00613EA3: mov ebx, Me
  loc_00613EA6: add esp, 00000030h
  loc_00613EA9: mov eax, [esi]
  loc_00613EAB: push eax
  loc_00613EAC: mov ecx, [eax]
  loc_00613EAE: call [ecx+000000C4h]
  loc_00613EB4: cmp eax, edi
  loc_00613EB6: fnclex
  loc_00613EB8: jge 00613ECEh
  loc_00613EBA: mov edx, [esi]
  loc_00613EBC: push 000000C4h
  loc_00613EC1: push 0041E938h
  loc_00613EC6: push edx
  loc_00613EC7: push eax
  loc_00613EC8: call [00401074h] ; __vbaHresultCheckObj
  loc_00613ECE: push 0041E938h
  loc_00613ED3: push edi
  loc_00613ED4: call [00401274h] ; __vbaCastObj
  loc_00613EDA: push eax
  loc_00613EDB: lea eax, var_24
  loc_00613EDE: push eax
  loc_00613EDF: call [004010A0h] ; __vbaObjSet
  loc_00613EE5: push eax
  loc_00613EE6: push esi
  loc_00613EE7: call [004010B8h] ; __vbaObjSetAddref
  loc_00613EED: lea ecx, var_24
  loc_00613EF0: call [004012B0h] ; __vbaFreeObj
  loc_00613EF6: mov ecx, [ebx]
  loc_00613EF8: push ebx
  loc_00613EF9: mov var_F8, 80020004h
  loc_00613F03: mov var_100, 0000000Ah
  loc_00613F0D: mov var_E8, 0042B650h ; "Delete From Receive Where SrNo="
  loc_00613F17: mov var_F0, 00000008h
  loc_00613F21: call [ecx+00000300h]
  loc_00613F27: lea edx, var_24
  loc_00613F2A: push eax
  loc_00613F2B: push edx
  loc_00613F2C: call [004010A0h] ; __vbaObjSet
  loc_00613F32: mov ebx, eax
  loc_00613F34: lea ecx, var_14
  loc_00613F37: push ecx
  loc_00613F38: push ebx
  loc_00613F39: mov eax, [ebx]
  loc_00613F3B: call [eax+000000A0h]
  loc_00613F41: cmp eax, edi
  loc_00613F43: fnclex
  loc_00613F45: jge 00613F59h
  loc_00613F47: push 000000A0h
  loc_00613F4C: push 0041E5E8h
  loc_00613F51: push ebx
  loc_00613F52: push eax
  loc_00613F53: call [00401074h] ; __vbaHresultCheckObj
  loc_00613F59: mov eax, var_14
  loc_00613F5C: lea edx, var_40
  loc_00613F5F: mov var_38, eax
  loc_00613F62: lea eax, var_50
  loc_00613F65: push edx
  loc_00613F66: push eax
  loc_00613F67: mov var_14, edi
  loc_00613F6A: mov var_40, 00000008h
  loc_00613F71: call [004010D4h] ; rtcTrimVar
  loc_00613F77: mov ecx, [0061A13Ch]
  loc_00613F7D: mov eax, var_100
  loc_00613F83: sub esp, 00000010h
  loc_00613F86: mov ebx, [ecx]
  loc_00613F88: mov ecx, var_FC
  loc_00613F8E: mov edx, esp
  loc_00613F90: mov [edx], eax
  loc_00613F92: mov eax, var_F8
  loc_00613F98: mov [edx+00000004h], ecx
  loc_00613F9B: mov ecx, var_F4
  loc_00613FA1: mov [edx+00000008h], eax
  loc_00613FA4: lea eax, var_50
  loc_00613FA7: mov [edx+0000000Ch], ecx
  loc_00613FAA: lea edx, var_F0
  loc_00613FB0: push edx
  loc_00613FB1: lea ecx, var_60
  loc_00613FB4: push eax
  loc_00613FB5: push ecx
  loc_00613FB6: call [004011B4h] ; __vbaVarCat
  loc_00613FBC: lea edx, var_18
  loc_00613FBF: push eax
  loc_00613FC0: push edx
  loc_00613FC1: call [004011B0h] ; __vbaStrVarVal
  loc_00613FC7: push eax
  loc_00613FC8: mov eax, [0061A13Ch]
  loc_00613FCD: push eax
  loc_00613FCE: call [ebx+0000005Ch]
  loc_00613FD1: cmp eax, edi
  loc_00613FD3: fnclex
  loc_00613FD5: jge 00613FECh
  loc_00613FD7: mov ecx, [0061A13Ch]
  loc_00613FDD: push 0000005Ch
  loc_00613FDF: push 0041E928h
  loc_00613FE4: push ecx
  loc_00613FE5: push eax
  loc_00613FE6: call [00401074h] ; __vbaHresultCheckObj
  loc_00613FEC: lea ecx, var_18
  loc_00613FEF: call [004012ACh] ; __vbaFreeStr
  loc_00613FF5: lea ecx, var_24
  loc_00613FF8: call [004012B0h] ; __vbaFreeObj
  loc_00613FFE: lea edx, var_60
  loc_00614001: lea eax, var_50
  loc_00614004: push edx
  loc_00614005: lea ecx, var_40
  loc_00614008: push eax
  loc_00614009: push ecx
  loc_0061400A: push 00000003h
  loc_0061400C: call [00401038h] ; __vbaFreeVarList
  loc_00614012: add esp, 00000010h
  loc_00614015: lea ebx, var_24
  loc_00614018: mov ecx, 0000000Ah
  loc_0061401D: mov eax, 80020004h
  loc_00614022: push ebx
  loc_00614023: mov var_110, ecx
  loc_00614029: sub esp, 00000010h
  loc_0061402C: mov var_100, ecx
  loc_00614032: mov ebx, esp
  loc_00614034: mov var_108, eax
  loc_0061403A: mov var_F8, eax
  loc_00614040: sub esp, 00000010h
  loc_00614043: mov [ebx], ecx
  loc_00614045: mov ecx, var_10C
  loc_0061404B: mov var_F0, 00000003h
  loc_00614055: mov edx, [0061A13Ch]
  loc_0061405B: mov [ebx+00000004h], ecx
  loc_0061405E: mov ecx, esp
  loc_00614060: sub esp, 00000010h
  loc_00614063: mov var_E8, 00000002h
  loc_0061406D: mov [ebx+00000008h], eax
  loc_00614070: mov eax, var_104
  loc_00614076: mov edx, [edx]
  loc_00614078: mov [ebx+0000000Ch], eax
  loc_0061407B: mov eax, var_100
  loc_00614081: mov [ecx], eax
  loc_00614083: mov eax, var_FC
  loc_00614089: mov [ecx+00000004h], eax
  loc_0061408C: mov eax, var_F8
  loc_00614092: mov [ecx+00000008h], eax
  loc_00614095: mov eax, var_F4
  loc_0061409B: mov [ecx+0000000Ch], eax
  loc_0061409E: mov eax, var_F0
  loc_006140A4: mov ecx, esp
  loc_006140A6: push 0042ACD0h ; "Select * From Receive"
  loc_006140AB: mov [ecx], eax
  loc_006140AD: mov eax, var_EC
  loc_006140B3: mov [ecx+00000004h], eax
  loc_006140B6: mov eax, var_E8
  loc_006140BC: mov [ecx+00000008h], eax
  loc_006140BF: mov eax, var_E4
  loc_006140C5: mov [ecx+0000000Ch], eax
  loc_006140C8: mov ecx, [0061A13Ch]
  loc_006140CE: push ecx
  loc_006140CF: call [edx+000000BCh]
  loc_006140D5: cmp eax, edi
  loc_006140D7: fnclex
  loc_006140D9: jge 006140F3h
  loc_006140DB: mov edx, [0061A13Ch]
  loc_006140E1: push 000000BCh
  loc_006140E6: push 0041E928h
  loc_006140EB: push edx
  loc_006140EC: push eax
  loc_006140ED: call [00401074h] ; __vbaHresultCheckObj
  loc_006140F3: mov eax, var_24
  loc_006140F6: push eax
  loc_006140F7: push esi
  loc_006140F8: call [004010B8h] ; __vbaObjSetAddref
  loc_006140FE: lea ecx, var_24
  loc_00614101: call [004012B0h] ; __vbaFreeObj
  loc_00614107: mov eax, [esi]
  loc_00614109: push eax
  loc_0061410A: mov ecx, [eax]
  loc_0061410C: call [ecx+000000C0h]
  loc_00614112: cmp eax, edi
  loc_00614114: fnclex
  loc_00614116: jge 0061412Ch
  loc_00614118: mov edx, [esi]
  loc_0061411A: push 000000C0h
  loc_0061411F: push 0041E938h
  loc_00614124: push edx
  loc_00614125: push eax
  loc_00614126: call [00401074h] ; __vbaHresultCheckObj
  loc_0061412C: mov ebx, Me
  loc_0061412F: push ebx
  loc_00614130: mov eax, [ebx]
  loc_00614132: call [eax+00000300h]
  loc_00614138: lea ecx, var_24
  loc_0061413B: push eax
  loc_0061413C: push ecx
  loc_0061413D: call [004010A0h] ; __vbaObjSet
  loc_00614143: mov edx, [eax]
  loc_00614145: lea ecx, var_14
  loc_00614148: push ecx
  loc_00614149: push eax
  loc_0061414A: mov var_14C, eax
  loc_00614150: call [edx+000000A0h]
  loc_00614156: cmp eax, edi
  loc_00614158: fnclex
  loc_0061415A: jge 00614174h
  loc_0061415C: mov edx, var_14C
  loc_00614162: push 000000A0h
  loc_00614167: push 0041E5E8h
  loc_0061416C: push edx
  loc_0061416D: push eax
  loc_0061416E: call [00401074h] ; __vbaHresultCheckObj
  loc_00614174: mov eax, var_14
  loc_00614177: lea ecx, var_50
  loc_0061417A: mov var_38, eax
  loc_0061417D: lea eax, var_40
  loc_00614180: push eax
  loc_00614181: push ecx
  loc_00614182: mov var_14, edi
  loc_00614185: mov var_40, 00000008h
  loc_0061418C: call [004010D4h] ; rtcTrimVar
  loc_00614192: mov eax, [esi]
  loc_00614194: mov ecx, var_50
  loc_00614197: mov var_E8, 0041EDD8h ; "SrNo"
  loc_006141A1: mov var_F0, 00000008h
  loc_006141AB: mov edx, [eax]
  loc_006141AD: sub esp, 00000010h
  loc_006141B0: mov eax, esp
  loc_006141B2: sub esp, 00000010h
  loc_006141B5: mov [eax], ecx
  loc_006141B7: mov ecx, var_4C
  loc_006141BA: mov [eax+00000004h], ecx
  loc_006141BD: mov ecx, var_48
  loc_006141C0: mov [eax+00000008h], ecx
  loc_006141C3: mov ecx, var_44
  loc_006141C6: mov [eax+0000000Ch], ecx
  loc_006141C9: mov ecx, var_F0
  loc_006141CF: mov eax, esp
  loc_006141D1: mov [eax], ecx
  loc_006141D3: mov ecx, var_EC
  loc_006141D9: mov [eax+00000004h], ecx
  loc_006141DC: mov ecx, var_E8
  loc_006141E2: mov [eax+00000008h], ecx
  loc_006141E5: mov ecx, var_E4
  loc_006141EB: mov [eax+0000000Ch], ecx
  loc_006141EE: mov eax, [esi]
  loc_006141F0: push eax
  loc_006141F1: call [edx+00000128h]
  loc_006141F7: cmp eax, edi
  loc_006141F9: fnclex
  loc_006141FB: jge 00614211h
  loc_006141FD: mov edx, [esi]
  loc_006141FF: push 00000128h
  loc_00614204: push 0041E938h
  loc_00614209: push edx
  loc_0061420A: push eax
  loc_0061420B: call [00401074h] ; __vbaHresultCheckObj
  loc_00614211: lea ecx, var_24
  loc_00614214: call [004012B0h] ; __vbaFreeObj
  loc_0061421A: lea eax, var_50
  loc_0061421D: lea ecx, var_40
  loc_00614220: push eax
  loc_00614221: push ecx
  loc_00614222: push 00000002h
  loc_00614224: call [00401038h] ; __vbaFreeVarList
  loc_0061422A: mov edx, [ebx]
  loc_0061422C: add esp, 0000000Ch
  loc_0061422F: push edi
  loc_00614230: push 00000014h
  loc_00614232: push ebx
  loc_00614233: call [edx+00000348h]
  loc_00614239: push eax
  loc_0061423A: lea eax, var_24
  loc_0061423D: push eax
  loc_0061423E: call [004010A0h] ; __vbaObjSet
  loc_00614244: lea ecx, var_40
  loc_00614247: push eax
  loc_00614248: push ecx
  loc_00614249: call [00401140h] ; __vbaLateIdCallLd
  loc_0061424F: add esp, 00000010h
  loc_00614252: lea edx, var_50
  loc_00614255: push eax
  loc_00614256: push edx
  loc_00614257: call [004010D4h] ; rtcTrimVar
  loc_0061425D: mov eax, [esi]
  loc_0061425F: sub esp, 00000010h
  loc_00614262: mov var_E8, 0041FBA8h ; "OnDate"
  loc_0061426C: mov var_F0, 00000008h
  loc_00614276: mov ecx, [eax]
  loc_00614278: mov eax, var_50
  loc_0061427B: mov edx, esp
  loc_0061427D: sub esp, 00000010h
  loc_00614280: mov [edx], eax
  loc_00614282: mov eax, var_4C
  loc_00614285: mov [edx+00000004h], eax
  loc_00614288: mov eax, var_48
  loc_0061428B: mov [edx+00000008h], eax
  loc_0061428E: mov eax, var_44
  loc_00614291: mov [edx+0000000Ch], eax
  loc_00614294: mov eax, var_F0
  loc_0061429A: mov edx, esp
  loc_0061429C: mov [edx], eax
  loc_0061429E: mov eax, var_EC
  loc_006142A4: mov [edx+00000004h], eax
  loc_006142A7: mov eax, var_E8
  loc_006142AD: mov [edx+00000008h], eax
  loc_006142B0: mov eax, var_E4
  loc_006142B6: mov [edx+0000000Ch], eax
  loc_006142B9: mov eax, [esi]
  loc_006142BB: push eax
  loc_006142BC: call [ecx+00000128h]
  loc_006142C2: cmp eax, edi
  loc_006142C4: fnclex
  loc_006142C6: jge 006142DCh
  loc_006142C8: mov ecx, [esi]
  loc_006142CA: push 00000128h
  loc_006142CF: push 0041E938h
  loc_006142D4: push ecx
  loc_006142D5: push eax
  loc_006142D6: call [00401074h] ; __vbaHresultCheckObj
  loc_006142DC: lea ecx, var_24
  loc_006142DF: call [004012B0h] ; __vbaFreeObj
  loc_006142E5: lea edx, var_50
  loc_006142E8: lea eax, var_40
  loc_006142EB: push edx
  loc_006142EC: push eax
  loc_006142ED: push 00000002h
  loc_006142EF: call [00401038h] ; __vbaFreeVarList
  loc_006142F5: mov ecx, [ebx]
  loc_006142F7: add esp, 0000000Ch
  loc_006142FA: push ebx
  loc_006142FB: call [ecx+000002FCh]
  loc_00614301: lea edx, var_24
  loc_00614304: push eax
  loc_00614305: push edx
  loc_00614306: call [004010A0h] ; __vbaObjSet
  loc_0061430C: mov ecx, [eax]
  loc_0061430E: lea edx, var_14
  loc_00614311: push edx
  loc_00614312: push eax
  loc_00614313: mov var_14C, eax
  loc_00614319: call [ecx+000000A8h]
  loc_0061431F: cmp eax, edi
  loc_00614321: fnclex
  loc_00614323: jge 0061433Dh
  loc_00614325: mov ecx, var_14C
  loc_0061432B: push 000000A8h
  loc_00614330: push 0041F844h
  loc_00614335: push ecx
  loc_00614336: push eax
  loc_00614337: call [00401074h] ; __vbaHresultCheckObj
  loc_0061433D: mov eax, var_14
  loc_00614340: lea edx, var_40
  loc_00614343: mov var_38, eax
  loc_00614346: lea eax, var_50
  loc_00614349: push edx
  loc_0061434A: push eax
  loc_0061434B: mov var_14, edi
  loc_0061434E: mov var_40, 00000008h
  loc_00614355: call [004010D4h] ; rtcTrimVar
  loc_0061435B: mov eax, [esi]
  loc_0061435D: sub esp, 00000010h
  loc_00614360: mov var_E8, 0041EA08h ; "Name"
  loc_0061436A: mov var_F0, 00000008h
  loc_00614374: mov ecx, [eax]
  loc_00614376: mov eax, var_50
  loc_00614379: mov edx, esp
  loc_0061437B: sub esp, 00000010h
  loc_0061437E: mov [edx], eax
  loc_00614380: mov eax, var_4C
  loc_00614383: mov [edx+00000004h], eax
  loc_00614386: mov eax, var_48
  loc_00614389: mov [edx+00000008h], eax
  loc_0061438C: mov eax, var_44
  loc_0061438F: mov [edx+0000000Ch], eax
  loc_00614392: mov eax, var_F0
  loc_00614398: mov edx, esp
  loc_0061439A: mov [edx], eax
  loc_0061439C: mov eax, var_EC
  loc_006143A2: mov [edx+00000004h], eax
  loc_006143A5: mov eax, var_E8
  loc_006143AB: mov [edx+00000008h], eax
  loc_006143AE: mov eax, var_E4
  loc_006143B4: mov [edx+0000000Ch], eax
  loc_006143B7: mov eax, [esi]
  loc_006143B9: push eax
  loc_006143BA: call [ecx+00000128h]
  loc_006143C0: cmp eax, edi
  loc_006143C2: fnclex
  loc_006143C4: jge 006143DAh
  loc_006143C6: mov ecx, [esi]
  loc_006143C8: push 00000128h
  loc_006143CD: push 0041E938h
  loc_006143D2: push ecx
  loc_006143D3: push eax
  loc_006143D4: call [00401074h] ; __vbaHresultCheckObj
  loc_006143DA: lea ecx, var_24
  loc_006143DD: call [004012B0h] ; __vbaFreeObj
  loc_006143E3: lea edx, var_50
  loc_006143E6: lea eax, var_40
  loc_006143E9: push edx
  loc_006143EA: push eax
  loc_006143EB: push 00000002h
  loc_006143ED: call [00401038h] ; __vbaFreeVarList
  loc_006143F3: mov ecx, [ebx]
  loc_006143F5: add esp, 0000000Ch
  loc_006143F8: push ebx
  loc_006143F9: call [ecx+00000308h]
  loc_006143FF: lea edx, var_24
  loc_00614402: push eax
  loc_00614403: push edx
  loc_00614404: call [004010A0h] ; __vbaObjSet
  loc_0061440A: mov ecx, [eax]
  loc_0061440C: lea edx, var_14
  loc_0061440F: push edx
  loc_00614410: push eax
  loc_00614411: mov var_14C, eax
  loc_00614417: call [ecx+000000A0h]
  loc_0061441D: cmp eax, edi
  loc_0061441F: fnclex
  loc_00614421: jge 0061443Bh
  loc_00614423: mov ecx, var_14C
  loc_00614429: push 000000A0h
  loc_0061442E: push 0041E5E8h
  loc_00614433: push ecx
  loc_00614434: push eax
  loc_00614435: call [00401074h] ; __vbaHresultCheckObj
  loc_0061443B: mov eax, var_14
  loc_0061443E: lea edx, var_40
  loc_00614441: mov var_38, eax
  loc_00614444: lea eax, var_50
  loc_00614447: push edx
  loc_00614448: push eax
  loc_00614449: mov var_14, edi
  loc_0061444C: mov var_40, 00000008h
  loc_00614453: call [004010D4h] ; rtcTrimVar
  loc_00614459: mov eax, [esi]
  loc_0061445B: sub esp, 00000010h
  loc_0061445E: mov var_E8, 0042043Ch ; "Amount"
  loc_00614468: mov var_F0, 00000008h
  loc_00614472: mov ecx, [eax]
  loc_00614474: mov eax, var_50
  loc_00614477: mov edx, esp
  loc_00614479: sub esp, 00000010h
  loc_0061447C: mov [edx], eax
  loc_0061447E: mov eax, var_4C
  loc_00614481: mov [edx+00000004h], eax
  loc_00614484: mov eax, var_48
  loc_00614487: mov [edx+00000008h], eax
  loc_0061448A: mov eax, var_44
  loc_0061448D: mov [edx+0000000Ch], eax
  loc_00614490: mov eax, var_F0
  loc_00614496: mov edx, esp
  loc_00614498: mov [edx], eax
  loc_0061449A: mov eax, var_EC
  loc_006144A0: mov [edx+00000004h], eax
  loc_006144A3: mov eax, var_E8
  loc_006144A9: mov [edx+00000008h], eax
  loc_006144AC: mov eax, var_E4
  loc_006144B2: mov [edx+0000000Ch], eax
  loc_006144B5: mov eax, [esi]
  loc_006144B7: push eax
  loc_006144B8: call [ecx+00000128h]
  loc_006144BE: cmp eax, edi
  loc_006144C0: fnclex
  loc_006144C2: jge 006144D8h
  loc_006144C4: mov ecx, [esi]
  loc_006144C6: push 00000128h
  loc_006144CB: push 0041E938h
  loc_006144D0: push ecx
  loc_006144D1: push eax
  loc_006144D2: call [00401074h] ; __vbaHresultCheckObj
  loc_006144D8: lea ecx, var_24
  loc_006144DB: call [004012B0h] ; __vbaFreeObj
  loc_006144E1: lea edx, var_50
  loc_006144E4: lea eax, var_40
  loc_006144E7: push edx
  loc_006144E8: push eax
  loc_006144E9: push 00000002h
  loc_006144EB: call [00401038h] ; __vbaFreeVarList
  loc_006144F1: mov ecx, [ebx]
  loc_006144F3: add esp, 0000000Ch
  loc_006144F6: push ebx
  loc_006144F7: call [ecx+0000030Ch]
  loc_006144FD: lea edx, var_24
  loc_00614500: push eax
  loc_00614501: push edx
  loc_00614502: call [004010A0h] ; __vbaObjSet
  loc_00614508: mov ecx, [eax]
  loc_0061450A: lea edx, var_14
  loc_0061450D: push edx
  loc_0061450E: push eax
  loc_0061450F: mov var_14C, eax
  loc_00614515: call [ecx+000000A0h]
  loc_0061451B: cmp eax, edi
  loc_0061451D: fnclex
  loc_0061451F: jge 00614539h
  loc_00614521: mov ecx, var_14C
  loc_00614527: push 000000A0h
  loc_0061452C: push 0041E5E8h
  loc_00614531: push ecx
  loc_00614532: push eax
  loc_00614533: call [00401074h] ; __vbaHresultCheckObj
  loc_00614539: mov eax, var_14
  loc_0061453C: lea edx, var_40
  loc_0061453F: mov var_38, eax
  loc_00614542: lea eax, var_50
  loc_00614545: push edx
  loc_00614546: push eax
  loc_00614547: mov var_14, edi
  loc_0061454A: mov var_40, 00000008h
  loc_00614551: call [004010D4h] ; rtcTrimVar
  loc_00614557: mov ecx, [ebx]
  loc_00614559: push ebx
  loc_0061455A: call [ecx+0000030Ch]
  loc_00614560: lea edx, var_28
  loc_00614563: push eax
  loc_00614564: push edx
  loc_00614565: call [004010A0h] ; __vbaObjSet
  loc_0061456B: mov ecx, [eax]
  loc_0061456D: lea edx, var_18
  loc_00614570: push edx
  loc_00614571: push eax
  loc_00614572: mov var_154, eax
  loc_00614578: call [ecx+000000A0h]
  loc_0061457E: cmp eax, edi
  loc_00614580: fnclex
  loc_00614582: jge 0061459Ch
  loc_00614584: mov ecx, var_154
  loc_0061458A: push 000000A0h
  loc_0061458F: push 0041E5E8h
  loc_00614594: push ecx
  loc_00614595: push eax
  loc_00614596: call [00401074h] ; __vbaHresultCheckObj
  loc_0061459C: mov eax, var_18
  loc_0061459F: lea edx, var_70
  loc_006145A2: mov var_68, eax
  loc_006145A5: lea eax, var_80
  loc_006145A8: push edx
  loc_006145A9: push eax
  loc_006145AA: mov var_18, edi
  loc_006145AD: mov var_70, 00000008h
  loc_006145B4: call [004010D4h] ; rtcTrimVar
  loc_006145BA: lea edx, var_100
  loc_006145C0: lea ecx, var_A0
  loc_006145C6: mov var_F8, 0041F1E0h ; "-"
  loc_006145D0: mov var_100, 00000008h
  loc_006145DA: call [00401240h] ; __vbaVarDup
  loc_006145E0: lea ecx, var_50
  loc_006145E3: lea edx, var_F0
  loc_006145E9: push ecx
  loc_006145EA: lea eax, var_60
  loc_006145ED: push edx
  loc_006145EE: push eax
  loc_006145EF: mov var_E8, 0041E5D4h
  loc_006145F9: mov var_F0, 00008008h
  loc_00614603: call [00401050h] ; __vbaVarCmpNe
  loc_00614609: mov edx, eax
  loc_0061460B: lea ecx, var_90
  loc_00614611: call [00401014h] ; __vbaVarMove
  loc_00614617: lea ecx, var_A0
  loc_0061461D: lea edx, var_80
  loc_00614620: push ecx
  loc_00614621: lea eax, var_90
  loc_00614627: push edx
  loc_00614628: lea ecx, var_B0
  loc_0061462E: push eax
  loc_0061462F: push ecx
  loc_00614630: call [004011F0h] ; rtcImmediateIf
  loc_00614636: mov eax, [esi]
  loc_00614638: mov ecx, var_B0
  loc_0061463E: mov var_108, 0042AD00h ; "Remark"
  loc_00614648: mov var_110, 00000008h
  loc_00614652: mov edx, [eax]
  loc_00614654: sub esp, 00000010h
  loc_00614657: mov eax, esp
  loc_00614659: sub esp, 00000010h
  loc_0061465C: mov [eax], ecx
  loc_0061465E: mov ecx, var_AC
  loc_00614664: mov [eax+00000004h], ecx
  loc_00614667: mov ecx, var_A8
  loc_0061466D: mov [eax+00000008h], ecx
  loc_00614670: mov ecx, var_A4
  loc_00614676: mov [eax+0000000Ch], ecx
  loc_00614679: mov ecx, var_110
  loc_0061467F: mov eax, esp
  loc_00614681: mov [eax], ecx
  loc_00614683: mov ecx, var_10C
  loc_00614689: mov [eax+00000004h], ecx
  loc_0061468C: mov ecx, var_108
  loc_00614692: mov [eax+00000008h], ecx
  loc_00614695: mov ecx, var_104
  loc_0061469B: mov [eax+0000000Ch], ecx
  loc_0061469E: mov eax, [esi]
  loc_006146A0: push eax
  loc_006146A1: call [edx+00000128h]
  loc_006146A7: cmp eax, edi
  loc_006146A9: fnclex
  loc_006146AB: jge 006146C1h
  loc_006146AD: mov edx, [esi]
  loc_006146AF: push 00000128h
  loc_006146B4: push 0041E938h
  loc_006146B9: push edx
  loc_006146BA: push eax
  loc_006146BB: call [00401074h] ; __vbaHresultCheckObj
  loc_006146C1: lea eax, var_28
  loc_006146C4: lea ecx, var_24
  loc_006146C7: push eax
  loc_006146C8: push ecx
  loc_006146C9: push 00000002h
  loc_006146CB: call [00401040h] ; __vbaFreeObjList
  loc_006146D1: lea edx, var_B0
  loc_006146D7: lea eax, var_A0
  loc_006146DD: push edx
  loc_006146DE: lea ecx, var_80
  loc_006146E1: push eax
  loc_006146E2: lea edx, var_90
  loc_006146E8: push ecx
  loc_006146E9: lea eax, var_70
  loc_006146EC: push edx
  loc_006146ED: lea ecx, var_50
  loc_006146F0: push eax
  loc_006146F1: lea edx, var_40
  loc_006146F4: push ecx
  loc_006146F5: push edx
  loc_006146F6: push 00000007h
  loc_006146F8: call [00401038h] ; __vbaFreeVarList
  loc_006146FE: mov eax, [ebx]
  loc_00614700: add esp, 0000002Ch
  loc_00614703: push ebx
  loc_00614704: call [eax+00000304h]
  loc_0061470A: lea ecx, var_24
  loc_0061470D: push eax
  loc_0061470E: push ecx
  loc_0061470F: call [004010A0h] ; __vbaObjSet
  loc_00614715: mov edx, [eax]
  loc_00614717: lea ecx, var_14
  loc_0061471A: push ecx
  loc_0061471B: push eax
  loc_0061471C: mov var_14C, eax
  loc_00614722: call [edx+00000050h]
  loc_00614725: cmp eax, edi
  loc_00614727: fnclex
  loc_00614729: jge 00614740h
  loc_0061472B: mov edx, var_14C
  loc_00614731: push 00000050h
  loc_00614733: push 004270A8h
  loc_00614738: push edx
  loc_00614739: push eax
  loc_0061473A: call [00401074h] ; __vbaHresultCheckObj
  loc_00614740: mov eax, var_14
  loc_00614743: lea ecx, var_50
  loc_00614746: mov var_38, eax
  loc_00614749: lea eax, var_40
  loc_0061474C: push eax
  loc_0061474D: push ecx
  loc_0061474E: mov var_14, edi
  loc_00614751: mov var_40, 00000008h
  loc_00614758: call [004010D4h] ; rtcTrimVar
  loc_0061475E: mov eax, [esi]
  loc_00614760: mov ecx, var_50
  loc_00614763: mov var_E8, 0042B0CCh ; "Language"
  loc_0061476D: mov var_F0, 00000008h
  loc_00614777: mov edx, [eax]
  loc_00614779: sub esp, 00000010h
  loc_0061477C: mov eax, esp
  loc_0061477E: sub esp, 00000010h
  loc_00614781: mov [eax], ecx
  loc_00614783: mov ecx, var_4C
  loc_00614786: mov [eax+00000004h], ecx
  loc_00614789: mov ecx, var_48
  loc_0061478C: mov [eax+00000008h], ecx
  loc_0061478F: mov ecx, var_44
  loc_00614792: mov [eax+0000000Ch], ecx
  loc_00614795: mov ecx, var_F0
  loc_0061479B: mov eax, esp
  loc_0061479D: mov [eax], ecx
  loc_0061479F: mov ecx, var_EC
  loc_006147A5: mov [eax+00000004h], ecx
  loc_006147A8: mov ecx, var_E8
  loc_006147AE: mov [eax+00000008h], ecx
  loc_006147B1: mov ecx, var_E4
  loc_006147B7: mov [eax+0000000Ch], ecx
  loc_006147BA: mov eax, [esi]
  loc_006147BC: push eax
  loc_006147BD: call [edx+00000128h]
  loc_006147C3: cmp eax, edi
  loc_006147C5: fnclex
  loc_006147C7: jge 006147DDh
  loc_006147C9: mov edx, [esi]
  loc_006147CB: push 00000128h
  loc_006147D0: push 0041E938h
  loc_006147D5: push edx
  loc_006147D6: push eax
  loc_006147D7: call [00401074h] ; __vbaHresultCheckObj
  loc_006147DD: lea ecx, var_24
  loc_006147E0: call [004012B0h] ; __vbaFreeObj
  loc_006147E6: lea eax, var_50
  loc_006147E9: lea ecx, var_40
  loc_006147EC: push eax
  loc_006147ED: push ecx
  loc_006147EE: push 00000002h
  loc_006147F0: call [00401038h] ; __vbaFreeVarList
  loc_006147F6: mov eax, [esi]
  loc_006147F8: add esp, 0000000Ch
  loc_006147FB: mov edx, [eax]
  loc_006147FD: push edi
  loc_006147FE: push 00000001h
  loc_00614800: push eax
  loc_00614801: call [edx+00000164h]
  loc_00614807: cmp eax, edi
  loc_00614809: fnclex
  loc_0061480B: jge 00614821h
  loc_0061480D: mov ecx, [esi]
  loc_0061480F: push 00000164h
  loc_00614814: push 0041E938h
  loc_00614819: push ecx
  loc_0061481A: push eax
  loc_0061481B: call [00401074h] ; __vbaHresultCheckObj
  loc_00614821: mov eax, [esi]
  loc_00614823: push eax
  loc_00614824: mov edx, [eax]
  loc_00614826: call [edx+000000C4h]
  loc_0061482C: cmp eax, edi
  loc_0061482E: fnclex
  loc_00614830: jge 00614846h
  loc_00614832: mov ecx, [esi]
  loc_00614834: push 000000C4h
  loc_00614839: push 0041E938h
  loc_0061483E: push ecx
  loc_0061483F: push eax
  loc_00614840: call [00401074h] ; __vbaHresultCheckObj
  loc_00614846: push 0041E938h
  loc_0061484B: push edi
  loc_0061484C: call [00401274h] ; __vbaCastObj
  loc_00614852: lea edx, var_24
  loc_00614855: push eax
  loc_00614856: push edx
  loc_00614857: call [004010A0h] ; __vbaObjSet
  loc_0061485D: push eax
  loc_0061485E: push esi
  loc_0061485F: call [004010B8h] ; __vbaObjSetAddref
  loc_00614865: lea ecx, var_24
  loc_00614868: call [004012B0h] ; __vbaFreeObj
  loc_0061486E: mov eax, [ebx]
  loc_00614870: push ebx
  loc_00614871: mov var_F8, 80020004h
  loc_0061487B: mov var_100, 0000000Ah
  loc_00614885: call [eax+00000308h]
  loc_0061488B: lea ecx, var_24
  loc_0061488E: push eax
  loc_0061488F: push ecx
  loc_00614890: call [004010A0h] ; __vbaObjSet
  loc_00614896: mov esi, eax
  loc_00614898: lea eax, var_14
  loc_0061489B: push eax
  loc_0061489C: push esi
  loc_0061489D: mov edx, [esi]
  loc_0061489F: call [edx+000000A0h]
  loc_006148A5: cmp eax, edi
  loc_006148A7: fnclex
  loc_006148A9: jge 006148BDh
  loc_006148AB: push 000000A0h
  loc_006148B0: push 0041E5E8h
  loc_006148B5: push esi
  loc_006148B6: push eax
  loc_006148B7: call [00401074h] ; __vbaHresultCheckObj
  loc_006148BD: mov ecx, var_14
  loc_006148C0: mov esi, [00401054h] ; __vbaStrCat
  loc_006148C6: push 004339A4h ; "Update Balance SET Amount=Amount-"
  loc_006148CB: push ecx
  loc_006148CC: call __vbaStrCat
  loc_006148CE: mov edx, eax
  loc_006148D0: lea ecx, var_18
  loc_006148D3: call [00401270h] ; __vbaStrMove
  loc_006148D9: push eax
  loc_006148DA: push 0042B630h ; " Where Name='"
  loc_006148DF: call __vbaStrCat
  loc_006148E1: mov edx, [ebx]
  loc_006148E3: push ebx
  loc_006148E4: mov var_58, eax
  loc_006148E7: mov var_60, 00000008h
  loc_006148EE: call [edx+000002FCh]
  loc_006148F4: push eax
  loc_006148F5: lea eax, var_28
  loc_006148F8: push eax
  loc_006148F9: call [004010A0h] ; __vbaObjSet
  loc_006148FF: mov esi, eax
  loc_00614901: lea edx, var_1C
  loc_00614904: push edx
  loc_00614905: push esi
  loc_00614906: mov ecx, [esi]
  loc_00614908: call [ecx+000000A8h]
  loc_0061490E: cmp eax, edi
  loc_00614910: fnclex
  loc_00614912: jge 00614926h
  loc_00614914: push 000000A8h
  loc_00614919: push 0041F844h
  loc_0061491E: push esi
  loc_0061491F: push eax
  loc_00614920: call [00401074h] ; __vbaHresultCheckObj
  loc_00614926: mov eax, var_1C
  loc_00614929: lea ecx, var_50
  loc_0061492C: mov var_38, eax
  loc_0061492F: lea eax, var_40
  loc_00614932: mov esi, 00000008h
  loc_00614937: push eax
  loc_00614938: push ecx
  loc_00614939: mov var_1C, edi
  loc_0061493C: mov var_40, esi
  loc_0061493F: call [004010D4h] ; rtcTrimVar
  loc_00614945: mov edx, [0061A13Ch]
  loc_0061494B: mov ecx, var_100
  loc_00614951: sub esp, 00000010h
  loc_00614954: mov var_E8, 0041E890h ; "'"
  loc_0061495E: mov eax, esp
  loc_00614960: mov var_F0, esi
  loc_00614966: mov esi, [edx]
  loc_00614968: mov edx, var_FC
  loc_0061496E: mov [eax], ecx
  loc_00614970: mov ecx, var_F8
  loc_00614976: mov [eax+00000004h], edx
  loc_00614979: mov edx, var_F4
  loc_0061497F: mov [eax+00000008h], ecx
  loc_00614982: lea ecx, var_50
  loc_00614985: mov [eax+0000000Ch], edx
  loc_00614988: lea eax, var_60
  loc_0061498B: push eax
  loc_0061498C: lea edx, var_70
  loc_0061498F: push ecx
  loc_00614990: push edx
  loc_00614991: call [004011B4h] ; __vbaVarCat
  loc_00614997: push eax
  loc_00614998: lea eax, var_F0
  loc_0061499E: lea ecx, var_80
  loc_006149A1: push eax
  loc_006149A2: push ecx
  loc_006149A3: call [004011B4h] ; __vbaVarCat
  loc_006149A9: lea edx, var_20
  loc_006149AC: push eax
  loc_006149AD: push edx
  loc_006149AE: call [004011B0h] ; __vbaStrVarVal
  loc_006149B4: push eax
  loc_006149B5: mov eax, [0061A13Ch]
  loc_006149BA: push eax
  loc_006149BB: call [esi+0000005Ch]
  loc_006149BE: cmp eax, edi
  loc_006149C0: fnclex
  loc_006149C2: jge 006149D9h
  loc_006149C4: mov ecx, [0061A13Ch]
  loc_006149CA: push 0000005Ch
  loc_006149CC: push 0041E928h
  loc_006149D1: push ecx
  loc_006149D2: push eax
  loc_006149D3: call [00401074h] ; __vbaHresultCheckObj
  loc_006149D9: lea edx, var_20
  loc_006149DC: lea eax, var_18
  loc_006149DF: push edx
  loc_006149E0: lea ecx, var_14
  loc_006149E3: push eax
  loc_006149E4: push ecx
  loc_006149E5: push 00000003h
  loc_006149E7: call [004011FCh] ; __vbaFreeStrList
  loc_006149ED: lea edx, var_28
  loc_006149F0: lea eax, var_24
  loc_006149F3: push edx
  loc_006149F4: push eax
  loc_006149F5: push 00000002h
  loc_006149F7: call [00401040h] ; __vbaFreeObjList
  loc_006149FD: lea ecx, var_80
  loc_00614A00: lea edx, var_70
  loc_00614A03: push ecx
  loc_00614A04: lea eax, var_50
  loc_00614A07: push edx
  loc_00614A08: lea ecx, var_60
  loc_00614A0B: push eax
  loc_00614A0C: lea edx, var_40
  loc_00614A0F: push ecx
  loc_00614A10: push edx
  loc_00614A11: push 00000005h
  loc_00614A13: call [00401038h] ; __vbaFreeVarList
  loc_00614A19: add esp, 00000034h
  loc_00614A1C: lea eax, var_F0
  loc_00614A22: lea ecx, var_40
  loc_00614A25: mov esi, 80020004h
  loc_00614A2A: push eax
  loc_00614A2B: push ecx
  loc_00614A2C: mov var_F8, 0042F140h ; "DELETE FROM BALANCE IN '"
  loc_00614A36: mov var_100, 00000008h
  loc_00614A40: mov var_E8, 0061A09Ch
  loc_00614A4A: mov var_F0, 00004008h
  loc_00614A54: call [004010D4h] ; rtcTrimVar
  loc_00614A5A: sub esp, 00000010h
  loc_00614A5D: mov eax, 0000000Ah
  loc_00614A62: mov ecx, esp
  loc_00614A64: mov edx, [0061A13Ch]
  loc_00614A6A: mov var_108, 0041E890h ; "'"
  loc_00614A74: mov var_110, 00000008h
  loc_00614A7E: mov [ecx], eax
  loc_00614A80: mov eax, var_11C
  loc_00614A86: mov edx, [edx]
  loc_00614A88: mov [ecx+00000004h], eax
  loc_00614A8B: mov eax, var_114
  loc_00614A91: mov var_1A4, edx
  loc_00614A97: mov [ecx+00000008h], esi
  loc_00614A9A: mov [ecx+0000000Ch], eax
  loc_00614A9D: lea ecx, var_100
  loc_00614AA3: push ecx
  loc_00614AA4: lea eax, var_40
  loc_00614AA7: lea ecx, var_50
  loc_00614AAA: push eax
  loc_00614AAB: push ecx
  loc_00614AAC: call [004011B4h] ; __vbaVarCat
  loc_00614AB2: push eax
  loc_00614AB3: lea edx, var_110
  loc_00614AB9: lea eax, var_60
  loc_00614ABC: push edx
  loc_00614ABD: push eax
  loc_00614ABE: call [004011B4h] ; __vbaVarCat
  loc_00614AC4: lea ecx, var_14
  loc_00614AC7: push eax
  loc_00614AC8: push ecx
  loc_00614AC9: call [004011B0h] ; __vbaStrVarVal
  loc_00614ACF: mov edx, [0061A13Ch]
  loc_00614AD5: push eax
  loc_00614AD6: mov eax, var_1A4
  loc_00614ADC: push edx
  loc_00614ADD: call [eax+0000005Ch]
  loc_00614AE0: cmp eax, edi
  loc_00614AE2: fnclex
  loc_00614AE4: jge 00614AFBh
  loc_00614AE6: mov ecx, [0061A13Ch]
  loc_00614AEC: push 0000005Ch
  loc_00614AEE: push 0041E928h
  loc_00614AF3: push ecx
  loc_00614AF4: push eax
  loc_00614AF5: call [00401074h] ; __vbaHresultCheckObj
  loc_00614AFB: lea ecx, var_14
  loc_00614AFE: call [004012ACh] ; __vbaFreeStr
  loc_00614B04: lea edx, var_60
  loc_00614B07: lea eax, var_50
  loc_00614B0A: push edx
  loc_00614B0B: lea ecx, var_40
  loc_00614B0E: push eax
  loc_00614B0F: push ecx
  loc_00614B10: push 00000003h
  loc_00614B12: call [00401038h] ; __vbaFreeVarList
  loc_00614B18: add esp, 00000010h
  loc_00614B1B: lea edx, var_F0
  loc_00614B21: lea eax, var_40
  loc_00614B24: mov esi, 80020004h
  loc_00614B29: push edx
  loc_00614B2A: push eax
  loc_00614B2B: mov var_F8, 0042EF00h ; "INSERT INTO Balance IN '"
  loc_00614B35: mov var_100, 00000008h
  loc_00614B3F: mov var_E8, 0061A09Ch
  loc_00614B49: mov var_F0, 00004008h
  loc_00614B53: call [004010D4h] ; rtcTrimVar
  loc_00614B59: mov ecx, [0061A13Ch]
  loc_00614B5F: mov var_108, 0042EF38h ; "' SELECT * FROM Balance"
  loc_00614B69: mov var_110, 00000008h
  loc_00614B73: sub esp, 00000010h
  loc_00614B76: mov edx, [ecx]
  loc_00614B78: mov ecx, esp
  loc_00614B7A: mov eax, 0000000Ah
  loc_00614B7F: mov var_1A8, edx
  loc_00614B85: mov [ecx], eax
  loc_00614B87: mov eax, var_11C
  loc_00614B8D: mov [ecx+00000004h], eax
  loc_00614B90: mov eax, var_114
  loc_00614B96: mov [ecx+00000008h], esi
  loc_00614B99: mov [ecx+0000000Ch], eax
  loc_00614B9C: lea ecx, var_100
  loc_00614BA2: push ecx
  loc_00614BA3: lea eax, var_40
  loc_00614BA6: lea ecx, var_50
  loc_00614BA9: push eax
  loc_00614BAA: push ecx
  loc_00614BAB: call [004011B4h] ; __vbaVarCat
  loc_00614BB1: push eax
  loc_00614BB2: lea edx, var_110
  loc_00614BB8: lea eax, var_60
  loc_00614BBB: push edx
  loc_00614BBC: push eax
  loc_00614BBD: call [004011B4h] ; __vbaVarCat
  loc_00614BC3: lea ecx, var_14
  loc_00614BC6: push eax
  loc_00614BC7: push ecx
  loc_00614BC8: call [004011B0h] ; __vbaStrVarVal
  loc_00614BCE: mov edx, [0061A13Ch]
  loc_00614BD4: push eax
  loc_00614BD5: mov eax, var_1A8
  loc_00614BDB: push edx
  loc_00614BDC: call [eax+0000005Ch]
  loc_00614BDF: cmp eax, edi
  loc_00614BE1: fnclex
  loc_00614BE3: jge 00614BFAh
  loc_00614BE5: mov ecx, [0061A13Ch]
  loc_00614BEB: push 0000005Ch
  loc_00614BED: push 0041E928h
  loc_00614BF2: push ecx
  loc_00614BF3: push eax
  loc_00614BF4: call [00401074h] ; __vbaHresultCheckObj
  loc_00614BFA: lea ecx, var_14
  loc_00614BFD: call [004012ACh] ; __vbaFreeStr
  loc_00614C03: mov esi, [00401038h] ; __vbaFreeVarList
  loc_00614C09: lea edx, var_60
  loc_00614C0C: lea eax, var_50
  loc_00614C0F: push edx
  loc_00614C10: lea ecx, var_40
  loc_00614C13: push eax
  loc_00614C14: push ecx
  loc_00614C15: push 00000003h
  loc_00614C17: call __vbaFreeVarList
  loc_00614C19: mov ecx, 0000000Ah
  loc_00614C1E: mov eax, 80020004h
  loc_00614C23: mov var_70, ecx
  loc_00614C26: mov var_60, ecx
  loc_00614C29: mov var_50, ecx
  loc_00614C2C: add esp, 00000010h
  loc_00614C2F: lea edx, var_F0
  loc_00614C35: lea ecx, var_40
  loc_00614C38: mov var_68, eax
  loc_00614C3B: mov var_58, eax
  loc_00614C3E: mov var_48, eax
  loc_00614C41: mov var_E8, 0041F378h ; "Save Successfully."
  loc_00614C4B: mov var_F0, 00000008h
  loc_00614C55: call [00401240h] ; __vbaVarDup
  loc_00614C5B: lea edx, var_70
  loc_00614C5E: lea eax, var_60
  loc_00614C61: push edx
  loc_00614C62: lea ecx, var_50
  loc_00614C65: push eax
  loc_00614C66: push ecx
  loc_00614C67: lea edx, var_40
  loc_00614C6A: push 00000040h
  loc_00614C6C: push edx
  loc_00614C6D: call [004010A4h] ; rtcMsgBox
  loc_00614C73: lea eax, var_70
  loc_00614C76: lea ecx, var_60
  loc_00614C79: push eax
  loc_00614C7A: lea edx, var_50
  loc_00614C7D: push ecx
  loc_00614C7E: lea eax, var_40
  loc_00614C81: push edx
  loc_00614C82: push eax
  loc_00614C83: push 00000004h
  loc_00614C85: call __vbaFreeVarList
  loc_00614C87: mov ecx, [ebx]
  loc_00614C89: add esp, 00000014h
  loc_00614C8C: lea edx, var_40
  loc_00614C8F: lea eax, var_144
  loc_00614C95: push edx
  loc_00614C96: push eax
  loc_00614C97: push ebx
  loc_00614C98: mov var_144, FFFFFFFFh
  loc_00614CA2: call [ecx+00000730h]
  loc_00614CA8: lea ecx, var_40
  loc_00614CAB: call [00401020h] ; __vbaFreeVar
  loc_00614CB1: mov ecx, [ebx]
  loc_00614CB3: lea edx, var_144
  loc_00614CB9: push edx
  loc_00614CBA: push ebx
  loc_00614CBB: mov var_144, edi
  loc_00614CC1: call [ecx+00000734h]
  loc_00614CC7: mov [ebx+00000038h], di
  loc_00614CCB: push 00614DC9h
  loc_00614CD0: jmp 00614DC8h
  loc_00614CD5: mov ecx, 80020004h
  loc_00614CDA: mov eax, 0000000Ah
  loc_00614CDF: mov var_68, ecx
  loc_00614CE2: mov var_58, ecx
  loc_00614CE5: mov var_48, ecx
  loc_00614CE8: lea edx, var_F0
  loc_00614CEE: lea ecx, var_40
  loc_00614CF1: mov var_70, eax
  loc_00614CF4: mov var_60, eax
  loc_00614CF7: mov var_50, eax
  loc_00614CFA: mov var_E8, 0041EA5Ch ; "Cann't Save Successfully."
  loc_00614D04: mov var_F0, 00000008h
  loc_00614D0E: call [00401240h] ; __vbaVarDup
  loc_00614D14: lea eax, var_70
  loc_00614D17: lea ecx, var_60
  loc_00614D1A: push eax
  loc_00614D1B: lea edx, var_50
  loc_00614D1E: push ecx
  loc_00614D1F: push edx
  loc_00614D20: lea eax, var_40
  loc_00614D23: push 00000030h
  loc_00614D25: push eax
  loc_00614D26: call [004010A4h] ; rtcMsgBox
  loc_00614D2C: lea ecx, var_70
  loc_00614D2F: lea edx, var_60
  loc_00614D32: push ecx
  loc_00614D33: lea eax, var_50
  loc_00614D36: push edx
  loc_00614D37: lea ecx, var_40
  loc_00614D3A: push eax
  loc_00614D3B: push ecx
  loc_00614D3C: push 00000004h
  loc_00614D3E: call [00401038h] ; __vbaFreeVarList
  loc_00614D44: add esp, 00000014h
  loc_00614D47: push 00614DC9h
  loc_00614D4C: jmp 00614DC8h
  loc_00614D4E: lea edx, var_20
  loc_00614D51: lea eax, var_1C
  loc_00614D54: push edx
  loc_00614D55: lea ecx, var_18
  loc_00614D58: push eax
  loc_00614D59: lea edx, var_14
  loc_00614D5C: push ecx
  loc_00614D5D: push edx
  loc_00614D5E: push 00000004h
  loc_00614D60: call [004011FCh] ; __vbaFreeStrList
  loc_00614D66: lea eax, var_30
  loc_00614D69: lea ecx, var_2C
  loc_00614D6C: push eax
  loc_00614D6D: lea edx, var_28
  loc_00614D70: push ecx
  loc_00614D71: lea eax, var_24
  loc_00614D74: push edx
  loc_00614D75: push eax
  loc_00614D76: push 00000004h
  loc_00614D78: call [00401040h] ; __vbaFreeObjList
  loc_00614D7E: lea ecx, var_E0
  loc_00614D84: lea edx, var_D0
  loc_00614D8A: push ecx
  loc_00614D8B: lea eax, var_C0
  loc_00614D91: push edx
  loc_00614D92: lea ecx, var_B0
  loc_00614D98: push eax
  loc_00614D99: lea edx, var_A0
  loc_00614D9F: push ecx
  loc_00614DA0: lea eax, var_90
  loc_00614DA6: push edx
  loc_00614DA7: lea ecx, var_80
  loc_00614DAA: push eax
  loc_00614DAB: lea edx, var_70
  loc_00614DAE: push ecx
  loc_00614DAF: lea eax, var_60
  loc_00614DB2: push edx
  loc_00614DB3: lea ecx, var_50
  loc_00614DB6: push eax
  loc_00614DB7: lea edx, var_40
  loc_00614DBA: push ecx
  loc_00614DBB: push edx
  loc_00614DBC: push 0000000Bh
  loc_00614DBE: call [00401038h] ; __vbaFreeVarList
  loc_00614DC4: add esp, 00000058h
  loc_00614DC7: ret
  loc_00614DC8: ret
  loc_00614DC9: mov ecx, var_10
  loc_00614DCC: pop edi
  loc_00614DCD: pop esi
  loc_00614DCE: xor eax, eax
  loc_00614DD0: mov fs:[00000000h], ecx
  loc_00614DD7: pop ebx
  loc_00614DD8: mov esp, ebp
  loc_00614DDA: pop ebp
  loc_00614DDB: retn 0004h
End Sub

Private Sub Proc_37_24_614EB0() '614EB0
  loc_00614EB0: push ebp
  loc_00614EB1: mov ebp, esp
  loc_00614EB3: sub esp, 00000008h
  loc_00614EB6: push 00403B36h ; __vbaExceptHandler
  loc_00614EBB: mov eax, fs:[00000000h]
  loc_00614EC1: push eax
  loc_00614EC2: mov fs:[00000000h], esp
  loc_00614EC9: sub esp, 000000C8h
  loc_00614ECF: push ebx
  loc_00614ED0: push esi
  loc_00614ED1: push edi
  loc_00614ED2: mov var_8, esp
  loc_00614ED5: mov var_4, 00403A30h
  loc_00614EDC: xor eax, eax
  loc_00614EDE: lea ecx, var_30
  loc_00614EE1: mov var_14, eax
  loc_00614EE4: mov var_18, eax
  loc_00614EE7: mov var_1C, eax
  loc_00614EEA: mov var_20, eax
  loc_00614EED: mov var_30, eax
  loc_00614EF0: mov var_40, eax
  loc_00614EF3: mov var_60, eax
  loc_00614EF6: mov var_94, eax
  loc_00614EFC: mov var_98, eax
  loc_00614F02: lea eax, var_50
  loc_00614F05: push eax
  loc_00614F06: push ecx
  loc_00614F07: mov var_48, 0061A058h
  loc_00614F0E: mov var_50, 00004008h
  loc_00614F15: call [004010D4h] ; rtcTrimVar
  loc_00614F1B: lea ebx, var_18
  loc_00614F1E: mov ecx, 0000000Ah
  loc_00614F23: push ebx
  loc_00614F24: mov esi, ecx
  loc_00614F26: sub esp, 00000010h
  loc_00614F29: mov eax, 80020004h
  loc_00614F2E: mov ebx, esp
  loc_00614F30: sub esp, 00000010h
  loc_00614F33: mov edx, eax
  loc_00614F35: mov edi, [0061A13Ch]
  loc_00614F3B: mov [ebx], ecx
  loc_00614F3D: mov ecx, var_8C
  loc_00614F43: mov var_58, 004339ECh ; "Select * From Receive Where SrNo="
  loc_00614F4A: mov var_60, 00000008h
  loc_00614F51: mov [ebx+00000004h], ecx
  loc_00614F54: mov ecx, esp
  loc_00614F56: sub esp, 00000010h
  loc_00614F59: mov edi, [edi]
  loc_00614F5B: mov [ebx+00000008h], eax
  loc_00614F5E: mov eax, var_84
  loc_00614F64: mov [ebx+0000000Ch], eax
  loc_00614F67: mov eax, var_7C
  loc_00614F6A: mov [ecx], esi
  loc_00614F6C: mov [ecx+00000004h], eax
  loc_00614F6F: mov eax, 00000003h
  loc_00614F74: mov [ecx+00000008h], edx
  loc_00614F77: mov edx, var_74
  loc_00614F7A: mov [ecx+0000000Ch], edx
  loc_00614F7D: mov edx, var_6C
  loc_00614F80: mov ecx, esp
  loc_00614F82: mov [ecx], eax
  loc_00614F84: mov eax, 00000004h
  loc_00614F89: mov [ecx+00000004h], edx
  loc_00614F8C: lea edx, var_30
  loc_00614F8F: mov [ecx+00000008h], eax
  loc_00614F92: mov eax, var_64
  loc_00614F95: mov [ecx+0000000Ch], eax
  loc_00614F98: lea ecx, var_60
  loc_00614F9B: push ecx
  loc_00614F9C: lea eax, var_40
  loc_00614F9F: push edx
  loc_00614FA0: push eax
  loc_00614FA1: call [004011B4h] ; __vbaVarCat
  loc_00614FA7: lea ecx, var_14
  loc_00614FAA: push eax
  loc_00614FAB: push ecx
  loc_00614FAC: call [004011B0h] ; __vbaStrVarVal
  loc_00614FB2: mov edx, [0061A13Ch]
  loc_00614FB8: push eax
  loc_00614FB9: push edx
  loc_00614FBA: call [edi+000000BCh]
  loc_00614FC0: test eax, eax
  loc_00614FC2: fnclex
  loc_00614FC4: jge 00614FE2h
  loc_00614FC6: mov ecx, [0061A13Ch]
  loc_00614FCC: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00614FD2: push 000000BCh
  loc_00614FD7: push 0041E928h
  loc_00614FDC: push ecx
  loc_00614FDD: push eax
  loc_00614FDE: call ebx
  loc_00614FE0: jmp 00614FE8h
  loc_00614FE2: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_00614FE8: mov esi, Me
  loc_00614FEB: mov edx, var_18
  loc_00614FEE: push edx
  loc_00614FEF: lea edi, [esi+00000034h]
  loc_00614FF2: push edi
  loc_00614FF3: call [004010B8h] ; __vbaObjSetAddref
  loc_00614FF9: lea ecx, var_14
  loc_00614FFC: call [004012ACh] ; __vbaFreeStr
  loc_00615002: lea ecx, var_18
  loc_00615005: call [004012B0h] ; __vbaFreeObj
  loc_0061500B: lea eax, var_40
  loc_0061500E: lea ecx, var_30
  loc_00615011: push eax
  loc_00615012: push ecx
  loc_00615013: push 00000002h
  loc_00615015: call [00401038h] ; __vbaFreeVarList
  loc_0061501B: mov eax, [edi]
  loc_0061501D: add esp, 0000000Ch
  loc_00615020: lea ecx, var_94
  loc_00615026: mov edx, [eax]
  loc_00615028: push ecx
  loc_00615029: push eax
  loc_0061502A: call [edx+00000020h]
  loc_0061502D: test eax, eax
  loc_0061502F: fnclex
  loc_00615031: jge 00615040h
  loc_00615033: mov edx, [edi]
  loc_00615035: push 00000020h
  loc_00615037: push 0041E938h
  loc_0061503C: push edx
  loc_0061503D: push eax
  loc_0061503E: call ebx
  loc_00615040: mov eax, [edi]
  loc_00615042: lea edx, var_98
  loc_00615048: push edx
  loc_00615049: push eax
  loc_0061504A: mov ecx, [eax]
  loc_0061504C: call [ecx+00000034h]
  loc_0061504F: test eax, eax
  loc_00615051: fnclex
  loc_00615053: jge 00615062h
  loc_00615055: mov ecx, [edi]
  loc_00615057: push 00000034h
  loc_00615059: push 0041E938h
  loc_0061505E: push ecx
  loc_0061505F: push eax
  loc_00615060: call ebx
  loc_00615062: xor edx, edx
  loc_00615064: cmp var_98, dx
  loc_0061506B: setz dl
  loc_0061506E: xor eax, eax
  loc_00615070: cmp var_94, ax
  loc_00615077: setz al
  loc_0061507A: or edx, eax
  loc_0061507C: jz 006158C7h
  loc_00615082: mov ecx, [esi]
  loc_00615084: push esi
  loc_00615085: call [ecx+00000300h]
  loc_0061508B: lea edx, var_20
  loc_0061508E: push eax
  loc_0061508F: push edx
  loc_00615090: call [004010A0h] ; __vbaObjSet
  loc_00615096: mov var_A8, eax
  loc_0061509C: mov eax, [edi]
  loc_0061509E: lea edx, var_18
  loc_006150A1: mov ecx, [eax]
  loc_006150A3: push edx
  loc_006150A4: push eax
  loc_006150A5: call [ecx+000000B4h]
  loc_006150AB: test eax, eax
  loc_006150AD: fnclex
  loc_006150AF: jge 006150C1h
  loc_006150B1: mov ecx, [edi]
  loc_006150B3: push 000000B4h
  loc_006150B8: push 0041E938h
  loc_006150BD: push ecx
  loc_006150BE: push eax
  loc_006150BF: call ebx
  loc_006150C1: lea ebx, var_1C
  loc_006150C4: mov eax, var_18
  loc_006150C7: push ebx
  loc_006150C8: mov ecx, 00000008h
  loc_006150CD: sub esp, 00000010h
  loc_006150D0: mov var_50, ecx
  loc_006150D3: mov ebx, esp
  loc_006150D5: mov var_48, 0041EDD8h ; "SrNo"
  loc_006150DC: mov edx, [eax]
  loc_006150DE: push eax
  loc_006150DF: mov [ebx], ecx
  loc_006150E1: mov ecx, var_4C
  loc_006150E4: mov var_A0, eax
  loc_006150EA: mov [ebx+00000004h], ecx
  loc_006150ED: mov ecx, var_48
  loc_006150F0: mov [ebx+00000008h], ecx
  loc_006150F3: mov ecx, var_44
  loc_006150F6: mov [ebx+0000000Ch], ecx
  loc_006150F9: call [edx+00000030h]
  loc_006150FC: test eax, eax
  loc_006150FE: fnclex
  loc_00615100: jge 00615117h
  loc_00615102: mov edx, var_A0
  loc_00615108: push 00000030h
  loc_0061510A: push 0041EA14h ; "S"
  loc_0061510F: push edx
  loc_00615110: push eax
  loc_00615111: call [00401074h] ; __vbaHresultCheckObj
  loc_00615117: mov eax, var_1C
  loc_0061511A: lea ecx, var_40
  loc_0061511D: mov var_28, eax
  loc_00615120: lea eax, var_30
  loc_00615123: push eax
  loc_00615124: push ecx
  loc_00615125: mov var_1C, 00000000h
  loc_0061512C: mov var_30, 00000009h
  loc_00615133: call [004010D4h] ; rtcTrimVar
  loc_00615139: mov edx, var_A8
  loc_0061513F: lea eax, var_40
  loc_00615142: lea ecx, var_14
  loc_00615145: push eax
  loc_00615146: mov ebx, [edx]
  loc_00615148: push ecx
  loc_00615149: call [004011B0h] ; __vbaStrVarVal
  loc_0061514F: mov edx, ebx
  loc_00615151: mov ebx, var_A8
  loc_00615157: push eax
  loc_00615158: push ebx
  loc_00615159: call [edx+000000A4h]
  loc_0061515F: test eax, eax
  loc_00615161: fnclex
  loc_00615163: jge 00615177h
  loc_00615165: push 000000A4h
  loc_0061516A: push 0041E5E8h
  loc_0061516F: push ebx
  loc_00615170: push eax
  loc_00615171: call [00401074h] ; __vbaHresultCheckObj
  loc_00615177: lea ecx, var_14
  loc_0061517A: call [004012ACh] ; __vbaFreeStr
  loc_00615180: lea eax, var_20
  loc_00615183: lea ecx, var_18
  loc_00615186: push eax
  loc_00615187: push ecx
  loc_00615188: push 00000002h
  loc_0061518A: call [00401040h] ; __vbaFreeObjList
  loc_00615190: lea edx, var_40
  loc_00615193: lea eax, var_30
  loc_00615196: push edx
  loc_00615197: push eax
  loc_00615198: push 00000002h
  loc_0061519A: call [00401038h] ; __vbaFreeVarList
  loc_006151A0: mov ecx, [esi]
  loc_006151A2: add esp, 00000018h
  loc_006151A5: push esi
  loc_006151A6: call [ecx+000002FCh]
  loc_006151AC: lea edx, var_20
  loc_006151AF: push eax
  loc_006151B0: push edx
  loc_006151B1: call [004010A0h] ; __vbaObjSet
  loc_006151B7: mov var_A8, eax
  loc_006151BD: mov eax, [edi]
  loc_006151BF: lea edx, var_18
  loc_006151C2: mov ecx, [eax]
  loc_006151C4: push edx
  loc_006151C5: push eax
  loc_006151C6: call [ecx+000000B4h]
  loc_006151CC: test eax, eax
  loc_006151CE: fnclex
  loc_006151D0: jge 006151E6h
  loc_006151D2: mov ecx, [edi]
  loc_006151D4: push 000000B4h
  loc_006151D9: push 0041E938h
  loc_006151DE: push ecx
  loc_006151DF: push eax
  loc_006151E0: call [00401074h] ; __vbaHresultCheckObj
  loc_006151E6: lea ebx, var_1C
  loc_006151E9: mov eax, var_18
  loc_006151EC: push ebx
  loc_006151ED: mov ecx, 00000008h
  loc_006151F2: sub esp, 00000010h
  loc_006151F5: mov var_50, ecx
  loc_006151F8: mov ebx, esp
  loc_006151FA: mov var_48, 0041EA08h ; "Name"
  loc_00615201: mov edx, [eax]
  loc_00615203: push eax
  loc_00615204: mov [ebx], ecx
  loc_00615206: mov ecx, var_4C
  loc_00615209: mov var_A0, eax
  loc_0061520F: mov [ebx+00000004h], ecx
  loc_00615212: mov ecx, var_48
  loc_00615215: mov [ebx+00000008h], ecx
  loc_00615218: mov ecx, var_44
  loc_0061521B: mov [ebx+0000000Ch], ecx
  loc_0061521E: call [edx+00000030h]
  loc_00615221: test eax, eax
  loc_00615223: fnclex
  loc_00615225: jge 0061523Ch
  loc_00615227: mov edx, var_A0
  loc_0061522D: push 00000030h
  loc_0061522F: push 0041EA14h ; "S"
  loc_00615234: push edx
  loc_00615235: push eax
  loc_00615236: call [00401074h] ; __vbaHresultCheckObj
  loc_0061523C: mov eax, var_1C
  loc_0061523F: lea ecx, var_40
  loc_00615242: mov var_28, eax
  loc_00615245: lea eax, var_30
  loc_00615248: push eax
  loc_00615249: push ecx
  loc_0061524A: mov var_1C, 00000000h
  loc_00615251: mov var_30, 00000009h
  loc_00615258: call [004010D4h] ; rtcTrimVar
  loc_0061525E: mov edx, var_A8
  loc_00615264: lea eax, var_40
  loc_00615267: lea ecx, var_14
  loc_0061526A: push eax
  loc_0061526B: mov ebx, [edx]
  loc_0061526D: push ecx
  loc_0061526E: call [004011B0h] ; __vbaStrVarVal
  loc_00615274: mov edx, ebx
  loc_00615276: mov ebx, var_A8
  loc_0061527C: push eax
  loc_0061527D: push ebx
  loc_0061527E: call [edx+000000ACh]
  loc_00615284: test eax, eax
  loc_00615286: fnclex
  loc_00615288: jge 0061529Ch
  loc_0061528A: push 000000ACh
  loc_0061528F: push 0041F844h
  loc_00615294: push ebx
  loc_00615295: push eax
  loc_00615296: call [00401074h] ; __vbaHresultCheckObj
  loc_0061529C: lea ecx, var_14
  loc_0061529F: call [004012ACh] ; __vbaFreeStr
  loc_006152A5: lea eax, var_20
  loc_006152A8: lea ecx, var_18
  loc_006152AB: push eax
  loc_006152AC: push ecx
  loc_006152AD: push 00000002h
  loc_006152AF: call [00401040h] ; __vbaFreeObjList
  loc_006152B5: lea edx, var_40
  loc_006152B8: lea eax, var_30
  loc_006152BB: push edx
  loc_006152BC: push eax
  loc_006152BD: push 00000002h
  loc_006152BF: call [00401038h] ; __vbaFreeVarList
  loc_006152C5: mov eax, [edi]
  loc_006152C7: add esp, 00000018h
  loc_006152CA: lea edx, var_18
  loc_006152CD: mov ecx, [eax]
  loc_006152CF: push edx
  loc_006152D0: push eax
  loc_006152D1: call [ecx+000000B4h]
  loc_006152D7: test eax, eax
  loc_006152D9: fnclex
  loc_006152DB: jge 006152F1h
  loc_006152DD: mov ecx, [edi]
  loc_006152DF: push 000000B4h
  loc_006152E4: push 0041E938h
  loc_006152E9: push ecx
  loc_006152EA: push eax
  loc_006152EB: call [00401074h] ; __vbaHresultCheckObj
  loc_006152F1: lea ebx, var_1C
  loc_006152F4: mov eax, var_18
  loc_006152F7: push ebx
  loc_006152F8: mov ecx, 00000008h
  loc_006152FD: sub esp, 00000010h
  loc_00615300: mov var_50, ecx
  loc_00615303: mov ebx, esp
  loc_00615305: mov var_48, 0041FBA8h ; "OnDate"
  loc_0061530C: mov edx, [eax]
  loc_0061530E: push eax
  loc_0061530F: mov [ebx], ecx
  loc_00615311: mov ecx, var_4C
  loc_00615314: mov var_A0, eax
  loc_0061531A: mov [ebx+00000004h], ecx
  loc_0061531D: mov ecx, var_48
  loc_00615320: mov [ebx+00000008h], ecx
  loc_00615323: mov ecx, var_44
  loc_00615326: mov [ebx+0000000Ch], ecx
  loc_00615329: call [edx+00000030h]
  loc_0061532C: test eax, eax
  loc_0061532E: fnclex
  loc_00615330: jge 00615347h
  loc_00615332: mov edx, var_A0
  loc_00615338: push 00000030h
  loc_0061533A: push 0041EA14h ; "S"
  loc_0061533F: push edx
  loc_00615340: push eax
  loc_00615341: call [00401074h] ; __vbaHresultCheckObj
  loc_00615347: mov eax, var_1C
  loc_0061534A: lea ecx, var_40
  loc_0061534D: mov var_28, eax
  loc_00615350: lea eax, var_30
  loc_00615353: push eax
  loc_00615354: push ecx
  loc_00615355: mov var_1C, 00000000h
  loc_0061535C: mov var_30, 00000009h
  loc_00615363: call [004010D4h] ; rtcTrimVar
  loc_00615369: mov eax, var_40
  loc_0061536C: mov ecx, var_3C
  loc_0061536F: sub esp, 00000010h
  loc_00615372: mov edx, esp
  loc_00615374: push 00000014h
  loc_00615376: push esi
  loc_00615377: mov [edx], eax
  loc_00615379: mov eax, var_38
  loc_0061537C: mov [edx+00000004h], ecx
  loc_0061537F: mov ecx, var_34
  loc_00615382: mov [edx+00000008h], eax
  loc_00615385: mov [edx+0000000Ch], ecx
  loc_00615388: mov edx, [esi]
  loc_0061538A: call [edx+00000348h]
  loc_00615390: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00615396: push eax
  loc_00615397: lea eax, var_20
  loc_0061539A: push eax
  loc_0061539B: call ebx
  loc_0061539D: push eax
  loc_0061539E: call [00401288h] ; __vbaLateIdSt
  loc_006153A4: lea ecx, var_20
  loc_006153A7: lea edx, var_18
  loc_006153AA: push ecx
  loc_006153AB: push edx
  loc_006153AC: push 00000002h
  loc_006153AE: call [00401040h] ; __vbaFreeObjList
  loc_006153B4: lea eax, var_40
  loc_006153B7: lea ecx, var_30
  loc_006153BA: push eax
  loc_006153BB: push ecx
  loc_006153BC: push 00000002h
  loc_006153BE: call [00401038h] ; __vbaFreeVarList
  loc_006153C4: mov edx, [esi]
  loc_006153C6: add esp, 00000018h
  loc_006153C9: push esi
  loc_006153CA: call [edx+00000308h]
  loc_006153D0: push eax
  loc_006153D1: lea eax, var_20
  loc_006153D4: push eax
  loc_006153D5: call ebx
  loc_006153D7: mov var_A8, eax
  loc_006153DD: mov eax, [edi]
  loc_006153DF: lea edx, var_18
  loc_006153E2: mov ecx, [eax]
  loc_006153E4: push edx
  loc_006153E5: push eax
  loc_006153E6: call [ecx+000000B4h]
  loc_006153EC: test eax, eax
  loc_006153EE: fnclex
  loc_006153F0: jge 00615406h
  loc_006153F2: mov ecx, [edi]
  loc_006153F4: push 000000B4h
  loc_006153F9: push 0041E938h
  loc_006153FE: push ecx
  loc_006153FF: push eax
  loc_00615400: call [00401074h] ; __vbaHresultCheckObj
  loc_00615406: lea ebx, var_1C
  loc_00615409: mov eax, var_18
  loc_0061540C: push ebx
  loc_0061540D: mov ecx, 00000008h
  loc_00615412: sub esp, 00000010h
  loc_00615415: mov var_50, ecx
  loc_00615418: mov ebx, esp
  loc_0061541A: mov var_48, 0042043Ch ; "Amount"
  loc_00615421: mov edx, [eax]
  loc_00615423: push eax
  loc_00615424: mov [ebx], ecx
  loc_00615426: mov ecx, var_4C
  loc_00615429: mov var_A0, eax
  loc_0061542F: mov [ebx+00000004h], ecx
  loc_00615432: mov ecx, var_48
  loc_00615435: mov [ebx+00000008h], ecx
  loc_00615438: mov ecx, var_44
  loc_0061543B: mov [ebx+0000000Ch], ecx
  loc_0061543E: call [edx+00000030h]
  loc_00615441: test eax, eax
  loc_00615443: fnclex
  loc_00615445: jge 0061545Ch
  loc_00615447: mov edx, var_A0
  loc_0061544D: push 00000030h
  loc_0061544F: push 0041EA14h ; "S"
  loc_00615454: push edx
  loc_00615455: push eax
  loc_00615456: call [00401074h] ; __vbaHresultCheckObj
  loc_0061545C: mov eax, var_1C
  loc_0061545F: lea ecx, var_40
  loc_00615462: mov var_28, eax
  loc_00615465: lea eax, var_30
  loc_00615468: push eax
  loc_00615469: push ecx
  loc_0061546A: mov var_1C, 00000000h
  loc_00615471: mov var_30, 00000009h
  loc_00615478: call [004010D4h] ; rtcTrimVar
  loc_0061547E: mov edx, var_A8
  loc_00615484: lea eax, var_40
  loc_00615487: lea ecx, var_14
  loc_0061548A: push eax
  loc_0061548B: mov ebx, [edx]
  loc_0061548D: push ecx
  loc_0061548E: call [004011B0h] ; __vbaStrVarVal
  loc_00615494: mov edx, ebx
  loc_00615496: mov ebx, var_A8
  loc_0061549C: push eax
  loc_0061549D: push ebx
  loc_0061549E: call [edx+000000A4h]
  loc_006154A4: test eax, eax
  loc_006154A6: fnclex
  loc_006154A8: jge 006154BCh
  loc_006154AA: push 000000A4h
  loc_006154AF: push 0041E5E8h
  loc_006154B4: push ebx
  loc_006154B5: push eax
  loc_006154B6: call [00401074h] ; __vbaHresultCheckObj
  loc_006154BC: lea ecx, var_14
  loc_006154BF: call [004012ACh] ; __vbaFreeStr
  loc_006154C5: lea eax, var_20
  loc_006154C8: lea ecx, var_18
  loc_006154CB: push eax
  loc_006154CC: push ecx
  loc_006154CD: push 00000002h
  loc_006154CF: call [00401040h] ; __vbaFreeObjList
  loc_006154D5: lea edx, var_40
  loc_006154D8: lea eax, var_30
  loc_006154DB: push edx
  loc_006154DC: push eax
  loc_006154DD: push 00000002h
  loc_006154DF: call [00401038h] ; __vbaFreeVarList
  loc_006154E5: mov eax, [edi]
  loc_006154E7: add esp, 00000018h
  loc_006154EA: lea edx, var_18
  loc_006154ED: mov ecx, [eax]
  loc_006154EF: push edx
  loc_006154F0: push eax
  loc_006154F1: call [ecx+000000B4h]
  loc_006154F7: test eax, eax
  loc_006154F9: fnclex
  loc_006154FB: jge 00615511h
  loc_006154FD: mov ecx, [edi]
  loc_006154FF: push 000000B4h
  loc_00615504: push 0041E938h
  loc_00615509: push ecx
  loc_0061550A: push eax
  loc_0061550B: call [00401074h] ; __vbaHresultCheckObj
  loc_00615511: lea ebx, var_1C
  loc_00615514: mov eax, var_18
  loc_00615517: push ebx
  loc_00615518: mov ecx, 00000008h
  loc_0061551D: sub esp, 00000010h
  loc_00615520: mov var_50, ecx
  loc_00615523: mov ebx, esp
  loc_00615525: mov var_48, 0042B0CCh ; "Language"
  loc_0061552C: mov edx, [eax]
  loc_0061552E: push eax
  loc_0061552F: mov [ebx], ecx
  loc_00615531: mov ecx, var_4C
  loc_00615534: mov var_A0, eax
  loc_0061553A: mov [ebx+00000004h], ecx
  loc_0061553D: mov ecx, var_48
  loc_00615540: mov [ebx+00000008h], ecx
  loc_00615543: mov ecx, var_44
  loc_00615546: mov [ebx+0000000Ch], ecx
  loc_00615549: call [edx+00000030h]
  loc_0061554C: test eax, eax
  loc_0061554E: fnclex
  loc_00615550: jge 00615567h
  loc_00615552: mov edx, var_A0
  loc_00615558: push 00000030h
  loc_0061555A: push 0041EA14h ; "S"
  loc_0061555F: push edx
  loc_00615560: push eax
  loc_00615561: call [00401074h] ; __vbaHresultCheckObj
  loc_00615567: mov eax, var_1C
  loc_0061556A: lea edx, var_30
  loc_0061556D: push edx
  loc_0061556E: push eax
  loc_0061556F: mov ecx, [eax]
  loc_00615571: mov ebx, eax
  loc_00615573: call [ecx+00000044h]
  loc_00615576: test eax, eax
  loc_00615578: fnclex
  loc_0061557A: jge 0061558Bh
  loc_0061557C: push 00000044h
  loc_0061557E: push 0041EA48h
  loc_00615583: push ebx
  loc_00615584: push eax
  loc_00615585: call [00401074h] ; __vbaHresultCheckObj
  loc_0061558B: lea eax, var_30
  loc_0061558E: lea ecx, var_60
  loc_00615591: push eax
  loc_00615592: push ecx
  loc_00615593: mov var_58, 0042B800h ; "M"
  loc_0061559A: mov var_60, 00008008h
  loc_006155A1: call [00401110h] ; __vbaVarTstEq
  loc_006155A7: mov ebx, eax
  loc_006155A9: lea edx, var_1C
  loc_006155AC: lea eax, var_18
  loc_006155AF: push edx
  loc_006155B0: push eax
  loc_006155B1: push 00000002h
  loc_006155B3: call [00401040h] ; __vbaFreeObjList
  loc_006155B9: add esp, 0000000Ch
  loc_006155BC: lea ecx, var_30
  loc_006155BF: call [00401020h] ; __vbaFreeVar
  loc_006155C5: test bx, bx
  loc_006155C8: jz 0061572Dh
  loc_006155CE: mov ecx, [esi]
  loc_006155D0: push esi
  loc_006155D1: call [ecx+00000304h]
  loc_006155D7: lea edx, var_18
  loc_006155DA: push eax
  loc_006155DB: push edx
  loc_006155DC: call [004010A0h] ; __vbaObjSet
  loc_006155E2: mov ebx, eax
  loc_006155E4: push 00000001h
  loc_006155E6: push ebx
  loc_006155E7: mov eax, [ebx]
  loc_006155E9: call [eax+000000E4h]
  loc_006155EF: test eax, eax
  loc_006155F1: fnclex
  loc_006155F3: jge 00615607h
  loc_006155F5: push 000000E4h
  loc_006155FA: push 004270A8h
  loc_006155FF: push ebx
  loc_00615600: push eax
  loc_00615601: call [00401074h] ; __vbaHresultCheckObj
  loc_00615607: lea ecx, var_18
  loc_0061560A: call [004012B0h] ; __vbaFreeObj
  loc_00615610: mov ecx, [esi]
  loc_00615612: push esi
  loc_00615613: call [ecx+00000304h]
  loc_00615619: lea edx, var_18
  loc_0061561C: push eax
  loc_0061561D: push edx
  loc_0061561E: call [004010A0h] ; __vbaObjSet
  loc_00615624: mov ebx, eax
  loc_00615626: push 0042B800h ; "M"
  loc_0061562B: push ebx
  loc_0061562C: mov eax, [ebx]
  loc_0061562E: call [eax+00000054h]
  loc_00615631: test eax, eax
  loc_00615633: fnclex
  loc_00615635: jge 00615646h
  loc_00615637: push 00000054h
  loc_00615639: push 004270A8h
  loc_0061563E: push ebx
  loc_0061563F: push eax
  loc_00615640: call [00401074h] ; __vbaHresultCheckObj
  loc_00615646: lea ecx, var_18
  loc_00615649: call [004012B0h] ; __vbaFreeObj
  loc_0061564F: mov ecx, [esi]
  loc_00615651: push esi
  loc_00615652: call [ecx+0000030Ch]
  loc_00615658: lea edx, var_20
  loc_0061565B: push eax
  loc_0061565C: push edx
  loc_0061565D: call [004010A0h] ; __vbaObjSet
  loc_00615663: mov esi, eax
  loc_00615665: mov eax, [edi]
  loc_00615667: lea edx, var_18
  loc_0061566A: mov ecx, [eax]
  loc_0061566C: push edx
  loc_0061566D: push eax
  loc_0061566E: call [ecx+000000B4h]
  loc_00615674: test eax, eax
  loc_00615676: fnclex
  loc_00615678: jge 0061568Eh
  loc_0061567A: mov ecx, [edi]
  loc_0061567C: push 000000B4h
  loc_00615681: push 0041E938h
  loc_00615686: push ecx
  loc_00615687: push eax
  loc_00615688: call [00401074h] ; __vbaHresultCheckObj
  loc_0061568E: lea ebx, var_1C
  loc_00615691: mov eax, var_18
  loc_00615694: push ebx
  loc_00615695: mov ecx, 00000008h
  loc_0061569A: sub esp, 00000010h
  loc_0061569D: mov var_50, ecx
  loc_006156A0: mov ebx, esp
  loc_006156A2: mov var_48, 0042AD00h ; "Remark"
  loc_006156A9: mov edx, [eax]
  loc_006156AB: push eax
  loc_006156AC: mov [ebx], ecx
  loc_006156AE: mov ecx, var_4C
  loc_006156B1: mov var_A0, eax
  loc_006156B7: mov [ebx+00000004h], ecx
  loc_006156BA: mov ecx, var_48
  loc_006156BD: mov [ebx+00000008h], ecx
  loc_006156C0: mov ecx, var_44
  loc_006156C3: mov [ebx+0000000Ch], ecx
  loc_006156C6: call [edx+00000030h]
  loc_006156C9: test eax, eax
  loc_006156CB: fnclex
  loc_006156CD: jge 006156E4h
  loc_006156CF: mov edx, var_A0
  loc_006156D5: push 00000030h
  loc_006156D7: push 0041EA14h ; "S"
  loc_006156DC: push edx
  loc_006156DD: push eax
  loc_006156DE: call [00401074h] ; __vbaHresultCheckObj
  loc_006156E4: mov eax, var_1C
  loc_006156E7: lea ecx, var_40
  loc_006156EA: mov var_28, eax
  loc_006156ED: lea eax, var_30
  loc_006156F0: push eax
  loc_006156F1: push ecx
  loc_006156F2: mov var_1C, 00000000h
  loc_006156F9: mov var_30, 00000009h
  loc_00615700: call [004010D4h] ; rtcTrimVar
  loc_00615706: mov ebx, [esi]
  loc_00615708: lea edx, var_40
  loc_0061570B: lea eax, var_14
  loc_0061570E: push edx
  loc_0061570F: push eax
  loc_00615710: call [004011B0h] ; __vbaStrVarVal
  loc_00615716: push eax
  loc_00615717: push esi
  loc_00615718: call [ebx+000000A4h]
  loc_0061571E: test eax, eax
  loc_00615720: fnclex
  loc_00615722: jge 00615895h
  loc_00615728: jmp 00615883h
  loc_0061572D: mov edx, [esi]
  loc_0061572F: push esi
  loc_00615730: call [edx+00000304h]
  loc_00615736: push eax
  loc_00615737: lea eax, var_18
  loc_0061573A: push eax
  loc_0061573B: call [004010A0h] ; __vbaObjSet
  loc_00615741: mov ebx, eax
  loc_00615743: push 00000000h
  loc_00615745: push ebx
  loc_00615746: mov ecx, [ebx]
  loc_00615748: call [ecx+000000E4h]
  loc_0061574E: test eax, eax
  loc_00615750: fnclex
  loc_00615752: jge 00615766h
  loc_00615754: push 000000E4h
  loc_00615759: push 004270A8h
  loc_0061575E: push ebx
  loc_0061575F: push eax
  loc_00615760: call [00401074h] ; __vbaHresultCheckObj
  loc_00615766: lea ecx, var_18
  loc_00615769: call [004012B0h] ; __vbaFreeObj
  loc_0061576F: mov edx, [esi]
  loc_00615771: push esi
  loc_00615772: call [edx+00000304h]
  loc_00615778: push eax
  loc_00615779: lea eax, var_18
  loc_0061577C: push eax
  loc_0061577D: call [004010A0h] ; __vbaObjSet
  loc_00615783: mov ebx, eax
  loc_00615785: push 0042B808h
  loc_0061578A: push ebx
  loc_0061578B: mov ecx, [ebx]
  loc_0061578D: call [ecx+00000054h]
  loc_00615790: test eax, eax
  loc_00615792: fnclex
  loc_00615794: jge 006157A5h
  loc_00615796: push 00000054h
  loc_00615798: push 004270A8h
  loc_0061579D: push ebx
  loc_0061579E: push eax
  loc_0061579F: call [00401074h] ; __vbaHresultCheckObj
  loc_006157A5: lea ecx, var_18
  loc_006157A8: call [004012B0h] ; __vbaFreeObj
  loc_006157AE: mov edx, [esi]
  loc_006157B0: push esi
  loc_006157B1: call [edx+0000030Ch]
  loc_006157B7: push eax
  loc_006157B8: lea eax, var_20
  loc_006157BB: push eax
  loc_006157BC: call [004010A0h] ; __vbaObjSet
  loc_006157C2: mov esi, eax
  loc_006157C4: mov eax, [edi]
  loc_006157C6: lea edx, var_18
  loc_006157C9: mov ecx, [eax]
  loc_006157CB: push edx
  loc_006157CC: push eax
  loc_006157CD: call [ecx+000000B4h]
  loc_006157D3: test eax, eax
  loc_006157D5: fnclex
  loc_006157D7: jge 006157EDh
  loc_006157D9: mov ecx, [edi]
  loc_006157DB: push 000000B4h
  loc_006157E0: push 0041E938h
  loc_006157E5: push ecx
  loc_006157E6: push eax
  loc_006157E7: call [00401074h] ; __vbaHresultCheckObj
  loc_006157ED: lea ebx, var_1C
  loc_006157F0: mov eax, var_18
  loc_006157F3: push ebx
  loc_006157F4: mov ecx, 00000008h
  loc_006157F9: sub esp, 00000010h
  loc_006157FC: mov var_50, ecx
  loc_006157FF: mov ebx, esp
  loc_00615801: mov var_48, 0042AD00h ; "Remark"
  loc_00615808: mov edx, [eax]
  loc_0061580A: push eax
  loc_0061580B: mov [ebx], ecx
  loc_0061580D: mov ecx, var_4C
  loc_00615810: mov var_A0, eax
  loc_00615816: mov [ebx+00000004h], ecx
  loc_00615819: mov ecx, var_48
  loc_0061581C: mov [ebx+00000008h], ecx
  loc_0061581F: mov ecx, var_44
  loc_00615822: mov [ebx+0000000Ch], ecx
  loc_00615825: call [edx+00000030h]
  loc_00615828: test eax, eax
  loc_0061582A: fnclex
  loc_0061582C: jge 00615843h
  loc_0061582E: mov edx, var_A0
  loc_00615834: push 00000030h
  loc_00615836: push 0041EA14h ; "S"
  loc_0061583B: push edx
  loc_0061583C: push eax
  loc_0061583D: call [00401074h] ; __vbaHresultCheckObj
  loc_00615843: mov eax, var_1C
  loc_00615846: lea ecx, var_40
  loc_00615849: mov var_28, eax
  loc_0061584C: lea eax, var_30
  loc_0061584F: push eax
  loc_00615850: push ecx
  loc_00615851: mov var_1C, 00000000h
  loc_00615858: mov var_30, 00000009h
  loc_0061585F: call [004010D4h] ; rtcTrimVar
  loc_00615865: mov ebx, [esi]
  loc_00615867: lea edx, var_40
  loc_0061586A: lea eax, var_14
  loc_0061586D: push edx
  loc_0061586E: push eax
  loc_0061586F: call [004011B0h] ; __vbaStrVarVal
  loc_00615875: push eax
  loc_00615876: push esi
  loc_00615877: call [ebx+000000A4h]
  loc_0061587D: test eax, eax
  loc_0061587F: fnclex
  loc_00615881: jge 00615895h
  loc_00615883: push 000000A4h
  loc_00615888: push 0041E5E8h
  loc_0061588D: push esi
  loc_0061588E: push eax
  loc_0061588F: call [00401074h] ; __vbaHresultCheckObj
  loc_00615895: lea ecx, var_14
  loc_00615898: call [004012ACh] ; __vbaFreeStr
  loc_0061589E: lea ecx, var_20
  loc_006158A1: lea edx, var_18
  loc_006158A4: push ecx
  loc_006158A5: push edx
  loc_006158A6: push 00000002h
  loc_006158A8: call [00401040h] ; __vbaFreeObjList
  loc_006158AE: lea eax, var_40
  loc_006158B1: lea ecx, var_30
  loc_006158B4: push eax
  loc_006158B5: push ecx
  loc_006158B6: push 00000002h
  loc_006158B8: call [00401038h] ; __vbaFreeVarList
  loc_006158BE: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_006158C4: add esp, 00000018h
  loc_006158C7: mov eax, [edi]
  loc_006158C9: push eax
  loc_006158CA: mov edx, [eax]
  loc_006158CC: call [edx+000000C4h]
  loc_006158D2: test eax, eax
  loc_006158D4: fnclex
  loc_006158D6: jge 006158E8h
  loc_006158D8: mov ecx, [edi]
  loc_006158DA: push 000000C4h
  loc_006158DF: push 0041E938h
  loc_006158E4: push ecx
  loc_006158E5: push eax
  loc_006158E6: call ebx
  loc_006158E8: push 0041E938h
  loc_006158ED: push 00000000h
  loc_006158EF: call [00401274h] ; __vbaCastObj
  loc_006158F5: lea edx, var_18
  loc_006158F8: push eax
  loc_006158F9: push edx
  loc_006158FA: call [004010A0h] ; __vbaObjSet
  loc_00615900: push eax
  loc_00615901: push edi
  loc_00615902: call [004010B8h] ; __vbaObjSetAddref
  loc_00615908: lea ecx, var_18
  loc_0061590B: call [004012B0h] ; __vbaFreeObj
  loc_00615911: push 0061594Ah
  loc_00615916: jmp 00615949h
  loc_00615918: lea ecx, var_14
  loc_0061591B: call [004012ACh] ; __vbaFreeStr
  loc_00615921: lea eax, var_20
  loc_00615924: lea ecx, var_1C
  loc_00615927: push eax
  loc_00615928: lea edx, var_18
  loc_0061592B: push ecx
  loc_0061592C: push edx
  loc_0061592D: push 00000003h
  loc_0061592F: call [00401040h] ; __vbaFreeObjList
  loc_00615935: lea eax, var_40
  loc_00615938: lea ecx, var_30
  loc_0061593B: push eax
  loc_0061593C: push ecx
  loc_0061593D: push 00000002h
  loc_0061593F: call [00401038h] ; __vbaFreeVarList
  loc_00615945: add esp, 0000001Ch
  loc_00615948: ret
  loc_00615949: ret
  loc_0061594A: mov ecx, var_10
  loc_0061594D: pop edi
  loc_0061594E: pop esi
  loc_0061594F: xor eax, eax
  loc_00615951: mov fs:[00000000h], ecx
  loc_00615958: pop ebx
  loc_00615959: mov esp, ebp
  loc_0061595B: pop ebp
  loc_0061595C: retn 0004h
End Sub
