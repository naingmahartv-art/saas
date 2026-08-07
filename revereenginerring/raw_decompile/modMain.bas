
Private Sub Proc_10_0_4B8710() '4B8710
  loc_004B8710: push ebp
  loc_004B8711: mov ebp, esp
  loc_004B8713: sub esp, 00000008h
  loc_004B8716: push 00403B36h ; __vbaExceptHandler
  loc_004B871B: mov eax, fs:[00000000h]
  loc_004B8721: push eax
  loc_004B8722: mov fs:[00000000h], esp
  loc_004B8729: sub esp, 00000070h
  loc_004B872C: push ebx
  loc_004B872D: push esi
  loc_004B872E: push edi
  loc_004B872F: mov var_8, esp
  loc_004B8732: mov var_4, 00401E00h
  loc_004B8739: lea ebx, var_18
  loc_004B873C: mov ecx, 0000000Ah
  loc_004B8741: push ebx
  loc_004B8742: mov var_4C, ecx
  loc_004B8745: sub esp, 00000010h
  loc_004B8748: mov eax, 80020004h
  loc_004B874D: mov ebx, esp
  loc_004B874F: mov edx, eax
  loc_004B8751: sub esp, 00000010h
  loc_004B8754: mov edi, [0061A13Ch]
  loc_004B875A: mov [ebx], ecx
  loc_004B875C: mov ecx, var_58
  loc_004B875F: xor esi, esi
  loc_004B8761: mov [ebx+00000004h], ecx
  loc_004B8764: mov ecx, esp
  loc_004B8766: sub esp, 00000010h
  loc_004B8769: mov var_14, esi
  loc_004B876C: mov [ebx+00000008h], eax
  loc_004B876F: mov eax, var_50
  loc_004B8772: mov var_18, esi
  loc_004B8775: mov var_1C, esi
  loc_004B8778: mov [ebx+0000000Ch], eax
  loc_004B877B: mov eax, var_4C
  loc_004B877E: mov [ecx], eax
  loc_004B8780: mov eax, var_48
  loc_004B8783: mov var_2C, esi
  loc_004B8786: mov var_60, esi
  loc_004B8789: mov [ecx+00000004h], eax
  loc_004B878C: mov eax, 00000003h
  loc_004B8791: mov var_64, esi
  loc_004B8794: mov edi, [edi]
  loc_004B8796: mov [ecx+00000008h], edx
  loc_004B8799: mov edx, var_40
  loc_004B879C: mov [ecx+0000000Ch], edx
  loc_004B879F: mov edx, var_38
  loc_004B87A2: mov ecx, esp
  loc_004B87A4: push 004265D4h ; "select * From Rate"
  loc_004B87A9: mov [ecx], eax
  loc_004B87AB: mov eax, 00000004h
  loc_004B87B0: mov [ecx+00000004h], edx
  loc_004B87B3: mov [ecx+00000008h], eax
  loc_004B87B6: mov eax, var_30
  loc_004B87B9: mov [ecx+0000000Ch], eax
  loc_004B87BC: mov ecx, [0061A13Ch]
  loc_004B87C2: push ecx
  loc_004B87C3: call [edi+000000BCh]
  loc_004B87C9: cmp eax, esi
  loc_004B87CB: fnclex
  loc_004B87CD: jge 004B87EBh
  loc_004B87CF: mov edx, [0061A13Ch]
  loc_004B87D5: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B87DB: push 000000BCh
  loc_004B87E0: push 0041E928h
  loc_004B87E5: push edx
  loc_004B87E6: push eax
  loc_004B87E7: call edi
  loc_004B87E9: jmp 004B87F1h
  loc_004B87EB: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B87F1: mov eax, var_18
  loc_004B87F4: mov var_18, esi
  loc_004B87F7: push eax
  loc_004B87F8: lea eax, var_14
  loc_004B87FB: push eax
  loc_004B87FC: call [004010A0h] ; __vbaObjSet
  loc_004B8802: mov eax, var_14
  loc_004B8805: lea edx, var_60
  loc_004B8808: push edx
  loc_004B8809: push eax
  loc_004B880A: mov ecx, [eax]
  loc_004B880C: call [ecx+00000020h]
  loc_004B880F: cmp eax, esi
  loc_004B8811: fnclex
  loc_004B8813: jge 004B8823h
  loc_004B8815: mov ecx, var_14
  loc_004B8818: push 00000020h
  loc_004B881A: push 0041E938h
  loc_004B881F: push ecx
  loc_004B8820: push eax
  loc_004B8821: call edi
  loc_004B8823: mov eax, var_14
  loc_004B8826: lea ecx, var_64
  loc_004B8829: push ecx
  loc_004B882A: push eax
  loc_004B882B: mov edx, [eax]
  loc_004B882D: call [edx+00000034h]
  loc_004B8830: cmp eax, esi
  loc_004B8832: fnclex
  loc_004B8834: jge 004B8844h
  loc_004B8836: mov edx, var_14
  loc_004B8839: push 00000034h
  loc_004B883B: push 0041E938h
  loc_004B8840: push edx
  loc_004B8841: push eax
  loc_004B8842: call edi
  loc_004B8844: xor eax, eax
  loc_004B8846: cmp var_64, si
  loc_004B884A: setz al
  loc_004B884D: xor ecx, ecx
  loc_004B884F: cmp var_60, si
  loc_004B8853: setz cl
  loc_004B8856: or eax, ecx
  loc_004B8858: jz 004B8925h
  loc_004B885E: mov eax, var_14
  loc_004B8861: lea ecx, var_18
  loc_004B8864: push ecx
  loc_004B8865: push eax
  loc_004B8866: mov edx, [eax]
  loc_004B8868: call [edx+000000B4h]
  loc_004B886E: cmp eax, esi
  loc_004B8870: fnclex
  loc_004B8872: jge 004B8885h
  loc_004B8874: mov edx, var_14
  loc_004B8877: push 000000B4h
  loc_004B887C: push 0041E938h
  loc_004B8881: push edx
  loc_004B8882: push eax
  loc_004B8883: call edi
  loc_004B8885: lea ebx, var_1C
  loc_004B8888: mov eax, var_18
  loc_004B888B: push ebx
  loc_004B888C: mov edx, 00000008h
  loc_004B8891: sub esp, 00000010h
  loc_004B8894: mov edi, [eax]
  loc_004B8896: mov ebx, esp
  loc_004B8898: mov ecx, 0041F224h ; "Rate"
  loc_004B889D: push eax
  loc_004B889E: mov var_6C, eax
  loc_004B88A1: mov [ebx], edx
  loc_004B88A3: mov edx, var_38
  loc_004B88A6: mov [ebx+00000004h], edx
  loc_004B88A9: mov [ebx+00000008h], ecx
  loc_004B88AC: mov ecx, var_30
  loc_004B88AF: mov [ebx+0000000Ch], ecx
  loc_004B88B2: call [edi+00000030h]
  loc_004B88B5: cmp eax, esi
  loc_004B88B7: fnclex
  loc_004B88B9: jge 004B88D1h
  loc_004B88BB: mov edx, var_6C
  loc_004B88BE: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B88C4: push 00000030h
  loc_004B88C6: push 0041EA14h ; "S"
  loc_004B88CB: push edx
  loc_004B88CC: push eax
  loc_004B88CD: call edi
  loc_004B88CF: jmp 004B88D7h
  loc_004B88D1: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B88D7: mov eax, var_1C
  loc_004B88DA: lea edx, var_2C
  loc_004B88DD: push edx
  loc_004B88DE: push eax
  loc_004B88DF: mov ecx, [eax]
  loc_004B88E1: mov ebx, eax
  loc_004B88E3: call [ecx+00000044h]
  loc_004B88E6: cmp eax, esi
  loc_004B88E8: fnclex
  loc_004B88EA: jge 004B88F7h
  loc_004B88EC: push 00000044h
  loc_004B88EE: push 0041EA48h
  loc_004B88F3: push ebx
  loc_004B88F4: push eax
  loc_004B88F5: call edi
  loc_004B88F7: lea eax, var_2C
  loc_004B88FA: push eax
  loc_004B88FB: call [004011C0h] ; __vbaI2Var
  loc_004B8901: lea ecx, var_1C
  loc_004B8904: lea edx, var_18
  loc_004B8907: push ecx
  loc_004B8908: push edx
  loc_004B8909: push 00000002h
  loc_004B890B: mov [0061A0C0h], ax
  loc_004B8911: call [00401040h] ; __vbaFreeObjList
  loc_004B8917: add esp, 0000000Ch
  loc_004B891A: lea ecx, var_2C
  loc_004B891D: call [00401020h] ; __vbaFreeVar
  loc_004B8923: jmp 004B892Ch
  loc_004B8925: mov [0061A0C0h], si
  loc_004B892C: mov eax, var_14
  loc_004B892F: push eax
  loc_004B8930: mov ecx, [eax]
  loc_004B8932: call [ecx+000000C4h]
  loc_004B8938: cmp eax, esi
  loc_004B893A: fnclex
  loc_004B893C: jge 004B894Fh
  loc_004B893E: mov edx, var_14
  loc_004B8941: push 000000C4h
  loc_004B8946: push 0041E938h
  loc_004B894B: push edx
  loc_004B894C: push eax
  loc_004B894D: call edi
  loc_004B894F: push 0041E938h
  loc_004B8954: push esi
  loc_004B8955: call [00401274h] ; __vbaCastObj
  loc_004B895B: push eax
  loc_004B895C: lea eax, var_14
  loc_004B895F: push eax
  loc_004B8960: call [004010A0h] ; __vbaObjSet
  loc_004B8966: push 004B8994h
  loc_004B896B: jmp 004B898Ah
  loc_004B896D: lea ecx, var_1C
  loc_004B8970: lea edx, var_18
  loc_004B8973: push ecx
  loc_004B8974: push edx
  loc_004B8975: push 00000002h
  loc_004B8977: call [00401040h] ; __vbaFreeObjList
  loc_004B897D: add esp, 0000000Ch
  loc_004B8980: lea ecx, var_2C
  loc_004B8983: call [00401020h] ; __vbaFreeVar
  loc_004B8989: ret
  loc_004B898A: lea ecx, var_14
  loc_004B898D: call [004012B0h] ; __vbaFreeObj
  loc_004B8993: ret
  loc_004B8994: mov ecx, var_10
  loc_004B8997: pop edi
  loc_004B8998: pop esi
  loc_004B8999: mov fs:[00000000h], ecx
  loc_004B89A0: pop ebx
  loc_004B89A1: mov esp, ebp
  loc_004B89A3: pop ebp
  loc_004B89A4: ret
  loc_004B89A5: nop
