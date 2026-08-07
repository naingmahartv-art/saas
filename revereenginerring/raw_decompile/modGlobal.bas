
Private Sub Proc_8_0_4B3120() '4B3120
  loc_004B3120: push ebp
  loc_004B3121: mov ebp, esp
  loc_004B3123: sub esp, 00000014h
  loc_004B3126: push 00403B36h ; __vbaExceptHandler
  loc_004B312B: mov eax, fs:[00000000h]
  loc_004B3131: push eax
  loc_004B3132: mov fs:[00000000h], esp
  loc_004B3139: sub esp, 000000ECh
  loc_004B313F: push ebx
  loc_004B3140: push esi
  loc_004B3141: push edi
  loc_004B3142: mov var_14, esp
  loc_004B3145: mov var_10, 00401CB0h
  loc_004B314C: xor eax, eax
  loc_004B314E: mov var_C, eax
  loc_004B3151: mov var_8, eax
  loc_004B3154: mov var_20, eax
  loc_004B3157: mov var_24, eax
  loc_004B315A: mov var_28, eax
  loc_004B315D: mov var_2C, eax
  loc_004B3160: mov var_30, eax
  loc_004B3163: mov var_40, eax
  loc_004B3166: mov var_50, eax
  loc_004B3169: mov var_60, eax
  loc_004B316C: mov var_70, eax
  loc_004B316F: mov var_80, eax
  loc_004B3172: mov var_90, eax
  loc_004B3178: mov var_A0, eax
  loc_004B317E: mov var_B0, eax
  loc_004B3184: mov var_C0, eax
  loc_004B318A: mov var_D0, eax
  loc_004B3190: push 00000001h
  loc_004B3192: call [004010A8h] ; __vbaOnError
  loc_004B3198: push 0000000Dh
  loc_004B319A: lea eax, var_40
  loc_004B319D: push eax
  loc_004B319E: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B31A4: mov ecx, 80020004h
  loc_004B31A9: mov var_88, ecx
  loc_004B31AF: mov eax, 0000000Ah
  loc_004B31B4: mov var_90, eax
  loc_004B31BA: mov var_78, ecx
  loc_004B31BD: mov var_80, eax
  loc_004B31C0: mov var_B8, 0041F5E0h ; "SOFT"
  loc_004B31CA: mov ebx, 00000008h
  loc_004B31CF: mov var_C0, ebx
  loc_004B31D5: lea edx, var_C0
  loc_004B31DB: lea ecx, var_70
  loc_004B31DE: call [00401240h] ; __vbaVarDup
  loc_004B31E4: mov var_98, 00424B58h ; "Import process will take a few minutes."
  loc_004B31EE: mov var_A0, ebx
  loc_004B31F4: mov var_A8, 00424BACh ; "Are you sure to Import Data From A: ?"
  loc_004B31FE: mov var_B0, ebx
  loc_004B3204: lea ecx, var_90
  loc_004B320A: push ecx
  loc_004B320B: lea edx, var_80
  loc_004B320E: push edx
  loc_004B320F: lea eax, var_70
  loc_004B3212: push eax
  loc_004B3213: push 00000144h
  loc_004B3218: lea ecx, var_A0
  loc_004B321E: push ecx
  loc_004B321F: lea edx, var_40
  loc_004B3222: push edx
  loc_004B3223: lea eax, var_50
  loc_004B3226: push eax
  loc_004B3227: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B322D: call __vbaVarCat
  loc_004B322F: push eax
  loc_004B3230: lea ecx, var_B0
  loc_004B3236: push ecx
  loc_004B3237: lea edx, var_60
  loc_004B323A: push edx
  loc_004B323B: call __vbaVarCat
  loc_004B323D: push eax
  loc_004B323E: call [004010A4h] ; rtcMsgBox
  loc_004B3244: xor ecx, ecx
  loc_004B3246: cmp eax, 00000006h
  loc_004B3249: setz cl
  loc_004B324C: neg ecx
  loc_004B324E: mov di, cx
  loc_004B3251: lea edx, var_90
  loc_004B3257: push edx
  loc_004B3258: lea eax, var_80
  loc_004B325B: push eax
  loc_004B325C: lea ecx, var_70
  loc_004B325F: push ecx
  loc_004B3260: lea edx, var_60
  loc_004B3263: push edx
  loc_004B3264: lea eax, var_50
  loc_004B3267: push eax
  loc_004B3268: lea ecx, var_40
  loc_004B326B: push ecx
  loc_004B326C: push 00000006h
  loc_004B326E: call [00401038h] ; __vbaFreeVarList
  loc_004B3274: add esp, 0000001Ch
  loc_004B3277: test di, di
  loc_004B327A: jz 004B370Ch
  loc_004B3280: mov edx, 00424BFCh ; "c:\Soft\Lottery\Data\"
  loc_004B3285: lea ecx, var_20
  loc_004B3288: call [004011ECh] ; __vbaStrCopy
  loc_004B328E: mov edx, var_20
  loc_004B3291: push edx
  loc_004B3292: push 00424C2Ch ; "TmpXDB2.rar"
  loc_004B3297: call [00401054h] ; __vbaStrCat
  loc_004B329D: mov var_38, eax
  loc_004B32A0: mov var_40, ebx
  loc_004B32A3: push 00000000h
  loc_004B32A5: lea eax, var_40
  loc_004B32A8: push eax
  loc_004B32A9: call [004011C8h] ; rtcDir
  loc_004B32AF: mov edx, eax
  loc_004B32B1: lea ecx, var_2C
  loc_004B32B4: call [00401270h] ; __vbaStrMove
  loc_004B32BA: push eax
  loc_004B32BB: push 0041E5D4h
  loc_004B32C0: call [0040110Ch] ; __vbaStrCmp
  loc_004B32C6: mov edi, eax
  loc_004B32C8: neg edi
  loc_004B32CA: sbb edi, edi
  loc_004B32CC: neg edi
  loc_004B32CE: neg edi
  loc_004B32D0: lea ecx, var_2C
  loc_004B32D3: call [004012ACh] ; __vbaFreeStr
  loc_004B32D9: lea ecx, var_40
  loc_004B32DC: call [00401020h] ; __vbaFreeVar
  loc_004B32E2: test di, di
  loc_004B32E5: jz 004B330Fh
  loc_004B32E7: mov ecx, var_20
  loc_004B32EA: push ecx
  loc_004B32EB: push 00424C2Ch ; "TmpXDB2.rar"
  loc_004B32F0: call [00401054h] ; __vbaStrCat
  loc_004B32F6: mov var_38, eax
  loc_004B32F9: mov var_40, ebx
  loc_004B32FC: lea edx, var_40
  loc_004B32FF: push edx
  loc_004B3300: call [00401108h] ; rtcKillFiles
  loc_004B3306: lea ecx, var_40
  loc_004B3309: call [00401020h] ; __vbaFreeVar
  loc_004B330F: mov eax, var_20
  loc_004B3312: push eax
  loc_004B3313: push 00424C2Ch ; "TmpXDB2.rar"
  loc_004B3318: call [00401054h] ; __vbaStrCat
  loc_004B331E: mov edx, eax
  loc_004B3320: lea ecx, var_2C
  loc_004B3323: call [00401270h] ; __vbaStrMove
  loc_004B3329: push eax
  loc_004B332A: push 00424C48h ; "A:\TmpXDB2.Rar"
  loc_004B332F: call [00401200h] ; rtcFileCopy
  loc_004B3335: lea ecx, var_2C
  loc_004B3338: call [004012ACh] ; __vbaFreeStr
  loc_004B333E: mov var_98, 00424C78h ; "c:\Soft\Lottery\Rar.exe e c:\Soft\Lottery\Data\TmpXDB2.rar"
  loc_004B3348: mov var_A0, ebx
  loc_004B334E: lea edx, var_A0
  loc_004B3354: lea ecx, var_40
  loc_004B3357: call [00401240h] ; __vbaVarDup
  loc_004B335D: push 00000002h
  loc_004B335F: lea ecx, var_40
  loc_004B3362: push ecx
  loc_004B3363: call [00401150h] ; rtcShell
  loc_004B3369: fstp st0
  loc_004B336B: lea ecx, var_40
  loc_004B336E: call [00401020h] ; __vbaFreeVar
  loc_004B3374: mov edi, 80020004h
  loc_004B3379: mov var_A8, 00424CF4h ; "DELETE * FROM LG WHERE (SrNo Between 2000 And 2999) And OnCount='"
  loc_004B3383: mov var_B0, ebx
  loc_004B3389: mov var_98, 0061A05Ch
  loc_004B3393: mov var_A0, 00004008h
  loc_004B339D: lea edx, var_A0
  loc_004B33A3: push edx
  loc_004B33A4: lea eax, var_40
  loc_004B33A7: push eax
  loc_004B33A8: call [004010D4h] ; rtcTrimVar
  loc_004B33AE: mov var_B8, 0041E890h ; "'"
  loc_004B33B8: mov var_C0, ebx
  loc_004B33BE: mov ecx, [0061A13Ch]
  loc_004B33C4: mov edx, [ecx]
  loc_004B33C6: sub esp, 00000010h
  loc_004B33C9: mov ecx, esp
  loc_004B33CB: mov eax, 0000000Ah
  loc_004B33D0: mov [ecx], eax
  loc_004B33D2: mov eax, var_CC
  loc_004B33D8: mov [ecx+00000004h], eax
  loc_004B33DB: mov [ecx+00000008h], edi
  loc_004B33DE: mov eax, var_C4
  loc_004B33E4: mov [ecx+0000000Ch], eax
  loc_004B33E7: lea ecx, var_B0
  loc_004B33ED: push ecx
  loc_004B33EE: lea eax, var_40
  loc_004B33F1: push eax
  loc_004B33F2: lea ecx, var_50
  loc_004B33F5: push ecx
  loc_004B33F6: mov var_104, edx
  loc_004B33FC: call __vbaVarCat
  loc_004B33FE: push eax
  loc_004B33FF: lea edx, var_C0
  loc_004B3405: push edx
  loc_004B3406: lea eax, var_60
  loc_004B3409: push eax
  loc_004B340A: call __vbaVarCat
  loc_004B340C: push eax
  loc_004B340D: lea ecx, var_2C
  loc_004B3410: push ecx
  loc_004B3411: call [004011B0h] ; __vbaStrVarVal
  loc_004B3417: push eax
  loc_004B3418: mov edx, [0061A13Ch]
  loc_004B341E: push edx
  loc_004B341F: mov eax, var_104
  loc_004B3425: call [eax+0000005Ch]
  loc_004B3428: fnclex
  loc_004B342A: test eax, eax
  loc_004B342C: jge 004B3443h
  loc_004B342E: push 0000005Ch
  loc_004B3430: push 0041E928h
  loc_004B3435: mov ecx, [0061A13Ch]
  loc_004B343B: push ecx
  loc_004B343C: push eax
  loc_004B343D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3443: lea ecx, var_2C
  loc_004B3446: call [004012ACh] ; __vbaFreeStr
  loc_004B344C: lea edx, var_60
  loc_004B344F: push edx
  loc_004B3450: lea eax, var_50
  loc_004B3453: push eax
  loc_004B3454: lea ecx, var_40
  loc_004B3457: push ecx
  loc_004B3458: push 00000003h
  loc_004B345A: call [00401038h] ; __vbaFreeVarList
  loc_004B3460: add esp, 00000010h
  loc_004B3463: mov edi, 80020004h
  loc_004B3468: mov var_A8, 00424D7Ch ; "DELETE * FROM LGDETAIL WHERE (SrNo Between 2000 And 2999) And OnCount='"
  loc_004B3472: mov var_B0, ebx
  loc_004B3478: mov var_98, 0061A05Ch
  loc_004B3482: mov var_A0, 00004008h
  loc_004B348C: lea edx, var_A0
  loc_004B3492: push edx
  loc_004B3493: lea eax, var_40
  loc_004B3496: push eax
  loc_004B3497: call [004010D4h] ; rtcTrimVar
  loc_004B349D: mov var_B8, 0041E890h ; "'"
  loc_004B34A7: mov var_C0, ebx
  loc_004B34AD: mov ecx, [0061A13Ch]
  loc_004B34B3: mov edx, [ecx]
  loc_004B34B5: sub esp, 00000010h
  loc_004B34B8: mov ecx, esp
  loc_004B34BA: mov eax, 0000000Ah
  loc_004B34BF: mov [ecx], eax
  loc_004B34C1: mov eax, var_CC
  loc_004B34C7: mov [ecx+00000004h], eax
  loc_004B34CA: mov [ecx+00000008h], edi
  loc_004B34CD: mov eax, var_C4
  loc_004B34D3: mov [ecx+0000000Ch], eax
  loc_004B34D6: lea ecx, var_B0
  loc_004B34DC: push ecx
  loc_004B34DD: lea eax, var_40
  loc_004B34E0: push eax
  loc_004B34E1: lea ecx, var_50
  loc_004B34E4: push ecx
  loc_004B34E5: mov var_108, edx
  loc_004B34EB: call __vbaVarCat
  loc_004B34ED: push eax
  loc_004B34EE: lea edx, var_C0
  loc_004B34F4: push edx
  loc_004B34F5: lea eax, var_60
  loc_004B34F8: push eax
  loc_004B34F9: call __vbaVarCat
  loc_004B34FB: push eax
  loc_004B34FC: lea ecx, var_2C
  loc_004B34FF: push ecx
  loc_004B3500: call [004011B0h] ; __vbaStrVarVal
  loc_004B3506: push eax
  loc_004B3507: mov edx, [0061A13Ch]
  loc_004B350D: push edx
  loc_004B350E: mov eax, var_108
  loc_004B3514: call [eax+0000005Ch]
  loc_004B3517: fnclex
  loc_004B3519: test eax, eax
  loc_004B351B: jge 004B3532h
  loc_004B351D: push 0000005Ch
  loc_004B351F: push 0041E928h
  loc_004B3524: mov ecx, [0061A13Ch]
  loc_004B352A: push ecx
  loc_004B352B: push eax
  loc_004B352C: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3532: lea ecx, var_2C
  loc_004B3535: call [004012ACh] ; __vbaFreeStr
  loc_004B353B: lea edx, var_60
  loc_004B353E: push edx
  loc_004B353F: lea eax, var_50
  loc_004B3542: push eax
  loc_004B3543: lea ecx, var_40
  loc_004B3546: push ecx
  loc_004B3547: push 00000003h
  loc_004B3549: call [00401038h] ; __vbaFreeVarList
  loc_004B354F: mov eax, 80020004h
  loc_004B3554: mov var_98, eax
  loc_004B355A: mov ecx, 0000000Ah
  loc_004B355F: mov var_A0, ecx
  loc_004B3565: mov edx, [0061A13Ch]
  loc_004B356B: mov esi, [edx]
  loc_004B356D: mov edi, esp
  loc_004B356F: mov [edi], ecx
  loc_004B3571: mov ecx, var_9C
  loc_004B3577: mov [edi+00000004h], ecx
  loc_004B357A: mov [edi+00000008h], eax
  loc_004B357D: mov eax, var_94
  loc_004B3583: mov [edi+0000000Ch], eax
  loc_004B3586: push 00424E5Ch ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Soft\Lottery\Data\TmpXDB2.mdb'"
  loc_004B358B: push edx
  loc_004B358C: call [esi+0000005Ch]
  loc_004B358F: fnclex
  loc_004B3591: test eax, eax
  loc_004B3593: jge 004B35AAh
  loc_004B3595: push 0000005Ch
  loc_004B3597: push 0041E928h
  loc_004B359C: mov ecx, [0061A13Ch]
  loc_004B35A2: push ecx
  loc_004B35A3: push eax
  loc_004B35A4: call [00401074h] ; __vbaHresultCheckObj
  loc_004B35AA: mov eax, 80020004h
  loc_004B35AF: mov var_98, eax
  loc_004B35B5: mov ecx, 0000000Ah
  loc_004B35BA: mov var_A0, ecx
  loc_004B35C0: mov edx, [0061A13Ch]
  loc_004B35C6: mov esi, [edx]
  loc_004B35C8: sub esp, 00000010h
  loc_004B35CB: mov edi, esp
  loc_004B35CD: mov [edi], ecx
  loc_004B35CF: mov ecx, var_9C
  loc_004B35D5: mov [edi+00000004h], ecx
  loc_004B35D8: mov [edi+00000008h], eax
  loc_004B35DB: mov eax, var_94
  loc_004B35E1: mov [edi+0000000Ch], eax
  loc_004B35E4: push 00424EECh ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Soft\Lottery\Data\TmpXDB2.mdb'"
  loc_004B35E9: push edx
  loc_004B35EA: call [esi+0000005Ch]
  loc_004B35ED: fnclex
  loc_004B35EF: test eax, eax
  loc_004B35F1: jge 004B3608h
  loc_004B35F3: push 0000005Ch
  loc_004B35F5: push 0041E928h
  loc_004B35FA: mov ecx, [0061A13Ch]
  loc_004B3600: push ecx
  loc_004B3601: push eax
  loc_004B3602: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3608: mov ecx, 80020004h
  loc_004B360D: mov var_68, ecx
  loc_004B3610: mov eax, 0000000Ah
  loc_004B3615: mov var_70, eax
  loc_004B3618: mov var_58, ecx
  loc_004B361B: mov var_60, eax
  loc_004B361E: mov var_48, ecx
  loc_004B3621: mov var_50, eax
  loc_004B3624: mov var_98, 00424F94h ; "Finish Import!"
  loc_004B362E: mov var_A0, ebx
  loc_004B3634: lea edx, var_A0
  loc_004B363A: lea ecx, var_40
  loc_004B363D: call [00401240h] ; __vbaVarDup
  loc_004B3643: lea edx, var_70
  loc_004B3646: push edx
  loc_004B3647: lea eax, var_60
  loc_004B364A: push eax
  loc_004B364B: lea ecx, var_50
  loc_004B364E: push ecx
  loc_004B364F: push 00000040h
  loc_004B3651: lea edx, var_40
  loc_004B3654: push edx
  loc_004B3655: call [004010A4h] ; rtcMsgBox
  loc_004B365B: jmp 004B36F1h
  loc_004B3660: mov ecx, 80020004h
  loc_004B3665: mov var_68, ecx
  loc_004B3668: mov eax, 0000000Ah
  loc_004B366D: mov var_70, eax
  loc_004B3670: mov var_58, ecx
  loc_004B3673: mov var_60, eax
  loc_004B3676: mov var_48, ecx
  loc_004B3679: mov var_50, eax
  loc_004B367C: call [00401210h] ; rtcErrObj
  loc_004B3682: push eax
  loc_004B3683: lea ecx, var_30
  loc_004B3686: push ecx
  loc_004B3687: call [004010A0h] ; __vbaObjSet
  loc_004B368D: mov esi, eax
  loc_004B368F: mov edx, [esi]
  loc_004B3691: lea eax, var_2C
  loc_004B3694: push eax
  loc_004B3695: push esi
  loc_004B3696: call [edx+0000002Ch]
  loc_004B3699: fnclex
  loc_004B369B: test eax, eax
  loc_004B369D: jge 004B36AEh
  loc_004B369F: push 0000002Ch
  loc_004B36A1: push 0042150Ch
  loc_004B36A6: push esi
  loc_004B36A7: push eax
  loc_004B36A8: call [00401074h] ; __vbaHresultCheckObj
  loc_004B36AE: push 00424FB8h ; "Cann't Import !!! "
  loc_004B36B3: mov ecx, var_2C
  loc_004B36B6: push ecx
  loc_004B36B7: call [00401054h] ; __vbaStrCat
  loc_004B36BD: mov var_38, eax
  loc_004B36C0: mov var_40, 00000008h
  loc_004B36C7: lea edx, var_70
  loc_004B36CA: push edx
  loc_004B36CB: lea eax, var_60
  loc_004B36CE: push eax
  loc_004B36CF: lea ecx, var_50
  loc_004B36D2: push ecx
  loc_004B36D3: push 00000000h
  loc_004B36D5: lea edx, var_40
  loc_004B36D8: push edx
  loc_004B36D9: call [004010A4h] ; rtcMsgBox
  loc_004B36DF: lea ecx, var_2C
  loc_004B36E2: call [004012ACh] ; __vbaFreeStr
  loc_004B36E8: lea ecx, var_30
  loc_004B36EB: call [004012B0h] ; __vbaFreeObj
  loc_004B36F1: lea eax, var_70
  loc_004B36F4: push eax
  loc_004B36F5: lea ecx, var_60
  loc_004B36F8: push ecx
  loc_004B36F9: lea edx, var_50
  loc_004B36FC: push edx
  loc_004B36FD: lea eax, var_40
  loc_004B3700: push eax
  loc_004B3701: push 00000004h
  loc_004B3703: call [00401038h] ; __vbaFreeVarList
  loc_004B3709: add esp, 00000014h
  loc_004B370C: call [00401094h] ; __vbaExitProc
  loc_004B3712: fwait
  loc_004B3713: push 004B376Dh
  loc_004B3718: jmp 004B3753h
  loc_004B371A: lea ecx, var_2C
  loc_004B371D: call [004012ACh] ; __vbaFreeStr
  loc_004B3723: lea ecx, var_30
  loc_004B3726: call [004012B0h] ; __vbaFreeObj
  loc_004B372C: lea ecx, var_90
  loc_004B3732: push ecx
  loc_004B3733: lea edx, var_80
  loc_004B3736: push edx
  loc_004B3737: lea eax, var_70
  loc_004B373A: push eax
  loc_004B373B: lea ecx, var_60
  loc_004B373E: push ecx
  loc_004B373F: lea edx, var_50
  loc_004B3742: push edx
  loc_004B3743: lea eax, var_40
  loc_004B3746: push eax
  loc_004B3747: push 00000006h
  loc_004B3749: call [00401038h] ; __vbaFreeVarList
  loc_004B374F: add esp, 0000001Ch
  loc_004B3752: ret
  loc_004B3753: lea ecx, var_20
  loc_004B3756: call [004012ACh] ; __vbaFreeStr
  loc_004B375C: lea ecx, var_24
  loc_004B375F: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B3765: call __vbaFreeObj
  loc_004B3767: lea ecx, var_28
  loc_004B376A: call __vbaFreeObj
  loc_004B376C: ret
  loc_004B376D: mov ecx, var_1C
  loc_004B3770: mov fs:[00000000h], ecx
  loc_004B3777: pop edi
  loc_004B3778: pop esi
  loc_004B3779: pop ebx
  loc_004B377A: mov esp, ebp
  loc_004B377C: pop ebp
  loc_004B377D: ret
  loc_004B377E: nop
