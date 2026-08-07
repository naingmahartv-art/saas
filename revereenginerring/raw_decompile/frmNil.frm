VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Begin VB.Form frmNil
  Caption = " Search NIL"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 3780
  ClientHeight = 6135
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton Command1
    Caption = "Done"
    Left = 2400
    Top = 5670
    Width = 1035
    Height = 375
    TabIndex = 1
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
  Begin MSFlexGridLib.MSFlexGrid MSFle
    Left = 0
    Top = 0
    Width = 3765
    Height = 5535
    TabIndex = 0
    OleObjectBlob = "frmNil.frx":0000
  End
End

Attribute VB_Name = "frmNil"


Private Sub Command1_Click() '4BBB60
  loc_004BBB60: push ebp
  loc_004BBB61: mov ebp, esp
  loc_004BBB63: sub esp, 0000000Ch
  loc_004BBB66: push 00403B36h ; __vbaExceptHandler
  loc_004BBB6B: mov eax, fs:[00000000h]
  loc_004BBB71: push eax
  loc_004BBB72: mov fs:[00000000h], esp
  loc_004BBB79: sub esp, 00000018h
  loc_004BBB7C: push ebx
  loc_004BBB7D: push esi
  loc_004BBB7E: push edi
  loc_004BBB7F: mov var_C, esp
  loc_004BBB82: mov var_8, 00401EB0h
  loc_004BBB89: mov edi, Me
  loc_004BBB8C: mov eax, edi
  loc_004BBB8E: and eax, 00000001h
  loc_004BBB91: mov var_4, eax
  loc_004BBB94: and edi, FFFFFFFEh
  loc_004BBB97: push edi
  loc_004BBB98: mov Me, edi
  loc_004BBB9B: mov ecx, [edi]
  loc_004BBB9D: call [ecx+00000004h]
  loc_004BBBA0: mov eax, [0061B394h]
  loc_004BBBA5: xor ebx, ebx
  loc_004BBBA7: cmp eax, ebx
  loc_004BBBA9: mov var_18, ebx
  loc_004BBBAC: jnz 004BBBBEh
  loc_004BBBAE: push 0061B394h
  loc_004BBBB3: push 0041E4A0h
  loc_004BBBB8: call [004011DCh] ; __vbaNew2
  loc_004BBBBE: mov esi, [0061B394h]
  loc_004BBBC4: lea eax, var_18
  loc_004BBBC7: push edi
  loc_004BBBC8: push eax
  loc_004BBBC9: mov edx, [esi]
  loc_004BBBCB: mov var_2C, edx
  loc_004BBBCE: call [004010B8h] ; __vbaObjSetAddref
  loc_004BBBD4: mov ecx, var_2C
  loc_004BBBD7: push eax
  loc_004BBBD8: push esi
  loc_004BBBD9: call [ecx+00000010h]
  loc_004BBBDC: cmp eax, ebx
  loc_004BBBDE: fnclex
  loc_004BBBE0: jge 004BBBF1h
  loc_004BBBE2: push 00000010h
  loc_004BBBE4: push 0041E490h
  loc_004BBBE9: push esi
  loc_004BBBEA: push eax
  loc_004BBBEB: call [00401074h] ; __vbaHresultCheckObj
  loc_004BBBF1: lea ecx, var_18
  loc_004BBBF4: call [004012B0h] ; __vbaFreeObj
  loc_004BBBFA: mov var_4, ebx
  loc_004BBBFD: push 004BBC0Fh
  loc_004BBC02: jmp 004BBC0Eh
  loc_004BBC04: lea ecx, var_18
  loc_004BBC07: call [004012B0h] ; __vbaFreeObj
  loc_004BBC0D: ret
  loc_004BBC0E: ret
  loc_004BBC0F: mov eax, Me
  loc_004BBC12: push eax
  loc_004BBC13: mov edx, [eax]
  loc_004BBC15: call [edx+00000008h]
  loc_004BBC18: mov eax, var_4
  loc_004BBC1B: mov ecx, var_14
  loc_004BBC1E: pop edi
  loc_004BBC1F: pop esi
  loc_004BBC20: mov fs:[00000000h], ecx
  loc_004BBC27: pop ebx
  loc_004BBC28: mov esp, ebp
  loc_004BBC2A: pop ebp
  loc_004BBC2B: retn 0004h
End Sub

