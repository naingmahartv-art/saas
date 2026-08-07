
Private Sub Proc_9_0_4B4E30() '4B4E30
  loc_004B4E30: push ebp
  loc_004B4E31: mov ebp, esp
  loc_004B4E33: sub esp, 00000014h
  loc_004B4E36: push 00403B36h ; __vbaExceptHandler
  loc_004B4E3B: mov eax, fs:[00000000h]
  loc_004B4E41: push eax
  loc_004B4E42: mov fs:[00000000h], esp
  loc_004B4E49: sub esp, 00000104h
  loc_004B4E4F: push ebx
  loc_004B4E50: push esi
  loc_004B4E51: push edi
  loc_004B4E52: mov var_14, esp
  loc_004B4E55: mov var_10, 00401D28h
  loc_004B4E5C: xor eax, eax
  loc_004B4E5E: mov var_C, eax
  loc_004B4E61: mov var_8, eax
  loc_004B4E64: mov var_20, eax
  loc_004B4E67: mov var_24, eax
  loc_004B4E6A: mov var_28, eax
  loc_004B4E6D: mov var_2C, eax
  loc_004B4E70: mov var_30, eax
  loc_004B4E73: mov var_34, eax
  loc_004B4E76: mov var_38, eax
  loc_004B4E79: mov var_48, eax
  loc_004B4E7C: mov var_58, eax
  loc_004B4E7F: mov var_68, eax
  loc_004B4E82: mov var_78, eax
  loc_004B4E85: mov var_88, eax
  loc_004B4E8B: mov var_98, eax
  loc_004B4E91: mov var_A8, eax
  loc_004B4E97: mov var_B8, eax
  loc_004B4E9D: mov var_C8, eax
  loc_004B4EA3: mov var_D8, eax
  loc_004B4EA9: push 00000001h
  loc_004B4EAB: call [004010A8h] ; __vbaOnError
  loc_004B4EB1: push 0000000Dh
  loc_004B4EB3: lea eax, var_48
  loc_004B4EB6: push eax
  loc_004B4EB7: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B4EBD: mov eax, 80020004h
  loc_004B4EC2: mov var_90, eax
  loc_004B4EC8: mov ecx, 0000000Ah
  loc_004B4ECD: mov var_98, ecx
  loc_004B4ED3: mov var_80, eax
  loc_004B4ED6: mov var_88, ecx
  loc_004B4EDC: mov var_C0, 0041F5E0h ; "SOFT"
  loc_004B4EE6: mov edi, 00000008h
  loc_004B4EEB: mov var_C8, edi
  loc_004B4EF1: lea edx, var_C8
  loc_004B4EF7: lea ecx, var_78
  loc_004B4EFA: call [00401240h] ; __vbaVarDup
  loc_004B4F00: mov var_A0, 00424B58h ; "Import process will take a few minutes."
  loc_004B4F0A: mov var_A8, edi
  loc_004B4F10: mov var_B0, 004255DCh ; "Are you sure to Import Data From MACHINE 2 ?"
  loc_004B4F1A: mov var_B8, edi
  loc_004B4F20: lea ecx, var_98
  loc_004B4F26: push ecx
  loc_004B4F27: lea edx, var_88
  loc_004B4F2D: push edx
  loc_004B4F2E: lea eax, var_78
  loc_004B4F31: push eax
  loc_004B4F32: push 00000144h
  loc_004B4F37: lea ecx, var_A8
  loc_004B4F3D: push ecx
  loc_004B4F3E: lea edx, var_48
  loc_004B4F41: push edx
  loc_004B4F42: lea eax, var_58
  loc_004B4F45: push eax
  loc_004B4F46: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B4F4C: call __vbaVarCat
  loc_004B4F4E: push eax
  loc_004B4F4F: lea ecx, var_B8
  loc_004B4F55: push ecx
  loc_004B4F56: lea edx, var_68
  loc_004B4F59: push edx
  loc_004B4F5A: call __vbaVarCat
  loc_004B4F5C: push eax
  loc_004B4F5D: call [004010A4h] ; rtcMsgBox
  loc_004B4F63: xor ebx, ebx
  loc_004B4F65: cmp eax, 00000006h
  loc_004B4F68: setz bl
  loc_004B4F6B: neg ebx
  loc_004B4F6D: lea eax, var_98
  loc_004B4F73: push eax
  loc_004B4F74: lea ecx, var_88
  loc_004B4F7A: push ecx
  loc_004B4F7B: lea edx, var_78
  loc_004B4F7E: push edx
  loc_004B4F7F: lea eax, var_68
  loc_004B4F82: push eax
  loc_004B4F83: lea ecx, var_58
  loc_004B4F86: push ecx
  loc_004B4F87: lea edx, var_48
  loc_004B4F8A: push edx
  loc_004B4F8B: push 00000006h
  loc_004B4F8D: call [00401038h] ; __vbaFreeVarList
  loc_004B4F93: add esp, 0000001Ch
  loc_004B4F96: test bx, bx
  loc_004B4F99: jz 004B592Bh
  loc_004B4F9F: mov edx, 0042563Ch ; "c:\Xerus\Crystal\Data\"
  loc_004B4FA4: lea ecx, var_24
  loc_004B4FA7: mov ebx, [004011ECh] ; __vbaStrCopy
  loc_004B4FAD: call ebx
  loc_004B4FAF: mov edx, 00425670h ; "H:\Xerus\Crystal\Data\"
  loc_004B4FB4: lea ecx, var_20
  loc_004B4FB7: call ebx
  loc_004B4FB9: mov eax, var_24
  loc_004B4FBC: push eax
  loc_004B4FBD: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B4FC2: call [00401054h] ; __vbaStrCat
  loc_004B4FC8: mov var_40, eax
  loc_004B4FCB: mov var_48, edi
  loc_004B4FCE: push 00000000h
  loc_004B4FD0: lea ecx, var_48
  loc_004B4FD3: push ecx
  loc_004B4FD4: call [004011C8h] ; rtcDir
  loc_004B4FDA: mov edx, eax
  loc_004B4FDC: lea ecx, var_30
  loc_004B4FDF: call [00401270h] ; __vbaStrMove
  loc_004B4FE5: push eax
  loc_004B4FE6: push 0041E5D4h
  loc_004B4FEB: call [0040110Ch] ; __vbaStrCmp
  loc_004B4FF1: mov ebx, eax
  loc_004B4FF3: neg ebx
  loc_004B4FF5: sbb ebx, ebx
  loc_004B4FF7: neg ebx
  loc_004B4FF9: neg ebx
  loc_004B4FFB: lea ecx, var_30
  loc_004B4FFE: call [004012ACh] ; __vbaFreeStr
  loc_004B5004: lea ecx, var_48
  loc_004B5007: call [00401020h] ; __vbaFreeVar
  loc_004B500D: test bx, bx
  loc_004B5010: jz 004B503Eh
  loc_004B5012: mov edx, var_24
  loc_004B5015: push edx
  loc_004B5016: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B501B: mov ebx, [00401054h] ; __vbaStrCat
  loc_004B5021: call ebx
  loc_004B5023: mov var_40, eax
  loc_004B5026: mov var_48, edi
  loc_004B5029: lea eax, var_48
  loc_004B502C: push eax
  loc_004B502D: call [00401108h] ; rtcKillFiles
  loc_004B5033: lea ecx, var_48
  loc_004B5036: call [00401020h] ; __vbaFreeVar
  loc_004B503C: jmp 004B5044h
  loc_004B503E: mov ebx, [00401054h] ; __vbaStrCat
  loc_004B5044: mov ecx, var_24
  loc_004B5047: push ecx
  loc_004B5048: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B504D: call ebx
  loc_004B504F: mov edx, eax
  loc_004B5051: lea ecx, var_34
  loc_004B5054: call [00401270h] ; __vbaStrMove
  loc_004B505A: push eax
  loc_004B505B: mov edx, var_20
  loc_004B505E: push edx
  loc_004B505F: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B5064: call ebx
  loc_004B5066: mov edx, eax
  loc_004B5068: lea ecx, var_30
  loc_004B506B: call [00401270h] ; __vbaStrMove
  loc_004B5071: push eax
  loc_004B5072: call [00401200h] ; rtcFileCopy
  loc_004B5078: lea eax, var_34
  loc_004B507B: push eax
  loc_004B507C: lea ecx, var_30
  loc_004B507F: push ecx
  loc_004B5080: push 00000002h
  loc_004B5082: call [004011FCh] ; __vbaFreeStrList
  loc_004B5088: add esp, 0000000Ch
  loc_004B508B: mov ebx, 80020004h
  loc_004B5090: mov var_B0, 00425C30h ; "DELETE * FROM LG WHERE (SrNo Between 1 And 1999) And OnCount='"
  loc_004B509A: mov var_B8, edi
  loc_004B50A0: mov var_A0, 0061A05Ch
  loc_004B50AA: mov var_A8, 00004008h
  loc_004B50B4: lea edx, var_A8
  loc_004B50BA: push edx
  loc_004B50BB: lea eax, var_48
  loc_004B50BE: push eax
  loc_004B50BF: call [004010D4h] ; rtcTrimVar
  loc_004B50C5: mov var_C0, 00425CB4h ; "' And MachineID=1"
  loc_004B50CF: mov var_C8, edi
  loc_004B50D5: mov ecx, [0061A13Ch]
  loc_004B50DB: mov edx, [ecx]
  loc_004B50DD: sub esp, 00000010h
  loc_004B50E0: mov ecx, esp
  loc_004B50E2: mov eax, 0000000Ah
  loc_004B50E7: mov [ecx], eax
  loc_004B50E9: mov eax, var_D4
  loc_004B50EF: mov [ecx+00000004h], eax
  loc_004B50F2: mov [ecx+00000008h], ebx
  loc_004B50F5: mov eax, var_CC
  loc_004B50FB: mov [ecx+0000000Ch], eax
  loc_004B50FE: lea ecx, var_B8
  loc_004B5104: push ecx
  loc_004B5105: lea eax, var_48
  loc_004B5108: push eax
  loc_004B5109: lea ecx, var_58
  loc_004B510C: push ecx
  loc_004B510D: mov var_104, edx
  loc_004B5113: call __vbaVarCat
  loc_004B5115: push eax
  loc_004B5116: lea edx, var_C8
  loc_004B511C: push edx
  loc_004B511D: lea eax, var_68
  loc_004B5120: push eax
  loc_004B5121: call __vbaVarCat
  loc_004B5123: push eax
  loc_004B5124: lea ecx, var_30
  loc_004B5127: push ecx
  loc_004B5128: call [004011B0h] ; __vbaStrVarVal
  loc_004B512E: push eax
  loc_004B512F: mov edx, [0061A13Ch]
  loc_004B5135: push edx
  loc_004B5136: mov eax, var_104
  loc_004B513C: call [eax+0000005Ch]
  loc_004B513F: fnclex
  loc_004B5141: test eax, eax
  loc_004B5143: jge 004B515Ah
  loc_004B5145: push 0000005Ch
  loc_004B5147: push 0041E928h
  loc_004B514C: mov ecx, [0061A13Ch]
  loc_004B5152: push ecx
  loc_004B5153: push eax
  loc_004B5154: call [00401074h] ; __vbaHresultCheckObj
  loc_004B515A: lea ecx, var_30
  loc_004B515D: call [004012ACh] ; __vbaFreeStr
  loc_004B5163: lea edx, var_68
  loc_004B5166: push edx
  loc_004B5167: lea eax, var_58
  loc_004B516A: push eax
  loc_004B516B: lea ecx, var_48
  loc_004B516E: push ecx
  loc_004B516F: push 00000003h
  loc_004B5171: call [00401038h] ; __vbaFreeVarList
  loc_004B5177: add esp, 00000010h
  loc_004B517A: mov ebx, 80020004h
  loc_004B517F: mov var_B0, 00425D38h ; "DELETE * FROM LGDETAIL WHERE (SrNo Between 1 And 1999) And OnCount='"
  loc_004B5189: mov var_B8, edi
  loc_004B518F: mov var_A0, 0061A05Ch
  loc_004B5199: mov var_A8, 00004008h
  loc_004B51A3: lea edx, var_A8
  loc_004B51A9: push edx
  loc_004B51AA: lea eax, var_48
  loc_004B51AD: push eax
  loc_004B51AE: call [004010D4h] ; rtcTrimVar
  loc_004B51B4: mov var_C0, 00425CB4h ; "' And MachineID=1"
  loc_004B51BE: mov var_C8, edi
  loc_004B51C4: mov ecx, [0061A13Ch]
  loc_004B51CA: mov edx, [ecx]
  loc_004B51CC: sub esp, 00000010h
  loc_004B51CF: mov ecx, esp
  loc_004B51D1: mov eax, 0000000Ah
  loc_004B51D6: mov [ecx], eax
  loc_004B51D8: mov eax, var_D4
  loc_004B51DE: mov [ecx+00000004h], eax
  loc_004B51E1: mov [ecx+00000008h], ebx
  loc_004B51E4: mov eax, var_CC
  loc_004B51EA: mov [ecx+0000000Ch], eax
  loc_004B51ED: lea ecx, var_B8
  loc_004B51F3: push ecx
  loc_004B51F4: lea eax, var_48
  loc_004B51F7: push eax
  loc_004B51F8: lea ecx, var_58
  loc_004B51FB: push ecx
  loc_004B51FC: mov var_108, edx
  loc_004B5202: call __vbaVarCat
  loc_004B5204: push eax
  loc_004B5205: lea edx, var_C8
  loc_004B520B: push edx
  loc_004B520C: lea eax, var_68
  loc_004B520F: push eax
  loc_004B5210: call __vbaVarCat
  loc_004B5212: push eax
  loc_004B5213: lea ecx, var_30
  loc_004B5216: push ecx
  loc_004B5217: call [004011B0h] ; __vbaStrVarVal
  loc_004B521D: push eax
  loc_004B521E: mov edx, [0061A13Ch]
  loc_004B5224: push edx
  loc_004B5225: mov eax, var_108
  loc_004B522B: call [eax+0000005Ch]
  loc_004B522E: fnclex
  loc_004B5230: test eax, eax
  loc_004B5232: jge 004B5249h
  loc_004B5234: push 0000005Ch
  loc_004B5236: push 0041E928h
  loc_004B523B: mov ecx, [0061A13Ch]
  loc_004B5241: push ecx
  loc_004B5242: push eax
  loc_004B5243: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5249: lea ecx, var_30
  loc_004B524C: call [004012ACh] ; __vbaFreeStr
  loc_004B5252: lea edx, var_68
  loc_004B5255: push edx
  loc_004B5256: lea eax, var_58
  loc_004B5259: push eax
  loc_004B525A: lea ecx, var_48
  loc_004B525D: push ecx
  loc_004B525E: push 00000003h
  loc_004B5260: call [00401038h] ; __vbaFreeVarList
  loc_004B5266: add esp, 00000010h
  loc_004B5269: mov ebx, 80020004h
  loc_004B526E: mov var_B0, 00425DC8h ; "DELETE * FROM LGSale WHERE (SrNo Between 1 And 1999) And OnCount='"
  loc_004B5278: mov var_B8, edi
  loc_004B527E: mov var_A0, 0061A05Ch
  loc_004B5288: mov var_A8, 00004008h
  loc_004B5292: lea edx, var_A8
  loc_004B5298: push edx
  loc_004B5299: lea eax, var_48
  loc_004B529C: push eax
  loc_004B529D: call [004010D4h] ; rtcTrimVar
  loc_004B52A3: mov var_C0, 00425CB4h ; "' And MachineID=1"
  loc_004B52AD: mov var_C8, edi
  loc_004B52B3: mov ecx, [0061A13Ch]
  loc_004B52B9: mov edx, [ecx]
  loc_004B52BB: sub esp, 00000010h
  loc_004B52BE: mov ecx, esp
  loc_004B52C0: mov eax, 0000000Ah
  loc_004B52C5: mov [ecx], eax
  loc_004B52C7: mov eax, var_D4
  loc_004B52CD: mov [ecx+00000004h], eax
  loc_004B52D0: mov [ecx+00000008h], ebx
  loc_004B52D3: mov eax, var_CC
  loc_004B52D9: mov [ecx+0000000Ch], eax
  loc_004B52DC: lea ecx, var_B8
  loc_004B52E2: push ecx
  loc_004B52E3: lea eax, var_48
  loc_004B52E6: push eax
  loc_004B52E7: lea ecx, var_58
  loc_004B52EA: push ecx
  loc_004B52EB: mov var_10C, edx
  loc_004B52F1: call __vbaVarCat
  loc_004B52F3: push eax
  loc_004B52F4: lea edx, var_C8
  loc_004B52FA: push edx
  loc_004B52FB: lea eax, var_68
  loc_004B52FE: push eax
  loc_004B52FF: call __vbaVarCat
  loc_004B5301: push eax
  loc_004B5302: lea ecx, var_30
  loc_004B5305: push ecx
  loc_004B5306: call [004011B0h] ; __vbaStrVarVal
  loc_004B530C: push eax
  loc_004B530D: mov edx, [0061A13Ch]
  loc_004B5313: push edx
  loc_004B5314: mov eax, var_10C
  loc_004B531A: call [eax+0000005Ch]
  loc_004B531D: fnclex
  loc_004B531F: test eax, eax
  loc_004B5321: jge 004B5338h
  loc_004B5323: push 0000005Ch
  loc_004B5325: push 0041E928h
  loc_004B532A: mov ecx, [0061A13Ch]
  loc_004B5330: push ecx
  loc_004B5331: push eax
  loc_004B5332: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5338: lea ecx, var_30
  loc_004B533B: call [004012ACh] ; __vbaFreeStr
  loc_004B5341: lea edx, var_68
  loc_004B5344: push edx
  loc_004B5345: lea eax, var_58
  loc_004B5348: push eax
  loc_004B5349: lea ecx, var_48
  loc_004B534C: push ecx
  loc_004B534D: push 00000003h
  loc_004B534F: call [00401038h] ; __vbaFreeVarList
  loc_004B5355: add esp, 00000010h
  loc_004B5358: mov ebx, 80020004h
  loc_004B535D: mov var_B0, 00425E54h ; "DELETE * FROM LGSaleDETAIL WHERE (SrNo Between 1 And 1999) And OnCount='"
  loc_004B5367: mov var_B8, edi
  loc_004B536D: mov var_A0, 0061A05Ch
  loc_004B5377: mov var_A8, 00004008h
  loc_004B5381: lea edx, var_A8
  loc_004B5387: push edx
  loc_004B5388: lea eax, var_48
  loc_004B538B: push eax
  loc_004B538C: call [004010D4h] ; rtcTrimVar
  loc_004B5392: mov var_C0, 00425CB4h ; "' And MachineID=1"
  loc_004B539C: mov var_C8, edi
  loc_004B53A2: mov ecx, [0061A13Ch]
  loc_004B53A8: mov edx, [ecx]
  loc_004B53AA: sub esp, 00000010h
  loc_004B53AD: mov ecx, esp
  loc_004B53AF: mov eax, 0000000Ah
  loc_004B53B4: mov [ecx], eax
  loc_004B53B6: mov eax, var_D4
  loc_004B53BC: mov [ecx+00000004h], eax
  loc_004B53BF: mov [ecx+00000008h], ebx
  loc_004B53C2: mov eax, var_CC
  loc_004B53C8: mov [ecx+0000000Ch], eax
  loc_004B53CB: lea ecx, var_B8
  loc_004B53D1: push ecx
  loc_004B53D2: lea eax, var_48
  loc_004B53D5: push eax
  loc_004B53D6: lea ecx, var_58
  loc_004B53D9: push ecx
  loc_004B53DA: mov var_110, edx
  loc_004B53E0: call __vbaVarCat
  loc_004B53E2: push eax
  loc_004B53E3: lea edx, var_C8
  loc_004B53E9: push edx
  loc_004B53EA: lea eax, var_68
  loc_004B53ED: push eax
  loc_004B53EE: call __vbaVarCat
  loc_004B53F0: push eax
  loc_004B53F1: lea ecx, var_30
  loc_004B53F4: push ecx
  loc_004B53F5: call [004011B0h] ; __vbaStrVarVal
  loc_004B53FB: push eax
  loc_004B53FC: mov edx, [0061A13Ch]
  loc_004B5402: push edx
  loc_004B5403: mov eax, var_110
  loc_004B5409: call [eax+0000005Ch]
  loc_004B540C: fnclex
  loc_004B540E: test eax, eax
  loc_004B5410: jge 004B5427h
  loc_004B5412: push 0000005Ch
  loc_004B5414: push 0041E928h
  loc_004B5419: mov ecx, [0061A13Ch]
  loc_004B541F: push ecx
  loc_004B5420: push eax
  loc_004B5421: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5427: lea ecx, var_30
  loc_004B542A: call [004012ACh] ; __vbaFreeStr
  loc_004B5430: lea edx, var_68
  loc_004B5433: push edx
  loc_004B5434: lea eax, var_58
  loc_004B5437: push eax
  loc_004B5438: lea ecx, var_48
  loc_004B543B: push ecx
  loc_004B543C: push 00000003h
  loc_004B543E: call [00401038h] ; __vbaFreeVarList
  loc_004B5444: add esp, 00000010h
  loc_004B5447: mov ebx, 80020004h
  loc_004B544C: mov var_B0, 0042581Ch ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B5456: mov var_B8, edi
  loc_004B545C: mov var_A0, 0061A05Ch
  loc_004B5466: mov var_A8, 00004008h
  loc_004B5470: lea edx, var_A8
  loc_004B5476: push edx
  loc_004B5477: lea eax, var_48
  loc_004B547A: push eax
  loc_004B547B: call [004010D4h] ; rtcTrimVar
  loc_004B5481: mov var_C0, 00425EECh ; "' and MachineID=1"
  loc_004B548B: mov var_C8, edi
  loc_004B5491: mov ecx, [0061A13Ch]
  loc_004B5497: mov edx, [ecx]
  loc_004B5499: sub esp, 00000010h
  loc_004B549C: mov ecx, esp
  loc_004B549E: mov eax, 0000000Ah
  loc_004B54A3: mov [ecx], eax
  loc_004B54A5: mov eax, var_D4
  loc_004B54AB: mov [ecx+00000004h], eax
  loc_004B54AE: mov [ecx+00000008h], ebx
  loc_004B54B1: mov eax, var_CC
  loc_004B54B7: mov [ecx+0000000Ch], eax
  loc_004B54BA: lea ecx, var_B8
  loc_004B54C0: push ecx
  loc_004B54C1: lea eax, var_48
  loc_004B54C4: push eax
  loc_004B54C5: lea ecx, var_58
  loc_004B54C8: push ecx
  loc_004B54C9: mov var_114, edx
  loc_004B54CF: call __vbaVarCat
  loc_004B54D1: push eax
  loc_004B54D2: lea edx, var_C8
  loc_004B54D8: push edx
  loc_004B54D9: lea eax, var_68
  loc_004B54DC: push eax
  loc_004B54DD: call __vbaVarCat
  loc_004B54DF: push eax
  loc_004B54E0: lea ecx, var_30
  loc_004B54E3: push ecx
  loc_004B54E4: call [004011B0h] ; __vbaStrVarVal
  loc_004B54EA: push eax
  loc_004B54EB: mov edx, [0061A13Ch]
  loc_004B54F1: push edx
  loc_004B54F2: mov eax, var_114
  loc_004B54F8: call [eax+0000005Ch]
  loc_004B54FB: fnclex
  loc_004B54FD: test eax, eax
  loc_004B54FF: jge 004B5516h
  loc_004B5501: push 0000005Ch
  loc_004B5503: push 0041E928h
  loc_004B5508: mov ecx, [0061A13Ch]
  loc_004B550E: push ecx
  loc_004B550F: push eax
  loc_004B5510: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5516: lea ecx, var_30
  loc_004B5519: call [004012ACh] ; __vbaFreeStr
  loc_004B551F: lea edx, var_68
  loc_004B5522: push edx
  loc_004B5523: lea eax, var_58
  loc_004B5526: push eax
  loc_004B5527: lea ecx, var_48
  loc_004B552A: push ecx
  loc_004B552B: push 00000003h
  loc_004B552D: call [00401038h] ; __vbaFreeVarList
  loc_004B5533: add esp, 00000010h
  loc_004B5536: mov ebx, 80020004h
  loc_004B553B: mov var_B0, 00425964h ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B5545: mov var_B8, edi
  loc_004B554B: mov var_A0, 0061A05Ch
  loc_004B5555: mov var_A8, 00004008h
  loc_004B555F: lea edx, var_A8
  loc_004B5565: push edx
  loc_004B5566: lea eax, var_48
  loc_004B5569: push eax
  loc_004B556A: call [004010D4h] ; rtcTrimVar
  loc_004B5570: mov var_C0, 00425EECh ; "' and MachineID=1"
  loc_004B557A: mov var_C8, edi
  loc_004B5580: mov ecx, [0061A13Ch]
  loc_004B5586: mov edx, [ecx]
  loc_004B5588: sub esp, 00000010h
  loc_004B558B: mov ecx, esp
  loc_004B558D: mov eax, 0000000Ah
  loc_004B5592: mov [ecx], eax
  loc_004B5594: mov eax, var_D4
  loc_004B559A: mov [ecx+00000004h], eax
  loc_004B559D: mov [ecx+00000008h], ebx
  loc_004B55A0: mov eax, var_CC
  loc_004B55A6: mov [ecx+0000000Ch], eax
  loc_004B55A9: lea ecx, var_B8
  loc_004B55AF: push ecx
  loc_004B55B0: lea eax, var_48
  loc_004B55B3: push eax
  loc_004B55B4: lea ecx, var_58
  loc_004B55B7: push ecx
  loc_004B55B8: mov var_118, edx
  loc_004B55BE: call __vbaVarCat
  loc_004B55C0: push eax
  loc_004B55C1: lea edx, var_C8
  loc_004B55C7: push edx
  loc_004B55C8: lea eax, var_68
  loc_004B55CB: push eax
  loc_004B55CC: call __vbaVarCat
  loc_004B55CE: push eax
  loc_004B55CF: lea ecx, var_30
  loc_004B55D2: push ecx
  loc_004B55D3: call [004011B0h] ; __vbaStrVarVal
  loc_004B55D9: push eax
  loc_004B55DA: mov edx, [0061A13Ch]
  loc_004B55E0: push edx
  loc_004B55E1: mov eax, var_118
  loc_004B55E7: call [eax+0000005Ch]
  loc_004B55EA: fnclex
  loc_004B55EC: test eax, eax
  loc_004B55EE: jge 004B5605h
  loc_004B55F0: push 0000005Ch
  loc_004B55F2: push 0041E928h
  loc_004B55F7: mov ecx, [0061A13Ch]
  loc_004B55FD: push ecx
  loc_004B55FE: push eax
  loc_004B55FF: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5605: lea ecx, var_30
  loc_004B5608: call [004012ACh] ; __vbaFreeStr
  loc_004B560E: lea edx, var_68
  loc_004B5611: push edx
  loc_004B5612: lea eax, var_58
  loc_004B5615: push eax
  loc_004B5616: lea ecx, var_48
  loc_004B5619: push ecx
  loc_004B561A: push 00000003h
  loc_004B561C: call [00401038h] ; __vbaFreeVarList
  loc_004B5622: add esp, 00000010h
  loc_004B5625: mov ebx, 80020004h
  loc_004B562A: mov var_B0, 00425A30h ; "INSERT INTO LGSale SELECT * FROM LGSale IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B5634: mov var_B8, edi
  loc_004B563A: mov var_A0, 0061A05Ch
  loc_004B5644: mov var_A8, 00004008h
  loc_004B564E: lea edx, var_A8
  loc_004B5654: push edx
  loc_004B5655: lea eax, var_48
  loc_004B5658: push eax
  loc_004B5659: call [004010D4h] ; rtcTrimVar
  loc_004B565F: mov var_C0, 00425EECh ; "' and MachineID=1"
  loc_004B5669: mov var_C8, edi
  loc_004B566F: mov ecx, [0061A13Ch]
  loc_004B5675: mov edx, [ecx]
  loc_004B5677: sub esp, 00000010h
  loc_004B567A: mov ecx, esp
  loc_004B567C: mov eax, 0000000Ah
  loc_004B5681: mov [ecx], eax
  loc_004B5683: mov eax, var_D4
  loc_004B5689: mov [ecx+00000004h], eax
  loc_004B568C: mov [ecx+00000008h], ebx
  loc_004B568F: mov eax, var_CC
  loc_004B5695: mov [ecx+0000000Ch], eax
  loc_004B5698: lea ecx, var_B8
  loc_004B569E: push ecx
  loc_004B569F: lea eax, var_48
  loc_004B56A2: push eax
  loc_004B56A3: lea ecx, var_58
  loc_004B56A6: push ecx
  loc_004B56A7: mov var_11C, edx
  loc_004B56AD: call __vbaVarCat
  loc_004B56AF: push eax
  loc_004B56B0: lea edx, var_C8
  loc_004B56B6: push edx
  loc_004B56B7: lea eax, var_68
  loc_004B56BA: push eax
  loc_004B56BB: call __vbaVarCat
  loc_004B56BD: push eax
  loc_004B56BE: lea ecx, var_30
  loc_004B56C1: push ecx
  loc_004B56C2: call [004011B0h] ; __vbaStrVarVal
  loc_004B56C8: push eax
  loc_004B56C9: mov edx, [0061A13Ch]
  loc_004B56CF: push edx
  loc_004B56D0: mov eax, var_11C
  loc_004B56D6: call [eax+0000005Ch]
  loc_004B56D9: fnclex
  loc_004B56DB: test eax, eax
  loc_004B56DD: jge 004B56F4h
  loc_004B56DF: push 0000005Ch
  loc_004B56E1: push 0041E928h
  loc_004B56E6: mov ecx, [0061A13Ch]
  loc_004B56EC: push ecx
  loc_004B56ED: push eax
  loc_004B56EE: call [00401074h] ; __vbaHresultCheckObj
  loc_004B56F4: lea ecx, var_30
  loc_004B56F7: call [004012ACh] ; __vbaFreeStr
  loc_004B56FD: lea edx, var_68
  loc_004B5700: push edx
  loc_004B5701: lea eax, var_58
  loc_004B5704: push eax
  loc_004B5705: lea ecx, var_48
  loc_004B5708: push ecx
  loc_004B5709: push 00000003h
  loc_004B570B: call [00401038h] ; __vbaFreeVarList
  loc_004B5711: add esp, 00000010h
  loc_004B5714: mov ebx, 80020004h
  loc_004B5719: mov var_B0, 00425B54h ; "INSERT INTO LGSaleDetail SELECT * FROM LGSaleDetail IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B5723: mov var_B8, edi
  loc_004B5729: mov var_A0, 0061A05Ch
  loc_004B5733: mov var_A8, 00004008h
  loc_004B573D: lea edx, var_A8
  loc_004B5743: push edx
  loc_004B5744: lea eax, var_48
  loc_004B5747: push eax
  loc_004B5748: call [004010D4h] ; rtcTrimVar
  loc_004B574E: mov var_C0, 00425EECh ; "' and MachineID=1"
  loc_004B5758: mov var_C8, edi
  loc_004B575E: mov ecx, [0061A13Ch]
  loc_004B5764: mov edx, [ecx]
  loc_004B5766: sub esp, 00000010h
  loc_004B5769: mov ecx, esp
  loc_004B576B: mov eax, 0000000Ah
  loc_004B5770: mov [ecx], eax
  loc_004B5772: mov eax, var_D4
  loc_004B5778: mov [ecx+00000004h], eax
  loc_004B577B: mov [ecx+00000008h], ebx
  loc_004B577E: mov eax, var_CC
  loc_004B5784: mov [ecx+0000000Ch], eax
  loc_004B5787: lea ecx, var_B8
  loc_004B578D: push ecx
  loc_004B578E: lea eax, var_48
  loc_004B5791: push eax
  loc_004B5792: lea ecx, var_58
  loc_004B5795: push ecx
  loc_004B5796: mov var_120, edx
  loc_004B579C: call __vbaVarCat
  loc_004B579E: push eax
  loc_004B579F: lea edx, var_C8
  loc_004B57A5: push edx
  loc_004B57A6: lea eax, var_68
  loc_004B57A9: push eax
  loc_004B57AA: call __vbaVarCat
  loc_004B57AC: push eax
  loc_004B57AD: lea ecx, var_30
  loc_004B57B0: push ecx
  loc_004B57B1: call [004011B0h] ; __vbaStrVarVal
  loc_004B57B7: push eax
  loc_004B57B8: mov edx, [0061A13Ch]
  loc_004B57BE: push edx
  loc_004B57BF: mov eax, var_120
  loc_004B57C5: call [eax+0000005Ch]
  loc_004B57C8: fnclex
  loc_004B57CA: test eax, eax
  loc_004B57CC: jge 004B57E3h
  loc_004B57CE: push 0000005Ch
  loc_004B57D0: push 0041E928h
  loc_004B57D5: mov ecx, [0061A13Ch]
  loc_004B57DB: push ecx
  loc_004B57DC: push eax
  loc_004B57DD: call [00401074h] ; __vbaHresultCheckObj
  loc_004B57E3: lea ecx, var_30
  loc_004B57E6: call [004012ACh] ; __vbaFreeStr
  loc_004B57EC: lea edx, var_68
  loc_004B57EF: push edx
  loc_004B57F0: lea eax, var_58
  loc_004B57F3: push eax
  loc_004B57F4: lea ecx, var_48
  loc_004B57F7: push ecx
  loc_004B57F8: push 00000003h
  loc_004B57FA: mov esi, [00401038h] ; __vbaFreeVarList
  loc_004B5800: call __vbaFreeVarList
  loc_004B5802: add esp, 00000010h
  loc_004B5805: mov ecx, 80020004h
  loc_004B580A: mov var_70, ecx
  loc_004B580D: mov eax, 0000000Ah
  loc_004B5812: mov var_78, eax
  loc_004B5815: mov var_60, ecx
  loc_004B5818: mov var_68, eax
  loc_004B581B: mov var_50, ecx
  loc_004B581E: mov var_58, eax
  loc_004B5821: mov var_A0, 00424F94h ; "Finish Import!"
  loc_004B582B: mov var_A8, edi
  loc_004B5831: lea edx, var_A8
  loc_004B5837: lea ecx, var_48
  loc_004B583A: call [00401240h] ; __vbaVarDup
  loc_004B5840: lea edx, var_78
  loc_004B5843: push edx
  loc_004B5844: lea eax, var_68
  loc_004B5847: push eax
  loc_004B5848: lea ecx, var_58
  loc_004B584B: push ecx
  loc_004B584C: push 00000040h
  loc_004B584E: lea edx, var_48
  loc_004B5851: push edx
  loc_004B5852: call [004010A4h] ; rtcMsgBox
  loc_004B5858: lea eax, var_78
  loc_004B585B: push eax
  loc_004B585C: lea ecx, var_68
  loc_004B585F: push ecx
  loc_004B5860: lea edx, var_58
  loc_004B5863: push edx
  loc_004B5864: lea eax, var_48
  loc_004B5867: push eax
  loc_004B5868: push 00000004h
  loc_004B586A: call __vbaFreeVarList
  loc_004B586C: add esp, 00000014h
  loc_004B586F: call [00401094h] ; __vbaExitProc
  loc_004B5875: push 004B599Fh
  loc_004B587A: jmp 004B597Eh
  loc_004B587F: mov ecx, 80020004h
  loc_004B5884: mov var_70, ecx
  loc_004B5887: mov eax, 0000000Ah
  loc_004B588C: mov var_78, eax
  loc_004B588F: mov var_60, ecx
  loc_004B5892: mov var_68, eax
  loc_004B5895: mov var_50, ecx
  loc_004B5898: mov var_58, eax
  loc_004B589B: call [00401210h] ; rtcErrObj
  loc_004B58A1: push eax
  loc_004B58A2: lea ecx, var_38
  loc_004B58A5: push ecx
  loc_004B58A6: call [004010A0h] ; __vbaObjSet
  loc_004B58AC: mov esi, eax
  loc_004B58AE: mov edx, [esi]
  loc_004B58B0: lea eax, var_30
  loc_004B58B3: push eax
  loc_004B58B4: push esi
  loc_004B58B5: call [edx+0000002Ch]
  loc_004B58B8: fnclex
  loc_004B58BA: test eax, eax
  loc_004B58BC: jge 004B58CDh
  loc_004B58BE: push 0000002Ch
  loc_004B58C0: push 0042150Ch
  loc_004B58C5: push esi
  loc_004B58C6: push eax
  loc_004B58C7: call [00401074h] ; __vbaHresultCheckObj
  loc_004B58CD: push 00424FB8h ; "Cann't Import !!! "
  loc_004B58D2: mov ecx, var_30
  loc_004B58D5: push ecx
  loc_004B58D6: call [00401054h] ; __vbaStrCat
  loc_004B58DC: mov var_40, eax
  loc_004B58DF: mov var_48, 00000008h
  loc_004B58E6: lea edx, var_78
  loc_004B58E9: push edx
  loc_004B58EA: lea eax, var_68
  loc_004B58ED: push eax
  loc_004B58EE: lea ecx, var_58
  loc_004B58F1: push ecx
  loc_004B58F2: push 00000000h
  loc_004B58F4: lea edx, var_48
  loc_004B58F7: push edx
  loc_004B58F8: call [004010A4h] ; rtcMsgBox
  loc_004B58FE: lea ecx, var_30
  loc_004B5901: call [004012ACh] ; __vbaFreeStr
  loc_004B5907: lea ecx, var_38
  loc_004B590A: call [004012B0h] ; __vbaFreeObj
  loc_004B5910: lea eax, var_78
  loc_004B5913: push eax
  loc_004B5914: lea ecx, var_68
  loc_004B5917: push ecx
  loc_004B5918: lea edx, var_58
  loc_004B591B: push edx
  loc_004B591C: lea eax, var_48
  loc_004B591F: push eax
  loc_004B5920: push 00000004h
  loc_004B5922: call [00401038h] ; __vbaFreeVarList
  loc_004B5928: add esp, 00000014h
  loc_004B592B: call [00401094h] ; __vbaExitProc
  loc_004B5931: push 004B599Fh
  loc_004B5936: jmp 004B597Eh
  loc_004B5938: lea ecx, var_34
  loc_004B593B: push ecx
  loc_004B593C: lea edx, var_30
  loc_004B593F: push edx
  loc_004B5940: push 00000002h
  loc_004B5942: call [004011FCh] ; __vbaFreeStrList
  loc_004B5948: add esp, 0000000Ch
  loc_004B594B: lea ecx, var_38
  loc_004B594E: call [004012B0h] ; __vbaFreeObj
  loc_004B5954: lea eax, var_98
  loc_004B595A: push eax
  loc_004B595B: lea ecx, var_88
  loc_004B5961: push ecx
  loc_004B5962: lea edx, var_78
  loc_004B5965: push edx
  loc_004B5966: lea eax, var_68
  loc_004B5969: push eax
  loc_004B596A: lea ecx, var_58
  loc_004B596D: push ecx
  loc_004B596E: lea edx, var_48
  loc_004B5971: push edx
  loc_004B5972: push 00000006h
  loc_004B5974: call [00401038h] ; __vbaFreeVarList
  loc_004B597A: add esp, 0000001Ch
  loc_004B597D: ret
  loc_004B597E: lea ecx, var_20
  loc_004B5981: mov esi, [004012ACh] ; __vbaFreeStr
  loc_004B5987: call __vbaFreeStr
  loc_004B5989: lea ecx, var_24
  loc_004B598C: call __vbaFreeStr
  loc_004B598E: lea ecx, var_28
  loc_004B5991: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B5997: call __vbaFreeObj
  loc_004B5999: lea ecx, var_2C
  loc_004B599C: call __vbaFreeObj
  loc_004B599E: ret
  loc_004B599F: mov ecx, var_1C
  loc_004B59A2: mov fs:[00000000h], ecx
  loc_004B59A9: pop edi
  loc_004B59AA: pop esi
  loc_004B59AB: pop ebx
  loc_004B59AC: mov esp, ebp
  loc_004B59AE: pop ebp
  loc_004B59AF: ret
  loc_004B59B0: push ebp
  loc_004B59B1: mov ebp, esp
  loc_004B59B3: sub esp, 00000014h
  loc_004B59B6: push 00403B36h ; __vbaExceptHandler
  loc_004B59BB: mov eax, fs:[00000000h]
  loc_004B59C1: push eax
  loc_004B59C2: mov fs:[00000000h], esp
  loc_004B59C9: sub esp, 000000F4h
  loc_004B59CF: push ebx
  loc_004B59D0: push esi
  loc_004B59D1: push edi
  loc_004B59D2: mov var_14, esp
  loc_004B59D5: mov var_10, 00401D50h
  loc_004B59DC: xor ebx, ebx
  loc_004B59DE: mov var_C, ebx
  loc_004B59E1: mov var_8, ebx
  loc_004B59E4: mov var_20, ebx
  loc_004B59E7: mov var_24, ebx
  loc_004B59EA: mov var_28, ebx
  loc_004B59ED: mov var_2C, ebx
  loc_004B59F0: mov var_30, ebx
  loc_004B59F3: mov var_34, ebx
  loc_004B59F6: mov var_44, ebx
  loc_004B59F9: mov var_54, ebx
  loc_004B59FC: mov var_64, ebx
  loc_004B59FF: mov var_74, ebx
  loc_004B5A02: mov var_84, ebx
  loc_004B5A08: mov var_94, ebx
  loc_004B5A0E: mov var_A4, ebx
  loc_004B5A14: mov var_B4, ebx
  loc_004B5A1A: mov var_C4, ebx
  loc_004B5A20: mov var_D4, ebx
  loc_004B5A26: push 00000001h
  loc_004B5A28: call [004010A8h] ; __vbaOnError
  loc_004B5A2E: push 0000000Dh
  loc_004B5A30: lea eax, var_44
  loc_004B5A33: push eax
  loc_004B5A34: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B5A3A: mov eax, 80020004h
  loc_004B5A3F: mov var_8C, eax
  loc_004B5A45: mov ecx, 0000000Ah
  loc_004B5A4A: mov var_94, ecx
  loc_004B5A50: mov var_7C, eax
  loc_004B5A53: mov var_84, ecx
  loc_004B5A59: mov var_BC, 0041F5E0h ; "SOFT"
  loc_004B5A63: mov esi, 00000008h
  loc_004B5A68: mov var_C4, esi
  loc_004B5A6E: lea edx, var_C4
  loc_004B5A74: lea ecx, var_74
  loc_004B5A77: call [00401240h] ; __vbaVarDup
  loc_004B5A7D: mov var_9C, 00424FE4h ; "Export process will take a few minutes."
  loc_004B5A87: mov var_A4, esi
  loc_004B5A8D: mov var_AC, 00425CDCh ; "Are you sure to Export data to Machine 1 ?"
  loc_004B5A97: mov var_B4, esi
  loc_004B5A9D: lea ecx, var_94
  loc_004B5AA3: push ecx
  loc_004B5AA4: lea edx, var_84
  loc_004B5AAA: push edx
  loc_004B5AAB: lea eax, var_74
  loc_004B5AAE: push eax
  loc_004B5AAF: push 00000144h
  loc_004B5AB4: lea ecx, var_A4
  loc_004B5ABA: push ecx
  loc_004B5ABB: lea edx, var_44
  loc_004B5ABE: push edx
  loc_004B5ABF: lea eax, var_54
  loc_004B5AC2: push eax
  loc_004B5AC3: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B5AC9: call __vbaVarCat
  loc_004B5ACB: push eax
  loc_004B5ACC: lea ecx, var_B4
  loc_004B5AD2: push ecx
  loc_004B5AD3: lea edx, var_64
  loc_004B5AD6: push edx
  loc_004B5AD7: call __vbaVarCat
  loc_004B5AD9: push eax
  loc_004B5ADA: call [004010A4h] ; rtcMsgBox
  loc_004B5AE0: xor ecx, ecx
  loc_004B5AE2: cmp eax, 00000006h
  loc_004B5AE5: setz cl
  loc_004B5AE8: neg ecx
  loc_004B5AEA: mov di, cx
  loc_004B5AED: lea edx, var_94
  loc_004B5AF3: push edx
  loc_004B5AF4: lea eax, var_84
  loc_004B5AFA: push eax
  loc_004B5AFB: lea ecx, var_74
  loc_004B5AFE: push ecx
  loc_004B5AFF: lea edx, var_64
  loc_004B5B02: push edx
  loc_004B5B03: lea eax, var_54
  loc_004B5B06: push eax
  loc_004B5B07: lea ecx, var_44
  loc_004B5B0A: push ecx
  loc_004B5B0B: push 00000006h
  loc_004B5B0D: call [00401038h] ; __vbaFreeVarList
  loc_004B5B13: add esp, 0000001Ch
  loc_004B5B16: cmp di, bx
  loc_004B5B19: jz 004B6484h
  loc_004B5B1F: cmp [0061B3B4h], ebx
  loc_004B5B25: jnz 004B5B37h
  loc_004B5B27: push 0061B3B4h
  loc_004B5B2C: push 004245F0h
  loc_004B5B31: call [004011DCh] ; __vbaNew2
  loc_004B5B37: mov edi, [0061B3B4h]
  loc_004B5B3D: mov eax, 80020004h
  loc_004B5B42: mov var_BC, eax
  loc_004B5B48: mov ecx, 0000000Ah
  loc_004B5B4D: mov var_C4, ecx
  loc_004B5B53: mov var_AC, eax
  loc_004B5B59: mov var_B4, ecx
  loc_004B5B5F: mov var_9C, eax
  loc_004B5B65: mov var_A4, ecx
  loc_004B5B6B: mov edx, [edi]
  loc_004B5B6D: lea ebx, var_34
  loc_004B5B70: push ebx
  loc_004B5B71: sub esp, 00000010h
  loc_004B5B74: mov ebx, esp
  loc_004B5B76: mov [ebx], ecx
  loc_004B5B78: mov ecx, var_C0
  loc_004B5B7E: mov [ebx+00000004h], ecx
  loc_004B5B81: mov [ebx+00000008h], eax
  loc_004B5B84: mov eax, var_B8
  loc_004B5B8A: mov [ebx+0000000Ch], eax
  loc_004B5B8D: sub esp, 00000010h
  loc_004B5B90: mov ecx, esp
  loc_004B5B92: mov eax, var_B4
  loc_004B5B98: mov [ecx], eax
  loc_004B5B9A: mov eax, var_B0
  loc_004B5BA0: mov [ecx+00000004h], eax
  loc_004B5BA3: mov eax, var_AC
  loc_004B5BA9: mov [ecx+00000008h], eax
  loc_004B5BAC: mov eax, var_A8
  loc_004B5BB2: mov [ecx+0000000Ch], eax
  loc_004B5BB5: sub esp, 00000010h
  loc_004B5BB8: mov ecx, esp
  loc_004B5BBA: mov eax, var_A4
  loc_004B5BC0: mov [ecx], eax
  loc_004B5BC2: mov eax, var_A0
  loc_004B5BC8: mov [ecx+00000004h], eax
  loc_004B5BCB: mov eax, var_9C
  loc_004B5BD1: mov [ecx+00000008h], eax
  loc_004B5BD4: mov eax, var_98
  loc_004B5BDA: mov [ecx+0000000Ch], eax
  loc_004B5BDD: push 00425AF4h ; "c:\Xerus\Crystal\Data\TMPXDB2.mdb"
  loc_004B5BE2: push edi
  loc_004B5BE3: call [edx+00000058h]
  loc_004B5BE6: fnclex
  loc_004B5BE8: test eax, eax
  loc_004B5BEA: jge 004B5BFBh
  loc_004B5BEC: push 00000058h
  loc_004B5BEE: push 004245E0h
  loc_004B5BF3: push edi
  loc_004B5BF4: push eax
  loc_004B5BF5: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5BFB: mov eax, var_34
  loc_004B5BFE: mov var_34, 00000000h
  loc_004B5C05: push eax
  loc_004B5C06: lea ecx, var_28
  loc_004B5C09: push ecx
  loc_004B5C0A: call [004010A0h] ; __vbaObjSet
  loc_004B5C10: mov eax, 80020004h
  loc_004B5C15: mov var_9C, eax
  loc_004B5C1B: mov ecx, 0000000Ah
  loc_004B5C20: mov var_A4, ecx
  loc_004B5C26: mov edx, var_28
  loc_004B5C29: mov edi, [edx]
  loc_004B5C2B: sub esp, 00000010h
  loc_004B5C2E: mov ebx, esp
  loc_004B5C30: mov [ebx], ecx
  loc_004B5C32: mov ecx, var_A0
  loc_004B5C38: mov [ebx+00000004h], ecx
  loc_004B5C3B: mov [ebx+00000008h], eax
  loc_004B5C3E: mov eax, var_98
  loc_004B5C44: mov [ebx+0000000Ch], eax
  loc_004B5C47: push 0042508Ch ; "Delete * From LG"
  loc_004B5C4C: push edx
  loc_004B5C4D: call [edi+0000005Ch]
  loc_004B5C50: fnclex
  loc_004B5C52: test eax, eax
  loc_004B5C54: jge 004B5C68h
  loc_004B5C56: push 0000005Ch
  loc_004B5C58: push 0041E928h
  loc_004B5C5D: mov ecx, var_28
  loc_004B5C60: push ecx
  loc_004B5C61: push eax
  loc_004B5C62: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5C68: mov eax, 80020004h
  loc_004B5C6D: mov var_9C, eax
  loc_004B5C73: mov ecx, 0000000Ah
  loc_004B5C78: mov var_A4, ecx
  loc_004B5C7E: mov edx, var_28
  loc_004B5C81: mov edi, [edx]
  loc_004B5C83: sub esp, 00000010h
  loc_004B5C86: mov ebx, esp
  loc_004B5C88: mov [ebx], ecx
  loc_004B5C8A: mov ecx, var_A0
  loc_004B5C90: mov [ebx+00000004h], ecx
  loc_004B5C93: mov [ebx+00000008h], eax
  loc_004B5C96: mov eax, var_98
  loc_004B5C9C: mov [ebx+0000000Ch], eax
  loc_004B5C9F: push 004250B4h ; "Delete * From LGDetail"
  loc_004B5CA4: push edx
  loc_004B5CA5: call [edi+0000005Ch]
  loc_004B5CA8: fnclex
  loc_004B5CAA: test eax, eax
  loc_004B5CAC: jge 004B5CC0h
  loc_004B5CAE: push 0000005Ch
  loc_004B5CB0: push 0041E928h
  loc_004B5CB5: mov ecx, var_28
  loc_004B5CB8: push ecx
  loc_004B5CB9: push eax
  loc_004B5CBA: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5CC0: mov eax, 80020004h
  loc_004B5CC5: mov var_9C, eax
  loc_004B5CCB: mov ecx, 0000000Ah
  loc_004B5CD0: mov var_A4, ecx
  loc_004B5CD6: mov edx, var_28
  loc_004B5CD9: mov edi, [edx]
  loc_004B5CDB: sub esp, 00000010h
  loc_004B5CDE: mov ebx, esp
  loc_004B5CE0: mov [ebx], ecx
  loc_004B5CE2: mov ecx, var_A0
  loc_004B5CE8: mov [ebx+00000004h], ecx
  loc_004B5CEB: mov [ebx+00000008h], eax
  loc_004B5CEE: mov eax, var_98
  loc_004B5CF4: mov [ebx+0000000Ch], eax
  loc_004B5CF7: push 004258F8h ; "Delete * From LGSale"
  loc_004B5CFC: push edx
  loc_004B5CFD: call [edi+0000005Ch]
  loc_004B5D00: fnclex
  loc_004B5D02: test eax, eax
  loc_004B5D04: jge 004B5D18h
  loc_004B5D06: push 0000005Ch
  loc_004B5D08: push 0041E928h
  loc_004B5D0D: mov ecx, var_28
  loc_004B5D10: push ecx
  loc_004B5D11: push eax
  loc_004B5D12: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5D18: mov eax, 80020004h
  loc_004B5D1D: mov var_9C, eax
  loc_004B5D23: mov ecx, 0000000Ah
  loc_004B5D28: mov var_A4, ecx
  loc_004B5D2E: mov edx, var_28
  loc_004B5D31: mov edi, [edx]
  loc_004B5D33: sub esp, 00000010h
  loc_004B5D36: mov ebx, esp
  loc_004B5D38: mov [ebx], ecx
  loc_004B5D3A: mov ecx, var_A0
  loc_004B5D40: mov [ebx+00000004h], ecx
  loc_004B5D43: mov [ebx+00000008h], eax
  loc_004B5D46: mov eax, var_98
  loc_004B5D4C: mov [ebx+0000000Ch], eax
  loc_004B5D4F: push 00425928h ; "Delete * From LGSaleDetail"
  loc_004B5D54: push edx
  loc_004B5D55: call [edi+0000005Ch]
  loc_004B5D58: fnclex
  loc_004B5D5A: test eax, eax
  loc_004B5D5C: jge 004B5D70h
  loc_004B5D5E: push 0000005Ch
  loc_004B5D60: push 0041E928h
  loc_004B5D65: mov ecx, var_28
  loc_004B5D68: push ecx
  loc_004B5D69: push eax
  loc_004B5D6A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5D70: mov ebx, 80020004h
  loc_004B5D75: mov var_D4, 0000000Ah
  loc_004B5D7F: mov var_AC, 00425F24h ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B5D89: mov var_B4, 00000008h
  loc_004B5D93: mov var_9C, 0061A05Ch
  loc_004B5D9D: mov var_A4, 00004008h
  loc_004B5DA7: lea edx, var_A4
  loc_004B5DAD: push edx
  loc_004B5DAE: lea eax, var_44
  loc_004B5DB1: push eax
  loc_004B5DB2: mov edi, [004010D4h] ; rtcTrimVar
  loc_004B5DB8: call edi
  loc_004B5DBA: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B5DC4: mov var_C4, 00000008h
  loc_004B5DCE: mov ecx, var_28
  loc_004B5DD1: mov edx, [ecx]
  loc_004B5DD3: sub esp, 00000010h
  loc_004B5DD6: mov eax, esp
  loc_004B5DD8: mov ecx, var_D4
  loc_004B5DDE: mov [eax], ecx
  loc_004B5DE0: mov ecx, var_D0
  loc_004B5DE6: mov [eax+00000004h], ecx
  loc_004B5DE9: mov [eax+00000008h], ebx
  loc_004B5DEC: mov ecx, var_C8
  loc_004B5DF2: mov [eax+0000000Ch], ecx
  loc_004B5DF5: lea eax, var_B4
  loc_004B5DFB: push eax
  loc_004B5DFC: lea ecx, var_44
  loc_004B5DFF: push ecx
  loc_004B5E00: lea eax, var_54
  loc_004B5E03: push eax
  loc_004B5E04: mov var_104, edx
  loc_004B5E0A: call __vbaVarCat
  loc_004B5E0C: push eax
  loc_004B5E0D: lea ecx, var_C4
  loc_004B5E13: push ecx
  loc_004B5E14: lea edx, var_64
  loc_004B5E17: push edx
  loc_004B5E18: call __vbaVarCat
  loc_004B5E1A: push eax
  loc_004B5E1B: lea eax, var_2C
  loc_004B5E1E: push eax
  loc_004B5E1F: call [004011B0h] ; __vbaStrVarVal
  loc_004B5E25: push eax
  loc_004B5E26: mov ecx, var_28
  loc_004B5E29: push ecx
  loc_004B5E2A: mov edx, var_104
  loc_004B5E30: call [edx+0000005Ch]
  loc_004B5E33: fnclex
  loc_004B5E35: test eax, eax
  loc_004B5E37: jge 004B5E4Bh
  loc_004B5E39: push 0000005Ch
  loc_004B5E3B: push 0041E928h
  loc_004B5E40: mov ecx, var_28
  loc_004B5E43: push ecx
  loc_004B5E44: push eax
  loc_004B5E45: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5E4B: lea ecx, var_2C
  loc_004B5E4E: call [004012ACh] ; __vbaFreeStr
  loc_004B5E54: lea edx, var_64
  loc_004B5E57: push edx
  loc_004B5E58: lea eax, var_54
  loc_004B5E5B: push eax
  loc_004B5E5C: lea ecx, var_44
  loc_004B5E5F: push ecx
  loc_004B5E60: push 00000003h
  loc_004B5E62: call [00401038h] ; __vbaFreeVarList
  loc_004B5E68: add esp, 00000010h
  loc_004B5E6B: mov ebx, 80020004h
  loc_004B5E70: mov var_AC, 00425FD4h ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B5E7A: mov var_B4, 00000008h
  loc_004B5E84: mov var_9C, 0061A05Ch
  loc_004B5E8E: mov var_A4, 00004008h
  loc_004B5E98: lea edx, var_A4
  loc_004B5E9E: push edx
  loc_004B5E9F: lea eax, var_44
  loc_004B5EA2: push eax
  loc_004B5EA3: call edi
  loc_004B5EA5: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B5EAF: mov var_C4, 00000008h
  loc_004B5EB9: mov ecx, var_28
  loc_004B5EBC: mov edx, [ecx]
  loc_004B5EBE: sub esp, 00000010h
  loc_004B5EC1: mov ecx, esp
  loc_004B5EC3: mov eax, 0000000Ah
  loc_004B5EC8: mov [ecx], eax
  loc_004B5ECA: mov eax, var_D0
  loc_004B5ED0: mov [ecx+00000004h], eax
  loc_004B5ED3: mov [ecx+00000008h], ebx
  loc_004B5ED6: mov eax, var_C8
  loc_004B5EDC: mov [ecx+0000000Ch], eax
  loc_004B5EDF: lea ecx, var_B4
  loc_004B5EE5: push ecx
  loc_004B5EE6: lea eax, var_44
  loc_004B5EE9: push eax
  loc_004B5EEA: lea ecx, var_54
  loc_004B5EED: push ecx
  loc_004B5EEE: mov var_108, edx
  loc_004B5EF4: call __vbaVarCat
  loc_004B5EF6: push eax
  loc_004B5EF7: lea edx, var_C4
  loc_004B5EFD: push edx
  loc_004B5EFE: lea eax, var_64
  loc_004B5F01: push eax
  loc_004B5F02: call __vbaVarCat
  loc_004B5F04: push eax
  loc_004B5F05: lea ecx, var_2C
  loc_004B5F08: push ecx
  loc_004B5F09: call [004011B0h] ; __vbaStrVarVal
  loc_004B5F0F: push eax
  loc_004B5F10: mov edx, var_28
  loc_004B5F13: push edx
  loc_004B5F14: mov eax, var_108
  loc_004B5F1A: call [eax+0000005Ch]
  loc_004B5F1D: fnclex
  loc_004B5F1F: test eax, eax
  loc_004B5F21: jge 004B5F35h
  loc_004B5F23: push 0000005Ch
  loc_004B5F25: push 0041E928h
  loc_004B5F2A: mov ecx, var_28
  loc_004B5F2D: push ecx
  loc_004B5F2E: push eax
  loc_004B5F2F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5F35: lea ecx, var_2C
  loc_004B5F38: call [004012ACh] ; __vbaFreeStr
  loc_004B5F3E: lea edx, var_64
  loc_004B5F41: push edx
  loc_004B5F42: lea eax, var_54
  loc_004B5F45: push eax
  loc_004B5F46: lea ecx, var_44
  loc_004B5F49: push ecx
  loc_004B5F4A: push 00000003h
  loc_004B5F4C: call [00401038h] ; __vbaFreeVarList
  loc_004B5F52: add esp, 00000010h
  loc_004B5F55: mov ebx, 80020004h
  loc_004B5F5A: mov var_AC, 00426114h ; "INSERT INTO LGSale SELECT * FROM LGSale IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B5F64: mov var_B4, 00000008h
  loc_004B5F6E: mov var_9C, 0061A05Ch
  loc_004B5F78: mov var_A4, 00004008h
  loc_004B5F82: lea edx, var_A4
  loc_004B5F88: push edx
  loc_004B5F89: lea eax, var_44
  loc_004B5F8C: push eax
  loc_004B5F8D: call edi
  loc_004B5F8F: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B5F99: mov var_C4, 00000008h
  loc_004B5FA3: mov ecx, var_28
  loc_004B5FA6: mov edx, [ecx]
  loc_004B5FA8: sub esp, 00000010h
  loc_004B5FAB: mov ecx, esp
  loc_004B5FAD: mov eax, 0000000Ah
  loc_004B5FB2: mov [ecx], eax
  loc_004B5FB4: mov eax, var_D0
  loc_004B5FBA: mov [ecx+00000004h], eax
  loc_004B5FBD: mov [ecx+00000008h], ebx
  loc_004B5FC0: mov eax, var_C8
  loc_004B5FC6: mov [ecx+0000000Ch], eax
  loc_004B5FC9: lea ecx, var_B4
  loc_004B5FCF: push ecx
  loc_004B5FD0: lea eax, var_44
  loc_004B5FD3: push eax
  loc_004B5FD4: lea ecx, var_54
  loc_004B5FD7: push ecx
  loc_004B5FD8: mov var_10C, edx
  loc_004B5FDE: call __vbaVarCat
  loc_004B5FE0: push eax
  loc_004B5FE1: lea edx, var_C4
  loc_004B5FE7: push edx
  loc_004B5FE8: lea eax, var_64
  loc_004B5FEB: push eax
  loc_004B5FEC: call __vbaVarCat
  loc_004B5FEE: push eax
  loc_004B5FEF: lea ecx, var_2C
  loc_004B5FF2: push ecx
  loc_004B5FF3: call [004011B0h] ; __vbaStrVarVal
  loc_004B5FF9: push eax
  loc_004B5FFA: mov edx, var_28
  loc_004B5FFD: push edx
  loc_004B5FFE: mov eax, var_10C
  loc_004B6004: call [eax+0000005Ch]
  loc_004B6007: fnclex
  loc_004B6009: test eax, eax
  loc_004B600B: jge 004B601Fh
  loc_004B600D: push 0000005Ch
  loc_004B600F: push 0041E928h
  loc_004B6014: mov ecx, var_28
  loc_004B6017: push ecx
  loc_004B6018: push eax
  loc_004B6019: call [00401074h] ; __vbaHresultCheckObj
  loc_004B601F: lea ecx, var_2C
  loc_004B6022: call [004012ACh] ; __vbaFreeStr
  loc_004B6028: lea edx, var_64
  loc_004B602B: push edx
  loc_004B602C: lea eax, var_54
  loc_004B602F: push eax
  loc_004B6030: lea ecx, var_44
  loc_004B6033: push ecx
  loc_004B6034: push 00000003h
  loc_004B6036: call [00401038h] ; __vbaFreeVarList
  loc_004B603C: add esp, 00000010h
  loc_004B603F: mov ebx, 80020004h
  loc_004B6044: mov var_AC, 004261D4h ; "INSERT INTO LGSaleDetail SELECT * FROM LGSaleDetail IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B604E: mov var_B4, 00000008h
  loc_004B6058: mov var_9C, 0061A05Ch
  loc_004B6062: mov var_A4, 00004008h
  loc_004B606C: lea edx, var_A4
  loc_004B6072: push edx
  loc_004B6073: lea eax, var_44
  loc_004B6076: push eax
  loc_004B6077: call edi
  loc_004B6079: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B6083: mov var_C4, 00000008h
  loc_004B608D: mov ecx, var_28
  loc_004B6090: mov edi, [ecx]
  loc_004B6092: sub esp, 00000010h
  loc_004B6095: mov edx, esp
  loc_004B6097: mov eax, 0000000Ah
  loc_004B609C: mov [edx], eax
  loc_004B609E: mov eax, var_D0
  loc_004B60A4: mov [edx+00000004h], eax
  loc_004B60A7: mov [edx+00000008h], ebx
  loc_004B60AA: mov ecx, var_C8
  loc_004B60B0: mov [edx+0000000Ch], ecx
  loc_004B60B3: lea edx, var_B4
  loc_004B60B9: push edx
  loc_004B60BA: lea eax, var_44
  loc_004B60BD: push eax
  loc_004B60BE: lea ecx, var_54
  loc_004B60C1: push ecx
  loc_004B60C2: call __vbaVarCat
  loc_004B60C4: push eax
  loc_004B60C5: lea edx, var_C4
  loc_004B60CB: push edx
  loc_004B60CC: lea eax, var_64
  loc_004B60CF: push eax
  loc_004B60D0: call __vbaVarCat
  loc_004B60D2: push eax
  loc_004B60D3: lea ecx, var_2C
  loc_004B60D6: push ecx
  loc_004B60D7: call [004011B0h] ; __vbaStrVarVal
  loc_004B60DD: push eax
  loc_004B60DE: mov edx, var_28
  loc_004B60E1: push edx
  loc_004B60E2: call [edi+0000005Ch]
  loc_004B60E5: fnclex
  loc_004B60E7: test eax, eax
  loc_004B60E9: jge 004B60FDh
  loc_004B60EB: push 0000005Ch
  loc_004B60ED: push 0041E928h
  loc_004B60F2: mov ecx, var_28
  loc_004B60F5: push ecx
  loc_004B60F6: push eax
  loc_004B60F7: call [00401074h] ; __vbaHresultCheckObj
  loc_004B60FD: lea ecx, var_2C
  loc_004B6100: call [004012ACh] ; __vbaFreeStr
  loc_004B6106: lea edx, var_64
  loc_004B6109: push edx
  loc_004B610A: lea eax, var_54
  loc_004B610D: push eax
  loc_004B610E: lea ecx, var_44
  loc_004B6111: push ecx
  loc_004B6112: push 00000003h
  loc_004B6114: call [00401038h] ; __vbaFreeVarList
  loc_004B611A: add esp, 00000010h
  loc_004B611D: mov eax, var_28
  loc_004B6120: mov edx, [eax]
  loc_004B6122: push eax
  loc_004B6123: call [edx+00000058h]
  loc_004B6126: fnclex
  loc_004B6128: test eax, eax
  loc_004B612A: jge 004B613Eh
  loc_004B612C: push 00000058h
  loc_004B612E: push 0041E928h
  loc_004B6133: mov ecx, var_28
  loc_004B6136: push ecx
  loc_004B6137: push eax
  loc_004B6138: call [00401074h] ; __vbaHresultCheckObj
  loc_004B613E: push 0041E928h
  loc_004B6143: push 00000000h
  loc_004B6145: call [00401274h] ; __vbaCastObj
  loc_004B614B: push eax
  loc_004B614C: lea edx, var_28
  loc_004B614F: push edx
  loc_004B6150: call [004010A0h] ; __vbaObjSet
  loc_004B6156: mov edx, 0042563Ch ; "c:\Xerus\Crystal\Data\"
  loc_004B615B: lea ecx, var_20
  loc_004B615E: call [004011ECh] ; __vbaStrCopy
  loc_004B6164: mov eax, var_20
  loc_004B6167: push eax
  loc_004B6168: push 0041F65Ch ; "TmpXDB2.Mdb"
  loc_004B616D: mov edi, [00401054h] ; __vbaStrCat
  loc_004B6173: call edi
  loc_004B6175: mov var_3C, eax
  loc_004B6178: mov var_44, 00000008h
  loc_004B617F: push 00000000h
  loc_004B6181: lea ecx, var_44
  loc_004B6184: push ecx
  loc_004B6185: call [004011C8h] ; rtcDir
  loc_004B618B: mov edx, eax
  loc_004B618D: lea ecx, var_2C
  loc_004B6190: mov ebx, [00401270h] ; __vbaStrMove
  loc_004B6196: call ebx
  loc_004B6198: push eax
  loc_004B6199: push 0041E5D4h
  loc_004B619E: call [0040110Ch] ; __vbaStrCmp
  loc_004B61A4: mov esi, eax
  loc_004B61A6: neg esi
  loc_004B61A8: sbb esi, esi
  loc_004B61AA: neg esi
  loc_004B61AC: neg esi
  loc_004B61AE: lea ecx, var_2C
  loc_004B61B1: call [004012ACh] ; __vbaFreeStr
  loc_004B61B7: lea ecx, var_44
  loc_004B61BA: call [00401020h] ; __vbaFreeVar
  loc_004B61C0: test si, si
  loc_004B61C3: jz 004B637Ch
  loc_004B61C9: mov eax, [0061B3B4h]
  loc_004B61CE: test eax, eax
  loc_004B61D0: jnz 004B61E2h
  loc_004B61D2: push 0061B3B4h
  loc_004B61D7: push 004245F0h
  loc_004B61DC: call [004011DCh] ; __vbaNew2
  loc_004B61E2: mov eax, [0061B3B4h]
  loc_004B61E7: mov var_E8, eax
  loc_004B61ED: mov ecx, 0041E5D4h
  loc_004B61F2: mov var_BC, ecx
  loc_004B61F8: mov edx, 00000008h
  loc_004B61FD: mov var_C4, edx
  loc_004B6203: mov var_AC, 00000000h
  loc_004B620D: mov var_B4, 0000000Bh
  loc_004B6217: mov var_9C, 00425324h ; ";LANGID=0x0409;CP=1252;COUNTRY=0"
  loc_004B6221: mov var_A4, edx
  loc_004B6227: mov esi, [eax]
  loc_004B6229: sub esp, 00000010h
  loc_004B622C: mov eax, esp
  loc_004B622E: mov [eax], edx
  loc_004B6230: mov edx, var_C0
  loc_004B6236: mov [eax+00000004h], edx
  loc_004B6239: mov [eax+00000008h], ecx
  loc_004B623C: mov ecx, var_B8
  loc_004B6242: mov [eax+0000000Ch], ecx
  loc_004B6245: sub esp, 00000010h
  loc_004B6248: mov edx, esp
  loc_004B624A: mov eax, var_B4
  loc_004B6250: mov [edx], eax
  loc_004B6252: mov ecx, var_B0
  loc_004B6258: mov [edx+00000004h], ecx
  loc_004B625B: mov eax, var_AC
  loc_004B6261: mov [edx+00000008h], eax
  loc_004B6264: mov ecx, var_A8
  loc_004B626A: mov [edx+0000000Ch], ecx
  loc_004B626D: sub esp, 00000010h
  loc_004B6270: mov edx, esp
  loc_004B6272: mov eax, var_A4
  loc_004B6278: mov [edx], eax
  loc_004B627A: mov ecx, var_A0
  loc_004B6280: mov [edx+00000004h], ecx
  loc_004B6283: mov eax, var_9C
  loc_004B6289: mov [edx+00000008h], eax
  loc_004B628C: mov ecx, var_98
  loc_004B6292: mov [edx+0000000Ch], ecx
  loc_004B6295: mov edx, var_20
  loc_004B6298: push edx
  loc_004B6299: push 00425308h ; "TmpXDB3.Mdb"
  loc_004B629E: call edi
  loc_004B62A0: mov edx, eax
  loc_004B62A2: lea ecx, var_30
  loc_004B62A5: call ebx
  loc_004B62A7: push eax
  loc_004B62A8: mov eax, var_20
  loc_004B62AB: push eax
  loc_004B62AC: push 004252ECh ; "TmpXDB2.MdB"
  loc_004B62B1: call edi
  loc_004B62B3: mov edx, eax
  loc_004B62B5: lea ecx, var_2C
  loc_004B62B8: call ebx
  loc_004B62BA: push eax
  loc_004B62BB: mov ecx, esi
  loc_004B62BD: mov esi, var_E8
  loc_004B62C3: push esi
  loc_004B62C4: call [ecx+00000048h]
  loc_004B62C7: fnclex
  loc_004B62C9: test eax, eax
  loc_004B62CB: jge 004B62DCh
  loc_004B62CD: push 00000048h
  loc_004B62CF: push 004245E0h
  loc_004B62D4: push esi
  loc_004B62D5: push eax
  loc_004B62D6: call [00401074h] ; __vbaHresultCheckObj
  loc_004B62DC: lea edx, var_30
  loc_004B62DF: push edx
  loc_004B62E0: lea eax, var_2C
  loc_004B62E3: push eax
  loc_004B62E4: push 00000002h
  loc_004B62E6: mov esi, [004011FCh] ; __vbaFreeStrList
  loc_004B62EC: call __vbaFreeStrList
  loc_004B62EE: add esp, 0000000Ch
  loc_004B62F1: mov ecx, var_20
  loc_004B62F4: push ecx
  loc_004B62F5: push 0042536Ch ; "TmpXDB2.MDB"
  loc_004B62FA: call edi
  loc_004B62FC: mov var_3C, eax
  loc_004B62FF: mov var_44, 00000008h
  loc_004B6306: lea edx, var_44
  loc_004B6309: push edx
  loc_004B630A: call [00401108h] ; rtcKillFiles
  loc_004B6310: lea ecx, var_44
  loc_004B6313: call [00401020h] ; __vbaFreeVar
  loc_004B6319: mov eax, var_20
  loc_004B631C: push eax
  loc_004B631D: push 004253A4h ; "\TmpXDB2.mdb"
  loc_004B6322: call edi
  loc_004B6324: mov edx, eax
  loc_004B6326: lea ecx, var_30
  loc_004B6329: call ebx
  loc_004B632B: push eax
  loc_004B632C: mov ecx, var_20
  loc_004B632F: push ecx
  loc_004B6330: push 00425388h ; "TmpXDB3.mdb"
  loc_004B6335: call edi
  loc_004B6337: mov edx, eax
  loc_004B6339: lea ecx, var_2C
  loc_004B633C: call ebx
  loc_004B633E: push eax
  loc_004B633F: call [00401200h] ; rtcFileCopy
  loc_004B6345: lea edx, var_30
  loc_004B6348: push edx
  loc_004B6349: lea eax, var_2C
  loc_004B634C: push eax
  loc_004B634D: push 00000002h
  loc_004B634F: call __vbaFreeStrList
  loc_004B6351: add esp, 0000000Ch
  loc_004B6354: mov ecx, var_20
  loc_004B6357: push ecx
  loc_004B6358: push 004253C4h ; "TmpXDB3.MDB"
  loc_004B635D: call edi
  loc_004B635F: mov var_3C, eax
  loc_004B6362: mov var_44, 00000008h
  loc_004B6369: lea edx, var_44
  loc_004B636C: push edx
  loc_004B636D: call [00401108h] ; rtcKillFiles
  loc_004B6373: lea ecx, var_44
  loc_004B6376: call [00401020h] ; __vbaFreeVar
  loc_004B637C: mov eax, 80020004h
  loc_004B6381: mov var_6C, eax
  loc_004B6384: mov ecx, 0000000Ah
  loc_004B6389: mov var_74, ecx
  loc_004B638C: mov var_5C, eax
  loc_004B638F: mov var_64, ecx
  loc_004B6392: mov var_4C, eax
  loc_004B6395: mov var_54, ecx
  loc_004B6398: mov var_9C, 004262ACh ; "Finish ( Post Data to Machine 1) !"
  loc_004B63A2: mov var_A4, 00000008h
  loc_004B63AC: lea edx, var_A4
  loc_004B63B2: lea ecx, var_44
  loc_004B63B5: call [00401240h] ; __vbaVarDup
  loc_004B63BB: lea eax, var_74
  loc_004B63BE: push eax
  loc_004B63BF: lea ecx, var_64
  loc_004B63C2: push ecx
  loc_004B63C3: lea edx, var_54
  loc_004B63C6: push edx
  loc_004B63C7: push 00000040h
  loc_004B63C9: lea eax, var_44
  loc_004B63CC: push eax
  loc_004B63CD: call [004010A4h] ; rtcMsgBox
  loc_004B63D3: jmp 004B6469h
  loc_004B63D8: mov ecx, 80020004h
  loc_004B63DD: mov var_6C, ecx
  loc_004B63E0: mov eax, 0000000Ah
  loc_004B63E5: mov var_74, eax
  loc_004B63E8: mov var_5C, ecx
  loc_004B63EB: mov var_64, eax
  loc_004B63EE: mov var_4C, ecx
  loc_004B63F1: mov var_54, eax
  loc_004B63F4: call [00401210h] ; rtcErrObj
  loc_004B63FA: push eax
  loc_004B63FB: lea edx, var_34
  loc_004B63FE: push edx
  loc_004B63FF: call [004010A0h] ; __vbaObjSet
  loc_004B6405: mov esi, eax
  loc_004B6407: mov eax, [esi]
  loc_004B6409: lea ecx, var_2C
  loc_004B640C: push ecx
  loc_004B640D: push esi
  loc_004B640E: call [eax+0000002Ch]
  loc_004B6411: fnclex
  loc_004B6413: test eax, eax
  loc_004B6415: jge 004B6426h
  loc_004B6417: push 0000002Ch
  loc_004B6419: push 0042150Ch
  loc_004B641E: push esi
  loc_004B641F: push eax
  loc_004B6420: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6426: push 0042609Ch ; "Cann't post !!! "
  loc_004B642B: mov edx, var_2C
  loc_004B642E: push edx
  loc_004B642F: call [00401054h] ; __vbaStrCat
  loc_004B6435: mov var_3C, eax
  loc_004B6438: mov var_44, 00000008h
  loc_004B643F: lea eax, var_74
  loc_004B6442: push eax
  loc_004B6443: lea ecx, var_64
  loc_004B6446: push ecx
  loc_004B6447: lea edx, var_54
  loc_004B644A: push edx
  loc_004B644B: push 00000000h
  loc_004B644D: lea eax, var_44
  loc_004B6450: push eax
  loc_004B6451: call [004010A4h] ; rtcMsgBox
  loc_004B6457: lea ecx, var_2C
  loc_004B645A: call [004012ACh] ; __vbaFreeStr
  loc_004B6460: lea ecx, var_34
  loc_004B6463: call [004012B0h] ; __vbaFreeObj
  loc_004B6469: lea ecx, var_74
  loc_004B646C: push ecx
  loc_004B646D: lea edx, var_64
  loc_004B6470: push edx
  loc_004B6471: lea eax, var_54
  loc_004B6474: push eax
  loc_004B6475: lea ecx, var_44
  loc_004B6478: push ecx
  loc_004B6479: push 00000004h
  loc_004B647B: call [00401038h] ; __vbaFreeVarList
  loc_004B6481: add esp, 00000014h
  loc_004B6484: call [00401094h] ; __vbaExitProc
  loc_004B648A: push 004B64F1h
  loc_004B648F: jmp 004B64D7h
  loc_004B6491: lea edx, var_30
  loc_004B6494: push edx
  loc_004B6495: lea eax, var_2C
  loc_004B6498: push eax
  loc_004B6499: push 00000002h
  loc_004B649B: call [004011FCh] ; __vbaFreeStrList
  loc_004B64A1: add esp, 0000000Ch
  loc_004B64A4: lea ecx, var_34
  loc_004B64A7: call [004012B0h] ; __vbaFreeObj
  loc_004B64AD: lea ecx, var_94
  loc_004B64B3: push ecx
  loc_004B64B4: lea edx, var_84
  loc_004B64BA: push edx
  loc_004B64BB: lea eax, var_74
  loc_004B64BE: push eax
  loc_004B64BF: lea ecx, var_64
  loc_004B64C2: push ecx
  loc_004B64C3: lea edx, var_54
  loc_004B64C6: push edx
  loc_004B64C7: lea eax, var_44
  loc_004B64CA: push eax
  loc_004B64CB: push 00000006h
  loc_004B64CD: call [00401038h] ; __vbaFreeVarList
  loc_004B64D3: add esp, 0000001Ch
  loc_004B64D6: ret
  loc_004B64D7: lea ecx, var_20
  loc_004B64DA: call [004012ACh] ; __vbaFreeStr
  loc_004B64E0: lea ecx, var_24
  loc_004B64E3: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B64E9: call __vbaFreeObj
  loc_004B64EB: lea ecx, var_28
  loc_004B64EE: call __vbaFreeObj
  loc_004B64F0: ret
  loc_004B64F1: mov ecx, var_1C
  loc_004B64F4: mov fs:[00000000h], ecx
  loc_004B64FB: pop edi
  loc_004B64FC: pop esi
  loc_004B64FD: pop ebx
  loc_004B64FE: mov esp, ebp
  loc_004B6500: pop ebp
  loc_004B6501: ret
  loc_004B6502: nop
