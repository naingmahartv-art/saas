VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC0000F8754DA1}#2.0#0"; "C:\WINDOWS\SysWow64\MSCOMCT2.OCX"
Begin VB.Form frmSearch1
  Caption = "Search"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 6705
  ClientHeight = 6240
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
  Begin MSFlexGridLib.MSFlexGrid MSFle
    Left = 60
    Top = 240
    Width = 3555
    Height = 5895
    TabIndex = 8
    OleObjectBlob = "frmSearch1.frx":0000
  End
  Begin VB.Frame Frame1
    Caption = " Between Two Date "
    Left = 3690
    Top = 180
    Width = 2895
    Height = 3855
    TabIndex = 2
    Begin MSComCtl2.DTPicker txtDate2
      Left = 960
      Top = 1290
      Width = 1740
      Height = 315
      TabIndex = 1
      OleObjectBlob = "frmSearch1.frx":00E4
    End
    Begin MSComCtl2.DTPicker txtDate1
      Left = 960
      Top = 810
      Width = 1740
      Height = 315
      TabIndex = 0
      OleObjectBlob = "frmSearch1.frx":017C
    End
    Begin VB.CommandButton cmdCancel
      Caption = "&Cancel"
      Left = 1770
      Top = 3000
      Width = 945
      Height = 375
      TabIndex = 7
    End
    Begin VB.CommandButton cmdSelect
      Caption = "&Select"
      Left = 780
      Top = 3000
      Width = 975
      Height = 375
      TabIndex = 6
    End
    Begin VB.CommandButton cmdShow
      Caption = "S&how SrNo"
      Left = 930
      Top = 1890
      Width = 1845
      Height = 405
      TabIndex = 5
    End
    Begin VB.Label Label2
      Caption = "End Date."
      Left = 150
      Top = 1350
      Width = 795
      Height = 345
      TabIndex = 4
    End
    Begin VB.Label Label1
      Caption = "Start Date."
      Left = 120
      Top = 840
      Width = 795
      Height = 345
      TabIndex = 3
    End
  End
End

Attribute VB_Name = "frmSearch1"


Private Sub cmdCancel_Click() '615960
  loc_00615960: push ebp
  loc_00615961: mov ebp, esp
  loc_00615963: sub esp, 0000000Ch
  loc_00615966: push 00403B36h ; __vbaExceptHandler
  loc_0061596B: mov eax, fs:[00000000h]
  loc_00615971: push eax
  loc_00615972: mov fs:[00000000h], esp
  loc_00615979: sub esp, 00000018h
  loc_0061597C: push ebx
  loc_0061597D: push esi
  loc_0061597E: push edi
  loc_0061597F: mov var_C, esp
  loc_00615982: mov var_8, 00403A40h
  loc_00615989: mov edi, Me
  loc_0061598C: mov eax, edi
  loc_0061598E: and eax, 00000001h
  loc_00615991: mov var_4, eax
  loc_00615994: and edi, FFFFFFFEh
  loc_00615997: push edi
  loc_00615998: mov Me, edi
  loc_0061599B: mov ecx, [edi]
  loc_0061599D: call [ecx+00000004h]
  loc_006159A0: xor ebx, ebx
  loc_006159A2: mov edx, 0041E5D4h
  loc_006159A7: mov ecx, 0061A058h
  loc_006159AC: mov var_18, ebx
  loc_006159AF: call [004011ECh] ; __vbaStrCopy
  loc_006159B5: cmp [0061B394h], ebx
  loc_006159BB: jnz 006159CDh
  loc_006159BD: push 0061B394h
  loc_006159C2: push 0041E4A0h
  loc_006159C7: call [004011DCh] ; __vbaNew2
  loc_006159CD: mov esi, [0061B394h]
  loc_006159D3: lea eax, var_18
  loc_006159D6: push edi
  loc_006159D7: push eax
  loc_006159D8: mov edx, [esi]
  loc_006159DA: mov var_2C, edx
  loc_006159DD: call [004010B8h] ; __vbaObjSetAddref
  loc_006159E3: mov ecx, var_2C
  loc_006159E6: push eax
  loc_006159E7: push esi
  loc_006159E8: call [ecx+00000010h]
  loc_006159EB: cmp eax, ebx
  loc_006159ED: fnclex
  loc_006159EF: jge 00615A00h
  loc_006159F1: push 00000010h
  loc_006159F3: push 0041E490h
  loc_006159F8: push esi
  loc_006159F9: push eax
  loc_006159FA: call [00401074h] ; __vbaHresultCheckObj
  loc_00615A00: lea ecx, var_18
  loc_00615A03: call [004012B0h] ; __vbaFreeObj
  loc_00615A09: mov var_4, ebx
  loc_00615A0C: push 00615A1Eh
  loc_00615A11: jmp 00615A1Dh
  loc_00615A13: lea ecx, var_18
  loc_00615A16: call [004012B0h] ; __vbaFreeObj
  loc_00615A1C: ret
  loc_00615A1D: ret
  loc_00615A1E: mov eax, Me
  loc_00615A21: push eax
  loc_00615A22: mov edx, [eax]
  loc_00615A24: call [edx+00000008h]
  loc_00615A27: mov eax, var_4
  loc_00615A2A: mov ecx, var_14
  loc_00615A2D: pop edi
  loc_00615A2E: pop esi
  loc_00615A2F: mov fs:[00000000h], ecx
  loc_00615A36: pop ebx
  loc_00615A37: mov esp, ebp
  loc_00615A39: pop ebp
  loc_00615A3A: retn 0004h
End Sub

Private Sub cmdSelect_Click() '616D40
  loc_00616D40: push ebp
  loc_00616D41: mov ebp, esp
  loc_00616D43: sub esp, 0000000Ch
  loc_00616D46: push 00403B36h ; __vbaExceptHandler
  loc_00616D4B: mov eax, fs:[00000000h]
  loc_00616D51: push eax
  loc_00616D52: mov fs:[00000000h], esp
  loc_00616D59: sub esp, 000000CCh
  loc_00616D5F: push ebx
  loc_00616D60: push esi
  loc_00616D61: push edi
  loc_00616D62: mov var_C, esp
  loc_00616D65: mov var_8, 00403A80h
  loc_00616D6C: mov esi, Me
  loc_00616D6F: mov eax, esi
  loc_00616D71: and eax, 00000001h
  loc_00616D74: mov var_4, eax
  loc_00616D77: and esi, FFFFFFFEh
  loc_00616D7A: push esi
  loc_00616D7B: mov Me, esi
  loc_00616D7E: mov ecx, [esi]
  loc_00616D80: call [ecx+00000004h]
  loc_00616D83: mov edx, [esi]
  loc_00616D85: xor eax, eax
  loc_00616D87: push eax
  loc_00616D88: push 0000000Ah
  loc_00616D8A: push esi
  loc_00616D8B: mov var_18, eax
  loc_00616D8E: mov var_1C, eax
  loc_00616D91: mov var_20, eax
  loc_00616D94: mov var_30, eax
  loc_00616D97: mov var_40, eax
  loc_00616D9A: mov var_50, eax
  loc_00616D9D: mov var_60, eax
  loc_00616DA0: mov var_70, eax
  loc_00616DA3: mov var_80, eax
  loc_00616DA6: mov var_D0, eax
  loc_00616DAC: call [edx+00000314h]
  loc_00616DB2: mov edi, [004010A0h] ; __vbaObjSet
  loc_00616DB8: push eax
  loc_00616DB9: lea eax, var_18
  loc_00616DBC: push eax
  loc_00616DBD: call edi
  loc_00616DBF: mov ebx, [00401140h] ; __vbaLateIdCallLd
  loc_00616DC5: lea ecx, var_30
  loc_00616DC8: push eax
  loc_00616DC9: push ecx
  loc_00616DCA: call ebx
  loc_00616DCC: add esp, 00000010h
  loc_00616DCF: push eax
  loc_00616DD0: call [0040121Ch] ; __vbaI4Var
  loc_00616DD6: mov edx, [esi]
  loc_00616DD8: push 00000000h
  loc_00616DDA: push 0000000Bh
  loc_00616DDC: push esi
  loc_00616DDD: mov var_88, eax
  loc_00616DE3: call [edx+00000314h]
  loc_00616DE9: push eax
  loc_00616DEA: lea eax, var_1C
  loc_00616DED: push eax
  loc_00616DEE: call edi
  loc_00616DF0: lea ecx, var_40
  loc_00616DF3: push eax
  loc_00616DF4: push ecx
  loc_00616DF5: call ebx
  loc_00616DF7: add esp, 00000010h
  loc_00616DFA: push eax
  loc_00616DFB: call [0040121Ch] ; __vbaI4Var
  loc_00616E01: sub esp, 00000010h
  loc_00616E04: mov ecx, 00000003h
  loc_00616E09: mov edx, esp
  loc_00616E0B: sub esp, 00000010h
  loc_00616E0E: mov [edx], ecx
  loc_00616E10: mov ecx, var_8C
  loc_00616E16: mov [edx+00000004h], ecx
  loc_00616E19: mov ecx, var_88
  loc_00616E1F: mov [edx+00000008h], ecx
  loc_00616E22: mov ecx, var_84
  loc_00616E28: mov [edx+0000000Ch], ecx
  loc_00616E2B: mov edx, esp
  loc_00616E2D: mov ecx, 00000003h
  loc_00616E32: push 00000002h
  loc_00616E34: mov [edx], ecx
  loc_00616E36: mov ecx, var_AC
  loc_00616E3C: push 00000041h
  loc_00616E3E: mov [edx+00000004h], ecx
  loc_00616E41: mov [edx+00000008h], eax
  loc_00616E44: mov eax, var_A4
  loc_00616E4A: mov [edx+0000000Ch], eax
  loc_00616E4D: mov ecx, [esi]
  loc_00616E4F: push esi
  loc_00616E50: call [ecx+00000314h]
  loc_00616E56: lea edx, var_20
  loc_00616E59: push eax
  loc_00616E5A: push edx
  loc_00616E5B: call edi
  loc_00616E5D: push eax
  loc_00616E5E: lea eax, var_50
  loc_00616E61: push eax
  loc_00616E62: call ebx
  loc_00616E64: add esp, 00000030h
  loc_00616E67: push eax
  loc_00616E68: call [00401028h] ; __vbaStrVarMove
  loc_00616E6E: lea ecx, var_60
  loc_00616E71: lea edx, var_70
  loc_00616E74: push ecx
  loc_00616E75: push edx
  loc_00616E76: mov var_58, eax
  loc_00616E79: mov var_60, 00000008h
  loc_00616E80: call [004010D4h] ; rtcTrimVar
  loc_00616E86: lea eax, var_70
  loc_00616E89: lea ecx, var_D0
  loc_00616E8F: push eax
  loc_00616E90: push ecx
  loc_00616E91: mov var_C8, 0041E5D4h
  loc_00616E9B: mov var_D0, 00008008h
  loc_00616EA5: call [00401218h] ; __vbaVarTstNe
  loc_00616EAB: mov var_D4, ax
  loc_00616EB2: lea edx, var_20
  loc_00616EB5: lea eax, var_1C
  loc_00616EB8: push edx
  loc_00616EB9: lea ecx, var_18
  loc_00616EBC: push eax
  loc_00616EBD: push ecx
  loc_00616EBE: push 00000003h
  loc_00616EC0: call [00401040h] ; __vbaFreeObjList
  loc_00616EC6: lea edx, var_70
  loc_00616EC9: lea eax, var_60
  loc_00616ECC: push edx
  loc_00616ECD: lea ecx, var_50
  loc_00616ED0: push eax
  loc_00616ED1: lea edx, var_40
  loc_00616ED4: push ecx
  loc_00616ED5: lea eax, var_30
  loc_00616ED8: push edx
  loc_00616ED9: push eax
  loc_00616EDA: push 00000005h
  loc_00616EDC: call [00401038h] ; __vbaFreeVarList
  loc_00616EE2: add esp, 00000028h
  loc_00616EE5: cmp var_D4, 0000h
  loc_00616EED: jz 0061702Fh
  loc_00616EF3: mov ecx, [esi]
  loc_00616EF5: push 00000000h
  loc_00616EF7: push 0000000Ah
  loc_00616EF9: push esi
  loc_00616EFA: call [ecx+00000314h]
  loc_00616F00: lea edx, var_18
  loc_00616F03: push eax
  loc_00616F04: push edx
  loc_00616F05: call edi
  loc_00616F07: push eax
  loc_00616F08: lea eax, var_30
  loc_00616F0B: push eax
  loc_00616F0C: call ebx
  loc_00616F0E: add esp, 00000010h
  loc_00616F11: push eax
  loc_00616F12: call [0040121Ch] ; __vbaI4Var
  loc_00616F18: sub esp, 00000010h
  loc_00616F1B: mov ecx, 00000003h
  loc_00616F20: mov edx, esp
  loc_00616F22: mov var_B0, ecx
  loc_00616F28: sub esp, 00000010h
  loc_00616F2B: mov [edx], ecx
  loc_00616F2D: mov ecx, var_8C
  loc_00616F33: mov [edx+00000004h], ecx
  loc_00616F36: mov ecx, esp
  loc_00616F38: push 00000002h
  loc_00616F3A: push 00000041h
  loc_00616F3C: mov [edx+00000008h], eax
  loc_00616F3F: mov eax, var_84
  loc_00616F45: push esi
  loc_00616F46: mov [edx+0000000Ch], eax
  loc_00616F49: mov edx, var_B0
  loc_00616F4F: mov eax, var_AC
  loc_00616F55: mov [ecx], edx
  loc_00616F57: mov edx, var_A4
  loc_00616F5D: mov [ecx+00000004h], eax
  loc_00616F60: xor eax, eax
  loc_00616F62: mov [ecx+00000008h], eax
  loc_00616F65: mov eax, [esi]
  loc_00616F67: mov [ecx+0000000Ch], edx
  loc_00616F6A: call [eax+00000314h]
  loc_00616F70: lea ecx, var_1C
  loc_00616F73: push eax
  loc_00616F74: push ecx
  loc_00616F75: call edi
  loc_00616F77: lea edx, var_40
  loc_00616F7A: push eax
  loc_00616F7B: push edx
  loc_00616F7C: call ebx
  loc_00616F7E: mov edi, [00401028h] ; __vbaStrVarMove
  loc_00616F84: add esp, 00000030h
  loc_00616F87: push eax
  loc_00616F88: call edi
  loc_00616F8A: mov var_48, eax
  loc_00616F8D: lea eax, var_50
  loc_00616F90: lea ecx, var_60
  loc_00616F93: push eax
  loc_00616F94: push ecx
  loc_00616F95: mov var_50, 00000008h
  loc_00616F9C: call [004010D4h] ; rtcTrimVar
  loc_00616FA2: lea edx, var_60
  loc_00616FA5: push edx
  loc_00616FA6: call edi
  loc_00616FA8: mov edx, eax
  loc_00616FAA: mov ecx, 0061A058h
  loc_00616FAF: call [00401270h] ; __vbaStrMove
  loc_00616FB5: lea eax, var_1C
  loc_00616FB8: lea ecx, var_18
  loc_00616FBB: push eax
  loc_00616FBC: push ecx
  loc_00616FBD: push 00000002h
  loc_00616FBF: call [00401040h] ; __vbaFreeObjList
  loc_00616FC5: lea edx, var_60
  loc_00616FC8: lea eax, var_50
  loc_00616FCB: push edx
  loc_00616FCC: lea ecx, var_40
  loc_00616FCF: push eax
  loc_00616FD0: lea edx, var_30
  loc_00616FD3: push ecx
  loc_00616FD4: push edx
  loc_00616FD5: push 00000004h
  loc_00616FD7: call [00401038h] ; __vbaFreeVarList
  loc_00616FDD: mov eax, [0061B394h]
  loc_00616FE2: add esp, 00000020h
  loc_00616FE5: test eax, eax
  loc_00616FE7: jnz 00616FF9h
  loc_00616FE9: push 0061B394h
  loc_00616FEE: push 0041E4A0h
  loc_00616FF3: call [004011DCh] ; __vbaNew2
  loc_00616FF9: mov edi, [0061B394h]
  loc_00616FFF: lea eax, var_18
  loc_00617002: push esi
  loc_00617003: push eax
  loc_00617004: mov ebx, [edi]
  loc_00617006: call [004010B8h] ; __vbaObjSetAddref
  loc_0061700C: push eax
  loc_0061700D: push edi
  loc_0061700E: call [ebx+00000010h]
  loc_00617011: test eax, eax
  loc_00617013: fnclex
  loc_00617015: jge 00617026h
  loc_00617017: push 00000010h
  loc_00617019: push 0041E490h
  loc_0061701E: push edi
  loc_0061701F: push eax
  loc_00617020: call [00401074h] ; __vbaHresultCheckObj
  loc_00617026: lea ecx, var_18
  loc_00617029: call [004012B0h] ; __vbaFreeObj
  loc_0061702F: mov var_4, 00000000h
  loc_00617036: push 00617076h
  loc_0061703B: jmp 00617075h
  loc_0061703D: lea ecx, var_20
  loc_00617040: lea edx, var_1C
  loc_00617043: push ecx
  loc_00617044: lea eax, var_18
  loc_00617047: push edx
  loc_00617048: push eax
  loc_00617049: push 00000003h
  loc_0061704B: call [00401040h] ; __vbaFreeObjList
  loc_00617051: lea ecx, var_80
  loc_00617054: lea edx, var_70
  loc_00617057: push ecx
  loc_00617058: lea eax, var_60
  loc_0061705B: push edx
  loc_0061705C: lea ecx, var_50
  loc_0061705F: push eax
  loc_00617060: lea edx, var_40
  loc_00617063: push ecx
  loc_00617064: lea eax, var_30
  loc_00617067: push edx
  loc_00617068: push eax
  loc_00617069: push 00000006h
  loc_0061706B: call [00401038h] ; __vbaFreeVarList
  loc_00617071: add esp, 0000002Ch
  loc_00617074: ret
  loc_00617075: ret
  loc_00617076: mov eax, Me
  loc_00617079: push eax
  loc_0061707A: mov ecx, [eax]
  loc_0061707C: call [ecx+00000008h]
  loc_0061707F: mov eax, var_4
  loc_00617082: mov ecx, var_14
  loc_00617085: pop edi
  loc_00617086: pop esi
  loc_00617087: mov fs:[00000000h], ecx
  loc_0061708E: pop ebx
  loc_0061708F: mov esp, ebp
  loc_00617091: pop ebp
  loc_00617092: retn 0004h