Private Sub Form_Load() '4BBC30
  loc_004BBC30: push ebp
  loc_004BBC31: mov ebp, esp
  loc_004BBC33: sub esp, 0000000Ch
  loc_004BBC36: push 00403B36h ; __vbaExceptHandler
  loc_004BBC3B: mov eax, fs:[00000000h]
  loc_004BBC41: push eax
  loc_004BBC42: mov fs:[00000000h], esp
  loc_004BBC49: sub esp, 000000CCh
  loc_004BBC4F: push ebx
  loc_004BBC50: push esi
  loc_004BBC51: push edi
  loc_004BBC52: mov var_C, esp
  loc_004BBC55: mov var_8, 00401EC0h
  loc_004BBC5C: mov esi, Me
  loc_004BBC5F: mov eax, esi
  loc_004BBC61: and eax, 00000001h
  loc_004BBC64: mov var_4, eax
  loc_004BBC67: and esi, FFFFFFFEh
  loc_004BBC6A: push esi
  loc_004BBC6B: mov Me, esi
  loc_004BBC6E: mov ecx, [esi]
  loc_004BBC70: call [ecx+00000004h]
  loc_004BBC73: mov edx, [esi]
  loc_004BBC75: xor eax, eax
  loc_004BBC77: push eax
  loc_004BBC78: push 00000044h
  loc_004BBC7A: push esi
  loc_004BBC7B: mov var_18, eax
  loc_004BBC7E: mov var_1C, eax
  loc_004BBC81: mov var_20, eax
  loc_004BBC84: mov var_24, eax
  loc_004BBC87: mov var_28, eax
  loc_004BBC8A: mov var_38, eax
  loc_004BBC8D: mov var_48, eax
  loc_004BBC90: mov var_58, eax
  loc_004BBC93: mov var_68, eax
  loc_004BBC96: mov var_78, eax
  loc_004BBC99: mov var_88, eax
  loc_004BBC9F: mov var_BC, eax
  loc_004BBCA5: call [edx+00000300h]
  loc_004BBCAB: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BBCB1: push eax
  loc_004BBCB2: lea eax, var_20
  loc_004BBCB5: push eax
  loc_004BBCB6: call edi
  loc_004BBCB8: push eax
  loc_004BBCB9: call [00401024h] ; __vbaLateIdCall
  loc_004BBCBF: mov ebx, [004012B0h] ; __vbaFreeObj
  loc_004BBCC5: add esp, 0000000Ch
  loc_004BBCC8: lea ecx, var_20
  loc_004BBCCB: call ebx
  loc_004BBCCD: push 00000000h
  loc_004BBCCF: call [00401008h] ; __vbaStrI2
  loc_004BBCD5: mov edx, eax
  loc_004BBCD7: lea ecx, var_18
  loc_004BBCDA: call [00401270h] ; __vbaStrMove
  loc_004BBCE0: sub esp, 00000010h
  loc_004BBCE3: mov ecx, 00000003h
  loc_004BBCE8: mov edx, esp
  loc_004BBCEA: mov var_68, ecx
  loc_004BBCED: xor eax, eax
  loc_004BBCEF: push 0000000Ah
  loc_004BBCF1: mov [edx], ecx
  loc_004BBCF3: mov ecx, var_64
  loc_004BBCF6: mov var_60, eax
  loc_004BBCF9: push esi
  loc_004BBCFA: mov [edx+00000004h], ecx
  loc_004BBCFD: mov ecx, [esi]
  loc_004BBCFF: mov [edx+00000008h], eax
  loc_004BBD02: mov eax, var_5C
  loc_004BBD05: mov [edx+0000000Ch], eax
  loc_004BBD08: call [ecx+00000300h]
  loc_004BBD0E: lea edx, var_20
  loc_004BBD11: push eax
  loc_004BBD12: push edx
  loc_004BBD13: call edi
  loc_004BBD15: push eax
  loc_004BBD16: call [00401288h] ; __vbaLateIdSt
  loc_004BBD1C: lea ecx, var_20
  loc_004BBD1F: call ebx
  loc_004BBD21: xor eax, eax
  loc_004BBD23: sub esp, 00000010h
  loc_004BBD26: mov edx, esp
  loc_004BBD28: mov ecx, 00000003h
  loc_004BBD2D: mov var_68, ecx
  loc_004BBD30: mov var_60, eax
  loc_004BBD33: mov [edx], ecx
  loc_004BBD35: mov ecx, var_64
  loc_004BBD38: mov [edx+00000004h], ecx
  loc_004BBD3B: mov ecx, [esi]
  loc_004BBD3D: mov [edx+00000008h], eax
  loc_004BBD40: mov eax, var_5C
  loc_004BBD43: push 0000000Bh
  loc_004BBD45: push esi
  loc_004BBD46: mov [edx+0000000Ch], eax
  loc_004BBD49: call [ecx+00000300h]
  loc_004BBD4F: lea edx, var_20
  loc_004BBD52: push eax
  loc_004BBD53: push edx
  loc_004BBD54: call edi
  loc_004BBD56: push eax
  loc_004BBD57: call [00401288h] ; __vbaLateIdSt
  loc_004BBD5D: lea ecx, var_20
  loc_004BBD60: call ebx
  loc_004BBD62: sub esp, 00000010h
  loc_004BBD65: mov ecx, 00000008h
  loc_004BBD6A: mov edx, esp
  loc_004BBD6C: mov var_68, ecx
  loc_004BBD6F: mov eax, 0042690Ch ; "No."
  loc_004BBD74: push 00000000h
  loc_004BBD76: mov [edx], ecx
  loc_004BBD78: mov ecx, var_64
  loc_004BBD7B: mov var_60, eax
  loc_004BBD7E: push esi
  loc_004BBD7F: mov [edx+00000004h], ecx
  loc_004BBD82: mov ecx, [esi]
  loc_004BBD84: mov [edx+00000008h], eax
  loc_004BBD87: mov eax, var_5C
  loc_004BBD8A: mov [edx+0000000Ch], eax
  loc_004BBD8D: call [ecx+00000300h]
  loc_004BBD93: lea edx, var_20
  loc_004BBD96: push eax
  loc_004BBD97: push edx
  loc_004BBD98: call edi
  loc_004BBD9A: push eax
  loc_004BBD9B: call [00401288h] ; __vbaLateIdSt
  loc_004BBDA1: lea ecx, var_20
  loc_004BBDA4: call ebx
  loc_004BBDA6: sub esp, 00000010h
  loc_004BBDA9: mov ecx, 00000003h
  loc_004BBDAE: mov edx, esp
  loc_004BBDB0: mov var_68, ecx
  loc_004BBDB3: mov var_88, ecx
  loc_004BBDB9: xor eax, eax
  loc_004BBDBB: mov [edx], ecx
  loc_004BBDBD: mov ecx, var_64
  loc_004BBDC0: mov var_60, eax
  loc_004BBDC3: sub esp, 00000010h
  loc_004BBDC6: mov [edx+00000004h], ecx
  loc_004BBDC9: mov ecx, esp
  loc_004BBDCB: mov var_80, 00000320h
  loc_004BBDD2: push 00000001h
  loc_004BBDD4: mov [edx+00000008h], eax
  loc_004BBDD7: mov eax, var_5C
  loc_004BBDDA: push 00000039h
  loc_004BBDDC: push esi
  loc_004BBDDD: mov [edx+0000000Ch], eax
  loc_004BBDE0: mov edx, var_88
  loc_004BBDE6: mov eax, var_84
  loc_004BBDEC: mov [ecx], edx
  loc_004BBDEE: mov edx, var_80
  loc_004BBDF1: mov [ecx+00000004h], eax
  loc_004BBDF4: mov eax, var_7C
  loc_004BBDF7: mov [ecx+00000008h], edx
  loc_004BBDFA: mov [ecx+0000000Ch], eax
  loc_004BBDFD: mov ecx, [esi]
  loc_004BBDFF: call [ecx+00000300h]
  loc_004BBE05: lea edx, var_20
  loc_004BBE08: push eax
  loc_004BBE09: push edx
  loc_004BBE0A: call edi
  loc_004BBE0C: push eax
  loc_004BBE0D: call [00401160h] ; __vbaLateIdCallSt
  loc_004BBE13: add esp, 0000002Ch
  loc_004BBE16: lea ecx, var_20
  loc_004BBE19: call ebx
  loc_004BBE1B: mov eax, 00000001h
  loc_004BBE20: mov ecx, 00000003h
  loc_004BBE25: mov var_60, eax
  loc_004BBE28: mov var_68, ecx
  loc_004BBE2B: sub esp, 00000010h
  loc_004BBE2E: mov edx, esp
  loc_004BBE30: push 0000000Bh
  loc_004BBE32: push esi
  loc_004BBE33: mov [edx], ecx
  loc_004BBE35: mov ecx, var_64
  loc_004BBE38: mov [edx+00000004h], ecx
  loc_004BBE3B: mov ecx, [esi]
  loc_004BBE3D: mov [edx+00000008h], eax
  loc_004BBE40: mov eax, var_5C
  loc_004BBE43: mov [edx+0000000Ch], eax
  loc_004BBE46: call [ecx+00000300h]
  loc_004BBE4C: lea edx, var_20
  loc_004BBE4F: push eax
  loc_004BBE50: push edx
  loc_004BBE51: call edi
  loc_004BBE53: push eax
  loc_004BBE54: call [00401288h] ; __vbaLateIdSt
  loc_004BBE5A: lea ecx, var_20
  loc_004BBE5D: call ebx
  loc_004BBE5F: sub esp, 00000010h
  loc_004BBE62: mov ecx, 00000008h
  loc_004BBE67: mov edx, esp
  loc_004BBE69: mov var_68, ecx
  loc_004BBE6C: mov eax, 0041EDD8h ; "SrNo"
  loc_004BBE71: push 00000000h
  loc_004BBE73: mov [edx], ecx
  loc_004BBE75: mov ecx, var_64
  loc_004BBE78: mov var_60, eax
  loc_004BBE7B: push esi
  loc_004BBE7C: mov [edx+00000004h], ecx
  loc_004BBE7F: mov ecx, [esi]
  loc_004BBE81: mov [edx+00000008h], eax
  loc_004BBE84: mov eax, var_5C
  loc_004BBE87: mov [edx+0000000Ch], eax
  loc_004BBE8A: call [ecx+00000300h]
  loc_004BBE90: lea edx, var_20
  loc_004BBE93: push eax
  loc_004BBE94: push edx
  loc_004BBE95: call edi
  loc_004BBE97: push eax
  loc_004BBE98: call [00401288h] ; __vbaLateIdSt
  loc_004BBE9E: lea ecx, var_20
  loc_004BBEA1: call ebx
  loc_004BBEA3: sub esp, 00000010h
  loc_004BBEA6: mov ecx, 00000003h
  loc_004BBEAB: mov edx, esp
  loc_004BBEAD: mov var_68, ecx
  loc_004BBEB0: mov var_88, ecx
  loc_004BBEB6: mov eax, 00000001h
  loc_004BBEBB: mov [edx], ecx
  loc_004BBEBD: mov ecx, var_64
  loc_004BBEC0: mov var_60, eax
  loc_004BBEC3: sub esp, 00000010h
  loc_004BBEC6: mov [edx+00000004h], ecx
  loc_004BBEC9: mov ecx, esp
  loc_004BBECB: mov var_80, 00000A46h
  loc_004BBED2: push 00000001h
  loc_004BBED4: mov [edx+00000008h], eax
  loc_004BBED7: mov eax, var_5C
  loc_004BBEDA: push 00000039h
  loc_004BBEDC: push esi
  loc_004BBEDD: mov [edx+0000000Ch], eax
  loc_004BBEE0: mov edx, var_88
  loc_004BBEE6: mov eax, var_84
  loc_004BBEEC: mov [ecx], edx
  loc_004BBEEE: mov edx, var_80
  loc_004BBEF1: mov [ecx+00000004h], eax
  loc_004BBEF4: mov eax, var_7C
  loc_004BBEF7: mov [ecx+00000008h], edx
  loc_004BBEFA: mov [ecx+0000000Ch], eax
  loc_004BBEFD: mov ecx, [esi]
  loc_004BBEFF: call [ecx+00000300h]
  loc_004BBF05: lea edx, var_20
  loc_004BBF08: push eax
  loc_004BBF09: push edx
  loc_004BBF0A: call edi
  loc_004BBF0C: push eax
  loc_004BBF0D: call [00401160h] ; __vbaLateIdCallSt
  loc_004BBF13: add esp, 0000002Ch
  loc_004BBF16: lea ecx, var_20
  loc_004BBF19: call ebx
  loc_004BBF1B: lea eax, var_68
  loc_004BBF1E: lea ecx, var_38
  loc_004BBF21: push eax
  loc_004BBF22: push ecx
  loc_004BBF23: mov var_60, 0061A05Ch
  loc_004BBF2A: mov var_68, 00004008h
  loc_004BBF31: call [004010D4h] ; rtcTrimVar
  loc_004BBF37: mov edx, 00000008h
  loc_004BBF3C: mov var_70, 00426BA8h ; "Select Distinct SrNo,AgentName From LG WHERE OnCount='"
  loc_004BBF43: mov var_78, edx
  loc_004BBF46: mov var_88, edx
  loc_004BBF4C: mov edx, [0061A13Ch]
  loc_004BBF52: mov var_80, 0041E890h ; "'"
  loc_004BBF59: mov ecx, 0000000Ah
  loc_004BBF5E: mov eax, 80020004h
  loc_004BBF63: mov ebx, [edx]
  loc_004BBF65: lea edx, var_20
  loc_004BBF68: push edx
  loc_004BBF69: mov var_A8, ecx
  loc_004BBF6F: sub esp, 00000010h
  loc_004BBF72: mov var_A0, eax
  loc_004BBF78: mov edx, esp
  loc_004BBF7A: sub esp, 00000010h
  loc_004BBF7D: mov [edx], ecx
  loc_004BBF7F: mov ecx, var_B4
  loc_004BBF85: mov [edx+00000004h], ecx
  loc_004BBF88: mov ecx, esp
  loc_004BBF8A: sub esp, 00000010h
  loc_004BBF8D: mov [edx+00000008h], eax
  loc_004BBF90: mov eax, var_AC
  loc_004BBF96: mov [edx+0000000Ch], eax
  loc_004BBF99: mov edx, var_A8
  loc_004BBF9F: mov eax, var_A4
  loc_004BBFA5: mov [ecx], edx
  loc_004BBFA7: mov edx, var_A0
  loc_004BBFAD: mov [ecx+00000004h], eax
  loc_004BBFB0: mov eax, var_9C
  loc_004BBFB6: mov [ecx+00000008h], edx
  loc_004BBFB9: mov edx, var_94
  loc_004BBFBF: mov [ecx+0000000Ch], eax
  loc_004BBFC2: mov ecx, esp
  loc_004BBFC4: mov eax, 00000003h
  loc_004BBFC9: mov [ecx], eax
  loc_004BBFCB: mov eax, 00000004h
  loc_004BBFD0: mov [ecx+00000004h], edx
  loc_004BBFD3: lea edx, var_38
  loc_004BBFD6: mov [ecx+00000008h], eax
  loc_004BBFD9: mov eax, var_8C
  loc_004BBFDF: mov [ecx+0000000Ch], eax
  loc_004BBFE2: lea ecx, var_78
  loc_004BBFE5: push ecx
  loc_004BBFE6: lea eax, var_48
  loc_004BBFE9: push edx
  loc_004BBFEA: push eax
  loc_004BBFEB: call [004011B4h] ; __vbaVarCat
  loc_004BBFF1: lea ecx, var_88
  loc_004BBFF7: push eax
  loc_004BBFF8: lea edx, var_58
  loc_004BBFFB: push ecx
  loc_004BBFFC: push edx
  loc_004BBFFD: call [004011B4h] ; __vbaVarCat
  loc_004BC003: push eax
  loc_004BC004: lea eax, var_1C
  loc_004BC007: push eax
  loc_004BC008: call [004011B0h] ; __vbaStrVarVal
  loc_004BC00E: mov ecx, [0061A13Ch]
  loc_004BC014: push eax
  loc_004BC015: push ecx
  loc_004BC016: call [ebx+000000BCh]
  loc_004BC01C: test eax, eax
  loc_004BC01E: fnclex
  loc_004BC020: jge 004BC03Ah
  loc_004BC022: mov edx, [0061A13Ch]
  loc_004BC028: push 000000BCh
  loc_004BC02D: push 0041E928h
  loc_004BC032: push edx
  loc_004BC033: push eax
  loc_004BC034: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC03A: mov ecx, var_20
  loc_004BC03D: lea eax, [esi+00000034h]
  loc_004BC040: push ecx
  loc_004BC041: push eax
  loc_004BC042: mov var_E0, eax
  loc_004BC048: call [004010B8h] ; __vbaObjSetAddref
  loc_004BC04E: lea ecx, var_1C
  loc_004BC051: call [004012ACh] ; __vbaFreeStr
  loc_004BC057: lea ecx, var_20
  loc_004BC05A: call [004012B0h] ; __vbaFreeObj
  loc_004BC060: lea edx, var_58
  loc_004BC063: lea eax, var_48
  loc_004BC066: push edx
  loc_004BC067: lea ecx, var_38
  loc_004BC06A: push eax
  loc_004BC06B: push ecx
  loc_004BC06C: push 00000003h
  loc_004BC06E: call [00401038h] ; __vbaFreeVarList
  loc_004BC074: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004BC07A: add esp, 00000010h
  loc_004BC07D: mov edx, var_E0
  loc_004BC083: mov eax, [edx]
  loc_004BC085: lea edx, var_BC
  loc_004BC08B: push edx
  loc_004BC08C: push eax
  loc_004BC08D: mov ecx, [eax]
  loc_004BC08F: call [ecx+00000034h]
  loc_004BC092: test eax, eax
  loc_004BC094: fnclex
  loc_004BC096: jge 004BC0AFh
  loc_004BC098: mov ecx, var_E0
  loc_004BC09E: push 00000034h
  loc_004BC0A0: push 0041E938h
  loc_004BC0A5: mov edx, [ecx]
  loc_004BC0A7: push edx
  loc_004BC0A8: push eax
  loc_004BC0A9: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC0AF: cmp var_BC, 0000h
  loc_004BC0B7: jnz 004BC5B1h
  loc_004BC0BD: mov eax, var_E0
  loc_004BC0C3: lea edx, var_20
  loc_004BC0C6: push edx
  loc_004BC0C7: mov eax, [eax]
  loc_004BC0C9: push eax
  loc_004BC0CA: mov ecx, [eax]
  loc_004BC0CC: call [ecx+000000B4h]
  loc_004BC0D2: test eax, eax
  loc_004BC0D4: fnclex
  loc_004BC0D6: jge 004BC0F2h
  loc_004BC0D8: mov ecx, var_E0
  loc_004BC0DE: push 000000B4h
  loc_004BC0E3: push 0041E938h
  loc_004BC0E8: mov edx, [ecx]
  loc_004BC0EA: push edx
  loc_004BC0EB: push eax
  loc_004BC0EC: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC0F2: lea edx, var_24
  loc_004BC0F5: mov eax, 00000008h
  loc_004BC0FA: push edx
  loc_004BC0FB: mov ecx, var_20
  loc_004BC0FE: sub esp, 00000010h
  loc_004BC101: mov var_68, eax
  loc_004BC104: mov edx, esp
  loc_004BC106: mov var_60, 0041EB18h ; "AgentName"
  loc_004BC10D: mov var_C4, ecx
  loc_004BC113: mov ecx, [ecx]
  loc_004BC115: mov [edx], eax
  loc_004BC117: mov eax, var_64
  loc_004BC11A: mov [edx+00000004h], eax
  loc_004BC11D: mov eax, var_60
  loc_004BC120: mov [edx+00000008h], eax
  loc_004BC123: mov eax, var_5C
  loc_004BC126: mov [edx+0000000Ch], eax
  loc_004BC129: mov edx, var_20
  loc_004BC12C: push edx
  loc_004BC12D: call [ecx+00000030h]
  loc_004BC130: test eax, eax
  loc_004BC132: fnclex
  loc_004BC134: jge 004BC14Bh
  loc_004BC136: mov ecx, var_C4
  loc_004BC13C: push 00000030h
  loc_004BC13E: push 0041EA14h ; "S"
  loc_004BC143: push ecx
  loc_004BC144: push eax
  loc_004BC145: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC14B: mov eax, var_24
  loc_004BC14E: lea ecx, var_38
  loc_004BC151: push ecx
  loc_004BC152: push eax
  loc_004BC153: mov edx, [eax]
  loc_004BC155: mov var_CC, eax
  loc_004BC15B: call [edx+00000044h]
  loc_004BC15E: test eax, eax
  loc_004BC160: fnclex
  loc_004BC162: jge 004BC179h
  loc_004BC164: mov edx, var_CC
  loc_004BC16A: push 00000044h
  loc_004BC16C: push 0041EA48h
  loc_004BC171: push edx
  loc_004BC172: push eax
  loc_004BC173: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC179: lea eax, var_38
  loc_004BC17C: lea ecx, var_78
  loc_004BC17F: push eax
  loc_004BC180: push ecx
  loc_004BC181: mov var_70, 00426C1Ch ; "NIL"
  loc_004BC188: mov var_78, 00008008h
  loc_004BC18F: call [00401110h] ; __vbaVarTstEq
  loc_004BC195: mov var_D4, eax
  loc_004BC19B: lea edx, var_24
  loc_004BC19E: lea eax, var_20
  loc_004BC1A1: push edx
  loc_004BC1A2: push eax
  loc_004BC1A3: push 00000002h
  loc_004BC1A5: call [00401040h] ; __vbaFreeObjList
  loc_004BC1AB: add esp, 0000000Ch
  loc_004BC1AE: lea ecx, var_38
  loc_004BC1B1: call [00401020h] ; __vbaFreeVar
  loc_004BC1B7: cmp var_D4, 0000h
  loc_004BC1BF: jz 004BC577h
  loc_004BC1C5: mov ecx, var_18
  loc_004BC1C8: push ecx
  loc_004BC1C9: call [004011D8h] ; __vbaR8Str
  loc_004BC1CF: fadd st0, real8 ptr [004015F8h]
  loc_004BC1D5: fnstsw ax
  loc_004BC1D7: test al, 0Dh
  loc_004BC1D9: jnz 004BC66Eh
  loc_004BC1DF: call [0040125Ch] ; __vbaFpI4
  loc_004BC1E5: sub esp, 00000010h
  loc_004BC1E8: mov ecx, 00000003h
  loc_004BC1ED: mov edx, esp
  loc_004BC1EF: mov var_68, ecx
  loc_004BC1F2: mov var_60, eax
  loc_004BC1F5: push 0000000Ah
  loc_004BC1F7: mov [edx], ecx
  loc_004BC1F9: mov ecx, var_64
  loc_004BC1FC: push esi
  loc_004BC1FD: mov [edx+00000004h], ecx
  loc_004BC200: mov ecx, [esi]
  loc_004BC202: mov [edx+00000008h], eax
  loc_004BC205: mov eax, var_5C
  loc_004BC208: mov [edx+0000000Ch], eax
  loc_004BC20B: call [ecx+00000300h]
  loc_004BC211: lea edx, var_20
  loc_004BC214: push eax
  loc_004BC215: push edx
  loc_004BC216: call edi
  loc_004BC218: push eax
  loc_004BC219: call ebx
  loc_004BC21B: lea ecx, var_20
  loc_004BC21E: call [004012B0h] ; __vbaFreeObj
  loc_004BC224: sub esp, 00000010h
  loc_004BC227: mov ecx, 00000003h
  loc_004BC22C: mov edx, esp
  loc_004BC22E: mov var_68, ecx
  loc_004BC231: xor eax, eax
  loc_004BC233: push 0000000Bh
  loc_004BC235: mov [edx], ecx
  loc_004BC237: mov ecx, var_64
  loc_004BC23A: mov var_60, eax
  loc_004BC23D: push esi
  loc_004BC23E: mov [edx+00000004h], ecx
  loc_004BC241: mov ecx, [esi]
  loc_004BC243: mov [edx+00000008h], eax
  loc_004BC246: mov eax, var_5C
  loc_004BC249: mov [edx+0000000Ch], eax
  loc_004BC24C: call [ecx+00000300h]
  loc_004BC252: lea edx, var_20
  loc_004BC255: push eax
  loc_004BC256: push edx
  loc_004BC257: call edi
  loc_004BC259: push eax
  loc_004BC25A: call ebx
  loc_004BC25C: lea ecx, var_20
  loc_004BC25F: call [004012B0h] ; __vbaFreeObj
  loc_004BC265: sub esp, 00000010h
  loc_004BC268: mov ecx, 00000002h
  loc_004BC26D: mov edx, esp
  loc_004BC26F: mov var_68, ecx
  loc_004BC272: mov eax, 00000001h
  loc_004BC277: push 00000028h
  loc_004BC279: mov [edx], ecx
  loc_004BC27B: mov ecx, var_64
  loc_004BC27E: mov var_60, eax
  loc_004BC281: push esi
  loc_004BC282: mov [edx+00000004h], ecx
  loc_004BC285: mov ecx, [esi]
  loc_004BC287: mov [edx+00000008h], eax
  loc_004BC28A: mov eax, var_5C
  loc_004BC28D: mov [edx+0000000Ch], eax
  loc_004BC290: call [ecx+00000300h]
  loc_004BC296: lea edx, var_20
  loc_004BC299: push eax
  loc_004BC29A: push edx
  loc_004BC29B: call edi
  loc_004BC29D: push eax
  loc_004BC29E: call ebx
  loc_004BC2A0: lea ecx, var_20
  loc_004BC2A3: call [004012B0h] ; __vbaFreeObj
  loc_004BC2A9: mov eax, var_18
  loc_004BC2AC: push eax
  loc_004BC2AD: call [004011D8h] ; __vbaR8Str
  loc_004BC2B3: fadd st0, real8 ptr [004015F8h]
  loc_004BC2B9: sub esp, 00000008h
  loc_004BC2BC: fnstsw ax
  loc_004BC2BE: test al, 0Dh
  loc_004BC2C0: jnz 004BC66Eh
  loc_004BC2C6: fstp real8 ptr [esp]
  loc_004BC2C9: call [00401144h] ; __vbaStrR8
  loc_004BC2CF: sub esp, 00000010h
  loc_004BC2D2: mov ecx, 00000008h
  loc_004BC2D7: mov edx, esp
  loc_004BC2D9: mov var_38, ecx
  loc_004BC2DC: mov var_30, eax
  loc_004BC2DF: push 00000000h
  loc_004BC2E1: mov [edx], ecx
  loc_004BC2E3: mov ecx, var_34
  loc_004BC2E6: push esi
  loc_004BC2E7: mov [edx+00000004h], ecx
  loc_004BC2EA: mov ecx, [esi]
  loc_004BC2EC: mov [edx+00000008h], eax
  loc_004BC2EF: mov eax, var_2C
  loc_004BC2F2: mov [edx+0000000Ch], eax
  loc_004BC2F5: call [ecx+00000300h]
  loc_004BC2FB: lea edx, var_20
  loc_004BC2FE: push eax
  loc_004BC2FF: push edx
  loc_004BC300: call edi
  loc_004BC302: push eax
  loc_004BC303: call ebx
  loc_004BC305: lea ecx, var_20
  loc_004BC308: call [004012B0h] ; __vbaFreeObj
  loc_004BC30E: lea ecx, var_38
  loc_004BC311: call [00401020h] ; __vbaFreeVar
  loc_004BC317: sub esp, 00000010h
  loc_004BC31A: mov ecx, 00000003h
  loc_004BC31F: mov edx, esp
  loc_004BC321: mov var_68, ecx
  loc_004BC324: mov eax, 00000001h
  loc_004BC329: push 0000000Bh
  loc_004BC32B: mov [edx], ecx
  loc_004BC32D: mov ecx, var_64
  loc_004BC330: mov var_60, eax
  loc_004BC333: push esi
  loc_004BC334: mov [edx+00000004h], ecx
  loc_004BC337: mov ecx, [esi]
  loc_004BC339: mov [edx+00000008h], eax
  loc_004BC33C: mov eax, var_5C
  loc_004BC33F: mov [edx+0000000Ch], eax
  loc_004BC342: call [ecx+00000300h]
  loc_004BC348: lea edx, var_20
  loc_004BC34B: push eax
  loc_004BC34C: push edx
  loc_004BC34D: call edi
  loc_004BC34F: push eax
  loc_004BC350: call ebx
  loc_004BC352: lea ecx, var_20
  loc_004BC355: call [004012B0h] ; __vbaFreeObj
  loc_004BC35B: sub esp, 00000010h
  loc_004BC35E: mov ecx, 00000002h
  loc_004BC363: mov edx, esp
  loc_004BC365: mov var_68, ecx
  loc_004BC368: mov eax, 00000001h
  loc_004BC36D: push 00000028h
  loc_004BC36F: mov [edx], ecx
  loc_004BC371: mov ecx, var_64
  loc_004BC374: mov var_60, eax
  loc_004BC377: push esi
  loc_004BC378: mov [edx+00000004h], ecx
  loc_004BC37B: mov ecx, [esi]
  loc_004BC37D: mov [edx+00000008h], eax
  loc_004BC380: mov eax, var_5C
  loc_004BC383: mov [edx+0000000Ch], eax
  loc_004BC386: call [ecx+00000300h]
  loc_004BC38C: lea edx, var_20
  loc_004BC38F: push eax
  loc_004BC390: push edx
  loc_004BC391: call edi
  loc_004BC393: push eax
  loc_004BC394: call ebx
  loc_004BC396: lea ecx, var_20
  loc_004BC399: call [004012B0h] ; __vbaFreeObj
  loc_004BC39F: mov eax, var_E0
  loc_004BC3A5: mov eax, [eax]
  loc_004BC3A7: mov ecx, [eax]
  loc_004BC3A9: lea edx, var_20
  loc_004BC3AC: push edx
  loc_004BC3AD: push eax
  loc_004BC3AE: call [ecx+000000B4h]
  loc_004BC3B4: test eax, eax
  loc_004BC3B6: fnclex
  loc_004BC3B8: jge 004BC3D4h
  loc_004BC3BA: mov ecx, var_E0
  loc_004BC3C0: push 000000B4h
  loc_004BC3C5: push 0041E938h
  loc_004BC3CA: mov edx, [ecx]
  loc_004BC3CC: push edx
  loc_004BC3CD: push eax
  loc_004BC3CE: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC3D4: lea edx, var_24
  loc_004BC3D7: mov eax, 00000008h
  loc_004BC3DC: push edx
  loc_004BC3DD: mov ecx, var_20
  loc_004BC3E0: sub esp, 00000010h
  loc_004BC3E3: mov var_68, eax
  loc_004BC3E6: mov edx, esp
  loc_004BC3E8: mov var_60, 0041EDD8h ; "SrNo"
  loc_004BC3EF: mov var_C4, ecx
  loc_004BC3F5: mov ecx, [ecx]
  loc_004BC3F7: mov [edx], eax
  loc_004BC3F9: mov eax, var_64
  loc_004BC3FC: mov [edx+00000004h], eax
  loc_004BC3FF: mov eax, var_60
  loc_004BC402: mov [edx+00000008h], eax
  loc_004BC405: mov eax, var_5C
  loc_004BC408: mov [edx+0000000Ch], eax
  loc_004BC40B: mov edx, var_20
  loc_004BC40E: push edx
  loc_004BC40F: call [ecx+00000030h]
  loc_004BC412: test eax, eax
  loc_004BC414: fnclex
  loc_004BC416: jge 004BC42Dh
  loc_004BC418: mov ecx, var_C4
  loc_004BC41E: push 00000030h
  loc_004BC420: push 0041EA14h ; "S"
  loc_004BC425: push ecx
  loc_004BC426: push eax
  loc_004BC427: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC42D: mov eax, var_24
  loc_004BC430: lea ecx, var_38
  loc_004BC433: push ecx
  loc_004BC434: push eax
  loc_004BC435: mov edx, [eax]
  loc_004BC437: mov var_CC, eax
  loc_004BC43D: call [edx+00000044h]
  loc_004BC440: test eax, eax
  loc_004BC442: fnclex
  loc_004BC444: jge 004BC45Bh
  loc_004BC446: mov edx, var_CC
  loc_004BC44C: push 00000044h
  loc_004BC44E: push 0041EA48h
  loc_004BC453: push edx
  loc_004BC454: push eax
  loc_004BC455: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC45B: lea eax, var_38
  loc_004BC45E: push eax
  loc_004BC45F: call [00401028h] ; __vbaStrVarMove
  loc_004BC465: sub esp, 00000010h
  loc_004BC468: mov ecx, 00000008h
  loc_004BC46D: mov edx, esp
  loc_004BC46F: mov var_48, ecx
  loc_004BC472: mov var_40, eax
  loc_004BC475: push 00000000h
  loc_004BC477: mov [edx], ecx
  loc_004BC479: mov ecx, var_44
  loc_004BC47C: push esi
  loc_004BC47D: mov [edx+00000004h], ecx
  loc_004BC480: mov ecx, [esi]
  loc_004BC482: mov [edx+00000008h], eax
  loc_004BC485: mov eax, var_3C
  loc_004BC488: mov [edx+0000000Ch], eax
  loc_004BC48B: call [ecx+00000300h]
  loc_004BC491: lea edx, var_28
  loc_004BC494: push eax
  loc_004BC495: push edx
  loc_004BC496: call edi
  loc_004BC498: push eax
  loc_004BC499: call ebx
  loc_004BC49B: lea eax, var_28
  loc_004BC49E: lea ecx, var_24
  loc_004BC4A1: push eax
  loc_004BC4A2: lea edx, var_20
  loc_004BC4A5: push ecx
  loc_004BC4A6: push edx
  loc_004BC4A7: push 00000003h
  loc_004BC4A9: call [00401040h] ; __vbaFreeObjList
  loc_004BC4AF: lea eax, var_48
  loc_004BC4B2: lea ecx, var_38
  loc_004BC4B5: push eax
  loc_004BC4B6: push ecx
  loc_004BC4B7: push 00000002h
  loc_004BC4B9: call [00401038h] ; __vbaFreeVarList
  loc_004BC4BF: mov edx, var_18
  loc_004BC4C2: add esp, 0000001Ch
  loc_004BC4C5: push edx
  loc_004BC4C6: call [004011D8h] ; __vbaR8Str
  loc_004BC4CC: fadd st0, real8 ptr [004015F8h]
  loc_004BC4D2: sub esp, 00000008h
  loc_004BC4D5: fnstsw ax
  loc_004BC4D7: test al, 0Dh
  loc_004BC4D9: jnz 004BC66Eh
  loc_004BC4DF: fstp real8 ptr [esp]
  loc_004BC4E2: call [00401144h] ; __vbaStrR8
  loc_004BC4E8: mov edx, eax
  loc_004BC4EA: lea ecx, var_18
  loc_004BC4ED: call [00401270h] ; __vbaStrMove
  loc_004BC4F3: mov eax, [esi]
  loc_004BC4F5: push 00000000h
  loc_004BC4F7: push 00000004h
  loc_004BC4F9: push esi
  loc_004BC4FA: call [eax+00000300h]
  loc_004BC500: lea ecx, var_20
  loc_004BC503: push eax
  loc_004BC504: push ecx
  loc_004BC505: call edi
  loc_004BC507: lea edx, var_38
  loc_004BC50A: push eax
  loc_004BC50B: push edx
  loc_004BC50C: call [00401140h] ; __vbaLateIdCallLd
  loc_004BC512: add esp, 00000010h
  loc_004BC515: push eax
  loc_004BC516: call [0040121Ch] ; __vbaI4Var
  loc_004BC51C: add eax, 00000001h
  loc_004BC51F: mov ecx, 00000003h
  loc_004BC524: jo 004BC673h
  loc_004BC52A: sub esp, 00000010h
  loc_004BC52D: mov var_68, ecx
  loc_004BC530: mov edx, esp
  loc_004BC532: mov var_60, eax
  loc_004BC535: push 00000004h
  loc_004BC537: mov [edx], ecx
  loc_004BC539: mov ecx, var_64
  loc_004BC53C: mov [edx+00000004h], ecx
  loc_004BC53F: mov [edx+00000008h], eax
  loc_004BC542: mov eax, var_5C
  loc_004BC545: mov [edx+0000000Ch], eax
  loc_004BC548: mov ecx, [esi]
  loc_004BC54A: push esi
  loc_004BC54B: call [ecx+00000300h]
  loc_004BC551: lea edx, var_24
  loc_004BC554: push eax
  loc_004BC555: push edx
  loc_004BC556: call edi
  loc_004BC558: push eax
  loc_004BC559: call ebx
  loc_004BC55B: lea eax, var_24
  loc_004BC55E: lea ecx, var_20
  loc_004BC561: push eax
  loc_004BC562: push ecx
  loc_004BC563: push 00000002h
  loc_004BC565: call [00401040h] ; __vbaFreeObjList
  loc_004BC56B: add esp, 0000000Ch
  loc_004BC56E: lea ecx, var_38
  loc_004BC571: call [00401020h] ; __vbaFreeVar
  loc_004BC577: mov edx, var_E0
  loc_004BC57D: mov eax, [edx]
  loc_004BC57F: push eax
  loc_004BC580: mov ecx, [eax]
  loc_004BC582: call [ecx+000000ECh]
  loc_004BC588: test eax, eax
  loc_004BC58A: fnclex
  loc_004BC58C: jge 004BC07Dh
  loc_004BC592: mov edx, var_E0
  loc_004BC598: push 000000ECh
  loc_004BC59D: push 0041E938h
  loc_004BC5A2: mov ecx, [edx]
  loc_004BC5A4: push ecx
  loc_004BC5A5: push eax
  loc_004BC5A6: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC5AC: jmp 004BC07Dh
  loc_004BC5B1: mov esi, var_E0
  loc_004BC5B7: mov eax, [esi]
  loc_004BC5B9: push eax
  loc_004BC5BA: mov edx, [eax]
  loc_004BC5BC: call [edx+000000C4h]
  loc_004BC5C2: test eax, eax
  loc_004BC5C4: fnclex
  loc_004BC5C6: jge 004BC5DCh
  loc_004BC5C8: mov ecx, [esi]
  loc_004BC5CA: push 000000C4h
  loc_004BC5CF: push 0041E938h
  loc_004BC5D4: push ecx
  loc_004BC5D5: push eax
  loc_004BC5D6: call [00401074h] ; __vbaHresultCheckObj
  loc_004BC5DC: push 0041E938h
  loc_004BC5E1: push 00000000h
  loc_004BC5E3: call [00401274h] ; __vbaCastObj
  loc_004BC5E9: lea edx, var_20
  loc_004BC5EC: push eax
  loc_004BC5ED: push edx
  loc_004BC5EE: call edi
  loc_004BC5F0: push eax
  loc_004BC5F1: push esi
  loc_004BC5F2: call [004010B8h] ; __vbaObjSetAddref
  loc_004BC5F8: lea ecx, var_20
  loc_004BC5FB: call [004012B0h] ; __vbaFreeObj
  loc_004BC601: mov var_4, 00000000h
  loc_004BC608: fwait
  loc_004BC609: push 004BC64Fh
  loc_004BC60E: jmp 004BC645h
  loc_004BC610: lea ecx, var_1C
  loc_004BC613: call [004012ACh] ; __vbaFreeStr
  loc_004BC619: lea eax, var_28
  loc_004BC61C: lea ecx, var_24
  loc_004BC61F: push eax
  loc_004BC620: lea edx, var_20
  loc_004BC623: push ecx
  loc_004BC624: push edx
  loc_004BC625: push 00000003h
  loc_004BC627: call [00401040h] ; __vbaFreeObjList
  loc_004BC62D: lea eax, var_58
  loc_004BC630: lea ecx, var_48
  loc_004BC633: push eax
  loc_004BC634: lea edx, var_38
  loc_004BC637: push ecx
  loc_004BC638: push edx
  loc_004BC639: push 00000003h
  loc_004BC63B: call [00401038h] ; __vbaFreeVarList
  loc_004BC641: add esp, 00000020h
  loc_004BC644: ret
  loc_004BC645: lea ecx, var_18
  loc_004BC648: call [004012ACh] ; __vbaFreeStr
  loc_004BC64E: ret
  loc_004BC64F: mov eax, Me
  loc_004BC652: push eax
  loc_004BC653: mov ecx, [eax]
  loc_004BC655: call [ecx+00000008h]
  loc_004BC658: mov eax, var_4
  loc_004BC65B: mov ecx, var_14
  loc_004BC65E: pop edi
  loc_004BC65F: pop esi
  loc_004BC660: mov fs:[00000000h], ecx
  loc_004BC667: pop ebx
  loc_004BC668: mov esp, ebp
  loc_004BC66A: pop ebp
  loc_004BC66B: retn 0004h
End Sub
