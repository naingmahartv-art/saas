VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Begin VB.Form frmNotBuy
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  KeyPreview = -1  'True
  ClipControls = 0   'False
  ClientLeft = 255
  ClientTop = 1410
  ClientWidth = 3930
  ClientHeight = 7140
  ShowInTaskbar = 0   'False
  StartUpPosition = 1 'CenterOwner
  Begin VB.CommandButton cmdExit
    Caption = "E&xit ( F4 )"
    Left = 2745
    Top = 6525
    Width = 960
    Height = 360
    TabIndex = 5
  End
  Begin MSFlexGridLib.MSFlexGrid Grid
    Left = 315
    Top = 1035
    Width = 2355
    Height = 5865
    TabIndex = 2
    OleObjectBlob = "frmNotBuy.frx":0000
  End
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmNotBuy.frx":00E4
    Left = -90
    Top = 1305
  End
  Begin VB.TextBox txtNum
    Left = 1380
    Top = 495
    Width = 1245
    Height = 360
    TabIndex = 0
    MaxLength = 50
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
  Begin VB.CommandButton cmdSave
    Caption = "&Save ( F1 )"
    Left = 2700
    Top = 495
    Width = 960
    Height = 360
    TabIndex = 1
  End
  Begin VB.Label lblTitle
    Caption = "NOT SALE"
    BackColor = &H40&
    ForeColor = &HFFFF&
    Left = 0
    Top = 0
    Width = 3975
    Height = 285
    TabIndex = 4
    Alignment = 2 'Center
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
  Begin VB.Label lblDesc
    Caption = "Not Sale Num#"
    Left = 270
    Top = 540
    Width = 1125
    Height = 240
    TabIndex = 3
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
  Begin VB.Menu mnuAdmin
    Visible = 0   'False
    Caption = "Admin"
    Begin VB.Menu mnuDeleteNum
      Caption = "Delete Num"
    End
  End
End

Attribute VB_Name = "frmNotBuy"


Private Sub Form_Load() '607C70
  loc_00607C70: push ebp
  loc_00607C71: mov ebp, esp
  loc_00607C73: sub esp, 0000000Ch
  loc_00607C76: push 00403B36h ; __vbaExceptHandler
  loc_00607C7B: mov eax, fs:[00000000h]
  loc_00607C81: push eax
  loc_00607C82: mov fs:[00000000h], esp
  loc_00607C89: sub esp, 0000004Ch
  loc_00607C8C: push ebx
  loc_00607C8D: push esi
  loc_00607C8E: push edi
  loc_00607C8F: mov var_C, esp
  loc_00607C92: mov var_8, 00403638h
  loc_00607C99: mov esi, Me
  loc_00607C9C: mov eax, esi
  loc_00607C9E: and eax, 00000001h
  loc_00607CA1: mov var_4, eax
  loc_00607CA4: and esi, FFFFFFFEh
  loc_00607CA7: push esi
  loc_00607CA8: mov Me, esi
  loc_00607CAB: mov ecx, [esi]
  loc_00607CAD: call [ecx+00000004h]
  loc_00607CB0: sub esp, 00000010h
  loc_00607CB3: mov ecx, 00000003h
  loc_00607CB8: mov ebx, esp
  loc_00607CBA: mov edi, ecx
  loc_00607CBC: xor eax, eax
  loc_00607CBE: sub esp, 00000010h
  loc_00607CC1: mov [ebx], ecx
  loc_00607CC3: mov ecx, var_24
  loc_00607CC6: mov var_18, eax
  loc_00607CC9: mov edx, 00000898h
  loc_00607CCE: mov [ebx+00000004h], ecx
  loc_00607CD1: mov ecx, esp
  loc_00607CD3: push 00000001h
  loc_00607CD5: push 00000039h
  loc_00607CD7: mov [ebx+00000008h], eax
  loc_00607CDA: mov eax, var_1C
  loc_00607CDD: push esi
  loc_00607CDE: mov [esi+00000034h], FFFFFFh
  loc_00607CE4: mov [ebx+0000000Ch], eax
  loc_00607CE7: mov eax, var_44
  loc_00607CEA: mov [ecx], edi
  loc_00607CEC: mov [ecx+00000004h], eax
  loc_00607CEF: mov eax, [esi]
  loc_00607CF1: mov [ecx+00000008h], edx
  loc_00607CF4: mov edx, var_3C
  loc_00607CF7: mov [ecx+0000000Ch], edx
  loc_00607CFA: call [eax+00000318h]
  loc_00607D00: lea ecx, var_18
  loc_00607D03: push eax
  loc_00607D04: push ecx
  loc_00607D05: call [004010A0h] ; __vbaObjSet
  loc_00607D0B: push eax
  loc_00607D0C: call [00401160h] ; __vbaLateIdCallSt
  loc_00607D12: add esp, 0000002Ch
  loc_00607D15: lea ecx, var_18
  loc_00607D18: call [004012B0h] ; __vbaFreeObj
  loc_00607D1E: mov edx, [esi]
  loc_00607D20: push esi
  loc_00607D21: call [edx+00000708h]
  loc_00607D27: mov var_4, 00000000h
  loc_00607D2E: push 00607D40h
  loc_00607D33: jmp 00607D3Fh
  loc_00607D35: lea ecx, var_18
  loc_00607D38: call [004012B0h] ; __vbaFreeObj
  loc_00607D3E: ret
  loc_00607D3F: ret
  loc_00607D40: mov eax, Me
  loc_00607D43: push eax
  loc_00607D44: mov ecx, [eax]
  loc_00607D46: call [ecx+00000008h]
  loc_00607D49: mov eax, var_4
  loc_00607D4C: mov ecx, var_14
  loc_00607D4F: pop edi
  loc_00607D50: pop esi
  loc_00607D51: mov fs:[00000000h], ecx
  loc_00607D58: pop ebx
  loc_00607D59: mov esp, ebp
  loc_00607D5B: pop ebp
  loc_00607D5C: retn 0004h
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer) '607B50
  loc_00607B50: push ebp
  loc_00607B51: mov ebp, esp
  loc_00607B53: sub esp, 0000000Ch
  loc_00607B56: push 00403B36h ; __vbaExceptHandler
  loc_00607B5B: mov eax, fs:[00000000h]
  loc_00607B61: push eax
  loc_00607B62: mov fs:[00000000h], esp
  loc_00607B69: sub esp, 00000018h
  loc_00607B6C: push ebx
  loc_00607B6D: push esi
  loc_00607B6E: push edi
  loc_00607B6F: mov var_C, esp
  loc_00607B72: mov var_8, 00403628h
  loc_00607B79: mov esi, Me
  loc_00607B7C: mov eax, esi
  loc_00607B7E: and eax, 00000001h
  loc_00607B81: mov var_4, eax
  loc_00607B84: and esi, FFFFFFFEh
  loc_00607B87: push esi
  loc_00607B88: mov Me, esi
  loc_00607B8B: mov ecx, [esi]
  loc_00607B8D: call [ecx+00000004h]
  loc_00607B90: mov edx, KeyCode
  loc_00607B93: mov ebx, [00401124h] ; __vbaI2I4
  loc_00607B99: mov ecx, 00000070h
  loc_00607B9E: mov var_18, 00000000h
  loc_00607BA5: mov di, [edx]
  loc_00607BA8: call ebx
  loc_00607BAA: cmp di, ax
  loc_00607BAD: jnz 00607BD0h
  loc_00607BAF: mov eax, [esi]
  loc_00607BB1: push esi
  loc_00607BB2: call [eax+000006FCh]
  loc_00607BB8: test eax, eax
  loc_00607BBA: jge 00607C2Bh
  loc_00607BBC: push 000006FCh
  loc_00607BC1: push 00427918h
  loc_00607BC6: push esi
  loc_00607BC7: push eax
  loc_00607BC8: call [00401074h] ; __vbaHresultCheckObj
  loc_00607BCE: jmp 00607C2Bh
  loc_00607BD0: mov ecx, 00000073h
  loc_00607BD5: call ebx
  loc_00607BD7: cmp di, ax
  loc_00607BDA: jnz 00607C2Bh
  loc_00607BDC: mov eax, [0061B394h]
  loc_00607BE1: test eax, eax
  loc_00607BE3: jnz 00607BF5h
  loc_00607BE5: push 0061B394h
  loc_00607BEA: push 0041E4A0h
  loc_00607BEF: call [004011DCh] ; __vbaNew2
  loc_00607BF5: mov edi, [0061B394h]
  loc_00607BFB: lea ecx, var_18
  loc_00607BFE: push esi
  loc_00607BFF: push ecx
  loc_00607C00: mov ebx, [edi]
  loc_00607C02: call [004010B8h] ; __vbaObjSetAddref
  loc_00607C08: push eax
  loc_00607C09: push edi
  loc_00607C0A: call [ebx+00000010h]
  loc_00607C0D: test eax, eax
  loc_00607C0F: fnclex
  loc_00607C11: jge 00607C22h
  loc_00607C13: push 00000010h
  loc_00607C15: push 0041E490h
  loc_00607C1A: push edi
  loc_00607C1B: push eax
  loc_00607C1C: call [00401074h] ; __vbaHresultCheckObj
  loc_00607C22: lea ecx, var_18
  loc_00607C25: call [004012B0h] ; __vbaFreeObj
  loc_00607C2B: mov var_4, 00000000h
  loc_00607C32: push 00607C44h
  loc_00607C37: jmp 00607C43h
  loc_00607C39: lea ecx, var_18
  loc_00607C3C: call [004012B0h] ; __vbaFreeObj
  loc_00607C42: ret
  loc_00607C43: ret
  loc_00607C44: mov eax, Me
  loc_00607C47: push eax
  loc_00607C48: mov edx, [eax]
  loc_00607C4A: call [edx+00000008h]
  loc_00607C4D: mov eax, var_4
  loc_00607C50: mov ecx, var_14
  loc_00607C53: pop edi
  loc_00607C54: pop esi
  loc_00607C55: mov fs:[00000000h], ecx
  loc_00607C5C: pop ebx
  loc_00607C5D: mov esp, ebp
  loc_00607C5F: pop ebp
  loc_00607C60: retn 000Ch
End Sub