End Sub

Private Sub cmdShow_Click() '6170A0
  loc_006170A0: push ebp
  loc_006170A1: mov ebp, esp
  loc_006170A3: sub esp, 0000000Ch
  loc_006170A6: push 00403B36h ; __vbaExceptHandler
  loc_006170AB: mov eax, fs:[00000000h]
  loc_006170B1: push eax
  loc_006170B2: mov fs:[00000000h], esp
  loc_006170B9: sub esp, 0000003Ch
  loc_006170BC: push ebx
  loc_006170BD: push esi
  loc_006170BE: push edi
  loc_006170BF: mov var_C, esp
  loc_006170C2: mov var_8, 00403A90h
  loc_006170C9: mov esi, Me
  loc_006170CC: mov eax, esi
  loc_006170CE: and eax, 00000001h
  loc_006170D1: mov var_4, eax
  loc_006170D4: and esi, FFFFFFFEh
  loc_006170D7: push esi
  loc_006170D8: mov Me, esi
  loc_006170DB: mov ecx, [esi]
  loc_006170DD: call [ecx+00000004h]
  loc_006170E0: lea edx, var_38
  loc_006170E3: xor edi, edi
  loc_006170E5: lea eax, var_28
  loc_006170E8: push edx
  loc_006170E9: mov var_38, edi
  loc_006170EC: push eax
  loc_006170ED: mov var_18, edi
  loc_006170F0: mov var_28, edi
  loc_006170F3: mov var_48, edi
  loc_006170F6: mov var_30, 0061A0A0h
  loc_006170FD: mov var_38, 00004008h
  loc_00617104: call [004010D4h] ; rtcTrimVar
  loc_0061710A: lea edx, var_28
  loc_0061710D: lea ecx, var_48
  loc_00617110: call [00401014h] ; __vbaVarMove
  loc_00617116: mov ebx, [00401110h] ; __vbaVarTstEq
  loc_0061711C: lea ecx, var_48
  loc_0061711F: lea edx, var_38
  loc_00617122: push ecx
  loc_00617123: push edx
  loc_00617124: mov var_30, 00433AF0h ; "Issue"
  loc_0061712B: mov var_38, 00008008h
  loc_00617132: call ebx
  loc_00617134: test ax, ax
  loc_00617137: jz 00617177h
  loc_00617139: mov eax, [esi]
  loc_0061713B: push edi
  loc_0061713C: push 00000044h
  loc_0061713E: push esi
  loc_0061713F: call [eax+00000314h]
  loc_00617145: lea ecx, var_18
  loc_00617148: push eax
  loc_00617149: push ecx
  loc_0061714A: call [004010A0h] ; __vbaObjSet
  loc_00617150: push eax
  loc_00617151: call [00401024h] ; __vbaLateIdCall
  loc_00617157: add esp, 0000000Ch
  loc_0061715A: lea ecx, var_18
  loc_0061715D: call [004012B0h] ; __vbaFreeObj
  loc_00617163: mov edx, [esi]
  loc_00617165: push esi
  loc_00617166: call [edx+000006FCh]
  loc_0061716C: mov eax, [esi]
  loc_0061716E: push esi
  loc_0061716F: call [eax+00000704h]
  loc_00617175: jmp 006171D0h
  loc_00617177: lea ecx, var_48
  loc_0061717A: lea edx, var_38
  loc_0061717D: push ecx
  loc_0061717E: push edx
  loc_0061717F: mov var_30, 00433760h ; "Receive"
  loc_00617186: mov var_38, 00008008h
  loc_0061718D: call ebx
  loc_0061718F: test ax, ax
  loc_00617192: jz 006171D0h
  loc_00617194: mov eax, [esi]
  loc_00617196: push edi
  loc_00617197: push 00000044h
  loc_00617199: push esi
  loc_0061719A: call [eax+00000314h]
  loc_006171A0: lea ecx, var_18
  loc_006171A3: push eax
  loc_006171A4: push ecx
  loc_006171A5: call [004010A0h] ; __vbaObjSet
  loc_006171AB: push eax
  loc_006171AC: call [00401024h] ; __vbaLateIdCall
  loc_006171B2: add esp, 0000000Ch
  loc_006171B5: lea ecx, var_18
  loc_006171B8: call [004012B0h] ; __vbaFreeObj
  loc_006171BE: mov edx, [esi]
  loc_006171C0: push esi
  loc_006171C1: call [edx+000006FCh]
  loc_006171C7: mov eax, [esi]
  loc_006171C9: push esi
  loc_006171CA: call [eax+00000700h]
  loc_006171D0: mov var_4, edi
  loc_006171D3: push 006171F7h
  loc_006171D8: jmp 006171EDh
  loc_006171DA: lea ecx, var_18
  loc_006171DD: call [004012B0h] ; __vbaFreeObj
  loc_006171E3: lea ecx, var_28
  loc_006171E6: call [00401020h] ; __vbaFreeVar
  loc_006171EC: ret
  loc_006171ED: lea ecx, var_48
  loc_006171F0: call [00401020h] ; __vbaFreeVar
  loc_006171F6: ret
  loc_006171F7: mov eax, Me
  loc_006171FA: push eax
  loc_006171FB: mov ecx, [eax]
  loc_006171FD: call [ecx+00000008h]
  loc_00617200: mov eax, var_4
  loc_00617203: mov ecx, var_14
  loc_00617206: pop edi
  loc_00617207: pop esi
  loc_00617208: mov fs:[00000000h], ecx
  loc_0061720F: pop ebx
  loc_00617210: mov esp, ebp
  loc_00617212: pop ebp
  loc_00617213: retn 0004h
End Sub

Private Sub MSFle_SelChange() '617470
  loc_00617470: push ebp
  loc_00617471: mov ebp, esp
  loc_00617473: sub esp, 0000000Ch
  loc_00617476: push 00403B36h ; __vbaExceptHandler
  loc_0061747B: mov eax, fs:[00000000h]
  loc_00617481: push eax
  loc_00617482: mov fs:[00000000h], esp
  loc_00617489: sub esp, 00000008h
  loc_0061748C: push ebx
  loc_0061748D: push esi
  loc_0061748E: push edi
  loc_0061748F: mov var_C, esp
  loc_00617492: mov var_8, 00403AC0h
  loc_00617499: mov eax, Me
  loc_0061749C: mov ecx, eax
  loc_0061749E: and ecx, 00000001h
  loc_006174A1: mov var_4, ecx
  loc_006174A4: and al, FEh
  loc_006174A6: push eax
  loc_006174A7: mov Me, eax
  loc_006174AA: mov edx, [eax]
  loc_006174AC: call [edx+00000004h]
  loc_006174AF: mov var_4, 00000000h
  loc_006174B6: mov eax, Me
  loc_006174B9: push eax
  loc_006174BA: mov ecx, [eax]
  loc_006174BC: call [ecx+00000008h]
  loc_006174BF: mov eax, var_4
  loc_006174C2: mov ecx, var_14
  loc_006174C5: pop edi
  loc_006174C6: pop esi
  loc_006174C7: mov fs:[00000000h], ecx
  loc_006174CE: pop ebx
  loc_006174CF: mov esp, ebp
  loc_006174D1: pop ebp
  loc_006174D2: retn 0004h
End Sub

