VERSION 5.00
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Begin VB.Form frmAgentThai
  BackColor = &H80000004&
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  KeyPreview = -1  'True
  ClientLeft = 45
  ClientTop = 45
  ClientWidth = 6135
  ClientHeight = 4380
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdReport
    Caption = "Report"
    Left = 4230
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 18
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtRate
    Left = 1530
    Top = 1950
    Width = 1350
    Height = 315
    TabIndex = 4
    MaxLength = 70
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtCommission
    Left = 1530
    Top = 1530
    Width = 1350
    Height = 315
    TabIndex = 3
    MaxLength = 30
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtPhone
    Left = 1530
    Top = 1110
    Width = 2610
    Height = 315
    TabIndex = 2
    MaxLength = 30
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmAgentThai.frx":0000
    Left = 4860
    Top = 900
  End
  Begin VB.CommandButton cmdSearch
    Caption = "Search"
    Left = 1620
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 8
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdNew
    Caption = "New "
    Left = 750
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 0
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdExit
    Caption = "Exit"
    Left = 5100
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 11
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdEdit
    Caption = "Edit "
    Left = 2490
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 9
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdDelete
    Caption = "Delete "
    Left = 3360
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 10
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtAddress
    Left = 1530
    Top = 2370
    Width = 4410
    Height = 315
    TabIndex = 5
    MaxLength = 70
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.TextBox txtName
    Left = 1530
    Top = 690
    Width = 2610
    Height = 315
    TabIndex = 1
    MaxLength = 30
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdCancel
    Caption = "Cancel"
    Left = 1620
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 7
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdSave
    Caption = "Save "
    Left = 750
    Top = 3570
    Width = 860
    Height = 345
    TabIndex = 6
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label2
    Caption = "Commission"
    ForeColor = &H80000008&
    Left = 315
    Top = 1590
    Width = 855
    Height = 210
    TabIndex = 17
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label1
    Caption = "Rate"
    ForeColor = &H80000008&
    Left = 315
    Top = 2010
    Width = 330
    Height = 210
    TabIndex = 16
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label19
    Caption = "Customer Name"
    ForeColor = &H80000008&
    Left = 315
    Top = 735
    Width = 1140
    Height = 210
    TabIndex = 15
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label17
    Caption = "Address"
    ForeColor = &H80000008&
    Left = 315
    Top = 2460
    Width = 630
    Height = 210
    TabIndex = 14
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label15
    Caption = "Phone"
    ForeColor = &H80000008&
    Left = 315
    Top = 1185
    Width = 450
    Height = 210
    TabIndex = 13
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.Label Label8
    Caption = "Customer Listing"
    BackColor = &HC00000&
    ForeColor = &HFFFF&
    Left = 0
    Top = 0
    Width = 6135
    Height = 315
    TabIndex = 12
    Alignment = 2 'Center
    BeginProperty Font
      Name = "Times New Roman"
      Size = 11.25
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmAgentThai"


Private Sub cmdSave_Click() '456EA0
  loc_00456EA0: push ebp
  loc_00456EA1: mov ebp, esp
  loc_00456EA3: sub esp, 0000000Ch
  loc_00456EA6: push 00403B36h ; __vbaExceptHandler
  loc_00456EAB: mov eax, fs:[00000000h]
  loc_00456EB1: push eax
  loc_00456EB2: mov fs:[00000000h], esp
  loc_00456EB9: sub esp, 00000028h
  loc_00456EBC: push ebx
  loc_00456EBD: push esi
  loc_00456EBE: push edi
  loc_00456EBF: mov var_C, esp
  loc_00456EC2: mov var_8, 004014A0h
  loc_00456EC9: mov esi, Me
  loc_00456ECC: mov eax, esi
  loc_00456ECE: and eax, 00000001h
  loc_00456ED1: mov var_4, eax
  loc_00456ED4: and esi, FFFFFFFEh
  loc_00456ED7: push esi
  loc_00456ED8: mov Me, esi
  loc_00456EDB: mov ecx, [esi]
  loc_00456EDD: call [ecx+00000004h]
  loc_00456EE0: or ebx, FFFFFFFFh
  loc_00456EE3: xor edi, edi
  loc_00456EE5: cmp [esi+0000003Ch], bx
  loc_00456EE9: mov var_18, edi
  loc_00456EEC: mov var_28, edi
  loc_00456EEF: mov var_2C, edi
  loc_00456EF2: jnz 00456F64h
  loc_00456EF4: mov edx, [esi]
  loc_00456EF6: push esi
  loc_00456EF7: call [edx+00000704h]
  loc_00456EFD: mov eax, [esi]
  loc_00456EFF: lea ecx, var_28
  loc_00456F02: lea edx, var_2C
  loc_00456F05: push ecx
  loc_00456F06: push edx
  loc_00456F07: push esi
  loc_00456F08: mov var_2C, ebx
  loc_00456F0B: call [eax+000006FCh]
  loc_00456F11: mov edi, [00401020h] ; __vbaFreeVar
  loc_00456F17: lea ecx, var_28
  loc_00456F1A: call edi
  loc_00456F1C: mov eax, [esi]
  loc_00456F1E: lea ecx, var_28
  loc_00456F21: lea edx, var_2C
  loc_00456F24: push ecx
  loc_00456F25: push edx
  loc_00456F26: push esi
  loc_00456F27: mov var_2C, 00000000h
  loc_00456F2E: call [eax+000006F8h]
  loc_00456F34: lea ecx, var_28
  loc_00456F37: call edi
  loc_00456F39: mov eax, [esi]
  loc_00456F3B: push esi
  loc_00456F3C: call [eax+00000310h]
  loc_00456F42: lea ecx, var_18
  loc_00456F45: push eax
  loc_00456F46: push ecx
  loc_00456F47: call [004010A0h] ; __vbaObjSet
  loc_00456F4D: mov esi, eax
  loc_00456F4F: push esi
  loc_00456F50: mov edx, [esi]
  loc_00456F52: call [edx+000001A4h]
  loc_00456F58: test eax, eax
  loc_00456F5A: fnclex
  loc_00456F5C: jge 00456FE2h
  loc_00456F62: jmp 00456FD0h
  loc_00456F64: mov eax, [esi]
  loc_00456F66: push esi
  loc_00456F67: call [eax+0000071Ch]
  loc_00456F6D: cmp [esi+0000003Eh], bx
  loc_00456F71: jnz 00456FEDh
  loc_00456F73: mov ecx, [esi]
  loc_00456F75: lea edx, var_28
  loc_00456F78: lea eax, var_2C
  loc_00456F7B: push edx
  loc_00456F7C: push eax
  loc_00456F7D: push esi
  loc_00456F7E: mov var_2C, edi
  loc_00456F81: call [ecx+000006F8h]
  loc_00456F87: mov edi, [00401020h] ; __vbaFreeVar
  loc_00456F8D: lea ecx, var_28
  loc_00456F90: call edi
  loc_00456F92: mov ecx, [esi]
  loc_00456F94: lea edx, var_28
  loc_00456F97: lea eax, var_2C
  loc_00456F9A: push edx
  loc_00456F9B: push eax
  loc_00456F9C: push esi
  loc_00456F9D: mov var_2C, ebx
  loc_00456FA0: call [ecx+000006FCh]
  loc_00456FA6: lea ecx, var_28
  loc_00456FA9: call edi
  loc_00456FAB: mov ecx, [esi]
  loc_00456FAD: push esi
  loc_00456FAE: call [ecx+00000310h]
  loc_00456FB4: lea edx, var_18
  loc_00456FB7: push eax
  loc_00456FB8: push edx
  loc_00456FB9: call [004010A0h] ; __vbaObjSet
  loc_00456FBF: mov esi, eax
  loc_00456FC1: push esi
  loc_00456FC2: mov eax, [esi]
  loc_00456FC4: call [eax+000001A4h]
  loc_00456FCA: test eax, eax
  loc_00456FCC: fnclex
  loc_00456FCE: jge 00456FE2h
  loc_00456FD0: push 000001A4h
  loc_00456FD5: push 0041EAACh
  loc_00456FDA: push esi
  loc_00456FDB: push eax
  loc_00456FDC: call [00401074h] ; __vbaHresultCheckObj
  loc_00456FE2: lea ecx, var_18
  loc_00456FE5: call [004012B0h] ; __vbaFreeObj
  loc_00456FEB: xor edi, edi
  loc_00456FED: mov var_4, edi
  loc_00456FF0: push 0045700Bh
  loc_00456FF5: jmp 0045700Ah
  loc_00456FF7: lea ecx, var_18
  loc_00456FFA: call [004012B0h] ; __vbaFreeObj
  loc_00457000: lea ecx, var_28
  loc_00457003: call [00401020h] ; __vbaFreeVar
  loc_00457009: ret
  loc_0045700A: ret
  loc_0045700B: mov eax, Me
  loc_0045700E: push eax
  loc_0045700F: mov ecx, [eax]
  loc_00457011: call [ecx+00000008h]
  loc_00457014: mov eax, var_4
  loc_00457017: mov ecx, var_14
  loc_0045701A: pop edi
  loc_0045701B: pop esi
  loc_0045701C: mov fs:[00000000h], ecx
  loc_00457023: pop ebx
  loc_00457024: mov esp, ebp
  loc_00457026: pop ebp
  loc_00457027: retn 0004h
End Sub

Private Sub txtAddress_KeyPress(KeyAscii As Integer) '457320
  loc_00457320: push ebp
  loc_00457321: mov ebp, esp
  loc_00457323: sub esp, 0000000Ch
  loc_00457326: push 00403B36h ; __vbaExceptHandler
  loc_0045732B: mov eax, fs:[00000000h]
  loc_00457331: push eax
  loc_00457332: mov fs:[00000000h], esp
  loc_00457339: sub esp, 00000014h
  loc_0045733C: push ebx
  loc_0045733D: push esi
  loc_0045733E: push edi
  loc_0045733F: mov var_C, esp
  loc_00457342: mov var_8, 004014D0h
  loc_00457349: mov esi, Me
  loc_0045734C: mov eax, esi
  loc_0045734E: and eax, 00000001h
  loc_00457351: mov var_4, eax
  loc_00457354: and esi, FFFFFFFEh
  loc_00457357: push esi
  loc_00457358: mov Me, esi
  loc_0045735B: mov ecx, [esi]
  loc_0045735D: call [ecx+00000004h]
  loc_00457360: mov edx, KeyAscii
  loc_00457363: xor edi, edi
  loc_00457365: mov var_18, edi
  loc_00457368: cmp [edx], 000Dh
  loc_0045736C: jnz 004573AEh
  loc_0045736E: mov eax, [esi]
  loc_00457370: push esi
  loc_00457371: call [eax+0000032Ch]
  loc_00457377: lea ecx, var_18
  loc_0045737A: push eax
  loc_0045737B: push ecx
  loc_0045737C: call [004010A0h] ; __vbaObjSet
  loc_00457382: mov esi, eax
  loc_00457384: push esi
  loc_00457385: mov edx, [esi]
  loc_00457387: call [edx+000001A4h]
  loc_0045738D: cmp eax, edi
  loc_0045738F: fnclex
  loc_00457391: jge 004573A5h
  loc_00457393: push 000001A4h
  loc_00457398: push 0041EAACh
  loc_0045739D: push esi
  loc_0045739E: push eax
  loc_0045739F: call [00401074h] ; __vbaHresultCheckObj
  loc_004573A5: lea ecx, var_18
  loc_004573A8: call [004012B0h] ; __vbaFreeObj
  loc_004573AE: mov var_4, edi
  loc_004573B1: push 004573C3h
  loc_004573B6: jmp 004573C2h
  loc_004573B8: lea ecx, var_18
  loc_004573BB: call [004012B0h] ; __vbaFreeObj
  loc_004573C1: ret
  loc_004573C2: ret
  loc_004573C3: mov eax, Me
  loc_004573C6: push eax
  loc_004573C7: mov ecx, [eax]
  loc_004573C9: call [ecx+00000008h]
  loc_004573CC: mov eax, var_4
  loc_004573CF: mov ecx, var_14
  loc_004573D2: pop edi
  loc_004573D3: pop esi
  loc_004573D4: mov fs:[00000000h], ecx
  loc_004573DB: pop ebx
  loc_004573DC: mov esp, ebp
  loc_004573DE: pop ebp
  loc_004573DF: retn 0008h
End Sub

Private Sub txtPhone_KeyPress(KeyAscii As Integer) '457DD0
  loc_00457DD0: push ebp
  loc_00457DD1: mov ebp, esp
  loc_00457DD3: sub esp, 0000000Ch
  loc_00457DD6: push 00403B36h ; __vbaExceptHandler
  loc_00457DDB: mov eax, fs:[00000000h]
  loc_00457DE1: push eax
  loc_00457DE2: mov fs:[00000000h], esp
  loc_00457DE9: sub esp, 00000014h
  loc_00457DEC: push ebx
  loc_00457DED: push esi
  loc_00457DEE: push edi
  loc_00457DEF: mov var_C, esp
  loc_00457DF2: mov var_8, 00401520h
  loc_00457DF9: mov esi, Me
  loc_00457DFC: mov eax, esi
  loc_00457DFE: and eax, 00000001h
  loc_00457E01: mov var_4, eax
  loc_00457E04: and esi, FFFFFFFEh
  loc_00457E07: push esi
  loc_00457E08: mov Me, esi
  loc_00457E0B: mov ecx, [esi]
  loc_00457E0D: call [ecx+00000004h]
  loc_00457E10: mov edx, KeyAscii
  loc_00457E13: xor edi, edi
  loc_00457E15: mov var_18, edi
  loc_00457E18: cmp [edx], 000Dh
  loc_00457E1C: jnz 00457E5Eh
  loc_00457E1E: mov eax, [esi]
  loc_00457E20: push esi
  loc_00457E21: call [eax+00000304h]
  loc_00457E27: lea ecx, var_18
  loc_00457E2A: push eax
  loc_00457E2B: push ecx
  loc_00457E2C: call [004010A0h] ; __vbaObjSet
  loc_00457E32: mov esi, eax
  loc_00457E34: push esi
  loc_00457E35: mov edx, [esi]
  loc_00457E37: call [edx+00000204h]
  loc_00457E3D: cmp eax, edi
  loc_00457E3F: fnclex
  loc_00457E41: jge 00457E55h
  loc_00457E43: push 00000204h
  loc_00457E48: push 0041E5E8h
  loc_00457E4D: push esi
  loc_00457E4E: push eax
  loc_00457E4F: call [00401074h] ; __vbaHresultCheckObj
  loc_00457E55: lea ecx, var_18
  loc_00457E58: call [004012B0h] ; __vbaFreeObj
  loc_00457E5E: mov var_4, edi
  loc_00457E61: push 00457E73h
  loc_00457E66: jmp 00457E72h
  loc_00457E68: lea ecx, var_18
  loc_00457E6B: call [004012B0h] ; __vbaFreeObj
  loc_00457E71: ret
  loc_00457E72: ret
  loc_00457E73: mov eax, Me
  loc_00457E76: push eax
  loc_00457E77: mov ecx, [eax]
  loc_00457E79: call [ecx+00000008h]
  loc_00457E7C: mov eax, var_4
  loc_00457E7F: mov ecx, var_14
  loc_00457E82: pop edi
  loc_00457E83: pop esi
  loc_00457E84: mov fs:[00000000h], ecx
  loc_00457E8B: pop ebx
  loc_00457E8C: mov esp, ebp
  loc_00457E8E: pop ebp
  loc_00457E8F: retn 0008h
End Sub

Private Sub txtCommission_KeyPress(KeyAscii As Integer) '4575A0
  loc_004575A0: push ebp
  loc_004575A1: mov ebp, esp
  loc_004575A3: sub esp, 0000000Ch
  loc_004575A6: push 00403B36h ; __vbaExceptHandler
  loc_004575AB: mov eax, fs:[00000000h]
  loc_004575B1: push eax
  loc_004575B2: mov fs:[00000000h], esp
  loc_004575B9: sub esp, 000000A8h
  loc_004575BF: push ebx
  loc_004575C0: push esi
  loc_004575C1: push edi
  loc_004575C2: mov var_C, esp
  loc_004575C5: mov var_8, 004014F0h
  loc_004575CC: mov edi, Me
  loc_004575CF: mov eax, edi
  loc_004575D1: and eax, 00000001h
  loc_004575D4: mov var_4, eax
  loc_004575D7: and edi, FFFFFFFEh
  loc_004575DA: push edi
  loc_004575DB: mov Me, edi
  loc_004575DE: mov ecx, [edi]
  loc_004575E0: call [ecx+00000004h]
  loc_004575E3: xor esi, esi
  loc_004575E5: mov edx, 0041EA94h ; "0123456789."
  loc_004575EA: lea ecx, var_18
  loc_004575ED: mov var_18, esi
  loc_004575F0: mov var_1C, esi
  loc_004575F3: mov var_2C, esi
  loc_004575F6: mov var_3C, esi
  loc_004575F9: mov var_4C, esi
  loc_004575FC: mov var_5C, esi
  loc_004575FF: mov var_6C, esi
  loc_00457602: mov var_7C, esi
  loc_00457605: mov var_8C, esi
  loc_0045760B: mov var_9C, esi
  loc_00457611: mov var_AC, esi
  loc_00457617: call [004011ECh] ; __vbaStrCopy
  loc_0045761D: mov ebx, KeyAscii
  loc_00457620: mov edx, var_18
  loc_00457623: lea ecx, var_2C
  loc_00457626: mov var_74, edx
  loc_00457629: movsx eax, [ebx]
  loc_0045762C: push eax
  loc_0045762D: push ecx
  loc_0045762E: mov var_7C, 00000008h
  loc_00457635: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_0045763B: mov ax, [ebx]
  loc_0045763E: xor edx, edx
  loc_00457640: cmp ax, 0008h
  loc_00457644: mov ecx, 0000000Bh
  loc_00457649: setz dl
  loc_0045764C: neg edx
  loc_0045764E: mov var_94, dx
  loc_00457655: xor edx, edx
  loc_00457657: cmp ax, 000Dh
  loc_0045765B: mov var_9C, ecx
  loc_00457661: setz dl
  loc_00457664: neg edx
  loc_00457666: mov var_AC, ecx
  loc_0045766C: lea eax, var_7C
  loc_0045766F: push 00000001h
  loc_00457671: lea ecx, var_2C
  loc_00457674: mov var_A4, dx
  loc_0045767B: push eax
  loc_0045767C: push ecx
  loc_0045767D: lea edx, var_3C
  loc_00457680: push esi
  loc_00457681: push edx
  loc_00457682: mov var_84, esi
  loc_00457688: mov var_8C, 00008002h
  loc_00457692: call [004011A8h] ; __vbaInStrVar
  loc_00457698: push eax
  loc_00457699: lea eax, var_8C
  loc_0045769F: lea ecx, var_4C
  loc_004576A2: push eax
  loc_004576A3: push ecx
  loc_004576A4: call [00401050h] ; __vbaVarCmpNe
  loc_004576AA: push eax
  loc_004576AB: lea edx, var_9C
  loc_004576B1: lea eax, var_5C
  loc_004576B4: push edx
  loc_004576B5: push eax
  loc_004576B6: call [0040112Ch] ; __vbaVarOr
  loc_004576BC: lea ecx, var_AC
  loc_004576C2: push eax
  loc_004576C3: lea edx, var_6C
  loc_004576C6: push ecx
  loc_004576C7: push edx
  loc_004576C8: call [0040112Ch] ; __vbaVarOr
  loc_004576CE: push eax
  loc_004576CF: call [004010E0h] ; __vbaBoolVarNull
  loc_004576D5: mov var_B0, ax
  loc_004576DC: lea eax, var_AC
  loc_004576E2: lea ecx, var_9C
  loc_004576E8: push eax
  loc_004576E9: lea edx, var_3C
  loc_004576EC: push ecx
  loc_004576ED: lea eax, var_2C
  loc_004576F0: push edx
  loc_004576F1: push eax
  loc_004576F2: push 00000004h
  loc_004576F4: call [00401038h] ; __vbaFreeVarList
  loc_004576FA: add esp, 00000014h
  loc_004576FD: cmp var_B0, si
  loc_00457704: jz 00457754h
  loc_00457706: mov ax, [ebx]
  loc_00457709: cmp ax, 000Dh
  loc_0045770D: mov [ebx], ax
  loc_00457710: jnz 00457757h
  loc_00457712: mov ecx, [edi]
  loc_00457714: push edi
  loc_00457715: call [ecx+00000300h]
  loc_0045771B: lea edx, var_1C
  loc_0045771E: push eax
  loc_0045771F: push edx
  loc_00457720: call [004010A0h] ; __vbaObjSet
  loc_00457726: mov edi, eax
  loc_00457728: push edi
  loc_00457729: mov eax, [edi]
  loc_0045772B: call [eax+00000204h]
  loc_00457731: cmp eax, esi
  loc_00457733: fnclex
  loc_00457735: jge 00457749h
  loc_00457737: push 00000204h
  loc_0045773C: push 0041E5E8h
  loc_00457741: push edi
  loc_00457742: push eax
  loc_00457743: call [00401074h] ; __vbaHresultCheckObj
  loc_00457749: lea ecx, var_1C
  loc_0045774C: call [004012B0h] ; __vbaFreeObj
  loc_00457752: jmp 00457757h
  loc_00457754: mov [ebx], si
  loc_00457757: mov var_4, esi
  loc_0045775A: push 00457794h
  loc_0045775F: jmp 0045778Ah
  loc_00457761: lea ecx, var_1C
  loc_00457764: call [004012B0h] ; __vbaFreeObj
  loc_0045776A: lea ecx, var_6C
  loc_0045776D: lea edx, var_5C
  loc_00457770: push ecx
  loc_00457771: lea eax, var_4C
  loc_00457774: push edx
  loc_00457775: lea ecx, var_3C
  loc_00457778: push eax
  loc_00457779: lea edx, var_2C
  loc_0045777C: push ecx
  loc_0045777D: push edx
  loc_0045777E: push 00000005h
  loc_00457780: call [00401038h] ; __vbaFreeVarList
  loc_00457786: add esp, 00000018h
  loc_00457789: ret
  loc_0045778A: lea ecx, var_18
  loc_0045778D: call [004012ACh] ; __vbaFreeStr
  loc_00457793: ret
  loc_00457794: mov eax, Me
  loc_00457797: push eax
  loc_00457798: mov ecx, [eax]
  loc_0045779A: call [ecx+00000008h]
  loc_0045779D: mov eax, var_4
  loc_004577A0: mov ecx, var_14
  loc_004577A3: pop edi
  loc_004577A4: pop esi
  loc_004577A5: mov fs:[00000000h], ecx
  loc_004577AC: pop ebx
  loc_004577AD: mov esp, ebp
  loc_004577AF: pop ebp
  loc_004577B0: retn 0008h
End Sub

Private Sub cmdCancel_Click() '4535E0
  loc_004535E0: push ebp
  loc_004535E1: mov ebp, esp
  loc_004535E3: sub esp, 0000000Ch
  loc_004535E6: push 00403B36h ; __vbaExceptHandler
  loc_004535EB: mov eax, fs:[00000000h]
  loc_004535F1: push eax
  loc_004535F2: mov fs:[00000000h], esp
  loc_004535F9: sub esp, 00000028h
  loc_004535FC: push ebx
  loc_004535FD: push esi
  loc_004535FE: push edi
  loc_004535FF: mov var_C, esp
  loc_00453602: mov var_8, 00401410h
  loc_00453609: mov esi, Me
  loc_0045360C: mov eax, esi
  loc_0045360E: and eax, 00000001h
  loc_00453611: mov var_4, eax
  loc_00453614: and esi, FFFFFFFEh
  loc_00453617: push esi
  loc_00453618: mov Me, esi
  loc_0045361B: mov ecx, [esi]
  loc_0045361D: call [ecx+00000004h]
  loc_00453620: mov edx, [esi]
  loc_00453622: xor ebx, ebx
  loc_00453624: push esi
  loc_00453625: mov var_18, ebx
  loc_00453628: mov var_28, ebx
  loc_0045362B: mov var_2C, ebx
  loc_0045362E: call [edx+0000032Ch]
  loc_00453634: push eax
  loc_00453635: lea eax, var_18
  loc_00453638: push eax
  loc_00453639: call [004010A0h] ; __vbaObjSet
  loc_0045363F: mov edi, eax
  loc_00453641: push 0041F138h ; "&Save (F2)"
  loc_00453646: push edi
  loc_00453647: mov ecx, [edi]
  loc_00453649: call [ecx+00000054h]
  loc_0045364C: cmp eax, ebx
  loc_0045364E: fnclex
  loc_00453650: jge 00453661h
  loc_00453652: push 00000054h
  loc_00453654: push 0041EAACh
  loc_00453659: push edi
  loc_0045365A: push eax
  loc_0045365B: call [00401074h] ; __vbaHresultCheckObj
  loc_00453661: lea ecx, var_18
  loc_00453664: call [004012B0h] ; __vbaFreeObj
  loc_0045366A: mov edx, [esi]
  loc_0045366C: lea eax, var_28
  loc_0045366F: lea ecx, var_2C
  loc_00453672: push eax
  loc_00453673: push ecx
  loc_00453674: push esi
  loc_00453675: mov [esi+0000003Ch], bx
  loc_00453679: mov var_2C, FFFFFFFFh
  loc_00453680: call [edx+000006FCh]
  loc_00453686: mov edi, [00401020h] ; __vbaFreeVar
  loc_0045368C: lea ecx, var_28
  loc_0045368F: call edi
  loc_00453691: mov edx, [esi]
  loc_00453693: lea eax, var_28
  loc_00453696: lea ecx, var_2C
  loc_00453699: push eax
  loc_0045369A: push ecx
  loc_0045369B: push esi
  loc_0045369C: mov var_2C, ebx
  loc_0045369F: call [edx+000006F8h]
  loc_004536A5: lea ecx, var_28
  loc_004536A8: call edi
  loc_004536AA: mov var_4, ebx
  loc_004536AD: push 004536C8h
  loc_004536B2: jmp 004536C7h
  loc_004536B4: lea ecx, var_18
  loc_004536B7: call [004012B0h] ; __vbaFreeObj
  loc_004536BD: lea ecx, var_28
  loc_004536C0: call [00401020h] ; __vbaFreeVar
  loc_004536C6: ret
  loc_004536C7: ret
  loc_004536C8: mov eax, Me
  loc_004536CB: push eax
  loc_004536CC: mov edx, [eax]
  loc_004536CE: call [edx+00000008h]
  loc_004536D1: mov eax, var_4
  loc_004536D4: mov ecx, var_14
  loc_004536D7: pop edi
  loc_004536D8: pop esi
  loc_004536D9: mov fs:[00000000h], ecx
  loc_004536E0: pop ebx
  loc_004536E1: mov esp, ebp
  loc_004536E3: pop ebp
  loc_004536E4: retn 0004h
End Sub

Private Sub cmdEdit_Click() '455850
  loc_00455850: push ebp
  loc_00455851: mov ebp, esp
  loc_00455853: sub esp, 0000000Ch
  loc_00455856: push 00403B36h ; __vbaExceptHandler
  loc_0045585B: mov eax, fs:[00000000h]
  loc_00455861: push eax
  loc_00455862: mov fs:[00000000h], esp
  loc_00455869: sub esp, 0000004Ch
  loc_0045586C: push ebx
  loc_0045586D: push esi
  loc_0045586E: push edi
  loc_0045586F: mov var_C, esp
  loc_00455872: mov var_8, 00401450h
  loc_00455879: mov esi, Me
  loc_0045587C: mov eax, esi
  loc_0045587E: and eax, 00000001h
  loc_00455881: mov var_4, eax
  loc_00455884: and esi, FFFFFFFEh
  loc_00455887: push esi
  loc_00455888: mov Me, esi
  loc_0045588B: mov ecx, [esi]
  loc_0045588D: call [ecx+00000004h]
  loc_00455890: xor edi, edi
  loc_00455892: mov edx, 0041F258h ; "AThai"
  loc_00455897: mov ecx, 0061A0A0h
  loc_0045589C: mov var_18, edi
  loc_0045589F: mov var_1C, edi
  loc_004558A2: mov var_2C, edi
  loc_004558A5: mov var_3C, edi
  loc_004558A8: mov var_50, edi
  loc_004558AB: call [004011ECh] ; __vbaStrCopy
  loc_004558B1: cmp [0061A11Ch], edi
  loc_004558B7: jnz 004558C9h
  loc_004558B9: push 0061A11Ch
  loc_004558BE: push 004069CCh
  loc_004558C3: call [004011DCh] ; __vbaNew2
  loc_004558C9: sub esp, 00000010h
  loc_004558CC: mov ecx, 0000000Ah
  loc_004558D1: mov ebx, esp
  loc_004558D3: mov eax, 80020004h
  loc_004558D8: sub esp, 00000010h
  loc_004558DB: mov edi, [0061A11Ch]
  loc_004558E1: mov [ebx], ecx
  loc_004558E3: mov ecx, var_48
  loc_004558E6: mov var_3C, 00000002h
  loc_004558ED: mov var_34, 00000001h
  loc_004558F4: mov [ebx+00000004h], ecx
  loc_004558F7: mov ecx, esp
  loc_004558F9: mov edx, [edi]
  loc_004558FB: push edi
  loc_004558FC: mov [ebx+00000008h], eax
  loc_004558FF: mov eax, var_40
  loc_00455902: mov [ebx+0000000Ch], eax
  loc_00455905: mov eax, var_3C
  loc_00455908: mov [ecx], eax
  loc_0045590A: mov eax, var_38
  loc_0045590D: mov [ecx+00000004h], eax
  loc_00455910: mov eax, var_34
  loc_00455913: mov [ecx+00000008h], eax
  loc_00455916: mov eax, var_30
  loc_00455919: mov [ecx+0000000Ch], eax
  loc_0045591C: call [edx+000002B0h]
  loc_00455922: test eax, eax
  loc_00455924: fnclex
  loc_00455926: jge 0045593Ah
  loc_00455928: push 000002B0h
  loc_0045592D: push 0041E6D0h
  loc_00455932: push edi
  loc_00455933: push eax
  loc_00455934: call [00401074h] ; __vbaHresultCheckObj
  loc_0045593A: mov ecx, [0061A0B8h]
  loc_00455940: push ecx
  loc_00455941: push 0041E5D4h
  loc_00455946: call [0040110Ch] ; __vbaStrCmp
  loc_0045594C: neg eax
  loc_0045594E: sbb eax, eax
  loc_00455950: mov ebx, [004010D4h] ; rtcTrimVar
  loc_00455956: neg eax
  loc_00455958: neg eax
  loc_0045595A: mov var_34, ax
  loc_0045595E: lea edx, var_3C
  loc_00455961: lea eax, var_2C
  loc_00455964: push edx
  loc_00455965: push eax
  loc_00455966: mov var_3C, 0000000Bh
  loc_0045596D: call ebx
  loc_0045596F: lea ecx, var_2C
  loc_00455972: push ecx
  loc_00455973: call [004010E0h] ; __vbaBoolVarNull
  loc_00455979: mov di, ax
  loc_0045597C: lea edx, var_2C
  loc_0045597F: lea eax, var_3C
  loc_00455982: push edx
  loc_00455983: push eax
  loc_00455984: push 00000002h
  loc_00455986: call [00401038h] ; __vbaFreeVarList
  loc_0045598C: add esp, 0000000Ch
  loc_0045598F: test di, di
  loc_00455992: jz 00455B1Fh
  loc_00455998: mov ecx, [esi]
  loc_0045599A: push esi
  loc_0045599B: call [ecx+00000734h]
  loc_004559A1: mov edx, [esi]
  loc_004559A3: push esi
  loc_004559A4: call [edx+00000324h]
  loc_004559AA: push eax
  loc_004559AB: lea eax, var_1C
  loc_004559AE: push eax
  loc_004559AF: call [004010A0h] ; __vbaObjSet
  loc_004559B5: lea ecx, var_3C
  loc_004559B8: lea edx, var_2C
  loc_004559BB: push ecx
  loc_004559BC: push edx
  loc_004559BD: mov edi, eax
  loc_004559BF: mov var_34, 0061A0B8h
  loc_004559C6: mov var_3C, 00004008h
  loc_004559CD: call ebx
  loc_004559CF: mov ebx, [edi]
  loc_004559D1: lea eax, var_2C
  loc_004559D4: lea ecx, var_18
  loc_004559D7: push eax
  loc_004559D8: push ecx
  loc_004559D9: call [004011B0h] ; __vbaStrVarVal
  loc_004559DF: push eax
  loc_004559E0: push edi
  loc_004559E1: call [ebx+000000A4h]
  loc_004559E7: test eax, eax
  loc_004559E9: fnclex
  loc_004559EB: jge 004559FFh
  loc_004559ED: push 000000A4h
  loc_004559F2: push 0041E5E8h
  loc_004559F7: push edi
  loc_004559F8: push eax
  loc_004559F9: call [00401074h] ; __vbaHresultCheckObj
  loc_004559FF: lea ecx, var_18
  loc_00455A02: call [004012ACh] ; __vbaFreeStr
  loc_00455A08: lea ecx, var_1C
  loc_00455A0B: call [004012B0h] ; __vbaFreeObj
  loc_00455A11: mov ebx, [00401020h] ; __vbaFreeVar
  loc_00455A17: lea ecx, var_2C
  loc_00455A1A: call ebx
  loc_00455A1C: mov edx, [esi]
  loc_00455A1E: push esi
  loc_00455A1F: call [edx+0000070Ch]
  loc_00455A25: mov eax, [esi]
  loc_00455A27: push esi
  loc_00455A28: call [eax+0000032Ch]
  loc_00455A2E: lea ecx, var_1C
  loc_00455A31: push eax
  loc_00455A32: push ecx
  loc_00455A33: call [004010A0h] ; __vbaObjSet
  loc_00455A39: mov edi, eax
  loc_00455A3B: push 0041F358h ; "&Edit"
  loc_00455A40: push edi
  loc_00455A41: mov edx, [edi]
  loc_00455A43: call [edx+00000054h]
  loc_00455A46: test eax, eax
  loc_00455A48: fnclex
  loc_00455A4A: jge 00455A5Bh
  loc_00455A4C: push 00000054h
  loc_00455A4E: push 0041EAACh
  loc_00455A53: push edi
  loc_00455A54: push eax
  loc_00455A55: call [00401074h] ; __vbaHresultCheckObj
  loc_00455A5B: lea ecx, var_1C
  loc_00455A5E: call [004012B0h] ; __vbaFreeObj
  loc_00455A64: mov eax, [esi]
  loc_00455A66: lea ecx, var_2C
  loc_00455A69: lea edx, var_50
  loc_00455A6C: push ecx
  loc_00455A6D: push edx
  loc_00455A6E: push esi
  loc_00455A6F: mov var_50, 00000000h
  loc_00455A76: call [eax+000006FCh]
  loc_00455A7C: lea ecx, var_2C
  loc_00455A7F: call ebx
  loc_00455A81: or eax, FFFFFFFFh
  loc_00455A84: lea ecx, var_2C
  loc_00455A87: lea edx, var_50
  loc_00455A8A: mov [esi+0000003Ch], ax
  loc_00455A8E: mov var_50, eax
  loc_00455A91: mov eax, [esi]
  loc_00455A93: push ecx
  loc_00455A94: push edx
  loc_00455A95: push esi
  loc_00455A96: call [eax+000006F8h]
  loc_00455A9C: lea ecx, var_2C
  loc_00455A9F: call ebx
  loc_00455AA1: mov eax, [esi]
  loc_00455AA3: push esi
  loc_00455AA4: call [eax+00000324h]
  loc_00455AAA: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00455AB0: lea ecx, var_1C
  loc_00455AB3: push eax
  loc_00455AB4: push ecx
  loc_00455AB5: call ebx
  loc_00455AB7: mov edi, eax
  loc_00455AB9: push 00000000h
  loc_00455ABB: push edi
  loc_00455ABC: mov edx, [edi]
  loc_00455ABE: call [edx+0000008Ch]
  loc_00455AC4: test eax, eax
  loc_00455AC6: fnclex
  loc_00455AC8: jge 00455ADCh
  loc_00455ACA: push 0000008Ch
  loc_00455ACF: push 0041E5E8h
  loc_00455AD4: push edi
  loc_00455AD5: push eax
  loc_00455AD6: call [00401074h] ; __vbaHresultCheckObj
  loc_00455ADC: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00455AE2: lea ecx, var_1C
  loc_00455AE5: call edi
  loc_00455AE7: mov eax, [esi]
  loc_00455AE9: push esi
  loc_00455AEA: call [eax+00000308h]
  loc_00455AF0: lea ecx, var_1C
  loc_00455AF3: push eax
  loc_00455AF4: push ecx
  loc_00455AF5: call ebx
  loc_00455AF7: mov esi, eax
  loc_00455AF9: push esi
  loc_00455AFA: mov edx, [esi]
  loc_00455AFC: call [edx+00000204h]
  loc_00455B02: test eax, eax
  loc_00455B04: fnclex
  loc_00455B06: jge 00455B1Ah
  loc_00455B08: push 00000204h
  loc_00455B0D: push 0041E5E8h
  loc_00455B12: push esi
  loc_00455B13: push eax
  loc_00455B14: call [00401074h] ; __vbaHresultCheckObj
  loc_00455B1A: lea ecx, var_1C
  loc_00455B1D: call edi
  loc_00455B1F: mov var_4, 00000000h
  loc_00455B26: push 00455B4Ah
  loc_00455B2B: jmp 00455B49h
  loc_00455B2D: lea ecx, var_18
  loc_00455B30: call [004012ACh] ; __vbaFreeStr
  loc_00455B36: lea ecx, var_1C
  loc_00455B39: call [004012B0h] ; __vbaFreeObj
  loc_00455B3F: lea ecx, var_2C
  loc_00455B42: call [00401020h] ; __vbaFreeVar
  loc_00455B48: ret
  loc_00455B49: ret
  loc_00455B4A: mov eax, Me
  loc_00455B4D: push eax
  loc_00455B4E: mov ecx, [eax]
  loc_00455B50: call [ecx+00000008h]
  loc_00455B53: mov eax, var_4
  loc_00455B56: mov ecx, var_14
  loc_00455B59: pop edi
  loc_00455B5A: pop esi
  loc_00455B5B: mov fs:[00000000h], ecx
  loc_00455B62: pop ebx
  loc_00455B63: mov esp, ebp
  loc_00455B65: pop ebp
  loc_00455B66: retn 0004h
