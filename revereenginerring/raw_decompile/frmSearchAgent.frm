VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6C2863C385E30}#1.0#0"; "C:\WINDOWS\SysWow64\Msflxgrd.ocx"
Begin VB.Form frmSearchAgent
  Caption = " Search Agent"
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
  ClientWidth = 4095
  ClientHeight = 7830
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin VB.Frame Frame1
    Left = 0
    Top = -90
    Width = 4095
    Height = 7905
    TabIndex = 1
    Begin VB.TextBox txtAgent
      Left = 210
      Top = 7440
      Width = 1575
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
    Begin VB.CommandButton cmdSelect
      Caption = "&Select"
      Left = 1920
      Top = 7440
      Width = 900
      Height = 345
      TabIndex = 4
    End
    Begin VB.CommandButton cmdCancel
      Caption = "&Cancel"
      Left = 2820
      Top = 7440
      Width = 900
      Height = 345
      TabIndex = 3
    End
    Begin MSFlexGridLib.MSFlexGrid MSFle
      Left = 60
      Top = 150
      Width = 3975
      Height = 7215
      TabIndex = 2
      OleObjectBlob = "frmSearchAgent.frx":0000
    End
  End
End

Attribute VB_Name = "frmSearchAgent"


Private Sub cmdSelect_Click() '4B9400
  loc_004B9400: push ebp
  loc_004B9401: mov ebp, esp
  loc_004B9403: sub esp, 0000000Ch
  loc_004B9406: push 00403B36h ; __vbaExceptHandler
  loc_004B940B: mov eax, fs:[00000000h]
  loc_004B9411: push eax
  loc_004B9412: mov fs:[00000000h], esp
  loc_004B9419: sub esp, 00000058h
  loc_004B941C: push ebx
  loc_004B941D: push esi
  loc_004B941E: push edi
  loc_004B941F: mov var_C, esp
  loc_004B9422: mov var_8, 00401E40h
  loc_004B9429: mov edi, Me
  loc_004B942C: mov eax, edi
  loc_004B942E: and eax, 00000001h
  loc_004B9431: mov var_4, eax
  loc_004B9434: and edi, FFFFFFFEh
  loc_004B9437: push edi
  loc_004B9438: mov Me, edi
  loc_004B943B: mov ecx, [edi]
  loc_004B943D: call [ecx+00000004h]
  loc_004B9440: lea edx, var_48
  loc_004B9443: xor ebx, ebx
  loc_004B9445: lea eax, var_28
  loc_004B9448: lea esi, [edi+00000038h]
  loc_004B944B: push edx
  loc_004B944C: mov var_48, ebx
  loc_004B944F: push eax
  loc_004B9450: mov var_18, ebx
  loc_004B9453: mov var_28, ebx
  loc_004B9456: mov var_38, ebx
  loc_004B9459: mov var_58, ebx
  loc_004B945C: mov var_40, esi
  loc_004B945F: mov var_48, 00004008h
  loc_004B9466: call [004010D4h] ; rtcTrimVar
  loc_004B946C: lea ecx, var_28
  loc_004B946F: lea edx, var_58
  loc_004B9472: push ecx
  loc_004B9473: push edx
  loc_004B9474: mov var_50, 0041E5D4h
  loc_004B947B: mov var_58, 00008008h
  loc_004B9482: call [00401218h] ; __vbaVarTstNe
  loc_004B9488: lea ecx, var_28
  loc_004B948B: mov var_5C, ax
  loc_004B948F: call [00401020h] ; __vbaFreeVar
  loc_004B9495: cmp var_5C, bx
  loc_004B9499: jz 004B94FCh
  loc_004B949B: mov edx, [esi]
  loc_004B949D: mov ecx, 0061A0B8h
  loc_004B94A2: call [004011ECh] ; __vbaStrCopy
  loc_004B94A8: cmp [0061B394h], ebx
  loc_004B94AE: jnz 004B94C0h
  loc_004B94B0: push 0061B394h
  loc_004B94B5: push 0041E4A0h
  loc_004B94BA: call [004011DCh] ; __vbaNew2
  loc_004B94C0: mov esi, [0061B394h]
  loc_004B94C6: lea eax, var_18
  loc_004B94C9: push edi
  loc_004B94CA: push eax
  loc_004B94CB: mov edx, [esi]
  loc_004B94CD: mov var_6C, edx
  loc_004B94D0: call [004010B8h] ; __vbaObjSetAddref
  loc_004B94D6: mov ecx, var_6C
  loc_004B94D9: push eax
  loc_004B94DA: push esi
  loc_004B94DB: call [ecx+00000010h]
  loc_004B94DE: cmp eax, ebx
  loc_004B94E0: fnclex
  loc_004B94E2: jge 004B94F3h
  loc_004B94E4: push 00000010h
  loc_004B94E6: push 0041E490h
  loc_004B94EB: push esi
  loc_004B94EC: push eax
  loc_004B94ED: call [00401074h] ; __vbaHresultCheckObj
  loc_004B94F3: lea ecx, var_18
  loc_004B94F6: call [004012B0h] ; __vbaFreeObj
  loc_004B94FC: mov var_4, ebx
  loc_004B94FF: push 004B9524h
  loc_004B9504: jmp 004B9523h
  loc_004B9506: lea ecx, var_18
  loc_004B9509: call [004012B0h] ; __vbaFreeObj
  loc_004B950F: lea edx, var_38
  loc_004B9512: lea eax, var_28
  loc_004B9515: push edx
  loc_004B9516: push eax
  loc_004B9517: push 00000002h
  loc_004B9519: call [00401038h] ; __vbaFreeVarList
  loc_004B951F: add esp, 0000000Ch
  loc_004B9522: ret
  loc_004B9523: ret
  loc_004B9524: mov eax, Me
  loc_004B9527: push eax
  loc_004B9528: mov ecx, [eax]
  loc_004B952A: call [ecx+00000008h]
  loc_004B952D: mov eax, var_4
  loc_004B9530: mov ecx, var_14
  loc_004B9533: pop edi
  loc_004B9534: pop esi
  loc_004B9535: mov fs:[00000000h], ecx
  loc_004B953C: pop ebx
  loc_004B953D: mov esp, ebp
  loc_004B953F: pop ebp
  loc_004B9540: retn 0004h
End Sub

Private Sub Form_Load() '4B9550
  loc_004B9550: push ebp
  loc_004B9551: mov ebp, esp
  loc_004B9553: sub esp, 0000000Ch
  loc_004B9556: push 00403B36h ; __vbaExceptHandler
  loc_004B955B: mov eax, fs:[00000000h]
  loc_004B9561: push eax
  loc_004B9562: mov fs:[00000000h], esp
  loc_004B9569: sub esp, 00000018h
  loc_004B956C: push ebx
  loc_004B956D: push esi
  loc_004B956E: push edi
  loc_004B956F: mov var_C, esp
  loc_004B9572: mov var_8, 00401E50h
  loc_004B9579: mov esi, Me
  loc_004B957C: mov eax, esi
  loc_004B957E: and eax, 00000001h
  loc_004B9581: mov var_4, eax
  loc_004B9584: and esi, FFFFFFFEh
  loc_004B9587: push esi
  loc_004B9588: mov Me, esi
  loc_004B958B: mov ecx, [esi]
  loc_004B958D: call [ecx+00000004h]
  loc_004B9590: mov edx, [esi]
  loc_004B9592: xor eax, eax
  loc_004B9594: push esi
  loc_004B9595: mov var_18, eax
  loc_004B9598: mov var_1C, eax
  loc_004B959B: call [edx+000002FCh]
  loc_004B95A1: mov ebx, [004010A0h] ; __vbaObjSet
  loc_004B95A7: push eax
  loc_004B95A8: lea eax, var_1C
  loc_004B95AB: push eax
  loc_004B95AC: call ebx
  loc_004B95AE: mov edi, eax
  loc_004B95B0: push FFFFFFFFh
  loc_004B95B2: push edi
  loc_004B95B3: mov ecx, [edi]
  loc_004B95B5: call [ecx+0000009Ch]
  loc_004B95BB: test eax, eax
  loc_004B95BD: fnclex
  loc_004B95BF: jge 004B95D3h
  loc_004B95C1: push 0000009Ch
  loc_004B95C6: push 0041F8C4h
  loc_004B95CB: push edi
  loc_004B95CC: push eax
  loc_004B95CD: call [00401074h] ; __vbaHresultCheckObj
  loc_004B95D3: mov edi, [004012B0h] ; __vbaFreeObj
  loc_004B95D9: lea ecx, var_1C
  loc_004B95DC: call edi
  loc_004B95DE: mov edx, [esi]
  loc_004B95E0: push 00000000h
  loc_004B95E2: push 00000044h
  loc_004B95E4: push esi
  loc_004B95E5: call [edx+0000030Ch]
  loc_004B95EB: push eax
  loc_004B95EC: lea eax, var_1C
  loc_004B95EF: push eax
  loc_004B95F0: call ebx
  loc_004B95F2: push eax
  loc_004B95F3: call [00401024h] ; __vbaLateIdCall
  loc_004B95F9: add esp, 0000000Ch
  loc_004B95FC: lea ecx, var_1C
  loc_004B95FF: call edi
  loc_004B9601: push 00000000h
  loc_004B9603: call [00401008h] ; __vbaStrI2
  loc_004B9609: mov edx, eax
  loc_004B960B: lea ecx, var_18
  loc_004B960E: call [00401270h] ; __vbaStrMove
  loc_004B9614: mov edx, eax
  loc_004B9616: lea ecx, [esi+0000003Ch]
  loc_004B9619: call [004011ECh] ; __vbaStrCopy
  loc_004B961F: lea ecx, var_18
  loc_004B9622: call [004012ACh] ; __vbaFreeStr
  loc_004B9628: mov ecx, [esi]
  loc_004B962A: push esi
  loc_004B962B: call [ecx+000006FCh]
  loc_004B9631: mov edx, [esi]
  loc_004B9633: push esi
  loc_004B9634: call [edx+00000708h]
  loc_004B963A: mov var_4, 00000000h
  loc_004B9641: push 004B965Ch
  loc_004B9646: jmp 004B965Bh
  loc_004B9648: lea ecx, var_18
  loc_004B964B: call [004012ACh] ; __vbaFreeStr
  loc_004B9651: lea ecx, var_1C
  loc_004B9654: call [004012B0h] ; __vbaFreeObj
  loc_004B965A: ret
  loc_004B965B: ret
  loc_004B965C: mov eax, Me
  loc_004B965F: push eax
  loc_004B9660: mov ecx, [eax]
  loc_004B9662: call [ecx+00000008h]
  loc_004B9665: mov eax, var_4
  loc_004B9668: mov ecx, var_14
  loc_004B966B: pop edi
  loc_004B966C: pop esi
  loc_004B966D: mov fs:[00000000h], ecx
  loc_004B9674: pop ebx
  loc_004B9675: mov esp, ebp
  loc_004B9677: pop ebp
  loc_004B9678: retn 0004h
End Sub

Private Sub txtAgent_KeyPress(KeyAscii As Integer) '4BB610
  loc_004BB610: push ebp
  loc_004BB611: mov ebp, esp
  loc_004BB613: sub esp, 0000000Ch
  loc_004BB616: push 00403B36h ; __vbaExceptHandler
  loc_004BB61B: mov eax, fs:[00000000h]
  loc_004BB621: push eax
  loc_004BB622: mov fs:[00000000h], esp
  loc_004BB629: sub esp, 00000014h
  loc_004BB62C: push ebx
  loc_004BB62D: push esi
  loc_004BB62E: push edi
  loc_004BB62F: mov var_C, esp
  loc_004BB632: mov var_8, 00401E90h
  loc_004BB639: mov esi, Me
  loc_004BB63C: mov eax, esi
  loc_004BB63E: and eax, 00000001h
  loc_004BB641: mov var_4, eax
  loc_004BB644: and esi, FFFFFFFEh
  loc_004BB647: push esi
  loc_004BB648: mov Me, esi
  loc_004BB64B: mov ecx, [esi]
  loc_004BB64D: call [ecx+00000004h]
  loc_004BB650: mov edx, KeyAscii
  loc_004BB653: xor edi, edi
  loc_004BB655: mov var_18, edi
  loc_004BB658: cmp [edx], 000Dh
  loc_004BB65C: jnz 004BB69Eh
  loc_004BB65E: mov eax, [esi]
  loc_004BB660: push esi
  loc_004BB661: call [eax+00000304h]
  loc_004BB667: lea ecx, var_18
  loc_004BB66A: push eax
  loc_004BB66B: push ecx
  loc_004BB66C: call [004010A0h] ; __vbaObjSet
  loc_004BB672: mov esi, eax
  loc_004BB674: push esi
  loc_004BB675: mov edx, [esi]
  loc_004BB677: call [edx+000001A4h]
  loc_004BB67D: cmp eax, edi
  loc_004BB67F: fnclex
  loc_004BB681: jge 004BB695h
  loc_004BB683: push 000001A4h
  loc_004BB688: push 0041EAACh
  loc_004BB68D: push esi
  loc_004BB68E: push eax
  loc_004BB68F: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB695: lea ecx, var_18
  loc_004BB698: call [004012B0h] ; __vbaFreeObj
  loc_004BB69E: mov var_4, edi
  loc_004BB6A1: push 004BB6B3h
  loc_004BB6A6: jmp 004BB6B2h
  loc_004BB6A8: lea ecx, var_18
  loc_004BB6AB: call [004012B0h] ; __vbaFreeObj
  loc_004BB6B1: ret
  loc_004BB6B2: ret
  loc_004BB6B3: mov eax, Me
  loc_004BB6B6: push eax
  loc_004BB6B7: mov ecx, [eax]
  loc_004BB6B9: call [ecx+00000008h]
  loc_004BB6BC: mov eax, var_4
  loc_004BB6BF: mov ecx, var_14
  loc_004BB6C2: pop edi
  loc_004BB6C3: pop esi
  loc_004BB6C4: mov fs:[00000000h], ecx
  loc_004BB6CB: pop ebx
  loc_004BB6CC: mov esp, ebp
  loc_004BB6CE: pop ebp
  loc_004BB6CF: retn 0008h
End Sub