End Sub

Private Sub Proc_9_1_4B59B0() '4B59B0
  loc_004B59B0: push ebp
  loc_004B59B1: mov ebp, esp
  loc_004B59B3: sub esp, 00000014h
  loc_004B59B6: push 00403B36h ; __vbaExceptHandler
  loc_004B59BB: mov eax, fs:[00000000h]
  loc_004B59C1: push eax
  loc_004B59C2: mov fs:[00000000h], esp
  loc_004B59C9: sub esp, 000000F4h
  loc_004B59CF: push ebx
  loc_004B59D0: push esi
  loc_004B59D1: push edi
  loc_004B59D2: mov var_14, esp
  loc_004B59D5: mov var_10, 00401D50h
  loc_004B59DC: xor ebx, ebx
  loc_004B59DE: mov var_C, ebx
  loc_004B59E1: mov var_8, ebx
  loc_004B59E4: mov var_20, ebx
  loc_004B59E7: mov var_24, ebx
  loc_004B59EA: mov var_28, ebx
  loc_004B59ED: mov var_2C, ebx
  loc_004B59F0: mov var_30, ebx
  loc_004B59F3: mov var_34, ebx
  loc_004B59F6: mov var_44, ebx
  loc_004B59F9: mov var_54, ebx
  loc_004B59FC: mov var_64, ebx
  loc_004B59FF: mov var_74, ebx
  loc_004B5A02: mov var_84, ebx
  loc_004B5A08: mov var_94, ebx
  loc_004B5A0E: mov var_A4, ebx
  loc_004B5A14: mov var_B4, ebx
  loc_004B5A1A: mov var_C4, ebx
  loc_004B5A20: mov var_D4, ebx
  loc_004B5A26: push 00000001h
  loc_004B5A28: call [004010A8h] ; __vbaOnError
  loc_004B5A2E: push 0000000Dh
  loc_004B5A30: lea eax, var_44
  loc_004B5A33: push eax
  loc_004B5A34: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B5A3A: mov eax, 80020004h
  loc_004B5A3F: mov var_8C, eax
  loc_004B5A45: mov ecx, 0000000Ah
  loc_004B5A4A: mov var_94, ecx
  loc_004B5A50: mov var_7C, eax
  loc_004B5A53: mov var_84, ecx
  loc_004B5A59: mov var_BC, 0041F5E0h ; "SOFT"
  loc_004B5A63: mov esi, 00000008h
  loc_004B5A68: mov var_C4, esi
  loc_004B5A6E: lea edx, var_C4
  loc_004B5A74: lea ecx, var_74
  loc_004B5A77: call [00401240h] ; __vbaVarDup
  loc_004B5A7D: mov var_9C, 00424FE4h ; "Export process will take a few minutes."
  loc_004B5A87: mov var_A4, esi
  loc_004B5A8D: mov var_AC, 00425CDCh ; "Are you sure to Export data to Machine 1 ?"
  loc_004B5A97: mov var_B4, esi
  loc_004B5A9D: lea ecx, var_94
  loc_004B5AA3: push ecx
  loc_004B5AA4: lea edx, var_84
  loc_004B5AAA: push edx
  loc_004B5AAB: lea eax, var_74
  loc_004B5AAE: push eax
  loc_004B5AAF: push 00000144h
  loc_004B5AB4: lea ecx, var_A4
  loc_004B5ABA: push ecx
  loc_004B5ABB: lea edx, var_44
  loc_004B5ABE: push edx
  loc_004B5ABF: lea eax, var_54
  loc_004B5AC2: push eax
  loc_004B5AC3: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B5AC9: call __vbaVarCat
  loc_004B5ACB: push eax
  loc_004B5ACC: lea ecx, var_B4
  loc_004B5AD2: push ecx
  loc_004B5AD3: lea edx, var_64
  loc_004B5AD6: push edx
  loc_004B5AD7: call __vbaVarCat
  loc_004B5AD9: push eax
  loc_004B5ADA: call [004010A4h] ; rtcMsgBox
  loc_004B5AE0: xor ecx, ecx
  loc_004B5AE2: cmp eax, 00000006h
  loc_004B5AE5: setz cl
  loc_004B5AE8: neg ecx
  loc_004B5AEA: mov di, cx
  loc_004B5AED: lea edx, var_94
  loc_004B5AF3: push edx
  loc_004B5AF4: lea eax, var_84
  loc_004B5AFA: push eax
  loc_004B5AFB: lea ecx, var_74
  loc_004B5AFE: push ecx
  loc_004B5AFF: lea edx, var_64
  loc_004B5B02: push edx
  loc_004B5B03: lea eax, var_54
  loc_004B5B06: push eax
  loc_004B5B07: lea ecx, var_44
  loc_004B5B0A: push ecx
  loc_004B5B0B: push 00000006h
  loc_004B5B0D: call [00401038h] ; __vbaFreeVarList
  loc_004B5B13: add esp, 0000001Ch
  loc_004B5B16: cmp di, bx
  loc_004B5B19: jz 004B6484h
  loc_004B5B1F: cmp [0061B3B4h], ebx
  loc_004B5B25: jnz 004B5B37h
  loc_004B5B27: push 0061B3B4h
  loc_004B5B2C: push 004245F0h
  loc_004B5B31: call [004011DCh] ; __vbaNew2
  loc_004B5B37: mov edi, [0061B3B4h]
  loc_004B5B3D: mov eax, 80020004h
  loc_004B5B42: mov var_BC, eax
  loc_004B5B48: mov ecx, 0000000Ah
  loc_004B5B4D: mov var_C4, ecx
  loc_004B5B53: mov var_AC, eax
  loc_004B5B59: mov var_B4, ecx
  loc_004B5B5F: mov var_9C, eax
  loc_004B5B65: mov var_A4, ecx
  loc_004B5B6B: mov edx, [edi]
  loc_004B5B6D: lea ebx, var_34
  loc_004B5B70: push ebx
  loc_004B5B71: sub esp, 00000010h
  loc_004B5B74: mov ebx, esp
  loc_004B5B76: mov [ebx], ecx
  loc_004B5B78: mov ecx, var_C0
  loc_004B5B7E: mov [ebx+00000004h], ecx
  loc_004B5B81: mov [ebx+00000008h], eax
  loc_004B5B84: mov eax, var_B8
  loc_004B5B8A: mov [ebx+0000000Ch], eax
  loc_004B5B8D: sub esp, 00000010h
  loc_004B5B90: mov ecx, esp
  loc_004B5B92: mov eax, var_B4
  loc_004B5B98: mov [ecx], eax
  loc_004B5B9A: mov eax, var_B0
  loc_004B5BA0: mov [ecx+00000004h], eax
  loc_004B5BA3: mov eax, var_AC
  loc_004B5BA9: mov [ecx+00000008h], eax
  loc_004B5BAC: mov eax, var_A8
  loc_004B5BB2: mov [ecx+0000000Ch], eax
  loc_004B5BB5: sub esp, 00000010h
  loc_004B5BB8: mov ecx, esp
  loc_004B5BBA: mov eax, var_A4
  loc_004B5BC0: mov [ecx], eax
  loc_004B5BC2: mov eax, var_A0
  loc_004B5BC8: mov [ecx+00000004h], eax
  loc_004B5BCB: mov eax, var_9C
  loc_004B5BD1: mov [ecx+00000008h], eax
  loc_004B5BD4: mov eax, var_98
  loc_004B5BDA: mov [ecx+0000000Ch], eax
  loc_004B5BDD: push 00425AF4h ; "c:\Xerus\Crystal\Data\TMPXDB2.mdb"
  loc_004B5BE2: push edi
  loc_004B5BE3: call [edx+00000058h]
  loc_004B5BE6: fnclex
  loc_004B5BE8: test eax, eax
  loc_004B5BEA: jge 004B5BFBh
  loc_004B5BEC: push 00000058h
  loc_004B5BEE: push 004245E0h
  loc_004B5BF3: push edi
  loc_004B5BF4: push eax
  loc_004B5BF5: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5BFB: mov eax, var_34
  loc_004B5BFE: mov var_34, 00000000h
  loc_004B5C05: push eax
  loc_004B5C06: lea ecx, var_28
  loc_004B5C09: push ecx
  loc_004B5C0A: call [004010A0h] ; __vbaObjSet
  loc_004B5C10: mov eax, 80020004h
  loc_004B5C15: mov var_9C, eax
  loc_004B5C1B: mov ecx, 0000000Ah
  loc_004B5C20: mov var_A4, ecx
  loc_004B5C26: mov edx, var_28
  loc_004B5C29: mov edi, [edx]
  loc_004B5C2B: sub esp, 00000010h
  loc_004B5C2E: mov ebx, esp
  loc_004B5C30: mov [ebx], ecx
  loc_004B5C32: mov ecx, var_A0
  loc_004B5C38: mov [ebx+00000004h], ecx
  loc_004B5C3B: mov [ebx+00000008h], eax
  loc_004B5C3E: mov eax, var_98
  loc_004B5C44: mov [ebx+0000000Ch], eax
  loc_004B5C47: push 0042508Ch ; "Delete * From LG"
  loc_004B5C4C: push edx
  loc_004B5C4D: call [edi+0000005Ch]
  loc_004B5C50: fnclex
  loc_004B5C52: test eax, eax
  loc_004B5C54: jge 004B5C68h
  loc_004B5C56: push 0000005Ch
  loc_004B5C58: push 0041E928h
  loc_004B5C5D: mov ecx, var_28
  loc_004B5C60: push ecx
  loc_004B5C61: push eax
  loc_004B5C62: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5C68: mov eax, 80020004h
  loc_004B5C6D: mov var_9C, eax
  loc_004B5C73: mov ecx, 0000000Ah
  loc_004B5C78: mov var_A4, ecx
  loc_004B5C7E: mov edx, var_28
  loc_004B5C81: mov edi, [edx]
  loc_004B5C83: sub esp, 00000010h
  loc_004B5C86: mov ebx, esp
  loc_004B5C88: mov [ebx], ecx
  loc_004B5C8A: mov ecx, var_A0
  loc_004B5C90: mov [ebx+00000004h], ecx
  loc_004B5C93: mov [ebx+00000008h], eax
  loc_004B5C96: mov eax, var_98
  loc_004B5C9C: mov [ebx+0000000Ch], eax
  loc_004B5C9F: push 004250B4h ; "Delete * From LGDetail"
  loc_004B5CA4: push edx
  loc_004B5CA5: call [edi+0000005Ch]
  loc_004B5CA8: fnclex
  loc_004B5CAA: test eax, eax
  loc_004B5CAC: jge 004B5CC0h
  loc_004B5CAE: push 0000005Ch
  loc_004B5CB0: push 0041E928h
  loc_004B5CB5: mov ecx, var_28
  loc_004B5CB8: push ecx
  loc_004B5CB9: push eax
  loc_004B5CBA: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5CC0: mov eax, 80020004h
  loc_004B5CC5: mov var_9C, eax
  loc_004B5CCB: mov ecx, 0000000Ah
  loc_004B5CD0: mov var_A4, ecx
  loc_004B5CD6: mov edx, var_28
  loc_004B5CD9: mov edi, [edx]
  loc_004B5CDB: sub esp, 00000010h
  loc_004B5CDE: mov ebx, esp
  loc_004B5CE0: mov [ebx], ecx
  loc_004B5CE2: mov ecx, var_A0
  loc_004B5CE8: mov [ebx+00000004h], ecx
  loc_004B5CEB: mov [ebx+00000008h], eax
  loc_004B5CEE: mov eax, var_98
  loc_004B5CF4: mov [ebx+0000000Ch], eax
  loc_004B5CF7: push 004258F8h ; "Delete * From LGSale"
  loc_004B5CFC: push edx
  loc_004B5CFD: call [edi+0000005Ch]
  loc_004B5D00: fnclex
  loc_004B5D02: test eax, eax
  loc_004B5D04: jge 004B5D18h
  loc_004B5D06: push 0000005Ch
  loc_004B5D08: push 0041E928h
  loc_004B5D0D: mov ecx, var_28
  loc_004B5D10: push ecx
  loc_004B5D11: push eax
  loc_004B5D12: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5D18: mov eax, 80020004h
  loc_004B5D1D: mov var_9C, eax
  loc_004B5D23: mov ecx, 0000000Ah
  loc_004B5D28: mov var_A4, ecx
  loc_004B5D2E: mov edx, var_28
  loc_004B5D31: mov edi, [edx]
  loc_004B5D33: sub esp, 00000010h
  loc_004B5D36: mov ebx, esp
  loc_004B5D38: mov [ebx], ecx
  loc_004B5D3A: mov ecx, var_A0
  loc_004B5D40: mov [ebx+00000004h], ecx
  loc_004B5D43: mov [ebx+00000008h], eax
  loc_004B5D46: mov eax, var_98
  loc_004B5D4C: mov [ebx+0000000Ch], eax
  loc_004B5D4F: push 00425928h ; "Delete * From LGSaleDetail"
  loc_004B5D54: push edx
  loc_004B5D55: call [edi+0000005Ch]
  loc_004B5D58: fnclex
  loc_004B5D5A: test eax, eax
  loc_004B5D5C: jge 004B5D70h
  loc_004B5D5E: push 0000005Ch
  loc_004B5D60: push 0041E928h
  loc_004B5D65: mov ecx, var_28
  loc_004B5D68: push ecx
  loc_004B5D69: push eax
  loc_004B5D6A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5D70: mov ebx, 80020004h
  loc_004B5D75: mov var_D4, 0000000Ah
  loc_004B5D7F: mov var_AC, 00425F24h ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B5D89: mov var_B4, 00000008h
  loc_004B5D93: mov var_9C, 0061A05Ch
  loc_004B5D9D: mov var_A4, 00004008h
  loc_004B5DA7: lea edx, var_A4
  loc_004B5DAD: push edx
  loc_004B5DAE: lea eax, var_44
  loc_004B5DB1: push eax
  loc_004B5DB2: mov edi, [004010D4h] ; rtcTrimVar
  loc_004B5DB8: call edi
  loc_004B5DBA: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B5DC4: mov var_C4, 00000008h
  loc_004B5DCE: mov ecx, var_28
  loc_004B5DD1: mov edx, [ecx]
  loc_004B5DD3: sub esp, 00000010h
  loc_004B5DD6: mov eax, esp
  loc_004B5DD8: mov ecx, var_D4
  loc_004B5DDE: mov [eax], ecx
  loc_004B5DE0: mov ecx, var_D0
  loc_004B5DE6: mov [eax+00000004h], ecx
  loc_004B5DE9: mov [eax+00000008h], ebx
  loc_004B5DEC: mov ecx, var_C8
  loc_004B5DF2: mov [eax+0000000Ch], ecx
  loc_004B5DF5: lea eax, var_B4
  loc_004B5DFB: push eax
  loc_004B5DFC: lea ecx, var_44
  loc_004B5DFF: push ecx
  loc_004B5E00: lea eax, var_54
  loc_004B5E03: push eax
  loc_004B5E04: mov var_104, edx
  loc_004B5E0A: call __vbaVarCat
  loc_004B5E0C: push eax
  loc_004B5E0D: lea ecx, var_C4
  loc_004B5E13: push ecx
  loc_004B5E14: lea edx, var_64
  loc_004B5E17: push edx
  loc_004B5E18: call __vbaVarCat
  loc_004B5E1A: push eax
  loc_004B5E1B: lea eax, var_2C
  loc_004B5E1E: push eax
  loc_004B5E1F: call [004011B0h] ; __vbaStrVarVal
  loc_004B5E25: push eax
  loc_004B5E26: mov ecx, var_28
  loc_004B5E29: push ecx
  loc_004B5E2A: mov edx, var_104
  loc_004B5E30: call [edx+0000005Ch]
  loc_004B5E33: fnclex
  loc_004B5E35: test eax, eax
  loc_004B5E37: jge 004B5E4Bh
  loc_004B5E39: push 0000005Ch
  loc_004B5E3B: push 0041E928h
  loc_004B5E40: mov ecx, var_28
  loc_004B5E43: push ecx
  loc_004B5E44: push eax
  loc_004B5E45: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5E4B: lea ecx, var_2C
  loc_004B5E4E: call [004012ACh] ; __vbaFreeStr
  loc_004B5E54: lea edx, var_64
  loc_004B5E57: push edx
  loc_004B5E58: lea eax, var_54
  loc_004B5E5B: push eax
  loc_004B5E5C: lea ecx, var_44
  loc_004B5E5F: push ecx
  loc_004B5E60: push 00000003h
  loc_004B5E62: call [00401038h] ; __vbaFreeVarList
  loc_004B5E68: add esp, 00000010h
  loc_004B5E6B: mov ebx, 80020004h
  loc_004B5E70: mov var_AC, 00425FD4h ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B5E7A: mov var_B4, 00000008h
  loc_004B5E84: mov var_9C, 0061A05Ch
  loc_004B5E8E: mov var_A4, 00004008h
  loc_004B5E98: lea edx, var_A4
  loc_004B5E9E: push edx
  loc_004B5E9F: lea eax, var_44
  loc_004B5EA2: push eax
  loc_004B5EA3: call edi
  loc_004B5EA5: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B5EAF: mov var_C4, 00000008h
  loc_004B5EB9: mov ecx, var_28
  loc_004B5EBC: mov edx, [ecx]
  loc_004B5EBE: sub esp, 00000010h
  loc_004B5EC1: mov ecx, esp
  loc_004B5EC3: mov eax, 0000000Ah
  loc_004B5EC8: mov [ecx], eax
  loc_004B5ECA: mov eax, var_D0
  loc_004B5ED0: mov [ecx+00000004h], eax
  loc_004B5ED3: mov [ecx+00000008h], ebx
  loc_004B5ED6: mov eax, var_C8
  loc_004B5EDC: mov [ecx+0000000Ch], eax
  loc_004B5EDF: lea ecx, var_B4
  loc_004B5EE5: push ecx
  loc_004B5EE6: lea eax, var_44
  loc_004B5EE9: push eax
  loc_004B5EEA: lea ecx, var_54
  loc_004B5EED: push ecx
  loc_004B5EEE: mov var_108, edx
  loc_004B5EF4: call __vbaVarCat
  loc_004B5EF6: push eax
  loc_004B5EF7: lea edx, var_C4
  loc_004B5EFD: push edx
  loc_004B5EFE: lea eax, var_64
  loc_004B5F01: push eax
  loc_004B5F02: call __vbaVarCat
  loc_004B5F04: push eax
  loc_004B5F05: lea ecx, var_2C
  loc_004B5F08: push ecx
  loc_004B5F09: call [004011B0h] ; __vbaStrVarVal
  loc_004B5F0F: push eax
  loc_004B5F10: mov edx, var_28
  loc_004B5F13: push edx
  loc_004B5F14: mov eax, var_108
  loc_004B5F1A: call [eax+0000005Ch]
  loc_004B5F1D: fnclex
  loc_004B5F1F: test eax, eax
  loc_004B5F21: jge 004B5F35h
  loc_004B5F23: push 0000005Ch
  loc_004B5F25: push 0041E928h
  loc_004B5F2A: mov ecx, var_28
  loc_004B5F2D: push ecx
  loc_004B5F2E: push eax
  loc_004B5F2F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B5F35: lea ecx, var_2C
  loc_004B5F38: call [004012ACh] ; __vbaFreeStr
  loc_004B5F3E: lea edx, var_64
  loc_004B5F41: push edx
  loc_004B5F42: lea eax, var_54
  loc_004B5F45: push eax
  loc_004B5F46: lea ecx, var_44
  loc_004B5F49: push ecx
  loc_004B5F4A: push 00000003h
  loc_004B5F4C: call [00401038h] ; __vbaFreeVarList
  loc_004B5F52: add esp, 00000010h
  loc_004B5F55: mov ebx, 80020004h
  loc_004B5F5A: mov var_AC, 00426114h ; "INSERT INTO LGSale SELECT * FROM LGSale IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B5F64: mov var_B4, 00000008h
  loc_004B5F6E: mov var_9C, 0061A05Ch
  loc_004B5F78: mov var_A4, 00004008h
  loc_004B5F82: lea edx, var_A4
  loc_004B5F88: push edx
  loc_004B5F89: lea eax, var_44
  loc_004B5F8C: push eax
  loc_004B5F8D: call edi
  loc_004B5F8F: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B5F99: mov var_C4, 00000008h
  loc_004B5FA3: mov ecx, var_28
  loc_004B5FA6: mov edx, [ecx]
  loc_004B5FA8: sub esp, 00000010h
  loc_004B5FAB: mov ecx, esp
  loc_004B5FAD: mov eax, 0000000Ah
  loc_004B5FB2: mov [ecx], eax
  loc_004B5FB4: mov eax, var_D0
  loc_004B5FBA: mov [ecx+00000004h], eax
  loc_004B5FBD: mov [ecx+00000008h], ebx
  loc_004B5FC0: mov eax, var_C8
  loc_004B5FC6: mov [ecx+0000000Ch], eax
  loc_004B5FC9: lea ecx, var_B4
  loc_004B5FCF: push ecx
  loc_004B5FD0: lea eax, var_44
  loc_004B5FD3: push eax
  loc_004B5FD4: lea ecx, var_54
  loc_004B5FD7: push ecx
  loc_004B5FD8: mov var_10C, edx
  loc_004B5FDE: call __vbaVarCat
  loc_004B5FE0: push eax
  loc_004B5FE1: lea edx, var_C4
  loc_004B5FE7: push edx
  loc_004B5FE8: lea eax, var_64
  loc_004B5FEB: push eax
  loc_004B5FEC: call __vbaVarCat
  loc_004B5FEE: push eax
  loc_004B5FEF: lea ecx, var_2C
  loc_004B5FF2: push ecx
  loc_004B5FF3: call [004011B0h] ; __vbaStrVarVal
  loc_004B5FF9: push eax
  loc_004B5FFA: mov edx, var_28
  loc_004B5FFD: push edx
  loc_004B5FFE: mov eax, var_10C
  loc_004B6004: call [eax+0000005Ch]
  loc_004B6007: fnclex
  loc_004B6009: test eax, eax
  loc_004B600B: jge 004B601Fh
  loc_004B600D: push 0000005Ch
  loc_004B600F: push 0041E928h
  loc_004B6014: mov ecx, var_28
  loc_004B6017: push ecx
  loc_004B6018: push eax
  loc_004B6019: call [00401074h] ; __vbaHresultCheckObj
  loc_004B601F: lea ecx, var_2C
  loc_004B6022: call [004012ACh] ; __vbaFreeStr
  loc_004B6028: lea edx, var_64
  loc_004B602B: push edx
  loc_004B602C: lea eax, var_54
  loc_004B602F: push eax
  loc_004B6030: lea ecx, var_44
  loc_004B6033: push ecx
  loc_004B6034: push 00000003h
  loc_004B6036: call [00401038h] ; __vbaFreeVarList
  loc_004B603C: add esp, 00000010h
  loc_004B603F: mov ebx, 80020004h
  loc_004B6044: mov var_AC, 004261D4h ; "INSERT INTO LGSaleDetail SELECT * FROM LGSaleDetail IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B604E: mov var_B4, 00000008h
  loc_004B6058: mov var_9C, 0061A05Ch
  loc_004B6062: mov var_A4, 00004008h
  loc_004B606C: lea edx, var_A4
  loc_004B6072: push edx
  loc_004B6073: lea eax, var_44
  loc_004B6076: push eax
  loc_004B6077: call edi
  loc_004B6079: mov var_BC, 004256A4h ; "' And MachineID=2"
  loc_004B6083: mov var_C4, 00000008h
  loc_004B608D: mov ecx, var_28
  loc_004B6090: mov edi, [ecx]
  loc_004B6092: sub esp, 00000010h
  loc_004B6095: mov edx, esp
  loc_004B6097: mov eax, 0000000Ah
  loc_004B609C: mov [edx], eax
  loc_004B609E: mov eax, var_D0
  loc_004B60A4: mov [edx+00000004h], eax
  loc_004B60A7: mov [edx+00000008h], ebx
  loc_004B60AA: mov ecx, var_C8
  loc_004B60B0: mov [edx+0000000Ch], ecx
  loc_004B60B3: lea edx, var_B4
  loc_004B60B9: push edx
  loc_004B60BA: lea eax, var_44
  loc_004B60BD: push eax
  loc_004B60BE: lea ecx, var_54
  loc_004B60C1: push ecx
  loc_004B60C2: call __vbaVarCat
  loc_004B60C4: push eax
  loc_004B60C5: lea edx, var_C4
  loc_004B60CB: push edx
  loc_004B60CC: lea eax, var_64
  loc_004B60CF: push eax
  loc_004B60D0: call __vbaVarCat
  loc_004B60D2: push eax
  loc_004B60D3: lea ecx, var_2C
  loc_004B60D6: push ecx
  loc_004B60D7: call [004011B0h] ; __vbaStrVarVal
  loc_004B60DD: push eax
  loc_004B60DE: mov edx, var_28
  loc_004B60E1: push edx
  loc_004B60E2: call [edi+0000005Ch]
  loc_004B60E5: fnclex
  loc_004B60E7: test eax, eax
  loc_004B60E9: jge 004B60FDh
  loc_004B60EB: push 0000005Ch
  loc_004B60ED: push 0041E928h
  loc_004B60F2: mov ecx, var_28
  loc_004B60F5: push ecx
  loc_004B60F6: push eax
  loc_004B60F7: call [00401074h] ; __vbaHresultCheckObj
  loc_004B60FD: lea ecx, var_2C
  loc_004B6100: call [004012ACh] ; __vbaFreeStr
  loc_004B6106: lea edx, var_64
  loc_004B6109: push edx
  loc_004B610A: lea eax, var_54
  loc_004B610D: push eax
  loc_004B610E: lea ecx, var_44
  loc_004B6111: push ecx
  loc_004B6112: push 00000003h
  loc_004B6114: call [00401038h] ; __vbaFreeVarList
  loc_004B611A: add esp, 00000010h
  loc_004B611D: mov eax, var_28
  loc_004B6120: mov edx, [eax]
  loc_004B6122: push eax
  loc_004B6123: call [edx+00000058h]
  loc_004B6126: fnclex
  loc_004B6128: test eax, eax
  loc_004B612A: jge 004B613Eh
  loc_004B612C: push 00000058h
  loc_004B612E: push 0041E928h
  loc_004B6133: mov ecx, var_28
  loc_004B6136: push ecx
  loc_004B6137: push eax
  loc_004B6138: call [00401074h] ; __vbaHresultCheckObj
  loc_004B613E: push 0041E928h
  loc_004B6143: push 00000000h
  loc_004B6145: call [00401274h] ; __vbaCastObj
  loc_004B614B: push eax
  loc_004B614C: lea edx, var_28
  loc_004B614F: push edx
  loc_004B6150: call [004010A0h] ; __vbaObjSet
  loc_004B6156: mov edx, 0042563Ch ; "c:\Xerus\Crystal\Data\"
  loc_004B615B: lea ecx, var_20
  loc_004B615E: call [004011ECh] ; __vbaStrCopy
  loc_004B6164: mov eax, var_20
  loc_004B6167: push eax
  loc_004B6168: push 0041F65Ch ; "TmpXDB2.Mdb"
  loc_004B616D: mov edi, [00401054h] ; __vbaStrCat
  loc_004B6173: call edi
  loc_004B6175: mov var_3C, eax
  loc_004B6178: mov var_44, 00000008h
  loc_004B617F: push 00000000h
  loc_004B6181: lea ecx, var_44
  loc_004B6184: push ecx
  loc_004B6185: call [004011C8h] ; rtcDir
  loc_004B618B: mov edx, eax
  loc_004B618D: lea ecx, var_2C
  loc_004B6190: mov ebx, [00401270h] ; __vbaStrMove
  loc_004B6196: call ebx
  loc_004B6198: push eax
  loc_004B6199: push 0041E5D4h
  loc_004B619E: call [0040110Ch] ; __vbaStrCmp
  loc_004B61A4: mov esi, eax
  loc_004B61A6: neg esi
  loc_004B61A8: sbb esi, esi
  loc_004B61AA: neg esi
  loc_004B61AC: neg esi
  loc_004B61AE: lea ecx, var_2C
  loc_004B61B1: call [004012ACh] ; __vbaFreeStr
  loc_004B61B7: lea ecx, var_44
  loc_004B61BA: call [00401020h] ; __vbaFreeVar
  loc_004B61C0: test si, si
  loc_004B61C3: jz 004B637Ch
  loc_004B61C9: mov eax, [0061B3B4h]
  loc_004B61CE: test eax, eax
  loc_004B61D0: jnz 004B61E2h
  loc_004B61D2: push 0061B3B4h
  loc_004B61D7: push 004245F0h
  loc_004B61DC: call [004011DCh] ; __vbaNew2
  loc_004B61E2: mov eax, [0061B3B4h]
  loc_004B61E7: mov var_E8, eax
  loc_004B61ED: mov ecx, 0041E5D4h
  loc_004B61F2: mov var_BC, ecx
  loc_004B61F8: mov edx, 00000008h
  loc_004B61FD: mov var_C4, edx
  loc_004B6203: mov var_AC, 00000000h
  loc_004B620D: mov var_B4, 0000000Bh
  loc_004B6217: mov var_9C, 00425324h ; ";LANGID=0x0409;CP=1252;COUNTRY=0"
  loc_004B6221: mov var_A4, edx
  loc_004B6227: mov esi, [eax]
  loc_004B6229: sub esp, 00000010h
  loc_004B622C: mov eax, esp
  loc_004B622E: mov [eax], edx
  loc_004B6230: mov edx, var_C0
  loc_004B6236: mov [eax+00000004h], edx
  loc_004B6239: mov [eax+00000008h], ecx
  loc_004B623C: mov ecx, var_B8
  loc_004B6242: mov [eax+0000000Ch], ecx
  loc_004B6245: sub esp, 00000010h
  loc_004B6248: mov edx, esp
  loc_004B624A: mov eax, var_B4
  loc_004B6250: mov [edx], eax
  loc_004B6252: mov ecx, var_B0
  loc_004B6258: mov [edx+00000004h], ecx
  loc_004B625B: mov eax, var_AC
  loc_004B6261: mov [edx+00000008h], eax
  loc_004B6264: mov ecx, var_A8
  loc_004B626A: mov [edx+0000000Ch], ecx
  loc_004B626D: sub esp, 00000010h
  loc_004B6270: mov edx, esp
  loc_004B6272: mov eax, var_A4
  loc_004B6278: mov [edx], eax
  loc_004B627A: mov ecx, var_A0
  loc_004B6280: mov [edx+00000004h], ecx
  loc_004B6283: mov eax, var_9C
  loc_004B6289: mov [edx+00000008h], eax
  loc_004B628C: mov ecx, var_98
  loc_004B6292: mov [edx+0000000Ch], ecx
  loc_004B6295: mov edx, var_20
  loc_004B6298: push edx
  loc_004B6299: push 00425308h ; "TmpXDB3.Mdb"
  loc_004B629E: call edi
  loc_004B62A0: mov edx, eax
  loc_004B62A2: lea ecx, var_30
  loc_004B62A5: call ebx
  loc_004B62A7: push eax
  loc_004B62A8: mov eax, var_20
  loc_004B62AB: push eax
  loc_004B62AC: push 004252ECh ; "TmpXDB2.MdB"
  loc_004B62B1: call edi
  loc_004B62B3: mov edx, eax
  loc_004B62B5: lea ecx, var_2C
  loc_004B62B8: call ebx
  loc_004B62BA: push eax
  loc_004B62BB: mov ecx, esi
  loc_004B62BD: mov esi, var_E8
  loc_004B62C3: push esi
  loc_004B62C4: call [ecx+00000048h]
  loc_004B62C7: fnclex
  loc_004B62C9: test eax, eax
  loc_004B62CB: jge 004B62DCh
  loc_004B62CD: push 00000048h
  loc_004B62CF: push 004245E0h
  loc_004B62D4: push esi
  loc_004B62D5: push eax
  loc_004B62D6: call [00401074h] ; __vbaHresultCheckObj
  loc_004B62DC: lea edx, var_30
  loc_004B62DF: push edx
  loc_004B62E0: lea eax, var_2C
  loc_004B62E3: push eax
  loc_004B62E4: push 00000002h
  loc_004B62E6: mov esi, [004011FCh] ; __vbaFreeStrList
  loc_004B62EC: call __vbaFreeStrList
  loc_004B62EE: add esp, 0000000Ch
  loc_004B62F1: mov ecx, var_20
  loc_004B62F4: push ecx
  loc_004B62F5: push 0042536Ch ; "TmpXDB2.MDB"
  loc_004B62FA: call edi
  loc_004B62FC: mov var_3C, eax
  loc_004B62FF: mov var_44, 00000008h
  loc_004B6306: lea edx, var_44
  loc_004B6309: push edx
  loc_004B630A: call [00401108h] ; rtcKillFiles
  loc_004B6310: lea ecx, var_44
  loc_004B6313: call [00401020h] ; __vbaFreeVar
  loc_004B6319: mov eax, var_20
  loc_004B631C: push eax
  loc_004B631D: push 004253A4h ; "\TmpXDB2.mdb"
  loc_004B6322: call edi
  loc_004B6324: mov edx, eax
  loc_004B6326: lea ecx, var_30
  loc_004B6329: call ebx
  loc_004B632B: push eax
  loc_004B632C: mov ecx, var_20
  loc_004B632F: push ecx
  loc_004B6330: push 00425388h ; "TmpXDB3.mdb"
  loc_004B6335: call edi
  loc_004B6337: mov edx, eax
  loc_004B6339: lea ecx, var_2C
  loc_004B633C: call ebx
  loc_004B633E: push eax
  loc_004B633F: call [00401200h] ; rtcFileCopy
  loc_004B6345: lea edx, var_30
  loc_004B6348: push edx
  loc_004B6349: lea eax, var_2C
  loc_004B634C: push eax
  loc_004B634D: push 00000002h
  loc_004B634F: call __vbaFreeStrList
  loc_004B6351: add esp, 0000000Ch
  loc_004B6354: mov ecx, var_20
  loc_004B6357: push ecx
  loc_004B6358: push 004253C4h ; "TmpXDB3.MDB"
  loc_004B635D: call edi
  loc_004B635F: mov var_3C, eax
  loc_004B6362: mov var_44, 00000008h
  loc_004B6369: lea edx, var_44
  loc_004B636C: push edx
  loc_004B636D: call [00401108h] ; rtcKillFiles
  loc_004B6373: lea ecx, var_44
  loc_004B6376: call [00401020h] ; __vbaFreeVar
  loc_004B637C: mov eax, 80020004h
  loc_004B6381: mov var_6C, eax
  loc_004B6384: mov ecx, 0000000Ah
  loc_004B6389: mov var_74, ecx
  loc_004B638C: mov var_5C, eax
  loc_004B638F: mov var_64, ecx
  loc_004B6392: mov var_4C, eax
  loc_004B6395: mov var_54, ecx
  loc_004B6398: mov var_9C, 004262ACh ; "Finish ( Post Data to Machine 1) !"
  loc_004B63A2: mov var_A4, 00000008h
  loc_004B63AC: lea edx, var_A4
  loc_004B63B2: lea ecx, var_44
  loc_004B63B5: call [00401240h] ; __vbaVarDup
  loc_004B63BB: lea eax, var_74
  loc_004B63BE: push eax
  loc_004B63BF: lea ecx, var_64
  loc_004B63C2: push ecx
  loc_004B63C3: lea edx, var_54
  loc_004B63C6: push edx
  loc_004B63C7: push 00000040h
  loc_004B63C9: lea eax, var_44
  loc_004B63CC: push eax
  loc_004B63CD: call [004010A4h] ; rtcMsgBox
  loc_004B63D3: jmp 004B6469h
  loc_004B63D8: mov ecx, 80020004h
  loc_004B63DD: mov var_6C, ecx
  loc_004B63E0: mov eax, 0000000Ah
  loc_004B63E5: mov var_74, eax
  loc_004B63E8: mov var_5C, ecx
  loc_004B63EB: mov var_64, eax
  loc_004B63EE: mov var_4C, ecx
  loc_004B63F1: mov var_54, eax
  loc_004B63F4: call [00401210h] ; rtcErrObj
  loc_004B63FA: push eax
  loc_004B63FB: lea edx, var_34
  loc_004B63FE: push edx
  loc_004B63FF: call [004010A0h] ; __vbaObjSet
  loc_004B6405: mov esi, eax
  loc_004B6407: mov eax, [esi]
  loc_004B6409: lea ecx, var_2C
  loc_004B640C: push ecx
  loc_004B640D: push esi
  loc_004B640E: call [eax+0000002Ch]
  loc_004B6411: fnclex
  loc_004B6413: test eax, eax
  loc_004B6415: jge 004B6426h
  loc_004B6417: push 0000002Ch
  loc_004B6419: push 0042150Ch
  loc_004B641E: push esi
  loc_004B641F: push eax
  loc_004B6420: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6426: push 0042609Ch ; "Cann't post !!! "
  loc_004B642B: mov edx, var_2C
  loc_004B642E: push edx
  loc_004B642F: call [00401054h] ; __vbaStrCat
  loc_004B6435: mov var_3C, eax
  loc_004B6438: mov var_44, 00000008h
  loc_004B643F: lea eax, var_74
  loc_004B6442: push eax
  loc_004B6443: lea ecx, var_64
  loc_004B6446: push ecx
  loc_004B6447: lea edx, var_54
  loc_004B644A: push edx
  loc_004B644B: push 00000000h
  loc_004B644D: lea eax, var_44
  loc_004B6450: push eax
  loc_004B6451: call [004010A4h] ; rtcMsgBox
  loc_004B6457: lea ecx, var_2C
  loc_004B645A: call [004012ACh] ; __vbaFreeStr
  loc_004B6460: lea ecx, var_34
  loc_004B6463: call [004012B0h] ; __vbaFreeObj
  loc_004B6469: lea ecx, var_74
  loc_004B646C: push ecx
  loc_004B646D: lea edx, var_64
  loc_004B6470: push edx
  loc_004B6471: lea eax, var_54
  loc_004B6474: push eax
  loc_004B6475: lea ecx, var_44
  loc_004B6478: push ecx
  loc_004B6479: push 00000004h
  loc_004B647B: call [00401038h] ; __vbaFreeVarList
  loc_004B6481: add esp, 00000014h
  loc_004B6484: call [00401094h] ; __vbaExitProc
  loc_004B648A: push 004B64F1h
  loc_004B648F: jmp 004B64D7h
  loc_004B6491: lea edx, var_30
  loc_004B6494: push edx
  loc_004B6495: lea eax, var_2C
  loc_004B6498: push eax
  loc_004B6499: push 00000002h
  loc_004B649B: call [004011FCh] ; __vbaFreeStrList
  loc_004B64A1: add esp, 0000000Ch
  loc_004B64A4: lea ecx, var_34
  loc_004B64A7: call [004012B0h] ; __vbaFreeObj
  loc_004B64AD: lea ecx, var_94
  loc_004B64B3: push ecx
  loc_004B64B4: lea edx, var_84
  loc_004B64BA: push edx
  loc_004B64BB: lea eax, var_74
  loc_004B64BE: push eax
  loc_004B64BF: lea ecx, var_64
  loc_004B64C2: push ecx
  loc_004B64C3: lea edx, var_54
  loc_004B64C6: push edx
  loc_004B64C7: lea eax, var_44
  loc_004B64CA: push eax
  loc_004B64CB: push 00000006h
  loc_004B64CD: call [00401038h] ; __vbaFreeVarList
  loc_004B64D3: add esp, 0000001Ch
  loc_004B64D6: ret
  loc_004B64D7: lea ecx, var_20
  loc_004B64DA: call [004012ACh] ; __vbaFreeStr
  loc_004B64E0: lea ecx, var_24
  loc_004B64E3: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B64E9: call __vbaFreeObj
  loc_004B64EB: lea ecx, var_28
  loc_004B64EE: call __vbaFreeObj
  loc_004B64F0: ret
  loc_004B64F1: mov ecx, var_1C
  loc_004B64F4: mov fs:[00000000h], ecx
  loc_004B64FB: pop edi
  loc_004B64FC: pop esi
  loc_004B64FD: pop ebx
  loc_004B64FE: mov esp, ebp
  loc_004B6500: pop ebp
  loc_004B6501: ret
  loc_004B6502: nop