Private Sub mnuDeleteNum_Click() '6084B0
  loc_006084B0: push ebp
  loc_006084B1: mov ebp, esp
  loc_006084B3: sub esp, 0000000Ch
  loc_006084B6: push 00403B36h ; __vbaExceptHandler
  loc_006084BB: mov eax, fs:[00000000h]
  loc_006084C1: push eax
  loc_006084C2: mov fs:[00000000h], esp
  loc_006084C9: sub esp, 00000118h
  loc_006084CF: push ebx
  loc_006084D0: push esi
  loc_006084D1: push edi
  loc_006084D2: mov var_C, esp
  loc_006084D5: mov var_8, 004036A8h
  loc_006084DC: mov esi, Me
  loc_006084DF: mov eax, esi
  loc_006084E1: and eax, 00000001h
  loc_006084E4: mov var_4, eax
  loc_006084E7: and esi, FFFFFFFEh
  loc_006084EA: push esi
  loc_006084EB: mov Me, esi
  loc_006084EE: mov ecx, [esi]
  loc_006084F0: call [ecx+00000004h]
  loc_006084F3: mov edx, [esi]
  loc_006084F5: xor ebx, ebx
  loc_006084F7: push ebx
  loc_006084F8: push 0000000Ah
  loc_006084FA: push esi
  loc_006084FB: mov var_18, ebx
  loc_006084FE: mov var_1C, ebx
  loc_00608501: mov var_20, ebx
  loc_00608504: mov var_30, ebx
  loc_00608507: mov var_40, ebx
  loc_0060850A: mov var_50, ebx
  loc_0060850D: mov var_60, ebx
  loc_00608510: mov var_70, ebx
  loc_00608513: mov var_80, ebx
  loc_00608516: mov var_90, ebx
  loc_0060851C: mov var_A0, ebx
  loc_00608522: mov var_F0, ebx
  loc_00608528: call [edx+00000318h]
  loc_0060852E: push eax
  loc_0060852F: lea eax, var_1C
  loc_00608532: push eax
  loc_00608533: call [004010A0h] ; __vbaObjSet
  loc_00608539: lea ecx, var_30
  loc_0060853C: push eax
  loc_0060853D: push ecx
  loc_0060853E: call [00401140h] ; __vbaLateIdCallLd
  loc_00608544: add esp, 00000010h
  loc_00608547: push eax
  loc_00608548: call [0040121Ch] ; __vbaI4Var
  loc_0060854E: sub esp, 00000010h
  loc_00608551: mov ecx, 00000003h
  loc_00608556: mov edx, esp
  loc_00608558: sub esp, 00000010h
  loc_0060855B: mov [edx], ecx
  loc_0060855D: mov ecx, var_AC
  loc_00608563: mov [edx+00000004h], ecx
  loc_00608566: mov ecx, esp
  loc_00608568: push 00000002h
  loc_0060856A: push 00000041h
  loc_0060856C: mov [edx+00000008h], eax
  loc_0060856F: mov eax, var_A4
  loc_00608575: push esi
  loc_00608576: mov [edx+0000000Ch], eax
  loc_00608579: mov edx, var_CC
  loc_0060857F: mov eax, 00000003h
  loc_00608584: mov [ecx], eax
  loc_00608586: mov eax, var_C4
  loc_0060858C: mov [ecx+00000004h], edx
  loc_0060858F: mov [ecx+00000008h], ebx
  loc_00608592: mov [ecx+0000000Ch], eax
  loc_00608595: mov ecx, [esi]
  loc_00608597: call [ecx+00000318h]
  loc_0060859D: lea edx, var_20
  loc_006085A0: push eax
  loc_006085A1: push edx
  loc_006085A2: call [004010A0h] ; __vbaObjSet
  loc_006085A8: push eax
  loc_006085A9: lea eax, var_40
  loc_006085AC: push eax
  loc_006085AD: call [00401140h] ; __vbaLateIdCallLd
  loc_006085B3: add esp, 00000030h
  loc_006085B6: push eax
  loc_006085B7: call [00401028h] ; __vbaStrVarMove
  loc_006085BD: mov edx, eax
  loc_006085BF: lea ecx, var_18
  loc_006085C2: call [00401270h] ; __vbaStrMove
  loc_006085C8: push eax
  loc_006085C9: push 0041E5D4h
  loc_006085CE: call [0040110Ch] ; __vbaStrCmp
  loc_006085D4: mov edi, eax
  loc_006085D6: lea ecx, var_18
  loc_006085D9: neg edi
  loc_006085DB: sbb edi, edi
  loc_006085DD: neg edi
  loc_006085DF: neg edi
  loc_006085E1: call [004012ACh] ; __vbaFreeStr
  loc_006085E7: lea ecx, var_20
  loc_006085EA: lea edx, var_1C
  loc_006085ED: push ecx
  loc_006085EE: push edx
  loc_006085EF: push 00000002h
  loc_006085F1: call [00401040h] ; __vbaFreeObjList
  loc_006085F7: lea eax, var_40
  loc_006085FA: lea ecx, var_30
  loc_006085FD: push eax
  loc_006085FE: push ecx
  loc_006085FF: push 00000002h
  loc_00608601: call [00401038h] ; __vbaFreeVarList
  loc_00608607: add esp, 00000018h
  loc_0060860A: cmp di, bx
  loc_0060860D: jz 00608828h
  loc_00608613: mov edx, [esi]
  loc_00608615: push ebx
  loc_00608616: push 0000000Ah
  loc_00608618: push esi
  loc_00608619: call [edx+00000318h]
  loc_0060861F: mov edi, [004010A0h] ; __vbaObjSet
  loc_00608625: push eax
  loc_00608626: lea eax, var_1C
  loc_00608629: push eax
  loc_0060862A: call edi
  loc_0060862C: lea ecx, var_30
  loc_0060862F: push eax
  loc_00608630: push ecx
  loc_00608631: call [00401140h] ; __vbaLateIdCallLd
  loc_00608637: add esp, 00000010h
  loc_0060863A: push eax
  loc_0060863B: call [0040121Ch] ; __vbaI4Var
  loc_00608641: sub esp, 00000010h
  loc_00608644: mov ecx, 00000003h
  loc_00608649: mov edx, esp
  loc_0060864B: mov var_D0, ecx
  loc_00608651: sub esp, 00000010h
  loc_00608654: mov [edx], ecx
  loc_00608656: mov ecx, var_AC
  loc_0060865C: mov [edx+00000004h], ecx
  loc_0060865F: mov ecx, esp
  loc_00608661: push 00000002h
  loc_00608663: push 00000041h
  loc_00608665: mov [edx+00000008h], eax
  loc_00608668: mov eax, var_A4
  loc_0060866E: push esi
  loc_0060866F: mov [edx+0000000Ch], eax
  loc_00608672: mov edx, var_D0
  loc_00608678: mov eax, var_CC
  loc_0060867E: mov [ecx], edx
  loc_00608680: mov edx, var_C4
  loc_00608686: mov [ecx+00000004h], eax
  loc_00608689: xor eax, eax
  loc_0060868B: mov [ecx+00000008h], eax
  loc_0060868E: mov eax, [esi]
  loc_00608690: mov [ecx+0000000Ch], edx
  loc_00608693: call [eax+00000318h]
  loc_00608699: lea ecx, var_20
  loc_0060869C: push eax
  loc_0060869D: push ecx
  loc_0060869E: call edi
  loc_006086A0: lea edx, var_40
  loc_006086A3: push eax
  loc_006086A4: push edx
  loc_006086A5: call [00401140h] ; __vbaLateIdCallLd
  loc_006086AB: add esp, 00000030h
  loc_006086AE: push eax
  loc_006086AF: call [00401028h] ; __vbaStrVarMove
  loc_006086B5: mov var_48, eax
  loc_006086B8: lea eax, var_50
  loc_006086BB: lea ecx, var_60
  loc_006086BE: push eax
  loc_006086BF: push ecx
  loc_006086C0: mov var_50, 00000008h
  loc_006086C7: call [004010D4h] ; rtcTrimVar
  loc_006086CD: mov eax, 80020004h
  loc_006086D2: mov ecx, 0000000Ah
  loc_006086D7: mov var_98, eax
  loc_006086DD: mov var_88, eax
  loc_006086E3: mov var_78, eax
  loc_006086E6: lea edx, var_A0
  loc_006086EC: mov var_A0, ecx
  loc_006086F2: mov var_90, ecx
  loc_006086F8: mov var_80, ecx
  loc_006086FB: lea eax, var_90
  loc_00608701: push edx
  loc_00608702: lea ecx, var_80
  loc_00608705: push eax
  loc_00608706: push ecx
  loc_00608707: lea edx, var_F0
  loc_0060870D: push 00000134h
  loc_00608712: lea eax, var_60
  loc_00608715: push edx
  loc_00608716: mov var_E8, 00432C40h ; "Are you sure to delete ? "
  loc_00608720: mov var_F0, 00000008h
  loc_0060872A: push eax
  loc_0060872B: lea ecx, var_70
  loc_0060872E: push ecx
  loc_0060872F: call [004011B4h] ; __vbaVarCat
  loc_00608735: push eax
  loc_00608736: call [004010A4h] ; rtcMsgBox
  loc_0060873C: xor edx, edx
  loc_0060873E: cmp eax, 00000006h
  loc_00608741: lea eax, var_20
  loc_00608744: lea ecx, var_1C
  loc_00608747: setz dl
  loc_0060874A: push eax
  loc_0060874B: push ecx
  loc_0060874C: neg edx
  loc_0060874E: push 00000002h
  loc_00608750: mov var_124, edx
  loc_00608756: call [00401040h] ; __vbaFreeObjList
  loc_0060875C: lea edx, var_A0
  loc_00608762: lea eax, var_90
  loc_00608768: push edx
  loc_00608769: lea ecx, var_80
  loc_0060876C: push eax
  loc_0060876D: lea edx, var_70
  loc_00608770: push ecx
  loc_00608771: lea eax, var_60
  loc_00608774: push edx
  loc_00608775: lea ecx, var_50
  loc_00608778: push eax
  loc_00608779: lea edx, var_40
  loc_0060877C: push ecx
  loc_0060877D: lea eax, var_30
  loc_00608780: push edx
  loc_00608781: push eax
  loc_00608782: push 00000008h
  loc_00608784: call [00401038h] ; __vbaFreeVarList
  loc_0060878A: add esp, 00000030h
  loc_0060878D: cmp var_124, bx
  loc_00608794: jz 00608828h
  loc_0060879A: mov ecx, [esi]
  loc_0060879C: push ebx
  loc_0060879D: push 0000000Ah
  loc_0060879F: push esi
  loc_006087A0: call [ecx+00000318h]
  loc_006087A6: lea edx, var_1C
  loc_006087A9: push eax
  loc_006087AA: push edx
  loc_006087AB: call edi
  loc_006087AD: push eax
  loc_006087AE: lea eax, var_30
  loc_006087B1: push eax
  loc_006087B2: call [00401140h] ; __vbaLateIdCallLd
  loc_006087B8: add esp, 00000010h
  loc_006087BB: push eax
  loc_006087BC: call [0040121Ch] ; __vbaI4Var
  loc_006087C2: sub esp, 00000010h
  loc_006087C5: mov ecx, 00000003h
  loc_006087CA: mov edx, esp
  loc_006087CC: push 00000001h
  loc_006087CE: push 00000043h
  loc_006087D0: mov [edx], ecx
  loc_006087D2: mov ecx, var_AC
  loc_006087D8: push esi
  loc_006087D9: mov [edx+00000004h], ecx
  loc_006087DC: mov ecx, [esi]
  loc_006087DE: mov [edx+00000008h], eax
  loc_006087E1: mov eax, var_A4
  loc_006087E7: mov [edx+0000000Ch], eax
  loc_006087EA: call [ecx+00000318h]
  loc_006087F0: lea edx, var_20
  loc_006087F3: push eax
  loc_006087F4: push edx
  loc_006087F5: call edi
  loc_006087F7: push eax
  loc_006087F8: call [00401024h] ; __vbaLateIdCall
  loc_006087FE: lea eax, var_20
  loc_00608801: lea ecx, var_1C
  loc_00608804: push eax
  loc_00608805: push ecx
  loc_00608806: push 00000002h
  loc_00608808: call [00401040h] ; __vbaFreeObjList
  loc_0060880E: add esp, 00000028h
  loc_00608811: lea ecx, var_30
  loc_00608814: call [00401020h] ; __vbaFreeVar
  loc_0060881A: mov dx, [esi+00000034h]
  loc_0060881E: sub dx, 0001h
  loc_00608822: jo 0060889Dh
  loc_00608824: mov [esi+00000034h], dx
  loc_00608828: mov var_4, ebx
  loc_0060882B: push 0060887Eh
  loc_00608830: jmp 0060887Dh
  loc_00608832: lea ecx, var_18
  loc_00608835: call [004012ACh] ; __vbaFreeStr
  loc_0060883B: lea eax, var_20
  loc_0060883E: lea ecx, var_1C
  loc_00608841: push eax
  loc_00608842: push ecx
  loc_00608843: push 00000002h
  loc_00608845: call [00401040h] ; __vbaFreeObjList
  loc_0060884B: lea edx, var_A0
  loc_00608851: lea eax, var_90
  loc_00608857: push edx
  loc_00608858: lea ecx, var_80
  loc_0060885B: push eax
  loc_0060885C: lea edx, var_70
  loc_0060885F: push ecx
  loc_00608860: lea eax, var_60
  loc_00608863: push edx
  loc_00608864: lea ecx, var_50
  loc_00608867: push eax
  loc_00608868: lea edx, var_40
  loc_0060886B: push ecx
  loc_0060886C: lea eax, var_30
  loc_0060886F: push edx
  loc_00608870: push eax
  loc_00608871: push 00000008h
  loc_00608873: call [00401038h] ; __vbaFreeVarList
  loc_00608879: add esp, 00000030h
  loc_0060887C: ret
  loc_0060887D: ret
  loc_0060887E: mov eax, Me
  loc_00608881: push eax
  loc_00608882: mov ecx, [eax]
  loc_00608884: call [ecx+00000008h]
  loc_00608887: mov eax, var_4
  loc_0060888A: mov ecx, var_14
  loc_0060888D: pop edi
  loc_0060888E: pop esi
  loc_0060888F: mov fs:[00000000h], ecx
  loc_00608896: pop ebx
  loc_00608897: mov esp, ebp
  loc_00608899: pop ebp
  loc_0060889A: retn 0004h
End Sub

