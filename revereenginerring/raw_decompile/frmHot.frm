VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Object = "{00025600-0000-0000-C000000000000046}#5.2#0"; "C:\WINDOWS\SysWow64\crystl32.ocx"
Begin VB.Form frmHot
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
    OleObjectBlob = "frmHot.frx":0000
  End
  Begin Crystal.CrystalReport CrystalReport1
    OleObjectBlob = "frmHot.frx":00E4
    Left = -90
    Top = 1305
  End
  Begin VB.TextBox txtNum
    Left = 1290
    Top = 495
    Width = 1335
    Height = 330
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
    Caption = "Hot Number"
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
    Caption = "Hot Num"
    Left = 360
    Top = 540
    Width = 945
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

Attribute VB_Name = "frmHot"


Private Sub Form_Load() '609400
  loc_00609400: push ebp
  loc_00609401: mov ebp, esp
  loc_00609403: sub esp, 0000000Ch
  loc_00609406: push 00403B36h ; __vbaExceptHandler
  loc_0060940B: mov eax, fs:[00000000h]
  loc_00609411: push eax
  loc_00609412: mov fs:[00000000h], esp
  loc_00609419: sub esp, 0000004Ch
  loc_0060941C: push ebx
  loc_0060941D: push esi
  loc_0060941E: push edi
  loc_0060941F: mov var_C, esp
  loc_00609422: mov var_8, 00403708h
  loc_00609429: mov esi, Me
  loc_0060942C: mov eax, esi
  loc_0060942E: and eax, 00000001h
  loc_00609431: mov var_4, eax
  loc_00609434: and esi, FFFFFFFEh
  loc_00609437: push esi
  loc_00609438: mov Me, esi
  loc_0060943B: mov ecx, [esi]
  loc_0060943D: call [ecx+00000004h]
  loc_00609440: sub esp, 00000010h
  loc_00609443: mov ecx, 00000003h
  loc_00609448: mov ebx, esp
  loc_0060944A: mov edi, ecx
  loc_0060944C: xor eax, eax
  loc_0060944E: sub esp, 00000010h
  loc_00609451: mov [ebx], ecx
  loc_00609453: mov ecx, var_24
  loc_00609456: mov var_18, eax
  loc_00609459: mov edx, 00000898h
  loc_0060945E: mov [ebx+00000004h], ecx
  loc_00609461: mov ecx, esp
  loc_00609463: push 00000001h
  loc_00609465: push 00000039h
  loc_00609467: mov [ebx+00000008h], eax
  loc_0060946A: mov eax, var_1C
  loc_0060946D: push esi
  loc_0060946E: mov [esi+00000034h], FFFFFFh
  loc_00609474: mov [ebx+0000000Ch], eax
  loc_00609477: mov eax, var_44
  loc_0060947A: mov [ecx], edi
  loc_0060947C: mov [ecx+00000004h], eax
  loc_0060947F: mov eax, [esi]
  loc_00609481: mov [ecx+00000008h], edx
  loc_00609484: mov edx, var_3C
  loc_00609487: mov [ecx+0000000Ch], edx
  loc_0060948A: call [eax+00000318h]
  loc_00609490: lea ecx, var_18
  loc_00609493: push eax
  loc_00609494: push ecx
  loc_00609495: call [004010A0h] ; __vbaObjSet
  loc_0060949B: push eax
  loc_0060949C: call [00401160h] ; __vbaLateIdCallSt
  loc_006094A2: add esp, 0000002Ch
  loc_006094A5: lea ecx, var_18
  loc_006094A8: call [004012B0h] ; __vbaFreeObj
  loc_006094AE: mov edx, [esi]
  loc_006094B0: push esi
  loc_006094B1: call [edx+00000708h]
  loc_006094B7: mov var_4, 00000000h
  loc_006094BE: push 006094D0h
  loc_006094C3: jmp 006094CFh
  loc_006094C5: lea ecx, var_18
  loc_006094C8: call [004012B0h] ; __vbaFreeObj
  loc_006094CE: ret
  loc_006094CF: ret
  loc_006094D0: mov eax, Me
  loc_006094D3: push eax
  loc_006094D4: mov ecx, [eax]
  loc_006094D6: call [ecx+00000008h]
  loc_006094D9: mov eax, var_4
  loc_006094DC: mov ecx, var_14
  loc_006094DF: pop edi
  loc_006094E0: pop esi
  loc_006094E1: mov fs:[00000000h], ecx
  loc_006094E8: pop ebx
  loc_006094E9: mov esp, ebp
  loc_006094EB: pop ebp
  loc_006094EC: retn 0004h
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer) '6092E0
  loc_006092E0: push ebp
  loc_006092E1: mov ebp, esp
  loc_006092E3: sub esp, 0000000Ch
  loc_006092E6: push 00403B36h ; __vbaExceptHandler
  loc_006092EB: mov eax, fs:[00000000h]
  loc_006092F1: push eax
  loc_006092F2: mov fs:[00000000h], esp
  loc_006092F9: sub esp, 00000018h
  loc_006092FC: push ebx
  loc_006092FD: push esi
  loc_006092FE: push edi
  loc_006092FF: mov var_C, esp
  loc_00609302: mov var_8, 004036F8h
  loc_00609309: mov esi, Me
  loc_0060930C: mov eax, esi
  loc_0060930E: and eax, 00000001h
  loc_00609311: mov var_4, eax
  loc_00609314: and esi, FFFFFFFEh
  loc_00609317: push esi
  loc_00609318: mov Me, esi
  loc_0060931B: mov ecx, [esi]
  loc_0060931D: call [ecx+00000004h]
  loc_00609320: mov edx, KeyCode
  loc_00609323: mov ebx, [00401124h] ; __vbaI2I4
  loc_00609329: mov ecx, 00000070h
  loc_0060932E: mov var_18, 00000000h
  loc_00609335: mov di, [edx]
  loc_00609338: call ebx
  loc_0060933A: cmp di, ax
  loc_0060933D: jnz 00609360h
  loc_0060933F: mov eax, [esi]
  loc_00609341: push esi
  loc_00609342: call [eax+000006FCh]
  loc_00609348: test eax, eax
  loc_0060934A: jge 006093BBh
  loc_0060934C: push 000006FCh
  loc_00609351: push 00427768h
  loc_00609356: push esi
  loc_00609357: push eax
  loc_00609358: call [00401074h] ; __vbaHresultCheckObj
  loc_0060935E: jmp 006093BBh
  loc_00609360: mov ecx, 00000073h
  loc_00609365: call ebx
  loc_00609367: cmp di, ax
  loc_0060936A: jnz 006093BBh
  loc_0060936C: mov eax, [0061B394h]
  loc_00609371: test eax, eax
  loc_00609373: jnz 00609385h
  loc_00609375: push 0061B394h
  loc_0060937A: push 0041E4A0h
  loc_0060937F: call [004011DCh] ; __vbaNew2
  loc_00609385: mov edi, [0061B394h]
  loc_0060938B: lea ecx, var_18
  loc_0060938E: push esi
  loc_0060938F: push ecx
  loc_00609390: mov ebx, [edi]
  loc_00609392: call [004010B8h] ; __vbaObjSetAddref
  loc_00609398: push eax
  loc_00609399: push edi
  loc_0060939A: call [ebx+00000010h]
  loc_0060939D: test eax, eax
  loc_0060939F: fnclex
  loc_006093A1: jge 006093B2h
  loc_006093A3: push 00000010h
  loc_006093A5: push 0041E490h
  loc_006093AA: push edi
  loc_006093AB: push eax
  loc_006093AC: call [00401074h] ; __vbaHresultCheckObj
  loc_006093B2: lea ecx, var_18
  loc_006093B5: call [004012B0h] ; __vbaFreeObj
  loc_006093BB: mov var_4, 00000000h
  loc_006093C2: push 006093D4h
  loc_006093C7: jmp 006093D3h
  loc_006093C9: lea ecx, var_18
  loc_006093CC: call [004012B0h] ; __vbaFreeObj
  loc_006093D2: ret
  loc_006093D3: ret
  loc_006093D4: mov eax, Me
  loc_006093D7: push eax
  loc_006093D8: mov edx, [eax]
  loc_006093DA: call [edx+00000008h]
  loc_006093DD: mov eax, var_4
  loc_006093E0: mov ecx, var_14
  loc_006093E3: pop edi
  loc_006093E4: pop esi
  loc_006093E5: mov fs:[00000000h], ecx
  loc_006093EC: pop ebx
  loc_006093ED: mov esp, ebp
  loc_006093EF: pop ebp
  loc_006093F0: retn 000Ch
End Sub

