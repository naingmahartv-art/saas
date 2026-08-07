VERSION 5.00
Begin VB.Form frmLimit
  Caption = "Limit"
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ControlBox = 0   'False
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 2820
  ClientHeight = 1290
  StartUpPosition = 2 'CenterScreen
  Begin VB.TextBox txtlimit
    Left = 1170
    Top = 210
    Width = 1425
    Height = 360
    TabIndex = 2
    MaxLength = 8
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
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 1800
    Top = 780
    Width = 825
    Height = 375
    TabIndex = 1
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 960
    Top = 780
    Width = 825
    Height = 375
    TabIndex = 0
  End
  Begin VB.Label Label1
    Caption = "Limit Amount"
    Left = 210
    Top = 300
    Width = 1125
    Height = 225
    TabIndex = 3
  End
End

Attribute VB_Name = "frmLimit"


Private Sub cmdSave_Click() '60A270
  loc_0060A270: push ebp
  loc_0060A271: mov ebp, esp
  loc_0060A273: sub esp, 0000000Ch
  loc_0060A276: push 00403B36h ; __vbaExceptHandler
  loc_0060A27B: mov eax, fs:[00000000h]
  loc_0060A281: push eax
  loc_0060A282: mov fs:[00000000h], esp
  loc_0060A289: sub esp, 000000ACh
  loc_0060A28F: push ebx
  loc_0060A290: push esi
  loc_0060A291: push edi
  loc_0060A292: mov var_C, esp
  loc_0060A295: mov var_8, 00403768h
  loc_0060A29C: mov esi, Me
  loc_0060A29F: mov eax, esi
  loc_0060A2A1: and eax, 00000001h
  loc_0060A2A4: mov var_4, eax
  loc_0060A2A7: and esi, FFFFFFFEh
  loc_0060A2AA: push esi
  loc_0060A2AB: mov Me, esi
  loc_0060A2AE: mov ecx, [esi]
  loc_0060A2B0: call [ecx+00000004h]
  loc_0060A2B3: mov edx, [esi]
  loc_0060A2B5: xor ebx, ebx
  loc_0060A2B7: push esi
  loc_0060A2B8: mov var_18, ebx
  loc_0060A2BB: mov var_1C, ebx
  loc_0060A2BE: mov var_20, ebx
  loc_0060A2C1: mov var_30, ebx
  loc_0060A2C4: mov var_40, ebx
  loc_0060A2C7: mov var_50, ebx
  loc_0060A2CA: mov var_60, ebx
  loc_0060A2CD: mov var_70, ebx
  loc_0060A2D0: mov var_80, ebx
  loc_0060A2D3: mov var_90, ebx
  loc_0060A2D9: call [edx+000002FCh]
  loc_0060A2DF: push eax
  loc_0060A2E0: lea eax, var_20
  loc_0060A2E3: push eax
  loc_0060A2E4: call [004010A0h] ; __vbaObjSet
  loc_0060A2EA: mov edi, eax
  loc_0060A2EC: lea edx, var_1C
  loc_0060A2EF: push edx
  loc_0060A2F0: push edi
  loc_0060A2F1: mov ecx, [edi]
  loc_0060A2F3: call [ecx+000000A0h]
  loc_0060A2F9: cmp eax, ebx
  loc_0060A2FB: fnclex
  loc_0060A2FD: jge 0060A311h
  loc_0060A2FF: push 000000A0h
  loc_0060A304: push 0041E5E8h
  loc_0060A309: push edi
  loc_0060A30A: push eax
  loc_0060A30B: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A311: mov eax, var_1C
  loc_0060A314: lea ecx, var_40
  loc_0060A317: mov var_28, eax
  loc_0060A31A: lea eax, var_30
  loc_0060A31D: push eax
  loc_0060A31E: push ecx
  loc_0060A31F: mov var_1C, ebx
  loc_0060A322: mov var_30, 00000008h
  loc_0060A329: call [004010D4h] ; rtcTrimVar
  loc_0060A32F: lea edx, var_40
  loc_0060A332: lea eax, var_70
  loc_0060A335: push edx
  loc_0060A336: push eax
  loc_0060A337: mov var_68, 0041E5D4h
  loc_0060A33E: mov var_70, 00008008h
  loc_0060A345: call [00401218h] ; __vbaVarTstNe
  loc_0060A34B: lea ecx, var_20
  loc_0060A34E: mov di, ax
  loc_0060A351: call [004012B0h] ; __vbaFreeObj
  loc_0060A357: lea ecx, var_40
  loc_0060A35A: lea edx, var_30
  loc_0060A35D: push ecx
  loc_0060A35E: push edx
  loc_0060A35F: push 00000002h
  loc_0060A361: call [00401038h] ; __vbaFreeVarList
  loc_0060A367: add esp, 0000000Ch
  loc_0060A36A: cmp di, bx
  loc_0060A36D: jz 0060A70Eh
  loc_0060A373: mov eax, [esi]
  loc_0060A375: push esi
  loc_0060A376: call [eax+000002FCh]
  loc_0060A37C: lea ecx, var_20
  loc_0060A37F: push eax
  loc_0060A380: push ecx
  loc_0060A381: call [004010A0h] ; __vbaObjSet
  loc_0060A387: mov esi, eax
  loc_0060A389: lea eax, var_1C
  loc_0060A38C: push eax
  loc_0060A38D: push esi
  loc_0060A38E: mov edx, [esi]
  loc_0060A390: call [edx+000000A0h]
  loc_0060A396: cmp eax, ebx
  loc_0060A398: fnclex
  loc_0060A39A: jge 0060A3AEh
  loc_0060A39C: push 000000A0h
  loc_0060A3A1: push 0041E5E8h
  loc_0060A3A6: push esi
  loc_0060A3A7: push eax
  loc_0060A3A8: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A3AE: mov eax, var_1C
  loc_0060A3B1: lea ecx, var_30
  loc_0060A3B4: mov edi, 00000008h
  loc_0060A3B9: push ecx
  loc_0060A3BA: mov var_1C, ebx
  loc_0060A3BD: mov var_28, eax
  loc_0060A3C0: mov var_30, edi
  loc_0060A3C3: call [0040111Ch] ; rtcIsNumeric
  loc_0060A3C9: lea ecx, var_20
  loc_0060A3CC: mov si, ax
  loc_0060A3CF: call [004012B0h] ; __vbaFreeObj
  loc_0060A3D5: lea ecx, var_30
  loc_0060A3D8: call [00401020h] ; __vbaFreeVar
  loc_0060A3DE: cmp si, bx
  loc_0060A3E1: mov eax, 80020004h
  loc_0060A3E6: jz 0060A6AEh
  loc_0060A3EC: sub esp, 00000010h
  loc_0060A3EF: mov edx, [0061A13Ch]
  loc_0060A3F5: mov edi, esp
  loc_0060A3F7: mov ecx, 0000000Ah
  loc_0060A3FC: mov var_70, ecx
  loc_0060A3FF: mov var_68, eax
  loc_0060A402: mov esi, [edx]
  loc_0060A404: mov [edi], ecx
  loc_0060A406: mov ecx, var_6C
  loc_0060A409: push 004335C0h ; "Delete * From Limit"
  loc_0060A40E: mov [edi+00000004h], ecx
  loc_0060A411: push edx
  loc_0060A412: mov [edi+00000008h], eax
  loc_0060A415: mov eax, var_64
  loc_0060A418: mov [edi+0000000Ch], eax
  loc_0060A41B: call [esi+0000005Ch]
  loc_0060A41E: cmp eax, ebx
  loc_0060A420: fnclex
  loc_0060A422: jge 0060A439h
  loc_0060A424: mov ecx, [0061A13Ch]
  loc_0060A42A: push 0000005Ch
  loc_0060A42C: push 0041E928h
  loc_0060A431: push ecx
  loc_0060A432: push eax
  loc_0060A433: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A439: lea ebx, var_20
  loc_0060A43C: mov ecx, 0000000Ah
  loc_0060A441: push ebx
  loc_0060A442: mov esi, ecx
  loc_0060A444: sub esp, 00000010h
  loc_0060A447: mov eax, 80020004h
  loc_0060A44C: mov ebx, esp
  loc_0060A44E: sub esp, 00000010h
  loc_0060A451: mov edx, eax
  loc_0060A453: mov var_70, 00000003h
  loc_0060A45A: mov [ebx], ecx
  loc_0060A45C: mov ecx, var_8C
  loc_0060A462: mov edi, [0061A13Ch]
  loc_0060A468: mov var_68, 00000002h
  loc_0060A46F: mov [ebx+00000004h], ecx
  loc_0060A472: mov ecx, esp
  loc_0060A474: sub esp, 00000010h
  loc_0060A477: mov edi, [edi]
  loc_0060A479: mov [ebx+00000008h], eax
  loc_0060A47C: mov eax, var_84
  loc_0060A482: mov [ebx+0000000Ch], eax
  loc_0060A485: mov eax, var_7C
  loc_0060A488: mov [ecx], esi
  loc_0060A48A: mov [ecx+00000004h], eax
  loc_0060A48D: mov eax, esp
  loc_0060A48F: push 004265C4h ; "Limit"
  loc_0060A494: mov [ecx+00000008h], edx
  loc_0060A497: mov edx, var_74
  loc_0060A49A: mov [ecx+0000000Ch], edx
  loc_0060A49D: mov ecx, var_70
  loc_0060A4A0: mov edx, var_6C
  loc_0060A4A3: mov [eax], ecx
  loc_0060A4A5: mov ecx, var_68
  loc_0060A4A8: mov [eax+00000004h], edx
  loc_0060A4AB: mov edx, var_64
  loc_0060A4AE: mov [eax+00000008h], ecx
  loc_0060A4B1: mov [eax+0000000Ch], edx
  loc_0060A4B4: mov eax, [0061A13Ch]
  loc_0060A4B9: push eax
  loc_0060A4BA: call [edi+000000BCh]
  loc_0060A4C0: test eax, eax
  loc_0060A4C2: fnclex
  loc_0060A4C4: jge 0060A4E2h
  loc_0060A4C6: mov ecx, [0061A13Ch]
  loc_0060A4CC: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0060A4D2: push 000000BCh
  loc_0060A4D7: push 0041E928h
  loc_0060A4DC: push ecx
  loc_0060A4DD: push eax
  loc_0060A4DE: call edi
  loc_0060A4E0: jmp 0060A4E8h
  loc_0060A4E2: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_0060A4E8: mov eax, var_20
  loc_0060A4EB: mov esi, [004010A0h] ; __vbaObjSet
  loc_0060A4F1: lea edx, var_18
  loc_0060A4F4: push eax
  loc_0060A4F5: push edx
  loc_0060A4F6: mov var_20, 00000000h
  loc_0060A4FD: call __vbaObjSet
  loc_0060A4FF: mov eax, var_18
  loc_0060A502: push eax
  loc_0060A503: mov ecx, [eax]
  loc_0060A505: call [ecx+000000C0h]
  loc_0060A50B: test eax, eax
  loc_0060A50D: fnclex
  loc_0060A50F: jge 0060A522h
  loc_0060A511: mov edx, var_18
  loc_0060A514: push 000000C0h
  loc_0060A519: push 0041E938h
  loc_0060A51E: push edx
  loc_0060A51F: push eax
  loc_0060A520: call edi
  loc_0060A522: mov eax, Me
  loc_0060A525: push eax
  loc_0060A526: mov ecx, [eax]
  loc_0060A528: call [ecx+000002FCh]
  loc_0060A52E: lea edx, var_20
  loc_0060A531: push eax
  loc_0060A532: push edx
  loc_0060A533: call __vbaObjSet
  loc_0060A535: mov esi, eax
  loc_0060A537: lea ecx, var_1C
  loc_0060A53A: push ecx
  loc_0060A53B: push esi
  loc_0060A53C: mov eax, [esi]
  loc_0060A53E: call [eax+000000A0h]
  loc_0060A544: test eax, eax
  loc_0060A546: fnclex
  loc_0060A548: jge 0060A558h
  loc_0060A54A: push 000000A0h
  loc_0060A54F: push 0041E5E8h
  loc_0060A554: push esi
  loc_0060A555: push eax
  loc_0060A556: call edi
  loc_0060A558: mov edx, var_1C
  loc_0060A55B: push edx
  loc_0060A55C: call [004011F4h] ; __vbaI4Str
  loc_0060A562: sub esp, 00000010h
  loc_0060A565: mov ecx, 00000003h
  loc_0060A56A: mov ebx, esp
  loc_0060A56C: sub esp, 00000010h
  loc_0060A56F: mov edi, var_18
  loc_0060A572: mov esi, 00000008h
  loc_0060A577: mov [ebx], ecx
  loc_0060A579: mov ecx, var_7C
  loc_0060A57C: mov edx, 004265C4h ; "Limit"
  loc_0060A581: mov var_70, esi
  loc_0060A584: mov [ebx+00000004h], ecx
  loc_0060A587: mov ecx, esp
  loc_0060A589: mov var_68, edx
  loc_0060A58C: mov edi, [edi]
  loc_0060A58E: mov [ebx+00000008h], eax
  loc_0060A591: mov eax, var_74
  loc_0060A594: mov [ebx+0000000Ch], eax
  loc_0060A597: mov eax, var_6C
  loc_0060A59A: mov [ecx], esi
  loc_0060A59C: mov [ecx+00000004h], eax
  loc_0060A59F: mov eax, var_18
  loc_0060A5A2: push eax
  loc_0060A5A3: mov [ecx+00000008h], edx
  loc_0060A5A6: mov edx, var_64
  loc_0060A5A9: mov [ecx+0000000Ch], edx
  loc_0060A5AC: call [edi+00000128h]
  loc_0060A5B2: xor ebx, ebx
  loc_0060A5B4: cmp eax, ebx
  loc_0060A5B6: fnclex
  loc_0060A5B8: jge 0060A5D3h
  loc_0060A5BA: mov ecx, var_18
  loc_0060A5BD: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_0060A5C3: push 00000128h
  loc_0060A5C8: push 0041E938h
  loc_0060A5CD: push ecx
  loc_0060A5CE: push eax
  loc_0060A5CF: call __vbaHresultCheckObj
  loc_0060A5D1: jmp 0060A5D9h
  loc_0060A5D3: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_0060A5D9: lea ecx, var_1C
  loc_0060A5DC: call [004012ACh] ; __vbaFreeStr
  loc_0060A5E2: lea ecx, var_20
  loc_0060A5E5: call [004012B0h] ; __vbaFreeObj
  loc_0060A5EB: mov eax, var_18
  loc_0060A5EE: push ebx
  loc_0060A5EF: push 00000001h
  loc_0060A5F1: push eax
  loc_0060A5F2: mov edx, [eax]
  loc_0060A5F4: call [edx+00000164h]
  loc_0060A5FA: cmp eax, ebx
  loc_0060A5FC: fnclex
  loc_0060A5FE: jge 0060A611h
  loc_0060A600: mov ecx, var_18
  loc_0060A603: push 00000164h
  loc_0060A608: push 0041E938h
  loc_0060A60D: push ecx
  loc_0060A60E: push eax
  loc_0060A60F: call __vbaHresultCheckObj
  loc_0060A611: mov eax, var_18
  loc_0060A614: push eax
  loc_0060A615: mov edx, [eax]
  loc_0060A617: call [edx+000000C4h]
  loc_0060A61D: cmp eax, ebx
  loc_0060A61F: fnclex
  loc_0060A621: jge 0060A634h
  loc_0060A623: mov ecx, var_18
  loc_0060A626: push 000000C4h
  loc_0060A62B: push 0041E938h
  loc_0060A630: push ecx
  loc_0060A631: push eax
  loc_0060A632: call __vbaHresultCheckObj
  loc_0060A634: push 0041E938h
  loc_0060A639: push ebx
  loc_0060A63A: call [00401274h] ; __vbaCastObj
  loc_0060A640: lea edx, var_18
  loc_0060A643: push eax
  loc_0060A644: push edx
  loc_0060A645: call [004010A0h] ; __vbaObjSet
  loc_0060A64B: mov edx, 004328B0h ; "Change"
  loc_0060A650: mov ecx, 0061A038h
  loc_0060A655: call [004011ECh] ; __vbaStrCopy
  loc_0060A65B: cmp [0061B394h], ebx
  loc_0060A661: jnz 0060A673h
  loc_0060A663: push 0061B394h
  loc_0060A668: push 0041E4A0h
  loc_0060A66D: call [004011DCh] ; __vbaNew2
  loc_0060A673: mov eax, Me
  loc_0060A676: mov esi, [0061B394h]
  loc_0060A67C: lea ecx, var_20
  loc_0060A67F: push eax
  loc_0060A680: mov edi, [esi]
  loc_0060A682: push ecx
  loc_0060A683: call [004010B8h] ; __vbaObjSetAddref
  loc_0060A689: push eax
  loc_0060A68A: push esi
  loc_0060A68B: call [edi+00000010h]
  loc_0060A68E: cmp eax, ebx
  loc_0060A690: fnclex
  loc_0060A692: jge 0060A6A3h
  loc_0060A694: push 00000010h
  loc_0060A696: push 0041E490h
  loc_0060A69B: push esi
  loc_0060A69C: push eax
  loc_0060A69D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A6A3: lea ecx, var_20
  loc_0060A6A6: call [004012B0h] ; __vbaFreeObj
  loc_0060A6AC: jmp 0060A70Eh
  loc_0060A6AE: mov ecx, 0000000Ah
  loc_0060A6B3: lea edx, var_70
  loc_0060A6B6: mov var_60, ecx
  loc_0060A6B9: mov var_50, ecx
  loc_0060A6BC: mov var_40, ecx
  loc_0060A6BF: lea ecx, var_30
  loc_0060A6C2: mov var_58, eax
  loc_0060A6C5: mov var_48, eax
  loc_0060A6C8: mov var_38, eax
  loc_0060A6CB: mov var_68, 00432A7Ch ; "Invalid!!"
  loc_0060A6D2: mov var_70, edi
  loc_0060A6D5: call [00401240h] ; __vbaVarDup
  loc_0060A6DB: lea edx, var_60
  loc_0060A6DE: lea eax, var_50
  loc_0060A6E1: push edx
  loc_0060A6E2: lea ecx, var_40
  loc_0060A6E5: push eax
  loc_0060A6E6: push ecx
  loc_0060A6E7: lea edx, var_30
  loc_0060A6EA: push 00000040h
  loc_0060A6EC: push edx
  loc_0060A6ED: call [004010A4h] ; rtcMsgBox
  loc_0060A6F3: lea eax, var_60
  loc_0060A6F6: lea ecx, var_50
  loc_0060A6F9: push eax
  loc_0060A6FA: lea edx, var_40
  loc_0060A6FD: push ecx
  loc_0060A6FE: lea eax, var_30
  loc_0060A701: push edx
  loc_0060A702: push eax
  loc_0060A703: push 00000004h
  loc_0060A705: call [00401038h] ; __vbaFreeVarList
  loc_0060A70B: add esp, 00000014h
  loc_0060A70E: mov var_4, ebx
  loc_0060A711: push 0060A750h
  loc_0060A716: jmp 0060A746h
  loc_0060A718: lea ecx, var_1C
  loc_0060A71B: call [004012ACh] ; __vbaFreeStr
  loc_0060A721: lea ecx, var_20
  loc_0060A724: call [004012B0h] ; __vbaFreeObj
  loc_0060A72A: lea ecx, var_60
  loc_0060A72D: lea edx, var_50
  loc_0060A730: push ecx
  loc_0060A731: lea eax, var_40
  loc_0060A734: push edx
  loc_0060A735: lea ecx, var_30
  loc_0060A738: push eax
  loc_0060A739: push ecx
  loc_0060A73A: push 00000004h
  loc_0060A73C: call [00401038h] ; __vbaFreeVarList
  loc_0060A742: add esp, 00000014h
  loc_0060A745: ret
  loc_0060A746: lea ecx, var_18
  loc_0060A749: call [004012B0h] ; __vbaFreeObj
  loc_0060A74F: ret
  loc_0060A750: mov eax, Me
  loc_0060A753: push eax
  loc_0060A754: mov edx, [eax]
  loc_0060A756: call [edx+00000008h]
  loc_0060A759: mov eax, var_4
  loc_0060A75C: mov ecx, var_14
  loc_0060A75F: pop edi
  loc_0060A760: pop esi
  loc_0060A761: mov fs:[00000000h], ecx
  loc_0060A768: pop ebx
  loc_0060A769: mov esp, ebp
  loc_0060A76B: pop ebp
  loc_0060A76C: retn 0004h
