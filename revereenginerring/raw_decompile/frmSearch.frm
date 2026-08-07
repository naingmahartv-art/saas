VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Begin VB.Form frmSearch
  Caption = "Search"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ControlBox = 0   'False
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 4845
  ClientHeight = 7230
  StartUpPosition = 2 'CenterScreen
  Begin VB.TextBox txtAgentName
    Left = 90
    Top = 6750
    Width = 2865
    Height = 345
    TabIndex = 3
  End
  Begin VB.CommandButton cmdOk
    Caption = "&Ok"
    Left = 3060
    Top = 6750
    Width = 855
    Height = 375
    TabIndex = 2
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 3930
    Top = 6750
    Width = 855
    Height = 375
    TabIndex = 1
  End
  Begin MSFlexGridLib.MSFlexGrid Grid
    Left = 60
    Top = 60
    Width = 4725
    Height = 6585
    TabIndex = 0
    OleObjectBlob = "frmSearch.frx":0000
  End
End

Attribute VB_Name = "frmSearch"


Private Sub cmdOk_Click() '4B1B80
  loc_004B1B80: push ebp
  loc_004B1B81: mov ebp, esp
  loc_004B1B83: sub esp, 0000000Ch
  loc_004B1B86: push 00403B36h ; __vbaExceptHandler
  loc_004B1B8B: mov eax, fs:[00000000h]
  loc_004B1B91: push eax
  loc_004B1B92: mov fs:[00000000h], esp
  loc_004B1B99: sub esp, 00000058h
  loc_004B1B9C: push ebx
  loc_004B1B9D: push esi
  loc_004B1B9E: push edi
  loc_004B1B9F: mov var_C, esp
  loc_004B1BA2: mov var_8, 00401BA8h
  loc_004B1BA9: mov edi, Me
  loc_004B1BAC: mov eax, edi
  loc_004B1BAE: and eax, 00000001h
  loc_004B1BB1: mov var_4, eax
  loc_004B1BB4: and edi, FFFFFFFEh
  loc_004B1BB7: push edi
  loc_004B1BB8: mov Me, edi
  loc_004B1BBB: mov ecx, [edi]
  loc_004B1BBD: call [ecx+00000004h]
  loc_004B1BC0: lea edx, var_48
  loc_004B1BC3: xor ebx, ebx
  loc_004B1BC5: lea eax, var_28
  loc_004B1BC8: push edx
  loc_004B1BC9: mov var_48, ebx
  loc_004B1BCC: push eax
  loc_004B1BCD: mov var_18, ebx
  loc_004B1BD0: mov var_28, ebx
  loc_004B1BD3: mov var_38, ebx
  loc_004B1BD6: mov var_58, ebx
  loc_004B1BD9: mov var_40, 0061A038h
  loc_004B1BE0: mov var_48, 00004008h
  loc_004B1BE7: call [004010D4h] ; rtcTrimVar
  loc_004B1BED: lea ecx, var_28
  loc_004B1BF0: lea edx, var_58
  loc_004B1BF3: push ecx
  loc_004B1BF4: push edx
  loc_004B1BF5: mov var_50, 0041E5D4h
  loc_004B1BFC: mov var_58, 00008008h
  loc_004B1C03: call [00401218h] ; __vbaVarTstNe
  loc_004B1C09: lea ecx, var_28
  loc_004B1C0C: mov si, ax
  loc_004B1C0F: call [00401020h] ; __vbaFreeVar
  loc_004B1C15: cmp si, bx
  loc_004B1C18: jz 004B1C6Eh
  loc_004B1C1A: cmp [0061B394h], ebx
  loc_004B1C20: jnz 004B1C32h
  loc_004B1C22: push 0061B394h
  loc_004B1C27: push 0041E4A0h
  loc_004B1C2C: call [004011DCh] ; __vbaNew2
  loc_004B1C32: mov esi, [0061B394h]
  loc_004B1C38: lea eax, var_18
  loc_004B1C3B: push edi
  loc_004B1C3C: push eax
  loc_004B1C3D: mov edx, [esi]
  loc_004B1C3F: mov var_6C, edx
  loc_004B1C42: call [004010B8h] ; __vbaObjSetAddref
  loc_004B1C48: mov ecx, var_6C
  loc_004B1C4B: push eax
  loc_004B1C4C: push esi
  loc_004B1C4D: call [ecx+00000010h]
  loc_004B1C50: cmp eax, ebx
  loc_004B1C52: fnclex
  loc_004B1C54: jge 004B1C65h
  loc_004B1C56: push 00000010h
  loc_004B1C58: push 0041E490h
  loc_004B1C5D: push esi
  loc_004B1C5E: push eax
  loc_004B1C5F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1C65: lea ecx, var_18
  loc_004B1C68: call [004012B0h] ; __vbaFreeObj
  loc_004B1C6E: mov var_4, ebx
  loc_004B1C71: push 004B1C96h
  loc_004B1C76: jmp 004B1C95h
  loc_004B1C78: lea ecx, var_18
  loc_004B1C7B: call [004012B0h] ; __vbaFreeObj
  loc_004B1C81: lea edx, var_38
  loc_004B1C84: lea eax, var_28
  loc_004B1C87: push edx
  loc_004B1C88: push eax
  loc_004B1C89: push 00000002h
  loc_004B1C8B: call [00401038h] ; __vbaFreeVarList
  loc_004B1C91: add esp, 0000000Ch
  loc_004B1C94: ret
  loc_004B1C95: ret
  loc_004B1C96: mov eax, Me
  loc_004B1C99: push eax
  loc_004B1C9A: mov ecx, [eax]
  loc_004B1C9C: call [ecx+00000008h]
  loc_004B1C9F: mov eax, var_4
  loc_004B1CA2: mov ecx, var_14
  loc_004B1CA5: pop edi
  loc_004B1CA6: pop esi
  loc_004B1CA7: mov fs:[00000000h], ecx
  loc_004B1CAE: pop ebx
  loc_004B1CAF: mov esp, ebp
  loc_004B1CB1: pop ebp
  loc_004B1CB2: retn 0004h
End Sub

Private Sub cmdCancel_Click() '4B1AA0
  loc_004B1AA0: push ebp
  loc_004B1AA1: mov ebp, esp
  loc_004B1AA3: sub esp, 0000000Ch
  loc_004B1AA6: push 00403B36h ; __vbaExceptHandler
  loc_004B1AAB: mov eax, fs:[00000000h]
  loc_004B1AB1: push eax
  loc_004B1AB2: mov fs:[00000000h], esp
  loc_004B1AB9: sub esp, 00000018h
  loc_004B1ABC: push ebx
  loc_004B1ABD: push esi
  loc_004B1ABE: push edi
  loc_004B1ABF: mov var_C, esp
  loc_004B1AC2: mov var_8, 00401B98h
  loc_004B1AC9: mov edi, Me
  loc_004B1ACC: mov eax, edi
  loc_004B1ACE: and eax, 00000001h
  loc_004B1AD1: mov var_4, eax
  loc_004B1AD4: and edi, FFFFFFFEh
  loc_004B1AD7: push edi
  loc_004B1AD8: mov Me, edi
  loc_004B1ADB: mov ecx, [edi]
  loc_004B1ADD: call [ecx+00000004h]
  loc_004B1AE0: xor ebx, ebx
  loc_004B1AE2: mov edx, 0041E5D4h
  loc_004B1AE7: mov ecx, 0061A038h
  loc_004B1AEC: mov var_18, ebx
  loc_004B1AEF: call [004011ECh] ; __vbaStrCopy
  loc_004B1AF5: cmp [0061B394h], ebx
  loc_004B1AFB: jnz 004B1B0Dh
  loc_004B1AFD: push 0061B394h
  loc_004B1B02: push 0041E4A0h
  loc_004B1B07: call [004011DCh] ; __vbaNew2
  loc_004B1B0D: mov esi, [0061B394h]
  loc_004B1B13: lea eax, var_18
  loc_004B1B16: push edi
  loc_004B1B17: push eax
  loc_004B1B18: mov edx, [esi]
  loc_004B1B1A: mov var_2C, edx
  loc_004B1B1D: call [004010B8h] ; __vbaObjSetAddref
  loc_004B1B23: mov ecx, var_2C
  loc_004B1B26: push eax
  loc_004B1B27: push esi
  loc_004B1B28: call [ecx+00000010h]
  loc_004B1B2B: cmp eax, ebx
  loc_004B1B2D: fnclex
  loc_004B1B2F: jge 004B1B40h
  loc_004B1B31: push 00000010h
  loc_004B1B33: push 0041E490h
  loc_004B1B38: push esi
  loc_004B1B39: push eax
  loc_004B1B3A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1B40: lea ecx, var_18
  loc_004B1B43: call [004012B0h] ; __vbaFreeObj
  loc_004B1B49: mov var_4, ebx
  loc_004B1B4C: push 004B1B5Eh
  loc_004B1B51: jmp 004B1B5Dh
  loc_004B1B53: lea ecx, var_18
  loc_004B1B56: call [004012B0h] ; __vbaFreeObj
  loc_004B1B5C: ret
  loc_004B1B5D: ret
  loc_004B1B5E: mov eax, Me
  loc_004B1B61: push eax
  loc_004B1B62: mov edx, [eax]
  loc_004B1B64: call [edx+00000008h]
  loc_004B1B67: mov eax, var_4
  loc_004B1B6A: mov ecx, var_14
  loc_004B1B6D: pop edi
  loc_004B1B6E: pop esi
  loc_004B1B6F: mov fs:[00000000h], ecx
  loc_004B1B76: pop ebx
  loc_004B1B77: mov esp, ebp
  loc_004B1B79: pop ebp
  loc_004B1B7A: retn 0004h
End Sub