Private Sub Grid_MouseDown(Button As Integer, Shift As Integer, x As OLE_XPOS_PIXELS, y As OLE_YPOS_PIXELS) '608360
  loc_00608360: push ebp
  loc_00608361: mov ebp, esp
  loc_00608363: sub esp, 0000000Ch
  loc_00608366: push 00403B36h ; __vbaExceptHandler
  loc_0060836B: mov eax, fs:[00000000h]
  loc_00608371: push eax
  loc_00608372: mov fs:[00000000h], esp
  loc_00608379: sub esp, 00000050h
  loc_0060837C: push ebx
  loc_0060837D: push esi
  loc_0060837E: push edi
  loc_0060837F: mov var_C, esp
  loc_00608382: mov var_8, 00403698h
  loc_00608389: mov esi, Me
  loc_0060838C: mov eax, esi
  loc_0060838E: and eax, 00000001h
  loc_00608391: mov var_4, eax
  loc_00608394: and esi, FFFFFFFEh
  loc_00608397: push esi
  loc_00608398: mov Me, esi
  loc_0060839B: mov ecx, [esi]
  loc_0060839D: call [ecx+00000004h]
  loc_006083A0: mov edx, Button
  loc_006083A3: xor edi, edi
  loc_006083A5: mov var_18, edi
  loc_006083A8: mov var_28, edi
  loc_006083AB: cmp [edx], 0002h
  loc_006083AF: mov var_38, edi
  loc_006083B2: mov var_48, edi
  loc_006083B5: mov var_58, edi
  loc_006083B8: jnz 0060847Ch
  loc_006083BE: sub esp, 00000010h
  loc_006083C1: mov ecx, 0000000Ah
  loc_006083C6: mov ebx, esp
  loc_006083C8: mov var_28, ecx
  loc_006083CB: mov edx, 80020004h
  loc_006083D0: sub esp, 00000010h
  loc_006083D3: mov [ebx], ecx
  loc_006083D5: mov ecx, var_54
  loc_006083D8: mov eax, edx
  loc_006083DA: mov var_20, edx
  loc_006083DD: mov [ebx+00000004h], ecx
  loc_006083E0: mov ecx, esp
  loc_006083E2: sub esp, 00000010h
  loc_006083E5: mov edi, [esi]
  loc_006083E7: mov [ebx+00000008h], eax
  loc_006083EA: mov eax, var_4C
  loc_006083ED: mov [ebx+0000000Ch], eax
  loc_006083F0: mov eax, 0000000Ah
  loc_006083F5: mov [ecx], eax
  loc_006083F7: mov eax, var_44
  loc_006083FA: mov [ecx+00000004h], eax
  loc_006083FD: mov eax, 0000000Ah
  loc_00608402: mov [ecx+00000008h], edx
  loc_00608405: mov edx, var_3C
  loc_00608408: mov [ecx+0000000Ch], edx
  loc_0060840B: mov edx, var_34
  loc_0060840E: mov ecx, esp
  loc_00608410: sub esp, 00000010h
  loc_00608413: mov [ecx], eax
  loc_00608415: mov eax, 80020004h
  loc_0060841A: mov [ecx+00000004h], edx
  loc_0060841D: mov edx, var_28
  loc_00608420: mov [ecx+00000008h], eax
  loc_00608423: mov eax, var_2C
  loc_00608426: mov [ecx+0000000Ch], eax
  loc_00608429: mov eax, var_24
  loc_0060842C: mov ecx, esp
  loc_0060842E: push esi
  loc_0060842F: mov [ecx], edx
  loc_00608431: mov edx, var_20
  loc_00608434: mov [ecx+00000004h], eax
  loc_00608437: mov eax, var_1C
  loc_0060843A: mov [ecx+00000008h], edx
  loc_0060843D: mov [ecx+0000000Ch], eax
  loc_00608440: call [edi+00000310h]
  loc_00608446: lea ecx, var_18
  loc_00608449: push eax
  loc_0060844A: push ecx
  loc_0060844B: call [004010A0h] ; __vbaObjSet
  loc_00608451: push eax
  loc_00608452: push esi
  loc_00608453: call [edi+000002BCh]
  loc_00608459: xor edi, edi
  loc_0060845B: cmp eax, edi
  loc_0060845D: fnclex
  loc_0060845F: jge 00608473h
  loc_00608461: push 000002BCh
  loc_00608466: push 004278E8h
  loc_0060846B: push esi
  loc_0060846C: push eax
  loc_0060846D: call [00401074h] ; __vbaHresultCheckObj
  loc_00608473: lea ecx, var_18
  loc_00608476: call [004012B0h] ; __vbaFreeObj
  loc_0060847C: mov var_4, edi
  loc_0060847F: push 00608491h
  loc_00608484: jmp 00608490h
  loc_00608486: lea ecx, var_18
  loc_00608489: call [004012B0h] ; __vbaFreeObj
  loc_0060848F: ret
  loc_00608490: ret
  loc_00608491: mov eax, Me
  loc_00608494: push eax
  loc_00608495: mov edx, [eax]
  loc_00608497: call [edx+00000008h]
  loc_0060849A: mov eax, var_4
  loc_0060849D: mov ecx, var_14
  loc_006084A0: pop edi
  loc_006084A1: pop esi
  loc_006084A2: mov fs:[00000000h], ecx
  loc_006084A9: pop ebx
  loc_006084AA: mov esp, ebp
  loc_006084AC: pop ebp
  loc_006084AD: retn 0014h
End Sub