End Sub

Private Sub cmdSearch_Click() '457030
  loc_00457030: push ebp
  loc_00457031: mov ebp, esp
  loc_00457033: sub esp, 0000000Ch
  loc_00457036: push 00403B36h ; __vbaExceptHandler
  loc_0045703B: mov eax, fs:[00000000h]
  loc_00457041: push eax
  loc_00457042: mov fs:[00000000h], esp
  loc_00457049: sub esp, 00000048h
  loc_0045704C: push ebx
  loc_0045704D: push esi
  loc_0045704E: push edi
  loc_0045704F: mov var_C, esp
  loc_00457052: mov var_8, 004014B0h
  loc_00457059: mov edi, Me
  loc_0045705C: mov eax, edi
  loc_0045705E: and eax, 00000001h
  loc_00457061: mov var_4, eax
  loc_00457064: and edi, FFFFFFFEh
  loc_00457067: push edi
  loc_00457068: mov Me, edi
  loc_0045706B: mov ecx, [edi]
  loc_0045706D: call [ecx+00000004h]
  loc_00457070: xor esi, esi
  loc_00457072: mov edx, 0041F258h ; "AThai"
  loc_00457077: mov ecx, 0061A0A0h
  loc_0045707C: mov var_18, esi
  loc_0045707F: mov var_1C, esi
  loc_00457082: mov var_2C, esi
  loc_00457085: mov var_3C, esi
  loc_00457088: call [004011ECh] ; __vbaStrCopy
  loc_0045708E: cmp [0061A11Ch], esi
  loc_00457094: jnz 004570A6h
  loc_00457096: push 0061A11Ch
  loc_0045709B: push 004069CCh
  loc_004570A0: call [004011DCh] ; __vbaNew2
  loc_004570A6: sub esp, 00000010h
  loc_004570A9: mov ecx, 0000000Ah
  loc_004570AE: mov ebx, esp
  loc_004570B0: mov eax, 80020004h
  loc_004570B5: sub esp, 00000010h
  loc_004570B8: mov esi, [0061A11Ch]
  loc_004570BE: mov [ebx], ecx
  loc_004570C0: mov ecx, var_48
  loc_004570C3: mov var_3C, 00000002h
  loc_004570CA: mov var_34, 00000001h
  loc_004570D1: mov [ebx+00000004h], ecx
  loc_004570D4: mov ecx, esp
  loc_004570D6: mov edx, [esi]
  loc_004570D8: push esi
  loc_004570D9: mov [ebx+00000008h], eax
  loc_004570DC: mov eax, var_40
  loc_004570DF: mov [ebx+0000000Ch], eax
  loc_004570E2: mov eax, var_3C
  loc_004570E5: mov [ecx], eax
  loc_004570E7: mov eax, var_38
  loc_004570EA: mov [ecx+00000004h], eax
  loc_004570ED: mov eax, var_34
  loc_004570F0: mov [ecx+00000008h], eax
  loc_004570F3: mov eax, var_30
  loc_004570F6: mov [ecx+0000000Ch], eax
  loc_004570F9: call [edx+000002B0h]
  loc_004570FF: test eax, eax
  loc_00457101: fnclex
  loc_00457103: jge 00457117h
  loc_00457105: push 000002B0h
  loc_0045710A: push 0041E6D0h
  loc_0045710F: push esi
  loc_00457110: push eax
  loc_00457111: call [00401074h] ; __vbaHresultCheckObj
  loc_00457117: mov ecx, [0061A0B8h]
  loc_0045711D: push ecx
  loc_0045711E: push 0041E5D4h
  loc_00457123: call [0040110Ch] ; __vbaStrCmp
  loc_00457129: neg eax
  loc_0045712B: sbb eax, eax
  loc_0045712D: mov ebx, [004010D4h] ; rtcTrimVar
  loc_00457133: neg eax
  loc_00457135: neg eax
  loc_00457137: mov var_34, ax
  loc_0045713B: lea edx, var_3C
  loc_0045713E: lea eax, var_2C
  loc_00457141: push edx
  loc_00457142: push eax
  loc_00457143: mov var_3C, 0000000Bh
  loc_0045714A: call ebx
  loc_0045714C: lea ecx, var_2C
  loc_0045714F: push ecx
  loc_00457150: call [004010E0h] ; __vbaBoolVarNull
  loc_00457156: mov si, ax
  loc_00457159: lea edx, var_2C
  loc_0045715C: lea eax, var_3C
  loc_0045715F: push edx
  loc_00457160: push eax
  loc_00457161: push 00000002h
  loc_00457163: call [00401038h] ; __vbaFreeVarList
  loc_00457169: add esp, 0000000Ch
  loc_0045716C: test si, si
  loc_0045716F: jz 00457200h
  loc_00457175: mov ecx, [edi]
  loc_00457177: push edi
  loc_00457178: call [ecx+00000734h]
  loc_0045717E: mov edx, [edi]
  loc_00457180: push edi
  loc_00457181: call [edx+00000324h]
  loc_00457187: push eax
  loc_00457188: lea eax, var_1C
  loc_0045718B: push eax
  loc_0045718C: call [004010A0h] ; __vbaObjSet
  loc_00457192: lea ecx, var_3C
  loc_00457195: lea edx, var_2C
  loc_00457198: push ecx
  loc_00457199: push edx
  loc_0045719A: mov esi, eax
  loc_0045719C: mov var_34, 0061A0B8h
  loc_004571A3: mov var_3C, 00004008h
  loc_004571AA: call ebx
  loc_004571AC: mov ebx, [esi]
  loc_004571AE: lea eax, var_2C
  loc_004571B1: lea ecx, var_18
  loc_004571B4: push eax
  loc_004571B5: push ecx
  loc_004571B6: call [004011B0h] ; __vbaStrVarVal
  loc_004571BC: push eax
  loc_004571BD: push esi
  loc_004571BE: call [ebx+000000A4h]
  loc_004571C4: test eax, eax
  loc_004571C6: fnclex
  loc_004571C8: jge 004571DCh
  loc_004571CA: push 000000A4h
  loc_004571CF: push 0041E5E8h
  loc_004571D4: push esi
  loc_004571D5: push eax
  loc_004571D6: call [00401074h] ; __vbaHresultCheckObj
  loc_004571DC: lea ecx, var_18
  loc_004571DF: call [004012ACh] ; __vbaFreeStr
  loc_004571E5: lea ecx, var_1C
  loc_004571E8: call [004012B0h] ; __vbaFreeObj
  loc_004571EE: lea ecx, var_2C
  loc_004571F1: call [00401020h] ; __vbaFreeVar
  loc_004571F7: mov edx, [edi]
  loc_004571F9: push edi
  loc_004571FA: call [edx+0000070Ch]
  loc_00457200: mov var_4, 00000000h
  loc_00457207: push 0045722Bh
  loc_0045720C: jmp 0045722Ah
  loc_0045720E: lea ecx, var_18
  loc_00457211: call [004012ACh] ; __vbaFreeStr
  loc_00457217: lea ecx, var_1C
  loc_0045721A: call [004012B0h] ; __vbaFreeObj
  loc_00457220: lea ecx, var_2C
  loc_00457223: call [00401020h] ; __vbaFreeVar
  loc_00457229: ret
  loc_0045722A: ret
  loc_0045722B: mov eax, Me
  loc_0045722E: push eax
  loc_0045722F: mov ecx, [eax]
  loc_00457231: call [ecx+00000008h]
  loc_00457234: mov eax, var_4
  loc_00457237: mov ecx, var_14
  loc_0045723A: pop edi
  loc_0045723B: pop esi
  loc_0045723C: mov fs:[00000000h], ecx
  loc_00457243: pop ebx
  loc_00457244: mov esp, ebp
  loc_00457246: pop ebp
  loc_00457247: retn 0004h
End Sub

Private Sub cmdDelete_Click() '4543A0
  loc_004543A0: push ebp
  loc_004543A1: mov ebp, esp
  loc_004543A3: sub esp, 0000000Ch
  loc_004543A6: push 00403B36h ; __vbaExceptHandler
  loc_004543AB: mov eax, fs:[00000000h]
  loc_004543B1: push eax
  loc_004543B2: mov fs:[00000000h], esp
  loc_004543B9: sub esp, 000000C4h
  loc_004543BF: push ebx
  loc_004543C0: push esi
  loc_004543C1: push edi
  loc_004543C2: mov var_C, esp
  loc_004543C5: mov var_8, 00401430h
  loc_004543CC: mov edi, Me
  loc_004543CF: mov eax, edi
  loc_004543D1: and eax, 00000001h
  loc_004543D4: mov var_4, eax
  loc_004543D7: and edi, FFFFFFFEh
  loc_004543DA: push edi
  loc_004543DB: mov Me, edi
  loc_004543DE: mov ecx, [edi]
  loc_004543E0: call [ecx+00000004h]
  loc_004543E3: mov edx, [edi]
  loc_004543E5: xor esi, esi
  loc_004543E7: push edi
  loc_004543E8: mov var_18, esi
  loc_004543EB: mov var_1C, esi
  loc_004543EE: mov var_20, esi
  loc_004543F1: mov var_24, esi
  loc_004543F4: mov var_28, esi
  loc_004543F7: mov var_38, esi
  loc_004543FA: mov var_48, esi
  loc_004543FD: mov var_58, esi
  loc_00454400: mov var_68, esi
  loc_00454403: mov var_78, esi
  loc_00454406: mov var_88, esi
  loc_0045440C: mov var_98, esi
  loc_00454412: call [edx+00000734h]
  loc_00454418: mov edx, 0041F258h ; "AThai"
  loc_0045441D: mov ecx, 0061A0A0h
  loc_00454422: call [004011ECh] ; __vbaStrCopy
  loc_00454428: cmp [0061A11Ch], esi
  loc_0045442E: jnz 00454440h
  loc_00454430: push 0061A11Ch
  loc_00454435: push 004069CCh
  loc_0045443A: call [004011DCh] ; __vbaNew2
  loc_00454440: sub esp, 00000010h
  loc_00454443: mov ecx, 0000000Ah
  loc_00454448: mov ebx, esp
  loc_0045444A: mov var_88, ecx
  loc_00454450: mov eax, 80020004h
  loc_00454455: sub esp, 00000010h
  loc_00454458: mov [ebx], ecx
  loc_0045445A: mov ecx, var_84
  loc_00454460: mov var_80, eax
  loc_00454463: mov esi, [0061A11Ch]
  loc_00454469: mov [ebx+00000004h], ecx
  loc_0045446C: mov var_78, 00000002h
  loc_00454473: mov ecx, esp
  loc_00454475: mov var_70, 00000001h
  loc_0045447C: mov [ebx+00000008h], eax
  loc_0045447F: mov eax, var_7C
  loc_00454482: mov edx, [esi]
  loc_00454484: push esi
  loc_00454485: mov [ebx+0000000Ch], eax
  loc_00454488: mov eax, var_78
  loc_0045448B: mov [ecx], eax
  loc_0045448D: mov eax, var_74
  loc_00454490: mov [ecx+00000004h], eax
  loc_00454493: mov eax, var_70
  loc_00454496: mov [ecx+00000008h], eax
  loc_00454499: mov eax, var_6C
  loc_0045449C: mov [ecx+0000000Ch], eax
  loc_0045449F: call [edx+000002B0h]
  loc_004544A5: test eax, eax
  loc_004544A7: fnclex
  loc_004544A9: jge 004544BDh
  loc_004544AB: push 000002B0h
  loc_004544B0: push 0041E6D0h
  loc_004544B5: push esi
  loc_004544B6: push eax
  loc_004544B7: call [00401074h] ; __vbaHresultCheckObj
  loc_004544BD: mov ecx, [0061A0B8h]
  loc_004544C3: push ecx
  loc_004544C4: push 0041E5D4h
  loc_004544C9: call [0040110Ch] ; __vbaStrCmp
  loc_004544CF: neg eax
  loc_004544D1: sbb eax, eax
  loc_004544D3: lea edx, var_78
  loc_004544D6: neg eax
  loc_004544D8: neg eax
  loc_004544DA: mov var_70, ax
  loc_004544DE: lea eax, var_38
  loc_004544E1: push edx
  loc_004544E2: push eax
  loc_004544E3: mov var_78, 0000000Bh
  loc_004544EA: call [004010D4h] ; rtcTrimVar
  loc_004544F0: lea ecx, var_38
  loc_004544F3: push ecx
  loc_004544F4: call [004010E0h] ; __vbaBoolVarNull
  loc_004544FA: mov si, ax
  loc_004544FD: lea edx, var_38
  loc_00454500: lea eax, var_78
  loc_00454503: push edx
  loc_00454504: push eax
  loc_00454505: push 00000002h
  loc_00454507: call [00401038h] ; __vbaFreeVarList
  loc_0045450D: add esp, 0000000Ch
  loc_00454510: test si, si
  loc_00454513: jz 00454AE2h
  loc_00454519: lea ebx, var_20
  loc_0045451C: mov ecx, 0000000Ah
  loc_00454521: push ebx
  loc_00454522: mov var_98, ecx
  loc_00454528: sub esp, 00000010h
  loc_0045452B: mov var_88, ecx
  loc_00454531: mov ebx, esp
  loc_00454533: mov eax, 80020004h
  loc_00454538: mov var_90, eax
  loc_0045453E: mov edx, eax
  loc_00454540: mov [ebx], ecx
  loc_00454542: mov ecx, var_94
  loc_00454548: sub esp, 00000010h
  loc_0045454B: mov var_80, edx
  loc_0045454E: mov [ebx+00000004h], ecx
  loc_00454551: mov ecx, esp
  loc_00454553: sub esp, 00000010h
  loc_00454556: mov var_78, 00000003h
  loc_0045455D: mov [ebx+00000008h], eax
  loc_00454560: mov eax, var_8C
  loc_00454566: mov esi, [0061A13Ch]
  loc_0045456C: mov var_70, 00000002h
  loc_00454573: mov [ebx+0000000Ch], eax
  loc_00454576: mov eax, var_88
  loc_0045457C: mov [ecx], eax
  loc_0045457E: mov eax, var_84
  loc_00454584: mov esi, [esi]
  loc_00454586: mov [ecx+00000004h], eax
  loc_00454589: mov eax, esp
  loc_0045458B: push 0041F268h ; "AgentThai"
  loc_00454590: mov [ecx+00000008h], edx
  loc_00454593: mov edx, var_7C
  loc_00454596: mov [ecx+0000000Ch], edx
  loc_00454599: mov ecx, var_78
  loc_0045459C: mov edx, var_74
  loc_0045459F: mov [eax], ecx
  loc_004545A1: mov ecx, var_70
  loc_004545A4: mov [eax+00000004h], edx
  loc_004545A7: mov edx, var_6C
  loc_004545AA: mov [eax+00000008h], ecx
  loc_004545AD: mov [eax+0000000Ch], edx
  loc_004545B0: mov eax, [0061A13Ch]
  loc_004545B5: push eax
  loc_004545B6: call [esi+000000BCh]
  loc_004545BC: test eax, eax
  loc_004545BE: fnclex
  loc_004545C0: jge 004545DAh
  loc_004545C2: mov ecx, [0061A13Ch]
  loc_004545C8: push 000000BCh
  loc_004545CD: push 0041E928h
  loc_004545D2: push ecx
  loc_004545D3: push eax
  loc_004545D4: call [00401074h] ; __vbaHresultCheckObj
  loc_004545DA: mov edx, var_20
  loc_004545DD: lea esi, [edi+00000034h]
  loc_004545E0: push edx
  loc_004545E1: push esi
  loc_004545E2: call [004010B8h] ; __vbaObjSetAddref
  loc_004545E8: lea ecx, var_20
  loc_004545EB: call [004012B0h] ; __vbaFreeObj
  loc_004545F1: lea eax, var_78
  loc_004545F4: lea ecx, var_38
  loc_004545F7: mov ebx, 00000008h
  loc_004545FC: push eax
  loc_004545FD: push ecx
  loc_004545FE: mov var_80, 0041F280h ; "AgentName= '"
  loc_00454605: mov var_88, ebx
  loc_0045460B: mov var_70, 0061A0B8h
  loc_00454612: mov var_78, 00004008h
  loc_00454619: call [004010D4h] ; rtcTrimVar
  loc_0045461F: mov edx, [esi]
  loc_00454621: mov var_90, 0041E890h ; "'"
  loc_0045462B: mov var_98, ebx
  loc_00454631: lea eax, var_88
  loc_00454637: mov ebx, [edx]
  loc_00454639: lea ecx, var_38
  loc_0045463C: push eax
  loc_0045463D: lea edx, var_48
  loc_00454640: push ecx
  loc_00454641: push edx
  loc_00454642: call [004011B4h] ; __vbaVarCat
  loc_00454648: push eax
  loc_00454649: lea eax, var_98
  loc_0045464F: lea ecx, var_58
  loc_00454652: push eax
  loc_00454653: push ecx
  loc_00454654: call [004011B4h] ; __vbaVarCat
  loc_0045465A: lea edx, var_1C
  loc_0045465D: push eax
  loc_0045465E: push edx
  loc_0045465F: call [004011B0h] ; __vbaStrVarVal
  loc_00454665: push eax
  loc_00454666: mov eax, [esi]
  loc_00454668: push eax
  loc_00454669: call [ebx+000000D4h]
  loc_0045466F: test eax, eax
  loc_00454671: fnclex
  loc_00454673: jge 00454689h
  loc_00454675: mov ecx, [esi]
  loc_00454677: push 000000D4h
  loc_0045467C: push 0041E938h
  loc_00454681: push ecx
  loc_00454682: push eax
  loc_00454683: call [00401074h] ; __vbaHresultCheckObj
  loc_00454689: lea ecx, var_1C
  loc_0045468C: call [004012ACh] ; __vbaFreeStr
  loc_00454692: lea edx, var_58
  loc_00454695: lea eax, var_48
  loc_00454698: push edx
  loc_00454699: lea ecx, var_38
  loc_0045469C: push eax
  loc_0045469D: push ecx
  loc_0045469E: push 00000003h
  loc_004546A0: call [00401038h] ; __vbaFreeVarList
  loc_004546A6: mov edx, [edi]
  loc_004546A8: add esp, 00000010h
  loc_004546AB: push edi
  loc_004546AC: call [edx+00000324h]
  loc_004546B2: push eax
  loc_004546B3: lea eax, var_20
  loc_004546B6: push eax
  loc_004546B7: call [004010A0h] ; __vbaObjSet
  loc_004546BD: lea ecx, var_78
  loc_004546C0: lea edx, var_38
  loc_004546C3: mov ebx, eax
  loc_004546C5: push ecx
  loc_004546C6: push edx
  loc_004546C7: mov var_AC, ebx
  loc_004546CD: mov var_70, 0061A0B8h
  loc_004546D4: mov var_78, 00004008h
  loc_004546DB: call [004010D4h] ; rtcTrimVar
  loc_004546E1: mov ebx, [ebx]
  loc_004546E3: lea eax, var_38
  loc_004546E6: lea ecx, var_1C
  loc_004546E9: push eax
  loc_004546EA: push ecx
  loc_004546EB: call [004011B0h] ; __vbaStrVarVal
  loc_004546F1: mov edx, ebx
  loc_004546F3: mov ebx, var_AC
  loc_004546F9: push eax
  loc_004546FA: push ebx
  loc_004546FB: call [edx+000000A4h]
  loc_00454701: test eax, eax
  loc_00454703: fnclex
  loc_00454705: jge 00454719h
  loc_00454707: push 000000A4h
  loc_0045470C: push 0041E5E8h
  loc_00454711: push ebx
  loc_00454712: push eax
  loc_00454713: call [00401074h] ; __vbaHresultCheckObj
  loc_00454719: lea ecx, var_1C
  loc_0045471C: call [004012ACh] ; __vbaFreeStr
  loc_00454722: lea ecx, var_20
  loc_00454725: call [004012B0h] ; __vbaFreeObj
  loc_0045472B: lea ecx, var_38
  loc_0045472E: call [00401020h] ; __vbaFreeVar
  loc_00454734: mov eax, [edi]
  loc_00454736: push edi
  loc_00454737: call [eax+00000320h]
  loc_0045473D: lea ecx, var_28
  loc_00454740: push eax
  loc_00454741: push ecx
  loc_00454742: call [004010A0h] ; __vbaObjSet
  loc_00454748: mov var_B8, eax
  loc_0045474E: mov eax, [esi]
  loc_00454750: lea ecx, var_20
  loc_00454753: mov edx, [eax]
  loc_00454755: push ecx
  loc_00454756: push eax
  loc_00454757: call [edx+000000B4h]
  loc_0045475D: test eax, eax
  loc_0045475F: fnclex
  loc_00454761: jge 00454777h
  loc_00454763: mov edx, [esi]
  loc_00454765: push 000000B4h
  loc_0045476A: push 0041E938h
  loc_0045476F: push edx
  loc_00454770: push eax
  loc_00454771: call [00401074h] ; __vbaHresultCheckObj
  loc_00454777: lea ebx, var_24
  loc_0045477A: mov eax, var_20
  loc_0045477D: push ebx
  loc_0045477E: mov ecx, 00000008h
  loc_00454783: sub esp, 00000010h
  loc_00454786: mov var_78, ecx
  loc_00454789: mov ebx, esp
  loc_0045478B: mov var_70, 0041F1E8h ; "Address"
  loc_00454792: mov edx, [eax]
  loc_00454794: push eax
  loc_00454795: mov [ebx], ecx
  loc_00454797: mov ecx, var_74
  loc_0045479A: mov var_B0, eax
  loc_004547A0: mov [ebx+00000004h], ecx
  loc_004547A3: mov ecx, var_70
  loc_004547A6: mov [ebx+00000008h], ecx
  loc_004547A9: mov ecx, var_6C
  loc_004547AC: mov [ebx+0000000Ch], ecx
  loc_004547AF: call [edx+00000030h]
  loc_004547B2: test eax, eax
  loc_004547B4: fnclex
  loc_004547B6: jge 004547CDh
  loc_004547B8: mov edx, var_B0
  loc_004547BE: push 00000030h
  loc_004547C0: push 0041EA14h ; "S"
  loc_004547C5: push edx
  loc_004547C6: push eax
  loc_004547C7: call [00401074h] ; __vbaHresultCheckObj
  loc_004547CD: mov eax, var_24
  loc_004547D0: lea ecx, var_48
  loc_004547D3: mov var_30, eax
  loc_004547D6: lea eax, var_38
  loc_004547D9: push eax
  loc_004547DA: push ecx
  loc_004547DB: mov var_24, 00000000h
  loc_004547E2: mov var_38, 00000009h
  loc_004547E9: call [004010D4h] ; rtcTrimVar
  loc_004547EF: mov edx, var_B8
  loc_004547F5: lea eax, var_48
  loc_004547F8: lea ecx, var_1C
  loc_004547FB: push eax
  loc_004547FC: mov ebx, [edx]
  loc_004547FE: push ecx
  loc_004547FF: call [004011B0h] ; __vbaStrVarVal
  loc_00454805: mov edx, ebx
  loc_00454807: mov ebx, var_B8
  loc_0045480D: push eax
  loc_0045480E: push ebx
  loc_0045480F: call [edx+000000A4h]
  loc_00454815: test eax, eax
  loc_00454817: fnclex
  loc_00454819: jge 0045482Dh
  loc_0045481B: push 000000A4h
  loc_00454820: push 0041E5E8h
  loc_00454825: push ebx
  loc_00454826: push eax
  loc_00454827: call [00401074h] ; __vbaHresultCheckObj
  loc_0045482D: lea ecx, var_1C
  loc_00454830: call [004012ACh] ; __vbaFreeStr
  loc_00454836: lea eax, var_28
  loc_00454839: lea ecx, var_20
  loc_0045483C: push eax
  loc_0045483D: push ecx
  loc_0045483E: push 00000002h
  loc_00454840: call [00401040h] ; __vbaFreeObjList
  loc_00454846: lea edx, var_48
  loc_00454849: lea eax, var_38
  loc_0045484C: push edx
  loc_0045484D: push eax
  loc_0045484E: push 00000002h
  loc_00454850: call [00401038h] ; __vbaFreeVarList
  loc_00454856: mov ecx, [edi]
  loc_00454858: add esp, 00000018h
  loc_0045485B: push edi
  loc_0045485C: call [ecx+00000308h]
  loc_00454862: lea edx, var_28
  loc_00454865: push eax
  loc_00454866: push edx
  loc_00454867: call [004010A0h] ; __vbaObjSet
  loc_0045486D: mov var_B8, eax
  loc_00454873: mov eax, [esi]
  loc_00454875: lea edx, var_20
  loc_00454878: mov ecx, [eax]
  loc_0045487A: push edx
  loc_0045487B: push eax
  loc_0045487C: call [ecx+000000B4h]
  loc_00454882: test eax, eax
  loc_00454884: fnclex
  loc_00454886: jge 0045489Ch
  loc_00454888: mov ecx, [esi]
  loc_0045488A: push 000000B4h
  loc_0045488F: push 0041E938h
  loc_00454894: push ecx
  loc_00454895: push eax
  loc_00454896: call [00401074h] ; __vbaHresultCheckObj
  loc_0045489C: lea ebx, var_24
  loc_0045489F: mov eax, var_20
  loc_004548A2: push ebx
  loc_004548A3: mov ecx, 00000008h
  loc_004548A8: sub esp, 00000010h
  loc_004548AB: mov var_78, ecx
  loc_004548AE: mov ebx, esp
  loc_004548B0: mov var_70, 0041F1FCh ; "Phone"
  loc_004548B7: mov edx, [eax]
  loc_004548B9: push eax
  loc_004548BA: mov [ebx], ecx
  loc_004548BC: mov ecx, var_74
  loc_004548BF: mov var_B0, eax
  loc_004548C5: mov [ebx+00000004h], ecx
  loc_004548C8: mov ecx, var_70
  loc_004548CB: mov [ebx+00000008h], ecx
  loc_004548CE: mov ecx, var_6C
  loc_004548D1: mov [ebx+0000000Ch], ecx
  loc_004548D4: call [edx+00000030h]
  loc_004548D7: test eax, eax
  loc_004548D9: fnclex
  loc_004548DB: jge 004548F2h
  loc_004548DD: mov edx, var_B0
  loc_004548E3: push 00000030h
  loc_004548E5: push 0041EA14h ; "S"
  loc_004548EA: push edx
  loc_004548EB: push eax
  loc_004548EC: call [00401074h] ; __vbaHresultCheckObj
  loc_004548F2: mov eax, var_24
  loc_004548F5: lea ecx, var_48
  loc_004548F8: mov var_30, eax
  loc_004548FB: lea eax, var_38
  loc_004548FE: push eax
  loc_004548FF: push ecx
  loc_00454900: mov var_24, 00000000h
  loc_00454907: mov var_38, 00000009h
  loc_0045490E: call [004010D4h] ; rtcTrimVar
  loc_00454914: mov edx, var_B8
  loc_0045491A: lea eax, var_48
  loc_0045491D: lea ecx, var_1C
  loc_00454920: push eax
  loc_00454921: mov ebx, [edx]
  loc_00454923: push ecx
  loc_00454924: call [004011B0h] ; __vbaStrVarVal
  loc_0045492A: mov edx, ebx
  loc_0045492C: mov ebx, var_B8
  loc_00454932: push eax
  loc_00454933: push ebx
  loc_00454934: call [edx+000000A4h]
  loc_0045493A: test eax, eax
  loc_0045493C: fnclex
  loc_0045493E: jge 00454952h
  loc_00454940: push 000000A4h
  loc_00454945: push 0041E5E8h
  loc_0045494A: push ebx
  loc_0045494B: push eax
  loc_0045494C: call [00401074h] ; __vbaHresultCheckObj
  loc_00454952: lea ecx, var_1C
  loc_00454955: call [004012ACh] ; __vbaFreeStr
  loc_0045495B: lea eax, var_28
  loc_0045495E: lea ecx, var_20
  loc_00454961: push eax
  loc_00454962: push ecx
  loc_00454963: push 00000002h
  loc_00454965: call [00401040h] ; __vbaFreeObjList
  loc_0045496B: lea edx, var_48
  loc_0045496E: lea eax, var_38
  loc_00454971: push edx
  loc_00454972: push eax
  loc_00454973: push 00000002h
  loc_00454975: call [00401038h] ; __vbaFreeVarList
  loc_0045497B: mov ecx, 0000000Ah
  loc_00454980: mov eax, 80020004h
  loc_00454985: mov var_68, ecx
  loc_00454988: mov var_58, ecx
  loc_0045498B: mov var_48, ecx
  loc_0045498E: add esp, 00000018h
  loc_00454991: lea edx, var_78
  loc_00454994: lea ecx, var_38
  loc_00454997: mov var_60, eax
  loc_0045499A: mov var_50, eax
  loc_0045499D: mov var_40, eax
  loc_004549A0: mov var_70, 0041F2A0h ; "Are your sure to Delete"
  loc_004549A7: mov var_78, 00000008h
  loc_004549AE: call [00401240h] ; __vbaVarDup
  loc_004549B4: lea ecx, var_68
  loc_004549B7: lea edx, var_58
  loc_004549BA: push ecx
  loc_004549BB: lea eax, var_48
  loc_004549BE: push edx
  loc_004549BF: push eax
  loc_004549C0: lea ecx, var_38
  loc_004549C3: push 00000114h
  loc_004549C8: push ecx
  loc_004549C9: call [004010A4h] ; rtcMsgBox
  loc_004549CF: xor ebx, ebx
  loc_004549D1: cmp eax, 00000006h
  loc_004549D4: lea edx, var_68
  loc_004549D7: lea eax, var_58
  loc_004549DA: push edx
  loc_004549DB: lea ecx, var_48
  loc_004549DE: push eax
  loc_004549DF: lea edx, var_38
  loc_004549E2: push ecx
  loc_004549E3: push edx
  loc_004549E4: setz bl
  loc_004549E7: push 00000004h
  loc_004549E9: neg ebx
  loc_004549EB: call [00401038h] ; __vbaFreeVarList
  loc_004549F1: add esp, 00000014h
  loc_004549F4: test bx, bx
  loc_004549F7: jz 00454A94h
  loc_004549FD: mov eax, [esi]
  loc_004549FF: push eax
  loc_00454A00: mov ecx, [eax]
  loc_00454A02: call [ecx+000000CCh]
  loc_00454A08: test eax, eax
  loc_00454A0A: fnclex
  loc_00454A0C: jge 00454A22h
  loc_00454A0E: mov edx, [esi]
  loc_00454A10: push 000000CCh
  loc_00454A15: push 0041E938h
  loc_00454A1A: push edx
  loc_00454A1B: push eax
  loc_00454A1C: call [00401074h] ; __vbaHresultCheckObj
  loc_00454A22: mov ecx, 0000000Ah
  loc_00454A27: mov eax, 80020004h
  loc_00454A2C: mov var_68, ecx
  loc_00454A2F: mov var_58, ecx
  loc_00454A32: mov var_48, ecx
  loc_00454A35: lea edx, var_78
  loc_00454A38: lea ecx, var_38
  loc_00454A3B: mov var_60, eax
  loc_00454A3E: mov var_50, eax
  loc_00454A41: mov var_40, eax
  loc_00454A44: mov var_70, 0041F2D4h ; "Delete Successfully"
  loc_00454A4B: mov var_78, 00000008h
  loc_00454A52: call [00401240h] ; __vbaVarDup
  loc_00454A58: lea eax, var_68
  loc_00454A5B: lea ecx, var_58
  loc_00454A5E: push eax
  loc_00454A5F: lea edx, var_48
  loc_00454A62: push ecx
  loc_00454A63: push edx
  loc_00454A64: lea eax, var_38
  loc_00454A67: push 00000010h
  loc_00454A69: push eax
  loc_00454A6A: call [004010A4h] ; rtcMsgBox
  loc_00454A70: lea ecx, var_68
  loc_00454A73: lea edx, var_58
  loc_00454A76: push ecx
  loc_00454A77: lea eax, var_48
  loc_00454A7A: push edx
  loc_00454A7B: lea ecx, var_38
  loc_00454A7E: push eax
  loc_00454A7F: push ecx
  loc_00454A80: push 00000004h
  loc_00454A82: call [00401038h] ; __vbaFreeVarList
  loc_00454A88: mov edx, [edi]
  loc_00454A8A: add esp, 00000014h
  loc_00454A8D: push edi
  loc_00454A8E: call [edx+00000734h]
  loc_00454A94: mov eax, [esi]
  loc_00454A96: push eax
  loc_00454A97: mov ecx, [eax]
  loc_00454A99: call [ecx+000000C4h]
  loc_00454A9F: test eax, eax
  loc_00454AA1: fnclex
  loc_00454AA3: jge 00454AB9h
  loc_00454AA5: mov edx, [esi]
  loc_00454AA7: push 000000C4h
  loc_00454AAC: push 0041E938h
  loc_00454AB1: push edx
  loc_00454AB2: push eax
  loc_00454AB3: call [00401074h] ; __vbaHresultCheckObj
  loc_00454AB9: push 0041E938h
  loc_00454ABE: push 00000000h
  loc_00454AC0: call [00401274h] ; __vbaCastObj
  loc_00454AC6: push eax
  loc_00454AC7: lea eax, var_20
  loc_00454ACA: push eax
  loc_00454ACB: call [004010A0h] ; __vbaObjSet
  loc_00454AD1: push eax
  loc_00454AD2: push esi
  loc_00454AD3: call [004010B8h] ; __vbaObjSetAddref
  loc_00454AD9: lea ecx, var_20
  loc_00454ADC: call [004012B0h] ; __vbaFreeObj
  loc_00454AE2: mov var_4, 00000000h
  loc_00454AE9: push 00454B33h
  loc_00454AEE: jmp 00454B29h
  loc_00454AF0: lea ecx, var_1C
  loc_00454AF3: call [004012ACh] ; __vbaFreeStr
  loc_00454AF9: lea ecx, var_28
  loc_00454AFC: lea edx, var_24
  loc_00454AFF: push ecx
  loc_00454B00: lea eax, var_20
  loc_00454B03: push edx
  loc_00454B04: push eax
  loc_00454B05: push 00000003h
  loc_00454B07: call [00401040h] ; __vbaFreeObjList
  loc_00454B0D: lea ecx, var_68
  loc_00454B10: lea edx, var_58
  loc_00454B13: push ecx
  loc_00454B14: lea eax, var_48
  loc_00454B17: push edx
  loc_00454B18: lea ecx, var_38
  loc_00454B1B: push eax
  loc_00454B1C: push ecx
  loc_00454B1D: push 00000004h
  loc_00454B1F: call [00401038h] ; __vbaFreeVarList
  loc_00454B25: add esp, 00000024h
  loc_00454B28: ret
  loc_00454B29: lea ecx, var_18
  loc_00454B2C: call [004012ACh] ; __vbaFreeStr
  loc_00454B32: ret
  loc_00454B33: mov eax, Me
  loc_00454B36: push eax
  loc_00454B37: mov edx, [eax]
  loc_00454B39: call [edx+00000008h]
  loc_00454B3C: mov eax, var_4
  loc_00454B3F: mov ecx, var_14
  loc_00454B42: pop edi
  loc_00454B43: pop esi
  loc_00454B44: mov fs:[00000000h], ecx
  loc_00454B4B: pop ebx
  loc_00454B4C: mov esp, ebp
  loc_00454B4E: pop ebp
  loc_00454B4F: retn 0004h