Private Sub Form_Load() '617290
  loc_00617290: push ebp
  loc_00617291: mov ebp, esp
  loc_00617293: sub esp, 0000000Ch
  loc_00617296: push 00403B36h ; __vbaExceptHandler
  loc_0061729B: mov eax, fs:[00000000h]
  loc_006172A1: push eax
  loc_006172A2: mov fs:[00000000h], esp
  loc_006172A9: sub esp, 00000060h
  loc_006172AC: push ebx
  loc_006172AD: push esi
  loc_006172AE: push edi
  loc_006172AF: mov var_C, esp
  loc_006172B2: mov var_8, 00403AB0h
  loc_006172B9: mov esi, Me
  loc_006172BC: mov eax, esi
  loc_006172BE: and eax, 00000001h
  loc_006172C1: mov var_4, eax
  loc_006172C4: and esi, FFFFFFFEh
  loc_006172C7: push esi
  loc_006172C8: mov Me, esi
  loc_006172CB: mov ecx, [esi]
  loc_006172CD: call [ecx+00000004h]
  loc_006172D0: mov ebx, [00401224h] ; rtcGetDateVar
  loc_006172D6: lea edx, var_28
  loc_006172D9: xor edi, edi
  loc_006172DB: push edx
  loc_006172DC: mov var_18, edi
  loc_006172DF: mov var_28, edi
  loc_006172E2: mov var_38, edi
  loc_006172E5: mov var_48, edi
  loc_006172E8: mov var_58, edi
  loc_006172EB: call ebx
  loc_006172ED: lea edx, var_58
  loc_006172F0: lea ecx, var_38
  loc_006172F3: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_006172FA: mov var_58, 00000008h
  loc_00617301: call [00401240h] ; __vbaVarDup
  loc_00617307: push 00000001h
  loc_00617309: lea eax, var_38
  loc_0061730C: push 00000001h
  loc_0061730E: lea ecx, var_28
  loc_00617311: push eax
  loc_00617312: lea edx, var_48
  loc_00617315: push ecx
  loc_00617316: push edx
  loc_00617317: call [00401060h] ; rtcVarFromFormatVar
  loc_0061731D: mov ecx, var_48
  loc_00617320: mov edx, var_44
  loc_00617323: sub esp, 00000010h
  loc_00617326: mov eax, esp
  loc_00617328: push 00000014h
  loc_0061732A: push esi
  loc_0061732B: mov [eax], ecx
  loc_0061732D: mov ecx, var_40
  loc_00617330: mov [eax+00000004h], edx
  loc_00617333: mov edx, var_3C
  loc_00617336: mov [eax+00000008h], ecx
  loc_00617339: mov [eax+0000000Ch], edx
  loc_0061733C: mov eax, [esi]
  loc_0061733E: call [eax+0000031Ch]
  loc_00617344: lea ecx, var_18
  loc_00617347: push eax
  loc_00617348: push ecx
  loc_00617349: call [004010A0h] ; __vbaObjSet
  loc_0061734F: push eax
  loc_00617350: call [00401288h] ; __vbaLateIdSt
  loc_00617356: lea ecx, var_18
  loc_00617359: call [004012B0h] ; __vbaFreeObj
  loc_0061735F: lea edx, var_48
  loc_00617362: lea eax, var_38
  loc_00617365: push edx
  loc_00617366: lea ecx, var_28
  loc_00617369: push eax
  loc_0061736A: push ecx
  loc_0061736B: push 00000003h
  loc_0061736D: call [00401038h] ; __vbaFreeVarList
  loc_00617373: add esp, 00000010h
  loc_00617376: lea edx, var_28
  loc_00617379: push edx
  loc_0061737A: call ebx
  loc_0061737C: lea edx, var_58
  loc_0061737F: lea ecx, var_38
  loc_00617382: mov var_50, 00424A24h ; "dd-mmm-yyyy"
  loc_00617389: mov var_58, 00000008h
  loc_00617390: call [00401240h] ; __vbaVarDup
  loc_00617396: push 00000001h
  loc_00617398: lea eax, var_38
  loc_0061739B: push 00000001h
  loc_0061739D: push eax
  loc_0061739E: lea ecx, var_28
  loc_006173A1: lea edx, var_48
  loc_006173A4: push ecx
  loc_006173A5: push edx
  loc_006173A6: call [00401060h] ; rtcVarFromFormatVar
  loc_006173AC: mov ecx, var_48
  loc_006173AF: mov edx, var_44
  loc_006173B2: sub esp, 00000010h
  loc_006173B5: mov eax, esp
  loc_006173B7: push 00000014h
  loc_006173B9: push esi
  loc_006173BA: mov [eax], ecx
  loc_006173BC: mov ecx, var_40
  loc_006173BF: mov [eax+00000004h], edx
  loc_006173C2: mov edx, var_3C
  loc_006173C5: mov [eax+00000008h], ecx
  loc_006173C8: mov [eax+0000000Ch], edx
  loc_006173CB: mov eax, [esi]
  loc_006173CD: call [eax+00000318h]
  loc_006173D3: lea ecx, var_18
  loc_006173D6: push eax
  loc_006173D7: push ecx
  loc_006173D8: call [004010A0h] ; __vbaObjSet
  loc_006173DE: push eax
  loc_006173DF: call [00401288h] ; __vbaLateIdSt
  loc_006173E5: lea ecx, var_18
  loc_006173E8: call [004012B0h] ; __vbaFreeObj
  loc_006173EE: lea edx, var_48
  loc_006173F1: lea eax, var_38
  loc_006173F4: push edx
  loc_006173F5: lea ecx, var_28
  loc_006173F8: push eax
  loc_006173F9: push ecx
  loc_006173FA: push 00000003h
  loc_006173FC: call [00401038h] ; __vbaFreeVarList
  loc_00617402: mov edx, [esi]
  loc_00617404: add esp, 00000010h
  loc_00617407: push esi
  loc_00617408: call [edx+0000070Ch]
  loc_0061740E: cmp eax, edi
  loc_00617410: jge 00617424h
  loc_00617412: push 0000070Ch
  loc_00617417: push 0042B83Ch ; "工珪WIвl񧗹@cmdShow"
  loc_0061741C: push esi
  loc_0061741D: push eax
  loc_0061741E: call [00401074h] ; __vbaHresultCheckObj
  loc_00617424: mov var_4, edi
  loc_00617427: push 00617450h
  loc_0061742C: jmp 0061744Fh
  loc_0061742E: lea ecx, var_18
  loc_00617431: call [004012B0h] ; __vbaFreeObj
  loc_00617437: lea eax, var_48
  loc_0061743A: lea ecx, var_38
  loc_0061743D: push eax
  loc_0061743E: lea edx, var_28
  loc_00617441: push ecx
  loc_00617442: push edx
  loc_00617443: push 00000003h
  loc_00617445: call [00401038h] ; __vbaFreeVarList
  loc_0061744B: add esp, 00000010h
  loc_0061744E: ret
  loc_0061744F: ret
  loc_00617450: mov eax, Me
  loc_00617453: push eax
  loc_00617454: mov ecx, [eax]
  loc_00617456: call [ecx+00000008h]
  loc_00617459: mov eax, var_4
  loc_0061745C: mov ecx, var_14
  loc_0061745F: pop edi
  loc_00617460: pop esi
  loc_00617461: mov fs:[00000000h], ecx
  loc_00617468: pop ebx
  loc_00617469: mov esp, ebp
  loc_0061746B: pop ebp
  loc_0061746C: retn 0004h
End Sub

Private Sub txtDate1_KeyPress(KeyAscii As Integer) '6174E0
  loc_006174E0: push ebp
  loc_006174E1: mov ebp, esp
  loc_006174E3: sub esp, 0000000Ch
  loc_006174E6: push 00403B36h ; __vbaExceptHandler
  loc_006174EB: mov eax, fs:[00000000h]
  loc_006174F1: push eax
  loc_006174F2: mov fs:[00000000h], esp
  loc_006174F9: sub esp, 0000000Ch
  loc_006174FC: push ebx
  loc_006174FD: push esi
  loc_006174FE: push edi
  loc_006174FF: mov var_C, esp
  loc_00617502: mov var_8, 00403AC8h
  loc_00617509: mov esi, Me
  loc_0061750C: mov eax, esi
  loc_0061750E: and eax, 00000001h
  loc_00617511: mov var_4, eax
  loc_00617514: and esi, FFFFFFFEh
  loc_00617517: push esi
  loc_00617518: mov Me, esi
  loc_0061751B: mov ecx, [esi]
  loc_0061751D: call [ecx+00000004h]
  loc_00617520: mov edx, KeyAscii
  loc_00617523: xor edi, edi
  loc_00617525: mov var_18, edi
  loc_00617528: cmp [edx], 000Dh
  loc_0061752C: jnz 0061755Bh
  loc_0061752E: mov eax, [esi]
  loc_00617530: push edi
  loc_00617531: push 80011000h
  loc_00617536: push esi
  loc_00617537: call [eax+00000318h]
  loc_0061753D: lea ecx, var_18
  loc_00617540: push eax
  loc_00617541: push ecx
  loc_00617542: call [004010A0h] ; __vbaObjSet
  loc_00617548: push eax
  loc_00617549: call [00401024h] ; __vbaLateIdCall
  loc_0061754F: add esp, 0000000Ch
  loc_00617552: lea ecx, var_18
  loc_00617555: call [004012B0h] ; __vbaFreeObj
  loc_0061755B: mov var_4, edi
  loc_0061755E: push 00617570h
  loc_00617563: jmp 0061756Fh
  loc_00617565: lea ecx, var_18
  loc_00617568: call [004012B0h] ; __vbaFreeObj
  loc_0061756E: ret
  loc_0061756F: ret
  loc_00617570: mov eax, Me
  loc_00617573: push eax
  loc_00617574: mov edx, [eax]
  loc_00617576: call [edx+00000008h]
  loc_00617579: mov eax, var_4
  loc_0061757C: mov ecx, var_14
  loc_0061757F: pop edi
  loc_00617580: pop esi
  loc_00617581: mov fs:[00000000h], ecx
  loc_00617588: pop ebx
  loc_00617589: mov esp, ebp
  loc_0061758B: pop ebp
  loc_0061758C: retn 0008h
End Sub

Private Sub txtDate2_KeyPress(KeyAscii As Integer) '617590
  loc_00617590: push ebp
  loc_00617591: mov ebp, esp
  loc_00617593: sub esp, 0000000Ch
  loc_00617596: push 00403B36h ; __vbaExceptHandler
  loc_0061759B: mov eax, fs:[00000000h]
  loc_006175A1: push eax
  loc_006175A2: mov fs:[00000000h], esp
  loc_006175A9: sub esp, 00000014h
  loc_006175AC: push ebx
  loc_006175AD: push esi
  loc_006175AE: push edi
  loc_006175AF: mov var_C, esp
  loc_006175B2: mov var_8, 00403AD8h
  loc_006175B9: mov esi, Me
  loc_006175BC: mov eax, esi
  loc_006175BE: and eax, 00000001h
  loc_006175C1: mov var_4, eax
  loc_006175C4: and esi, FFFFFFFEh
  loc_006175C7: push esi
  loc_006175C8: mov Me, esi
  loc_006175CB: mov ecx, [esi]
  loc_006175CD: call [ecx+00000004h]
  loc_006175D0: mov edx, KeyAscii
  loc_006175D3: xor edi, edi
  loc_006175D5: mov var_18, edi
  loc_006175D8: cmp [edx], 000Dh
  loc_006175DC: jnz 0061761Eh
  loc_006175DE: mov eax, [esi]
  loc_006175E0: push esi
  loc_006175E1: call [eax+00000308h]
  loc_006175E7: lea ecx, var_18
  loc_006175EA: push eax
  loc_006175EB: push ecx
  loc_006175EC: call [004010A0h] ; __vbaObjSet
  loc_006175F2: mov esi, eax
  loc_006175F4: push esi
  loc_006175F5: mov edx, [esi]
  loc_006175F7: call [edx+000001A4h]
  loc_006175FD: cmp eax, edi
  loc_006175FF: fnclex
  loc_00617601: jge 00617615h
  loc_00617603: push 000001A4h
  loc_00617608: push 0041EAACh
  loc_0061760D: push esi
  loc_0061760E: push eax
  loc_0061760F: call [00401074h] ; __vbaHresultCheckObj
  loc_00617615: lea ecx, var_18
  loc_00617618: call [004012B0h] ; __vbaFreeObj
  loc_0061761E: mov var_4, edi
  loc_00617621: push 00617633h
  loc_00617626: jmp 00617632h
  loc_00617628: lea ecx, var_18
  loc_0061762B: call [004012B0h] ; __vbaFreeObj
  loc_00617631: ret
  loc_00617632: ret
  loc_00617633: mov eax, Me
  loc_00617636: push eax
  loc_00617637: mov ecx, [eax]
  loc_00617639: call [ecx+00000008h]
  loc_0061763C: mov eax, var_4
  loc_0061763F: mov ecx, var_14
  loc_00617642: pop edi
  loc_00617643: pop esi
  loc_00617644: mov fs:[00000000h], ecx
  loc_0061764B: pop ebx
  loc_0061764C: mov esp, ebp
  loc_0061764E: pop ebp
  loc_0061764F: retn 0008h
End Sub

