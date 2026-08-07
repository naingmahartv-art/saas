VERSION 5.00
Begin VB.Form frmLogin
  Caption = "Login"
  ScaleMode = 0
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 2835
  ClientTop = 3480
  ClientWidth = 4095
  ClientHeight = 1980
  ScaleLeft = 0
  ScaleTop = 0
  ScaleWidth = 3844.983
  ScaleHeight = 1169.849
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin VB.TextBox txtUserName
    Left = 1470
    Top = 315
    Width = 2325
    Height = 345
    TabIndex = 0
    PasswordChar = "*"
  End
  Begin VB.CommandButton cmdOK
    Caption = "OK"
    Left = 1500
    Top = 1320
    Width = 1050
    Height = 390
    TabIndex = 2
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
    Left = 2550
    Top = 1320
    Width = 1050
    Height = 390
    TabIndex = 3
    Cancel = -1  'True
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
  Begin VB.TextBox txtPassword
    Left = 1470
    Top = 795
    Width = 2325
    Height = 345
    TabIndex = 1
    PasswordChar = "*"
  End
  Begin VB.Label lblLabels
    Caption = "&User Name:"
    Index = 0
    Left = 375
    Top = 360
    Width = 1080
    Height = 270
    TabIndex = 4
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
  Begin VB.Label lblLabels
    Caption = "&Password:"
    Index = 1
    Left = 375
    Top = 840
    Width = 1080
    Height = 270
    TabIndex = 5
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
End

Attribute VB_Name = "frmLogin"

Public LoginSucceeded As Boolean


Private Sub txtUserName_KeyPress(KeyAscii As Integer) '5C8020
  loc_005C8020: push ebp
  loc_005C8021: mov ebp, esp
  loc_005C8023: sub esp, 0000000Ch
  loc_005C8026: push 00403B36h ; __vbaExceptHandler
  loc_005C802B: mov eax, fs:[00000000h]
  loc_005C8031: push eax
  loc_005C8032: mov fs:[00000000h], esp
  loc_005C8039: sub esp, 00000014h
  loc_005C803C: push ebx
  loc_005C803D: push esi
  loc_005C803E: push edi
  loc_005C803F: mov var_C, esp
  loc_005C8042: mov var_8, 00402FC8h
  loc_005C8049: mov esi, Me
  loc_005C804C: mov eax, esi
  loc_005C804E: and eax, 00000001h
  loc_005C8051: mov var_4, eax
  loc_005C8054: and esi, FFFFFFFEh
  loc_005C8057: push esi
  loc_005C8058: mov Me, esi
  loc_005C805B: mov ecx, [esi]
  loc_005C805D: call [ecx+00000004h]
  loc_005C8060: mov edx, KeyAscii
  loc_005C8063: xor edi, edi
  loc_005C8065: mov var_18, edi
  loc_005C8068: cmp [edx], 000Dh
  loc_005C806C: jnz 005C80AEh
  loc_005C806E: mov eax, [esi]
  loc_005C8070: push esi
  loc_005C8071: call [eax+00000308h]
  loc_005C8077: lea ecx, var_18
  loc_005C807A: push eax
  loc_005C807B: push ecx
  loc_005C807C: call [004010A0h] ; __vbaObjSet
  loc_005C8082: mov esi, eax
  loc_005C8084: push esi
  loc_005C8085: mov edx, [esi]
  loc_005C8087: call [edx+00000204h]
  loc_005C808D: cmp eax, edi
  loc_005C808F: fnclex
  loc_005C8091: jge 005C80A5h
  loc_005C8093: push 00000204h
  loc_005C8098: push 0041E5E8h
  loc_005C809D: push esi
  loc_005C809E: push eax
  loc_005C809F: call [00401074h] ; __vbaHresultCheckObj
  loc_005C80A5: lea ecx, var_18
  loc_005C80A8: call [004012B0h] ; __vbaFreeObj
  loc_005C80AE: mov var_4, edi
  loc_005C80B1: push 005C80C3h
  loc_005C80B6: jmp 005C80C2h
  loc_005C80B8: lea ecx, var_18
  loc_005C80BB: call [004012B0h] ; __vbaFreeObj
  loc_005C80C1: ret
  loc_005C80C2: ret
  loc_005C80C3: mov eax, Me
  loc_005C80C6: push eax
  loc_005C80C7: mov ecx, [eax]
  loc_005C80C9: call [ecx+00000008h]
  loc_005C80CC: mov eax, var_4
  loc_005C80CF: mov ecx, var_14
  loc_005C80D2: pop edi
  loc_005C80D3: pop esi
  loc_005C80D4: mov fs:[00000000h], ecx
  loc_005C80DB: pop ebx
  loc_005C80DC: mov esp, ebp
  loc_005C80DE: pop ebp
  loc_005C80DF: retn 0008h
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer) '5C7F50
  loc_005C7F50: push ebp
  loc_005C7F51: mov ebp, esp
  loc_005C7F53: sub esp, 0000000Ch
  loc_005C7F56: push 00403B36h ; __vbaExceptHandler
  loc_005C7F5B: mov eax, fs:[00000000h]
  loc_005C7F61: push eax
  loc_005C7F62: mov fs:[00000000h], esp
  loc_005C7F69: sub esp, 00000014h
  loc_005C7F6C: push ebx
  loc_005C7F6D: push esi
  loc_005C7F6E: push edi
  loc_005C7F6F: mov var_C, esp
  loc_005C7F72: mov var_8, 00402FB8h
  loc_005C7F79: mov esi, Me
  loc_005C7F7C: mov eax, esi
  loc_005C7F7E: and eax, 00000001h
  loc_005C7F81: mov var_4, eax
  loc_005C7F84: and esi, FFFFFFFEh
  loc_005C7F87: push esi
  loc_005C7F88: mov Me, esi
  loc_005C7F8B: mov ecx, [esi]
  loc_005C7F8D: call [ecx+00000004h]
  loc_005C7F90: mov edx, KeyAscii
  loc_005C7F93: xor edi, edi
  loc_005C7F95: mov var_18, edi
  loc_005C7F98: cmp [edx], 000Dh
  loc_005C7F9C: jnz 005C7FDEh
  loc_005C7F9E: mov eax, [esi]
  loc_005C7FA0: push esi
  loc_005C7FA1: call [eax+00000300h]
  loc_005C7FA7: lea ecx, var_18
  loc_005C7FAA: push eax
  loc_005C7FAB: push ecx
  loc_005C7FAC: call [004010A0h] ; __vbaObjSet
  loc_005C7FB2: mov esi, eax
  loc_005C7FB4: push esi
  loc_005C7FB5: mov edx, [esi]
  loc_005C7FB7: call [edx+000001A4h]
  loc_005C7FBD: cmp eax, edi
  loc_005C7FBF: fnclex
  loc_005C7FC1: jge 005C7FD5h
  loc_005C7FC3: push 000001A4h
  loc_005C7FC8: push 0041EAACh
  loc_005C7FCD: push esi
  loc_005C7FCE: push eax
  loc_005C7FCF: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7FD5: lea ecx, var_18
  loc_005C7FD8: call [004012B0h] ; __vbaFreeObj
  loc_005C7FDE: mov var_4, edi
  loc_005C7FE1: push 005C7FF3h
  loc_005C7FE6: jmp 005C7FF2h
  loc_005C7FE8: lea ecx, var_18
  loc_005C7FEB: call [004012B0h] ; __vbaFreeObj
  loc_005C7FF1: ret
  loc_005C7FF2: ret
  loc_005C7FF3: mov eax, Me
  loc_005C7FF6: push eax
  loc_005C7FF7: mov ecx, [eax]
  loc_005C7FF9: call [ecx+00000008h]
  loc_005C7FFC: mov eax, var_4
  loc_005C7FFF: mov ecx, var_14
  loc_005C8002: pop edi
  loc_005C8003: pop esi
  loc_005C8004: mov fs:[00000000h], ecx
  loc_005C800B: pop ebx
  loc_005C800C: mov esp, ebp
  loc_005C800E: pop ebp
  loc_005C800F: retn 0008h