End Sub

Private Sub Proc_10_1_4B89B0() '4B89B0
  loc_004B89B0: push ebp
  loc_004B89B1: mov ebp, esp
  loc_004B89B3: sub esp, 00000008h
  loc_004B89B6: push 00403B36h ; __vbaExceptHandler
  loc_004B89BB: mov eax, fs:[00000000h]
  loc_004B89C1: push eax
  loc_004B89C2: mov fs:[00000000h], esp
  loc_004B89C9: sub esp, 000000B4h
  loc_004B89CF: push ebx
  loc_004B89D0: push esi
  loc_004B89D1: push edi
  loc_004B89D2: mov var_8, esp
  loc_004B89D5: mov var_4, 00401E10h
  loc_004B89DC: lea ebx, var_20
  loc_004B89DF: mov ecx, 0000000Ah
  loc_004B89E4: push ebx
  loc_004B89E5: mov eax, 80020004h
  loc_004B89EA: sub esp, 00000010h
  loc_004B89ED: mov edx, eax
  loc_004B89EF: mov ebx, esp
  loc_004B89F1: sub esp, 00000010h
  loc_004B89F4: mov var_74, 00000003h
  loc_004B89FB: mov edi, [0061A13Ch]
  loc_004B8A01: mov [ebx], ecx
  loc_004B8A03: mov ecx, var_90
  loc_004B8A09: mov var_6C, 00000004h
  loc_004B8A10: xor esi, esi
  loc_004B8A12: mov [ebx+00000004h], ecx
  loc_004B8A15: mov ecx, esp
  loc_004B8A17: sub esp, 00000010h
  loc_004B8A1A: mov var_14, esi
  loc_004B8A1D: mov [ebx+00000008h], eax
  loc_004B8A20: mov eax, var_88
  loc_004B8A26: mov var_18, esi
  loc_004B8A29: mov var_1C, esi
  loc_004B8A2C: mov [ebx+0000000Ch], eax
  loc_004B8A2F: mov eax, 0000000Ah
  loc_004B8A34: mov [ecx], eax
  loc_004B8A36: mov eax, var_80
  loc_004B8A39: mov var_20, esi
  loc_004B8A3C: mov var_24, esi
  loc_004B8A3F: mov [ecx+00000004h], eax
  loc_004B8A42: mov eax, esp
  loc_004B8A44: mov var_34, esi
  loc_004B8A47: mov var_44, esi
  loc_004B8A4A: mov [ecx+00000008h], edx
  loc_004B8A4D: mov edx, var_78
  loc_004B8A50: mov var_54, esi
  loc_004B8A53: mov var_64, esi
  loc_004B8A56: mov [ecx+0000000Ch], edx
  loc_004B8A59: mov ecx, var_74
  loc_004B8A5C: mov edx, var_70
  loc_004B8A5F: mov [eax], ecx
  loc_004B8A61: mov ecx, var_6C
  loc_004B8A64: mov var_A8, esi
  loc_004B8A6A: mov edi, [edi]
  loc_004B8A6C: mov [eax+00000004h], edx
  loc_004B8A6F: mov edx, var_68
  loc_004B8A72: push 00426600h ; "Select * From MachineIP Order By MachineID"
  loc_004B8A77: mov [eax+00000008h], ecx
  loc_004B8A7A: mov [eax+0000000Ch], edx
  loc_004B8A7D: mov eax, [0061A13Ch]
  loc_004B8A82: push eax
  loc_004B8A83: call [edi+000000BCh]
  loc_004B8A89: cmp eax, esi
  loc_004B8A8B: fnclex
  loc_004B8A8D: jge 004B8AABh
  loc_004B8A8F: mov ecx, [0061A13Ch]
  loc_004B8A95: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B8A9B: push 000000BCh
  loc_004B8AA0: push 0041E928h
  loc_004B8AA5: push ecx
  loc_004B8AA6: push eax
  loc_004B8AA7: call edi
  loc_004B8AA9: jmp 004B8AB1h
  loc_004B8AAB: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B8AB1: mov eax, var_20
  loc_004B8AB4: lea edx, var_14
  loc_004B8AB7: push eax
  loc_004B8AB8: push edx
  loc_004B8AB9: mov var_20, esi
  loc_004B8ABC: call [004010A0h] ; __vbaObjSet
  loc_004B8AC2: mov ecx, arg_8
  loc_004B8AC5: mov eax, var_14
  loc_004B8AC8: push 0042665Ch ; "MachineID="
  loc_004B8ACD: mov dx, [ecx]
  loc_004B8AD0: mov ebx, [eax]
  loc_004B8AD2: push edx
  loc_004B8AD3: call [00401008h] ; __vbaStrI2
  loc_004B8AD9: mov edx, eax
  loc_004B8ADB: lea ecx, var_18
  loc_004B8ADE: call [00401270h] ; __vbaStrMove
  loc_004B8AE4: push eax
  loc_004B8AE5: call [00401054h] ; __vbaStrCat
  loc_004B8AEB: mov edx, eax
  loc_004B8AED: lea ecx, var_1C
  loc_004B8AF0: call [00401270h] ; __vbaStrMove
  loc_004B8AF6: push eax
  loc_004B8AF7: mov eax, var_14
  loc_004B8AFA: push eax
  loc_004B8AFB: call [ebx+000000D4h]
  loc_004B8B01: cmp eax, esi
  loc_004B8B03: fnclex
  loc_004B8B05: jge 004B8B18h
  loc_004B8B07: mov ecx, var_14
  loc_004B8B0A: push 000000D4h
  loc_004B8B0F: push 0041E938h
  loc_004B8B14: push ecx
  loc_004B8B15: push eax
  loc_004B8B16: call edi
  loc_004B8B18: lea edx, var_1C
  loc_004B8B1B: lea eax, var_18
  loc_004B8B1E: push edx
  loc_004B8B1F: push eax
  loc_004B8B20: push 00000002h
  loc_004B8B22: call [004011FCh] ; __vbaFreeStrList
  loc_004B8B28: mov eax, var_14
  loc_004B8B2B: add esp, 0000000Ch
  loc_004B8B2E: lea edx, var_A8
  loc_004B8B34: mov ecx, [eax]
  loc_004B8B36: push edx
  loc_004B8B37: push eax
  loc_004B8B38: call [ecx+0000005Ch]
  loc_004B8B3B: cmp eax, esi
  loc_004B8B3D: fnclex
  loc_004B8B3F: jge 004B8B4Fh
  loc_004B8B41: mov ecx, var_14
  loc_004B8B44: push 0000005Ch
  loc_004B8B46: push 0041E938h
  loc_004B8B4B: push ecx
  loc_004B8B4C: push eax
  loc_004B8B4D: call edi
  loc_004B8B4F: cmp var_A8, si
  loc_004B8B56: jnz 004B8DAAh
  loc_004B8B5C: mov eax, var_14
  loc_004B8B5F: lea ecx, var_20
  loc_004B8B62: push ecx
  loc_004B8B63: push eax
  loc_004B8B64: mov edx, [eax]
  loc_004B8B66: call [edx+000000B4h]
  loc_004B8B6C: cmp eax, esi
  loc_004B8B6E: fnclex
  loc_004B8B70: jge 004B8B83h
  loc_004B8B72: mov edx, var_14
  loc_004B8B75: push 000000B4h
  loc_004B8B7A: push 0041E938h
  loc_004B8B7F: push edx
  loc_004B8B80: push eax
  loc_004B8B81: call edi
  loc_004B8B83: lea ebx, var_24
  loc_004B8B86: mov eax, var_20
  loc_004B8B89: push ebx
  loc_004B8B8A: mov ecx, 00000008h
  loc_004B8B8F: sub esp, 00000010h
  loc_004B8B92: mov var_74, ecx
  loc_004B8B95: mov ebx, esp
  loc_004B8B97: mov var_6C, 0041EDC0h ; "MachineID"
  loc_004B8B9E: mov edx, [eax]
  loc_004B8BA0: push eax
  loc_004B8BA1: mov [ebx], ecx
  loc_004B8BA3: mov ecx, var_70
  loc_004B8BA6: mov var_B0, eax
  loc_004B8BAC: mov [ebx+00000004h], ecx
  loc_004B8BAF: mov ecx, var_6C
  loc_004B8BB2: mov [ebx+00000008h], ecx
  loc_004B8BB5: mov ecx, var_68
  loc_004B8BB8: mov [ebx+0000000Ch], ecx
  loc_004B8BBB: call [edx+00000030h]
  loc_004B8BBE: cmp eax, esi
  loc_004B8BC0: fnclex
  loc_004B8BC2: jge 004B8BD5h
  loc_004B8BC4: mov edx, var_B0
  loc_004B8BCA: push 00000030h
  loc_004B8BCC: push 0041EA14h ; "S"
  loc_004B8BD1: push edx
  loc_004B8BD2: push eax
  loc_004B8BD3: call edi
  loc_004B8BD5: mov eax, var_24
  loc_004B8BD8: lea edx, var_34
  loc_004B8BDB: push edx
  loc_004B8BDC: push eax
  loc_004B8BDD: mov ecx, [eax]
  loc_004B8BDF: mov ebx, eax
  loc_004B8BE1: call [ecx+00000044h]
  loc_004B8BE4: cmp eax, esi
  loc_004B8BE6: fnclex
  loc_004B8BE8: jge 004B8BF5h
  loc_004B8BEA: push 00000044h
  loc_004B8BEC: push 0041EA48h
  loc_004B8BF1: push ebx
  loc_004B8BF2: push eax
  loc_004B8BF3: call edi
  loc_004B8BF5: lea eax, var_34
  loc_004B8BF8: push eax
  loc_004B8BF9: call [00401294h] ; __vbaUI1Var
  loc_004B8BFF: lea ecx, var_24
  loc_004B8C02: lea edx, var_20
  loc_004B8C05: push ecx
  loc_004B8C06: push edx
  loc_004B8C07: push 00000002h
  loc_004B8C09: mov [0061A130h], al
  loc_004B8C0E: call [00401040h] ; __vbaFreeObjList
  loc_004B8C14: add esp, 0000000Ch
  loc_004B8C17: lea ecx, var_34
  loc_004B8C1A: call [00401020h] ; __vbaFreeVar
  loc_004B8C20: mov eax, var_14
  loc_004B8C23: lea edx, var_20
  loc_004B8C26: push edx
  loc_004B8C27: push eax
  loc_004B8C28: mov ecx, [eax]
  loc_004B8C2A: call [ecx+000000B4h]
  loc_004B8C30: cmp eax, esi
  loc_004B8C32: fnclex
  loc_004B8C34: jge 004B8C47h
  loc_004B8C36: mov ecx, var_14
  loc_004B8C39: push 000000B4h
  loc_004B8C3E: push 0041E938h
  loc_004B8C43: push ecx
  loc_004B8C44: push eax
  loc_004B8C45: call edi
  loc_004B8C47: lea ebx, var_24
  loc_004B8C4A: mov eax, var_20
  loc_004B8C4D: push ebx
  loc_004B8C4E: mov ecx, 00000008h
  loc_004B8C53: sub esp, 00000010h
  loc_004B8C56: mov var_74, ecx
  loc_004B8C59: mov ebx, esp
  loc_004B8C5B: mov var_6C, 00426678h ; "MinSerial"
  loc_004B8C62: mov edx, [eax]
  loc_004B8C64: push eax
  loc_004B8C65: mov [ebx], ecx
  loc_004B8C67: mov ecx, var_70
  loc_004B8C6A: mov var_B0, eax
  loc_004B8C70: mov [ebx+00000004h], ecx
  loc_004B8C73: mov ecx, var_6C
  loc_004B8C76: mov [ebx+00000008h], ecx
  loc_004B8C79: mov ecx, var_68
  loc_004B8C7C: mov [ebx+0000000Ch], ecx
  loc_004B8C7F: call [edx+00000030h]
  loc_004B8C82: cmp eax, esi
  loc_004B8C84: fnclex
  loc_004B8C86: jge 004B8C99h
  loc_004B8C88: mov edx, var_B0
  loc_004B8C8E: push 00000030h
  loc_004B8C90: push 0041EA14h ; "S"
  loc_004B8C95: push edx
  loc_004B8C96: push eax
  loc_004B8C97: call edi
  loc_004B8C99: mov eax, var_24
  loc_004B8C9C: lea edx, var_34
  loc_004B8C9F: push edx
  loc_004B8CA0: push eax
  loc_004B8CA1: mov ecx, [eax]
  loc_004B8CA3: mov ebx, eax
  loc_004B8CA5: call [ecx+00000044h]
  loc_004B8CA8: cmp eax, esi
  loc_004B8CAA: fnclex
  loc_004B8CAC: jge 004B8CB9h
  loc_004B8CAE: push 00000044h
  loc_004B8CB0: push 0041EA48h
  loc_004B8CB5: push ebx
  loc_004B8CB6: push eax
  loc_004B8CB7: call edi
  loc_004B8CB9: lea eax, var_34
  loc_004B8CBC: push eax
  loc_004B8CBD: call [0040121Ch] ; __vbaI4Var
  loc_004B8CC3: lea ecx, var_24
  loc_004B8CC6: lea edx, var_20
  loc_004B8CC9: push ecx
  loc_004B8CCA: push edx
  loc_004B8CCB: push 00000002h
  loc_004B8CCD: mov [0061A134h], eax
  loc_004B8CD2: call [00401040h] ; __vbaFreeObjList
  loc_004B8CD8: add esp, 0000000Ch
  loc_004B8CDB: lea ecx, var_34
  loc_004B8CDE: call [00401020h] ; __vbaFreeVar
  loc_004B8CE4: mov eax, var_14
  loc_004B8CE7: lea edx, var_20
  loc_004B8CEA: push edx
  loc_004B8CEB: push eax
  loc_004B8CEC: mov ecx, [eax]
  loc_004B8CEE: call [ecx+000000B4h]
  loc_004B8CF4: cmp eax, esi
  loc_004B8CF6: fnclex
  loc_004B8CF8: jge 004B8D0Bh
  loc_004B8CFA: mov ecx, var_14
  loc_004B8CFD: push 000000B4h
  loc_004B8D02: push 0041E938h
  loc_004B8D07: push ecx
  loc_004B8D08: push eax
  loc_004B8D09: call edi
  loc_004B8D0B: lea ebx, var_24
  loc_004B8D0E: mov eax, var_20
  loc_004B8D11: push ebx
  loc_004B8D12: mov ecx, 00000008h
  loc_004B8D17: sub esp, 00000010h
  loc_004B8D1A: mov var_74, ecx
  loc_004B8D1D: mov ebx, esp
  loc_004B8D1F: mov var_6C, 00426690h ; "MaxSerial"
  loc_004B8D26: mov edx, [eax]
  loc_004B8D28: push eax
  loc_004B8D29: mov [ebx], ecx
  loc_004B8D2B: mov ecx, var_70
  loc_004B8D2E: mov var_B0, eax
  loc_004B8D34: mov [ebx+00000004h], ecx
  loc_004B8D37: mov ecx, var_6C
  loc_004B8D3A: mov [ebx+00000008h], ecx
  loc_004B8D3D: mov ecx, var_68
  loc_004B8D40: mov [ebx+0000000Ch], ecx
  loc_004B8D43: call [edx+00000030h]
  loc_004B8D46: cmp eax, esi
  loc_004B8D48: fnclex
  loc_004B8D4A: jge 004B8D5Dh
  loc_004B8D4C: mov edx, var_B0
  loc_004B8D52: push 00000030h
  loc_004B8D54: push 0041EA14h ; "S"
  loc_004B8D59: push edx
  loc_004B8D5A: push eax
  loc_004B8D5B: call edi
  loc_004B8D5D: mov eax, var_24
  loc_004B8D60: lea edx, var_34
  loc_004B8D63: push edx
  loc_004B8D64: push eax
  loc_004B8D65: mov ecx, [eax]
  loc_004B8D67: mov ebx, eax
  loc_004B8D69: call [ecx+00000044h]
  loc_004B8D6C: cmp eax, esi
  loc_004B8D6E: fnclex
  loc_004B8D70: jge 004B8D7Dh
  loc_004B8D72: push 00000044h
  loc_004B8D74: push 0041EA48h
  loc_004B8D79: push ebx
  loc_004B8D7A: push eax
  loc_004B8D7B: call edi
  loc_004B8D7D: lea eax, var_34
  loc_004B8D80: push eax
  loc_004B8D81: call [0040121Ch] ; __vbaI4Var
  loc_004B8D87: lea ecx, var_24
  loc_004B8D8A: lea edx, var_20
  loc_004B8D8D: push ecx
  loc_004B8D8E: push edx
  loc_004B8D8F: push 00000002h
  loc_004B8D91: mov [0061A138h], eax
  loc_004B8D96: call [00401040h] ; __vbaFreeObjList
  loc_004B8D9C: add esp, 0000000Ch
  loc_004B8D9F: lea ecx, var_34
  loc_004B8DA2: call [00401020h] ; __vbaFreeVar
  loc_004B8DA8: jmp 004B8E26h
  loc_004B8DAA: mov ecx, 80020004h
  loc_004B8DAF: mov eax, 0000000Ah
  loc_004B8DB4: mov var_5C, ecx
  loc_004B8DB7: mov var_4C, ecx
  loc_004B8DBA: mov var_3C, ecx
  loc_004B8DBD: lea edx, var_74
  loc_004B8DC0: lea ecx, var_34
  loc_004B8DC3: mov var_64, eax
  loc_004B8DC6: mov var_54, eax
  loc_004B8DC9: mov var_44, eax
  loc_004B8DCC: mov var_6C, 004266A8h ; "CAUTION! Please define your machine id .. ( 1 to 9 )."
  loc_004B8DD3: mov var_74, 00000008h
  loc_004B8DDA: call [00401240h] ; __vbaVarDup
  loc_004B8DE0: lea eax, var_64
  loc_004B8DE3: lea ecx, var_54
  loc_004B8DE6: push eax
  loc_004B8DE7: lea edx, var_44
  loc_004B8DEA: push ecx
  loc_004B8DEB: push edx
  loc_004B8DEC: lea eax, var_34
  loc_004B8DEF: push 00000030h
  loc_004B8DF1: push eax
  loc_004B8DF2: call [004010A4h] ; rtcMsgBox
  loc_004B8DF8: lea ecx, var_64
  loc_004B8DFB: lea edx, var_54
  loc_004B8DFE: push ecx
  loc_004B8DFF: lea eax, var_44
  loc_004B8E02: push edx
  loc_004B8E03: lea ecx, var_34
  loc_004B8E06: push eax
  loc_004B8E07: push ecx
  loc_004B8E08: push 00000004h
  loc_004B8E0A: call [00401038h] ; __vbaFreeVarList
  loc_004B8E10: add esp, 00000014h
  loc_004B8E13: xor ecx, ecx
  loc_004B8E15: call [00401154h] ; __vbaUI1I2
  loc_004B8E1B: mov [0061A130h], al
  loc_004B8E20: call [00401034h] ; __vbaEnd
  loc_004B8E26: mov eax, var_14
  loc_004B8E29: push eax
  loc_004B8E2A: mov edx, [eax]
  loc_004B8E2C: call [edx+000000C4h]
  loc_004B8E32: cmp eax, esi
  loc_004B8E34: fnclex
  loc_004B8E36: jge 004B8E49h
  loc_004B8E38: mov ecx, var_14
  loc_004B8E3B: push 000000C4h
  loc_004B8E40: push 0041E938h
  loc_004B8E45: push ecx
  loc_004B8E46: push eax
  loc_004B8E47: call edi
  loc_004B8E49: push 0041E938h
  loc_004B8E4E: push esi
  loc_004B8E4F: call [00401274h] ; __vbaCastObj
  loc_004B8E55: lea edx, var_14
  loc_004B8E58: push eax
  loc_004B8E59: push edx
  loc_004B8E5A: call [004010A0h] ; __vbaObjSet
  loc_004B8E60: push 004B8EADh
  loc_004B8E65: jmp 004B8EA3h
  loc_004B8E67: lea eax, var_1C
  loc_004B8E6A: lea ecx, var_18
  loc_004B8E6D: push eax
  loc_004B8E6E: push ecx
  loc_004B8E6F: push 00000002h
  loc_004B8E71: call [004011FCh] ; __vbaFreeStrList
  loc_004B8E77: lea edx, var_24
  loc_004B8E7A: lea eax, var_20
  loc_004B8E7D: push edx
  loc_004B8E7E: push eax
  loc_004B8E7F: push 00000002h
  loc_004B8E81: call [00401040h] ; __vbaFreeObjList
  loc_004B8E87: lea ecx, var_64
  loc_004B8E8A: lea edx, var_54
  loc_004B8E8D: push ecx
  loc_004B8E8E: lea eax, var_44
  loc_004B8E91: push edx
  loc_004B8E92: lea ecx, var_34
  loc_004B8E95: push eax
  loc_004B8E96: push ecx
  loc_004B8E97: push 00000004h
  loc_004B8E99: call [00401038h] ; __vbaFreeVarList
  loc_004B8E9F: add esp, 0000002Ch
  loc_004B8EA2: ret
  loc_004B8EA3: lea ecx, var_14
  loc_004B8EA6: call [004012B0h] ; __vbaFreeObj
  loc_004B8EAC: ret
  loc_004B8EAD: mov ecx, var_10
  loc_004B8EB0: pop edi
  loc_004B8EB1: pop esi
  loc_004B8EB2: mov fs:[00000000h], ecx
  loc_004B8EB9: pop ebx
  loc_004B8EBA: mov esp, ebp
  loc_004B8EBC: pop ebp
  loc_004B8EBD: retn 0004h
End Sub