Private Sub Proc_38_7_615A40() '615A40
  loc_00615A40: push ebp
  loc_00615A41: mov ebp, esp
  loc_00615A43: sub esp, 00000008h
  loc_00615A46: push 00403B36h ; __vbaExceptHandler
  loc_00615A4B: mov eax, fs:[00000000h]
  loc_00615A51: push eax
  loc_00615A52: mov fs:[00000000h], esp
  loc_00615A59: sub esp, 00000048h
  loc_00615A5C: push ebx
  loc_00615A5D: push esi
  loc_00615A5E: push edi
  loc_00615A5F: mov var_8, esp
  loc_00615A62: mov var_4, 00403A50h
  loc_00615A69: mov edi, var_20
  loc_00615A6C: sub esp, 00000010h
  loc_00615A6F: mov esi, Me
  loc_00615A72: mov edx, esp
  loc_00615A74: mov ecx, 00000003h
  loc_00615A79: mov ebx, var_18
  loc_00615A7C: mov [edx], ecx
  loc_00615A7E: xor eax, eax
  loc_00615A80: mov var_14, eax
  loc_00615A83: push 0000000Ah
  loc_00615A85: mov [edx+00000004h], edi
  loc_00615A88: push esi
  loc_00615A89: mov [edx+00000008h], eax
  loc_00615A8C: mov eax, [esi]
  loc_00615A8E: mov [edx+0000000Ch], ebx
  loc_00615A91: call [eax+00000314h]
  loc_00615A97: lea ecx, var_14
  loc_00615A9A: push eax
  loc_00615A9B: push ecx
  loc_00615A9C: call [004010A0h] ; __vbaObjSet
  loc_00615AA2: push eax
  loc_00615AA3: call [00401288h] ; __vbaLateIdSt
  loc_00615AA9: lea ecx, var_14
  loc_00615AAC: call [004012B0h] ; __vbaFreeObj
  loc_00615AB2: sub esp, 00000010h
  loc_00615AB5: mov ecx, 00000003h
  loc_00615ABA: mov edx, esp
  loc_00615ABC: xor eax, eax
  loc_00615ABE: push 0000000Bh
  loc_00615AC0: push esi
  loc_00615AC1: mov [edx], ecx
  loc_00615AC3: mov [edx+00000004h], edi
  loc_00615AC6: mov [edx+00000008h], eax
  loc_00615AC9: mov eax, [esi]
  loc_00615ACB: mov [edx+0000000Ch], ebx
  loc_00615ACE: call [eax+00000314h]
  loc_00615AD4: lea ecx, var_14
  loc_00615AD7: push eax
  loc_00615AD8: push ecx
  loc_00615AD9: call [004010A0h] ; __vbaObjSet
  loc_00615ADF: push eax
  loc_00615AE0: call [00401288h] ; __vbaLateIdSt
  loc_00615AE6: lea ecx, var_14
  loc_00615AE9: call [004012B0h] ; __vbaFreeObj
  loc_00615AEF: sub esp, 00000010h
  loc_00615AF2: mov ecx, 00000008h
  loc_00615AF7: mov edx, esp
  loc_00615AF9: mov eax, 0041EDD8h ; "SrNo"
  loc_00615AFE: push 00000000h
  loc_00615B00: push esi
  loc_00615B01: mov [edx], ecx
  loc_00615B03: mov [edx+00000004h], edi
  loc_00615B06: mov [edx+00000008h], eax
  loc_00615B09: mov eax, [esi]
  loc_00615B0B: mov [edx+0000000Ch], ebx
  loc_00615B0E: call [eax+00000314h]
  loc_00615B14: lea ecx, var_14
  loc_00615B17: push eax
  loc_00615B18: push ecx
  loc_00615B19: call [004010A0h] ; __vbaObjSet
  loc_00615B1F: push eax
  loc_00615B20: call [00401288h] ; __vbaLateIdSt
  loc_00615B26: lea ecx, var_14
  loc_00615B29: call [004012B0h] ; __vbaFreeObj
  loc_00615B2F: sub esp, 00000010h
  loc_00615B32: mov ecx, 00000003h
  loc_00615B37: mov edx, esp
  loc_00615B39: mov eax, 00000001h
  loc_00615B3E: push 0000000Bh
  loc_00615B40: push esi
  loc_00615B41: mov [edx], ecx
  loc_00615B43: mov [edx+00000004h], edi
  loc_00615B46: mov [edx+00000008h], eax
  loc_00615B49: mov eax, [esi]
  loc_00615B4B: mov [edx+0000000Ch], ebx
  loc_00615B4E: call [eax+00000314h]
  loc_00615B54: lea ecx, var_14
  loc_00615B57: push eax
  loc_00615B58: push ecx
  loc_00615B59: call [004010A0h] ; __vbaObjSet
  loc_00615B5F: push eax
  loc_00615B60: call [00401288h] ; __vbaLateIdSt
  loc_00615B66: lea ecx, var_14
  loc_00615B69: call [004012B0h] ; __vbaFreeObj
  loc_00615B6F: sub esp, 00000010h
  loc_00615B72: mov ecx, 00000008h
  loc_00615B77: mov edx, esp
  loc_00615B79: mov eax, 0041EA08h ; "Name"
  loc_00615B7E: push 00000000h
  loc_00615B80: push esi
  loc_00615B81: mov [edx], ecx
  loc_00615B83: mov [edx+00000004h], edi
  loc_00615B86: mov [edx+00000008h], eax
  loc_00615B89: mov eax, [esi]
  loc_00615B8B: mov [edx+0000000Ch], ebx
  loc_00615B8E: call [eax+00000314h]
  loc_00615B94: lea ecx, var_14
  loc_00615B97: push eax
  loc_00615B98: push ecx
  loc_00615B99: call [004010A0h] ; __vbaObjSet
  loc_00615B9F: push eax
  loc_00615BA0: call [00401288h] ; __vbaLateIdSt
  loc_00615BA6: lea ecx, var_14
  loc_00615BA9: call [004012B0h] ; __vbaFreeObj
  loc_00615BAF: sub esp, 00000010h
  loc_00615BB2: mov ecx, 00000003h
  loc_00615BB7: mov edx, esp
  loc_00615BB9: xor eax, eax
  loc_00615BBB: sub esp, 00000010h
  loc_00615BBE: mov var_44, ecx
  loc_00615BC1: mov [edx], ecx
  loc_00615BC3: mov ecx, esp
  loc_00615BC5: push 00000001h
  loc_00615BC7: push 00000039h
  loc_00615BC9: mov [edx+00000004h], edi
  loc_00615BCC: push esi
  loc_00615BCD: mov [edx+00000008h], eax
  loc_00615BD0: mov eax, var_40
  loc_00615BD3: mov [edx+0000000Ch], ebx
  loc_00615BD6: mov edx, var_44
  loc_00615BD9: mov [ecx], edx
  loc_00615BDB: mov edx, var_38
  loc_00615BDE: mov [ecx+00000004h], eax
  loc_00615BE1: mov eax, 000005DCh
  loc_00615BE6: mov [ecx+00000008h], eax
  loc_00615BE9: mov eax, [esi]
  loc_00615BEB: mov [ecx+0000000Ch], edx
  loc_00615BEE: call [eax+00000314h]
  loc_00615BF4: lea ecx, var_14
  loc_00615BF7: push eax
  loc_00615BF8: push ecx
  loc_00615BF9: call [004010A0h] ; __vbaObjSet
  loc_00615BFF: push eax
  loc_00615C00: call [00401160h] ; __vbaLateIdCallSt
  loc_00615C06: add esp, 0000002Ch
  loc_00615C09: lea ecx, var_14
  loc_00615C0C: call [004012B0h] ; __vbaFreeObj
  loc_00615C12: sub esp, 00000010h
  loc_00615C15: mov ecx, 00000003h
  loc_00615C1A: mov edx, esp
  loc_00615C1C: mov eax, 00000001h
  loc_00615C21: sub esp, 00000010h
  loc_00615C24: mov var_44, ecx
  loc_00615C27: mov [edx], ecx
  loc_00615C29: mov ecx, esp
  loc_00615C2B: push 00000001h
  loc_00615C2D: mov [edx+00000004h], edi
  loc_00615C30: mov [edx+00000008h], eax
  loc_00615C33: mov eax, var_40
  loc_00615C36: mov [edx+0000000Ch], ebx
  loc_00615C39: mov edx, var_44
  loc_00615C3C: mov [ecx], edx
  loc_00615C3E: mov edx, var_38
  loc_00615C41: mov [ecx+00000004h], eax
  loc_00615C44: mov eax, 000006A4h
  loc_00615C49: mov [ecx+00000008h], eax
  loc_00615C4C: mov [ecx+0000000Ch], edx
  loc_00615C4F: mov eax, [esi]
  loc_00615C51: push 00000039h
  loc_00615C53: push esi
  loc_00615C54: call [eax+00000314h]
  loc_00615C5A: lea ecx, var_14
  loc_00615C5D: push eax
  loc_00615C5E: push ecx
  loc_00615C5F: call [004010A0h] ; __vbaObjSet
  loc_00615C65: push eax
  loc_00615C66: call [00401160h] ; __vbaLateIdCallSt
  loc_00615C6C: add esp, 0000002Ch
  loc_00615C6F: lea ecx, var_14
  loc_00615C72: call [004012B0h] ; __vbaFreeObj
  loc_00615C78: push 00615C8Ah
  loc_00615C7D: jmp 00615C89h
  loc_00615C7F: lea ecx, var_14
  loc_00615C82: call [004012B0h] ; __vbaFreeObj
  loc_00615C88: ret
  loc_00615C89: ret
  loc_00615C8A: mov ecx, var_10
  loc_00615C8D: pop edi
  loc_00615C8E: pop esi
  loc_00615C8F: xor eax, eax
  loc_00615C91: mov fs:[00000000h], ecx
  loc_00615C98: pop ebx
  loc_00615C99: mov esp, ebp
  loc_00615C9B: pop ebp
  loc_00615C9C: retn 0004h
End Sub