Private Sub mnuDeleteNum_Click() '609A60
  loc_00609A60: push ebp
  loc_00609A61: mov ebp, esp
  loc_00609A63: sub esp, 0000000Ch
  loc_00609A66: push 00403B36h ; __vbaExceptHandler
  loc_00609A6B: mov eax, fs:[00000000h]
  loc_00609A71: push eax
  loc_00609A72: mov fs:[00000000h], esp
  loc_00609A79: sub esp, 00000118h
  loc_00609A7F: push ebx
  loc_00609A80: push esi
  loc_00609A81: push edi
  loc_00609A82: mov var_C, esp
  loc_00609A85: mov var_8, 00403738h
  loc_00609A8C: mov esi, Me
  loc_00609A8F: mov eax, esi
  loc_00609A91: and eax, 00000001h
  loc_00609A94: mov var_4, eax
  loc_00609A97: and esi, FFFFFFFEh
  loc_00609A9A: push esi
  loc_00609A9B: mov Me, esi
  loc_00609A9E: mov ecx, [esi]
  loc_00609AA0: call [ecx+00000004h]
  loc_00609AA3: mov edx, [esi]
  loc_00609AA5: xor ebx, ebx
  loc_00609AA7: push ebx
  loc_00609AA8: push 0000000Ah
  loc_00609AAA: push esi
  loc_00609AAB: mov var_18, ebx
  loc_00609AAE: mov var_1C, ebx
  loc_00609AB1: mov var_20, ebx
  loc_00609AB4: mov var_30, ebx
  loc_00609AB7: mov var_40, ebx
  loc_00609ABA: mov var_50, ebx
  loc_00609ABD: mov var_60, ebx
  loc_00609AC0: mov var_70, ebx
  loc_00609AC3: mov var_80, ebx
  loc_00609AC6: mov var_90, ebx
  loc_00609ACC: mov var_A0, ebx
  loc_00609AD2: mov var_F0, ebx
  loc_00609AD8: call [edx+00000318h]
  loc_00609ADE: push eax
  loc_00609ADF: lea eax, var_1C
  loc_00609AE2: push eax
  loc_00609AE3: call [004010A0h] ; __vbaObjSet
  loc_00609AE9: lea ecx, var_30
  loc_00609AEC: push eax
  loc_00609AED: push ecx
  loc_00609AEE: call [00401140h] ; __vbaLateIdCallLd
  loc_00609AF4: add esp, 00000010h
  loc_00609AF7: push eax
  loc_00609AF8: call [0040121Ch] ; __vbaI4Var
  loc_00609AFE: sub esp, 00000010h
  loc_00609B01: mov ecx, 00000003h
  loc_00609B06: mov edx, esp
  loc_00609B08: sub esp, 00000010h
  loc_00609B0B: mov [edx], ecx
  loc_00609B0D: mov ecx, var_AC
  loc_00609B13: mov [edx+00000004h], ecx
  loc_00609B16: mov ecx, esp
  loc_00609B18: push 00000002h
  loc_00609B1A: push 00000041h
  loc_00609B1C: mov [edx+00000008h], eax
  loc_00609B1F: mov eax, var_A4
  loc_00609B25: push esi
  loc_00609B26: mov [edx+0000000Ch], eax
  loc_00609B29: mov edx, var_CC
  loc_00609B2F: mov eax, 00000003h
  loc_00609B34: mov [ecx], eax
  loc_00609B36: mov eax, var_C4
  loc_00609B3C: mov [ecx+00000004h], edx
  loc_00609B3F: mov [ecx+00000008h], ebx
  loc_00609B42: mov [ecx+0000000Ch], eax
  loc_00609B45: mov ecx, [esi]
  loc_00609B47: call [ecx+00000318h]
  loc_00609B4D: lea edx, var_20
  loc_00609B50: push eax
  loc_00609B51: push edx
  loc_00609B52: call [004010A0h] ; __vbaObjSet
  loc_00609B58: push eax
  loc_00609B59: lea eax, var_40
  loc_00609B5C: push eax
  loc_00609B5D: call [00401140h] ; __vbaLateIdCallLd
  loc_00609B63: add esp, 00000030h
  loc_00609B66: push eax
  loc_00609B67: call [00401028h] ; __vbaStrVarMove
  loc_00609B6D: mov edx, eax
  loc_00609B6F: lea ecx, var_18
  loc_00609B72: call [00401270h] ; __vbaStrMove
  loc_00609B78: push eax
  loc_00609B79: push 0041E5D4h
  loc_00609B7E: call [0040110Ch] ; __vbaStrCmp
  loc_00609B84: mov edi, eax
  loc_00609B86: lea ecx, var_18
  loc_00609B89: neg edi
  loc_00609B8B: sbb edi, edi
  loc_00609B8D: neg edi
  loc_00609B8F: neg edi
  loc_00609B91: call [004012ACh] ; __vbaFreeStr
  loc_00609B97: lea ecx, var_20
  loc_00609B9A: lea edx, var_1C
  loc_00609B9D: push ecx
  loc_00609B9E: push edx
  loc_00609B9F: push 00000002h
  loc_00609BA1: call [00401040h] ; __vbaFreeObjList
  loc_00609BA7: lea eax, var_40
  loc_00609BAA: lea ecx, var_30
  loc_00609BAD: push eax
  loc_00609BAE: push ecx
  loc_00609BAF: push 00000002h
  loc_00609BB1: call [00401038h] ; __vbaFreeVarList
  loc_00609BB7: add esp, 00000018h
  loc_00609BBA: cmp di, bx
  loc_00609BBD: jz 00609DD8h
  loc_00609BC3: mov edx, [esi]
  loc_00609BC5: push ebx
  loc_00609BC6: push 0000000Ah
  loc_00609BC8: push esi
  loc_00609BC9: call [edx+00000318h]
  loc_00609BCF: mov edi, [004010A0h] ; __vbaObjSet
  loc_00609BD5: push eax
  loc_00609BD6: lea eax, var_1C
  loc_00609BD9: push eax
  loc_00609BDA: call edi
  loc_00609BDC: lea ecx, var_30
  loc_00609BDF: push eax
  loc_00609BE0: push ecx
  loc_00609BE1: call [00401140h] ; __vbaLateIdCallLd
  loc_00609BE7: add esp, 00000010h
  loc_00609BEA: push eax
  loc_00609BEB: call [0040121Ch] ; __vbaI4Var
  loc_00609BF1: sub esp, 00000010h
  loc_00609BF4: mov ecx, 00000003h
  loc_00609BF9: mov edx, esp
  loc_00609BFB: mov var_D0, ecx
  loc_00609C01: sub esp, 00000010h
  loc_00609C04: mov [edx], ecx
  loc_00609C06: mov ecx, var_AC
  loc_00609C0C: mov [edx+00000004h], ecx
  loc_00609C0F: mov ecx, esp
  loc_00609C11: push 00000002h
  loc_00609C13: push 00000041h
  loc_00609C15: mov [edx+00000008h], eax
  loc_00609C18: mov eax, var_A4
  loc_00609C1E: push esi
  loc_00609C1F: mov [edx+0000000Ch], eax
  loc_00609C22: mov edx, var_D0
  loc_00609C28: mov eax, var_CC
  loc_00609C2E: mov [ecx], edx
  loc_00609C30: mov edx, var_C4
  loc_00609C36: mov [ecx+00000004h], eax
  loc_00609C39: xor eax, eax
  loc_00609C3B: mov [ecx+00000008h], eax
  loc_00609C3E: mov eax, [esi]
  loc_00609C40: mov [ecx+0000000Ch], edx
  loc_00609C43: call [eax+00000318h]
  loc_00609C49: lea ecx, var_20
  loc_00609C4C: push eax
  loc_00609C4D: push ecx
  loc_00609C4E: call edi
  loc_00609C50: lea edx, var_40
  loc_00609C53: push eax
  loc_00609C54: push edx
  loc_00609C55: call [00401140h] ; __vbaLateIdCallLd
  loc_00609C5B: add esp, 00000030h
  loc_00609C5E: push eax
  loc_00609C5F: call [00401028h] ; __vbaStrVarMove
  loc_00609C65: mov var_48, eax
  loc_00609C68: lea eax, var_50
  loc_00609C6B: lea ecx, var_60
  loc_00609C6E: push eax
  loc_00609C6F: push ecx
  loc_00609C70: mov var_50, 00000008h
  loc_00609C77: call [004010D4h] ; rtcTrimVar
  loc_00609C7D: mov eax, 80020004h
  loc_00609C82: mov ecx, 0000000Ah
  loc_00609C87: mov var_98, eax
  loc_00609C8D: mov var_88, eax
  loc_00609C93: mov var_78, eax
  loc_00609C96: lea edx, var_A0
  loc_00609C9C: mov var_A0, ecx
  loc_00609CA2: mov var_90, ecx
  loc_00609CA8: mov var_80, ecx
  loc_00609CAB: lea eax, var_90
  loc_00609CB1: push edx
  loc_00609CB2: lea ecx, var_80
  loc_00609CB5: push eax
  loc_00609CB6: push ecx
  loc_00609CB7: lea edx, var_F0
  loc_00609CBD: push 00000134h
  loc_00609CC2: lea eax, var_60
  loc_00609CC5: push edx
  loc_00609CC6: mov var_E8, 00432C40h ; "Are you sure to delete ? "
  loc_00609CD0: mov var_F0, 00000008h
  loc_00609CDA: push eax
  loc_00609CDB: lea ecx, var_70
  loc_00609CDE: push ecx
  loc_00609CDF: call [004011B4h] ; __vbaVarCat
  loc_00609CE5: push eax
  loc_00609CE6: call [004010A4h] ; rtcMsgBox
  loc_00609CEC: xor edx, edx
  loc_00609CEE: cmp eax, 00000006h
  loc_00609CF1: lea eax, var_20
  loc_00609CF4: lea ecx, var_1C
  loc_00609CF7: setz dl
  loc_00609CFA: push eax
  loc_00609CFB: push ecx
  loc_00609CFC: neg edx
  loc_00609CFE: push 00000002h
  loc_00609D00: mov var_124, edx
  loc_00609D06: call [00401040h] ; __vbaFreeObjList
  loc_00609D0C: lea edx, var_A0
  loc_00609D12: lea eax, var_90
  loc_00609D18: push edx
  loc_00609D19: lea ecx, var_80
  loc_00609D1C: push eax
  loc_00609D1D: lea edx, var_70
  loc_00609D20: push ecx
  loc_00609D21: lea eax, var_60
  loc_00609D24: push edx
  loc_00609D25: lea ecx, var_50
  loc_00609D28: push eax
  loc_00609D29: lea edx, var_40
  loc_00609D2C: push ecx
  loc_00609D2D: lea eax, var_30
  loc_00609D30: push edx
  loc_00609D31: push eax
  loc_00609D32: push 00000008h
  loc_00609D34: call [00401038h] ; __vbaFreeVarList
  loc_00609D3A: add esp, 00000030h
  loc_00609D3D: cmp var_124, bx
  loc_00609D44: jz 00609DD8h
  loc_00609D4A: mov ecx, [esi]
  loc_00609D4C: push ebx
  loc_00609D4D: push 0000000Ah
  loc_00609D4F: push esi
  loc_00609D50: call [ecx+00000318h]
  loc_00609D56: lea edx, var_1C
  loc_00609D59: push eax
  loc_00609D5A: push edx
  loc_00609D5B: call edi
  loc_00609D5D: push eax
  loc_00609D5E: lea eax, var_30
  loc_00609D61: push eax
  loc_00609D62: call [00401140h] ; __vbaLateIdCallLd
  loc_00609D68: add esp, 00000010h
  loc_00609D6B: push eax
  loc_00609D6C: call [0040121Ch] ; __vbaI4Var
  loc_00609D72: sub esp, 00000010h
  loc_00609D75: mov ecx, 00000003h
  loc_00609D7A: mov edx, esp
  loc_00609D7C: push 00000001h
  loc_00609D7E: push 00000043h
  loc_00609D80: mov [edx], ecx
  loc_00609D82: mov ecx, var_AC
  loc_00609D88: push esi
  loc_00609D89: mov [edx+00000004h], ecx
  loc_00609D8C: mov ecx, [esi]
  loc_00609D8E: mov [edx+00000008h], eax
  loc_00609D91: mov eax, var_A4
  loc_00609D97: mov [edx+0000000Ch], eax
  loc_00609D9A: call [ecx+00000318h]
  loc_00609DA0: lea edx, var_20
  loc_00609DA3: push eax
  loc_00609DA4: push edx
  loc_00609DA5: call edi
  loc_00609DA7: push eax
  loc_00609DA8: call [00401024h] ; __vbaLateIdCall
  loc_00609DAE: lea eax, var_20
  loc_00609DB1: lea ecx, var_1C
  loc_00609DB4: push eax
  loc_00609DB5: push ecx
  loc_00609DB6: push 00000002h
  loc_00609DB8: call [00401040h] ; __vbaFreeObjList
  loc_00609DBE: add esp, 00000028h
  loc_00609DC1: lea ecx, var_30
  loc_00609DC4: call [00401020h] ; __vbaFreeVar
  loc_00609DCA: mov dx, [esi+00000034h]
  loc_00609DCE: sub dx, 0001h
  loc_00609DD2: jo 00609E4Dh
  loc_00609DD4: mov [esi+00000034h], dx
  loc_00609DD8: mov var_4, ebx
  loc_00609DDB: push 00609E2Eh
  loc_00609DE0: jmp 00609E2Dh
  loc_00609DE2: lea ecx, var_18
  loc_00609DE5: call [004012ACh] ; __vbaFreeStr
  loc_00609DEB: lea eax, var_20
  loc_00609DEE: lea ecx, var_1C
  loc_00609DF1: push eax
  loc_00609DF2: push ecx
  loc_00609DF3: push 00000002h
  loc_00609DF5: call [00401040h] ; __vbaFreeObjList
  loc_00609DFB: lea edx, var_A0
  loc_00609E01: lea eax, var_90
  loc_00609E07: push edx
  loc_00609E08: lea ecx, var_80
  loc_00609E0B: push eax
  loc_00609E0C: lea edx, var_70
  loc_00609E0F: push ecx
  loc_00609E10: lea eax, var_60
  loc_00609E13: push edx
  loc_00609E14: lea ecx, var_50
  loc_00609E17: push eax
  loc_00609E18: lea edx, var_40
  loc_00609E1B: push ecx
  loc_00609E1C: lea eax, var_30
  loc_00609E1F: push edx
  loc_00609E20: push eax
  loc_00609E21: push 00000008h
  loc_00609E23: call [00401038h] ; __vbaFreeVarList
  loc_00609E29: add esp, 00000030h
  loc_00609E2C: ret
  loc_00609E2D: ret
  loc_00609E2E: mov eax, Me
  loc_00609E31: push eax
  loc_00609E32: mov ecx, [eax]
  loc_00609E34: call [ecx+00000008h]
  loc_00609E37: mov eax, var_4
  loc_00609E3A: mov ecx, var_14
  loc_00609E3D: pop edi
  loc_00609E3E: pop esi
  loc_00609E3F: mov fs:[00000000h], ecx
  loc_00609E46: pop ebx
  loc_00609E47: mov esp, ebp
  loc_00609E49: pop ebp
  loc_00609E4A: retn 0004h