Private Sub txtAgent_LostFocus() '4BB6E0
  loc_004BB6E0: push ebp
  loc_004BB6E1: mov ebp, esp
  loc_004BB6E3: sub esp, 0000000Ch
  loc_004BB6E6: push 00403B36h ; __vbaExceptHandler
  loc_004BB6EB: mov eax, fs:[00000000h]
  loc_004BB6F1: push eax
  loc_004BB6F2: mov fs:[00000000h], esp
  loc_004BB6F9: sub esp, 000000B8h
  loc_004BB6FF: push ebx
  loc_004BB700: push esi
  loc_004BB701: push edi
  loc_004BB702: mov var_C, esp
  loc_004BB705: mov var_8, 00401EA0h
  loc_004BB70C: mov esi, Me
  loc_004BB70F: mov eax, esi
  loc_004BB711: and eax, 00000001h
  loc_004BB714: mov var_4, eax
  loc_004BB717: and esi, FFFFFFFEh
  loc_004BB71A: push esi
  loc_004BB71B: mov Me, esi
  loc_004BB71E: mov ecx, [esi]
  loc_004BB720: call [ecx+00000004h]
  loc_004BB723: mov edx, [esi]
  loc_004BB725: xor ebx, ebx
  loc_004BB727: push esi
  loc_004BB728: mov var_18, ebx
  loc_004BB72B: mov var_1C, ebx
  loc_004BB72E: mov var_20, ebx
  loc_004BB731: mov var_24, ebx
  loc_004BB734: mov var_34, ebx
  loc_004BB737: mov var_44, ebx
  loc_004BB73A: mov var_54, ebx
  loc_004BB73D: mov var_64, ebx
  loc_004BB740: mov var_74, ebx
  loc_004BB743: mov var_84, ebx
  loc_004BB749: mov var_94, ebx
  loc_004BB74F: mov var_A8, ebx
  loc_004BB755: mov var_AC, ebx
  loc_004BB75B: call [edx+00000300h]
  loc_004BB761: push eax
  loc_004BB762: lea eax, var_24
  loc_004BB765: push eax
  loc_004BB766: call [004010A0h] ; __vbaObjSet
  loc_004BB76C: mov edi, eax
  loc_004BB76E: lea edx, var_1C
  loc_004BB771: push edx
  loc_004BB772: push edi
  loc_004BB773: mov ecx, [edi]
  loc_004BB775: call [ecx+000000A0h]
  loc_004BB77B: cmp eax, ebx
  loc_004BB77D: fnclex
  loc_004BB77F: jge 004BB793h
  loc_004BB781: push 000000A0h
  loc_004BB786: push 0041E5E8h
  loc_004BB78B: push edi
  loc_004BB78C: push eax
  loc_004BB78D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB793: mov eax, var_1C
  loc_004BB796: lea ecx, var_44
  loc_004BB799: mov var_2C, eax
  loc_004BB79C: lea eax, var_34
  loc_004BB79F: push eax
  loc_004BB7A0: push ecx
  loc_004BB7A1: mov var_1C, ebx
  loc_004BB7A4: mov var_34, 00000008h
  loc_004BB7AB: call [004010D4h] ; rtcTrimVar
  loc_004BB7B1: lea edx, var_44
  loc_004BB7B4: lea eax, var_74
  loc_004BB7B7: push edx
  loc_004BB7B8: push eax
  loc_004BB7B9: mov var_6C, 0041E5D4h
  loc_004BB7C0: mov var_74, 00008008h
  loc_004BB7C7: call [00401110h] ; __vbaVarTstEq
  loc_004BB7CD: lea ecx, var_24
  loc_004BB7D0: mov edi, eax
  loc_004BB7D2: call [004012B0h] ; __vbaFreeObj
  loc_004BB7D8: lea ecx, var_44
  loc_004BB7DB: lea edx, var_34
  loc_004BB7DE: push ecx
  loc_004BB7DF: push edx
  loc_004BB7E0: push 00000002h
  loc_004BB7E2: call [00401038h] ; __vbaFreeVarList
  loc_004BB7E8: add esp, 0000000Ch
  loc_004BB7EB: cmp di, bx
  loc_004BB7EE: jnz 004BBAE8h
  loc_004BB7F4: lea edi, var_24
  loc_004BB7F7: mov ecx, 0000000Ah
  loc_004BB7FC: push edi
  loc_004BB7FD: mov eax, 80020004h
  loc_004BB802: sub esp, 00000010h
  loc_004BB805: mov var_74, 00000003h
  loc_004BB80C: mov edi, esp
  loc_004BB80E: sub esp, 00000010h
  loc_004BB811: mov edx, [0061A13Ch]
  loc_004BB817: mov var_6C, 00000004h
  loc_004BB81E: mov [edi], ecx
  loc_004BB820: mov ecx, var_90
  loc_004BB826: mov edx, [edx]
  loc_004BB828: mov [edi+00000004h], ecx
  loc_004BB82B: mov ecx, esp
  loc_004BB82D: sub esp, 00000010h
  loc_004BB830: mov [edi+00000008h], eax
  loc_004BB833: mov eax, var_88
  loc_004BB839: mov [edi+0000000Ch], eax
  loc_004BB83C: mov eax, 0000000Ah
  loc_004BB841: mov [ecx], eax
  loc_004BB843: mov eax, var_80
  loc_004BB846: mov [ecx+00000004h], eax
  loc_004BB849: mov eax, 80020004h
  loc_004BB84E: mov [ecx+00000008h], eax
  loc_004BB851: mov eax, var_78
  loc_004BB854: mov [ecx+0000000Ch], eax
  loc_004BB857: mov eax, var_74
  loc_004BB85A: mov ecx, esp
  loc_004BB85C: push 0041F1ACh ; "Select * From AgentThai"
  loc_004BB861: mov [ecx], eax
  loc_004BB863: mov eax, var_70
  loc_004BB866: mov [ecx+00000004h], eax
  loc_004BB869: mov eax, var_6C
  loc_004BB86C: mov [ecx+00000008h], eax
  loc_004BB86F: mov eax, var_68
  loc_004BB872: mov [ecx+0000000Ch], eax
  loc_004BB875: mov ecx, [0061A13Ch]
  loc_004BB87B: push ecx
  loc_004BB87C: call [edx+000000BCh]
  loc_004BB882: cmp eax, ebx
  loc_004BB884: fnclex
  loc_004BB886: jge 004BB8A0h
  loc_004BB888: mov edx, [0061A13Ch]
  loc_004BB88E: push 000000BCh
  loc_004BB893: push 0041E928h
  loc_004BB898: push edx
  loc_004BB899: push eax
  loc_004BB89A: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB8A0: mov eax, var_24
  loc_004BB8A3: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BB8A9: push eax
  loc_004BB8AA: lea eax, var_18
  loc_004BB8AD: push eax
  loc_004BB8AE: mov var_24, ebx
  loc_004BB8B1: call edi
  loc_004BB8B3: mov eax, var_18
  loc_004BB8B6: lea edx, var_A8
  loc_004BB8BC: push edx
  loc_004BB8BD: push eax
  loc_004BB8BE: mov ecx, [eax]
  loc_004BB8C0: call [ecx+00000020h]
  loc_004BB8C3: cmp eax, ebx
  loc_004BB8C5: fnclex
  loc_004BB8C7: jge 004BB8DBh
  loc_004BB8C9: mov ecx, var_18
  loc_004BB8CC: push 00000020h
  loc_004BB8CE: push 0041E938h
  loc_004BB8D3: push ecx
  loc_004BB8D4: push eax
  loc_004BB8D5: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB8DB: mov eax, var_18
  loc_004BB8DE: lea ecx, var_AC
  loc_004BB8E4: push ecx
  loc_004BB8E5: push eax
  loc_004BB8E6: mov edx, [eax]
  loc_004BB8E8: call [edx+00000034h]
  loc_004BB8EB: cmp eax, ebx
  loc_004BB8ED: fnclex
  loc_004BB8EF: jge 004BB903h
  loc_004BB8F1: mov edx, var_18
  loc_004BB8F4: push 00000034h
  loc_004BB8F6: push 0041E938h
  loc_004BB8FB: push edx
  loc_004BB8FC: push eax
  loc_004BB8FD: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB903: xor eax, eax
  loc_004BB905: cmp var_AC, bx
  loc_004BB90C: setz al
  loc_004BB90F: xor ecx, ecx
  loc_004BB911: cmp var_A8, bx
  loc_004BB918: setz cl
  loc_004BB91B: or eax, ecx
  loc_004BB91D: jz 004BB9C2h
  loc_004BB923: mov edx, [esi]
  loc_004BB925: push esi
  loc_004BB926: call [edx+00000300h]
  loc_004BB92C: push eax
  loc_004BB92D: lea eax, var_24
  loc_004BB930: push eax
  loc_004BB931: call edi
  loc_004BB933: mov edi, eax
  loc_004BB935: lea edx, var_1C
  loc_004BB938: push edx
  loc_004BB939: push edi
  loc_004BB93A: mov ecx, [edi]
  loc_004BB93C: call [ecx+000000A0h]
  loc_004BB942: cmp eax, ebx
  loc_004BB944: fnclex
  loc_004BB946: jge 004BB95Ah
  loc_004BB948: push 000000A0h
  loc_004BB94D: push 0041E5E8h
  loc_004BB952: push edi
  loc_004BB953: push eax
  loc_004BB954: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB95A: mov eax, var_1C
  loc_004BB95D: lea ecx, var_44
  loc_004BB960: mov var_2C, eax
  loc_004BB963: lea eax, var_34
  loc_004BB966: push eax
  loc_004BB967: push ecx
  loc_004BB968: mov var_1C, ebx
  loc_004BB96B: mov var_34, 00000008h
  loc_004BB972: call [004010D4h] ; rtcTrimVar
  loc_004BB978: lea edx, var_44
  loc_004BB97B: push edx
  loc_004BB97C: call [00401028h] ; __vbaStrVarMove
  loc_004BB982: mov edx, eax
  loc_004BB984: lea ecx, var_20
  loc_004BB987: call [00401270h] ; __vbaStrMove
  loc_004BB98D: mov edx, eax
  loc_004BB98F: lea ecx, [esi+00000038h]
  loc_004BB992: call [004011ECh] ; __vbaStrCopy
  loc_004BB998: lea ecx, var_20
  loc_004BB99B: call [004012ACh] ; __vbaFreeStr
  loc_004BB9A1: lea ecx, var_24
  loc_004BB9A4: call [004012B0h] ; __vbaFreeObj
  loc_004BB9AA: lea eax, var_44
  loc_004BB9AD: lea ecx, var_34
  loc_004BB9B0: push eax
  loc_004BB9B1: push ecx
  loc_004BB9B2: push 00000002h
  loc_004BB9B4: call [00401038h] ; __vbaFreeVarList
  loc_004BB9BA: add esp, 0000000Ch
  loc_004BB9BD: jmp 004BBAAAh
  loc_004BB9C2: mov ecx, 80020004h
  loc_004BB9C7: mov eax, 0000000Ah
  loc_004BB9CC: mov var_5C, ecx
  loc_004BB9CF: mov var_4C, ecx
  loc_004BB9D2: mov var_3C, ecx
  loc_004BB9D5: lea edx, var_74
  loc_004BB9D8: lea ecx, var_34
  loc_004BB9DB: mov var_64, eax
  loc_004BB9DE: mov var_54, eax
  loc_004BB9E1: mov var_44, eax
  loc_004BB9E4: mov var_6C, 00426B30h ; "Agent Not Found!"
  loc_004BB9EB: mov var_74, 00000008h
  loc_004BB9F2: call [00401240h] ; __vbaVarDup
  loc_004BB9F8: lea edx, var_64
  loc_004BB9FB: lea eax, var_54
  loc_004BB9FE: push edx
  loc_004BB9FF: lea ecx, var_44
  loc_004BBA02: push eax
  loc_004BBA03: push ecx
  loc_004BBA04: lea edx, var_34
  loc_004BBA07: push 00000030h
  loc_004BBA09: push edx
  loc_004BBA0A: call [004010A4h] ; rtcMsgBox
  loc_004BBA10: lea eax, var_64
  loc_004BBA13: lea ecx, var_54
  loc_004BBA16: push eax
  loc_004BBA17: lea edx, var_44
  loc_004BBA1A: push ecx
  loc_004BBA1B: lea eax, var_34
  loc_004BBA1E: push edx
  loc_004BBA1F: push eax
  loc_004BBA20: push 00000004h
  loc_004BBA22: call [00401038h] ; __vbaFreeVarList
  loc_004BBA28: mov ecx, [esi]
  loc_004BBA2A: add esp, 00000014h
  loc_004BBA2D: push esi
  loc_004BBA2E: call [ecx+00000300h]
  loc_004BBA34: lea edx, var_24
  loc_004BBA37: push eax
  loc_004BBA38: push edx
  loc_004BBA39: call edi
  loc_004BBA3B: mov edi, eax
  loc_004BBA3D: push 0041E5D4h
  loc_004BBA42: push edi
  loc_004BBA43: mov eax, [edi]
  loc_004BBA45: call [eax+000000A4h]
  loc_004BBA4B: cmp eax, ebx
  loc_004BBA4D: fnclex
  loc_004BBA4F: jge 004BBA63h
  loc_004BBA51: push 000000A4h
  loc_004BBA56: push 0041E5E8h
  loc_004BBA5B: push edi
  loc_004BBA5C: push eax
  loc_004BBA5D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BBA63: mov edi, [004012B0h] ; __vbaFreeObj
  loc_004BBA69: lea ecx, var_24
  loc_004BBA6C: call edi
  loc_004BBA6E: mov ecx, [esi]
  loc_004BBA70: push esi
  loc_004BBA71: call [ecx+00000300h]
  loc_004BBA77: lea edx, var_24
  loc_004BBA7A: push eax
  loc_004BBA7B: push edx
  loc_004BBA7C: call [004010A0h] ; __vbaObjSet
  loc_004BBA82: mov esi, eax
  loc_004BBA84: push esi
  loc_004BBA85: mov eax, [esi]
  loc_004BBA87: call [eax+00000204h]
  loc_004BBA8D: cmp eax, ebx
  loc_004BBA8F: fnclex
  loc_004BBA91: jge 004BBAA5h
  loc_004BBA93: push 00000204h
  loc_004BBA98: push 0041E5E8h
  loc_004BBA9D: push esi
  loc_004BBA9E: push eax
  loc_004BBA9F: call [00401074h] ; __vbaHresultCheckObj
  loc_004BBAA5: lea ecx, var_24
  loc_004BBAA8: call edi
  loc_004BBAAA: mov eax, var_18
  loc_004BBAAD: push eax
  loc_004BBAAE: mov ecx, [eax]
  loc_004BBAB0: call [ecx+000000C4h]
  loc_004BBAB6: cmp eax, ebx
  loc_004BBAB8: fnclex
  loc_004BBABA: jge 004BBAD1h
  loc_004BBABC: mov edx, var_18
  loc_004BBABF: push 000000C4h
  loc_004BBAC4: push 0041E938h
  loc_004BBAC9: push edx
  loc_004BBACA: push eax
  loc_004BBACB: call [00401074h] ; __vbaHresultCheckObj
  loc_004BBAD1: push 0041E938h
  loc_004BBAD6: push ebx
  loc_004BBAD7: call [00401274h] ; __vbaCastObj
  loc_004BBADD: push eax
  loc_004BBADE: lea eax, var_18
  loc_004BBAE1: push eax
  loc_004BBAE2: call [004010A0h] ; __vbaObjSet
  loc_004BBAE8: mov var_4, ebx
  loc_004BBAEB: push 004BBB34h
  loc_004BBAF0: jmp 004BBB2Ah
  loc_004BBAF2: lea ecx, var_20
  loc_004BBAF5: lea edx, var_1C
  loc_004BBAF8: push ecx
  loc_004BBAF9: push edx
  loc_004BBAFA: push 00000002h
  loc_004BBAFC: call [004011FCh] ; __vbaFreeStrList
  loc_004BBB02: add esp, 0000000Ch
  loc_004BBB05: lea ecx, var_24
  loc_004BBB08: call [004012B0h] ; __vbaFreeObj
  loc_004BBB0E: lea eax, var_64
  loc_004BBB11: lea ecx, var_54
  loc_004BBB14: push eax
  loc_004BBB15: lea edx, var_44
  loc_004BBB18: push ecx
  loc_004BBB19: lea eax, var_34
  loc_004BBB1C: push edx
  loc_004BBB1D: push eax
  loc_004BBB1E: push 00000004h
  loc_004BBB20: call [00401038h] ; __vbaFreeVarList
  loc_004BBB26: add esp, 00000014h
  loc_004BBB29: ret
  loc_004BBB2A: lea ecx, var_18
  loc_004BBB2D: call [004012B0h] ; __vbaFreeObj
  loc_004BBB33: ret
  loc_004BBB34: mov eax, Me
  loc_004BBB37: push eax
  loc_004BBB38: mov ecx, [eax]
  loc_004BBB3A: call [ecx+00000008h]
  loc_004BBB3D: mov eax, var_4
  loc_004BBB40: mov ecx, var_14
  loc_004BBB43: pop edi
  loc_004BBB44: pop esi
  loc_004BBB45: mov fs:[00000000h], ecx
  loc_004BBB4C: pop ebx
  loc_004BBB4D: mov esp, ebp
  loc_004BBB4F: pop ebp
  loc_004BBB50: retn 0004h
End Sub

Private Sub MSFle_Click() '4BB240
  loc_004BB240: push ebp
  loc_004BB241: mov ebp, esp
  loc_004BB243: sub esp, 0000000Ch
  loc_004BB246: push 00403B36h ; __vbaExceptHandler
  loc_004BB24B: mov eax, fs:[00000000h]
  loc_004BB251: push eax
  loc_004BB252: mov fs:[00000000h], esp
  loc_004BB259: sub esp, 00000074h
  loc_004BB25C: push ebx
  loc_004BB25D: push esi
  loc_004BB25E: push edi
  loc_004BB25F: mov var_C, esp
  loc_004BB262: mov var_8, 00401E70h
  loc_004BB269: mov esi, Me
  loc_004BB26C: mov eax, esi
  loc_004BB26E: and eax, 00000001h
  loc_004BB271: mov var_4, eax
  loc_004BB274: and esi, FFFFFFFEh
  loc_004BB277: push esi
  loc_004BB278: mov Me, esi
  loc_004BB27B: mov ecx, [esi]
  loc_004BB27D: call [ecx+00000004h]
  loc_004BB280: mov edx, [0061A0A0h]
  loc_004BB286: xor edi, edi
  loc_004BB288: push edx
  loc_004BB289: push 004268E8h ; "Balance"
  loc_004BB28E: mov var_18, edi
  loc_004BB291: mov var_1C, edi
  loc_004BB294: mov var_20, edi
  loc_004BB297: mov var_30, edi
  loc_004BB29A: mov var_40, edi
  loc_004BB29D: call [0040110Ch] ; __vbaStrCmp
  loc_004BB2A3: test eax, eax
  loc_004BB2A5: push edi
  loc_004BB2A6: push 0000000Ah
  loc_004BB2A8: jnz 004BB309h
  loc_004BB2AA: mov eax, [esi]
  loc_004BB2AC: push esi
  loc_004BB2AD: call [eax+0000030Ch]
  loc_004BB2B3: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BB2B9: lea ecx, var_1C
  loc_004BB2BC: push eax
  loc_004BB2BD: push ecx
  loc_004BB2BE: call edi
  loc_004BB2C0: mov ebx, [00401140h] ; __vbaLateIdCallLd
  loc_004BB2C6: lea edx, var_30
  loc_004BB2C9: push eax
  loc_004BB2CA: push edx
  loc_004BB2CB: call ebx
  loc_004BB2CD: add esp, 00000010h
  loc_004BB2D0: push eax
  loc_004BB2D1: call [0040121Ch] ; __vbaI4Var
  loc_004BB2D7: sub esp, 00000010h
  loc_004BB2DA: mov ecx, 00000003h
  loc_004BB2DF: mov edx, esp
  loc_004BB2E1: mov var_70, ecx
  loc_004BB2E4: sub esp, 00000010h
  loc_004BB2E7: mov [edx], ecx
  loc_004BB2E9: mov ecx, var_4C
  loc_004BB2EC: mov [edx+00000004h], ecx
  loc_004BB2EF: mov ecx, esp
  loc_004BB2F1: mov [edx+00000008h], eax
  loc_004BB2F4: mov eax, var_44
  loc_004BB2F7: mov [edx+0000000Ch], eax
  loc_004BB2FA: mov edx, var_70
  loc_004BB2FD: mov eax, var_6C
  loc_004BB300: mov [ecx], edx
  loc_004BB302: mov [ecx+00000004h], eax
  loc_004BB305: xor eax, eax
  loc_004BB307: jmp 004BB369h
  loc_004BB309: mov ecx, [esi]
  loc_004BB30B: push esi
  loc_004BB30C: call [ecx+0000030Ch]
  loc_004BB312: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BB318: lea edx, var_1C
  loc_004BB31B: push eax
  loc_004BB31C: push edx
  loc_004BB31D: call edi
  loc_004BB31F: mov ebx, [00401140h] ; __vbaLateIdCallLd
  loc_004BB325: push eax
  loc_004BB326: lea eax, var_30
  loc_004BB329: push eax
  loc_004BB32A: call ebx
  loc_004BB32C: add esp, 00000010h
  loc_004BB32F: push eax
  loc_004BB330: call [0040121Ch] ; __vbaI4Var
  loc_004BB336: sub esp, 00000010h
  loc_004BB339: mov ecx, 00000003h
  loc_004BB33E: mov edx, esp
  loc_004BB340: mov var_70, ecx
  loc_004BB343: sub esp, 00000010h
  loc_004BB346: mov [edx], ecx
  loc_004BB348: mov ecx, var_4C
  loc_004BB34B: mov [edx+00000004h], ecx
  loc_004BB34E: mov ecx, esp
  loc_004BB350: mov [edx+00000008h], eax
  loc_004BB353: mov eax, var_44
  loc_004BB356: mov [edx+0000000Ch], eax
  loc_004BB359: mov edx, var_70
  loc_004BB35C: mov eax, var_6C
  loc_004BB35F: mov [ecx], edx
  loc_004BB361: mov [ecx+00000004h], eax
  loc_004BB364: mov eax, 00000001h
  loc_004BB369: mov edx, var_64
  loc_004BB36C: mov [ecx+00000008h], eax
  loc_004BB36F: mov eax, [esi]
  loc_004BB371: push 00000002h
  loc_004BB373: push 00000041h
  loc_004BB375: push esi
  loc_004BB376: mov [ecx+0000000Ch], edx
  loc_004BB379: call [eax+0000030Ch]
  loc_004BB37F: lea ecx, var_20
  loc_004BB382: push eax
  loc_004BB383: push ecx
  loc_004BB384: call edi
  loc_004BB386: lea edx, var_40
  loc_004BB389: push eax
  loc_004BB38A: push edx
  loc_004BB38B: call ebx
  loc_004BB38D: add esp, 00000030h
  loc_004BB390: push eax
  loc_004BB391: call [00401028h] ; __vbaStrVarMove
  loc_004BB397: mov edx, eax
  loc_004BB399: lea ecx, var_18
  loc_004BB39C: call [00401270h] ; __vbaStrMove
  loc_004BB3A2: mov edx, eax
  loc_004BB3A4: lea ecx, [esi+00000038h]
  loc_004BB3A7: call [004011ECh] ; __vbaStrCopy
  loc_004BB3AD: lea ecx, var_18
  loc_004BB3B0: call [004012ACh] ; __vbaFreeStr
  loc_004BB3B6: lea eax, var_20
  loc_004BB3B9: lea ecx, var_1C
  loc_004BB3BC: push eax
  loc_004BB3BD: push ecx
  loc_004BB3BE: push 00000002h
  loc_004BB3C0: call [00401040h] ; __vbaFreeObjList
  loc_004BB3C6: lea edx, var_40
  loc_004BB3C9: lea eax, var_30
  loc_004BB3CC: push edx
  loc_004BB3CD: push eax
  loc_004BB3CE: push 00000002h
  loc_004BB3D0: call [00401038h] ; __vbaFreeVarList
  loc_004BB3D6: add esp, 00000018h
  loc_004BB3D9: mov var_4, 00000000h
  loc_004BB3E0: push 004BB415h
  loc_004BB3E5: jmp 004BB414h
  loc_004BB3E7: lea ecx, var_18
  loc_004BB3EA: call [004012ACh] ; __vbaFreeStr
  loc_004BB3F0: lea ecx, var_20
  loc_004BB3F3: lea edx, var_1C
  loc_004BB3F6: push ecx
  loc_004BB3F7: push edx
  loc_004BB3F8: push 00000002h
  loc_004BB3FA: call [00401040h] ; __vbaFreeObjList
  loc_004BB400: lea eax, var_40
  loc_004BB403: lea ecx, var_30
  loc_004BB406: push eax
  loc_004BB407: push ecx
  loc_004BB408: push 00000002h
  loc_004BB40A: call [00401038h] ; __vbaFreeVarList
  loc_004BB410: add esp, 00000018h
  loc_004BB413: ret
  loc_004BB414: ret
  loc_004BB415: mov eax, Me
  loc_004BB418: push eax
  loc_004BB419: mov edx, [eax]
  loc_004BB41B: call [edx+00000008h]
  loc_004BB41E: mov eax, var_4
  loc_004BB421: mov ecx, var_14
  loc_004BB424: pop edi
  loc_004BB425: pop esi
  loc_004BB426: mov fs:[00000000h], ecx
  loc_004BB42D: pop ebx
  loc_004BB42E: mov esp, ebp
  loc_004BB430: pop ebp
  loc_004BB431: retn 0004h
End Sub

Private Sub MSFle_KeyPress(KeyAscii As Integer) '4BB440
  loc_004BB440: push ebp
  loc_004BB441: mov ebp, esp
  loc_004BB443: sub esp, 0000000Ch
  loc_004BB446: push 00403B36h ; __vbaExceptHandler
  loc_004BB44B: mov eax, fs:[00000000h]
  loc_004BB451: push eax
  loc_004BB452: mov fs:[00000000h], esp
  loc_004BB459: sub esp, 0000007Ch
  loc_004BB45C: push ebx
  loc_004BB45D: push esi
  loc_004BB45E: push edi
  loc_004BB45F: mov var_C, esp
  loc_004BB462: mov var_8, 00401E80h
  loc_004BB469: mov esi, Me
  loc_004BB46C: mov eax, esi
  loc_004BB46E: and eax, 00000001h
  loc_004BB471: mov var_4, eax
  loc_004BB474: and esi, FFFFFFFEh
  loc_004BB477: push esi
  loc_004BB478: mov Me, esi
  loc_004BB47B: mov ecx, [esi]
  loc_004BB47D: call [ecx+00000004h]
  loc_004BB480: mov edx, KeyAscii
  loc_004BB483: xor eax, eax
  loc_004BB485: mov var_18, eax
  loc_004BB488: mov var_1C, eax
  loc_004BB48B: cmp [edx], 000Dh
  loc_004BB48F: mov var_20, eax
  loc_004BB492: mov var_30, eax
  loc_004BB495: mov var_40, eax
  loc_004BB498: mov var_50, eax
  loc_004BB49B: mov var_70, eax
  loc_004BB49E: jnz 004BB5B5h
  loc_004BB4A4: push eax
  loc_004BB4A5: mov eax, [esi]
  loc_004BB4A7: push 0000000Ah
  loc_004BB4A9: push esi
  loc_004BB4AA: call [eax+0000030Ch]
  loc_004BB4B0: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BB4B6: lea ecx, var_1C
  loc_004BB4B9: push eax
  loc_004BB4BA: push ecx
  loc_004BB4BB: call edi
  loc_004BB4BD: mov ebx, [00401140h] ; __vbaLateIdCallLd
  loc_004BB4C3: lea edx, var_30
  loc_004BB4C6: push eax
  loc_004BB4C7: push edx
  loc_004BB4C8: call ebx
  loc_004BB4CA: add esp, 00000010h
  loc_004BB4CD: push eax
  loc_004BB4CE: call [0040121Ch] ; __vbaI4Var
  loc_004BB4D4: sub esp, 00000010h
  loc_004BB4D7: mov ecx, 00000003h
  loc_004BB4DC: mov edx, esp
  loc_004BB4DE: mov var_70, ecx
  loc_004BB4E1: sub esp, 00000010h
  loc_004BB4E4: mov [edx], ecx
  loc_004BB4E6: mov ecx, var_4C
  loc_004BB4E9: mov [edx+00000004h], ecx
  loc_004BB4EC: mov ecx, esp
  loc_004BB4EE: push 00000002h
  loc_004BB4F0: push 00000041h
  loc_004BB4F2: mov [edx+00000008h], eax
  loc_004BB4F5: mov eax, var_44
  loc_004BB4F8: push esi
  loc_004BB4F9: mov [edx+0000000Ch], eax
  loc_004BB4FC: mov edx, var_70
  loc_004BB4FF: mov eax, var_6C
  loc_004BB502: mov [ecx], edx
  loc_004BB504: mov edx, var_64
  loc_004BB507: mov [ecx+00000004h], eax
  loc_004BB50A: mov eax, 00000001h
  loc_004BB50F: mov [ecx+00000008h], eax
  loc_004BB512: mov eax, [esi]
  loc_004BB514: mov [ecx+0000000Ch], edx
  loc_004BB517: call [eax+0000030Ch]
  loc_004BB51D: lea ecx, var_20
  loc_004BB520: push eax
  loc_004BB521: push ecx
  loc_004BB522: call edi
  loc_004BB524: lea edx, var_40
  loc_004BB527: push eax
  loc_004BB528: push edx
  loc_004BB529: call ebx
  loc_004BB52B: add esp, 00000030h
  loc_004BB52E: push eax
  loc_004BB52F: call [00401028h] ; __vbaStrVarMove
  loc_004BB535: mov edx, eax
  loc_004BB537: lea ecx, var_18
  loc_004BB53A: call [00401270h] ; __vbaStrMove
  loc_004BB540: mov edx, eax
  loc_004BB542: lea ecx, [esi+00000038h]
  loc_004BB545: call [004011ECh] ; __vbaStrCopy
  loc_004BB54B: lea ecx, var_18
  loc_004BB54E: call [004012ACh] ; __vbaFreeStr
  loc_004BB554: lea eax, var_20
  loc_004BB557: lea ecx, var_1C
  loc_004BB55A: push eax
  loc_004BB55B: push ecx
  loc_004BB55C: push 00000002h
  loc_004BB55E: call [00401040h] ; __vbaFreeObjList
  loc_004BB564: lea edx, var_40
  loc_004BB567: lea eax, var_30
  loc_004BB56A: push edx
  loc_004BB56B: push eax
  loc_004BB56C: push 00000002h
  loc_004BB56E: call [00401038h] ; __vbaFreeVarList
  loc_004BB574: mov ecx, [esi]
  loc_004BB576: add esp, 00000018h
  loc_004BB579: push esi
  loc_004BB57A: call [ecx+00000304h]
  loc_004BB580: lea edx, var_1C
  loc_004BB583: push eax
  loc_004BB584: push edx
  loc_004BB585: call edi
  loc_004BB587: mov esi, eax
  loc_004BB589: push esi
  loc_004BB58A: mov eax, [esi]
  loc_004BB58C: call [eax+000001A4h]
  loc_004BB592: test eax, eax
  loc_004BB594: fnclex
  loc_004BB596: jge 004BB5AAh
  loc_004BB598: push 000001A4h
  loc_004BB59D: push 0041EAACh
  loc_004BB5A2: push esi
  loc_004BB5A3: push eax
  loc_004BB5A4: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB5AA: lea ecx, var_1C
  loc_004BB5AD: call [004012B0h] ; __vbaFreeObj
  loc_004BB5B3: xor eax, eax
  loc_004BB5B5: mov var_4, eax
  loc_004BB5B8: push 004BB5EDh
  loc_004BB5BD: jmp 004BB5ECh
  loc_004BB5BF: lea ecx, var_18
  loc_004BB5C2: call [004012ACh] ; __vbaFreeStr
  loc_004BB5C8: lea ecx, var_20
  loc_004BB5CB: lea edx, var_1C
  loc_004BB5CE: push ecx
  loc_004BB5CF: push edx
  loc_004BB5D0: push 00000002h
  loc_004BB5D2: call [00401040h] ; __vbaFreeObjList
  loc_004BB5D8: lea eax, var_40
  loc_004BB5DB: lea ecx, var_30
  loc_004BB5DE: push eax
  loc_004BB5DF: push ecx
  loc_004BB5E0: push 00000002h
  loc_004BB5E2: call [00401038h] ; __vbaFreeVarList
  loc_004BB5E8: add esp, 00000018h
  loc_004BB5EB: ret
  loc_004BB5EC: ret
  loc_004BB5ED: mov eax, Me
  loc_004BB5F0: push eax
  loc_004BB5F1: mov edx, [eax]
  loc_004BB5F3: call [edx+00000008h]
  loc_004BB5F6: mov eax, var_4
  loc_004BB5F9: mov ecx, var_14
  loc_004BB5FC: pop edi
  loc_004BB5FD: pop esi
  loc_004BB5FE: mov fs:[00000000h], ecx
  loc_004BB605: pop ebx
  loc_004BB606: mov esp, ebp
  loc_004BB608: pop ebp
  loc_004BB609: retn 0008h
