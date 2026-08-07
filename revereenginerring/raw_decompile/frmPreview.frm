VERSION 5.00
Begin VB.Form frmPreview
  Caption = "Preview"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 5430
  ClientHeight = 2235
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2970
    Top = 1350
    Width = 1035
    Height = 405
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
  Begin VB.CommandButton cmdSelect
    Caption = "&Select"
    Left = 1920
    Top = 1350
    Width = 1035
    Height = 405
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
  Begin VB.ComboBox cboType
    Style = 2
    Left = 1950
    Top = 480
    Width = 2895
    Height = 360
    TabIndex = 0
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
  Begin VB.Label Label1
    Caption = "Customer Type"
    Left = 390
    Top = 510
    Width = 1815
    Height = 315
    TabIndex = 3
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
End

Attribute VB_Name = "frmPreview"


Private Sub cmdCancel_Click() '5CC020
  loc_005CC020: push ebp
  loc_005CC021: mov ebp, esp
  loc_005CC023: sub esp, 0000000Ch
  loc_005CC026: push 00403B36h ; __vbaExceptHandler
  loc_005CC02B: mov eax, fs:[00000000h]
  loc_005CC031: push eax
  loc_005CC032: mov fs:[00000000h], esp
  loc_005CC039: sub esp, 00000018h
  loc_005CC03C: push ebx
  loc_005CC03D: push esi
  loc_005CC03E: push edi
  loc_005CC03F: mov var_C, esp
  loc_005CC042: mov var_8, 004030E8h
  loc_005CC049: mov edi, Me
  loc_005CC04C: mov eax, edi
  loc_005CC04E: and eax, 00000001h
  loc_005CC051: mov var_4, eax
  loc_005CC054: and edi, FFFFFFFEh
  loc_005CC057: push edi
  loc_005CC058: mov Me, edi
  loc_005CC05B: mov ecx, [edi]
  loc_005CC05D: call [ecx+00000004h]
  loc_005CC060: xor ebx, ebx
  loc_005CC062: mov edx, 0041E5D4h
  loc_005CC067: mov ecx, 0061A038h
  loc_005CC06C: mov var_18, ebx
  loc_005CC06F: call [004011ECh] ; __vbaStrCopy
  loc_005CC075: cmp [0061B394h], ebx
  loc_005CC07B: jnz 005CC08Dh
  loc_005CC07D: push 0061B394h
  loc_005CC082: push 0041E4A0h
  loc_005CC087: call [004011DCh] ; __vbaNew2
  loc_005CC08D: mov esi, [0061B394h]
  loc_005CC093: lea eax, var_18
  loc_005CC096: push edi
  loc_005CC097: push eax
  loc_005CC098: mov edx, [esi]
  loc_005CC09A: mov var_2C, edx
  loc_005CC09D: call [004010B8h] ; __vbaObjSetAddref
  loc_005CC0A3: mov ecx, var_2C
  loc_005CC0A6: push eax
  loc_005CC0A7: push esi
  loc_005CC0A8: call [ecx+00000010h]
  loc_005CC0AB: cmp eax, ebx
  loc_005CC0AD: fnclex
  loc_005CC0AF: jge 005CC0C0h
  loc_005CC0B1: push 00000010h
  loc_005CC0B3: push 0041E490h
  loc_005CC0B8: push esi
  loc_005CC0B9: push eax
  loc_005CC0BA: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC0C0: lea ecx, var_18
  loc_005CC0C3: call [004012B0h] ; __vbaFreeObj
  loc_005CC0C9: mov var_4, ebx
  loc_005CC0CC: push 005CC0DEh
  loc_005CC0D1: jmp 005CC0DDh
  loc_005CC0D3: lea ecx, var_18
  loc_005CC0D6: call [004012B0h] ; __vbaFreeObj
  loc_005CC0DC: ret
  loc_005CC0DD: ret
  loc_005CC0DE: mov eax, Me
  loc_005CC0E1: push eax
  loc_005CC0E2: mov edx, [eax]
  loc_005CC0E4: call [edx+00000008h]
  loc_005CC0E7: mov eax, var_4
  loc_005CC0EA: mov ecx, var_14
  loc_005CC0ED: pop edi
  loc_005CC0EE: pop esi
  loc_005CC0EF: mov fs:[00000000h], ecx
  loc_005CC0F6: pop ebx
  loc_005CC0F7: mov esp, ebp
  loc_005CC0F9: pop ebp
  loc_005CC0FA: retn 0004h