End Sub

Private Sub Grid_MouseDown(Button As Integer, Shift As Integer, x As OLE_XPOS_PIXELS, y As OLE_YPOS_PIXELS) '609910
  loc_00609910: push ebp
  loc_00609911: mov ebp, esp
  loc_00609913: sub esp, 0000000Ch
  loc_00609916: push 00403B36h ; __vbaExceptHandler
  loc_0060991B: mov eax, fs:[00000000h]
  loc_00609921: push eax
  loc_00609922: mov fs:[00000000h], esp
  loc_00609929: sub esp, 00000050h
  loc_0060992C: push ebx
  loc_0060992D: push esi
  loc_0060992E: push edi
  loc_0060992F: mov var_C, esp
  loc_00609932: mov var_8, 00403728h
  loc_00609939: mov esi, Me
  loc_0060993C: mov eax, esi
  loc_0060993E: and eax, 00000001h
  loc_00609941: mov var_4, eax
  loc_00609944: and esi, FFFFFFFEh
  loc_00609947: push esi
  loc_00609948: mov Me, esi
  loc_0060994B: mov ecx, [esi]
  loc_0060994D: call [ecx+00000004h]
  loc_00609950: mov edx, Button
  loc_00609953: xor edi, edi
  loc_00609955: mov var_18, edi
  loc_00609958: mov var_28, edi
  loc_0060995B: cmp [edx], 0002h
  loc_0060995F: mov var_38, edi
  loc_00609962: mov var_48, edi
  loc_00609965: mov var_58, edi
  loc_00609968: jnz 00609A2Ch
  loc_0060996E: sub esp, 00000010h
  loc_00609971: mov ecx, 0000000Ah
  loc_00609976: mov ebx, esp
  loc_00609978: mov var_28, ecx
  loc_0060997B: mov edx, 80020004h
  loc_00609980: sub esp, 00000010h
  loc_00609983: mov [ebx], ecx
  loc_00609985: mov ecx, var_54
  loc_00609988: mov eax, edx
  loc_0060998A: mov var_20, edx
  loc_0060998D: mov [ebx+00000004h], ecx
  loc_00609990: mov ecx, esp
  loc_00609992: sub esp, 00000010h
  loc_00609995: mov edi, [esi]
  loc_00609997: mov [ebx+00000008h], eax
  loc_0060999A: mov eax, var_4C
  loc_0060999D: mov [ebx+0000000Ch], eax
  loc_006099A0: mov eax, 0000000Ah
  loc_006099A5: mov [ecx], eax
  loc_006099A7: mov eax, var_44
  loc_006099AA: mov [ecx+00000004h], eax
  loc_006099AD: mov eax, 0000000Ah
  loc_006099B2: mov [ecx+00000008h], edx
  loc_006099B5: mov edx, var_3C
  loc_006099B8: mov [ecx+0000000Ch], edx
  loc_006099BB: mov edx, var_34
  loc_006099BE: mov ecx, esp
  loc_006099C0: sub esp, 00000010h
  loc_006099C3: mov [ecx], eax
  loc_006099C5: mov eax, 80020004h
  loc_006099CA: mov [ecx+00000004h], edx
  loc_006099CD: mov edx, var_28
  loc_006099D0: mov [ecx+00000008h], eax
  loc_006099D3: mov eax, var_2C
  loc_006099D6: mov [ecx+0000000Ch], eax
  loc_006099D9: mov eax, var_24
  loc_006099DC: mov ecx, esp
  loc_006099DE: push esi
  loc_006099DF: mov [ecx], edx
  loc_006099E1: mov edx, var_20
  loc_006099E4: mov [ecx+00000004h], eax
  loc_006099E7: mov eax, var_1C
  loc_006099EA: mov [ecx+00000008h], edx
  loc_006099ED: mov [ecx+0000000Ch], eax
  loc_006099F0: call [edi+00000310h]
  loc_006099F6: lea ecx, var_18
  loc_006099F9: push eax
  loc_006099FA: push ecx
  loc_006099FB: call [004010A0h] ; __vbaObjSet
  loc_00609A01: push eax
  loc_00609A02: push esi
  loc_00609A03: call [edi+000002BCh]
  loc_00609A09: xor edi, edi
  loc_00609A0B: cmp eax, edi
  loc_00609A0D: fnclex
  loc_00609A0F: jge 00609A23h
  loc_00609A11: push 000002BCh
  loc_00609A16: push 00427738h
  loc_00609A1B: push esi
  loc_00609A1C: push eax
  loc_00609A1D: call [00401074h] ; __vbaHresultCheckObj
  loc_00609A23: lea ecx, var_18
  loc_00609A26: call [004012B0h] ; __vbaFreeObj
  loc_00609A2C: mov var_4, edi
  loc_00609A2F: push 00609A41h
  loc_00609A34: jmp 00609A40h
  loc_00609A36: lea ecx, var_18
  loc_00609A39: call [004012B0h] ; __vbaFreeObj
  loc_00609A3F: ret
  loc_00609A40: ret
  loc_00609A41: mov eax, Me
  loc_00609A44: push eax
  loc_00609A45: mov edx, [eax]
  loc_00609A47: call [edx+00000008h]
  loc_00609A4A: mov eax, var_4
  loc_00609A4D: mov ecx, var_14
  loc_00609A50: pop edi
  loc_00609A51: pop esi
  loc_00609A52: mov fs:[00000000h], ecx
  loc_00609A59: pop ebx
  loc_00609A5A: mov esp, ebp
  loc_00609A5C: pop ebp
  loc_00609A5D: retn 0014h
End Sub