Private Sub Form_Load() '4B1CC0
  loc_004B1CC0: push ebp
  loc_004B1CC1: mov ebp, esp
  loc_004B1CC3: sub esp, 0000000Ch
  loc_004B1CC6: push 00403B36h ; __vbaExceptHandler
  loc_004B1CCB: mov eax, fs:[00000000h]
  loc_004B1CD1: push eax
  loc_004B1CD2: mov fs:[00000000h], esp
  loc_004B1CD9: sub esp, 00000098h
  loc_004B1CDF: push ebx
  loc_004B1CE0: push esi
  loc_004B1CE1: push edi
  loc_004B1CE2: mov var_C, esp
  loc_004B1CE5: mov var_8, 00401BB8h
  loc_004B1CEC: mov esi, Me
  loc_004B1CEF: mov eax, esi
  loc_004B1CF1: and eax, 00000001h
  loc_004B1CF4: mov var_4, eax
  loc_004B1CF7: and esi, FFFFFFFEh
  loc_004B1CFA: push esi
  loc_004B1CFB: mov Me, esi
  loc_004B1CFE: mov ecx, [esi]
  loc_004B1D00: call [ecx+00000004h]
  loc_004B1D03: xor edi, edi
  loc_004B1D05: mov edx, 0041E5D4h
  loc_004B1D0A: mov ecx, 0061A038h
  loc_004B1D0F: mov var_18, edi
  loc_004B1D12: mov var_20, edi
  loc_004B1D15: mov var_24, edi
  loc_004B1D18: mov var_28, edi
  loc_004B1D1B: mov var_38, edi
  loc_004B1D1E: mov var_48, edi
  loc_004B1D21: mov var_58, edi
  loc_004B1D24: mov var_68, edi
  loc_004B1D27: mov var_78, edi
  loc_004B1D2A: mov var_7C, edi
  loc_004B1D2D: mov var_A0, edi
  loc_004B1D33: call [004011ECh] ; __vbaStrCopy
  loc_004B1D39: lea edx, var_58
  loc_004B1D3C: lea eax, var_38
  loc_004B1D3F: push edx
  loc_004B1D40: push eax
  loc_004B1D41: mov var_50, 0061A0A0h
  loc_004B1D48: mov var_58, 00004008h
  loc_004B1D4F: call [004010D4h] ; rtcTrimVar
  loc_004B1D55: lea edx, var_38
  loc_004B1D58: lea ecx, var_A0
  loc_004B1D5E: call [00401014h] ; __vbaVarMove
  loc_004B1D64: lea ecx, var_A0
  loc_004B1D6A: lea edx, var_58
  loc_004B1D6D: push ecx
  loc_004B1D6E: push edx
  loc_004B1D6F: mov var_50, 0041F6C8h ; "AGENT"
  loc_004B1D76: mov var_58, 00008008h
  loc_004B1D7D: call [00401110h] ; __vbaVarTstEq
  loc_004B1D83: test ax, ax
  loc_004B1D86: jz 004B2249h
  loc_004B1D8C: lea ebx, var_20
  loc_004B1D8F: mov ecx, 0000000Ah
  loc_004B1D94: push ebx
  loc_004B1D95: mov var_68, ecx
  loc_004B1D98: sub esp, 00000010h
  loc_004B1D9B: mov eax, 80020004h
  loc_004B1DA0: mov ebx, esp
  loc_004B1DA2: mov edx, eax
  loc_004B1DA4: sub esp, 00000010h
  loc_004B1DA7: mov var_58, 00000003h
  loc_004B1DAE: mov [ebx], ecx
  loc_004B1DB0: mov ecx, var_74
  loc_004B1DB3: mov edi, [0061A13Ch]
  loc_004B1DB9: mov var_50, 00000004h
  loc_004B1DC0: mov [ebx+00000004h], ecx
  loc_004B1DC3: mov ecx, esp
  loc_004B1DC5: sub esp, 00000010h
  loc_004B1DC8: mov edi, [edi]
  loc_004B1DCA: mov [ebx+00000008h], eax
  loc_004B1DCD: mov eax, var_6C
  loc_004B1DD0: mov [ebx+0000000Ch], eax
  loc_004B1DD3: mov eax, var_68
  loc_004B1DD6: mov [ecx], eax
  loc_004B1DD8: mov eax, var_64
  loc_004B1DDB: mov [ecx+00000004h], eax
  loc_004B1DDE: mov eax, esp
  loc_004B1DE0: push 00424A50h ; "Select * From AgentThai Order By AgentName"
  loc_004B1DE5: mov [ecx+00000008h], edx
  loc_004B1DE8: mov edx, var_5C
  loc_004B1DEB: mov [ecx+0000000Ch], edx
  loc_004B1DEE: mov ecx, var_58
  loc_004B1DF1: mov edx, var_54
  loc_004B1DF4: mov [eax], ecx
  loc_004B1DF6: mov ecx, var_50
  loc_004B1DF9: mov [eax+00000004h], edx
  loc_004B1DFC: mov edx, var_4C
  loc_004B1DFF: mov [eax+00000008h], ecx
  loc_004B1E02: mov [eax+0000000Ch], edx
  loc_004B1E05: mov eax, [0061A13Ch]
  loc_004B1E0A: push eax
  loc_004B1E0B: call [edi+000000BCh]
  loc_004B1E11: test eax, eax
  loc_004B1E13: fnclex
  loc_004B1E15: jge 004B1E2Fh
  loc_004B1E17: mov ecx, [0061A13Ch]
  loc_004B1E1D: push 000000BCh
  loc_004B1E22: push 0041E928h
  loc_004B1E27: push ecx
  loc_004B1E28: push eax
  loc_004B1E29: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1E2F: mov eax, var_20
  loc_004B1E32: mov edi, [004010A0h] ; __vbaObjSet
  loc_004B1E38: lea edx, var_18
  loc_004B1E3B: push eax
  loc_004B1E3C: push edx
  loc_004B1E3D: mov var_20, 00000000h
  loc_004B1E44: call edi
  loc_004B1E46: mov eax, [esi]
  loc_004B1E48: push esi
  loc_004B1E49: call [eax+00000704h]
  loc_004B1E4F: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004B1E55: mov var_1C, 00000001h
  loc_004B1E5C: mov eax, var_18
  loc_004B1E5F: lea edx, var_7C
  loc_004B1E62: push edx
  loc_004B1E63: push eax
  loc_004B1E64: mov ecx, [eax]
  loc_004B1E66: call [ecx+00000034h]
  loc_004B1E69: test eax, eax
  loc_004B1E6B: fnclex
  loc_004B1E6D: jge 004B1E81h
  loc_004B1E6F: mov ecx, var_18
  loc_004B1E72: push 00000034h
  loc_004B1E74: push 0041E938h
  loc_004B1E79: push ecx
  loc_004B1E7A: push eax
  loc_004B1E7B: call [00401074h] ; __vbaHresultCheckObj
  loc_004B1E81: cmp var_7C, 0000h
  loc_004B1E86: jnz 004B220Ch
  loc_004B1E8C: mov edx, [esi]
  loc_004B1E8E: push 00000000h
  loc_004B1E90: push 00000004h
  loc_004B1E92: push esi
  loc_004B1E93: call [edx+00000308h]
  loc_004B1E99: push eax
  loc_004B1E9A: lea eax, var_20
  loc_004B1E9D: push eax
  loc_004B1E9E: call edi
  loc_004B1EA0: lea ecx, var_38
  loc_004B1EA3: push eax
  loc_004B1EA4: push ecx
  loc_004B1EA5: call [00401140h] ; __vbaLateIdCallLd
  loc_004B1EAB: add esp, 00000010h
  loc_004B1EAE: push eax
  loc_004B1EAF: call [0040121Ch] ; __vbaI4Var
  loc_004B1EB5: add eax, 00000001h
  loc_004B1EB8: mov ecx, 00000003h
  loc_004B1EBD: jo 004B22B0h
  loc_004B1EC3: sub esp, 00000010h
  loc_004B1EC6: mov var_58, ecx
  loc_004B1EC9: mov edx, esp
  loc_004B1ECB: mov var_50, eax
  loc_004B1ECE: push 00000004h
  loc_004B1ED0: push esi
  loc_004B1ED1: mov [edx], ecx
  loc_004B1ED3: mov ecx, var_54
  loc_004B1ED6: mov [edx+00000004h], ecx
  loc_004B1ED9: mov ecx, [esi]
  loc_004B1EDB: mov [edx+00000008h], eax
  loc_004B1EDE: mov eax, var_4C
  loc_004B1EE1: mov [edx+0000000Ch], eax
  loc_004B1EE4: call [ecx+00000308h]
  loc_004B1EEA: lea edx, var_24
  loc_004B1EED: push eax
  loc_004B1EEE: push edx
  loc_004B1EEF: call edi
  loc_004B1EF1: push eax
  loc_004B1EF2: call ebx
  loc_004B1EF4: lea eax, var_24
  loc_004B1EF7: lea ecx, var_20
  loc_004B1EFA: push eax
  loc_004B1EFB: push ecx
  loc_004B1EFC: push 00000002h
  loc_004B1EFE: call [00401040h] ; __vbaFreeObjList
  loc_004B1F04: add esp, 0000000Ch
  loc_004B1F07: lea ecx, var_38
  loc_004B1F0A: call [00401020h] ; __vbaFreeVar
  loc_004B1F10: movsx eax, var_1C
  loc_004B1F14: sub esp, 00000010h
  loc_004B1F17: mov ecx, 00000003h
  loc_004B1F1C: mov edx, esp
  loc_004B1F1E: mov var_58, ecx
  loc_004B1F21: mov var_50, eax
  loc_004B1F24: push 0000000Ah
  loc_004B1F26: mov [edx], ecx
  loc_004B1F28: mov ecx, var_54
  loc_004B1F2B: push esi
  loc_004B1F2C: mov [edx+00000004h], ecx
  loc_004B1F2F: mov ecx, [esi]
  loc_004B1F31: mov [edx+00000008h], eax
  loc_004B1F34: mov eax, var_4C
  loc_004B1F37: mov [edx+0000000Ch], eax
  loc_004B1F3A: call [ecx+00000308h]
  loc_004B1F40: lea edx, var_20
  loc_004B1F43: push eax
  loc_004B1F44: push edx
  loc_004B1F45: call edi
  loc_004B1F47: push eax
  loc_004B1F48: call ebx
  loc_004B1F4A: lea ecx, var_20
  loc_004B1F4D: call [004012B0h] ; __vbaFreeObj
  loc_004B1F53: xor eax, eax
  loc_004B1F55: sub esp, 00000010h
  loc_004B1F58: mov edx, esp
  loc_004B1F5A: mov ecx, 00000003h
  loc_004B1F5F: mov var_58, ecx
  loc_004B1F62: mov var_50, eax
  loc_004B1F65: mov [edx], ecx
  loc_004B1F67: mov ecx, var_54
  loc_004B1F6A: mov [edx+00000004h], ecx
  loc_004B1F6D: mov ecx, [esi]
  loc_004B1F6F: mov [edx+00000008h], eax
  loc_004B1F72: mov eax, var_4C
  loc_004B1F75: push 0000000Bh
  loc_004B1F77: push esi
  loc_004B1F78: mov [edx+0000000Ch], eax
  loc_004B1F7B: call [ecx+00000308h]
  loc_004B1F81: lea edx, var_20
  loc_004B1F84: push eax
  loc_004B1F85: push edx
  loc_004B1F86: call edi
  loc_004B1F88: push eax
  loc_004B1F89: call ebx
  loc_004B1F8B: lea ecx, var_20
  loc_004B1F8E: call [004012B0h] ; __vbaFreeObj
  loc_004B1F94: sub esp, 00000010h
  loc_004B1F97: mov ecx, 00000002h
  loc_004B1F9C: mov edx, esp
  loc_004B1F9E: mov var_58, ecx
  loc_004B1FA1: mov eax, 00000001h
  loc_004B1FA6: push 00000028h
  loc_004B1FA8: mov [edx], ecx
  loc_004B1FAA: mov ecx, var_54
  loc_004B1FAD: mov var_50, eax
  loc_004B1FB0: push esi
  loc_004B1FB1: mov [edx+00000004h], ecx
  loc_004B1FB4: mov ecx, [esi]
  loc_004B1FB6: mov [edx+00000008h], eax
  loc_004B1FB9: mov eax, var_4C
  loc_004B1FBC: mov [edx+0000000Ch], eax
  loc_004B1FBF: call [ecx+00000308h]
  loc_004B1FC5: lea edx, var_20
  loc_004B1FC8: push eax
  loc_004B1FC9: push edx
  loc_004B1FCA: call edi
  loc_004B1FCC: push eax
  loc_004B1FCD: call ebx
  loc_004B1FCF: lea ecx, var_20
  loc_004B1FD2: call [004012B0h] ; __vbaFreeObj
  loc_004B1FD8: mov eax, var_1C
  loc_004B1FDB: push eax
  loc_004B1FDC: call [00401008h] ; __vbaStrI2
  loc_004B1FE2: sub esp, 00000010h
  loc_004B1FE5: mov ecx, 00000008h
  loc_004B1FEA: mov edx, esp
  loc_004B1FEC: mov var_38, ecx
  loc_004B1FEF: mov var_30, eax
  loc_004B1FF2: push 00000000h
  loc_004B1FF4: mov [edx], ecx
  loc_004B1FF6: mov ecx, var_34
  loc_004B1FF9: push esi
  loc_004B1FFA: mov [edx+00000004h], ecx
  loc_004B1FFD: mov ecx, [esi]
  loc_004B1FFF: mov [edx+00000008h], eax
  loc_004B2002: mov eax, var_2C
  loc_004B2005: mov [edx+0000000Ch], eax
  loc_004B2008: call [ecx+00000308h]
  loc_004B200E: lea edx, var_20
  loc_004B2011: push eax
  loc_004B2012: push edx
  loc_004B2013: call edi
  loc_004B2015: push eax
  loc_004B2016: call ebx
  loc_004B2018: lea ecx, var_20
  loc_004B201B: call [004012B0h] ; __vbaFreeObj
  loc_004B2021: lea ecx, var_38
  loc_004B2024: call [00401020h] ; __vbaFreeVar
  loc_004B202A: sub esp, 00000010h
  loc_004B202D: mov ecx, 00000003h
  loc_004B2032: mov edx, esp
  loc_004B2034: mov var_58, ecx
  loc_004B2037: mov eax, 00000001h
  loc_004B203C: push 0000000Bh
  loc_004B203E: mov [edx], ecx
  loc_004B2040: mov ecx, var_54
  loc_004B2043: mov var_50, eax
  loc_004B2046: mov [edx+00000004h], ecx
  loc_004B2049: mov ecx, [esi]
  loc_004B204B: mov [edx+00000008h], eax
  loc_004B204E: mov eax, var_4C
  loc_004B2051: mov [edx+0000000Ch], eax
  loc_004B2054: push esi
  loc_004B2055: call [ecx+00000308h]
  loc_004B205B: lea edx, var_20
  loc_004B205E: push eax
  loc_004B205F: push edx
  loc_004B2060: call edi
  loc_004B2062: push eax
  loc_004B2063: call ebx
  loc_004B2065: lea ecx, var_20
  loc_004B2068: call [004012B0h] ; __vbaFreeObj
  loc_004B206E: sub esp, 00000010h
  loc_004B2071: mov ecx, 00000002h
  loc_004B2076: mov edx, esp
  loc_004B2078: mov var_58, ecx
  loc_004B207B: mov eax, 00000001h
  loc_004B2080: push 00000028h
  loc_004B2082: mov [edx], ecx
  loc_004B2084: mov ecx, var_54
  loc_004B2087: mov var_50, eax
  loc_004B208A: push esi
  loc_004B208B: mov [edx+00000004h], ecx
  loc_004B208E: mov ecx, [esi]
  loc_004B2090: mov [edx+00000008h], eax
  loc_004B2093: mov eax, var_4C
  loc_004B2096: mov [edx+0000000Ch], eax
  loc_004B2099: call [ecx+00000308h]
  loc_004B209F: lea edx, var_20
  loc_004B20A2: push eax
  loc_004B20A3: push edx
  loc_004B20A4: call edi
  loc_004B20A6: push eax
  loc_004B20A7: call ebx
  loc_004B20A9: lea ecx, var_20
  loc_004B20AC: call [004012B0h] ; __vbaFreeObj
  loc_004B20B2: mov eax, var_18
  loc_004B20B5: lea edx, var_20
  loc_004B20B8: push edx
  loc_004B20B9: push eax
  loc_004B20BA: mov ecx, [eax]
  loc_004B20BC: call [ecx+000000B4h]
  loc_004B20C2: test eax, eax
  loc_004B20C4: fnclex
  loc_004B20C6: jge 004B20DDh
  loc_004B20C8: mov ecx, var_18
  loc_004B20CB: push 000000B4h
  loc_004B20D0: push 0041E938h
  loc_004B20D5: push ecx
  loc_004B20D6: push eax
  loc_004B20D7: call [00401074h] ; __vbaHresultCheckObj
  loc_004B20DD: mov ecx, var_20
  loc_004B20E0: mov eax, 00000008h
  loc_004B20E5: mov var_50, 0041EB18h ; "AgentName"
  loc_004B20EC: mov var_58, eax
  loc_004B20EF: mov edx, [ecx]
  loc_004B20F1: mov var_84, ecx
  loc_004B20F7: lea ecx, var_24
  loc_004B20FA: push ecx
  loc_004B20FB: sub esp, 00000010h
  loc_004B20FE: mov ecx, esp
  loc_004B2100: mov [ecx], eax
  loc_004B2102: mov eax, var_54
  loc_004B2105: mov [ecx+00000004h], eax
  loc_004B2108: mov eax, var_50
  loc_004B210B: mov [ecx+00000008h], eax
  loc_004B210E: mov eax, var_4C
  loc_004B2111: mov [ecx+0000000Ch], eax
  loc_004B2114: mov ecx, var_20
  loc_004B2117: push ecx
  loc_004B2118: call [edx+00000030h]
  loc_004B211B: test eax, eax
  loc_004B211D: fnclex
  loc_004B211F: jge 004B2136h
  loc_004B2121: mov edx, var_84
  loc_004B2127: push 00000030h
  loc_004B2129: push 0041EA14h ; "S"
  loc_004B212E: push edx
  loc_004B212F: push eax
  loc_004B2130: call [00401074h] ; __vbaHresultCheckObj
  loc_004B2136: mov eax, var_24
  loc_004B2139: lea edx, var_38
  loc_004B213C: push edx
  loc_004B213D: push eax
  loc_004B213E: mov ecx, [eax]
  loc_004B2140: mov var_8C, eax
  loc_004B2146: call [ecx+00000044h]
  loc_004B2149: test eax, eax
  loc_004B214B: fnclex
  loc_004B214D: jge 004B2164h
  loc_004B214F: mov ecx, var_8C
  loc_004B2155: push 00000044h
  loc_004B2157: push 0041EA48h
  loc_004B215C: push ecx
  loc_004B215D: push eax
  loc_004B215E: call [00401074h] ; __vbaHresultCheckObj
  loc_004B2164: lea edx, var_38
  loc_004B2167: push edx
  loc_004B2168: call [00401028h] ; __vbaStrVarMove
  loc_004B216E: sub esp, 00000010h
  loc_004B2171: mov ecx, 00000008h
  loc_004B2176: mov edx, esp
  loc_004B2178: mov var_48, ecx
  loc_004B217B: mov var_40, eax
  loc_004B217E: push 00000000h
  loc_004B2180: mov [edx], ecx
  loc_004B2182: mov ecx, var_44
  loc_004B2185: push esi
  loc_004B2186: mov [edx+00000004h], ecx
  loc_004B2189: mov ecx, [esi]
  loc_004B218B: mov [edx+00000008h], eax
  loc_004B218E: mov eax, var_3C
  loc_004B2191: mov [edx+0000000Ch], eax
  loc_004B2194: call [ecx+00000308h]
  loc_004B219A: lea edx, var_28
  loc_004B219D: push eax
  loc_004B219E: push edx
  loc_004B219F: call edi
  loc_004B21A1: push eax
  loc_004B21A2: call ebx
  loc_004B21A4: lea eax, var_28
  loc_004B21A7: lea ecx, var_24
  loc_004B21AA: push eax
  loc_004B21AB: lea edx, var_20
  loc_004B21AE: push ecx
  loc_004B21AF: push edx
  loc_004B21B0: push 00000003h
  loc_004B21B2: call [00401040h] ; __vbaFreeObjList
  loc_004B21B8: lea eax, var_48
  loc_004B21BB: lea ecx, var_38
  loc_004B21BE: push eax
  loc_004B21BF: push ecx
  loc_004B21C0: push 00000002h
  loc_004B21C2: call [00401038h] ; __vbaFreeVarList
  loc_004B21C8: mov dx, var_1C
  loc_004B21CC: mov eax, var_18
  loc_004B21CF: add esp, 0000001Ch
  loc_004B21D2: add dx, 0001h
  loc_004B21D6: mov ecx, [eax]
  loc_004B21D8: jo 004B22B0h
  loc_004B21DE: push eax
  loc_004B21DF: mov var_1C, edx
  loc_004B21E2: call [ecx+000000ECh]
  loc_004B21E8: test eax, eax
  loc_004B21EA: fnclex
  loc_004B21EC: jge 004B1E5Ch
  loc_004B21F2: mov edx, var_18
  loc_004B21F5: push 000000ECh
  loc_004B21FA: push 0041E938h
  loc_004B21FF: push edx
  loc_004B2200: push eax
  loc_004B2201: call [00401074h] ; __vbaHresultCheckObj
  loc_004B2207: jmp 004B1E5Ch
  loc_004B220C: mov eax, var_18
  loc_004B220F: push eax
  loc_004B2210: mov ecx, [eax]
  loc_004B2212: call [ecx+000000C4h]
  loc_004B2218: test eax, eax
  loc_004B221A: fnclex
  loc_004B221C: jge 004B2233h
  loc_004B221E: mov edx, var_18
  loc_004B2221: push 000000C4h
  loc_004B2226: push 0041E938h
  loc_004B222B: push edx
  loc_004B222C: push eax
  loc_004B222D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B2233: push 0041E938h
  loc_004B2238: push 00000000h
  loc_004B223A: call [00401274h] ; __vbaCastObj
  loc_004B2240: push eax
  loc_004B2241: lea eax, var_18
  loc_004B2244: push eax
  loc_004B2245: call edi
  loc_004B2247: xor edi, edi
  loc_004B2249: mov var_4, edi
  loc_004B224C: push 004B2291h
  loc_004B2251: jmp 004B227Bh
  loc_004B2253: lea ecx, var_28
  loc_004B2256: lea edx, var_24
  loc_004B2259: push ecx
  loc_004B225A: lea eax, var_20
  loc_004B225D: push edx
  loc_004B225E: push eax
  loc_004B225F: push 00000003h
  loc_004B2261: call [00401040h] ; __vbaFreeObjList
  loc_004B2267: lea ecx, var_48
  loc_004B226A: lea edx, var_38
  loc_004B226D: push ecx
  loc_004B226E: push edx
  loc_004B226F: push 00000002h
  loc_004B2271: call [00401038h] ; __vbaFreeVarList
  loc_004B2277: add esp, 0000001Ch
  loc_004B227A: ret
  loc_004B227B: lea ecx, var_A0
  loc_004B2281: call [00401020h] ; __vbaFreeVar
  loc_004B2287: lea ecx, var_18
  loc_004B228A: call [004012B0h] ; __vbaFreeObj
  loc_004B2290: ret
  loc_004B2291: mov eax, Me
  loc_004B2294: push eax
  loc_004B2295: mov ecx, [eax]
  loc_004B2297: call [ecx+00000008h]
  loc_004B229A: mov eax, var_4
  loc_004B229D: mov ecx, var_14
  loc_004B22A0: pop edi
  loc_004B22A1: pop esi
  loc_004B22A2: mov fs:[00000000h], ecx
  loc_004B22A9: pop ebx
  loc_004B22AA: mov esp, ebp
  loc_004B22AC: pop ebp
  loc_004B22AD: retn 0004h