End Sub

Private Sub Proc_9_2_4B6510() '4B6510
  loc_004B6510: push ebp
  loc_004B6511: mov ebp, esp
  loc_004B6513: sub esp, 00000014h
  loc_004B6516: push 00403B36h ; __vbaExceptHandler
  loc_004B651B: mov eax, fs:[00000000h]
  loc_004B6521: push eax
  loc_004B6522: mov fs:[00000000h], esp
  loc_004B6529: sub esp, 000000F4h
  loc_004B652F: push ebx
  loc_004B6530: push esi
  loc_004B6531: push edi
  loc_004B6532: mov var_14, esp
  loc_004B6535: mov var_10, 00401D78h
  loc_004B653C: xor ebx, ebx
  loc_004B653E: mov var_C, ebx
  loc_004B6541: mov var_8, ebx
  loc_004B6544: mov var_20, ebx
  loc_004B6547: mov var_24, ebx
  loc_004B654A: mov var_28, ebx
  loc_004B654D: mov var_2C, ebx
  loc_004B6550: mov var_30, ebx
  loc_004B6553: mov var_34, ebx
  loc_004B6556: mov var_44, ebx
  loc_004B6559: mov var_54, ebx
  loc_004B655C: mov var_64, ebx
  loc_004B655F: mov var_74, ebx
  loc_004B6562: mov var_84, ebx
  loc_004B6568: mov var_94, ebx
  loc_004B656E: mov var_A4, ebx
  loc_004B6574: mov var_B4, ebx
  loc_004B657A: mov var_C4, ebx
  loc_004B6580: mov var_D4, ebx
  loc_004B6586: push 00000001h
  loc_004B6588: call [004010A8h] ; __vbaOnError
  loc_004B658E: push 0000000Dh
  loc_004B6590: lea eax, var_44
  loc_004B6593: push eax
  loc_004B6594: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B659A: mov eax, 80020004h
  loc_004B659F: mov var_8C, eax
  loc_004B65A5: mov ecx, 0000000Ah
  loc_004B65AA: mov var_94, ecx
  loc_004B65B0: mov var_7C, eax
  loc_004B65B3: mov var_84, ecx
  loc_004B65B9: mov var_BC, 0041F5E0h ; "SOFT"
  loc_004B65C3: mov esi, 00000008h
  loc_004B65C8: mov var_C4, esi
  loc_004B65CE: lea edx, var_C4
  loc_004B65D4: lea ecx, var_74
  loc_004B65D7: call [00401240h] ; __vbaVarDup
  loc_004B65DD: mov var_9C, 00424FE4h ; "Export process will take a few minutes."
  loc_004B65E7: mov var_A4, esi
  loc_004B65ED: mov var_AC, 00425CDCh ; "Are you sure to Export data to Machine 1 ?"
  loc_004B65F7: mov var_B4, esi
  loc_004B65FD: lea ecx, var_94
  loc_004B6603: push ecx
  loc_004B6604: lea edx, var_84
  loc_004B660A: push edx
  loc_004B660B: lea eax, var_74
  loc_004B660E: push eax
  loc_004B660F: push 00000144h
  loc_004B6614: lea ecx, var_A4
  loc_004B661A: push ecx
  loc_004B661B: lea edx, var_44
  loc_004B661E: push edx
  loc_004B661F: lea eax, var_54
  loc_004B6622: push eax
  loc_004B6623: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B6629: call __vbaVarCat
  loc_004B662B: push eax
  loc_004B662C: lea ecx, var_B4
  loc_004B6632: push ecx
  loc_004B6633: lea edx, var_64
  loc_004B6636: push edx
  loc_004B6637: call __vbaVarCat
  loc_004B6639: push eax
  loc_004B663A: call [004010A4h] ; rtcMsgBox
  loc_004B6640: xor ecx, ecx
  loc_004B6642: cmp eax, 00000006h
  loc_004B6645: setz cl
  loc_004B6648: neg ecx
  loc_004B664A: mov di, cx
  loc_004B664D: lea edx, var_94
  loc_004B6653: push edx
  loc_004B6654: lea eax, var_84
  loc_004B665A: push eax
  loc_004B665B: lea ecx, var_74
  loc_004B665E: push ecx
  loc_004B665F: lea edx, var_64
  loc_004B6662: push edx
  loc_004B6663: lea eax, var_54
  loc_004B6666: push eax
  loc_004B6667: lea ecx, var_44
  loc_004B666A: push ecx
  loc_004B666B: push 00000006h
  loc_004B666D: call [00401038h] ; __vbaFreeVarList
  loc_004B6673: add esp, 0000001Ch
  loc_004B6676: cmp di, bx
  loc_004B6679: jz 004B6FE4h
  loc_004B667F: cmp [0061B3B4h], ebx
  loc_004B6685: jnz 004B6697h
  loc_004B6687: push 0061B3B4h
  loc_004B668C: push 004245F0h
  loc_004B6691: call [004011DCh] ; __vbaNew2
  loc_004B6697: mov edi, [0061B3B4h]
  loc_004B669D: mov eax, 80020004h
  loc_004B66A2: mov var_BC, eax
  loc_004B66A8: mov ecx, 0000000Ah
  loc_004B66AD: mov var_C4, ecx
  loc_004B66B3: mov var_AC, eax
  loc_004B66B9: mov var_B4, ecx
  loc_004B66BF: mov var_9C, eax
  loc_004B66C5: mov var_A4, ecx
  loc_004B66CB: mov edx, [edi]
  loc_004B66CD: lea ebx, var_34
  loc_004B66D0: push ebx
  loc_004B66D1: sub esp, 00000010h
  loc_004B66D4: mov ebx, esp
  loc_004B66D6: mov [ebx], ecx
  loc_004B66D8: mov ecx, var_C0
  loc_004B66DE: mov [ebx+00000004h], ecx
  loc_004B66E1: mov [ebx+00000008h], eax
  loc_004B66E4: mov eax, var_B8
  loc_004B66EA: mov [ebx+0000000Ch], eax
  loc_004B66ED: sub esp, 00000010h
  loc_004B66F0: mov ecx, esp
  loc_004B66F2: mov eax, var_B4
  loc_004B66F8: mov [ecx], eax
  loc_004B66FA: mov eax, var_B0
  loc_004B6700: mov [ecx+00000004h], eax
  loc_004B6703: mov eax, var_AC
  loc_004B6709: mov [ecx+00000008h], eax
  loc_004B670C: mov eax, var_A8
  loc_004B6712: mov [ecx+0000000Ch], eax
  loc_004B6715: sub esp, 00000010h
  loc_004B6718: mov ecx, esp
  loc_004B671A: mov eax, var_A4
  loc_004B6720: mov [ecx], eax
  loc_004B6722: mov eax, var_A0
  loc_004B6728: mov [ecx+00000004h], eax
  loc_004B672B: mov eax, var_9C
  loc_004B6731: mov [ecx+00000008h], eax
  loc_004B6734: mov eax, var_98
  loc_004B673A: mov [ecx+0000000Ch], eax
  loc_004B673D: push 00425AF4h ; "c:\Xerus\Crystal\Data\TMPXDB2.mdb"
  loc_004B6742: push edi
  loc_004B6743: call [edx+00000058h]
  loc_004B6746: fnclex
  loc_004B6748: test eax, eax
  loc_004B674A: jge 004B675Bh
  loc_004B674C: push 00000058h
  loc_004B674E: push 004245E0h
  loc_004B6753: push edi
  loc_004B6754: push eax
  loc_004B6755: call [00401074h] ; __vbaHresultCheckObj
  loc_004B675B: mov eax, var_34
  loc_004B675E: mov var_34, 00000000h
  loc_004B6765: push eax
  loc_004B6766: lea ecx, var_28
  loc_004B6769: push ecx
  loc_004B676A: call [004010A0h] ; __vbaObjSet
  loc_004B6770: mov eax, 80020004h
  loc_004B6775: mov var_9C, eax
  loc_004B677B: mov ecx, 0000000Ah
  loc_004B6780: mov var_A4, ecx
  loc_004B6786: mov edx, var_28
  loc_004B6789: mov edi, [edx]
  loc_004B678B: sub esp, 00000010h
  loc_004B678E: mov ebx, esp
  loc_004B6790: mov [ebx], ecx
  loc_004B6792: mov ecx, var_A0
  loc_004B6798: mov [ebx+00000004h], ecx
  loc_004B679B: mov [ebx+00000008h], eax
  loc_004B679E: mov eax, var_98
  loc_004B67A4: mov [ebx+0000000Ch], eax
  loc_004B67A7: push 0042508Ch ; "Delete * From LG"
  loc_004B67AC: push edx
  loc_004B67AD: call [edi+0000005Ch]
  loc_004B67B0: fnclex
  loc_004B67B2: test eax, eax
  loc_004B67B4: jge 004B67C8h
  loc_004B67B6: push 0000005Ch
  loc_004B67B8: push 0041E928h
  loc_004B67BD: mov ecx, var_28
  loc_004B67C0: push ecx
  loc_004B67C1: push eax
  loc_004B67C2: call [00401074h] ; __vbaHresultCheckObj
  loc_004B67C8: mov eax, 80020004h
  loc_004B67CD: mov var_9C, eax
  loc_004B67D3: mov ecx, 0000000Ah
  loc_004B67D8: mov var_A4, ecx
  loc_004B67DE: mov edx, var_28
  loc_004B67E1: mov edi, [edx]
  loc_004B67E3: sub esp, 00000010h
  loc_004B67E6: mov ebx, esp
  loc_004B67E8: mov [ebx], ecx
  loc_004B67EA: mov ecx, var_A0
  loc_004B67F0: mov [ebx+00000004h], ecx
  loc_004B67F3: mov [ebx+00000008h], eax
  loc_004B67F6: mov eax, var_98
  loc_004B67FC: mov [ebx+0000000Ch], eax
  loc_004B67FF: push 004250B4h ; "Delete * From LGDetail"
  loc_004B6804: push edx
  loc_004B6805: call [edi+0000005Ch]
  loc_004B6808: fnclex
  loc_004B680A: test eax, eax
  loc_004B680C: jge 004B6820h
  loc_004B680E: push 0000005Ch
  loc_004B6810: push 0041E928h
  loc_004B6815: mov ecx, var_28
  loc_004B6818: push ecx
  loc_004B6819: push eax
  loc_004B681A: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6820: mov eax, 80020004h
  loc_004B6825: mov var_9C, eax
  loc_004B682B: mov ecx, 0000000Ah
  loc_004B6830: mov var_A4, ecx
  loc_004B6836: mov edx, var_28
  loc_004B6839: mov edi, [edx]
  loc_004B683B: sub esp, 00000010h
  loc_004B683E: mov ebx, esp
  loc_004B6840: mov [ebx], ecx
  loc_004B6842: mov ecx, var_A0
  loc_004B6848: mov [ebx+00000004h], ecx
  loc_004B684B: mov [ebx+00000008h], eax
  loc_004B684E: mov eax, var_98
  loc_004B6854: mov [ebx+0000000Ch], eax
  loc_004B6857: push 004258F8h ; "Delete * From LGSale"
  loc_004B685C: push edx
  loc_004B685D: call [edi+0000005Ch]
  loc_004B6860: fnclex
  loc_004B6862: test eax, eax
  loc_004B6864: jge 004B6878h
  loc_004B6866: push 0000005Ch
  loc_004B6868: push 0041E928h
  loc_004B686D: mov ecx, var_28
  loc_004B6870: push ecx
  loc_004B6871: push eax
  loc_004B6872: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6878: mov eax, 80020004h
  loc_004B687D: mov var_9C, eax
  loc_004B6883: mov ecx, 0000000Ah
  loc_004B6888: mov var_A4, ecx
  loc_004B688E: mov edx, var_28
  loc_004B6891: mov edi, [edx]
  loc_004B6893: sub esp, 00000010h
  loc_004B6896: mov ebx, esp
  loc_004B6898: mov [ebx], ecx
  loc_004B689A: mov ecx, var_A0
  loc_004B68A0: mov [ebx+00000004h], ecx
  loc_004B68A3: mov [ebx+00000008h], eax
  loc_004B68A6: mov eax, var_98
  loc_004B68AC: mov [ebx+0000000Ch], eax
  loc_004B68AF: push 00425928h ; "Delete * From LGSaleDetail"
  loc_004B68B4: push edx
  loc_004B68B5: call [edi+0000005Ch]
  loc_004B68B8: fnclex
  loc_004B68BA: test eax, eax
  loc_004B68BC: jge 004B68D0h
  loc_004B68BE: push 0000005Ch
  loc_004B68C0: push 0041E928h
  loc_004B68C5: mov ecx, var_28
  loc_004B68C8: push ecx
  loc_004B68C9: push eax
  loc_004B68CA: call [00401074h] ; __vbaHresultCheckObj
  loc_004B68D0: mov ebx, 80020004h
  loc_004B68D5: mov var_D4, 0000000Ah
  loc_004B68DF: mov var_AC, 00425F24h ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B68E9: mov var_B4, 00000008h
  loc_004B68F3: mov var_9C, 0061A05Ch
  loc_004B68FD: mov var_A4, 00004008h
  loc_004B6907: lea edx, var_A4
  loc_004B690D: push edx
  loc_004B690E: lea eax, var_44
  loc_004B6911: push eax
  loc_004B6912: mov edi, [004010D4h] ; rtcTrimVar
  loc_004B6918: call edi
  loc_004B691A: mov var_BC, 00425CB4h ; "' And MachineID=1"
  loc_004B6924: mov var_C4, 00000008h
  loc_004B692E: mov ecx, var_28
  loc_004B6931: mov edx, [ecx]
  loc_004B6933: sub esp, 00000010h
  loc_004B6936: mov eax, esp
  loc_004B6938: mov ecx, var_D4
  loc_004B693E: mov [eax], ecx
  loc_004B6940: mov ecx, var_D0
  loc_004B6946: mov [eax+00000004h], ecx
  loc_004B6949: mov [eax+00000008h], ebx
  loc_004B694C: mov ecx, var_C8
  loc_004B6952: mov [eax+0000000Ch], ecx
  loc_004B6955: lea eax, var_B4
  loc_004B695B: push eax
  loc_004B695C: lea ecx, var_44
  loc_004B695F: push ecx
  loc_004B6960: lea eax, var_54
  loc_004B6963: push eax
  loc_004B6964: mov var_104, edx
  loc_004B696A: call __vbaVarCat
  loc_004B696C: push eax
  loc_004B696D: lea ecx, var_C4
  loc_004B6973: push ecx
  loc_004B6974: lea edx, var_64
  loc_004B6977: push edx
  loc_004B6978: call __vbaVarCat
  loc_004B697A: push eax
  loc_004B697B: lea eax, var_2C
  loc_004B697E: push eax
  loc_004B697F: call [004011B0h] ; __vbaStrVarVal
  loc_004B6985: push eax
  loc_004B6986: mov ecx, var_28
  loc_004B6989: push ecx
  loc_004B698A: mov edx, var_104
  loc_004B6990: call [edx+0000005Ch]
  loc_004B6993: fnclex
  loc_004B6995: test eax, eax
  loc_004B6997: jge 004B69ABh
  loc_004B6999: push 0000005Ch
  loc_004B699B: push 0041E928h
  loc_004B69A0: mov ecx, var_28
  loc_004B69A3: push ecx
  loc_004B69A4: push eax
  loc_004B69A5: call [00401074h] ; __vbaHresultCheckObj
  loc_004B69AB: lea ecx, var_2C
  loc_004B69AE: call [004012ACh] ; __vbaFreeStr
  loc_004B69B4: lea edx, var_64
  loc_004B69B7: push edx
  loc_004B69B8: lea eax, var_54
  loc_004B69BB: push eax
  loc_004B69BC: lea ecx, var_44
  loc_004B69BF: push ecx
  loc_004B69C0: push 00000003h
  loc_004B69C2: call [00401038h] ; __vbaFreeVarList
  loc_004B69C8: add esp, 00000010h
  loc_004B69CB: mov ebx, 80020004h
  loc_004B69D0: mov var_AC, 00425FD4h ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B69DA: mov var_B4, 00000008h
  loc_004B69E4: mov var_9C, 0061A05Ch
  loc_004B69EE: mov var_A4, 00004008h
  loc_004B69F8: lea edx, var_A4
  loc_004B69FE: push edx
  loc_004B69FF: lea eax, var_44
  loc_004B6A02: push eax
  loc_004B6A03: call edi
  loc_004B6A05: mov var_BC, 00425CB4h ; "' And MachineID=1"
  loc_004B6A0F: mov var_C4, 00000008h
  loc_004B6A19: mov ecx, var_28
  loc_004B6A1C: mov edx, [ecx]
  loc_004B6A1E: sub esp, 00000010h
  loc_004B6A21: mov ecx, esp
  loc_004B6A23: mov eax, 0000000Ah
  loc_004B6A28: mov [ecx], eax
  loc_004B6A2A: mov eax, var_D0
  loc_004B6A30: mov [ecx+00000004h], eax
  loc_004B6A33: mov [ecx+00000008h], ebx
  loc_004B6A36: mov eax, var_C8
  loc_004B6A3C: mov [ecx+0000000Ch], eax
  loc_004B6A3F: lea ecx, var_B4
  loc_004B6A45: push ecx
  loc_004B6A46: lea eax, var_44
  loc_004B6A49: push eax
  loc_004B6A4A: lea ecx, var_54
  loc_004B6A4D: push ecx
  loc_004B6A4E: mov var_108, edx
  loc_004B6A54: call __vbaVarCat
  loc_004B6A56: push eax
  loc_004B6A57: lea edx, var_C4
  loc_004B6A5D: push edx
  loc_004B6A5E: lea eax, var_64
  loc_004B6A61: push eax
  loc_004B6A62: call __vbaVarCat
  loc_004B6A64: push eax
  loc_004B6A65: lea ecx, var_2C
  loc_004B6A68: push ecx
  loc_004B6A69: call [004011B0h] ; __vbaStrVarVal
  loc_004B6A6F: push eax
  loc_004B6A70: mov edx, var_28
  loc_004B6A73: push edx
  loc_004B6A74: mov eax, var_108
  loc_004B6A7A: call [eax+0000005Ch]
  loc_004B6A7D: fnclex
  loc_004B6A7F: test eax, eax
  loc_004B6A81: jge 004B6A95h
  loc_004B6A83: push 0000005Ch
  loc_004B6A85: push 0041E928h
  loc_004B6A8A: mov ecx, var_28
  loc_004B6A8D: push ecx
  loc_004B6A8E: push eax
  loc_004B6A8F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6A95: lea ecx, var_2C
  loc_004B6A98: call [004012ACh] ; __vbaFreeStr
  loc_004B6A9E: lea edx, var_64
  loc_004B6AA1: push edx
  loc_004B6AA2: lea eax, var_54
  loc_004B6AA5: push eax
  loc_004B6AA6: lea ecx, var_44
  loc_004B6AA9: push ecx
  loc_004B6AAA: push 00000003h
  loc_004B6AAC: call [00401038h] ; __vbaFreeVarList
  loc_004B6AB2: add esp, 00000010h
  loc_004B6AB5: mov ebx, 80020004h
  loc_004B6ABA: mov var_AC, 00426114h ; "INSERT INTO LGSale SELECT * FROM LGSale IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B6AC4: mov var_B4, 00000008h
  loc_004B6ACE: mov var_9C, 0061A05Ch
  loc_004B6AD8: mov var_A4, 00004008h
  loc_004B6AE2: lea edx, var_A4
  loc_004B6AE8: push edx
  loc_004B6AE9: lea eax, var_44
  loc_004B6AEC: push eax
  loc_004B6AED: call edi
  loc_004B6AEF: mov var_BC, 00425CB4h ; "' And MachineID=1"
  loc_004B6AF9: mov var_C4, 00000008h
  loc_004B6B03: mov ecx, var_28
  loc_004B6B06: mov edx, [ecx]
  loc_004B6B08: sub esp, 00000010h
  loc_004B6B0B: mov ecx, esp
  loc_004B6B0D: mov eax, 0000000Ah
  loc_004B6B12: mov [ecx], eax
  loc_004B6B14: mov eax, var_D0
  loc_004B6B1A: mov [ecx+00000004h], eax
  loc_004B6B1D: mov [ecx+00000008h], ebx
  loc_004B6B20: mov eax, var_C8
  loc_004B6B26: mov [ecx+0000000Ch], eax
  loc_004B6B29: lea ecx, var_B4
  loc_004B6B2F: push ecx
  loc_004B6B30: lea eax, var_44
  loc_004B6B33: push eax
  loc_004B6B34: lea ecx, var_54
  loc_004B6B37: push ecx
  loc_004B6B38: mov var_10C, edx
  loc_004B6B3E: call __vbaVarCat
  loc_004B6B40: push eax
  loc_004B6B41: lea edx, var_C4
  loc_004B6B47: push edx
  loc_004B6B48: lea eax, var_64
  loc_004B6B4B: push eax
  loc_004B6B4C: call __vbaVarCat
  loc_004B6B4E: push eax
  loc_004B6B4F: lea ecx, var_2C
  loc_004B6B52: push ecx
  loc_004B6B53: call [004011B0h] ; __vbaStrVarVal
  loc_004B6B59: push eax
  loc_004B6B5A: mov edx, var_28
  loc_004B6B5D: push edx
  loc_004B6B5E: mov eax, var_10C
  loc_004B6B64: call [eax+0000005Ch]
  loc_004B6B67: fnclex
  loc_004B6B69: test eax, eax
  loc_004B6B6B: jge 004B6B7Fh
  loc_004B6B6D: push 0000005Ch
  loc_004B6B6F: push 0041E928h
  loc_004B6B74: mov ecx, var_28
  loc_004B6B77: push ecx
  loc_004B6B78: push eax
  loc_004B6B79: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6B7F: lea ecx, var_2C
  loc_004B6B82: call [004012ACh] ; __vbaFreeStr
  loc_004B6B88: lea edx, var_64
  loc_004B6B8B: push edx
  loc_004B6B8C: lea eax, var_54
  loc_004B6B8F: push eax
  loc_004B6B90: lea ecx, var_44
  loc_004B6B93: push ecx
  loc_004B6B94: push 00000003h
  loc_004B6B96: call [00401038h] ; __vbaFreeVarList
  loc_004B6B9C: add esp, 00000010h
  loc_004B6B9F: mov ebx, 80020004h
  loc_004B6BA4: mov var_AC, 004261D4h ; "INSERT INTO LGSaleDetail SELECT * FROM LGSaleDetail IN 'c:\Xerus\Crystal\Data\Super.mdb' WHERE OnCount='"
  loc_004B6BAE: mov var_B4, 00000008h
  loc_004B6BB8: mov var_9C, 0061A05Ch
  loc_004B6BC2: mov var_A4, 00004008h
  loc_004B6BCC: lea edx, var_A4
  loc_004B6BD2: push edx
  loc_004B6BD3: lea eax, var_44
  loc_004B6BD6: push eax
  loc_004B6BD7: call edi
  loc_004B6BD9: mov var_BC, 00425CB4h ; "' And MachineID=1"
  loc_004B6BE3: mov var_C4, 00000008h
  loc_004B6BED: mov ecx, var_28
  loc_004B6BF0: mov edi, [ecx]
  loc_004B6BF2: sub esp, 00000010h
  loc_004B6BF5: mov edx, esp
  loc_004B6BF7: mov eax, 0000000Ah
  loc_004B6BFC: mov [edx], eax
  loc_004B6BFE: mov eax, var_D0
  loc_004B6C04: mov [edx+00000004h], eax
  loc_004B6C07: mov [edx+00000008h], ebx
  loc_004B6C0A: mov ecx, var_C8
  loc_004B6C10: mov [edx+0000000Ch], ecx
  loc_004B6C13: lea edx, var_B4
  loc_004B6C19: push edx
  loc_004B6C1A: lea eax, var_44
  loc_004B6C1D: push eax
  loc_004B6C1E: lea ecx, var_54
  loc_004B6C21: push ecx
  loc_004B6C22: call __vbaVarCat
  loc_004B6C24: push eax
  loc_004B6C25: lea edx, var_C4
  loc_004B6C2B: push edx
  loc_004B6C2C: lea eax, var_64
  loc_004B6C2F: push eax
  loc_004B6C30: call __vbaVarCat
  loc_004B6C32: push eax
  loc_004B6C33: lea ecx, var_2C
  loc_004B6C36: push ecx
  loc_004B6C37: call [004011B0h] ; __vbaStrVarVal
  loc_004B6C3D: push eax
  loc_004B6C3E: mov edx, var_28
  loc_004B6C41: push edx
  loc_004B6C42: call [edi+0000005Ch]
  loc_004B6C45: fnclex
  loc_004B6C47: test eax, eax
  loc_004B6C49: jge 004B6C5Dh
  loc_004B6C4B: push 0000005Ch
  loc_004B6C4D: push 0041E928h
  loc_004B6C52: mov ecx, var_28
  loc_004B6C55: push ecx
  loc_004B6C56: push eax
  loc_004B6C57: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6C5D: lea ecx, var_2C
  loc_004B6C60: call [004012ACh] ; __vbaFreeStr
  loc_004B6C66: lea edx, var_64
  loc_004B6C69: push edx
  loc_004B6C6A: lea eax, var_54
  loc_004B6C6D: push eax
  loc_004B6C6E: lea ecx, var_44
  loc_004B6C71: push ecx
  loc_004B6C72: push 00000003h
  loc_004B6C74: call [00401038h] ; __vbaFreeVarList
  loc_004B6C7A: add esp, 00000010h
  loc_004B6C7D: mov eax, var_28
  loc_004B6C80: mov edx, [eax]
  loc_004B6C82: push eax
  loc_004B6C83: call [edx+00000058h]
  loc_004B6C86: fnclex
  loc_004B6C88: test eax, eax
  loc_004B6C8A: jge 004B6C9Eh
  loc_004B6C8C: push 00000058h
  loc_004B6C8E: push 0041E928h
  loc_004B6C93: mov ecx, var_28
  loc_004B6C96: push ecx
  loc_004B6C97: push eax
  loc_004B6C98: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6C9E: push 0041E928h
  loc_004B6CA3: push 00000000h
  loc_004B6CA5: call [00401274h] ; __vbaCastObj
  loc_004B6CAB: push eax
  loc_004B6CAC: lea edx, var_28
  loc_004B6CAF: push edx
  loc_004B6CB0: call [004010A0h] ; __vbaObjSet
  loc_004B6CB6: mov edx, 0042563Ch ; "c:\Xerus\Crystal\Data\"
  loc_004B6CBB: lea ecx, var_20
  loc_004B6CBE: call [004011ECh] ; __vbaStrCopy
  loc_004B6CC4: mov eax, var_20
  loc_004B6CC7: push eax
  loc_004B6CC8: push 0041F65Ch ; "TmpXDB2.Mdb"
  loc_004B6CCD: mov edi, [00401054h] ; __vbaStrCat
  loc_004B6CD3: call edi
  loc_004B6CD5: mov var_3C, eax
  loc_004B6CD8: mov var_44, 00000008h
  loc_004B6CDF: push 00000000h
  loc_004B6CE1: lea ecx, var_44
  loc_004B6CE4: push ecx
  loc_004B6CE5: call [004011C8h] ; rtcDir
  loc_004B6CEB: mov edx, eax
  loc_004B6CED: lea ecx, var_2C
  loc_004B6CF0: mov ebx, [00401270h] ; __vbaStrMove
  loc_004B6CF6: call ebx
  loc_004B6CF8: push eax
  loc_004B6CF9: push 0041E5D4h
  loc_004B6CFE: call [0040110Ch] ; __vbaStrCmp
  loc_004B6D04: mov esi, eax
  loc_004B6D06: neg esi
  loc_004B6D08: sbb esi, esi
  loc_004B6D0A: neg esi
  loc_004B6D0C: neg esi
  loc_004B6D0E: lea ecx, var_2C
  loc_004B6D11: call [004012ACh] ; __vbaFreeStr
  loc_004B6D17: lea ecx, var_44
  loc_004B6D1A: call [00401020h] ; __vbaFreeVar
  loc_004B6D20: test si, si
  loc_004B6D23: jz 004B6EDCh
  loc_004B6D29: mov eax, [0061B3B4h]
  loc_004B6D2E: test eax, eax
  loc_004B6D30: jnz 004B6D42h
  loc_004B6D32: push 0061B3B4h
  loc_004B6D37: push 004245F0h
  loc_004B6D3C: call [004011DCh] ; __vbaNew2
  loc_004B6D42: mov eax, [0061B3B4h]
  loc_004B6D47: mov var_E8, eax
  loc_004B6D4D: mov ecx, 0041E5D4h
  loc_004B6D52: mov var_BC, ecx
  loc_004B6D58: mov edx, 00000008h
  loc_004B6D5D: mov var_C4, edx
  loc_004B6D63: mov var_AC, 00000000h
  loc_004B6D6D: mov var_B4, 0000000Bh
  loc_004B6D77: mov var_9C, 00425324h ; ";LANGID=0x0409;CP=1252;COUNTRY=0"
  loc_004B6D81: mov var_A4, edx
  loc_004B6D87: mov esi, [eax]
  loc_004B6D89: sub esp, 00000010h
  loc_004B6D8C: mov eax, esp
  loc_004B6D8E: mov [eax], edx
  loc_004B6D90: mov edx, var_C0
  loc_004B6D96: mov [eax+00000004h], edx
  loc_004B6D99: mov [eax+00000008h], ecx
  loc_004B6D9C: mov ecx, var_B8
  loc_004B6DA2: mov [eax+0000000Ch], ecx
  loc_004B6DA5: sub esp, 00000010h
  loc_004B6DA8: mov edx, esp
  loc_004B6DAA: mov eax, var_B4
  loc_004B6DB0: mov [edx], eax
  loc_004B6DB2: mov ecx, var_B0
  loc_004B6DB8: mov [edx+00000004h], ecx
  loc_004B6DBB: mov eax, var_AC
  loc_004B6DC1: mov [edx+00000008h], eax
  loc_004B6DC4: mov ecx, var_A8
  loc_004B6DCA: mov [edx+0000000Ch], ecx
  loc_004B6DCD: sub esp, 00000010h
  loc_004B6DD0: mov edx, esp
  loc_004B6DD2: mov eax, var_A4
  loc_004B6DD8: mov [edx], eax
  loc_004B6DDA: mov ecx, var_A0
  loc_004B6DE0: mov [edx+00000004h], ecx
  loc_004B6DE3: mov eax, var_9C
  loc_004B6DE9: mov [edx+00000008h], eax
  loc_004B6DEC: mov ecx, var_98
  loc_004B6DF2: mov [edx+0000000Ch], ecx
  loc_004B6DF5: mov edx, var_20
  loc_004B6DF8: push edx
  loc_004B6DF9: push 00425308h ; "TmpXDB3.Mdb"
  loc_004B6DFE: call edi
  loc_004B6E00: mov edx, eax
  loc_004B6E02: lea ecx, var_30
  loc_004B6E05: call ebx
  loc_004B6E07: push eax
  loc_004B6E08: mov eax, var_20
  loc_004B6E0B: push eax
  loc_004B6E0C: push 004252ECh ; "TmpXDB2.MdB"
  loc_004B6E11: call edi
  loc_004B6E13: mov edx, eax
  loc_004B6E15: lea ecx, var_2C
  loc_004B6E18: call ebx
  loc_004B6E1A: push eax
  loc_004B6E1B: mov ecx, esi
  loc_004B6E1D: mov esi, var_E8
  loc_004B6E23: push esi
  loc_004B6E24: call [ecx+00000048h]
  loc_004B6E27: fnclex
  loc_004B6E29: test eax, eax
  loc_004B6E2B: jge 004B6E3Ch
  loc_004B6E2D: push 00000048h
  loc_004B6E2F: push 004245E0h
  loc_004B6E34: push esi
  loc_004B6E35: push eax
  loc_004B6E36: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6E3C: lea edx, var_30
  loc_004B6E3F: push edx
  loc_004B6E40: lea eax, var_2C
  loc_004B6E43: push eax
  loc_004B6E44: push 00000002h
  loc_004B6E46: mov esi, [004011FCh] ; __vbaFreeStrList
  loc_004B6E4C: call __vbaFreeStrList
  loc_004B6E4E: add esp, 0000000Ch
  loc_004B6E51: mov ecx, var_20
  loc_004B6E54: push ecx
  loc_004B6E55: push 0042536Ch ; "TmpXDB2.MDB"
  loc_004B6E5A: call edi
  loc_004B6E5C: mov var_3C, eax
  loc_004B6E5F: mov var_44, 00000008h
  loc_004B6E66: lea edx, var_44
  loc_004B6E69: push edx
  loc_004B6E6A: call [00401108h] ; rtcKillFiles
  loc_004B6E70: lea ecx, var_44
  loc_004B6E73: call [00401020h] ; __vbaFreeVar
  loc_004B6E79: mov eax, var_20
  loc_004B6E7C: push eax
  loc_004B6E7D: push 004253A4h ; "\TmpXDB2.mdb"
  loc_004B6E82: call edi
  loc_004B6E84: mov edx, eax
  loc_004B6E86: lea ecx, var_30
  loc_004B6E89: call ebx
  loc_004B6E8B: push eax
  loc_004B6E8C: mov ecx, var_20
  loc_004B6E8F: push ecx
  loc_004B6E90: push 00425388h ; "TmpXDB3.mdb"
  loc_004B6E95: call edi
  loc_004B6E97: mov edx, eax
  loc_004B6E99: lea ecx, var_2C
  loc_004B6E9C: call ebx
  loc_004B6E9E: push eax
  loc_004B6E9F: call [00401200h] ; rtcFileCopy
  loc_004B6EA5: lea edx, var_30
  loc_004B6EA8: push edx
  loc_004B6EA9: lea eax, var_2C
  loc_004B6EAC: push eax
  loc_004B6EAD: push 00000002h
  loc_004B6EAF: call __vbaFreeStrList
  loc_004B6EB1: add esp, 0000000Ch
  loc_004B6EB4: mov ecx, var_20
  loc_004B6EB7: push ecx
  loc_004B6EB8: push 004253C4h ; "TmpXDB3.MDB"
  loc_004B6EBD: call edi
  loc_004B6EBF: mov var_3C, eax
  loc_004B6EC2: mov var_44, 00000008h
  loc_004B6EC9: lea edx, var_44
  loc_004B6ECC: push edx
  loc_004B6ECD: call [00401108h] ; rtcKillFiles
  loc_004B6ED3: lea ecx, var_44
  loc_004B6ED6: call [00401020h] ; __vbaFreeVar
  loc_004B6EDC: mov eax, 80020004h
  loc_004B6EE1: mov var_6C, eax
  loc_004B6EE4: mov ecx, 0000000Ah
  loc_004B6EE9: mov var_74, ecx
  loc_004B6EEC: mov var_5C, eax
  loc_004B6EEF: mov var_64, ecx
  loc_004B6EF2: mov var_4C, eax
  loc_004B6EF5: mov var_54, ecx
  loc_004B6EF8: mov var_9C, 004260C4h ; "Finish ( Post Data to Machine 2) !"
  loc_004B6F02: mov var_A4, 00000008h
  loc_004B6F0C: lea edx, var_A4
  loc_004B6F12: lea ecx, var_44
  loc_004B6F15: call [00401240h] ; __vbaVarDup
  loc_004B6F1B: lea eax, var_74
  loc_004B6F1E: push eax
  loc_004B6F1F: lea ecx, var_64
  loc_004B6F22: push ecx
  loc_004B6F23: lea edx, var_54
  loc_004B6F26: push edx
  loc_004B6F27: push 00000040h
  loc_004B6F29: lea eax, var_44
  loc_004B6F2C: push eax
  loc_004B6F2D: call [004010A4h] ; rtcMsgBox
  loc_004B6F33: jmp 004B6FC9h
  loc_004B6F38: mov ecx, 80020004h
  loc_004B6F3D: mov var_6C, ecx
  loc_004B6F40: mov eax, 0000000Ah
  loc_004B6F45: mov var_74, eax
  loc_004B6F48: mov var_5C, ecx
  loc_004B6F4B: mov var_64, eax
  loc_004B6F4E: mov var_4C, ecx
  loc_004B6F51: mov var_54, eax
  loc_004B6F54: call [00401210h] ; rtcErrObj
  loc_004B6F5A: push eax
  loc_004B6F5B: lea edx, var_34
  loc_004B6F5E: push edx
  loc_004B6F5F: call [004010A0h] ; __vbaObjSet
  loc_004B6F65: mov esi, eax
  loc_004B6F67: mov eax, [esi]
  loc_004B6F69: lea ecx, var_2C
  loc_004B6F6C: push ecx
  loc_004B6F6D: push esi
  loc_004B6F6E: call [eax+0000002Ch]
  loc_004B6F71: fnclex
  loc_004B6F73: test eax, eax
  loc_004B6F75: jge 004B6F86h
  loc_004B6F77: push 0000002Ch
  loc_004B6F79: push 0042150Ch
  loc_004B6F7E: push esi
  loc_004B6F7F: push eax
  loc_004B6F80: call [00401074h] ; __vbaHresultCheckObj
  loc_004B6F86: push 0042609Ch ; "Cann't post !!! "
  loc_004B6F8B: mov edx, var_2C
  loc_004B6F8E: push edx
  loc_004B6F8F: call [00401054h] ; __vbaStrCat
  loc_004B6F95: mov var_3C, eax
  loc_004B6F98: mov var_44, 00000008h
  loc_004B6F9F: lea eax, var_74
  loc_004B6FA2: push eax
  loc_004B6FA3: lea ecx, var_64
  loc_004B6FA6: push ecx
  loc_004B6FA7: lea edx, var_54
  loc_004B6FAA: push edx
  loc_004B6FAB: push 00000000h
  loc_004B6FAD: lea eax, var_44
  loc_004B6FB0: push eax
  loc_004B6FB1: call [004010A4h] ; rtcMsgBox
  loc_004B6FB7: lea ecx, var_2C
  loc_004B6FBA: call [004012ACh] ; __vbaFreeStr
  loc_004B6FC0: lea ecx, var_34
  loc_004B6FC3: call [004012B0h] ; __vbaFreeObj
  loc_004B6FC9: lea ecx, var_74
  loc_004B6FCC: push ecx
  loc_004B6FCD: lea edx, var_64
  loc_004B6FD0: push edx
  loc_004B6FD1: lea eax, var_54
  loc_004B6FD4: push eax
  loc_004B6FD5: lea ecx, var_44
  loc_004B6FD8: push ecx
  loc_004B6FD9: push 00000004h
  loc_004B6FDB: call [00401038h] ; __vbaFreeVarList
  loc_004B6FE1: add esp, 00000014h
  loc_004B6FE4: call [00401094h] ; __vbaExitProc
  loc_004B6FEA: push 004B7051h
  loc_004B6FEF: jmp 004B7037h
  loc_004B6FF1: lea edx, var_30
  loc_004B6FF4: push edx
  loc_004B6FF5: lea eax, var_2C
  loc_004B6FF8: push eax
  loc_004B6FF9: push 00000002h
  loc_004B6FFB: call [004011FCh] ; __vbaFreeStrList
  loc_004B7001: add esp, 0000000Ch
  loc_004B7004: lea ecx, var_34
  loc_004B7007: call [004012B0h] ; __vbaFreeObj
  loc_004B700D: lea ecx, var_94
  loc_004B7013: push ecx
  loc_004B7014: lea edx, var_84
  loc_004B701A: push edx
  loc_004B701B: lea eax, var_74
  loc_004B701E: push eax
  loc_004B701F: lea ecx, var_64
  loc_004B7022: push ecx
  loc_004B7023: lea edx, var_54
  loc_004B7026: push edx
  loc_004B7027: lea eax, var_44
  loc_004B702A: push eax
  loc_004B702B: push 00000006h
  loc_004B702D: call [00401038h] ; __vbaFreeVarList
  loc_004B7033: add esp, 0000001Ch
  loc_004B7036: ret
  loc_004B7037: lea ecx, var_20
  loc_004B703A: call [004012ACh] ; __vbaFreeStr
  loc_004B7040: lea ecx, var_24
  loc_004B7043: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B7049: call __vbaFreeObj
  loc_004B704B: lea ecx, var_28
  loc_004B704E: call __vbaFreeObj
  loc_004B7050: ret
  loc_004B7051: mov ecx, var_1C
  loc_004B7054: mov fs:[00000000h], ecx
  loc_004B705B: pop edi
  loc_004B705C: pop esi
  loc_004B705D: pop ebx
  loc_004B705E: mov esp, ebp
  loc_004B7060: pop ebp
  loc_004B7061: ret
  loc_004B7062: nop