End Sub

Private Sub cmdCancel_Click() '60A190
  loc_0060A190: push ebp
  loc_0060A191: mov ebp, esp
  loc_0060A193: sub esp, 0000000Ch
  loc_0060A196: push 00403B36h ; __vbaExceptHandler
  loc_0060A19B: mov eax, fs:[00000000h]
  loc_0060A1A1: push eax
  loc_0060A1A2: mov fs:[00000000h], esp
  loc_0060A1A9: sub esp, 00000018h
  loc_0060A1AC: push ebx
  loc_0060A1AD: push esi
  loc_0060A1AE: push edi
  loc_0060A1AF: mov var_C, esp
  loc_0060A1B2: mov var_8, 00403758h
  loc_0060A1B9: mov edi, Me
  loc_0060A1BC: mov eax, edi
  loc_0060A1BE: and eax, 00000001h
  loc_0060A1C1: mov var_4, eax
  loc_0060A1C4: and edi, FFFFFFFEh
  loc_0060A1C7: push edi
  loc_0060A1C8: mov Me, edi
  loc_0060A1CB: mov ecx, [edi]
  loc_0060A1CD: call [ecx+00000004h]
  loc_0060A1D0: xor ebx, ebx
  loc_0060A1D2: mov edx, 0041E5D4h
  loc_0060A1D7: mov ecx, 0061A038h
  loc_0060A1DC: mov var_18, ebx
  loc_0060A1DF: call [004011ECh] ; __vbaStrCopy
  loc_0060A1E5: cmp [0061B394h], ebx
  loc_0060A1EB: jnz 0060A1FDh
  loc_0060A1ED: push 0061B394h
  loc_0060A1F2: push 0041E4A0h
  loc_0060A1F7: call [004011DCh] ; __vbaNew2
  loc_0060A1FD: mov esi, [0061B394h]
  loc_0060A203: lea eax, var_18
  loc_0060A206: push edi
  loc_0060A207: push eax
  loc_0060A208: mov edx, [esi]
  loc_0060A20A: mov var_2C, edx
  loc_0060A20D: call [004010B8h] ; __vbaObjSetAddref
  loc_0060A213: mov ecx, var_2C
  loc_0060A216: push eax
  loc_0060A217: push esi
  loc_0060A218: call [ecx+00000010h]
  loc_0060A21B: cmp eax, ebx
  loc_0060A21D: fnclex
  loc_0060A21F: jge 0060A230h
  loc_0060A221: push 00000010h
  loc_0060A223: push 0041E490h
  loc_0060A228: push esi
  loc_0060A229: push eax
  loc_0060A22A: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A230: lea ecx, var_18
  loc_0060A233: call [004012B0h] ; __vbaFreeObj
  loc_0060A239: mov var_4, ebx
  loc_0060A23C: push 0060A24Eh
  loc_0060A241: jmp 0060A24Dh
  loc_0060A243: lea ecx, var_18
  loc_0060A246: call [004012B0h] ; __vbaFreeObj
  loc_0060A24C: ret
  loc_0060A24D: ret
  loc_0060A24E: mov eax, Me
  loc_0060A251: push eax
  loc_0060A252: mov edx, [eax]
  loc_0060A254: call [edx+00000008h]
  loc_0060A257: mov eax, var_4
  loc_0060A25A: mov ecx, var_14
  loc_0060A25D: pop edi
  loc_0060A25E: pop esi
  loc_0060A25F: mov fs:[00000000h], ecx
  loc_0060A266: pop ebx
  loc_0060A267: mov esp, ebp
  loc_0060A269: pop ebp
  loc_0060A26A: retn 0004h