End Sub

Private Sub cmdCancel_Click() '4B8EC0
  loc_004B8EC0: push ebp
  loc_004B8EC1: mov ebp, esp
  loc_004B8EC3: sub esp, 0000000Ch
  loc_004B8EC6: push 00403B36h ; __vbaExceptHandler
  loc_004B8ECB: mov eax, fs:[00000000h]
  loc_004B8ED1: push eax
  loc_004B8ED2: mov fs:[00000000h], esp
  loc_004B8ED9: sub esp, 00000018h
  loc_004B8EDC: push ebx
  loc_004B8EDD: push esi
  loc_004B8EDE: push edi
  loc_004B8EDF: mov var_C, esp
  loc_004B8EE2: mov var_8, 00401E20h
  loc_004B8EE9: mov edi, Me
  loc_004B8EEC: mov eax, edi
  loc_004B8EEE: and eax, 00000001h
  loc_004B8EF1: mov var_4, eax
  loc_004B8EF4: and edi, FFFFFFFEh
  loc_004B8EF7: push edi
  loc_004B8EF8: mov Me, edi
  loc_004B8EFB: mov ecx, [edi]
  loc_004B8EFD: call [ecx+00000004h]
  loc_004B8F00: xor ebx, ebx
  loc_004B8F02: mov edx, 0041E5D4h
  loc_004B8F07: mov ecx, 0061A0B8h
  loc_004B8F0C: mov var_18, ebx
  loc_004B8F0F: call [004011ECh] ; __vbaStrCopy
  loc_004B8F15: cmp [0061B394h], ebx
  loc_004B8F1B: jnz 004B8F2Dh
  loc_004B8F1D: push 0061B394h
  loc_004B8F22: push 0041E4A0h
  loc_004B8F27: call [004011DCh] ; __vbaNew2
  loc_004B8F2D: mov esi, [0061B394h]
  loc_004B8F33: lea eax, var_18
  loc_004B8F36: push edi
  loc_004B8F37: push eax
  loc_004B8F38: mov edx, [esi]
  loc_004B8F3A: mov var_2C, edx
  loc_004B8F3D: call [004010B8h] ; __vbaObjSetAddref
  loc_004B8F43: mov ecx, var_2C
  loc_004B8F46: push eax
  loc_004B8F47: push esi
  loc_004B8F48: call [ecx+00000010h]
  loc_004B8F4B: cmp eax, ebx
  loc_004B8F4D: fnclex
  loc_004B8F4F: jge 004B8F60h
  loc_004B8F51: push 00000010h
  loc_004B8F53: push 0041E490h
  loc_004B8F58: push esi
  loc_004B8F59: push eax
  loc_004B8F5A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B8F60: lea ecx, var_18
  loc_004B8F63: call [004012B0h] ; __vbaFreeObj
  loc_004B8F69: mov var_4, ebx
  loc_004B8F6C: push 004B8F7Eh
  loc_004B8F71: jmp 004B8F7Dh
  loc_004B8F73: lea ecx, var_18
  loc_004B8F76: call [004012B0h] ; __vbaFreeObj
  loc_004B8F7C: ret
  loc_004B8F7D: ret
  loc_004B8F7E: mov eax, Me
  loc_004B8F81: push eax
  loc_004B8F82: mov edx, [eax]
  loc_004B8F84: call [edx+00000008h]
  loc_004B8F87: mov eax, var_4
  loc_004B8F8A: mov ecx, var_14
  loc_004B8F8D: pop edi
  loc_004B8F8E: pop esi
  loc_004B8F8F: mov fs:[00000000h], ecx
  loc_004B8F96: pop ebx
  loc_004B8F97: mov esp, ebp
  loc_004B8F99: pop ebp
  loc_004B8F9A: retn 0004h
End Sub

Private Sub Proc_11_7_4B8FA0() '4B8FA0
  loc_004B8FA0: push ebp
  loc_004B8FA1: mov ebp, esp
  loc_004B8FA3: sub esp, 00000008h
  loc_004B8FA6: push 00403B36h ; __vbaExceptHandler
  loc_004B8FAB: mov eax, fs:[00000000h]
  loc_004B8FB1: push eax
  loc_004B8FB2: mov fs:[00000000h], esp
  loc_004B8FB9: sub esp, 00000048h
  loc_004B8FBC: push ebx
  loc_004B8FBD: push esi
  loc_004B8FBE: push edi
  loc_004B8FBF: mov var_8, esp
  loc_004B8FC2: mov var_4, 00401E30h
  loc_004B8FC9: mov eax, [0061A0A0h]
  loc_004B8FCE: mov var_14, 00000000h
  loc_004B8FD5: push eax
  loc_004B8FD6: push 004268E8h ; "Balance"
  loc_004B8FDB: call [0040110Ch] ; __vbaStrCmp
  loc_004B8FE1: test eax, eax
  loc_004B8FE3: jnz 004B91C4h
  loc_004B8FE9: mov edi, var_20
  loc_004B8FEC: sub esp, 00000010h
  loc_004B8FEF: mov esi, Me
  loc_004B8FF2: mov edx, esp
  loc_004B8FF4: mov ecx, 00000003h
  loc_004B8FF9: mov ebx, var_18
  loc_004B8FFC: mov [edx], ecx
  loc_004B8FFE: push 0000000Ah
  loc_004B9000: push esi
  loc_004B9001: mov [edx+00000004h], edi
  loc_004B9004: mov [edx+00000008h], eax
  loc_004B9007: mov eax, [esi]
  loc_004B9009: mov [edx+0000000Ch], ebx
  loc_004B900C: call [eax+0000030Ch]
  loc_004B9012: lea ecx, var_14
  loc_004B9015: push eax
  loc_004B9016: push ecx
  loc_004B9017: call [004010A0h] ; __vbaObjSet
  loc_004B901D: push eax
  loc_004B901E: call [00401288h] ; __vbaLateIdSt
  loc_004B9024: lea ecx, var_14
  loc_004B9027: call [004012B0h] ; __vbaFreeObj
  loc_004B902D: sub esp, 00000010h
  loc_004B9030: mov ecx, 00000003h
  loc_004B9035: mov edx, esp
  loc_004B9037: xor eax, eax
  loc_004B9039: push 0000000Bh
  loc_004B903B: push esi
  loc_004B903C: mov [edx], ecx
  loc_004B903E: mov [edx+00000004h], edi
  loc_004B9041: mov [edx+00000008h], eax
  loc_004B9044: mov eax, [esi]
  loc_004B9046: mov [edx+0000000Ch], ebx
  loc_004B9049: call [eax+0000030Ch]
  loc_004B904F: lea ecx, var_14
  loc_004B9052: push eax
  loc_004B9053: push ecx
  loc_004B9054: call [004010A0h] ; __vbaObjSet
  loc_004B905A: push eax
  loc_004B905B: call [00401288h] ; __vbaLateIdSt
  loc_004B9061: lea ecx, var_14
  loc_004B9064: call [004012B0h] ; __vbaFreeObj
  loc_004B906A: sub esp, 00000010h
  loc_004B906D: mov ecx, 00000008h
  loc_004B9072: mov edx, esp
  loc_004B9074: mov eax, 004268FCh ; "Name "
  loc_004B9079: push 00000000h
  loc_004B907B: push esi
  loc_004B907C: mov [edx], ecx
  loc_004B907E: mov [edx+00000004h], edi
  loc_004B9081: mov [edx+00000008h], eax
  loc_004B9084: mov eax, [esi]
  loc_004B9086: mov [edx+0000000Ch], ebx
  loc_004B9089: call [eax+0000030Ch]
  loc_004B908F: lea ecx, var_14
  loc_004B9092: push eax
  loc_004B9093: push ecx
  loc_004B9094: call [004010A0h] ; __vbaObjSet
  loc_004B909A: push eax
  loc_004B909B: call [00401288h] ; __vbaLateIdSt
  loc_004B90A1: lea ecx, var_14
  loc_004B90A4: call [004012B0h] ; __vbaFreeObj
  loc_004B90AA: sub esp, 00000010h
  loc_004B90AD: mov ecx, 00000003h
  loc_004B90B2: mov edx, esp
  loc_004B90B4: mov eax, 00000001h
  loc_004B90B9: push 0000000Bh
  loc_004B90BB: push esi
  loc_004B90BC: mov [edx], ecx
  loc_004B90BE: mov [edx+00000004h], edi
  loc_004B90C1: mov [edx+00000008h], eax
  loc_004B90C4: mov eax, [esi]
  loc_004B90C6: mov [edx+0000000Ch], ebx
  loc_004B90C9: call [eax+0000030Ch]
  loc_004B90CF: lea ecx, var_14
  loc_004B90D2: push eax
  loc_004B90D3: push ecx
  loc_004B90D4: call [004010A0h] ; __vbaObjSet
  loc_004B90DA: push eax
  loc_004B90DB: call [00401288h] ; __vbaLateIdSt
  loc_004B90E1: lea ecx, var_14
  loc_004B90E4: call [004012B0h] ; __vbaFreeObj
  loc_004B90EA: sub esp, 00000010h
  loc_004B90ED: mov ecx, 00000008h
  loc_004B90F2: mov edx, esp
  loc_004B90F4: mov eax, 0042043Ch ; "Amount"
  loc_004B90F9: push 00000000h
  loc_004B90FB: push esi
  loc_004B90FC: mov [edx], ecx
  loc_004B90FE: mov [edx+00000004h], edi
  loc_004B9101: mov [edx+00000008h], eax
  loc_004B9104: mov eax, [esi]
  loc_004B9106: mov [edx+0000000Ch], ebx
  loc_004B9109: call [eax+0000030Ch]
  loc_004B910F: lea ecx, var_14
  loc_004B9112: push eax
  loc_004B9113: push ecx
  loc_004B9114: call [004010A0h] ; __vbaObjSet
  loc_004B911A: push eax
  loc_004B911B: call [00401288h] ; __vbaLateIdSt
  loc_004B9121: lea ecx, var_14
  loc_004B9124: call [004012B0h] ; __vbaFreeObj
  loc_004B912A: sub esp, 00000010h
  loc_004B912D: mov ecx, 00000003h
  loc_004B9132: mov edx, esp
  loc_004B9134: xor eax, eax
  loc_004B9136: sub esp, 00000010h
  loc_004B9139: mov var_44, ecx
  loc_004B913C: mov [edx], ecx
  loc_004B913E: mov ecx, esp
  loc_004B9140: push 00000001h
  loc_004B9142: push 00000039h
  loc_004B9144: mov [edx+00000004h], edi
  loc_004B9147: push esi
  loc_004B9148: mov [edx+00000008h], eax
  loc_004B914B: mov eax, var_40
  loc_004B914E: mov [edx+0000000Ch], ebx
  loc_004B9151: mov edx, var_44
  loc_004B9154: mov [ecx], edx
  loc_004B9156: mov edx, var_38
  loc_004B9159: mov [ecx+00000004h], eax
  loc_004B915C: mov eax, 000005DCh
  loc_004B9161: mov [ecx+00000008h], eax
  loc_004B9164: mov eax, [esi]
  loc_004B9166: mov [ecx+0000000Ch], edx
  loc_004B9169: call [eax+0000030Ch]
  loc_004B916F: lea ecx, var_14
  loc_004B9172: push eax
  loc_004B9173: push ecx
  loc_004B9174: call [004010A0h] ; __vbaObjSet
  loc_004B917A: push eax
  loc_004B917B: call [00401160h] ; __vbaLateIdCallSt
  loc_004B9181: add esp, 0000002Ch
  loc_004B9184: lea ecx, var_14
  loc_004B9187: call [004012B0h] ; __vbaFreeObj
  loc_004B918D: sub esp, 00000010h
  loc_004B9190: mov ecx, 00000003h
  loc_004B9195: mov edx, esp
  loc_004B9197: mov eax, 00000001h
  loc_004B919C: sub esp, 00000010h
  loc_004B919F: mov var_44, ecx
  loc_004B91A2: mov [edx], ecx
  loc_004B91A4: mov ecx, esp
  loc_004B91A6: mov [edx+00000004h], edi
  loc_004B91A9: mov [edx+00000008h], eax
  loc_004B91AC: mov eax, var_40
  loc_004B91AF: mov [edx+0000000Ch], ebx
  loc_004B91B2: mov edx, var_44
  loc_004B91B5: mov [ecx], edx
  loc_004B91B7: mov [ecx+00000004h], eax
  loc_004B91BA: mov eax, 00000802h
  loc_004B91BF: jmp 004B939Ch
  loc_004B91C4: mov edi, var_20
  loc_004B91C7: sub esp, 00000010h
  loc_004B91CA: mov esi, Me
  loc_004B91CD: mov edx, esp
  loc_004B91CF: mov ecx, 00000003h
  loc_004B91D4: mov ebx, var_18
  loc_004B91D7: mov [edx], ecx
  loc_004B91D9: xor eax, eax
  loc_004B91DB: push 0000000Ah
  loc_004B91DD: push esi
  loc_004B91DE: mov [edx+00000004h], edi
  loc_004B91E1: mov [edx+00000008h], eax
  loc_004B91E4: mov eax, [esi]
  loc_004B91E6: mov [edx+0000000Ch], ebx
  loc_004B91E9: call [eax+0000030Ch]
  loc_004B91EF: lea ecx, var_14
  loc_004B91F2: push eax
  loc_004B91F3: push ecx
  loc_004B91F4: call [004010A0h] ; __vbaObjSet
  loc_004B91FA: push eax
  loc_004B91FB: call [00401288h] ; __vbaLateIdSt
  loc_004B9201: lea ecx, var_14
  loc_004B9204: call [004012B0h] ; __vbaFreeObj
  loc_004B920A: sub esp, 00000010h
  loc_004B920D: mov ecx, 00000003h
  loc_004B9212: mov edx, esp
  loc_004B9214: xor eax, eax
  loc_004B9216: push 0000000Bh
  loc_004B9218: push esi
  loc_004B9219: mov [edx], ecx
  loc_004B921B: mov [edx+00000004h], edi
  loc_004B921E: mov [edx+00000008h], eax
  loc_004B9221: mov eax, [esi]
  loc_004B9223: mov [edx+0000000Ch], ebx
  loc_004B9226: call [eax+0000030Ch]
  loc_004B922C: lea ecx, var_14
  loc_004B922F: push eax
  loc_004B9230: push ecx
  loc_004B9231: call [004010A0h] ; __vbaObjSet
  loc_004B9237: push eax
  loc_004B9238: call [00401288h] ; __vbaLateIdSt
  loc_004B923E: lea ecx, var_14
  loc_004B9241: call [004012B0h] ; __vbaFreeObj
  loc_004B9247: sub esp, 00000010h
  loc_004B924A: mov ecx, 00000008h
  loc_004B924F: mov edx, esp
  loc_004B9251: mov eax, 0042690Ch ; "No."
  loc_004B9256: push 00000000h
  loc_004B9258: push esi
  loc_004B9259: mov [edx], ecx
  loc_004B925B: mov [edx+00000004h], edi
  loc_004B925E: mov [edx+00000008h], eax
  loc_004B9261: mov eax, [esi]
  loc_004B9263: mov [edx+0000000Ch], ebx
  loc_004B9266: call [eax+0000030Ch]
  loc_004B926C: lea ecx, var_14
  loc_004B926F: push eax
  loc_004B9270: push ecx
  loc_004B9271: call [004010A0h] ; __vbaObjSet
  loc_004B9277: push eax
  loc_004B9278: call [00401288h] ; __vbaLateIdSt
  loc_004B927E: lea ecx, var_14
  loc_004B9281: call [004012B0h] ; __vbaFreeObj
  loc_004B9287: sub esp, 00000010h
  loc_004B928A: mov ecx, 00000003h
  loc_004B928F: mov edx, esp
  loc_004B9291: mov eax, 00000001h
  loc_004B9296: push 0000000Bh
  loc_004B9298: push esi
  loc_004B9299: mov [edx], ecx
  loc_004B929B: mov [edx+00000004h], edi
  loc_004B929E: mov [edx+00000008h], eax
  loc_004B92A1: mov eax, [esi]
  loc_004B92A3: mov [edx+0000000Ch], ebx
  loc_004B92A6: call [eax+0000030Ch]
  loc_004B92AC: lea ecx, var_14
  loc_004B92AF: push eax
  loc_004B92B0: push ecx
  loc_004B92B1: call [004010A0h] ; __vbaObjSet
  loc_004B92B7: push eax
  loc_004B92B8: call [00401288h] ; __vbaLateIdSt
  loc_004B92BE: lea ecx, var_14
  loc_004B92C1: call [004012B0h] ; __vbaFreeObj
  loc_004B92C7: sub esp, 00000010h
  loc_004B92CA: mov ecx, 00000008h
  loc_004B92CF: mov edx, esp
  loc_004B92D1: mov eax, 00426918h ; " CustomerName"
  loc_004B92D6: push 00000000h
  loc_004B92D8: push esi
  loc_004B92D9: mov [edx], ecx
  loc_004B92DB: mov [edx+00000004h], edi
  loc_004B92DE: mov [edx+00000008h], eax
  loc_004B92E1: mov eax, [esi]
  loc_004B92E3: mov [edx+0000000Ch], ebx
  loc_004B92E6: call [eax+0000030Ch]
  loc_004B92EC: lea ecx, var_14
  loc_004B92EF: push eax
  loc_004B92F0: push ecx
  loc_004B92F1: call [004010A0h] ; __vbaObjSet
  loc_004B92F7: push eax
  loc_004B92F8: call [00401288h] ; __vbaLateIdSt
  loc_004B92FE: lea ecx, var_14
  loc_004B9301: call [004012B0h] ; __vbaFreeObj
  loc_004B9307: sub esp, 00000010h
  loc_004B930A: mov ecx, 00000003h
  loc_004B930F: mov edx, esp
  loc_004B9311: xor eax, eax
  loc_004B9313: sub esp, 00000010h
  loc_004B9316: mov var_44, ecx
  loc_004B9319: mov [edx], ecx
  loc_004B931B: mov ecx, esp
  loc_004B931D: push 00000001h
  loc_004B931F: push 00000039h
  loc_004B9321: mov [edx+00000004h], edi
  loc_004B9324: push esi
  loc_004B9325: mov [edx+00000008h], eax
  loc_004B9328: mov eax, var_40
  loc_004B932B: mov [edx+0000000Ch], ebx
  loc_004B932E: mov edx, var_44
  loc_004B9331: mov [ecx], edx
  loc_004B9333: mov edx, var_38
  loc_004B9336: mov [ecx+00000004h], eax
  loc_004B9339: mov eax, 000004B0h
  loc_004B933E: mov [ecx+00000008h], eax
  loc_004B9341: mov eax, [esi]
  loc_004B9343: mov [ecx+0000000Ch], edx
  loc_004B9346: call [eax+0000030Ch]
  loc_004B934C: lea ecx, var_14
  loc_004B934F: push eax
  loc_004B9350: push ecx
  loc_004B9351: call [004010A0h] ; __vbaObjSet
  loc_004B9357: push eax
  loc_004B9358: call [00401160h] ; __vbaLateIdCallSt
  loc_004B935E: add esp, 0000002Ch
  loc_004B9361: lea ecx, var_14
  loc_004B9364: call [004012B0h] ; __vbaFreeObj
  loc_004B936A: sub esp, 00000010h
  loc_004B936D: mov ecx, 00000003h
  loc_004B9372: mov edx, esp
  loc_004B9374: mov eax, 00000001h
  loc_004B9379: sub esp, 00000010h
  loc_004B937C: mov var_44, ecx
  loc_004B937F: mov [edx], ecx
  loc_004B9381: mov ecx, esp
  loc_004B9383: mov [edx+00000004h], edi
  loc_004B9386: mov [edx+00000008h], eax
  loc_004B9389: mov eax, var_40
  loc_004B938C: mov [edx+0000000Ch], ebx
  loc_004B938F: mov edx, var_44
  loc_004B9392: mov [ecx], edx
  loc_004B9394: mov [ecx+00000004h], eax
  loc_004B9397: mov eax, 0000092Eh
  loc_004B939C: mov edx, var_38
  loc_004B939F: mov [ecx+00000008h], eax
  loc_004B93A2: mov eax, [esi]
  loc_004B93A4: push 00000001h
  loc_004B93A6: push 00000039h
  loc_004B93A8: push esi
  loc_004B93A9: mov [ecx+0000000Ch], edx
  loc_004B93AC: call [eax+0000030Ch]
  loc_004B93B2: lea ecx, var_14
  loc_004B93B5: push eax
  loc_004B93B6: push ecx
  loc_004B93B7: call [004010A0h] ; __vbaObjSet
  loc_004B93BD: push eax
  loc_004B93BE: call [00401160h] ; __vbaLateIdCallSt
  loc_004B93C4: add esp, 0000002Ch
  loc_004B93C7: lea ecx, var_14
  loc_004B93CA: call [004012B0h] ; __vbaFreeObj
  loc_004B93D0: push 004B93E2h
  loc_004B93D5: jmp 004B93E1h
  loc_004B93D7: lea ecx, var_14
  loc_004B93DA: call [004012B0h] ; __vbaFreeObj
  loc_004B93E0: ret
  loc_004B93E1: ret
  loc_004B93E2: mov ecx, var_10
  loc_004B93E5: pop edi
  loc_004B93E6: pop esi
  loc_004B93E7: xor eax, eax
  loc_004B93E9: mov fs:[00000000h], ecx
  loc_004B93F0: pop ebx
  loc_004B93F1: mov esp, ebp
  loc_004B93F3: pop ebp
  loc_004B93F4: retn 0004h