Private Sub Proc_38_8_615CA0() '615CA0
  loc_00615CA0: push ebp
  loc_00615CA1: mov ebp, esp
  loc_00615CA3: sub esp, 00000008h
  loc_00615CA6: push 00403B36h ; __vbaExceptHandler
  loc_00615CAB: mov eax, fs:[00000000h]
  loc_00615CB1: push eax
  loc_00615CB2: mov fs:[00000000h], esp
  loc_00615CB9: sub esp, 00000114h
  loc_00615CBF: push ebx
  loc_00615CC0: push esi
  loc_00615CC1: push edi
  loc_00615CC2: mov var_8, esp
  loc_00615CC5: mov var_4, 00403A60h
  loc_00615CCC: mov esi, Me
  loc_00615CCF: xor ebx, ebx
  loc_00615CD1: push ebx
  loc_00615CD2: push 00000014h
  loc_00615CD4: mov eax, [esi]
  loc_00615CD6: push esi
  loc_00615CD7: mov var_18, ebx
  loc_00615CDA: mov var_1C, ebx
  loc_00615CDD: mov var_20, ebx
  loc_00615CE0: mov var_24, ebx
  loc_00615CE3: mov var_34, ebx
  loc_00615CE6: mov var_44, ebx
  loc_00615CE9: mov var_54, ebx
  loc_00615CEC: mov var_64, ebx
  loc_00615CEF: mov var_74, ebx
  loc_00615CF2: mov var_84, ebx
  loc_00615CF8: mov var_94, ebx
  loc_00615CFE: mov var_A4, ebx
  loc_00615D04: mov var_B4, ebx
  loc_00615D0A: mov var_C4, ebx
  loc_00615D10: mov var_D4, ebx
  loc_00615D16: mov var_108, ebx
  loc_00615D1C: call [eax+0000031Ch]
  loc_00615D22: mov edi, [004010A0h] ; __vbaObjSet
  loc_00615D28: lea ecx, var_1C
  loc_00615D2B: push eax
  loc_00615D2C: push ecx
  loc_00615D2D: call edi
  loc_00615D2F: lea edx, var_34
  loc_00615D32: push eax
  loc_00615D33: push edx
  loc_00615D34: call [00401140h] ; __vbaLateIdCallLd
  loc_00615D3A: add esp, 00000010h
  loc_00615D3D: push eax
  loc_00615D3E: lea eax, var_44
  loc_00615D41: push eax
  loc_00615D42: call [004010D4h] ; rtcTrimVar
  loc_00615D48: mov ecx, [esi]
  loc_00615D4A: push ebx
  loc_00615D4B: push 00000014h
  loc_00615D4D: push esi
  loc_00615D4E: call [ecx+00000318h]
  loc_00615D54: lea edx, var_20
  loc_00615D57: push eax
  loc_00615D58: push edx
  loc_00615D59: call edi
  loc_00615D5B: push eax
  loc_00615D5C: lea eax, var_74
  loc_00615D5F: push eax
  loc_00615D60: call [00401140h] ; __vbaLateIdCallLd
  loc_00615D66: add esp, 00000010h
  loc_00615D69: lea ecx, var_84
  loc_00615D6F: push eax
  loc_00615D70: push ecx
  loc_00615D71: call [004010D4h] ; rtcTrimVar
  loc_00615D77: mov edx, 00000008h
  loc_00615D7C: mov var_AC, 00433A34h ; "Select * From Receive Where OnDate Between #"
  loc_00615D86: mov var_B4, edx
  loc_00615D8C: mov var_C4, edx
  loc_00615D92: mov var_D4, edx
  loc_00615D98: mov edx, [0061A13Ch]
  loc_00615D9E: mov var_BC, 004296A4h ; "# and #"
  loc_00615DA8: mov var_CC, 004216BCh ; "#"
  loc_00615DB2: mov ebx, [edx]
  loc_00615DB4: lea edx, var_24
  loc_00615DB7: push edx
  loc_00615DB8: mov ecx, 0000000Ah
  loc_00615DBD: sub esp, 00000010h
  loc_00615DC0: mov var_F4, ecx
  loc_00615DC6: mov edx, esp
  loc_00615DC8: mov eax, 80020004h
  loc_00615DCD: mov var_EC, eax
  loc_00615DD3: mov [edx], ecx
  loc_00615DD5: mov ecx, var_100
  loc_00615DDB: mov [edx+00000004h], ecx
  loc_00615DDE: mov [edx+00000008h], eax
  loc_00615DE1: mov eax, var_F8
  loc_00615DE7: sub esp, 00000010h
  loc_00615DEA: mov [edx+0000000Ch], eax
  loc_00615DED: mov edx, var_F4
  loc_00615DF3: mov eax, var_F0
  loc_00615DF9: mov ecx, esp
  loc_00615DFB: sub esp, 00000010h
  loc_00615DFE: mov [ecx], edx
  loc_00615E00: mov edx, var_EC
  loc_00615E06: mov [ecx+00000004h], eax
  loc_00615E09: mov eax, var_E8
  loc_00615E0F: mov [ecx+00000008h], edx
  loc_00615E12: mov edx, var_E0
  loc_00615E18: mov [ecx+0000000Ch], eax
  loc_00615E1B: mov ecx, esp
  loc_00615E1D: mov eax, 00000003h
  loc_00615E22: mov [ecx], eax
  loc_00615E24: mov eax, 00000004h
  loc_00615E29: mov [ecx+00000004h], edx
  loc_00615E2C: lea edx, var_44
  loc_00615E2F: mov [ecx+00000008h], eax
  loc_00615E32: mov eax, var_D8
  loc_00615E38: mov [ecx+0000000Ch], eax
  loc_00615E3B: lea ecx, var_B4
  loc_00615E41: push ecx
  loc_00615E42: lea eax, var_54
  loc_00615E45: push edx
  loc_00615E46: push eax
  loc_00615E47: call [004011B4h] ; __vbaVarCat
  loc_00615E4D: lea ecx, var_C4
  loc_00615E53: push eax
  loc_00615E54: lea edx, var_64
  loc_00615E57: push ecx
  loc_00615E58: push edx
  loc_00615E59: call [004011B4h] ; __vbaVarCat
  loc_00615E5F: push eax
  loc_00615E60: lea eax, var_84
  loc_00615E66: lea ecx, var_94
  loc_00615E6C: push eax
  loc_00615E6D: push ecx
  loc_00615E6E: call [004011B4h] ; __vbaVarCat
  loc_00615E74: push eax
  loc_00615E75: lea edx, var_D4
  loc_00615E7B: lea eax, var_A4
  loc_00615E81: push edx
  loc_00615E82: push eax
  loc_00615E83: call [004011B4h] ; __vbaVarCat
  loc_00615E89: lea ecx, var_18
  loc_00615E8C: push eax
  loc_00615E8D: push ecx
  loc_00615E8E: call [004011B0h] ; __vbaStrVarVal
  loc_00615E94: mov edx, [0061A13Ch]
  loc_00615E9A: push eax
  loc_00615E9B: push edx
  loc_00615E9C: call [ebx+000000BCh]
  loc_00615EA2: test eax, eax
  loc_00615EA4: fnclex
  loc_00615EA6: jge 00615EC0h
  loc_00615EA8: mov ecx, [0061A13Ch]
  loc_00615EAE: push 000000BCh
  loc_00615EB3: push 0041E928h
  loc_00615EB8: push ecx
  loc_00615EB9: push eax
  loc_00615EBA: call [00401074h] ; __vbaHresultCheckObj
  loc_00615EC0: mov edx, var_24
  loc_00615EC3: lea eax, [esi+00000034h]
  loc_00615EC6: push edx
  loc_00615EC7: push eax
  loc_00615EC8: mov var_124, eax
  loc_00615ECE: call [004010B8h] ; __vbaObjSetAddref
  loc_00615ED4: lea ecx, var_18
  loc_00615ED7: call [004012ACh] ; __vbaFreeStr
  loc_00615EDD: lea eax, var_24
  loc_00615EE0: lea ecx, var_20
  loc_00615EE3: push eax
  loc_00615EE4: lea edx, var_1C
  loc_00615EE7: push ecx
  loc_00615EE8: push edx
  loc_00615EE9: push 00000003h
  loc_00615EEB: call [00401040h] ; __vbaFreeObjList
  loc_00615EF1: lea eax, var_A4
  loc_00615EF7: lea ecx, var_94
  loc_00615EFD: push eax
  loc_00615EFE: lea edx, var_84
  loc_00615F04: push ecx
  loc_00615F05: lea eax, var_64
  loc_00615F08: push edx
  loc_00615F09: lea ecx, var_74
  loc_00615F0C: push eax
  loc_00615F0D: lea edx, var_54
  loc_00615F10: push ecx
  loc_00615F11: lea eax, var_44
  loc_00615F14: push edx
  loc_00615F15: lea ecx, var_34
  loc_00615F18: push eax
  loc_00615F19: push ecx
  loc_00615F1A: push 00000008h
  loc_00615F1C: call [00401038h] ; __vbaFreeVarList
  loc_00615F22: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_00615F28: add esp, 00000034h
  loc_00615F2B: mov var_14, 00000001h
  loc_00615F32: mov edx, var_124
  loc_00615F38: mov eax, [edx]
  loc_00615F3A: lea edx, var_108
  loc_00615F40: push edx
  loc_00615F41: push eax
  loc_00615F42: mov ecx, [eax]
  loc_00615F44: call [ecx+00000034h]
  loc_00615F47: test eax, eax
  loc_00615F49: fnclex
  loc_00615F4B: jge 00615F64h
  loc_00615F4D: mov ecx, var_124
  loc_00615F53: push 00000034h
  loc_00615F55: push 0041E938h
  loc_00615F5A: mov edx, [ecx]
  loc_00615F5C: push edx
  loc_00615F5D: push eax
  loc_00615F5E: call [00401074h] ; __vbaHresultCheckObj
  loc_00615F64: cmp var_108, 0000h
  loc_00615F6C: jnz 00616422h
  loc_00615F72: movsx eax, var_14
  loc_00615F76: sub esp, 00000010h
  loc_00615F79: mov ecx, 00000003h
  loc_00615F7E: mov edx, esp
  loc_00615F80: mov var_B4, ecx
  loc_00615F86: mov var_AC, eax
  loc_00615F8C: push 0000000Ah
  loc_00615F8E: mov [edx], ecx
  loc_00615F90: mov ecx, var_B0
  loc_00615F96: push esi
  loc_00615F97: mov [edx+00000004h], ecx
  loc_00615F9A: mov ecx, [esi]
  loc_00615F9C: mov [edx+00000008h], eax
  loc_00615F9F: mov eax, var_A8
  loc_00615FA5: mov [edx+0000000Ch], eax
  loc_00615FA8: call [ecx+00000314h]
  loc_00615FAE: lea edx, var_1C
  loc_00615FB1: push eax
  loc_00615FB2: push edx
  loc_00615FB3: call edi
  loc_00615FB5: push eax
  loc_00615FB6: call ebx
  loc_00615FB8: lea ecx, var_1C
  loc_00615FBB: call [004012B0h] ; __vbaFreeObj
  loc_00615FC1: sub esp, 00000010h
  loc_00615FC4: mov ecx, 00000003h
  loc_00615FC9: mov edx, esp
  loc_00615FCB: mov var_B4, ecx
  loc_00615FD1: xor eax, eax
  loc_00615FD3: push 0000000Bh
  loc_00615FD5: mov [edx], ecx
  loc_00615FD7: mov ecx, var_B0
  loc_00615FDD: mov var_AC, eax
  loc_00615FE3: push esi
  loc_00615FE4: mov [edx+00000004h], ecx
  loc_00615FE7: mov ecx, [esi]
  loc_00615FE9: mov [edx+00000008h], eax
  loc_00615FEC: mov eax, var_A8
  loc_00615FF2: mov [edx+0000000Ch], eax
  loc_00615FF5: call [ecx+00000314h]
  loc_00615FFB: lea edx, var_1C
  loc_00615FFE: push eax
  loc_00615FFF: push edx
  loc_00616000: call edi
  loc_00616002: push eax
  loc_00616003: call ebx
  loc_00616005: lea ecx, var_1C
  loc_00616008: call [004012B0h] ; __vbaFreeObj
  loc_0061600E: sub esp, 00000010h
  loc_00616011: mov ecx, 00000002h
  loc_00616016: mov edx, esp
  loc_00616018: mov var_B4, ecx
  loc_0061601E: mov eax, 00000001h
  loc_00616023: push 00000028h
  loc_00616025: mov [edx], ecx
  loc_00616027: mov ecx, var_B0
  loc_0061602D: mov var_AC, eax
  loc_00616033: push esi
  loc_00616034: mov [edx+00000004h], ecx
  loc_00616037: mov ecx, [esi]
  loc_00616039: mov [edx+00000008h], eax
  loc_0061603C: mov eax, var_A8
  loc_00616042: mov [edx+0000000Ch], eax
  loc_00616045: call [ecx+00000314h]
  loc_0061604B: lea edx, var_1C
  loc_0061604E: push eax
  loc_0061604F: push edx
  loc_00616050: call edi
  loc_00616052: push eax
  loc_00616053: call ebx
  loc_00616055: lea ecx, var_1C
  loc_00616058: call [004012B0h] ; __vbaFreeObj
  loc_0061605E: mov eax, var_124
  loc_00616064: lea edx, var_1C
  loc_00616067: push edx
  loc_00616068: mov eax, [eax]
  loc_0061606A: push eax
  loc_0061606B: mov ecx, [eax]
  loc_0061606D: call [ecx+000000B4h]
  loc_00616073: fnclex
  loc_00616075: test eax, eax
  loc_00616077: jge 00616093h
  loc_00616079: mov ecx, var_124
  loc_0061607F: push 000000B4h
  loc_00616084: push 0041E938h
  loc_00616089: mov edx, [ecx]
  loc_0061608B: push edx
  loc_0061608C: push eax
  loc_0061608D: call [00401074h] ; __vbaHresultCheckObj
  loc_00616093: lea edx, var_20
  loc_00616096: mov eax, 00000008h
  loc_0061609B: push edx
  loc_0061609C: mov ecx, var_1C
  loc_0061609F: sub esp, 00000010h
  loc_006160A2: mov var_B4, eax
  loc_006160A8: mov edx, esp
  loc_006160AA: mov var_AC, 0041EDD8h ; "SrNo"
  loc_006160B4: mov var_110, ecx
  loc_006160BA: mov ecx, [ecx]
  loc_006160BC: mov [edx], eax
  loc_006160BE: mov eax, var_B0
  loc_006160C4: mov [edx+00000004h], eax
  loc_006160C7: mov eax, var_AC
  loc_006160CD: mov [edx+00000008h], eax
  loc_006160D0: mov eax, var_A8
  loc_006160D6: mov [edx+0000000Ch], eax
  loc_006160D9: mov edx, var_1C
  loc_006160DC: push edx
  loc_006160DD: call [ecx+00000030h]
  loc_006160E0: test eax, eax
  loc_006160E2: fnclex
  loc_006160E4: jge 006160FBh
  loc_006160E6: mov ecx, var_110
  loc_006160EC: push 00000030h
  loc_006160EE: push 0041EA14h ; "S"
  loc_006160F3: push ecx
  loc_006160F4: push eax
  loc_006160F5: call [00401074h] ; __vbaHresultCheckObj
  loc_006160FB: mov eax, var_20
  loc_006160FE: lea edx, var_34
  loc_00616101: mov var_2C, eax
  loc_00616104: lea eax, var_44
  loc_00616107: push edx
  loc_00616108: push eax
  loc_00616109: mov var_20, 00000000h
  loc_00616110: mov var_34, 00000009h
  loc_00616117: call [004010D4h] ; rtcTrimVar
  loc_0061611D: lea ecx, var_44
  loc_00616120: push ecx
  loc_00616121: call [00401028h] ; __vbaStrVarMove
  loc_00616127: sub esp, 00000010h
  loc_0061612A: mov ecx, 00000008h
  loc_0061612F: mov edx, esp
  loc_00616131: mov var_54, ecx
  loc_00616134: mov var_4C, eax
  loc_00616137: push 00000000h
  loc_00616139: mov [edx], ecx
  loc_0061613B: mov ecx, var_50
  loc_0061613E: push esi
  loc_0061613F: mov [edx+00000004h], ecx
  loc_00616142: mov ecx, [esi]
  loc_00616144: mov [edx+00000008h], eax
  loc_00616147: mov eax, var_48
  loc_0061614A: mov [edx+0000000Ch], eax
  loc_0061614D: call [ecx+00000314h]
  loc_00616153: lea edx, var_24
  loc_00616156: push eax
  loc_00616157: push edx
  loc_00616158: call edi
  loc_0061615A: push eax
  loc_0061615B: call ebx
  loc_0061615D: lea eax, var_24
  loc_00616160: lea ecx, var_1C
  loc_00616163: push eax
  loc_00616164: push ecx
  loc_00616165: push 00000002h
  loc_00616167: call [00401040h] ; __vbaFreeObjList
  loc_0061616D: lea edx, var_54
  loc_00616170: lea eax, var_44
  loc_00616173: push edx
  loc_00616174: lea ecx, var_34
  loc_00616177: push eax
  loc_00616178: push ecx
  loc_00616179: push 00000003h
  loc_0061617B: call [00401038h] ; __vbaFreeVarList
  loc_00616181: add esp, 0000000Ch
  loc_00616184: mov ecx, 00000003h
  loc_00616189: mov edx, esp
  loc_0061618B: mov var_B4, ecx
  loc_00616191: mov eax, 00000001h
  loc_00616196: push 0000000Bh
  loc_00616198: mov [edx], ecx
  loc_0061619A: mov ecx, var_B0
  loc_006161A0: mov var_AC, eax
  loc_006161A6: push esi
  loc_006161A7: mov [edx+00000004h], ecx
  loc_006161AA: mov ecx, [esi]
  loc_006161AC: mov [edx+00000008h], eax
  loc_006161AF: mov eax, var_A8
  loc_006161B5: mov [edx+0000000Ch], eax
  loc_006161B8: call [ecx+00000314h]
  loc_006161BE: lea edx, var_1C
  loc_006161C1: push eax
  loc_006161C2: push edx
  loc_006161C3: call edi
  loc_006161C5: push eax
  loc_006161C6: call ebx
  loc_006161C8: lea ecx, var_1C
  loc_006161CB: call [004012B0h] ; __vbaFreeObj
  loc_006161D1: sub esp, 00000010h
  loc_006161D4: mov ecx, 00000002h
  loc_006161D9: mov edx, esp
  loc_006161DB: mov var_B4, ecx
  loc_006161E1: mov eax, 00000001h
  loc_006161E6: mov [edx], ecx
  loc_006161E8: mov ecx, var_B0
  loc_006161EE: mov var_AC, eax
  loc_006161F4: mov [edx+00000004h], ecx
  loc_006161F7: mov [edx+00000008h], eax
  loc_006161FA: mov eax, var_A8
  loc_00616200: mov ecx, [esi]
  loc_00616202: push 00000028h
  loc_00616204: push esi
  loc_00616205: mov [edx+0000000Ch], eax
  loc_00616208: call [ecx+00000314h]
  loc_0061620E: lea edx, var_1C
  loc_00616211: push eax
  loc_00616212: push edx
  loc_00616213: call edi
  loc_00616215: push eax
  loc_00616216: call ebx
  loc_00616218: lea ecx, var_1C
  loc_0061621B: call [004012B0h] ; __vbaFreeObj
  loc_00616221: mov eax, var_124
  loc_00616227: lea edx, var_1C
  loc_0061622A: push edx
  loc_0061622B: mov eax, [eax]
  loc_0061622D: push eax
  loc_0061622E: mov ecx, [eax]
  loc_00616230: call [ecx+000000B4h]
  loc_00616236: test eax, eax
  loc_00616238: fnclex
  loc_0061623A: jge 00616256h
  loc_0061623C: mov ecx, var_124
  loc_00616242: push 000000B4h
  loc_00616247: push 0041E938h
  loc_0061624C: mov edx, [ecx]
  loc_0061624E: push edx
  loc_0061624F: push eax
  loc_00616250: call [00401074h] ; __vbaHresultCheckObj
  loc_00616256: lea edx, var_20
  loc_00616259: mov eax, 00000008h
  loc_0061625E: push edx
  loc_0061625F: mov ecx, var_1C
  loc_00616262: sub esp, 00000010h
  loc_00616265: mov var_B4, eax
  loc_0061626B: mov edx, esp
  loc_0061626D: mov var_AC, 0041EA08h ; "Name"
  loc_00616277: mov var_110, ecx
  loc_0061627D: mov ecx, [ecx]
  loc_0061627F: mov [edx], eax
  loc_00616281: mov eax, var_B0
  loc_00616287: mov [edx+00000004h], eax
  loc_0061628A: mov eax, var_AC
  loc_00616290: mov [edx+00000008h], eax
  loc_00616293: mov eax, var_A8
  loc_00616299: mov [edx+0000000Ch], eax
  loc_0061629C: mov edx, var_1C
  loc_0061629F: push edx
  loc_006162A0: call [ecx+00000030h]
  loc_006162A3: test eax, eax
  loc_006162A5: fnclex
  loc_006162A7: jge 006162BEh
  loc_006162A9: mov ecx, var_110
  loc_006162AF: push 00000030h
  loc_006162B1: push 0041EA14h ; "S"
  loc_006162B6: push ecx
  loc_006162B7: push eax
  loc_006162B8: call [00401074h] ; __vbaHresultCheckObj
  loc_006162BE: mov eax, var_20
  loc_006162C1: lea edx, var_34
  loc_006162C4: mov var_2C, eax
  loc_006162C7: lea eax, var_44
  loc_006162CA: push edx
  loc_006162CB: push eax
  loc_006162CC: mov var_20, 00000000h
  loc_006162D3: mov var_34, 00000009h
  loc_006162DA: call [004010D4h] ; rtcTrimVar
  loc_006162E0: lea ecx, var_44
  loc_006162E3: push ecx
  loc_006162E4: call [00401028h] ; __vbaStrVarMove
  loc_006162EA: sub esp, 00000010h
  loc_006162ED: mov ecx, 00000008h
  loc_006162F2: mov edx, esp
  loc_006162F4: mov var_54, ecx
  loc_006162F7: mov var_4C, eax
  loc_006162FA: push 00000000h
  loc_006162FC: mov [edx], ecx
  loc_006162FE: mov ecx, var_50
  loc_00616301: push esi
  loc_00616302: mov [edx+00000004h], ecx
  loc_00616305: mov ecx, [esi]
  loc_00616307: mov [edx+00000008h], eax
  loc_0061630A: mov eax, var_48
  loc_0061630D: mov [edx+0000000Ch], eax
  loc_00616310: call [ecx+00000314h]
  loc_00616316: lea edx, var_24
  loc_00616319: push eax
  loc_0061631A: push edx
  loc_0061631B: call edi
  loc_0061631D: push eax
  loc_0061631E: call ebx
  loc_00616320: lea eax, var_24
  loc_00616323: lea ecx, var_1C
  loc_00616326: push eax
  loc_00616327: push ecx
  loc_00616328: push 00000002h
  loc_0061632A: call [00401040h] ; __vbaFreeObjList
  loc_00616330: lea edx, var_54
  loc_00616333: lea eax, var_44
  loc_00616336: push edx
  loc_00616337: lea ecx, var_34
  loc_0061633A: push eax
  loc_0061633B: push ecx
  loc_0061633C: push 00000003h
  loc_0061633E: call [00401038h] ; __vbaFreeVarList
  loc_00616344: mov edx, [esi]
  loc_00616346: add esp, 0000001Ch
  loc_00616349: push 00000000h
  loc_0061634B: push 00000004h
  loc_0061634D: push esi
  loc_0061634E: call [edx+00000314h]
  loc_00616354: push eax
  loc_00616355: lea eax, var_1C
  loc_00616358: push eax
  loc_00616359: call edi
  loc_0061635B: lea ecx, var_34
  loc_0061635E: push eax
  loc_0061635F: push ecx
  loc_00616360: call [00401140h] ; __vbaLateIdCallLd
  loc_00616366: add esp, 00000010h
  loc_00616369: push eax
  loc_0061636A: call [0040121Ch] ; __vbaI4Var
  loc_00616370: add eax, 00000001h
  loc_00616373: mov ecx, 00000003h
  loc_00616378: jo 006164E1h
  loc_0061637E: sub esp, 00000010h
  loc_00616381: mov var_B4, ecx
  loc_00616387: mov edx, esp
  loc_00616389: mov var_AC, eax
  loc_0061638F: push 00000004h
  loc_00616391: push esi
  loc_00616392: mov [edx], ecx
  loc_00616394: mov ecx, var_B0
  loc_0061639A: mov [edx+00000004h], ecx
  loc_0061639D: mov ecx, [esi]
  loc_0061639F: mov [edx+00000008h], eax
  loc_006163A2: mov eax, var_A8
  loc_006163A8: mov [edx+0000000Ch], eax
  loc_006163AB: call [ecx+00000314h]
  loc_006163B1: lea edx, var_20
  loc_006163B4: push eax
  loc_006163B5: push edx
  loc_006163B6: call edi
  loc_006163B8: push eax
  loc_006163B9: call ebx
  loc_006163BB: lea eax, var_20
  loc_006163BE: lea ecx, var_1C
  loc_006163C1: push eax
  loc_006163C2: push ecx
  loc_006163C3: push 00000002h
  loc_006163C5: call [00401040h] ; __vbaFreeObjList
  loc_006163CB: add esp, 0000000Ch
  loc_006163CE: lea ecx, var_34
  loc_006163D1: call [00401020h] ; __vbaFreeVar
  loc_006163D7: mov eax, var_124
  loc_006163DD: mov dx, var_14
  loc_006163E1: add dx, 0001h
  loc_006163E5: mov eax, [eax]
  loc_006163E7: jo 006164E1h
  loc_006163ED: mov ecx, [eax]
  loc_006163EF: push eax
  loc_006163F0: mov var_14, edx
  loc_006163F3: call [ecx+000000ECh]
  loc_006163F9: test eax, eax
  loc_006163FB: fnclex
  loc_006163FD: jge 00615F32h
  loc_00616403: mov edx, var_124
  loc_00616409: push 000000ECh
  loc_0061640E: push 0041E938h
  loc_00616413: mov ecx, [edx]
  loc_00616415: push ecx
  loc_00616416: push eax
  loc_00616417: call [00401074h] ; __vbaHresultCheckObj
  loc_0061641D: jmp 00615F32h
  loc_00616422: mov esi, var_124
  loc_00616428: mov eax, [esi]
  loc_0061642A: push eax
  loc_0061642B: mov edx, [eax]
  loc_0061642D: call [edx+000000C4h]
  loc_00616433: test eax, eax
  loc_00616435: fnclex
  loc_00616437: jge 0061644Dh
  loc_00616439: mov ecx, [esi]
  loc_0061643B: push 000000C4h
  loc_00616440: push 0041E938h
  loc_00616445: push ecx
  loc_00616446: push eax
  loc_00616447: call [00401074h] ; __vbaHresultCheckObj
  loc_0061644D: push 0041E938h
  loc_00616452: push 00000000h
  loc_00616454: call [00401274h] ; __vbaCastObj
  loc_0061645A: lea edx, var_1C
  loc_0061645D: push eax
  loc_0061645E: push edx
  loc_0061645F: call edi
  loc_00616461: push eax
  loc_00616462: push esi
  loc_00616463: call [004010B8h] ; __vbaObjSetAddref
  loc_00616469: lea ecx, var_1C
  loc_0061646C: call [004012B0h] ; __vbaFreeObj
  loc_00616472: push 006164CCh
  loc_00616477: jmp 006164CBh
  loc_00616479: lea ecx, var_18
  loc_0061647C: call [004012ACh] ; __vbaFreeStr
  loc_00616482: lea eax, var_24
  loc_00616485: lea ecx, var_20
  loc_00616488: push eax
  loc_00616489: lea edx, var_1C
  loc_0061648C: push ecx
  loc_0061648D: push edx
  loc_0061648E: push 00000003h
  loc_00616490: call [00401040h] ; __vbaFreeObjList
  loc_00616496: lea eax, var_A4
  loc_0061649C: lea ecx, var_94
  loc_006164A2: push eax
  loc_006164A3: lea edx, var_84
  loc_006164A9: push ecx
  loc_006164AA: lea eax, var_74
  loc_006164AD: push edx
  loc_006164AE: lea ecx, var_64
  loc_006164B1: push eax
  loc_006164B2: lea edx, var_54
  loc_006164B5: push ecx
  loc_006164B6: lea eax, var_44
  loc_006164B9: push edx
  loc_006164BA: lea ecx, var_34
  loc_006164BD: push eax
  loc_006164BE: push ecx
  loc_006164BF: push 00000008h
  loc_006164C1: call [00401038h] ; __vbaFreeVarList
  loc_006164C7: add esp, 00000034h
  loc_006164CA: ret
  loc_006164CB: ret
  loc_006164CC: mov ecx, var_10
  loc_006164CF: pop edi
  loc_006164D0: pop esi
  loc_006164D1: xor eax, eax
  loc_006164D3: mov fs:[00000000h], ecx
  loc_006164DA: pop ebx
  loc_006164DB: mov esp, ebp
  loc_006164DD: pop ebp
  loc_006164DE: retn 0004h