End Sub

Private Sub txtName_KeyPress(KeyAscii As Integer) '4577C0
  loc_004577C0: push ebp
  loc_004577C1: mov ebp, esp
  loc_004577C3: sub esp, 0000000Ch
  loc_004577C6: push 00403B36h ; __vbaExceptHandler
  loc_004577CB: mov eax, fs:[00000000h]
  loc_004577D1: push eax
  loc_004577D2: mov fs:[00000000h], esp
  loc_004577D9: sub esp, 00000014h
  loc_004577DC: push ebx
  loc_004577DD: push esi
  loc_004577DE: push edi
  loc_004577DF: mov var_C, esp
  loc_004577E2: mov var_8, 00401500h
  loc_004577E9: mov esi, Me
  loc_004577EC: mov eax, esi
  loc_004577EE: and eax, 00000001h
  loc_004577F1: mov var_4, eax
  loc_004577F4: and esi, FFFFFFFEh
  loc_004577F7: push esi
  loc_004577F8: mov Me, esi
  loc_004577FB: mov ecx, [esi]
  loc_004577FD: call [ecx+00000004h]
  loc_00457800: mov edx, KeyAscii
  loc_00457803: xor edi, edi
  loc_00457805: mov var_18, edi
  loc_00457808: cmp [edx], 000Dh
  loc_0045780C: jnz 0045784Eh
  loc_0045780E: mov eax, [esi]
  loc_00457810: push esi
  loc_00457811: call [eax+00000308h]
  loc_00457817: lea ecx, var_18
  loc_0045781A: push eax
  loc_0045781B: push ecx
  loc_0045781C: call [004010A0h] ; __vbaObjSet
  loc_00457822: mov esi, eax
  loc_00457824: push esi
  loc_00457825: mov edx, [esi]
  loc_00457827: call [edx+00000204h]
  loc_0045782D: cmp eax, edi
  loc_0045782F: fnclex
  loc_00457831: jge 00457845h
  loc_00457833: push 00000204h
  loc_00457838: push 0041E5E8h
  loc_0045783D: push esi
  loc_0045783E: push eax
  loc_0045783F: call [00401074h] ; __vbaHresultCheckObj
  loc_00457845: lea ecx, var_18
  loc_00457848: call [004012B0h] ; __vbaFreeObj
  loc_0045784E: mov var_4, edi
  loc_00457851: push 00457863h
  loc_00457856: jmp 00457862h
  loc_00457858: lea ecx, var_18
  loc_0045785B: call [004012B0h] ; __vbaFreeObj
  loc_00457861: ret
  loc_00457862: ret
  loc_00457863: mov eax, Me
  loc_00457866: push eax
  loc_00457867: mov ecx, [eax]
  loc_00457869: call [ecx+00000008h]
  loc_0045786C: mov eax, var_4
  loc_0045786F: mov ecx, var_14
  loc_00457872: pop edi
  loc_00457873: pop esi
  loc_00457874: mov fs:[00000000h], ecx
  loc_0045787B: pop ebx
  loc_0045787C: mov esp, ebp
  loc_0045787E: pop ebp
  loc_0045787F: retn 0008h
End Sub

Private Sub txtName_LostFocus() '457890
  loc_00457890: push ebp
  loc_00457891: mov ebp, esp
  loc_00457893: sub esp, 0000000Ch
  loc_00457896: push 00403B36h ; __vbaExceptHandler
  loc_0045789B: mov eax, fs:[00000000h]
  loc_004578A1: push eax
  loc_004578A2: mov fs:[00000000h], esp
  loc_004578A9: sub esp, 000000C4h
  loc_004578AF: push ebx
  loc_004578B0: push esi
  loc_004578B1: push edi
  loc_004578B2: mov var_C, esp
  loc_004578B5: mov var_8, 00401510h
  loc_004578BC: mov esi, Me
  loc_004578BF: mov eax, esi
  loc_004578C1: and eax, 00000001h
  loc_004578C4: mov var_4, eax
  loc_004578C7: and esi, FFFFFFFEh
  loc_004578CA: push esi
  loc_004578CB: mov Me, esi
  loc_004578CE: mov ecx, [esi]
  loc_004578D0: call [ecx+00000004h]
  loc_004578D3: mov edx, [esi]
  loc_004578D5: xor edi, edi
  loc_004578D7: push esi
  loc_004578D8: mov var_18, edi
  loc_004578DB: mov var_1C, edi
  loc_004578DE: mov var_20, edi
  loc_004578E1: mov var_24, edi
  loc_004578E4: mov var_34, edi
  loc_004578E7: mov var_44, edi
  loc_004578EA: mov var_54, edi
  loc_004578ED: mov var_64, edi
  loc_004578F0: mov var_74, edi
  loc_004578F3: mov var_84, edi
  loc_004578F9: mov var_94, edi
  loc_004578FF: mov var_A4, edi
  loc_00457905: mov var_B4, edi
  loc_0045790B: mov var_B8, edi
  loc_00457911: mov var_BC, edi
  loc_00457917: call [edx+00000324h]
  loc_0045791D: push eax
  loc_0045791E: lea eax, var_20
  loc_00457921: push eax
  loc_00457922: call [004010A0h] ; __vbaObjSet
  loc_00457928: mov ebx, eax
  loc_0045792A: lea edx, var_18
  loc_0045792D: push edx
  loc_0045792E: push ebx
  loc_0045792F: mov ecx, [ebx]
  loc_00457931: call [ecx+000000A0h]
  loc_00457937: cmp eax, edi
  loc_00457939: fnclex
  loc_0045793B: jge 0045794Fh
  loc_0045793D: push 000000A0h
  loc_00457942: push 0041E5E8h
  loc_00457947: push ebx
  loc_00457948: push eax
  loc_00457949: call [00401074h] ; __vbaHresultCheckObj
  loc_0045794F: mov eax, var_18
  loc_00457952: lea ecx, var_44
  loc_00457955: mov var_2C, eax
  loc_00457958: lea eax, var_34
  loc_0045795B: mov ebx, 00000008h
  loc_00457960: push eax
  loc_00457961: push ecx
  loc_00457962: mov var_18, edi
  loc_00457965: mov var_34, ebx
  loc_00457968: call [004010D4h] ; rtcTrimVar
  loc_0045796E: lea edx, var_44
  loc_00457971: lea eax, var_74
  loc_00457974: push edx
  loc_00457975: push eax
  loc_00457976: mov var_6C, 0041E5D4h
  loc_0045797D: mov var_74, 00008008h
  loc_00457984: call [00401110h] ; __vbaVarTstEq
  loc_0045798A: lea ecx, var_20
  loc_0045798D: mov var_C8, eax
  loc_00457993: call [004012B0h] ; __vbaFreeObj
  loc_00457999: lea ecx, var_44
  loc_0045799C: lea edx, var_34
  loc_0045799F: push ecx
  loc_004579A0: push edx
  loc_004579A1: push 00000002h
  loc_004579A3: call [00401038h] ; __vbaFreeVarList
  loc_004579A9: add esp, 0000000Ch
  loc_004579AC: cmp var_C8, di
  loc_004579B3: jnz 00457D66h
  loc_004579B9: mov eax, [esi]
  loc_004579BB: push esi
  loc_004579BC: call [eax+00000324h]
  loc_004579C2: lea ecx, var_20
  loc_004579C5: push eax
  loc_004579C6: push ecx
  loc_004579C7: call [004010A0h] ; __vbaObjSet
  loc_004579CD: mov edx, [eax]
  loc_004579CF: lea ecx, var_18
  loc_004579D2: push ecx
  loc_004579D3: push eax
  loc_004579D4: mov var_C0, eax
  loc_004579DA: call [edx+000000A0h]
  loc_004579E0: cmp eax, edi
  loc_004579E2: fnclex
  loc_004579E4: jge 004579FEh
  loc_004579E6: mov edx, var_C0
  loc_004579EC: push 000000A0h
  loc_004579F1: push 0041E5E8h
  loc_004579F6: push edx
  loc_004579F7: push eax
  loc_004579F8: call [00401074h] ; __vbaHresultCheckObj
  loc_004579FE: mov eax, var_18
  loc_00457A01: lea ecx, var_44
  loc_00457A04: mov var_2C, eax
  loc_00457A07: lea eax, var_34
  loc_00457A0A: push eax
  loc_00457A0B: push ecx
  loc_00457A0C: mov var_18, edi
  loc_00457A0F: mov var_34, ebx
  loc_00457A12: call [004010D4h] ; rtcTrimVar
  loc_00457A18: mov edi, [0061A13Ch]
  loc_00457A1E: mov var_6C, 0041F300h ; "Select * From AgentThai Where AgentName='"
  loc_00457A25: mov var_74, ebx
  loc_00457A28: mov var_7C, 0041E890h ; "'"
  loc_00457A2F: mov var_84, ebx
  loc_00457A35: mov ebx, [edi]
  loc_00457A37: lea edi, var_24
  loc_00457A3A: mov ecx, 0000000Ah
  loc_00457A3F: push edi
  loc_00457A40: mov eax, 80020004h
  loc_00457A45: sub esp, 00000010h
  loc_00457A48: mov edx, eax
  loc_00457A4A: mov edi, esp
  loc_00457A4C: sub esp, 00000010h
  loc_00457A4F: mov [edi], ecx
  loc_00457A51: mov ecx, var_B0
  loc_00457A57: mov [edi+00000004h], ecx
  loc_00457A5A: mov ecx, esp
  loc_00457A5C: sub esp, 00000010h
  loc_00457A5F: mov [edi+00000008h], eax
  loc_00457A62: mov eax, var_A8
  loc_00457A68: mov [edi+0000000Ch], eax
  loc_00457A6B: mov eax, 0000000Ah
  loc_00457A70: mov [ecx], eax
  loc_00457A72: mov eax, var_A0
  loc_00457A78: mov edi, [004011B4h] ; __vbaVarCat
  loc_00457A7E: mov [ecx+00000004h], eax
  loc_00457A81: mov eax, 00000003h
  loc_00457A86: mov [ecx+00000008h], edx
  loc_00457A89: mov edx, var_98
  loc_00457A8F: mov [ecx+0000000Ch], edx
  loc_00457A92: mov edx, var_90
  loc_00457A98: mov ecx, esp
  loc_00457A9A: mov [ecx], eax
  loc_00457A9C: mov eax, 00000004h
  loc_00457AA1: mov [ecx+00000004h], edx
  loc_00457AA4: lea edx, var_44
  loc_00457AA7: mov [ecx+00000008h], eax
  loc_00457AAA: mov eax, var_88
  loc_00457AB0: mov [ecx+0000000Ch], eax
  loc_00457AB3: lea ecx, var_74
  loc_00457AB6: push ecx
  loc_00457AB7: lea eax, var_54
  loc_00457ABA: push edx
  loc_00457ABB: push eax
  loc_00457ABC: call edi
  loc_00457ABE: lea ecx, var_84
  loc_00457AC4: push eax
  loc_00457AC5: lea edx, var_64
  loc_00457AC8: push ecx
  loc_00457AC9: push edx
  loc_00457ACA: call edi
  loc_00457ACC: push eax
  loc_00457ACD: lea eax, var_1C
  loc_00457AD0: push eax
  loc_00457AD1: call [004011B0h] ; __vbaStrVarVal
  loc_00457AD7: mov ecx, [0061A13Ch]
  loc_00457ADD: push eax
  loc_00457ADE: push ecx
  loc_00457ADF: call [ebx+000000BCh]
  loc_00457AE5: test eax, eax
  loc_00457AE7: fnclex
  loc_00457AE9: jge 00457B03h
  loc_00457AEB: mov edx, [0061A13Ch]
  loc_00457AF1: push 000000BCh
  loc_00457AF6: push 0041E928h
  loc_00457AFB: push edx
  loc_00457AFC: push eax
  loc_00457AFD: call [00401074h] ; __vbaHresultCheckObj
  loc_00457B03: mov eax, var_24
  loc_00457B06: lea ebx, [esi+00000034h]
  loc_00457B09: push eax
  loc_00457B0A: push ebx
  loc_00457B0B: call [004010B8h] ; __vbaObjSetAddref
  loc_00457B11: lea ecx, var_1C
  loc_00457B14: call [004012ACh] ; __vbaFreeStr
  loc_00457B1A: lea ecx, var_24
  loc_00457B1D: lea edx, var_20
  loc_00457B20: push ecx
  loc_00457B21: push edx
  loc_00457B22: push 00000002h
  loc_00457B24: call [00401040h] ; __vbaFreeObjList
  loc_00457B2A: mov edi, [00401038h] ; __vbaFreeVarList
  loc_00457B30: lea eax, var_64
  loc_00457B33: lea ecx, var_54
  loc_00457B36: push eax
  loc_00457B37: lea edx, var_44
  loc_00457B3A: push ecx
  loc_00457B3B: lea eax, var_34
  loc_00457B3E: push edx
  loc_00457B3F: push eax
  loc_00457B40: push 00000004h
  loc_00457B42: call edi
  loc_00457B44: mov eax, [ebx]
  loc_00457B46: add esp, 00000020h
  loc_00457B49: lea edx, var_B8
  loc_00457B4F: mov ecx, [eax]
  loc_00457B51: push edx
  loc_00457B52: push eax
  loc_00457B53: call [ecx+00000020h]
  loc_00457B56: test eax, eax
  loc_00457B58: fnclex
  loc_00457B5A: jge 00457B6Dh
  loc_00457B5C: mov ecx, [ebx]
  loc_00457B5E: push 00000020h
  loc_00457B60: push 0041E938h
  loc_00457B65: push ecx
  loc_00457B66: push eax
  loc_00457B67: call [00401074h] ; __vbaHresultCheckObj
  loc_00457B6D: mov eax, [ebx]
  loc_00457B6F: lea ecx, var_BC
  loc_00457B75: push ecx
  loc_00457B76: push eax
  loc_00457B77: mov edx, [eax]
  loc_00457B79: call [edx+00000034h]
  loc_00457B7C: test eax, eax
  loc_00457B7E: fnclex
  loc_00457B80: jge 00457B93h
  loc_00457B82: mov edx, [ebx]
  loc_00457B84: push 00000034h
  loc_00457B86: push 0041E938h
  loc_00457B8B: push edx
  loc_00457B8C: push eax
  loc_00457B8D: call [00401074h] ; __vbaHresultCheckObj
  loc_00457B93: xor eax, eax
  loc_00457B95: cmp var_BC, ax
  loc_00457B9C: setz al
  loc_00457B9F: xor ecx, ecx
  loc_00457BA1: cmp var_B8, cx
  loc_00457BA8: setz cl
  loc_00457BAB: or eax, ecx
  loc_00457BAD: jz 00457CD6h
  loc_00457BB3: mov ecx, 80020004h
  loc_00457BB8: mov eax, 0000000Ah
  loc_00457BBD: mov var_5C, ecx
  loc_00457BC0: mov var_4C, ecx
  loc_00457BC3: mov var_3C, ecx
  loc_00457BC6: lea edx, var_74
  loc_00457BC9: lea ecx, var_34
  loc_00457BCC: mov var_64, eax
  loc_00457BCF: mov var_54, eax
  loc_00457BD2: mov var_44, eax
  loc_00457BD5: mov var_6C, 0041F3F0h ; "AgentName Aleady Exist.Please retype another AgentName!"
  loc_00457BDC: mov var_74, 00000008h
  loc_00457BE3: call [00401240h] ; __vbaVarDup
  loc_00457BE9: lea edx, var_64
  loc_00457BEC: lea eax, var_54
  loc_00457BEF: push edx
  loc_00457BF0: lea ecx, var_44
  loc_00457BF3: push eax
  loc_00457BF4: push ecx
  loc_00457BF5: lea edx, var_34
  loc_00457BF8: push 00000020h
  loc_00457BFA: push edx
  loc_00457BFB: call [004010A4h] ; rtcMsgBox
  loc_00457C01: lea eax, var_64
  loc_00457C04: lea ecx, var_54
  loc_00457C07: push eax
  loc_00457C08: lea edx, var_44
  loc_00457C0B: push ecx
  loc_00457C0C: lea eax, var_34
  loc_00457C0F: push edx
  loc_00457C10: push eax
  loc_00457C11: push 00000004h
  loc_00457C13: call edi
  loc_00457C15: mov ecx, [esi]
  loc_00457C17: add esp, 00000014h
  loc_00457C1A: push esi
  loc_00457C1B: call [ecx+00000324h]
  loc_00457C21: lea edx, var_20
  loc_00457C24: push eax
  loc_00457C25: push edx
  loc_00457C26: call [004010A0h] ; __vbaObjSet
  loc_00457C2C: mov edi, eax
  loc_00457C2E: push 0041E5D4h
  loc_00457C33: push edi
  loc_00457C34: mov eax, [edi]
  loc_00457C36: call [eax+000000A4h]
  loc_00457C3C: test eax, eax
  loc_00457C3E: fnclex
  loc_00457C40: jge 00457C54h
  loc_00457C42: push 000000A4h
  loc_00457C47: push 0041E5E8h
  loc_00457C4C: push edi
  loc_00457C4D: push eax
  loc_00457C4E: call [00401074h] ; __vbaHresultCheckObj
  loc_00457C54: lea ecx, var_20
  loc_00457C57: call [004012B0h] ; __vbaFreeObj
  loc_00457C5D: mov ecx, [esi]
  loc_00457C5F: push esi
  loc_00457C60: call [ecx+00000324h]
  loc_00457C66: lea edx, var_20
  loc_00457C69: push eax
  loc_00457C6A: push edx
  loc_00457C6B: call [004010A0h] ; __vbaObjSet
  loc_00457C71: mov edi, eax
  loc_00457C73: lea ecx, var_B8
  loc_00457C79: push ecx
  loc_00457C7A: push edi
  loc_00457C7B: mov eax, [edi]
  loc_00457C7D: call [eax+00000088h]
  loc_00457C83: test eax, eax
  loc_00457C85: fnclex
  loc_00457C87: jge 00457C9Bh
  loc_00457C89: push 00000088h
  loc_00457C8E: push 0041E5E8h
  loc_00457C93: push edi
  loc_00457C94: push eax
  loc_00457C95: call [00401074h] ; __vbaHresultCheckObj
  loc_00457C9B: mov edi, var_B8
  loc_00457CA1: lea ecx, var_20
  loc_00457CA4: call [004012B0h] ; __vbaFreeObj
  loc_00457CAA: test di, di
  loc_00457CAD: jz 00457D16h
  loc_00457CAF: mov edx, [esi]
  loc_00457CB1: push esi
  loc_00457CB2: call [edx+00000324h]
  loc_00457CB8: push eax
  loc_00457CB9: lea eax, var_20
  loc_00457CBC: push eax
  loc_00457CBD: call [004010A0h] ; __vbaObjSet
  loc_00457CC3: mov esi, eax
  loc_00457CC5: push esi
  loc_00457CC6: mov ecx, [esi]
  loc_00457CC8: call [ecx+00000204h]
  loc_00457CCE: test eax, eax
  loc_00457CD0: fnclex
  loc_00457CD2: jge 00457D0Dh
  loc_00457CD4: jmp 00457CFBh
  loc_00457CD6: mov edx, [esi]
  loc_00457CD8: push esi
  loc_00457CD9: call [edx+00000308h]
  loc_00457CDF: push eax
  loc_00457CE0: lea eax, var_20
  loc_00457CE3: push eax
  loc_00457CE4: call [004010A0h] ; __vbaObjSet
  loc_00457CEA: mov esi, eax
  loc_00457CEC: push esi
  loc_00457CED: mov ecx, [esi]
  loc_00457CEF: call [ecx+00000204h]
  loc_00457CF5: test eax, eax
  loc_00457CF7: fnclex
  loc_00457CF9: jge 00457D0Dh
  loc_00457CFB: push 00000204h
  loc_00457D00: push 0041E5E8h
  loc_00457D05: push esi
  loc_00457D06: push eax
  loc_00457D07: call [00401074h] ; __vbaHresultCheckObj
  loc_00457D0D: lea ecx, var_20
  loc_00457D10: call [004012B0h] ; __vbaFreeObj
  loc_00457D16: mov eax, [ebx]
  loc_00457D18: push eax
  loc_00457D19: mov edx, [eax]
  loc_00457D1B: call [edx+000000C4h]
  loc_00457D21: test eax, eax
  loc_00457D23: fnclex
  loc_00457D25: jge 00457D3Bh
  loc_00457D27: mov ecx, [ebx]
  loc_00457D29: push 000000C4h
  loc_00457D2E: push 0041E938h
  loc_00457D33: push ecx
  loc_00457D34: push eax
  loc_00457D35: call [00401074h] ; __vbaHresultCheckObj
  loc_00457D3B: push 0041E938h
  loc_00457D40: push 00000000h
  loc_00457D42: call [00401274h] ; __vbaCastObj
  loc_00457D48: lea edx, var_20
  loc_00457D4B: push eax
  loc_00457D4C: push edx
  loc_00457D4D: call [004010A0h] ; __vbaObjSet
  loc_00457D53: push eax
  loc_00457D54: push ebx
  loc_00457D55: call [004010B8h] ; __vbaObjSetAddref
  loc_00457D5B: lea ecx, var_20
  loc_00457D5E: call [004012B0h] ; __vbaFreeObj
  loc_00457D64: xor edi, edi
  loc_00457D66: mov var_4, edi
  loc_00457D69: push 00457DADh
  loc_00457D6E: jmp 00457DACh
  loc_00457D70: lea eax, var_1C
  loc_00457D73: lea ecx, var_18
  loc_00457D76: push eax
  loc_00457D77: push ecx
  loc_00457D78: push 00000002h
  loc_00457D7A: call [004011FCh] ; __vbaFreeStrList
  loc_00457D80: lea edx, var_24
  loc_00457D83: lea eax, var_20
  loc_00457D86: push edx
  loc_00457D87: push eax
  loc_00457D88: push 00000002h
  loc_00457D8A: call [00401040h] ; __vbaFreeObjList
  loc_00457D90: lea ecx, var_64
  loc_00457D93: lea edx, var_54
  loc_00457D96: push ecx
  loc_00457D97: lea eax, var_44
  loc_00457D9A: push edx
  loc_00457D9B: lea ecx, var_34
  loc_00457D9E: push eax
  loc_00457D9F: push ecx
  loc_00457DA0: push 00000004h
  loc_00457DA2: call [00401038h] ; __vbaFreeVarList
  loc_00457DA8: add esp, 0000002Ch
  loc_00457DAB: ret
  loc_00457DAC: ret
  loc_00457DAD: mov eax, Me
  loc_00457DB0: push eax
  loc_00457DB1: mov edx, [eax]
  loc_00457DB3: call [edx+00000008h]
  loc_00457DB6: mov eax, var_4
  loc_00457DB9: mov ecx, var_14
  loc_00457DBC: pop edi
  loc_00457DBD: pop esi
  loc_00457DBE: mov fs:[00000000h], ecx
  loc_00457DC5: pop ebx
  loc_00457DC6: mov esp, ebp
  loc_00457DC8: pop ebp
  loc_00457DC9: retn 0004h
End Sub

Private Sub cmdExit_Click() '455B70
  loc_00455B70: push ebp
  loc_00455B71: mov ebp, esp
  loc_00455B73: sub esp, 0000000Ch
  loc_00455B76: push 00403B36h ; __vbaExceptHandler
  loc_00455B7B: mov eax, fs:[00000000h]
  loc_00455B81: push eax
  loc_00455B82: mov fs:[00000000h], esp
  loc_00455B89: sub esp, 00000018h
  loc_00455B8C: push ebx
  loc_00455B8D: push esi
  loc_00455B8E: push edi
  loc_00455B8F: mov var_C, esp
  loc_00455B92: mov var_8, 00401460h
  loc_00455B99: mov edi, Me
  loc_00455B9C: mov eax, edi
  loc_00455B9E: and eax, 00000001h
  loc_00455BA1: mov var_4, eax
  loc_00455BA4: and edi, FFFFFFFEh
  loc_00455BA7: push edi
  loc_00455BA8: mov Me, edi
  loc_00455BAB: mov ecx, [edi]
  loc_00455BAD: call [ecx+00000004h]
  loc_00455BB0: mov eax, [0061B394h]
  loc_00455BB5: xor ebx, ebx
  loc_00455BB7: cmp eax, ebx
  loc_00455BB9: mov var_18, ebx
  loc_00455BBC: jnz 00455BCEh
  loc_00455BBE: push 0061B394h
  loc_00455BC3: push 0041E4A0h
  loc_00455BC8: call [004011DCh] ; __vbaNew2
  loc_00455BCE: mov esi, [0061B394h]
  loc_00455BD4: lea eax, var_18
  loc_00455BD7: push edi
  loc_00455BD8: push eax
  loc_00455BD9: mov edx, [esi]
  loc_00455BDB: mov var_2C, edx
  loc_00455BDE: call [004010B8h] ; __vbaObjSetAddref
  loc_00455BE4: mov ecx, var_2C
  loc_00455BE7: push eax
  loc_00455BE8: push esi
  loc_00455BE9: call [ecx+00000010h]
  loc_00455BEC: cmp eax, ebx
  loc_00455BEE: fnclex
  loc_00455BF0: jge 00455C01h
  loc_00455BF2: push 00000010h
  loc_00455BF4: push 0041E490h
  loc_00455BF9: push esi
  loc_00455BFA: push eax
  loc_00455BFB: call [00401074h] ; __vbaHresultCheckObj
  loc_00455C01: lea ecx, var_18
  loc_00455C04: call [004012B0h] ; __vbaFreeObj
  loc_00455C0A: mov var_4, ebx
  loc_00455C0D: push 00455C1Fh
  loc_00455C12: jmp 00455C1Eh
  loc_00455C14: lea ecx, var_18
  loc_00455C17: call [004012B0h] ; __vbaFreeObj
  loc_00455C1D: ret
  loc_00455C1E: ret
  loc_00455C1F: mov eax, Me
  loc_00455C22: push eax
  loc_00455C23: mov edx, [eax]
  loc_00455C25: call [edx+00000008h]
  loc_00455C28: mov eax, var_4
  loc_00455C2B: mov ecx, var_14
  loc_00455C2E: pop edi
  loc_00455C2F: pop esi
  loc_00455C30: mov fs:[00000000h], ecx
  loc_00455C37: pop ebx
  loc_00455C38: mov esp, ebp
  loc_00455C3A: pop ebp
  loc_00455C3B: retn 0004h
End Sub

Private Sub cmdReport_Click() '456B70
  loc_00456B70: push ebp
  loc_00456B71: mov ebp, esp
  loc_00456B73: sub esp, 0000000Ch
  loc_00456B76: push 00403B36h ; __vbaExceptHandler
  loc_00456B7B: mov eax, fs:[00000000h]
  loc_00456B81: push eax
  loc_00456B82: mov fs:[00000000h], esp
  loc_00456B89: sub esp, 00000084h
  loc_00456B8F: push ebx
  loc_00456B90: push esi
  loc_00456B91: push edi
  loc_00456B92: mov var_C, esp
  loc_00456B95: mov var_8, 00401490h
  loc_00456B9C: mov esi, Me
  loc_00456B9F: mov eax, esi
  loc_00456BA1: and eax, 00000001h
  loc_00456BA4: mov var_4, eax
  loc_00456BA7: and esi, FFFFFFFEh
  loc_00456BAA: push esi
  loc_00456BAB: mov Me, esi
  loc_00456BAE: mov ecx, [esi]
  loc_00456BB0: call [ecx+00000004h]
  loc_00456BB3: mov edx, [esi]
  loc_00456BB5: xor edi, edi
  loc_00456BB7: push 0000000Bh
  loc_00456BB9: push esi
  loc_00456BBA: mov var_18, edi
  loc_00456BBD: mov var_1C, edi
  loc_00456BC0: mov var_20, edi
  loc_00456BC3: mov var_30, edi
  loc_00456BC6: mov var_40, edi
  loc_00456BC9: mov var_50, edi
  loc_00456BCC: call [edx+000000A4h]
  loc_00456BD2: cmp eax, edi
  loc_00456BD4: fnclex
  loc_00456BD6: jge 00456BEAh
  loc_00456BD8: push 000000A4h
  loc_00456BDD: push 0041F088h
  loc_00456BE2: push esi
  loc_00456BE3: push eax
  loc_00456BE4: call [00401074h] ; __vbaHresultCheckObj
  loc_00456BEA: mov eax, [esi]
  loc_00456BEC: push edi
  loc_00456BED: push 00000070h
  loc_00456BEF: push esi
  loc_00456BF0: call [eax+00000348h]
  loc_00456BF6: mov edi, [004010A0h] ; __vbaObjSet
  loc_00456BFC: lea ecx, var_1C
  loc_00456BFF: push eax
  loc_00456C00: push ecx
  loc_00456C01: call edi
  loc_00456C03: push eax
  loc_00456C04: call [00401024h] ; __vbaLateIdCall
  loc_00456C0A: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_00456C10: add esp, 0000000Ch
  loc_00456C13: lea ecx, var_1C
  loc_00456C16: call ebx
  loc_00456C18: lea edx, var_50
  loc_00456C1B: lea eax, var_30
  loc_00456C1E: push edx
  loc_00456C1F: push eax
  loc_00456C20: mov var_48, 0061A150h
  loc_00456C27: mov var_50, 00004008h
  loc_00456C2E: call [004010D4h] ; rtcTrimVar
  loc_00456C34: lea ecx, var_30
  loc_00456C37: push ecx
  loc_00456C38: call [00401028h] ; __vbaStrVarMove
  loc_00456C3E: sub esp, 00000010h
  loc_00456C41: mov ecx, 00000002h
  loc_00456C46: mov edx, esp
  loc_00456C48: sub esp, 00000010h
  loc_00456C4B: mov var_40, 00000008h
  loc_00456C52: mov var_38, eax
  loc_00456C55: mov [edx], ecx
  loc_00456C57: mov ecx, var_5C
  loc_00456C5A: mov [edx+00000004h], ecx
  loc_00456C5D: xor ecx, ecx
  loc_00456C5F: mov [edx+00000008h], ecx
  loc_00456C62: mov ecx, var_54
  loc_00456C65: mov [edx+0000000Ch], ecx
  loc_00456C68: mov ecx, var_40
  loc_00456C6B: mov edx, esp
  loc_00456C6D: push 00000001h
  loc_00456C6F: push 00000020h
  loc_00456C71: push esi
  loc_00456C72: mov [edx], ecx
  loc_00456C74: mov ecx, var_3C
  loc_00456C77: mov [edx+00000004h], ecx
  loc_00456C7A: mov ecx, [esi]
  loc_00456C7C: mov [edx+00000008h], eax
  loc_00456C7F: mov eax, var_34
  loc_00456C82: mov [edx+0000000Ch], eax
  loc_00456C85: call [ecx+00000348h]
  loc_00456C8B: lea edx, var_1C
  loc_00456C8E: push eax
  loc_00456C8F: push edx
  loc_00456C90: call edi
  loc_00456C92: push eax
  loc_00456C93: call [00401160h] ; __vbaLateIdCallSt
  loc_00456C99: add esp, 0000002Ch
  loc_00456C9C: lea ecx, var_1C
  loc_00456C9F: call ebx
  loc_00456CA1: lea eax, var_40
  loc_00456CA4: lea ecx, var_30
  loc_00456CA7: push eax
  loc_00456CA8: push ecx
  loc_00456CA9: push 00000002h
  loc_00456CAB: call [00401038h] ; __vbaFreeVarList
  loc_00456CB1: mov eax, [0061B394h]
  loc_00456CB6: add esp, 0000000Ch
  loc_00456CB9: test eax, eax
  loc_00456CBB: jnz 00456CCDh
  loc_00456CBD: push 0061B394h
  loc_00456CC2: push 0041E4A0h
  loc_00456CC7: call [004011DCh] ; __vbaNew2
  loc_00456CCD: mov eax, [0061B394h]
  loc_00456CD2: lea ecx, var_1C
  loc_00456CD5: push ecx
  loc_00456CD6: push eax
  loc_00456CD7: mov edx, [eax]
  loc_00456CD9: mov var_84, eax
  loc_00456CDF: call [edx+00000014h]
  loc_00456CE2: test eax, eax
  loc_00456CE4: fnclex
  loc_00456CE6: jge 00456CFDh
  loc_00456CE8: mov edx, var_84
  loc_00456CEE: push 00000014h
  loc_00456CF0: push 0041E490h
  loc_00456CF5: push edx
  loc_00456CF6: push eax
  loc_00456CF7: call [00401074h] ; __vbaHresultCheckObj
  loc_00456CFD: mov eax, var_1C
  loc_00456D00: lea edx, var_18
  loc_00456D03: push edx
  loc_00456D04: push eax
  loc_00456D05: mov ecx, [eax]
  loc_00456D07: mov var_8C, eax
  loc_00456D0D: call [ecx+00000050h]
  loc_00456D10: test eax, eax
  loc_00456D12: fnclex
  loc_00456D14: jge 00456D2Bh
  loc_00456D16: mov ecx, var_8C
  loc_00456D1C: push 00000050h
  loc_00456D1E: push 0041F3A0h
  loc_00456D23: push ecx
  loc_00456D24: push eax
  loc_00456D25: call [00401074h] ; __vbaHresultCheckObj
  loc_00456D2B: mov edx, var_18
  loc_00456D2E: push edx
  loc_00456D2F: push 0041F3B4h ; "\Reports\Agent.rpt"
  loc_00456D34: call [00401054h] ; __vbaStrCat
  loc_00456D3A: sub esp, 00000010h
  loc_00456D3D: mov ecx, 00000008h
  loc_00456D42: mov edx, esp
  loc_00456D44: mov var_30, ecx
  loc_00456D47: mov var_28, eax
  loc_00456D4A: push 00000003h
  loc_00456D4C: mov [edx], ecx
  loc_00456D4E: mov ecx, var_2C
  loc_00456D51: push esi
  loc_00456D52: mov [edx+00000004h], ecx
  loc_00456D55: mov ecx, [esi]
  loc_00456D57: mov [edx+00000008h], eax
  loc_00456D5A: mov eax, var_24
  loc_00456D5D: mov [edx+0000000Ch], eax
  loc_00456D60: call [ecx+00000348h]
  loc_00456D66: lea edx, var_20
  loc_00456D69: push eax
  loc_00456D6A: push edx
  loc_00456D6B: call edi
  loc_00456D6D: push eax
  loc_00456D6E: call [00401288h] ; __vbaLateIdSt
  loc_00456D74: lea ecx, var_18
  loc_00456D77: call [004012ACh] ; __vbaFreeStr
  loc_00456D7D: lea eax, var_20
  loc_00456D80: lea ecx, var_1C
  loc_00456D83: push eax
  loc_00456D84: push ecx
  loc_00456D85: push 00000002h
  loc_00456D87: call [00401040h] ; __vbaFreeObjList
  loc_00456D8D: add esp, 0000000Ch
  loc_00456D90: lea ecx, var_30
  loc_00456D93: call [00401020h] ; __vbaFreeVar
  loc_00456D99: sub esp, 00000010h
  loc_00456D9C: mov ecx, 00000003h
  loc_00456DA1: mov edx, esp
  loc_00456DA3: mov var_50, ecx
  loc_00456DA6: mov eax, 00000002h
  loc_00456DAB: push 00000043h
  loc_00456DAD: mov [edx], ecx
  loc_00456DAF: mov ecx, var_4C
  loc_00456DB2: mov var_48, eax
  loc_00456DB5: push esi
  loc_00456DB6: mov [edx+00000004h], ecx
  loc_00456DB9: mov ecx, [esi]
  loc_00456DBB: mov [edx+00000008h], eax
  loc_00456DBE: mov eax, var_44
  loc_00456DC1: mov [edx+0000000Ch], eax
  loc_00456DC4: call [ecx+00000348h]
  loc_00456DCA: lea edx, var_1C
  loc_00456DCD: push eax
  loc_00456DCE: push edx
  loc_00456DCF: call edi
  loc_00456DD1: push eax
  loc_00456DD2: call [00401288h] ; __vbaLateIdSt
  loc_00456DD8: lea ecx, var_1C
  loc_00456DDB: call ebx
  loc_00456DDD: sub esp, 00000010h
  loc_00456DE0: mov ecx, 00000002h
  loc_00456DE5: mov edx, esp
  loc_00456DE7: mov var_50, ecx
  loc_00456DEA: mov eax, 00000001h
  loc_00456DEF: push 00000011h
  loc_00456DF1: mov [edx], ecx
  loc_00456DF3: mov ecx, var_4C
  loc_00456DF6: mov var_48, eax
  loc_00456DF9: push esi
  loc_00456DFA: mov [edx+00000004h], ecx
  loc_00456DFD: mov ecx, [esi]
  loc_00456DFF: mov [edx+00000008h], eax
  loc_00456E02: mov eax, var_44
  loc_00456E05: mov [edx+0000000Ch], eax
  loc_00456E08: call [ecx+00000348h]
  loc_00456E0E: lea edx, var_1C
  loc_00456E11: push eax
  loc_00456E12: push edx
  loc_00456E13: call edi
  loc_00456E15: push eax
  loc_00456E16: call [00401288h] ; __vbaLateIdSt
  loc_00456E1C: lea ecx, var_1C
  loc_00456E1F: call ebx
  loc_00456E21: mov eax, [esi]
  loc_00456E23: push 00000001h
  loc_00456E25: push esi
  loc_00456E26: call [eax+000000A4h]
  loc_00456E2C: test eax, eax
  loc_00456E2E: fnclex
  loc_00456E30: jge 00456E44h
  loc_00456E32: push 000000A4h
  loc_00456E37: push 0041F088h
  loc_00456E3C: push esi
  loc_00456E3D: push eax
  loc_00456E3E: call [00401074h] ; __vbaHresultCheckObj
  loc_00456E44: mov var_4, 00000000h
  loc_00456E4B: push 00456E80h
  loc_00456E50: jmp 00456E7Fh
  loc_00456E52: lea ecx, var_18
  loc_00456E55: call [004012ACh] ; __vbaFreeStr
  loc_00456E5B: lea ecx, var_20
  loc_00456E5E: lea edx, var_1C
  loc_00456E61: push ecx
  loc_00456E62: push edx
  loc_00456E63: push 00000002h
  loc_00456E65: call [00401040h] ; __vbaFreeObjList
  loc_00456E6B: lea eax, var_40
  loc_00456E6E: lea ecx, var_30
  loc_00456E71: push eax
  loc_00456E72: push ecx
  loc_00456E73: push 00000002h
  loc_00456E75: call [00401038h] ; __vbaFreeVarList
  loc_00456E7B: add esp, 00000018h
  loc_00456E7E: ret
  loc_00456E7F: ret
  loc_00456E80: mov eax, Me
  loc_00456E83: push eax
  loc_00456E84: mov edx, [eax]
  loc_00456E86: call [edx+00000008h]
  loc_00456E89: mov eax, var_4
  loc_00456E8C: mov ecx, var_14
  loc_00456E8F: pop edi
  loc_00456E90: pop esi
  loc_00456E91: mov fs:[00000000h], ecx
  loc_00456E98: pop ebx
  loc_00456E99: mov esp, ebp
  loc_00456E9B: pop ebp
  loc_00456E9C: retn 0004h