Private Sub cmdSave_Click() '608D80
  loc_00608D80: push ebp
  loc_00608D81: mov ebp, esp
  loc_00608D83: sub esp, 0000000Ch
  loc_00608D86: push 00403B36h ; __vbaExceptHandler
  loc_00608D8B: mov eax, fs:[00000000h]
  loc_00608D91: push eax
  loc_00608D92: mov fs:[00000000h], esp
  loc_00608D99: sub esp, 0000012Ch
  loc_00608D9F: push ebx
  loc_00608DA0: push esi
  loc_00608DA1: push edi
  loc_00608DA2: mov var_C, esp
  loc_00608DA5: mov var_8, 004036E8h
  loc_00608DAC: mov edi, Me
  loc_00608DAF: mov eax, edi
  loc_00608DB1: and eax, 00000001h
  loc_00608DB4: mov var_4, eax
  loc_00608DB7: and edi, FFFFFFFEh
  loc_00608DBA: push edi
  loc_00608DBB: mov Me, edi
  loc_00608DBE: mov ecx, [edi]
  loc_00608DC0: call [ecx+00000004h]
  loc_00608DC3: xor eax, eax
  loc_00608DC5: lea edx, var_B0
  loc_00608DCB: mov var_18, eax
  loc_00608DCE: mov var_1C, eax
  loc_00608DD1: mov var_20, eax
  loc_00608DD4: mov var_30, eax
  loc_00608DD7: mov var_40, eax
  loc_00608DDA: mov var_50, eax
  loc_00608DDD: mov var_60, eax
  loc_00608DE0: mov var_70, eax
  loc_00608DE3: mov var_80, eax
  loc_00608DE6: mov var_90, eax
  loc_00608DEC: mov var_A0, eax
  loc_00608DF2: mov var_B0, eax
  loc_00608DF8: mov var_C0, eax
  loc_00608DFE: mov var_D0, eax
  loc_00608E04: mov var_F0, eax
  loc_00608E0A: mov var_100, eax
  loc_00608E10: mov var_120, eax
  loc_00608E16: mov var_130, eax
  loc_00608E1C: lea eax, var_30
  loc_00608E1F: push edx
  loc_00608E20: push eax
  loc_00608E21: mov esi, 80020004h
  loc_00608E26: mov ebx, 0000000Ah
  loc_00608E2B: mov var_B8, 004327E8h ; "DELETE From Hot WHERE OnCount='"
  loc_00608E35: mov var_C0, 00000008h
  loc_00608E3F: mov var_A8, 0061A05Ch
  loc_00608E49: mov var_B0, 00004008h
  loc_00608E53: call [004010D4h] ; rtcTrimVar
  loc_00608E59: mov ecx, [0061A13Ch]
  loc_00608E5F: sub esp, 00000010h
  loc_00608E62: mov eax, esp
  loc_00608E64: mov var_C8, 0041E890h ; "'"
  loc_00608E6E: mov var_D0, 00000008h
  loc_00608E78: mov edx, [ecx]
  loc_00608E7A: mov ecx, var_DC
  loc_00608E80: mov [eax], ebx
  loc_00608E82: mov var_140, edx
  loc_00608E88: mov [eax+00000004h], ecx
  loc_00608E8B: mov ecx, var_D4
  loc_00608E91: mov [eax+00000008h], esi
  loc_00608E94: mov esi, [004011B4h] ; __vbaVarCat
  loc_00608E9A: mov [eax+0000000Ch], ecx
  loc_00608E9D: lea eax, var_C0
  loc_00608EA3: push eax
  loc_00608EA4: lea ecx, var_30
  loc_00608EA7: lea eax, var_40
  loc_00608EAA: push ecx
  loc_00608EAB: push eax
  loc_00608EAC: call __vbaVarCat
  loc_00608EAE: lea ecx, var_D0
  loc_00608EB4: push eax
  loc_00608EB5: lea edx, var_50
  loc_00608EB8: push ecx
  loc_00608EB9: push edx
  loc_00608EBA: call __vbaVarCat
  loc_00608EBC: push eax
  loc_00608EBD: lea eax, var_1C
  loc_00608EC0: push eax
  loc_00608EC1: call [004011B0h] ; __vbaStrVarVal
  loc_00608EC7: mov ecx, [0061A13Ch]
  loc_00608ECD: mov edx, var_140
  loc_00608ED3: push eax
  loc_00608ED4: push ecx
  loc_00608ED5: call [edx+0000005Ch]
  loc_00608ED8: fnclex
  loc_00608EDA: test eax, eax
  loc_00608EDC: jge 00608EF3h
  loc_00608EDE: mov ecx, [0061A13Ch]
  loc_00608EE4: push 0000005Ch
  loc_00608EE6: push 0041E928h
  loc_00608EEB: push ecx
  loc_00608EEC: push eax
  loc_00608EED: call [00401074h] ; __vbaHresultCheckObj
  loc_00608EF3: lea ecx, var_1C
  loc_00608EF6: call [004012ACh] ; __vbaFreeStr
  loc_00608EFC: lea edx, var_50
  loc_00608EFF: lea eax, var_40
  loc_00608F02: push edx
  loc_00608F03: lea ecx, var_30
  loc_00608F06: push eax
  loc_00608F07: push ecx
  loc_00608F08: push 00000003h
  loc_00608F0A: call [00401038h] ; __vbaFreeVarList
  loc_00608F10: mov eax, var_18
  loc_00608F13: add esp, 00000010h
  loc_00608F16: sub esp, 00000010h
  loc_00608F19: mov ecx, var_A4
  loc_00608F1F: movsx ebx, ax
  loc_00608F22: mov edx, esp
  loc_00608F24: mov eax, 00000003h
  loc_00608F29: mov var_B0, eax
  loc_00608F2F: mov var_D0, eax
  loc_00608F35: mov [edx], eax
  loc_00608F37: mov eax, var_AC
  loc_00608F3D: sub esp, 00000010h
  loc_00608F40: mov var_C8, 00000000h
  loc_00608F4A: mov [edx+00000004h], eax
  loc_00608F4D: mov eax, var_D0
  loc_00608F53: mov var_A8, ebx
  loc_00608F59: mov [edx+00000008h], ebx
  loc_00608F5C: mov [edx+0000000Ch], ecx
  loc_00608F5F: mov ecx, var_CC
  loc_00608F65: mov edx, esp
  loc_00608F67: push 00000002h
  loc_00608F69: push 00000041h
  loc_00608F6B: push edi
  loc_00608F6C: mov [edx], eax
  loc_00608F6E: mov eax, var_C8
  loc_00608F74: mov [edx+00000004h], ecx
  loc_00608F77: mov ecx, var_C4
  loc_00608F7D: mov [edx+00000008h], eax
  loc_00608F80: mov [edx+0000000Ch], ecx
  loc_00608F83: mov edx, [edi]
  loc_00608F85: call [edx+00000318h]
  loc_00608F8B: push eax
  loc_00608F8C: lea eax, var_20
  loc_00608F8F: push eax
  loc_00608F90: call [004010A0h] ; __vbaObjSet
  loc_00608F96: lea ecx, var_30
  loc_00608F99: push eax
  loc_00608F9A: push ecx
  loc_00608F9B: call [00401140h] ; __vbaLateIdCallLd
  loc_00608FA1: add esp, 00000030h
  loc_00608FA4: push eax
  loc_00608FA5: call [00401028h] ; __vbaStrVarMove
  loc_00608FAB: mov var_38, eax
  loc_00608FAE: lea edx, var_40
  loc_00608FB1: lea eax, var_50
  loc_00608FB4: push edx
  loc_00608FB5: push eax
  loc_00608FB6: mov var_40, 00000008h
  loc_00608FBD: call [004010D4h] ; rtcTrimVar
  loc_00608FC3: lea ecx, var_50
  loc_00608FC6: lea edx, var_F0
  loc_00608FCC: push ecx
  loc_00608FCD: push edx
  loc_00608FCE: mov var_E8, 0041E5D4h
  loc_00608FD8: mov var_F0, 00008008h
  loc_00608FE2: call [00401218h] ; __vbaVarTstNe
  loc_00608FE8: lea ecx, var_20
  loc_00608FEB: mov var_134, ax
  loc_00608FF2: call [004012B0h] ; __vbaFreeObj
  loc_00608FF8: lea eax, var_50
  loc_00608FFB: lea ecx, var_40
  loc_00608FFE: push eax
  loc_00608FFF: lea edx, var_30
  loc_00609002: push ecx
  loc_00609003: push edx
  loc_00609004: push 00000003h
  loc_00609006: call [00401038h] ; __vbaFreeVarList
  loc_0060900C: add esp, 00000010h
  loc_0060900F: cmp var_134, 0000h
  loc_00609017: jz 006091F2h
  loc_0060901D: lea eax, var_B0
  loc_00609023: lea ecx, var_30
  loc_00609026: push eax
  loc_00609027: push ecx
  loc_00609028: mov var_A8, 0061A05Ch
  loc_00609032: mov var_B0, 00004008h
  loc_0060903C: call [004010D4h] ; rtcTrimVar
  loc_00609042: sub esp, 00000010h
  loc_00609045: mov eax, 00000003h
  loc_0060904A: mov edx, esp
  loc_0060904C: sub esp, 00000010h
  loc_0060904F: xor ecx, ecx
  loc_00609051: mov [edx], eax
  loc_00609053: mov eax, var_DC
  loc_00609059: mov [edx+00000004h], eax
  loc_0060905C: mov eax, var_D4
  loc_00609062: mov [edx+00000008h], ebx
  loc_00609065: mov [edx+0000000Ch], eax
  loc_00609068: mov edx, esp
  loc_0060906A: mov eax, 00000003h
  loc_0060906F: push 00000002h
  loc_00609071: mov [edx], eax
  loc_00609073: mov eax, var_FC
  loc_00609079: push 00000041h
  loc_0060907B: push edi
  loc_0060907C: mov [edx+00000004h], eax
  loc_0060907F: mov [edx+00000008h], ecx
  loc_00609082: mov ecx, var_F4
  loc_00609088: mov [edx+0000000Ch], ecx
  loc_0060908B: mov edx, [edi]
  loc_0060908D: call [edx+00000318h]
  loc_00609093: push eax
  loc_00609094: lea eax, var_20
  loc_00609097: push eax
  loc_00609098: call [004010A0h] ; __vbaObjSet
  loc_0060909E: lea ecx, var_60
  loc_006090A1: push eax
  loc_006090A2: push ecx
  loc_006090A3: call [00401140h] ; __vbaLateIdCallLd
  loc_006090A9: add esp, 00000030h
  loc_006090AC: push eax
  loc_006090AD: call [00401028h] ; __vbaStrVarMove
  loc_006090B3: mov var_68, eax
  loc_006090B6: lea edx, var_70
  loc_006090B9: lea eax, var_80
  loc_006090BC: mov ebx, 00000008h
  loc_006090C1: push edx
  loc_006090C2: push eax
  loc_006090C3: mov var_70, ebx
  loc_006090C6: call [004010D4h] ; rtcTrimVar
  loc_006090CC: mov edx, [0061A13Ch]
  loc_006090D2: mov var_B8, 0043282Ch ; "INSERT INTO Hot VALUES('"
  loc_006090DC: mov var_C0, ebx
  loc_006090E2: mov var_C8, 0043043Ch ; "','"
  loc_006090EC: mov var_D0, ebx
  loc_006090F2: mov var_118, 004333FCh ; "')"
  loc_006090FC: mov var_120, ebx
  loc_00609102: mov ebx, [edx]
  loc_00609104: sub esp, 00000010h
  loc_00609107: mov ecx, 0000000Ah
  loc_0060910C: mov edx, esp
  loc_0060910E: mov eax, 80020004h
  loc_00609113: mov [edx], ecx
  loc_00609115: mov ecx, var_12C
  loc_0060911B: mov [edx+00000004h], ecx
  loc_0060911E: lea ecx, var_C0
  loc_00609124: push ecx
  loc_00609125: mov [edx+00000008h], eax
  loc_00609128: mov eax, var_124
  loc_0060912E: mov [edx+0000000Ch], eax
  loc_00609131: lea edx, var_30
  loc_00609134: lea eax, var_40
  loc_00609137: push edx
  loc_00609138: push eax
  loc_00609139: call __vbaVarCat
  loc_0060913B: lea ecx, var_D0
  loc_00609141: push eax
  loc_00609142: lea edx, var_50
  loc_00609145: push ecx
  loc_00609146: push edx
  loc_00609147: call __vbaVarCat
  loc_00609149: push eax
  loc_0060914A: lea eax, var_80
  loc_0060914D: lea ecx, var_90
  loc_00609153: push eax
  loc_00609154: push ecx
  loc_00609155: call __vbaVarCat
  loc_00609157: push eax
  loc_00609158: lea edx, var_120
  loc_0060915E: lea eax, var_A0
  loc_00609164: push edx
  loc_00609165: push eax
  loc_00609166: call __vbaVarCat
  loc_00609168: lea ecx, var_1C
  loc_0060916B: push eax
  loc_0060916C: push ecx
  loc_0060916D: call [004011B0h] ; __vbaStrVarVal
  loc_00609173: mov edx, [0061A13Ch]
  loc_00609179: push eax
  loc_0060917A: push edx
  loc_0060917B: call [ebx+0000005Ch]
  loc_0060917E: test eax, eax
  loc_00609180: fnclex
  loc_00609182: jge 00609199h
  loc_00609184: mov ecx, [0061A13Ch]
  loc_0060918A: push 0000005Ch
  loc_0060918C: push 0041E928h
  loc_00609191: push ecx
  loc_00609192: push eax
  loc_00609193: call [00401074h] ; __vbaHresultCheckObj
  loc_00609199: lea ecx, var_1C
  loc_0060919C: call [004012ACh] ; __vbaFreeStr
  loc_006091A2: lea ecx, var_20
  loc_006091A5: call [004012B0h] ; __vbaFreeObj
  loc_006091AB: lea edx, var_A0
  loc_006091B1: lea eax, var_90
  loc_006091B7: push edx
  loc_006091B8: lea ecx, var_80
  loc_006091BB: push eax
  loc_006091BC: lea edx, var_50
  loc_006091BF: push ecx
  loc_006091C0: lea eax, var_70
  loc_006091C3: push edx
  loc_006091C4: lea ecx, var_60
  loc_006091C7: push eax
  loc_006091C8: lea edx, var_40
  loc_006091CB: push ecx
  loc_006091CC: lea eax, var_30
  loc_006091CF: push edx
  loc_006091D0: push eax
  loc_006091D1: push 00000008h
  loc_006091D3: call [00401038h] ; __vbaFreeVarList
  loc_006091D9: mov ax, var_18
  loc_006091DD: add esp, 00000024h
  loc_006091E0: add ax, 0001h
  loc_006091E4: jo 006092D6h
  loc_006091EA: mov var_18, eax
  loc_006091ED: jmp 00608F16h
  loc_006091F2: mov ecx, 80020004h
  loc_006091F7: mov eax, 0000000Ah
  loc_006091FC: mov var_58, ecx
  loc_006091FF: mov var_48, ecx
  loc_00609202: mov var_38, ecx
  loc_00609205: lea edx, var_B0
  loc_0060920B: lea ecx, var_30
  loc_0060920E: mov var_60, eax
  loc_00609211: mov var_50, eax
  loc_00609214: mov var_40, eax
  loc_00609217: mov var_A8, 0041F378h ; "Save Successfully."
  loc_00609221: mov var_B0, 00000008h
  loc_0060922B: call [00401240h] ; __vbaVarDup
  loc_00609231: lea ecx, var_60
  loc_00609234: lea edx, var_50
  loc_00609237: push ecx
  loc_00609238: lea eax, var_40
  loc_0060923B: push edx
  loc_0060923C: push eax
  loc_0060923D: lea ecx, var_30
  loc_00609240: push 00000040h
  loc_00609242: push ecx
  loc_00609243: call [004010A4h] ; rtcMsgBox
  loc_00609249: lea edx, var_60
  loc_0060924C: lea eax, var_50
  loc_0060924F: push edx
  loc_00609250: lea ecx, var_40
  loc_00609253: push eax
  loc_00609254: lea edx, var_30
  loc_00609257: push ecx
  loc_00609258: push edx
  loc_00609259: push 00000004h
  loc_0060925B: call [00401038h] ; __vbaFreeVarList
  loc_00609261: add esp, 00000014h
  loc_00609264: mov var_4, 00000000h
  loc_0060926B: push 006092B7h
  loc_00609270: jmp 006092B6h
  loc_00609272: lea ecx, var_1C
  loc_00609275: call [004012ACh] ; __vbaFreeStr
  loc_0060927B: lea ecx, var_20
  loc_0060927E: call [004012B0h] ; __vbaFreeObj
  loc_00609284: lea eax, var_A0
  loc_0060928A: lea ecx, var_90
  loc_00609290: push eax
  loc_00609291: lea edx, var_80
  loc_00609294: push ecx
  loc_00609295: lea eax, var_70
  loc_00609298: push edx
  loc_00609299: lea ecx, var_60
  loc_0060929C: push eax
  loc_0060929D: lea edx, var_50
  loc_006092A0: push ecx
  loc_006092A1: lea eax, var_40
  loc_006092A4: push edx
  loc_006092A5: lea ecx, var_30
  loc_006092A8: push eax
  loc_006092A9: push ecx
  loc_006092AA: push 00000008h
  loc_006092AC: call [00401038h] ; __vbaFreeVarList
  loc_006092B2: add esp, 00000024h
  loc_006092B5: ret
  loc_006092B6: ret
  loc_006092B7: mov eax, Me
  loc_006092BA: push eax
  loc_006092BB: mov edx, [eax]
  loc_006092BD: call [edx+00000008h]
  loc_006092C0: mov eax, var_4
  loc_006092C3: mov ecx, var_14
  loc_006092C6: pop edi
  loc_006092C7: pop esi
  loc_006092C8: mov fs:[00000000h], ecx
  loc_006092CF: pop ebx
  loc_006092D0: mov esp, ebp
  loc_006092D2: pop ebp
  loc_006092D3: retn 0004h