End Sub

Private Sub Proc_38_9_6164F0() '6164F0
  loc_006164F0: push ebp
  loc_006164F1: mov ebp, esp
  loc_006164F3: sub esp, 00000008h
  loc_006164F6: push 00403B36h ; __vbaExceptHandler
  loc_006164FB: mov eax, fs:[00000000h]
  loc_00616501: push eax
  loc_00616502: mov fs:[00000000h], esp
  loc_00616509: sub esp, 00000114h
  loc_0061650F: push ebx
  loc_00616510: push esi
  loc_00616511: push edi
  loc_00616512: mov var_8, esp
  loc_00616515: mov var_4, 00403A70h
  loc_0061651C: mov esi, Me
  loc_0061651F: xor ebx, ebx
  loc_00616521: push ebx
  loc_00616522: push 00000014h
  loc_00616524: mov eax, [esi]
  loc_00616526: push esi
  loc_00616527: mov var_18, ebx
  loc_0061652A: mov var_1C, ebx
  loc_0061652D: mov var_20, ebx
  loc_00616530: mov var_24, ebx
  loc_00616533: mov var_34, ebx
  loc_00616536: mov var_44, ebx
  loc_00616539: mov var_54, ebx
  loc_0061653C: mov var_64, ebx
  loc_0061653F: mov var_74, ebx
  loc_00616542: mov var_84, ebx
  loc_00616548: mov var_94, ebx
  loc_0061654E: mov var_A4, ebx
  loc_00616554: mov var_B4, ebx
  loc_0061655A: mov var_C4, ebx
  loc_00616560: mov var_D4, ebx
  loc_00616566: mov var_108, ebx
  loc_0061656C: call [eax+0000031Ch]
  loc_00616572: mov edi, [004010A0h] ; __vbaObjSet
  loc_00616578: lea ecx, var_1C
  loc_0061657B: push eax
  loc_0061657C: push ecx
  loc_0061657D: call edi
  loc_0061657F: lea edx, var_34
  loc_00616582: push eax
  loc_00616583: push edx
  loc_00616584: call [00401140h] ; __vbaLateIdCallLd
  loc_0061658A: add esp, 00000010h
  loc_0061658D: push eax
  loc_0061658E: lea eax, var_44
  loc_00616591: push eax
  loc_00616592: call [004010D4h] ; rtcTrimVar
  loc_00616598: mov ecx, [esi]
  loc_0061659A: push ebx
  loc_0061659B: push 00000014h
  loc_0061659D: push esi
  loc_0061659E: call [ecx+00000318h]
  loc_006165A4: lea edx, var_20
  loc_006165A7: push eax
  loc_006165A8: push edx
  loc_006165A9: call edi
  loc_006165AB: push eax
  loc_006165AC: lea eax, var_74
  loc_006165AF: push eax
  loc_006165B0: call [00401140h] ; __vbaLateIdCallLd
  loc_006165B6: add esp, 00000010h
  loc_006165B9: lea ecx, var_84
  loc_006165BF: push eax
  loc_006165C0: push ecx
  loc_006165C1: call [004010D4h] ; rtcTrimVar
  loc_006165C7: mov edx, 00000008h
  loc_006165CC: mov var_AC, 00433A94h ; "Select * From Issue Where OnDate Between #"
  loc_006165D6: mov var_B4, edx
  loc_006165DC: mov var_C4, edx
  loc_006165E2: mov var_D4, edx
  loc_006165E8: mov edx, [0061A13Ch]
  loc_006165EE: mov var_BC, 004296A4h ; "# and #"
  loc_006165F8: mov var_CC, 004216BCh ; "#"
  loc_00616602: mov ebx, [edx]
  loc_00616604: lea edx, var_24
  loc_00616607: push edx
  loc_00616608: mov ecx, 0000000Ah
  loc_0061660D: sub esp, 00000010h
  loc_00616610: mov var_F4, ecx
  loc_00616616: mov edx, esp
  loc_00616618: mov eax, 80020004h
  loc_0061661D: mov var_EC, eax
  loc_00616623: mov [edx], ecx
  loc_00616625: mov ecx, var_100
  loc_0061662B: mov [edx+00000004h], ecx
  loc_0061662E: mov [edx+00000008h], eax
  loc_00616631: mov eax, var_F8
  loc_00616637: sub esp, 00000010h
  loc_0061663A: mov [edx+0000000Ch], eax
  loc_0061663D: mov edx, var_F4
  loc_00616643: mov eax, var_F0
  loc_00616649: mov ecx, esp
  loc_0061664B: sub esp, 00000010h
  loc_0061664E: mov [ecx], edx
  loc_00616650: mov edx, var_EC
  loc_00616656: mov [ecx+00000004h], eax
  loc_00616659: mov eax, var_E8
  loc_0061665F: mov [ecx+00000008h], edx
  loc_00616662: mov edx, var_E0
  loc_00616668: mov [ecx+0000000Ch], eax
  loc_0061666B: mov ecx, esp
  loc_0061666D: mov eax, 00000003h
  loc_00616672: mov [ecx], eax
  loc_00616674: mov eax, 00000004h
  loc_00616679: mov [ecx+00000004h], edx
  loc_0061667C: lea edx, var_44
  loc_0061667F: mov [ecx+00000008h], eax
  loc_00616682: mov eax, var_D8
  loc_00616688: mov [ecx+0000000Ch], eax
  loc_0061668B: lea ecx, var_B4
  loc_00616691: push ecx
  loc_00616692: lea eax, var_54
  loc_00616695: push edx
  loc_00616696: push eax
  loc_00616697: call [004011B4h] ; __vbaVarCat
  loc_0061669D: lea ecx, var_C4
  loc_006166A3: push eax
  loc_006166A4: lea edx, var_64
  loc_006166A7: push ecx
  loc_006166A8: push edx
  loc_006166A9: call [004011B4h] ; __vbaVarCat
  loc_006166AF: push eax
  loc_006166B0: lea eax, var_84
  loc_006166B6: lea ecx, var_94
  loc_006166BC: push eax
  loc_006166BD: push ecx
  loc_006166BE: call [004011B4h] ; __vbaVarCat
  loc_006166C4: push eax
  loc_006166C5: lea edx, var_D4
  loc_006166CB: lea eax, var_A4
  loc_006166D1: push edx
  loc_006166D2: push eax
  loc_006166D3: call [004011B4h] ; __vbaVarCat
  loc_006166D9: lea ecx, var_18
  loc_006166DC: push eax
  loc_006166DD: push ecx
  loc_006166DE: call [004011B0h] ; __vbaStrVarVal
  loc_006166E4: mov edx, [0061A13Ch]
  loc_006166EA: push eax
  loc_006166EB: push edx
  loc_006166EC: call [ebx+000000BCh]
  loc_006166F2: test eax, eax
  loc_006166F4: fnclex
  loc_006166F6: jge 00616710h
  loc_006166F8: mov ecx, [0061A13Ch]
  loc_006166FE: push 000000BCh
  loc_00616703: push 0041E928h
  loc_00616708: push ecx
  loc_00616709: push eax
  loc_0061670A: call [00401074h] ; __vbaHresultCheckObj
  loc_00616710: mov edx, var_24
  loc_00616713: lea eax, [esi+00000034h]
  loc_00616716: push edx
  loc_00616717: push eax
  loc_00616718: mov var_124, eax
  loc_0061671E: call [004010B8h] ; __vbaObjSetAddref
  loc_00616724: lea ecx, var_18
  loc_00616727: call [004012ACh] ; __vbaFreeStr
  loc_0061672D: lea eax, var_24
  loc_00616730: lea ecx, var_20
  loc_00616733: push eax
  loc_00616734: lea edx, var_1C
  loc_00616737: push ecx
  loc_00616738: push edx
  loc_00616739: push 00000003h
  loc_0061673B: call [00401040h] ; __vbaFreeObjList
  loc_00616741: lea eax, var_A4
  loc_00616747: lea ecx, var_94
  loc_0061674D: push eax
  loc_0061674E: lea edx, var_84
  loc_00616754: push ecx
  loc_00616755: lea eax, var_64
  loc_00616758: push edx
  loc_00616759: lea ecx, var_74
  loc_0061675C: push eax
  loc_0061675D: lea edx, var_54
  loc_00616760: push ecx
  loc_00616761: lea eax, var_44
  loc_00616764: push edx
  loc_00616765: lea ecx, var_34
  loc_00616768: push eax
  loc_00616769: push ecx
  loc_0061676A: push 00000008h
  loc_0061676C: call [00401038h] ; __vbaFreeVarList
  loc_00616772: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_00616778: add esp, 00000034h
  loc_0061677B: mov var_14, 00000001h
  loc_00616782: mov edx, var_124
  loc_00616788: mov eax, [edx]
  loc_0061678A: lea edx, var_108
  loc_00616790: push edx
  loc_00616791: push eax
  loc_00616792: mov ecx, [eax]
  loc_00616794: call [ecx+00000034h]
  loc_00616797: test eax, eax
  loc_00616799: fnclex
  loc_0061679B: jge 006167B4h
  loc_0061679D: mov ecx, var_124
  loc_006167A3: push 00000034h
  loc_006167A5: push 0041E938h
  loc_006167AA: mov edx, [ecx]
  loc_006167AC: push edx
  loc_006167AD: push eax
  loc_006167AE: call [00401074h] ; __vbaHresultCheckObj
  loc_006167B4: cmp var_108, 0000h
  loc_006167BC: jnz 00616C72h
  loc_006167C2: movsx eax, var_14
  loc_006167C6: sub esp, 00000010h
  loc_006167C9: mov ecx, 00000003h
  loc_006167CE: mov edx, esp
  loc_006167D0: mov var_B4, ecx
  loc_006167D6: mov var_AC, eax
  loc_006167DC: push 0000000Ah
  loc_006167DE: mov [edx], ecx
  loc_006167E0: mov ecx, var_B0
  loc_006167E6: push esi
  loc_006167E7: mov [edx+00000004h], ecx
  loc_006167EA: mov ecx, [esi]
  loc_006167EC: mov [edx+00000008h], eax
  loc_006167EF: mov eax, var_A8
  loc_006167F5: mov [edx+0000000Ch], eax
  loc_006167F8: call [ecx+00000314h]
  loc_006167FE: lea edx, var_1C
  loc_00616801: push eax
  loc_00616802: push edx
  loc_00616803: call edi
  loc_00616805: push eax
  loc_00616806: call ebx
  loc_00616808: lea ecx, var_1C
  loc_0061680B: call [004012B0h] ; __vbaFreeObj
  loc_00616811: sub esp, 00000010h
  loc_00616814: mov ecx, 00000003h
  loc_00616819: mov edx, esp
  loc_0061681B: mov var_B4, ecx
  loc_00616821: xor eax, eax
  loc_00616823: push 0000000Bh
  loc_00616825: mov [edx], ecx
  loc_00616827: mov ecx, var_B0
  loc_0061682D: mov var_AC, eax
  loc_00616833: push esi
  loc_00616834: mov [edx+00000004h], ecx
  loc_00616837: mov ecx, [esi]
  loc_00616839: mov [edx+00000008h], eax
  loc_0061683C: mov eax, var_A8
  loc_00616842: mov [edx+0000000Ch], eax
  loc_00616845: call [ecx+00000314h]
  loc_0061684B: lea edx, var_1C
  loc_0061684E: push eax
  loc_0061684F: push edx
  loc_00616850: call edi
  loc_00616852: push eax
  loc_00616853: call ebx
  loc_00616855: lea ecx, var_1C
  loc_00616858: call [004012B0h] ; __vbaFreeObj
  loc_0061685E: sub esp, 00000010h
  loc_00616861: mov ecx, 00000002h
  loc_00616866: mov edx, esp
  loc_00616868: mov var_B4, ecx
  loc_0061686E: mov eax, 00000001h
  loc_00616873: push 00000028h
  loc_00616875: mov [edx], ecx
  loc_00616877: mov ecx, var_B0
  loc_0061687D: mov var_AC, eax
  loc_00616883: push esi
  loc_00616884: mov [edx+00000004h], ecx
  loc_00616887: mov ecx, [esi]
  loc_00616889: mov [edx+00000008h], eax
  loc_0061688C: mov eax, var_A8
  loc_00616892: mov [edx+0000000Ch], eax
  loc_00616895: call [ecx+00000314h]
  loc_0061689B: lea edx, var_1C
  loc_0061689E: push eax
  loc_0061689F: push edx
  loc_006168A0: call edi
  loc_006168A2: push eax
  loc_006168A3: call ebx
  loc_006168A5: lea ecx, var_1C
  loc_006168A8: call [004012B0h] ; __vbaFreeObj
  loc_006168AE: mov eax, var_124
  loc_006168B4: lea edx, var_1C
  loc_006168B7: push edx
  loc_006168B8: mov eax, [eax]
  loc_006168BA: push eax
  loc_006168BB: mov ecx, [eax]
  loc_006168BD: call [ecx+000000B4h]
  loc_006168C3: fnclex
  loc_006168C5: test eax, eax
  loc_006168C7: jge 006168E3h
  loc_006168C9: mov ecx, var_124
  loc_006168CF: push 000000B4h
  loc_006168D4: push 0041E938h
  loc_006168D9: mov edx, [ecx]
  loc_006168DB: push edx
  loc_006168DC: push eax
  loc_006168DD: call [00401074h] ; __vbaHresultCheckObj
  loc_006168E3: lea edx, var_20
  loc_006168E6: mov eax, 00000008h
  loc_006168EB: push edx
  loc_006168EC: mov ecx, var_1C
  loc_006168EF: sub esp, 00000010h
  loc_006168F2: mov var_B4, eax
  loc_006168F8: mov edx, esp
  loc_006168FA: mov var_AC, 0041EDD8h ; "SrNo"
  loc_00616904: mov var_110, ecx
  loc_0061690A: mov ecx, [ecx]
  loc_0061690C: mov [edx], eax
  loc_0061690E: mov eax, var_B0
  loc_00616914: mov [edx+00000004h], eax
  loc_00616917: mov eax, var_AC
  loc_0061691D: mov [edx+00000008h], eax
  loc_00616920: mov eax, var_A8
  loc_00616926: mov [edx+0000000Ch], eax
  loc_00616929: mov edx, var_1C
  loc_0061692C: push edx
  loc_0061692D: call [ecx+00000030h]
  loc_00616930: test eax, eax
  loc_00616932: fnclex
  loc_00616934: jge 0061694Bh
  loc_00616936: mov ecx, var_110
  loc_0061693C: push 00000030h
  loc_0061693E: push 0041EA14h ; "S"
  loc_00616943: push ecx
  loc_00616944: push eax
  loc_00616945: call [00401074h] ; __vbaHresultCheckObj
  loc_0061694B: mov eax, var_20
  loc_0061694E: lea edx, var_34
  loc_00616951: mov var_2C, eax
  loc_00616954: lea eax, var_44
  loc_00616957: push edx
  loc_00616958: push eax
  loc_00616959: mov var_20, 00000000h
  loc_00616960: mov var_34, 00000009h
  loc_00616967: call [004010D4h] ; rtcTrimVar
  loc_0061696D: lea ecx, var_44
  loc_00616970: push ecx
  loc_00616971: call [00401028h] ; __vbaStrVarMove
  loc_00616977: sub esp, 00000010h
  loc_0061697A: mov ecx, 00000008h
  loc_0061697F: mov edx, esp
  loc_00616981: mov var_54, ecx
  loc_00616984: mov var_4C, eax
  loc_00616987: push 00000000h
  loc_00616989: mov [edx], ecx
  loc_0061698B: mov ecx, var_50
  loc_0061698E: push esi
  loc_0061698F: mov [edx+00000004h], ecx
  loc_00616992: mov ecx, [esi]
  loc_00616994: mov [edx+00000008h], eax
  loc_00616997: mov eax, var_48
  loc_0061699A: mov [edx+0000000Ch], eax
  loc_0061699D: call [ecx+00000314h]
  loc_006169A3: lea edx, var_24
  loc_006169A6: push eax
  loc_006169A7: push edx
  loc_006169A8: call edi
  loc_006169AA: push eax
  loc_006169AB: call ebx
  loc_006169AD: lea eax, var_24
  loc_006169B0: lea ecx, var_1C
  loc_006169B3: push eax
  loc_006169B4: push ecx
  loc_006169B5: push 00000002h
  loc_006169B7: call [00401040h] ; __vbaFreeObjList
  loc_006169BD: lea edx, var_54
  loc_006169C0: lea eax, var_44
  loc_006169C3: push edx
  loc_006169C4: lea ecx, var_34
  loc_006169C7: push eax
  loc_006169C8: push ecx
  loc_006169C9: push 00000003h
  loc_006169CB: call [00401038h] ; __vbaFreeVarList
  loc_006169D1: add esp, 0000000Ch
  loc_006169D4: mov ecx, 00000003h
  loc_006169D9: mov edx, esp
  loc_006169DB: mov var_B4, ecx
  loc_006169E1: mov eax, 00000001h
  loc_006169E6: push 0000000Bh
  loc_006169E8: mov [edx], ecx
  loc_006169EA: mov ecx, var_B0
  loc_006169F0: mov var_AC, eax
  loc_006169F6: push esi
  loc_006169F7: mov [edx+00000004h], ecx
  loc_006169FA: mov ecx, [esi]
  loc_006169FC: mov [edx+00000008h], eax
  loc_006169FF: mov eax, var_A8
  loc_00616A05: mov [edx+0000000Ch], eax
  loc_00616A08: call [ecx+00000314h]
  loc_00616A0E: lea edx, var_1C
  loc_00616A11: push eax
  loc_00616A12: push edx
  loc_00616A13: call edi
  loc_00616A15: push eax
  loc_00616A16: call ebx
  loc_00616A18: lea ecx, var_1C
  loc_00616A1B: call [004012B0h] ; __vbaFreeObj
  loc_00616A21: sub esp, 00000010h
  loc_00616A24: mov ecx, 00000002h
  loc_00616A29: mov edx, esp
  loc_00616A2B: mov var_B4, ecx
  loc_00616A31: mov eax, 00000001h
  loc_00616A36: mov [edx], ecx
  loc_00616A38: mov ecx, var_B0
  loc_00616A3E: mov var_AC, eax
  loc_00616A44: mov [edx+00000004h], ecx
  loc_00616A47: mov [edx+00000008h], eax
  loc_00616A4A: mov eax, var_A8
  loc_00616A50: mov ecx, [esi]
  loc_00616A52: push 00000028h
  loc_00616A54: push esi
  loc_00616A55: mov [edx+0000000Ch], eax
  loc_00616A58: call [ecx+00000314h]
  loc_00616A5E: lea edx, var_1C
  loc_00616A61: push eax
  loc_00616A62: push edx
  loc_00616A63: call edi
  loc_00616A65: push eax
  loc_00616A66: call ebx
  loc_00616A68: lea ecx, var_1C
  loc_00616A6B: call [004012B0h] ; __vbaFreeObj
  loc_00616A71: mov eax, var_124
  loc_00616A77: lea edx, var_1C
  loc_00616A7A: push edx
  loc_00616A7B: mov eax, [eax]
  loc_00616A7D: push eax
  loc_00616A7E: mov ecx, [eax]
  loc_00616A80: call [ecx+000000B4h]
  loc_00616A86: test eax, eax
  loc_00616A88: fnclex
  loc_00616A8A: jge 00616AA6h
  loc_00616A8C: mov ecx, var_124
  loc_00616A92: push 000000B4h
  loc_00616A97: push 0041E938h
  loc_00616A9C: mov edx, [ecx]
  loc_00616A9E: push edx
  loc_00616A9F: push eax
  loc_00616AA0: call [00401074h] ; __vbaHresultCheckObj
  loc_00616AA6: lea edx, var_20
  loc_00616AA9: mov eax, 00000008h
  loc_00616AAE: push edx
  loc_00616AAF: mov ecx, var_1C
  loc_00616AB2: sub esp, 00000010h
  loc_00616AB5: mov var_B4, eax
  loc_00616ABB: mov edx, esp
  loc_00616ABD: mov var_AC, 0041EA08h ; "Name"
  loc_00616AC7: mov var_110, ecx
  loc_00616ACD: mov ecx, [ecx]
  loc_00616ACF: mov [edx], eax
  loc_00616AD1: mov eax, var_B0
  loc_00616AD7: mov [edx+00000004h], eax
  loc_00616ADA: mov eax, var_AC
  loc_00616AE0: mov [edx+00000008h], eax
  loc_00616AE3: mov eax, var_A8
  loc_00616AE9: mov [edx+0000000Ch], eax
  loc_00616AEC: mov edx, var_1C
  loc_00616AEF: push edx
  loc_00616AF0: call [ecx+00000030h]
  loc_00616AF3: test eax, eax
  loc_00616AF5: fnclex
  loc_00616AF7: jge 00616B0Eh
  loc_00616AF9: mov ecx, var_110
  loc_00616AFF: push 00000030h
  loc_00616B01: push 0041EA14h ; "S"
  loc_00616B06: push ecx
  loc_00616B07: push eax
  loc_00616B08: call [00401074h] ; __vbaHresultCheckObj
  loc_00616B0E: mov eax, var_20
  loc_00616B11: lea edx, var_34
  loc_00616B14: mov var_2C, eax
  loc_00616B17: lea eax, var_44
  loc_00616B1A: push edx
  loc_00616B1B: push eax
  loc_00616B1C: mov var_20, 00000000h
  loc_00616B23: mov var_34, 00000009h
  loc_00616B2A: call [004010D4h] ; rtcTrimVar
  loc_00616B30: lea ecx, var_44
  loc_00616B33: push ecx
  loc_00616B34: call [00401028h] ; __vbaStrVarMove
  loc_00616B3A: sub esp, 00000010h
  loc_00616B3D: mov ecx, 00000008h
  loc_00616B42: mov edx, esp
  loc_00616B44: mov var_54, ecx
  loc_00616B47: mov var_4C, eax
  loc_00616B4A: push 00000000h
  loc_00616B4C: mov [edx], ecx
  loc_00616B4E: mov ecx, var_50
  loc_00616B51: push esi
  loc_00616B52: mov [edx+00000004h], ecx
  loc_00616B55: mov ecx, [esi]
  loc_00616B57: mov [edx+00000008h], eax
  loc_00616B5A: mov eax, var_48
  loc_00616B5D: mov [edx+0000000Ch], eax
  loc_00616B60: call [ecx+00000314h]
  loc_00616B66: lea edx, var_24
  loc_00616B69: push eax
  loc_00616B6A: push edx
  loc_00616B6B: call edi
  loc_00616B6D: push eax
  loc_00616B6E: call ebx
  loc_00616B70: lea eax, var_24
  loc_00616B73: lea ecx, var_1C
  loc_00616B76: push eax
  loc_00616B77: push ecx
  loc_00616B78: push 00000002h
  loc_00616B7A: call [00401040h] ; __vbaFreeObjList
  loc_00616B80: lea edx, var_54
  loc_00616B83: lea eax, var_44
  loc_00616B86: push edx
  loc_00616B87: lea ecx, var_34
  loc_00616B8A: push eax
  loc_00616B8B: push ecx
  loc_00616B8C: push 00000003h
  loc_00616B8E: call [00401038h] ; __vbaFreeVarList
  loc_00616B94: mov edx, [esi]
  loc_00616B96: add esp, 0000001Ch
  loc_00616B99: push 00000000h
  loc_00616B9B: push 00000004h
  loc_00616B9D: push esi
  loc_00616B9E: call [edx+00000314h]
  loc_00616BA4: push eax
  loc_00616BA5: lea eax, var_1C
  loc_00616BA8: push eax
  loc_00616BA9: call edi
  loc_00616BAB: lea ecx, var_34
  loc_00616BAE: push eax
  loc_00616BAF: push ecx
  loc_00616BB0: call [00401140h] ; __vbaLateIdCallLd
  loc_00616BB6: add esp, 00000010h
  loc_00616BB9: push eax
  loc_00616BBA: call [0040121Ch] ; __vbaI4Var
  loc_00616BC0: add eax, 00000001h
  loc_00616BC3: mov ecx, 00000003h
  loc_00616BC8: jo 00616D31h
  loc_00616BCE: sub esp, 00000010h
  loc_00616BD1: mov var_B4, ecx
  loc_00616BD7: mov edx, esp
  loc_00616BD9: mov var_AC, eax
  loc_00616BDF: push 00000004h
  loc_00616BE1: push esi
  loc_00616BE2: mov [edx], ecx
  loc_00616BE4: mov ecx, var_B0
  loc_00616BEA: mov [edx+00000004h], ecx
  loc_00616BED: mov ecx, [esi]
  loc_00616BEF: mov [edx+00000008h], eax
  loc_00616BF2: mov eax, var_A8
  loc_00616BF8: mov [edx+0000000Ch], eax
  loc_00616BFB: call [ecx+00000314h]
  loc_00616C01: lea edx, var_20
  loc_00616C04: push eax
  loc_00616C05: push edx
  loc_00616C06: call edi
  loc_00616C08: push eax
  loc_00616C09: call ebx
  loc_00616C0B: lea eax, var_20
  loc_00616C0E: lea ecx, var_1C
  loc_00616C11: push eax
  loc_00616C12: push ecx
  loc_00616C13: push 00000002h
  loc_00616C15: call [00401040h] ; __vbaFreeObjList
  loc_00616C1B: add esp, 0000000Ch
  loc_00616C1E: lea ecx, var_34
  loc_00616C21: call [00401020h] ; __vbaFreeVar
  loc_00616C27: mov eax, var_124
  loc_00616C2D: mov dx, var_14
  loc_00616C31: add dx, 0001h
  loc_00616C35: mov eax, [eax]
  loc_00616C37: jo 00616D31h
  loc_00616C3D: mov ecx, [eax]
  loc_00616C3F: push eax
  loc_00616C40: mov var_14, edx
  loc_00616C43: call [ecx+000000ECh]
  loc_00616C49: test eax, eax
  loc_00616C4B: fnclex
  loc_00616C4D: jge 00616782h
  loc_00616C53: mov edx, var_124
  loc_00616C59: push 000000ECh
  loc_00616C5E: push 0041E938h
  loc_00616C63: mov ecx, [edx]
  loc_00616C65: push ecx
  loc_00616C66: push eax
  loc_00616C67: call [00401074h] ; __vbaHresultCheckObj
  loc_00616C6D: jmp 00616782h
  loc_00616C72: mov esi, var_124
  loc_00616C78: mov eax, [esi]
  loc_00616C7A: push eax
  loc_00616C7B: mov edx, [eax]
  loc_00616C7D: call [edx+000000C4h]
  loc_00616C83: test eax, eax
  loc_00616C85: fnclex
  loc_00616C87: jge 00616C9Dh
  loc_00616C89: mov ecx, [esi]
  loc_00616C8B: push 000000C4h
  loc_00616C90: push 0041E938h
  loc_00616C95: push ecx
  loc_00616C96: push eax
  loc_00616C97: call [00401074h] ; __vbaHresultCheckObj
  loc_00616C9D: push 0041E938h
  loc_00616CA2: push 00000000h
  loc_00616CA4: call [00401274h] ; __vbaCastObj
  loc_00616CAA: lea edx, var_1C
  loc_00616CAD: push eax
  loc_00616CAE: push edx
  loc_00616CAF: call edi
  loc_00616CB1: push eax
  loc_00616CB2: push esi
  loc_00616CB3: call [004010B8h] ; __vbaObjSetAddref
  loc_00616CB9: lea ecx, var_1C
  loc_00616CBC: call [004012B0h] ; __vbaFreeObj
  loc_00616CC2: push 00616D1Ch
  loc_00616CC7: jmp 00616D1Bh
  loc_00616CC9: lea ecx, var_18
  loc_00616CCC: call [004012ACh] ; __vbaFreeStr
  loc_00616CD2: lea eax, var_24
  loc_00616CD5: lea ecx, var_20
  loc_00616CD8: push eax
  loc_00616CD9: lea edx, var_1C
  loc_00616CDC: push ecx
  loc_00616CDD: push edx
  loc_00616CDE: push 00000003h
  loc_00616CE0: call [00401040h] ; __vbaFreeObjList
  loc_00616CE6: lea eax, var_A4
  loc_00616CEC: lea ecx, var_94
  loc_00616CF2: push eax
  loc_00616CF3: lea edx, var_84
  loc_00616CF9: push ecx
  loc_00616CFA: lea eax, var_74
  loc_00616CFD: push edx
  loc_00616CFE: lea ecx, var_64
  loc_00616D01: push eax
  loc_00616D02: lea edx, var_54
  loc_00616D05: push ecx
  loc_00616D06: lea eax, var_44
  loc_00616D09: push edx
  loc_00616D0A: lea ecx, var_34
  loc_00616D0D: push eax
  loc_00616D0E: push ecx
  loc_00616D0F: push 00000008h
  loc_00616D11: call [00401038h] ; __vbaFreeVarList
  loc_00616D17: add esp, 00000034h
  loc_00616D1A: ret
  loc_00616D1B: ret
  loc_00616D1C: mov ecx, var_10
  loc_00616D1F: pop edi
  loc_00616D20: pop esi
  loc_00616D21: xor eax, eax
  loc_00616D23: mov fs:[00000000h], ecx
  loc_00616D2A: pop ebx
  loc_00616D2B: mov esp, ebp
  loc_00616D2D: pop ebp
  loc_00616D2E: retn 0004h