End Sub

Private Sub txtlimit_KeyPress(KeyAscii As Integer) '60AAF0
  loc_0060AAF0: push ebp
  loc_0060AAF1: mov ebp, esp
  loc_0060AAF3: sub esp, 0000000Ch
  loc_0060AAF6: push 00403B36h ; __vbaExceptHandler
  loc_0060AAFB: mov eax, fs:[00000000h]
  loc_0060AB01: push eax
  loc_0060AB02: mov fs:[00000000h], esp
  loc_0060AB09: sub esp, 000000A8h
  loc_0060AB0F: push ebx
  loc_0060AB10: push esi
  loc_0060AB11: push edi
  loc_0060AB12: mov var_C, esp
  loc_0060AB15: mov var_8, 00403788h
  loc_0060AB1C: mov edi, Me
  loc_0060AB1F: mov eax, edi
  loc_0060AB21: and eax, 00000001h
  loc_0060AB24: mov var_4, eax
  loc_0060AB27: and edi, FFFFFFFEh
  loc_0060AB2A: push edi
  loc_0060AB2B: mov Me, edi
  loc_0060AB2E: mov ecx, [edi]
  loc_0060AB30: call [ecx+00000004h]
  loc_0060AB33: xor esi, esi
  loc_0060AB35: mov edx, 004337A4h ; "0123456789"
  loc_0060AB3A: lea ecx, var_18
  loc_0060AB3D: mov var_18, esi
  loc_0060AB40: mov var_1C, esi
  loc_0060AB43: mov var_2C, esi
  loc_0060AB46: mov var_3C, esi
  loc_0060AB49: mov var_4C, esi
  loc_0060AB4C: mov var_5C, esi
  loc_0060AB4F: mov var_6C, esi
  loc_0060AB52: mov var_7C, esi
  loc_0060AB55: mov var_8C, esi
  loc_0060AB5B: mov var_9C, esi
  loc_0060AB61: mov var_AC, esi
  loc_0060AB67: call [004011ECh] ; __vbaStrCopy
  loc_0060AB6D: mov ebx, KeyAscii
  loc_0060AB70: mov edx, var_18
  loc_0060AB73: lea ecx, var_2C
  loc_0060AB76: mov var_74, edx
  loc_0060AB79: movsx eax, [ebx]
  loc_0060AB7C: push eax
  loc_0060AB7D: push ecx
  loc_0060AB7E: mov var_7C, 00000008h
  loc_0060AB85: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_0060AB8B: mov ax, [ebx]
  loc_0060AB8E: xor edx, edx
  loc_0060AB90: cmp ax, 000Dh
  loc_0060AB94: mov ecx, 0000000Bh
  loc_0060AB99: setz dl
  loc_0060AB9C: neg edx
  loc_0060AB9E: mov var_94, dx
  loc_0060ABA5: xor edx, edx
  loc_0060ABA7: cmp ax, 0008h
  loc_0060ABAB: mov var_9C, ecx
  loc_0060ABB1: setz dl
  loc_0060ABB4: neg edx
  loc_0060ABB6: mov var_AC, ecx
  loc_0060ABBC: lea eax, var_7C
  loc_0060ABBF: push 00000001h
  loc_0060ABC1: lea ecx, var_2C
  loc_0060ABC4: mov var_A4, dx
  loc_0060ABCB: push eax
  loc_0060ABCC: push ecx
  loc_0060ABCD: lea edx, var_3C
  loc_0060ABD0: push esi
  loc_0060ABD1: push edx
  loc_0060ABD2: mov var_84, esi
  loc_0060ABD8: mov var_8C, 00008002h
  loc_0060ABE2: call [004011A8h] ; __vbaInStrVar
  loc_0060ABE8: push eax
  loc_0060ABE9: lea eax, var_8C
  loc_0060ABEF: lea ecx, var_4C
  loc_0060ABF2: push eax
  loc_0060ABF3: push ecx
  loc_0060ABF4: call [00401050h] ; __vbaVarCmpNe
  loc_0060ABFA: push eax
  loc_0060ABFB: lea edx, var_9C
  loc_0060AC01: lea eax, var_5C
  loc_0060AC04: push edx
  loc_0060AC05: push eax
  loc_0060AC06: call [0040112Ch] ; __vbaVarOr
  loc_0060AC0C: lea ecx, var_AC
  loc_0060AC12: push eax
  loc_0060AC13: lea edx, var_6C
  loc_0060AC16: push ecx
  loc_0060AC17: push edx
  loc_0060AC18: call [0040112Ch] ; __vbaVarOr
  loc_0060AC1E: push eax
  loc_0060AC1F: call [004010E0h] ; __vbaBoolVarNull
  loc_0060AC25: mov var_B0, ax
  loc_0060AC2C: lea eax, var_AC
  loc_0060AC32: lea ecx, var_9C
  loc_0060AC38: push eax
  loc_0060AC39: lea edx, var_3C
  loc_0060AC3C: push ecx
  loc_0060AC3D: lea eax, var_2C
  loc_0060AC40: push edx
  loc_0060AC41: push eax
  loc_0060AC42: push 00000004h
  loc_0060AC44: call [00401038h] ; __vbaFreeVarList
  loc_0060AC4A: add esp, 00000014h
  loc_0060AC4D: cmp var_B0, si
  loc_0060AC54: jz 0060ACA4h
  loc_0060AC56: mov ax, [ebx]
  loc_0060AC59: cmp ax, 000Dh
  loc_0060AC5D: mov [ebx], ax
  loc_0060AC60: jnz 0060ACA7h
  loc_0060AC62: mov ecx, [edi]
  loc_0060AC64: push edi
  loc_0060AC65: call [ecx+00000304h]
  loc_0060AC6B: lea edx, var_1C
  loc_0060AC6E: push eax
  loc_0060AC6F: push edx
  loc_0060AC70: call [004010A0h] ; __vbaObjSet
  loc_0060AC76: mov edi, eax
  loc_0060AC78: push edi
  loc_0060AC79: mov eax, [edi]
  loc_0060AC7B: call [eax+000001A4h]
  loc_0060AC81: cmp eax, esi
  loc_0060AC83: fnclex
  loc_0060AC85: jge 0060AC99h
  loc_0060AC87: push 000001A4h
  loc_0060AC8C: push 0041EAACh
  loc_0060AC91: push edi
  loc_0060AC92: push eax
  loc_0060AC93: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AC99: lea ecx, var_1C
  loc_0060AC9C: call [004012B0h] ; __vbaFreeObj
  loc_0060ACA2: jmp 0060ACA7h
  loc_0060ACA4: mov [ebx], si
  loc_0060ACA7: mov var_4, esi
  loc_0060ACAA: push 0060ACE4h
  loc_0060ACAF: jmp 0060ACDAh
  loc_0060ACB1: lea ecx, var_1C
  loc_0060ACB4: call [004012B0h] ; __vbaFreeObj
  loc_0060ACBA: lea ecx, var_6C
  loc_0060ACBD: lea edx, var_5C
  loc_0060ACC0: push ecx
  loc_0060ACC1: lea eax, var_4C
  loc_0060ACC4: push edx
  loc_0060ACC5: lea ecx, var_3C
  loc_0060ACC8: push eax
  loc_0060ACC9: lea edx, var_2C
  loc_0060ACCC: push ecx
  loc_0060ACCD: push edx
  loc_0060ACCE: push 00000005h
  loc_0060ACD0: call [00401038h] ; __vbaFreeVarList
  loc_0060ACD6: add esp, 00000018h
  loc_0060ACD9: ret
  loc_0060ACDA: lea ecx, var_18
  loc_0060ACDD: call [004012ACh] ; __vbaFreeStr
  loc_0060ACE3: ret
  loc_0060ACE4: mov eax, Me
  loc_0060ACE7: push eax
  loc_0060ACE8: mov ecx, [eax]
  loc_0060ACEA: call [ecx+00000008h]
  loc_0060ACED: mov eax, var_4
  loc_0060ACF0: mov ecx, var_14
  loc_0060ACF3: pop edi
  loc_0060ACF4: pop esi
  loc_0060ACF5: mov fs:[00000000h], ecx
  loc_0060ACFC: pop ebx
  loc_0060ACFD: mov esp, ebp
  loc_0060ACFF: pop ebp
  loc_0060AD00: retn 0008h