End Sub

Private Sub Proc_9_3_4B7070() '4B7070
  loc_004B7070: push ebp
  loc_004B7071: mov ebp, esp
  loc_004B7073: sub esp, 00000014h
  loc_004B7076: push 00403B36h ; __vbaExceptHandler
  loc_004B707B: mov eax, fs:[00000000h]
  loc_004B7081: push eax
  loc_004B7082: mov fs:[00000000h], esp
  loc_004B7089: sub esp, 000000BCh
  loc_004B708F: push ebx
  loc_004B7090: push esi
  loc_004B7091: push edi
  loc_004B7092: mov var_14, esp
  loc_004B7095: mov var_10, 00401DA0h
  loc_004B709C: xor esi, esi
  loc_004B709E: mov var_C, esi
  loc_004B70A1: mov var_8, esi
  loc_004B70A4: mov var_2C, esi
  loc_004B70A7: mov var_3C, esi
  loc_004B70AA: mov var_4C, esi
  loc_004B70AD: mov var_5C, esi
  loc_004B70B0: mov var_6C, esi
  loc_004B70B3: mov var_7C, esi
  loc_004B70B6: mov var_8C, esi
  loc_004B70BC: mov var_9C, esi
  loc_004B70C2: mov var_C0, esi
  loc_004B70C8: push 00000001h
  loc_004B70CA: call [004010A8h] ; __vbaOnError
  loc_004B70D0: call 004B7350h
  loc_004B70D5: call 004B8470h
  loc_004B70DA: call 004B8710h
  loc_004B70DF: push 0061A154h
  loc_004B70E4: call 004B89B0h
  loc_004B70E9: cmp [0061A224h], esi
  loc_004B70EF: jnz 004B7101h
  loc_004B70F1: push 0061A224h
  loc_004B70F6: push 004060A0h
  loc_004B70FB: call [004011DCh] ; __vbaNew2
  loc_004B7101: mov esi, [0061A224h]
  loc_004B7107: mov eax, 80020004h
  loc_004B710C: mov ecx, 0000000Ah
  loc_004B7111: mov edx, 00000001h
  loc_004B7116: mov var_84, edx
  loc_004B711C: mov var_8C, 00000002h
  loc_004B7126: mov edi, [esi]
  loc_004B7128: sub esp, 00000010h
  loc_004B712B: mov ebx, esp
  loc_004B712D: mov [ebx], ecx
  loc_004B712F: mov ecx, var_98
  loc_004B7135: mov [ebx+00000004h], ecx
  loc_004B7138: mov [ebx+00000008h], eax
  loc_004B713B: mov eax, var_90
  loc_004B7141: mov [ebx+0000000Ch], eax
  loc_004B7144: sub esp, 00000010h
  loc_004B7147: mov ecx, esp
  loc_004B7149: mov eax, var_8C
  loc_004B714F: mov [ecx], eax
  loc_004B7151: mov eax, var_88
  loc_004B7157: mov [ecx+00000004h], eax
  loc_004B715A: mov [ecx+00000008h], edx
  loc_004B715D: mov edx, var_80
  loc_004B7160: mov [ecx+0000000Ch], edx
  loc_004B7163: push esi
  loc_004B7164: call [edi+000002B0h]
  loc_004B716A: fnclex
  loc_004B716C: test eax, eax
  loc_004B716E: jge 004B7182h
  loc_004B7170: push 000002B0h
  loc_004B7175: push 00426494h
  loc_004B717A: push esi
  loc_004B717B: push eax
  loc_004B717C: call [00401074h] ; __vbaHresultCheckObj
  loc_004B7182: mov eax, [0061A224h]
  loc_004B7187: test eax, eax
  loc_004B7189: jnz 004B719Bh
  loc_004B718B: push 0061A224h
  loc_004B7190: push 004060A0h
  loc_004B7195: call [004011DCh] ; __vbaNew2
  loc_004B719B: mov esi, [0061A224h]
  loc_004B71A1: mov eax, [esi]
  loc_004B71A3: lea ecx, var_C0
  loc_004B71A9: push ecx
  loc_004B71AA: push esi
  loc_004B71AB: call [eax+000006F8h]
  loc_004B71B1: fnclex
  loc_004B71B3: test eax, eax
  loc_004B71B5: jge 004B71C9h
  loc_004B71B7: push 000006F8h
  loc_004B71BC: push 00425F10h
  loc_004B71C1: push esi
  loc_004B71C2: push eax
  loc_004B71C3: call [00401074h] ; __vbaHresultCheckObj
  loc_004B71C9: cmp var_C0, 0000h
  loc_004B71D1: jnz 004B71D9h
  loc_004B71D3: call [00401034h] ; __vbaEnd
  loc_004B71D9: mov eax, [0061A238h]
  loc_004B71DE: test eax, eax
  loc_004B71E0: jnz 004B71F2h
  loc_004B71E2: push 0061A238h
  loc_004B71E7: push 004095B4h
  loc_004B71EC: call [004011DCh] ; __vbaNew2
  loc_004B71F2: mov esi, [0061A238h]
  loc_004B71F8: mov eax, 80020004h
  loc_004B71FD: mov ecx, 0000000Ah
  loc_004B7202: mov edx, 00000001h
  loc_004B7207: mov var_84, edx
  loc_004B720D: mov var_8C, 00000002h
  loc_004B7217: mov edi, [esi]
  loc_004B7219: sub esp, 00000010h
  loc_004B721C: mov ebx, esp
  loc_004B721E: mov [ebx], ecx
  loc_004B7220: mov ecx, var_98
  loc_004B7226: mov [ebx+00000004h], ecx
  loc_004B7229: mov [ebx+00000008h], eax
  loc_004B722C: mov eax, var_90
  loc_004B7232: mov [ebx+0000000Ch], eax
  loc_004B7235: sub esp, 00000010h
  loc_004B7238: mov ecx, esp
  loc_004B723A: mov eax, var_8C
  loc_004B7240: mov [ecx], eax
  loc_004B7242: mov eax, var_88
  loc_004B7248: mov [ecx+00000004h], eax
  loc_004B724B: mov [ecx+00000008h], edx
  loc_004B724E: mov edx, var_80
  loc_004B7251: mov [ecx+0000000Ch], edx
  loc_004B7254: push esi
  loc_004B7255: call [edi+000002B0h]
  loc_004B725B: fnclex
  loc_004B725D: test eax, eax
  loc_004B725F: jge 004B72F9h
  loc_004B7265: push 000002B0h
  loc_004B726A: push 00424B18h
  loc_004B726F: push esi
  loc_004B7270: push eax
  loc_004B7271: call [00401074h] ; __vbaHresultCheckObj
  loc_004B7277: call [00401094h] ; __vbaExitProc
  loc_004B727D: push 004B7333h
  loc_004B7282: jmp 004B7322h
  loc_004B7287: mov ecx, 80020004h
  loc_004B728C: mov var_74, ecx
  loc_004B728F: mov eax, 0000000Ah
  loc_004B7294: mov var_7C, eax
  loc_004B7297: mov var_64, ecx
  loc_004B729A: mov var_6C, eax
  loc_004B729D: mov var_54, ecx
  loc_004B72A0: mov var_5C, eax
  loc_004B72A3: mov var_84, 004264CCh ; "Licence Require !"
  loc_004B72AD: mov var_8C, 00000008h
  loc_004B72B7: lea edx, var_8C
  loc_004B72BD: lea ecx, var_4C
  loc_004B72C0: call [00401240h] ; __vbaVarDup
  loc_004B72C6: lea eax, var_7C
  loc_004B72C9: push eax
  loc_004B72CA: lea ecx, var_6C
  loc_004B72CD: push ecx
  loc_004B72CE: lea edx, var_5C
  loc_004B72D1: push edx
  loc_004B72D2: push 00000030h
  loc_004B72D4: lea eax, var_4C
  loc_004B72D7: push eax
  loc_004B72D8: call [004010A4h] ; rtcMsgBox
  loc_004B72DE: lea ecx, var_7C
  loc_004B72E1: push ecx
  loc_004B72E2: lea edx, var_6C
  loc_004B72E5: push edx
  loc_004B72E6: lea eax, var_5C
  loc_004B72E9: push eax
  loc_004B72EA: lea ecx, var_4C
  loc_004B72ED: push ecx
  loc_004B72EE: push 00000004h
  loc_004B72F0: call [00401038h] ; __vbaFreeVarList
  loc_004B72F6: add esp, 00000014h
  loc_004B72F9: call [00401094h] ; __vbaExitProc
  loc_004B72FF: push 004B7333h
  loc_004B7304: jmp 004B7322h
  loc_004B7306: lea edx, var_7C
  loc_004B7309: push edx
  loc_004B730A: lea eax, var_6C
  loc_004B730D: push eax
  loc_004B730E: lea ecx, var_5C
  loc_004B7311: push ecx
  loc_004B7312: lea edx, var_4C
  loc_004B7315: push edx
  loc_004B7316: push 00000004h
  loc_004B7318: call [00401038h] ; __vbaFreeVarList
  loc_004B731E: add esp, 00000014h
  loc_004B7321: ret
  loc_004B7322: lea ecx, var_2C
  loc_004B7325: mov esi, [00401020h] ; __vbaFreeVar
  loc_004B732B: call __vbaFreeVar
  loc_004B732D: lea ecx, var_3C
  loc_004B7330: call __vbaFreeVar
  loc_004B7332: ret
  loc_004B7333: mov ecx, var_1C
  loc_004B7336: mov fs:[00000000h], ecx
  loc_004B733D: pop edi
  loc_004B733E: pop esi
  loc_004B733F: pop ebx
  loc_004B7340: mov esp, ebp
  loc_004B7342: pop ebp
  loc_004B7343: ret
  loc_004B7344: nop