End Sub

Private Function Proc_38_10_617220(arg_14) '617220
  loc_00617220: push ebp
  loc_00617221: mov ebp, esp
  loc_00617223: sub esp, 00000008h
  loc_00617226: push 00403B36h ; __vbaExceptHandler
  loc_0061722B: mov eax, fs:[00000000h]
  loc_00617231: push eax
  loc_00617232: mov fs:[00000000h], esp
  loc_00617239: sub esp, 00000008h
  loc_0061723C: push ebx
  loc_0061723D: push esi
  loc_0061723E: push edi
  loc_0061723F: mov var_8, esp
  loc_00617242: mov var_4, 00403AA0h
  loc_00617249: mov edx, arg_14
  loc_0061724C: lea ecx, var_14
  loc_0061724F: mov var_14, 00000000h
  loc_00617256: call [004011ECh] ; __vbaStrCopy
  loc_0061725C: push 0061726Bh
  loc_00617261: lea ecx, var_14
  loc_00617264: call [004012ACh] ; __vbaFreeStr
  loc_0061726A: ret
  loc_0061726B: mov ecx, var_10
  loc_0061726E: pop edi
  loc_0061726F: pop esi
  loc_00617270: xor eax, eax
  loc_00617272: mov fs:[00000000h], ecx
  loc_00617279: pop ebx
  loc_0061727A: mov esp, ebp
  loc_0061727C: pop ebp
  loc_0061727D: retn 0014h
End Function

Private Function Proc_38_11_617280() '617280
  loc_00617280: xor eax, eax
  loc_00617282: retn 0008h
End Function