End Sub

Private Sub Grid_Click() '4B25F0
  loc_004B25F0: push ebp
  loc_004B25F1: mov ebp, esp
  loc_004B25F3: sub esp, 00000018h
  loc_004B25F6: push 00403B36h ; __vbaExceptHandler
  loc_004B25FB: mov eax, fs:[00000000h]
  loc_004B2601: push eax
  loc_004B2602: mov fs:[00000000h], esp
  loc_004B2609: mov eax, 00000080h
  loc_004B260E: call 00403B30h ; __vbaChkstk
  loc_004B2613: push ebx
  loc_004B2614: push esi
  loc_004B2615: push edi
  loc_004B2616: mov var_18, esp
  loc_004B2619: mov var_14, 00401BD8h ; Chr(37)
  loc_004B2620: mov eax, Me
  loc_004B2623: and eax, 00000001h
  loc_004B2626: mov var_10, eax
  loc_004B2629: mov ecx, Me
  loc_004B262C: and ecx, FFFFFFFEh
  loc_004B262F: mov Me, ecx
  loc_004B2632: mov var_C, 00000000h
  loc_004B2639: mov edx, Me
  loc_004B263C: mov eax, [edx]
  loc_004B263E: mov ecx, Me
  loc_004B2641: push ecx
  loc_004B2642: call [eax+00000004h]
  loc_004B2645: mov var_4, 00000001h
  loc_004B264C: mov var_4, 00000002h
  loc_004B2653: push FFFFFFFFh
  loc_004B2655: call [004010A8h] ; __vbaOnError
  loc_004B265B: mov var_4, 00000003h
  loc_004B2662: push 00000000h
  loc_004B2664: push 0000000Ah
  loc_004B2666: mov edx, Me
  loc_004B2669: mov eax, [edx]
  loc_004B266B: mov ecx, Me
  loc_004B266E: push ecx
  loc_004B266F: call [eax+00000308h]
  loc_004B2675: push eax
  loc_004B2676: lea edx, var_24
  loc_004B2679: push edx
  loc_004B267A: call [004010A0h] ; __vbaObjSet
  loc_004B2680: push eax
  loc_004B2681: lea eax, var_38
  loc_004B2684: push eax
  loc_004B2685: call [00401140h] ; __vbaLateIdCallLd
  loc_004B268B: add esp, 00000010h
  loc_004B268E: push eax
  loc_004B268F: call [0040121Ch] ; __vbaI4Var
  loc_004B2695: xor ecx, ecx
  loc_004B2697: test eax, eax
  loc_004B2699: setg cl
  loc_004B269C: neg ecx
  loc_004B269E: mov var_8C, cx
  loc_004B26A5: lea ecx, var_24
  loc_004B26A8: call [004012B0h] ; __vbaFreeObj
  loc_004B26AE: lea ecx, var_38
  loc_004B26B1: call [00401020h] ; __vbaFreeVar
  loc_004B26B7: movsx edx, var_8C
  loc_004B26BE: test edx, edx
  loc_004B26C0: jz 004B28C4h
  loc_004B26C6: mov var_4, 00000004h
  loc_004B26CD: push 00000000h
  loc_004B26CF: push 0000000Ah
  loc_004B26D1: mov eax, Me
  loc_004B26D4: mov ecx, [eax]
  loc_004B26D6: mov edx, Me
  loc_004B26D9: push edx
  loc_004B26DA: call [ecx+00000308h]
  loc_004B26E0: push eax
  loc_004B26E1: lea eax, var_24
  loc_004B26E4: push eax
  loc_004B26E5: call [004010A0h] ; __vbaObjSet
  loc_004B26EB: push eax
  loc_004B26EC: lea ecx, var_38
  loc_004B26EF: push ecx
  loc_004B26F0: call [00401140h] ; __vbaLateIdCallLd
  loc_004B26F6: add esp, 00000010h
  loc_004B26F9: push eax
  loc_004B26FA: call [0040121Ch] ; __vbaI4Var
  loc_004B2700: mov var_50, eax
  loc_004B2703: mov var_58, 00000003h
  loc_004B270A: mov var_70, 00000000h
  loc_004B2711: mov var_78, 00000003h
  loc_004B2718: mov eax, 00000010h
  loc_004B271D: call 00403B30h ; __vbaChkstk
  loc_004B2722: mov edx, esp
  loc_004B2724: mov eax, var_58
  loc_004B2727: mov [edx], eax
  loc_004B2729: mov ecx, var_54
  loc_004B272C: mov [edx+00000004h], ecx
  loc_004B272F: mov eax, var_50
  loc_004B2732: mov [edx+00000008h], eax
  loc_004B2735: mov ecx, var_4C
  loc_004B2738: mov [edx+0000000Ch], ecx
  loc_004B273B: mov eax, 00000010h
  loc_004B2740: call 00403B30h ; __vbaChkstk
  loc_004B2745: mov edx, esp
  loc_004B2747: mov eax, var_78
  loc_004B274A: mov [edx], eax
  loc_004B274C: mov ecx, var_74
  loc_004B274F: mov [edx+00000004h], ecx
  loc_004B2752: mov eax, var_70
  loc_004B2755: mov [edx+00000008h], eax
  loc_004B2758: mov ecx, var_6C
  loc_004B275B: mov [edx+0000000Ch], ecx
  loc_004B275E: push 00000002h
  loc_004B2760: push 00000041h
  loc_004B2762: mov edx, Me
  loc_004B2765: mov eax, [edx]
  loc_004B2767: mov ecx, Me
  loc_004B276A: push ecx
  loc_004B276B: call [eax+00000308h]
  loc_004B2771: push eax
  loc_004B2772: lea edx, var_28
  loc_004B2775: push edx
  loc_004B2776: call [004010A0h] ; __vbaObjSet
  loc_004B277C: push eax
  loc_004B277D: lea eax, var_48
  loc_004B2780: push eax
  loc_004B2781: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2787: add esp, 00000030h
  loc_004B278A: push eax
  loc_004B278B: call [00401028h] ; __vbaStrVarMove
  loc_004B2791: mov edx, eax
  loc_004B2793: mov ecx, 0061A038h
  loc_004B2798: call [00401270h] ; __vbaStrMove
  loc_004B279E: lea ecx, var_28
  loc_004B27A1: push ecx
  loc_004B27A2: lea edx, var_24
  loc_004B27A5: push edx
  loc_004B27A6: push 00000002h
  loc_004B27A8: call [00401040h] ; __vbaFreeObjList
  loc_004B27AE: add esp, 0000000Ch
  loc_004B27B1: lea eax, var_48
  loc_004B27B4: push eax
  loc_004B27B5: lea ecx, var_38
  loc_004B27B8: push ecx
  loc_004B27B9: push 00000002h
  loc_004B27BB: call [00401038h] ; __vbaFreeVarList
  loc_004B27C1: add esp, 0000000Ch
  loc_004B27C4: mov var_4, 00000005h
  loc_004B27CB: push 00000000h
  loc_004B27CD: push 0000000Ah
  loc_004B27CF: mov edx, Me
  loc_004B27D2: mov eax, [edx]
  loc_004B27D4: mov ecx, Me
  loc_004B27D7: push ecx
  loc_004B27D8: call [eax+00000308h]
  loc_004B27DE: push eax
  loc_004B27DF: lea edx, var_24
  loc_004B27E2: push edx
  loc_004B27E3: call [004010A0h] ; __vbaObjSet
  loc_004B27E9: push eax
  loc_004B27EA: lea eax, var_38
  loc_004B27ED: push eax
  loc_004B27EE: call [00401140h] ; __vbaLateIdCallLd
  loc_004B27F4: add esp, 00000010h
  loc_004B27F7: push eax
  loc_004B27F8: call [0040121Ch] ; __vbaI4Var
  loc_004B27FE: mov var_50, eax
  loc_004B2801: mov var_58, 00000003h
  loc_004B2808: mov var_70, 00000001h
  loc_004B280F: mov var_78, 00000003h
  loc_004B2816: mov eax, 00000010h
  loc_004B281B: call 00403B30h ; __vbaChkstk
  loc_004B2820: mov ecx, esp
  loc_004B2822: mov edx, var_58
  loc_004B2825: mov [ecx], edx
  loc_004B2827: mov eax, var_54
  loc_004B282A: mov [ecx+00000004h], eax
  loc_004B282D: mov edx, var_50
  loc_004B2830: mov [ecx+00000008h], edx
  loc_004B2833: mov eax, var_4C
  loc_004B2836: mov [ecx+0000000Ch], eax
  loc_004B2839: mov eax, 00000010h
  loc_004B283E: call 00403B30h ; __vbaChkstk
  loc_004B2843: mov ecx, esp
  loc_004B2845: mov edx, var_78
  loc_004B2848: mov [ecx], edx
  loc_004B284A: mov eax, var_74
  loc_004B284D: mov [ecx+00000004h], eax
  loc_004B2850: mov edx, var_70
  loc_004B2853: mov [ecx+00000008h], edx
  loc_004B2856: mov eax, var_6C
  loc_004B2859: mov [ecx+0000000Ch], eax
  loc_004B285C: push 00000002h
  loc_004B285E: push 00000041h
  loc_004B2860: mov ecx, Me
  loc_004B2863: mov edx, [ecx]
  loc_004B2865: mov eax, Me
  loc_004B2868: push eax
  loc_004B2869: call [edx+00000308h]
  loc_004B286F: push eax
  loc_004B2870: lea ecx, var_28
  loc_004B2873: push ecx
  loc_004B2874: call [004010A0h] ; __vbaObjSet
  loc_004B287A: push eax
  loc_004B287B: lea edx, var_48
  loc_004B287E: push edx
  loc_004B287F: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2885: add esp, 00000030h
  loc_004B2888: push eax
  loc_004B2889: call [00401028h] ; __vbaStrVarMove
  loc_004B288F: mov edx, eax
  loc_004B2891: mov ecx, 0061A03Ch
  loc_004B2896: call [00401270h] ; __vbaStrMove
  loc_004B289C: lea eax, var_28
  loc_004B289F: push eax
  loc_004B28A0: lea ecx, var_24
  loc_004B28A3: push ecx
  loc_004B28A4: push 00000002h
  loc_004B28A6: call [00401040h] ; __vbaFreeObjList
  loc_004B28AC: add esp, 0000000Ch
  loc_004B28AF: lea edx, var_48
  loc_004B28B2: push edx
  loc_004B28B3: lea eax, var_38
  loc_004B28B6: push eax
  loc_004B28B7: push 00000002h
  loc_004B28B9: call [00401038h] ; __vbaFreeVarList
  loc_004B28BF: add esp, 0000000Ch
  loc_004B28C2: jmp 004B28DBh
  loc_004B28C4: mov var_4, 00000007h
  loc_004B28CB: mov edx, 0041E5D4h
  loc_004B28D0: mov ecx, 0061A038h
  loc_004B28D5: call [004011ECh] ; __vbaStrCopy
  loc_004B28DB: mov var_10, 00000000h
  loc_004B28E2: push 004B2911h
  loc_004B28E7: jmp 004B2910h
  loc_004B28E9: lea ecx, var_28
  loc_004B28EC: push ecx
  loc_004B28ED: lea edx, var_24
  loc_004B28F0: push edx
  loc_004B28F1: push 00000002h
  loc_004B28F3: call [00401040h] ; __vbaFreeObjList
  loc_004B28F9: add esp, 0000000Ch
  loc_004B28FC: lea eax, var_48
  loc_004B28FF: push eax
  loc_004B2900: lea ecx, var_38
  loc_004B2903: push ecx
  loc_004B2904: push 00000002h
  loc_004B2906: call [00401038h] ; __vbaFreeVarList
  loc_004B290C: add esp, 0000000Ch
  loc_004B290F: ret
  loc_004B2910: ret
  loc_004B2911: mov edx, Me
  loc_004B2914: mov eax, [edx]
  loc_004B2916: mov ecx, Me
  loc_004B2919: push ecx
  loc_004B291A: call [eax+00000008h]
  loc_004B291D: mov eax, var_10
  loc_004B2920: mov ecx, var_20
  loc_004B2923: mov fs:[00000000h], ecx
  loc_004B292A: pop edi
  loc_004B292B: pop esi
  loc_004B292C: pop ebx
  loc_004B292D: mov esp, ebp
  loc_004B292F: pop ebp
  loc_004B2930: retn 0004h