End Sub

Private Sub txtNum_KeyPress(KeyAscii As Integer) '609E60
  loc_00609E60: push ebp
  loc_00609E61: mov ebp, esp
  loc_00609E63: sub esp, 0000000Ch
  loc_00609E66: push 00403B36h ; __vbaExceptHandler
  loc_00609E6B: mov eax, fs:[00000000h]
  loc_00609E71: push eax
  loc_00609E72: mov fs:[00000000h], esp
  loc_00609E79: sub esp, 000000B4h
  loc_00609E7F: push ebx
  loc_00609E80: push esi
  loc_00609E81: push edi
  loc_00609E82: mov var_C, esp
  loc_00609E85: mov var_8, 00403748h
  loc_00609E8C: mov esi, Me
  loc_00609E8F: mov eax, esi
  loc_00609E91: and eax, 00000001h
  loc_00609E94: mov var_4, eax
  loc_00609E97: and esi, FFFFFFFEh
  loc_00609E9A: push esi
  loc_00609E9B: mov Me, esi
  loc_00609E9E: mov ecx, [esi]
  loc_00609EA0: call [ecx+00000004h]
  loc_00609EA3: mov edx, KeyAscii
  loc_00609EA6: xor eax, eax
  loc_00609EA8: mov var_18, eax
  loc_00609EAB: mov var_1C, eax
  loc_00609EAE: cmp [edx], 000Dh
  loc_00609EB2: mov var_20, eax
  loc_00609EB5: mov var_30, eax
  loc_00609EB8: mov var_40, eax
  loc_00609EBB: mov var_50, eax
  loc_00609EBE: mov var_60, eax
  loc_00609EC1: mov var_70, eax
  loc_00609EC4: mov var_90, eax
  loc_00609ECA: jnz 0060A11Dh
  loc_00609ED0: mov eax, [esi]
  loc_00609ED2: push esi
  loc_00609ED3: call [eax+00000300h]
  loc_00609ED9: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00609EDF: lea ecx, var_1C
  loc_00609EE2: push eax
  loc_00609EE3: push ecx
  loc_00609EE4: call ebx
  loc_00609EE6: mov edi, eax
  loc_00609EE8: lea eax, var_18
  loc_00609EEB: push eax
  loc_00609EEC: push edi
  loc_00609EED: mov edx, [edi]
  loc_00609EEF: call [edx+000000A0h]
  loc_00609EF5: test eax, eax
  loc_00609EF7: fnclex
  loc_00609EF9: jge 00609F0Dh
  loc_00609EFB: push 000000A0h
  loc_00609F00: push 0041E5E8h
  loc_00609F05: push edi
  loc_00609F06: push eax
  loc_00609F07: call [00401074h] ; __vbaHresultCheckObj
  loc_00609F0D: mov ecx, var_18
  loc_00609F10: push ecx
  loc_00609F11: call [0040102Ch] ; __vbaLenBstr
  loc_00609F17: xor edx, edx
  loc_00609F19: cmp eax, 00000002h
  loc_00609F1C: setz dl
  loc_00609F1F: neg edx
  loc_00609F21: lea ecx, var_18
  loc_00609F24: mov edi, edx
  loc_00609F26: call [004012ACh] ; __vbaFreeStr
  loc_00609F2C: lea ecx, var_1C
  loc_00609F2F: call [004012B0h] ; __vbaFreeObj
  loc_00609F35: test di, di
  loc_00609F38: jz 0060A11Bh
  loc_00609F3E: mov ax, [esi+00000034h]
  loc_00609F42: add ax, 0001h
  loc_00609F46: jo 0060A17Ch
  loc_00609F4C: cmp ax, 0014h
  loc_00609F50: mov [esi+00000034h], ax
  loc_00609F54: jge 0060A0B2h
  loc_00609F5A: mov ecx, [esi]
  loc_00609F5C: push esi
  loc_00609F5D: movsx eax, ax
  loc_00609F60: mov var_68, eax
  loc_00609F63: mov var_70, 00000003h
  loc_00609F6A: call [ecx+00000300h]
  loc_00609F70: lea edx, var_1C
  loc_00609F73: push eax
  loc_00609F74: push edx
  loc_00609F75: call ebx
  loc_00609F77: mov edi, eax
  loc_00609F79: lea ecx, var_18
  loc_00609F7C: push ecx
  loc_00609F7D: push edi
  loc_00609F7E: mov eax, [edi]
  loc_00609F80: call [eax+000000A0h]
  loc_00609F86: test eax, eax
  loc_00609F88: fnclex
  loc_00609F8A: jge 00609F9Eh
  loc_00609F8C: push 000000A0h
  loc_00609F91: push 0041E5E8h
  loc_00609F96: push edi
  loc_00609F97: push eax
  loc_00609F98: call [00401074h] ; __vbaHresultCheckObj
  loc_00609F9E: mov eax, var_18
  loc_00609FA1: lea edx, var_30
  loc_00609FA4: mov var_28, eax
  loc_00609FA7: lea eax, var_40
  loc_00609FAA: push edx
  loc_00609FAB: push eax
  loc_00609FAC: mov var_18, 00000000h
  loc_00609FB3: mov var_30, 00000008h
  loc_00609FBA: call [004010D4h] ; rtcTrimVar
  loc_00609FC0: lea ecx, var_40
  loc_00609FC3: push ecx
  loc_00609FC4: call [00401028h] ; __vbaStrVarMove
  loc_00609FCA: mov edi, var_70
  loc_00609FCD: sub esp, 00000010h
  loc_00609FD0: mov edx, esp
  loc_00609FD2: sub esp, 00000010h
  loc_00609FD5: mov ecx, 00000008h
  loc_00609FDA: mov var_48, eax
  loc_00609FDD: mov [edx], edi
  loc_00609FDF: mov edi, var_6C
  loc_00609FE2: mov var_50, ecx
  loc_00609FE5: mov [edx+00000004h], edi
  loc_00609FE8: mov edi, var_68
  loc_00609FEB: mov [edx+00000008h], edi
  loc_00609FEE: mov edi, var_64
  loc_00609FF1: mov [edx+0000000Ch], edi
  loc_00609FF4: mov edi, esp
  loc_00609FF6: mov edx, 00000003h
  loc_00609FFB: sub esp, 00000010h
  loc_00609FFE: mov [edi], edx
  loc_0060A000: mov edx, var_8C
  loc_0060A006: mov [edi+00000004h], edx
  loc_0060A009: xor edx, edx
  loc_0060A00B: mov [edi+00000008h], edx
  loc_0060A00E: mov edx, var_84
  loc_0060A014: mov [edi+0000000Ch], edx
  loc_0060A017: mov edx, esp
  loc_0060A019: push 00000002h
  loc_0060A01B: push 00000041h
  loc_0060A01D: mov [edx], ecx
  loc_0060A01F: mov ecx, var_4C
  loc_0060A022: push esi
  loc_0060A023: mov [edx+00000004h], ecx
  loc_0060A026: mov ecx, [esi]
  loc_0060A028: mov [edx+00000008h], eax
  loc_0060A02B: mov eax, var_44
  loc_0060A02E: mov [edx+0000000Ch], eax
  loc_0060A031: call [ecx+00000318h]
  loc_0060A037: lea edx, var_20
  loc_0060A03A: push eax
  loc_0060A03B: push edx
  loc_0060A03C: call ebx
  loc_0060A03E: push eax
  loc_0060A03F: call [00401160h] ; __vbaLateIdCallSt
  loc_0060A045: lea eax, var_20
  loc_0060A048: lea ecx, var_1C
  loc_0060A04B: push eax
  loc_0060A04C: push ecx
  loc_0060A04D: push 00000002h
  loc_0060A04F: call [00401040h] ; __vbaFreeObjList
  loc_0060A055: add esp, 00000048h
  loc_0060A058: lea edx, var_50
  loc_0060A05B: lea eax, var_40
  loc_0060A05E: lea ecx, var_30
  loc_0060A061: push edx
  loc_0060A062: push eax
  loc_0060A063: push ecx
  loc_0060A064: push 00000003h
  loc_0060A066: call [00401038h] ; __vbaFreeVarList
  loc_0060A06C: mov edx, [esi]
  loc_0060A06E: add esp, 00000010h
  loc_0060A071: push esi
  loc_0060A072: call [edx+00000300h]
  loc_0060A078: push eax
  loc_0060A079: lea eax, var_1C
  loc_0060A07C: push eax
  loc_0060A07D: call ebx
  loc_0060A07F: mov esi, eax
  loc_0060A081: push 0041E5D4h
  loc_0060A086: push esi
  loc_0060A087: mov ecx, [esi]
  loc_0060A089: call [ecx+000000A4h]
  loc_0060A08F: test eax, eax
  loc_0060A091: fnclex
  loc_0060A093: jge 0060A0A7h
  loc_0060A095: push 000000A4h
  loc_0060A09A: push 0041E5E8h
  loc_0060A09F: push esi
  loc_0060A0A0: push eax
  loc_0060A0A1: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A0A7: lea ecx, var_1C
  loc_0060A0AA: call [004012B0h] ; __vbaFreeObj
  loc_0060A0B0: jmp 0060A11Bh
  loc_0060A0B2: mov ecx, 80020004h
  loc_0060A0B7: mov eax, 0000000Ah
  loc_0060A0BC: mov var_58, ecx
  loc_0060A0BF: mov var_48, ecx
  loc_0060A0C2: mov var_38, ecx
  loc_0060A0C5: lea edx, var_70
  loc_0060A0C8: lea ecx, var_30
  loc_0060A0CB: mov var_60, eax
  loc_0060A0CE: mov var_50, eax
  loc_0060A0D1: mov var_40, eax
  loc_0060A0D4: mov var_68, 00432864h ; "HOT-NUM allow maximun 20 numbers.."
  loc_0060A0DB: mov var_70, 00000008h
  loc_0060A0E2: call [00401240h] ; __vbaVarDup
  loc_0060A0E8: lea edx, var_60
  loc_0060A0EB: lea eax, var_50
  loc_0060A0EE: push edx
  loc_0060A0EF: lea ecx, var_40
  loc_0060A0F2: push eax
  loc_0060A0F3: push ecx
  loc_0060A0F4: lea edx, var_30
  loc_0060A0F7: push 00000030h
  loc_0060A0F9: push edx
  loc_0060A0FA: call [004010A4h] ; rtcMsgBox
  loc_0060A100: lea eax, var_60
  loc_0060A103: lea ecx, var_50
  loc_0060A106: push eax
  loc_0060A107: lea edx, var_40
  loc_0060A10A: push ecx
  loc_0060A10B: lea eax, var_30
  loc_0060A10E: push edx
  loc_0060A10F: push eax
  loc_0060A110: push 00000004h
  loc_0060A112: call [00401038h] ; __vbaFreeVarList
  loc_0060A118: add esp, 00000014h
  loc_0060A11B: xor eax, eax
  loc_0060A11D: mov var_4, eax
  loc_0060A120: push 0060A15Dh
  loc_0060A125: jmp 0060A15Ch
  loc_0060A127: lea ecx, var_18
  loc_0060A12A: call [004012ACh] ; __vbaFreeStr
  loc_0060A130: lea ecx, var_20
  loc_0060A133: lea edx, var_1C
  loc_0060A136: push ecx
  loc_0060A137: push edx
  loc_0060A138: push 00000002h
  loc_0060A13A: call [00401040h] ; __vbaFreeObjList
  loc_0060A140: lea eax, var_60
  loc_0060A143: lea ecx, var_50
  loc_0060A146: push eax
  loc_0060A147: lea edx, var_40
  loc_0060A14A: push ecx
  loc_0060A14B: lea eax, var_30
  loc_0060A14E: push edx
  loc_0060A14F: push eax
  loc_0060A150: push 00000004h
  loc_0060A152: call [00401038h] ; __vbaFreeVarList
  loc_0060A158: add esp, 00000020h
  loc_0060A15B: ret
  loc_0060A15C: ret
  loc_0060A15D: mov eax, Me
  loc_0060A160: push eax
  loc_0060A161: mov ecx, [eax]
  loc_0060A163: call [ecx+00000008h]
  loc_0060A166: mov eax, var_4
  loc_0060A169: mov ecx, var_14
  loc_0060A16C: pop edi
  loc_0060A16D: pop esi
  loc_0060A16E: mov fs:[00000000h], ecx
  loc_0060A175: pop ebx
  loc_0060A176: mov esp, ebp
  loc_0060A178: pop ebp
  loc_0060A179: retn 0008h