End Sub

Private Sub cmdSelect_Click() '5CC100
  loc_005CC100: push ebp
  loc_005CC101: mov ebp, esp
  loc_005CC103: sub esp, 0000000Ch
  loc_005CC106: push 00403B36h ; __vbaExceptHandler
  loc_005CC10B: mov eax, fs:[00000000h]
  loc_005CC111: push eax
  loc_005CC112: mov fs:[00000000h], esp
  loc_005CC119: sub esp, 00000040h
  loc_005CC11C: push ebx
  loc_005CC11D: push esi
  loc_005CC11E: push edi
  loc_005CC11F: mov var_C, esp
  loc_005CC122: mov var_8, 004030F8h
  loc_005CC129: mov esi, Me
  loc_005CC12C: mov eax, esi
  loc_005CC12E: and eax, 00000001h
  loc_005CC131: mov var_4, eax
  loc_005CC134: and esi, FFFFFFFEh
  loc_005CC137: push esi
  loc_005CC138: mov Me, esi
  loc_005CC13B: mov ecx, [esi]
  loc_005CC13D: call [ecx+00000004h]
  loc_005CC140: mov edx, [esi]
  loc_005CC142: xor ebx, ebx
  loc_005CC144: push esi
  loc_005CC145: mov var_18, ebx
  loc_005CC148: mov var_1C, ebx
  loc_005CC14B: mov var_2C, ebx
  loc_005CC14E: mov var_3C, ebx
  loc_005CC151: call [edx+00000304h]
  loc_005CC157: push eax
  loc_005CC158: lea eax, var_1C
  loc_005CC15B: push eax
  loc_005CC15C: call [004010A0h] ; __vbaObjSet
  loc_005CC162: mov edi, eax
  loc_005CC164: lea edx, var_18
  loc_005CC167: push edx
  loc_005CC168: push edi
  loc_005CC169: mov ecx, [edi]
  loc_005CC16B: call [ecx+000000A8h]
  loc_005CC171: cmp eax, ebx
  loc_005CC173: fnclex
  loc_005CC175: jge 005CC189h
  loc_005CC177: push 000000A8h
  loc_005CC17C: push 0041F844h
  loc_005CC181: push edi
  loc_005CC182: push eax
  loc_005CC183: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC189: mov eax, var_18
  loc_005CC18C: lea ecx, var_3C
  loc_005CC18F: mov var_24, eax
  loc_005CC192: lea eax, var_2C
  loc_005CC195: push eax
  loc_005CC196: push ecx
  loc_005CC197: mov var_18, ebx
  loc_005CC19A: mov var_2C, 00000008h
  loc_005CC1A1: call [004010D4h] ; rtcTrimVar
  loc_005CC1A7: lea edx, var_3C
  loc_005CC1AA: push edx
  loc_005CC1AB: call [00401028h] ; __vbaStrVarMove
  loc_005CC1B1: mov edx, eax
  loc_005CC1B3: mov ecx, 0061A038h
  loc_005CC1B8: call [00401270h] ; __vbaStrMove
  loc_005CC1BE: lea ecx, var_1C
  loc_005CC1C1: call [004012B0h] ; __vbaFreeObj
  loc_005CC1C7: lea eax, var_3C
  loc_005CC1CA: lea ecx, var_2C
  loc_005CC1CD: push eax
  loc_005CC1CE: push ecx
  loc_005CC1CF: push 00000002h
  loc_005CC1D1: call [00401038h] ; __vbaFreeVarList
  loc_005CC1D7: mov eax, [0061B394h]
  loc_005CC1DC: add esp, 0000000Ch
  loc_005CC1DF: cmp eax, ebx
  loc_005CC1E1: jnz 005CC1F3h
  loc_005CC1E3: push 0061B394h
  loc_005CC1E8: push 0041E4A0h
  loc_005CC1ED: call [004011DCh] ; __vbaNew2
  loc_005CC1F3: mov edi, [0061B394h]
  loc_005CC1F9: lea eax, var_1C
  loc_005CC1FC: push esi
  loc_005CC1FD: push eax
  loc_005CC1FE: mov edx, [edi]
  loc_005CC200: mov var_54, edx
  loc_005CC203: call [004010B8h] ; __vbaObjSetAddref
  loc_005CC209: mov ecx, var_54
  loc_005CC20C: push eax
  loc_005CC20D: push edi
  loc_005CC20E: call [ecx+00000010h]
  loc_005CC211: cmp eax, ebx
  loc_005CC213: fnclex
  loc_005CC215: jge 005CC226h
  loc_005CC217: push 00000010h
  loc_005CC219: push 0041E490h
  loc_005CC21E: push edi
  loc_005CC21F: push eax
  loc_005CC220: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC226: lea ecx, var_1C
  loc_005CC229: call [004012B0h] ; __vbaFreeObj
  loc_005CC22F: mov var_4, ebx
  loc_005CC232: push 005CC260h
  loc_005CC237: jmp 005CC25Fh
  loc_005CC239: lea ecx, var_18
  loc_005CC23C: call [004012ACh] ; __vbaFreeStr
  loc_005CC242: lea ecx, var_1C
  loc_005CC245: call [004012B0h] ; __vbaFreeObj
  loc_005CC24B: lea edx, var_3C
  loc_005CC24E: lea eax, var_2C
  loc_005CC251: push edx
  loc_005CC252: push eax
  loc_005CC253: push 00000002h
  loc_005CC255: call [00401038h] ; __vbaFreeVarList
  loc_005CC25B: add esp, 0000000Ch
  loc_005CC25E: ret
  loc_005CC25F: ret
  loc_005CC260: mov eax, Me
  loc_005CC263: push eax
  loc_005CC264: mov ecx, [eax]
  loc_005CC266: call [ecx+00000008h]
  loc_005CC269: mov eax, var_4
  loc_005CC26C: mov ecx, var_14
  loc_005CC26F: pop edi
  loc_005CC270: pop esi
  loc_005CC271: mov fs:[00000000h], ecx
  loc_005CC278: pop ebx
  loc_005CC279: mov esp, ebp
  loc_005CC27B: pop ebp
  loc_005CC27C: retn 0004h