End Sub

Private Sub Proc_8_1_4B3780() '4B3780
  loc_004B3780: push ebp
  loc_004B3781: mov ebp, esp
  loc_004B3783: sub esp, 00000014h
  loc_004B3786: push 00403B36h ; __vbaExceptHandler
  loc_004B378B: mov eax, fs:[00000000h]
  loc_004B3791: push eax
  loc_004B3792: mov fs:[00000000h], esp
  loc_004B3799: sub esp, 000000F8h
  loc_004B379F: push ebx
  loc_004B37A0: push esi
  loc_004B37A1: push edi
  loc_004B37A2: mov var_14, esp
  loc_004B37A5: mov var_10, 00401CD8h
  loc_004B37AC: xor edi, edi
  loc_004B37AE: mov var_C, edi
  loc_004B37B1: mov var_8, edi
  loc_004B37B4: mov var_20, edi
  loc_004B37B7: mov var_24, edi
  loc_004B37BA: mov var_28, edi
  loc_004B37BD: mov var_2C, edi
  loc_004B37C0: mov var_30, edi
  loc_004B37C3: mov var_34, edi
  loc_004B37C6: mov var_44, edi
  loc_004B37C9: mov var_54, edi
  loc_004B37CC: mov var_64, edi
  loc_004B37CF: mov var_74, edi
  loc_004B37D2: mov var_84, edi
  loc_004B37D8: mov var_94, edi
  loc_004B37DE: mov var_A4, edi
  loc_004B37E4: mov var_B4, edi
  loc_004B37EA: mov var_C4, edi
  loc_004B37F0: mov var_D4, edi
  loc_004B37F6: push 00000001h
  loc_004B37F8: call [004010A8h] ; __vbaOnError
  loc_004B37FE: push 0000000Dh
  loc_004B3800: lea eax, var_44
  loc_004B3803: push eax
  loc_004B3804: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B380A: mov eax, 80020004h
  loc_004B380F: mov var_8C, eax
  loc_004B3815: mov ecx, 0000000Ah
  loc_004B381A: mov var_94, ecx
  loc_004B3820: mov var_7C, eax
  loc_004B3823: mov var_84, ecx
  loc_004B3829: mov var_BC, 0041F5E0h ; "SOFT"
  loc_004B3833: mov esi, 00000008h
  loc_004B3838: mov var_C4, esi
  loc_004B383E: lea edx, var_C4
  loc_004B3844: lea ecx, var_74
  loc_004B3847: call [00401240h] ; __vbaVarDup
  loc_004B384D: mov var_9C, 00424FE4h ; "Export process will take a few minutes."
  loc_004B3857: mov var_A4, esi
  loc_004B385D: mov var_AC, 00424E10h ; "Are you sure to Export data to A: ?"
  loc_004B3867: mov var_B4, esi
  loc_004B386D: lea ecx, var_94
  loc_004B3873: push ecx
  loc_004B3874: lea edx, var_84
  loc_004B387A: push edx
  loc_004B387B: lea eax, var_74
  loc_004B387E: push eax
  loc_004B387F: push 00000144h
  loc_004B3884: lea ecx, var_A4
  loc_004B388A: push ecx
  loc_004B388B: lea edx, var_44
  loc_004B388E: push edx
  loc_004B388F: lea eax, var_54
  loc_004B3892: push eax
  loc_004B3893: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B3899: call __vbaVarCat
  loc_004B389B: push eax
  loc_004B389C: lea ecx, var_B4
  loc_004B38A2: push ecx
  loc_004B38A3: lea edx, var_64
  loc_004B38A6: push edx
  loc_004B38A7: call __vbaVarCat
  loc_004B38A9: push eax
  loc_004B38AA: call [004010A4h] ; rtcMsgBox
  loc_004B38B0: xor ebx, ebx
  loc_004B38B2: cmp eax, 00000006h
  loc_004B38B5: setz bl
  loc_004B38B8: neg ebx
  loc_004B38BA: lea eax, var_94
  loc_004B38C0: push eax
  loc_004B38C1: lea ecx, var_84
  loc_004B38C7: push ecx
  loc_004B38C8: lea edx, var_74
  loc_004B38CB: push edx
  loc_004B38CC: lea eax, var_64
  loc_004B38CF: push eax
  loc_004B38D0: lea ecx, var_54
  loc_004B38D3: push ecx
  loc_004B38D4: lea edx, var_44
  loc_004B38D7: push edx
  loc_004B38D8: push 00000006h
  loc_004B38DA: call [00401038h] ; __vbaFreeVarList
  loc_004B38E0: add esp, 0000001Ch
  loc_004B38E3: cmp bx, di
  loc_004B38E6: jz 004B4226h
  loc_004B38EC: cmp [0061B3B4h], edi
  loc_004B38F2: jnz 004B3904h
  loc_004B38F4: push 0061B3B4h
  loc_004B38F9: push 004245F0h
  loc_004B38FE: call [004011DCh] ; __vbaNew2
  loc_004B3904: mov ebx, [0061B3B4h]
  loc_004B390A: mov eax, 80020004h
  loc_004B390F: mov var_BC, eax
  loc_004B3915: mov ecx, 0000000Ah
  loc_004B391A: mov var_C4, ecx
  loc_004B3920: mov var_AC, eax
  loc_004B3926: mov var_B4, ecx
  loc_004B392C: mov var_9C, eax
  loc_004B3932: mov var_A4, ecx
  loc_004B3938: mov edx, [ebx]
  loc_004B393A: lea edi, var_34
  loc_004B393D: push edi
  loc_004B393E: sub esp, 00000010h
  loc_004B3941: mov edi, esp
  loc_004B3943: mov [edi], ecx
  loc_004B3945: mov ecx, var_C0
  loc_004B394B: mov [edi+00000004h], ecx
  loc_004B394E: mov [edi+00000008h], eax
  loc_004B3951: mov eax, var_B8
  loc_004B3957: mov [edi+0000000Ch], eax
  loc_004B395A: sub esp, 00000010h
  loc_004B395D: mov ecx, esp
  loc_004B395F: mov eax, var_B4
  loc_004B3965: mov [ecx], eax
  loc_004B3967: mov eax, var_B0
  loc_004B396D: mov [ecx+00000004h], eax
  loc_004B3970: mov eax, var_AC
  loc_004B3976: mov [ecx+00000008h], eax
  loc_004B3979: mov eax, var_A8
  loc_004B397F: mov [ecx+0000000Ch], eax
  loc_004B3982: sub esp, 00000010h
  loc_004B3985: mov ecx, esp
  loc_004B3987: mov eax, var_A4
  loc_004B398D: mov [ecx], eax
  loc_004B398F: mov eax, var_A0
  loc_004B3995: mov [ecx+00000004h], eax
  loc_004B3998: mov eax, var_9C
  loc_004B399E: mov [ecx+00000008h], eax
  loc_004B39A1: mov eax, var_98
  loc_004B39A7: mov [ecx+0000000Ch], eax
  loc_004B39AA: push 00425044h ; "c:\Soft\Lottery\Data\TMPXDB2.mdb"
  loc_004B39AF: push ebx
  loc_004B39B0: call [edx+00000058h]
  loc_004B39B3: fnclex
  loc_004B39B5: test eax, eax
  loc_004B39B7: jge 004B39C8h
  loc_004B39B9: push 00000058h
  loc_004B39BB: push 004245E0h
  loc_004B39C0: push ebx
  loc_004B39C1: push eax
  loc_004B39C2: call [00401074h] ; __vbaHresultCheckObj
  loc_004B39C8: mov eax, var_34
  loc_004B39CB: mov var_34, 00000000h
  loc_004B39D2: push eax
  loc_004B39D3: lea ecx, var_28
  loc_004B39D6: push ecx
  loc_004B39D7: call [004010A0h] ; __vbaObjSet
  loc_004B39DD: mov eax, 80020004h
  loc_004B39E2: mov var_9C, eax
  loc_004B39E8: mov ecx, 0000000Ah
  loc_004B39ED: mov var_A4, ecx
  loc_004B39F3: mov edx, var_28
  loc_004B39F6: mov edi, [edx]
  loc_004B39F8: sub esp, 00000010h
  loc_004B39FB: mov ebx, esp
  loc_004B39FD: mov [ebx], ecx
  loc_004B39FF: mov ecx, var_A0
  loc_004B3A05: mov [ebx+00000004h], ecx
  loc_004B3A08: mov [ebx+00000008h], eax
  loc_004B3A0B: mov eax, var_98
  loc_004B3A11: mov [ebx+0000000Ch], eax
  loc_004B3A14: push 0042508Ch ; "Delete * From LG"
  loc_004B3A19: push edx
  loc_004B3A1A: call [edi+0000005Ch]
  loc_004B3A1D: fnclex
  loc_004B3A1F: test eax, eax
  loc_004B3A21: jge 004B3A35h
  loc_004B3A23: push 0000005Ch
  loc_004B3A25: push 0041E928h
  loc_004B3A2A: mov ecx, var_28
  loc_004B3A2D: push ecx
  loc_004B3A2E: push eax
  loc_004B3A2F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3A35: mov eax, 80020004h
  loc_004B3A3A: mov var_9C, eax
  loc_004B3A40: mov ecx, 0000000Ah
  loc_004B3A45: mov var_A4, ecx
  loc_004B3A4B: mov edx, var_28
  loc_004B3A4E: mov edi, [edx]
  loc_004B3A50: sub esp, 00000010h
  loc_004B3A53: mov ebx, esp
  loc_004B3A55: mov [ebx], ecx
  loc_004B3A57: mov ecx, var_A0
  loc_004B3A5D: mov [ebx+00000004h], ecx
  loc_004B3A60: mov [ebx+00000008h], eax
  loc_004B3A63: mov eax, var_98
  loc_004B3A69: mov [ebx+0000000Ch], eax
  loc_004B3A6C: push 004250B4h ; "Delete * From LGDetail"
  loc_004B3A71: push edx
  loc_004B3A72: call [edi+0000005Ch]
  loc_004B3A75: fnclex
  loc_004B3A77: test eax, eax
  loc_004B3A79: jge 004B3A8Dh
  loc_004B3A7B: push 0000005Ch
  loc_004B3A7D: push 0041E928h
  loc_004B3A82: mov ecx, var_28
  loc_004B3A85: push ecx
  loc_004B3A86: push eax
  loc_004B3A87: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3A8D: mov ebx, 80020004h
  loc_004B3A92: mov edi, 0000000Ah
  loc_004B3A97: mov var_AC, 004250E8h ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Soft\Lottery\Data\Super.mdb' WHERE OnCount='"
  loc_004B3AA1: mov var_B4, 00000008h
  loc_004B3AAB: mov var_9C, 0061A05Ch
  loc_004B3AB5: mov var_A4, 00004008h
  loc_004B3ABF: lea edx, var_A4
  loc_004B3AC5: push edx
  loc_004B3AC6: lea eax, var_44
  loc_004B3AC9: push eax
  loc_004B3ACA: call [004010D4h] ; rtcTrimVar
  loc_004B3AD0: mov var_BC, 0041E890h ; "'"
  loc_004B3ADA: mov var_C4, 00000008h
  loc_004B3AE4: mov ecx, var_28
  loc_004B3AE7: mov edx, [ecx]
  loc_004B3AE9: sub esp, 00000010h
  loc_004B3AEC: mov eax, esp
  loc_004B3AEE: mov [eax], edi
  loc_004B3AF0: mov ecx, var_D0
  loc_004B3AF6: mov [eax+00000004h], ecx
  loc_004B3AF9: mov [eax+00000008h], ebx
  loc_004B3AFC: mov ecx, var_C8
  loc_004B3B02: mov [eax+0000000Ch], ecx
  loc_004B3B05: lea eax, var_B4
  loc_004B3B0B: push eax
  loc_004B3B0C: lea ecx, var_44
  loc_004B3B0F: push ecx
  loc_004B3B10: lea eax, var_54
  loc_004B3B13: push eax
  loc_004B3B14: mov var_10C, edx
  loc_004B3B1A: call __vbaVarCat
  loc_004B3B1C: push eax
  loc_004B3B1D: lea ecx, var_C4
  loc_004B3B23: push ecx
  loc_004B3B24: lea edx, var_64
  loc_004B3B27: push edx
  loc_004B3B28: call __vbaVarCat
  loc_004B3B2A: push eax
  loc_004B3B2B: lea eax, var_2C
  loc_004B3B2E: push eax
  loc_004B3B2F: call [004011B0h] ; __vbaStrVarVal
  loc_004B3B35: push eax
  loc_004B3B36: mov ecx, var_28
  loc_004B3B39: push ecx
  loc_004B3B3A: mov edx, var_10C
  loc_004B3B40: call [edx+0000005Ch]
  loc_004B3B43: fnclex
  loc_004B3B45: test eax, eax
  loc_004B3B47: jge 004B3B5Bh
  loc_004B3B49: push 0000005Ch
  loc_004B3B4B: push 0041E928h
  loc_004B3B50: mov ecx, var_28
  loc_004B3B53: push ecx
  loc_004B3B54: push eax
  loc_004B3B55: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3B5B: lea ecx, var_2C
  loc_004B3B5E: call [004012ACh] ; __vbaFreeStr
  loc_004B3B64: lea edx, var_64
  loc_004B3B67: push edx
  loc_004B3B68: lea eax, var_54
  loc_004B3B6B: push eax
  loc_004B3B6C: lea ecx, var_44
  loc_004B3B6F: push ecx
  loc_004B3B70: push 00000003h
  loc_004B3B72: call [00401038h] ; __vbaFreeVarList
  loc_004B3B78: add esp, 00000010h
  loc_004B3B7B: mov ebx, 80020004h
  loc_004B3B80: mov edi, 0000000Ah
  loc_004B3B85: mov var_AC, 00425228h ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Soft\Lottery\Data\Super.mdb' WHERE OnCount='"
  loc_004B3B8F: mov var_B4, 00000008h
  loc_004B3B99: mov var_9C, 0061A05Ch
  loc_004B3BA3: mov var_A4, 00004008h
  loc_004B3BAD: lea edx, var_A4
  loc_004B3BB3: push edx
  loc_004B3BB4: lea eax, var_44
  loc_004B3BB7: push eax
  loc_004B3BB8: call [004010D4h] ; rtcTrimVar
  loc_004B3BBE: mov var_BC, 0041E890h ; "'"
  loc_004B3BC8: mov var_C4, 00000008h
  loc_004B3BD2: mov ecx, var_28
  loc_004B3BD5: mov edx, [ecx]
  loc_004B3BD7: sub esp, 00000010h
  loc_004B3BDA: mov eax, esp
  loc_004B3BDC: mov [eax], edi
  loc_004B3BDE: mov ecx, var_D0
  loc_004B3BE4: mov [eax+00000004h], ecx
  loc_004B3BE7: mov [eax+00000008h], ebx
  loc_004B3BEA: mov ecx, var_C8
  loc_004B3BF0: mov [eax+0000000Ch], ecx
  loc_004B3BF3: lea eax, var_B4
  loc_004B3BF9: push eax
  loc_004B3BFA: lea ecx, var_44
  loc_004B3BFD: push ecx
  loc_004B3BFE: lea eax, var_54
  loc_004B3C01: push eax
  loc_004B3C02: mov var_110, edx
  loc_004B3C08: call __vbaVarCat
  loc_004B3C0A: push eax
  loc_004B3C0B: lea ecx, var_C4
  loc_004B3C11: push ecx
  loc_004B3C12: lea edx, var_64
  loc_004B3C15: push edx
  loc_004B3C16: call __vbaVarCat
  loc_004B3C18: push eax
  loc_004B3C19: lea eax, var_2C
  loc_004B3C1C: push eax
  loc_004B3C1D: call [004011B0h] ; __vbaStrVarVal
  loc_004B3C23: push eax
  loc_004B3C24: mov ecx, var_28
  loc_004B3C27: push ecx
  loc_004B3C28: mov edx, var_110
  loc_004B3C2E: call [edx+0000005Ch]
  loc_004B3C31: fnclex
  loc_004B3C33: test eax, eax
  loc_004B3C35: jge 004B3C49h
  loc_004B3C37: push 0000005Ch
  loc_004B3C39: push 0041E928h
  loc_004B3C3E: mov ecx, var_28
  loc_004B3C41: push ecx
  loc_004B3C42: push eax
  loc_004B3C43: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3C49: lea ecx, var_2C
  loc_004B3C4C: call [004012ACh] ; __vbaFreeStr
  loc_004B3C52: lea edx, var_64
  loc_004B3C55: push edx
  loc_004B3C56: lea eax, var_54
  loc_004B3C59: push eax
  loc_004B3C5A: lea ecx, var_44
  loc_004B3C5D: push ecx
  loc_004B3C5E: push 00000003h
  loc_004B3C60: call [00401038h] ; __vbaFreeVarList
  loc_004B3C66: add esp, 00000010h
  loc_004B3C69: mov eax, var_28
  loc_004B3C6C: mov edx, [eax]
  loc_004B3C6E: push eax
  loc_004B3C6F: call [edx+00000058h]
  loc_004B3C72: fnclex
  loc_004B3C74: test eax, eax
  loc_004B3C76: jge 004B3C8Ah
  loc_004B3C78: push 00000058h
  loc_004B3C7A: push 0041E928h
  loc_004B3C7F: mov ecx, var_28
  loc_004B3C82: push ecx
  loc_004B3C83: push eax
  loc_004B3C84: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3C8A: push 0041E928h
  loc_004B3C8F: push 00000000h
  loc_004B3C91: call [00401274h] ; __vbaCastObj
  loc_004B3C97: push eax
  loc_004B3C98: lea edx, var_28
  loc_004B3C9B: push edx
  loc_004B3C9C: call [004010A0h] ; __vbaObjSet
  loc_004B3CA2: mov edx, 00424BFCh ; "c:\Soft\Lottery\Data\"
  loc_004B3CA7: lea ecx, var_20
  loc_004B3CAA: call [004011ECh] ; __vbaStrCopy
  loc_004B3CB0: mov eax, var_20
  loc_004B3CB3: push eax
  loc_004B3CB4: push 0041F65Ch ; "TmpXDB2.Mdb"
  loc_004B3CB9: mov ebx, [00401054h] ; __vbaStrCat
  loc_004B3CBF: call ebx
  loc_004B3CC1: mov var_3C, eax
  loc_004B3CC4: mov var_44, 00000008h
  loc_004B3CCB: push 00000000h
  loc_004B3CCD: lea ecx, var_44
  loc_004B3CD0: push ecx
  loc_004B3CD1: call [004011C8h] ; rtcDir
  loc_004B3CD7: mov edx, eax
  loc_004B3CD9: lea ecx, var_2C
  loc_004B3CDC: mov edi, [00401270h] ; __vbaStrMove
  loc_004B3CE2: call edi
  loc_004B3CE4: push eax
  loc_004B3CE5: push 0041E5D4h
  loc_004B3CEA: call [0040110Ch] ; __vbaStrCmp
  loc_004B3CF0: mov esi, eax
  loc_004B3CF2: neg esi
  loc_004B3CF4: sbb esi, esi
  loc_004B3CF6: neg esi
  loc_004B3CF8: neg esi
  loc_004B3CFA: lea ecx, var_2C
  loc_004B3CFD: call [004012ACh] ; __vbaFreeStr
  loc_004B3D03: lea ecx, var_44
  loc_004B3D06: call [00401020h] ; __vbaFreeVar
  loc_004B3D0C: test si, si
  loc_004B3D0F: jz 004B3EC8h
  loc_004B3D15: mov eax, [0061B3B4h]
  loc_004B3D1A: test eax, eax
  loc_004B3D1C: jnz 004B3D2Eh
  loc_004B3D1E: push 0061B3B4h
  loc_004B3D23: push 004245F0h
  loc_004B3D28: call [004011DCh] ; __vbaNew2
  loc_004B3D2E: mov eax, [0061B3B4h]
  loc_004B3D33: mov var_F0, eax
  loc_004B3D39: mov ecx, 0041E5D4h
  loc_004B3D3E: mov var_BC, ecx
  loc_004B3D44: mov edx, 00000008h
  loc_004B3D49: mov var_C4, edx
  loc_004B3D4F: mov var_AC, 00000000h
  loc_004B3D59: mov var_B4, 0000000Bh
  loc_004B3D63: mov var_9C, 00425324h ; ";LANGID=0x0409;CP=1252;COUNTRY=0"
  loc_004B3D6D: mov var_A4, edx
  loc_004B3D73: mov esi, [eax]
  loc_004B3D75: sub esp, 00000010h
  loc_004B3D78: mov eax, esp
  loc_004B3D7A: mov [eax], edx
  loc_004B3D7C: mov edx, var_C0
  loc_004B3D82: mov [eax+00000004h], edx
  loc_004B3D85: mov [eax+00000008h], ecx
  loc_004B3D88: mov ecx, var_B8
  loc_004B3D8E: mov [eax+0000000Ch], ecx
  loc_004B3D91: sub esp, 00000010h
  loc_004B3D94: mov edx, esp
  loc_004B3D96: mov eax, var_B4
  loc_004B3D9C: mov [edx], eax
  loc_004B3D9E: mov ecx, var_B0
  loc_004B3DA4: mov [edx+00000004h], ecx
  loc_004B3DA7: mov eax, var_AC
  loc_004B3DAD: mov [edx+00000008h], eax
  loc_004B3DB0: mov ecx, var_A8
  loc_004B3DB6: mov [edx+0000000Ch], ecx
  loc_004B3DB9: sub esp, 00000010h
  loc_004B3DBC: mov edx, esp
  loc_004B3DBE: mov eax, var_A4
  loc_004B3DC4: mov [edx], eax
  loc_004B3DC6: mov ecx, var_A0
  loc_004B3DCC: mov [edx+00000004h], ecx
  loc_004B3DCF: mov eax, var_9C
  loc_004B3DD5: mov [edx+00000008h], eax
  loc_004B3DD8: mov ecx, var_98
  loc_004B3DDE: mov [edx+0000000Ch], ecx
  loc_004B3DE1: mov edx, var_20
  loc_004B3DE4: push edx
  loc_004B3DE5: push 00425308h ; "TmpXDB3.Mdb"
  loc_004B3DEA: call ebx
  loc_004B3DEC: mov edx, eax
  loc_004B3DEE: lea ecx, var_30
  loc_004B3DF1: call edi
  loc_004B3DF3: push eax
  loc_004B3DF4: mov eax, var_20
  loc_004B3DF7: push eax
  loc_004B3DF8: push 004252ECh ; "TmpXDB2.MdB"
  loc_004B3DFD: call ebx
  loc_004B3DFF: mov edx, eax
  loc_004B3E01: lea ecx, var_2C
  loc_004B3E04: call edi
  loc_004B3E06: push eax
  loc_004B3E07: mov ecx, esi
  loc_004B3E09: mov esi, var_F0
  loc_004B3E0F: push esi
  loc_004B3E10: call [ecx+00000048h]
  loc_004B3E13: fnclex
  loc_004B3E15: test eax, eax
  loc_004B3E17: jge 004B3E28h
  loc_004B3E19: push 00000048h
  loc_004B3E1B: push 004245E0h
  loc_004B3E20: push esi
  loc_004B3E21: push eax
  loc_004B3E22: call [00401074h] ; __vbaHresultCheckObj
  loc_004B3E28: lea edx, var_30
  loc_004B3E2B: push edx
  loc_004B3E2C: lea eax, var_2C
  loc_004B3E2F: push eax
  loc_004B3E30: push 00000002h
  loc_004B3E32: mov esi, [004011FCh] ; __vbaFreeStrList
  loc_004B3E38: call __vbaFreeStrList
  loc_004B3E3A: add esp, 0000000Ch
  loc_004B3E3D: mov ecx, var_20
  loc_004B3E40: push ecx
  loc_004B3E41: push 0042536Ch ; "TmpXDB2.MDB"
  loc_004B3E46: call ebx
  loc_004B3E48: mov var_3C, eax
  loc_004B3E4B: mov var_44, 00000008h
  loc_004B3E52: lea edx, var_44
  loc_004B3E55: push edx
  loc_004B3E56: call [00401108h] ; rtcKillFiles
  loc_004B3E5C: lea ecx, var_44
  loc_004B3E5F: call [00401020h] ; __vbaFreeVar
  loc_004B3E65: mov eax, var_20
  loc_004B3E68: push eax
  loc_004B3E69: push 004253A4h ; "\TmpXDB2.mdb"
  loc_004B3E6E: call ebx
  loc_004B3E70: mov edx, eax
  loc_004B3E72: lea ecx, var_30
  loc_004B3E75: call edi
  loc_004B3E77: push eax
  loc_004B3E78: mov ecx, var_20
  loc_004B3E7B: push ecx
  loc_004B3E7C: push 00425388h ; "TmpXDB3.mdb"
  loc_004B3E81: call ebx
  loc_004B3E83: mov edx, eax
  loc_004B3E85: lea ecx, var_2C
  loc_004B3E88: call edi
  loc_004B3E8A: push eax
  loc_004B3E8B: call [00401200h] ; rtcFileCopy
  loc_004B3E91: lea edx, var_30
  loc_004B3E94: push edx
  loc_004B3E95: lea eax, var_2C
  loc_004B3E98: push eax
  loc_004B3E99: push 00000002h
  loc_004B3E9B: call __vbaFreeStrList
  loc_004B3E9D: add esp, 0000000Ch
  loc_004B3EA0: mov ecx, var_20
  loc_004B3EA3: push ecx
  loc_004B3EA4: push 004253C4h ; "TmpXDB3.MDB"
  loc_004B3EA9: call ebx
  loc_004B3EAB: mov var_3C, eax
  loc_004B3EAE: mov var_44, 00000008h
  loc_004B3EB5: lea edx, var_44
  loc_004B3EB8: push edx
  loc_004B3EB9: call [00401108h] ; rtcKillFiles
  loc_004B3EBF: lea ecx, var_44
  loc_004B3EC2: call [00401020h] ; __vbaFreeVar
  loc_004B3EC8: mov var_9C, 00425194h ; "c:\Soft\Lottery\Data\TmpXDb2.Rar"
  loc_004B3ED2: mov var_A4, 00000008h
  loc_004B3EDC: lea edx, var_A4
  loc_004B3EE2: lea ecx, var_44
  loc_004B3EE5: mov ebx, [00401240h] ; __vbaVarDup
  loc_004B3EEB: call ebx
  loc_004B3EED: push 00000000h
  loc_004B3EEF: lea eax, var_44
  loc_004B3EF2: push eax
  loc_004B3EF3: call [004011C8h] ; rtcDir
  loc_004B3EF9: mov edx, eax
  loc_004B3EFB: lea ecx, var_2C
  loc_004B3EFE: call edi
  loc_004B3F00: push eax
  loc_004B3F01: push 0041E5D4h
  loc_004B3F06: call [0040110Ch] ; __vbaStrCmp
  loc_004B3F0C: mov esi, eax
  loc_004B3F0E: neg esi
  loc_004B3F10: sbb esi, esi
  loc_004B3F12: neg esi
  loc_004B3F14: neg esi
  loc_004B3F16: lea ecx, var_2C
  loc_004B3F19: call [004012ACh] ; __vbaFreeStr
  loc_004B3F1F: lea ecx, var_44
  loc_004B3F22: call [00401020h] ; __vbaFreeVar
  loc_004B3F28: test si, si
  loc_004B3F2B: jz 004B3F62h
  loc_004B3F2D: mov var_9C, 00425194h ; "c:\Soft\Lottery\Data\TmpXDb2.Rar"
  loc_004B3F37: mov esi, 00000008h
  loc_004B3F3C: mov var_A4, esi
  loc_004B3F42: lea edx, var_A4
  loc_004B3F48: lea ecx, var_44
  loc_004B3F4B: call ebx
  loc_004B3F4D: lea ecx, var_44
  loc_004B3F50: push ecx
  loc_004B3F51: call [00401108h] ; rtcKillFiles
  loc_004B3F57: lea ecx, var_44
  loc_004B3F5A: call [00401020h] ; __vbaFreeVar
  loc_004B3F60: jmp 004B3F67h
  loc_004B3F62: mov esi, 00000008h
  loc_004B3F67: mov var_9C, 004253FCh ; "c:\Soft\Lottery\Rar.exe a c:\Soft\Lottery\Data\TmpXDB2.rar c:\Soft\Lottery\Data\TmpXDB2.mdb"
  loc_004B3F71: mov var_A4, esi
  loc_004B3F77: lea edx, var_A4
  loc_004B3F7D: lea ecx, var_44
  loc_004B3F80: call ebx
  loc_004B3F82: push 00000002h
  loc_004B3F84: lea edx, var_44
  loc_004B3F87: push edx
  loc_004B3F88: call [00401150h] ; rtcShell
  loc_004B3F8E: fstp st0
  loc_004B3F90: lea ecx, var_44
  loc_004B3F93: call [00401020h] ; __vbaFreeVar
  loc_004B3F99: mov var_9C, 004254B8h ; "A:\TmpXDb2.Rar"
  loc_004B3FA3: mov var_A4, esi
  loc_004B3FA9: lea edx, var_A4
  loc_004B3FAF: lea ecx, var_44
  loc_004B3FB2: call ebx
  loc_004B3FB4: push 00000000h
  loc_004B3FB6: lea eax, var_44
  loc_004B3FB9: push eax
  loc_004B3FBA: call [004011C8h] ; rtcDir
  loc_004B3FC0: mov edx, eax
  loc_004B3FC2: lea ecx, var_2C
  loc_004B3FC5: call edi
  loc_004B3FC7: push eax
  loc_004B3FC8: push 0041E5D4h
  loc_004B3FCD: call [0040110Ch] ; __vbaStrCmp
  loc_004B3FD3: mov esi, eax
  loc_004B3FD5: neg esi
  loc_004B3FD7: sbb esi, esi
  loc_004B3FD9: neg esi
  loc_004B3FDB: neg esi
  loc_004B3FDD: lea ecx, var_2C
  loc_004B3FE0: call [004012ACh] ; __vbaFreeStr
  loc_004B3FE6: lea ecx, var_44
  loc_004B3FE9: call [00401020h] ; __vbaFreeVar
  loc_004B3FEF: test si, si
  loc_004B3FF2: jz 004B4026h
  loc_004B3FF4: mov var_9C, 00424C48h ; "A:\TmpXDB2.Rar"
  loc_004B3FFE: mov var_A4, 00000008h
  loc_004B4008: lea edx, var_A4
  loc_004B400E: lea ecx, var_44
  loc_004B4011: call ebx
  loc_004B4013: lea ecx, var_44
  loc_004B4016: push ecx
  loc_004B4017: call [00401108h] ; rtcKillFiles
  loc_004B401D: lea ecx, var_44
  loc_004B4020: call [00401020h] ; __vbaFreeVar
  loc_004B4026: mov var_9C, 00425194h ; "c:\Soft\Lottery\Data\TmpXDb2.Rar"
  loc_004B4030: mov var_A4, 00000008h
  loc_004B403A: lea edx, var_A4
  loc_004B4040: lea ecx, var_44
  loc_004B4043: call ebx
  loc_004B4045: push 00000000h
  loc_004B4047: lea edx, var_44
  loc_004B404A: push edx
  loc_004B404B: call [004011C8h] ; rtcDir
  loc_004B4051: mov edx, eax
  loc_004B4053: lea ecx, var_2C
  loc_004B4056: call edi
  loc_004B4058: push eax
  loc_004B4059: push 0041E5D4h
  loc_004B405E: call [0040110Ch] ; __vbaStrCmp
  loc_004B4064: mov esi, eax
  loc_004B4066: neg esi
  loc_004B4068: sbb esi, esi
  loc_004B406A: neg esi
  loc_004B406C: neg esi
  loc_004B406E: lea ecx, var_2C
  loc_004B4071: call [004012ACh] ; __vbaFreeStr
  loc_004B4077: lea ecx, var_44
  loc_004B407A: call [00401020h] ; __vbaFreeVar
  loc_004B4080: test si, si
  loc_004B4083: jnz 004B4112h
  loc_004B4089: mov ecx, 80020004h
  loc_004B408E: mov var_6C, ecx
  loc_004B4091: mov eax, 0000000Ah
  loc_004B4096: mov var_74, eax
  loc_004B4099: mov var_5C, ecx
  loc_004B409C: mov var_64, eax
  loc_004B409F: mov var_4C, ecx
  loc_004B40A2: mov var_54, eax
  loc_004B40A5: mov var_9C, 00425548h ; "Cann't copy to A:"
  loc_004B40AF: mov var_A4, 00000008h
  loc_004B40B9: lea edx, var_A4
  loc_004B40BF: lea ecx, var_44
  loc_004B40C2: call ebx
  loc_004B40C4: lea eax, var_74
  loc_004B40C7: push eax
  loc_004B40C8: lea ecx, var_64
  loc_004B40CB: push ecx
  loc_004B40CC: lea edx, var_54
  loc_004B40CF: push edx
  loc_004B40D0: push 00000045h
  loc_004B40D2: lea eax, var_44
  loc_004B40D5: push eax
  loc_004B40D6: call [004010A4h] ; rtcMsgBox
  loc_004B40DC: xor ecx, ecx
  loc_004B40DE: cmp eax, 00000004h
  loc_004B40E1: setz cl
  loc_004B40E4: neg ecx
  loc_004B40E6: mov si, cx
  loc_004B40E9: lea edx, var_74
  loc_004B40EC: push edx
  loc_004B40ED: lea eax, var_64
  loc_004B40F0: push eax
  loc_004B40F1: lea ecx, var_54
  loc_004B40F4: push ecx
  loc_004B40F5: lea edx, var_44
  loc_004B40F8: push edx
  loc_004B40F9: push 00000004h
  loc_004B40FB: call [00401038h] ; __vbaFreeVarList
  loc_004B4101: add esp, 00000014h
  loc_004B4104: test si, si
  loc_004B4107: jz 004B4226h
  loc_004B410D: jmp 004B4026h
  loc_004B4112: push 00424C48h ; "A:\TmpXDB2.Rar"
  loc_004B4117: push 004254DCh ; "c:\Soft\Lottery\Data\TmpXDB2.Rar"
  loc_004B411C: call [00401200h] ; rtcFileCopy
  loc_004B4122: mov ecx, 80020004h
  loc_004B4127: mov var_6C, ecx
  loc_004B412A: mov eax, 0000000Ah
  loc_004B412F: mov var_74, eax
  loc_004B4132: mov var_5C, ecx
  loc_004B4135: mov var_64, eax
  loc_004B4138: mov var_4C, ecx
  loc_004B413B: mov var_54, eax
  loc_004B413E: mov var_9C, 00425524h ; "Finish Export !"
  loc_004B4148: mov var_A4, 00000008h
  loc_004B4152: lea edx, var_A4
  loc_004B4158: lea ecx, var_44
  loc_004B415B: call ebx
  loc_004B415D: lea eax, var_74
  loc_004B4160: push eax
  loc_004B4161: lea ecx, var_64
  loc_004B4164: push ecx
  loc_004B4165: lea edx, var_54
  loc_004B4168: push edx
  loc_004B4169: push 00000040h
  loc_004B416B: lea eax, var_44
  loc_004B416E: push eax
  loc_004B416F: call [004010A4h] ; rtcMsgBox
  loc_004B4175: jmp 004B420Bh
  loc_004B417A: mov ecx, 80020004h
  loc_004B417F: mov var_6C, ecx
  loc_004B4182: mov eax, 0000000Ah
  loc_004B4187: mov var_74, eax
  loc_004B418A: mov var_5C, ecx
  loc_004B418D: mov var_64, eax
  loc_004B4190: mov var_4C, ecx
  loc_004B4193: mov var_54, eax
  loc_004B4196: call [00401210h] ; rtcErrObj
  loc_004B419C: push eax
  loc_004B419D: lea edx, var_34
  loc_004B41A0: push edx
  loc_004B41A1: call [004010A0h] ; __vbaObjSet
  loc_004B41A7: mov esi, eax
  loc_004B41A9: mov eax, [esi]
  loc_004B41AB: lea ecx, var_2C
  loc_004B41AE: push ecx
  loc_004B41AF: push esi
  loc_004B41B0: call [eax+0000002Ch]
  loc_004B41B3: fnclex
  loc_004B41B5: test eax, eax
  loc_004B41B7: jge 004B41C8h
  loc_004B41B9: push 0000002Ch
  loc_004B41BB: push 0042150Ch
  loc_004B41C0: push esi
  loc_004B41C1: push eax
  loc_004B41C2: call [00401074h] ; __vbaHresultCheckObj
  loc_004B41C8: push 00425570h ; "Cann't Export !!! "
  loc_004B41CD: mov edx, var_2C
  loc_004B41D0: push edx
  loc_004B41D1: call [00401054h] ; __vbaStrCat
  loc_004B41D7: mov var_3C, eax
  loc_004B41DA: mov var_44, 00000008h
  loc_004B41E1: lea eax, var_74
  loc_004B41E4: push eax
  loc_004B41E5: lea ecx, var_64
  loc_004B41E8: push ecx
  loc_004B41E9: lea edx, var_54
  loc_004B41EC: push edx
  loc_004B41ED: push 00000000h
  loc_004B41EF: lea eax, var_44
  loc_004B41F2: push eax
  loc_004B41F3: call [004010A4h] ; rtcMsgBox
  loc_004B41F9: lea ecx, var_2C
  loc_004B41FC: call [004012ACh] ; __vbaFreeStr
  loc_004B4202: lea ecx, var_34
  loc_004B4205: call [004012B0h] ; __vbaFreeObj
  loc_004B420B: lea ecx, var_74
  loc_004B420E: push ecx
  loc_004B420F: lea edx, var_64
  loc_004B4212: push edx
  loc_004B4213: lea eax, var_54
  loc_004B4216: push eax
  loc_004B4217: lea ecx, var_44
  loc_004B421A: push ecx
  loc_004B421B: push 00000004h
  loc_004B421D: call [00401038h] ; __vbaFreeVarList
  loc_004B4223: add esp, 00000014h
  loc_004B4226: call [00401094h] ; __vbaExitProc
  loc_004B422C: fwait
  loc_004B422D: push 004B4294h
  loc_004B4232: jmp 004B427Ah
  loc_004B4234: lea edx, var_30
  loc_004B4237: push edx
  loc_004B4238: lea eax, var_2C
  loc_004B423B: push eax
  loc_004B423C: push 00000002h
  loc_004B423E: call [004011FCh] ; __vbaFreeStrList
  loc_004B4244: add esp, 0000000Ch
  loc_004B4247: lea ecx, var_34
  loc_004B424A: call [004012B0h] ; __vbaFreeObj
  loc_004B4250: lea ecx, var_94
  loc_004B4256: push ecx
  loc_004B4257: lea edx, var_84
  loc_004B425D: push edx
  loc_004B425E: lea eax, var_74
  loc_004B4261: push eax
  loc_004B4262: lea ecx, var_64
  loc_004B4265: push ecx
  loc_004B4266: lea edx, var_54
  loc_004B4269: push edx
  loc_004B426A: lea eax, var_44
  loc_004B426D: push eax
  loc_004B426E: push 00000006h
  loc_004B4270: call [00401038h] ; __vbaFreeVarList
  loc_004B4276: add esp, 0000001Ch
  loc_004B4279: ret
  loc_004B427A: lea ecx, var_20
  loc_004B427D: call [004012ACh] ; __vbaFreeStr
  loc_004B4283: lea ecx, var_24
  loc_004B4286: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B428C: call __vbaFreeObj
  loc_004B428E: lea ecx, var_28
  loc_004B4291: call __vbaFreeObj
  loc_004B4293: ret
  loc_004B4294: mov ecx, var_1C
  loc_004B4297: mov fs:[00000000h], ecx
  loc_004B429E: pop edi
  loc_004B429F: pop esi
  loc_004B42A0: pop ebx
  loc_004B42A1: mov esp, ebp
  loc_004B42A3: pop ebp
  loc_004B42A4: ret
  loc_004B42A5: nop