End Sub

Private Sub cmdExit_Click() '608CB0
  loc_00608CB0: push ebp
  loc_00608CB1: mov ebp, esp
  loc_00608CB3: sub esp, 0000000Ch
  loc_00608CB6: push 00403B36h ; __vbaExceptHandler
  loc_00608CBB: mov eax, fs:[00000000h]
  loc_00608CC1: push eax
  loc_00608CC2: mov fs:[00000000h], esp
  loc_00608CC9: sub esp, 00000018h
  loc_00608CCC: push ebx
  loc_00608CCD: push esi
  loc_00608CCE: push edi
  loc_00608CCF: mov var_C, esp
  loc_00608CD2: mov var_8, 004036D8h
  loc_00608CD9: mov edi, Me
  loc_00608CDC: mov eax, edi
  loc_00608CDE: and eax, 00000001h
  loc_00608CE1: mov var_4, eax
  loc_00608CE4: and edi, FFFFFFFEh
  loc_00608CE7: push edi
  loc_00608CE8: mov Me, edi
  loc_00608CEB: mov ecx, [edi]
  loc_00608CED: call [ecx+00000004h]
  loc_00608CF0: mov eax, [0061B394h]
  loc_00608CF5: xor ebx, ebx
  loc_00608CF7: cmp eax, ebx
  loc_00608CF9: mov var_18, ebx
  loc_00608CFC: jnz 00608D0Eh
  loc_00608CFE: push 0061B394h
  loc_00608D03: push 0041E4A0h
  loc_00608D08: call [004011DCh] ; __vbaNew2
  loc_00608D0E: mov esi, [0061B394h]
  loc_00608D14: lea eax, var_18
  loc_00608D17: push edi
  loc_00608D18: push eax
  loc_00608D19: mov edx, [esi]
  loc_00608D1B: mov var_2C, edx
  loc_00608D1E: call [004010B8h] ; __vbaObjSetAddref
  loc_00608D24: mov ecx, var_2C
  loc_00608D27: push eax
  loc_00608D28: push esi
  loc_00608D29: call [ecx+00000010h]
  loc_00608D2C: cmp eax, ebx
  loc_00608D2E: fnclex
  loc_00608D30: jge 00608D41h
  loc_00608D32: push 00000010h
  loc_00608D34: push 0041E490h
  loc_00608D39: push esi
  loc_00608D3A: push eax
  loc_00608D3B: call [00401074h] ; __vbaHresultCheckObj
  loc_00608D41: lea ecx, var_18
  loc_00608D44: call [004012B0h] ; __vbaFreeObj
  loc_00608D4A: mov var_4, ebx
  loc_00608D4D: push 00608D5Fh
  loc_00608D52: jmp 00608D5Eh
  loc_00608D54: lea ecx, var_18
  loc_00608D57: call [004012B0h] ; __vbaFreeObj
  loc_00608D5D: ret
  loc_00608D5E: ret
  loc_00608D5F: mov eax, Me
  loc_00608D62: push eax
  loc_00608D63: mov edx, [eax]
  loc_00608D65: call [edx+00000008h]
  loc_00608D68: mov eax, var_4
  loc_00608D6B: mov ecx, var_14
  loc_00608D6E: pop edi
  loc_00608D6F: pop esi
  loc_00608D70: mov fs:[00000000h], ecx
  loc_00608D77: pop ebx
  loc_00608D78: mov esp, ebp
  loc_00608D7A: pop ebp
  loc_00608D7B: retn 0004h