End Sub

Private Sub cmdNew_Click() '455C40
  loc_00455C40: push ebp
  loc_00455C41: mov ebp, esp
  loc_00455C43: sub esp, 0000000Ch
  loc_00455C46: push 00403B36h ; __vbaExceptHandler
  loc_00455C4B: mov eax, fs:[00000000h]
  loc_00455C51: push eax
  loc_00455C52: mov fs:[00000000h], esp
  loc_00455C59: sub esp, 00000028h
  loc_00455C5C: push ebx
  loc_00455C5D: push esi
  loc_00455C5E: push edi
  loc_00455C5F: mov var_C, esp
  loc_00455C62: mov var_8, 00401470h
  loc_00455C69: mov esi, Me
  loc_00455C6C: mov eax, esi
  loc_00455C6E: and eax, 00000001h
  loc_00455C71: mov var_4, eax
  loc_00455C74: and esi, FFFFFFFEh
  loc_00455C77: push esi
  loc_00455C78: mov Me, esi
  loc_00455C7B: mov ecx, [esi]
  loc_00455C7D: call [ecx+00000004h]
  loc_00455C80: mov edx, [esi]
  loc_00455C82: xor ebx, ebx
  loc_00455C84: push esi
  loc_00455C85: mov var_18, ebx
  loc_00455C88: mov var_28, ebx
  loc_00455C8B: mov var_2C, ebx
  loc_00455C8E: mov [esi+0000003Eh], FFFFFFh
  loc_00455C94: call [edx+0000032Ch]
  loc_00455C9A: push eax
  loc_00455C9B: lea eax, var_18
  loc_00455C9E: push eax
  loc_00455C9F: call [004010A0h] ; __vbaObjSet
  loc_00455CA5: mov edi, eax
  loc_00455CA7: push 0041F368h ; "&Save"
  loc_00455CAC: push edi
  loc_00455CAD: mov ecx, [edi]
  loc_00455CAF: call [ecx+00000054h]
  loc_00455CB2: cmp eax, ebx
  loc_00455CB4: fnclex
  loc_00455CB6: jge 00455CC7h
  loc_00455CB8: push 00000054h
  loc_00455CBA: push 0041EAACh
  loc_00455CBF: push edi
  loc_00455CC0: push eax
  loc_00455CC1: call [00401074h] ; __vbaHresultCheckObj
  loc_00455CC7: lea ecx, var_18
  loc_00455CCA: call [004012B0h] ; __vbaFreeObj
  loc_00455CD0: mov edx, [esi]
  loc_00455CD2: push esi
  loc_00455CD3: mov [esi+0000003Ch], bx
  loc_00455CD7: call [edx+00000734h]
  loc_00455CDD: mov eax, [esi]
  loc_00455CDF: lea ecx, var_28
  loc_00455CE2: lea edx, var_2C
  loc_00455CE5: push ecx
  loc_00455CE6: push edx
  loc_00455CE7: push esi
  loc_00455CE8: mov var_2C, ebx
  loc_00455CEB: call [eax+000006FCh]
  loc_00455CF1: mov edi, [00401020h] ; __vbaFreeVar
  loc_00455CF7: lea ecx, var_28
  loc_00455CFA: call edi
  loc_00455CFC: mov eax, [esi]
  loc_00455CFE: lea ecx, var_28
  loc_00455D01: lea edx, var_2C
  loc_00455D04: push ecx
  loc_00455D05: push edx
  loc_00455D06: push esi
  loc_00455D07: mov var_2C, FFFFFFFFh
  loc_00455D0E: call [eax+000006F8h]
  loc_00455D14: lea ecx, var_28
  loc_00455D17: call edi
  loc_00455D19: mov eax, [esi]
  loc_00455D1B: push esi
  loc_00455D1C: call [eax+00000324h]
  loc_00455D22: lea ecx, var_18
  loc_00455D25: push eax
  loc_00455D26: push ecx
  loc_00455D27: call [004010A0h] ; __vbaObjSet
  loc_00455D2D: mov esi, eax
  loc_00455D2F: push esi
  loc_00455D30: mov edx, [esi]
  loc_00455D32: call [edx+00000204h]
  loc_00455D38: cmp eax, ebx
  loc_00455D3A: fnclex
  loc_00455D3C: jge 00455D50h
  loc_00455D3E: push 00000204h
  loc_00455D43: push 0041E5E8h
  loc_00455D48: push esi
  loc_00455D49: push eax
  loc_00455D4A: call [00401074h] ; __vbaHresultCheckObj
  loc_00455D50: lea ecx, var_18
  loc_00455D53: call [004012B0h] ; __vbaFreeObj
  loc_00455D59: mov var_4, ebx
  loc_00455D5C: push 00455D77h
  loc_00455D61: jmp 00455D76h
  loc_00455D63: lea ecx, var_18
  loc_00455D66: call [004012B0h] ; __vbaFreeObj
  loc_00455D6C: lea ecx, var_28
  loc_00455D6F: call [00401020h] ; __vbaFreeVar
  loc_00455D75: ret
  loc_00455D76: ret
  loc_00455D77: mov eax, Me
  loc_00455D7A: push eax
  loc_00455D7B: mov ecx, [eax]
  loc_00455D7D: call [ecx+00000008h]
  loc_00455D80: mov eax, var_4
  loc_00455D83: mov ecx, var_14
  loc_00455D86: pop edi
  loc_00455D87: pop esi
  loc_00455D88: mov fs:[00000000h], ecx
  loc_00455D8F: pop ebx
  loc_00455D90: mov esp, ebp
  loc_00455D92: pop ebp
  loc_00455D93: retn 0004h
End Sub

Private Sub Form_Load() '457250
  loc_00457250: push ebp
  loc_00457251: mov ebp, esp
  loc_00457253: sub esp, 0000000Ch
  loc_00457256: push 00403B36h ; __vbaExceptHandler
  loc_0045725B: mov eax, fs:[00000000h]
  loc_00457261: push eax
  loc_00457262: mov fs:[00000000h], esp
  loc_00457269: sub esp, 0000001Ch
  loc_0045726C: push ebx
  loc_0045726D: push esi
  loc_0045726E: push edi
  loc_0045726F: mov var_C, esp
  loc_00457272: mov var_8, 004014C0h
  loc_00457279: mov esi, Me
  loc_0045727C: mov eax, esi
  loc_0045727E: and eax, 00000001h
  loc_00457281: mov var_4, eax
  loc_00457284: and esi, FFFFFFFEh
  loc_00457287: push esi
  loc_00457288: mov Me, esi
  loc_0045728B: mov ecx, [esi]
  loc_0045728D: call [ecx+00000004h]
  loc_00457290: xor ebx, ebx
  loc_00457292: mov edx, 0041F3E0h ; "Agent"
  loc_00457297: mov ecx, 0061A0A0h
  loc_0045729C: mov var_24, ebx
  loc_0045729F: mov var_28, ebx
  loc_004572A2: call [004011ECh] ; __vbaStrCopy
  loc_004572A8: mov edx, [esi]
  loc_004572AA: or eax, FFFFFFFFh
  loc_004572AD: mov [esi+0000003Eh], ax
  loc_004572B1: mov var_28, eax
  loc_004572B4: lea eax, var_24
  loc_004572B7: lea ecx, var_28
  loc_004572BA: push eax
  loc_004572BB: push ecx
  loc_004572BC: push esi
  loc_004572BD: call [edx+000006FCh]
  loc_004572C3: mov edi, [00401020h] ; __vbaFreeVar
  loc_004572C9: lea ecx, var_24
  loc_004572CC: call edi
  loc_004572CE: mov edx, [esi]
  loc_004572D0: lea eax, var_24
  loc_004572D3: lea ecx, var_28
  loc_004572D6: push eax
  loc_004572D7: push ecx
  loc_004572D8: push esi
  loc_004572D9: mov var_28, ebx
  loc_004572DC: call [edx+000006F8h]
  loc_004572E2: lea ecx, var_24
  loc_004572E5: call edi
  loc_004572E7: mov var_4, ebx
  loc_004572EA: push 004572FCh
  loc_004572EF: jmp 004572FBh
  loc_004572F1: lea ecx, var_24
  loc_004572F4: call [00401020h] ; __vbaFreeVar
  loc_004572FA: ret
  loc_004572FB: ret
  loc_004572FC: mov eax, Me
  loc_004572FF: push eax
  loc_00457300: mov edx, [eax]
  loc_00457302: call [edx+00000008h]
  loc_00457305: mov eax, var_4
  loc_00457308: mov ecx, var_14
  loc_0045730B: pop edi
  loc_0045730C: pop esi
  loc_0045730D: mov fs:[00000000h], ecx
  loc_00457314: pop ebx
  loc_00457315: mov esp, ebp
  loc_00457317: pop ebp
  loc_00457318: retn 0004h
End Sub

Private Sub txtRate_KeyPress(KeyAscii As Integer) '457EA0
  loc_00457EA0: push ebp
  loc_00457EA1: mov ebp, esp
  loc_00457EA3: sub esp, 0000000Ch
  loc_00457EA6: push 00403B36h ; __vbaExceptHandler
  loc_00457EAB: mov eax, fs:[00000000h]
  loc_00457EB1: push eax
  loc_00457EB2: mov fs:[00000000h], esp
  loc_00457EB9: sub esp, 000000A8h
  loc_00457EBF: push ebx
  loc_00457EC0: push esi
  loc_00457EC1: push edi
  loc_00457EC2: mov var_C, esp
  loc_00457EC5: mov var_8, 00401530h
  loc_00457ECC: mov edi, Me
  loc_00457ECF: mov eax, edi
  loc_00457ED1: and eax, 00000001h
  loc_00457ED4: mov var_4, eax
  loc_00457ED7: and edi, FFFFFFFEh
  loc_00457EDA: push edi
  loc_00457EDB: mov Me, edi
  loc_00457EDE: mov ecx, [edi]
  loc_00457EE0: call [ecx+00000004h]
  loc_00457EE3: xor esi, esi
  loc_00457EE5: mov edx, 0041EA94h ; "0123456789."
  loc_00457EEA: lea ecx, var_18
  loc_00457EED: mov var_18, esi
  loc_00457EF0: mov var_1C, esi
  loc_00457EF3: mov var_2C, esi
  loc_00457EF6: mov var_3C, esi
  loc_00457EF9: mov var_4C, esi
  loc_00457EFC: mov var_5C, esi
  loc_00457EFF: mov var_6C, esi
  loc_00457F02: mov var_7C, esi
  loc_00457F05: mov var_8C, esi
  loc_00457F0B: mov var_9C, esi
  loc_00457F11: mov var_AC, esi
  loc_00457F17: call [004011ECh] ; __vbaStrCopy
  loc_00457F1D: mov ebx, KeyAscii
  loc_00457F20: mov edx, var_18
  loc_00457F23: lea ecx, var_2C
  loc_00457F26: mov var_74, edx
  loc_00457F29: movsx eax, [ebx]
  loc_00457F2C: push eax
  loc_00457F2D: push ecx
  loc_00457F2E: mov var_7C, 00000008h
  loc_00457F35: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_00457F3B: mov ax, [ebx]
  loc_00457F3E: xor edx, edx
  loc_00457F40: cmp ax, 0008h
  loc_00457F44: mov ecx, 0000000Bh
  loc_00457F49: setz dl
  loc_00457F4C: neg edx
  loc_00457F4E: mov var_94, dx
  loc_00457F55: xor edx, edx
  loc_00457F57: cmp ax, 000Dh
  loc_00457F5B: mov var_9C, ecx
  loc_00457F61: setz dl
  loc_00457F64: neg edx
  loc_00457F66: mov var_AC, ecx
  loc_00457F6C: lea eax, var_7C
  loc_00457F6F: push 00000001h
  loc_00457F71: lea ecx, var_2C
  loc_00457F74: mov var_A4, dx
  loc_00457F7B: push eax
  loc_00457F7C: push ecx
  loc_00457F7D: lea edx, var_3C
  loc_00457F80: push esi
  loc_00457F81: push edx
  loc_00457F82: mov var_84, esi
  loc_00457F88: mov var_8C, 00008002h
  loc_00457F92: call [004011A8h] ; __vbaInStrVar
  loc_00457F98: push eax
  loc_00457F99: lea eax, var_8C
  loc_00457F9F: lea ecx, var_4C
  loc_00457FA2: push eax
  loc_00457FA3: push ecx
  loc_00457FA4: call [00401050h] ; __vbaVarCmpNe
  loc_00457FAA: push eax
  loc_00457FAB: lea edx, var_9C
  loc_00457FB1: lea eax, var_5C
  loc_00457FB4: push edx
  loc_00457FB5: push eax
  loc_00457FB6: call [0040112Ch] ; __vbaVarOr
  loc_00457FBC: lea ecx, var_AC
  loc_00457FC2: push eax
  loc_00457FC3: lea edx, var_6C
  loc_00457FC6: push ecx
  loc_00457FC7: push edx
  loc_00457FC8: call [0040112Ch] ; __vbaVarOr
  loc_00457FCE: push eax
  loc_00457FCF: call [004010E0h] ; __vbaBoolVarNull
  loc_00457FD5: mov var_B0, ax
  loc_00457FDC: lea eax, var_AC
  loc_00457FE2: lea ecx, var_9C
  loc_00457FE8: push eax
  loc_00457FE9: lea edx, var_3C
  loc_00457FEC: push ecx
  loc_00457FED: lea eax, var_2C
  loc_00457FF0: push edx
  loc_00457FF1: push eax
  loc_00457FF2: push 00000004h
  loc_00457FF4: call [00401038h] ; __vbaFreeVarList
  loc_00457FFA: add esp, 00000014h
  loc_00457FFD: cmp var_B0, si
  loc_00458004: jz 00458054h
  loc_00458006: mov ax, [ebx]
  loc_00458009: cmp ax, 000Dh
  loc_0045800D: mov [ebx], ax
  loc_00458010: jnz 00458057h
  loc_00458012: mov ecx, [edi]
  loc_00458014: push edi
  loc_00458015: call [ecx+00000320h]
  loc_0045801B: lea edx, var_1C
  loc_0045801E: push eax
  loc_0045801F: push edx
  loc_00458020: call [004010A0h] ; __vbaObjSet
  loc_00458026: mov edi, eax
  loc_00458028: push edi
  loc_00458029: mov eax, [edi]
  loc_0045802B: call [eax+00000204h]
  loc_00458031: cmp eax, esi
  loc_00458033: fnclex
  loc_00458035: jge 00458049h
  loc_00458037: push 00000204h
  loc_0045803C: push 0041E5E8h
  loc_00458041: push edi
  loc_00458042: push eax
  loc_00458043: call [00401074h] ; __vbaHresultCheckObj
  loc_00458049: lea ecx, var_1C
  loc_0045804C: call [004012B0h] ; __vbaFreeObj
  loc_00458052: jmp 00458057h
  loc_00458054: mov [ebx], si
  loc_00458057: mov var_4, esi
  loc_0045805A: push 00458094h
  loc_0045805F: jmp 0045808Ah
  loc_00458061: lea ecx, var_1C
  loc_00458064: call [004012B0h] ; __vbaFreeObj
  loc_0045806A: lea ecx, var_6C
  loc_0045806D: lea edx, var_5C
  loc_00458070: push ecx
  loc_00458071: lea eax, var_4C
  loc_00458074: push edx
  loc_00458075: lea ecx, var_3C
  loc_00458078: push eax
  loc_00458079: lea edx, var_2C
  loc_0045807C: push ecx
  loc_0045807D: push edx
  loc_0045807E: push 00000005h
  loc_00458080: call [00401038h] ; __vbaFreeVarList
  loc_00458086: add esp, 00000018h
  loc_00458089: ret
  loc_0045808A: lea ecx, var_18
  loc_0045808D: call [004012ACh] ; __vbaFreeStr
  loc_00458093: ret
  loc_00458094: mov eax, Me
  loc_00458097: push eax
  loc_00458098: mov ecx, [eax]
  loc_0045809A: call [ecx+00000008h]
  loc_0045809D: mov eax, var_4
  loc_004580A0: mov ecx, var_14
  loc_004580A3: pop edi
  loc_004580A4: pop esi
  loc_004580A5: mov fs:[00000000h], ecx
  loc_004580AC: pop ebx
  loc_004580AD: mov esp, ebp
  loc_004580AF: pop ebp
  loc_004580B0: retn 0008h
End Sub

Private Sub Proc_2_15_453140(arg_C, arg_10) '453140
  loc_00453140: push ebp
  loc_00453141: mov ebp, esp
  loc_00453143: sub esp, 0000000Ch
  loc_00453146: push 00403B36h ; __vbaExceptHandler
  loc_0045314B: mov eax, fs:[00000000h]
  loc_00453151: push eax
  loc_00453152: mov fs:[00000000h], esp
  loc_00453159: sub esp, 00000024h
  loc_0045315C: push ebx
  loc_0045315D: push esi
  loc_0045315E: push edi
  loc_0045315F: mov var_C, esp
  loc_00453162: mov var_8, 004013F0h
  loc_00453169: mov ecx, arg_10
  loc_0045316C: mov esi, Me
  loc_0045316F: xor eax, eax
  loc_00453171: push esi
  loc_00453172: mov [ecx], eax
  loc_00453174: mov edx, [esi]
  loc_00453176: mov var_24, eax
  loc_00453179: mov var_28, eax
  loc_0045317C: call [edx+00000324h]
  loc_00453182: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00453188: push eax
  loc_00453189: lea eax, var_28
  loc_0045318C: push eax
  loc_0045318D: call ebx
  loc_0045318F: mov edx, arg_C
  loc_00453192: mov edi, eax
  loc_00453194: mov ax, [edx]
  loc_00453197: mov ecx, [edi]
  loc_00453199: push eax
  loc_0045319A: push edi
  loc_0045319B: call [ecx+0000008Ch]
  loc_004531A1: test eax, eax
  loc_004531A3: fnclex
  loc_004531A5: jge 004531B9h
  loc_004531A7: push 0000008Ch
  loc_004531AC: push 0041E5E8h
  loc_004531B1: push edi
  loc_004531B2: push eax
  loc_004531B3: call [00401074h] ; __vbaHresultCheckObj
  loc_004531B9: lea ecx, var_28
  loc_004531BC: call [004012B0h] ; __vbaFreeObj
  loc_004531C2: mov ecx, [esi]
  loc_004531C4: push esi
  loc_004531C5: call [ecx+00000320h]
  loc_004531CB: lea edx, var_28
  loc_004531CE: push eax
  loc_004531CF: push edx
  loc_004531D0: call ebx
  loc_004531D2: mov ecx, arg_C
  loc_004531D5: mov edi, eax
  loc_004531D7: mov dx, [ecx]
  loc_004531DA: mov eax, [edi]
  loc_004531DC: push edx
  loc_004531DD: push edi
  loc_004531DE: call [eax+0000008Ch]
  loc_004531E4: test eax, eax
  loc_004531E6: fnclex
  loc_004531E8: jge 004531FCh
  loc_004531EA: push 0000008Ch
  loc_004531EF: push 0041E5E8h
  loc_004531F4: push edi
  loc_004531F5: push eax
  loc_004531F6: call [00401074h] ; __vbaHresultCheckObj
  loc_004531FC: lea ecx, var_28
  loc_004531FF: call [004012B0h] ; __vbaFreeObj
  loc_00453205: mov eax, [esi]
  loc_00453207: push esi
  loc_00453208: call [eax+00000308h]
  loc_0045320E: lea ecx, var_28
  loc_00453211: push eax
  loc_00453212: push ecx
  loc_00453213: call ebx
  loc_00453215: mov edi, eax
  loc_00453217: mov eax, arg_C
  loc_0045321A: mov cx, [eax]
  loc_0045321D: mov edx, [edi]
  loc_0045321F: push ecx
  loc_00453220: push edi
  loc_00453221: call [edx+0000008Ch]
  loc_00453227: test eax, eax
  loc_00453229: fnclex
  loc_0045322B: jge 0045323Fh
  loc_0045322D: push 0000008Ch
  loc_00453232: push 0041E5E8h
  loc_00453237: push edi
  loc_00453238: push eax
  loc_00453239: call [00401074h] ; __vbaHresultCheckObj
  loc_0045323F: lea ecx, var_28
  loc_00453242: call [004012B0h] ; __vbaFreeObj
  loc_00453248: mov edx, [esi]
  loc_0045324A: push esi
  loc_0045324B: call [edx+00000304h]
  loc_00453251: push eax
  loc_00453252: lea eax, var_28
  loc_00453255: push eax
  loc_00453256: call ebx
  loc_00453258: mov edx, arg_C
  loc_0045325B: mov edi, eax
  loc_0045325D: mov ax, [edx]
  loc_00453260: mov ecx, [edi]
  loc_00453262: push eax
  loc_00453263: push edi
  loc_00453264: call [ecx+0000008Ch]
  loc_0045326A: test eax, eax
  loc_0045326C: fnclex
  loc_0045326E: jge 00453282h
  loc_00453270: push 0000008Ch
  loc_00453275: push 0041E5E8h
  loc_0045327A: push edi
  loc_0045327B: push eax
  loc_0045327C: call [00401074h] ; __vbaHresultCheckObj
  loc_00453282: mov edi, [004012B0h] ; __vbaFreeObj
  loc_00453288: lea ecx, var_28
  loc_0045328B: call edi
  loc_0045328D: mov ecx, [esi]
  loc_0045328F: push esi
  loc_00453290: call [ecx+00000300h]
  loc_00453296: lea edx, var_28
  loc_00453299: push eax
  loc_0045329A: push edx
  loc_0045329B: call ebx
  loc_0045329D: mov ecx, arg_C
  loc_004532A0: mov esi, eax
  loc_004532A2: mov dx, [ecx]
  loc_004532A5: mov eax, [esi]
  loc_004532A7: push edx
  loc_004532A8: push esi
  loc_004532A9: call [eax+0000008Ch]
  loc_004532AF: test eax, eax
  loc_004532B1: fnclex
  loc_004532B3: jge 004532C7h
  loc_004532B5: push 0000008Ch
  loc_004532BA: push 0041E5E8h
  loc_004532BF: push esi
  loc_004532C0: push eax
  loc_004532C1: call [00401074h] ; __vbaHresultCheckObj
  loc_004532C7: lea ecx, var_28
  loc_004532CA: call edi
  loc_004532CC: push 004532EDh
  loc_004532D1: jmp 004532ECh
  loc_004532D3: test var_4, 04h
  loc_004532D7: jz 004532E2h
  loc_004532D9: lea ecx, var_24
  loc_004532DC: call [00401020h] ; __vbaFreeVar
  loc_004532E2: lea ecx, var_28
  loc_004532E5: call [004012B0h] ; __vbaFreeObj
  loc_004532EB: ret
  loc_004532EC: ret
  loc_004532ED: mov eax, arg_10
  loc_004532F0: mov ecx, var_24
  loc_004532F3: mov edx, var_20
  loc_004532F6: pop edi
  loc_004532F7: mov [eax], ecx
  loc_004532F9: mov ecx, var_1C
  loc_004532FC: pop esi
  loc_004532FD: pop ebx
  loc_004532FE: mov [eax+00000004h], edx
  loc_00453301: mov edx, var_18
  loc_00453304: mov [eax+00000008h], ecx
  loc_00453307: mov ecx, var_14
  loc_0045330A: mov [eax+0000000Ch], edx
  loc_0045330D: xor eax, eax
  loc_0045330F: mov fs:[00000000h], ecx
  loc_00453316: mov esp, ebp
  loc_00453318: pop ebp
  loc_00453319: retn 000Ch
End Sub

Private Sub Proc_2_16_453320(arg_C, arg_10) '453320
  loc_00453320: push ebp
  loc_00453321: mov ebp, esp
  loc_00453323: sub esp, 0000000Ch
  loc_00453326: push 00403B36h ; __vbaExceptHandler
  loc_0045332B: mov eax, fs:[00000000h]
  loc_00453331: push eax
  loc_00453332: mov fs:[00000000h], esp
  loc_00453339: sub esp, 00000024h
  loc_0045333C: push ebx
  loc_0045333D: push esi
  loc_0045333E: push edi
  loc_0045333F: mov var_C, esp
  loc_00453342: mov var_8, 00401400h
  loc_00453349: mov ecx, arg_10
  loc_0045334C: mov esi, Me
  loc_0045334F: xor eax, eax
  loc_00453351: push esi
  loc_00453352: mov [ecx], eax
  loc_00453354: mov edx, [esi]
  loc_00453356: mov var_24, eax
  loc_00453359: mov var_28, eax
  loc_0045335C: call [edx+0000032Ch]
  loc_00453362: mov edi, [004010A0h] ; __vbaObjSet
  loc_00453368: push eax
  loc_00453369: lea eax, var_28
  loc_0045336C: push eax
  loc_0045336D: call edi
  loc_0045336F: mov ebx, arg_C
  loc_00453372: mov ecx, [eax]
  loc_00453374: mov var_2C, eax
  loc_00453377: mov dx, [ebx]
  loc_0045337A: not dx
  loc_0045337D: push edx
  loc_0045337E: push eax
  loc_0045337F: call [ecx+00000094h]
  loc_00453385: test eax, eax
  loc_00453387: fnclex
  loc_00453389: jge 004533A0h
  loc_0045338B: mov ecx, var_2C
  loc_0045338E: push 00000094h
  loc_00453393: push 0041EAACh
  loc_00453398: push ecx
  loc_00453399: push eax
  loc_0045339A: call [00401074h] ; __vbaHresultCheckObj
  loc_004533A0: lea ecx, var_28
  loc_004533A3: call [004012B0h] ; __vbaFreeObj
  loc_004533A9: mov edx, [esi]
  loc_004533AB: push esi
  loc_004533AC: call [edx+00000328h]
  loc_004533B2: push eax
  loc_004533B3: lea eax, var_28
  loc_004533B6: push eax
  loc_004533B7: call edi
  loc_004533B9: mov dx, [ebx]
  loc_004533BC: mov ecx, [eax]
  loc_004533BE: not dx
  loc_004533C1: push edx
  loc_004533C2: push eax
  loc_004533C3: mov var_2C, eax
  loc_004533C6: call [ecx+00000094h]
  loc_004533CC: test eax, eax
  loc_004533CE: fnclex
  loc_004533D0: jge 004533E7h
  loc_004533D2: mov ecx, var_2C
  loc_004533D5: push 00000094h
  loc_004533DA: push 0041EAACh
  loc_004533DF: push ecx
  loc_004533E0: push eax
  loc_004533E1: call [00401074h] ; __vbaHresultCheckObj
  loc_004533E7: lea ecx, var_28
  loc_004533EA: call [004012B0h] ; __vbaFreeObj
  loc_004533F0: mov edx, [esi]
  loc_004533F2: push esi
  loc_004533F3: call [edx+00000310h]
  loc_004533F9: push eax
  loc_004533FA: lea eax, var_28
  loc_004533FD: push eax
  loc_004533FE: call edi
  loc_00453400: mov dx, [ebx]
  loc_00453403: mov ecx, [eax]
  loc_00453405: push edx
  loc_00453406: push eax
  loc_00453407: mov var_2C, eax
  loc_0045340A: call [ecx+00000094h]
  loc_00453410: test eax, eax
  loc_00453412: fnclex
  loc_00453414: jge 0045342Bh
  loc_00453416: mov ecx, var_2C
  loc_00453419: push 00000094h
  loc_0045341E: push 0041EAACh
  loc_00453423: push ecx
  loc_00453424: push eax
  loc_00453425: call [00401074h] ; __vbaHresultCheckObj
  loc_0045342B: lea ecx, var_28
  loc_0045342E: call [004012B0h] ; __vbaFreeObj
  loc_00453434: mov edx, [esi]
  loc_00453436: push esi
  loc_00453437: call [edx+00000318h]
  loc_0045343D: push eax
  loc_0045343E: lea eax, var_28
  loc_00453441: push eax
  loc_00453442: call edi
  loc_00453444: mov dx, [ebx]
  loc_00453447: mov ecx, [eax]
  loc_00453449: push edx
  loc_0045344A: push eax
  loc_0045344B: mov var_2C, eax
  loc_0045344E: call [ecx+00000094h]
  loc_00453454: test eax, eax
  loc_00453456: fnclex
  loc_00453458: jge 0045346Fh
  loc_0045345A: mov ecx, var_2C
  loc_0045345D: push 00000094h
  loc_00453462: push 0041EAACh
  loc_00453467: push ecx
  loc_00453468: push eax
  loc_00453469: call [00401074h] ; __vbaHresultCheckObj
  loc_0045346F: lea ecx, var_28
  loc_00453472: call [004012B0h] ; __vbaFreeObj
  loc_00453478: mov edx, [esi]
  loc_0045347A: push esi
  loc_0045347B: call [edx+0000030Ch]
  loc_00453481: push eax
  loc_00453482: lea eax, var_28
  loc_00453485: push eax
  loc_00453486: call edi
  loc_00453488: mov dx, [ebx]
  loc_0045348B: mov ecx, [eax]
  loc_0045348D: push edx
  loc_0045348E: push eax
  loc_0045348F: mov var_2C, eax
  loc_00453492: call [ecx+00000094h]
  loc_00453498: test eax, eax
  loc_0045349A: fnclex
  loc_0045349C: jge 004534B3h
  loc_0045349E: mov ecx, var_2C
  loc_004534A1: push 00000094h
  loc_004534A6: push 0041EAACh
  loc_004534AB: push ecx
  loc_004534AC: push eax
  loc_004534AD: call [00401074h] ; __vbaHresultCheckObj
  loc_004534B3: lea ecx, var_28
  loc_004534B6: call [004012B0h] ; __vbaFreeObj
  loc_004534BC: mov edx, [esi]
  loc_004534BE: push esi
  loc_004534BF: call [edx+0000031Ch]
  loc_004534C5: push eax
  loc_004534C6: lea eax, var_28
  loc_004534C9: push eax
  loc_004534CA: call edi
  loc_004534CC: mov dx, [ebx]
  loc_004534CF: mov ecx, [eax]
  loc_004534D1: push edx
  loc_004534D2: push eax
  loc_004534D3: mov var_2C, eax
  loc_004534D6: call [ecx+00000094h]
  loc_004534DC: test eax, eax
  loc_004534DE: fnclex
  loc_004534E0: jge 004534F7h
  loc_004534E2: mov ecx, var_2C
  loc_004534E5: push 00000094h
  loc_004534EA: push 0041EAACh
  loc_004534EF: push ecx
  loc_004534F0: push eax
  loc_004534F1: call [00401074h] ; __vbaHresultCheckObj
  loc_004534F7: lea ecx, var_28
  loc_004534FA: call [004012B0h] ; __vbaFreeObj
  loc_00453500: mov edx, [esi]
  loc_00453502: push esi
  loc_00453503: call [edx+000002FCh]
  loc_00453509: push eax
  loc_0045350A: lea eax, var_28
  loc_0045350D: push eax
  loc_0045350E: call edi
  loc_00453510: mov dx, [ebx]
  loc_00453513: mov ecx, [eax]
  loc_00453515: push edx
  loc_00453516: push eax
  loc_00453517: mov var_2C, eax
  loc_0045351A: call [ecx+00000094h]
  loc_00453520: test eax, eax
  loc_00453522: fnclex
  loc_00453524: jge 0045353Bh
  loc_00453526: mov ecx, var_2C
  loc_00453529: push 00000094h
  loc_0045352E: push 0041EAACh
  loc_00453533: push ecx
  loc_00453534: push eax
  loc_00453535: call [00401074h] ; __vbaHresultCheckObj
  loc_0045353B: lea ecx, var_28
  loc_0045353E: call [004012B0h] ; __vbaFreeObj
  loc_00453544: mov edx, [esi]
  loc_00453546: push esi
  loc_00453547: call [edx+00000314h]
  loc_0045354D: push eax
  loc_0045354E: lea eax, var_28
  loc_00453551: push eax
  loc_00453552: call edi
  loc_00453554: mov dx, [ebx]
  loc_00453557: mov esi, eax
  loc_00453559: push edx
  loc_0045355A: push esi
  loc_0045355B: mov ecx, [esi]
  loc_0045355D: call [ecx+00000094h]
  loc_00453563: test eax, eax
  loc_00453565: fnclex
  loc_00453567: jge 0045357Bh
  loc_00453569: push 00000094h
  loc_0045356E: push 0041EAACh
  loc_00453573: push esi
  loc_00453574: push eax
  loc_00453575: call [00401074h] ; __vbaHresultCheckObj
  loc_0045357B: lea ecx, var_28
  loc_0045357E: call [004012B0h] ; __vbaFreeObj
  loc_00453584: push 004535A5h
  loc_00453589: jmp 004535A4h
  loc_0045358B: test var_4, 04h
  loc_0045358F: jz 0045359Ah
  loc_00453591: lea ecx, var_24
  loc_00453594: call [00401020h] ; __vbaFreeVar
  loc_0045359A: lea ecx, var_28
  loc_0045359D: call [004012B0h] ; __vbaFreeObj
  loc_004535A3: ret
  loc_004535A4: ret
  loc_004535A5: mov eax, arg_10
  loc_004535A8: mov ecx, var_24
  loc_004535AB: mov edx, var_20
  loc_004535AE: pop edi
  loc_004535AF: mov [eax], ecx
  loc_004535B1: mov ecx, var_1C
  loc_004535B4: pop esi
  loc_004535B5: pop ebx
  loc_004535B6: mov [eax+00000004h], edx
  loc_004535B9: mov edx, var_18
  loc_004535BC: mov [eax+00000008h], ecx
  loc_004535BF: mov ecx, var_14
  loc_004535C2: mov [eax+0000000Ch], edx
  loc_004535C5: xor eax, eax
  loc_004535C7: mov fs:[00000000h], ecx
  loc_004535CE: mov esp, ebp
  loc_004535D0: pop ebp
  loc_004535D1: retn 000Ch