Private Sub cmdSave_Click() '606F80
  loc_00606F80: push ebp
  loc_00606F81: mov ebp, esp
  loc_00606F83: sub esp, 0000000Ch
  loc_00606F86: push 00403B36h ; __vbaExceptHandler
  loc_00606F8B: mov eax, fs:[00000000h]
  loc_00606F91: push eax
  loc_00606F92: mov fs:[00000000h], esp
  loc_00606F99: sub esp, 00000218h
  loc_00606F9F: push ebx
  loc_00606FA0: push esi
  loc_00606FA1: push edi
  loc_00606FA2: mov var_C, esp
  loc_00606FA5: mov var_8, 00403618h
  loc_00606FAC: mov edi, Me
  loc_00606FAF: mov eax, edi
  loc_00606FB1: and eax, 00000001h
  loc_00606FB4: mov var_4, eax
  loc_00606FB7: and edi, FFFFFFFEh
  loc_00606FBA: push edi
  loc_00606FBB: mov Me, edi
  loc_00606FBE: mov ecx, [edi]
  loc_00606FC0: call [ecx+00000004h]
  loc_00606FC3: xor eax, eax
  loc_00606FC5: lea edx, var_134
  loc_00606FCB: mov var_24, eax
  loc_00606FCE: mov var_2C, eax
  loc_00606FD1: mov var_30, eax
  loc_00606FD4: mov var_34, eax
  loc_00606FD7: mov var_44, eax
  loc_00606FDA: mov var_54, eax
  loc_00606FDD: mov var_64, eax
  loc_00606FE0: mov var_74, eax
  loc_00606FE3: mov var_84, eax
  loc_00606FE9: mov var_94, eax
  loc_00606FEF: mov var_A4, eax
  loc_00606FF5: mov var_B4, eax
  loc_00606FFB: mov var_C4, eax
  loc_00607001: mov var_D4, eax
  loc_00607007: mov var_E4, eax
  loc_0060700D: mov var_F4, eax
  loc_00607013: mov var_104, eax
  loc_00607019: mov var_114, eax
  loc_0060701F: mov var_124, eax
  loc_00607025: mov var_134, eax
  loc_0060702B: mov var_144, eax
  loc_00607031: mov var_154, eax
  loc_00607037: mov var_174, eax
  loc_0060703D: mov var_184, eax
  loc_00607043: mov var_1A4, eax
  loc_00607049: mov var_1B4, eax
  loc_0060704F: mov var_1C4, eax
  loc_00607055: mov var_1D4, eax
  loc_0060705B: mov var_1E4, eax
  loc_00607061: mov var_1F4, eax
  loc_00607067: mov var_204, eax
  loc_0060706D: mov var_214, eax
  loc_00607073: lea eax, var_44
  loc_00607076: push edx
  loc_00607077: push eax
  loc_00607078: mov esi, 80020004h
  loc_0060707D: mov ebx, 0000000Ah
  loc_00607082: mov var_13C, 00432DD4h ; "DELETE From NotBuy WHERE OnCount='"
  loc_0060708C: mov var_144, 00000008h
  loc_00607096: mov var_12C, 0061A05Ch
  loc_006070A0: mov var_134, 00004008h
  loc_006070AA: call [004010D4h] ; rtcTrimVar
  loc_006070B0: mov ecx, [0061A13Ch]
  loc_006070B6: sub esp, 00000010h
  loc_006070B9: mov eax, esp
  loc_006070BB: mov var_14C, 0041E890h ; "'"
  loc_006070C5: mov var_154, 00000008h
  loc_006070CF: mov edx, [ecx]
  loc_006070D1: mov ecx, var_160
  loc_006070D7: mov [eax], ebx
  loc_006070D9: mov var_22C, edx
  loc_006070DF: mov [eax+00000004h], ecx
  loc_006070E2: mov ecx, var_158
  loc_006070E8: mov [eax+00000008h], esi
  loc_006070EB: mov esi, [004011B4h] ; __vbaVarCat
  loc_006070F1: mov [eax+0000000Ch], ecx
  loc_006070F4: lea eax, var_144
  loc_006070FA: push eax
  loc_006070FB: lea ecx, var_44
  loc_006070FE: lea eax, var_54
  loc_00607101: push ecx
  loc_00607102: push eax
  loc_00607103: call __vbaVarCat
  loc_00607105: push eax
  loc_00607106: lea ecx, var_154
  loc_0060710C: lea edx, var_64
  loc_0060710F: push ecx
  loc_00607110: push edx
  loc_00607111: call __vbaVarCat
  loc_00607113: push eax
  loc_00607114: lea eax, var_2C
  loc_00607117: push eax
  loc_00607118: call [004011B0h] ; __vbaStrVarVal
  loc_0060711E: mov ecx, [0061A13Ch]
  loc_00607124: mov edx, var_22C
  loc_0060712A: push eax
  loc_0060712B: push ecx
  loc_0060712C: call [edx+0000005Ch]
  loc_0060712F: test eax, eax
  loc_00607131: fnclex
  loc_00607133: jge 0060714Ah
  loc_00607135: mov ecx, [0061A13Ch]
  loc_0060713B: push 0000005Ch
  loc_0060713D: push 0041E928h
  loc_00607142: push ecx
  loc_00607143: push eax
  loc_00607144: call [00401074h] ; __vbaHresultCheckObj
  loc_0060714A: lea ecx, var_2C
  loc_0060714D: call [004012ACh] ; __vbaFreeStr
  loc_00607153: lea edx, var_64
  loc_00607156: lea eax, var_54
  loc_00607159: push edx
  loc_0060715A: lea ecx, var_44
  loc_0060715D: push eax
  loc_0060715E: push ecx
  loc_0060715F: push 00000003h
  loc_00607161: call [00401038h] ; __vbaFreeVarList
  loc_00607167: add esp, 00000010h
  loc_0060716A: mov ebx, 00000008h
  loc_0060716F: lea edx, var_24
  loc_00607172: push edx
  loc_00607173: call [0040121Ch] ; __vbaI4Var
  loc_00607179: sub esp, 00000010h
  loc_0060717C: mov ecx, 00000003h
  loc_00607181: mov edx, esp
  loc_00607183: mov var_134, ecx
  loc_00607189: mov var_154, ecx
  loc_0060718F: mov var_12C, eax
  loc_00607195: mov [edx], ecx
  loc_00607197: mov ecx, var_130
  loc_0060719D: sub esp, 00000010h
  loc_006071A0: mov var_14C, 00000000h
  loc_006071AA: mov [edx+00000004h], ecx
  loc_006071AD: mov ecx, esp
  loc_006071AF: push 00000002h
  loc_006071B1: push 00000041h
  loc_006071B3: mov [edx+00000008h], eax
  loc_006071B6: mov eax, var_128
  loc_006071BC: push edi
  loc_006071BD: mov [edx+0000000Ch], eax
  loc_006071C0: mov edx, var_154
  loc_006071C6: mov eax, var_150
  loc_006071CC: mov [ecx], edx
  loc_006071CE: mov edx, var_14C
  loc_006071D4: mov [ecx+00000004h], eax
  loc_006071D7: mov eax, var_148
  loc_006071DD: mov [ecx+00000008h], edx
  loc_006071E0: mov [ecx+0000000Ch], eax
  loc_006071E3: mov ecx, [edi]
  loc_006071E5: call [ecx+00000318h]
  loc_006071EB: lea edx, var_30
  loc_006071EE: push eax
  loc_006071EF: push edx
  loc_006071F0: call [004010A0h] ; __vbaObjSet
  loc_006071F6: push eax
  loc_006071F7: lea eax, var_44
  loc_006071FA: push eax
  loc_006071FB: call [00401140h] ; __vbaLateIdCallLd
  loc_00607201: add esp, 00000030h
  loc_00607204: push eax
  loc_00607205: call [00401028h] ; __vbaStrVarMove
  loc_0060720B: lea ecx, var_54
  loc_0060720E: lea edx, var_64
  loc_00607211: push ecx
  loc_00607212: push edx
  loc_00607213: mov var_4C, eax
  loc_00607216: mov var_54, ebx
  loc_00607219: call [004010D4h] ; rtcTrimVar
  loc_0060721F: lea eax, var_64
  loc_00607222: lea ecx, var_174
  loc_00607228: push eax
  loc_00607229: push ecx
  loc_0060722A: mov var_16C, 0041E5D4h
  loc_00607234: mov var_174, 00008008h
  loc_0060723E: call [00401218h] ; __vbaVarTstNe
  loc_00607244: lea ecx, var_30
  loc_00607247: mov var_218, ax
  loc_0060724E: call [004012B0h] ; __vbaFreeObj
  loc_00607254: lea edx, var_64
  loc_00607257: lea eax, var_54
  loc_0060725A: push edx
  loc_0060725B: lea ecx, var_44
  loc_0060725E: push eax
  loc_0060725F: push ecx
  loc_00607260: push 00000003h
  loc_00607262: call [00401038h] ; __vbaFreeVarList
  loc_00607268: add esp, 00000010h
  loc_0060726B: cmp var_218, 0000h
  loc_00607273: jz 00607A12h
  loc_00607279: lea edx, var_24
  loc_0060727C: push edx
  loc_0060727D: call [0040121Ch] ; __vbaI4Var
  loc_00607283: sub esp, 00000010h
  loc_00607286: mov ecx, 00000003h
  loc_0060728B: mov edx, esp
  loc_0060728D: mov var_134, ecx
  loc_00607293: mov var_154, ecx
  loc_00607299: mov var_12C, eax
  loc_0060729F: mov [edx], ecx
  loc_006072A1: mov ecx, var_130
  loc_006072A7: sub esp, 00000010h
  loc_006072AA: mov var_14C, 00000000h
  loc_006072B4: mov [edx+00000004h], ecx
  loc_006072B7: mov ecx, esp
  loc_006072B9: push 00000002h
  loc_006072BB: push 00000041h
  loc_006072BD: mov [edx+00000008h], eax
  loc_006072C0: mov eax, var_128
  loc_006072C6: push edi
  loc_006072C7: mov [edx+0000000Ch], eax
  loc_006072CA: mov edx, var_154
  loc_006072D0: mov eax, var_150
  loc_006072D6: mov [ecx], edx
  loc_006072D8: mov edx, var_14C
  loc_006072DE: mov [ecx+00000004h], eax
  loc_006072E1: mov eax, var_148
  loc_006072E7: mov [ecx+00000008h], edx
  loc_006072EA: mov [ecx+0000000Ch], eax
  loc_006072ED: mov ecx, [edi]
  loc_006072EF: call [ecx+00000318h]
  loc_006072F5: lea edx, var_30
  loc_006072F8: push eax
  loc_006072F9: push edx
  loc_006072FA: call [004010A0h] ; __vbaObjSet
  loc_00607300: push eax
  loc_00607301: lea eax, var_44
  loc_00607304: push eax
  loc_00607305: call [00401140h] ; __vbaLateIdCallLd
  loc_0060730B: add esp, 00000030h
  loc_0060730E: lea ecx, var_44
  loc_00607311: push ecx
  loc_00607312: call [00401028h] ; __vbaStrVarMove
  loc_00607318: mov var_4C, eax
  loc_0060731B: lea edx, var_54
  loc_0060731E: push 00000001h
  loc_00607320: lea eax, var_64
  loc_00607323: push edx
  loc_00607324: push eax
  loc_00607325: mov var_54, ebx
  loc_00607328: call [00401278h] ; rtcRightCharVar
  loc_0060732E: lea ecx, var_64
  loc_00607331: lea edx, var_174
  loc_00607337: push ecx
  loc_00607338: push edx
  loc_00607339: mov var_16C, 0041FCA8h
  loc_00607343: mov var_174, 00008008h
  loc_0060734D: call [00401110h] ; __vbaVarTstEq
  loc_00607353: lea ecx, var_30
  loc_00607356: mov var_218, ax
  loc_0060735D: call [004012B0h] ; __vbaFreeObj
  loc_00607363: lea eax, var_64
  loc_00607366: lea ecx, var_54
  loc_00607369: push eax
  loc_0060736A: lea edx, var_44
  loc_0060736D: push ecx
  loc_0060736E: push edx
  loc_0060736F: push 00000003h
  loc_00607371: call [00401038h] ; __vbaFreeVarList
  loc_00607377: add esp, 00000010h
  loc_0060737A: cmp var_218, 0000h
  loc_00607382: jz 006076E2h
  loc_00607388: mov var_28, 00000000h
  loc_0060738F: mov eax, 00000009h
  loc_00607394: cmp var_28, ax
  loc_00607398: jg 006079D9h
  loc_0060739E: lea eax, var_134
  loc_006073A4: lea ecx, var_44
  loc_006073A7: push eax
  loc_006073A8: push ecx
  loc_006073A9: mov var_12C, 0061A05Ch
  loc_006073B3: mov var_134, 00004008h
  loc_006073BD: call [004010D4h] ; rtcTrimVar
  loc_006073C3: lea edx, var_24
  loc_006073C6: push edx
  loc_006073C7: call [0040121Ch] ; __vbaI4Var
  loc_006073CD: sub esp, 00000010h
  loc_006073D0: mov ecx, 00000003h
  loc_006073D5: mov edx, esp
  loc_006073D7: mov var_184, ecx
  loc_006073DD: sub esp, 00000010h
  loc_006073E0: mov [edx], ecx
  loc_006073E2: mov ecx, var_160
  loc_006073E8: mov [edx+00000004h], ecx
  loc_006073EB: mov ecx, esp
  loc_006073ED: push 00000002h
  loc_006073EF: push 00000041h
  loc_006073F1: mov [edx+00000008h], eax
  loc_006073F4: mov eax, var_158
  loc_006073FA: push edi
  loc_006073FB: mov [edx+0000000Ch], eax
  loc_006073FE: mov edx, var_184
  loc_00607404: mov eax, var_180
  loc_0060740A: mov [ecx], edx
  loc_0060740C: mov edx, var_178
  loc_00607412: mov [ecx+00000004h], eax
  loc_00607415: xor eax, eax
  loc_00607417: mov [ecx+00000008h], eax
  loc_0060741A: mov eax, [edi]
  loc_0060741C: mov [ecx+0000000Ch], edx
  loc_0060741F: call [eax+00000318h]
  loc_00607425: lea ecx, var_30
  loc_00607428: push eax
  loc_00607429: push ecx
  loc_0060742A: call [004010A0h] ; __vbaObjSet
  loc_00607430: lea edx, var_74
  loc_00607433: push eax
  loc_00607434: push edx
  loc_00607435: call [00401140h] ; __vbaLateIdCallLd
  loc_0060743B: add esp, 00000030h
  loc_0060743E: push eax
  loc_0060743F: call [00401028h] ; __vbaStrVarMove
  loc_00607445: mov var_7C, eax
  loc_00607448: lea eax, var_84
  loc_0060744E: lea ecx, var_94
  loc_00607454: push eax
  loc_00607455: push ecx
  loc_00607456: mov var_84, ebx
  loc_0060745C: call [004010D4h] ; rtcTrimVar
  loc_00607462: lea edx, var_94
  loc_00607468: push 00000001h
  loc_0060746A: lea eax, var_A4
  loc_00607470: push edx
  loc_00607471: push eax
  loc_00607472: call [00401264h] ; rtcLeftCharVar
  loc_00607478: lea ecx, var_24
  loc_0060747B: push ecx
  loc_0060747C: call [0040121Ch] ; __vbaI4Var
  loc_00607482: sub esp, 00000010h
  loc_00607485: mov ecx, 00000003h
  loc_0060748A: mov edx, esp
  loc_0060748C: mov var_1E4, ecx
  loc_00607492: sub esp, 00000010h
  loc_00607495: mov [edx], ecx
  loc_00607497: mov ecx, var_1C0
  loc_0060749D: mov [edx+00000004h], ecx
  loc_006074A0: mov ecx, esp
  loc_006074A2: mov [edx+00000008h], eax
  loc_006074A5: mov eax, var_1B8
  loc_006074AB: mov [edx+0000000Ch], eax
  loc_006074AE: mov edx, var_1E4
  loc_006074B4: mov eax, var_1E0
  loc_006074BA: mov [ecx], edx
  loc_006074BC: mov edx, var_1D8
  loc_006074C2: mov [ecx+00000004h], eax
  loc_006074C5: xor eax, eax
  loc_006074C7: mov [ecx+00000008h], eax
  loc_006074CA: mov eax, [edi]
  loc_006074CC: push 00000002h
  loc_006074CE: push 00000041h
  loc_006074D0: push edi
  loc_006074D1: mov [ecx+0000000Ch], edx
  loc_006074D4: call [eax+00000318h]
  loc_006074DA: lea ecx, var_34
  loc_006074DD: push eax
  loc_006074DE: push ecx
  loc_006074DF: call [004010A0h] ; __vbaObjSet
  loc_006074E5: lea edx, var_E4
  loc_006074EB: push eax
  loc_006074EC: push edx
  loc_006074ED: call [00401140h] ; __vbaLateIdCallLd
  loc_006074F3: add esp, 00000030h
  loc_006074F6: push eax
  loc_006074F7: call [00401028h] ; __vbaStrVarMove
  loc_006074FD: mov var_EC, eax
  loc_00607503: lea eax, var_F4
  loc_00607509: lea ecx, var_104
  loc_0060750F: push eax
  loc_00607510: push ecx
  loc_00607511: mov var_F4, ebx
  loc_00607517: call [004010D4h] ; rtcTrimVar
  loc_0060751D: mov dx, var_28
  loc_00607521: mov var_13C, 00432E20h ; "INSERT INTO NotBuy VALUES('"
  loc_0060752B: mov var_19C, dx
  loc_00607532: mov edx, [0061A13Ch]
  loc_00607538: mov var_144, ebx
  loc_0060753E: mov var_14C, 0043043Ch ; "','"
  loc_00607548: mov var_154, ebx
  loc_0060754E: mov var_1A4, 00000002h
  loc_00607558: mov var_1AC, 0043043Ch ; "','"
  loc_00607562: mov var_1B4, ebx
  loc_00607568: mov var_1FC, 004333FCh ; "')"
  loc_00607572: mov var_204, ebx
  loc_00607578: mov ebx, [edx]
  loc_0060757A: sub esp, 00000010h
  loc_0060757D: mov edx, esp
  loc_0060757F: mov ecx, 0000000Ah
  loc_00607584: mov eax, 80020004h
  loc_00607589: mov [edx], ecx
  loc_0060758B: mov ecx, var_210
  loc_00607591: mov [edx+00000004h], ecx
  loc_00607594: lea ecx, var_144
  loc_0060759A: push ecx
  loc_0060759B: mov [edx+00000008h], eax
  loc_0060759E: mov eax, var_208
  loc_006075A4: mov [edx+0000000Ch], eax
  loc_006075A7: lea edx, var_44
  loc_006075AA: lea eax, var_54
  loc_006075AD: push edx
  loc_006075AE: push eax
  loc_006075AF: call __vbaVarCat
  loc_006075B1: lea ecx, var_154
  loc_006075B7: push eax
  loc_006075B8: lea edx, var_64
  loc_006075BB: push ecx
  loc_006075BC: push edx
  loc_006075BD: call __vbaVarCat
  loc_006075BF: push eax
  loc_006075C0: lea eax, var_A4
  loc_006075C6: lea ecx, var_B4
  loc_006075CC: push eax
  loc_006075CD: push ecx
  loc_006075CE: call __vbaVarCat
  loc_006075D0: push eax
  loc_006075D1: lea edx, var_1A4
  loc_006075D7: lea eax, var_C4
  loc_006075DD: push edx
  loc_006075DE: push eax
  loc_006075DF: call __vbaVarCat
  loc_006075E1: lea ecx, var_1B4
  loc_006075E7: push eax
  loc_006075E8: lea edx, var_D4
  loc_006075EE: push ecx
  loc_006075EF: push edx
  loc_006075F0: call __vbaVarCat
  loc_006075F2: push eax
  loc_006075F3: lea eax, var_104
  loc_006075F9: push eax
  loc_006075FA: lea ecx, var_114
  loc_00607600: push ecx
  loc_00607601: call __vbaVarCat
  loc_00607603: push eax
  loc_00607604: lea edx, var_204
  loc_0060760A: lea eax, var_124
  loc_00607610: push edx
  loc_00607611: push eax
  loc_00607612: call __vbaVarCat
  loc_00607614: lea ecx, var_2C
  loc_00607617: push eax
  loc_00607618: push ecx
  loc_00607619: call [004011B0h] ; __vbaStrVarVal
  loc_0060761F: mov edx, [0061A13Ch]
  loc_00607625: push eax
  loc_00607626: push edx
  loc_00607627: call [ebx+0000005Ch]
  loc_0060762A: test eax, eax
  loc_0060762C: fnclex
  loc_0060762E: jge 00607645h
  loc_00607630: mov ecx, [0061A13Ch]
  loc_00607636: push 0000005Ch
  loc_00607638: push 0041E928h
  loc_0060763D: push ecx
  loc_0060763E: push eax
  loc_0060763F: call [00401074h] ; __vbaHresultCheckObj
  loc_00607645: lea ecx, var_2C
  loc_00607648: call [004012ACh] ; __vbaFreeStr
  loc_0060764E: lea edx, var_34
  loc_00607651: lea eax, var_30
  loc_00607654: push edx
  loc_00607655: push eax
  loc_00607656: push 00000002h
  loc_00607658: call [00401040h] ; __vbaFreeObjList
  loc_0060765E: lea ecx, var_124
  loc_00607664: lea edx, var_114
  loc_0060766A: push ecx
  loc_0060766B: lea eax, var_104
  loc_00607671: push edx
  loc_00607672: lea ecx, var_D4
  loc_00607678: push eax
  loc_00607679: lea edx, var_F4
  loc_0060767F: push ecx
  loc_00607680: lea eax, var_E4
  loc_00607686: push edx
  loc_00607687: lea ecx, var_C4
  loc_0060768D: push eax
  loc_0060768E: lea edx, var_B4
  loc_00607694: push ecx
  loc_00607695: lea eax, var_A4
  loc_0060769B: push edx
  loc_0060769C: lea ecx, var_64
  loc_0060769F: push eax
  loc_006076A0: lea edx, var_94
  loc_006076A6: push ecx
  loc_006076A7: lea eax, var_84
  loc_006076AD: push edx
  loc_006076AE: lea ecx, var_74
  loc_006076B1: push eax
  loc_006076B2: lea edx, var_54
  loc_006076B5: push ecx
  loc_006076B6: lea eax, var_44
  loc_006076B9: push edx
  loc_006076BA: push eax
  loc_006076BB: push 0000000Fh
  loc_006076BD: call [00401038h] ; __vbaFreeVarList
  loc_006076C3: mov eax, 00000001h
  loc_006076C8: add esp, 0000004Ch
  loc_006076CB: add ax, var_28
  loc_006076CF: mov ebx, 00000008h
  loc_006076D4: jo 00607B3Ch
  loc_006076DA: mov var_28, eax
  loc_006076DD: jmp 0060738Fh
  loc_006076E2: lea ecx, var_134
  loc_006076E8: lea edx, var_44
  loc_006076EB: push ecx
  loc_006076EC: push edx
  loc_006076ED: mov var_12C, 0061A05Ch
  loc_006076F7: mov var_134, 00004008h
  loc_00607701: call [004010D4h] ; rtcTrimVar
  loc_00607707: lea eax, var_24
  loc_0060770A: push eax
  loc_0060770B: call [0040121Ch] ; __vbaI4Var
  loc_00607711: sub esp, 00000010h
  loc_00607714: mov ecx, 00000003h
  loc_00607719: mov edx, esp
  loc_0060771B: mov var_184, ecx
  loc_00607721: sub esp, 00000010h
  loc_00607724: mov [edx], ecx
  loc_00607726: mov ecx, var_160
  loc_0060772C: mov [edx+00000004h], ecx
  loc_0060772F: mov ecx, esp
  loc_00607731: push 00000002h
  loc_00607733: push 00000041h
  loc_00607735: mov [edx+00000008h], eax
  loc_00607738: mov eax, var_158
  loc_0060773E: push edi
  loc_0060773F: mov [edx+0000000Ch], eax
  loc_00607742: mov edx, var_184
  loc_00607748: mov eax, var_180
  loc_0060774E: mov [ecx], edx
  loc_00607750: mov edx, var_178
  loc_00607756: mov [ecx+00000004h], eax
  loc_00607759: xor eax, eax
  loc_0060775B: mov [ecx+00000008h], eax
  loc_0060775E: mov eax, [edi]
  loc_00607760: mov [ecx+0000000Ch], edx
  loc_00607763: call [eax+00000318h]
  loc_00607769: lea ecx, var_30
  loc_0060776C: push eax
  loc_0060776D: push ecx
  loc_0060776E: call [004010A0h] ; __vbaObjSet
  loc_00607774: lea edx, var_74
  loc_00607777: push eax
  loc_00607778: push edx
  loc_00607779: call [00401140h] ; __vbaLateIdCallLd
  loc_0060777F: add esp, 00000030h
  loc_00607782: push eax
  loc_00607783: call [00401028h] ; __vbaStrVarMove
  loc_00607789: mov var_7C, eax
  loc_0060778C: lea eax, var_84
  loc_00607792: lea ecx, var_94
  loc_00607798: push eax
  loc_00607799: push ecx
  loc_0060779A: mov var_84, ebx
  loc_006077A0: call [004010D4h] ; rtcTrimVar
  loc_006077A6: lea edx, var_24
  loc_006077A9: push edx
  loc_006077AA: call [0040121Ch] ; __vbaI4Var
  loc_006077B0: sub esp, 00000010h
  loc_006077B3: mov ecx, 00000003h
  loc_006077B8: mov edx, esp
  loc_006077BA: mov var_1B4, ecx
  loc_006077C0: mov var_1D4, ecx
  loc_006077C6: mov var_1AC, eax
  loc_006077CC: mov [edx], ecx
  loc_006077CE: mov ecx, var_1B0
  loc_006077D4: sub esp, 00000010h
  loc_006077D7: mov [edx+00000004h], ecx
  loc_006077DA: mov ecx, esp
  loc_006077DC: push 00000002h
  loc_006077DE: push 00000041h
  loc_006077E0: mov [edx+00000008h], eax
  loc_006077E3: mov eax, var_1A8
  loc_006077E9: mov [edx+0000000Ch], eax
  loc_006077EC: mov edx, var_1D4
  loc_006077F2: mov eax, var_1D0
  loc_006077F8: mov [ecx], edx
  loc_006077FA: mov edx, var_1C8
  loc_00607800: mov [ecx+00000004h], eax
  loc_00607803: xor eax, eax
  loc_00607805: mov [ecx+00000008h], eax
  loc_00607808: mov eax, [edi]
  loc_0060780A: mov [ecx+0000000Ch], edx
  loc_0060780D: push edi
  loc_0060780E: call [eax+00000318h]
  loc_00607814: lea ecx, var_34
  loc_00607817: push eax
  loc_00607818: push ecx
  loc_00607819: call [004010A0h] ; __vbaObjSet
  loc_0060781F: lea edx, var_C4
  loc_00607825: push eax
  loc_00607826: push edx
  loc_00607827: call [00401140h] ; __vbaLateIdCallLd
  loc_0060782D: add esp, 00000030h
  loc_00607830: push eax
  loc_00607831: call [00401028h] ; __vbaStrVarMove
  loc_00607837: mov var_CC, eax
  loc_0060783D: lea eax, var_D4
  loc_00607843: lea ecx, var_E4
  loc_00607849: push eax
  loc_0060784A: push ecx
  loc_0060784B: mov var_D4, ebx
  loc_00607851: call [004010D4h] ; rtcTrimVar
  loc_00607857: mov edx, 0043043Ch ; "','"
  loc_0060785C: mov eax, 80020004h
  loc_00607861: mov var_14C, edx
  loc_00607867: mov var_19C, edx
  loc_0060786D: mov edx, [0061A13Ch]
  loc_00607873: mov ecx, 0000000Ah
  loc_00607878: mov var_1FC, eax
  loc_0060787E: mov var_204, ecx
  loc_00607884: mov var_13C, 00432E20h ; "INSERT INTO NotBuy VALUES('"
  loc_0060788E: mov var_144, ebx
  loc_00607894: mov var_154, ebx
  loc_0060789A: mov var_1A4, ebx
  loc_006078A0: mov var_1EC, 004333FCh ; "')"
  loc_006078AA: mov var_1F4, ebx
  loc_006078B0: mov ebx, [edx]
  loc_006078B2: sub esp, 00000010h
  loc_006078B5: mov edx, esp
  loc_006078B7: mov [edx], ecx
  loc_006078B9: mov ecx, var_200
  loc_006078BF: mov [edx+00000004h], ecx
  loc_006078C2: lea ecx, var_144
  loc_006078C8: push ecx
  loc_006078C9: mov [edx+00000008h], eax
  loc_006078CC: mov eax, var_1F8
  loc_006078D2: mov [edx+0000000Ch], eax
  loc_006078D5: lea edx, var_44
  loc_006078D8: lea eax, var_54
  loc_006078DB: push edx
  loc_006078DC: push eax
  loc_006078DD: call __vbaVarCat
  loc_006078DF: lea ecx, var_154
  loc_006078E5: push eax
  loc_006078E6: lea edx, var_64
  loc_006078E9: push ecx
  loc_006078EA: push edx
  loc_006078EB: call __vbaVarCat
  loc_006078ED: push eax
  loc_006078EE: lea eax, var_94
  loc_006078F4: lea ecx, var_A4
  loc_006078FA: push eax
  loc_006078FB: push ecx
  loc_006078FC: call __vbaVarCat
  loc_006078FE: push eax
  loc_006078FF: lea edx, var_1A4
  loc_00607905: lea eax, var_B4
  loc_0060790B: push edx
  loc_0060790C: push eax
  loc_0060790D: call __vbaVarCat
  loc_0060790F: lea ecx, var_E4
  loc_00607915: push eax
  loc_00607916: lea edx, var_F4
  loc_0060791C: push ecx
  loc_0060791D: push edx
  loc_0060791E: call __vbaVarCat
  loc_00607920: push eax
  loc_00607921: lea eax, var_1F4
  loc_00607927: lea ecx, var_104
  loc_0060792D: push eax
  loc_0060792E: push ecx
  loc_0060792F: call __vbaVarCat
  loc_00607931: push eax
  loc_00607932: lea edx, var_2C
  loc_00607935: push edx
  loc_00607936: call [004011B0h] ; __vbaStrVarVal
  loc_0060793C: push eax
  loc_0060793D: mov eax, [0061A13Ch]
  loc_00607942: push eax
  loc_00607943: call [ebx+0000005Ch]
  loc_00607946: test eax, eax
  loc_00607948: fnclex
  loc_0060794A: jge 00607961h
  loc_0060794C: mov ecx, [0061A13Ch]
  loc_00607952: push 0000005Ch
  loc_00607954: push 0041E928h
  loc_00607959: push ecx
  loc_0060795A: push eax
  loc_0060795B: call [00401074h] ; __vbaHresultCheckObj
  loc_00607961: lea ecx, var_2C
  loc_00607964: call [004012ACh] ; __vbaFreeStr
  loc_0060796A: lea edx, var_34
  loc_0060796D: lea eax, var_30
  loc_00607970: push edx
  loc_00607971: push eax
  loc_00607972: push 00000002h
  loc_00607974: call [00401040h] ; __vbaFreeObjList
  loc_0060797A: lea ecx, var_104
  loc_00607980: lea edx, var_F4
  loc_00607986: push ecx
  loc_00607987: lea eax, var_E4
  loc_0060798D: push edx
  loc_0060798E: lea ecx, var_B4
  loc_00607994: push eax
  loc_00607995: lea edx, var_D4
  loc_0060799B: push ecx
  loc_0060799C: lea eax, var_C4
  loc_006079A2: push edx
  loc_006079A3: lea ecx, var_A4
  loc_006079A9: push eax
  loc_006079AA: lea edx, var_94
  loc_006079B0: push ecx
  loc_006079B1: lea eax, var_64
  loc_006079B4: push edx
  loc_006079B5: lea ecx, var_84
  loc_006079BB: push eax
  loc_006079BC: lea edx, var_74
  loc_006079BF: push ecx
  loc_006079C0: lea eax, var_54
  loc_006079C3: push edx
  loc_006079C4: lea ecx, var_44
  loc_006079C7: push eax
  loc_006079C8: push ecx
  loc_006079C9: push 0000000Dh
  loc_006079CB: call [00401038h] ; __vbaFreeVarList
  loc_006079D1: add esp, 00000044h
  loc_006079D4: mov ebx, 00000008h
  loc_006079D9: lea edx, var_24
  loc_006079DC: lea eax, var_134
  loc_006079E2: push edx
  loc_006079E3: lea ecx, var_44
  loc_006079E6: push eax
  loc_006079E7: push ecx
  loc_006079E8: mov var_12C, 00000001h
  loc_006079F2: mov var_134, 00000002h
  loc_006079FC: call [00401234h] ; __vbaVarAdd
  loc_00607A02: mov edx, eax
  loc_00607A04: lea ecx, var_24
  loc_00607A07: call [00401014h] ; __vbaVarMove
  loc_00607A0D: jmp 0060716Fh
  loc_00607A12: mov ecx, 80020004h
  loc_00607A17: mov eax, 0000000Ah
  loc_00607A1C: mov var_6C, ecx
  loc_00607A1F: mov var_5C, ecx
  loc_00607A22: mov var_4C, ecx
  loc_00607A25: lea edx, var_134
  loc_00607A2B: lea ecx, var_44
  loc_00607A2E: mov var_74, eax
  loc_00607A31: mov var_64, eax
  loc_00607A34: mov var_54, eax
  loc_00607A37: mov var_12C, 0041F378h ; "Save Successfully."
  loc_00607A41: mov var_134, ebx
  loc_00607A47: call [00401240h] ; __vbaVarDup
  loc_00607A4D: lea edx, var_74
  loc_00607A50: lea eax, var_64
  loc_00607A53: push edx
  loc_00607A54: lea ecx, var_54
  loc_00607A57: push eax
  loc_00607A58: push ecx
  loc_00607A59: lea edx, var_44
  loc_00607A5C: push 00000040h
  loc_00607A5E: push edx
  loc_00607A5F: call [004010A4h] ; rtcMsgBox
  loc_00607A65: lea eax, var_74
  loc_00607A68: lea ecx, var_64
  loc_00607A6B: push eax
  loc_00607A6C: lea edx, var_54
  loc_00607A6F: push ecx
  loc_00607A70: lea eax, var_44
  loc_00607A73: push edx
  loc_00607A74: push eax
  loc_00607A75: push 00000004h
  loc_00607A77: call [00401038h] ; __vbaFreeVarList
  loc_00607A7D: add esp, 00000014h
  loc_00607A80: mov var_4, 00000000h
  loc_00607A87: push 00607B1Dh
  loc_00607A8C: jmp 00607B13h
  loc_00607A91: lea ecx, var_2C
  loc_00607A94: call [004012ACh] ; __vbaFreeStr
  loc_00607A9A: lea ecx, var_34
  loc_00607A9D: lea edx, var_30
  loc_00607AA0: push ecx
  loc_00607AA1: push edx
  loc_00607AA2: push 00000002h
  loc_00607AA4: call [00401040h] ; __vbaFreeObjList
  loc_00607AAA: lea eax, var_124
  loc_00607AB0: lea ecx, var_114
  loc_00607AB6: push eax
  loc_00607AB7: lea edx, var_104
  loc_00607ABD: push ecx
  loc_00607ABE: lea eax, var_F4
  loc_00607AC4: push edx
  loc_00607AC5: lea ecx, var_E4
  loc_00607ACB: push eax
  loc_00607ACC: lea edx, var_D4
  loc_00607AD2: push ecx
  loc_00607AD3: lea eax, var_C4
  loc_00607AD9: push edx
  loc_00607ADA: lea ecx, var_B4
  loc_00607AE0: push eax
  loc_00607AE1: lea edx, var_A4
  loc_00607AE7: push ecx
  loc_00607AE8: lea eax, var_94
  loc_00607AEE: push edx
  loc_00607AEF: lea ecx, var_84
  loc_00607AF5: push eax
  loc_00607AF6: lea edx, var_74
  loc_00607AF9: push ecx
  loc_00607AFA: lea eax, var_64
  loc_00607AFD: push edx
  loc_00607AFE: lea ecx, var_54
  loc_00607B01: push eax
  loc_00607B02: lea edx, var_44
  loc_00607B05: push ecx
  loc_00607B06: push edx
  loc_00607B07: push 0000000Fh
  loc_00607B09: call [00401038h] ; __vbaFreeVarList
  loc_00607B0F: add esp, 0000004Ch
  loc_00607B12: ret
  loc_00607B13: lea ecx, var_24
  loc_00607B16: call [00401020h] ; __vbaFreeVar
  loc_00607B1C: ret
  loc_00607B1D: mov eax, Me
  loc_00607B20: push eax
  loc_00607B21: mov ecx, [eax]
  loc_00607B23: call [ecx+00000008h]
  loc_00607B26: mov eax, var_4
  loc_00607B29: mov ecx, var_14
  loc_00607B2C: pop edi
  loc_00607B2D: pop esi
  loc_00607B2E: mov fs:[00000000h], ecx
  loc_00607B35: pop ebx
  loc_00607B36: mov esp, ebp
  loc_00607B38: pop ebp
  loc_00607B39: retn 0004h