End Sub

Private Sub Proc_8_2_4B42B0() '4B42B0
  loc_004B42B0: push ebp
  loc_004B42B1: mov ebp, esp
  loc_004B42B3: sub esp, 00000014h
  loc_004B42B6: push 00403B36h ; __vbaExceptHandler
  loc_004B42BB: mov eax, fs:[00000000h]
  loc_004B42C1: push eax
  loc_004B42C2: mov fs:[00000000h], esp
  loc_004B42C9: sub esp, 00000104h
  loc_004B42CF: push ebx
  loc_004B42D0: push esi
  loc_004B42D1: push edi
  loc_004B42D2: mov var_14, esp
  loc_004B42D5: mov var_10, 00401D00h
  loc_004B42DC: xor eax, eax
  loc_004B42DE: mov var_C, eax
  loc_004B42E1: mov var_8, eax
  loc_004B42E4: mov var_20, eax
  loc_004B42E7: mov var_24, eax
  loc_004B42EA: mov var_28, eax
  loc_004B42ED: mov var_2C, eax
  loc_004B42F0: mov var_30, eax
  loc_004B42F3: mov var_34, eax
  loc_004B42F6: mov var_38, eax
  loc_004B42F9: mov var_48, eax
  loc_004B42FC: mov var_58, eax
  loc_004B42FF: mov var_68, eax
  loc_004B4302: mov var_78, eax
  loc_004B4305: mov var_88, eax
  loc_004B430B: mov var_98, eax
  loc_004B4311: mov var_A8, eax
  loc_004B4317: mov var_B8, eax
  loc_004B431D: mov var_C8, eax
  loc_004B4323: mov var_D8, eax
  loc_004B4329: push 00000001h
  loc_004B432B: call [004010A8h] ; __vbaOnError
  loc_004B4331: push 0000000Dh
  loc_004B4333: lea eax, var_48
  loc_004B4336: push eax
  loc_004B4337: call [0040119Ch] ; rtcVarBstrFromAnsi
  loc_004B433D: mov eax, 80020004h
  loc_004B4342: mov var_90, eax
  loc_004B4348: mov ecx, 0000000Ah
  loc_004B434D: mov var_98, ecx
  loc_004B4353: mov var_80, eax
  loc_004B4356: mov var_88, ecx
  loc_004B435C: mov var_C0, 0041F5E0h ; "SOFT"
  loc_004B4366: mov edi, 00000008h
  loc_004B436B: mov var_C8, edi
  loc_004B4371: lea edx, var_C8
  loc_004B4377: lea ecx, var_78
  loc_004B437A: call [00401240h] ; __vbaVarDup
  loc_004B4380: mov var_A0, 00424B58h ; "Import process will take a few minutes."
  loc_004B438A: mov var_A8, edi
  loc_004B4390: mov var_B0, 004255DCh ; "Are you sure to Import Data From MACHINE 2 ?"
  loc_004B439A: mov var_B8, edi
  loc_004B43A0: lea ecx, var_98
  loc_004B43A6: push ecx
  loc_004B43A7: lea edx, var_88
  loc_004B43AD: push edx
  loc_004B43AE: lea eax, var_78
  loc_004B43B1: push eax
  loc_004B43B2: push 00000144h
  loc_004B43B7: lea ecx, var_A8
  loc_004B43BD: push ecx
  loc_004B43BE: lea edx, var_48
  loc_004B43C1: push edx
  loc_004B43C2: lea eax, var_58
  loc_004B43C5: push eax
  loc_004B43C6: mov esi, [004011B4h] ; __vbaVarCat
  loc_004B43CC: call __vbaVarCat
  loc_004B43CE: push eax
  loc_004B43CF: lea ecx, var_B8
  loc_004B43D5: push ecx
  loc_004B43D6: lea edx, var_68
  loc_004B43D9: push edx
  loc_004B43DA: call __vbaVarCat
  loc_004B43DC: push eax
  loc_004B43DD: call [004010A4h] ; rtcMsgBox
  loc_004B43E3: xor ebx, ebx
  loc_004B43E5: cmp eax, 00000006h
  loc_004B43E8: setz bl
  loc_004B43EB: neg ebx
  loc_004B43ED: lea eax, var_98
  loc_004B43F3: push eax
  loc_004B43F4: lea ecx, var_88
  loc_004B43FA: push ecx
  loc_004B43FB: lea edx, var_78
  loc_004B43FE: push edx
  loc_004B43FF: lea eax, var_68
  loc_004B4402: push eax
  loc_004B4403: lea ecx, var_58
  loc_004B4406: push ecx
  loc_004B4407: lea edx, var_48
  loc_004B440A: push edx
  loc_004B440B: push 00000006h
  loc_004B440D: call [00401038h] ; __vbaFreeVarList
  loc_004B4413: add esp, 0000001Ch
  loc_004B4416: test bx, bx
  loc_004B4419: jz 004B4DABh
  loc_004B441F: mov edx, 0042563Ch ; "c:\Xerus\Crystal\Data\"
  loc_004B4424: lea ecx, var_24
  loc_004B4427: mov ebx, [004011ECh] ; __vbaStrCopy
  loc_004B442D: call ebx
  loc_004B442F: mov edx, 00425670h ; "H:\Xerus\Crystal\Data\"
  loc_004B4434: lea ecx, var_20
  loc_004B4437: call ebx
  loc_004B4439: mov eax, var_24
  loc_004B443C: push eax
  loc_004B443D: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B4442: call [00401054h] ; __vbaStrCat
  loc_004B4448: mov var_40, eax
  loc_004B444B: mov var_48, edi
  loc_004B444E: push 00000000h
  loc_004B4450: lea ecx, var_48
  loc_004B4453: push ecx
  loc_004B4454: call [004011C8h] ; rtcDir
  loc_004B445A: mov edx, eax
  loc_004B445C: lea ecx, var_30
  loc_004B445F: call [00401270h] ; __vbaStrMove
  loc_004B4465: push eax
  loc_004B4466: push 0041E5D4h
  loc_004B446B: call [0040110Ch] ; __vbaStrCmp
  loc_004B4471: mov ebx, eax
  loc_004B4473: neg ebx
  loc_004B4475: sbb ebx, ebx
  loc_004B4477: neg ebx
  loc_004B4479: neg ebx
  loc_004B447B: lea ecx, var_30
  loc_004B447E: call [004012ACh] ; __vbaFreeStr
  loc_004B4484: lea ecx, var_48
  loc_004B4487: call [00401020h] ; __vbaFreeVar
  loc_004B448D: test bx, bx
  loc_004B4490: jz 004B44BEh
  loc_004B4492: mov edx, var_24
  loc_004B4495: push edx
  loc_004B4496: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B449B: mov ebx, [00401054h] ; __vbaStrCat
  loc_004B44A1: call ebx
  loc_004B44A3: mov var_40, eax
  loc_004B44A6: mov var_48, edi
  loc_004B44A9: lea eax, var_48
  loc_004B44AC: push eax
  loc_004B44AD: call [00401108h] ; rtcKillFiles
  loc_004B44B3: lea ecx, var_48
  loc_004B44B6: call [00401020h] ; __vbaFreeVar
  loc_004B44BC: jmp 004B44C4h
  loc_004B44BE: mov ebx, [00401054h] ; __vbaStrCat
  loc_004B44C4: mov ecx, var_24
  loc_004B44C7: push ecx
  loc_004B44C8: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B44CD: call ebx
  loc_004B44CF: mov edx, eax
  loc_004B44D1: lea ecx, var_34
  loc_004B44D4: call [00401270h] ; __vbaStrMove
  loc_004B44DA: push eax
  loc_004B44DB: mov edx, var_20
  loc_004B44DE: push edx
  loc_004B44DF: push 0041F678h ; "TmpXDB2.mdb"
  loc_004B44E4: call ebx
  loc_004B44E6: mov edx, eax
  loc_004B44E8: lea ecx, var_30
  loc_004B44EB: call [00401270h] ; __vbaStrMove
  loc_004B44F1: push eax
  loc_004B44F2: call [00401200h] ; rtcFileCopy
  loc_004B44F8: lea eax, var_34
  loc_004B44FB: push eax
  loc_004B44FC: lea ecx, var_30
  loc_004B44FF: push ecx
  loc_004B4500: push 00000002h
  loc_004B4502: call [004011FCh] ; __vbaFreeStrList
  loc_004B4508: add esp, 0000000Ch
  loc_004B450B: mov ebx, 80020004h
  loc_004B4510: mov var_B0, 00424CF4h ; "DELETE * FROM LG WHERE (SrNo Between 2000 And 2999) And OnCount='"
  loc_004B451A: mov var_B8, edi
  loc_004B4520: mov var_A0, 0061A05Ch
  loc_004B452A: mov var_A8, 00004008h
  loc_004B4534: lea edx, var_A8
  loc_004B453A: push edx
  loc_004B453B: lea eax, var_48
  loc_004B453E: push eax
  loc_004B453F: call [004010D4h] ; rtcTrimVar
  loc_004B4545: mov var_C0, 004256A4h ; "' And MachineID=2"
  loc_004B454F: mov var_C8, edi
  loc_004B4555: mov ecx, [0061A13Ch]
  loc_004B455B: mov edx, [ecx]
  loc_004B455D: sub esp, 00000010h
  loc_004B4560: mov ecx, esp
  loc_004B4562: mov eax, 0000000Ah
  loc_004B4567: mov [ecx], eax
  loc_004B4569: mov eax, var_D4
  loc_004B456F: mov [ecx+00000004h], eax
  loc_004B4572: mov [ecx+00000008h], ebx
  loc_004B4575: mov eax, var_CC
  loc_004B457B: mov [ecx+0000000Ch], eax
  loc_004B457E: lea ecx, var_B8
  loc_004B4584: push ecx
  loc_004B4585: lea eax, var_48
  loc_004B4588: push eax
  loc_004B4589: lea ecx, var_58
  loc_004B458C: push ecx
  loc_004B458D: mov var_104, edx
  loc_004B4593: call __vbaVarCat
  loc_004B4595: push eax
  loc_004B4596: lea edx, var_C8
  loc_004B459C: push edx
  loc_004B459D: lea eax, var_68
  loc_004B45A0: push eax
  loc_004B45A1: call __vbaVarCat
  loc_004B45A3: push eax
  loc_004B45A4: lea ecx, var_30
  loc_004B45A7: push ecx
  loc_004B45A8: call [004011B0h] ; __vbaStrVarVal
  loc_004B45AE: push eax
  loc_004B45AF: mov edx, [0061A13Ch]
  loc_004B45B5: push edx
  loc_004B45B6: mov eax, var_104
  loc_004B45BC: call [eax+0000005Ch]
  loc_004B45BF: fnclex
  loc_004B45C1: test eax, eax
  loc_004B45C3: jge 004B45DAh
  loc_004B45C5: push 0000005Ch
  loc_004B45C7: push 0041E928h
  loc_004B45CC: mov ecx, [0061A13Ch]
  loc_004B45D2: push ecx
  loc_004B45D3: push eax
  loc_004B45D4: call [00401074h] ; __vbaHresultCheckObj
  loc_004B45DA: lea ecx, var_30
  loc_004B45DD: call [004012ACh] ; __vbaFreeStr
  loc_004B45E3: lea edx, var_68
  loc_004B45E6: push edx
  loc_004B45E7: lea eax, var_58
  loc_004B45EA: push eax
  loc_004B45EB: lea ecx, var_48
  loc_004B45EE: push ecx
  loc_004B45EF: push 00000003h
  loc_004B45F1: call [00401038h] ; __vbaFreeVarList
  loc_004B45F7: add esp, 00000010h
  loc_004B45FA: mov ebx, 80020004h
  loc_004B45FF: mov var_B0, 00424D7Ch ; "DELETE * FROM LGDETAIL WHERE (SrNo Between 2000 And 2999) And OnCount='"
  loc_004B4609: mov var_B8, edi
  loc_004B460F: mov var_A0, 0061A05Ch
  loc_004B4619: mov var_A8, 00004008h
  loc_004B4623: lea edx, var_A8
  loc_004B4629: push edx
  loc_004B462A: lea eax, var_48
  loc_004B462D: push eax
  loc_004B462E: call [004010D4h] ; rtcTrimVar
  loc_004B4634: mov var_C0, 004256A4h ; "' And MachineID=2"
  loc_004B463E: mov var_C8, edi
  loc_004B4644: mov ecx, [0061A13Ch]
  loc_004B464A: mov edx, [ecx]
  loc_004B464C: sub esp, 00000010h
  loc_004B464F: mov ecx, esp
  loc_004B4651: mov eax, 0000000Ah
  loc_004B4656: mov [ecx], eax
  loc_004B4658: mov eax, var_D4
  loc_004B465E: mov [ecx+00000004h], eax
  loc_004B4661: mov [ecx+00000008h], ebx
  loc_004B4664: mov eax, var_CC
  loc_004B466A: mov [ecx+0000000Ch], eax
  loc_004B466D: lea ecx, var_B8
  loc_004B4673: push ecx
  loc_004B4674: lea eax, var_48
  loc_004B4677: push eax
  loc_004B4678: lea ecx, var_58
  loc_004B467B: push ecx
  loc_004B467C: mov var_108, edx
  loc_004B4682: call __vbaVarCat
  loc_004B4684: push eax
  loc_004B4685: lea edx, var_C8
  loc_004B468B: push edx
  loc_004B468C: lea eax, var_68
  loc_004B468F: push eax
  loc_004B4690: call __vbaVarCat
  loc_004B4692: push eax
  loc_004B4693: lea ecx, var_30
  loc_004B4696: push ecx
  loc_004B4697: call [004011B0h] ; __vbaStrVarVal
  loc_004B469D: push eax
  loc_004B469E: mov edx, [0061A13Ch]
  loc_004B46A4: push edx
  loc_004B46A5: mov eax, var_108
  loc_004B46AB: call [eax+0000005Ch]
  loc_004B46AE: fnclex
  loc_004B46B0: test eax, eax
  loc_004B46B2: jge 004B46C9h
  loc_004B46B4: push 0000005Ch
  loc_004B46B6: push 0041E928h
  loc_004B46BB: mov ecx, [0061A13Ch]
  loc_004B46C1: push ecx
  loc_004B46C2: push eax
  loc_004B46C3: call [00401074h] ; __vbaHresultCheckObj
  loc_004B46C9: lea ecx, var_30
  loc_004B46CC: call [004012ACh] ; __vbaFreeStr
  loc_004B46D2: lea edx, var_68
  loc_004B46D5: push edx
  loc_004B46D6: lea eax, var_58
  loc_004B46D9: push eax
  loc_004B46DA: lea ecx, var_48
  loc_004B46DD: push ecx
  loc_004B46DE: push 00000003h
  loc_004B46E0: call [00401038h] ; __vbaFreeVarList
  loc_004B46E6: add esp, 00000010h
  loc_004B46E9: mov ebx, 80020004h
  loc_004B46EE: mov var_B0, 004256CCh ; "DELETE * FROM LGSale WHERE (SrNo Between 2000 And 2999) And OnCount='"
  loc_004B46F8: mov var_B8, edi
  loc_004B46FE: mov var_A0, 0061A05Ch
  loc_004B4708: mov var_A8, 00004008h
  loc_004B4712: lea edx, var_A8
  loc_004B4718: push edx
  loc_004B4719: lea eax, var_48
  loc_004B471C: push eax
  loc_004B471D: call [004010D4h] ; rtcTrimVar
  loc_004B4723: mov var_C0, 004256A4h ; "' And MachineID=2"
  loc_004B472D: mov var_C8, edi
  loc_004B4733: mov ecx, [0061A13Ch]
  loc_004B4739: mov edx, [ecx]
  loc_004B473B: sub esp, 00000010h
  loc_004B473E: mov ecx, esp
  loc_004B4740: mov eax, 0000000Ah
  loc_004B4745: mov [ecx], eax
  loc_004B4747: mov eax, var_D4
  loc_004B474D: mov [ecx+00000004h], eax
  loc_004B4750: mov [ecx+00000008h], ebx
  loc_004B4753: mov eax, var_CC
  loc_004B4759: mov [ecx+0000000Ch], eax
  loc_004B475C: lea ecx, var_B8
  loc_004B4762: push ecx
  loc_004B4763: lea eax, var_48
  loc_004B4766: push eax
  loc_004B4767: lea ecx, var_58
  loc_004B476A: push ecx
  loc_004B476B: mov var_10C, edx
  loc_004B4771: call __vbaVarCat
  loc_004B4773: push eax
  loc_004B4774: lea edx, var_C8
  loc_004B477A: push edx
  loc_004B477B: lea eax, var_68
  loc_004B477E: push eax
  loc_004B477F: call __vbaVarCat
  loc_004B4781: push eax
  loc_004B4782: lea ecx, var_30
  loc_004B4785: push ecx
  loc_004B4786: call [004011B0h] ; __vbaStrVarVal
  loc_004B478C: push eax
  loc_004B478D: mov edx, [0061A13Ch]
  loc_004B4793: push edx
  loc_004B4794: mov eax, var_10C
  loc_004B479A: call [eax+0000005Ch]
  loc_004B479D: fnclex
  loc_004B479F: test eax, eax
  loc_004B47A1: jge 004B47B8h
  loc_004B47A3: push 0000005Ch
  loc_004B47A5: push 0041E928h
  loc_004B47AA: mov ecx, [0061A13Ch]
  loc_004B47B0: push ecx
  loc_004B47B1: push eax
  loc_004B47B2: call [00401074h] ; __vbaHresultCheckObj
  loc_004B47B8: lea ecx, var_30
  loc_004B47BB: call [004012ACh] ; __vbaFreeStr
  loc_004B47C1: lea edx, var_68
  loc_004B47C4: push edx
  loc_004B47C5: lea eax, var_58
  loc_004B47C8: push eax
  loc_004B47C9: lea ecx, var_48
  loc_004B47CC: push ecx
  loc_004B47CD: push 00000003h
  loc_004B47CF: call [00401038h] ; __vbaFreeVarList
  loc_004B47D5: add esp, 00000010h
  loc_004B47D8: mov ebx, 80020004h
  loc_004B47DD: mov var_B0, 00425780h ; "DELETE * FROM LGSaleDETAIL WHERE (SrNo Between 2000 And 2999) And OnCount='"
  loc_004B47E7: mov var_B8, edi
  loc_004B47ED: mov var_A0, 0061A05Ch
  loc_004B47F7: mov var_A8, 00004008h
  loc_004B4801: lea edx, var_A8
  loc_004B4807: push edx
  loc_004B4808: lea eax, var_48
  loc_004B480B: push eax
  loc_004B480C: call [004010D4h] ; rtcTrimVar
  loc_004B4812: mov var_C0, 004256A4h ; "' And MachineID=2"
  loc_004B481C: mov var_C8, edi
  loc_004B4822: mov ecx, [0061A13Ch]
  loc_004B4828: mov edx, [ecx]
  loc_004B482A: sub esp, 00000010h
  loc_004B482D: mov ecx, esp
  loc_004B482F: mov eax, 0000000Ah
  loc_004B4834: mov [ecx], eax
  loc_004B4836: mov eax, var_D4
  loc_004B483C: mov [ecx+00000004h], eax
  loc_004B483F: mov [ecx+00000008h], ebx
  loc_004B4842: mov eax, var_CC
  loc_004B4848: mov [ecx+0000000Ch], eax
  loc_004B484B: lea ecx, var_B8
  loc_004B4851: push ecx
  loc_004B4852: lea eax, var_48
  loc_004B4855: push eax
  loc_004B4856: lea ecx, var_58
  loc_004B4859: push ecx
  loc_004B485A: mov var_110, edx
  loc_004B4860: call __vbaVarCat
  loc_004B4862: push eax
  loc_004B4863: lea edx, var_C8
  loc_004B4869: push edx
  loc_004B486A: lea eax, var_68
  loc_004B486D: push eax
  loc_004B486E: call __vbaVarCat
  loc_004B4870: push eax
  loc_004B4871: lea ecx, var_30
  loc_004B4874: push ecx
  loc_004B4875: call [004011B0h] ; __vbaStrVarVal
  loc_004B487B: push eax
  loc_004B487C: mov edx, [0061A13Ch]
  loc_004B4882: push edx
  loc_004B4883: mov eax, var_110
  loc_004B4889: call [eax+0000005Ch]
  loc_004B488C: fnclex
  loc_004B488E: test eax, eax
  loc_004B4890: jge 004B48A7h
  loc_004B4892: push 0000005Ch
  loc_004B4894: push 0041E928h
  loc_004B4899: mov ecx, [0061A13Ch]
  loc_004B489F: push ecx
  loc_004B48A0: push eax
  loc_004B48A1: call [00401074h] ; __vbaHresultCheckObj
  loc_004B48A7: lea ecx, var_30
  loc_004B48AA: call [004012ACh] ; __vbaFreeStr
  loc_004B48B0: lea edx, var_68
  loc_004B48B3: push edx
  loc_004B48B4: lea eax, var_58
  loc_004B48B7: push eax
  loc_004B48B8: lea ecx, var_48
  loc_004B48BB: push ecx
  loc_004B48BC: push 00000003h
  loc_004B48BE: call [00401038h] ; __vbaFreeVarList
  loc_004B48C4: add esp, 00000010h
  loc_004B48C7: mov ebx, 80020004h
  loc_004B48CC: mov var_B0, 0042581Ch ; "INSERT INTO LG SELECT * FROM LG IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B48D6: mov var_B8, edi
  loc_004B48DC: mov var_A0, 0061A05Ch
  loc_004B48E6: mov var_A8, 00004008h
  loc_004B48F0: lea edx, var_A8
  loc_004B48F6: push edx
  loc_004B48F7: lea eax, var_48
  loc_004B48FA: push eax
  loc_004B48FB: call [004010D4h] ; rtcTrimVar
  loc_004B4901: mov var_C0, 004258D0h ; "' and MachineID=2"
  loc_004B490B: mov var_C8, edi
  loc_004B4911: mov ecx, [0061A13Ch]
  loc_004B4917: mov edx, [ecx]
  loc_004B4919: sub esp, 00000010h
  loc_004B491C: mov ecx, esp
  loc_004B491E: mov eax, 0000000Ah
  loc_004B4923: mov [ecx], eax
  loc_004B4925: mov eax, var_D4
  loc_004B492B: mov [ecx+00000004h], eax
  loc_004B492E: mov [ecx+00000008h], ebx
  loc_004B4931: mov eax, var_CC
  loc_004B4937: mov [ecx+0000000Ch], eax
  loc_004B493A: lea ecx, var_B8
  loc_004B4940: push ecx
  loc_004B4941: lea eax, var_48
  loc_004B4944: push eax
  loc_004B4945: lea ecx, var_58
  loc_004B4948: push ecx
  loc_004B4949: mov var_114, edx
  loc_004B494F: call __vbaVarCat
  loc_004B4951: push eax
  loc_004B4952: lea edx, var_C8
  loc_004B4958: push edx
  loc_004B4959: lea eax, var_68
  loc_004B495C: push eax
  loc_004B495D: call __vbaVarCat
  loc_004B495F: push eax
  loc_004B4960: lea ecx, var_30
  loc_004B4963: push ecx
  loc_004B4964: call [004011B0h] ; __vbaStrVarVal
  loc_004B496A: push eax
  loc_004B496B: mov edx, [0061A13Ch]
  loc_004B4971: push edx
  loc_004B4972: mov eax, var_114
  loc_004B4978: call [eax+0000005Ch]
  loc_004B497B: fnclex
  loc_004B497D: test eax, eax
  loc_004B497F: jge 004B4996h
  loc_004B4981: push 0000005Ch
  loc_004B4983: push 0041E928h
  loc_004B4988: mov ecx, [0061A13Ch]
  loc_004B498E: push ecx
  loc_004B498F: push eax
  loc_004B4990: call [00401074h] ; __vbaHresultCheckObj
  loc_004B4996: lea ecx, var_30
  loc_004B4999: call [004012ACh] ; __vbaFreeStr
  loc_004B499F: lea edx, var_68
  loc_004B49A2: push edx
  loc_004B49A3: lea eax, var_58
  loc_004B49A6: push eax
  loc_004B49A7: lea ecx, var_48
  loc_004B49AA: push ecx
  loc_004B49AB: push 00000003h
  loc_004B49AD: call [00401038h] ; __vbaFreeVarList
  loc_004B49B3: add esp, 00000010h
  loc_004B49B6: mov ebx, 80020004h
  loc_004B49BB: mov var_B0, 00425964h ; "INSERT INTO LGDetail SELECT * FROM LGDetail IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B49C5: mov var_B8, edi
  loc_004B49CB: mov var_A0, 0061A05Ch
  loc_004B49D5: mov var_A8, 00004008h
  loc_004B49DF: lea edx, var_A8
  loc_004B49E5: push edx
  loc_004B49E6: lea eax, var_48
  loc_004B49E9: push eax
  loc_004B49EA: call [004010D4h] ; rtcTrimVar
  loc_004B49F0: mov var_C0, 004258D0h ; "' and MachineID=2"
  loc_004B49FA: mov var_C8, edi
  loc_004B4A00: mov ecx, [0061A13Ch]
  loc_004B4A06: mov edx, [ecx]
  loc_004B4A08: sub esp, 00000010h
  loc_004B4A0B: mov ecx, esp
  loc_004B4A0D: mov eax, 0000000Ah
  loc_004B4A12: mov [ecx], eax
  loc_004B4A14: mov eax, var_D4
  loc_004B4A1A: mov [ecx+00000004h], eax
  loc_004B4A1D: mov [ecx+00000008h], ebx
  loc_004B4A20: mov eax, var_CC
  loc_004B4A26: mov [ecx+0000000Ch], eax
  loc_004B4A29: lea ecx, var_B8
  loc_004B4A2F: push ecx
  loc_004B4A30: lea eax, var_48
  loc_004B4A33: push eax
  loc_004B4A34: lea ecx, var_58
  loc_004B4A37: push ecx
  loc_004B4A38: mov var_118, edx
  loc_004B4A3E: call __vbaVarCat
  loc_004B4A40: push eax
  loc_004B4A41: lea edx, var_C8
  loc_004B4A47: push edx
  loc_004B4A48: lea eax, var_68
  loc_004B4A4B: push eax
  loc_004B4A4C: call __vbaVarCat
  loc_004B4A4E: push eax
  loc_004B4A4F: lea ecx, var_30
  loc_004B4A52: push ecx
  loc_004B4A53: call [004011B0h] ; __vbaStrVarVal
  loc_004B4A59: push eax
  loc_004B4A5A: mov edx, [0061A13Ch]
  loc_004B4A60: push edx
  loc_004B4A61: mov eax, var_118
  loc_004B4A67: call [eax+0000005Ch]
  loc_004B4A6A: fnclex
  loc_004B4A6C: test eax, eax
  loc_004B4A6E: jge 004B4A85h
  loc_004B4A70: push 0000005Ch
  loc_004B4A72: push 0041E928h
  loc_004B4A77: mov ecx, [0061A13Ch]
  loc_004B4A7D: push ecx
  loc_004B4A7E: push eax
  loc_004B4A7F: call [00401074h] ; __vbaHresultCheckObj
  loc_004B4A85: lea ecx, var_30
  loc_004B4A88: call [004012ACh] ; __vbaFreeStr
  loc_004B4A8E: lea edx, var_68
  loc_004B4A91: push edx
  loc_004B4A92: lea eax, var_58
  loc_004B4A95: push eax
  loc_004B4A96: lea ecx, var_48
  loc_004B4A99: push ecx
  loc_004B4A9A: push 00000003h
  loc_004B4A9C: call [00401038h] ; __vbaFreeVarList
  loc_004B4AA2: add esp, 00000010h
  loc_004B4AA5: mov ebx, 80020004h
  loc_004B4AAA: mov var_B0, 00425A30h ; "INSERT INTO LGSale SELECT * FROM LGSale IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B4AB4: mov var_B8, edi
  loc_004B4ABA: mov var_A0, 0061A05Ch
  loc_004B4AC4: mov var_A8, 00004008h
  loc_004B4ACE: lea edx, var_A8
  loc_004B4AD4: push edx
  loc_004B4AD5: lea eax, var_48
  loc_004B4AD8: push eax
  loc_004B4AD9: call [004010D4h] ; rtcTrimVar
  loc_004B4ADF: mov var_C0, 004258D0h ; "' and MachineID=2"
  loc_004B4AE9: mov var_C8, edi
  loc_004B4AEF: mov ecx, [0061A13Ch]
  loc_004B4AF5: mov edx, [ecx]
  loc_004B4AF7: sub esp, 00000010h
  loc_004B4AFA: mov ecx, esp
  loc_004B4AFC: mov eax, 0000000Ah
  loc_004B4B01: mov [ecx], eax
  loc_004B4B03: mov eax, var_D4
  loc_004B4B09: mov [ecx+00000004h], eax
  loc_004B4B0C: mov [ecx+00000008h], ebx
  loc_004B4B0F: mov eax, var_CC
  loc_004B4B15: mov [ecx+0000000Ch], eax
  loc_004B4B18: lea ecx, var_B8
  loc_004B4B1E: push ecx
  loc_004B4B1F: lea eax, var_48
  loc_004B4B22: push eax
  loc_004B4B23: lea ecx, var_58
  loc_004B4B26: push ecx
  loc_004B4B27: mov var_11C, edx
  loc_004B4B2D: call __vbaVarCat
  loc_004B4B2F: push eax
  loc_004B4B30: lea edx, var_C8
  loc_004B4B36: push edx
  loc_004B4B37: lea eax, var_68
  loc_004B4B3A: push eax
  loc_004B4B3B: call __vbaVarCat
  loc_004B4B3D: push eax
  loc_004B4B3E: lea ecx, var_30
  loc_004B4B41: push ecx
  loc_004B4B42: call [004011B0h] ; __vbaStrVarVal
  loc_004B4B48: push eax
  loc_004B4B49: mov edx, [0061A13Ch]
  loc_004B4B4F: push edx
  loc_004B4B50: mov eax, var_11C
  loc_004B4B56: call [eax+0000005Ch]
  loc_004B4B59: fnclex
  loc_004B4B5B: test eax, eax
  loc_004B4B5D: jge 004B4B74h
  loc_004B4B5F: push 0000005Ch
  loc_004B4B61: push 0041E928h
  loc_004B4B66: mov ecx, [0061A13Ch]
  loc_004B4B6C: push ecx
  loc_004B4B6D: push eax
  loc_004B4B6E: call [00401074h] ; __vbaHresultCheckObj
  loc_004B4B74: lea ecx, var_30
  loc_004B4B77: call [004012ACh] ; __vbaFreeStr
  loc_004B4B7D: lea edx, var_68
  loc_004B4B80: push edx
  loc_004B4B81: lea eax, var_58
  loc_004B4B84: push eax
  loc_004B4B85: lea ecx, var_48
  loc_004B4B88: push ecx
  loc_004B4B89: push 00000003h
  loc_004B4B8B: call [00401038h] ; __vbaFreeVarList
  loc_004B4B91: add esp, 00000010h
  loc_004B4B94: mov ebx, 80020004h
  loc_004B4B99: mov var_B0, 00425B54h ; "INSERT INTO LGSaleDetail SELECT * FROM LGSaleDetail IN 'c:\Xerus\Crystal\Data\TmpXDB2.mdb' Where OnCount='"
  loc_004B4BA3: mov var_B8, edi
  loc_004B4BA9: mov var_A0, 0061A05Ch
  loc_004B4BB3: mov var_A8, 00004008h
  loc_004B4BBD: lea edx, var_A8
  loc_004B4BC3: push edx
  loc_004B4BC4: lea eax, var_48
  loc_004B4BC7: push eax
  loc_004B4BC8: call [004010D4h] ; rtcTrimVar
  loc_004B4BCE: mov var_C0, 004258D0h ; "' and MachineID=2"
  loc_004B4BD8: mov var_C8, edi
  loc_004B4BDE: mov ecx, [0061A13Ch]
  loc_004B4BE4: mov edx, [ecx]
  loc_004B4BE6: sub esp, 00000010h
  loc_004B4BE9: mov ecx, esp
  loc_004B4BEB: mov eax, 0000000Ah
  loc_004B4BF0: mov [ecx], eax
  loc_004B4BF2: mov eax, var_D4
  loc_004B4BF8: mov [ecx+00000004h], eax
  loc_004B4BFB: mov [ecx+00000008h], ebx
  loc_004B4BFE: mov eax, var_CC
  loc_004B4C04: mov [ecx+0000000Ch], eax
  loc_004B4C07: lea ecx, var_B8
  loc_004B4C0D: push ecx
  loc_004B4C0E: lea eax, var_48
  loc_004B4C11: push eax
  loc_004B4C12: lea ecx, var_58
  loc_004B4C15: push ecx
  loc_004B4C16: mov var_120, edx
  loc_004B4C1C: call __vbaVarCat
  loc_004B4C1E: push eax
  loc_004B4C1F: lea edx, var_C8
  loc_004B4C25: push edx
  loc_004B4C26: lea eax, var_68
  loc_004B4C29: push eax
  loc_004B4C2A: call __vbaVarCat
  loc_004B4C2C: push eax
  loc_004B4C2D: lea ecx, var_30
  loc_004B4C30: push ecx
  loc_004B4C31: call [004011B0h] ; __vbaStrVarVal
  loc_004B4C37: push eax
  loc_004B4C38: mov edx, [0061A13Ch]
  loc_004B4C3E: push edx
  loc_004B4C3F: mov eax, var_120
  loc_004B4C45: call [eax+0000005Ch]
  loc_004B4C48: fnclex
  loc_004B4C4A: test eax, eax
  loc_004B4C4C: jge 004B4C63h
  loc_004B4C4E: push 0000005Ch
  loc_004B4C50: push 0041E928h
  loc_004B4C55: mov ecx, [0061A13Ch]
  loc_004B4C5B: push ecx
  loc_004B4C5C: push eax
  loc_004B4C5D: call [00401074h] ; __vbaHresultCheckObj
  loc_004B4C63: lea ecx, var_30
  loc_004B4C66: call [004012ACh] ; __vbaFreeStr
  loc_004B4C6C: lea edx, var_68
  loc_004B4C6F: push edx
  loc_004B4C70: lea eax, var_58
  loc_004B4C73: push eax
  loc_004B4C74: lea ecx, var_48
  loc_004B4C77: push ecx
  loc_004B4C78: push 00000003h
  loc_004B4C7A: mov esi, [00401038h] ; __vbaFreeVarList
  loc_004B4C80: call __vbaFreeVarList
  loc_004B4C82: add esp, 00000010h
  loc_004B4C85: mov ecx, 80020004h
  loc_004B4C8A: mov var_70, ecx
  loc_004B4C8D: mov eax, 0000000Ah
  loc_004B4C92: mov var_78, eax
  loc_004B4C95: mov var_60, ecx
  loc_004B4C98: mov var_68, eax
  loc_004B4C9B: mov var_50, ecx
  loc_004B4C9E: mov var_58, eax
  loc_004B4CA1: mov var_A0, 00424F94h ; "Finish Import!"
  loc_004B4CAB: mov var_A8, edi
  loc_004B4CB1: lea edx, var_A8
  loc_004B4CB7: lea ecx, var_48
  loc_004B4CBA: call [00401240h] ; __vbaVarDup
  loc_004B4CC0: lea edx, var_78
  loc_004B4CC3: push edx
  loc_004B4CC4: lea eax, var_68
  loc_004B4CC7: push eax
  loc_004B4CC8: lea ecx, var_58
  loc_004B4CCB: push ecx
  loc_004B4CCC: push 00000040h
  loc_004B4CCE: lea edx, var_48
  loc_004B4CD1: push edx
  loc_004B4CD2: call [004010A4h] ; rtcMsgBox
  loc_004B4CD8: lea eax, var_78
  loc_004B4CDB: push eax
  loc_004B4CDC: lea ecx, var_68
  loc_004B4CDF: push ecx
  loc_004B4CE0: lea edx, var_58
  loc_004B4CE3: push edx
  loc_004B4CE4: lea eax, var_48
  loc_004B4CE7: push eax
  loc_004B4CE8: push 00000004h
  loc_004B4CEA: call __vbaFreeVarList
  loc_004B4CEC: add esp, 00000014h
  loc_004B4CEF: call [00401094h] ; __vbaExitProc
  loc_004B4CF5: push 004B4E1Fh
  loc_004B4CFA: jmp 004B4DFEh
  loc_004B4CFF: mov ecx, 80020004h
  loc_004B4D04: mov var_70, ecx
  loc_004B4D07: mov eax, 0000000Ah
  loc_004B4D0C: mov var_78, eax
  loc_004B4D0F: mov var_60, ecx
  loc_004B4D12: mov var_68, eax
  loc_004B4D15: mov var_50, ecx
  loc_004B4D18: mov var_58, eax
  loc_004B4D1B: call [00401210h] ; rtcErrObj
  loc_004B4D21: push eax
  loc_004B4D22: lea ecx, var_38
  loc_004B4D25: push ecx
  loc_004B4D26: call [004010A0h] ; __vbaObjSet
  loc_004B4D2C: mov esi, eax
  loc_004B4D2E: mov edx, [esi]
  loc_004B4D30: lea eax, var_30
  loc_004B4D33: push eax
  loc_004B4D34: push esi
  loc_004B4D35: call [edx+0000002Ch]
  loc_004B4D38: fnclex
  loc_004B4D3A: test eax, eax
  loc_004B4D3C: jge 004B4D4Dh
  loc_004B4D3E: push 0000002Ch
  loc_004B4D40: push 0042150Ch
  loc_004B4D45: push esi
  loc_004B4D46: push eax
  loc_004B4D47: call [00401074h] ; __vbaHresultCheckObj
  loc_004B4D4D: push 00424FB8h ; "Cann't Import !!! "
  loc_004B4D52: mov ecx, var_30
  loc_004B4D55: push ecx
  loc_004B4D56: call [00401054h] ; __vbaStrCat
  loc_004B4D5C: mov var_40, eax
  loc_004B4D5F: mov var_48, 00000008h
  loc_004B4D66: lea edx, var_78
  loc_004B4D69: push edx
  loc_004B4D6A: lea eax, var_68
  loc_004B4D6D: push eax
  loc_004B4D6E: lea ecx, var_58
  loc_004B4D71: push ecx
  loc_004B4D72: push 00000000h
  loc_004B4D74: lea edx, var_48
  loc_004B4D77: push edx
  loc_004B4D78: call [004010A4h] ; rtcMsgBox
  loc_004B4D7E: lea ecx, var_30
  loc_004B4D81: call [004012ACh] ; __vbaFreeStr
  loc_004B4D87: lea ecx, var_38
  loc_004B4D8A: call [004012B0h] ; __vbaFreeObj
  loc_004B4D90: lea eax, var_78
  loc_004B4D93: push eax
  loc_004B4D94: lea ecx, var_68
  loc_004B4D97: push ecx
  loc_004B4D98: lea edx, var_58
  loc_004B4D9B: push edx
  loc_004B4D9C: lea eax, var_48
  loc_004B4D9F: push eax
  loc_004B4DA0: push 00000004h
  loc_004B4DA2: call [00401038h] ; __vbaFreeVarList
  loc_004B4DA8: add esp, 00000014h
  loc_004B4DAB: call [00401094h] ; __vbaExitProc
  loc_004B4DB1: push 004B4E1Fh
  loc_004B4DB6: jmp 004B4DFEh
  loc_004B4DB8: lea ecx, var_34
  loc_004B4DBB: push ecx
  loc_004B4DBC: lea edx, var_30
  loc_004B4DBF: push edx
  loc_004B4DC0: push 00000002h
  loc_004B4DC2: call [004011FCh] ; __vbaFreeStrList
  loc_004B4DC8: add esp, 0000000Ch
  loc_004B4DCB: lea ecx, var_38
  loc_004B4DCE: call [004012B0h] ; __vbaFreeObj
  loc_004B4DD4: lea eax, var_98
  loc_004B4DDA: push eax
  loc_004B4DDB: lea ecx, var_88
  loc_004B4DE1: push ecx
  loc_004B4DE2: lea edx, var_78
  loc_004B4DE5: push edx
  loc_004B4DE6: lea eax, var_68
  loc_004B4DE9: push eax
  loc_004B4DEA: lea ecx, var_58
  loc_004B4DED: push ecx
  loc_004B4DEE: lea edx, var_48
  loc_004B4DF1: push edx
  loc_004B4DF2: push 00000006h
  loc_004B4DF4: call [00401038h] ; __vbaFreeVarList
  loc_004B4DFA: add esp, 0000001Ch
  loc_004B4DFD: ret
  loc_004B4DFE: lea ecx, var_20
  loc_004B4E01: mov esi, [004012ACh] ; __vbaFreeStr
  loc_004B4E07: call __vbaFreeStr
  loc_004B4E09: lea ecx, var_24
  loc_004B4E0C: call __vbaFreeStr
  loc_004B4E0E: lea ecx, var_28
  loc_004B4E11: mov esi, [004012B0h] ; __vbaFreeObj
  loc_004B4E17: call __vbaFreeObj
  loc_004B4E19: lea ecx, var_2C
  loc_004B4E1C: call __vbaFreeObj
  loc_004B4E1E: ret
  loc_004B4E1F: mov ecx, var_1C
  loc_004B4E22: mov fs:[00000000h], ecx
  loc_004B4E29: pop edi
  loc_004B4E2A: pop esi
  loc_004B4E2B: pop ebx
  loc_004B4E2C: mov esp, ebp
  loc_004B4E2E: pop ebp
  loc_004B4E2F: ret
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