End Sub

Private Sub Form_Load() '60A770
  loc_0060A770: push ebp
  loc_0060A771: mov ebp, esp
  loc_0060A773: sub esp, 0000000Ch
  loc_0060A776: push 00403B36h ; __vbaExceptHandler
  loc_0060A77B: mov eax, fs:[00000000h]
  loc_0060A781: push eax
  loc_0060A782: mov fs:[00000000h], esp
  loc_0060A789: sub esp, 00000084h
  loc_0060A78F: push ebx
  loc_0060A790: push esi
  loc_0060A791: push edi
  loc_0060A792: mov var_C, esp
  loc_0060A795: mov var_8, 00403778h
  loc_0060A79C: mov edi, Me
  loc_0060A79F: mov eax, edi
  loc_0060A7A1: and eax, 00000001h
  loc_0060A7A4: mov var_4, eax
  loc_0060A7A7: and edi, FFFFFFFEh
  loc_0060A7AA: push edi
  loc_0060A7AB: mov Me, edi
  loc_0060A7AE: mov ecx, [edi]
  loc_0060A7B0: call [ecx+00000004h]
  loc_0060A7B3: lea ebx, var_20
  loc_0060A7B6: mov ecx, 0000000Ah
  loc_0060A7BB: push ebx
  loc_0060A7BC: mov var_58, ecx
  loc_0060A7BF: sub esp, 00000010h
  loc_0060A7C2: mov eax, 80020004h
  loc_0060A7C7: mov ebx, esp
  loc_0060A7C9: mov var_50, eax
  loc_0060A7CC: sub esp, 00000010h
  loc_0060A7CF: mov edx, [0061A13Ch]
  loc_0060A7D5: mov [ebx], ecx
  loc_0060A7D7: mov ecx, var_64
  loc_0060A7DA: xor esi, esi
  loc_0060A7DC: mov [ebx+00000004h], ecx
  loc_0060A7DF: mov ecx, esp
  loc_0060A7E1: sub esp, 00000010h
  loc_0060A7E4: mov var_18, esi
  loc_0060A7E7: mov [ebx+00000008h], eax
  loc_0060A7EA: mov eax, var_5C
  loc_0060A7ED: mov var_1C, esi
  loc_0060A7F0: mov var_20, esi
  loc_0060A7F3: mov [ebx+0000000Ch], eax
  loc_0060A7F6: mov eax, var_58
  loc_0060A7F9: mov [ecx], eax
  loc_0060A7FB: mov eax, var_54
  loc_0060A7FE: mov var_24, esi
  loc_0060A801: mov var_28, esi
  loc_0060A804: mov [ecx+00000004h], eax
  loc_0060A807: mov eax, var_50
  loc_0060A80A: mov var_38, esi
  loc_0060A80D: mov var_6C, esi
  loc_0060A810: mov [ecx+00000008h], eax
  loc_0060A813: mov eax, var_4C
  loc_0060A816: mov var_70, esi
  loc_0060A819: mov edx, [edx]
  loc_0060A81B: mov [ecx+0000000Ch], eax
  loc_0060A81E: mov ecx, esp
  loc_0060A820: mov eax, 00000003h
  loc_0060A825: push 004265C4h ; "Limit"
  loc_0060A82A: mov [ecx], eax
  loc_0060A82C: mov eax, var_44
  loc_0060A82F: mov [ecx+00000004h], eax
  loc_0060A832: mov eax, 00000004h
  loc_0060A837: mov [ecx+00000008h], eax
  loc_0060A83A: mov eax, var_3C
  loc_0060A83D: mov [ecx+0000000Ch], eax
  loc_0060A840: mov ecx, [0061A13Ch]
  loc_0060A846: push ecx
  loc_0060A847: call [edx+000000BCh]
  loc_0060A84D: cmp eax, esi
  loc_0060A84F: fnclex
  loc_0060A851: jge 0060A86Bh
  loc_0060A853: mov edx, [0061A13Ch]
  loc_0060A859: push 000000BCh
  loc_0060A85E: push 0041E928h
  loc_0060A863: push edx
  loc_0060A864: push eax
  loc_0060A865: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A86B: mov eax, var_20
  loc_0060A86E: mov ebx, [004010A0h] ; __vbaObjSet
  loc_0060A874: push eax
  loc_0060A875: lea eax, var_18
  loc_0060A878: push eax
  loc_0060A879: mov var_20, esi
  loc_0060A87C: call ebx
  loc_0060A87E: mov eax, var_18
  loc_0060A881: lea edx, var_6C
  loc_0060A884: push edx
  loc_0060A885: push eax
  loc_0060A886: mov ecx, [eax]
  loc_0060A888: call [ecx+00000020h]
  loc_0060A88B: cmp eax, esi
  loc_0060A88D: fnclex
  loc_0060A88F: jge 0060A8A3h
  loc_0060A891: mov ecx, var_18
  loc_0060A894: push 00000020h
  loc_0060A896: push 0041E938h
  loc_0060A89B: push ecx
  loc_0060A89C: push eax
  loc_0060A89D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A8A3: mov eax, var_18
  loc_0060A8A6: lea ecx, var_70
  loc_0060A8A9: push ecx
  loc_0060A8AA: push eax
  loc_0060A8AB: mov edx, [eax]
  loc_0060A8AD: call [edx+00000034h]
  loc_0060A8B0: cmp eax, esi
  loc_0060A8B2: fnclex
  loc_0060A8B4: jge 0060A8C8h
  loc_0060A8B6: mov edx, var_18
  loc_0060A8B9: push 00000034h
  loc_0060A8BB: push 0041E938h
  loc_0060A8C0: push edx
  loc_0060A8C1: push eax
  loc_0060A8C2: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A8C8: xor eax, eax
  loc_0060A8CA: cmp var_70, si
  loc_0060A8CE: setz al
  loc_0060A8D1: xor ecx, ecx
  loc_0060A8D3: cmp var_6C, si
  loc_0060A8D7: setz cl
  loc_0060A8DA: or eax, ecx
  loc_0060A8DC: jz 0060A9F7h
  loc_0060A8E2: mov edx, [edi]
  loc_0060A8E4: push edi
  loc_0060A8E5: call [edx+000002FCh]
  loc_0060A8EB: push eax
  loc_0060A8EC: lea eax, var_28
  loc_0060A8EF: push eax
  loc_0060A8F0: call ebx
  loc_0060A8F2: mov var_88, eax
  loc_0060A8F8: mov eax, var_18
  loc_0060A8FB: lea edx, var_20
  loc_0060A8FE: mov ecx, [eax]
  loc_0060A900: push edx
  loc_0060A901: push eax
  loc_0060A902: call [ecx+000000B4h]
  loc_0060A908: cmp eax, esi
  loc_0060A90A: fnclex
  loc_0060A90C: jge 0060A923h
  loc_0060A90E: mov ecx, var_18
  loc_0060A911: push 000000B4h
  loc_0060A916: push 0041E938h
  loc_0060A91B: push ecx
  loc_0060A91C: push eax
  loc_0060A91D: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A923: lea ebx, var_24
  loc_0060A926: mov eax, var_20
  loc_0060A929: push ebx
  loc_0060A92A: mov edx, 00000008h
  loc_0060A92F: sub esp, 00000010h
  loc_0060A932: mov edi, [eax]
  loc_0060A934: mov ebx, esp
  loc_0060A936: mov ecx, 004265C4h ; "Limit"
  loc_0060A93B: push eax
  loc_0060A93C: mov var_78, eax
  loc_0060A93F: mov [ebx], edx
  loc_0060A941: mov edx, var_44
  loc_0060A944: mov [ebx+00000004h], edx
  loc_0060A947: mov [ebx+00000008h], ecx
  loc_0060A94A: mov ecx, var_3C
  loc_0060A94D: mov [ebx+0000000Ch], ecx
  loc_0060A950: call [edi+00000030h]
  loc_0060A953: cmp eax, esi
  loc_0060A955: fnclex
  loc_0060A957: jge 0060A96Bh
  loc_0060A959: mov edx, var_78
  loc_0060A95C: push 00000030h
  loc_0060A95E: push 0041EA14h ; "S"
  loc_0060A963: push edx
  loc_0060A964: push eax
  loc_0060A965: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A96B: mov eax, var_24
  loc_0060A96E: lea edx, var_38
  loc_0060A971: push edx
  loc_0060A972: push eax
  loc_0060A973: mov ecx, [eax]
  loc_0060A975: mov edi, eax
  loc_0060A977: call [ecx+00000044h]
  loc_0060A97A: cmp eax, esi
  loc_0060A97C: fnclex
  loc_0060A97E: jge 0060A98Fh
  loc_0060A980: push 00000044h
  loc_0060A982: push 0041EA48h
  loc_0060A987: push edi
  loc_0060A988: push eax
  loc_0060A989: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A98F: mov edi, var_88
  loc_0060A995: lea eax, var_38
  loc_0060A998: push eax
  loc_0060A999: mov ebx, [edi]
  loc_0060A99B: call [00401028h] ; __vbaStrVarMove
  loc_0060A9A1: mov edx, eax
  loc_0060A9A3: lea ecx, var_1C
  loc_0060A9A6: call [00401270h] ; __vbaStrMove
  loc_0060A9AC: push eax
  loc_0060A9AD: push edi
  loc_0060A9AE: call [ebx+000000A4h]
  loc_0060A9B4: cmp eax, esi
  loc_0060A9B6: fnclex
  loc_0060A9B8: jge 0060A9CCh
  loc_0060A9BA: push 000000A4h
  loc_0060A9BF: push 0041E5E8h
  loc_0060A9C4: push edi
  loc_0060A9C5: push eax
  loc_0060A9C6: call [00401074h] ; __vbaHresultCheckObj
  loc_0060A9CC: lea ecx, var_1C
  loc_0060A9CF: call [004012ACh] ; __vbaFreeStr
  loc_0060A9D5: lea ecx, var_28
  loc_0060A9D8: lea edx, var_24
  loc_0060A9DB: push ecx
  loc_0060A9DC: lea eax, var_20
  loc_0060A9DF: push edx
  loc_0060A9E0: push eax
  loc_0060A9E1: push 00000003h
  loc_0060A9E3: call [00401040h] ; __vbaFreeObjList
  loc_0060A9E9: add esp, 00000010h
  loc_0060A9EC: lea ecx, var_38
  loc_0060A9EF: call [00401020h] ; __vbaFreeVar
  loc_0060A9F5: jmp 0060AA4Fh
  loc_0060A9F7: mov ecx, [edi]
  loc_0060A9F9: push edi
  loc_0060A9FA: call [ecx+000002FCh]
  loc_0060AA00: lea edx, var_20
  loc_0060AA03: push eax
  loc_0060AA04: push edx
  loc_0060AA05: call ebx
  loc_0060AA07: mov edi, eax
  loc_0060AA09: push esi
  loc_0060AA0A: mov ebx, [edi]
  loc_0060AA0C: call [00401008h] ; __vbaStrI2
  loc_0060AA12: mov edx, eax
  loc_0060AA14: lea ecx, var_1C
  loc_0060AA17: call [00401270h] ; __vbaStrMove
  loc_0060AA1D: push eax
  loc_0060AA1E: push edi
  loc_0060AA1F: call [ebx+000000A4h]
  loc_0060AA25: cmp eax, esi
  loc_0060AA27: fnclex
  loc_0060AA29: jge 0060AA3Dh
  loc_0060AA2B: push 000000A4h
  loc_0060AA30: push 0041E5E8h
  loc_0060AA35: push edi
  loc_0060AA36: push eax
  loc_0060AA37: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AA3D: lea ecx, var_1C
  loc_0060AA40: call [004012ACh] ; __vbaFreeStr
  loc_0060AA46: lea ecx, var_20
  loc_0060AA49: call [004012B0h] ; __vbaFreeObj
  loc_0060AA4F: mov eax, var_18
  loc_0060AA52: push eax
  loc_0060AA53: mov ecx, [eax]
  loc_0060AA55: call [ecx+000000C4h]
  loc_0060AA5B: cmp eax, esi
  loc_0060AA5D: fnclex
  loc_0060AA5F: jge 0060AA76h
  loc_0060AA61: mov edx, var_18
  loc_0060AA64: push 000000C4h
  loc_0060AA69: push 0041E938h
  loc_0060AA6E: push edx
  loc_0060AA6F: push eax
  loc_0060AA70: call [00401074h] ; __vbaHresultCheckObj
  loc_0060AA76: push 0041E938h
  loc_0060AA7B: push esi
  loc_0060AA7C: call [00401274h] ; __vbaCastObj
  loc_0060AA82: push eax
  loc_0060AA83: lea eax, var_18
  loc_0060AA86: push eax
  loc_0060AA87: call [004010A0h] ; __vbaObjSet
  loc_0060AA8D: mov var_4, esi
  loc_0060AA90: push 0060AACBh
  loc_0060AA95: jmp 0060AAC1h
  loc_0060AA97: lea ecx, var_1C
  loc_0060AA9A: call [004012ACh] ; __vbaFreeStr
  loc_0060AAA0: lea ecx, var_28
  loc_0060AAA3: lea edx, var_24
  loc_0060AAA6: push ecx
  loc_0060AAA7: lea eax, var_20
  loc_0060AAAA: push edx
  loc_0060AAAB: push eax
  loc_0060AAAC: push 00000003h
  loc_0060AAAE: call [00401040h] ; __vbaFreeObjList
  loc_0060AAB4: add esp, 00000010h
  loc_0060AAB7: lea ecx, var_38
  loc_0060AABA: call [00401020h] ; __vbaFreeVar
  loc_0060AAC0: ret
  loc_0060AAC1: lea ecx, var_18
  loc_0060AAC4: call [004012B0h] ; __vbaFreeObj
  loc_0060AACA: ret
  loc_0060AACB: mov eax, Me
  loc_0060AACE: push eax
  loc_0060AACF: mov ecx, [eax]
  loc_0060AAD1: call [ecx+00000008h]
  loc_0060AAD4: mov eax, var_4
  loc_0060AAD7: mov ecx, var_14
  loc_0060AADA: pop edi
  loc_0060AADB: pop esi
  loc_0060AADC: mov fs:[00000000h], ecx
  loc_0060AAE3: pop ebx
  loc_0060AAE4: mov esp, ebp
  loc_0060AAE6: pop ebp
  loc_0060AAE7: retn 0004h
End Sub