End Sub

Private Sub Grid_DblClick() '4B2940
  loc_004B2940: push ebp
  loc_004B2941: mov ebp, esp
  loc_004B2943: sub esp, 00000018h
  loc_004B2946: push 00403B36h ; __vbaExceptHandler
  loc_004B294B: mov eax, fs:[00000000h]
  loc_004B2951: push eax
  loc_004B2952: mov fs:[00000000h], esp
  loc_004B2959: mov eax, 0000008Ch
  loc_004B295E: call 00403B30h ; __vbaChkstk
  loc_004B2963: push ebx
  loc_004B2964: push esi
  loc_004B2965: push edi
  loc_004B2966: mov var_18, esp
  loc_004B2969: mov var_14, 00401C20h ; Chr(37)
  loc_004B2970: mov eax, Me
  loc_004B2973: and eax, 00000001h
  loc_004B2976: mov var_10, eax
  loc_004B2979: mov ecx, Me
  loc_004B297C: and ecx, FFFFFFFEh
  loc_004B297F: mov Me, ecx
  loc_004B2982: mov var_C, 00000000h
  loc_004B2989: mov edx, Me
  loc_004B298C: mov eax, [edx]
  loc_004B298E: mov ecx, Me
  loc_004B2991: push ecx
  loc_004B2992: call [eax+00000004h]
  loc_004B2995: mov var_4, 00000001h
  loc_004B299C: mov var_4, 00000002h
  loc_004B29A3: push FFFFFFFFh
  loc_004B29A5: call [004010A8h] ; __vbaOnError
  loc_004B29AB: mov var_4, 00000003h
  loc_004B29B2: push 00000000h
  loc_004B29B4: push 0000000Ah
  loc_004B29B6: mov edx, Me
  loc_004B29B9: mov eax, [edx]
  loc_004B29BB: mov ecx, Me
  loc_004B29BE: push ecx
  loc_004B29BF: call [eax+00000308h]
  loc_004B29C5: push eax
  loc_004B29C6: lea edx, var_24
  loc_004B29C9: push edx
  loc_004B29CA: call [004010A0h] ; __vbaObjSet
  loc_004B29D0: push eax
  loc_004B29D1: lea eax, var_38
  loc_004B29D4: push eax
  loc_004B29D5: call [00401140h] ; __vbaLateIdCallLd
  loc_004B29DB: add esp, 00000010h
  loc_004B29DE: push eax
  loc_004B29DF: call [0040121Ch] ; __vbaI4Var
  loc_004B29E5: xor ecx, ecx
  loc_004B29E7: test eax, eax
  loc_004B29E9: setg cl
  loc_004B29EC: neg ecx
  loc_004B29EE: mov var_8C, cx
  loc_004B29F5: lea ecx, var_24
  loc_004B29F8: call [004012B0h] ; __vbaFreeObj
  loc_004B29FE: lea ecx, var_38
  loc_004B2A01: call [00401020h] ; __vbaFreeVar
  loc_004B2A07: movsx edx, var_8C
  loc_004B2A0E: test edx, edx
  loc_004B2A10: jz 004B2CC0h
  loc_004B2A16: mov var_4, 00000004h
  loc_004B2A1D: push 00000000h
  loc_004B2A1F: push 0000000Ah
  loc_004B2A21: mov eax, Me
  loc_004B2A24: mov ecx, [eax]
  loc_004B2A26: mov edx, Me
  loc_004B2A29: push edx
  loc_004B2A2A: call [ecx+00000308h]
  loc_004B2A30: push eax
  loc_004B2A31: lea eax, var_24
  loc_004B2A34: push eax
  loc_004B2A35: call [004010A0h] ; __vbaObjSet
  loc_004B2A3B: push eax
  loc_004B2A3C: lea ecx, var_38
  loc_004B2A3F: push ecx
  loc_004B2A40: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2A46: add esp, 00000010h
  loc_004B2A49: push eax
  loc_004B2A4A: call [0040121Ch] ; __vbaI4Var
  loc_004B2A50: mov var_50, eax
  loc_004B2A53: mov var_58, 00000003h
  loc_004B2A5A: mov var_70, 00000000h
  loc_004B2A61: mov var_78, 00000003h
  loc_004B2A68: mov eax, 00000010h
  loc_004B2A6D: call 00403B30h ; __vbaChkstk
  loc_004B2A72: mov edx, esp
  loc_004B2A74: mov eax, var_58
  loc_004B2A77: mov [edx], eax
  loc_004B2A79: mov ecx, var_54
  loc_004B2A7C: mov [edx+00000004h], ecx
  loc_004B2A7F: mov eax, var_50
  loc_004B2A82: mov [edx+00000008h], eax
  loc_004B2A85: mov ecx, var_4C
  loc_004B2A88: mov [edx+0000000Ch], ecx
  loc_004B2A8B: mov eax, 00000010h
  loc_004B2A90: call 00403B30h ; __vbaChkstk
  loc_004B2A95: mov edx, esp
  loc_004B2A97: mov eax, var_78
  loc_004B2A9A: mov [edx], eax
  loc_004B2A9C: mov ecx, var_74
  loc_004B2A9F: mov [edx+00000004h], ecx
  loc_004B2AA2: mov eax, var_70
  loc_004B2AA5: mov [edx+00000008h], eax
  loc_004B2AA8: mov ecx, var_6C
  loc_004B2AAB: mov [edx+0000000Ch], ecx
  loc_004B2AAE: push 00000002h
  loc_004B2AB0: push 00000041h
  loc_004B2AB2: mov edx, Me
  loc_004B2AB5: mov eax, [edx]
  loc_004B2AB7: mov ecx, Me
  loc_004B2ABA: push ecx
  loc_004B2ABB: call [eax+00000308h]
  loc_004B2AC1: push eax
  loc_004B2AC2: lea edx, var_28
  loc_004B2AC5: push edx
  loc_004B2AC6: call [004010A0h] ; __vbaObjSet
  loc_004B2ACC: push eax
  loc_004B2ACD: lea eax, var_48
  loc_004B2AD0: push eax
  loc_004B2AD1: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2AD7: add esp, 00000030h
  loc_004B2ADA: push eax
  loc_004B2ADB: call [00401028h] ; __vbaStrVarMove
  loc_004B2AE1: mov edx, eax
  loc_004B2AE3: mov ecx, 0061A038h
  loc_004B2AE8: call [00401270h] ; __vbaStrMove
  loc_004B2AEE: lea ecx, var_28
  loc_004B2AF1: push ecx
  loc_004B2AF2: lea edx, var_24
  loc_004B2AF5: push edx
  loc_004B2AF6: push 00000002h
  loc_004B2AF8: call [00401040h] ; __vbaFreeObjList
  loc_004B2AFE: add esp, 0000000Ch
  loc_004B2B01: lea eax, var_48
  loc_004B2B04: push eax
  loc_004B2B05: lea ecx, var_38
  loc_004B2B08: push ecx
  loc_004B2B09: push 00000002h
  loc_004B2B0B: call [00401038h] ; __vbaFreeVarList
  loc_004B2B11: add esp, 0000000Ch
  loc_004B2B14: mov var_4, 00000005h
  loc_004B2B1B: push 00000000h
  loc_004B2B1D: push 0000000Ah
  loc_004B2B1F: mov edx, Me
  loc_004B2B22: mov eax, [edx]
  loc_004B2B24: mov ecx, Me
  loc_004B2B27: push ecx
  loc_004B2B28: call [eax+00000308h]
  loc_004B2B2E: push eax
  loc_004B2B2F: lea edx, var_24
  loc_004B2B32: push edx
  loc_004B2B33: call [004010A0h] ; __vbaObjSet
  loc_004B2B39: push eax
  loc_004B2B3A: lea eax, var_38
  loc_004B2B3D: push eax
  loc_004B2B3E: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2B44: add esp, 00000010h
  loc_004B2B47: push eax
  loc_004B2B48: call [0040121Ch] ; __vbaI4Var
  loc_004B2B4E: mov var_50, eax
  loc_004B2B51: mov var_58, 00000003h
  loc_004B2B58: mov var_70, 00000001h
  loc_004B2B5F: mov var_78, 00000003h
  loc_004B2B66: mov eax, 00000010h
  loc_004B2B6B: call 00403B30h ; __vbaChkstk
  loc_004B2B70: mov ecx, esp
  loc_004B2B72: mov edx, var_58
  loc_004B2B75: mov [ecx], edx
  loc_004B2B77: mov eax, var_54
  loc_004B2B7A: mov [ecx+00000004h], eax
  loc_004B2B7D: mov edx, var_50
  loc_004B2B80: mov [ecx+00000008h], edx
  loc_004B2B83: mov eax, var_4C
  loc_004B2B86: mov [ecx+0000000Ch], eax
  loc_004B2B89: mov eax, 00000010h
  loc_004B2B8E: call 00403B30h ; __vbaChkstk
  loc_004B2B93: mov ecx, esp
  loc_004B2B95: mov edx, var_78
  loc_004B2B98: mov [ecx], edx
  loc_004B2B9A: mov eax, var_74
  loc_004B2B9D: mov [ecx+00000004h], eax
  loc_004B2BA0: mov edx, var_70
  loc_004B2BA3: mov [ecx+00000008h], edx
  loc_004B2BA6: mov eax, var_6C
  loc_004B2BA9: mov [ecx+0000000Ch], eax
  loc_004B2BAC: push 00000002h
  loc_004B2BAE: push 00000041h
  loc_004B2BB0: mov ecx, Me
  loc_004B2BB3: mov edx, [ecx]
  loc_004B2BB5: mov eax, Me
  loc_004B2BB8: push eax
  loc_004B2BB9: call [edx+00000308h]
  loc_004B2BBF: push eax
  loc_004B2BC0: lea ecx, var_28
  loc_004B2BC3: push ecx
  loc_004B2BC4: call [004010A0h] ; __vbaObjSet
  loc_004B2BCA: push eax
  loc_004B2BCB: lea edx, var_48
  loc_004B2BCE: push edx
  loc_004B2BCF: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2BD5: add esp, 00000030h
  loc_004B2BD8: push eax
  loc_004B2BD9: call [00401028h] ; __vbaStrVarMove
  loc_004B2BDF: mov edx, eax
  loc_004B2BE1: mov ecx, 0061A03Ch
  loc_004B2BE6: call [00401270h] ; __vbaStrMove
  loc_004B2BEC: lea eax, var_28
  loc_004B2BEF: push eax
  loc_004B2BF0: lea ecx, var_24
  loc_004B2BF3: push ecx
  loc_004B2BF4: push 00000002h
  loc_004B2BF6: call [00401040h] ; __vbaFreeObjList
  loc_004B2BFC: add esp, 0000000Ch
  loc_004B2BFF: lea edx, var_48
  loc_004B2C02: push edx
  loc_004B2C03: lea eax, var_38
  loc_004B2C06: push eax
  loc_004B2C07: push 00000002h
  loc_004B2C09: call [00401038h] ; __vbaFreeVarList
  loc_004B2C0F: add esp, 0000000Ch
  loc_004B2C12: mov var_4, 00000006h
  loc_004B2C19: cmp [0061B394h], 00000000h
  loc_004B2C20: jnz 004B2C3Eh
  loc_004B2C22: push 0061B394h
  loc_004B2C27: push 0041E4A0h
  loc_004B2C2C: call [004011DCh] ; __vbaNew2
  loc_004B2C32: mov var_A8, 0061B394h
  loc_004B2C3C: jmp 004B2C48h
  loc_004B2C3E: mov var_A8, 0061B394h
  loc_004B2C48: mov ecx, var_A8
  loc_004B2C4E: mov edx, [ecx]
  loc_004B2C50: mov var_8C, edx
  loc_004B2C56: mov eax, Me
  loc_004B2C59: push eax
  loc_004B2C5A: lea ecx, var_24
  loc_004B2C5D: push ecx
  loc_004B2C5E: call [004010B8h] ; __vbaObjSetAddref
  loc_004B2C64: push eax
  loc_004B2C65: mov edx, var_8C
  loc_004B2C6B: mov eax, [edx]
  loc_004B2C6D: mov ecx, var_8C
  loc_004B2C73: push ecx
  loc_004B2C74: call [eax+00000010h]
  loc_004B2C77: fnclex
  loc_004B2C79: mov var_90, eax
  loc_004B2C7F: cmp var_90, 00000000h
  loc_004B2C86: jge 004B2CABh
  loc_004B2C88: push 00000010h
  loc_004B2C8A: push 0041E490h
  loc_004B2C8F: mov edx, var_8C
  loc_004B2C95: push edx
  loc_004B2C96: mov eax, var_90
  loc_004B2C9C: push eax
  loc_004B2C9D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B2CA3: mov var_AC, eax
  loc_004B2CA9: jmp 004B2CB5h
  loc_004B2CAB: mov var_AC, 00000000h
  loc_004B2CB5: lea ecx, var_24
  loc_004B2CB8: call [004012B0h] ; __vbaFreeObj
  loc_004B2CBE: jmp 004B2CD7h
  loc_004B2CC0: mov var_4, 00000008h
  loc_004B2CC7: mov edx, 0041E5D4h
  loc_004B2CCC: mov ecx, 0061A038h
  loc_004B2CD1: call [004011ECh] ; __vbaStrCopy
  loc_004B2CD7: mov var_10, 00000000h
  loc_004B2CDE: push 004B2D0Dh
  loc_004B2CE3: jmp 004B2D0Ch
  loc_004B2CE5: lea ecx, var_28
  loc_004B2CE8: push ecx
  loc_004B2CE9: lea edx, var_24
  loc_004B2CEC: push edx
  loc_004B2CED: push 00000002h
  loc_004B2CEF: call [00401040h] ; __vbaFreeObjList
  loc_004B2CF5: add esp, 0000000Ch
  loc_004B2CF8: lea eax, var_48
  loc_004B2CFB: push eax
  loc_004B2CFC: lea ecx, var_38
  loc_004B2CFF: push ecx
  loc_004B2D00: push 00000002h
  loc_004B2D02: call [00401038h] ; __vbaFreeVarList
  loc_004B2D08: add esp, 0000000Ch
  loc_004B2D0B: ret
  loc_004B2D0C: ret
  loc_004B2D0D: mov edx, Me
  loc_004B2D10: mov eax, [edx]
  loc_004B2D12: mov ecx, Me
  loc_004B2D15: push ecx
  loc_004B2D16: call [eax+00000008h]
  loc_004B2D19: mov eax, var_10
  loc_004B2D1C: mov ecx, var_20
  loc_004B2D1F: mov fs:[00000000h], ecx
  loc_004B2D26: pop edi
  loc_004B2D27: pop esi
  loc_004B2D28: pop ebx
  loc_004B2D29: mov esp, ebp
  loc_004B2D2B: pop ebp
  loc_004B2D2C: retn 0004h