End Sub

Private Sub Form_Load() '5CC280
  loc_005CC280: push ebp
  loc_005CC281: mov ebp, esp
  loc_005CC283: sub esp, 0000000Ch
  loc_005CC286: push 00403B36h ; __vbaExceptHandler
  loc_005CC28B: mov eax, fs:[00000000h]
  loc_005CC291: push eax
  loc_005CC292: mov fs:[00000000h], esp
  loc_005CC299: sub esp, 00000024h
  loc_005CC29C: push ebx
  loc_005CC29D: push esi
  loc_005CC29E: push edi
  loc_005CC29F: mov var_C, esp
  loc_005CC2A2: mov var_8, 00403108h
  loc_005CC2A9: mov esi, Me
  loc_005CC2AC: mov eax, esi
  loc_005CC2AE: and eax, 00000001h
  loc_005CC2B1: mov var_4, eax
  loc_005CC2B4: and esi, FFFFFFFEh
  loc_005CC2B7: push esi
  loc_005CC2B8: mov Me, esi
  loc_005CC2BB: mov ecx, [esi]
  loc_005CC2BD: call [ecx+00000004h]
  loc_005CC2C0: mov edx, [esi]
  loc_005CC2C2: push esi
  loc_005CC2C3: mov var_18, 00000000h
  loc_005CC2CA: call [edx+00000304h]
  loc_005CC2D0: mov ebx, [004010A0h] ; __vbaObjSet
  loc_005CC2D6: push eax
  loc_005CC2D7: lea eax, var_18
  loc_005CC2DA: push eax
  loc_005CC2DB: call ebx
  loc_005CC2DD: sub esp, 00000010h
  loc_005CC2E0: mov edi, eax
  loc_005CC2E2: mov edx, esp
  loc_005CC2E4: mov eax, 0000000Ah
  loc_005CC2E9: mov ecx, [edi]
  loc_005CC2EB: push 0042BFD8h ; "All"
  loc_005CC2F0: mov [edx], eax
  loc_005CC2F2: mov eax, var_24
  loc_005CC2F5: push edi
  loc_005CC2F6: mov [edx+00000004h], eax
  loc_005CC2F9: mov eax, 80020004h
  loc_005CC2FE: mov [edx+00000008h], eax
  loc_005CC301: mov eax, var_1C
  loc_005CC304: mov [edx+0000000Ch], eax
  loc_005CC307: call [ecx+000001ECh]
  loc_005CC30D: test eax, eax
  loc_005CC30F: fnclex
  loc_005CC311: jge 005CC325h
  loc_005CC313: push 000001ECh
  loc_005CC318: push 0041F844h
  loc_005CC31D: push edi
  loc_005CC31E: push eax
  loc_005CC31F: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC325: lea ecx, var_18
  loc_005CC328: call [004012B0h] ; __vbaFreeObj
  loc_005CC32E: mov ecx, [esi]
  loc_005CC330: push esi
  loc_005CC331: call [ecx+00000304h]
  loc_005CC337: lea edx, var_18
  loc_005CC33A: push eax
  loc_005CC33B: push edx
  loc_005CC33C: call ebx
  loc_005CC33E: sub esp, 00000010h
  loc_005CC341: mov edi, eax
  loc_005CC343: mov edx, esp
  loc_005CC345: mov eax, 0000000Ah
  loc_005CC34A: mov ecx, [edi]
  loc_005CC34C: push 0041FF70h
  loc_005CC351: mov [edx], eax
  loc_005CC353: mov eax, var_24
  loc_005CC356: push edi
  loc_005CC357: mov [edx+00000004h], eax
  loc_005CC35A: mov eax, 80020004h
  loc_005CC35F: mov [edx+00000008h], eax
  loc_005CC362: mov eax, var_1C
  loc_005CC365: mov [edx+0000000Ch], eax
  loc_005CC368: call [ecx+000001ECh]
  loc_005CC36E: test eax, eax
  loc_005CC370: fnclex
  loc_005CC372: jge 005CC386h
  loc_005CC374: push 000001ECh
  loc_005CC379: push 0041F844h
  loc_005CC37E: push edi
  loc_005CC37F: push eax
  loc_005CC380: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC386: mov edi, [004012B0h] ; __vbaFreeObj
  loc_005CC38C: lea ecx, var_18
  loc_005CC38F: call edi
  loc_005CC391: mov ecx, [esi]
  loc_005CC393: push esi
  loc_005CC394: call [ecx+00000304h]
  loc_005CC39A: lea edx, var_18
  loc_005CC39D: push eax
  loc_005CC39E: push edx
  loc_005CC39F: call ebx
  loc_005CC3A1: sub esp, 00000010h
  loc_005CC3A4: mov ecx, 0000000Ah
  loc_005CC3A9: mov ebx, esp
  loc_005CC3AB: mov esi, eax
  loc_005CC3AD: mov eax, 80020004h
  loc_005CC3B2: push 0041FC04h
  loc_005CC3B7: mov edx, [esi]
  loc_005CC3B9: mov [ebx], ecx
  loc_005CC3BB: mov ecx, var_24
  loc_005CC3BE: push esi
  loc_005CC3BF: mov [ebx+00000004h], ecx
  loc_005CC3C2: mov [ebx+00000008h], eax
  loc_005CC3C5: mov eax, var_1C
  loc_005CC3C8: mov [ebx+0000000Ch], eax
  loc_005CC3CB: call [edx+000001ECh]
  loc_005CC3D1: test eax, eax
  loc_005CC3D3: fnclex
  loc_005CC3D5: jge 005CC3E9h
  loc_005CC3D7: push 000001ECh
  loc_005CC3DC: push 0041F844h
  loc_005CC3E1: push esi
  loc_005CC3E2: push eax
  loc_005CC3E3: call [00401074h] ; __vbaHresultCheckObj
  loc_005CC3E9: lea ecx, var_18
  loc_005CC3EC: call edi
  loc_005CC3EE: mov var_4, 00000000h
  loc_005CC3F5: push 005CC407h
  loc_005CC3FA: jmp 005CC406h
  loc_005CC3FC: lea ecx, var_18
  loc_005CC3FF: call [004012B0h] ; __vbaFreeObj
  loc_005CC405: ret
  loc_005CC406: ret
  loc_005CC407: mov eax, Me
  loc_005CC40A: push eax
  loc_005CC40B: mov ecx, [eax]
  loc_005CC40D: call [ecx+00000008h]
  loc_005CC410: mov eax, var_4
  loc_005CC413: mov ecx, var_14
  loc_005CC416: pop edi
  loc_005CC417: pop esi
  loc_005CC418: mov fs:[00000000h], ecx
  loc_005CC41F: pop ebx
  loc_005CC420: mov esp, ebp
  loc_005CC422: pop ebp
  loc_005CC423: retn 0004h
End Sub