End Sub

Private Sub Proc_11_8_4B9680() '4B9680
  loc_004B9680: push ebp
  loc_004B9681: mov ebp, esp
  loc_004B9683: sub esp, 00000008h
  loc_004B9686: push 00403B36h ; __vbaExceptHandler
  loc_004B968B: mov eax, fs:[00000000h]
  loc_004B9691: push eax
  loc_004B9692: mov fs:[00000000h], esp
  loc_004B9699: sub esp, 000000B4h
  loc_004B969F: push ebx
  loc_004B96A0: push esi
  loc_004B96A1: push edi
  loc_004B96A2: mov var_8, esp
  loc_004B96A5: mov var_4, 00401E60h
  loc_004B96AC: xor eax, eax
  loc_004B96AE: lea ecx, var_30
  loc_004B96B1: mov var_14, eax
  loc_004B96B4: mov var_18, eax
  loc_004B96B7: mov var_1C, eax
  loc_004B96BA: mov var_20, eax
  loc_004B96BD: mov var_30, eax
  loc_004B96C0: mov var_40, eax
  loc_004B96C3: mov var_50, eax
  loc_004B96C6: mov var_70, eax
  loc_004B96C9: mov var_80, eax
  loc_004B96CC: mov var_84, eax
  loc_004B96D2: mov var_A8, eax
  loc_004B96D8: lea eax, var_60
  loc_004B96DB: push eax
  loc_004B96DC: push ecx
  loc_004B96DD: mov var_58, 0061A0A0h
  loc_004B96E4: mov var_60, 00004008h
  loc_004B96EB: call [004010D4h] ; rtcTrimVar
  loc_004B96F1: lea edx, var_30
  loc_004B96F4: lea ecx, var_A8
  loc_004B96FA: call [00401014h] ; __vbaVarMove
  loc_004B9700: mov esi, [00401110h] ; __vbaVarTstEq
  loc_004B9706: lea edx, var_A8
  loc_004B970C: lea eax, var_60
  loc_004B970F: mov edi, 00008008h
  loc_004B9714: push edx
  loc_004B9715: push eax
  loc_004B9716: mov var_58, 00426938h ; "AdvSearch"
  loc_004B971D: mov var_60, edi
  loc_004B9720: call __vbaVarTstEq
  loc_004B9722: test ax, ax
  loc_004B9725: jz 004B9C2Ah
  loc_004B972B: lea ebx, var_18
  loc_004B972E: mov ecx, 0000000Ah
  loc_004B9733: push ebx
  loc_004B9734: mov esi, ecx
  loc_004B9736: sub esp, 00000010h
  loc_004B9739: mov eax, 80020004h
  loc_004B973E: mov ebx, esp
  loc_004B9740: sub esp, 00000010h
  loc_004B9743: mov edx, eax
  loc_004B9745: mov var_60, 00000003h
  loc_004B974C: mov [ebx], ecx
  loc_004B974E: mov ecx, var_7C
  loc_004B9751: mov edi, [0061A13Ch]
  loc_004B9757: mov var_58, 00000004h
  loc_004B975E: mov [ebx+00000004h], ecx
  loc_004B9761: mov ecx, esp
  loc_004B9763: sub esp, 00000010h
  loc_004B9766: mov edi, [edi]
  loc_004B9768: mov [ebx+00000008h], eax
  loc_004B976B: mov eax, var_74
  loc_004B976E: mov [ebx+0000000Ch], eax
  loc_004B9771: mov eax, var_6C
  loc_004B9774: mov [ecx], esi
  loc_004B9776: mov [ecx+00000004h], eax
  loc_004B9779: mov eax, esp
  loc_004B977B: push 00426950h ; "Select Distinct CustomerName from Comm_Rate order by CustomerName"
  loc_004B9780: mov [ecx+00000008h], edx
  loc_004B9783: mov edx, var_64
  loc_004B9786: mov [ecx+0000000Ch], edx
  loc_004B9789: mov ecx, var_60
  loc_004B978C: mov edx, var_5C
  loc_004B978F: mov [eax], ecx
  loc_004B9791: mov ecx, var_58
  loc_004B9794: mov [eax+00000004h], edx
  loc_004B9797: mov edx, var_54
  loc_004B979A: mov [eax+00000008h], ecx
  loc_004B979D: mov [eax+0000000Ch], edx
  loc_004B97A0: mov eax, [0061A13Ch]
  loc_004B97A5: push eax
  loc_004B97A6: call [edi+000000BCh]
  loc_004B97AC: test eax, eax
  loc_004B97AE: fnclex
  loc_004B97B0: jge 004B97CAh
  loc_004B97B2: mov ecx, [0061A13Ch]
  loc_004B97B8: push 000000BCh
  loc_004B97BD: push 0041E928h
  loc_004B97C2: push ecx
  loc_004B97C3: push eax
  loc_004B97C4: call [00401074h] ; __vbaHresultCheckObj
  loc_004B97CA: mov esi, Me
  loc_004B97CD: mov edx, var_18
  loc_004B97D0: push edx
  loc_004B97D1: lea eax, [esi+00000034h]
  loc_004B97D4: push eax
  loc_004B97D5: mov var_C4, eax
  loc_004B97DB: call [004010B8h] ; __vbaObjSetAddref
  loc_004B97E1: lea ecx, var_18
  loc_004B97E4: call [004012B0h] ; __vbaFreeObj
  loc_004B97EA: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004B97F0: mov edi, [004010A0h] ; __vbaObjSet
  loc_004B97F6: mov eax, var_C4
  loc_004B97FC: lea edx, var_84
  loc_004B9802: push edx
  loc_004B9803: mov eax, [eax]
  loc_004B9805: push eax
  loc_004B9806: mov ecx, [eax]
  loc_004B9808: call [ecx+00000034h]
  loc_004B980B: test eax, eax
  loc_004B980D: fnclex
  loc_004B980F: jge 004B9828h
  loc_004B9811: mov ecx, var_C4
  loc_004B9817: push 00000034h
  loc_004B9819: push 0041E938h
  loc_004B981E: mov edx, [ecx]
  loc_004B9820: push edx
  loc_004B9821: push eax
  loc_004B9822: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9828: cmp var_84, 0000h
  loc_004B9830: jnz 004BAB93h
  loc_004B9836: mov eax, [esi+0000003Ch]
  loc_004B9839: push eax
  loc_004B983A: call [004011D8h] ; __vbaR8Str
  loc_004B9840: fadd st0, real8 ptr [004015F8h]
  loc_004B9846: fnstsw ax
  loc_004B9848: test al, 0Dh
  loc_004B984A: jnz 004BB227h
  loc_004B9850: call [0040125Ch] ; __vbaFpI4
  loc_004B9856: sub esp, 00000010h
  loc_004B9859: mov ecx, 00000003h
  loc_004B985E: mov edx, esp
  loc_004B9860: mov var_60, ecx
  loc_004B9863: mov var_58, eax
  loc_004B9866: push 0000000Ah
  loc_004B9868: mov [edx], ecx
  loc_004B986A: mov ecx, var_5C
  loc_004B986D: push esi
  loc_004B986E: mov [edx+00000004h], ecx
  loc_004B9871: mov ecx, [esi]
  loc_004B9873: mov [edx+00000008h], eax
  loc_004B9876: mov eax, var_54
  loc_004B9879: mov [edx+0000000Ch], eax
  loc_004B987C: call [ecx+0000030Ch]
  loc_004B9882: lea edx, var_18
  loc_004B9885: push eax
  loc_004B9886: push edx
  loc_004B9887: call edi
  loc_004B9889: push eax
  loc_004B988A: call ebx
  loc_004B988C: lea ecx, var_18
  loc_004B988F: call [004012B0h] ; __vbaFreeObj
  loc_004B9895: sub esp, 00000010h
  loc_004B9898: mov ecx, 00000003h
  loc_004B989D: mov edx, esp
  loc_004B989F: mov var_60, ecx
  loc_004B98A2: xor eax, eax
  loc_004B98A4: push 0000000Bh
  loc_004B98A6: mov [edx], ecx
  loc_004B98A8: mov ecx, var_5C
  loc_004B98AB: mov var_58, eax
  loc_004B98AE: push esi
  loc_004B98AF: mov [edx+00000004h], ecx
  loc_004B98B2: mov ecx, [esi]
  loc_004B98B4: mov [edx+00000008h], eax
  loc_004B98B7: mov eax, var_54
  loc_004B98BA: mov [edx+0000000Ch], eax
  loc_004B98BD: call [ecx+0000030Ch]
  loc_004B98C3: lea edx, var_18
  loc_004B98C6: push eax
  loc_004B98C7: push edx
  loc_004B98C8: call edi
  loc_004B98CA: push eax
  loc_004B98CB: call ebx
  loc_004B98CD: lea ecx, var_18
  loc_004B98D0: call [004012B0h] ; __vbaFreeObj
  loc_004B98D6: sub esp, 00000010h
  loc_004B98D9: mov ecx, 00000002h
  loc_004B98DE: mov edx, esp
  loc_004B98E0: mov var_60, ecx
  loc_004B98E3: mov eax, 00000001h
  loc_004B98E8: push 00000028h
  loc_004B98EA: mov [edx], ecx
  loc_004B98EC: mov ecx, var_5C
  loc_004B98EF: mov var_58, eax
  loc_004B98F2: push esi
  loc_004B98F3: mov [edx+00000004h], ecx
  loc_004B98F6: mov ecx, [esi]
  loc_004B98F8: mov [edx+00000008h], eax
  loc_004B98FB: mov eax, var_54
  loc_004B98FE: mov [edx+0000000Ch], eax
  loc_004B9901: call [ecx+0000030Ch]
  loc_004B9907: lea edx, var_18
  loc_004B990A: push eax
  loc_004B990B: push edx
  loc_004B990C: call edi
  loc_004B990E: push eax
  loc_004B990F: call ebx
  loc_004B9911: lea ecx, var_18
  loc_004B9914: call [004012B0h] ; __vbaFreeObj
  loc_004B991A: mov eax, [esi+0000003Ch]
  loc_004B991D: push eax
  loc_004B991E: call [004011D8h] ; __vbaR8Str
  loc_004B9924: fadd st0, real8 ptr [004015F8h]
  loc_004B992A: sub esp, 00000008h
  loc_004B992D: fnstsw ax
  loc_004B992F: test al, 0Dh
  loc_004B9931: jnz 004BB227h
  loc_004B9937: fstp real8 ptr [esp]
  loc_004B993A: call [00401144h] ; __vbaStrR8
  loc_004B9940: sub esp, 00000010h
  loc_004B9943: mov ecx, 00000008h
  loc_004B9948: mov edx, esp
  loc_004B994A: mov var_30, ecx
  loc_004B994D: mov var_28, eax
  loc_004B9950: push 00000000h
  loc_004B9952: mov [edx], ecx
  loc_004B9954: mov ecx, var_2C
  loc_004B9957: push esi
  loc_004B9958: mov [edx+00000004h], ecx
  loc_004B995B: mov ecx, [esi]
  loc_004B995D: mov [edx+00000008h], eax
  loc_004B9960: mov eax, var_24
  loc_004B9963: mov [edx+0000000Ch], eax
  loc_004B9966: call [ecx+0000030Ch]
  loc_004B996C: lea edx, var_18
  loc_004B996F: push eax
  loc_004B9970: push edx
  loc_004B9971: call edi
  loc_004B9973: push eax
  loc_004B9974: call ebx
  loc_004B9976: lea ecx, var_18
  loc_004B9979: call [004012B0h] ; __vbaFreeObj
  loc_004B997F: lea ecx, var_30
  loc_004B9982: call [00401020h] ; __vbaFreeVar
  loc_004B9988: sub esp, 00000010h
  loc_004B998B: mov ecx, 00000003h
  loc_004B9990: mov edx, esp
  loc_004B9992: mov var_60, ecx
  loc_004B9995: mov eax, 00000001h
  loc_004B999A: push 0000000Bh
  loc_004B999C: mov [edx], ecx
  loc_004B999E: mov ecx, var_5C
  loc_004B99A1: mov var_58, eax
  loc_004B99A4: push esi
  loc_004B99A5: mov [edx+00000004h], ecx
  loc_004B99A8: mov ecx, [esi]
  loc_004B99AA: mov [edx+00000008h], eax
  loc_004B99AD: mov eax, var_54
  loc_004B99B0: mov [edx+0000000Ch], eax
  loc_004B99B3: call [ecx+0000030Ch]
  loc_004B99B9: lea edx, var_18
  loc_004B99BC: push eax
  loc_004B99BD: push edx
  loc_004B99BE: call edi
  loc_004B99C0: push eax
  loc_004B99C1: call ebx
  loc_004B99C3: lea ecx, var_18
  loc_004B99C6: call [004012B0h] ; __vbaFreeObj
  loc_004B99CC: sub esp, 00000010h
  loc_004B99CF: mov ecx, 00000002h
  loc_004B99D4: mov edx, esp
  loc_004B99D6: mov var_60, ecx
  loc_004B99D9: mov eax, 00000001h
  loc_004B99DE: push 00000028h
  loc_004B99E0: mov [edx], ecx
  loc_004B99E2: mov ecx, var_5C
  loc_004B99E5: mov var_58, eax
  loc_004B99E8: push esi
  loc_004B99E9: mov [edx+00000004h], ecx
  loc_004B99EC: mov ecx, [esi]
  loc_004B99EE: mov [edx+00000008h], eax
  loc_004B99F1: mov eax, var_54
  loc_004B99F4: mov [edx+0000000Ch], eax
  loc_004B99F7: call [ecx+0000030Ch]
  loc_004B99FD: lea edx, var_18
  loc_004B9A00: push eax
  loc_004B9A01: push edx
  loc_004B9A02: call edi
  loc_004B9A04: push eax
  loc_004B9A05: call ebx
  loc_004B9A07: lea ecx, var_18
  loc_004B9A0A: call [004012B0h] ; __vbaFreeObj
  loc_004B9A10: mov eax, var_C4
  loc_004B9A16: mov eax, [eax]
  loc_004B9A18: mov ecx, [eax]
  loc_004B9A1A: lea edx, var_18
  loc_004B9A1D: push edx
  loc_004B9A1E: push eax
  loc_004B9A1F: call [ecx+000000B4h]
  loc_004B9A25: test eax, eax
  loc_004B9A27: fnclex
  loc_004B9A29: jge 004B9A45h
  loc_004B9A2B: mov ecx, var_C4
  loc_004B9A31: push 000000B4h
  loc_004B9A36: push 0041E938h
  loc_004B9A3B: mov edx, [ecx]
  loc_004B9A3D: push edx
  loc_004B9A3E: push eax
  loc_004B9A3F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9A45: lea edx, var_1C
  loc_004B9A48: mov eax, 00000008h
  loc_004B9A4D: push edx
  loc_004B9A4E: mov ecx, var_18
  loc_004B9A51: sub esp, 00000010h
  loc_004B9A54: mov var_60, eax
  loc_004B9A57: mov edx, esp
  loc_004B9A59: mov var_58, 004269D8h ; "CustomerName"
  loc_004B9A60: mov var_8C, ecx
  loc_004B9A66: mov ecx, [ecx]
  loc_004B9A68: mov [edx], eax
  loc_004B9A6A: mov eax, var_5C
  loc_004B9A6D: mov [edx+00000004h], eax
  loc_004B9A70: mov eax, var_58
  loc_004B9A73: mov [edx+00000008h], eax
  loc_004B9A76: mov eax, var_54
  loc_004B9A79: mov [edx+0000000Ch], eax
  loc_004B9A7C: mov edx, var_18
  loc_004B9A7F: push edx
  loc_004B9A80: call [ecx+00000030h]
  loc_004B9A83: test eax, eax
  loc_004B9A85: fnclex
  loc_004B9A87: jge 004B9A9Eh
  loc_004B9A89: mov ecx, var_8C
  loc_004B9A8F: push 00000030h
  loc_004B9A91: push 0041EA14h ; "S"
  loc_004B9A96: push ecx
  loc_004B9A97: push eax
  loc_004B9A98: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9A9E: mov eax, var_1C
  loc_004B9AA1: lea edx, var_30
  loc_004B9AA4: mov var_28, eax
  loc_004B9AA7: lea eax, var_40
  loc_004B9AAA: push edx
  loc_004B9AAB: push eax
  loc_004B9AAC: mov var_1C, 00000000h
  loc_004B9AB3: mov var_30, 00000009h
  loc_004B9ABA: call [004010D4h] ; rtcTrimVar
  loc_004B9AC0: lea ecx, var_40
  loc_004B9AC3: push ecx
  loc_004B9AC4: call [00401028h] ; __vbaStrVarMove
  loc_004B9ACA: sub esp, 00000010h
  loc_004B9ACD: mov ecx, 00000008h
  loc_004B9AD2: mov edx, esp
  loc_004B9AD4: mov var_50, ecx
  loc_004B9AD7: mov var_48, eax
  loc_004B9ADA: push 00000000h
  loc_004B9ADC: mov [edx], ecx
  loc_004B9ADE: mov ecx, var_4C
  loc_004B9AE1: push esi
  loc_004B9AE2: mov [edx+00000004h], ecx
  loc_004B9AE5: mov ecx, [esi]
  loc_004B9AE7: mov [edx+00000008h], eax
  loc_004B9AEA: mov eax, var_44
  loc_004B9AED: mov [edx+0000000Ch], eax
  loc_004B9AF0: call [ecx+0000030Ch]
  loc_004B9AF6: lea edx, var_20
  loc_004B9AF9: push eax
  loc_004B9AFA: push edx
  loc_004B9AFB: call edi
  loc_004B9AFD: push eax
  loc_004B9AFE: call ebx
  loc_004B9B00: lea eax, var_20
  loc_004B9B03: lea ecx, var_18
  loc_004B9B06: push eax
  loc_004B9B07: push ecx
  loc_004B9B08: push 00000002h
  loc_004B9B0A: call [00401040h] ; __vbaFreeObjList
  loc_004B9B10: lea edx, var_50
  loc_004B9B13: lea eax, var_40
  loc_004B9B16: push edx
  loc_004B9B17: lea ecx, var_30
  loc_004B9B1A: push eax
  loc_004B9B1B: push ecx
  loc_004B9B1C: push 00000003h
  loc_004B9B1E: call [00401038h] ; __vbaFreeVarList
  loc_004B9B24: mov edx, [esi+0000003Ch]
  loc_004B9B27: add esp, 0000001Ch
  loc_004B9B2A: push edx
  loc_004B9B2B: call [004011D8h] ; __vbaR8Str
  loc_004B9B31: fadd st0, real8 ptr [004015F8h]
  loc_004B9B37: sub esp, 00000008h
  loc_004B9B3A: fnstsw ax
  loc_004B9B3C: test al, 0Dh
  loc_004B9B3E: jnz 004BB227h
  loc_004B9B44: fstp real8 ptr [esp]
  loc_004B9B47: call [00401144h] ; __vbaStrR8
  loc_004B9B4D: mov edx, eax
  loc_004B9B4F: lea ecx, var_14
  loc_004B9B52: call [00401270h] ; __vbaStrMove
  loc_004B9B58: mov edx, eax
  loc_004B9B5A: lea ecx, [esi+0000003Ch]
  loc_004B9B5D: call [004011ECh] ; __vbaStrCopy
  loc_004B9B63: lea ecx, var_14
  loc_004B9B66: call [004012ACh] ; __vbaFreeStr
  loc_004B9B6C: mov eax, [esi]
  loc_004B9B6E: push 00000000h
  loc_004B9B70: push 00000004h
  loc_004B9B72: push esi
  loc_004B9B73: call [eax+0000030Ch]
  loc_004B9B79: lea ecx, var_18
  loc_004B9B7C: push eax
  loc_004B9B7D: push ecx
  loc_004B9B7E: call edi
  loc_004B9B80: lea edx, var_30
  loc_004B9B83: push eax
  loc_004B9B84: push edx
  loc_004B9B85: call [00401140h] ; __vbaLateIdCallLd
  loc_004B9B8B: add esp, 00000010h
  loc_004B9B8E: push eax
  loc_004B9B8F: call [0040121Ch] ; __vbaI4Var
  loc_004B9B95: add eax, 00000001h
  loc_004B9B98: mov ecx, 00000003h
  loc_004B9B9D: jo 004BB22Ch
  loc_004B9BA3: sub esp, 00000010h
  loc_004B9BA6: mov var_60, ecx
  loc_004B9BA9: mov edx, esp
  loc_004B9BAB: mov var_58, eax
  loc_004B9BAE: push 00000004h
  loc_004B9BB0: push esi
  loc_004B9BB1: mov [edx], ecx
  loc_004B9BB3: mov ecx, var_5C
  loc_004B9BB6: mov [edx+00000004h], ecx
  loc_004B9BB9: mov ecx, [esi]
  loc_004B9BBB: mov [edx+00000008h], eax
  loc_004B9BBE: mov eax, var_54
  loc_004B9BC1: mov [edx+0000000Ch], eax
  loc_004B9BC4: call [ecx+0000030Ch]
  loc_004B9BCA: lea edx, var_1C
  loc_004B9BCD: push eax
  loc_004B9BCE: push edx
  loc_004B9BCF: call edi
  loc_004B9BD1: push eax
  loc_004B9BD2: call ebx
  loc_004B9BD4: lea eax, var_1C
  loc_004B9BD7: lea ecx, var_18
  loc_004B9BDA: push eax
  loc_004B9BDB: push ecx
  loc_004B9BDC: push 00000002h
  loc_004B9BDE: call [00401040h] ; __vbaFreeObjList
  loc_004B9BE4: add esp, 0000000Ch
  loc_004B9BE7: lea ecx, var_30
  loc_004B9BEA: call [00401020h] ; __vbaFreeVar
  loc_004B9BF0: mov edx, var_C4
  loc_004B9BF6: mov eax, [edx]
  loc_004B9BF8: push eax
  loc_004B9BF9: mov ecx, [eax]
  loc_004B9BFB: call [ecx+000000ECh]
  loc_004B9C01: test eax, eax
  loc_004B9C03: fnclex
  loc_004B9C05: jge 004B97F6h
  loc_004B9C0B: mov edx, var_C4
  loc_004B9C11: push 000000ECh
  loc_004B9C16: push 0041E938h
  loc_004B9C1B: mov ecx, [edx]
  loc_004B9C1D: push ecx
  loc_004B9C1E: push eax
  loc_004B9C1F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9C25: jmp 004B97F6h
  loc_004B9C2A: lea eax, var_A8
  loc_004B9C30: lea ecx, var_60
  loc_004B9C33: push eax
  loc_004B9C34: push ecx
  loc_004B9C35: mov var_58, 004269F8h ; "SrAgent"
  loc_004B9C3C: mov var_60, edi
  loc_004B9C3F: call __vbaVarTstEq
  loc_004B9C41: test ax, ax
  loc_004B9C44: jz 004BA149h
  loc_004B9C4A: lea ebx, var_18
  loc_004B9C4D: mov ecx, 0000000Ah
  loc_004B9C52: push ebx
  loc_004B9C53: mov esi, ecx
  loc_004B9C55: sub esp, 00000010h
  loc_004B9C58: mov eax, 80020004h
  loc_004B9C5D: mov ebx, esp
  loc_004B9C5F: sub esp, 00000010h
  loc_004B9C62: mov edx, eax
  loc_004B9C64: mov var_60, 00000003h
  loc_004B9C6B: mov [ebx], ecx
  loc_004B9C6D: mov ecx, var_7C
  loc_004B9C70: mov edi, [0061A13Ch]
  loc_004B9C76: mov var_58, 00000004h
  loc_004B9C7D: mov [ebx+00000004h], ecx
  loc_004B9C80: mov ecx, esp
  loc_004B9C82: sub esp, 00000010h
  loc_004B9C85: mov edi, [edi]
  loc_004B9C87: mov [ebx+00000008h], eax
  loc_004B9C8A: mov eax, var_74
  loc_004B9C8D: mov [ebx+0000000Ch], eax
  loc_004B9C90: mov eax, var_6C
  loc_004B9C93: mov [ecx], esi
  loc_004B9C95: mov [ecx+00000004h], eax
  loc_004B9C98: mov eax, esp
  loc_004B9C9A: push 00426A0Ch ; "Select Distinct AgentName from LG order by AgentName"
  loc_004B9C9F: mov [ecx+00000008h], edx
  loc_004B9CA2: mov edx, var_64
  loc_004B9CA5: mov [ecx+0000000Ch], edx
  loc_004B9CA8: mov ecx, var_60
  loc_004B9CAB: mov edx, var_5C
  loc_004B9CAE: mov [eax], ecx
  loc_004B9CB0: mov ecx, var_58
  loc_004B9CB3: mov [eax+00000004h], edx
  loc_004B9CB6: mov edx, var_54
  loc_004B9CB9: mov [eax+00000008h], ecx
  loc_004B9CBC: mov [eax+0000000Ch], edx
  loc_004B9CBF: mov eax, [0061A13Ch]
  loc_004B9CC4: push eax
  loc_004B9CC5: call [edi+000000BCh]
  loc_004B9CCB: test eax, eax
  loc_004B9CCD: fnclex
  loc_004B9CCF: jge 004B9CE9h
  loc_004B9CD1: mov ecx, [0061A13Ch]
  loc_004B9CD7: push 000000BCh
  loc_004B9CDC: push 0041E928h
  loc_004B9CE1: push ecx
  loc_004B9CE2: push eax
  loc_004B9CE3: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9CE9: mov esi, Me
  loc_004B9CEC: mov edx, var_18
  loc_004B9CEF: push edx
  loc_004B9CF0: lea eax, [esi+00000034h]
  loc_004B9CF3: push eax
  loc_004B9CF4: mov var_C4, eax
  loc_004B9CFA: call [004010B8h] ; __vbaObjSetAddref
  loc_004B9D00: lea ecx, var_18
  loc_004B9D03: call [004012B0h] ; __vbaFreeObj
  loc_004B9D09: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004B9D0F: mov edi, [004010A0h] ; __vbaObjSet
  loc_004B9D15: mov eax, var_C4
  loc_004B9D1B: lea edx, var_84
  loc_004B9D21: push edx
  loc_004B9D22: mov eax, [eax]
  loc_004B9D24: push eax
  loc_004B9D25: mov ecx, [eax]
  loc_004B9D27: call [ecx+00000034h]
  loc_004B9D2A: test eax, eax
  loc_004B9D2C: fnclex
  loc_004B9D2E: jge 004B9D47h
  loc_004B9D30: mov ecx, var_C4
  loc_004B9D36: push 00000034h
  loc_004B9D38: push 0041E938h
  loc_004B9D3D: mov edx, [ecx]
  loc_004B9D3F: push edx
  loc_004B9D40: push eax
  loc_004B9D41: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9D47: cmp var_84, 0000h
  loc_004B9D4F: jnz 004BAB93h
  loc_004B9D55: mov eax, [esi+0000003Ch]
  loc_004B9D58: push eax
  loc_004B9D59: call [004011D8h] ; __vbaR8Str
  loc_004B9D5F: fadd st0, real8 ptr [004015F8h]
  loc_004B9D65: fnstsw ax
  loc_004B9D67: test al, 0Dh
  loc_004B9D69: jnz 004BB227h
  loc_004B9D6F: call [0040125Ch] ; __vbaFpI4
  loc_004B9D75: sub esp, 00000010h
  loc_004B9D78: mov ecx, 00000003h
  loc_004B9D7D: mov edx, esp
  loc_004B9D7F: mov var_60, ecx
  loc_004B9D82: mov var_58, eax
  loc_004B9D85: push 0000000Ah
  loc_004B9D87: mov [edx], ecx
  loc_004B9D89: mov ecx, var_5C
  loc_004B9D8C: push esi
  loc_004B9D8D: mov [edx+00000004h], ecx
  loc_004B9D90: mov ecx, [esi]
  loc_004B9D92: mov [edx+00000008h], eax
  loc_004B9D95: mov eax, var_54
  loc_004B9D98: mov [edx+0000000Ch], eax
  loc_004B9D9B: call [ecx+0000030Ch]
  loc_004B9DA1: lea edx, var_18
  loc_004B9DA4: push eax
  loc_004B9DA5: push edx
  loc_004B9DA6: call edi
  loc_004B9DA8: push eax
  loc_004B9DA9: call ebx
  loc_004B9DAB: lea ecx, var_18
  loc_004B9DAE: call [004012B0h] ; __vbaFreeObj
  loc_004B9DB4: sub esp, 00000010h
  loc_004B9DB7: mov ecx, 00000003h
  loc_004B9DBC: mov edx, esp
  loc_004B9DBE: mov var_60, ecx
  loc_004B9DC1: xor eax, eax
  loc_004B9DC3: push 0000000Bh
  loc_004B9DC5: mov [edx], ecx
  loc_004B9DC7: mov ecx, var_5C
  loc_004B9DCA: mov var_58, eax
  loc_004B9DCD: push esi
  loc_004B9DCE: mov [edx+00000004h], ecx
  loc_004B9DD1: mov ecx, [esi]
  loc_004B9DD3: mov [edx+00000008h], eax
  loc_004B9DD6: mov eax, var_54
  loc_004B9DD9: mov [edx+0000000Ch], eax
  loc_004B9DDC: call [ecx+0000030Ch]
  loc_004B9DE2: lea edx, var_18
  loc_004B9DE5: push eax
  loc_004B9DE6: push edx
  loc_004B9DE7: call edi
  loc_004B9DE9: push eax
  loc_004B9DEA: call ebx
  loc_004B9DEC: lea ecx, var_18
  loc_004B9DEF: call [004012B0h] ; __vbaFreeObj
  loc_004B9DF5: sub esp, 00000010h
  loc_004B9DF8: mov ecx, 00000002h
  loc_004B9DFD: mov edx, esp
  loc_004B9DFF: mov var_60, ecx
  loc_004B9E02: mov eax, 00000001h
  loc_004B9E07: push 00000028h
  loc_004B9E09: mov [edx], ecx
  loc_004B9E0B: mov ecx, var_5C
  loc_004B9E0E: mov var_58, eax
  loc_004B9E11: push esi
  loc_004B9E12: mov [edx+00000004h], ecx
  loc_004B9E15: mov ecx, [esi]
  loc_004B9E17: mov [edx+00000008h], eax
  loc_004B9E1A: mov eax, var_54
  loc_004B9E1D: mov [edx+0000000Ch], eax
  loc_004B9E20: call [ecx+0000030Ch]
  loc_004B9E26: lea edx, var_18
  loc_004B9E29: push eax
  loc_004B9E2A: push edx
  loc_004B9E2B: call edi
  loc_004B9E2D: push eax
  loc_004B9E2E: call ebx
  loc_004B9E30: lea ecx, var_18
  loc_004B9E33: call [004012B0h] ; __vbaFreeObj
  loc_004B9E39: mov eax, [esi+0000003Ch]
  loc_004B9E3C: push eax
  loc_004B9E3D: call [004011D8h] ; __vbaR8Str
  loc_004B9E43: fadd st0, real8 ptr [004015F8h]
  loc_004B9E49: sub esp, 00000008h
  loc_004B9E4C: fnstsw ax
  loc_004B9E4E: test al, 0Dh
  loc_004B9E50: jnz 004BB227h
  loc_004B9E56: fstp real8 ptr [esp]
  loc_004B9E59: call [00401144h] ; __vbaStrR8
  loc_004B9E5F: sub esp, 00000010h
  loc_004B9E62: mov ecx, 00000008h
  loc_004B9E67: mov edx, esp
  loc_004B9E69: mov var_30, ecx
  loc_004B9E6C: mov var_28, eax
  loc_004B9E6F: push 00000000h
  loc_004B9E71: mov [edx], ecx
  loc_004B9E73: mov ecx, var_2C
  loc_004B9E76: push esi
  loc_004B9E77: mov [edx+00000004h], ecx
  loc_004B9E7A: mov ecx, [esi]
  loc_004B9E7C: mov [edx+00000008h], eax
  loc_004B9E7F: mov eax, var_24
  loc_004B9E82: mov [edx+0000000Ch], eax
  loc_004B9E85: call [ecx+0000030Ch]
  loc_004B9E8B: lea edx, var_18
  loc_004B9E8E: push eax
  loc_004B9E8F: push edx
  loc_004B9E90: call edi
  loc_004B9E92: push eax
  loc_004B9E93: call ebx
  loc_004B9E95: lea ecx, var_18
  loc_004B9E98: call [004012B0h] ; __vbaFreeObj
  loc_004B9E9E: lea ecx, var_30
  loc_004B9EA1: call [00401020h] ; __vbaFreeVar
  loc_004B9EA7: sub esp, 00000010h
  loc_004B9EAA: mov ecx, 00000003h
  loc_004B9EAF: mov edx, esp
  loc_004B9EB1: mov var_60, ecx
  loc_004B9EB4: mov eax, 00000001h
  loc_004B9EB9: push 0000000Bh
  loc_004B9EBB: mov [edx], ecx
  loc_004B9EBD: mov ecx, var_5C
  loc_004B9EC0: mov var_58, eax
  loc_004B9EC3: push esi
  loc_004B9EC4: mov [edx+00000004h], ecx
  loc_004B9EC7: mov ecx, [esi]
  loc_004B9EC9: mov [edx+00000008h], eax
  loc_004B9ECC: mov eax, var_54
  loc_004B9ECF: mov [edx+0000000Ch], eax
  loc_004B9ED2: call [ecx+0000030Ch]
  loc_004B9ED8: lea edx, var_18
  loc_004B9EDB: push eax
  loc_004B9EDC: push edx
  loc_004B9EDD: call edi
  loc_004B9EDF: push eax
  loc_004B9EE0: call ebx
  loc_004B9EE2: lea ecx, var_18
  loc_004B9EE5: call [004012B0h] ; __vbaFreeObj
  loc_004B9EEB: sub esp, 00000010h
  loc_004B9EEE: mov ecx, 00000002h
  loc_004B9EF3: mov edx, esp
  loc_004B9EF5: mov var_60, ecx
  loc_004B9EF8: mov eax, 00000001h
  loc_004B9EFD: push 00000028h
  loc_004B9EFF: mov [edx], ecx
  loc_004B9F01: mov ecx, var_5C
  loc_004B9F04: mov var_58, eax
  loc_004B9F07: push esi
  loc_004B9F08: mov [edx+00000004h], ecx
  loc_004B9F0B: mov ecx, [esi]
  loc_004B9F0D: mov [edx+00000008h], eax
  loc_004B9F10: mov eax, var_54
  loc_004B9F13: mov [edx+0000000Ch], eax
  loc_004B9F16: call [ecx+0000030Ch]
  loc_004B9F1C: lea edx, var_18
  loc_004B9F1F: push eax
  loc_004B9F20: push edx
  loc_004B9F21: call edi
  loc_004B9F23: push eax
  loc_004B9F24: call ebx
  loc_004B9F26: lea ecx, var_18
  loc_004B9F29: call [004012B0h] ; __vbaFreeObj
  loc_004B9F2F: mov eax, var_C4
  loc_004B9F35: mov eax, [eax]
  loc_004B9F37: mov ecx, [eax]
  loc_004B9F39: lea edx, var_18
  loc_004B9F3C: push edx
  loc_004B9F3D: push eax
  loc_004B9F3E: call [ecx+000000B4h]
  loc_004B9F44: test eax, eax
  loc_004B9F46: fnclex
  loc_004B9F48: jge 004B9F64h
  loc_004B9F4A: mov ecx, var_C4
  loc_004B9F50: push 000000B4h
  loc_004B9F55: push 0041E938h
  loc_004B9F5A: mov edx, [ecx]
  loc_004B9F5C: push edx
  loc_004B9F5D: push eax
  loc_004B9F5E: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9F64: lea edx, var_1C
  loc_004B9F67: mov eax, 00000008h
  loc_004B9F6C: push edx
  loc_004B9F6D: mov ecx, var_18
  loc_004B9F70: sub esp, 00000010h
  loc_004B9F73: mov var_60, eax
  loc_004B9F76: mov edx, esp
  loc_004B9F78: mov var_58, 0041EB18h ; "AgentName"
  loc_004B9F7F: mov var_8C, ecx
  loc_004B9F85: mov ecx, [ecx]
  loc_004B9F87: mov [edx], eax
  loc_004B9F89: mov eax, var_5C
  loc_004B9F8C: mov [edx+00000004h], eax
  loc_004B9F8F: mov eax, var_58
  loc_004B9F92: mov [edx+00000008h], eax
  loc_004B9F95: mov eax, var_54
  loc_004B9F98: mov [edx+0000000Ch], eax
  loc_004B9F9B: mov edx, var_18
  loc_004B9F9E: push edx
  loc_004B9F9F: call [ecx+00000030h]
  loc_004B9FA2: test eax, eax
  loc_004B9FA4: fnclex
  loc_004B9FA6: jge 004B9FBDh
  loc_004B9FA8: mov ecx, var_8C
  loc_004B9FAE: push 00000030h
  loc_004B9FB0: push 0041EA14h ; "S"
  loc_004B9FB5: push ecx
  loc_004B9FB6: push eax
  loc_004B9FB7: call [00401074h] ; __vbaHresultCheckObj
  loc_004B9FBD: mov eax, var_1C
  loc_004B9FC0: lea edx, var_30
  loc_004B9FC3: mov var_28, eax
  loc_004B9FC6: lea eax, var_40
  loc_004B9FC9: push edx
  loc_004B9FCA: push eax
  loc_004B9FCB: mov var_1C, 00000000h
  loc_004B9FD2: mov var_30, 00000009h
  loc_004B9FD9: call [004010D4h] ; rtcTrimVar
  loc_004B9FDF: lea ecx, var_40
  loc_004B9FE2: push ecx
  loc_004B9FE3: call [00401028h] ; __vbaStrVarMove
  loc_004B9FE9: sub esp, 00000010h
  loc_004B9FEC: mov ecx, 00000008h
  loc_004B9FF1: mov edx, esp
  loc_004B9FF3: mov var_50, ecx
  loc_004B9FF6: mov var_48, eax
  loc_004B9FF9: push 00000000h
  loc_004B9FFB: mov [edx], ecx
  loc_004B9FFD: mov ecx, var_4C
  loc_004BA000: push esi
  loc_004BA001: mov [edx+00000004h], ecx
  loc_004BA004: mov ecx, [esi]
  loc_004BA006: mov [edx+00000008h], eax
  loc_004BA009: mov eax, var_44
  loc_004BA00C: mov [edx+0000000Ch], eax
  loc_004BA00F: call [ecx+0000030Ch]
  loc_004BA015: lea edx, var_20
  loc_004BA018: push eax
  loc_004BA019: push edx
  loc_004BA01A: call edi
  loc_004BA01C: push eax
  loc_004BA01D: call ebx
  loc_004BA01F: lea eax, var_20
  loc_004BA022: lea ecx, var_18
  loc_004BA025: push eax
  loc_004BA026: push ecx
  loc_004BA027: push 00000002h
  loc_004BA029: call [00401040h] ; __vbaFreeObjList
  loc_004BA02F: lea edx, var_50
  loc_004BA032: lea eax, var_40
  loc_004BA035: push edx
  loc_004BA036: lea ecx, var_30
  loc_004BA039: push eax
  loc_004BA03A: push ecx
  loc_004BA03B: push 00000003h
  loc_004BA03D: call [00401038h] ; __vbaFreeVarList
  loc_004BA043: mov edx, [esi+0000003Ch]
  loc_004BA046: add esp, 0000001Ch
  loc_004BA049: push edx
  loc_004BA04A: call [004011D8h] ; __vbaR8Str
  loc_004BA050: fadd st0, real8 ptr [004015F8h]
  loc_004BA056: sub esp, 00000008h
  loc_004BA059: fnstsw ax
  loc_004BA05B: test al, 0Dh
  loc_004BA05D: jnz 004BB227h
  loc_004BA063: fstp real8 ptr [esp]
  loc_004BA066: call [00401144h] ; __vbaStrR8
  loc_004BA06C: mov edx, eax
  loc_004BA06E: lea ecx, var_14
  loc_004BA071: call [00401270h] ; __vbaStrMove
  loc_004BA077: mov edx, eax
  loc_004BA079: lea ecx, [esi+0000003Ch]
  loc_004BA07C: call [004011ECh] ; __vbaStrCopy
  loc_004BA082: lea ecx, var_14
  loc_004BA085: call [004012ACh] ; __vbaFreeStr
  loc_004BA08B: mov eax, [esi]
  loc_004BA08D: push 00000000h
  loc_004BA08F: push 00000004h
  loc_004BA091: push esi
  loc_004BA092: call [eax+0000030Ch]
  loc_004BA098: lea ecx, var_18
  loc_004BA09B: push eax
  loc_004BA09C: push ecx
  loc_004BA09D: call edi
  loc_004BA09F: lea edx, var_30
  loc_004BA0A2: push eax
  loc_004BA0A3: push edx
  loc_004BA0A4: call [00401140h] ; __vbaLateIdCallLd
  loc_004BA0AA: add esp, 00000010h
  loc_004BA0AD: push eax
  loc_004BA0AE: call [0040121Ch] ; __vbaI4Var
  loc_004BA0B4: add eax, 00000001h
  loc_004BA0B7: mov ecx, 00000003h
  loc_004BA0BC: jo 004BB22Ch
  loc_004BA0C2: sub esp, 00000010h
  loc_004BA0C5: mov var_60, ecx
  loc_004BA0C8: mov edx, esp
  loc_004BA0CA: mov var_58, eax
  loc_004BA0CD: push 00000004h
  loc_004BA0CF: push esi
  loc_004BA0D0: mov [edx], ecx
  loc_004BA0D2: mov ecx, var_5C
  loc_004BA0D5: mov [edx+00000004h], ecx
  loc_004BA0D8: mov ecx, [esi]
  loc_004BA0DA: mov [edx+00000008h], eax
  loc_004BA0DD: mov eax, var_54
  loc_004BA0E0: mov [edx+0000000Ch], eax
  loc_004BA0E3: call [ecx+0000030Ch]
  loc_004BA0E9: lea edx, var_1C
  loc_004BA0EC: push eax
  loc_004BA0ED: push edx
  loc_004BA0EE: call edi
  loc_004BA0F0: push eax
  loc_004BA0F1: call ebx
  loc_004BA0F3: lea eax, var_1C
  loc_004BA0F6: lea ecx, var_18
  loc_004BA0F9: push eax
  loc_004BA0FA: push ecx
  loc_004BA0FB: push 00000002h
  loc_004BA0FD: call [00401040h] ; __vbaFreeObjList
  loc_004BA103: add esp, 0000000Ch
  loc_004BA106: lea ecx, var_30
  loc_004BA109: call [00401020h] ; __vbaFreeVar
  loc_004BA10F: mov edx, var_C4
  loc_004BA115: mov eax, [edx]
  loc_004BA117: push eax
  loc_004BA118: mov ecx, [eax]
  loc_004BA11A: call [ecx+000000ECh]
  loc_004BA120: test eax, eax
  loc_004BA122: fnclex
  loc_004BA124: jge 004B9D15h
  loc_004BA12A: mov edx, var_C4
  loc_004BA130: push 000000ECh
  loc_004BA135: push 0041E938h
  loc_004BA13A: mov ecx, [edx]
  loc_004BA13C: push ecx
  loc_004BA13D: push eax
  loc_004BA13E: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA144: jmp 004B9D15h
  loc_004BA149: lea eax, var_A8
  loc_004BA14F: lea ecx, var_60
  loc_004BA152: push eax
  loc_004BA153: push ecx
  loc_004BA154: mov var_58, 0041E5D4h
  loc_004BA15B: mov var_60, edi
  loc_004BA15E: call __vbaVarTstEq
  loc_004BA160: test ax, ax
  loc_004BA163: jz 004BA674h
  loc_004BA169: lea ebx, var_18
  loc_004BA16C: mov ecx, 0000000Ah
  loc_004BA171: push ebx
  loc_004BA172: mov esi, ecx
  loc_004BA174: sub esp, 00000010h
  loc_004BA177: mov eax, 80020004h
  loc_004BA17C: mov ebx, esp
  loc_004BA17E: sub esp, 00000010h
  loc_004BA181: mov edx, eax
  loc_004BA183: mov var_60, 00000003h
  loc_004BA18A: mov [ebx], ecx
  loc_004BA18C: mov ecx, var_7C
  loc_004BA18F: mov edi, [0061A13Ch]
  loc_004BA195: mov var_58, 00000004h
  loc_004BA19C: mov [ebx+00000004h], ecx
  loc_004BA19F: mov ecx, esp
  loc_004BA1A1: sub esp, 00000010h
  loc_004BA1A4: mov edi, [edi]
  loc_004BA1A6: mov [ebx+00000008h], eax
  loc_004BA1A9: mov eax, var_74
  loc_004BA1AC: mov [ebx+0000000Ch], eax
  loc_004BA1AF: mov eax, var_6C
  loc_004BA1B2: mov [ecx], esi
  loc_004BA1B4: mov [ecx+00000004h], eax
  loc_004BA1B7: mov eax, esp
  loc_004BA1B9: push 00426A88h ; "Select * from AgentThai order by AgentName"
  loc_004BA1BE: mov [ecx+00000008h], edx
  loc_004BA1C1: mov edx, var_64
  loc_004BA1C4: mov [ecx+0000000Ch], edx
  loc_004BA1C7: mov ecx, var_60
  loc_004BA1CA: mov edx, var_5C
  loc_004BA1CD: mov [eax], ecx
  loc_004BA1CF: mov ecx, var_58
  loc_004BA1D2: mov [eax+00000004h], edx
  loc_004BA1D5: mov edx, var_54
  loc_004BA1D8: mov [eax+00000008h], ecx
  loc_004BA1DB: mov [eax+0000000Ch], edx
  loc_004BA1DE: mov eax, [0061A13Ch]
  loc_004BA1E3: push eax
  loc_004BA1E4: call [edi+000000BCh]
  loc_004BA1EA: test eax, eax
  loc_004BA1EC: fnclex
  loc_004BA1EE: jge 004BA208h
  loc_004BA1F0: mov ecx, [0061A13Ch]
  loc_004BA1F6: push 000000BCh
  loc_004BA1FB: push 0041E928h
  loc_004BA200: push ecx
  loc_004BA201: push eax
  loc_004BA202: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA208: mov esi, Me
  loc_004BA20B: mov edx, var_18
  loc_004BA20E: push edx
  loc_004BA20F: lea eax, [esi+00000034h]
  loc_004BA212: push eax
  loc_004BA213: mov var_C4, eax
  loc_004BA219: call [004010B8h] ; __vbaObjSetAddref
  loc_004BA21F: lea ecx, var_18
  loc_004BA222: call [004012B0h] ; __vbaFreeObj
  loc_004BA228: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004BA22E: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BA234: mov eax, var_C4
  loc_004BA23A: lea edx, var_84
  loc_004BA240: push edx
  loc_004BA241: mov eax, [eax]
  loc_004BA243: push eax
  loc_004BA244: mov ecx, [eax]
  loc_004BA246: call [ecx+00000034h]
  loc_004BA249: test eax, eax
  loc_004BA24B: fnclex
  loc_004BA24D: jge 004BA266h
  loc_004BA24F: mov ecx, var_C4
  loc_004BA255: push 00000034h
  loc_004BA257: push 0041E938h
  loc_004BA25C: mov edx, [ecx]
  loc_004BA25E: push edx
  loc_004BA25F: push eax
  loc_004BA260: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA266: cmp var_84, 0000h
  loc_004BA26E: jnz 004BAB93h
  loc_004BA274: mov eax, [esi+0000003Ch]
  loc_004BA277: push eax
  loc_004BA278: call [004011D8h] ; __vbaR8Str
  loc_004BA27E: fadd st0, real8 ptr [004015F8h]
  loc_004BA284: fnstsw ax
  loc_004BA286: test al, 0Dh
  loc_004BA288: jnz 004BB227h
  loc_004BA28E: call [0040125Ch] ; __vbaFpI4
  loc_004BA294: sub esp, 00000010h
  loc_004BA297: mov ecx, 00000003h
  loc_004BA29C: mov edx, esp
  loc_004BA29E: mov var_60, ecx
  loc_004BA2A1: mov var_58, eax
  loc_004BA2A4: push 0000000Ah
  loc_004BA2A6: mov [edx], ecx
  loc_004BA2A8: mov ecx, var_5C
  loc_004BA2AB: push esi
  loc_004BA2AC: mov [edx+00000004h], ecx
  loc_004BA2AF: mov ecx, [esi]
  loc_004BA2B1: mov [edx+00000008h], eax
  loc_004BA2B4: mov eax, var_54
  loc_004BA2B7: mov [edx+0000000Ch], eax
  loc_004BA2BA: call [ecx+0000030Ch]
  loc_004BA2C0: lea edx, var_18
  loc_004BA2C3: push eax
  loc_004BA2C4: push edx
  loc_004BA2C5: call edi
  loc_004BA2C7: push eax
  loc_004BA2C8: call ebx
  loc_004BA2CA: lea ecx, var_18
  loc_004BA2CD: call [004012B0h] ; __vbaFreeObj
  loc_004BA2D3: sub esp, 00000010h
  loc_004BA2D6: mov ecx, 00000003h
  loc_004BA2DB: mov edx, esp
  loc_004BA2DD: mov var_60, ecx
  loc_004BA2E0: xor eax, eax
  loc_004BA2E2: push 0000000Bh
  loc_004BA2E4: mov [edx], ecx
  loc_004BA2E6: mov ecx, var_5C
  loc_004BA2E9: mov var_58, eax
  loc_004BA2EC: push esi
  loc_004BA2ED: mov [edx+00000004h], ecx
  loc_004BA2F0: mov ecx, [esi]
  loc_004BA2F2: mov [edx+00000008h], eax
  loc_004BA2F5: mov eax, var_54
  loc_004BA2F8: mov [edx+0000000Ch], eax
  loc_004BA2FB: call [ecx+0000030Ch]
  loc_004BA301: lea edx, var_18
  loc_004BA304: push eax
  loc_004BA305: push edx
  loc_004BA306: call edi
  loc_004BA308: push eax
  loc_004BA309: call ebx
  loc_004BA30B: lea ecx, var_18
  loc_004BA30E: call [004012B0h] ; __vbaFreeObj
  loc_004BA314: sub esp, 00000010h
  loc_004BA317: mov ecx, 00000002h
  loc_004BA31C: mov edx, esp
  loc_004BA31E: mov var_60, ecx
  loc_004BA321: mov eax, 00000001h
  loc_004BA326: push 00000028h
  loc_004BA328: mov [edx], ecx
  loc_004BA32A: mov ecx, var_5C
  loc_004BA32D: mov var_58, eax
  loc_004BA330: push esi
  loc_004BA331: mov [edx+00000004h], ecx
  loc_004BA334: mov ecx, [esi]
  loc_004BA336: mov [edx+00000008h], eax
  loc_004BA339: mov eax, var_54
  loc_004BA33C: mov [edx+0000000Ch], eax
  loc_004BA33F: call [ecx+0000030Ch]
  loc_004BA345: lea edx, var_18
  loc_004BA348: push eax
  loc_004BA349: push edx
  loc_004BA34A: call edi
  loc_004BA34C: push eax
  loc_004BA34D: call ebx
  loc_004BA34F: lea ecx, var_18
  loc_004BA352: call [004012B0h] ; __vbaFreeObj
  loc_004BA358: mov eax, [esi+0000003Ch]
  loc_004BA35B: push eax
  loc_004BA35C: call [004011D8h] ; __vbaR8Str
  loc_004BA362: fadd st0, real8 ptr [004015F8h]
  loc_004BA368: sub esp, 00000008h
  loc_004BA36B: fnstsw ax
  loc_004BA36D: test al, 0Dh
  loc_004BA36F: jnz 004BB227h
  loc_004BA375: fstp real8 ptr [esp]
  loc_004BA378: call [00401144h] ; __vbaStrR8
  loc_004BA37E: sub esp, 00000010h
  loc_004BA381: mov ecx, 00000008h
  loc_004BA386: mov edx, esp
  loc_004BA388: mov var_30, ecx
  loc_004BA38B: mov var_28, eax
  loc_004BA38E: push 00000000h
  loc_004BA390: mov [edx], ecx
  loc_004BA392: mov ecx, var_2C
  loc_004BA395: push esi
  loc_004BA396: mov [edx+00000004h], ecx
  loc_004BA399: mov ecx, [esi]
  loc_004BA39B: mov [edx+00000008h], eax
  loc_004BA39E: mov eax, var_24
  loc_004BA3A1: mov [edx+0000000Ch], eax
  loc_004BA3A4: call [ecx+0000030Ch]
  loc_004BA3AA: lea edx, var_18
  loc_004BA3AD: push eax
  loc_004BA3AE: push edx
  loc_004BA3AF: call edi
  loc_004BA3B1: push eax
  loc_004BA3B2: call ebx
  loc_004BA3B4: lea ecx, var_18
  loc_004BA3B7: call [004012B0h] ; __vbaFreeObj
  loc_004BA3BD: lea ecx, var_30
  loc_004BA3C0: call [00401020h] ; __vbaFreeVar
  loc_004BA3C6: sub esp, 00000010h
  loc_004BA3C9: mov ecx, 00000003h
  loc_004BA3CE: mov edx, esp
  loc_004BA3D0: mov var_60, ecx
  loc_004BA3D3: mov eax, 00000001h
  loc_004BA3D8: push 0000000Bh
  loc_004BA3DA: mov [edx], ecx
  loc_004BA3DC: mov ecx, var_5C
  loc_004BA3DF: mov var_58, eax
  loc_004BA3E2: push esi
  loc_004BA3E3: mov [edx+00000004h], ecx
  loc_004BA3E6: mov ecx, [esi]
  loc_004BA3E8: mov [edx+00000008h], eax
  loc_004BA3EB: mov eax, var_54
  loc_004BA3EE: mov [edx+0000000Ch], eax
  loc_004BA3F1: call [ecx+0000030Ch]
  loc_004BA3F7: lea edx, var_18
  loc_004BA3FA: push eax
  loc_004BA3FB: push edx
  loc_004BA3FC: call edi
  loc_004BA3FE: push eax
  loc_004BA3FF: call ebx
  loc_004BA401: lea ecx, var_18
  loc_004BA404: call [004012B0h] ; __vbaFreeObj
  loc_004BA40A: sub esp, 00000010h
  loc_004BA40D: mov ecx, 00000002h
  loc_004BA412: mov edx, esp
  loc_004BA414: mov var_60, ecx
  loc_004BA417: mov eax, 00000001h
  loc_004BA41C: push 00000028h
  loc_004BA41E: mov [edx], ecx
  loc_004BA420: mov ecx, var_5C
  loc_004BA423: mov var_58, eax
  loc_004BA426: push esi
  loc_004BA427: mov [edx+00000004h], ecx
  loc_004BA42A: mov ecx, [esi]
  loc_004BA42C: mov [edx+00000008h], eax
  loc_004BA42F: mov eax, var_54
  loc_004BA432: mov [edx+0000000Ch], eax
  loc_004BA435: call [ecx+0000030Ch]
  loc_004BA43B: lea edx, var_18
  loc_004BA43E: push eax
  loc_004BA43F: push edx
  loc_004BA440: call edi
  loc_004BA442: push eax
  loc_004BA443: call ebx
  loc_004BA445: lea ecx, var_18
  loc_004BA448: call [004012B0h] ; __vbaFreeObj
  loc_004BA44E: mov eax, var_C4
  loc_004BA454: mov eax, [eax]
  loc_004BA456: mov ecx, [eax]
  loc_004BA458: lea edx, var_18
  loc_004BA45B: push edx
  loc_004BA45C: push eax
  loc_004BA45D: call [ecx+000000B4h]
  loc_004BA463: test eax, eax
  loc_004BA465: fnclex
  loc_004BA467: jge 004BA483h
  loc_004BA469: mov ecx, var_C4
  loc_004BA46F: push 000000B4h
  loc_004BA474: push 0041E938h
  loc_004BA479: mov edx, [ecx]
  loc_004BA47B: push edx
  loc_004BA47C: push eax
  loc_004BA47D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA483: lea edx, var_1C
  loc_004BA486: mov eax, 00000008h
  loc_004BA48B: push edx
  loc_004BA48C: mov ecx, var_18
  loc_004BA48F: sub esp, 00000010h
  loc_004BA492: mov var_60, eax
  loc_004BA495: mov edx, esp
  loc_004BA497: mov var_58, 0041EB18h ; "AgentName"
  loc_004BA49E: mov var_8C, ecx
  loc_004BA4A4: mov ecx, [ecx]
  loc_004BA4A6: mov [edx], eax
  loc_004BA4A8: mov eax, var_5C
  loc_004BA4AB: mov [edx+00000004h], eax
  loc_004BA4AE: mov eax, var_58
  loc_004BA4B1: mov [edx+00000008h], eax
  loc_004BA4B4: mov eax, var_54
  loc_004BA4B7: mov [edx+0000000Ch], eax
  loc_004BA4BA: mov edx, var_18
  loc_004BA4BD: push edx
  loc_004BA4BE: call [ecx+00000030h]
  loc_004BA4C1: test eax, eax
  loc_004BA4C3: fnclex
  loc_004BA4C5: jge 004BA4DCh
  loc_004BA4C7: mov ecx, var_8C
  loc_004BA4CD: push 00000030h
  loc_004BA4CF: push 0041EA14h ; "S"
  loc_004BA4D4: push ecx
  loc_004BA4D5: push eax
  loc_004BA4D6: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA4DC: mov eax, var_1C
  loc_004BA4DF: lea ecx, var_30
  loc_004BA4E2: push ecx
  loc_004BA4E3: push eax
  loc_004BA4E4: mov edx, [eax]
  loc_004BA4E6: mov var_94, eax
  loc_004BA4EC: call [edx+00000044h]
  loc_004BA4EF: test eax, eax
  loc_004BA4F1: fnclex
  loc_004BA4F3: jge 004BA50Ah
  loc_004BA4F5: mov edx, var_94
  loc_004BA4FB: push 00000044h
  loc_004BA4FD: push 0041EA48h
  loc_004BA502: push edx
  loc_004BA503: push eax
  loc_004BA504: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA50A: lea eax, var_30
  loc_004BA50D: push eax
  loc_004BA50E: call [00401028h] ; __vbaStrVarMove
  loc_004BA514: sub esp, 00000010h
  loc_004BA517: mov ecx, 00000008h
  loc_004BA51C: mov edx, esp
  loc_004BA51E: mov var_40, ecx
  loc_004BA521: mov var_38, eax
  loc_004BA524: push 00000000h
  loc_004BA526: mov [edx], ecx
  loc_004BA528: mov ecx, var_3C
  loc_004BA52B: push esi
  loc_004BA52C: mov [edx+00000004h], ecx
  loc_004BA52F: mov ecx, [esi]
  loc_004BA531: mov [edx+00000008h], eax
  loc_004BA534: mov eax, var_34
  loc_004BA537: mov [edx+0000000Ch], eax
  loc_004BA53A: call [ecx+0000030Ch]
  loc_004BA540: lea edx, var_20
  loc_004BA543: push eax
  loc_004BA544: push edx
  loc_004BA545: call edi
  loc_004BA547: push eax
  loc_004BA548: call ebx
  loc_004BA54A: lea eax, var_20
  loc_004BA54D: lea ecx, var_1C
  loc_004BA550: push eax
  loc_004BA551: lea edx, var_18
  loc_004BA554: push ecx
  loc_004BA555: push edx
  loc_004BA556: push 00000003h
  loc_004BA558: call [00401040h] ; __vbaFreeObjList
  loc_004BA55E: lea eax, var_40
  loc_004BA561: lea ecx, var_30
  loc_004BA564: push eax
  loc_004BA565: push ecx
  loc_004BA566: push 00000002h
  loc_004BA568: call [00401038h] ; __vbaFreeVarList
  loc_004BA56E: mov edx, [esi+0000003Ch]
  loc_004BA571: add esp, 0000001Ch
  loc_004BA574: push edx
  loc_004BA575: call [004011D8h] ; __vbaR8Str
  loc_004BA57B: fadd st0, real8 ptr [004015F8h]
  loc_004BA581: sub esp, 00000008h
  loc_004BA584: fnstsw ax
  loc_004BA586: test al, 0Dh
  loc_004BA588: jnz 004BB227h
  loc_004BA58E: fstp real8 ptr [esp]
  loc_004BA591: call [00401144h] ; __vbaStrR8
  loc_004BA597: mov edx, eax
  loc_004BA599: lea ecx, var_14
  loc_004BA59C: call [00401270h] ; __vbaStrMove
  loc_004BA5A2: mov edx, eax
  loc_004BA5A4: lea ecx, [esi+0000003Ch]
  loc_004BA5A7: call [004011ECh] ; __vbaStrCopy
  loc_004BA5AD: lea ecx, var_14
  loc_004BA5B0: call [004012ACh] ; __vbaFreeStr
  loc_004BA5B6: mov eax, [esi]
  loc_004BA5B8: push 00000000h
  loc_004BA5BA: push 00000004h
  loc_004BA5BC: push esi
  loc_004BA5BD: call [eax+0000030Ch]
  loc_004BA5C3: lea ecx, var_18
  loc_004BA5C6: push eax
  loc_004BA5C7: push ecx
  loc_004BA5C8: call edi
  loc_004BA5CA: lea edx, var_30
  loc_004BA5CD: push eax
  loc_004BA5CE: push edx
  loc_004BA5CF: call [00401140h] ; __vbaLateIdCallLd
  loc_004BA5D5: add esp, 00000010h
  loc_004BA5D8: push eax
  loc_004BA5D9: call [0040121Ch] ; __vbaI4Var
  loc_004BA5DF: add eax, 00000001h
  loc_004BA5E2: mov ecx, 00000003h
  loc_004BA5E7: jo 004BB22Ch
  loc_004BA5ED: sub esp, 00000010h
  loc_004BA5F0: mov var_60, ecx
  loc_004BA5F3: mov edx, esp
  loc_004BA5F5: mov var_58, eax
  loc_004BA5F8: mov [edx], ecx
  loc_004BA5FA: mov ecx, var_5C
  loc_004BA5FD: mov [edx+00000004h], ecx
  loc_004BA600: mov ecx, [esi]
  loc_004BA602: push 00000004h
  loc_004BA604: push esi
  loc_004BA605: mov [edx+00000008h], eax
  loc_004BA608: mov eax, var_54
  loc_004BA60B: mov [edx+0000000Ch], eax
  loc_004BA60E: call [ecx+0000030Ch]
  loc_004BA614: lea edx, var_1C
  loc_004BA617: push eax
  loc_004BA618: push edx
  loc_004BA619: call edi
  loc_004BA61B: push eax
  loc_004BA61C: call ebx
  loc_004BA61E: lea eax, var_1C
  loc_004BA621: lea ecx, var_18
  loc_004BA624: push eax
  loc_004BA625: push ecx
  loc_004BA626: push 00000002h
  loc_004BA628: call [00401040h] ; __vbaFreeObjList
  loc_004BA62E: add esp, 0000000Ch
  loc_004BA631: lea ecx, var_30
  loc_004BA634: call [00401020h] ; __vbaFreeVar
  loc_004BA63A: mov edx, var_C4
  loc_004BA640: mov eax, [edx]
  loc_004BA642: push eax
  loc_004BA643: mov ecx, [eax]
  loc_004BA645: call [ecx+000000ECh]
  loc_004BA64B: test eax, eax
  loc_004BA64D: fnclex
  loc_004BA64F: jge 004BA234h
  loc_004BA655: mov edx, var_C4
  loc_004BA65B: push 000000ECh
  loc_004BA660: push 0041E938h
  loc_004BA665: mov ecx, [edx]
  loc_004BA667: push ecx
  loc_004BA668: push eax
  loc_004BA669: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA66F: jmp 004BA234h
  loc_004BA674: lea eax, var_A8
  loc_004BA67A: lea ecx, var_60
  loc_004BA67D: push eax
  loc_004BA67E: push ecx
  loc_004BA67F: mov var_58, 0041F258h ; "AThai"
  loc_004BA686: mov var_60, edi
  loc_004BA689: call __vbaVarTstEq
  loc_004BA68B: test ax, ax
  loc_004BA68E: jz 004BABB3h
  loc_004BA694: lea ebx, var_18
  loc_004BA697: mov ecx, 0000000Ah
  loc_004BA69C: push ebx
  loc_004BA69D: mov esi, ecx
  loc_004BA69F: sub esp, 00000010h
  loc_004BA6A2: mov eax, 80020004h
  loc_004BA6A7: mov ebx, esp
  loc_004BA6A9: sub esp, 00000010h
  loc_004BA6AC: mov edx, eax
  loc_004BA6AE: mov var_60, 00000003h
  loc_004BA6B5: mov [ebx], ecx
  loc_004BA6B7: mov ecx, var_7C
  loc_004BA6BA: mov edi, [0061A13Ch]
  loc_004BA6C0: mov var_58, 00000004h
  loc_004BA6C7: mov [ebx+00000004h], ecx
  loc_004BA6CA: mov ecx, esp
  loc_004BA6CC: sub esp, 00000010h
  loc_004BA6CF: mov edi, [edi]
  loc_004BA6D1: mov [ebx+00000008h], eax
  loc_004BA6D4: mov eax, var_74
  loc_004BA6D7: mov [ebx+0000000Ch], eax
  loc_004BA6DA: mov eax, var_6C
  loc_004BA6DD: mov [ecx], esi
  loc_004BA6DF: mov [ecx+00000004h], eax
  loc_004BA6E2: mov eax, esp
  loc_004BA6E4: push 00426A88h ; "Select * from AgentThai order by AgentName"
  loc_004BA6E9: mov [ecx+00000008h], edx
  loc_004BA6EC: mov edx, var_64
  loc_004BA6EF: mov [ecx+0000000Ch], edx
  loc_004BA6F2: mov ecx, var_60
  loc_004BA6F5: mov edx, var_5C
  loc_004BA6F8: mov [eax], ecx
  loc_004BA6FA: mov ecx, var_58
  loc_004BA6FD: mov [eax+00000004h], edx
  loc_004BA700: mov edx, var_54
  loc_004BA703: mov [eax+00000008h], ecx
  loc_004BA706: mov [eax+0000000Ch], edx
  loc_004BA709: mov eax, [0061A13Ch]
  loc_004BA70E: push eax
  loc_004BA70F: call [edi+000000BCh]
  loc_004BA715: test eax, eax
  loc_004BA717: fnclex
  loc_004BA719: jge 004BA733h
  loc_004BA71B: mov ecx, [0061A13Ch]
  loc_004BA721: push 000000BCh
  loc_004BA726: push 0041E928h
  loc_004BA72B: push ecx
  loc_004BA72C: push eax
  loc_004BA72D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA733: mov esi, Me
  loc_004BA736: mov edx, var_18
  loc_004BA739: push edx
  loc_004BA73A: lea eax, [esi+00000034h]
  loc_004BA73D: push eax
  loc_004BA73E: mov var_C4, eax
  loc_004BA744: call [004010B8h] ; __vbaObjSetAddref
  loc_004BA74A: lea ecx, var_18
  loc_004BA74D: call [004012B0h] ; __vbaFreeObj
  loc_004BA753: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004BA759: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BA75F: mov eax, var_C4
  loc_004BA765: lea edx, var_84
  loc_004BA76B: push edx
  loc_004BA76C: mov eax, [eax]
  loc_004BA76E: push eax
  loc_004BA76F: mov ecx, [eax]
  loc_004BA771: call [ecx+00000034h]
  loc_004BA774: test eax, eax
  loc_004BA776: fnclex
  loc_004BA778: jge 004BA791h
  loc_004BA77A: mov ecx, var_C4
  loc_004BA780: push 00000034h
  loc_004BA782: push 0041E938h
  loc_004BA787: mov edx, [ecx]
  loc_004BA789: push edx
  loc_004BA78A: push eax
  loc_004BA78B: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA791: cmp var_84, 0000h
  loc_004BA799: jnz 004BAB93h
  loc_004BA79F: mov eax, [esi+0000003Ch]
  loc_004BA7A2: push eax
  loc_004BA7A3: call [004011D8h] ; __vbaR8Str
  loc_004BA7A9: fadd st0, real8 ptr [004015F8h]
  loc_004BA7AF: fnstsw ax
  loc_004BA7B1: test al, 0Dh
  loc_004BA7B3: jnz 004BB227h
  loc_004BA7B9: call [0040125Ch] ; __vbaFpI4
  loc_004BA7BF: sub esp, 00000010h
  loc_004BA7C2: mov ecx, 00000003h
  loc_004BA7C7: mov edx, esp
  loc_004BA7C9: mov var_60, ecx
  loc_004BA7CC: mov var_58, eax
  loc_004BA7CF: push 0000000Ah
  loc_004BA7D1: mov [edx], ecx
  loc_004BA7D3: mov ecx, var_5C
  loc_004BA7D6: push esi
  loc_004BA7D7: mov [edx+00000004h], ecx
  loc_004BA7DA: mov ecx, [esi]
  loc_004BA7DC: mov [edx+00000008h], eax
  loc_004BA7DF: mov eax, var_54
  loc_004BA7E2: mov [edx+0000000Ch], eax
  loc_004BA7E5: call [ecx+0000030Ch]
  loc_004BA7EB: lea edx, var_18
  loc_004BA7EE: push eax
  loc_004BA7EF: push edx
  loc_004BA7F0: call edi
  loc_004BA7F2: push eax
  loc_004BA7F3: call ebx
  loc_004BA7F5: lea ecx, var_18
  loc_004BA7F8: call [004012B0h] ; __vbaFreeObj
  loc_004BA7FE: sub esp, 00000010h
  loc_004BA801: mov ecx, 00000003h
  loc_004BA806: mov edx, esp
  loc_004BA808: mov var_60, ecx
  loc_004BA80B: xor eax, eax
  loc_004BA80D: push 0000000Bh
  loc_004BA80F: mov [edx], ecx
  loc_004BA811: mov ecx, var_5C
  loc_004BA814: mov var_58, eax
  loc_004BA817: push esi
  loc_004BA818: mov [edx+00000004h], ecx
  loc_004BA81B: mov ecx, [esi]
  loc_004BA81D: mov [edx+00000008h], eax
  loc_004BA820: mov eax, var_54
  loc_004BA823: mov [edx+0000000Ch], eax
  loc_004BA826: call [ecx+0000030Ch]
  loc_004BA82C: lea edx, var_18
  loc_004BA82F: push eax
  loc_004BA830: push edx
  loc_004BA831: call edi
  loc_004BA833: push eax
  loc_004BA834: call ebx
  loc_004BA836: lea ecx, var_18
  loc_004BA839: call [004012B0h] ; __vbaFreeObj
  loc_004BA83F: sub esp, 00000010h
  loc_004BA842: mov ecx, 00000002h
  loc_004BA847: mov edx, esp
  loc_004BA849: mov var_60, ecx
  loc_004BA84C: mov eax, 00000001h
  loc_004BA851: push 00000028h
  loc_004BA853: mov [edx], ecx
  loc_004BA855: mov ecx, var_5C
  loc_004BA858: mov var_58, eax
  loc_004BA85B: push esi
  loc_004BA85C: mov [edx+00000004h], ecx
  loc_004BA85F: mov ecx, [esi]
  loc_004BA861: mov [edx+00000008h], eax
  loc_004BA864: mov eax, var_54
  loc_004BA867: mov [edx+0000000Ch], eax
  loc_004BA86A: call [ecx+0000030Ch]
  loc_004BA870: lea edx, var_18
  loc_004BA873: push eax
  loc_004BA874: push edx
  loc_004BA875: call edi
  loc_004BA877: push eax
  loc_004BA878: call ebx
  loc_004BA87A: lea ecx, var_18
  loc_004BA87D: call [004012B0h] ; __vbaFreeObj
  loc_004BA883: mov eax, [esi+0000003Ch]
  loc_004BA886: push eax
  loc_004BA887: call [004011D8h] ; __vbaR8Str
  loc_004BA88D: fadd st0, real8 ptr [004015F8h]
  loc_004BA893: sub esp, 00000008h
  loc_004BA896: fnstsw ax
  loc_004BA898: test al, 0Dh
  loc_004BA89A: jnz 004BB227h
  loc_004BA8A0: fstp real8 ptr [esp]
  loc_004BA8A3: call [00401144h] ; __vbaStrR8
  loc_004BA8A9: sub esp, 00000010h
  loc_004BA8AC: mov ecx, 00000008h
  loc_004BA8B1: mov edx, esp
  loc_004BA8B3: mov var_30, ecx
  loc_004BA8B6: mov var_28, eax
  loc_004BA8B9: push 00000000h
  loc_004BA8BB: mov [edx], ecx
  loc_004BA8BD: mov ecx, var_2C
  loc_004BA8C0: push esi
  loc_004BA8C1: mov [edx+00000004h], ecx
  loc_004BA8C4: mov ecx, [esi]
  loc_004BA8C6: mov [edx+00000008h], eax
  loc_004BA8C9: mov eax, var_24
  loc_004BA8CC: mov [edx+0000000Ch], eax
  loc_004BA8CF: call [ecx+0000030Ch]
  loc_004BA8D5: lea edx, var_18
  loc_004BA8D8: push eax
  loc_004BA8D9: push edx
  loc_004BA8DA: call edi
  loc_004BA8DC: push eax
  loc_004BA8DD: call ebx
  loc_004BA8DF: lea ecx, var_18
  loc_004BA8E2: call [004012B0h] ; __vbaFreeObj
  loc_004BA8E8: lea ecx, var_30
  loc_004BA8EB: call [00401020h] ; __vbaFreeVar
  loc_004BA8F1: sub esp, 00000010h
  loc_004BA8F4: mov ecx, 00000003h
  loc_004BA8F9: mov edx, esp
  loc_004BA8FB: mov var_60, ecx
  loc_004BA8FE: mov eax, 00000001h
  loc_004BA903: push 0000000Bh
  loc_004BA905: mov [edx], ecx
  loc_004BA907: mov ecx, var_5C
  loc_004BA90A: mov var_58, eax
  loc_004BA90D: push esi
  loc_004BA90E: mov [edx+00000004h], ecx
  loc_004BA911: mov ecx, [esi]
  loc_004BA913: mov [edx+00000008h], eax
  loc_004BA916: mov eax, var_54
  loc_004BA919: mov [edx+0000000Ch], eax
  loc_004BA91C: call [ecx+0000030Ch]
  loc_004BA922: lea edx, var_18
  loc_004BA925: push eax
  loc_004BA926: push edx
  loc_004BA927: call edi
  loc_004BA929: push eax
  loc_004BA92A: call ebx
  loc_004BA92C: lea ecx, var_18
  loc_004BA92F: call [004012B0h] ; __vbaFreeObj
  loc_004BA935: sub esp, 00000010h
  loc_004BA938: mov ecx, 00000002h
  loc_004BA93D: mov edx, esp
  loc_004BA93F: mov var_60, ecx
  loc_004BA942: mov eax, 00000001h
  loc_004BA947: push 00000028h
  loc_004BA949: mov [edx], ecx
  loc_004BA94B: mov ecx, var_5C
  loc_004BA94E: mov var_58, eax
  loc_004BA951: push esi
  loc_004BA952: mov [edx+00000004h], ecx
  loc_004BA955: mov ecx, [esi]
  loc_004BA957: mov [edx+00000008h], eax
  loc_004BA95A: mov eax, var_54
  loc_004BA95D: mov [edx+0000000Ch], eax
  loc_004BA960: call [ecx+0000030Ch]
  loc_004BA966: lea edx, var_18
  loc_004BA969: push eax
  loc_004BA96A: push edx
  loc_004BA96B: call edi
  loc_004BA96D: push eax
  loc_004BA96E: call ebx
  loc_004BA970: lea ecx, var_18
  loc_004BA973: call [004012B0h] ; __vbaFreeObj
  loc_004BA979: mov eax, var_C4
  loc_004BA97F: mov eax, [eax]
  loc_004BA981: mov ecx, [eax]
  loc_004BA983: lea edx, var_18
  loc_004BA986: push edx
  loc_004BA987: push eax
  loc_004BA988: call [ecx+000000B4h]
  loc_004BA98E: test eax, eax
  loc_004BA990: fnclex
  loc_004BA992: jge 004BA9AEh
  loc_004BA994: mov ecx, var_C4
  loc_004BA99A: push 000000B4h
  loc_004BA99F: push 0041E938h
  loc_004BA9A4: mov edx, [ecx]
  loc_004BA9A6: push edx
  loc_004BA9A7: push eax
  loc_004BA9A8: call [00401074h] ; __vbaHresultCheckObj
  loc_004BA9AE: lea edx, var_1C
  loc_004BA9B1: mov eax, 00000008h
  loc_004BA9B6: push edx
  loc_004BA9B7: mov ecx, var_18
  loc_004BA9BA: sub esp, 00000010h
  loc_004BA9BD: mov var_60, eax
  loc_004BA9C0: mov edx, esp
  loc_004BA9C2: mov var_58, 0041EB18h ; "AgentName"
  loc_004BA9C9: mov var_8C, ecx
  loc_004BA9CF: mov ecx, [ecx]
  loc_004BA9D1: mov [edx], eax
  loc_004BA9D3: mov eax, var_5C
  loc_004BA9D6: mov [edx+00000004h], eax
  loc_004BA9D9: mov eax, var_58
  loc_004BA9DC: mov [edx+00000008h], eax
  loc_004BA9DF: mov eax, var_54
  loc_004BA9E2: mov [edx+0000000Ch], eax
  loc_004BA9E5: mov edx, var_18
  loc_004BA9E8: push edx
  loc_004BA9E9: call [ecx+00000030h]
  loc_004BA9EC: test eax, eax
  loc_004BA9EE: fnclex
  loc_004BA9F0: jge 004BAA07h
  loc_004BA9F2: mov ecx, var_8C
  loc_004BA9F8: push 00000030h
  loc_004BA9FA: push 0041EA14h ; "S"
  loc_004BA9FF: push ecx
  loc_004BAA00: push eax
  loc_004BAA01: call [00401074h] ; __vbaHresultCheckObj
  loc_004BAA07: mov eax, var_1C
  loc_004BAA0A: lea edx, var_30
  loc_004BAA0D: mov var_28, eax
  loc_004BAA10: lea eax, var_40
  loc_004BAA13: push edx
  loc_004BAA14: push eax
  loc_004BAA15: mov var_1C, 00000000h
  loc_004BAA1C: mov var_30, 00000009h
  loc_004BAA23: call [004010D4h] ; rtcTrimVar
  loc_004BAA29: lea ecx, var_40
  loc_004BAA2C: push ecx
  loc_004BAA2D: call [00401028h] ; __vbaStrVarMove
  loc_004BAA33: sub esp, 00000010h
  loc_004BAA36: mov ecx, 00000008h
  loc_004BAA3B: mov edx, esp
  loc_004BAA3D: mov var_50, ecx
  loc_004BAA40: mov var_48, eax
  loc_004BAA43: push 00000000h
  loc_004BAA45: mov [edx], ecx
  loc_004BAA47: mov ecx, var_4C
  loc_004BAA4A: push esi
  loc_004BAA4B: mov [edx+00000004h], ecx
  loc_004BAA4E: mov ecx, [esi]
  loc_004BAA50: mov [edx+00000008h], eax
  loc_004BAA53: mov eax, var_44
  loc_004BAA56: mov [edx+0000000Ch], eax
  loc_004BAA59: call [ecx+0000030Ch]
  loc_004BAA5F: lea edx, var_20
  loc_004BAA62: push eax
  loc_004BAA63: push edx
  loc_004BAA64: call edi
  loc_004BAA66: push eax
  loc_004BAA67: call ebx
  loc_004BAA69: lea eax, var_20
  loc_004BAA6C: lea ecx, var_18
  loc_004BAA6F: push eax
  loc_004BAA70: push ecx
  loc_004BAA71: push 00000002h
  loc_004BAA73: call [00401040h] ; __vbaFreeObjList
  loc_004BAA79: lea edx, var_50
  loc_004BAA7C: lea eax, var_40
  loc_004BAA7F: push edx
  loc_004BAA80: lea ecx, var_30
  loc_004BAA83: push eax
  loc_004BAA84: push ecx
  loc_004BAA85: push 00000003h
  loc_004BAA87: call [00401038h] ; __vbaFreeVarList
  loc_004BAA8D: mov edx, [esi+0000003Ch]
  loc_004BAA90: add esp, 0000001Ch
  loc_004BAA93: push edx
  loc_004BAA94: call [004011D8h] ; __vbaR8Str
  loc_004BAA9A: fadd st0, real8 ptr [004015F8h]
  loc_004BAAA0: sub esp, 00000008h
  loc_004BAAA3: fnstsw ax
  loc_004BAAA5: test al, 0Dh
  loc_004BAAA7: jnz 004BB227h
  loc_004BAAAD: fstp real8 ptr [esp]
  loc_004BAAB0: call [00401144h] ; __vbaStrR8
  loc_004BAAB6: mov edx, eax
  loc_004BAAB8: lea ecx, var_14
  loc_004BAABB: call [00401270h] ; __vbaStrMove
  loc_004BAAC1: mov edx, eax
  loc_004BAAC3: lea ecx, [esi+0000003Ch]
  loc_004BAAC6: call [004011ECh] ; __vbaStrCopy
  loc_004BAACC: lea ecx, var_14
  loc_004BAACF: call [004012ACh] ; __vbaFreeStr
  loc_004BAAD5: mov eax, [esi]
  loc_004BAAD7: push 00000000h
  loc_004BAAD9: push 00000004h
  loc_004BAADB: push esi
  loc_004BAADC: call [eax+0000030Ch]
  loc_004BAAE2: lea ecx, var_18
  loc_004BAAE5: push eax
  loc_004BAAE6: push ecx
  loc_004BAAE7: call edi
  loc_004BAAE9: lea edx, var_30
  loc_004BAAEC: push eax
  loc_004BAAED: push edx
  loc_004BAAEE: call [00401140h] ; __vbaLateIdCallLd
  loc_004BAAF4: add esp, 00000010h
  loc_004BAAF7: push eax
  loc_004BAAF8: call [0040121Ch] ; __vbaI4Var
  loc_004BAAFE: add eax, 00000001h
  loc_004BAB01: mov ecx, 00000003h
  loc_004BAB06: jo 004BB22Ch
  loc_004BAB0C: sub esp, 00000010h
  loc_004BAB0F: mov var_60, ecx
  loc_004BAB12: mov edx, esp
  loc_004BAB14: mov var_58, eax
  loc_004BAB17: push 00000004h
  loc_004BAB19: push esi
  loc_004BAB1A: mov [edx], ecx
  loc_004BAB1C: mov ecx, var_5C
  loc_004BAB1F: mov [edx+00000004h], ecx
  loc_004BAB22: mov ecx, [esi]
  loc_004BAB24: mov [edx+00000008h], eax
  loc_004BAB27: mov eax, var_54
  loc_004BAB2A: mov [edx+0000000Ch], eax
  loc_004BAB2D: call [ecx+0000030Ch]
  loc_004BAB33: lea edx, var_1C
  loc_004BAB36: push eax
  loc_004BAB37: push edx
  loc_004BAB38: call edi
  loc_004BAB3A: push eax
  loc_004BAB3B: call ebx
  loc_004BAB3D: lea eax, var_1C
  loc_004BAB40: lea ecx, var_18
  loc_004BAB43: push eax
  loc_004BAB44: push ecx
  loc_004BAB45: push 00000002h
  loc_004BAB47: call [00401040h] ; __vbaFreeObjList
  loc_004BAB4D: add esp, 0000000Ch
  loc_004BAB50: lea ecx, var_30
  loc_004BAB53: call [00401020h] ; __vbaFreeVar
  loc_004BAB59: mov edx, var_C4
  loc_004BAB5F: mov eax, [edx]
  loc_004BAB61: push eax
  loc_004BAB62: mov ecx, [eax]
  loc_004BAB64: call [ecx+000000ECh]
  loc_004BAB6A: test eax, eax
  loc_004BAB6C: fnclex
  loc_004BAB6E: jge 004BA75Fh
  loc_004BAB74: mov edx, var_C4
  loc_004BAB7A: push 000000ECh
  loc_004BAB7F: push 0041E938h
  loc_004BAB84: mov ecx, [edx]
  loc_004BAB86: push ecx
  loc_004BAB87: push eax
  loc_004BAB88: call [00401074h] ; __vbaHresultCheckObj
  loc_004BAB8E: jmp 004BA75Fh
  loc_004BAB93: mov esi, var_C4
  loc_004BAB99: mov eax, [esi]
  loc_004BAB9B: push eax
  loc_004BAB9C: mov edx, [eax]
  loc_004BAB9E: call [edx+000000C4h]
  loc_004BABA4: test eax, eax
  loc_004BABA6: fnclex
  loc_004BABA8: jge 004BB1A3h
  loc_004BABAE: jmp 004BB18Fh
  loc_004BABB3: lea eax, var_A8
  loc_004BABB9: lea ecx, var_60
  loc_004BABBC: push eax
  loc_004BABBD: push ecx
  loc_004BABBE: mov var_58, 004268E8h ; "Balance"
  loc_004BABC5: mov var_60, edi
  loc_004BABC8: call __vbaVarTstEq
  loc_004BABCA: test ax, ax
  loc_004BABCD: jz 004BB1C8h
  loc_004BABD3: lea ebx, var_18
  loc_004BABD6: mov ecx, 0000000Ah
  loc_004BABDB: push ebx
  loc_004BABDC: mov esi, ecx
  loc_004BABDE: sub esp, 00000010h
  loc_004BABE1: mov eax, 80020004h
  loc_004BABE6: mov ebx, esp
  loc_004BABE8: sub esp, 00000010h
  loc_004BABEB: mov edx, eax
  loc_004BABED: mov var_60, 00000003h
  loc_004BABF4: mov [ebx], ecx
  loc_004BABF6: mov ecx, var_7C
  loc_004BABF9: mov edi, [0061A13Ch]
  loc_004BABFF: mov var_58, 00000004h
  loc_004BAC06: mov [ebx+00000004h], ecx
  loc_004BAC09: mov ecx, esp
  loc_004BAC0B: sub esp, 00000010h
  loc_004BAC0E: mov edi, [edi]
  loc_004BAC10: mov [ebx+00000008h], eax
  loc_004BAC13: mov eax, var_74
  loc_004BAC16: mov [ebx+0000000Ch], eax
  loc_004BAC19: mov eax, var_6C
  loc_004BAC1C: mov [ecx], esi
  loc_004BAC1E: mov [ecx+00000004h], eax
  loc_004BAC21: mov eax, esp
  loc_004BAC23: push 00426AE4h ; "Select * from Balance order by Name"
  loc_004BAC28: mov [ecx+00000008h], edx
  loc_004BAC2B: mov edx, var_64
  loc_004BAC2E: mov [ecx+0000000Ch], edx
  loc_004BAC31: mov ecx, var_60
  loc_004BAC34: mov edx, var_5C
  loc_004BAC37: mov [eax], ecx
  loc_004BAC39: mov ecx, var_58
  loc_004BAC3C: mov [eax+00000004h], edx
  loc_004BAC3F: mov edx, var_54
  loc_004BAC42: mov [eax+00000008h], ecx
  loc_004BAC45: mov [eax+0000000Ch], edx
  loc_004BAC48: mov eax, [0061A13Ch]
  loc_004BAC4D: push eax
  loc_004BAC4E: call [edi+000000BCh]
  loc_004BAC54: test eax, eax
  loc_004BAC56: fnclex
  loc_004BAC58: jge 004BAC72h
  loc_004BAC5A: mov ecx, [0061A13Ch]
  loc_004BAC60: push 000000BCh
  loc_004BAC65: push 0041E928h
  loc_004BAC6A: push ecx
  loc_004BAC6B: push eax
  loc_004BAC6C: call [00401074h] ; __vbaHresultCheckObj
  loc_004BAC72: mov esi, Me
  loc_004BAC75: mov edx, var_18
  loc_004BAC78: push edx
  loc_004BAC79: lea eax, [esi+00000034h]
  loc_004BAC7C: push eax
  loc_004BAC7D: mov var_C4, eax
  loc_004BAC83: call [004010B8h] ; __vbaObjSetAddref
  loc_004BAC89: lea ecx, var_18
  loc_004BAC8C: call [004012B0h] ; __vbaFreeObj
  loc_004BAC92: mov ebx, [00401288h] ; __vbaLateIdSt
  loc_004BAC98: mov edi, [004010A0h] ; __vbaObjSet
  loc_004BAC9E: mov eax, var_C4
  loc_004BACA4: lea edx, var_84
  loc_004BACAA: push edx
  loc_004BACAB: mov eax, [eax]
  loc_004BACAD: push eax
  loc_004BACAE: mov ecx, [eax]
  loc_004BACB0: call [ecx+00000034h]
  loc_004BACB3: test eax, eax
  loc_004BACB5: fnclex
  loc_004BACB7: jge 004BACD0h
  loc_004BACB9: mov ecx, var_C4
  loc_004BACBF: push 00000034h
  loc_004BACC1: push 0041E938h
  loc_004BACC6: mov edx, [ecx]
  loc_004BACC8: push edx
  loc_004BACC9: push eax
  loc_004BACCA: call [00401074h] ; __vbaHresultCheckObj
  loc_004BACD0: cmp var_84, 0000h
  loc_004BACD8: jnz 004BB178h
  loc_004BACDE: mov eax, [esi+0000003Ch]
  loc_004BACE1: push eax
  loc_004BACE2: call [004011D8h] ; __vbaR8Str
  loc_004BACE8: fadd st0, real8 ptr [004015F8h]
  loc_004BACEE: fnstsw ax
  loc_004BACF0: test al, 0Dh
  loc_004BACF2: jnz 004BB227h
  loc_004BACF8: call [0040125Ch] ; __vbaFpI4
  loc_004BACFE: sub esp, 00000010h
  loc_004BAD01: mov ecx, 00000003h
  loc_004BAD06: mov edx, esp
  loc_004BAD08: mov var_60, ecx
  loc_004BAD0B: mov var_58, eax
  loc_004BAD0E: push 0000000Ah
  loc_004BAD10: mov [edx], ecx
  loc_004BAD12: mov ecx, var_5C
  loc_004BAD15: push esi
  loc_004BAD16: mov [edx+00000004h], ecx
  loc_004BAD19: mov ecx, [esi]
  loc_004BAD1B: mov [edx+00000008h], eax
  loc_004BAD1E: mov eax, var_54
  loc_004BAD21: mov [edx+0000000Ch], eax
  loc_004BAD24: call [ecx+0000030Ch]
  loc_004BAD2A: lea edx, var_18
  loc_004BAD2D: push eax
  loc_004BAD2E: push edx
  loc_004BAD2F: call edi
  loc_004BAD31: push eax
  loc_004BAD32: call ebx
  loc_004BAD34: lea ecx, var_18
  loc_004BAD37: call [004012B0h] ; __vbaFreeObj
  loc_004BAD3D: sub esp, 00000010h
  loc_004BAD40: mov ecx, 00000003h
  loc_004BAD45: mov edx, esp
  loc_004BAD47: mov var_60, ecx
  loc_004BAD4A: xor eax, eax
  loc_004BAD4C: push 0000000Bh
  loc_004BAD4E: mov [edx], ecx
  loc_004BAD50: mov ecx, var_5C
  loc_004BAD53: mov var_58, eax
  loc_004BAD56: push esi
  loc_004BAD57: mov [edx+00000004h], ecx
  loc_004BAD5A: mov ecx, [esi]
  loc_004BAD5C: mov [edx+00000008h], eax
  loc_004BAD5F: mov eax, var_54
  loc_004BAD62: mov [edx+0000000Ch], eax
  loc_004BAD65: call [ecx+0000030Ch]
  loc_004BAD6B: lea edx, var_18
  loc_004BAD6E: push eax
  loc_004BAD6F: push edx
  loc_004BAD70: call edi
  loc_004BAD72: push eax
  loc_004BAD73: call ebx
  loc_004BAD75: lea ecx, var_18
  loc_004BAD78: call [004012B0h] ; __vbaFreeObj
  loc_004BAD7E: sub esp, 00000010h
  loc_004BAD81: mov ecx, 00000002h
  loc_004BAD86: mov edx, esp
  loc_004BAD88: mov var_60, ecx
  loc_004BAD8B: mov eax, 00000001h
  loc_004BAD90: push 00000028h
  loc_004BAD92: mov [edx], ecx
  loc_004BAD94: mov ecx, var_5C
  loc_004BAD97: mov var_58, eax
  loc_004BAD9A: push esi
  loc_004BAD9B: mov [edx+00000004h], ecx
  loc_004BAD9E: mov ecx, [esi]
  loc_004BADA0: mov [edx+00000008h], eax
  loc_004BADA3: mov eax, var_54
  loc_004BADA6: mov [edx+0000000Ch], eax
  loc_004BADA9: call [ecx+0000030Ch]
  loc_004BADAF: lea edx, var_18
  loc_004BADB2: push eax
  loc_004BADB3: push edx
  loc_004BADB4: call edi
  loc_004BADB6: push eax
  loc_004BADB7: call ebx
  loc_004BADB9: lea ecx, var_18
  loc_004BADBC: call [004012B0h] ; __vbaFreeObj
  loc_004BADC2: mov eax, var_C4
  loc_004BADC8: mov eax, [eax]
  loc_004BADCA: mov ecx, [eax]
  loc_004BADCC: lea edx, var_18
  loc_004BADCF: push edx
  loc_004BADD0: push eax
  loc_004BADD1: call [ecx+000000B4h]
  loc_004BADD7: test eax, eax
  loc_004BADD9: fnclex
  loc_004BADDB: jge 004BADF7h
  loc_004BADDD: mov ecx, var_C4
  loc_004BADE3: push 000000B4h
  loc_004BADE8: push 0041E938h
  loc_004BADED: mov edx, [ecx]
  loc_004BADEF: push edx
  loc_004BADF0: push eax
  loc_004BADF1: call [00401074h] ; __vbaHresultCheckObj
  loc_004BADF7: lea edx, var_1C
  loc_004BADFA: mov eax, 00000008h
  loc_004BADFF: push edx
  loc_004BAE00: mov ecx, var_18
  loc_004BAE03: sub esp, 00000010h
  loc_004BAE06: mov var_60, eax
  loc_004BAE09: mov edx, esp
  loc_004BAE0B: mov var_58, 0041EA08h ; "Name"
  loc_004BAE12: mov var_8C, ecx
  loc_004BAE18: mov ecx, [ecx]
  loc_004BAE1A: mov [edx], eax
  loc_004BAE1C: mov eax, var_5C
  loc_004BAE1F: mov [edx+00000004h], eax
  loc_004BAE22: mov eax, var_58
  loc_004BAE25: mov [edx+00000008h], eax
  loc_004BAE28: mov eax, var_54
  loc_004BAE2B: mov [edx+0000000Ch], eax
  loc_004BAE2E: mov edx, var_18
  loc_004BAE31: push edx
  loc_004BAE32: call [ecx+00000030h]
  loc_004BAE35: test eax, eax
  loc_004BAE37: fnclex
  loc_004BAE39: jge 004BAE50h
  loc_004BAE3B: mov ecx, var_8C
  loc_004BAE41: push 00000030h
  loc_004BAE43: push 0041EA14h ; "S"
  loc_004BAE48: push ecx
  loc_004BAE49: push eax
  loc_004BAE4A: call [00401074h] ; __vbaHresultCheckObj
  loc_004BAE50: mov eax, var_1C
  loc_004BAE53: lea edx, var_30
  loc_004BAE56: mov var_28, eax
  loc_004BAE59: lea eax, var_40
  loc_004BAE5C: push edx
  loc_004BAE5D: push eax
  loc_004BAE5E: mov var_1C, 00000000h
  loc_004BAE65: mov var_30, 00000009h
  loc_004BAE6C: call [004010D4h] ; rtcTrimVar
  loc_004BAE72: lea ecx, var_40
  loc_004BAE75: push ecx
  loc_004BAE76: call [00401028h] ; __vbaStrVarMove
  loc_004BAE7C: sub esp, 00000010h
  loc_004BAE7F: mov ecx, 00000008h
  loc_004BAE84: mov edx, esp
  loc_004BAE86: mov var_50, ecx
  loc_004BAE89: mov var_48, eax
  loc_004BAE8C: push 00000000h
  loc_004BAE8E: mov [edx], ecx
  loc_004BAE90: mov ecx, var_4C
  loc_004BAE93: push esi
  loc_004BAE94: mov [edx+00000004h], ecx
  loc_004BAE97: mov ecx, [esi]
  loc_004BAE99: mov [edx+00000008h], eax
  loc_004BAE9C: mov eax, var_44
  loc_004BAE9F: mov [edx+0000000Ch], eax
  loc_004BAEA2: call [ecx+0000030Ch]
  loc_004BAEA8: lea edx, var_20
  loc_004BAEAB: push eax
  loc_004BAEAC: push edx
  loc_004BAEAD: call edi
  loc_004BAEAF: push eax
  loc_004BAEB0: call ebx
  loc_004BAEB2: lea eax, var_20
  loc_004BAEB5: lea ecx, var_18
  loc_004BAEB8: push eax
  loc_004BAEB9: push ecx
  loc_004BAEBA: push 00000002h
  loc_004BAEBC: call [00401040h] ; __vbaFreeObjList
  loc_004BAEC2: lea edx, var_50
  loc_004BAEC5: lea eax, var_40
  loc_004BAEC8: push edx
  loc_004BAEC9: lea ecx, var_30
  loc_004BAECC: push eax
  loc_004BAECD: push ecx
  loc_004BAECE: push 00000003h
  loc_004BAED0: call [00401038h] ; __vbaFreeVarList
  loc_004BAED6: add esp, 0000000Ch
  loc_004BAED9: mov ecx, 00000003h
  loc_004BAEDE: mov edx, esp
  loc_004BAEE0: mov var_60, ecx
  loc_004BAEE3: mov eax, 00000001h
  loc_004BAEE8: push 0000000Bh
  loc_004BAEEA: mov [edx], ecx
  loc_004BAEEC: mov ecx, var_5C
  loc_004BAEEF: mov var_58, eax
  loc_004BAEF2: push esi
  loc_004BAEF3: mov [edx+00000004h], ecx
  loc_004BAEF6: mov ecx, [esi]
  loc_004BAEF8: mov [edx+00000008h], eax
  loc_004BAEFB: mov eax, var_54
  loc_004BAEFE: mov [edx+0000000Ch], eax
  loc_004BAF01: call [ecx+0000030Ch]
  loc_004BAF07: lea edx, var_18
  loc_004BAF0A: push eax
  loc_004BAF0B: push edx
  loc_004BAF0C: call edi
  loc_004BAF0E: push eax
  loc_004BAF0F: call ebx
  loc_004BAF11: lea ecx, var_18
  loc_004BAF14: call [004012B0h] ; __vbaFreeObj
  loc_004BAF1A: sub esp, 00000010h
  loc_004BAF1D: mov ecx, 00000002h
  loc_004BAF22: mov edx, esp
  loc_004BAF24: mov var_60, ecx
  loc_004BAF27: mov eax, 00000001h
  loc_004BAF2C: mov [edx], ecx
  loc_004BAF2E: mov ecx, var_5C
  loc_004BAF31: mov var_58, eax
  loc_004BAF34: mov [edx+00000004h], ecx
  loc_004BAF37: mov [edx+00000008h], eax
  loc_004BAF3A: mov eax, var_54
  loc_004BAF3D: mov ecx, [esi]
  loc_004BAF3F: push 00000028h
  loc_004BAF41: push esi
  loc_004BAF42: mov [edx+0000000Ch], eax
  loc_004BAF45: call [ecx+0000030Ch]
  loc_004BAF4B: lea edx, var_18
  loc_004BAF4E: push eax
  loc_004BAF4F: push edx
  loc_004BAF50: call edi
  loc_004BAF52: push eax
  loc_004BAF53: call ebx
  loc_004BAF55: lea ecx, var_18
  loc_004BAF58: call [004012B0h] ; __vbaFreeObj
  loc_004BAF5E: mov eax, var_C4
  loc_004BAF64: lea edx, var_18
  loc_004BAF67: push edx
  loc_004BAF68: mov eax, [eax]
  loc_004BAF6A: push eax
  loc_004BAF6B: mov ecx, [eax]
  loc_004BAF6D: call [ecx+000000B4h]
  loc_004BAF73: test eax, eax
  loc_004BAF75: fnclex
  loc_004BAF77: jge 004BAF93h
  loc_004BAF79: mov ecx, var_C4
  loc_004BAF7F: push 000000B4h
  loc_004BAF84: push 0041E938h
  loc_004BAF89: mov edx, [ecx]
  loc_004BAF8B: push edx
  loc_004BAF8C: push eax
  loc_004BAF8D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BAF93: lea edx, var_1C
  loc_004BAF96: mov eax, 00000008h
  loc_004BAF9B: push edx
  loc_004BAF9C: mov ecx, var_18
  loc_004BAF9F: sub esp, 00000010h
  loc_004BAFA2: mov var_60, eax
  loc_004BAFA5: mov edx, esp
  loc_004BAFA7: mov var_58, 0042043Ch ; "Amount"
  loc_004BAFAE: mov var_8C, ecx
  loc_004BAFB4: mov ecx, [ecx]
  loc_004BAFB6: mov [edx], eax
  loc_004BAFB8: mov eax, var_5C
  loc_004BAFBB: mov [edx+00000004h], eax
  loc_004BAFBE: mov eax, var_58
  loc_004BAFC1: mov [edx+00000008h], eax
  loc_004BAFC4: mov eax, var_54
  loc_004BAFC7: mov [edx+0000000Ch], eax
  loc_004BAFCA: mov edx, var_18
  loc_004BAFCD: push edx
  loc_004BAFCE: call [ecx+00000030h]
  loc_004BAFD1: test eax, eax
  loc_004BAFD3: fnclex
  loc_004BAFD5: jge 004BAFECh
  loc_004BAFD7: mov ecx, var_8C
  loc_004BAFDD: push 00000030h
  loc_004BAFDF: push 0041EA14h ; "S"
  loc_004BAFE4: push ecx
  loc_004BAFE5: push eax
  loc_004BAFE6: call [00401074h] ; __vbaHresultCheckObj
  loc_004BAFEC: mov eax, var_1C
  loc_004BAFEF: lea edx, var_30
  loc_004BAFF2: mov var_28, eax
  loc_004BAFF5: lea eax, var_40
  loc_004BAFF8: push edx
  loc_004BAFF9: push eax
  loc_004BAFFA: mov var_1C, 00000000h
  loc_004BB001: mov var_30, 00000009h
  loc_004BB008: call [004010D4h] ; rtcTrimVar
  loc_004BB00E: lea ecx, var_40
  loc_004BB011: push ecx
  loc_004BB012: call [00401028h] ; __vbaStrVarMove
  loc_004BB018: sub esp, 00000010h
  loc_004BB01B: mov ecx, 00000008h
  loc_004BB020: mov edx, esp
  loc_004BB022: mov var_50, ecx
  loc_004BB025: mov var_48, eax
  loc_004BB028: push 00000000h
  loc_004BB02A: mov [edx], ecx
  loc_004BB02C: mov ecx, var_4C
  loc_004BB02F: push esi
  loc_004BB030: mov [edx+00000004h], ecx
  loc_004BB033: mov ecx, [esi]
  loc_004BB035: mov [edx+00000008h], eax
  loc_004BB038: mov eax, var_44
  loc_004BB03B: mov [edx+0000000Ch], eax
  loc_004BB03E: call [ecx+0000030Ch]
  loc_004BB044: lea edx, var_20
  loc_004BB047: push eax
  loc_004BB048: push edx
  loc_004BB049: call edi
  loc_004BB04B: push eax
  loc_004BB04C: call ebx
  loc_004BB04E: lea eax, var_20
  loc_004BB051: lea ecx, var_18
  loc_004BB054: push eax
  loc_004BB055: push ecx
  loc_004BB056: push 00000002h
  loc_004BB058: call [00401040h] ; __vbaFreeObjList
  loc_004BB05E: lea edx, var_50
  loc_004BB061: lea eax, var_40
  loc_004BB064: push edx
  loc_004BB065: lea ecx, var_30
  loc_004BB068: push eax
  loc_004BB069: push ecx
  loc_004BB06A: push 00000003h
  loc_004BB06C: call [00401038h] ; __vbaFreeVarList
  loc_004BB072: mov edx, [esi+0000003Ch]
  loc_004BB075: add esp, 0000001Ch
  loc_004BB078: push edx
  loc_004BB079: call [004011D8h] ; __vbaR8Str
  loc_004BB07F: fadd st0, real8 ptr [004015F8h]
  loc_004BB085: sub esp, 00000008h
  loc_004BB088: fnstsw ax
  loc_004BB08A: test al, 0Dh
  loc_004BB08C: jnz 004BB227h
  loc_004BB092: fstp real8 ptr [esp]
  loc_004BB095: call [00401144h] ; __vbaStrR8
  loc_004BB09B: mov edx, eax
  loc_004BB09D: lea ecx, var_14
  loc_004BB0A0: call [00401270h] ; __vbaStrMove
  loc_004BB0A6: mov edx, eax
  loc_004BB0A8: lea ecx, [esi+0000003Ch]
  loc_004BB0AB: call [004011ECh] ; __vbaStrCopy
  loc_004BB0B1: lea ecx, var_14
  loc_004BB0B4: call [004012ACh] ; __vbaFreeStr
  loc_004BB0BA: mov eax, [esi]
  loc_004BB0BC: push 00000000h
  loc_004BB0BE: push 00000004h
  loc_004BB0C0: push esi
  loc_004BB0C1: call [eax+0000030Ch]
  loc_004BB0C7: lea ecx, var_18
  loc_004BB0CA: push eax
  loc_004BB0CB: push ecx
  loc_004BB0CC: call edi
  loc_004BB0CE: lea edx, var_30
  loc_004BB0D1: push eax
  loc_004BB0D2: push edx
  loc_004BB0D3: call [00401140h] ; __vbaLateIdCallLd
  loc_004BB0D9: add esp, 00000010h
  loc_004BB0DC: push eax
  loc_004BB0DD: call [0040121Ch] ; __vbaI4Var
  loc_004BB0E3: add eax, 00000001h
  loc_004BB0E6: mov ecx, 00000003h
  loc_004BB0EB: jo 004BB22Ch
  loc_004BB0F1: sub esp, 00000010h
  loc_004BB0F4: mov var_60, ecx
  loc_004BB0F7: mov edx, esp
  loc_004BB0F9: mov var_58, eax
  loc_004BB0FC: push 00000004h
  loc_004BB0FE: push esi
  loc_004BB0FF: mov [edx], ecx
  loc_004BB101: mov ecx, var_5C
  loc_004BB104: mov [edx+00000004h], ecx
  loc_004BB107: mov ecx, [esi]
  loc_004BB109: mov [edx+00000008h], eax
  loc_004BB10C: mov eax, var_54
  loc_004BB10F: mov [edx+0000000Ch], eax
  loc_004BB112: call [ecx+0000030Ch]
  loc_004BB118: lea edx, var_1C
  loc_004BB11B: push eax
  loc_004BB11C: push edx
  loc_004BB11D: call edi
  loc_004BB11F: push eax
  loc_004BB120: call ebx
  loc_004BB122: lea eax, var_1C
  loc_004BB125: lea ecx, var_18
  loc_004BB128: push eax
  loc_004BB129: push ecx
  loc_004BB12A: push 00000002h
  loc_004BB12C: call [00401040h] ; __vbaFreeObjList
  loc_004BB132: add esp, 0000000Ch
  loc_004BB135: lea ecx, var_30
  loc_004BB138: call [00401020h] ; __vbaFreeVar
  loc_004BB13E: mov edx, var_C4
  loc_004BB144: mov eax, [edx]
  loc_004BB146: push eax
  loc_004BB147: mov ecx, [eax]
  loc_004BB149: call [ecx+000000ECh]
  loc_004BB14F: test eax, eax
  loc_004BB151: fnclex
  loc_004BB153: jge 004BAC9Eh
  loc_004BB159: mov edx, var_C4
  loc_004BB15F: push 000000ECh
  loc_004BB164: push 0041E938h
  loc_004BB169: mov ecx, [edx]
  loc_004BB16B: push ecx
  loc_004BB16C: push eax
  loc_004BB16D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB173: jmp 004BAC9Eh
  loc_004BB178: mov esi, var_C4
  loc_004BB17E: mov eax, [esi]
  loc_004BB180: push eax
  loc_004BB181: mov edx, [eax]
  loc_004BB183: call [edx+000000C4h]
  loc_004BB189: test eax, eax
  loc_004BB18B: fnclex
  loc_004BB18D: jge 004BB1A3h
  loc_004BB18F: mov ecx, [esi]
  loc_004BB191: push 000000C4h
  loc_004BB196: push 0041E938h
  loc_004BB19B: push ecx
  loc_004BB19C: push eax
  loc_004BB19D: call [00401074h] ; __vbaHresultCheckObj
  loc_004BB1A3: push 0041E938h
  loc_004BB1A8: push 00000000h
  loc_004BB1AA: call [00401274h] ; __vbaCastObj
  loc_004BB1B0: lea edx, var_18
  loc_004BB1B3: push eax
  loc_004BB1B4: push edx
  loc_004BB1B5: call edi
  loc_004BB1B7: push eax
  loc_004BB1B8: push esi
  loc_004BB1B9: call [004010B8h] ; __vbaObjSetAddref
  loc_004BB1BF: lea ecx, var_18
  loc_004BB1C2: call [004012B0h] ; __vbaFreeObj
  loc_004BB1C8: fwait
  loc_004BB1C9: push 004BB212h
  loc_004BB1CE: jmp 004BB205h
  loc_004BB1D0: lea ecx, var_14
  loc_004BB1D3: call [004012ACh] ; __vbaFreeStr
  loc_004BB1D9: lea eax, var_20
  loc_004BB1DC: lea ecx, var_1C
  loc_004BB1DF: push eax
  loc_004BB1E0: lea edx, var_18
  loc_004BB1E3: push ecx
  loc_004BB1E4: push edx
  loc_004BB1E5: push 00000003h
  loc_004BB1E7: call [00401040h] ; __vbaFreeObjList
  loc_004BB1ED: lea eax, var_50
  loc_004BB1F0: lea ecx, var_40
  loc_004BB1F3: push eax
  loc_004BB1F4: lea edx, var_30
  loc_004BB1F7: push ecx
  loc_004BB1F8: push edx
  loc_004BB1F9: push 00000003h
  loc_004BB1FB: call [00401038h] ; __vbaFreeVarList
  loc_004BB201: add esp, 00000020h
  loc_004BB204: ret
  loc_004BB205: lea ecx, var_A8
  loc_004BB20B: call [00401020h] ; __vbaFreeVar
  loc_004BB211: ret
  loc_004BB212: mov ecx, var_10
  loc_004BB215: pop edi
  loc_004BB216: pop esi
  loc_004BB217: xor eax, eax
  loc_004BB219: mov fs:[00000000h], ecx
  loc_004BB220: pop ebx
  loc_004BB221: mov esp, ebp
  loc_004BB223: pop ebp
  loc_004BB224: retn 0004h
End Sub