End Sub

Private Sub Proc_9_4_4B7350() '4B7350
  loc_004B7350: push ebp
  loc_004B7351: mov ebp, esp
  loc_004B7353: sub esp, 00000014h
  loc_004B7356: push 00403B36h ; __vbaExceptHandler
  loc_004B735B: mov eax, fs:[00000000h]
  loc_004B7361: push eax
  loc_004B7362: mov fs:[00000000h], esp
  loc_004B7369: sub esp, 000000C0h
  loc_004B736F: push ebx
  loc_004B7370: push esi
  loc_004B7371: push edi
  loc_004B7372: mov var_14, esp
  loc_004B7375: mov var_10, 00401DC8h
  loc_004B737C: xor edi, edi
  loc_004B737E: mov var_C, edi
  loc_004B7381: mov var_8, edi
  loc_004B7384: mov var_20, edi
  loc_004B7387: mov var_24, edi
  loc_004B738A: mov var_28, edi
  loc_004B738D: mov var_2C, edi
  loc_004B7390: mov var_30, edi
  loc_004B7393: mov var_34, edi
  loc_004B7396: mov var_44, edi
  loc_004B7399: mov var_54, edi
  loc_004B739C: mov var_64, edi
  loc_004B739F: mov var_74, edi
  loc_004B73A2: mov var_84, edi
  loc_004B73A8: mov var_88, edi
  loc_004B73AE: mov var_8C, edi
  loc_004B73B4: mov var_90, edi
  loc_004B73BA: push 00000001h
  loc_004B73BC: call [004010A8h] ; __vbaOnError
  loc_004B73C2: cmp [0061B394h], edi
  loc_004B73C8: jnz 004B73DAh
  loc_004B73CA: push 0061B394h
  loc_004B73CF: push 0041E4A0h
  loc_004B73D4: call [004011DCh] ; __vbaNew2
  loc_004B73DA: mov esi, [0061B394h]
  loc_004B73E0: mov eax, [esi]
  loc_004B73E2: lea ecx, var_2C
  loc_004B73E5: push ecx
  loc_004B73E6: push esi
  loc_004B73E7: call [eax+00000014h]
  loc_004B73EA: fnclex
  loc_004B73EC: cmp eax, edi
  loc_004B73EE: jge 004B73FFh
  loc_004B73F0: push 00000014h
  loc_004B73F2: push 0041E490h
  loc_004B73F7: push esi
  loc_004B73F8: push eax
  loc_004B73F9: call [00401074h] ; __vbaHresultCheckObj
  loc_004B73FF: mov eax, var_2C
  loc_004B7402: mov esi, eax
  loc_004B7404: mov edx, [eax]
  loc_004B7406: lea ecx, var_24
  loc_004B7409: push ecx
  loc_004B740A: push eax
  loc_004B740B: call [edx+00000050h]
  loc_004B740E: fnclex
  loc_004B7410: cmp eax, edi
  loc_004B7412: jge 004B7423h
  loc_004B7414: push 00000050h
  loc_004B7416: push 0041F3A0h
  loc_004B741B: push esi
  loc_004B741C: push eax
  loc_004B741D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B7423: cmp [0061B3B4h], edi
  loc_004B7429: jnz 004B743Bh
  loc_004B742B: push 0061B3B4h
  loc_004B7430: push 004245F0h
  loc_004B7435: call [004011DCh] ; __vbaNew2
  loc_004B743B: mov esi, [0061B3B4h]
  loc_004B7441: mov eax, 004245B4h ; ";pwd=DIGITSYS"
  loc_004B7446: mov var_6C, eax
  loc_004B7449: mov ecx, 00000008h
  loc_004B744E: mov var_74, ecx
  loc_004B7451: xor edx, edx
  loc_004B7453: mov var_5C, edx
  loc_004B7456: mov ebx, 0000000Bh
  loc_004B745B: mov var_64, ebx
  loc_004B745E: mov var_4C, edi
  loc_004B7461: mov var_54, ebx
  loc_004B7464: mov edi, [esi]
  loc_004B7466: lea ebx, var_30
  loc_004B7469: push ebx
  loc_004B746A: sub esp, 00000010h
  loc_004B746D: mov ebx, esp
  loc_004B746F: mov [ebx], ecx
  loc_004B7471: mov ecx, var_70
  loc_004B7474: mov [ebx+00000004h], ecx
  loc_004B7477: mov [ebx+00000008h], eax
  loc_004B747A: mov eax, var_68
  loc_004B747D: mov [ebx+0000000Ch], eax
  loc_004B7480: sub esp, 00000010h
  loc_004B7483: mov ecx, esp
  loc_004B7485: mov eax, var_64
  loc_004B7488: mov [ecx], eax
  loc_004B748A: mov eax, var_60
  loc_004B748D: mov [ecx+00000004h], eax
  loc_004B7490: mov [ecx+00000008h], edx
  loc_004B7493: mov edx, var_58
  loc_004B7496: mov [ecx+0000000Ch], edx
  loc_004B7499: sub esp, 00000010h
  loc_004B749C: mov eax, esp
  loc_004B749E: mov ecx, var_54
  loc_004B74A1: mov [eax], ecx
  loc_004B74A3: mov edx, var_50
  loc_004B74A6: mov [eax+00000004h], edx
  loc_004B74A9: mov ecx, var_4C
  loc_004B74AC: mov [eax+00000008h], ecx
  loc_004B74AF: mov edx, var_48
  loc_004B74B2: mov [eax+0000000Ch], edx
  loc_004B74B5: mov eax, var_24
  loc_004B74B8: push eax
  loc_004B74B9: push 00424588h ; "\Data\DataPath.mdb"
  loc_004B74BE: call [00401054h] ; __vbaStrCat
  loc_004B74C4: mov edx, eax
  loc_004B74C6: lea ecx, var_28
  loc_004B74C9: call [00401270h] ; __vbaStrMove
  loc_004B74CF: push eax
  loc_004B74D0: push esi
  loc_004B74D1: call [edi+00000058h]
  loc_004B74D4: fnclex
  loc_004B74D6: test eax, eax
  loc_004B74D8: jge 004B74E9h
  loc_004B74DA: push 00000058h
  loc_004B74DC: push 004245E0h
  loc_004B74E1: push esi
  loc_004B74E2: push eax
  loc_004B74E3: call [00401074h] ; __vbaHresultCheckObj
  loc_004B74E9: mov eax, var_30
  loc_004B74EC: mov var_30, 00000000h
  loc_004B74F3: push eax
  loc_004B74F4: push 0061A140h
  loc_004B74F9: call [004010A0h] ; __vbaObjSet
  loc_004B74FF: lea ecx, var_28
  loc_004B7502: push ecx
  loc_004B7503: lea edx, var_24
  loc_004B7506: push edx
  loc_004B7507: push 00000002h
  loc_004B7509: call [004011FCh] ; __vbaFreeStrList
  loc_004B750F: add esp, 0000000Ch
  loc_004B7512: lea ecx, var_2C
  loc_004B7515: call [004012B0h] ; __vbaFreeObj
  loc_004B751B: mov eax, 80020004h
  loc_004B7520: mov var_6C, eax
  loc_004B7523: mov ecx, 0000000Ah
  loc_004B7528: mov var_74, ecx
  loc_004B752B: mov edx, eax
  loc_004B752D: mov var_5C, edx
  loc_004B7530: mov esi, ecx
  loc_004B7532: mov var_64, esi
  loc_004B7535: mov var_4C, 00000004h
  loc_004B753C: mov var_54, 00000003h
  loc_004B7543: mov edi, [0061A140h]
  loc_004B7549: mov edi, [edi]
  loc_004B754B: lea ebx, var_2C
  loc_004B754E: push ebx
  loc_004B754F: sub esp, 00000010h
  loc_004B7552: mov ebx, esp
  loc_004B7554: mov [ebx], ecx
  loc_004B7556: mov ecx, var_70
  loc_004B7559: mov [ebx+00000004h], ecx
  loc_004B755C: mov [ebx+00000008h], eax
  loc_004B755F: mov eax, var_68
  loc_004B7562: mov [ebx+0000000Ch], eax
  loc_004B7565: sub esp, 00000010h
  loc_004B7568: mov ecx, esp
  loc_004B756A: mov [ecx], esi
  loc_004B756C: mov eax, var_60
  loc_004B756F: mov [ecx+00000004h], eax
  loc_004B7572: mov [ecx+00000008h], edx
  loc_004B7575: mov edx, var_58
  loc_004B7578: mov [ecx+0000000Ch], edx
  loc_004B757B: sub esp, 00000010h
  loc_004B757E: mov eax, esp
  loc_004B7580: mov ecx, var_54
  loc_004B7583: mov [eax], ecx
  loc_004B7585: mov edx, var_50
  loc_004B7588: mov [eax+00000004h], edx
  loc_004B758B: mov ecx, var_4C
  loc_004B758E: mov [eax+00000008h], ecx
  loc_004B7591: mov edx, var_48
  loc_004B7594: mov [eax+0000000Ch], edx
  loc_004B7597: push 004264F4h ; "Select * From DataPath"
  loc_004B759C: mov eax, [0061A140h]
  loc_004B75A1: push eax
  loc_004B75A2: call [edi+000000BCh]
  loc_004B75A8: fnclex
  loc_004B75AA: test eax, eax
  loc_004B75AC: jge 004B75CAh
  loc_004B75AE: push 000000BCh
  loc_004B75B3: push 0041E928h
  loc_004B75B8: mov ecx, [0061A140h]
  loc_004B75BE: push ecx
  loc_004B75BF: push eax
  loc_004B75C0: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_004B75C6: call __vbaHresultCheckObj
  loc_004B75C8: jmp 004B75D0h
  loc_004B75CA: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_004B75D0: mov eax, var_2C
  loc_004B75D3: mov var_2C, 00000000h
  loc_004B75DA: push eax
  loc_004B75DB: lea edx, var_20
  loc_004B75DE: push edx
  loc_004B75DF: call [004010A0h] ; __vbaObjSet
  loc_004B75E5: mov eax, var_20
  loc_004B75E8: mov ecx, [eax]
  loc_004B75EA: lea edx, var_88
  loc_004B75F0: push edx
  loc_004B75F1: push eax
  loc_004B75F2: call [ecx+00000020h]
  loc_004B75F5: fnclex
  loc_004B75F7: test eax, eax
  loc_004B75F9: jge 004B7609h
  loc_004B75FB: push 00000020h
  loc_004B75FD: push 0041E938h
  loc_004B7602: mov ecx, var_20
  loc_004B7605: push ecx
  loc_004B7606: push eax
  loc_004B7607: call __vbaHresultCheckObj
  loc_004B7609: mov eax, var_20
  loc_004B760C: mov edx, [eax]
  loc_004B760E: lea ecx, var_8C
  loc_004B7614: push ecx
  loc_004B7615: push eax
  loc_004B7616: call [edx+00000034h]
  loc_004B7619: fnclex
  loc_004B761B: test eax, eax
  loc_004B761D: jge 004B762Dh
  loc_004B761F: push 00000034h
  loc_004B7621: push 0041E938h
  loc_004B7626: mov edx, var_20
  loc_004B7629: push edx
  loc_004B762A: push eax
  loc_004B762B: call __vbaHresultCheckObj
  loc_004B762D: xor eax, eax
  loc_004B762F: cmp var_8C, ax
  loc_004B7636: setz al
  loc_004B7639: xor ecx, ecx
  loc_004B763B: cmp var_88, cx
  loc_004B7642: setz cl
  loc_004B7645: or eax, ecx
  loc_004B7647: jz 004B7972h
  loc_004B764D: mov eax, var_20
  loc_004B7650: mov edx, [eax]
  loc_004B7652: lea ecx, var_2C
  loc_004B7655: push ecx
  loc_004B7656: push eax
  loc_004B7657: call [edx+000000B4h]
  loc_004B765D: fnclex
  loc_004B765F: test eax, eax
  loc_004B7661: jge 004B7674h
  loc_004B7663: push 000000B4h
  loc_004B7668: push 0041E938h
  loc_004B766D: mov edx, var_20
  loc_004B7670: push edx
  loc_004B7671: push eax
  loc_004B7672: call __vbaHresultCheckObj
  loc_004B7674: mov eax, var_2C
  loc_004B7677: mov var_98, eax
  loc_004B767D: mov ecx, 00426528h ; "Path"
  loc_004B7682: mov var_4C, ecx
  loc_004B7685: mov edx, 00000008h
  loc_004B768A: mov var_54, edx
  loc_004B768D: mov edi, [eax]
  loc_004B768F: lea ebx, var_30
  loc_004B7692: push ebx
  loc_004B7693: sub esp, 00000010h
  loc_004B7696: mov ebx, esp
  loc_004B7698: mov [ebx], edx
  loc_004B769A: mov edx, var_50
  loc_004B769D: mov [ebx+00000004h], edx
  loc_004B76A0: mov [ebx+00000008h], ecx
  loc_004B76A3: mov ecx, var_48
  loc_004B76A6: mov [ebx+0000000Ch], ecx
  loc_004B76A9: push eax
  loc_004B76AA: call [edi+00000030h]
  loc_004B76AD: fnclex
  loc_004B76AF: test eax, eax
  loc_004B76B1: jge 004B76C4h
  loc_004B76B3: push 00000030h
  loc_004B76B5: push 0041EA14h ; "S"
  loc_004B76BA: mov edx, var_98
  loc_004B76C0: push edx
  loc_004B76C1: push eax
  loc_004B76C2: call __vbaHresultCheckObj
  loc_004B76C4: mov eax, var_30
  loc_004B76C7: mov edi, eax
  loc_004B76C9: mov ecx, [eax]
  loc_004B76CB: lea edx, var_44
  loc_004B76CE: push edx
  loc_004B76CF: push eax
  loc_004B76D0: call [ecx+00000044h]
  loc_004B76D3: fnclex
  loc_004B76D5: test eax, eax
  loc_004B76D7: jge 004B76E4h
  loc_004B76D9: push 00000044h
  loc_004B76DB: push 0041EA48h
  loc_004B76E0: push edi
  loc_004B76E1: push eax
  loc_004B76E2: call __vbaHresultCheckObj
  loc_004B76E4: mov eax, [0061B3B4h]
  loc_004B76E9: test eax, eax
  loc_004B76EB: jnz 004B76FDh
  loc_004B76ED: push 0061B3B4h
  loc_004B76F2: push 004245F0h
  loc_004B76F7: call [004011DCh] ; __vbaNew2
  loc_004B76FD: mov esi, [0061B3B4h]
  loc_004B7703: mov eax, 00426538h ; ";pwd=PHILIPS"
  loc_004B7708: mov ecx, 00000008h
  loc_004B770D: xor edx, edx
  loc_004B770F: mov var_6C, edx
  loc_004B7712: mov edi, 0000000Bh
  loc_004B7717: mov var_74, edi
  loc_004B771A: mov var_5C, edx
  loc_004B771D: mov var_64, edi
  loc_004B7720: mov edi, [esi]
  loc_004B7722: lea ebx, var_34
  loc_004B7725: push ebx
  loc_004B7726: sub esp, 00000010h
  loc_004B7729: mov ebx, esp
  loc_004B772B: mov [ebx], ecx
  loc_004B772D: mov ecx, var_80
  loc_004B7730: mov [ebx+00000004h], ecx
  loc_004B7733: mov [ebx+00000008h], eax
  loc_004B7736: mov eax, var_78
  loc_004B7739: mov [ebx+0000000Ch], eax
  loc_004B773C: sub esp, 00000010h
  loc_004B773F: mov ecx, esp
  loc_004B7741: mov eax, var_74
  loc_004B7744: mov [ecx], eax
  loc_004B7746: mov eax, var_70
  loc_004B7749: mov [ecx+00000004h], eax
  loc_004B774C: mov [ecx+00000008h], edx
  loc_004B774F: mov edx, var_68
  loc_004B7752: mov [ecx+0000000Ch], edx
  loc_004B7755: sub esp, 00000010h
  loc_004B7758: mov eax, esp
  loc_004B775A: mov ecx, var_64
  loc_004B775D: mov [eax], ecx
  loc_004B775F: mov edx, var_60
  loc_004B7762: mov [eax+00000004h], edx
  loc_004B7765: mov ecx, var_5C
  loc_004B7768: mov [eax+00000008h], ecx
  loc_004B776B: mov edx, var_58
  loc_004B776E: mov [eax+0000000Ch], edx
  loc_004B7771: lea eax, var_44
  loc_004B7774: push eax
  loc_004B7775: call [00401028h] ; __vbaStrVarMove
  loc_004B777B: mov edx, eax
  loc_004B777D: lea ecx, var_24
  loc_004B7780: call [00401270h] ; __vbaStrMove
  loc_004B7786: push eax
  loc_004B7787: push esi
  loc_004B7788: call [edi+00000058h]
  loc_004B778B: fnclex
  loc_004B778D: test eax, eax
  loc_004B778F: jge 004B77A4h
  loc_004B7791: push 00000058h
  loc_004B7793: push 004245E0h
  loc_004B7798: push esi
  loc_004B7799: push eax
  loc_004B779A: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_004B77A0: call __vbaHresultCheckObj
  loc_004B77A2: jmp 004B77AAh
  loc_004B77A4: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_004B77AA: mov eax, var_34
  loc_004B77AD: mov var_34, 00000000h
  loc_004B77B4: push eax
  loc_004B77B5: push 0061A13Ch
  loc_004B77BA: call [004010A0h] ; __vbaObjSet
  loc_004B77C0: lea ecx, var_24
  loc_004B77C3: call [004012ACh] ; __vbaFreeStr
  loc_004B77C9: lea ecx, var_30
  loc_004B77CC: push ecx
  loc_004B77CD: lea edx, var_2C
  loc_004B77D0: push edx
  loc_004B77D1: push 00000002h
  loc_004B77D3: call [00401040h] ; __vbaFreeObjList
  loc_004B77D9: add esp, 0000000Ch
  loc_004B77DC: lea ecx, var_44
  loc_004B77DF: call [00401020h] ; __vbaFreeVar
  loc_004B77E5: mov eax, var_20
  loc_004B77E8: mov ecx, [eax]
  loc_004B77EA: lea edx, var_2C
  loc_004B77ED: push edx
  loc_004B77EE: push eax
  loc_004B77EF: call [ecx+000000B4h]
  loc_004B77F5: fnclex
  loc_004B77F7: test eax, eax
  loc_004B77F9: jge 004B780Ch
  loc_004B77FB: push 000000B4h
  loc_004B7800: push 0041E938h
  loc_004B7805: mov ecx, var_20
  loc_004B7808: push ecx
  loc_004B7809: push eax
  loc_004B780A: call __vbaHresultCheckObj
  loc_004B780C: mov eax, var_2C
  loc_004B780F: mov var_98, eax
  loc_004B7815: mov ecx, 00426528h ; "Path"
  loc_004B781A: mov var_4C, ecx
  loc_004B781D: mov edx, 00000008h
  loc_004B7822: mov var_54, edx
  loc_004B7825: mov edi, [eax]
  loc_004B7827: lea ebx, var_30
  loc_004B782A: push ebx
  loc_004B782B: sub esp, 00000010h
  loc_004B782E: mov ebx, esp
  loc_004B7830: mov [ebx], edx
  loc_004B7832: mov edx, var_50
  loc_004B7835: mov [ebx+00000004h], edx
  loc_004B7838: mov [ebx+00000008h], ecx
  loc_004B783B: mov ecx, var_48
  loc_004B783E: mov [ebx+0000000Ch], ecx
  loc_004B7841: push eax
  loc_004B7842: call [edi+00000030h]
  loc_004B7845: fnclex
  loc_004B7847: test eax, eax
  loc_004B7849: jge 004B785Ch
  loc_004B784B: push 00000030h
  loc_004B784D: push 0041EA14h ; "S"
  loc_004B7852: mov edx, var_98
  loc_004B7858: push edx
  loc_004B7859: push eax
  loc_004B785A: call __vbaHresultCheckObj
  loc_004B785C: mov eax, var_30
  loc_004B785F: mov edi, eax
  loc_004B7861: mov ecx, [eax]
  loc_004B7863: lea edx, var_44
  loc_004B7866: push edx
  loc_004B7867: push eax
  loc_004B7868: call [ecx+00000044h]
  loc_004B786B: fnclex
  loc_004B786D: test eax, eax
  loc_004B786F: jge 004B787Ch
  loc_004B7871: push 00000044h
  loc_004B7873: push 0041EA48h
  loc_004B7878: push edi
  loc_004B7879: push eax
  loc_004B787A: call __vbaHresultCheckObj
  loc_004B787C: lea eax, var_44
  loc_004B787F: push eax
  loc_004B7880: call [00401028h] ; __vbaStrVarMove
  loc_004B7886: mov edx, eax
  loc_004B7888: mov ecx, 0061A150h
  loc_004B788D: call [00401270h] ; __vbaStrMove
  loc_004B7893: lea ecx, var_30
  loc_004B7896: push ecx
  loc_004B7897: lea edx, var_2C
  loc_004B789A: push edx
  loc_004B789B: push 00000002h
  loc_004B789D: call [00401040h] ; __vbaFreeObjList
  loc_004B78A3: add esp, 0000000Ch
  loc_004B78A6: lea ecx, var_44
  loc_004B78A9: call [00401020h] ; __vbaFreeVar
  loc_004B78AF: mov eax, var_20
  loc_004B78B2: mov ecx, [eax]
  loc_004B78B4: lea edx, var_2C
  loc_004B78B7: push edx
  loc_004B78B8: push eax
  loc_004B78B9: call [ecx+000000B4h]
  loc_004B78BF: fnclex
  loc_004B78C1: test eax, eax
  loc_004B78C3: jge 004B78D6h
  loc_004B78C5: push 000000B4h
  loc_004B78CA: push 0041E938h
  loc_004B78CF: mov ecx, var_20
  loc_004B78D2: push ecx
  loc_004B78D3: push eax
  loc_004B78D4: call __vbaHresultCheckObj
  loc_004B78D6: mov eax, var_2C
  loc_004B78D9: mov var_98, eax
  loc_004B78DF: mov ecx, 00426558h ; "ThisMachine"
  loc_004B78E4: mov var_4C, ecx
  loc_004B78E7: mov edx, 00000008h
  loc_004B78EC: mov var_54, edx
  loc_004B78EF: mov edi, [eax]
  loc_004B78F1: lea ebx, var_30
  loc_004B78F4: push ebx
  loc_004B78F5: sub esp, 00000010h
  loc_004B78F8: mov ebx, esp
  loc_004B78FA: mov [ebx], edx
  loc_004B78FC: mov edx, var_50
  loc_004B78FF: mov [ebx+00000004h], edx
  loc_004B7902: mov [ebx+00000008h], ecx
  loc_004B7905: mov ecx, var_48
  loc_004B7908: mov [ebx+0000000Ch], ecx
  loc_004B790B: push eax
  loc_004B790C: call [edi+00000030h]
  loc_004B790F: fnclex
  loc_004B7911: test eax, eax
  loc_004B7913: jge 004B7926h
  loc_004B7915: push 00000030h
  loc_004B7917: push 0041EA14h ; "S"
  loc_004B791C: mov edx, var_98
  loc_004B7922: push edx
  loc_004B7923: push eax
  loc_004B7924: call __vbaHresultCheckObj
  loc_004B7926: mov eax, var_30
  loc_004B7929: mov edi, eax
  loc_004B792B: mov ecx, [eax]
  loc_004B792D: lea edx, var_44
  loc_004B7930: push edx
  loc_004B7931: push eax
  loc_004B7932: call [ecx+00000044h]
  loc_004B7935: fnclex
  loc_004B7937: test eax, eax
  loc_004B7939: jge 004B7946h
  loc_004B793B: push 00000044h
  loc_004B793D: push 0041EA48h
  loc_004B7942: push edi
  loc_004B7943: push eax
  loc_004B7944: call __vbaHresultCheckObj
  loc_004B7946: lea eax, var_44
  loc_004B7949: push eax
  loc_004B794A: call [004011C0h] ; __vbaI2Var
  loc_004B7950: mov [0061A154h], ax
  loc_004B7956: lea ecx, var_30
  loc_004B7959: push ecx
  loc_004B795A: lea edx, var_2C
  loc_004B795D: push edx
  loc_004B795E: push 00000002h
  loc_004B7960: call [00401040h] ; __vbaFreeObjList
  loc_004B7966: add esp, 0000000Ch
  loc_004B7969: lea ecx, var_44
  loc_004B796C: call [00401020h] ; __vbaFreeVar
  loc_004B7972: mov eax, var_20
  loc_004B7975: mov ecx, [eax]
  loc_004B7977: push eax
  loc_004B7978: call [ecx+000000C4h]
  loc_004B797E: fnclex
  loc_004B7980: test eax, eax
  loc_004B7982: jge 004B7995h
  loc_004B7984: push 000000C4h
  loc_004B7989: push 0041E938h
  loc_004B798E: mov edx, var_20
  loc_004B7991: push edx
  loc_004B7992: push eax
  loc_004B7993: call __vbaHresultCheckObj
  loc_004B7995: push 0041E938h
  loc_004B799A: push 00000000h
  loc_004B799C: call [00401274h] ; __vbaCastObj
  loc_004B79A2: push eax
  loc_004B79A3: lea eax, var_20
  loc_004B79A6: push eax
  loc_004B79A7: call [004010A0h] ; __vbaObjSet
  loc_004B79AD: mov eax, 80020004h
  loc_004B79B2: mov var_6C, eax
  loc_004B79B5: mov ecx, 0000000Ah
  loc_004B79BA: mov var_74, ecx
  loc_004B79BD: mov edx, eax
  loc_004B79BF: mov var_5C, edx
  loc_004B79C2: mov esi, ecx
  loc_004B79C4: mov var_64, esi
  loc_004B79C7: mov var_4C, 00000004h
  loc_004B79CE: mov var_54, 00000003h
  loc_004B79D5: mov edi, [0061A140h]
  loc_004B79DB: mov edi, [edi]
  loc_004B79DD: lea ebx, var_2C
  loc_004B79E0: push ebx
  loc_004B79E1: sub esp, 00000010h
  loc_004B79E4: mov ebx, esp
  loc_004B79E6: mov [ebx], ecx
  loc_004B79E8: mov ecx, var_70
  loc_004B79EB: mov [ebx+00000004h], ecx
  loc_004B79EE: mov [ebx+00000008h], eax
  loc_004B79F1: mov eax, var_68
  loc_004B79F4: mov [ebx+0000000Ch], eax
  loc_004B79F7: sub esp, 00000010h
  loc_004B79FA: mov ecx, esp
  loc_004B79FC: mov [ecx], esi
  loc_004B79FE: mov eax, var_60
  loc_004B7A01: mov [ecx+00000004h], eax
  loc_004B7A04: mov [ecx+00000008h], edx
  loc_004B7A07: mov edx, var_58
  loc_004B7A0A: mov [ecx+0000000Ch], edx
  loc_004B7A0D: sub esp, 00000010h
  loc_004B7A10: mov eax, esp
  loc_004B7A12: mov ecx, var_54
  loc_004B7A15: mov [eax], ecx
  loc_004B7A17: mov edx, var_50
  loc_004B7A1A: mov [eax+00000004h], edx
  loc_004B7A1D: mov ecx, var_4C
  loc_004B7A20: mov [eax+00000008h], ecx
  loc_004B7A23: mov edx, var_48
  loc_004B7A26: mov [eax+0000000Ch], edx
  loc_004B7A29: push 00424654h ; "Refresh"
  loc_004B7A2E: mov eax, [0061A140h]
  loc_004B7A33: push eax
  loc_004B7A34: call [edi+000000BCh]
  loc_004B7A3A: fnclex
  loc_004B7A3C: test eax, eax
  loc_004B7A3E: jge 004B7A5Ch
  loc_004B7A40: push 000000BCh
  loc_004B7A45: push 0041E928h
  loc_004B7A4A: mov ecx, [0061A140h]
  loc_004B7A50: push ecx
  loc_004B7A51: push eax
  loc_004B7A52: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_004B7A58: call __vbaHresultCheckObj
  loc_004B7A5A: jmp 004B7A62h
  loc_004B7A5C: mov esi, [00401074h] ; __vbaHresultCheckObj
  loc_004B7A62: mov eax, var_2C
  loc_004B7A65: mov var_2C, 00000000h
  loc_004B7A6C: push eax
  loc_004B7A6D: lea edx, var_20
  loc_004B7A70: push edx
  loc_004B7A71: mov ebx, [004010A0h] ; __vbaObjSet
  loc_004B7A77: call ebx
  loc_004B7A79: mov eax, var_20
  loc_004B7A7C: mov ecx, [eax]
  loc_004B7A7E: lea edx, var_88
  loc_004B7A84: push edx
  loc_004B7A85: push eax
  loc_004B7A86: call [ecx+00000020h]
  loc_004B7A89: fnclex
  loc_004B7A8B: test eax, eax
  loc_004B7A8D: jge 004B7A9Dh
  loc_004B7A8F: push 00000020h
  loc_004B7A91: push 0041E938h
  loc_004B7A96: mov ecx, var_20
  loc_004B7A99: push ecx
  loc_004B7A9A: push eax
  loc_004B7A9B: call __vbaHresultCheckObj
  loc_004B7A9D: mov eax, var_20
  loc_004B7AA0: mov edx, [eax]
  loc_004B7AA2: lea ecx, var_8C
  loc_004B7AA8: push ecx
  loc_004B7AA9: push eax
  loc_004B7AAA: call [edx+00000034h]
  loc_004B7AAD: fnclex
  loc_004B7AAF: test eax, eax
  loc_004B7AB1: jge 004B7AC1h
  loc_004B7AB3: push 00000034h
  loc_004B7AB5: push 0041E938h
  loc_004B7ABA: mov edx, var_20
  loc_004B7ABD: push edx
  loc_004B7ABE: push eax
  loc_004B7ABF: call __vbaHresultCheckObj
  loc_004B7AC1: xor eax, eax
  loc_004B7AC3: cmp var_8C, ax
  loc_004B7ACA: setz al
  loc_004B7ACD: xor ecx, ecx
  loc_004B7ACF: cmp var_88, cx
  loc_004B7AD6: setz cl
  loc_004B7AD9: or eax, ecx
  loc_004B7ADB: jz 004B7DF3h
  loc_004B7AE1: mov eax, var_20
  loc_004B7AE4: mov edx, [eax]
  loc_004B7AE6: lea ecx, var_2C
  loc_004B7AE9: push ecx
  loc_004B7AEA: push eax
  loc_004B7AEB: call [edx+000000B4h]
  loc_004B7AF1: fnclex
  loc_004B7AF3: test eax, eax
  loc_004B7AF5: jge 004B7B08h
  loc_004B7AF7: push 000000B4h
  loc_004B7AFC: push 0041E938h
  loc_004B7B01: mov edx, var_20
  loc_004B7B04: push edx
  loc_004B7B05: push eax
  loc_004B7B06: call __vbaHresultCheckObj
  loc_004B7B08: mov eax, var_2C
  loc_004B7B0B: mov var_98, eax
  loc_004B7B11: mov ecx, 00424654h ; "Refresh"
  loc_004B7B16: mov var_4C, ecx
  loc_004B7B19: mov edx, 00000008h
  loc_004B7B1E: mov var_54, edx
  loc_004B7B21: mov edi, [eax]
  loc_004B7B23: lea ebx, var_30
  loc_004B7B26: push ebx
  loc_004B7B27: sub esp, 00000010h
  loc_004B7B2A: mov ebx, esp
  loc_004B7B2C: mov [ebx], edx
  loc_004B7B2E: mov edx, var_50
  loc_004B7B31: mov [ebx+00000004h], edx
  loc_004B7B34: mov [ebx+00000008h], ecx
  loc_004B7B37: mov ecx, var_48
  loc_004B7B3A: mov [ebx+0000000Ch], ecx
  loc_004B7B3D: push eax
  loc_004B7B3E: call [edi+00000030h]
  loc_004B7B41: fnclex
  loc_004B7B43: test eax, eax
  loc_004B7B45: jge 004B7B58h
  loc_004B7B47: push 00000030h
  loc_004B7B49: push 0041EA14h ; "S"
  loc_004B7B4E: mov edx, var_98
  loc_004B7B54: push edx
  loc_004B7B55: push eax
  loc_004B7B56: call __vbaHresultCheckObj
  loc_004B7B58: mov eax, var_30
  loc_004B7B5B: mov edi, eax
  loc_004B7B5D: mov ecx, [eax]
  loc_004B7B5F: lea edx, var_44
  loc_004B7B62: push edx
  loc_004B7B63: push eax
  loc_004B7B64: call [ecx+00000044h]
  loc_004B7B67: fnclex
  loc_004B7B69: test eax, eax
  loc_004B7B6B: jge 004B7B78h
  loc_004B7B6D: push 00000044h
  loc_004B7B6F: push 0041EA48h
  loc_004B7B74: push edi
  loc_004B7B75: push eax
  loc_004B7B76: call __vbaHresultCheckObj
  loc_004B7B78: lea eax, var_44
  loc_004B7B7B: push eax
  loc_004B7B7C: call [004010CCh] ; __vbaBoolVar
  loc_004B7B82: mov [0061A106h], ax
  loc_004B7B88: lea ecx, var_30
  loc_004B7B8B: push ecx
  loc_004B7B8C: lea edx, var_2C
  loc_004B7B8F: push edx
  loc_004B7B90: push 00000002h
  loc_004B7B92: call [00401040h] ; __vbaFreeObjList
  loc_004B7B98: add esp, 0000000Ch
  loc_004B7B9B: lea ecx, var_44
  loc_004B7B9E: call [00401020h] ; __vbaFreeVar
  loc_004B7BA4: mov eax, var_20
  loc_004B7BA7: mov ecx, [eax]
  loc_004B7BA9: lea edx, var_2C
  loc_004B7BAC: push edx
  loc_004B7BAD: push eax
  loc_004B7BAE: call [ecx+000000B4h]
  loc_004B7BB4: fnclex
  loc_004B7BB6: test eax, eax
  loc_004B7BB8: jge 004B7BCBh
  loc_004B7BBA: push 000000B4h
  loc_004B7BBF: push 0041E938h
  loc_004B7BC4: mov ecx, var_20
  loc_004B7BC7: push ecx
  loc_004B7BC8: push eax
  loc_004B7BC9: call __vbaHresultCheckObj
  loc_004B7BCB: mov eax, var_2C
  loc_004B7BCE: mov var_98, eax
  loc_004B7BD4: mov ecx, 00424668h ; "HotKey"
  loc_004B7BD9: mov var_4C, ecx
  loc_004B7BDC: mov edx, 00000008h
  loc_004B7BE1: mov var_54, edx
  loc_004B7BE4: mov edi, [eax]
  loc_004B7BE6: lea ebx, var_30
  loc_004B7BE9: push ebx
  loc_004B7BEA: sub esp, 00000010h
  loc_004B7BED: mov ebx, esp
  loc_004B7BEF: mov [ebx], edx
  loc_004B7BF1: mov edx, var_50
  loc_004B7BF4: mov [ebx+00000004h], edx
  loc_004B7BF7: mov [ebx+00000008h], ecx
  loc_004B7BFA: mov ecx, var_48
  loc_004B7BFD: mov [ebx+0000000Ch], ecx
  loc_004B7C00: push eax
  loc_004B7C01: call [edi+00000030h]
  loc_004B7C04: fnclex
  loc_004B7C06: test eax, eax
  loc_004B7C08: jge 004B7C1Bh
  loc_004B7C0A: push 00000030h
  loc_004B7C0C: push 0041EA14h ; "S"
  loc_004B7C11: mov edx, var_98
  loc_004B7C17: push edx
  loc_004B7C18: push eax
  loc_004B7C19: call __vbaHresultCheckObj
  loc_004B7C1B: mov eax, var_30
  loc_004B7C1E: mov edi, eax
  loc_004B7C20: mov ecx, [eax]
  loc_004B7C22: lea edx, var_44
  loc_004B7C25: push edx
  loc_004B7C26: push eax
  loc_004B7C27: call [ecx+00000044h]
  loc_004B7C2A: fnclex
  loc_004B7C2C: test eax, eax
  loc_004B7C2E: jge 004B7C3Bh
  loc_004B7C30: push 00000044h
  loc_004B7C32: push 0041EA48h
  loc_004B7C37: push edi
  loc_004B7C38: push eax
  loc_004B7C39: call __vbaHresultCheckObj
  loc_004B7C3B: lea eax, var_44
  loc_004B7C3E: push eax
  loc_004B7C3F: call [004010CCh] ; __vbaBoolVar
  loc_004B7C45: mov [0061A108h], ax
  loc_004B7C4B: lea ecx, var_30
  loc_004B7C4E: push ecx
  loc_004B7C4F: lea edx, var_2C
  loc_004B7C52: push edx
  loc_004B7C53: push 00000002h
  loc_004B7C55: call [00401040h] ; __vbaFreeObjList
  loc_004B7C5B: add esp, 0000000Ch
  loc_004B7C5E: lea ecx, var_44
  loc_004B7C61: call [00401020h] ; __vbaFreeVar
  loc_004B7C67: mov eax, var_20
  loc_004B7C6A: mov ecx, [eax]
  loc_004B7C6C: lea edx, var_2C
  loc_004B7C6F: push edx
  loc_004B7C70: push eax
  loc_004B7C71: call [ecx+000000B4h]
  loc_004B7C77: fnclex
  loc_004B7C79: test eax, eax
  loc_004B7C7B: jge 004B7C8Eh
  loc_004B7C7D: push 000000B4h
  loc_004B7C82: push 0041E938h
  loc_004B7C87: mov ecx, var_20
  loc_004B7C8A: push ecx
  loc_004B7C8B: push eax
  loc_004B7C8C: call __vbaHresultCheckObj
  loc_004B7C8E: mov eax, var_2C
  loc_004B7C91: mov var_98, eax
  loc_004B7C97: mov ecx, 0042467Ch ; "NotSale"
  loc_004B7C9C: mov var_4C, ecx
  loc_004B7C9F: mov edx, 00000008h
  loc_004B7CA4: mov var_54, edx
  loc_004B7CA7: mov edi, [eax]
  loc_004B7CA9: lea ebx, var_30
  loc_004B7CAC: push ebx
  loc_004B7CAD: sub esp, 00000010h
  loc_004B7CB0: mov ebx, esp
  loc_004B7CB2: mov [ebx], edx
  loc_004B7CB4: mov edx, var_50
  loc_004B7CB7: mov [ebx+00000004h], edx
  loc_004B7CBA: mov [ebx+00000008h], ecx
  loc_004B7CBD: mov ecx, var_48
  loc_004B7CC0: mov [ebx+0000000Ch], ecx
  loc_004B7CC3: push eax
  loc_004B7CC4: call [edi+00000030h]
  loc_004B7CC7: fnclex
  loc_004B7CC9: test eax, eax
  loc_004B7CCB: jge 004B7CDEh
  loc_004B7CCD: push 00000030h
  loc_004B7CCF: push 0041EA14h ; "S"
  loc_004B7CD4: mov edx, var_98
  loc_004B7CDA: push edx
  loc_004B7CDB: push eax
  loc_004B7CDC: call __vbaHresultCheckObj
  loc_004B7CDE: mov eax, var_30
  loc_004B7CE1: mov edi, eax
  loc_004B7CE3: mov ecx, [eax]
  loc_004B7CE5: lea edx, var_44
  loc_004B7CE8: push edx
  loc_004B7CE9: push eax
  loc_004B7CEA: call [ecx+00000044h]
  loc_004B7CED: fnclex
  loc_004B7CEF: test eax, eax
  loc_004B7CF1: jge 004B7CFEh
  loc_004B7CF3: push 00000044h
  loc_004B7CF5: push 0041EA48h
  loc_004B7CFA: push edi
  loc_004B7CFB: push eax
  loc_004B7CFC: call __vbaHresultCheckObj
  loc_004B7CFE: lea eax, var_44
  loc_004B7D01: push eax
  loc_004B7D02: call [004010CCh] ; __vbaBoolVar
  loc_004B7D08: mov [0061A10Ah], ax
  loc_004B7D0E: lea ecx, var_30
  loc_004B7D11: push ecx
  loc_004B7D12: lea edx, var_2C
  loc_004B7D15: push edx
  loc_004B7D16: push 00000002h
  loc_004B7D18: call [00401040h] ; __vbaFreeObjList
  loc_004B7D1E: add esp, 0000000Ch
  loc_004B7D21: lea ecx, var_44
  loc_004B7D24: call [00401020h] ; __vbaFreeVar
  loc_004B7D2A: mov eax, var_20
  loc_004B7D2D: mov ecx, [eax]
  loc_004B7D2F: lea edx, var_2C
  loc_004B7D32: push edx
  loc_004B7D33: push eax
  loc_004B7D34: call [ecx+000000B4h]
  loc_004B7D3A: fnclex
  loc_004B7D3C: test eax, eax
  loc_004B7D3E: jge 004B7D51h
  loc_004B7D40: push 000000B4h
  loc_004B7D45: push 0041E938h
  loc_004B7D4A: mov ecx, var_20
  loc_004B7D4D: push ecx
  loc_004B7D4E: push eax
  loc_004B7D4F: call __vbaHresultCheckObj
  loc_004B7D51: mov eax, var_2C
  loc_004B7D54: mov var_98, eax
  loc_004B7D5A: mov ecx, 00424690h ; "Over"
  loc_004B7D5F: mov var_4C, ecx
  loc_004B7D62: mov edx, 00000008h
  loc_004B7D67: mov var_54, edx
  loc_004B7D6A: mov edi, [eax]
  loc_004B7D6C: lea ebx, var_30
  loc_004B7D6F: push ebx
  loc_004B7D70: sub esp, 00000010h
  loc_004B7D73: mov ebx, esp
  loc_004B7D75: mov [ebx], edx
  loc_004B7D77: mov edx, var_50
  loc_004B7D7A: mov [ebx+00000004h], edx
  loc_004B7D7D: mov [ebx+00000008h], ecx
  loc_004B7D80: mov ecx, var_48
  loc_004B7D83: mov [ebx+0000000Ch], ecx
  loc_004B7D86: push eax
  loc_004B7D87: call [edi+00000030h]
  loc_004B7D8A: fnclex
  loc_004B7D8C: test eax, eax
  loc_004B7D8E: jge 004B7DA1h
  loc_004B7D90: push 00000030h
  loc_004B7D92: push 0041EA14h ; "S"
  loc_004B7D97: mov edx, var_98
  loc_004B7D9D: push edx
  loc_004B7D9E: push eax
  loc_004B7D9F: call __vbaHresultCheckObj
  loc_004B7DA1: mov eax, var_30
  loc_004B7DA4: mov edi, eax
  loc_004B7DA6: mov ecx, [eax]
  loc_004B7DA8: lea edx, var_44
  loc_004B7DAB: push edx
  loc_004B7DAC: push eax
  loc_004B7DAD: call [ecx+00000044h]
  loc_004B7DB0: fnclex
  loc_004B7DB2: test eax, eax
  loc_004B7DB4: jge 004B7DC1h
  loc_004B7DB6: push 00000044h
  loc_004B7DB8: push 0041EA48h
  loc_004B7DBD: push edi
  loc_004B7DBE: push eax
  loc_004B7DBF: call __vbaHresultCheckObj
  loc_004B7DC1: lea eax, var_44
  loc_004B7DC4: push eax
  loc_004B7DC5: call [004010CCh] ; __vbaBoolVar
  loc_004B7DCB: mov [0061A10Ch], ax
  loc_004B7DD1: lea ecx, var_30
  loc_004B7DD4: push ecx
  loc_004B7DD5: lea edx, var_2C
  loc_004B7DD8: push edx
  loc_004B7DD9: push 00000002h
  loc_004B7DDB: call [00401040h] ; __vbaFreeObjList
  loc_004B7DE1: add esp, 0000000Ch
  loc_004B7DE4: lea ecx, var_44
  loc_004B7DE7: call [00401020h] ; __vbaFreeVar
  loc_004B7DED: mov ebx, [004010A0h] ; __vbaObjSet
  loc_004B7DF3: mov eax, var_20
  loc_004B7DF6: mov ecx, [eax]
  loc_004B7DF8: push eax
  loc_004B7DF9: call [ecx+000000C4h]
  loc_004B7DFF: fnclex
  loc_004B7E01: test eax, eax
  loc_004B7E03: jge 004B7E16h
  loc_004B7E05: push 000000C4h
  loc_004B7E0A: push 0041E938h
  loc_004B7E0F: mov edx, var_20
  loc_004B7E12: push edx
  loc_004B7E13: push eax
  loc_004B7E14: call __vbaHresultCheckObj
  loc_004B7E16: push 0041E938h
  loc_004B7E1B: push 00000000h
  loc_004B7E1D: mov edi, [00401274h] ; __vbaCastObj
  loc_004B7E23: call edi
  loc_004B7E25: push eax
  loc_004B7E26: lea eax, var_20
  loc_004B7E29: push eax
  loc_004B7E2A: call ebx
  loc_004B7E2C: mov eax, [0061A140h]
  loc_004B7E31: mov ecx, [eax]
  loc_004B7E33: push eax
  loc_004B7E34: call [ecx+00000058h]
  loc_004B7E37: fnclex
  loc_004B7E39: test eax, eax
  loc_004B7E3B: jge 004B7E4Eh
  loc_004B7E3D: push 00000058h
  loc_004B7E3F: push 0041E928h
  loc_004B7E44: mov edx, [0061A140h]
  loc_004B7E4A: push edx
  loc_004B7E4B: push eax
  loc_004B7E4C: call __vbaHresultCheckObj
  loc_004B7E4E: push 0041E928h
  loc_004B7E53: push 00000000h
  loc_004B7E55: call edi
  loc_004B7E57: push eax
  loc_004B7E58: push 0061A140h
  loc_004B7E5D: call ebx
  loc_004B7E5F: call [00401094h] ; __vbaExitProc
  loc_004B7E65: push 004B8458h
  loc_004B7E6A: jmp 004B844Eh
  loc_004B7E6F: call [00401210h] ; rtcErrObj
  loc_004B7E75: push eax
  loc_004B7E76: lea eax, var_2C
  loc_004B7E79: push eax
  loc_004B7E7A: call [004010A0h] ; __vbaObjSet
  loc_004B7E80: mov esi, eax
  loc_004B7E82: mov ecx, [esi]
  loc_004B7E84: lea edx, var_90
  loc_004B7E8A: push edx
  loc_004B7E8B: push esi
  loc_004B7E8C: call [ecx+0000001Ch]
  loc_004B7E8F: fnclex
  loc_004B7E91: xor ebx, ebx
  loc_004B7E93: cmp eax, ebx
  loc_004B7E95: jge 004B7EAAh
  loc_004B7E97: push 0000001Ch
  loc_004B7E99: push 0042150Ch
  loc_004B7E9E: push esi
  loc_004B7E9F: push eax
  loc_004B7EA0: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B7EA6: call edi
  loc_004B7EA8: jmp 004B7EB0h
  loc_004B7EAA: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B7EB0: mov esi, var_90
  loc_004B7EB6: lea ecx, var_2C
  loc_004B7EB9: call [004012B0h] ; __vbaFreeObj
  loc_004B7EBF: mov eax, esi
  loc_004B7EC1: sub eax, 00000BD0h
  loc_004B7EC6: jz 004B8226h
  loc_004B7ECC: sub eax, 00000013h
  loc_004B7ECF: jz 004B8071h
  loc_004B7ED5: dec eax
  loc_004B7ED6: jnz 004B8410h
  loc_004B7EDC: cmp [0061B394h], ebx
  loc_004B7EE2: jnz 004B7EF4h
  loc_004B7EE4: push 0061B394h
  loc_004B7EE9: push 0041E4A0h
  loc_004B7EEE: call [004011DCh] ; __vbaNew2
  loc_004B7EF4: mov esi, [0061B394h]
  loc_004B7EFA: mov eax, [esi]
  loc_004B7EFC: lea ecx, var_2C
  loc_004B7EFF: push ecx
  loc_004B7F00: push esi
  loc_004B7F01: call [eax+00000014h]
  loc_004B7F04: fnclex
  loc_004B7F06: cmp eax, ebx
  loc_004B7F08: jge 004B7F15h
  loc_004B7F0A: push 00000014h
  loc_004B7F0C: push 0041E490h
  loc_004B7F11: push esi
  loc_004B7F12: push eax
  loc_004B7F13: call edi
  loc_004B7F15: mov eax, var_2C
  loc_004B7F18: mov esi, eax
  loc_004B7F1A: mov edx, [eax]
  loc_004B7F1C: lea ecx, var_24
  loc_004B7F1F: push ecx
  loc_004B7F20: push eax
  loc_004B7F21: call [edx+00000050h]
  loc_004B7F24: fnclex
  loc_004B7F26: cmp eax, ebx
  loc_004B7F28: jge 004B7F35h
  loc_004B7F2A: push 00000050h
  loc_004B7F2C: push 0041F3A0h
  loc_004B7F31: push esi
  loc_004B7F32: push eax
  loc_004B7F33: call edi
  loc_004B7F35: cmp [0061B3B4h], ebx
  loc_004B7F3B: jnz 004B7F4Dh
  loc_004B7F3D: push 0061B3B4h
  loc_004B7F42: push 004245F0h
  loc_004B7F47: call [004011DCh] ; __vbaNew2
  loc_004B7F4D: mov esi, [0061B3B4h]
  loc_004B7F53: mov eax, 00426538h ; ";pwd=PHILIPS"
  loc_004B7F58: mov var_6C, eax
  loc_004B7F5B: mov ecx, 00000008h
  loc_004B7F60: mov var_74, ecx
  loc_004B7F63: xor edx, edx
  loc_004B7F65: mov var_5C, edx
  loc_004B7F68: mov edi, 0000000Bh
  loc_004B7F6D: mov var_64, edi
  loc_004B7F70: mov var_4C, ebx
  loc_004B7F73: mov var_54, edi
  loc_004B7F76: mov ebx, [esi]
  loc_004B7F78: lea edi, var_30
  loc_004B7F7B: push edi
  loc_004B7F7C: sub esp, 00000010h
  loc_004B7F7F: mov edi, esp
  loc_004B7F81: mov [edi], ecx
  loc_004B7F83: mov ecx, var_70
  loc_004B7F86: mov [edi+00000004h], ecx
  loc_004B7F89: mov [edi+00000008h], eax
  loc_004B7F8C: mov eax, var_68
  loc_004B7F8F: mov [edi+0000000Ch], eax
  loc_004B7F92: sub esp, 00000010h
  loc_004B7F95: mov ecx, esp
  loc_004B7F97: mov eax, var_64
  loc_004B7F9A: mov [ecx], eax
  loc_004B7F9C: mov eax, var_60
  loc_004B7F9F: mov [ecx+00000004h], eax
  loc_004B7FA2: mov [ecx+00000008h], edx
  loc_004B7FA5: mov edx, var_58
  loc_004B7FA8: mov [ecx+0000000Ch], edx
  loc_004B7FAB: sub esp, 00000010h
  loc_004B7FAE: mov eax, esp
  loc_004B7FB0: mov ecx, var_54
  loc_004B7FB3: mov [eax], ecx
  loc_004B7FB5: mov edx, var_50
  loc_004B7FB8: mov [eax+00000004h], edx
  loc_004B7FBB: mov ecx, var_4C
  loc_004B7FBE: mov [eax+00000008h], ecx
  loc_004B7FC1: mov edx, var_48
  loc_004B7FC4: mov [eax+0000000Ch], edx
  loc_004B7FC7: mov eax, var_24
  loc_004B7FCA: push eax
  loc_004B7FCB: push 00426574h ; "\Data\Super.mdb"
  loc_004B7FD0: mov edi, [00401054h] ; __vbaStrCat
  loc_004B7FD6: call edi
  loc_004B7FD8: mov edx, eax
  loc_004B7FDA: lea ecx, var_28
  loc_004B7FDD: call [00401270h] ; __vbaStrMove
  loc_004B7FE3: push eax
  loc_004B7FE4: push esi
  loc_004B7FE5: call [ebx+00000058h]
  loc_004B7FE8: fnclex
  loc_004B7FEA: test eax, eax
  loc_004B7FEC: jge 004B8001h
  loc_004B7FEE: push 00000058h
  loc_004B7FF0: push 004245E0h
  loc_004B7FF5: push esi
  loc_004B7FF6: push eax
  loc_004B7FF7: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B7FFD: call ebx
  loc_004B7FFF: jmp 004B8007h
  loc_004B8001: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B8007: mov eax, var_30
  loc_004B800A: mov var_30, 00000000h
  loc_004B8011: push eax
  loc_004B8012: push 0061A13Ch
  loc_004B8017: call [004010A0h] ; __vbaObjSet
  loc_004B801D: lea ecx, var_28
  loc_004B8020: push ecx
  loc_004B8021: lea edx, var_24
  loc_004B8024: push edx
  loc_004B8025: push 00000002h
  loc_004B8027: call [004011FCh] ; __vbaFreeStrList
  loc_004B802D: add esp, 0000000Ch
  loc_004B8030: lea ecx, var_2C
  loc_004B8033: call [004012B0h] ; __vbaFreeObj
  loc_004B8039: mov eax, [0061B394h]
  loc_004B803E: test eax, eax
  loc_004B8040: jnz 004B8052h
  loc_004B8042: push 0061B394h
  loc_004B8047: push 0041E4A0h
  loc_004B804C: call [004011DCh] ; __vbaNew2
  loc_004B8052: mov esi, [0061B394h]
  loc_004B8058: mov eax, [esi]
  loc_004B805A: lea ecx, var_2C
  loc_004B805D: push ecx
  loc_004B805E: push esi
  loc_004B805F: call [eax+00000014h]
  loc_004B8062: fnclex
  loc_004B8064: test eax, eax
  loc_004B8066: jge 004B8208h
  loc_004B806C: jmp 004B81FDh
  loc_004B8071: cmp [0061B394h], ebx
  loc_004B8077: jnz 004B8089h
  loc_004B8079: push 0061B394h
  loc_004B807E: push 0041E4A0h
  loc_004B8083: call [004011DCh] ; __vbaNew2
  loc_004B8089: mov esi, [0061B394h]
  loc_004B808F: mov eax, [esi]
  loc_004B8091: lea ecx, var_2C
  loc_004B8094: push ecx
  loc_004B8095: push esi
  loc_004B8096: call [eax+00000014h]
  loc_004B8099: fnclex
  loc_004B809B: cmp eax, ebx
  loc_004B809D: jge 004B80AAh
  loc_004B809F: push 00000014h
  loc_004B80A1: push 0041E490h
  loc_004B80A6: push esi
  loc_004B80A7: push eax
  loc_004B80A8: call edi
  loc_004B80AA: mov eax, var_2C
  loc_004B80AD: mov esi, eax
  loc_004B80AF: mov edx, [eax]
  loc_004B80B1: lea ecx, var_24
  loc_004B80B4: push ecx
  loc_004B80B5: push eax
  loc_004B80B6: call [edx+00000050h]
  loc_004B80B9: fnclex
  loc_004B80BB: cmp eax, ebx
  loc_004B80BD: jge 004B80CAh
  loc_004B80BF: push 00000050h
  loc_004B80C1: push 0041F3A0h
  loc_004B80C6: push esi
  loc_004B80C7: push eax
  loc_004B80C8: call edi
  loc_004B80CA: cmp [0061B3B4h], ebx
  loc_004B80D0: jnz 004B80E2h
  loc_004B80D2: push 0061B3B4h
  loc_004B80D7: push 004245F0h
  loc_004B80DC: call [004011DCh] ; __vbaNew2
  loc_004B80E2: mov esi, [0061B3B4h]
  loc_004B80E8: mov eax, 00426538h ; ";pwd=PHILIPS"
  loc_004B80ED: mov var_6C, eax
  loc_004B80F0: mov ecx, 00000008h
  loc_004B80F5: mov var_74, ecx
  loc_004B80F8: xor edx, edx
  loc_004B80FA: mov var_5C, edx
  loc_004B80FD: mov edi, 0000000Bh
  loc_004B8102: mov var_64, edi
  loc_004B8105: mov var_4C, ebx
  loc_004B8108: mov var_54, edi
  loc_004B810B: mov ebx, [esi]
  loc_004B810D: lea edi, var_30
  loc_004B8110: push edi
  loc_004B8111: sub esp, 00000010h
  loc_004B8114: mov edi, esp
  loc_004B8116: mov [edi], ecx
  loc_004B8118: mov ecx, var_70
  loc_004B811B: mov [edi+00000004h], ecx
  loc_004B811E: mov [edi+00000008h], eax
  loc_004B8121: mov eax, var_68
  loc_004B8124: mov [edi+0000000Ch], eax
  loc_004B8127: sub esp, 00000010h
  loc_004B812A: mov ecx, esp
  loc_004B812C: mov eax, var_64
  loc_004B812F: mov [ecx], eax
  loc_004B8131: mov eax, var_60
  loc_004B8134: mov [ecx+00000004h], eax
  loc_004B8137: mov [ecx+00000008h], edx
  loc_004B813A: mov edx, var_58
  loc_004B813D: mov [ecx+0000000Ch], edx
  loc_004B8140: sub esp, 00000010h
  loc_004B8143: mov eax, esp
  loc_004B8145: mov ecx, var_54
  loc_004B8148: mov [eax], ecx
  loc_004B814A: mov edx, var_50
  loc_004B814D: mov [eax+00000004h], edx
  loc_004B8150: mov ecx, var_4C
  loc_004B8153: mov [eax+00000008h], ecx
  loc_004B8156: mov edx, var_48
  loc_004B8159: mov [eax+0000000Ch], edx
  loc_004B815C: mov eax, var_24
  loc_004B815F: push eax
  loc_004B8160: push 00426574h ; "\Data\Super.mdb"
  loc_004B8165: mov edi, [00401054h] ; __vbaStrCat
  loc_004B816B: call edi
  loc_004B816D: mov edx, eax
  loc_004B816F: lea ecx, var_28
  loc_004B8172: call [00401270h] ; __vbaStrMove
  loc_004B8178: push eax
  loc_004B8179: push esi
  loc_004B817A: call [ebx+00000058h]
  loc_004B817D: fnclex
  loc_004B817F: test eax, eax
  loc_004B8181: jge 004B8196h
  loc_004B8183: push 00000058h
  loc_004B8185: push 004245E0h
  loc_004B818A: push esi
  loc_004B818B: push eax
  loc_004B818C: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B8192: call ebx
  loc_004B8194: jmp 004B819Ch
  loc_004B8196: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B819C: mov eax, var_30
  loc_004B819F: mov var_30, 00000000h
  loc_004B81A6: push eax
  loc_004B81A7: push 0061A13Ch
  loc_004B81AC: call [004010A0h] ; __vbaObjSet
  loc_004B81B2: lea ecx, var_28
  loc_004B81B5: push ecx
  loc_004B81B6: lea edx, var_24
  loc_004B81B9: push edx
  loc_004B81BA: push 00000002h
  loc_004B81BC: call [004011FCh] ; __vbaFreeStrList
  loc_004B81C2: add esp, 0000000Ch
  loc_004B81C5: lea ecx, var_2C
  loc_004B81C8: call [004012B0h] ; __vbaFreeObj
  loc_004B81CE: mov eax, [0061B394h]
  loc_004B81D3: test eax, eax
  loc_004B81D5: jnz 004B81E7h
  loc_004B81D7: push 0061B394h
  loc_004B81DC: push 0041E4A0h
  loc_004B81E1: call [004011DCh] ; __vbaNew2
  loc_004B81E7: mov esi, [0061B394h]
  loc_004B81ED: mov eax, [esi]
  loc_004B81EF: lea ecx, var_2C
  loc_004B81F2: push ecx
  loc_004B81F3: push esi
  loc_004B81F4: call [eax+00000014h]
  loc_004B81F7: fnclex
  loc_004B81F9: test eax, eax
  loc_004B81FB: jge 004B8208h
  loc_004B81FD: push 00000014h
  loc_004B81FF: push 0041E490h
  loc_004B8204: push esi
  loc_004B8205: push eax
  loc_004B8206: call ebx
  loc_004B8208: mov eax, var_2C
  loc_004B820B: mov esi, eax
  loc_004B820D: mov edx, [eax]
  loc_004B820F: lea ecx, var_24
  loc_004B8212: push ecx
  loc_004B8213: push eax
  loc_004B8214: call [edx+00000050h]
  loc_004B8217: fnclex
  loc_004B8219: test eax, eax
  loc_004B821B: jge 004B83DDh
  loc_004B8221: jmp 004B83D2h
  loc_004B8226: cmp [0061B394h], ebx
  loc_004B822C: jnz 004B823Eh
  loc_004B822E: push 0061B394h
  loc_004B8233: push 0041E4A0h
  loc_004B8238: call [004011DCh] ; __vbaNew2
  loc_004B823E: mov esi, [0061B394h]
  loc_004B8244: mov eax, [esi]
  loc_004B8246: lea ecx, var_2C
  loc_004B8249: push ecx
  loc_004B824A: push esi
  loc_004B824B: call [eax+00000014h]
  loc_004B824E: fnclex
  loc_004B8250: cmp eax, ebx
  loc_004B8252: jge 004B825Fh
  loc_004B8254: push 00000014h
  loc_004B8256: push 0041E490h
  loc_004B825B: push esi
  loc_004B825C: push eax
  loc_004B825D: call edi
  loc_004B825F: mov eax, var_2C
  loc_004B8262: mov esi, eax
  loc_004B8264: mov edx, [eax]
  loc_004B8266: lea ecx, var_24
  loc_004B8269: push ecx
  loc_004B826A: push eax
  loc_004B826B: call [edx+00000050h]
  loc_004B826E: fnclex
  loc_004B8270: cmp eax, ebx
  loc_004B8272: jge 004B827Fh
  loc_004B8274: push 00000050h
  loc_004B8276: push 0041F3A0h
  loc_004B827B: push esi
  loc_004B827C: push eax
  loc_004B827D: call edi
  loc_004B827F: cmp [0061B3B4h], ebx
  loc_004B8285: jnz 004B8297h
  loc_004B8287: push 0061B3B4h
  loc_004B828C: push 004245F0h
  loc_004B8291: call [004011DCh] ; __vbaNew2
  loc_004B8297: mov esi, [0061B3B4h]
  loc_004B829D: mov eax, 00426538h ; ";pwd=PHILIPS"
  loc_004B82A2: mov var_6C, eax
  loc_004B82A5: mov ecx, 00000008h
  loc_004B82AA: mov var_74, ecx
  loc_004B82AD: xor edx, edx
  loc_004B82AF: mov var_5C, edx
  loc_004B82B2: mov edi, 0000000Bh
  loc_004B82B7: mov var_64, edi
  loc_004B82BA: mov var_4C, ebx
  loc_004B82BD: mov var_54, edi
  loc_004B82C0: mov ebx, [esi]
  loc_004B82C2: lea edi, var_30
  loc_004B82C5: push edi
  loc_004B82C6: sub esp, 00000010h
  loc_004B82C9: mov edi, esp
  loc_004B82CB: mov [edi], ecx
  loc_004B82CD: mov ecx, var_70
  loc_004B82D0: mov [edi+00000004h], ecx
  loc_004B82D3: mov [edi+00000008h], eax
  loc_004B82D6: mov eax, var_68
  loc_004B82D9: mov [edi+0000000Ch], eax
  loc_004B82DC: sub esp, 00000010h
  loc_004B82DF: mov ecx, esp
  loc_004B82E1: mov eax, var_64
  loc_004B82E4: mov [ecx], eax
  loc_004B82E6: mov eax, var_60
  loc_004B82E9: mov [ecx+00000004h], eax
  loc_004B82EC: mov [ecx+00000008h], edx
  loc_004B82EF: mov edx, var_58
  loc_004B82F2: mov [ecx+0000000Ch], edx
  loc_004B82F5: sub esp, 00000010h
  loc_004B82F8: mov eax, esp
  loc_004B82FA: mov ecx, var_54
  loc_004B82FD: mov [eax], ecx
  loc_004B82FF: mov edx, var_50
  loc_004B8302: mov [eax+00000004h], edx
  loc_004B8305: mov ecx, var_4C
  loc_004B8308: mov [eax+00000008h], ecx
  loc_004B830B: mov edx, var_48
  loc_004B830E: mov [eax+0000000Ch], edx
  loc_004B8311: mov eax, var_24
  loc_004B8314: push eax
  loc_004B8315: push 00426574h ; "\Data\Super.mdb"
  loc_004B831A: mov edi, [00401054h] ; __vbaStrCat
  loc_004B8320: call edi
  loc_004B8322: mov edx, eax
  loc_004B8324: lea ecx, var_28
  loc_004B8327: call [00401270h] ; __vbaStrMove
  loc_004B832D: push eax
  loc_004B832E: push esi
  loc_004B832F: call [ebx+00000058h]
  loc_004B8332: fnclex
  loc_004B8334: test eax, eax
  loc_004B8336: jge 004B834Bh
  loc_004B8338: push 00000058h
  loc_004B833A: push 004245E0h
  loc_004B833F: push esi
  loc_004B8340: push eax
  loc_004B8341: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B8347: call ebx
  loc_004B8349: jmp 004B8351h
  loc_004B834B: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_004B8351: mov eax, var_30
  loc_004B8354: mov var_30, 00000000h
  loc_004B835B: push eax
  loc_004B835C: push 0061A13Ch
  loc_004B8361: call [004010A0h] ; __vbaObjSet
  loc_004B8367: lea ecx, var_28
  loc_004B836A: push ecx
  loc_004B836B: lea edx, var_24
  loc_004B836E: push edx
  loc_004B836F: push 00000002h
  loc_004B8371: call [004011FCh] ; __vbaFreeStrList
  loc_004B8377: add esp, 0000000Ch
  loc_004B837A: lea ecx, var_2C
  loc_004B837D: call [004012B0h] ; __vbaFreeObj
  loc_004B8383: mov eax, [0061B394h]
  loc_004B8388: test eax, eax
  loc_004B838A: jnz 004B839Ch
  loc_004B838C: push 0061B394h
  loc_004B8391: push 0041E4A0h
  loc_004B8396: call [004011DCh] ; __vbaNew2
  loc_004B839C: mov esi, [0061B394h]
  loc_004B83A2: mov eax, [esi]
  loc_004B83A4: lea ecx, var_2C
  loc_004B83A7: push ecx
  loc_004B83A8: push esi
  loc_004B83A9: call [eax+00000014h]
  loc_004B83AC: fnclex
  loc_004B83AE: test eax, eax
  loc_004B83B0: jge 004B83BDh
  loc_004B83B2: push 00000014h
  loc_004B83B4: push 0041E490h
  loc_004B83B9: push esi
  loc_004B83BA: push eax
  loc_004B83BB: call ebx
  loc_004B83BD: mov eax, var_2C
  loc_004B83C0: mov esi, eax
  loc_004B83C2: mov edx, [eax]
  loc_004B83C4: lea ecx, var_24
  loc_004B83C7: push ecx
  loc_004B83C8: push eax
  loc_004B83C9: call [edx+00000050h]
  loc_004B83CC: fnclex
  loc_004B83CE: test eax, eax
  loc_004B83D0: jge 004B83DDh
  loc_004B83D2: push 00000050h
  loc_004B83D4: push 0041F3A0h
  loc_004B83D9: push esi
  loc_004B83DA: push eax
  loc_004B83DB: call ebx
  loc_004B83DD: mov edx, var_24
  loc_004B83E0: push edx
  loc_004B83E1: push 00426574h ; "\Data\Super.mdb"
  loc_004B83E6: call edi
  loc_004B83E8: mov edx, eax
  loc_004B83EA: mov ecx, 0061A150h
  loc_004B83EF: call [00401270h] ; __vbaStrMove
  loc_004B83F5: lea ecx, var_24
  loc_004B83F8: call [004012ACh] ; __vbaFreeStr
  loc_004B83FE: lea ecx, var_2C
  loc_004B8401: call [004012B0h] ; __vbaFreeObj
  loc_004B8407: mov [0061A154h], 0001h
  loc_004B8410: call [00401094h] ; __vbaExitProc
  loc_004B8416: push 004B8458h
  loc_004B841B: jmp 004B844Eh
  loc_004B841D: lea eax, var_28
  loc_004B8420: push eax
  loc_004B8421: lea ecx, var_24
  loc_004B8424: push ecx
  loc_004B8425: push 00000002h
  loc_004B8427: call [004011FCh] ; __vbaFreeStrList
  loc_004B842D: lea edx, var_34
  loc_004B8430: push edx
  loc_004B8431: lea eax, var_30
  loc_004B8434: push eax
  loc_004B8435: lea ecx, var_2C
  loc_004B8438: push ecx
  loc_004B8439: push 00000003h
  loc_004B843B: call [00401040h] ; __vbaFreeObjList
  loc_004B8441: add esp, 0000001Ch
  loc_004B8444: lea ecx, var_44
  loc_004B8447: call [00401020h] ; __vbaFreeVar
  loc_004B844D: ret
  loc_004B844E: lea ecx, var_20
  loc_004B8451: call [004012B0h] ; __vbaFreeObj
  loc_004B8457: ret
  loc_004B8458: mov ecx, var_1C
  loc_004B845B: mov fs:[00000000h], ecx
  loc_004B8462: pop edi
  loc_004B8463: pop esi
  loc_004B8464: pop ebx
  loc_004B8465: mov esp, ebp
  loc_004B8467: pop ebp
  loc_004B8468: ret
  loc_004B8469: nop