End Sub

Private Sub Proc_2_17_4536F0() '4536F0
  loc_004536F0: push ebp
  loc_004536F1: mov ebp, esp
  loc_004536F3: sub esp, 00000008h
  loc_004536F6: push 00403B36h ; __vbaExceptHandler
  loc_004536FB: mov eax, fs:[00000000h]
  loc_00453701: push eax
  loc_00453702: mov fs:[00000000h], esp
  loc_00453709: sub esp, 00000110h
  loc_0045370F: push ebx
  loc_00453710: push esi
  loc_00453711: push edi
  loc_00453712: mov var_8, esp
  loc_00453715: mov var_4, 00401420h
  loc_0045371C: mov ebx, Me
  loc_0045371F: xor edi, edi
  loc_00453721: push ebx
  loc_00453722: mov var_14, edi
  loc_00453725: mov eax, [ebx]
  loc_00453727: mov var_18, edi
  loc_0045372A: mov var_1C, edi
  loc_0045372D: mov var_20, edi
  loc_00453730: mov var_30, edi
  loc_00453733: mov var_40, edi
  loc_00453736: mov var_50, edi
  loc_00453739: mov var_60, edi
  loc_0045373C: mov var_70, edi
  loc_0045373F: mov var_80, edi
  loc_00453742: mov var_90, edi
  loc_00453748: mov var_A0, edi
  loc_0045374E: mov var_C0, edi
  loc_00453754: mov var_A8, 0041F154h ; "Delete * From AgentThai Where AgentName='"
  loc_0045375E: mov var_B0, 00000008h
  loc_00453768: call [eax+00000324h]
  loc_0045376E: lea ecx, var_1C
  loc_00453771: push eax
  loc_00453772: push ecx
  loc_00453773: call [004010A0h] ; __vbaObjSet
  loc_00453779: mov esi, eax
  loc_0045377B: lea eax, var_14
  loc_0045377E: push eax
  loc_0045377F: push esi
  loc_00453780: mov edx, [esi]
  loc_00453782: call [edx+000000A0h]
  loc_00453788: cmp eax, edi
  loc_0045378A: fnclex
  loc_0045378C: jge 004537A0h
  loc_0045378E: push 000000A0h
  loc_00453793: push 0041E5E8h
  loc_00453798: push esi
  loc_00453799: push eax
  loc_0045379A: call [00401074h] ; __vbaHresultCheckObj
  loc_004537A0: mov eax, var_14
  loc_004537A3: lea ecx, var_30
  loc_004537A6: lea edx, var_40
  loc_004537A9: mov esi, 00000008h
  loc_004537AE: push ecx
  loc_004537AF: push edx
  loc_004537B0: mov var_14, edi
  loc_004537B3: mov var_28, eax
  loc_004537B6: mov var_30, esi
  loc_004537B9: call [004010D4h] ; rtcTrimVar
  loc_004537BF: mov eax, [0061A13Ch]
  loc_004537C4: mov edx, var_CC
  loc_004537CA: sub esp, 00000010h
  loc_004537CD: mov var_B8, 0041E890h ; "'"
  loc_004537D7: mov var_C0, esi
  loc_004537DD: mov esi, [eax]
  loc_004537DF: mov ecx, esp
  loc_004537E1: mov eax, 0000000Ah
  loc_004537E6: mov [ecx], eax
  loc_004537E8: mov eax, 80020004h
  loc_004537ED: mov [ecx+00000004h], edx
  loc_004537F0: lea edx, var_40
  loc_004537F3: mov [ecx+00000008h], eax
  loc_004537F6: mov eax, var_C4
  loc_004537FC: mov [ecx+0000000Ch], eax
  loc_004537FF: lea ecx, var_B0
  loc_00453805: push ecx
  loc_00453806: lea eax, var_50
  loc_00453809: push edx
  loc_0045380A: push eax
  loc_0045380B: call [004011B4h] ; __vbaVarCat
  loc_00453811: lea ecx, var_C0
  loc_00453817: push eax
  loc_00453818: lea edx, var_60
  loc_0045381B: push ecx
  loc_0045381C: push edx
  loc_0045381D: call [004011B4h] ; __vbaVarCat
  loc_00453823: push eax
  loc_00453824: lea eax, var_18
  loc_00453827: push eax
  loc_00453828: call [004011B0h] ; __vbaStrVarVal
  loc_0045382E: mov ecx, [0061A13Ch]
  loc_00453834: push eax
  loc_00453835: push ecx
  loc_00453836: call [esi+0000005Ch]
  loc_00453839: cmp eax, edi
  loc_0045383B: fnclex
  loc_0045383D: jge 00453854h
  loc_0045383F: mov edx, [0061A13Ch]
  loc_00453845: push 0000005Ch
  loc_00453847: push 0041E928h
  loc_0045384C: push edx
  loc_0045384D: push eax
  loc_0045384E: call [00401074h] ; __vbaHresultCheckObj
  loc_00453854: lea ecx, var_18
  loc_00453857: call [004012ACh] ; __vbaFreeStr
  loc_0045385D: lea ecx, var_1C
  loc_00453860: call [004012B0h] ; __vbaFreeObj
  loc_00453866: lea eax, var_60
  loc_00453869: lea ecx, var_50
  loc_0045386C: push eax
  loc_0045386D: lea edx, var_40
  loc_00453870: push ecx
  loc_00453871: lea eax, var_30
  loc_00453874: push edx
  loc_00453875: push eax
  loc_00453876: push 00000004h
  loc_00453878: call [00401038h] ; __vbaFreeVarList
  loc_0045387E: add esp, 00000014h
  loc_00453881: lea esi, var_1C
  loc_00453884: mov ecx, 0000000Ah
  loc_00453889: mov eax, 80020004h
  loc_0045388E: push esi
  loc_0045388F: mov var_C0, ecx
  loc_00453895: sub esp, 00000010h
  loc_00453898: mov var_B8, eax
  loc_0045389E: mov esi, esp
  loc_004538A0: sub esp, 00000010h
  loc_004538A3: mov var_B0, 00000003h
  loc_004538AD: mov edx, [0061A13Ch]
  loc_004538B3: mov [esi], ecx
  loc_004538B5: mov ecx, var_CC
  loc_004538BB: mov var_A8, 00000002h
  loc_004538C5: mov edx, [edx]
  loc_004538C7: mov [esi+00000004h], ecx
  loc_004538CA: mov ecx, esp
  loc_004538CC: sub esp, 00000010h
  loc_004538CF: mov [esi+00000008h], eax
  loc_004538D2: mov eax, var_C4
  loc_004538D8: mov [esi+0000000Ch], eax
  loc_004538DB: mov eax, var_C0
  loc_004538E1: mov [ecx], eax
  loc_004538E3: mov eax, var_BC
  loc_004538E9: mov [ecx+00000004h], eax
  loc_004538EC: mov eax, var_B8
  loc_004538F2: mov [ecx+00000008h], eax
  loc_004538F5: mov eax, var_B4
  loc_004538FB: mov [ecx+0000000Ch], eax
  loc_004538FE: mov eax, var_B0
  loc_00453904: mov ecx, esp
  loc_00453906: push 0041F1ACh ; "Select * From AgentThai"
  loc_0045390B: mov [ecx], eax
  loc_0045390D: mov eax, var_AC
  loc_00453913: mov [ecx+00000004h], eax
  loc_00453916: mov eax, var_A8
  loc_0045391C: mov [ecx+00000008h], eax
  loc_0045391F: mov eax, var_A4
  loc_00453925: mov [ecx+0000000Ch], eax
  loc_00453928: mov ecx, [0061A13Ch]
  loc_0045392E: push ecx
  loc_0045392F: call [edx+000000BCh]
  loc_00453935: cmp eax, edi
  loc_00453937: fnclex
  loc_00453939: jge 00453953h
  loc_0045393B: mov edx, [0061A13Ch]
  loc_00453941: push 000000BCh
  loc_00453946: push 0041E928h
  loc_0045394B: push edx
  loc_0045394C: push eax
  loc_0045394D: call [00401074h] ; __vbaHresultCheckObj
  loc_00453953: mov eax, var_1C
  loc_00453956: lea esi, [ebx+00000034h]
  loc_00453959: push eax
  loc_0045395A: push esi
  loc_0045395B: call [004010B8h] ; __vbaObjSetAddref
  loc_00453961: lea ecx, var_1C
  loc_00453964: call [004012B0h] ; __vbaFreeObj
  loc_0045396A: mov eax, [esi]
  loc_0045396C: push eax
  loc_0045396D: mov ecx, [eax]
  loc_0045396F: call [ecx+000000C0h]
  loc_00453975: cmp eax, edi
  loc_00453977: fnclex
  loc_00453979: jge 0045398Fh
  loc_0045397B: mov edx, [esi]
  loc_0045397D: push 000000C0h
  loc_00453982: push 0041E938h
  loc_00453987: push edx
  loc_00453988: push eax
  loc_00453989: call [00401074h] ; __vbaHresultCheckObj
  loc_0045398F: mov eax, [ebx]
  loc_00453991: push ebx
  loc_00453992: call [eax+00000324h]
  loc_00453998: lea ecx, var_1C
  loc_0045399B: push eax
  loc_0045399C: push ecx
  loc_0045399D: call [004010A0h] ; __vbaObjSet
  loc_004539A3: mov edx, [eax]
  loc_004539A5: lea ecx, var_14
  loc_004539A8: push ecx
  loc_004539A9: push eax
  loc_004539AA: mov var_E4, eax
  loc_004539B0: call [edx+000000A0h]
  loc_004539B6: cmp eax, edi
  loc_004539B8: fnclex
  loc_004539BA: jge 004539D4h
  loc_004539BC: mov edx, var_E4
  loc_004539C2: push 000000A0h
  loc_004539C7: push 0041E5E8h
  loc_004539CC: push edx
  loc_004539CD: push eax
  loc_004539CE: call [00401074h] ; __vbaHresultCheckObj
  loc_004539D4: mov eax, var_14
  loc_004539D7: lea ecx, var_40
  loc_004539DA: mov var_28, eax
  loc_004539DD: lea eax, var_30
  loc_004539E0: push eax
  loc_004539E1: push ecx
  loc_004539E2: mov var_14, edi
  loc_004539E5: mov var_30, 00000008h
  loc_004539EC: call [004010D4h] ; rtcTrimVar
  loc_004539F2: mov eax, [esi]
  loc_004539F4: mov ecx, var_40
  loc_004539F7: mov var_A8, 0041EB18h ; "AgentName"
  loc_00453A01: mov var_B0, 00000008h
  loc_00453A0B: mov edx, [eax]
  loc_00453A0D: sub esp, 00000010h
  loc_00453A10: mov eax, esp
  loc_00453A12: sub esp, 00000010h
  loc_00453A15: mov [eax], ecx
  loc_00453A17: mov ecx, var_3C
  loc_00453A1A: mov [eax+00000004h], ecx
  loc_00453A1D: mov ecx, var_38
  loc_00453A20: mov [eax+00000008h], ecx
  loc_00453A23: mov ecx, var_34
  loc_00453A26: mov [eax+0000000Ch], ecx
  loc_00453A29: mov ecx, var_B0
  loc_00453A2F: mov eax, esp
  loc_00453A31: mov [eax], ecx
  loc_00453A33: mov ecx, var_AC
  loc_00453A39: mov [eax+00000004h], ecx
  loc_00453A3C: mov ecx, var_A8
  loc_00453A42: mov [eax+00000008h], ecx
  loc_00453A45: mov ecx, var_A4
  loc_00453A4B: mov [eax+0000000Ch], ecx
  loc_00453A4E: mov eax, [esi]
  loc_00453A50: push eax
  loc_00453A51: call [edx+00000128h]
  loc_00453A57: cmp eax, edi
  loc_00453A59: fnclex
  loc_00453A5B: jge 00453A71h
  loc_00453A5D: mov edx, [esi]
  loc_00453A5F: push 00000128h
  loc_00453A64: push 0041E938h
  loc_00453A69: push edx
  loc_00453A6A: push eax
  loc_00453A6B: call [00401074h] ; __vbaHresultCheckObj
  loc_00453A71: lea ecx, var_1C
  loc_00453A74: call [004012B0h] ; __vbaFreeObj
  loc_00453A7A: lea eax, var_40
  loc_00453A7D: lea ecx, var_30
  loc_00453A80: push eax
  loc_00453A81: push ecx
  loc_00453A82: push 00000002h
  loc_00453A84: call [00401038h] ; __vbaFreeVarList
  loc_00453A8A: mov edx, [ebx]
  loc_00453A8C: add esp, 0000000Ch
  loc_00453A8F: push ebx
  loc_00453A90: call [edx+00000320h]
  loc_00453A96: push eax
  loc_00453A97: lea eax, var_1C
  loc_00453A9A: push eax
  loc_00453A9B: call [004010A0h] ; __vbaObjSet
  loc_00453AA1: mov ecx, [eax]
  loc_00453AA3: lea edx, var_14
  loc_00453AA6: push edx
  loc_00453AA7: push eax
  loc_00453AA8: mov var_E4, eax
  loc_00453AAE: call [ecx+000000A0h]
  loc_00453AB4: cmp eax, edi
  loc_00453AB6: fnclex
  loc_00453AB8: jge 00453AD2h
  loc_00453ABA: mov ecx, var_E4
  loc_00453AC0: push 000000A0h
  loc_00453AC5: push 0041E5E8h
  loc_00453ACA: push ecx
  loc_00453ACB: push eax
  loc_00453ACC: call [00401074h] ; __vbaHresultCheckObj
  loc_00453AD2: mov eax, var_14
  loc_00453AD5: lea edx, var_30
  loc_00453AD8: mov var_28, eax
  loc_00453ADB: lea eax, var_40
  loc_00453ADE: push edx
  loc_00453ADF: push eax
  loc_00453AE0: mov var_14, edi
  loc_00453AE3: mov var_30, 00000008h
  loc_00453AEA: call [004010D4h] ; rtcTrimVar
  loc_00453AF0: mov ecx, [ebx]
  loc_00453AF2: push ebx
  loc_00453AF3: call [ecx+00000320h]
  loc_00453AF9: lea edx, var_20
  loc_00453AFC: push eax
  loc_00453AFD: push edx
  loc_00453AFE: call [004010A0h] ; __vbaObjSet
  loc_00453B04: mov ecx, [eax]
  loc_00453B06: lea edx, var_18
  loc_00453B09: push edx
  loc_00453B0A: push eax
  loc_00453B0B: mov var_EC, eax
  loc_00453B11: call [ecx+000000A0h]
  loc_00453B17: cmp eax, edi
  loc_00453B19: fnclex
  loc_00453B1B: jge 00453B35h
  loc_00453B1D: mov ecx, var_EC
  loc_00453B23: push 000000A0h
  loc_00453B28: push 0041E5E8h
  loc_00453B2D: push ecx
  loc_00453B2E: push eax
  loc_00453B2F: call [00401074h] ; __vbaHresultCheckObj
  loc_00453B35: mov eax, var_18
  loc_00453B38: lea edx, var_60
  loc_00453B3B: mov var_58, eax
  loc_00453B3E: lea eax, var_70
  loc_00453B41: push edx
  loc_00453B42: push eax
  loc_00453B43: mov var_18, edi
  loc_00453B46: mov var_60, 00000008h
  loc_00453B4D: call [004010D4h] ; rtcTrimVar
  loc_00453B53: lea edx, var_C0
  loc_00453B59: lea ecx, var_90
  loc_00453B5F: mov var_B8, 0041F1E0h ; "-"
  loc_00453B69: mov var_C0, 00000008h
  loc_00453B73: call [00401240h] ; __vbaVarDup
  loc_00453B79: lea ecx, var_40
  loc_00453B7C: lea edx, var_B0
  loc_00453B82: push ecx
  loc_00453B83: lea eax, var_50
  loc_00453B86: push edx
  loc_00453B87: push eax
  loc_00453B88: mov var_A8, 0041E5D4h
  loc_00453B92: mov var_B0, 00008008h
  loc_00453B9C: call [00401050h] ; __vbaVarCmpNe
  loc_00453BA2: mov edx, eax
  loc_00453BA4: lea ecx, var_80
  loc_00453BA7: call [00401014h] ; __vbaVarMove
  loc_00453BAD: lea ecx, var_90
  loc_00453BB3: lea edx, var_70
  loc_00453BB6: push ecx
  loc_00453BB7: lea eax, var_80
  loc_00453BBA: push edx
  loc_00453BBB: lea ecx, var_A0
  loc_00453BC1: push eax
  loc_00453BC2: push ecx
  loc_00453BC3: call [004011F0h] ; rtcImmediateIf
  loc_00453BC9: mov eax, [esi]
  loc_00453BCB: mov ecx, var_A0
  loc_00453BD1: sub esp, 00000010h
  loc_00453BD4: mov edx, [eax]
  loc_00453BD6: mov eax, esp
  loc_00453BD8: sub esp, 00000010h
  loc_00453BDB: mov [eax], ecx
  loc_00453BDD: mov ecx, var_9C
  loc_00453BE3: mov [eax+00000004h], ecx
  loc_00453BE6: mov ecx, var_98
  loc_00453BEC: mov [eax+00000008h], ecx
  loc_00453BEF: mov ecx, var_94
  loc_00453BF5: mov [eax+0000000Ch], ecx
  loc_00453BF8: mov ecx, esp
  loc_00453BFA: mov eax, 00000008h
  loc_00453BFF: mov [ecx], eax
  loc_00453C01: mov eax, var_CC
  loc_00453C07: mov [ecx+00000004h], eax
  loc_00453C0A: mov eax, 0041F1E8h ; "Address"
  loc_00453C0F: mov [ecx+00000008h], eax
  loc_00453C12: mov eax, var_C4
  loc_00453C18: mov [ecx+0000000Ch], eax
  loc_00453C1B: mov eax, [esi]
  loc_00453C1D: push eax
  loc_00453C1E: call [edx+00000128h]
  loc_00453C24: cmp eax, edi
  loc_00453C26: fnclex
  loc_00453C28: jge 00453C3Eh
  loc_00453C2A: mov ecx, [esi]
  loc_00453C2C: push 00000128h
  loc_00453C31: push 0041E938h
  loc_00453C36: push ecx
  loc_00453C37: push eax
  loc_00453C38: call [00401074h] ; __vbaHresultCheckObj
  loc_00453C3E: lea edx, var_20
  loc_00453C41: lea eax, var_1C
  loc_00453C44: push edx
  loc_00453C45: push eax
  loc_00453C46: push 00000002h
  loc_00453C48: call [00401040h] ; __vbaFreeObjList
  loc_00453C4E: lea ecx, var_A0
  loc_00453C54: lea edx, var_90
  loc_00453C5A: push ecx
  loc_00453C5B: lea eax, var_70
  loc_00453C5E: push edx
  loc_00453C5F: lea ecx, var_80
  loc_00453C62: push eax
  loc_00453C63: lea edx, var_60
  loc_00453C66: push ecx
  loc_00453C67: lea eax, var_40
  loc_00453C6A: push edx
  loc_00453C6B: lea ecx, var_30
  loc_00453C6E: push eax
  loc_00453C6F: push ecx
  loc_00453C70: push 00000007h
  loc_00453C72: call [00401038h] ; __vbaFreeVarList
  loc_00453C78: mov edx, [ebx]
  loc_00453C7A: add esp, 0000002Ch
  loc_00453C7D: push ebx
  loc_00453C7E: call [edx+00000308h]
  loc_00453C84: push eax
  loc_00453C85: lea eax, var_1C
  loc_00453C88: push eax
  loc_00453C89: call [004010A0h] ; __vbaObjSet
  loc_00453C8F: mov ecx, [eax]
  loc_00453C91: lea edx, var_14
  loc_00453C94: push edx
  loc_00453C95: push eax
  loc_00453C96: mov var_E4, eax
  loc_00453C9C: call [ecx+000000A0h]
  loc_00453CA2: cmp eax, edi
  loc_00453CA4: fnclex
  loc_00453CA6: jge 00453CC0h
  loc_00453CA8: mov ecx, var_E4
  loc_00453CAE: push 000000A0h
  loc_00453CB3: push 0041E5E8h
  loc_00453CB8: push ecx
  loc_00453CB9: push eax
  loc_00453CBA: call [00401074h] ; __vbaHresultCheckObj
  loc_00453CC0: mov eax, var_14
  loc_00453CC3: lea edx, var_30
  loc_00453CC6: mov var_28, eax
  loc_00453CC9: lea eax, var_40
  loc_00453CCC: push edx
  loc_00453CCD: push eax
  loc_00453CCE: mov var_14, edi
  loc_00453CD1: mov var_30, 00000008h
  loc_00453CD8: call [004010D4h] ; rtcTrimVar
  loc_00453CDE: mov ecx, [ebx]
  loc_00453CE0: push ebx
  loc_00453CE1: call [ecx+00000308h]
  loc_00453CE7: lea edx, var_20
  loc_00453CEA: push eax
  loc_00453CEB: push edx
  loc_00453CEC: call [004010A0h] ; __vbaObjSet
  loc_00453CF2: mov ecx, [eax]
  loc_00453CF4: lea edx, var_18
  loc_00453CF7: push edx
  loc_00453CF8: push eax
  loc_00453CF9: mov var_EC, eax
  loc_00453CFF: call [ecx+000000A0h]
  loc_00453D05: cmp eax, edi
  loc_00453D07: fnclex
  loc_00453D09: jge 00453D23h
  loc_00453D0B: mov ecx, var_EC
  loc_00453D11: push 000000A0h
  loc_00453D16: push 0041E5E8h
  loc_00453D1B: push ecx
  loc_00453D1C: push eax
  loc_00453D1D: call [00401074h] ; __vbaHresultCheckObj
  loc_00453D23: mov eax, var_18
  loc_00453D26: lea edx, var_60
  loc_00453D29: mov var_58, eax
  loc_00453D2C: lea eax, var_70
  loc_00453D2F: push edx
  loc_00453D30: push eax
  loc_00453D31: mov var_18, edi
  loc_00453D34: mov var_60, 00000008h
  loc_00453D3B: call [004010D4h] ; rtcTrimVar
  loc_00453D41: lea edx, var_C0
  loc_00453D47: lea ecx, var_90
  loc_00453D4D: mov var_B8, 0041F1E0h ; "-"
  loc_00453D57: mov var_C0, 00000008h
  loc_00453D61: call [00401240h] ; __vbaVarDup
  loc_00453D67: lea ecx, var_40
  loc_00453D6A: lea edx, var_B0
  loc_00453D70: push ecx
  loc_00453D71: lea eax, var_50
  loc_00453D74: push edx
  loc_00453D75: push eax
  loc_00453D76: mov var_A8, 0041E5D4h
  loc_00453D80: mov var_B0, 00008008h
  loc_00453D8A: call [00401050h] ; __vbaVarCmpNe
  loc_00453D90: mov edx, eax
  loc_00453D92: lea ecx, var_80
  loc_00453D95: call [00401014h] ; __vbaVarMove
  loc_00453D9B: lea ecx, var_90
  loc_00453DA1: lea edx, var_70
  loc_00453DA4: push ecx
  loc_00453DA5: lea eax, var_80
  loc_00453DA8: push edx
  loc_00453DA9: lea ecx, var_A0
  loc_00453DAF: push eax
  loc_00453DB0: push ecx
  loc_00453DB1: call [004011F0h] ; rtcImmediateIf
  loc_00453DB7: mov eax, [esi]
  loc_00453DB9: mov ecx, var_A0
  loc_00453DBF: sub esp, 00000010h
  loc_00453DC2: mov edx, [eax]
  loc_00453DC4: mov eax, esp
  loc_00453DC6: sub esp, 00000010h
  loc_00453DC9: mov [eax], ecx
  loc_00453DCB: mov ecx, var_9C
  loc_00453DD1: mov [eax+00000004h], ecx
  loc_00453DD4: mov ecx, var_98
  loc_00453DDA: mov [eax+00000008h], ecx
  loc_00453DDD: mov ecx, var_94
  loc_00453DE3: mov [eax+0000000Ch], ecx
  loc_00453DE6: mov ecx, esp
  loc_00453DE8: mov eax, 00000008h
  loc_00453DED: mov [ecx], eax
  loc_00453DEF: mov eax, var_CC
  loc_00453DF5: mov [ecx+00000004h], eax
  loc_00453DF8: mov eax, 0041F1FCh ; "Phone"
  loc_00453DFD: mov [ecx+00000008h], eax
  loc_00453E00: mov eax, var_C4
  loc_00453E06: mov [ecx+0000000Ch], eax
  loc_00453E09: mov eax, [esi]
  loc_00453E0B: push eax
  loc_00453E0C: call [edx+00000128h]
  loc_00453E12: cmp eax, edi
  loc_00453E14: fnclex
  loc_00453E16: jge 00453E2Ch
  loc_00453E18: mov ecx, [esi]
  loc_00453E1A: push 00000128h
  loc_00453E1F: push 0041E938h
  loc_00453E24: push ecx
  loc_00453E25: push eax
  loc_00453E26: call [00401074h] ; __vbaHresultCheckObj
  loc_00453E2C: lea edx, var_20
  loc_00453E2F: lea eax, var_1C
  loc_00453E32: push edx
  loc_00453E33: push eax
  loc_00453E34: push 00000002h
  loc_00453E36: call [00401040h] ; __vbaFreeObjList
  loc_00453E3C: lea ecx, var_A0
  loc_00453E42: lea edx, var_90
  loc_00453E48: push ecx
  loc_00453E49: lea eax, var_70
  loc_00453E4C: push edx
  loc_00453E4D: lea ecx, var_80
  loc_00453E50: push eax
  loc_00453E51: lea edx, var_60
  loc_00453E54: push ecx
  loc_00453E55: lea eax, var_40
  loc_00453E58: push edx
  loc_00453E59: lea ecx, var_30
  loc_00453E5C: push eax
  loc_00453E5D: push ecx
  loc_00453E5E: push 00000007h
  loc_00453E60: call [00401038h] ; __vbaFreeVarList
  loc_00453E66: mov edx, [ebx]
  loc_00453E68: add esp, 0000002Ch
  loc_00453E6B: push ebx
  loc_00453E6C: call [edx+00000304h]
  loc_00453E72: push eax
  loc_00453E73: lea eax, var_1C
  loc_00453E76: push eax
  loc_00453E77: call [004010A0h] ; __vbaObjSet
  loc_00453E7D: mov ecx, [eax]
  loc_00453E7F: lea edx, var_14
  loc_00453E82: push edx
  loc_00453E83: push eax
  loc_00453E84: mov var_E4, eax
  loc_00453E8A: call [ecx+000000A0h]
  loc_00453E90: cmp eax, edi
  loc_00453E92: fnclex
  loc_00453E94: jge 00453EAEh
  loc_00453E96: mov ecx, var_E4
  loc_00453E9C: push 000000A0h
  loc_00453EA1: push 0041E5E8h
  loc_00453EA6: push ecx
  loc_00453EA7: push eax
  loc_00453EA8: call [00401074h] ; __vbaHresultCheckObj
  loc_00453EAE: mov eax, var_14
  loc_00453EB1: lea edx, var_30
  loc_00453EB4: mov var_28, eax
  loc_00453EB7: lea eax, var_40
  loc_00453EBA: push edx
  loc_00453EBB: push eax
  loc_00453EBC: mov var_14, edi
  loc_00453EBF: mov var_30, 00000008h
  loc_00453EC6: call [004010D4h] ; rtcTrimVar
  loc_00453ECC: mov ecx, [ebx]
  loc_00453ECE: push ebx
  loc_00453ECF: call [ecx+00000304h]
  loc_00453ED5: lea edx, var_20
  loc_00453ED8: push eax
  loc_00453ED9: push edx
  loc_00453EDA: call [004010A0h] ; __vbaObjSet
  loc_00453EE0: mov ecx, [eax]
  loc_00453EE2: lea edx, var_18
  loc_00453EE5: push edx
  loc_00453EE6: push eax
  loc_00453EE7: mov var_EC, eax
  loc_00453EED: call [ecx+000000A0h]
  loc_00453EF3: cmp eax, edi
  loc_00453EF5: fnclex
  loc_00453EF7: jge 00453F11h
  loc_00453EF9: mov ecx, var_EC
  loc_00453EFF: push 000000A0h
  loc_00453F04: push 0041E5E8h
  loc_00453F09: push ecx
  loc_00453F0A: push eax
  loc_00453F0B: call [00401074h] ; __vbaHresultCheckObj
  loc_00453F11: mov eax, var_18
  loc_00453F14: lea edx, var_60
  loc_00453F17: mov var_58, eax
  loc_00453F1A: lea eax, var_70
  loc_00453F1D: push edx
  loc_00453F1E: push eax
  loc_00453F1F: mov var_18, edi
  loc_00453F22: mov var_60, 00000008h
  loc_00453F29: call [004010D4h] ; rtcTrimVar
  loc_00453F2F: lea edx, var_C0
  loc_00453F35: lea ecx, var_90
  loc_00453F3B: mov var_B8, 0041EDF8h
  loc_00453F45: mov var_C0, 00000008h
  loc_00453F4F: call [00401240h] ; __vbaVarDup
  loc_00453F55: lea ecx, var_40
  loc_00453F58: lea edx, var_B0
  loc_00453F5E: push ecx
  loc_00453F5F: lea eax, var_50
  loc_00453F62: push edx
  loc_00453F63: push eax
  loc_00453F64: mov var_A8, 0041E5D4h
  loc_00453F6E: mov var_B0, 00008008h
  loc_00453F78: call [00401050h] ; __vbaVarCmpNe
  loc_00453F7E: mov edx, eax
  loc_00453F80: lea ecx, var_80
  loc_00453F83: call [00401014h] ; __vbaVarMove
  loc_00453F89: lea ecx, var_90
  loc_00453F8F: lea edx, var_70
  loc_00453F92: push ecx
  loc_00453F93: lea eax, var_80
  loc_00453F96: push edx
  loc_00453F97: lea ecx, var_A0
  loc_00453F9D: push eax
  loc_00453F9E: push ecx
  loc_00453F9F: call [004011F0h] ; rtcImmediateIf
  loc_00453FA5: mov eax, [esi]
  loc_00453FA7: mov ecx, var_A0
  loc_00453FAD: sub esp, 00000010h
  loc_00453FB0: mov edx, [eax]
  loc_00453FB2: mov eax, esp
  loc_00453FB4: sub esp, 00000010h
  loc_00453FB7: mov [eax], ecx
  loc_00453FB9: mov ecx, var_9C
  loc_00453FBF: mov [eax+00000004h], ecx
  loc_00453FC2: mov ecx, var_98
  loc_00453FC8: mov [eax+00000008h], ecx
  loc_00453FCB: mov ecx, var_94
  loc_00453FD1: mov [eax+0000000Ch], ecx
  loc_00453FD4: mov ecx, esp
  loc_00453FD6: mov eax, 00000008h
  loc_00453FDB: mov [ecx], eax
  loc_00453FDD: mov eax, var_CC
  loc_00453FE3: mov [ecx+00000004h], eax
  loc_00453FE6: mov eax, 0041F20Ch ; "Commision"
  loc_00453FEB: mov [ecx+00000008h], eax
  loc_00453FEE: mov eax, var_C4
  loc_00453FF4: mov [ecx+0000000Ch], eax
  loc_00453FF7: mov eax, [esi]
  loc_00453FF9: push eax
  loc_00453FFA: call [edx+00000128h]
  loc_00454000: cmp eax, edi
  loc_00454002: fnclex
  loc_00454004: jge 0045401Ah
  loc_00454006: mov ecx, [esi]
  loc_00454008: push 00000128h
  loc_0045400D: push 0041E938h
  loc_00454012: push ecx
  loc_00454013: push eax
  loc_00454014: call [00401074h] ; __vbaHresultCheckObj
  loc_0045401A: lea edx, var_20
  loc_0045401D: lea eax, var_1C
  loc_00454020: push edx
  loc_00454021: push eax
  loc_00454022: push 00000002h
  loc_00454024: call [00401040h] ; __vbaFreeObjList
  loc_0045402A: lea ecx, var_A0
  loc_00454030: lea edx, var_90
  loc_00454036: push ecx
  loc_00454037: lea eax, var_70
  loc_0045403A: push edx
  loc_0045403B: lea ecx, var_80
  loc_0045403E: push eax
  loc_0045403F: lea edx, var_60
  loc_00454042: push ecx
  loc_00454043: lea eax, var_40
  loc_00454046: push edx
  loc_00454047: lea ecx, var_30
  loc_0045404A: push eax
  loc_0045404B: push ecx
  loc_0045404C: push 00000007h
  loc_0045404E: call [00401038h] ; __vbaFreeVarList
  loc_00454054: mov edx, [ebx]
  loc_00454056: add esp, 0000002Ch
  loc_00454059: push ebx
  loc_0045405A: call [edx+00000300h]
  loc_00454060: push eax
  loc_00454061: lea eax, var_1C
  loc_00454064: push eax
  loc_00454065: call [004010A0h] ; __vbaObjSet
  loc_0045406B: mov ecx, [eax]
  loc_0045406D: lea edx, var_14
  loc_00454070: push edx
  loc_00454071: push eax
  loc_00454072: mov var_E4, eax
  loc_00454078: call [ecx+000000A0h]
  loc_0045407E: cmp eax, edi
  loc_00454080: fnclex
  loc_00454082: jge 0045409Ch
  loc_00454084: mov ecx, var_E4
  loc_0045408A: push 000000A0h
  loc_0045408F: push 0041E5E8h
  loc_00454094: push ecx
  loc_00454095: push eax
  loc_00454096: call [00401074h] ; __vbaHresultCheckObj
  loc_0045409C: mov eax, var_14
  loc_0045409F: lea edx, var_30
  loc_004540A2: mov var_28, eax
  loc_004540A5: lea eax, var_40
  loc_004540A8: push edx
  loc_004540A9: push eax
  loc_004540AA: mov var_14, edi
  loc_004540AD: mov var_30, 00000008h
  loc_004540B4: call [004010D4h] ; rtcTrimVar
  loc_004540BA: mov ecx, [ebx]
  loc_004540BC: push ebx
  loc_004540BD: call [ecx+00000300h]
  loc_004540C3: lea edx, var_20
  loc_004540C6: push eax
  loc_004540C7: push edx
  loc_004540C8: call [004010A0h] ; __vbaObjSet
  loc_004540CE: mov ecx, [eax]
  loc_004540D0: lea edx, var_18
  loc_004540D3: push edx
  loc_004540D4: push eax
  loc_004540D5: mov var_EC, eax
  loc_004540DB: call [ecx+000000A0h]
  loc_004540E1: cmp eax, edi
  loc_004540E3: fnclex
  loc_004540E5: jge 004540FFh
  loc_004540E7: mov ecx, var_EC
  loc_004540ED: push 000000A0h
  loc_004540F2: push 0041E5E8h
  loc_004540F7: push ecx
  loc_004540F8: push eax
  loc_004540F9: call [00401074h] ; __vbaHresultCheckObj
  loc_004540FF: mov eax, var_18
  loc_00454102: lea edx, var_60
  loc_00454105: mov var_58, eax
  loc_00454108: lea eax, var_70
  loc_0045410B: push edx
  loc_0045410C: push eax
  loc_0045410D: mov var_18, edi
  loc_00454110: mov var_60, 00000008h
  loc_00454117: call [004010D4h] ; rtcTrimVar
  loc_0045411D: lea edx, var_C0
  loc_00454123: lea ecx, var_90
  loc_00454129: mov var_B8, 0041EDF8h
  loc_00454133: mov var_C0, 00000008h
  loc_0045413D: call [00401240h] ; __vbaVarDup
  loc_00454143: lea ecx, var_40
  loc_00454146: lea edx, var_B0
  loc_0045414C: push ecx
  loc_0045414D: lea eax, var_50
  loc_00454150: push edx
  loc_00454151: push eax
  loc_00454152: mov var_A8, 0041E5D4h
  loc_0045415C: mov var_B0, 00008008h
  loc_00454166: call [00401050h] ; __vbaVarCmpNe
  loc_0045416C: mov edx, eax
  loc_0045416E: lea ecx, var_80
  loc_00454171: call [00401014h] ; __vbaVarMove
  loc_00454177: lea ecx, var_90
  loc_0045417D: lea edx, var_70
  loc_00454180: push ecx
  loc_00454181: lea eax, var_80
  loc_00454184: push edx
  loc_00454185: lea ecx, var_A0
  loc_0045418B: push eax
  loc_0045418C: push ecx
  loc_0045418D: call [004011F0h] ; rtcImmediateIf
  loc_00454193: mov eax, [esi]
  loc_00454195: mov ecx, var_A0
  loc_0045419B: sub esp, 00000010h
  loc_0045419E: mov edx, [eax]
  loc_004541A0: mov eax, esp
  loc_004541A2: sub esp, 00000010h
  loc_004541A5: mov [eax], ecx
  loc_004541A7: mov ecx, var_9C
  loc_004541AD: mov [eax+00000004h], ecx
  loc_004541B0: mov ecx, var_98
  loc_004541B6: mov [eax+00000008h], ecx
  loc_004541B9: mov ecx, var_94
  loc_004541BF: mov [eax+0000000Ch], ecx
  loc_004541C2: mov ecx, esp
  loc_004541C4: mov eax, 00000008h
  loc_004541C9: mov [ecx], eax
  loc_004541CB: mov eax, var_CC
  loc_004541D1: mov [ecx+00000004h], eax
  loc_004541D4: mov eax, 0041F224h ; "Rate"
  loc_004541D9: mov [ecx+00000008h], eax
  loc_004541DC: mov eax, var_C4
  loc_004541E2: mov [ecx+0000000Ch], eax
  loc_004541E5: mov eax, [esi]
  loc_004541E7: push eax
  loc_004541E8: call [edx+00000128h]
  loc_004541EE: cmp eax, edi
  loc_004541F0: fnclex
  loc_004541F2: jge 00454208h
  loc_004541F4: mov ecx, [esi]
  loc_004541F6: push 00000128h
  loc_004541FB: push 0041E938h
  loc_00454200: push ecx
  loc_00454201: push eax
  loc_00454202: call [00401074h] ; __vbaHresultCheckObj
  loc_00454208: lea edx, var_20
  loc_0045420B: lea eax, var_1C
  loc_0045420E: push edx
  loc_0045420F: push eax
  loc_00454210: push 00000002h
  loc_00454212: call [00401040h] ; __vbaFreeObjList
  loc_00454218: lea ecx, var_A0
  loc_0045421E: lea edx, var_90
  loc_00454224: push ecx
  loc_00454225: lea eax, var_70
  loc_00454228: push edx
  loc_00454229: lea ecx, var_80
  loc_0045422C: push eax
  loc_0045422D: lea edx, var_60
  loc_00454230: push ecx
  loc_00454231: lea eax, var_40
  loc_00454234: push edx
  loc_00454235: lea ecx, var_30
  loc_00454238: push eax
  loc_00454239: push ecx
  loc_0045423A: push 00000007h
  loc_0045423C: call [00401038h] ; __vbaFreeVarList
  loc_00454242: mov eax, [esi]
  loc_00454244: add esp, 0000002Ch
  loc_00454247: mov [ebx+0000003Ch], di
  loc_0045424B: mov edx, [eax]
  loc_0045424D: push edi
  loc_0045424E: push 00000001h
  loc_00454250: push eax
  loc_00454251: call [edx+00000164h]
  loc_00454257: cmp eax, edi
  loc_00454259: fnclex
  loc_0045425B: jge 00454271h
  loc_0045425D: mov ecx, [esi]
  loc_0045425F: push 00000164h
  loc_00454264: push 0041E938h
  loc_00454269: push ecx
  loc_0045426A: push eax
  loc_0045426B: call [00401074h] ; __vbaHresultCheckObj
  loc_00454271: mov ecx, 80020004h
  loc_00454276: mov eax, 0000000Ah
  loc_0045427B: mov var_58, ecx
  loc_0045427E: mov var_48, ecx
  loc_00454281: mov var_38, ecx
  loc_00454284: lea edx, var_B0
  loc_0045428A: lea ecx, var_30
  loc_0045428D: mov var_60, eax
  loc_00454290: mov var_50, eax
  loc_00454293: mov var_40, eax
  loc_00454296: mov var_A8, 0041F234h ; "Edit Successful"
  loc_004542A0: mov var_B0, 00000008h
  loc_004542AA: call [00401240h] ; __vbaVarDup
  loc_004542B0: lea edx, var_60
  loc_004542B3: lea eax, var_50
  loc_004542B6: push edx
  loc_004542B7: lea ecx, var_40
  loc_004542BA: push eax
  loc_004542BB: push ecx
  loc_004542BC: lea edx, var_30
  loc_004542BF: push 00000040h
  loc_004542C1: push edx
  loc_004542C2: call [004010A4h] ; rtcMsgBox
  loc_004542C8: lea eax, var_60
  loc_004542CB: lea ecx, var_50
  loc_004542CE: push eax
  loc_004542CF: lea edx, var_40
  loc_004542D2: push ecx
  loc_004542D3: lea eax, var_30
  loc_004542D6: push edx
  loc_004542D7: push eax
  loc_004542D8: push 00000004h
  loc_004542DA: call [00401038h] ; __vbaFreeVarList
  loc_004542E0: mov eax, [esi]
  loc_004542E2: add esp, 00000014h
  loc_004542E5: mov ecx, [eax]
  loc_004542E7: push eax
  loc_004542E8: call [ecx+000000C4h]
  loc_004542EE: cmp eax, edi
  loc_004542F0: fnclex
  loc_004542F2: jge 00454308h
  loc_004542F4: mov edx, [esi]
  loc_004542F6: push 000000C4h
  loc_004542FB: push 0041E938h
  loc_00454300: push edx
  loc_00454301: push eax
  loc_00454302: call [00401074h] ; __vbaHresultCheckObj
  loc_00454308: push 0041E938h
  loc_0045430D: push edi
  loc_0045430E: call [00401274h] ; __vbaCastObj
  loc_00454314: push eax
  loc_00454315: lea eax, var_1C
  loc_00454318: push eax
  loc_00454319: call [004010A0h] ; __vbaObjSet
  loc_0045431F: push eax
  loc_00454320: push esi
  loc_00454321: call [004010B8h] ; __vbaObjSetAddref
  loc_00454327: lea ecx, var_1C
  loc_0045432A: call [004012B0h] ; __vbaFreeObj
  loc_00454330: push 0045438Ah
  loc_00454335: jmp 00454389h
  loc_00454337: lea ecx, var_18
  loc_0045433A: lea edx, var_14
  loc_0045433D: push ecx
  loc_0045433E: push edx
  loc_0045433F: push 00000002h
  loc_00454341: call [004011FCh] ; __vbaFreeStrList
  loc_00454347: lea eax, var_20
  loc_0045434A: lea ecx, var_1C
  loc_0045434D: push eax
  loc_0045434E: push ecx
  loc_0045434F: push 00000002h
  loc_00454351: call [00401040h] ; __vbaFreeObjList
  loc_00454357: lea edx, var_A0
  loc_0045435D: lea eax, var_90
  loc_00454363: push edx
  loc_00454364: lea ecx, var_80
  loc_00454367: push eax
  loc_00454368: lea edx, var_70
  loc_0045436B: push ecx
  loc_0045436C: lea eax, var_60
  loc_0045436F: push edx
  loc_00454370: lea ecx, var_50
  loc_00454373: push eax
  loc_00454374: lea edx, var_40
  loc_00454377: push ecx
  loc_00454378: lea eax, var_30
  loc_0045437B: push edx
  loc_0045437C: push eax
  loc_0045437D: push 00000008h
  loc_0045437F: call [00401038h] ; __vbaFreeVarList
  loc_00454385: add esp, 0000003Ch
  loc_00454388: ret
  loc_00454389: ret
  loc_0045438A: mov ecx, var_10
  loc_0045438D: pop edi
  loc_0045438E: pop esi
  loc_0045438F: xor eax, eax
  loc_00454391: mov fs:[00000000h], ecx
  loc_00454398: pop ebx
  loc_00454399: mov esp, ebp
  loc_0045439B: pop ebp
  loc_0045439C: retn 0004h