End Sub

Private Sub txtNum_KeyPress(KeyAscii As Integer) '6088B0
  loc_006088B0: push ebp
  loc_006088B1: mov ebp, esp
  loc_006088B3: sub esp, 0000000Ch
  loc_006088B6: push 00403B36h ; __vbaExceptHandler
  loc_006088BB: mov eax, fs:[00000000h]
  loc_006088C1: push eax
  loc_006088C2: mov fs:[00000000h], esp
  loc_006088C9: sub esp, 000000B4h
  loc_006088CF: push ebx
  loc_006088D0: push esi
  loc_006088D1: push edi
  loc_006088D2: mov var_C, esp
  loc_006088D5: mov var_8, 004036B8h
  loc_006088DC: mov esi, Me
  loc_006088DF: mov eax, esi
  loc_006088E1: and eax, 00000001h
  loc_006088E4: mov var_4, eax
  loc_006088E7: and esi, FFFFFFFEh
  loc_006088EA: push esi
  loc_006088EB: mov Me, esi
  loc_006088EE: mov ecx, [esi]
  loc_006088F0: call [ecx+00000004h]
  loc_006088F3: mov edx, KeyAscii
  loc_006088F6: xor eax, eax
  loc_006088F8: mov var_18, eax
  loc_006088FB: mov var_1C, eax
  loc_006088FE: cmp [edx], 000Dh
  loc_00608902: mov var_20, eax
  loc_00608905: mov var_30, eax
  loc_00608908: mov var_40, eax
  loc_0060890B: mov var_50, eax
  loc_0060890E: mov var_60, eax
  loc_00608911: mov var_70, eax
  loc_00608914: mov var_90, eax
  loc_0060891A: jnz 00608B6Dh
  loc_00608920: mov eax, [esi]
  loc_00608922: push esi
  loc_00608923: call [eax+00000300h]
  loc_00608929: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0060892F: lea ecx, var_1C
  loc_00608932: push eax
  loc_00608933: push ecx
  loc_00608934: call ebx
  loc_00608936: mov edi, eax
  loc_00608938: lea eax, var_18
  loc_0060893B: push eax
  loc_0060893C: push edi
  loc_0060893D: mov edx, [edi]
  loc_0060893F: call [edx+000000A0h]
  loc_00608945: test eax, eax
  loc_00608947: fnclex
  loc_00608949: jge 0060895Dh
  loc_0060894B: push 000000A0h
  loc_00608950: push 0041E5E8h
  loc_00608955: push edi
  loc_00608956: push eax
  loc_00608957: call [00401074h] ; __vbaHresultCheckObj
  loc_0060895D: mov ecx, var_18
  loc_00608960: push ecx
  loc_00608961: call [0040102Ch] ; __vbaLenBstr
  loc_00608967: xor edx, edx
  loc_00608969: cmp eax, 00000002h
  loc_0060896C: setz dl
  loc_0060896F: neg edx
  loc_00608971: lea ecx, var_18
  loc_00608974: mov edi, edx
  loc_00608976: call [004012ACh] ; __vbaFreeStr
  loc_0060897C: lea ecx, var_1C
  loc_0060897F: call [004012B0h] ; __vbaFreeObj
  loc_00608985: test di, di
  loc_00608988: jz 00608B6Bh
  loc_0060898E: mov ax, [esi+00000034h]
  loc_00608992: add ax, 0001h
  loc_00608996: jo 00608BCCh
  loc_0060899C: cmp ax, 0014h
  loc_006089A0: mov [esi+00000034h], ax
  loc_006089A4: jge 00608AC1h
  loc_006089AA: mov ecx, [esi]
  loc_006089AC: push esi
  loc_006089AD: movsx eax, ax
  loc_006089B0: mov var_68, eax
  loc_006089B3: mov var_70, 00000003h
  loc_006089BA: call [ecx+00000300h]
  loc_006089C0: lea edx, var_1C
  loc_006089C3: push eax
  loc_006089C4: push edx
  loc_006089C5: call ebx
  loc_006089C7: mov edi, eax
  loc_006089C9: lea ecx, var_18
  loc_006089CC: push ecx
  loc_006089CD: push edi
  loc_006089CE: mov eax, [edi]
  loc_006089D0: call [eax+000000A0h]
  loc_006089D6: test eax, eax
  loc_006089D8: fnclex
  loc_006089DA: jge 006089EEh
  loc_006089DC: push 000000A0h
  loc_006089E1: push 0041E5E8h
  loc_006089E6: push edi
  loc_006089E7: push eax
  loc_006089E8: call [00401074h] ; __vbaHresultCheckObj
  loc_006089EE: mov eax, var_18
  loc_006089F1: lea edx, var_30
  loc_006089F4: mov var_28, eax
  loc_006089F7: lea eax, var_40
  loc_006089FA: push edx
  loc_006089FB: push eax
  loc_006089FC: mov var_18, 00000000h
  loc_00608A03: mov var_30, 00000008h
  loc_00608A0A: call [004010D4h] ; rtcTrimVar
  loc_00608A10: lea ecx, var_40
  loc_00608A13: push ecx
  loc_00608A14: call [00401028h] ; __vbaStrVarMove
  loc_00608A1A: mov edi, var_70
  loc_00608A1D: sub esp, 00000010h
  loc_00608A20: mov edx, esp
  loc_00608A22: sub esp, 00000010h
  loc_00608A25: mov ecx, 00000008h
  loc_00608A2A: mov var_48, eax
  loc_00608A2D: mov [edx], edi
  loc_00608A2F: mov edi, var_6C
  loc_00608A32: mov var_50, ecx
  loc_00608A35: mov [edx+00000004h], edi
  loc_00608A38: mov edi, var_68
  loc_00608A3B: mov [edx+00000008h], edi
  loc_00608A3E: mov edi, var_64
  loc_00608A41: mov [edx+0000000Ch], edi
  loc_00608A44: mov edi, esp
  loc_00608A46: mov edx, 00000003h
  loc_00608A4B: sub esp, 00000010h
  loc_00608A4E: mov [edi], edx
  loc_00608A50: mov edx, var_8C
  loc_00608A56: mov [edi+00000004h], edx
  loc_00608A59: xor edx, edx
  loc_00608A5B: mov [edi+00000008h], edx
  loc_00608A5E: mov edx, var_84
  loc_00608A64: mov [edi+0000000Ch], edx
  loc_00608A67: mov edx, esp
  loc_00608A69: push 00000002h
  loc_00608A6B: push 00000041h
  loc_00608A6D: mov [edx], ecx
  loc_00608A6F: mov ecx, var_4C
  loc_00608A72: push esi
  loc_00608A73: mov [edx+00000004h], ecx
  loc_00608A76: mov ecx, [esi]
  loc_00608A78: mov [edx+00000008h], eax
  loc_00608A7B: mov eax, var_44
  loc_00608A7E: mov [edx+0000000Ch], eax
  loc_00608A81: call [ecx+00000318h]
  loc_00608A87: lea edx, var_20
  loc_00608A8A: push eax
  loc_00608A8B: push edx
  loc_00608A8C: call ebx
  loc_00608A8E: push eax
  loc_00608A8F: call [00401160h] ; __vbaLateIdCallSt
  loc_00608A95: lea eax, var_20
  loc_00608A98: lea ecx, var_1C
  loc_00608A9B: push eax
  loc_00608A9C: push ecx
  loc_00608A9D: push 00000002h
  loc_00608A9F: call [00401040h] ; __vbaFreeObjList
  loc_00608AA5: add esp, 00000048h
  loc_00608AA8: lea edx, var_50
  loc_00608AAB: lea eax, var_40
  loc_00608AAE: lea ecx, var_30
  loc_00608AB1: push edx
  loc_00608AB2: push eax
  loc_00608AB3: push ecx
  loc_00608AB4: push 00000003h
  loc_00608AB6: call [00401038h] ; __vbaFreeVarList
  loc_00608ABC: add esp, 00000010h
  loc_00608ABF: jmp 00608B2Ah
  loc_00608AC1: mov ecx, 80020004h
  loc_00608AC6: mov eax, 0000000Ah
  loc_00608ACB: mov var_58, ecx
  loc_00608ACE: mov var_48, ecx
  loc_00608AD1: mov var_38, ecx
  loc_00608AD4: lea edx, var_70
  loc_00608AD7: lea ecx, var_30
  loc_00608ADA: mov var_60, eax
  loc_00608ADD: mov var_50, eax
  loc_00608AE0: mov var_40, eax
  loc_00608AE3: mov var_68, 004329D8h ; "NotBuy-NUM allow maximun 20 numbers.."
  loc_00608AEA: mov var_70, 00000008h
  loc_00608AF1: call [00401240h] ; __vbaVarDup
  loc_00608AF7: lea edx, var_60
  loc_00608AFA: lea eax, var_50
  loc_00608AFD: push edx
  loc_00608AFE: lea ecx, var_40
  loc_00608B01: push eax
  loc_00608B02: push ecx
  loc_00608B03: lea edx, var_30
  loc_00608B06: push 00000030h
  loc_00608B08: push edx
  loc_00608B09: call [004010A4h] ; rtcMsgBox
  loc_00608B0F: lea eax, var_60
  loc_00608B12: lea ecx, var_50
  loc_00608B15: push eax
  loc_00608B16: lea edx, var_40
  loc_00608B19: push ecx
  loc_00608B1A: lea eax, var_30
  loc_00608B1D: push edx
  loc_00608B1E: push eax
  loc_00608B1F: push 00000004h
  loc_00608B21: call [00401038h] ; __vbaFreeVarList
  loc_00608B27: add esp, 00000014h
  loc_00608B2A: mov ecx, [esi]
  loc_00608B2C: push esi
  loc_00608B2D: call [ecx+00000300h]
  loc_00608B33: lea edx, var_1C
  loc_00608B36: push eax
  loc_00608B37: push edx
  loc_00608B38: call ebx
  loc_00608B3A: mov esi, eax
  loc_00608B3C: push 0041E5D4h
  loc_00608B41: push esi
  loc_00608B42: mov eax, [esi]
  loc_00608B44: call [eax+000000A4h]
  loc_00608B4A: test eax, eax
  loc_00608B4C: fnclex
  loc_00608B4E: jge 00608B62h
  loc_00608B50: push 000000A4h
  loc_00608B55: push 0041E5E8h
  loc_00608B5A: push esi
  loc_00608B5B: push eax
  loc_00608B5C: call [00401074h] ; __vbaHresultCheckObj
  loc_00608B62: lea ecx, var_1C
  loc_00608B65: call [004012B0h] ; __vbaFreeObj
  loc_00608B6B: xor eax, eax
  loc_00608B6D: mov var_4, eax
  loc_00608B70: push 00608BADh
  loc_00608B75: jmp 00608BACh
  loc_00608B77: lea ecx, var_18
  loc_00608B7A: call [004012ACh] ; __vbaFreeStr
  loc_00608B80: lea ecx, var_20
  loc_00608B83: lea edx, var_1C
  loc_00608B86: push ecx
  loc_00608B87: push edx
  loc_00608B88: push 00000002h
  loc_00608B8A: call [00401040h] ; __vbaFreeObjList
  loc_00608B90: lea eax, var_60
  loc_00608B93: lea ecx, var_50
  loc_00608B96: push eax
  loc_00608B97: lea edx, var_40
  loc_00608B9A: push ecx
  loc_00608B9B: lea eax, var_30
  loc_00608B9E: push edx
  loc_00608B9F: push eax
  loc_00608BA0: push 00000004h
  loc_00608BA2: call [00401038h] ; __vbaFreeVarList
  loc_00608BA8: add esp, 00000020h
  loc_00608BAB: ret
  loc_00608BAC: ret
  loc_00608BAD: mov eax, Me
  loc_00608BB0: push eax
  loc_00608BB1: mov ecx, [eax]
  loc_00608BB3: call [ecx+00000008h]
  loc_00608BB6: mov eax, var_4
  loc_00608BB9: mov ecx, var_14
  loc_00608BBC: pop edi
  loc_00608BBD: pop esi
  loc_00608BBE: mov fs:[00000000h], ecx
  loc_00608BC5: pop ebx
  loc_00608BC6: mov esp, ebp
  loc_00608BC8: pop ebp
  loc_00608BC9: retn 0008h