End Sub

Private Sub lblLabels_Click() '5C7EE0
  loc_005C7EE0: push ebp
  loc_005C7EE1: mov ebp, esp
  loc_005C7EE3: sub esp, 0000000Ch
  loc_005C7EE6: push 00403B36h ; __vbaExceptHandler
  loc_005C7EEB: mov eax, fs:[00000000h]
  loc_005C7EF1: push eax
  loc_005C7EF2: mov fs:[00000000h], esp
  loc_005C7EF9: sub esp, 00000008h
  loc_005C7EFC: push ebx
  loc_005C7EFD: push esi
  loc_005C7EFE: push edi
  loc_005C7EFF: mov var_C, esp
  loc_005C7F02: mov var_8, 00402FB0h
  loc_005C7F09: mov esi, Me
  loc_005C7F0C: mov eax, esi
  loc_005C7F0E: and eax, 00000001h
  loc_005C7F11: mov var_4, eax
  loc_005C7F14: and esi, FFFFFFFEh
  loc_005C7F17: push esi
  loc_005C7F18: mov Me, esi
  loc_005C7F1B: mov ecx, [esi]
  loc_005C7F1D: call [ecx+00000004h]
  loc_005C7F20: xor eax, eax
  loc_005C7F22: mov [esi+00000034h], ax
  loc_005C7F26: mov var_4, eax
  loc_005C7F29: mov eax, Me
  loc_005C7F2C: push eax
  loc_005C7F2D: mov edx, [eax]
  loc_005C7F2F: call [edx+00000008h]
  loc_005C7F32: mov eax, var_4
  loc_005C7F35: mov ecx, var_14
  loc_005C7F38: pop edi
  loc_005C7F39: pop esi
  loc_005C7F3A: mov fs:[00000000h], ecx
  loc_005C7F41: pop ebx
  loc_005C7F42: mov esp, ebp
  loc_005C7F44: pop ebp
  loc_005C7F45: retn 0008h
End Sub