End Sub

Private Sub Proc_2_18_454B60() '454B60
  loc_00454B60: push ebp
  loc_00454B61: mov ebp, esp
  loc_00454B63: sub esp, 00000008h
  loc_00454B66: push 00403B36h ; __vbaExceptHandler
  loc_00454B6B: mov eax, fs:[00000000h]
  loc_00454B71: push eax
  loc_00454B72: mov fs:[00000000h], esp
  loc_00454B79: sub esp, 0000013Ch
  loc_00454B7F: push ebx
  loc_00454B80: push esi
  loc_00454B81: push edi
  loc_00454B82: mov var_8, esp
  loc_00454B85: mov var_4, 00401440h
  loc_00454B8C: mov eax, Me
  loc_00454B8F: xor ebx, ebx
  loc_00454B91: push eax
  loc_00454B92: mov var_14, ebx
  loc_00454B95: mov ecx, [eax]
  loc_00454B97: mov var_18, ebx
  loc_00454B9A: mov var_1C, ebx
  loc_00454B9D: mov var_20, ebx
  loc_00454BA0: mov var_24, ebx
  loc_00454BA3: mov var_28, ebx
  loc_00454BA6: mov var_2C, ebx
  loc_00454BA9: mov var_3C, ebx
  loc_00454BAC: mov var_4C, ebx
  loc_00454BAF: mov var_5C, ebx
  loc_00454BB2: mov var_6C, ebx
  loc_00454BB5: mov var_7C, ebx
  loc_00454BB8: mov var_8C, ebx
  loc_00454BBE: mov var_9C, ebx
  loc_00454BC4: mov var_AC, ebx
  loc_00454BCA: mov var_BC, ebx
  loc_00454BD0: mov var_CC, ebx
  loc_00454BD6: mov var_EC, ebx
  loc_00454BDC: mov var_100, ebx
  loc_00454BE2: mov var_104, ebx
  loc_00454BE8: call [ecx+00000324h]
  loc_00454BEE: lea edx, var_1C
  loc_00454BF1: push eax
  loc_00454BF2: push edx
  loc_00454BF3: call [004010A0h] ; __vbaObjSet
  loc_00454BF9: mov esi, eax
  loc_00454BFB: lea ecx, var_14
  loc_00454BFE: push ecx
  loc_00454BFF: push esi
  loc_00454C00: mov eax, [esi]
  loc_00454C02: call [eax+000000A0h]
  loc_00454C08: cmp eax, ebx
  loc_00454C0A: fnclex
  loc_00454C0C: jge 00454C20h
  loc_00454C0E: push 000000A0h
  loc_00454C13: push 0041E5E8h
  loc_00454C18: push esi
  loc_00454C19: push eax
  loc_00454C1A: call [00401074h] ; __vbaHresultCheckObj
  loc_00454C20: mov eax, var_14
  loc_00454C23: lea edx, var_3C
  loc_00454C26: mov var_34, eax
  loc_00454C29: lea eax, var_4C
  loc_00454C2C: mov esi, 00000008h
  loc_00454C31: push edx
  loc_00454C32: push eax
  loc_00454C33: mov var_14, ebx
  loc_00454C36: mov var_3C, esi
  loc_00454C39: call [004010D4h] ; rtcTrimVar
  loc_00454C3F: lea edi, var_20
  loc_00454C42: mov ecx, 0000000Ah
  loc_00454C47: push edi
  loc_00454C48: mov var_EC, ecx
  loc_00454C4E: sub esp, 00000010h
  loc_00454C51: mov eax, 80020004h
  loc_00454C56: mov edi, esp
  loc_00454C58: mov edx, eax
  loc_00454C5A: sub esp, 00000010h
  loc_00454C5D: mov var_E4, edx
  loc_00454C63: mov [edi], ecx
  loc_00454C65: mov ecx, var_F8
  loc_00454C6B: mov var_BC, esi
  loc_00454C71: mov var_CC, esi
  loc_00454C77: mov [edi+00000004h], ecx
  loc_00454C7A: mov ecx, esp
  loc_00454C7C: sub esp, 00000010h
  loc_00454C7F: mov esi, [0061A13Ch]
  loc_00454C85: mov [edi+00000008h], eax
  loc_00454C88: mov eax, var_F0
  loc_00454C8E: mov var_B4, 0041F300h ; "Select * From AgentThai Where AgentName='"
  loc_00454C98: mov var_C4, 0041E890h ; "'"
  loc_00454CA2: mov [edi+0000000Ch], eax
  loc_00454CA5: mov eax, var_EC
  loc_00454CAB: mov [ecx], eax
  loc_00454CAD: mov eax, var_E8
  loc_00454CB3: mov edi, [004011B4h] ; __vbaVarCat
  loc_00454CB9: mov esi, [esi]
  loc_00454CBB: mov [ecx+00000004h], eax
  loc_00454CBE: mov eax, 00000003h
  loc_00454CC3: mov [ecx+00000008h], edx
  loc_00454CC6: mov edx, var_E0
  loc_00454CCC: mov [ecx+0000000Ch], edx
  loc_00454CCF: mov edx, var_D8
  loc_00454CD5: mov ecx, esp
  loc_00454CD7: mov [ecx], eax
  loc_00454CD9: mov eax, 00000004h
  loc_00454CDE: mov [ecx+00000004h], edx
  loc_00454CE1: lea edx, var_4C
  loc_00454CE4: mov [ecx+00000008h], eax
  loc_00454CE7: mov eax, var_D0
  loc_00454CED: mov [ecx+0000000Ch], eax
  loc_00454CF0: lea ecx, var_BC
  loc_00454CF6: push ecx
  loc_00454CF7: lea eax, var_5C
  loc_00454CFA: push edx
  loc_00454CFB: push eax
  loc_00454CFC: call edi
  loc_00454CFE: lea ecx, var_CC
  loc_00454D04: push eax
  loc_00454D05: lea edx, var_6C
  loc_00454D08: push ecx
  loc_00454D09: push edx
  loc_00454D0A: call edi
  loc_00454D0C: push eax
  loc_00454D0D: lea eax, var_18
  loc_00454D10: push eax
  loc_00454D11: call [004011B0h] ; __vbaStrVarVal
  loc_00454D17: mov ecx, [0061A13Ch]
  loc_00454D1D: push eax
  loc_00454D1E: push ecx
  loc_00454D1F: call [esi+000000BCh]
  loc_00454D25: cmp eax, ebx
  loc_00454D27: fnclex
  loc_00454D29: jge 00454D47h
  loc_00454D2B: mov edx, [0061A13Ch]
  loc_00454D31: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00454D37: push 000000BCh
  loc_00454D3C: push 0041E928h
  loc_00454D41: push edx
  loc_00454D42: push eax
  loc_00454D43: call __vbaHresultCheckObj
  loc_00454D45: jmp 00454D4Dh
  loc_00454D47: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00454D4D: mov eax, Me
  loc_00454D50: mov ecx, var_20
  loc_00454D53: push ecx
  loc_00454D54: lea edi, [eax+00000034h]
  loc_00454D57: push edi
  loc_00454D58: call [004010B8h] ; __vbaObjSetAddref
  loc_00454D5E: lea ecx, var_18
  loc_00454D61: call [004012ACh] ; __vbaFreeStr
  loc_00454D67: lea edx, var_20
  loc_00454D6A: lea eax, var_1C
  loc_00454D6D: push edx
  loc_00454D6E: push eax
  loc_00454D6F: push 00000002h
  loc_00454D71: call [00401040h] ; __vbaFreeObjList
  loc_00454D77: lea ecx, var_6C
  loc_00454D7A: lea edx, var_5C
  loc_00454D7D: push ecx
  loc_00454D7E: lea eax, var_4C
  loc_00454D81: push edx
  loc_00454D82: lea ecx, var_3C
  loc_00454D85: push eax
  loc_00454D86: push ecx
  loc_00454D87: push 00000004h
  loc_00454D89: call [00401038h] ; __vbaFreeVarList
  loc_00454D8F: mov eax, [edi]
  loc_00454D91: add esp, 00000020h
  loc_00454D94: lea ecx, var_100
  loc_00454D9A: mov edx, [eax]
  loc_00454D9C: push ecx
  loc_00454D9D: push eax
  loc_00454D9E: call [edx+00000020h]
  loc_00454DA1: cmp eax, ebx
  loc_00454DA3: fnclex
  loc_00454DA5: jge 00454DB4h
  loc_00454DA7: mov edx, [edi]
  loc_00454DA9: push 00000020h
  loc_00454DAB: push 0041E938h
  loc_00454DB0: push edx
  loc_00454DB1: push eax
  loc_00454DB2: call __vbaHresultCheckObj
  loc_00454DB4: mov eax, [edi]
  loc_00454DB6: lea edx, var_104
  loc_00454DBC: push edx
  loc_00454DBD: push eax
  loc_00454DBE: mov ecx, [eax]
  loc_00454DC0: call [ecx+00000034h]
  loc_00454DC3: cmp eax, ebx
  loc_00454DC5: fnclex
  loc_00454DC7: jge 00454DD6h
  loc_00454DC9: mov ecx, [edi]
  loc_00454DCB: push 00000034h
  loc_00454DCD: push 0041E938h
  loc_00454DD2: push ecx
  loc_00454DD3: push eax
  loc_00454DD4: call __vbaHresultCheckObj
  loc_00454DD6: xor edx, edx
  loc_00454DD8: cmp var_104, bx
  loc_00454DDF: setz dl
  loc_00454DE2: xor eax, eax
  loc_00454DE4: cmp var_100, bx
  loc_00454DEB: setz al
  loc_00454DEE: or edx, eax
  loc_00454DF0: jz 00455782h
  loc_00454DF6: mov eax, [edi]
  loc_00454DF8: lea edx, var_1C
  loc_00454DFB: push edx
  loc_00454DFC: push eax
  loc_00454DFD: mov ecx, [eax]
  loc_00454DFF: call [ecx+000000B4h]
  loc_00454E05: cmp eax, ebx
  loc_00454E07: fnclex
  loc_00454E09: jge 00454E1Bh
  loc_00454E0B: mov ecx, [edi]
  loc_00454E0D: push 000000B4h
  loc_00454E12: push 0041E938h
  loc_00454E17: push ecx
  loc_00454E18: push eax
  loc_00454E19: call __vbaHresultCheckObj
  loc_00454E1B: lea esi, var_20
  loc_00454E1E: mov eax, var_1C
  loc_00454E21: push esi
  loc_00454E22: mov ecx, 00000008h
  loc_00454E27: sub esp, 00000010h
  loc_00454E2A: mov var_BC, ecx
  loc_00454E30: mov esi, esp
  loc_00454E32: mov var_B4, 0041F1E8h ; "Address"
  loc_00454E3C: mov edx, [eax]
  loc_00454E3E: push eax
  loc_00454E3F: mov [esi], ecx
  loc_00454E41: mov ecx, var_B8
  loc_00454E47: mov var_10C, eax
  loc_00454E4D: mov [esi+00000004h], ecx
  loc_00454E50: mov ecx, var_B4
  loc_00454E56: mov [esi+00000008h], ecx
  loc_00454E59: mov ecx, var_B0
  loc_00454E5F: mov [esi+0000000Ch], ecx
  loc_00454E62: call [edx+00000030h]
  loc_00454E65: cmp eax, ebx
  loc_00454E67: fnclex
  loc_00454E69: jge 00454E80h
  loc_00454E6B: mov edx, var_10C
  loc_00454E71: push 00000030h
  loc_00454E73: push 0041EA14h ; "S"
  loc_00454E78: push edx
  loc_00454E79: push eax
  loc_00454E7A: call [00401074h] ; __vbaHresultCheckObj
  loc_00454E80: mov eax, var_20
  loc_00454E83: lea ecx, var_4C
  loc_00454E86: mov var_34, eax
  loc_00454E89: lea eax, var_3C
  loc_00454E8C: push eax
  loc_00454E8D: push ecx
  loc_00454E8E: mov var_20, ebx
  loc_00454E91: mov var_3C, 00000009h
  loc_00454E98: call [004010D4h] ; rtcTrimVar
  loc_00454E9E: mov eax, [edi]
  loc_00454EA0: lea ecx, var_24
  loc_00454EA3: push ecx
  loc_00454EA4: push eax
  loc_00454EA5: mov edx, [eax]
  loc_00454EA7: call [edx+000000B4h]
  loc_00454EAD: cmp eax, ebx
  loc_00454EAF: fnclex
  loc_00454EB1: jge 00454EC7h
  loc_00454EB3: mov edx, [edi]
  loc_00454EB5: push 000000B4h
  loc_00454EBA: push 0041E938h
  loc_00454EBF: push edx
  loc_00454EC0: push eax
  loc_00454EC1: call [00401074h] ; __vbaHresultCheckObj
  loc_00454EC7: lea esi, var_28
  loc_00454ECA: mov eax, var_24
  loc_00454ECD: push esi
  loc_00454ECE: mov ecx, 00000008h
  loc_00454ED3: sub esp, 00000010h
  loc_00454ED6: mov edx, [eax]
  loc_00454ED8: mov esi, esp
  loc_00454EDA: mov var_D4, 0041F1E8h ; "Address"
  loc_00454EE4: push eax
  loc_00454EE5: mov var_118, eax
  loc_00454EEB: mov [esi], ecx
  loc_00454EED: mov ecx, var_D8
  loc_00454EF3: mov [esi+00000004h], ecx
  loc_00454EF6: mov ecx, var_D4
  loc_00454EFC: mov [esi+00000008h], ecx
  loc_00454EFF: mov ecx, var_D0
  loc_00454F05: mov [esi+0000000Ch], ecx
  loc_00454F08: call [edx+00000030h]
  loc_00454F0B: cmp eax, ebx
  loc_00454F0D: fnclex
  loc_00454F0F: jge 00454F26h
  loc_00454F11: mov edx, var_118
  loc_00454F17: push 00000030h
  loc_00454F19: push 0041EA14h ; "S"
  loc_00454F1E: push edx
  loc_00454F1F: push eax
  loc_00454F20: call [00401074h] ; __vbaHresultCheckObj
  loc_00454F26: mov eax, var_28
  loc_00454F29: lea ecx, var_7C
  loc_00454F2C: mov var_64, eax
  loc_00454F2F: lea eax, var_6C
  loc_00454F32: push eax
  loc_00454F33: push ecx
  loc_00454F34: mov var_28, ebx
  loc_00454F37: mov var_6C, 00000009h
  loc_00454F3E: call [004010D4h] ; rtcTrimVar
  loc_00454F44: mov eax, Me
  loc_00454F47: push eax
  loc_00454F48: mov edx, [eax]
  loc_00454F4A: call [edx+00000320h]
  loc_00454F50: push eax
  loc_00454F51: lea eax, var_2C
  loc_00454F54: push eax
  loc_00454F55: call [004010A0h] ; __vbaObjSet
  loc_00454F5B: lea edx, var_EC
  loc_00454F61: lea ecx, var_9C
  loc_00454F67: mov esi, eax
  loc_00454F69: mov var_E4, 0041F1E0h ; "-"
  loc_00454F73: mov var_EC, 00000008h
  loc_00454F7D: call [00401240h] ; __vbaVarDup
  loc_00454F83: lea ecx, var_4C
  loc_00454F86: lea edx, var_CC
  loc_00454F8C: push ecx
  loc_00454F8D: lea eax, var_5C
  loc_00454F90: push edx
  loc_00454F91: push eax
  loc_00454F92: mov var_C4, 0041E5D4h
  loc_00454F9C: mov var_CC, 00008008h
  loc_00454FA6: call [00401050h] ; __vbaVarCmpNe
  loc_00454FAC: mov edx, eax
  loc_00454FAE: lea ecx, var_8C
  loc_00454FB4: call [00401014h] ; __vbaVarMove
  loc_00454FBA: lea ecx, var_9C
  loc_00454FC0: lea edx, var_7C
  loc_00454FC3: push ecx
  loc_00454FC4: lea eax, var_8C
  loc_00454FCA: push edx
  loc_00454FCB: lea ecx, var_AC
  loc_00454FD1: push eax
  loc_00454FD2: push ecx
  loc_00454FD3: call [004011F0h] ; rtcImmediateIf
  loc_00454FD9: mov ebx, [esi]
  loc_00454FDB: lea edx, var_AC
  loc_00454FE1: lea eax, var_14
  loc_00454FE4: push edx
  loc_00454FE5: push eax
  loc_00454FE6: call [004011B0h] ; __vbaStrVarVal
  loc_00454FEC: push eax
  loc_00454FED: push esi
  loc_00454FEE: call [ebx+000000A4h]
  loc_00454FF4: test eax, eax
  loc_00454FF6: fnclex
  loc_00454FF8: jge 0045500Ch
  loc_00454FFA: push 000000A4h
  loc_00454FFF: push 0041E5E8h
  loc_00455004: push esi
  loc_00455005: push eax
  loc_00455006: call [00401074h] ; __vbaHresultCheckObj
  loc_0045500C: lea ecx, var_14
  loc_0045500F: call [004012ACh] ; __vbaFreeStr
  loc_00455015: lea ecx, var_2C
  loc_00455018: lea edx, var_24
  loc_0045501B: push ecx
  loc_0045501C: lea eax, var_1C
  loc_0045501F: push edx
  loc_00455020: push eax
  loc_00455021: push 00000003h
  loc_00455023: call [00401040h] ; __vbaFreeObjList
  loc_00455029: lea ecx, var_AC
  loc_0045502F: lea edx, var_9C
  loc_00455035: push ecx
  loc_00455036: lea eax, var_7C
  loc_00455039: push edx
  loc_0045503A: lea ecx, var_8C
  loc_00455040: push eax
  loc_00455041: lea edx, var_6C
  loc_00455044: push ecx
  loc_00455045: lea eax, var_4C
  loc_00455048: push edx
  loc_00455049: lea ecx, var_3C
  loc_0045504C: push eax
  loc_0045504D: push ecx
  loc_0045504E: push 00000007h
  loc_00455050: call [00401038h] ; __vbaFreeVarList
  loc_00455056: mov eax, [edi]
  loc_00455058: add esp, 00000030h
  loc_0045505B: lea ecx, var_1C
  loc_0045505E: mov edx, [eax]
  loc_00455060: push ecx
  loc_00455061: push eax
  loc_00455062: call [edx+000000B4h]
  loc_00455068: test eax, eax
  loc_0045506A: fnclex
  loc_0045506C: jge 00455082h
  loc_0045506E: mov edx, [edi]
  loc_00455070: push 000000B4h
  loc_00455075: push 0041E938h
  loc_0045507A: push edx
  loc_0045507B: push eax
  loc_0045507C: call [00401074h] ; __vbaHresultCheckObj
  loc_00455082: lea ebx, var_20
  loc_00455085: mov eax, var_1C
  loc_00455088: push ebx
  loc_00455089: mov edx, 00000008h
  loc_0045508E: sub esp, 00000010h
  loc_00455091: mov var_BC, edx
  loc_00455097: mov ebx, esp
  loc_00455099: mov ecx, 0041F1FCh ; "Phone"
  loc_0045509E: mov var_B4, ecx
  loc_004550A4: mov esi, [eax]
  loc_004550A6: mov [ebx], edx
  loc_004550A8: mov edx, var_B8
  loc_004550AE: push eax
  loc_004550AF: mov var_10C, eax
  loc_004550B5: mov [ebx+00000004h], edx
  loc_004550B8: mov [ebx+00000008h], ecx
  loc_004550BB: mov ecx, var_B0
  loc_004550C1: mov [ebx+0000000Ch], ecx
  loc_004550C4: call [esi+00000030h]
  loc_004550C7: test eax, eax
  loc_004550C9: fnclex
  loc_004550CB: jge 004550E2h
  loc_004550CD: mov edx, var_10C
  loc_004550D3: push 00000030h
  loc_004550D5: push 0041EA14h ; "S"
  loc_004550DA: push edx
  loc_004550DB: push eax
  loc_004550DC: call [00401074h] ; __vbaHresultCheckObj
  loc_004550E2: mov eax, var_20
  loc_004550E5: lea ecx, var_4C
  loc_004550E8: mov var_34, eax
  loc_004550EB: lea eax, var_3C
  loc_004550EE: push eax
  loc_004550EF: push ecx
  loc_004550F0: mov var_20, 00000000h
  loc_004550F7: mov var_3C, 00000009h
  loc_004550FE: call [004010D4h] ; rtcTrimVar
  loc_00455104: mov eax, [edi]
  loc_00455106: lea ecx, var_24
  loc_00455109: push ecx
  loc_0045510A: push eax
  loc_0045510B: mov edx, [eax]
  loc_0045510D: call [edx+000000B4h]
  loc_00455113: test eax, eax
  loc_00455115: fnclex
  loc_00455117: jge 0045512Dh
  loc_00455119: mov edx, [edi]
  loc_0045511B: push 000000B4h
  loc_00455120: push 0041E938h
  loc_00455125: push edx
  loc_00455126: push eax
  loc_00455127: call [00401074h] ; __vbaHresultCheckObj
  loc_0045512D: lea ebx, var_28
  loc_00455130: mov eax, var_24
  loc_00455133: push ebx
  loc_00455134: mov edx, 00000008h
  loc_00455139: sub esp, 00000010h
  loc_0045513C: mov esi, [eax]
  loc_0045513E: mov ebx, esp
  loc_00455140: mov ecx, 0041F1FCh ; "Phone"
  loc_00455145: push eax
  loc_00455146: mov var_118, eax
  loc_0045514C: mov [ebx], edx
  loc_0045514E: mov edx, var_D8
  loc_00455154: mov [ebx+00000004h], edx
  loc_00455157: mov [ebx+00000008h], ecx
  loc_0045515A: mov ecx, var_D0
  loc_00455160: mov [ebx+0000000Ch], ecx
  loc_00455163: call [esi+00000030h]
  loc_00455166: test eax, eax
  loc_00455168: fnclex
  loc_0045516A: jge 00455181h
  loc_0045516C: mov edx, var_118
  loc_00455172: push 00000030h
  loc_00455174: push 0041EA14h ; "S"
  loc_00455179: push edx
  loc_0045517A: push eax
  loc_0045517B: call [00401074h] ; __vbaHresultCheckObj
  loc_00455181: mov eax, var_28
  loc_00455184: lea ecx, var_7C
  loc_00455187: mov var_64, eax
  loc_0045518A: lea eax, var_6C
  loc_0045518D: push eax
  loc_0045518E: push ecx
  loc_0045518F: mov var_28, 00000000h
  loc_00455196: mov var_6C, 00000009h
  loc_0045519D: call [004010D4h] ; rtcTrimVar
  loc_004551A3: mov eax, Me
  loc_004551A6: push eax
  loc_004551A7: mov edx, [eax]
  loc_004551A9: call [edx+00000308h]
  loc_004551AF: push eax
  loc_004551B0: lea eax, var_2C
  loc_004551B3: push eax
  loc_004551B4: call [004010A0h] ; __vbaObjSet
  loc_004551BA: lea edx, var_EC
  loc_004551C0: lea ecx, var_9C
  loc_004551C6: mov esi, eax
  loc_004551C8: mov var_E4, 0041F1E0h ; "-"
  loc_004551D2: mov var_EC, 00000008h
  loc_004551DC: call [00401240h] ; __vbaVarDup
  loc_004551E2: lea ecx, var_4C
  loc_004551E5: lea edx, var_CC
  loc_004551EB: push ecx
  loc_004551EC: lea eax, var_5C
  loc_004551EF: push edx
  loc_004551F0: push eax
  loc_004551F1: mov var_C4, 0041E5D4h
  loc_004551FB: mov var_CC, 00008008h
  loc_00455205: call [00401050h] ; __vbaVarCmpNe
  loc_0045520B: mov edx, eax
  loc_0045520D: lea ecx, var_8C
  loc_00455213: call [00401014h] ; __vbaVarMove
  loc_00455219: lea ecx, var_9C
  loc_0045521F: lea edx, var_7C
  loc_00455222: push ecx
  loc_00455223: lea eax, var_8C
  loc_00455229: push edx
  loc_0045522A: lea ecx, var_AC
  loc_00455230: push eax
  loc_00455231: push ecx
  loc_00455232: call [004011F0h] ; rtcImmediateIf
  loc_00455238: mov ebx, [esi]
  loc_0045523A: lea edx, var_AC
  loc_00455240: lea eax, var_14
  loc_00455243: push edx
  loc_00455244: push eax
  loc_00455245: call [004011B0h] ; __vbaStrVarVal
  loc_0045524B: push eax
  loc_0045524C: push esi
  loc_0045524D: call [ebx+000000A4h]
  loc_00455253: test eax, eax
  loc_00455255: fnclex
  loc_00455257: jge 0045526Bh
  loc_00455259: push 000000A4h
  loc_0045525E: push 0041E5E8h
  loc_00455263: push esi
  loc_00455264: push eax
  loc_00455265: call [00401074h] ; __vbaHresultCheckObj
  loc_0045526B: lea ecx, var_14
  loc_0045526E: call [004012ACh] ; __vbaFreeStr
  loc_00455274: lea ecx, var_2C
  loc_00455277: lea edx, var_24
  loc_0045527A: push ecx
  loc_0045527B: lea eax, var_1C
  loc_0045527E: push edx
  loc_0045527F: push eax
  loc_00455280: push 00000003h
  loc_00455282: call [00401040h] ; __vbaFreeObjList
  loc_00455288: lea ecx, var_AC
  loc_0045528E: lea edx, var_9C
  loc_00455294: push ecx
  loc_00455295: lea eax, var_7C
  loc_00455298: push edx
  loc_00455299: lea ecx, var_8C
  loc_0045529F: push eax
  loc_004552A0: lea edx, var_6C
  loc_004552A3: push ecx
  loc_004552A4: lea eax, var_4C
  loc_004552A7: push edx
  loc_004552A8: lea ecx, var_3C
  loc_004552AB: push eax
  loc_004552AC: push ecx
  loc_004552AD: push 00000007h
  loc_004552AF: call [00401038h] ; __vbaFreeVarList
  loc_004552B5: mov eax, [edi]
  loc_004552B7: add esp, 00000030h
  loc_004552BA: lea ecx, var_1C
  loc_004552BD: mov edx, [eax]
  loc_004552BF: push ecx
  loc_004552C0: push eax
  loc_004552C1: call [edx+000000B4h]
  loc_004552C7: test eax, eax
  loc_004552C9: fnclex
  loc_004552CB: jge 004552E1h
  loc_004552CD: mov edx, [edi]
  loc_004552CF: push 000000B4h
  loc_004552D4: push 0041E938h
  loc_004552D9: push edx
  loc_004552DA: push eax
  loc_004552DB: call [00401074h] ; __vbaHresultCheckObj
  loc_004552E1: lea ebx, var_20
  loc_004552E4: mov eax, var_1C
  loc_004552E7: push ebx
  loc_004552E8: mov edx, 00000008h
  loc_004552ED: sub esp, 00000010h
  loc_004552F0: mov var_BC, edx
  loc_004552F6: mov ebx, esp
  loc_004552F8: mov ecx, 0041F20Ch ; "Commision"
  loc_004552FD: mov var_B4, ecx
  loc_00455303: mov esi, [eax]
  loc_00455305: mov [ebx], edx
  loc_00455307: mov edx, var_B8
  loc_0045530D: push eax
  loc_0045530E: mov var_10C, eax
  loc_00455314: mov [ebx+00000004h], edx
  loc_00455317: mov [ebx+00000008h], ecx
  loc_0045531A: mov ecx, var_B0
  loc_00455320: mov [ebx+0000000Ch], ecx
  loc_00455323: call [esi+00000030h]
  loc_00455326: test eax, eax
  loc_00455328: fnclex
  loc_0045532A: jge 00455341h
  loc_0045532C: mov edx, var_10C
  loc_00455332: push 00000030h
  loc_00455334: push 0041EA14h ; "S"
  loc_00455339: push edx
  loc_0045533A: push eax
  loc_0045533B: call [00401074h] ; __vbaHresultCheckObj
  loc_00455341: mov eax, var_20
  loc_00455344: lea ecx, var_4C
  loc_00455347: mov var_34, eax
  loc_0045534A: lea eax, var_3C
  loc_0045534D: push eax
  loc_0045534E: push ecx
  loc_0045534F: mov var_20, 00000000h
  loc_00455356: mov var_3C, 00000009h
  loc_0045535D: call [004010D4h] ; rtcTrimVar
  loc_00455363: mov eax, [edi]
  loc_00455365: lea ecx, var_24
  loc_00455368: push ecx
  loc_00455369: push eax
  loc_0045536A: mov edx, [eax]
  loc_0045536C: call [edx+000000B4h]
  loc_00455372: test eax, eax
  loc_00455374: fnclex
  loc_00455376: jge 0045538Ch
  loc_00455378: mov edx, [edi]
  loc_0045537A: push 000000B4h
  loc_0045537F: push 0041E938h
  loc_00455384: push edx
  loc_00455385: push eax
  loc_00455386: call [00401074h] ; __vbaHresultCheckObj
  loc_0045538C: lea ebx, var_28
  loc_0045538F: mov eax, var_24
  loc_00455392: push ebx
  loc_00455393: mov edx, 00000008h
  loc_00455398: sub esp, 00000010h
  loc_0045539B: mov esi, [eax]
  loc_0045539D: mov ebx, esp
  loc_0045539F: mov ecx, 0041F20Ch ; "Commision"
  loc_004553A4: push eax
  loc_004553A5: mov var_118, eax
  loc_004553AB: mov [ebx], edx
  loc_004553AD: mov edx, var_D8
  loc_004553B3: mov [ebx+00000004h], edx
  loc_004553B6: mov [ebx+00000008h], ecx
  loc_004553B9: mov ecx, var_D0
  loc_004553BF: mov [ebx+0000000Ch], ecx
  loc_004553C2: call [esi+00000030h]
  loc_004553C5: test eax, eax
  loc_004553C7: fnclex
  loc_004553C9: jge 004553E0h
  loc_004553CB: mov edx, var_118
  loc_004553D1: push 00000030h
  loc_004553D3: push 0041EA14h ; "S"
  loc_004553D8: push edx
  loc_004553D9: push eax
  loc_004553DA: call [00401074h] ; __vbaHresultCheckObj
  loc_004553E0: mov eax, var_28
  loc_004553E3: lea ecx, var_7C
  loc_004553E6: mov var_64, eax
  loc_004553E9: lea eax, var_6C
  loc_004553EC: push eax
  loc_004553ED: push ecx
  loc_004553EE: mov var_28, 00000000h
  loc_004553F5: mov var_6C, 00000009h
  loc_004553FC: call [004010D4h] ; rtcTrimVar
  loc_00455402: mov eax, Me
  loc_00455405: push eax
  loc_00455406: mov edx, [eax]
  loc_00455408: call [edx+00000304h]
  loc_0045540E: push eax
  loc_0045540F: lea eax, var_2C
  loc_00455412: push eax
  loc_00455413: call [004010A0h] ; __vbaObjSet
  loc_00455419: lea edx, var_EC
  loc_0045541F: lea ecx, var_9C
  loc_00455425: mov esi, eax
  loc_00455427: mov var_E4, 0041F1E0h ; "-"
  loc_00455431: mov var_EC, 00000008h
  loc_0045543B: call [00401240h] ; __vbaVarDup
  loc_00455441: lea ecx, var_4C
  loc_00455444: lea edx, var_CC
  loc_0045544A: push ecx
  loc_0045544B: lea eax, var_5C
  loc_0045544E: push edx
  loc_0045544F: push eax
  loc_00455450: mov var_C4, 0041E5D4h
  loc_0045545A: mov var_CC, 00008008h
  loc_00455464: call [00401050h] ; __vbaVarCmpNe
  loc_0045546A: mov edx, eax
  loc_0045546C: lea ecx, var_8C
  loc_00455472: call [00401014h] ; __vbaVarMove
  loc_00455478: lea ecx, var_9C
  loc_0045547E: lea edx, var_7C
  loc_00455481: push ecx
  loc_00455482: lea eax, var_8C
  loc_00455488: push edx
  loc_00455489: lea ecx, var_AC
  loc_0045548F: push eax
  loc_00455490: push ecx
  loc_00455491: call [004011F0h] ; rtcImmediateIf
  loc_00455497: mov ebx, [esi]
  loc_00455499: lea edx, var_AC
  loc_0045549F: lea eax, var_14
  loc_004554A2: push edx
  loc_004554A3: push eax
  loc_004554A4: call [004011B0h] ; __vbaStrVarVal
  loc_004554AA: push eax
  loc_004554AB: push esi
  loc_004554AC: call [ebx+000000A4h]
  loc_004554B2: test eax, eax
  loc_004554B4: fnclex
  loc_004554B6: jge 004554CAh
  loc_004554B8: push 000000A4h
  loc_004554BD: push 0041E5E8h
  loc_004554C2: push esi
  loc_004554C3: push eax
  loc_004554C4: call [00401074h] ; __vbaHresultCheckObj
  loc_004554CA: lea ecx, var_14
  loc_004554CD: call [004012ACh] ; __vbaFreeStr
  loc_004554D3: lea ecx, var_2C
  loc_004554D6: lea edx, var_24
  loc_004554D9: push ecx
  loc_004554DA: lea eax, var_1C
  loc_004554DD: push edx
  loc_004554DE: push eax
  loc_004554DF: push 00000003h
  loc_004554E1: call [00401040h] ; __vbaFreeObjList
  loc_004554E7: lea ecx, var_AC
  loc_004554ED: lea edx, var_9C
  loc_004554F3: push ecx
  loc_004554F4: lea eax, var_7C
  loc_004554F7: push edx
  loc_004554F8: lea ecx, var_8C
  loc_004554FE: push eax
  loc_004554FF: lea edx, var_6C
  loc_00455502: push ecx
  loc_00455503: lea eax, var_4C
  loc_00455506: push edx
  loc_00455507: lea ecx, var_3C
  loc_0045550A: push eax
  loc_0045550B: push ecx
  loc_0045550C: push 00000007h
  loc_0045550E: call [00401038h] ; __vbaFreeVarList
  loc_00455514: mov eax, [edi]
  loc_00455516: add esp, 00000030h
  loc_00455519: lea ecx, var_1C
  loc_0045551C: mov edx, [eax]
  loc_0045551E: push ecx
  loc_0045551F: push eax
  loc_00455520: call [edx+000000B4h]
  loc_00455526: test eax, eax
  loc_00455528: fnclex
  loc_0045552A: jge 00455540h
  loc_0045552C: mov edx, [edi]
  loc_0045552E: push 000000B4h
  loc_00455533: push 0041E938h
  loc_00455538: push edx
  loc_00455539: push eax
  loc_0045553A: call [00401074h] ; __vbaHresultCheckObj
  loc_00455540: lea ebx, var_20
  loc_00455543: mov eax, var_1C
  loc_00455546: push ebx
  loc_00455547: mov edx, 00000008h
  loc_0045554C: sub esp, 00000010h
  loc_0045554F: mov var_BC, edx
  loc_00455555: mov ebx, esp
  loc_00455557: mov ecx, 0041F224h ; "Rate"
  loc_0045555C: mov var_B4, ecx
  loc_00455562: mov esi, [eax]
  loc_00455564: mov [ebx], edx
  loc_00455566: mov edx, var_B8
  loc_0045556C: push eax
  loc_0045556D: mov var_10C, eax
  loc_00455573: mov [ebx+00000004h], edx
  loc_00455576: mov [ebx+00000008h], ecx
  loc_00455579: mov ecx, var_B0
  loc_0045557F: mov [ebx+0000000Ch], ecx
  loc_00455582: call [esi+00000030h]
  loc_00455585: test eax, eax
  loc_00455587: fnclex
  loc_00455589: jge 004555A0h
  loc_0045558B: mov edx, var_10C
  loc_00455591: push 00000030h
  loc_00455593: push 0041EA14h ; "S"
  loc_00455598: push edx
  loc_00455599: push eax
  loc_0045559A: call [00401074h] ; __vbaHresultCheckObj
  loc_004555A0: mov eax, var_20
  loc_004555A3: lea ecx, var_4C
  loc_004555A6: mov var_34, eax
  loc_004555A9: lea eax, var_3C
  loc_004555AC: push eax
  loc_004555AD: push ecx
  loc_004555AE: mov var_20, 00000000h
  loc_004555B5: mov var_3C, 00000009h
  loc_004555BC: call [004010D4h] ; rtcTrimVar
  loc_004555C2: mov eax, [edi]
  loc_004555C4: lea ecx, var_24
  loc_004555C7: push ecx
  loc_004555C8: push eax
  loc_004555C9: mov edx, [eax]
  loc_004555CB: call [edx+000000B4h]
  loc_004555D1: test eax, eax
  loc_004555D3: fnclex
  loc_004555D5: jge 004555EBh
  loc_004555D7: mov edx, [edi]
  loc_004555D9: push 000000B4h
  loc_004555DE: push 0041E938h
  loc_004555E3: push edx
  loc_004555E4: push eax
  loc_004555E5: call [00401074h] ; __vbaHresultCheckObj
  loc_004555EB: lea ebx, var_28
  loc_004555EE: mov eax, var_24
  loc_004555F1: push ebx
  loc_004555F2: mov edx, 00000008h
  loc_004555F7: sub esp, 00000010h
  loc_004555FA: mov esi, [eax]
  loc_004555FC: mov ebx, esp
  loc_004555FE: mov ecx, 0041F224h ; "Rate"
  loc_00455603: push eax
  loc_00455604: mov var_118, eax
  loc_0045560A: mov [ebx], edx
  loc_0045560C: mov edx, var_D8
  loc_00455612: mov [ebx+00000004h], edx
  loc_00455615: mov [ebx+00000008h], ecx
  loc_00455618: mov ecx, var_D0
  loc_0045561E: mov [ebx+0000000Ch], ecx
  loc_00455621: call [esi+00000030h]
  loc_00455624: test eax, eax
  loc_00455626: fnclex
  loc_00455628: jge 0045563Fh
  loc_0045562A: mov edx, var_118
  loc_00455630: push 00000030h
  loc_00455632: push 0041EA14h ; "S"
  loc_00455637: push edx
  loc_00455638: push eax
  loc_00455639: call [00401074h] ; __vbaHresultCheckObj
  loc_0045563F: mov eax, var_28
  loc_00455642: lea ecx, var_7C
  loc_00455645: mov var_64, eax
  loc_00455648: lea eax, var_6C
  loc_0045564B: push eax
  loc_0045564C: push ecx
  loc_0045564D: mov var_28, 00000000h
  loc_00455654: mov var_6C, 00000009h
  loc_0045565B: call [004010D4h] ; rtcTrimVar
  loc_00455661: mov eax, Me
  loc_00455664: push eax
  loc_00455665: mov edx, [eax]
  loc_00455667: call [edx+00000300h]
  loc_0045566D: push eax
  loc_0045566E: lea eax, var_2C
  loc_00455671: push eax
  loc_00455672: call [004010A0h] ; __vbaObjSet
  loc_00455678: lea edx, var_EC
  loc_0045567E: lea ecx, var_9C
  loc_00455684: mov esi, eax
  loc_00455686: mov var_E4, 0041F1E0h ; "-"
  loc_00455690: mov var_EC, 00000008h
  loc_0045569A: call [00401240h] ; __vbaVarDup
  loc_004556A0: lea ecx, var_4C
  loc_004556A3: lea edx, var_CC
  loc_004556A9: push ecx
  loc_004556AA: lea eax, var_5C
  loc_004556AD: push edx
  loc_004556AE: push eax
  loc_004556AF: mov var_C4, 0041E5D4h
  loc_004556B9: mov var_CC, 00008008h
  loc_004556C3: call [00401050h] ; __vbaVarCmpNe
  loc_004556C9: mov edx, eax
  loc_004556CB: lea ecx, var_8C
  loc_004556D1: call [00401014h] ; __vbaVarMove
  loc_004556D7: lea ecx, var_9C
  loc_004556DD: lea edx, var_7C
  loc_004556E0: push ecx
  loc_004556E1: lea eax, var_8C
  loc_004556E7: push edx
  loc_004556E8: lea ecx, var_AC
  loc_004556EE: push eax
  loc_004556EF: push ecx
  loc_004556F0: call [004011F0h] ; rtcImmediateIf
  loc_004556F6: mov ebx, [esi]
  loc_004556F8: lea edx, var_AC
  loc_004556FE: lea eax, var_14
  loc_00455701: push edx
  loc_00455702: push eax
  loc_00455703: call [004011B0h] ; __vbaStrVarVal
  loc_00455709: push eax
  loc_0045570A: push esi
  loc_0045570B: call [ebx+000000A4h]
  loc_00455711: xor ebx, ebx
  loc_00455713: cmp eax, ebx
  loc_00455715: fnclex
  loc_00455717: jge 0045572Fh
  loc_00455719: push 000000A4h
  loc_0045571E: push 0041E5E8h
  loc_00455723: push esi
  loc_00455724: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_0045572A: push eax
  loc_0045572B: call __vbaHresultCheckObj
  loc_0045572D: jmp 00455735h
  loc_0045572F: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_00455735: lea ecx, var_14
  loc_00455738: call [004012ACh] ; __vbaFreeStr
  loc_0045573E: lea ecx, var_2C
  loc_00455741: lea edx, var_24
  loc_00455744: push ecx
  loc_00455745: lea eax, var_1C
  loc_00455748: push edx
  loc_00455749: push eax
  loc_0045574A: push 00000003h
  loc_0045574C: call [00401040h] ; __vbaFreeObjList
  loc_00455752: lea ecx, var_AC
  loc_00455758: lea edx, var_9C
  loc_0045575E: push ecx
  loc_0045575F: lea eax, var_7C
  loc_00455762: push edx
  loc_00455763: lea ecx, var_8C
  loc_00455769: push eax
  loc_0045576A: lea edx, var_6C
  loc_0045576D: push ecx
  loc_0045576E: lea eax, var_4C
  loc_00455771: push edx
  loc_00455772: lea ecx, var_3C
  loc_00455775: push eax
  loc_00455776: push ecx
  loc_00455777: push 00000007h
  loc_00455779: call [00401038h] ; __vbaFreeVarList
  loc_0045577F: add esp, 00000030h
  loc_00455782: mov eax, [edi]
  loc_00455784: push eax
  loc_00455785: mov edx, [eax]
  loc_00455787: call [edx+000000C4h]
  loc_0045578D: cmp eax, ebx
  loc_0045578F: fnclex
  loc_00455791: jge 004557A3h
  loc_00455793: mov ecx, [edi]
  loc_00455795: push 000000C4h
  loc_0045579A: push 0041E938h
  loc_0045579F: push ecx
  loc_004557A0: push eax
  loc_004557A1: call __vbaHresultCheckObj
  loc_004557A3: push 0041E938h
  loc_004557A8: push ebx
  loc_004557A9: call [00401274h] ; __vbaCastObj
  loc_004557AF: lea edx, var_1C
  loc_004557B2: push eax
  loc_004557B3: push edx
  loc_004557B4: call [004010A0h] ; __vbaObjSet
  loc_004557BA: push eax
  loc_004557BB: push edi
  loc_004557BC: call [004010B8h] ; __vbaObjSetAddref
  loc_004557C2: lea ecx, var_1C
  loc_004557C5: call [004012B0h] ; __vbaFreeObj
  loc_004557CB: push 00455834h
  loc_004557D0: jmp 00455833h
  loc_004557D2: lea eax, var_18
  loc_004557D5: lea ecx, var_14
  loc_004557D8: push eax
  loc_004557D9: push ecx
  loc_004557DA: push 00000002h
  loc_004557DC: call [004011FCh] ; __vbaFreeStrList
  loc_004557E2: lea edx, var_2C
  loc_004557E5: lea eax, var_28
  loc_004557E8: push edx
  loc_004557E9: lea ecx, var_24
  loc_004557EC: push eax
  loc_004557ED: lea edx, var_20
  loc_004557F0: push ecx
  loc_004557F1: lea eax, var_1C
  loc_004557F4: push edx
  loc_004557F5: push eax
  loc_004557F6: push 00000005h
  loc_004557F8: call [00401040h] ; __vbaFreeObjList
  loc_004557FE: lea ecx, var_AC
  loc_00455804: lea edx, var_9C
  loc_0045580A: push ecx
  loc_0045580B: lea eax, var_8C
  loc_00455811: push edx
  loc_00455812: lea ecx, var_7C
  loc_00455815: push eax
  loc_00455816: lea edx, var_6C
  loc_00455819: push ecx
  loc_0045581A: lea eax, var_5C
  loc_0045581D: push edx
  loc_0045581E: lea ecx, var_4C
  loc_00455821: push eax
  loc_00455822: lea edx, var_3C
  loc_00455825: push ecx
  loc_00455826: push edx
  loc_00455827: push 00000008h
  loc_00455829: call [00401038h] ; __vbaFreeVarList
  loc_0045582F: add esp, 00000048h
  loc_00455832: ret
  loc_00455833: ret
  loc_00455834: mov ecx, var_10
  loc_00455837: pop edi
  loc_00455838: pop esi
  loc_00455839: xor eax, eax
  loc_0045583B: mov fs:[00000000h], ecx
  loc_00455842: pop ebx
  loc_00455843: mov esp, ebp
  loc_00455845: pop ebp
  loc_00455846: retn 0004h