End Sub

Private Sub Grid_KeyPress(KeyAscii As Integer) '4B2D30
  loc_004B2D30: push ebp
  loc_004B2D31: mov ebp, esp
  loc_004B2D33: sub esp, 00000018h
  loc_004B2D36: push 00403B36h ; __vbaExceptHandler
  loc_004B2D3B: mov eax, fs:[00000000h]
  loc_004B2D41: push eax
  loc_004B2D42: mov fs:[00000000h], esp
  loc_004B2D49: mov eax, 0000008Ch
  loc_004B2D4E: call 00403B30h ; __vbaChkstk
  loc_004B2D53: push ebx
  loc_004B2D54: push esi
  loc_004B2D55: push edi
  loc_004B2D56: mov var_18, esp
  loc_004B2D59: mov var_14, 00401C68h ; Chr(37)
  loc_004B2D60: mov eax, Me
  loc_004B2D63: and eax, 00000001h
  loc_004B2D66: mov var_10, eax
  loc_004B2D69: mov ecx, Me
  loc_004B2D6C: and ecx, FFFFFFFEh
  loc_004B2D6F: mov Me, ecx
  loc_004B2D72: mov var_C, 00000000h
  loc_004B2D79: mov edx, Me
  loc_004B2D7C: mov eax, [edx]
  loc_004B2D7E: mov ecx, Me
  loc_004B2D81: push ecx
  loc_004B2D82: call [eax+00000004h]
  loc_004B2D85: mov var_4, 00000001h
  loc_004B2D8C: mov var_4, 00000002h
  loc_004B2D93: push FFFFFFFFh
  loc_004B2D95: call [004010A8h] ; __vbaOnError
  loc_004B2D9B: mov var_4, 00000003h
  loc_004B2DA2: push 00000000h
  loc_004B2DA4: push 0000000Ah
  loc_004B2DA6: mov edx, Me
  loc_004B2DA9: mov eax, [edx]
  loc_004B2DAB: mov ecx, Me
  loc_004B2DAE: push ecx
  loc_004B2DAF: call [eax+00000308h]
  loc_004B2DB5: push eax
  loc_004B2DB6: lea edx, var_24
  loc_004B2DB9: push edx
  loc_004B2DBA: call [004010A0h] ; __vbaObjSet
  loc_004B2DC0: push eax
  loc_004B2DC1: lea eax, var_38
  loc_004B2DC4: push eax
  loc_004B2DC5: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2DCB: add esp, 00000010h
  loc_004B2DCE: push eax
  loc_004B2DCF: call [0040121Ch] ; __vbaI4Var
  loc_004B2DD5: xor ecx, ecx
  loc_004B2DD7: test eax, eax
  loc_004B2DD9: setg cl
  loc_004B2DDC: neg ecx
  loc_004B2DDE: mov var_8C, cx
  loc_004B2DE5: lea ecx, var_24
  loc_004B2DE8: call [004012B0h] ; __vbaFreeObj
  loc_004B2DEE: lea ecx, var_38
  loc_004B2DF1: call [00401020h] ; __vbaFreeVar
  loc_004B2DF7: movsx edx, var_8C
  loc_004B2DFE: test edx, edx
  loc_004B2E00: jz 004B30B0h
  loc_004B2E06: mov var_4, 00000004h
  loc_004B2E0D: push 00000000h
  loc_004B2E0F: push 0000000Ah
  loc_004B2E11: mov eax, Me
  loc_004B2E14: mov ecx, [eax]
  loc_004B2E16: mov edx, Me
  loc_004B2E19: push edx
  loc_004B2E1A: call [ecx+00000308h]
  loc_004B2E20: push eax
  loc_004B2E21: lea eax, var_24
  loc_004B2E24: push eax
  loc_004B2E25: call [004010A0h] ; __vbaObjSet
  loc_004B2E2B: push eax
  loc_004B2E2C: lea ecx, var_38
  loc_004B2E2F: push ecx
  loc_004B2E30: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2E36: add esp, 00000010h
  loc_004B2E39: push eax
  loc_004B2E3A: call [0040121Ch] ; __vbaI4Var
  loc_004B2E40: mov var_50, eax
  loc_004B2E43: mov var_58, 00000003h
  loc_004B2E4A: mov var_70, 00000000h
  loc_004B2E51: mov var_78, 00000003h
  loc_004B2E58: mov eax, 00000010h
  loc_004B2E5D: call 00403B30h ; __vbaChkstk
  loc_004B2E62: mov edx, esp
  loc_004B2E64: mov eax, var_58
  loc_004B2E67: mov [edx], eax
  loc_004B2E69: mov ecx, var_54
  loc_004B2E6C: mov [edx+00000004h], ecx
  loc_004B2E6F: mov eax, var_50
  loc_004B2E72: mov [edx+00000008h], eax
  loc_004B2E75: mov ecx, var_4C
  loc_004B2E78: mov [edx+0000000Ch], ecx
  loc_004B2E7B: mov eax, 00000010h
  loc_004B2E80: call 00403B30h ; __vbaChkstk
  loc_004B2E85: mov edx, esp
  loc_004B2E87: mov eax, var_78
  loc_004B2E8A: mov [edx], eax
  loc_004B2E8C: mov ecx, var_74
  loc_004B2E8F: mov [edx+00000004h], ecx
  loc_004B2E92: mov eax, var_70
  loc_004B2E95: mov [edx+00000008h], eax
  loc_004B2E98: mov ecx, var_6C
  loc_004B2E9B: mov [edx+0000000Ch], ecx
  loc_004B2E9E: push 00000002h
  loc_004B2EA0: push 00000041h
  loc_004B2EA2: mov edx, Me
  loc_004B2EA5: mov eax, [edx]
  loc_004B2EA7: mov ecx, Me
  loc_004B2EAA: push ecx
  loc_004B2EAB: call [eax+00000308h]
  loc_004B2EB1: push eax
  loc_004B2EB2: lea edx, var_28
  loc_004B2EB5: push edx
  loc_004B2EB6: call [004010A0h] ; __vbaObjSet
  loc_004B2EBC: push eax
  loc_004B2EBD: lea eax, var_48
  loc_004B2EC0: push eax
  loc_004B2EC1: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2EC7: add esp, 00000030h
  loc_004B2ECA: push eax
  loc_004B2ECB: call [00401028h] ; __vbaStrVarMove
  loc_004B2ED1: mov edx, eax
  loc_004B2ED3: mov ecx, 0061A038h
  loc_004B2ED8: call [00401270h] ; __vbaStrMove
  loc_004B2EDE: lea ecx, var_28
  loc_004B2EE1: push ecx
  loc_004B2EE2: lea edx, var_24
  loc_004B2EE5: push edx
  loc_004B2EE6: push 00000002h
  loc_004B2EE8: call [00401040h] ; __vbaFreeObjList
  loc_004B2EEE: add esp, 0000000Ch
  loc_004B2EF1: lea eax, var_48
  loc_004B2EF4: push eax
  loc_004B2EF5: lea ecx, var_38
  loc_004B2EF8: push ecx
  loc_004B2EF9: push 00000002h
  loc_004B2EFB: call [00401038h] ; __vbaFreeVarList
  loc_004B2F01: add esp, 0000000Ch
  loc_004B2F04: mov var_4, 00000005h
  loc_004B2F0B: push 00000000h
  loc_004B2F0D: push 0000000Ah
  loc_004B2F0F: mov edx, Me
  loc_004B2F12: mov eax, [edx]
  loc_004B2F14: mov ecx, Me
  loc_004B2F17: push ecx
  loc_004B2F18: call [eax+00000308h]
  loc_004B2F1E: push eax
  loc_004B2F1F: lea edx, var_24
  loc_004B2F22: push edx
  loc_004B2F23: call [004010A0h] ; __vbaObjSet
  loc_004B2F29: push eax
  loc_004B2F2A: lea eax, var_38
  loc_004B2F2D: push eax
  loc_004B2F2E: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2F34: add esp, 00000010h
  loc_004B2F37: push eax
  loc_004B2F38: call [0040121Ch] ; __vbaI4Var
  loc_004B2F3E: mov var_50, eax
  loc_004B2F41: mov var_58, 00000003h
  loc_004B2F48: mov var_70, 00000001h
  loc_004B2F4F: mov var_78, 00000003h
  loc_004B2F56: mov eax, 00000010h
  loc_004B2F5B: call 00403B30h ; __vbaChkstk
  loc_004B2F60: mov ecx, esp
  loc_004B2F62: mov edx, var_58
  loc_004B2F65: mov [ecx], edx
  loc_004B2F67: mov eax, var_54
  loc_004B2F6A: mov [ecx+00000004h], eax
  loc_004B2F6D: mov edx, var_50
  loc_004B2F70: mov [ecx+00000008h], edx
  loc_004B2F73: mov eax, var_4C
  loc_004B2F76: mov [ecx+0000000Ch], eax
  loc_004B2F79: mov eax, 00000010h
  loc_004B2F7E: call 00403B30h ; __vbaChkstk
  loc_004B2F83: mov ecx, esp
  loc_004B2F85: mov edx, var_78
  loc_004B2F88: mov [ecx], edx
  loc_004B2F8A: mov eax, var_74
  loc_004B2F8D: mov [ecx+00000004h], eax
  loc_004B2F90: mov edx, var_70
  loc_004B2F93: mov [ecx+00000008h], edx
  loc_004B2F96: mov eax, var_6C
  loc_004B2F99: mov [ecx+0000000Ch], eax
  loc_004B2F9C: push 00000002h
  loc_004B2F9E: push 00000041h
  loc_004B2FA0: mov ecx, Me
  loc_004B2FA3: mov edx, [ecx]
  loc_004B2FA5: mov eax, Me
  loc_004B2FA8: push eax
  loc_004B2FA9: call [edx+00000308h]
  loc_004B2FAF: push eax
  loc_004B2FB0: lea ecx, var_28
  loc_004B2FB3: push ecx
  loc_004B2FB4: call [004010A0h] ; __vbaObjSet
  loc_004B2FBA: push eax
  loc_004B2FBB: lea edx, var_48
  loc_004B2FBE: push edx
  loc_004B2FBF: call [00401140h] ; __vbaLateIdCallLd
  loc_004B2FC5: add esp, 00000030h
  loc_004B2FC8: push eax
  loc_004B2FC9: call [00401028h] ; __vbaStrVarMove
  loc_004B2FCF: mov edx, eax
  loc_004B2FD1: mov ecx, 0061A03Ch
  loc_004B2FD6: call [00401270h] ; __vbaStrMove
  loc_004B2FDC: lea eax, var_28
  loc_004B2FDF: push eax
  loc_004B2FE0: lea ecx, var_24
  loc_004B2FE3: push ecx
  loc_004B2FE4: push 00000002h
  loc_004B2FE6: call [00401040h] ; __vbaFreeObjList
  loc_004B2FEC: add esp, 0000000Ch
  loc_004B2FEF: lea edx, var_48
  loc_004B2FF2: push edx
  loc_004B2FF3: lea eax, var_38
  loc_004B2FF6: push eax
  loc_004B2FF7: push 00000002h
  loc_004B2FF9: call [00401038h] ; __vbaFreeVarList
  loc_004B2FFF: add esp, 0000000Ch
  loc_004B3002: mov var_4, 00000006h
  loc_004B3009: cmp [0061B394h], 00000000h
  loc_004B3010: jnz 004B302Eh
  loc_004B3012: push 0061B394h
  loc_004B3017: push 0041E4A0h
  loc_004B301C: call [004011DCh] ; __vbaNew2
  loc_004B3022: mov var_A8, 0061B394h
  loc_004B302C: jmp 004B3038h
  loc_004B302E: mov var_A8, 0061B394h
  loc_004B3038: mov ecx, var_A8
  loc_004B303E: mov edx, [ecx]
  loc_004B3040: mov var_8C, edx
  loc_004B3046: mov eax, Me
  loc_004B3049: push eax
  loc_004B304A: lea ecx, var_24
  loc_004B304D: push ecx
  loc_004B304E: call [004010B8h] ; __vbaObjSetAddref
  loc_004B3054: push eax
  loc_004B3055: mov edx, var_8C
  loc_004B305B: mov eax, [edx]
  loc_004B305D: mov ecx, var_8C
  loc_004B3063: push ecx
  loc_004B3064: call [eax+00000010h]
  loc_004B3067: fnclex
  loc_004B3069: mov var_90, eax
  loc_004B306F: cmp var_90, 00000000h
  loc_004B3076: jge 004B309Bh
  loc_004B3078: push 00000010h
  loc_004B307A: push 0041E490h
  loc_004B307F: mov edx, var_8C
  loc_004B3085: push edx
  loc_004B3086: mov eax, var_90
  loc_004B308C: push eax
  loc_004B308D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3093: mov var_AC, eax
  loc_004B3099: jmp 004B30A5h
  loc_004B309B: mov var_AC, 00000000h
  loc_004B30A5: lea ecx, var_24
  loc_004B30A8: call [004012B0h] ; __vbaFreeObj
  loc_004B30AE: jmp 004B30C7h
  loc_004B30B0: mov var_4, 00000008h
  loc_004B30B7: mov edx, 0041E5D4h
  loc_004B30BC: mov ecx, 0061A038h
  loc_004B30C1: call [004011ECh] ; __vbaStrCopy
  loc_004B30C7: mov var_10, 00000000h
  loc_004B30CE: push 004B30FDh
  loc_004B30D3: jmp 004B30FCh
  loc_004B30D5: lea ecx, var_28
  loc_004B30D8: push ecx
  loc_004B30D9: lea edx, var_24
  loc_004B30DC: push edx
  loc_004B30DD: push 00000002h
  loc_004B30DF: call [00401040h] ; __vbaFreeObjList
  loc_004B30E5: add esp, 0000000Ch
  loc_004B30E8: lea eax, var_48
  loc_004B30EB: push eax
  loc_004B30EC: lea ecx, var_38
  loc_004B30EF: push ecx
  loc_004B30F0: push 00000002h
  loc_004B30F2: call [00401038h] ; __vbaFreeVarList
  loc_004B30F8: add esp, 0000000Ch
  loc_004B30FB: ret
  loc_004B30FC: ret
  loc_004B30FD: mov edx, Me
  loc_004B3100: mov eax, [edx]
  loc_004B3102: mov ecx, Me
  loc_004B3105: push ecx
  loc_004B3106: call [eax+00000008h]
  loc_004B3109: mov eax, var_10
  loc_004B310C: mov ecx, var_20
  loc_004B310F: mov fs:[00000000h], ecx
  loc_004B3116: pop edi
  loc_004B3117: pop esi
  loc_004B3118: pop ebx
  loc_004B3119: mov esp, ebp
  loc_004B311B: pop ebp
  loc_004B311C: retn 0008h