Private Sub cmdOk_Click() '5C7710
  loc_005C7710: push ebp
  loc_005C7711: mov ebp, esp
  loc_005C7713: sub esp, 0000000Ch
  loc_005C7716: push 00403B36h ; __vbaExceptHandler
  loc_005C771B: mov eax, fs:[00000000h]
  loc_005C7721: push eax
  loc_005C7722: mov fs:[00000000h], esp
  loc_005C7729: sub esp, 000000D4h
  loc_005C772F: push ebx
  loc_005C7730: push esi
  loc_005C7731: push edi
  loc_005C7732: mov var_C, esp
  loc_005C7735: mov var_8, 00402FA0h
  loc_005C773C: mov esi, Me
  loc_005C773F: mov eax, esi
  loc_005C7741: and eax, 00000001h
  loc_005C7744: mov var_4, eax
  loc_005C7747: and esi, FFFFFFFEh
  loc_005C774A: push esi
  loc_005C774B: mov Me, esi
  loc_005C774E: mov ecx, [esi]
  loc_005C7750: call [ecx+00000004h]
  loc_005C7753: mov edx, [esi]
  loc_005C7755: xor ebx, ebx
  loc_005C7757: push esi
  loc_005C7758: mov var_18, ebx
  loc_005C775B: mov var_1C, ebx
  loc_005C775E: mov var_20, ebx
  loc_005C7761: mov var_24, ebx
  loc_005C7764: mov var_28, ebx
  loc_005C7767: mov var_2C, ebx
  loc_005C776A: mov var_3C, ebx
  loc_005C776D: mov var_4C, ebx
  loc_005C7770: mov var_5C, ebx
  loc_005C7773: mov var_6C, ebx
  loc_005C7776: mov var_7C, ebx
  loc_005C7779: mov var_8C, ebx
  loc_005C777F: mov var_B0, ebx
  loc_005C7785: mov var_B4, ebx
  loc_005C778B: call [edx+000002FCh]
  loc_005C7791: push eax
  loc_005C7792: lea eax, var_24
  loc_005C7795: push eax
  loc_005C7796: call [004010A0h] ; __vbaObjSet
  loc_005C779C: mov edi, eax
  loc_005C779E: lea edx, var_1C
  loc_005C77A1: push edx
  loc_005C77A2: push edi
  loc_005C77A3: mov ecx, [edi]
  loc_005C77A5: call [ecx+000000A0h]
  loc_005C77AB: cmp eax, ebx
  loc_005C77AD: fnclex
  loc_005C77AF: jge 005C77C3h
  loc_005C77B1: push 000000A0h
  loc_005C77B6: push 0041E5E8h
  loc_005C77BB: push edi
  loc_005C77BC: push eax
  loc_005C77BD: call [00401074h] ; __vbaHresultCheckObj
  loc_005C77C3: mov eax, [esi]
  loc_005C77C5: push esi
  loc_005C77C6: call [eax+00000308h]
  loc_005C77CC: lea ecx, var_28
  loc_005C77CF: push eax
  loc_005C77D0: push ecx
  loc_005C77D1: call [004010A0h] ; __vbaObjSet
  loc_005C77D7: mov edi, eax
  loc_005C77D9: lea eax, var_20
  loc_005C77DC: push eax
  loc_005C77DD: push edi
  loc_005C77DE: mov edx, [edi]
  loc_005C77E0: call [edx+000000A0h]
  loc_005C77E6: cmp eax, ebx
  loc_005C77E8: fnclex
  loc_005C77EA: jge 005C77FEh
  loc_005C77EC: push 000000A0h
  loc_005C77F1: push 0041E5E8h
  loc_005C77F6: push edi
  loc_005C77F7: push eax
  loc_005C77F8: call [00401074h] ; __vbaHresultCheckObj
  loc_005C77FE: mov ecx, var_20
  loc_005C7801: push ecx
  loc_005C7802: push 00432094h ; "123"
  loc_005C7807: call [0040110Ch] ; __vbaStrCmp
  loc_005C780D: mov edx, var_1C
  loc_005C7810: mov edi, eax
  loc_005C7812: neg edi
  loc_005C7814: sbb edi, edi
  loc_005C7816: push edx
  loc_005C7817: inc edi
  loc_005C7818: push 00432094h ; "123"
  loc_005C781D: neg edi
  loc_005C781F: call [0040110Ch] ; __vbaStrCmp
  loc_005C7825: neg eax
  loc_005C7827: sbb eax, eax
  loc_005C7829: lea ecx, var_1C
  loc_005C782C: inc eax
  loc_005C782D: neg eax
  loc_005C782F: and edi, eax
  loc_005C7831: lea eax, var_20
  loc_005C7834: push eax
  loc_005C7835: push ecx
  loc_005C7836: push 00000002h
  loc_005C7838: call [004011FCh] ; __vbaFreeStrList
  loc_005C783E: lea edx, var_28
  loc_005C7841: lea eax, var_24
  loc_005C7844: push edx
  loc_005C7845: push eax
  loc_005C7846: push 00000002h
  loc_005C7848: call [00401040h] ; __vbaFreeObjList
  loc_005C784E: add esp, 00000018h
  loc_005C7851: cmp di, bx
  loc_005C7854: jz 005C7862h
  loc_005C7856: mov [esi+00000034h], FFFFFFh
  loc_005C785C: call [00401034h] ; __vbaEnd
  loc_005C7862: lea ebx, var_24
  loc_005C7865: mov ecx, 0000000Ah
  loc_005C786A: push ebx
  loc_005C786B: mov var_8C, ecx
  loc_005C7871: sub esp, 00000010h
  loc_005C7874: mov eax, 80020004h
  loc_005C7879: mov ebx, esp
  loc_005C787B: mov edx, eax
  loc_005C787D: sub esp, 00000010h
  loc_005C7880: mov var_84, edx
  loc_005C7886: mov [ebx], ecx
  loc_005C7888: mov ecx, var_98
  loc_005C788E: mov var_7C, 00000003h
  loc_005C7895: mov edi, [0061A13Ch]
  loc_005C789B: mov [ebx+00000004h], ecx
  loc_005C789E: mov ecx, esp
  loc_005C78A0: sub esp, 00000010h
  loc_005C78A3: mov var_74, 00000004h
  loc_005C78AA: mov [ebx+00000008h], eax
  loc_005C78AD: mov eax, var_90
  loc_005C78B3: mov edi, [edi]
  loc_005C78B5: mov [ebx+0000000Ch], eax
  loc_005C78B8: mov eax, var_8C
  loc_005C78BE: mov [ecx], eax
  loc_005C78C0: mov eax, var_88
  loc_005C78C6: mov [ecx+00000004h], eax
  loc_005C78C9: mov eax, esp
  loc_005C78CB: push 00431E9Ch ; "Select * From Login"
  loc_005C78D0: mov [ecx+00000008h], edx
  loc_005C78D3: mov edx, var_80
  loc_005C78D6: mov [ecx+0000000Ch], edx
  loc_005C78D9: mov ecx, var_7C
  loc_005C78DC: mov edx, var_78
  loc_005C78DF: mov [eax], ecx
  loc_005C78E1: mov ecx, var_74
  loc_005C78E4: mov [eax+00000004h], edx
  loc_005C78E7: mov edx, var_70
  loc_005C78EA: mov [eax+00000008h], ecx
  loc_005C78ED: mov [eax+0000000Ch], edx
  loc_005C78F0: mov eax, [0061A13Ch]
  loc_005C78F5: push eax
  loc_005C78F6: call [edi+000000BCh]
  loc_005C78FC: test eax, eax
  loc_005C78FE: fnclex
  loc_005C7900: jge 005C791Ah
  loc_005C7902: mov ecx, [0061A13Ch]
  loc_005C7908: push 000000BCh
  loc_005C790D: push 0041E928h
  loc_005C7912: push ecx
  loc_005C7913: push eax
  loc_005C7914: call [00401074h] ; __vbaHresultCheckObj
  loc_005C791A: mov eax, var_24
  loc_005C791D: lea edx, var_18
  loc_005C7920: push eax
  loc_005C7921: push edx
  loc_005C7922: mov var_24, 00000000h
  loc_005C7929: call [004010A0h] ; __vbaObjSet
  loc_005C792F: mov eax, var_18
  loc_005C7932: lea edx, var_B0
  loc_005C7938: push edx
  loc_005C7939: push eax
  loc_005C793A: mov ecx, [eax]
  loc_005C793C: call [ecx+00000020h]
  loc_005C793F: test eax, eax
  loc_005C7941: fnclex
  loc_005C7943: jge 005C795Bh
  loc_005C7945: mov ecx, var_18
  loc_005C7948: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C794E: push 00000020h
  loc_005C7950: push 0041E938h
  loc_005C7955: push ecx
  loc_005C7956: push eax
  loc_005C7957: call edi
  loc_005C7959: jmp 005C7961h
  loc_005C795B: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C7961: mov eax, var_18
  loc_005C7964: lea ecx, var_B4
  loc_005C796A: push ecx
  loc_005C796B: push eax
  loc_005C796C: mov edx, [eax]
  loc_005C796E: call [edx+00000034h]
  loc_005C7971: test eax, eax
  loc_005C7973: fnclex
  loc_005C7975: jge 005C7985h
  loc_005C7977: mov edx, var_18
  loc_005C797A: push 00000034h
  loc_005C797C: push 0041E938h
  loc_005C7981: push edx
  loc_005C7982: push eax
  loc_005C7983: call edi
  loc_005C7985: xor eax, eax
  loc_005C7987: cmp var_B4, ax
  loc_005C798E: setz al
  loc_005C7991: xor ecx, ecx
  loc_005C7993: cmp var_B0, cx
  loc_005C799A: setz cl
  loc_005C799D: or eax, ecx
  loc_005C799F: jz 005C7E21h
  loc_005C79A5: mov eax, var_18
  loc_005C79A8: lea ecx, var_24
  loc_005C79AB: push ecx
  loc_005C79AC: push eax
  loc_005C79AD: mov edx, [eax]
  loc_005C79AF: call [edx+000000B4h]
  loc_005C79B5: test eax, eax
  loc_005C79B7: fnclex
  loc_005C79B9: jge 005C79CCh
  loc_005C79BB: mov edx, var_18
  loc_005C79BE: push 000000B4h
  loc_005C79C3: push 0041E938h
  loc_005C79C8: push edx
  loc_005C79C9: push eax
  loc_005C79CA: call edi
  loc_005C79CC: lea ebx, var_28
  loc_005C79CF: mov eax, var_24
  loc_005C79D2: push ebx
  loc_005C79D3: mov edx, 00000008h
  loc_005C79D8: sub esp, 00000010h
  loc_005C79DB: mov var_7C, edx
  loc_005C79DE: mov ebx, esp
  loc_005C79E0: mov ecx, 00431EC8h ; "UserName"
  loc_005C79E5: mov var_74, ecx
  loc_005C79E8: mov edi, [eax]
  loc_005C79EA: mov [ebx], edx
  loc_005C79EC: mov edx, var_78
  loc_005C79EF: push eax
  loc_005C79F0: mov var_BC, eax
  loc_005C79F6: mov [ebx+00000004h], edx
  loc_005C79F9: mov [ebx+00000008h], ecx
  loc_005C79FC: mov ecx, var_70
  loc_005C79FF: mov [ebx+0000000Ch], ecx
  loc_005C7A02: call [edi+00000030h]
  loc_005C7A05: test eax, eax
  loc_005C7A07: fnclex
  loc_005C7A09: jge 005C7A24h
  loc_005C7A0B: mov edx, var_BC
  loc_005C7A11: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C7A17: push 00000030h
  loc_005C7A19: push 0041EA14h ; "S"
  loc_005C7A1E: push edx
  loc_005C7A1F: push eax
  loc_005C7A20: call edi
  loc_005C7A22: jmp 005C7A2Ah
  loc_005C7A24: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_005C7A2A: mov eax, var_28
  loc_005C7A2D: lea edx, var_5C
  loc_005C7A30: push edx
  loc_005C7A31: push eax
  loc_005C7A32: mov ecx, [eax]
  loc_005C7A34: mov ebx, eax
  loc_005C7A36: call [ecx+00000044h]
  loc_005C7A39: test eax, eax
  loc_005C7A3B: fnclex
  loc_005C7A3D: jge 005C7A4Ah
  loc_005C7A3F: push 00000044h
  loc_005C7A41: push 0041EA48h
  loc_005C7A46: push ebx
  loc_005C7A47: push eax
  loc_005C7A48: call edi
  loc_005C7A4A: mov eax, [esi]
  loc_005C7A4C: push esi
  loc_005C7A4D: call [eax+000002FCh]
  loc_005C7A53: lea ecx, var_2C
  loc_005C7A56: push eax
  loc_005C7A57: push ecx
  loc_005C7A58: call [004010A0h] ; __vbaObjSet
  loc_005C7A5E: mov ebx, eax
  loc_005C7A60: lea eax, var_1C
  loc_005C7A63: push eax
  loc_005C7A64: push ebx
  loc_005C7A65: mov edx, [ebx]
  loc_005C7A67: call [edx+000000A0h]
  loc_005C7A6D: test eax, eax
  loc_005C7A6F: fnclex
  loc_005C7A71: jge 005C7A81h
  loc_005C7A73: push 000000A0h
  loc_005C7A78: push 0041E5E8h
  loc_005C7A7D: push ebx
  loc_005C7A7E: push eax
  loc_005C7A7F: call edi
  loc_005C7A81: mov eax, var_1C
  loc_005C7A84: lea ecx, var_3C
  loc_005C7A87: lea edx, var_4C
  loc_005C7A8A: push ecx
  loc_005C7A8B: push edx
  loc_005C7A8C: mov var_1C, 00000000h
  loc_005C7A93: mov var_34, eax
  loc_005C7A96: mov var_3C, 00000008h
  loc_005C7A9D: call [004010D4h] ; rtcTrimVar
  loc_005C7AA3: lea eax, var_5C
  loc_005C7AA6: lea ecx, var_4C
  loc_005C7AA9: push eax
  loc_005C7AAA: push ecx
  loc_005C7AAB: call [00401110h] ; __vbaVarTstEq
  loc_005C7AB1: mov edi, eax
  loc_005C7AB3: lea edx, var_28
  loc_005C7AB6: lea eax, var_2C
  loc_005C7AB9: push edx
  loc_005C7ABA: lea ecx, var_24
  loc_005C7ABD: push eax
  loc_005C7ABE: push ecx
  loc_005C7ABF: push 00000003h
  loc_005C7AC1: call [00401040h] ; __vbaFreeObjList
  loc_005C7AC7: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_005C7ACD: lea edx, var_4C
  loc_005C7AD0: lea eax, var_5C
  loc_005C7AD3: push edx
  loc_005C7AD4: lea ecx, var_3C
  loc_005C7AD7: push eax
  loc_005C7AD8: push ecx
  loc_005C7AD9: push 00000003h
  loc_005C7ADB: call ebx
  loc_005C7ADD: add esp, 00000020h
  loc_005C7AE0: test di, di
  loc_005C7AE3: jz 005C7D35h
  loc_005C7AE9: mov eax, var_18
  loc_005C7AEC: lea ecx, var_24
  loc_005C7AEF: push ecx
  loc_005C7AF0: push eax
  loc_005C7AF1: mov edx, [eax]
  loc_005C7AF3: call [edx+000000B4h]
  loc_005C7AF9: test eax, eax
  loc_005C7AFB: fnclex
  loc_005C7AFD: jge 005C7B14h
  loc_005C7AFF: mov edx, var_18
  loc_005C7B02: push 000000B4h
  loc_005C7B07: push 0041E938h
  loc_005C7B0C: push edx
  loc_005C7B0D: push eax
  loc_005C7B0E: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7B14: lea edi, var_28
  loc_005C7B17: mov eax, var_24
  loc_005C7B1A: push edi
  loc_005C7B1B: mov ecx, 00000008h
  loc_005C7B20: sub esp, 00000010h
  loc_005C7B23: mov var_7C, ecx
  loc_005C7B26: mov edi, esp
  loc_005C7B28: mov var_74, 00431EE0h ; "Password"
  loc_005C7B2F: mov edx, [eax]
  loc_005C7B31: push eax
  loc_005C7B32: mov [edi], ecx
  loc_005C7B34: mov ecx, var_78
  loc_005C7B37: mov var_BC, eax
  loc_005C7B3D: mov [edi+00000004h], ecx
  loc_005C7B40: mov ecx, var_74
  loc_005C7B43: mov [edi+00000008h], ecx
  loc_005C7B46: mov ecx, var_70
  loc_005C7B49: mov [edi+0000000Ch], ecx
  loc_005C7B4C: call [edx+00000030h]
  loc_005C7B4F: test eax, eax
  loc_005C7B51: fnclex
  loc_005C7B53: jge 005C7B6Ah
  loc_005C7B55: mov edx, var_BC
  loc_005C7B5B: push 00000030h
  loc_005C7B5D: push 0041EA14h ; "S"
  loc_005C7B62: push edx
  loc_005C7B63: push eax
  loc_005C7B64: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7B6A: mov eax, var_28
  loc_005C7B6D: lea edx, var_5C
  loc_005C7B70: push edx
  loc_005C7B71: push eax
  loc_005C7B72: mov ecx, [eax]
  loc_005C7B74: mov edi, eax
  loc_005C7B76: call [ecx+00000044h]
  loc_005C7B79: test eax, eax
  loc_005C7B7B: fnclex
  loc_005C7B7D: jge 005C7B8Eh
  loc_005C7B7F: push 00000044h
  loc_005C7B81: push 0041EA48h
  loc_005C7B86: push edi
  loc_005C7B87: push eax
  loc_005C7B88: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7B8E: mov eax, [esi]
  loc_005C7B90: push esi
  loc_005C7B91: call [eax+00000308h]
  loc_005C7B97: lea ecx, var_2C
  loc_005C7B9A: push eax
  loc_005C7B9B: push ecx
  loc_005C7B9C: call [004010A0h] ; __vbaObjSet
  loc_005C7BA2: mov edi, eax
  loc_005C7BA4: lea eax, var_1C
  loc_005C7BA7: push eax
  loc_005C7BA8: push edi
  loc_005C7BA9: mov edx, [edi]
  loc_005C7BAB: call [edx+000000A0h]
  loc_005C7BB1: test eax, eax
  loc_005C7BB3: fnclex
  loc_005C7BB5: jge 005C7BC9h
  loc_005C7BB7: push 000000A0h
  loc_005C7BBC: push 0041E5E8h
  loc_005C7BC1: push edi
  loc_005C7BC2: push eax
  loc_005C7BC3: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7BC9: mov eax, var_1C
  loc_005C7BCC: lea ecx, var_3C
  loc_005C7BCF: lea edx, var_4C
  loc_005C7BD2: push ecx
  loc_005C7BD3: push edx
  loc_005C7BD4: mov var_1C, 00000000h
  loc_005C7BDB: mov var_34, eax
  loc_005C7BDE: mov var_3C, 00000008h
  loc_005C7BE5: call [004010D4h] ; rtcTrimVar
  loc_005C7BEB: lea eax, var_5C
  loc_005C7BEE: lea ecx, var_4C
  loc_005C7BF1: push eax
  loc_005C7BF2: push ecx
  loc_005C7BF3: call [00401110h] ; __vbaVarTstEq
  loc_005C7BF9: mov edi, eax
  loc_005C7BFB: lea edx, var_28
  loc_005C7BFE: lea eax, var_2C
  loc_005C7C01: push edx
  loc_005C7C02: lea ecx, var_24
  loc_005C7C05: push eax
  loc_005C7C06: push ecx
  loc_005C7C07: push 00000003h
  loc_005C7C09: call [00401040h] ; __vbaFreeObjList
  loc_005C7C0F: lea edx, var_4C
  loc_005C7C12: lea eax, var_5C
  loc_005C7C15: push edx
  loc_005C7C16: lea ecx, var_3C
  loc_005C7C19: push eax
  loc_005C7C1A: push ecx
  loc_005C7C1B: push 00000003h
  loc_005C7C1D: call ebx
  loc_005C7C1F: add esp, 00000020h
  loc_005C7C22: test di, di
  loc_005C7C25: jz 005C7C81h
  loc_005C7C27: mov [esi+00000034h], FFFFFFh
  loc_005C7C2D: mov eax, [0061B394h]
  loc_005C7C32: test eax, eax
  loc_005C7C34: jnz 005C7C46h
  loc_005C7C36: push 0061B394h
  loc_005C7C3B: push 0041E4A0h
  loc_005C7C40: call [004011DCh] ; __vbaNew2
  loc_005C7C46: mov edi, [0061B394h]
  loc_005C7C4C: lea edx, var_24
  loc_005C7C4F: push esi
  loc_005C7C50: push edx
  loc_005C7C51: mov ebx, [edi]
  loc_005C7C53: call [004010B8h] ; __vbaObjSetAddref
  loc_005C7C59: push eax
  loc_005C7C5A: push edi
  loc_005C7C5B: call [ebx+00000010h]
  loc_005C7C5E: test eax, eax
  loc_005C7C60: fnclex
  loc_005C7C62: jge 005C7C73h
  loc_005C7C64: push 00000010h
  loc_005C7C66: push 0041E490h
  loc_005C7C6B: push edi
  loc_005C7C6C: push eax
  loc_005C7C6D: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7C73: lea ecx, var_24
  loc_005C7C76: call [004012B0h] ; __vbaFreeObj
  loc_005C7C7C: jmp 005C7E21h
  loc_005C7C81: mov edi, [00401240h] ; __vbaVarDup
  loc_005C7C87: mov ecx, 0000000Ah
  loc_005C7C8C: mov eax, 80020004h
  loc_005C7C91: mov var_6C, ecx
  loc_005C7C94: mov var_5C, ecx
  loc_005C7C97: lea edx, var_8C
  loc_005C7C9D: lea ecx, var_4C
  loc_005C7CA0: mov [esi+00000034h], 0000h
  loc_005C7CA6: mov var_64, eax
  loc_005C7CA9: mov var_54, eax
  loc_005C7CAC: mov var_84, 00431F38h ; "Login"
  loc_005C7CB6: mov var_8C, 00000008h
  loc_005C7CC0: call edi
  loc_005C7CC2: lea edx, var_7C
  loc_005C7CC5: lea ecx, var_3C
  loc_005C7CC8: mov var_74, 00431EF8h ; "Invalid Password, try again!"
  loc_005C7CCF: mov var_7C, 00000008h
  loc_005C7CD6: call edi
  loc_005C7CD8: lea eax, var_6C
  loc_005C7CDB: lea ecx, var_5C
  loc_005C7CDE: push eax
  loc_005C7CDF: lea edx, var_4C
  loc_005C7CE2: push ecx
  loc_005C7CE3: push edx
  loc_005C7CE4: lea eax, var_3C
  loc_005C7CE7: push 00000000h
  loc_005C7CE9: push eax
  loc_005C7CEA: call [004010A4h] ; rtcMsgBox
  loc_005C7CF0: lea ecx, var_6C
  loc_005C7CF3: lea edx, var_5C
  loc_005C7CF6: push ecx
  loc_005C7CF7: lea eax, var_4C
  loc_005C7CFA: push edx
  loc_005C7CFB: lea ecx, var_3C
  loc_005C7CFE: push eax
  loc_005C7CFF: push ecx
  loc_005C7D00: push 00000004h
  loc_005C7D02: call ebx
  loc_005C7D04: mov edx, [esi]
  loc_005C7D06: add esp, 00000014h
  loc_005C7D09: push esi
  loc_005C7D0A: call [edx+00000308h]
  loc_005C7D10: push eax
  loc_005C7D11: lea eax, var_24
  loc_005C7D14: push eax
  loc_005C7D15: call [004010A0h] ; __vbaObjSet
  loc_005C7D1B: mov esi, eax
  loc_005C7D1D: push esi
  loc_005C7D1E: mov ecx, [esi]
  loc_005C7D20: call [ecx+00000204h]
  loc_005C7D26: test eax, eax
  loc_005C7D28: fnclex
  loc_005C7D2A: jge 005C7DF2h
  loc_005C7D30: jmp 005C7DE0h
  loc_005C7D35: mov edi, [00401240h] ; __vbaVarDup
  loc_005C7D3B: mov ecx, 0000000Ah
  loc_005C7D40: mov eax, 80020004h
  loc_005C7D45: mov var_6C, ecx
  loc_005C7D48: mov var_5C, ecx
  loc_005C7D4B: lea edx, var_8C
  loc_005C7D51: lea ecx, var_4C
  loc_005C7D54: mov [esi+00000034h], 0000h
  loc_005C7D5A: mov var_64, eax
  loc_005C7D5D: mov var_54, eax
  loc_005C7D60: mov var_84, 00431F38h ; "Login"
  loc_005C7D6A: mov var_8C, 00000008h
  loc_005C7D74: call edi
  loc_005C7D76: lea edx, var_7C
  loc_005C7D79: lea ecx, var_3C
  loc_005C7D7C: mov var_74, 00431EF8h ; "Invalid Password, try again!"
  loc_005C7D83: mov var_7C, 00000008h
  loc_005C7D8A: call edi
  loc_005C7D8C: lea eax, var_6C
  loc_005C7D8F: lea ecx, var_5C
  loc_005C7D92: push eax
  loc_005C7D93: lea edx, var_4C
  loc_005C7D96: push ecx
  loc_005C7D97: push edx
  loc_005C7D98: lea eax, var_3C
  loc_005C7D9B: push 00000000h
  loc_005C7D9D: push eax
  loc_005C7D9E: call [004010A4h] ; rtcMsgBox
  loc_005C7DA4: lea ecx, var_6C
  loc_005C7DA7: lea edx, var_5C
  loc_005C7DAA: push ecx
  loc_005C7DAB: lea eax, var_4C
  loc_005C7DAE: push edx
  loc_005C7DAF: lea ecx, var_3C
  loc_005C7DB2: push eax
  loc_005C7DB3: push ecx
  loc_005C7DB4: push 00000004h
  loc_005C7DB6: call ebx
  loc_005C7DB8: mov edx, [esi]
  loc_005C7DBA: add esp, 00000014h
  loc_005C7DBD: push esi
  loc_005C7DBE: call [edx+00000308h]
  loc_005C7DC4: push eax
  loc_005C7DC5: lea eax, var_24
  loc_005C7DC8: push eax
  loc_005C7DC9: call [004010A0h] ; __vbaObjSet
  loc_005C7DCF: mov esi, eax
  loc_005C7DD1: push esi
  loc_005C7DD2: mov ecx, [esi]
  loc_005C7DD4: call [ecx+00000204h]
  loc_005C7DDA: test eax, eax
  loc_005C7DDC: fnclex
  loc_005C7DDE: jge 005C7DF2h
  loc_005C7DE0: push 00000204h
  loc_005C7DE5: push 0041E5E8h
  loc_005C7DEA: push esi
  loc_005C7DEB: push eax
  loc_005C7DEC: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7DF2: lea ecx, var_24
  loc_005C7DF5: call [004012B0h] ; __vbaFreeObj
  loc_005C7DFB: lea edx, var_3C
  loc_005C7DFE: mov var_34, 80020004h
  loc_005C7E05: push edx
  loc_005C7E06: push 00431CB0h ; "{Home}+{End}"
  loc_005C7E0B: mov var_3C, 0000000Ah
  loc_005C7E12: call [004010C0h] ; rtcSendKeys
  loc_005C7E18: lea ecx, var_3C
  loc_005C7E1B: call [00401020h] ; __vbaFreeVar
  loc_005C7E21: mov eax, var_18
  loc_005C7E24: push eax
  loc_005C7E25: mov ecx, [eax]
  loc_005C7E27: call [ecx+000000C4h]
  loc_005C7E2D: test eax, eax
  loc_005C7E2F: fnclex
  loc_005C7E31: jge 005C7E48h
  loc_005C7E33: mov edx, var_18
  loc_005C7E36: push 000000C4h
  loc_005C7E3B: push 0041E938h
  loc_005C7E40: push edx
  loc_005C7E41: push eax
  loc_005C7E42: call [00401074h] ; __vbaHresultCheckObj
  loc_005C7E48: push 0041E938h
  loc_005C7E4D: push 00000000h
  loc_005C7E4F: call [00401274h] ; __vbaCastObj
  loc_005C7E55: push eax
  loc_005C7E56: lea eax, var_18
  loc_005C7E59: push eax
  loc_005C7E5A: call [004010A0h] ; __vbaObjSet
  loc_005C7E60: mov var_4, 00000000h
  loc_005C7E67: push 005C7EB8h
  loc_005C7E6C: jmp 005C7EAEh
  loc_005C7E6E: lea ecx, var_20
  loc_005C7E71: lea edx, var_1C
  loc_005C7E74: push ecx
  loc_005C7E75: push edx
  loc_005C7E76: push 00000002h
  loc_005C7E78: call [004011FCh] ; __vbaFreeStrList
  loc_005C7E7E: lea eax, var_2C
  loc_005C7E81: lea ecx, var_28
  loc_005C7E84: push eax
  loc_005C7E85: lea edx, var_24
  loc_005C7E88: push ecx
  loc_005C7E89: push edx
  loc_005C7E8A: push 00000003h
  loc_005C7E8C: call [00401040h] ; __vbaFreeObjList
  loc_005C7E92: lea eax, var_6C
  loc_005C7E95: lea ecx, var_5C
  loc_005C7E98: push eax
  loc_005C7E99: lea edx, var_4C
  loc_005C7E9C: push ecx
  loc_005C7E9D: lea eax, var_3C
  loc_005C7EA0: push edx
  loc_005C7EA1: push eax
  loc_005C7EA2: push 00000004h
  loc_005C7EA4: call [00401038h] ; __vbaFreeVarList
  loc_005C7EAA: add esp, 00000030h
  loc_005C7EAD: ret
  loc_005C7EAE: lea ecx, var_18
  loc_005C7EB1: call [004012B0h] ; __vbaFreeObj
  loc_005C7EB7: ret
  loc_005C7EB8: mov eax, Me
  loc_005C7EBB: push eax
  loc_005C7EBC: mov ecx, [eax]
  loc_005C7EBE: call [ecx+00000008h]
  loc_005C7EC1: mov eax, var_4
  loc_005C7EC4: mov ecx, var_14
  loc_005C7EC7: pop edi
  loc_005C7EC8: pop esi
  loc_005C7EC9: mov fs:[00000000h], ecx
  loc_005C7ED0: pop ebx
  loc_005C7ED1: mov esp, ebp
  loc_005C7ED3: pop ebp
  loc_005C7ED4: retn 0004h