End Sub

Private Sub Proc_2_19_455DA0() '455DA0
  loc_00455DA0: push ebp
  loc_00455DA1: mov ebp, esp
  loc_00455DA3: sub esp, 00000008h
  loc_00455DA6: push 00403B36h ; __vbaExceptHandler
  loc_00455DAB: mov eax, fs:[00000000h]
  loc_00455DB1: push eax
  loc_00455DB2: mov fs:[00000000h], esp
  loc_00455DB9: sub esp, 00000114h
  loc_00455DBF: push ebx
  loc_00455DC0: push esi
  loc_00455DC1: push edi
  loc_00455DC2: mov var_8, esp
  loc_00455DC5: mov var_4, 00401480h
  loc_00455DCC: mov edi, Me
  loc_00455DCF: xor ebx, ebx
  loc_00455DD1: push edi
  loc_00455DD2: mov var_14, ebx
  loc_00455DD5: mov eax, [edi]
  loc_00455DD7: mov var_18, ebx
  loc_00455DDA: mov var_1C, ebx
  loc_00455DDD: mov var_20, ebx
  loc_00455DE0: mov var_30, ebx
  loc_00455DE3: mov var_40, ebx
  loc_00455DE6: mov var_50, ebx
  loc_00455DE9: mov var_60, ebx
  loc_00455DEC: mov var_70, ebx
  loc_00455DEF: mov var_80, ebx
  loc_00455DF2: mov var_90, ebx
  loc_00455DF8: mov var_A0, ebx
  loc_00455DFE: mov var_B0, ebx
  loc_00455E04: mov var_C0, ebx
  loc_00455E0A: mov var_D0, ebx
  loc_00455E10: call [eax+00000324h]
  loc_00455E16: lea ecx, var_1C
  loc_00455E19: push eax
  loc_00455E1A: push ecx
  loc_00455E1B: call [004010A0h] ; __vbaObjSet
  loc_00455E21: mov esi, eax
  loc_00455E23: lea eax, var_14
  loc_00455E26: push eax
  loc_00455E27: push esi
  loc_00455E28: mov edx, [esi]
  loc_00455E2A: call [edx+000000A0h]
  loc_00455E30: cmp eax, ebx
  loc_00455E32: fnclex
  loc_00455E34: jge 00455E48h
  loc_00455E36: push 000000A0h
  loc_00455E3B: push 0041E5E8h
  loc_00455E40: push esi
  loc_00455E41: push eax
  loc_00455E42: call [00401074h] ; __vbaHresultCheckObj
  loc_00455E48: mov eax, var_14
  loc_00455E4B: lea ecx, var_30
  loc_00455E4E: lea edx, var_40
  loc_00455E51: push ecx
  loc_00455E52: push edx
  loc_00455E53: mov var_14, ebx
  loc_00455E56: mov var_28, eax
  loc_00455E59: mov var_30, 00000008h
  loc_00455E60: call [004010D4h] ; rtcTrimVar
  loc_00455E66: lea eax, var_40
  loc_00455E69: lea ecx, var_B0
  loc_00455E6F: push eax
  loc_00455E70: push ecx
  loc_00455E71: mov var_A8, 0041E5D4h
  loc_00455E7B: mov var_B0, 00008008h
  loc_00455E85: call [00401218h] ; __vbaVarTstNe
  loc_00455E8B: lea ecx, var_1C
  loc_00455E8E: mov si, ax
  loc_00455E91: call [004012B0h] ; __vbaFreeObj
  loc_00455E97: lea edx, var_40
  loc_00455E9A: lea eax, var_30
  loc_00455E9D: push edx
  loc_00455E9E: push eax
  loc_00455E9F: push 00000002h
  loc_00455EA1: call [00401038h] ; __vbaFreeVarList
  loc_00455EA7: add esp, 0000000Ch
  loc_00455EAA: cmp si, bx
  loc_00455EAD: jz 00456A88h
  loc_00455EB3: mov ecx, [edi]
  loc_00455EB5: push edi
  loc_00455EB6: mov var_A8, 0041F154h ; "Delete * From AgentThai Where AgentName='"
  loc_00455EC0: mov var_B0, 00000008h
  loc_00455ECA: call [ecx+00000324h]
  loc_00455ED0: lea edx, var_1C
  loc_00455ED3: push eax
  loc_00455ED4: push edx
  loc_00455ED5: call [004010A0h] ; __vbaObjSet
  loc_00455EDB: mov esi, eax
  loc_00455EDD: lea ecx, var_14
  loc_00455EE0: push ecx
  loc_00455EE1: push esi
  loc_00455EE2: mov eax, [esi]
  loc_00455EE4: call [eax+000000A0h]
  loc_00455EEA: cmp eax, ebx
  loc_00455EEC: fnclex
  loc_00455EEE: jge 00455F02h
  loc_00455EF0: push 000000A0h
  loc_00455EF5: push 0041E5E8h
  loc_00455EFA: push esi
  loc_00455EFB: push eax
  loc_00455EFC: call [00401074h] ; __vbaHresultCheckObj
  loc_00455F02: mov eax, var_14
  loc_00455F05: lea edx, var_30
  loc_00455F08: mov var_28, eax
  loc_00455F0B: lea eax, var_40
  loc_00455F0E: mov esi, 00000008h
  loc_00455F13: push edx
  loc_00455F14: push eax
  loc_00455F15: mov var_14, ebx
  loc_00455F18: mov var_30, esi
  loc_00455F1B: call [004010D4h] ; rtcTrimVar
  loc_00455F21: mov ecx, [0061A13Ch]
  loc_00455F27: sub esp, 00000010h
  loc_00455F2A: mov edx, esp
  loc_00455F2C: mov eax, 0000000Ah
  loc_00455F31: mov var_B8, 0041E890h ; "'"
  loc_00455F3B: mov var_C0, esi
  loc_00455F41: mov esi, [ecx]
  loc_00455F43: mov ecx, var_C4
  loc_00455F49: mov [edx], eax
  loc_00455F4B: mov eax, var_CC
  loc_00455F51: mov [edx+00000004h], eax
  loc_00455F54: mov eax, 80020004h
  loc_00455F59: mov [edx+00000008h], eax
  loc_00455F5C: lea eax, var_40
  loc_00455F5F: mov [edx+0000000Ch], ecx
  loc_00455F62: lea edx, var_B0
  loc_00455F68: push edx
  loc_00455F69: lea ecx, var_50
  loc_00455F6C: push eax
  loc_00455F6D: push ecx
  loc_00455F6E: call [004011B4h] ; __vbaVarCat
  loc_00455F74: push eax
  loc_00455F75: lea edx, var_C0
  loc_00455F7B: lea eax, var_60
  loc_00455F7E: push edx
  loc_00455F7F: push eax
  loc_00455F80: call [004011B4h] ; __vbaVarCat
  loc_00455F86: lea ecx, var_18
  loc_00455F89: push eax
  loc_00455F8A: push ecx
  loc_00455F8B: call [004011B0h] ; __vbaStrVarVal
  loc_00455F91: mov edx, [0061A13Ch]
  loc_00455F97: push eax
  loc_00455F98: push edx
  loc_00455F99: call [esi+0000005Ch]
  loc_00455F9C: cmp eax, ebx
  loc_00455F9E: fnclex
  loc_00455FA0: jge 00455FB7h
  loc_00455FA2: mov ecx, [0061A13Ch]
  loc_00455FA8: push 0000005Ch
  loc_00455FAA: push 0041E928h
  loc_00455FAF: push ecx
  loc_00455FB0: push eax
  loc_00455FB1: call [00401074h] ; __vbaHresultCheckObj
  loc_00455FB7: lea ecx, var_18
  loc_00455FBA: call [004012ACh] ; __vbaFreeStr
  loc_00455FC0: lea ecx, var_1C
  loc_00455FC3: call [004012B0h] ; __vbaFreeObj
  loc_00455FC9: lea edx, var_60
  loc_00455FCC: lea eax, var_50
  loc_00455FCF: push edx
  loc_00455FD0: lea ecx, var_40
  loc_00455FD3: push eax
  loc_00455FD4: lea edx, var_30
  loc_00455FD7: push ecx
  loc_00455FD8: push edx
  loc_00455FD9: push 00000004h
  loc_00455FDB: call [00401038h] ; __vbaFreeVarList
  loc_00455FE1: add esp, 00000014h
  loc_00455FE4: lea esi, var_1C
  loc_00455FE7: mov ecx, 0000000Ah
  loc_00455FEC: mov eax, 80020004h
  loc_00455FF1: push esi
  loc_00455FF2: mov var_C0, ecx
  loc_00455FF8: sub esp, 00000010h
  loc_00455FFB: mov var_B8, eax
  loc_00456001: mov esi, esp
  loc_00456003: sub esp, 00000010h
  loc_00456006: mov var_B0, 00000003h
  loc_00456010: mov edx, [0061A13Ch]
  loc_00456016: mov [esi], ecx
  loc_00456018: mov ecx, var_CC
  loc_0045601E: mov var_A8, 00000002h
  loc_00456028: mov edx, [edx]
  loc_0045602A: mov [esi+00000004h], ecx
  loc_0045602D: mov ecx, esp
  loc_0045602F: sub esp, 00000010h
  loc_00456032: mov [esi+00000008h], eax
  loc_00456035: mov eax, var_C4
  loc_0045603B: mov [esi+0000000Ch], eax
  loc_0045603E: mov eax, var_C0
  loc_00456044: mov [ecx], eax
  loc_00456046: mov eax, var_BC
  loc_0045604C: mov [ecx+00000004h], eax
  loc_0045604F: mov eax, var_B8
  loc_00456055: mov [ecx+00000008h], eax
  loc_00456058: mov eax, var_B4
  loc_0045605E: mov [ecx+0000000Ch], eax
  loc_00456061: mov eax, var_B0
  loc_00456067: mov ecx, esp
  loc_00456069: push 0041F268h ; "AgentThai"
  loc_0045606E: mov [ecx], eax
  loc_00456070: mov eax, var_AC
  loc_00456076: mov [ecx+00000004h], eax
  loc_00456079: mov eax, var_A8
  loc_0045607F: mov [ecx+00000008h], eax
  loc_00456082: mov eax, var_A4
  loc_00456088: mov [ecx+0000000Ch], eax
  loc_0045608B: mov ecx, [0061A13Ch]
  loc_00456091: push ecx
  loc_00456092: call [edx+000000BCh]
  loc_00456098: cmp eax, ebx
  loc_0045609A: fnclex
  loc_0045609C: jge 004560B6h
  loc_0045609E: mov edx, [0061A13Ch]
  loc_004560A4: push 000000BCh
  loc_004560A9: push 0041E928h
  loc_004560AE: push edx
  loc_004560AF: push eax
  loc_004560B0: call [00401074h] ; __vbaHresultCheckObj
  loc_004560B6: mov eax, var_1C
  loc_004560B9: lea esi, [edi+00000034h]
  loc_004560BC: push eax
  loc_004560BD: push esi
  loc_004560BE: call [004010B8h] ; __vbaObjSetAddref
  loc_004560C4: lea ecx, var_1C
  loc_004560C7: call [004012B0h] ; __vbaFreeObj
  loc_004560CD: mov eax, [esi]
  loc_004560CF: push eax
  loc_004560D0: mov ecx, [eax]
  loc_004560D2: call [ecx+000000C0h]
  loc_004560D8: cmp eax, ebx
  loc_004560DA: fnclex
  loc_004560DC: jge 004560F2h
  loc_004560DE: mov edx, [esi]
  loc_004560E0: push 000000C0h
  loc_004560E5: push 0041E938h
  loc_004560EA: push edx
  loc_004560EB: push eax
  loc_004560EC: call [00401074h] ; __vbaHresultCheckObj
  loc_004560F2: mov eax, [edi]
  loc_004560F4: push edi
  loc_004560F5: call [eax+00000324h]
  loc_004560FB: lea ecx, var_1C
  loc_004560FE: push eax
  loc_004560FF: push ecx
  loc_00456100: call [004010A0h] ; __vbaObjSet
  loc_00456106: mov edx, [eax]
  loc_00456108: lea ecx, var_14
  loc_0045610B: push ecx
  loc_0045610C: push eax
  loc_0045610D: mov var_E4, eax
  loc_00456113: call [edx+000000A0h]
  loc_00456119: cmp eax, ebx
  loc_0045611B: fnclex
  loc_0045611D: jge 00456137h
  loc_0045611F: mov edx, var_E4
  loc_00456125: push 000000A0h
  loc_0045612A: push 0041E5E8h
  loc_0045612F: push edx
  loc_00456130: push eax
  loc_00456131: call [00401074h] ; __vbaHresultCheckObj
  loc_00456137: mov eax, var_14
  loc_0045613A: lea ecx, var_40
  loc_0045613D: mov var_28, eax
  loc_00456140: lea eax, var_30
  loc_00456143: push eax
  loc_00456144: push ecx
  loc_00456145: mov var_14, ebx
  loc_00456148: mov var_30, 00000008h
  loc_0045614F: call [004010D4h] ; rtcTrimVar
  loc_00456155: mov eax, [esi]
  loc_00456157: mov ecx, var_40
  loc_0045615A: mov var_A8, 0041EB18h ; "AgentName"
  loc_00456164: mov var_B0, 00000008h
  loc_0045616E: mov edx, [eax]
  loc_00456170: sub esp, 00000010h
  loc_00456173: mov eax, esp
  loc_00456175: sub esp, 00000010h
  loc_00456178: mov [eax], ecx
  loc_0045617A: mov ecx, var_3C
  loc_0045617D: mov [eax+00000004h], ecx
  loc_00456180: mov ecx, var_38
  loc_00456183: mov [eax+00000008h], ecx
  loc_00456186: mov ecx, var_34
  loc_00456189: mov [eax+0000000Ch], ecx
  loc_0045618C: mov ecx, var_B0
  loc_00456192: mov eax, esp
  loc_00456194: mov [eax], ecx
  loc_00456196: mov ecx, var_AC
  loc_0045619C: mov [eax+00000004h], ecx
  loc_0045619F: mov ecx, var_A8
  loc_004561A5: mov [eax+00000008h], ecx
  loc_004561A8: mov ecx, var_A4
  loc_004561AE: mov [eax+0000000Ch], ecx
  loc_004561B1: mov eax, [esi]
  loc_004561B3: push eax
  loc_004561B4: call [edx+00000128h]
  loc_004561BA: cmp eax, ebx
  loc_004561BC: fnclex
  loc_004561BE: jge 004561D4h
  loc_004561C0: mov edx, [esi]
  loc_004561C2: push 00000128h
  loc_004561C7: push 0041E938h
  loc_004561CC: push edx
  loc_004561CD: push eax
  loc_004561CE: call [00401074h] ; __vbaHresultCheckObj
  loc_004561D4: lea ecx, var_1C
  loc_004561D7: call [004012B0h] ; __vbaFreeObj
  loc_004561DD: lea eax, var_40
  loc_004561E0: lea ecx, var_30
  loc_004561E3: push eax
  loc_004561E4: push ecx
  loc_004561E5: push 00000002h
  loc_004561E7: call [00401038h] ; __vbaFreeVarList
  loc_004561ED: mov edx, [edi]
  loc_004561EF: add esp, 0000000Ch
  loc_004561F2: push edi
  loc_004561F3: call [edx+00000320h]
  loc_004561F9: push eax
  loc_004561FA: lea eax, var_1C
  loc_004561FD: push eax
  loc_004561FE: call [004010A0h] ; __vbaObjSet
  loc_00456204: mov ecx, [eax]
  loc_00456206: lea edx, var_14
  loc_00456209: push edx
  loc_0045620A: push eax
  loc_0045620B: mov var_E4, eax
  loc_00456211: call [ecx+000000A0h]
  loc_00456217: cmp eax, ebx
  loc_00456219: fnclex
  loc_0045621B: jge 00456235h
  loc_0045621D: mov ecx, var_E4
  loc_00456223: push 000000A0h
  loc_00456228: push 0041E5E8h
  loc_0045622D: push ecx
  loc_0045622E: push eax
  loc_0045622F: call [00401074h] ; __vbaHresultCheckObj
  loc_00456235: mov eax, var_14
  loc_00456238: lea edx, var_30
  loc_0045623B: mov var_28, eax
  loc_0045623E: lea eax, var_40
  loc_00456241: push edx
  loc_00456242: push eax
  loc_00456243: mov var_14, ebx
  loc_00456246: mov var_30, 00000008h
  loc_0045624D: call [004010D4h] ; rtcTrimVar
  loc_00456253: mov ecx, [edi]
  loc_00456255: push edi
  loc_00456256: call [ecx+00000320h]
  loc_0045625C: lea edx, var_20
  loc_0045625F: push eax
  loc_00456260: push edx
  loc_00456261: call [004010A0h] ; __vbaObjSet
  loc_00456267: mov ecx, [eax]
  loc_00456269: lea edx, var_18
  loc_0045626C: push edx
  loc_0045626D: push eax
  loc_0045626E: mov var_EC, eax
  loc_00456274: call [ecx+000000A0h]
  loc_0045627A: cmp eax, ebx
  loc_0045627C: fnclex
  loc_0045627E: jge 00456298h
  loc_00456280: mov ecx, var_EC
  loc_00456286: push 000000A0h
  loc_0045628B: push 0041E5E8h
  loc_00456290: push ecx
  loc_00456291: push eax
  loc_00456292: call [00401074h] ; __vbaHresultCheckObj
  loc_00456298: mov eax, var_18
  loc_0045629B: lea edx, var_60
  loc_0045629E: mov var_58, eax
  loc_004562A1: lea eax, var_70
  loc_004562A4: push edx
  loc_004562A5: push eax
  loc_004562A6: mov var_18, ebx
  loc_004562A9: mov var_60, 00000008h
  loc_004562B0: call [004010D4h] ; rtcTrimVar
  loc_004562B6: lea edx, var_C0
  loc_004562BC: lea ecx, var_90
  loc_004562C2: mov var_B8, 0041F1E0h ; "-"
  loc_004562CC: mov var_C0, 00000008h
  loc_004562D6: call [00401240h] ; __vbaVarDup
  loc_004562DC: lea ecx, var_40
  loc_004562DF: lea edx, var_B0
  loc_004562E5: push ecx
  loc_004562E6: lea eax, var_50
  loc_004562E9: push edx
  loc_004562EA: push eax
  loc_004562EB: mov var_A8, 0041E5D4h
  loc_004562F5: mov var_B0, 00008008h
  loc_004562FF: call [00401050h] ; __vbaVarCmpNe
  loc_00456305: mov edx, eax
  loc_00456307: lea ecx, var_80
  loc_0045630A: call [00401014h] ; __vbaVarMove
  loc_00456310: lea ecx, var_90
  loc_00456316: lea edx, var_70
  loc_00456319: push ecx
  loc_0045631A: lea eax, var_80
  loc_0045631D: push edx
  loc_0045631E: lea ecx, var_A0
  loc_00456324: push eax
  loc_00456325: push ecx
  loc_00456326: call [004011F0h] ; rtcImmediateIf
  loc_0045632C: mov eax, [esi]
  loc_0045632E: mov ecx, var_A0
  loc_00456334: sub esp, 00000010h
  loc_00456337: mov edx, [eax]
  loc_00456339: mov eax, esp
  loc_0045633B: sub esp, 00000010h
  loc_0045633E: mov [eax], ecx
  loc_00456340: mov ecx, var_9C
  loc_00456346: mov [eax+00000004h], ecx
  loc_00456349: mov ecx, var_98
  loc_0045634F: mov [eax+00000008h], ecx
  loc_00456352: mov ecx, var_94
  loc_00456358: mov [eax+0000000Ch], ecx
  loc_0045635B: mov ecx, esp
  loc_0045635D: mov eax, 00000008h
  loc_00456362: mov [ecx], eax
  loc_00456364: mov eax, var_CC
  loc_0045636A: mov [ecx+00000004h], eax
  loc_0045636D: mov eax, 0041F1E8h ; "Address"
  loc_00456372: mov [ecx+00000008h], eax
  loc_00456375: mov eax, var_C4
  loc_0045637B: mov [ecx+0000000Ch], eax
  loc_0045637E: mov eax, [esi]
  loc_00456380: push eax
  loc_00456381: call [edx+00000128h]
  loc_00456387: cmp eax, ebx
  loc_00456389: fnclex
  loc_0045638B: jge 004563A1h
  loc_0045638D: mov ecx, [esi]
  loc_0045638F: push 00000128h
  loc_00456394: push 0041E938h
  loc_00456399: push ecx
  loc_0045639A: push eax
  loc_0045639B: call [00401074h] ; __vbaHresultCheckObj
  loc_004563A1: lea edx, var_20
  loc_004563A4: lea eax, var_1C
  loc_004563A7: push edx
  loc_004563A8: push eax
  loc_004563A9: push 00000002h
  loc_004563AB: call [00401040h] ; __vbaFreeObjList
  loc_004563B1: lea ecx, var_A0
  loc_004563B7: lea edx, var_90
  loc_004563BD: push ecx
  loc_004563BE: lea eax, var_70
  loc_004563C1: push edx
  loc_004563C2: lea ecx, var_80
  loc_004563C5: push eax
  loc_004563C6: lea edx, var_60
  loc_004563C9: push ecx
  loc_004563CA: lea eax, var_40
  loc_004563CD: push edx
  loc_004563CE: lea ecx, var_30
  loc_004563D1: push eax
  loc_004563D2: push ecx
  loc_004563D3: push 00000007h
  loc_004563D5: call [00401038h] ; __vbaFreeVarList
  loc_004563DB: mov edx, [edi]
  loc_004563DD: add esp, 0000002Ch
  loc_004563E0: push edi
  loc_004563E1: call [edx+00000308h]
  loc_004563E7: push eax
  loc_004563E8: lea eax, var_1C
  loc_004563EB: push eax
  loc_004563EC: call [004010A0h] ; __vbaObjSet
  loc_004563F2: mov ecx, [eax]
  loc_004563F4: lea edx, var_14
  loc_004563F7: push edx
  loc_004563F8: push eax
  loc_004563F9: mov var_E4, eax
  loc_004563FF: call [ecx+000000A0h]
  loc_00456405: cmp eax, ebx
  loc_00456407: fnclex
  loc_00456409: jge 00456423h
  loc_0045640B: mov ecx, var_E4
  loc_00456411: push 000000A0h
  loc_00456416: push 0041E5E8h
  loc_0045641B: push ecx
  loc_0045641C: push eax
  loc_0045641D: call [00401074h] ; __vbaHresultCheckObj
  loc_00456423: mov eax, var_14
  loc_00456426: lea edx, var_30
  loc_00456429: mov var_28, eax
  loc_0045642C: lea eax, var_40
  loc_0045642F: push edx
  loc_00456430: push eax
  loc_00456431: mov var_14, ebx
  loc_00456434: mov var_30, 00000008h
  loc_0045643B: call [004010D4h] ; rtcTrimVar
  loc_00456441: mov ecx, [edi]
  loc_00456443: push edi
  loc_00456444: call [ecx+00000308h]
  loc_0045644A: lea edx, var_20
  loc_0045644D: push eax
  loc_0045644E: push edx
  loc_0045644F: call [004010A0h] ; __vbaObjSet
  loc_00456455: mov ecx, [eax]
  loc_00456457: lea edx, var_18
  loc_0045645A: push edx
  loc_0045645B: push eax
  loc_0045645C: mov var_EC, eax
  loc_00456462: call [ecx+000000A0h]
  loc_00456468: cmp eax, ebx
  loc_0045646A: fnclex
  loc_0045646C: jge 00456486h
  loc_0045646E: mov ecx, var_EC
  loc_00456474: push 000000A0h
  loc_00456479: push 0041E5E8h
  loc_0045647E: push ecx
  loc_0045647F: push eax
  loc_00456480: call [00401074h] ; __vbaHresultCheckObj
  loc_00456486: mov eax, var_18
  loc_00456489: lea edx, var_60
  loc_0045648C: mov var_58, eax
  loc_0045648F: lea eax, var_70
  loc_00456492: push edx
  loc_00456493: push eax
  loc_00456494: mov var_18, ebx
  loc_00456497: mov var_60, 00000008h
  loc_0045649E: call [004010D4h] ; rtcTrimVar
  loc_004564A4: lea edx, var_C0
  loc_004564AA: lea ecx, var_90
  loc_004564B0: mov var_B8, 0041F1E0h ; "-"
  loc_004564BA: mov var_C0, 00000008h
  loc_004564C4: call [00401240h] ; __vbaVarDup
  loc_004564CA: lea ecx, var_40
  loc_004564CD: lea edx, var_B0
  loc_004564D3: push ecx
  loc_004564D4: lea eax, var_50
  loc_004564D7: push edx
  loc_004564D8: push eax
  loc_004564D9: mov var_A8, 0041E5D4h
  loc_004564E3: mov var_B0, 00008008h
  loc_004564ED: call [00401050h] ; __vbaVarCmpNe
  loc_004564F3: mov edx, eax
  loc_004564F5: lea ecx, var_80
  loc_004564F8: call [00401014h] ; __vbaVarMove
  loc_004564FE: lea ecx, var_90
  loc_00456504: lea edx, var_70
  loc_00456507: push ecx
  loc_00456508: lea eax, var_80
  loc_0045650B: push edx
  loc_0045650C: lea ecx, var_A0
  loc_00456512: push eax
  loc_00456513: push ecx
  loc_00456514: call [004011F0h] ; rtcImmediateIf
  loc_0045651A: mov eax, [esi]
  loc_0045651C: mov ecx, var_A0
  loc_00456522: sub esp, 00000010h
  loc_00456525: mov edx, [eax]
  loc_00456527: mov eax, esp
  loc_00456529: sub esp, 00000010h
  loc_0045652C: mov [eax], ecx
  loc_0045652E: mov ecx, var_9C
  loc_00456534: mov [eax+00000004h], ecx
  loc_00456537: mov ecx, var_98
  loc_0045653D: mov [eax+00000008h], ecx
  loc_00456540: mov ecx, var_94
  loc_00456546: mov [eax+0000000Ch], ecx
  loc_00456549: mov ecx, esp
  loc_0045654B: mov eax, 00000008h
  loc_00456550: mov [ecx], eax
  loc_00456552: mov eax, var_CC
  loc_00456558: mov [ecx+00000004h], eax
  loc_0045655B: mov eax, 0041F1FCh ; "Phone"
  loc_00456560: mov [ecx+00000008h], eax
  loc_00456563: mov eax, var_C4
  loc_00456569: mov [ecx+0000000Ch], eax
  loc_0045656C: mov eax, [esi]
  loc_0045656E: push eax
  loc_0045656F: call [edx+00000128h]
  loc_00456575: cmp eax, ebx
  loc_00456577: fnclex
  loc_00456579: jge 0045658Fh
  loc_0045657B: mov ecx, [esi]
  loc_0045657D: push 00000128h
  loc_00456582: push 0041E938h
  loc_00456587: push ecx
  loc_00456588: push eax
  loc_00456589: call [00401074h] ; __vbaHresultCheckObj
  loc_0045658F: lea edx, var_20
  loc_00456592: lea eax, var_1C
  loc_00456595: push edx
  loc_00456596: push eax
  loc_00456597: push 00000002h
  loc_00456599: call [00401040h] ; __vbaFreeObjList
  loc_0045659F: lea ecx, var_A0
  loc_004565A5: lea edx, var_90
  loc_004565AB: push ecx
  loc_004565AC: lea eax, var_70
  loc_004565AF: push edx
  loc_004565B0: lea ecx, var_80
  loc_004565B3: push eax
  loc_004565B4: lea edx, var_60
  loc_004565B7: push ecx
  loc_004565B8: lea eax, var_40
  loc_004565BB: push edx
  loc_004565BC: lea ecx, var_30
  loc_004565BF: push eax
  loc_004565C0: push ecx
  loc_004565C1: push 00000007h
  loc_004565C3: call [00401038h] ; __vbaFreeVarList
  loc_004565C9: mov edx, [edi]
  loc_004565CB: add esp, 0000002Ch
  loc_004565CE: push edi
  loc_004565CF: call [edx+00000304h]
  loc_004565D5: push eax
  loc_004565D6: lea eax, var_1C
  loc_004565D9: push eax
  loc_004565DA: call [004010A0h] ; __vbaObjSet
  loc_004565E0: mov ecx, [eax]
  loc_004565E2: lea edx, var_14
  loc_004565E5: push edx
  loc_004565E6: push eax
  loc_004565E7: mov var_E4, eax
  loc_004565ED: call [ecx+000000A0h]
  loc_004565F3: cmp eax, ebx
  loc_004565F5: fnclex
  loc_004565F7: jge 00456611h
  loc_004565F9: mov ecx, var_E4
  loc_004565FF: push 000000A0h
  loc_00456604: push 0041E5E8h
  loc_00456609: push ecx
  loc_0045660A: push eax
  loc_0045660B: call [00401074h] ; __vbaHresultCheckObj
  loc_00456611: mov eax, var_14
  loc_00456614: lea edx, var_30
  loc_00456617: mov var_28, eax
  loc_0045661A: lea eax, var_40
  loc_0045661D: push edx
  loc_0045661E: push eax
  loc_0045661F: mov var_14, ebx
  loc_00456622: mov var_30, 00000008h
  loc_00456629: call [004010D4h] ; rtcTrimVar
  loc_0045662F: mov ecx, [edi]
  loc_00456631: push edi
  loc_00456632: call [ecx+00000304h]
  loc_00456638: lea edx, var_20
  loc_0045663B: push eax
  loc_0045663C: push edx
  loc_0045663D: call [004010A0h] ; __vbaObjSet
  loc_00456643: mov ecx, [eax]
  loc_00456645: lea edx, var_18
  loc_00456648: push edx
  loc_00456649: push eax
  loc_0045664A: mov var_EC, eax
  loc_00456650: call [ecx+000000A0h]
  loc_00456656: cmp eax, ebx
  loc_00456658: fnclex
  loc_0045665A: jge 00456674h
  loc_0045665C: mov ecx, var_EC
  loc_00456662: push 000000A0h
  loc_00456667: push 0041E5E8h
  loc_0045666C: push ecx
  loc_0045666D: push eax
  loc_0045666E: call [00401074h] ; __vbaHresultCheckObj
  loc_00456674: mov eax, var_18
  loc_00456677: lea edx, var_60
  loc_0045667A: mov var_58, eax
  loc_0045667D: lea eax, var_70
  loc_00456680: push edx
  loc_00456681: push eax
  loc_00456682: mov var_18, ebx
  loc_00456685: mov var_60, 00000008h
  loc_0045668C: call [004010D4h] ; rtcTrimVar
  loc_00456692: lea edx, var_C0
  loc_00456698: lea ecx, var_90
  loc_0045669E: mov var_B8, 0041EDF8h
  loc_004566A8: mov var_C0, 00000008h
  loc_004566B2: call [00401240h] ; __vbaVarDup
  loc_004566B8: lea ecx, var_40
  loc_004566BB: lea edx, var_B0
  loc_004566C1: push ecx
  loc_004566C2: lea eax, var_50
  loc_004566C5: push edx
  loc_004566C6: push eax
  loc_004566C7: mov var_A8, 0041E5D4h
  loc_004566D1: mov var_B0, 00008008h
  loc_004566DB: call [00401050h] ; __vbaVarCmpNe
  loc_004566E1: mov edx, eax
  loc_004566E3: lea ecx, var_80
  loc_004566E6: call [00401014h] ; __vbaVarMove
  loc_004566EC: lea ecx, var_90
  loc_004566F2: lea edx, var_70
  loc_004566F5: push ecx
  loc_004566F6: lea eax, var_80
  loc_004566F9: push edx
  loc_004566FA: lea ecx, var_A0
  loc_00456700: push eax
  loc_00456701: push ecx
  loc_00456702: call [004011F0h] ; rtcImmediateIf
  loc_00456708: mov eax, [esi]
  loc_0045670A: mov ecx, var_A0
  loc_00456710: sub esp, 00000010h
  loc_00456713: mov edx, [eax]
  loc_00456715: mov eax, esp
  loc_00456717: sub esp, 00000010h
  loc_0045671A: mov [eax], ecx
  loc_0045671C: mov ecx, var_9C
  loc_00456722: mov [eax+00000004h], ecx
  loc_00456725: mov ecx, var_98
  loc_0045672B: mov [eax+00000008h], ecx
  loc_0045672E: mov ecx, var_94
  loc_00456734: mov [eax+0000000Ch], ecx
  loc_00456737: mov ecx, esp
  loc_00456739: mov eax, 00000008h
  loc_0045673E: mov [ecx], eax
  loc_00456740: mov eax, var_CC
  loc_00456746: mov [ecx+00000004h], eax
  loc_00456749: mov eax, 0041F20Ch ; "Commision"
  loc_0045674E: mov [ecx+00000008h], eax
  loc_00456751: mov eax, var_C4
  loc_00456757: mov [ecx+0000000Ch], eax
  loc_0045675A: mov eax, [esi]
  loc_0045675C: push eax
  loc_0045675D: call [edx+00000128h]
  loc_00456763: cmp eax, ebx
  loc_00456765: fnclex
  loc_00456767: jge 0045677Dh
  loc_00456769: mov ecx, [esi]
  loc_0045676B: push 00000128h
  loc_00456770: push 0041E938h
  loc_00456775: push ecx
  loc_00456776: push eax
  loc_00456777: call [00401074h] ; __vbaHresultCheckObj
  loc_0045677D: lea edx, var_20
  loc_00456780: lea eax, var_1C
  loc_00456783: push edx
  loc_00456784: push eax
  loc_00456785: push 00000002h
  loc_00456787: call [00401040h] ; __vbaFreeObjList
  loc_0045678D: lea ecx, var_A0
  loc_00456793: lea edx, var_90
  loc_00456799: push ecx
  loc_0045679A: lea eax, var_70
  loc_0045679D: push edx
  loc_0045679E: lea ecx, var_80
  loc_004567A1: push eax
  loc_004567A2: lea edx, var_60
  loc_004567A5: push ecx
  loc_004567A6: lea eax, var_40
  loc_004567A9: push edx
  loc_004567AA: lea ecx, var_30
  loc_004567AD: push eax
  loc_004567AE: push ecx
  loc_004567AF: push 00000007h
  loc_004567B1: call [00401038h] ; __vbaFreeVarList
  loc_004567B7: mov edx, [edi]
  loc_004567B9: add esp, 0000002Ch
  loc_004567BC: push edi
  loc_004567BD: call [edx+00000300h]
  loc_004567C3: push eax
  loc_004567C4: lea eax, var_1C
  loc_004567C7: push eax
  loc_004567C8: call [004010A0h] ; __vbaObjSet
  loc_004567CE: mov ecx, [eax]
  loc_004567D0: lea edx, var_14
  loc_004567D3: push edx
  loc_004567D4: push eax
  loc_004567D5: mov var_E4, eax
  loc_004567DB: call [ecx+000000A0h]
  loc_004567E1: cmp eax, ebx
  loc_004567E3: fnclex
  loc_004567E5: jge 004567FFh
  loc_004567E7: mov ecx, var_E4
  loc_004567ED: push 000000A0h
  loc_004567F2: push 0041E5E8h
  loc_004567F7: push ecx
  loc_004567F8: push eax
  loc_004567F9: call [00401074h] ; __vbaHresultCheckObj
  loc_004567FF: mov eax, var_14
  loc_00456802: lea edx, var_30
  loc_00456805: mov var_28, eax
  loc_00456808: lea eax, var_40
  loc_0045680B: push edx
  loc_0045680C: push eax
  loc_0045680D: mov var_14, ebx
  loc_00456810: mov var_30, 00000008h
  loc_00456817: call [004010D4h] ; rtcTrimVar
  loc_0045681D: mov ecx, [edi]
  loc_0045681F: push edi
  loc_00456820: call [ecx+00000300h]
  loc_00456826: lea edx, var_20
  loc_00456829: push eax
  loc_0045682A: push edx
  loc_0045682B: call [004010A0h] ; __vbaObjSet
  loc_00456831: mov edi, eax
  loc_00456833: lea ecx, var_18
  loc_00456836: push ecx
  loc_00456837: push edi
  loc_00456838: mov eax, [edi]
  loc_0045683A: call [eax+000000A0h]
  loc_00456840: cmp eax, ebx
  loc_00456842: fnclex
  loc_00456844: jge 00456858h
  loc_00456846: push 000000A0h
  loc_0045684B: push 0041E5E8h
  loc_00456850: push edi
  loc_00456851: push eax
  loc_00456852: call [00401074h] ; __vbaHresultCheckObj
  loc_00456858: mov eax, var_18
  loc_0045685B: lea edx, var_60
  loc_0045685E: mov var_58, eax
  loc_00456861: lea eax, var_70
  loc_00456864: mov edi, 00000008h
  loc_00456869: push edx
  loc_0045686A: push eax
  loc_0045686B: mov var_18, ebx
  loc_0045686E: mov var_60, edi
  loc_00456871: call [004010D4h] ; rtcTrimVar
  loc_00456877: lea edx, var_C0
  loc_0045687D: lea ecx, var_90
  loc_00456883: mov var_B8, 0041EDF8h
  loc_0045688D: mov var_C0, edi
  loc_00456893: call [00401240h] ; __vbaVarDup
  loc_00456899: lea ecx, var_40
  loc_0045689C: lea edx, var_B0
  loc_004568A2: push ecx
  loc_004568A3: lea eax, var_50
  loc_004568A6: push edx
  loc_004568A7: push eax
  loc_004568A8: mov var_A8, 0041E5D4h
  loc_004568B2: mov var_B0, 00008008h
  loc_004568BC: call [00401050h] ; __vbaVarCmpNe
  loc_004568C2: mov edx, eax
  loc_004568C4: lea ecx, var_80
  loc_004568C7: call [00401014h] ; __vbaVarMove
  loc_004568CD: lea ecx, var_90
  loc_004568D3: lea edx, var_70
  loc_004568D6: push ecx
  loc_004568D7: lea eax, var_80
  loc_004568DA: push edx
  loc_004568DB: lea ecx, var_A0
  loc_004568E1: push eax
  loc_004568E2: push ecx
  loc_004568E3: call [004011F0h] ; rtcImmediateIf
  loc_004568E9: mov edi, var_A0
  loc_004568EF: sub esp, 00000010h
  loc_004568F2: mov ecx, esp
  loc_004568F4: sub esp, 00000010h
  loc_004568F7: mov eax, [esi]
  loc_004568F9: mov [ecx], edi
  loc_004568FB: mov edi, var_9C
  loc_00456901: mov edx, [eax]
  loc_00456903: mov [ecx+00000004h], edi
  loc_00456906: mov edi, var_98
  loc_0045690C: mov [ecx+00000008h], edi
  loc_0045690F: mov edi, var_94
  loc_00456915: mov [ecx+0000000Ch], edi
  loc_00456918: mov edi, esp
  loc_0045691A: mov ecx, 00000008h
  loc_0045691F: push eax
  loc_00456920: mov [edi], ecx
  loc_00456922: mov ecx, var_CC
  loc_00456928: mov [edi+00000004h], ecx
  loc_0045692B: mov ecx, 0041F224h ; "Rate"
  loc_00456930: mov [edi+00000008h], ecx
  loc_00456933: mov ecx, var_C4
  loc_00456939: mov [edi+0000000Ch], ecx
  loc_0045693C: call [edx+00000128h]
  loc_00456942: cmp eax, ebx
  loc_00456944: fnclex
  loc_00456946: jge 0045695Ch
  loc_00456948: mov edx, [esi]
  loc_0045694A: push 00000128h
  loc_0045694F: push 0041E938h
  loc_00456954: push edx
  loc_00456955: push eax
  loc_00456956: call [00401074h] ; __vbaHresultCheckObj
  loc_0045695C: lea eax, var_20
  loc_0045695F: lea ecx, var_1C
  loc_00456962: push eax
  loc_00456963: push ecx
  loc_00456964: push 00000002h
  loc_00456966: call [00401040h] ; __vbaFreeObjList
  loc_0045696C: lea edx, var_A0
  loc_00456972: lea eax, var_90
  loc_00456978: mov edi, [00401038h] ; __vbaFreeVarList
  loc_0045697E: push edx
  loc_0045697F: lea ecx, var_70
  loc_00456982: push eax
  loc_00456983: lea edx, var_80
  loc_00456986: push ecx
  loc_00456987: lea eax, var_60
  loc_0045698A: push edx
  loc_0045698B: lea ecx, var_40
  loc_0045698E: push eax
  loc_0045698F: lea edx, var_30
  loc_00456992: push ecx
  loc_00456993: push edx
  loc_00456994: push 00000007h
  loc_00456996: call edi
  loc_00456998: mov eax, [esi]
  loc_0045699A: add esp, 0000002Ch
  loc_0045699D: mov ecx, [eax]
  loc_0045699F: push ebx
  loc_004569A0: push 00000001h
  loc_004569A2: push eax
  loc_004569A3: call [ecx+00000164h]
  loc_004569A9: cmp eax, ebx
  loc_004569AB: fnclex
  loc_004569AD: jge 004569C3h
  loc_004569AF: mov edx, [esi]
  loc_004569B1: push 00000164h
  loc_004569B6: push 0041E938h
  loc_004569BB: push edx
  loc_004569BC: push eax
  loc_004569BD: call [00401074h] ; __vbaHresultCheckObj
  loc_004569C3: mov ecx, 80020004h
  loc_004569C8: mov eax, 0000000Ah
  loc_004569CD: mov var_58, ecx
  loc_004569D0: mov var_48, ecx
  loc_004569D3: mov var_38, ecx
  loc_004569D6: lea edx, var_B0
  loc_004569DC: lea ecx, var_30
  loc_004569DF: mov var_60, eax
  loc_004569E2: mov var_50, eax
  loc_004569E5: mov var_40, eax
  loc_004569E8: mov var_A8, 0041F378h ; "Save Successfully."
  loc_004569F2: mov var_B0, 00000008h
  loc_004569FC: call [00401240h] ; __vbaVarDup
  loc_00456A02: lea eax, var_60
  loc_00456A05: lea ecx, var_50
  loc_00456A08: push eax
  loc_00456A09: lea edx, var_40
  loc_00456A0C: push ecx
  loc_00456A0D: push edx
  loc_00456A0E: lea eax, var_30
  loc_00456A11: push 00000040h
  loc_00456A13: push eax
  loc_00456A14: call [004010A4h] ; rtcMsgBox
  loc_00456A1A: lea ecx, var_60
  loc_00456A1D: lea edx, var_50
  loc_00456A20: push ecx
  loc_00456A21: lea eax, var_40
  loc_00456A24: push edx
  loc_00456A25: lea ecx, var_30
  loc_00456A28: push eax
  loc_00456A29: push ecx
  loc_00456A2A: push 00000004h
  loc_00456A2C: call edi
  loc_00456A2E: mov eax, [esi]
  loc_00456A30: add esp, 00000014h
  loc_00456A33: mov edx, [eax]
  loc_00456A35: push eax
  loc_00456A36: call [edx+000000C4h]
  loc_00456A3C: cmp eax, ebx
  loc_00456A3E: fnclex
  loc_00456A40: jge 00456A56h
  loc_00456A42: mov ecx, [esi]
  loc_00456A44: push 000000C4h
  loc_00456A49: push 0041E938h
  loc_00456A4E: push ecx
  loc_00456A4F: push eax
  loc_00456A50: call [00401074h] ; __vbaHresultCheckObj
  loc_00456A56: push 0041E938h
  loc_00456A5B: push ebx
  loc_00456A5C: call [00401274h] ; __vbaCastObj
  loc_00456A62: lea edx, var_1C
  loc_00456A65: push eax
  loc_00456A66: push edx
  loc_00456A67: call [004010A0h] ; __vbaObjSet
  loc_00456A6D: push eax
  loc_00456A6E: push esi
  loc_00456A6F: call [004010B8h] ; __vbaObjSetAddref
  loc_00456A75: lea ecx, var_1C
  loc_00456A78: call [004012B0h] ; __vbaFreeObj
  loc_00456A7E: push 00456B58h
  loc_00456A83: jmp 00456B57h
  loc_00456A88: mov ecx, 80020004h
  loc_00456A8D: mov eax, 0000000Ah
  loc_00456A92: mov var_58, ecx
  loc_00456A95: mov var_48, ecx
  loc_00456A98: mov var_38, ecx
  loc_00456A9B: lea edx, var_B0
  loc_00456AA1: lea ecx, var_30
  loc_00456AA4: mov [edi+0000003Eh], bx
  loc_00456AA8: mov var_60, eax
  loc_00456AAB: mov var_50, eax
  loc_00456AAE: mov var_40, eax
  loc_00456AB1: mov var_A8, 0041EA5Ch ; "Cann't Save Successfully."
  loc_00456ABB: mov var_B0, 00000008h
  loc_00456AC5: call [00401240h] ; __vbaVarDup
  loc_00456ACB: lea eax, var_60
  loc_00456ACE: lea ecx, var_50
  loc_00456AD1: push eax
  loc_00456AD2: lea edx, var_40
  loc_00456AD5: push ecx
  loc_00456AD6: push edx
  loc_00456AD7: lea eax, var_30
  loc_00456ADA: push 00000010h
  loc_00456ADC: push eax
  loc_00456ADD: call [004010A4h] ; rtcMsgBox
  loc_00456AE3: lea ecx, var_60
  loc_00456AE6: lea edx, var_50
  loc_00456AE9: push ecx
  loc_00456AEA: lea eax, var_40
  loc_00456AED: push edx
  loc_00456AEE: lea ecx, var_30
  loc_00456AF1: push eax
  loc_00456AF2: push ecx
  loc_00456AF3: push 00000004h
  loc_00456AF5: call [00401038h] ; __vbaFreeVarList
  loc_00456AFB: add esp, 00000014h
  loc_00456AFE: push 00456B58h
  loc_00456B03: jmp 00456B57h
  loc_00456B05: lea edx, var_18
  loc_00456B08: lea eax, var_14
  loc_00456B0B: push edx
  loc_00456B0C: push eax
  loc_00456B0D: push 00000002h
  loc_00456B0F: call [004011FCh] ; __vbaFreeStrList
  loc_00456B15: lea ecx, var_20
  loc_00456B18: lea edx, var_1C
  loc_00456B1B: push ecx
  loc_00456B1C: push edx
  loc_00456B1D: push 00000002h
  loc_00456B1F: call [00401040h] ; __vbaFreeObjList
  loc_00456B25: lea eax, var_A0
  loc_00456B2B: lea ecx, var_90
  loc_00456B31: push eax
  loc_00456B32: lea edx, var_80
  loc_00456B35: push ecx
  loc_00456B36: lea eax, var_70
  loc_00456B39: push edx
  loc_00456B3A: lea ecx, var_60
  loc_00456B3D: push eax
  loc_00456B3E: lea edx, var_50
  loc_00456B41: push ecx
  loc_00456B42: lea eax, var_40
  loc_00456B45: push edx
  loc_00456B46: lea ecx, var_30
  loc_00456B49: push eax
  loc_00456B4A: push ecx
  loc_00456B4B: push 00000008h
  loc_00456B4D: call [00401038h] ; __vbaFreeVarList
  loc_00456B53: add esp, 0000003Ch
  loc_00456B56: ret
  loc_00456B57: ret
  loc_00456B58: mov ecx, var_10
  loc_00456B5B: pop edi
  loc_00456B5C: pop esi
  loc_00456B5D: xor eax, eax
  loc_00456B5F: mov fs:[00000000h], ecx
  loc_00456B66: pop ebx
  loc_00456B67: mov esp, ebp
  loc_00456B69: pop ebp
  loc_00456B6A: retn 0004h