End Sub

Private Sub cmdExit_Click() '606EB0
  loc_00606EB0: push ebp
  loc_00606EB1: mov ebp, esp
  loc_00606EB3: sub esp, 0000000Ch
  loc_00606EB6: push 00403B36h ; __vbaExceptHandler
  loc_00606EBB: mov eax, fs:[00000000h]
  loc_00606EC1: push eax
  loc_00606EC2: mov fs:[00000000h], esp
  loc_00606EC9: sub esp, 00000018h
  loc_00606ECC: push ebx
  loc_00606ECD: push esi
  loc_00606ECE: push edi
  loc_00606ECF: mov var_C, esp
  loc_00606ED2: mov var_8, 00403608h
  loc_00606ED9: mov edi, Me
  loc_00606EDC: mov eax, edi
  loc_00606EDE: and eax, 00000001h
  loc_00606EE1: mov var_4, eax
  loc_00606EE4: and edi, FFFFFFFEh
  loc_00606EE7: push edi
  loc_00606EE8: mov Me, edi
  loc_00606EEB: mov ecx, [edi]
  loc_00606EED: call [ecx+00000004h]
  loc_00606EF0: mov eax, [0061B394h]
  loc_00606EF5: xor ebx, ebx
  loc_00606EF7: cmp eax, ebx
  loc_00606EF9: mov var_18, ebx
  loc_00606EFC: jnz 00606F0Eh
  loc_00606EFE: push 0061B394h
  loc_00606F03: push 0041E4A0h
  loc_00606F08: call [004011DCh] ; __vbaNew2
  loc_00606F0E: mov esi, [0061B394h]
  loc_00606F14: lea eax, var_18
  loc_00606F17: push edi
  loc_00606F18: push eax
  loc_00606F19: mov edx, [esi]
  loc_00606F1B: mov var_2C, edx
  loc_00606F1E: call [004010B8h] ; __vbaObjSetAddref
  loc_00606F24: mov ecx, var_2C
  loc_00606F27: push eax
  loc_00606F28: push esi
  loc_00606F29: call [ecx+00000010h]
  loc_00606F2C: cmp eax, ebx
  loc_00606F2E: fnclex
  loc_00606F30: jge 00606F41h
  loc_00606F32: push 00000010h
  loc_00606F34: push 0041E490h
  loc_00606F39: push esi
  loc_00606F3A: push eax
  loc_00606F3B: call [00401074h] ; __vbaHresultCheckObj
  loc_00606F41: lea ecx, var_18
  loc_00606F44: call [004012B0h] ; __vbaFreeObj
  loc_00606F4A: mov var_4, ebx
  loc_00606F4D: push 00606F5Fh
  loc_00606F52: jmp 00606F5Eh
  loc_00606F54: lea ecx, var_18
  loc_00606F57: call [004012B0h] ; __vbaFreeObj
  loc_00606F5D: ret
  loc_00606F5E: ret
  loc_00606F5F: mov eax, Me
  loc_00606F62: push eax
  loc_00606F63: mov edx, [eax]
  loc_00606F65: call [edx+00000008h]
  loc_00606F68: mov eax, var_4
  loc_00606F6B: mov ecx, var_14
  loc_00606F6E: pop edi
  loc_00606F6F: pop esi
  loc_00606F70: mov fs:[00000000h], ecx
  loc_00606F77: pop ebx
  loc_00606F78: mov esp, ebp
  loc_00606F7A: pop ebp
  loc_00606F7B: retn 0004h