End Sub

Private Sub cmdCancel_Click() '5C76A0
  loc_005C76A0: push ebp
  loc_005C76A1: mov ebp, esp
  loc_005C76A3: sub esp, 0000000Ch
  loc_005C76A6: push 00403B36h ; __vbaExceptHandler
  loc_005C76AB: mov eax, fs:[00000000h]
  loc_005C76B1: push eax
  loc_005C76B2: mov fs:[00000000h], esp
  loc_005C76B9: sub esp, 00000008h
  loc_005C76BC: push ebx
  loc_005C76BD: push esi
  loc_005C76BE: push edi
  loc_005C76BF: mov var_C, esp
  loc_005C76C2: mov var_8, 00402F98h
  loc_005C76C9: mov eax, Me
  loc_005C76CC: mov ecx, eax
  loc_005C76CE: and ecx, 00000001h
  loc_005C76D1: mov var_4, ecx
  loc_005C76D4: and al, FEh
  loc_005C76D6: push eax
  loc_005C76D7: mov Me, eax
  loc_005C76DA: mov edx, [eax]
  loc_005C76DC: call [edx+00000004h]
  loc_005C76DF: call [00401034h] ; __vbaEnd
  loc_005C76E5: mov var_4, 00000000h
  loc_005C76EC: mov eax, Me
  loc_005C76EF: push eax
  loc_005C76F0: mov ecx, [eax]
  loc_005C76F2: call [ecx+00000008h]
  loc_005C76F5: mov eax, var_4
  loc_005C76F8: mov ecx, var_14
  loc_005C76FB: pop edi
  loc_005C76FC: pop esi
  loc_005C76FD: mov fs:[00000000h], ecx
  loc_005C7704: pop ebx
  loc_005C7705: mov esp, ebp
  loc_005C7707: pop ebp
  loc_005C7708: retn 0004h
End Sub