End Sub

Private Sub Proc_2_20_4573F0() '4573F0
  loc_004573F0: push ebp
  loc_004573F1: mov ebp, esp
  loc_004573F3: sub esp, 00000008h
  loc_004573F6: push 00403B36h ; __vbaExceptHandler
  loc_004573FB: mov eax, fs:[00000000h]
  loc_00457401: push eax
  loc_00457402: mov fs:[00000000h], esp
  loc_00457409: sub esp, 00000010h
  loc_0045740C: push ebx
  loc_0045740D: push esi
  loc_0045740E: push edi
  loc_0045740F: mov var_8, esp
  loc_00457412: mov var_4, 004014E0h
  loc_00457419: mov esi, Me
  loc_0045741C: mov var_14, 00000000h
  loc_00457423: push esi
  loc_00457424: mov eax, [esi]
  loc_00457426: call [eax+00000324h]
  loc_0045742C: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00457432: lea ecx, var_14
  loc_00457435: push eax
  loc_00457436: push ecx
  loc_00457437: call ebx
  loc_00457439: mov edi, eax
  loc_0045743B: push 0041E5D4h
  loc_00457440: push edi
  loc_00457441: mov edx, [edi]
  loc_00457443: call [edx+000000A4h]
  loc_00457449: test eax, eax
  loc_0045744B: fnclex
  loc_0045744D: jge 00457461h
  loc_0045744F: push 000000A4h
  loc_00457454: push 0041E5E8h
  loc_00457459: push edi
  loc_0045745A: push eax
  loc_0045745B: call [00401074h] ; __vbaHresultCheckObj
  loc_00457461: lea ecx, var_14
  loc_00457464: call [004012B0h] ; __vbaFreeObj
  loc_0045746A: mov eax, [esi]
  loc_0045746C: push esi
  loc_0045746D: call [eax+00000320h]
  loc_00457473: lea ecx, var_14
  loc_00457476: push eax
  loc_00457477: push ecx
  loc_00457478: call ebx
  loc_0045747A: mov edi, eax
  loc_0045747C: push 0041E5D4h
  loc_00457481: push edi
  loc_00457482: mov edx, [edi]
  loc_00457484: call [edx+000000A4h]
  loc_0045748A: test eax, eax
  loc_0045748C: fnclex
  loc_0045748E: jge 004574A2h
  loc_00457490: push 000000A4h
  loc_00457495: push 0041E5E8h
  loc_0045749A: push edi
  loc_0045749B: push eax
  loc_0045749C: call [00401074h] ; __vbaHresultCheckObj
  loc_004574A2: lea ecx, var_14
  loc_004574A5: call [004012B0h] ; __vbaFreeObj
  loc_004574AB: mov eax, [esi]
  loc_004574AD: push esi
  loc_004574AE: call [eax+00000308h]
  loc_004574B4: lea ecx, var_14
  loc_004574B7: push eax
  loc_004574B8: push ecx
  loc_004574B9: call ebx
  loc_004574BB: mov edi, eax
  loc_004574BD: push 0041E5D4h
  loc_004574C2: push edi
  loc_004574C3: mov edx, [edi]
  loc_004574C5: call [edx+000000A4h]
  loc_004574CB: test eax, eax
  loc_004574CD: fnclex
  loc_004574CF: jge 004574E3h
  loc_004574D1: push 000000A4h
  loc_004574D6: push 0041E5E8h
  loc_004574DB: push edi
  loc_004574DC: push eax
  loc_004574DD: call [00401074h] ; __vbaHresultCheckObj
  loc_004574E3: lea ecx, var_14
  loc_004574E6: call [004012B0h] ; __vbaFreeObj
  loc_004574EC: mov eax, [esi]
  loc_004574EE: push esi
  loc_004574EF: call [eax+00000304h]
  loc_004574F5: lea ecx, var_14
  loc_004574F8: push eax
  loc_004574F9: push ecx
  loc_004574FA: call ebx
  loc_004574FC: mov edi, eax
  loc_004574FE: push 0041E5D4h
  loc_00457503: push edi
  loc_00457504: mov edx, [edi]
  loc_00457506: call [edx+000000A4h]
  loc_0045750C: test eax, eax
  loc_0045750E: fnclex
  loc_00457510: jge 00457524h
  loc_00457512: push 000000A4h
  loc_00457517: push 0041E5E8h
  loc_0045751C: push edi
  loc_0045751D: push eax
  loc_0045751E: call [00401074h] ; __vbaHresultCheckObj
  loc_00457524: mov edi, [004012B0h] ; __vbaFreeObj
  loc_0045752A: lea ecx, var_14
  loc_0045752D: call edi
  loc_0045752F: mov eax, [esi]
  loc_00457531: push esi
  loc_00457532: call [eax+00000300h]
  loc_00457538: lea ecx, var_14
  loc_0045753B: push eax
  loc_0045753C: push ecx
  loc_0045753D: call ebx
  loc_0045753F: mov esi, eax
  loc_00457541: push 0041E5D4h
  loc_00457546: push esi
  loc_00457547: mov edx, [esi]
  loc_00457549: call [edx+000000A4h]
  loc_0045754F: test eax, eax
  loc_00457551: fnclex
  loc_00457553: jge 00457567h
  loc_00457555: push 000000A4h
  loc_0045755A: push 0041E5E8h
  loc_0045755F: push esi
  loc_00457560: push eax
  loc_00457561: call [00401074h] ; __vbaHresultCheckObj
  loc_00457567: lea ecx, var_14
  loc_0045756A: call edi
  loc_0045756C: push 0045757Eh
  loc_00457571: jmp 0045757Dh
  loc_00457573: lea ecx, var_14
  loc_00457576: call [004012B0h] ; __vbaFreeObj
  loc_0045757C: ret
  loc_0045757D: ret
  loc_0045757E: mov ecx, var_10
  loc_00457581: pop edi
  loc_00457582: pop esi
  loc_00457583: xor eax, eax
  loc_00457585: mov fs:[00000000h], ecx
  loc_0045758C: pop ebx
  loc_0045758D: mov esp, ebp
  loc_0045758F: pop ebp
  loc_00457590: retn 0004h
End Sub