End Sub

Private Sub Proc_33_7_6094F0() '6094F0
  loc_006094F0: push ebp
  loc_006094F1: mov ebp, esp
  loc_006094F3: sub esp, 00000008h
  loc_006094F6: push 00403B36h ; __vbaExceptHandler
  loc_006094FB: mov eax, fs:[00000000h]
  loc_00609501: push eax
  loc_00609502: mov fs:[00000000h], esp
  loc_00609509: sub esp, 000000C4h
  loc_0060950F: push ebx
  loc_00609510: push esi
  loc_00609511: push edi
  loc_00609512: mov var_8, esp
  loc_00609515: mov var_4, 00403718h
  loc_0060951C: lea eax, var_64
  loc_0060951F: lea ecx, var_34
  loc_00609522: xor edi, edi
  loc_00609524: push eax
  loc_00609525: push ecx
  loc_00609526: mov var_14, edi
  loc_00609529: mov var_18, edi
  loc_0060952C: mov var_1C, edi
  loc_0060952F: mov var_20, edi
  loc_00609532: mov var_24, edi
  loc_00609535: mov var_34, edi
  loc_00609538: mov var_44, edi
  loc_0060953B: mov var_54, edi
  loc_0060953E: mov var_74, edi
  loc_00609541: mov var_84, edi
  loc_00609547: mov var_B8, edi
  loc_0060954D: mov var_5C, 0061A05Ch
  loc_00609554: mov var_64, 00004008h
  loc_0060955B: call [004010D4h] ; rtcTrimVar
  loc_00609561: mov esi, 00000008h
  loc_00609566: mov var_6C, 004277ACh ; "Select * From Hot WHERE OnCount='"
  loc_0060956D: mov var_74, esi
  loc_00609570: mov var_84, esi
  loc_00609576: mov esi, [0061A13Ch]
  loc_0060957C: mov var_7C, 0041E890h ; "'"
  loc_00609583: mov ecx, 0000000Ah
  loc_00609588: mov eax, 80020004h
  loc_0060958D: mov ebx, [esi]
  loc_0060958F: lea esi, var_1C
  loc_00609592: push esi
  loc_00609593: mov var_A4, ecx
  loc_00609599: sub esp, 00000010h
  loc_0060959C: mov edx, eax
  loc_0060959E: mov esi, esp
  loc_006095A0: sub esp, 00000010h
  loc_006095A3: mov [esi], ecx
  loc_006095A5: mov ecx, var_B0
  loc_006095AB: mov [esi+00000004h], ecx
  loc_006095AE: mov ecx, esp
  loc_006095B0: sub esp, 00000010h
  loc_006095B3: mov [esi+00000008h], eax
  loc_006095B6: mov eax, var_A8
  loc_006095BC: mov [esi+0000000Ch], eax
  loc_006095BF: mov eax, var_A4
  loc_006095C5: mov [ecx], eax
  loc_006095C7: mov eax, var_A0
  loc_006095CD: mov esi, [004011B4h] ; __vbaVarCat
  loc_006095D3: mov [ecx+00000004h], eax
  loc_006095D6: mov eax, 00000003h
  loc_006095DB: mov [ecx+00000008h], edx
  loc_006095DE: mov edx, var_98
  loc_006095E4: mov [ecx+0000000Ch], edx
  loc_006095E7: mov edx, var_90
  loc_006095ED: mov ecx, esp
  loc_006095EF: mov [ecx], eax
  loc_006095F1: mov eax, 00000004h
  loc_006095F6: mov [ecx+00000004h], edx
  loc_006095F9: lea edx, var_34
  loc_006095FC: mov [ecx+00000008h], eax
  loc_006095FF: mov eax, var_88
  loc_00609605: mov [ecx+0000000Ch], eax
  loc_00609608: lea ecx, var_74
  loc_0060960B: push ecx
  loc_0060960C: lea eax, var_44
  loc_0060960F: push edx
  loc_00609610: push eax
  loc_00609611: call __vbaVarCat
  loc_00609613: lea ecx, var_84
  loc_00609619: push eax
  loc_0060961A: lea edx, var_54
  loc_0060961D: push ecx
  loc_0060961E: push edx
  loc_0060961F: call __vbaVarCat
  loc_00609621: push eax
  loc_00609622: lea eax, var_18
  loc_00609625: push eax
  loc_00609626: call [004011B0h] ; __vbaStrVarVal
  loc_0060962C: mov ecx, [0061A13Ch]
  loc_00609632: push eax
  loc_00609633: push ecx
  loc_00609634: call [ebx+000000BCh]
  loc_0060963A: cmp eax, edi
  loc_0060963C: fnclex
  loc_0060963E: jge 00609658h
  loc_00609640: mov edx, [0061A13Ch]
  loc_00609646: push 000000BCh
  loc_0060964B: push 0041E928h
  loc_00609650: push edx
  loc_00609651: push eax
  loc_00609652: call [00401074h] ; __vbaHresultCheckObj
  loc_00609658: mov eax, var_1C
  loc_0060965B: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00609661: push eax
  loc_00609662: lea eax, var_14
  loc_00609665: push eax
  loc_00609666: mov var_1C, edi
  loc_00609669: call ebx
  loc_0060966B: lea ecx, var_18
  loc_0060966E: call [004012ACh] ; __vbaFreeStr
  loc_00609674: lea ecx, var_54
  loc_00609677: lea edx, var_44
  loc_0060967A: push ecx
  loc_0060967B: lea eax, var_34
  loc_0060967E: push edx
  loc_0060967F: push eax
  loc_00609680: push 00000003h
  loc_00609682: call [00401038h] ; __vbaFreeVarList
  loc_00609688: mov esi, Me
  loc_0060968B: add esp, 00000010h
  loc_0060968E: mov eax, var_14
  loc_00609691: lea edx, var_B8
  loc_00609697: push edx
  loc_00609698: push eax
  loc_00609699: mov ecx, [eax]
  loc_0060969B: call [ecx+00000034h]
  loc_0060969E: cmp eax, edi
  loc_006096A0: fnclex
  loc_006096A2: jge 006096B6h
  loc_006096A4: mov ecx, var_14
  loc_006096A7: push 00000034h
  loc_006096A9: push 0041E938h
  loc_006096AE: push ecx
  loc_006096AF: push eax
  loc_006096B0: call [00401074h] ; __vbaHresultCheckObj
  loc_006096B6: cmp var_B8, di
  loc_006096BD: jnz 0060986Ch
  loc_006096C3: mov ax, [esi+00000034h]
  loc_006096C7: mov var_74, 00000003h
  loc_006096CE: add ax, 0001h
  loc_006096D2: jo 00609901h
  loc_006096D8: movsx edx, ax
  loc_006096DB: mov [esi+00000034h], ax
  loc_006096DF: mov eax, var_14
  loc_006096E2: mov var_6C, edx
  loc_006096E5: lea edx, var_1C
  loc_006096E8: mov ecx, [eax]
  loc_006096EA: push edx
  loc_006096EB: push eax
  loc_006096EC: call [ecx+000000B4h]
  loc_006096F2: cmp eax, edi
  loc_006096F4: fnclex
  loc_006096F6: jge 0060970Dh
  loc_006096F8: mov ecx, var_14
  loc_006096FB: push 000000B4h
  loc_00609700: push 0041E938h
  loc_00609705: push ecx
  loc_00609706: push eax
  loc_00609707: call [00401074h] ; __vbaHresultCheckObj
  loc_0060970D: lea ebx, var_20
  loc_00609710: mov eax, var_1C
  loc_00609713: push ebx
  loc_00609714: mov ecx, 00000008h
  loc_00609719: sub esp, 00000010h
  loc_0060971C: mov var_64, ecx
  loc_0060971F: mov ebx, esp
  loc_00609721: mov var_5C, 004277F4h ; "HotNum"
  loc_00609728: mov edx, [eax]
  loc_0060972A: push eax
  loc_0060972B: mov [ebx], ecx
  loc_0060972D: mov ecx, var_60
  loc_00609730: mov var_C0, eax
  loc_00609736: mov [ebx+00000004h], ecx
  loc_00609739: mov ecx, var_5C
  loc_0060973C: mov [ebx+00000008h], ecx
  loc_0060973F: mov ecx, var_58
  loc_00609742: mov [ebx+0000000Ch], ecx
  loc_00609745: call [edx+00000030h]
  loc_00609748: cmp eax, edi
  loc_0060974A: fnclex
  loc_0060974C: jge 00609763h
  loc_0060974E: mov edx, var_C0
  loc_00609754: push 00000030h
  loc_00609756: push 0041EA14h ; "S"
  loc_0060975B: push edx
  loc_0060975C: push eax
  loc_0060975D: call [00401074h] ; __vbaHresultCheckObj
  loc_00609763: mov eax, var_20
  loc_00609766: lea edx, var_34
  loc_00609769: push edx
  loc_0060976A: push eax
  loc_0060976B: mov ecx, [eax]
  loc_0060976D: mov ebx, eax
  loc_0060976F: call [ecx+00000044h]
  loc_00609772: cmp eax, edi
  loc_00609774: fnclex
  loc_00609776: jge 00609787h
  loc_00609778: push 00000044h
  loc_0060977A: push 0041EA48h
  loc_0060977F: push ebx
  loc_00609780: push eax
  loc_00609781: call [00401074h] ; __vbaHresultCheckObj
  loc_00609787: lea eax, var_34
  loc_0060978A: push eax
  loc_0060978B: call [00401028h] ; __vbaStrVarMove
  loc_00609791: mov ebx, var_74
  loc_00609794: sub esp, 00000010h
  loc_00609797: mov edx, esp
  loc_00609799: sub esp, 00000010h
  loc_0060979C: mov ecx, 00000008h
  loc_006097A1: mov var_3C, eax
  loc_006097A4: mov [edx], ebx
  loc_006097A6: mov ebx, var_70
  loc_006097A9: mov var_44, ecx
  loc_006097AC: mov [edx+00000004h], ebx
  loc_006097AF: mov ebx, var_6C
  loc_006097B2: mov [edx+00000008h], ebx
  loc_006097B5: mov ebx, var_68
  loc_006097B8: mov [edx+0000000Ch], ebx
  loc_006097BB: mov ebx, esp
  loc_006097BD: mov edx, 00000003h
  loc_006097C2: sub esp, 00000010h
  loc_006097C5: mov [ebx], edx
  loc_006097C7: mov edx, var_90
  loc_006097CD: mov [ebx+00000004h], edx
  loc_006097D0: xor edx, edx
  loc_006097D2: mov [ebx+00000008h], edx
  loc_006097D5: mov edx, var_88
  loc_006097DB: mov [ebx+0000000Ch], edx
  loc_006097DE: mov edx, esp
  loc_006097E0: push 00000002h
  loc_006097E2: push 00000041h
  loc_006097E4: mov [edx], ecx
  loc_006097E6: mov ecx, var_40
  loc_006097E9: push esi
  loc_006097EA: mov [edx+00000004h], ecx
  loc_006097ED: mov ecx, [esi]
  loc_006097EF: mov [edx+00000008h], eax
  loc_006097F2: mov eax, var_38
  loc_006097F5: mov [edx+0000000Ch], eax
  loc_006097F8: call [ecx+00000318h]
  loc_006097FE: mov ebx, [004010A0h] ; __vbaObjSet
  loc_00609804: lea edx, var_24
  loc_00609807: push eax
  loc_00609808: push edx
  loc_00609809: call ebx
  loc_0060980B: push eax
  loc_0060980C: call [00401160h] ; __vbaLateIdCallSt
  loc_00609812: lea eax, var_24
  loc_00609815: lea ecx, var_20
  loc_00609818: push eax
  loc_00609819: lea edx, var_1C
  loc_0060981C: push ecx
  loc_0060981D: push edx
  loc_0060981E: push 00000003h
  loc_00609820: call [00401040h] ; __vbaFreeObjList
  loc_00609826: add esp, 0000004Ch
  loc_00609829: lea eax, var_44
  loc_0060982C: lea ecx, var_34
  loc_0060982F: push eax
  loc_00609830: push ecx
  loc_00609831: push 00000002h
  loc_00609833: call [00401038h] ; __vbaFreeVarList
  loc_00609839: mov eax, var_14
  loc_0060983C: add esp, 0000000Ch
  loc_0060983F: mov edx, [eax]
  loc_00609841: push eax
  loc_00609842: call [edx+000000ECh]
  loc_00609848: cmp eax, edi
  loc_0060984A: fnclex
  loc_0060984C: jge 0060968Eh
  loc_00609852: mov ecx, var_14
  loc_00609855: push 000000ECh
  loc_0060985A: push 0041E938h
  loc_0060985F: push ecx
  loc_00609860: push eax
  loc_00609861: call [00401074h] ; __vbaHresultCheckObj
  loc_00609867: jmp 0060968Eh
  loc_0060986C: mov eax, var_14
  loc_0060986F: push eax
  loc_00609870: mov edx, [eax]
  loc_00609872: call [edx+000000C4h]
  loc_00609878: cmp eax, edi
  loc_0060987A: fnclex
  loc_0060987C: jge 00609893h
  loc_0060987E: mov ecx, var_14
  loc_00609881: push 000000C4h
  loc_00609886: push 0041E938h
  loc_0060988B: push ecx
  loc_0060988C: push eax
  loc_0060988D: call [00401074h] ; __vbaHresultCheckObj
  loc_00609893: push 0041E938h
  loc_00609898: push edi
  loc_00609899: call [00401274h] ; __vbaCastObj
  loc_0060989F: lea edx, var_14
  loc_006098A2: push eax
  loc_006098A3: push edx
  loc_006098A4: call ebx
  loc_006098A6: push 006098ECh
  loc_006098AB: jmp 006098E2h
  loc_006098AD: lea ecx, var_18
  loc_006098B0: call [004012ACh] ; __vbaFreeStr
  loc_006098B6: lea eax, var_24
  loc_006098B9: lea ecx, var_20
  loc_006098BC: push eax
  loc_006098BD: lea edx, var_1C
  loc_006098C0: push ecx
  loc_006098C1: push edx
  loc_006098C2: push 00000003h
  loc_006098C4: call [00401040h] ; __vbaFreeObjList
  loc_006098CA: lea eax, var_54
  loc_006098CD: lea ecx, var_44
  loc_006098D0: push eax
  loc_006098D1: lea edx, var_34
  loc_006098D4: push ecx
  loc_006098D5: push edx
  loc_006098D6: push 00000003h
  loc_006098D8: call [00401038h] ; __vbaFreeVarList
  loc_006098DE: add esp, 00000020h
  loc_006098E1: ret
  loc_006098E2: lea ecx, var_14
  loc_006098E5: call [004012B0h] ; __vbaFreeObj
  loc_006098EB: ret
  loc_006098EC: mov ecx, var_10
  loc_006098EF: pop edi
  loc_006098F0: pop esi
  loc_006098F1: xor eax, eax
  loc_006098F3: mov fs:[00000000h], ecx
  loc_006098FA: pop ebx
  loc_006098FB: mov esp, ebp
  loc_006098FD: pop ebp
  loc_006098FE: retn 0004h
End Sub