End Sub

Private Sub Proc_7_6_4B22C0() '4B22C0
  loc_004B22C0: push ebp
  loc_004B22C1: mov ebp, esp
  loc_004B22C3: sub esp, 00000008h
  loc_004B22C6: push 00403B36h ; __vbaExceptHandler
  loc_004B22CB: mov eax, fs:[00000000h]
  loc_004B22D1: push eax
  loc_004B22D2: mov fs:[00000000h], esp
  loc_004B22D9: sub esp, 00000088h
  loc_004B22DF: push ebx
  loc_004B22E0: push esi
  loc_004B22E1: push edi
  loc_004B22E2: mov var_8, esp
  loc_004B22E5: mov var_4, 00401BC8h
  loc_004B22EC: lea eax, var_34
  loc_004B22EF: lea ecx, var_24
  loc_004B22F2: xor esi, esi
  loc_004B22F4: push eax
  loc_004B22F5: push ecx
  loc_004B22F6: mov var_14, esi
  loc_004B22F9: mov var_24, esi
  loc_004B22FC: mov var_54, esi
  loc_004B22FF: mov var_74, esi
  loc_004B2302: mov var_94, esi
  loc_004B2308: mov var_2C, 0061A0A0h
  loc_004B230F: mov var_34, 00004008h
  loc_004B2316: call [004010D4h] ; rtcTrimVar
  loc_004B231C: lea edx, var_24
  loc_004B231F: lea ecx, var_94
  loc_004B2325: call [00401014h] ; __vbaVarMove
  loc_004B232B: lea edx, var_94
  loc_004B2331: lea eax, var_34
  loc_004B2334: push edx
  loc_004B2335: push eax
  loc_004B2336: mov var_2C, 0041F6C8h ; "AGENT"
  loc_004B233D: mov var_34, 00008008h
  loc_004B2344: call [00401110h] ; __vbaVarTstEq
  loc_004B234A: test ax, ax
  loc_004B234D: jz 004B25A8h
  loc_004B2353: push esi
  loc_004B2354: mov esi, Me
  loc_004B2357: push 00000044h
  loc_004B2359: push esi
  loc_004B235A: mov ecx, [esi]
  loc_004B235C: call [ecx+00000308h]
  loc_004B2362: mov edi, [004010A0h] ; __vbaObjSet
  loc_004B2368: lea edx, var_14
  loc_004B236B: push eax
  loc_004B236C: push edx
  loc_004B236D: call edi
  loc_004B236F: push eax
  loc_004B2370: call [00401024h] ; __vbaLateIdCall
  loc_004B2376: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_004B237C: add esp, 0000000Ch
  loc_004B237F: lea ecx, var_14
  loc_004B2382: call ebx
  loc_004B2384: sub esp, 00000010h
  loc_004B2387: mov ecx, 00000003h
  loc_004B238C: mov edx, esp
  loc_004B238E: mov var_34, ecx
  loc_004B2391: mov eax, 00000002h
  loc_004B2396: push 00000005h
  loc_004B2398: mov [edx], ecx
  loc_004B239A: mov ecx, var_30
  loc_004B239D: mov var_2C, eax
  loc_004B23A0: push esi
  loc_004B23A1: mov [edx+00000004h], ecx
  loc_004B23A4: mov ecx, [esi]
  loc_004B23A6: mov [edx+00000008h], eax
  loc_004B23A9: mov eax, var_28
  loc_004B23AC: mov [edx+0000000Ch], eax
  loc_004B23AF: call [ecx+00000308h]
  loc_004B23B5: lea edx, var_14
  loc_004B23B8: push eax
  loc_004B23B9: push edx
  loc_004B23BA: call edi
  loc_004B23BC: push eax
  loc_004B23BD: call [00401288h] ; __vbaLateIdSt
  loc_004B23C3: lea ecx, var_14
  loc_004B23C6: call ebx
  loc_004B23C8: sub esp, 00000010h
  loc_004B23CB: mov ecx, 00000003h
  loc_004B23D0: mov edx, esp
  loc_004B23D2: mov var_34, ecx
  loc_004B23D5: mov var_54, ecx
  loc_004B23D8: xor eax, eax
  loc_004B23DA: mov [edx], ecx
  loc_004B23DC: mov ecx, var_30
  loc_004B23DF: mov var_2C, eax
  loc_004B23E2: sub esp, 00000010h
  loc_004B23E5: mov [edx+00000004h], ecx
  loc_004B23E8: mov ecx, esp
  loc_004B23EA: push 00000001h
  loc_004B23EC: push 00000039h
  loc_004B23EE: mov [edx+00000008h], eax
  loc_004B23F1: mov eax, var_28
  loc_004B23F4: push esi
  loc_004B23F5: mov [edx+0000000Ch], eax
  loc_004B23F8: mov edx, var_54
  loc_004B23FB: mov eax, var_50
  loc_004B23FE: mov [ecx], edx
  loc_004B2400: mov edx, var_48
  loc_004B2403: mov [ecx+00000004h], eax
  loc_004B2406: mov eax, 000002BCh
  loc_004B240B: mov [ecx+00000008h], eax
  loc_004B240E: mov eax, [esi]
  loc_004B2410: mov [ecx+0000000Ch], edx
  loc_004B2413: call [eax+00000308h]
  loc_004B2419: lea ecx, var_14
  loc_004B241C: push eax
  loc_004B241D: push ecx
  loc_004B241E: call edi
  loc_004B2420: push eax
  loc_004B2421: call [00401160h] ; __vbaLateIdCallSt
  loc_004B2427: add esp, 0000002Ch
  loc_004B242A: lea ecx, var_14
  loc_004B242D: call ebx
  loc_004B242F: mov eax, 00000001h
  loc_004B2434: mov ecx, 00000003h
  loc_004B2439: mov var_2C, eax
  loc_004B243C: sub esp, 00000010h
  loc_004B243F: mov var_34, ecx
  loc_004B2442: mov edx, esp
  loc_004B2444: mov var_54, ecx
  loc_004B2447: sub esp, 00000010h
  loc_004B244A: mov [edx], ecx
  loc_004B244C: mov ecx, var_30
  loc_004B244F: mov [edx+00000004h], ecx
  loc_004B2452: mov ecx, esp
  loc_004B2454: push 00000001h
  loc_004B2456: push 00000039h
  loc_004B2458: mov [edx+00000008h], eax
  loc_004B245B: mov eax, var_28
  loc_004B245E: push esi
  loc_004B245F: mov [edx+0000000Ch], eax
  loc_004B2462: mov edx, var_54
  loc_004B2465: mov eax, var_50
  loc_004B2468: mov [ecx], edx
  loc_004B246A: mov edx, var_48
  loc_004B246D: mov [ecx+00000004h], eax
  loc_004B2470: mov eax, 00000E74h
  loc_004B2475: mov [ecx+00000008h], eax
  loc_004B2478: mov eax, [esi]
  loc_004B247A: mov [ecx+0000000Ch], edx
  loc_004B247D: call [eax+00000308h]
  loc_004B2483: lea ecx, var_14
  loc_004B2486: push eax
  loc_004B2487: push ecx
  loc_004B2488: call edi
  loc_004B248A: push eax
  loc_004B248B: call [00401160h] ; __vbaLateIdCallSt
  loc_004B2491: add esp, 0000002Ch
  loc_004B2494: lea ecx, var_14
  loc_004B2497: call ebx
  loc_004B2499: sub esp, 00000010h
  loc_004B249C: mov ecx, 00000003h
  loc_004B24A1: mov edx, esp
  loc_004B24A3: mov var_34, ecx
  loc_004B24A6: mov var_54, ecx
  loc_004B24A9: xor eax, eax
  loc_004B24AB: mov [edx], ecx
  loc_004B24AD: mov ecx, var_30
  loc_004B24B0: mov var_2C, eax
  loc_004B24B3: mov var_4C, eax
  loc_004B24B6: mov [edx+00000004h], ecx
  loc_004B24B9: sub esp, 00000010h
  loc_004B24BC: mov ecx, esp
  loc_004B24BE: sub esp, 00000010h
  loc_004B24C1: mov [edx+00000008h], eax
  loc_004B24C4: mov eax, var_28
  loc_004B24C7: mov [edx+0000000Ch], eax
  loc_004B24CA: mov edx, var_54
  loc_004B24CD: mov eax, var_50
  loc_004B24D0: mov [ecx], edx
  loc_004B24D2: mov edx, var_4C
  loc_004B24D5: mov [ecx+00000004h], eax
  loc_004B24D8: mov eax, var_48
  loc_004B24DB: mov [ecx+00000008h], edx
  loc_004B24DE: mov edx, var_70
  loc_004B24E1: mov [ecx+0000000Ch], eax
  loc_004B24E4: mov ecx, esp
  loc_004B24E6: mov eax, 00000008h
  loc_004B24EB: push 00000002h
  loc_004B24ED: mov [ecx], eax
  loc_004B24EF: mov eax, 0042457Ch ; "No"
  loc_004B24F4: push 00000041h
  loc_004B24F6: push esi
  loc_004B24F7: mov [ecx+00000004h], edx
  loc_004B24FA: mov [ecx+00000008h], eax
  loc_004B24FD: mov eax, var_68
  loc_004B2500: mov [ecx+0000000Ch], eax
  loc_004B2503: mov ecx, [esi]
  loc_004B2505: call [ecx+00000308h]
  loc_004B250B: lea edx, var_14
  loc_004B250E: push eax
  loc_004B250F: push edx
  loc_004B2510: call edi
  loc_004B2512: push eax
  loc_004B2513: call [00401160h] ; __vbaLateIdCallSt
  loc_004B2519: add esp, 0000003Ch
  loc_004B251C: lea ecx, var_14
  loc_004B251F: call ebx
  loc_004B2521: sub esp, 00000010h
  loc_004B2524: mov ecx, 00000003h
  loc_004B2529: mov edx, esp
  loc_004B252B: mov var_34, ecx
  loc_004B252E: mov var_54, ecx
  loc_004B2531: xor eax, eax
  loc_004B2533: mov [edx], ecx
  loc_004B2535: mov ecx, var_30
  loc_004B2538: mov var_2C, eax
  loc_004B253B: sub esp, 00000010h
  loc_004B253E: mov [edx+00000004h], ecx
  loc_004B2541: mov ecx, esp
  loc_004B2543: sub esp, 00000010h
  loc_004B2546: mov [edx+00000008h], eax
  loc_004B2549: mov eax, var_28
  loc_004B254C: mov [edx+0000000Ch], eax
  loc_004B254F: mov edx, var_54
  loc_004B2552: mov eax, var_50
  loc_004B2555: mov [ecx], edx
  loc_004B2557: mov edx, var_48
  loc_004B255A: mov [ecx+00000004h], eax
  loc_004B255D: mov eax, 00000001h
  loc_004B2562: mov [ecx+00000008h], eax
  loc_004B2565: mov eax, 00000008h
  loc_004B256A: mov [ecx+0000000Ch], edx
  loc_004B256D: mov edx, var_70
  loc_004B2570: mov ecx, esp
  loc_004B2572: push 00000002h
  loc_004B2574: push 00000041h
  loc_004B2576: push esi
  loc_004B2577: mov [ecx], eax
  loc_004B2579: mov eax, 00424AACh ; "Agent Name"
  loc_004B257E: mov [ecx+00000004h], edx
  loc_004B2581: mov [ecx+00000008h], eax
  loc_004B2584: mov eax, var_68
  loc_004B2587: mov [ecx+0000000Ch], eax
  loc_004B258A: mov ecx, [esi]
  loc_004B258C: call [ecx+00000308h]
  loc_004B2592: lea edx, var_14
  loc_004B2595: push eax
  loc_004B2596: push edx
  loc_004B2597: call edi
  loc_004B2599: push eax
  loc_004B259A: call [00401160h] ; __vbaLateIdCallSt
  loc_004B25A0: add esp, 0000003Ch
  loc_004B25A3: lea ecx, var_14
  loc_004B25A6: call ebx
  loc_004B25A8: push 004B25CFh
  loc_004B25AD: jmp 004B25C2h
  loc_004B25AF: lea ecx, var_14
  loc_004B25B2: call [004012B0h] ; __vbaFreeObj
  loc_004B25B8: lea ecx, var_24
  loc_004B25BB: call [00401020h] ; __vbaFreeVar
  loc_004B25C1: ret
  loc_004B25C2: lea ecx, var_94
  loc_004B25C8: call [00401020h] ; __vbaFreeVar
  loc_004B25CE: ret
  loc_004B25CF: mov ecx, var_10
  loc_004B25D2: pop edi
  loc_004B25D3: pop esi
  loc_004B25D4: xor eax, eax
  loc_004B25D6: mov fs:[00000000h], ecx
  loc_004B25DD: pop ebx
  loc_004B25DE: mov esp, ebp
  loc_004B25E0: pop ebp
  loc_004B25E1: retn 0004h
End Sub