End Sub

Private Sub Proc_30_7_607D60() '607D60
  loc_00607D60: push ebp
  loc_00607D61: mov ebp, esp
  loc_00607D63: sub esp, 00000018h
  loc_00607D66: push 00403B36h ; __vbaExceptHandler
  loc_00607D6B: mov eax, fs:[00000000h]
  loc_00607D71: push eax
  loc_00607D72: mov fs:[00000000h], esp
  loc_00607D79: mov eax, 000000E8h
  loc_00607D7E: call 00403B30h ; __vbaChkstk
  loc_00607D83: push ebx
  loc_00607D84: push esi
  loc_00607D85: push edi
  loc_00607D86: mov var_18, esp
  loc_00607D89: mov var_14, 00403648h ; "&"
  loc_00607D90: mov var_10, 00000000h
  loc_00607D97: mov var_C, 00000000h
  loc_00607D9E: mov var_4, 00000001h
  loc_00607DA5: mov var_4, 00000002h
  loc_00607DAC: push FFFFFFFFh
  loc_00607DAE: call [004010A8h] ; __vbaOnError
  loc_00607DB4: mov var_4, 00000003h
  loc_00607DBB: mov var_6C, 0061A05Ch
  loc_00607DC2: mov var_74, 00004008h
  loc_00607DC9: lea eax, var_74
  loc_00607DCC: push eax
  loc_00607DCD: lea ecx, var_44
  loc_00607DD0: push ecx
  loc_00607DD1: call [004010D4h] ; rtcTrimVar
  loc_00607DD7: mov var_BC, 80020004h
  loc_00607DE1: mov var_C4, 0000000Ah
  loc_00607DEB: mov var_AC, 80020004h
  loc_00607DF5: mov var_B4, 0000000Ah
  loc_00607DFF: mov var_9C, 00000004h
  loc_00607E09: mov var_A4, 00000003h
  loc_00607E13: mov var_7C, 00432B9Ch ; "Select OnCount,NotBuyNum,Serial From NotBuy WHERE OnCount='"
  loc_00607E1A: mov var_84, 00000008h
  loc_00607E24: mov var_8C, 00432C18h ; "' Order By Serial"
  loc_00607E2E: mov var_94, 00000008h
  loc_00607E38: lea edx, var_2C
  loc_00607E3B: push edx
  loc_00607E3C: mov eax, 00000010h
  loc_00607E41: call 00403B30h ; __vbaChkstk
  loc_00607E46: mov eax, esp
  loc_00607E48: mov ecx, var_C4
  loc_00607E4E: mov [eax], ecx
  loc_00607E50: mov edx, var_C0
  loc_00607E56: mov [eax+00000004h], edx
  loc_00607E59: mov ecx, var_BC
  loc_00607E5F: mov [eax+00000008h], ecx
  loc_00607E62: mov edx, var_B8
  loc_00607E68: mov [eax+0000000Ch], edx
  loc_00607E6B: mov eax, 00000010h
  loc_00607E70: call 00403B30h ; __vbaChkstk
  loc_00607E75: mov eax, esp
  loc_00607E77: mov ecx, var_B4
  loc_00607E7D: mov [eax], ecx
  loc_00607E7F: mov edx, var_B0
  loc_00607E85: mov [eax+00000004h], edx
  loc_00607E88: mov ecx, var_AC
  loc_00607E8E: mov [eax+00000008h], ecx
  loc_00607E91: mov edx, var_A8
  loc_00607E97: mov [eax+0000000Ch], edx
  loc_00607E9A: mov eax, 00000010h
  loc_00607E9F: call 00403B30h ; __vbaChkstk
  loc_00607EA4: mov eax, esp
  loc_00607EA6: mov ecx, var_A4
  loc_00607EAC: mov [eax], ecx
  loc_00607EAE: mov edx, var_A0
  loc_00607EB4: mov [eax+00000004h], edx
  loc_00607EB7: mov ecx, var_9C
  loc_00607EBD: mov [eax+00000008h], ecx
  loc_00607EC0: mov edx, var_98
  loc_00607EC6: mov [eax+0000000Ch], edx
  loc_00607EC9: lea eax, var_84
  loc_00607ECF: push eax
  loc_00607ED0: lea ecx, var_44
  loc_00607ED3: push ecx
  loc_00607ED4: lea edx, var_54
  loc_00607ED7: push edx
  loc_00607ED8: call [004011B4h] ; __vbaVarCat
  loc_00607EDE: push eax
  loc_00607EDF: lea eax, var_94
  loc_00607EE5: push eax
  loc_00607EE6: lea ecx, var_64
  loc_00607EE9: push ecx
  loc_00607EEA: call [004011B4h] ; __vbaVarCat
  loc_00607EF0: push eax
  loc_00607EF1: lea edx, var_28
  loc_00607EF4: push edx
  loc_00607EF5: call [004011B0h] ; __vbaStrVarVal
  loc_00607EFB: push eax
  loc_00607EFC: mov eax, [0061A13Ch]
  loc_00607F01: mov ecx, [eax]
  loc_00607F03: mov edx, [0061A13Ch]
  loc_00607F09: push edx
  loc_00607F0A: call [ecx+000000BCh]
  loc_00607F10: fnclex
  loc_00607F12: mov var_CC, eax
  loc_00607F18: cmp var_CC, 00000000h
  loc_00607F1F: jge 00607F46h
  loc_00607F21: push 000000BCh
  loc_00607F26: push 0041E928h
  loc_00607F2B: mov eax, [0061A13Ch]
  loc_00607F30: push eax
  loc_00607F31: mov ecx, var_CC
  loc_00607F37: push ecx
  loc_00607F38: call [00401074h] ; __vbaHresultCheckObj
  loc_00607F3E: mov var_F4, eax
  loc_00607F44: jmp 00607F50h
  loc_00607F46: mov var_F4, 00000000h
  loc_00607F50: mov edx, var_2C
  loc_00607F53: mov var_EC, edx
  loc_00607F59: mov var_2C, 00000000h
  loc_00607F60: mov eax, var_EC
  loc_00607F66: push eax
  loc_00607F67: lea ecx, var_24
  loc_00607F6A: push ecx
  loc_00607F6B: call [004010A0h] ; __vbaObjSet
  loc_00607F71: lea ecx, var_28
  loc_00607F74: call [004012ACh] ; __vbaFreeStr
  loc_00607F7A: lea edx, var_64
  loc_00607F7D: push edx
  loc_00607F7E: lea eax, var_54
  loc_00607F81: push eax
  loc_00607F82: lea ecx, var_44
  loc_00607F85: push ecx
  loc_00607F86: push 00000003h
  loc_00607F88: call [00401038h] ; __vbaFreeVarList
  loc_00607F8E: add esp, 00000010h
  loc_00607F91: mov var_4, 00000004h
  loc_00607F98: lea edx, var_C8
  loc_00607F9E: push edx
  loc_00607F9F: mov eax, var_24
  loc_00607FA2: mov ecx, [eax]
  loc_00607FA4: mov edx, var_24
  loc_00607FA7: push edx
  loc_00607FA8: call [ecx+00000034h]
  loc_00607FAB: fnclex
  loc_00607FAD: mov var_CC, eax
  loc_00607FB3: cmp var_CC, 00000000h
  loc_00607FBA: jge 00607FDCh
  loc_00607FBC: push 00000034h
  loc_00607FBE: push 0041E938h
  loc_00607FC3: mov eax, var_24
  loc_00607FC6: push eax
  loc_00607FC7: mov ecx, var_CC
  loc_00607FCD: push ecx
  loc_00607FCE: call [00401074h] ; __vbaHresultCheckObj
  loc_00607FD4: mov var_F8, eax
  loc_00607FDA: jmp 00607FE6h
  loc_00607FDC: mov var_F8, 00000000h
  loc_00607FE6: movsx edx, var_C8
  loc_00607FED: test edx, edx
  loc_00607FEF: jnz 00608287h
  loc_00607FF5: mov var_4, 00000005h
  loc_00607FFC: mov eax, Me
  loc_00607FFF: mov cx, [eax+00000034h]
  loc_00608003: add cx, 0001h
  loc_00608007: jo 00608358h
  loc_0060800D: mov edx, Me
  loc_00608010: mov [edx+00000034h], cx
  loc_00608014: mov var_4, 00000006h
  loc_0060801B: mov eax, Me
  loc_0060801E: movsx ecx, [eax+00000034h]
  loc_00608022: mov var_7C, ecx
  loc_00608025: mov var_84, 00000003h
  loc_0060802F: mov var_9C, 00000000h
  loc_00608039: mov var_A4, 00000003h
  loc_00608043: lea edx, var_2C
  loc_00608046: push edx
  loc_00608047: mov eax, var_24
  loc_0060804A: mov ecx, [eax]
  loc_0060804C: mov edx, var_24
  loc_0060804F: push edx
  loc_00608050: call [ecx+000000B4h]
  loc_00608056: fnclex
  loc_00608058: mov var_CC, eax
  loc_0060805E: cmp var_CC, 00000000h
  loc_00608065: jge 0060808Ah
  loc_00608067: push 000000B4h
  loc_0060806C: push 0041E938h
  loc_00608071: mov eax, var_24
  loc_00608074: push eax
  loc_00608075: mov ecx, var_CC
  loc_0060807B: push ecx
  loc_0060807C: call [00401074h] ; __vbaHresultCheckObj
  loc_00608082: mov var_FC, eax
  loc_00608088: jmp 00608094h
  loc_0060808A: mov var_FC, 00000000h
  loc_00608094: mov edx, var_2C
  loc_00608097: mov var_D0, edx
  loc_0060809D: mov var_6C, 004288A8h ; "NotBuyNum"
  loc_006080A4: mov var_74, 00000008h
  loc_006080AB: lea eax, var_30
  loc_006080AE: push eax
  loc_006080AF: mov eax, 00000010h
  loc_006080B4: call 00403B30h ; __vbaChkstk
  loc_006080B9: mov ecx, esp
  loc_006080BB: mov edx, var_74
  loc_006080BE: mov [ecx], edx
  loc_006080C0: mov eax, var_70
  loc_006080C3: mov [ecx+00000004h], eax
  loc_006080C6: mov edx, var_6C
  loc_006080C9: mov [ecx+00000008h], edx
  loc_006080CC: mov eax, var_68
  loc_006080CF: mov [ecx+0000000Ch], eax
  loc_006080D2: mov ecx, var_D0
  loc_006080D8: mov edx, [ecx]
  loc_006080DA: mov eax, var_D0
  loc_006080E0: push eax
  loc_006080E1: call [edx+00000030h]
  loc_006080E4: fnclex
  loc_006080E6: mov var_D4, eax
  loc_006080EC: cmp var_D4, 00000000h
  loc_006080F3: jge 00608118h
  loc_006080F5: push 00000030h
  loc_006080F7: push 0041EA14h ; "S"
  loc_006080FC: mov ecx, var_D0
  loc_00608102: push ecx
  loc_00608103: mov edx, var_D4
  loc_00608109: push edx
  loc_0060810A: call [00401074h] ; __vbaHresultCheckObj
  loc_00608110: mov var_100, eax
  loc_00608116: jmp 00608122h
  loc_00608118: mov var_100, 00000000h
  loc_00608122: mov eax, var_30
  loc_00608125: mov var_F0, eax
  loc_0060812B: mov var_30, 00000000h
  loc_00608132: mov ecx, var_F0
  loc_00608138: mov var_3C, ecx
  loc_0060813B: mov var_44, 00000009h
  loc_00608142: lea edx, var_44
  loc_00608145: push edx
  loc_00608146: lea eax, var_54
  loc_00608149: push eax
  loc_0060814A: call [004010D4h] ; rtcTrimVar
  loc_00608150: lea ecx, var_54
  loc_00608153: push ecx
  loc_00608154: call [00401028h] ; __vbaStrVarMove
  loc_0060815A: mov var_5C, eax
  loc_0060815D: mov var_64, 00000008h
  loc_00608164: mov eax, 00000010h
  loc_00608169: call 00403B30h ; __vbaChkstk
  loc_0060816E: mov edx, esp
  loc_00608170: mov eax, var_84
  loc_00608176: mov [edx], eax
  loc_00608178: mov ecx, var_80
  loc_0060817B: mov [edx+00000004h], ecx
  loc_0060817E: mov eax, var_7C
  loc_00608181: mov [edx+00000008h], eax
  loc_00608184: mov ecx, var_78
  loc_00608187: mov [edx+0000000Ch], ecx
  loc_0060818A: mov eax, 00000010h
  loc_0060818F: call 00403B30h ; __vbaChkstk
  loc_00608194: mov edx, esp
  loc_00608196: mov eax, var_A4
  loc_0060819C: mov [edx], eax
  loc_0060819E: mov ecx, var_A0
  loc_006081A4: mov [edx+00000004h], ecx
  loc_006081A7: mov eax, var_9C
  loc_006081AD: mov [edx+00000008h], eax
  loc_006081B0: mov ecx, var_98
  loc_006081B6: mov [edx+0000000Ch], ecx
  loc_006081B9: mov eax, 00000010h
  loc_006081BE: call 00403B30h ; __vbaChkstk
  loc_006081C3: mov edx, esp
  loc_006081C5: mov eax, var_64
  loc_006081C8: mov [edx], eax
  loc_006081CA: mov ecx, var_60
  loc_006081CD: mov [edx+00000004h], ecx
  loc_006081D0: mov eax, var_5C
  loc_006081D3: mov [edx+00000008h], eax
  loc_006081D6: mov ecx, var_58
  loc_006081D9: mov [edx+0000000Ch], ecx
  loc_006081DC: push 00000002h
  loc_006081DE: push 00000041h
  loc_006081E0: mov edx, Me
  loc_006081E3: mov eax, [edx]
  loc_006081E5: mov ecx, Me
  loc_006081E8: push ecx
  loc_006081E9: call [eax+00000318h]
  loc_006081EF: push eax
  loc_006081F0: lea edx, var_34
  loc_006081F3: push edx
  loc_006081F4: call [004010A0h] ; __vbaObjSet
  loc_006081FA: push eax
  loc_006081FB: call [00401160h] ; __vbaLateIdCallSt
  loc_00608201: add esp, 0000003Ch
  loc_00608204: lea eax, var_34
  loc_00608207: push eax
  loc_00608208: lea ecx, var_2C
  loc_0060820B: push ecx
  loc_0060820C: push 00000002h
  loc_0060820E: call [00401040h] ; __vbaFreeObjList
  loc_00608214: add esp, 0000000Ch
  loc_00608217: lea edx, var_64
  loc_0060821A: push edx
  loc_0060821B: lea eax, var_54
  loc_0060821E: push eax
  loc_0060821F: lea ecx, var_44
  loc_00608222: push ecx
  loc_00608223: push 00000003h
  loc_00608225: call [00401038h] ; __vbaFreeVarList
  loc_0060822B: add esp, 00000010h
  loc_0060822E: mov var_4, 00000007h
  loc_00608235: mov edx, var_24
  loc_00608238: mov eax, [edx]
  loc_0060823A: mov ecx, var_24
  loc_0060823D: push ecx
  loc_0060823E: call [eax+000000ECh]
  loc_00608244: fnclex
  loc_00608246: mov var_CC, eax
  loc_0060824C: cmp var_CC, 00000000h
  loc_00608253: jge 00608278h
  loc_00608255: push 000000ECh
  loc_0060825A: push 0041E938h
  loc_0060825F: mov edx, var_24
  loc_00608262: push edx
  loc_00608263: mov eax, var_CC
  loc_00608269: push eax
  loc_0060826A: call [00401074h] ; __vbaHresultCheckObj
  loc_00608270: mov var_104, eax
  loc_00608276: jmp 00608282h
  loc_00608278: mov var_104, 00000000h
  loc_00608282: jmp 00607F91h
  loc_00608287: mov var_4, 00000009h
  loc_0060828E: mov ecx, var_24
  loc_00608291: mov edx, [ecx]
  loc_00608293: mov eax, var_24
  loc_00608296: push eax
  loc_00608297: call [edx+000000C4h]
  loc_0060829D: fnclex
  loc_0060829F: mov var_CC, eax
  loc_006082A5: cmp var_CC, 00000000h
  loc_006082AC: jge 006082D1h
  loc_006082AE: push 000000C4h
  loc_006082B3: push 0041E938h
  loc_006082B8: mov ecx, var_24
  loc_006082BB: push ecx
  loc_006082BC: mov edx, var_CC
  loc_006082C2: push edx
  loc_006082C3: call [00401074h] ; __vbaHresultCheckObj
  loc_006082C9: mov var_108, eax
  loc_006082CF: jmp 006082DBh
  loc_006082D1: mov var_108, 00000000h
  loc_006082DB: mov var_4, 0000000Ah
  loc_006082E2: push 0041E938h
  loc_006082E7: push 00000000h
  loc_006082E9: call [00401274h] ; __vbaCastObj
  loc_006082EF: push eax
  loc_006082F0: lea eax, var_24
  loc_006082F3: push eax
  loc_006082F4: call [004010A0h] ; __vbaObjSet
  loc_006082FA: push 00608343h
  loc_006082FF: jmp 00608339h
  loc_00608301: lea ecx, var_28
  loc_00608304: call [004012ACh] ; __vbaFreeStr
  loc_0060830A: lea ecx, var_34
  loc_0060830D: push ecx
  loc_0060830E: lea edx, var_30
  loc_00608311: push edx
  loc_00608312: lea eax, var_2C
  loc_00608315: push eax
  loc_00608316: push 00000003h
  loc_00608318: call [00401040h] ; __vbaFreeObjList
  loc_0060831E: add esp, 00000010h
  loc_00608321: lea ecx, var_64
  loc_00608324: push ecx
  loc_00608325: lea edx, var_54
  loc_00608328: push edx
  loc_00608329: lea eax, var_44
  loc_0060832C: push eax
  loc_0060832D: push 00000003h
  loc_0060832F: call [00401038h] ; __vbaFreeVarList
  loc_00608335: add esp, 00000010h
  loc_00608338: ret
  loc_00608339: lea ecx, var_24
  loc_0060833C: call [004012B0h] ; __vbaFreeObj
  loc_00608342: ret
  loc_00608343: xor eax, eax
  loc_00608345: mov ecx, var_20
  loc_00608348: mov fs:[00000000h], ecx
  loc_0060834F: pop edi
  loc_00608350: pop esi
  loc_00608351: pop ebx
  loc_00608352: mov esp, ebp
  loc_00608354: pop ebp
  loc_00608355: retn 0004h
End Sub