End Sub

Private Sub Proc_9_5_4B8470() '4B8470
  loc_004B8470: push ebp
  loc_004B8471: mov ebp, esp
  loc_004B8473: sub esp, 00000008h
  loc_004B8476: push 00403B36h ; __vbaExceptHandler
  loc_004B847B: mov eax, fs:[00000000h]
  loc_004B8481: push eax
  loc_004B8482: mov fs:[00000000h], esp
  loc_004B8489: sub esp, 00000070h
  loc_004B848C: push ebx
  loc_004B848D: push esi
  loc_004B848E: push edi
  loc_004B848F: mov var_8, esp
  loc_004B8492: mov var_4, 00401DF0h
  loc_004B8499: lea ebx, var_18
  loc_004B849C: mov ecx, 0000000Ah
  loc_004B84A1: push ebx
  loc_004B84A2: mov var_4C, ecx
  loc_004B84A5: sub esp, 00000010h
  loc_004B84A8: mov eax, 80020004h
  loc_004B84AD: mov ebx, esp
  loc_004B84AF: mov edx, eax
  loc_004B84B1: sub esp, 00000010h
  loc_004B84B4: mov edi, [0061A13Ch]
  loc_004B84BA: mov [ebx], ecx
  loc_004B84BC: mov ecx, var_58
  loc_004B84BF: xor esi, esi
  loc_004B84C1: mov [ebx+00000004h], ecx
  loc_004B84C4: mov ecx, esp
  loc_004B84C6: sub esp, 00000010h
  loc_004B84C9: mov var_14, esi
  loc_004B84CC: mov [ebx+00000008h], eax
  loc_004B84CF: mov eax, var_50
  loc_004B84D2: mov var_18, esi
  loc_004B84D5: mov var_1C, esi
  loc_004B84D8: mov [ebx+0000000Ch], eax
  loc_004B84DB: mov eax, var_4C
  loc_004B84DE: mov [ecx], eax
  loc_004B84E0: mov eax, var_48
  loc_004B84E3: mov var_2C, esi
  loc_004B84E6: mov var_60, esi
  loc_004B84E9: mov [ecx+00000004h], eax
  loc_004B84EC: mov eax, 00000003h
  loc_004B84F1: mov var_64, esi
  loc_004B84F4: mov edi, [edi]
  loc_004B84F6: mov [ecx+00000008h], edx
  loc_004B84F9: mov edx, var_40
  loc_004B84FC: mov [ecx+0000000Ch], edx
  loc_004B84FF: mov edx, var_38
  loc_004B8502: mov ecx, esp
  loc_004B8504: push 00426598h ; "select * From Limit"
  loc_004B8509: mov [ecx], eax
  loc_004B850B: mov eax, 00000004h
  loc_004B8510: mov [ecx+00000004h], edx
  loc_004B8513: mov [ecx+00000008h], eax
  loc_004B8516: mov eax, var_30
  loc_004B8519: mov [ecx+0000000Ch], eax
  loc_004B851C: mov ecx, [0061A13Ch]
  loc_004B8522: push ecx
  loc_004B8523: call [edi+000000BCh]
  loc_004B8529: cmp eax, esi
  loc_004B852B: fnclex
  loc_004B852D: jge 004B854Bh
  loc_004B852F: mov edx, [0061A13Ch]
  loc_004B8535: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B853B: push 000000BCh
  loc_004B8540: push 0041E928h
  loc_004B8545: push edx
  loc_004B8546: push eax
  loc_004B8547: call edi
  loc_004B8549: jmp 004B8551h
  loc_004B854B: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B8551: mov eax, var_18
  loc_004B8554: mov var_18, esi
  loc_004B8557: push eax
  loc_004B8558: lea eax, var_14
  loc_004B855B: push eax
  loc_004B855C: call [004010A0h] ; __vbaObjSet
  loc_004B8562: mov eax, var_14
  loc_004B8565: lea edx, var_60
  loc_004B8568: push edx
  loc_004B8569: push eax
  loc_004B856A: mov ecx, [eax]
  loc_004B856C: call [ecx+00000020h]
  loc_004B856F: cmp eax, esi
  loc_004B8571: fnclex
  loc_004B8573: jge 004B8583h
  loc_004B8575: mov ecx, var_14
  loc_004B8578: push 00000020h
  loc_004B857A: push 0041E938h
  loc_004B857F: push ecx
  loc_004B8580: push eax
  loc_004B8581: call edi
  loc_004B8583: mov eax, var_14
  loc_004B8586: lea ecx, var_64
  loc_004B8589: push ecx
  loc_004B858A: push eax
  loc_004B858B: mov edx, [eax]
  loc_004B858D: call [edx+00000034h]
  loc_004B8590: cmp eax, esi
  loc_004B8592: fnclex
  loc_004B8594: jge 004B85A4h
  loc_004B8596: mov edx, var_14
  loc_004B8599: push 00000034h
  loc_004B859B: push 0041E938h
  loc_004B85A0: push edx
  loc_004B85A1: push eax
  loc_004B85A2: call edi
  loc_004B85A4: xor eax, eax
  loc_004B85A6: cmp var_64, si
  loc_004B85AA: setz al
  loc_004B85AD: xor ecx, ecx
  loc_004B85AF: cmp var_60, si
  loc_004B85B3: setz cl
  loc_004B85B6: or eax, ecx
  loc_004B85B8: jz 004B8684h
  loc_004B85BE: mov eax, var_14
  loc_004B85C1: lea ecx, var_18
  loc_004B85C4: push ecx
  loc_004B85C5: push eax
  loc_004B85C6: mov edx, [eax]
  loc_004B85C8: call [edx+000000B4h]
  loc_004B85CE: cmp eax, esi
  loc_004B85D0: fnclex
  loc_004B85D2: jge 004B85E5h
  loc_004B85D4: mov edx, var_14
  loc_004B85D7: push 000000B4h
  loc_004B85DC: push 0041E938h
  loc_004B85E1: push edx
  loc_004B85E2: push eax
  loc_004B85E3: call edi
  loc_004B85E5: lea ebx, var_1C
  loc_004B85E8: mov eax, var_18
  loc_004B85EB: push ebx
  loc_004B85EC: mov edx, 00000008h
  loc_004B85F1: sub esp, 00000010h
  loc_004B85F4: mov edi, [eax]
  loc_004B85F6: mov ebx, esp
  loc_004B85F8: mov ecx, 004265C4h ; "Limit"
  loc_004B85FD: push eax
  loc_004B85FE: mov var_6C, eax
  loc_004B8601: mov [ebx], edx
  loc_004B8603: mov edx, var_38
  loc_004B8606: mov [ebx+00000004h], edx
  loc_004B8609: mov [ebx+00000008h], ecx
  loc_004B860C: mov ecx, var_30
  loc_004B860F: mov [ebx+0000000Ch], ecx
  loc_004B8612: call [edi+00000030h]
  loc_004B8615: cmp eax, esi
  loc_004B8617: fnclex
  loc_004B8619: jge 004B8631h
  loc_004B861B: mov edx, var_6C
  loc_004B861E: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B8624: push 00000030h
  loc_004B8626: push 0041EA14h ; "S"
  loc_004B862B: push edx
  loc_004B862C: push eax
  loc_004B862D: call edi
  loc_004B862F: jmp 004B8637h
  loc_004B8631: mov edi, [00401074h] ; __vbaHresultCheckObj
  loc_004B8637: mov eax, var_1C
  loc_004B863A: lea edx, var_2C
  loc_004B863D: push edx
  loc_004B863E: push eax
  loc_004B863F: mov ecx, [eax]
  loc_004B8641: mov ebx, eax
  loc_004B8643: call [ecx+00000044h]
  loc_004B8646: cmp eax, esi
  loc_004B8648: fnclex
  loc_004B864A: jge 004B8657h
  loc_004B864C: push 00000044h
  loc_004B864E: push 0041EA48h
  loc_004B8653: push ebx
  loc_004B8654: push eax
  loc_004B8655: call edi
  loc_004B8657: lea eax, var_2C
  loc_004B865A: push eax
  loc_004B865B: call [0040121Ch] ; __vbaI4Var
  loc_004B8661: lea ecx, var_1C
  loc_004B8664: lea edx, var_18
  loc_004B8667: push ecx
  loc_004B8668: push edx
  loc_004B8669: push 00000002h
  loc_004B866B: mov [0061A0BCh], eax
  loc_004B8670: call [00401040h] ; __vbaFreeObjList
  loc_004B8676: add esp, 0000000Ch
  loc_004B8679: lea ecx, var_2C
  loc_004B867C: call [00401020h] ; __vbaFreeVar
  loc_004B8682: jmp 004B868Ah
  loc_004B8684: mov [0061A0BCh], esi
  loc_004B868A: mov eax, var_14
  loc_004B868D: push eax
  loc_004B868E: mov ecx, [eax]
  loc_004B8690: call [ecx+000000C4h]
  loc_004B8696: cmp eax, esi
  loc_004B8698: fnclex
  loc_004B869A: jge 004B86ADh
  loc_004B869C: mov edx, var_14
  loc_004B869F: push 000000C4h
  loc_004B86A4: push 0041E938h
  loc_004B86A9: push edx
  loc_004B86AA: push eax
  loc_004B86AB: call edi
  loc_004B86AD: push 0041E938h
  loc_004B86B2: push esi
  loc_004B86B3: call [00401274h] ; __vbaCastObj
  loc_004B86B9: push eax
  loc_004B86BA: lea eax, var_14
  loc_004B86BD: push eax
  loc_004B86BE: call [004010A0h] ; __vbaObjSet
  loc_004B86C4: push 004B86F2h
  loc_004B86C9: jmp 004B86E8h
  loc_004B86CB: lea ecx, var_1C
  loc_004B86CE: lea edx, var_18
  loc_004B86D1: push ecx
  loc_004B86D2: push edx
  loc_004B86D3: push 00000002h
  loc_004B86D5: call [00401040h] ; __vbaFreeObjList
  loc_004B86DB: add esp, 0000000Ch
  loc_004B86DE: lea ecx, var_2C
  loc_004B86E1: call [00401020h] ; __vbaFreeVar
  loc_004B86E7: ret
  loc_004B86E8: lea ecx, var_14
  loc_004B86EB: call [004012B0h] ; __vbaFreeObj
  loc_004B86F1: ret
  loc_004B86F2: mov ecx, var_10
  loc_004B86F5: pop edi
  loc_004B86F6: pop esi
  loc_004B86F7: mov fs:[00000000h], ecx
  loc_004B86FE: pop ebx
  loc_004B86FF: mov esp, ebp
  loc_004B8701: pop ebp
  loc_004B8702: ret
  loc_004B8703: nop
End Sub
