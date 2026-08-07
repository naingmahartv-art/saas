VERSION 5.00
Begin VB.Form frmLuckyNo
  Caption = "Lucky No.."
  ScaleMode = 1
  AutoRedraw = False
  FontTransparent = True
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 450
  ClientWidth = 3690
  ClientHeight = 2070
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
  Begin VB.CommandButton cmdClose
    Caption = "&Close"
    Left = 1980
    Top = 1140
    Width = 1035
    Height = 405
    TabIndex = 3
  End
  Begin VB.CommandButton cmdSave
    Caption = "&Save"
    Left = 930
    Top = 1140
    Width = 1035
    Height = 405
    TabIndex = 2
  End
  Begin VB.TextBox txtLuckyNo
    Left = 1470
    Top = 450
    Width = 1575
    Height = 375
    TabIndex = 1
  End
  Begin VB.Label Label1
    Caption = "Lucky No."
    Left = 450
    Top = 510
    Width = 1245
    Height = 285
    TabIndex = 0
  End
End

Attribute VB_Name = "frmLuckyNo"


Private Sub cmdSave_Click() '5CB390
  loc_005CB390: push ebp
  loc_005CB391: mov ebp, esp
  loc_005CB393: sub esp, 0000000Ch
  loc_005CB396: push 00403B36h ; __vbaExceptHandler
  loc_005CB39B: mov eax, fs:[00000000h]
  loc_005CB3A1: push eax
  loc_005CB3A2: mov fs:[00000000h], esp
  loc_005CB3A9: sub esp, 000000ECh
  loc_005CB3AF: push ebx
  loc_005CB3B0: push esi
  loc_005CB3B1: push edi
  loc_005CB3B2: mov var_C, esp
  loc_005CB3B5: mov var_8, 004030B8h
  loc_005CB3BC: mov eax, Me
  loc_005CB3BF: mov ecx, eax
  loc_005CB3C1: and ecx, 00000001h
  loc_005CB3C4: mov var_4, ecx
  loc_005CB3C7: and al, FEh
  loc_005CB3C9: push eax
  loc_005CB3CA: mov Me, eax
  loc_005CB3CD: mov edx, [eax]
  loc_005CB3CF: call [edx+00000004h]
  loc_005CB3D2: lea eax, var_8C
  loc_005CB3D8: xor edi, edi
  loc_005CB3DA: lea ecx, var_2C
  loc_005CB3DD: push eax
  loc_005CB3DE: mov var_8C, edi
  loc_005CB3E4: mov var_9C, edi
  loc_005CB3EA: push ecx
  loc_005CB3EB: mov var_18, edi
  loc_005CB3EE: mov var_1C, edi
  loc_005CB3F1: mov var_2C, edi
  loc_005CB3F4: mov var_3C, edi
  loc_005CB3F7: mov var_4C, edi
  loc_005CB3FA: mov var_5C, edi
  loc_005CB3FD: mov var_6C, edi
  loc_005CB400: mov var_7C, edi
  loc_005CB403: mov var_AC, edi
  loc_005CB409: mov var_BC, edi
  loc_005CB40F: mov var_CC, edi
  loc_005CB415: mov esi, 80020004h
  loc_005CB41A: mov ebx, 0000000Ah
  loc_005CB41F: mov var_94, 0042C180h ; "Delete From LuckyNo Where OnDate=#"
  loc_005CB429: mov var_9C, 00000008h
  loc_005CB433: mov var_84, 0061A05Ch
  loc_005CB43D: mov var_8C, 00004008h
  loc_005CB447: call [004010D4h] ; rtcTrimVar
  loc_005CB44D: lea edx, var_BC
  loc_005CB453: lea eax, var_5C
  loc_005CB456: push edx
  loc_005CB457: push eax
  loc_005CB458: mov var_A4, 004209A4h ; "# And AMPM='"
  loc_005CB462: mov var_AC, 00000008h
  loc_005CB46C: mov var_B4, 0061A060h
  loc_005CB476: mov var_BC, 00004008h
  loc_005CB480: call [004010D4h] ; rtcTrimVar
  loc_005CB486: mov ecx, [0061A13Ch]
  loc_005CB48C: sub esp, 00000010h
  loc_005CB48F: mov eax, esp
  loc_005CB491: mov var_C4, 0041E890h ; "'"
  loc_005CB49B: mov var_CC, 00000008h
  loc_005CB4A5: mov edx, [ecx]
  loc_005CB4A7: mov ecx, var_D8
  loc_005CB4AD: mov [eax], ebx
  loc_005CB4AF: mov var_FC, edx
  loc_005CB4B5: mov [eax+00000004h], ecx
  loc_005CB4B8: mov ecx, var_D0
  loc_005CB4BE: mov [eax+00000008h], esi
  loc_005CB4C1: mov esi, [004011B4h] ; __vbaVarCat
  loc_005CB4C7: mov [eax+0000000Ch], ecx
  loc_005CB4CA: lea eax, var_9C
  loc_005CB4D0: push eax
  loc_005CB4D1: lea ecx, var_2C
  loc_005CB4D4: lea eax, var_3C
  loc_005CB4D7: push ecx
  loc_005CB4D8: push eax
  loc_005CB4D9: call __vbaVarCat
  loc_005CB4DB: lea ecx, var_AC
  loc_005CB4E1: push eax
  loc_005CB4E2: lea edx, var_4C
  loc_005CB4E5: push ecx
  loc_005CB4E6: push edx
  loc_005CB4E7: call __vbaVarCat
  loc_005CB4E9: push eax
  loc_005CB4EA: lea eax, var_5C
  loc_005CB4ED: lea ecx, var_6C
  loc_005CB4F0: push eax
  loc_005CB4F1: push ecx
  loc_005CB4F2: call __vbaVarCat
  loc_005CB4F4: push eax
  loc_005CB4F5: lea edx, var_CC
  loc_005CB4FB: lea eax, var_7C
  loc_005CB4FE: push edx
  loc_005CB4FF: push eax
  loc_005CB500: call __vbaVarCat
  loc_005CB502: lea ecx, var_18
  loc_005CB505: push eax
  loc_005CB506: push ecx
  loc_005CB507: call [004011B0h] ; __vbaStrVarVal
  loc_005CB50D: mov edx, [0061A13Ch]
  loc_005CB513: push eax
  loc_005CB514: mov eax, var_FC
  loc_005CB51A: push edx
  loc_005CB51B: call [eax+0000005Ch]
  loc_005CB51E: cmp eax, edi
  loc_005CB520: fnclex
  loc_005CB522: jge 005CB539h
  loc_005CB524: mov ecx, [0061A13Ch]
  loc_005CB52A: push 0000005Ch
  loc_005CB52C: push 0041E928h
  loc_005CB531: push ecx
  loc_005CB532: push eax
  loc_005CB533: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB539: lea ecx, var_18
  loc_005CB53C: call [004012ACh] ; __vbaFreeStr
  loc_005CB542: lea edx, var_7C
  loc_005CB545: mov ebx, [00401038h] ; __vbaFreeVarList
  loc_005CB54B: lea eax, var_6C
  loc_005CB54E: push edx
  loc_005CB54F: lea ecx, var_5C
  loc_005CB552: push eax
  loc_005CB553: lea edx, var_4C
  loc_005CB556: push ecx
  loc_005CB557: lea eax, var_3C
  loc_005CB55A: push edx
  loc_005CB55B: lea ecx, var_2C
  loc_005CB55E: push eax
  loc_005CB55F: push ecx
  loc_005CB560: push 00000006h
  loc_005CB562: call ebx
  loc_005CB564: mov eax, Me
  loc_005CB567: add esp, 0000001Ch
  loc_005CB56A: mov edx, [eax]
  loc_005CB56C: push eax
  loc_005CB56D: call [edx+00000304h]
  loc_005CB573: push eax
  loc_005CB574: lea eax, var_1C
  loc_005CB577: push eax
  loc_005CB578: call [004010A0h] ; __vbaObjSet
  loc_005CB57E: mov esi, eax
  loc_005CB580: lea edx, var_18
  loc_005CB583: push edx
  loc_005CB584: push esi
  loc_005CB585: mov ecx, [esi]
  loc_005CB587: call [ecx+000000A0h]
  loc_005CB58D: cmp eax, edi
  loc_005CB58F: fnclex
  loc_005CB591: jge 005CB5A5h
  loc_005CB593: push 000000A0h
  loc_005CB598: push 0041E5E8h
  loc_005CB59D: push esi
  loc_005CB59E: push eax
  loc_005CB59F: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB5A5: mov eax, var_18
  loc_005CB5A8: lea ecx, var_3C
  loc_005CB5AB: mov var_24, eax
  loc_005CB5AE: lea eax, var_2C
  loc_005CB5B1: push eax
  loc_005CB5B2: push ecx
  loc_005CB5B3: mov var_18, edi
  loc_005CB5B6: mov var_2C, 00000008h
  loc_005CB5BD: call [004010D4h] ; rtcTrimVar
  loc_005CB5C3: lea edx, var_3C
  loc_005CB5C6: lea eax, var_8C
  loc_005CB5CC: push edx
  loc_005CB5CD: push eax
  loc_005CB5CE: mov var_84, 0041E5D4h
  loc_005CB5D8: mov var_8C, 00008008h
  loc_005CB5E2: call [00401110h] ; __vbaVarTstEq
  loc_005CB5E8: lea ecx, var_1C
  loc_005CB5EB: mov si, ax
  loc_005CB5EE: call [004012B0h] ; __vbaFreeObj
  loc_005CB5F4: lea ecx, var_3C
  loc_005CB5F7: lea edx, var_2C
  loc_005CB5FA: push ecx
  loc_005CB5FB: push edx
  loc_005CB5FC: push 00000002h
  loc_005CB5FE: call ebx
  loc_005CB600: add esp, 0000000Ch
  loc_005CB603: cmp si, di
  loc_005CB606: jnz 005CBA38h
  loc_005CB60C: lea ebx, var_1C
  loc_005CB60F: mov ecx, 0000000Ah
  loc_005CB614: push ebx
  loc_005CB615: mov var_AC, ecx
  loc_005CB61B: sub esp, 00000010h
  loc_005CB61E: mov var_9C, ecx
  loc_005CB624: mov ebx, esp
  loc_005CB626: mov eax, 80020004h
  loc_005CB62B: mov var_A4, eax
  loc_005CB631: mov edx, eax
  loc_005CB633: mov [ebx], ecx
  loc_005CB635: mov ecx, var_A8
  loc_005CB63B: sub esp, 00000010h
  loc_005CB63E: mov var_94, edx
  loc_005CB644: mov [ebx+00000004h], ecx
  loc_005CB647: mov ecx, esp
  loc_005CB649: sub esp, 00000010h
  loc_005CB64C: mov var_8C, 00000003h
  loc_005CB656: mov [ebx+00000008h], eax
  loc_005CB659: mov eax, var_A0
  loc_005CB65F: mov esi, [0061A13Ch]
  loc_005CB665: mov var_84, 00000002h
  loc_005CB66F: mov [ebx+0000000Ch], eax
  loc_005CB672: mov eax, var_9C
  loc_005CB678: mov [ecx], eax
  loc_005CB67A: mov eax, var_98
  loc_005CB680: mov esi, [esi]
  loc_005CB682: mov [ecx+00000004h], eax
  loc_005CB685: mov eax, esp
  loc_005CB687: push 0042BF60h ; "Select * From LuckyNo"
  loc_005CB68C: mov [ecx+00000008h], edx
  loc_005CB68F: mov edx, var_90
  loc_005CB695: mov [ecx+0000000Ch], edx
  loc_005CB698: mov ecx, var_8C
  loc_005CB69E: mov edx, var_88
  loc_005CB6A4: mov [eax], ecx
  loc_005CB6A6: mov ecx, var_84
  loc_005CB6AC: mov [eax+00000004h], edx
  loc_005CB6AF: mov edx, var_80
  loc_005CB6B2: mov [eax+00000008h], ecx
  loc_005CB6B5: mov [eax+0000000Ch], edx
  loc_005CB6B8: mov eax, [0061A13Ch]
  loc_005CB6BD: push eax
  loc_005CB6BE: call [esi+000000BCh]
  loc_005CB6C4: cmp eax, edi
  loc_005CB6C6: fnclex
  loc_005CB6C8: jge 005CB6E2h
  loc_005CB6CA: mov ecx, [0061A13Ch]
  loc_005CB6D0: push 000000BCh
  loc_005CB6D5: push 0041E928h
  loc_005CB6DA: push ecx
  loc_005CB6DB: push eax
  loc_005CB6DC: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB6E2: mov edx, Me
  loc_005CB6E5: mov eax, var_1C
  loc_005CB6E8: push eax
  loc_005CB6E9: lea esi, [edx+00000034h]
  loc_005CB6EC: push esi
  loc_005CB6ED: call [004010B8h] ; __vbaObjSetAddref
  loc_005CB6F3: lea ecx, var_1C
  loc_005CB6F6: call [004012B0h] ; __vbaFreeObj
  loc_005CB6FC: mov eax, [esi]
  loc_005CB6FE: push eax
  loc_005CB6FF: mov ecx, [eax]
  loc_005CB701: call [ecx+000000C0h]
  loc_005CB707: cmp eax, edi
  loc_005CB709: fnclex
  loc_005CB70B: jge 005CB721h
  loc_005CB70D: mov edx, [esi]
  loc_005CB70F: push 000000C0h
  loc_005CB714: push 0041E938h
  loc_005CB719: push edx
  loc_005CB71A: push eax
  loc_005CB71B: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB721: lea eax, var_8C
  loc_005CB727: lea ecx, var_2C
  loc_005CB72A: push eax
  loc_005CB72B: push ecx
  loc_005CB72C: mov var_84, 0061A05Ch
  loc_005CB736: mov var_8C, 00004008h
  loc_005CB740: call [004010D4h] ; rtcTrimVar
  loc_005CB746: mov ebx, var_2C
  loc_005CB749: sub esp, 00000010h
  loc_005CB74C: mov ecx, esp
  loc_005CB74E: sub esp, 00000010h
  loc_005CB751: mov eax, [esi]
  loc_005CB753: mov var_9C, 00000008h
  loc_005CB75D: mov [ecx], ebx
  loc_005CB75F: mov ebx, var_28
  loc_005CB762: mov var_94, 0041FBA8h ; "OnDate"
  loc_005CB76C: mov edx, [eax]
  loc_005CB76E: mov [ecx+00000004h], ebx
  loc_005CB771: mov ebx, var_24
  loc_005CB774: mov [ecx+00000008h], ebx
  loc_005CB777: mov ebx, var_20
  loc_005CB77A: mov [ecx+0000000Ch], ebx
  loc_005CB77D: mov ebx, var_9C
  loc_005CB783: mov ecx, esp
  loc_005CB785: push eax
  loc_005CB786: mov [ecx], ebx
  loc_005CB788: mov ebx, var_98
  loc_005CB78E: mov [ecx+00000004h], ebx
  loc_005CB791: mov ebx, var_94
  loc_005CB797: mov [ecx+00000008h], ebx
  loc_005CB79A: mov ebx, var_90
  loc_005CB7A0: mov [ecx+0000000Ch], ebx
  loc_005CB7A3: call [edx+00000128h]
  loc_005CB7A9: cmp eax, edi
  loc_005CB7AB: fnclex
  loc_005CB7AD: jge 005CB7C3h
  loc_005CB7AF: mov edx, [esi]
  loc_005CB7B1: push 00000128h
  loc_005CB7B6: push 0041E938h
  loc_005CB7BB: push edx
  loc_005CB7BC: push eax
  loc_005CB7BD: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB7C3: lea ecx, var_2C
  loc_005CB7C6: call [00401020h] ; __vbaFreeVar
  loc_005CB7CC: lea eax, var_8C
  loc_005CB7D2: lea ecx, var_2C
  loc_005CB7D5: push eax
  loc_005CB7D6: push ecx
  loc_005CB7D7: mov var_84, 0061A060h
  loc_005CB7E1: mov var_8C, 00004008h
  loc_005CB7EB: call [004010D4h] ; rtcTrimVar
  loc_005CB7F1: mov ebx, var_2C
  loc_005CB7F4: sub esp, 00000010h
  loc_005CB7F7: mov ecx, esp
  loc_005CB7F9: sub esp, 00000010h
  loc_005CB7FC: mov eax, [esi]
  loc_005CB7FE: mov var_9C, 00000008h
  loc_005CB808: mov [ecx], ebx
  loc_005CB80A: mov ebx, var_28
  loc_005CB80D: mov var_94, 0041EDE8h ; "AMPM"
  loc_005CB817: mov edx, [eax]
  loc_005CB819: mov [ecx+00000004h], ebx
  loc_005CB81C: mov ebx, var_24
  loc_005CB81F: mov [ecx+00000008h], ebx
  loc_005CB822: mov ebx, var_20
  loc_005CB825: mov [ecx+0000000Ch], ebx
  loc_005CB828: mov ebx, var_9C
  loc_005CB82E: mov ecx, esp
  loc_005CB830: push eax
  loc_005CB831: mov [ecx], ebx
  loc_005CB833: mov ebx, var_98
  loc_005CB839: mov [ecx+00000004h], ebx
  loc_005CB83C: mov ebx, var_94
  loc_005CB842: mov [ecx+00000008h], ebx
  loc_005CB845: mov ebx, var_90
  loc_005CB84B: mov [ecx+0000000Ch], ebx
  loc_005CB84E: call [edx+00000128h]
  loc_005CB854: cmp eax, edi
  loc_005CB856: fnclex
  loc_005CB858: jge 005CB86Eh
  loc_005CB85A: mov edx, [esi]
  loc_005CB85C: push 00000128h
  loc_005CB861: push 0041E938h
  loc_005CB866: push edx
  loc_005CB867: push eax
  loc_005CB868: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB86E: lea ecx, var_2C
  loc_005CB871: call [00401020h] ; __vbaFreeVar
  loc_005CB877: mov eax, Me
  loc_005CB87A: push eax
  loc_005CB87B: mov ecx, [eax]
  loc_005CB87D: call [ecx+00000304h]
  loc_005CB883: lea edx, var_1C
  loc_005CB886: push eax
  loc_005CB887: push edx
  loc_005CB888: call [004010A0h] ; __vbaObjSet
  loc_005CB88E: mov ebx, eax
  loc_005CB890: lea ecx, var_18
  loc_005CB893: push ecx
  loc_005CB894: push ebx
  loc_005CB895: mov eax, [ebx]
  loc_005CB897: call [eax+000000A0h]
  loc_005CB89D: cmp eax, edi
  loc_005CB89F: fnclex
  loc_005CB8A1: jge 005CB8B5h
  loc_005CB8A3: push 000000A0h
  loc_005CB8A8: push 0041E5E8h
  loc_005CB8AD: push ebx
  loc_005CB8AE: push eax
  loc_005CB8AF: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB8B5: mov eax, var_18
  loc_005CB8B8: lea edx, var_2C
  loc_005CB8BB: mov var_24, eax
  loc_005CB8BE: lea eax, var_3C
  loc_005CB8C1: mov ebx, 00000008h
  loc_005CB8C6: push edx
  loc_005CB8C7: push eax
  loc_005CB8C8: mov var_18, edi
  loc_005CB8CB: mov var_2C, ebx
  loc_005CB8CE: call [004010D4h] ; rtcTrimVar
  loc_005CB8D4: sub esp, 00000010h
  loc_005CB8D7: mov var_8C, ebx
  loc_005CB8DD: mov ebx, var_3C
  loc_005CB8E0: mov edx, esp
  loc_005CB8E2: sub esp, 00000010h
  loc_005CB8E5: mov eax, [esi]
  loc_005CB8E7: mov [edx], ebx
  loc_005CB8E9: mov ebx, var_38
  loc_005CB8EC: mov var_84, 004209C4h ; "LNo"
  loc_005CB8F6: mov ecx, [eax]
  loc_005CB8F8: mov [edx+00000004h], ebx
  loc_005CB8FB: mov ebx, var_34
  loc_005CB8FE: mov [edx+00000008h], ebx
  loc_005CB901: mov ebx, var_30
  loc_005CB904: mov [edx+0000000Ch], ebx
  loc_005CB907: mov ebx, var_8C
  loc_005CB90D: mov edx, esp
  loc_005CB90F: push eax
  loc_005CB910: mov [edx], ebx
  loc_005CB912: mov ebx, var_88
  loc_005CB918: mov [edx+00000004h], ebx
  loc_005CB91B: mov ebx, var_84
  loc_005CB921: mov [edx+00000008h], ebx
  loc_005CB924: mov ebx, var_80
  loc_005CB927: mov [edx+0000000Ch], ebx
  loc_005CB92A: call [ecx+00000128h]
  loc_005CB930: cmp eax, edi
  loc_005CB932: fnclex
  loc_005CB934: jge 005CB94Eh
  loc_005CB936: mov ecx, [esi]
  loc_005CB938: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_005CB93E: push 00000128h
  loc_005CB943: push 0041E938h
  loc_005CB948: push ecx
  loc_005CB949: push eax
  loc_005CB94A: call ebx
  loc_005CB94C: jmp 005CB954h
  loc_005CB94E: mov ebx, [00401074h] ; __vbaHresultCheckObj
  loc_005CB954: lea ecx, var_1C
  loc_005CB957: call [004012B0h] ; __vbaFreeObj
  loc_005CB95D: lea edx, var_3C
  loc_005CB960: lea eax, var_2C
  loc_005CB963: push edx
  loc_005CB964: push eax
  loc_005CB965: push 00000002h
  loc_005CB967: call [00401038h] ; __vbaFreeVarList
  loc_005CB96D: mov eax, [esi]
  loc_005CB96F: add esp, 0000000Ch
  loc_005CB972: mov ecx, [eax]
  loc_005CB974: push edi
  loc_005CB975: push 00000001h
  loc_005CB977: push eax
  loc_005CB978: call [ecx+00000164h]
  loc_005CB97E: cmp eax, edi
  loc_005CB980: fnclex
  loc_005CB982: jge 005CB994h
  loc_005CB984: mov edx, [esi]
  loc_005CB986: push 00000164h
  loc_005CB98B: push 0041E938h
  loc_005CB990: push edx
  loc_005CB991: push eax
  loc_005CB992: call ebx
  loc_005CB994: mov eax, [esi]
  loc_005CB996: push eax
  loc_005CB997: mov ecx, [eax]
  loc_005CB999: call [ecx+000000C4h]
  loc_005CB99F: cmp eax, edi
  loc_005CB9A1: fnclex
  loc_005CB9A3: jge 005CB9B5h
  loc_005CB9A5: mov edx, [esi]
  loc_005CB9A7: push 000000C4h
  loc_005CB9AC: push 0041E938h
  loc_005CB9B1: push edx
  loc_005CB9B2: push eax
  loc_005CB9B3: call ebx
  loc_005CB9B5: push 0041E938h
  loc_005CB9BA: push edi
  loc_005CB9BB: call [00401274h] ; __vbaCastObj
  loc_005CB9C1: push eax
  loc_005CB9C2: lea eax, var_1C
  loc_005CB9C5: push eax
  loc_005CB9C6: call [004010A0h] ; __vbaObjSet
  loc_005CB9CC: mov ebx, [004010B8h] ; __vbaObjSetAddref
  loc_005CB9D2: push eax
  loc_005CB9D3: push esi
  loc_005CB9D4: call ebx
  loc_005CB9D6: lea ecx, var_1C
  loc_005CB9D9: call [004012B0h] ; __vbaFreeObj
  loc_005CB9DF: cmp [0061B394h], edi
  loc_005CB9E5: jnz 005CB9F7h
  loc_005CB9E7: push 0061B394h
  loc_005CB9EC: push 0041E4A0h
  loc_005CB9F1: call [004011DCh] ; __vbaNew2
  loc_005CB9F7: mov esi, [0061B394h]
  loc_005CB9FD: mov ecx, Me
  loc_005CBA00: lea eax, var_1C
  loc_005CBA03: push ecx
  loc_005CBA04: mov edx, [esi]
  loc_005CBA06: push eax
  loc_005CBA07: mov var_100, edx
  loc_005CBA0D: call ebx
  loc_005CBA0F: mov ecx, var_100
  loc_005CBA15: push eax
  loc_005CBA16: push esi
  loc_005CBA17: call [ecx+00000010h]
  loc_005CBA1A: cmp eax, edi
  loc_005CBA1C: fnclex
  loc_005CBA1E: jge 005CBA2Fh
  loc_005CBA20: push 00000010h
  loc_005CBA22: push 0041E490h
  loc_005CBA27: push esi
  loc_005CBA28: push eax
  loc_005CBA29: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBA2F: lea ecx, var_1C
  loc_005CBA32: call [004012B0h] ; __vbaFreeObj
  loc_005CBA38: mov var_4, edi
  loc_005CBA3B: push 005CBA79h
  loc_005CBA40: jmp 005CBA78h
  loc_005CBA42: lea ecx, var_18
  loc_005CBA45: call [004012ACh] ; __vbaFreeStr
  loc_005CBA4B: lea ecx, var_1C
  loc_005CBA4E: call [004012B0h] ; __vbaFreeObj
  loc_005CBA54: lea edx, var_7C
  loc_005CBA57: lea eax, var_6C
  loc_005CBA5A: push edx
  loc_005CBA5B: lea ecx, var_5C
  loc_005CBA5E: push eax
  loc_005CBA5F: lea edx, var_4C
  loc_005CBA62: push ecx
  loc_005CBA63: lea eax, var_3C
  loc_005CBA66: push edx
  loc_005CBA67: lea ecx, var_2C
  loc_005CBA6A: push eax
  loc_005CBA6B: push ecx
  loc_005CBA6C: push 00000006h
  loc_005CBA6E: call [00401038h] ; __vbaFreeVarList
  loc_005CBA74: add esp, 0000001Ch
  loc_005CBA77: ret
  loc_005CBA78: ret
  loc_005CBA79: mov eax, Me
  loc_005CBA7C: push eax
  loc_005CBA7D: mov edx, [eax]
  loc_005CBA7F: call [edx+00000008h]
  loc_005CBA82: mov eax, var_4
  loc_005CBA85: mov ecx, var_14
  loc_005CBA88: pop edi
  loc_005CBA89: pop esi
  loc_005CBA8A: mov fs:[00000000h], ecx
  loc_005CBA91: pop ebx
  loc_005CBA92: mov esp, ebp
  loc_005CBA94: pop ebp
  loc_005CBA95: retn 0004h
End Sub

Private Sub txtLuckyNo_KeyPress(KeyAscii As Integer) '5CBF50
  loc_005CBF50: push ebp
  loc_005CBF51: mov ebp, esp
  loc_005CBF53: sub esp, 0000000Ch
  loc_005CBF56: push 00403B36h ; __vbaExceptHandler
  loc_005CBF5B: mov eax, fs:[00000000h]
  loc_005CBF61: push eax
  loc_005CBF62: mov fs:[00000000h], esp
  loc_005CBF69: sub esp, 00000014h
  loc_005CBF6C: push ebx
  loc_005CBF6D: push esi
  loc_005CBF6E: push edi
  loc_005CBF6F: mov var_C, esp
  loc_005CBF72: mov var_8, 004030D8h
  loc_005CBF79: mov esi, Me
  loc_005CBF7C: mov eax, esi
  loc_005CBF7E: and eax, 00000001h
  loc_005CBF81: mov var_4, eax
  loc_005CBF84: and esi, FFFFFFFEh
  loc_005CBF87: push esi
  loc_005CBF88: mov Me, esi
  loc_005CBF8B: mov ecx, [esi]
  loc_005CBF8D: call [ecx+00000004h]
  loc_005CBF90: mov edx, KeyAscii
  loc_005CBF93: xor edi, edi
  loc_005CBF95: mov var_18, edi
  loc_005CBF98: cmp [edx], 000Dh
  loc_005CBF9C: jnz 005CBFDEh
  loc_005CBF9E: mov eax, [esi]
  loc_005CBFA0: push esi
  loc_005CBFA1: call [eax+00000300h]
  loc_005CBFA7: lea ecx, var_18
  loc_005CBFAA: push eax
  loc_005CBFAB: push ecx
  loc_005CBFAC: call [004010A0h] ; __vbaObjSet
  loc_005CBFB2: mov esi, eax
  loc_005CBFB4: push esi
  loc_005CBFB5: mov edx, [esi]
  loc_005CBFB7: call [edx+000001A4h]
  loc_005CBFBD: cmp eax, edi
  loc_005CBFBF: fnclex
  loc_005CBFC1: jge 005CBFD5h
  loc_005CBFC3: push 000001A4h
  loc_005CBFC8: push 0041EAACh
  loc_005CBFCD: push esi
  loc_005CBFCE: push eax
  loc_005CBFCF: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBFD5: lea ecx, var_18
  loc_005CBFD8: call [004012B0h] ; __vbaFreeObj
  loc_005CBFDE: mov var_4, edi
  loc_005CBFE1: push 005CBFF3h
  loc_005CBFE6: jmp 005CBFF2h
  loc_005CBFE8: lea ecx, var_18
  loc_005CBFEB: call [004012B0h] ; __vbaFreeObj
  loc_005CBFF1: ret
  loc_005CBFF2: ret
  loc_005CBFF3: mov eax, Me
  loc_005CBFF6: push eax
  loc_005CBFF7: mov ecx, [eax]
  loc_005CBFF9: call [ecx+00000008h]
  loc_005CBFFC: mov eax, var_4
  loc_005CBFFF: mov ecx, var_14
  loc_005CC002: pop edi
  loc_005CC003: pop esi
  loc_005CC004: mov fs:[00000000h], ecx
  loc_005CC00B: pop ebx
  loc_005CC00C: mov esp, ebp
  loc_005CC00E: pop ebp
  loc_005CC00F: retn 0008h
End Sub

Private Sub cmdClose_Click() '5CB2C0
  loc_005CB2C0: push ebp
  loc_005CB2C1: mov ebp, esp
  loc_005CB2C3: sub esp, 0000000Ch
  loc_005CB2C6: push 00403B36h ; __vbaExceptHandler
  loc_005CB2CB: mov eax, fs:[00000000h]
  loc_005CB2D1: push eax
  loc_005CB2D2: mov fs:[00000000h], esp
  loc_005CB2D9: sub esp, 00000018h
  loc_005CB2DC: push ebx
  loc_005CB2DD: push esi
  loc_005CB2DE: push edi
  loc_005CB2DF: mov var_C, esp
  loc_005CB2E2: mov var_8, 004030A8h
  loc_005CB2E9: mov edi, Me
  loc_005CB2EC: mov eax, edi
  loc_005CB2EE: and eax, 00000001h
  loc_005CB2F1: mov var_4, eax
  loc_005CB2F4: and edi, FFFFFFFEh
  loc_005CB2F7: push edi
  loc_005CB2F8: mov Me, edi
  loc_005CB2FB: mov ecx, [edi]
  loc_005CB2FD: call [ecx+00000004h]
  loc_005CB300: mov eax, [0061B394h]
  loc_005CB305: xor ebx, ebx
  loc_005CB307: cmp eax, ebx
  loc_005CB309: mov var_18, ebx
  loc_005CB30C: jnz 005CB31Eh
  loc_005CB30E: push 0061B394h
  loc_005CB313: push 0041E4A0h
  loc_005CB318: call [004011DCh] ; __vbaNew2
  loc_005CB31E: mov esi, [0061B394h]
  loc_005CB324: lea eax, var_18
  loc_005CB327: push edi
  loc_005CB328: push eax
  loc_005CB329: mov edx, [esi]
  loc_005CB32B: mov var_2C, edx
  loc_005CB32E: call [004010B8h] ; __vbaObjSetAddref
  loc_005CB334: mov ecx, var_2C
  loc_005CB337: push eax
  loc_005CB338: push esi
  loc_005CB339: call [ecx+00000010h]
  loc_005CB33C: cmp eax, ebx
  loc_005CB33E: fnclex
  loc_005CB340: jge 005CB351h
  loc_005CB342: push 00000010h
  loc_005CB344: push 0041E490h
  loc_005CB349: push esi
  loc_005CB34A: push eax
  loc_005CB34B: call [00401074h] ; __vbaHresultCheckObj
  loc_005CB351: lea ecx, var_18
  loc_005CB354: call [004012B0h] ; __vbaFreeObj
  loc_005CB35A: mov var_4, ebx
  loc_005CB35D: push 005CB36Fh
  loc_005CB362: jmp 005CB36Eh
  loc_005CB364: lea ecx, var_18
  loc_005CB367: call [004012B0h] ; __vbaFreeObj
  loc_005CB36D: ret
  loc_005CB36E: ret
  loc_005CB36F: mov eax, Me
  loc_005CB372: push eax
  loc_005CB373: mov edx, [eax]
  loc_005CB375: call [edx+00000008h]
  loc_005CB378: mov eax, var_4
  loc_005CB37B: mov ecx, var_14
  loc_005CB37E: pop edi
  loc_005CB37F: pop esi
  loc_005CB380: mov fs:[00000000h], ecx
  loc_005CB387: pop ebx
  loc_005CB388: mov esp, ebp
  loc_005CB38A: pop ebp
  loc_005CB38B: retn 0004h
End Sub

Private Sub Form_Load() '5CBAA0
  loc_005CBAA0: push ebp
  loc_005CBAA1: mov ebp, esp
  loc_005CBAA3: sub esp, 0000000Ch
  loc_005CBAA6: push 00403B36h ; __vbaExceptHandler
  loc_005CBAAB: mov eax, fs:[00000000h]
  loc_005CBAB1: push eax
  loc_005CBAB2: mov fs:[00000000h], esp
  loc_005CBAB9: sub esp, 0000011Ch
  loc_005CBABF: push ebx
  loc_005CBAC0: push esi
  loc_005CBAC1: push edi
  loc_005CBAC2: mov var_C, esp
  loc_005CBAC5: mov var_8, 004030C8h
  loc_005CBACC: mov eax, Me
  loc_005CBACF: mov ecx, eax
  loc_005CBAD1: and ecx, 00000001h
  loc_005CBAD4: mov var_4, ecx
  loc_005CBAD7: and al, FEh
  loc_005CBAD9: push eax
  loc_005CBADA: mov Me, eax
  loc_005CBADD: mov edx, [eax]
  loc_005CBADF: call [edx+00000004h]
  loc_005CBAE2: mov edi, [004010D4h] ; rtcTrimVar
  loc_005CBAE8: lea eax, var_94
  loc_005CBAEE: xor esi, esi
  loc_005CBAF0: lea ecx, var_34
  loc_005CBAF3: mov ebx, 00004008h
  loc_005CBAF8: push eax
  loc_005CBAF9: mov var_94, esi
  loc_005CBAFF: push ecx
  loc_005CBB00: mov var_18, esi
  loc_005CBB03: mov var_1C, esi
  loc_005CBB06: mov var_20, esi
  loc_005CBB09: mov var_24, esi
  loc_005CBB0C: mov var_34, esi
  loc_005CBB0F: mov var_44, esi
  loc_005CBB12: mov var_54, esi
  loc_005CBB15: mov var_64, esi
  loc_005CBB18: mov var_74, esi
  loc_005CBB1B: mov var_84, esi
  loc_005CBB21: mov var_A4, esi
  loc_005CBB27: mov var_B4, esi
  loc_005CBB2D: mov var_C4, esi
  loc_005CBB33: mov var_D4, esi
  loc_005CBB39: mov var_108, esi
  loc_005CBB3F: mov var_10C, esi
  loc_005CBB45: mov var_8C, 0061A05Ch
  loc_005CBB4F: mov var_94, ebx
  loc_005CBB55: call edi
  loc_005CBB57: lea edx, var_C4
  loc_005CBB5D: lea eax, var_64
  loc_005CBB60: push edx
  loc_005CBB61: push eax
  loc_005CBB62: mov var_BC, 0061A060h
  loc_005CBB6C: mov var_C4, ebx
  loc_005CBB72: call edi
  loc_005CBB74: mov edi, 00000008h
  loc_005CBB79: mov var_9C, 00420954h ; "Select * From LuckyNo Where OnDate=#"
  loc_005CBB83: mov var_A4, edi
  loc_005CBB89: mov var_B4, edi
  loc_005CBB8F: mov var_D4, edi
  loc_005CBB95: mov edi, [0061A13Ch]
  loc_005CBB9B: mov var_AC, 004209A4h ; "# And AMPM='"
  loc_005CBBA5: mov var_CC, 0041E890h ; "'"
  loc_005CBBAF: mov ebx, [edi]
  loc_005CBBB1: lea edi, var_1C
  loc_005CBBB4: push edi
  loc_005CBBB5: mov ecx, 0000000Ah
  loc_005CBBBA: sub esp, 00000010h
  loc_005CBBBD: mov var_F4, ecx
  loc_005CBBC3: mov edi, esp
  loc_005CBBC5: mov eax, 80020004h
  loc_005CBBCA: mov edx, eax
  loc_005CBBCC: sub esp, 00000010h
  loc_005CBBCF: mov [edi], ecx
  loc_005CBBD1: mov ecx, var_100
  loc_005CBBD7: mov [edi+00000004h], ecx
  loc_005CBBDA: mov ecx, esp
  loc_005CBBDC: sub esp, 00000010h
  loc_005CBBDF: mov [edi+00000008h], eax
  loc_005CBBE2: mov eax, var_F8
  loc_005CBBE8: mov [edi+0000000Ch], eax
  loc_005CBBEB: mov eax, var_F4
  loc_005CBBF1: mov [ecx], eax
  loc_005CBBF3: mov eax, var_F0
  loc_005CBBF9: mov [ecx+00000004h], eax
  loc_005CBBFC: mov [ecx+00000008h], edx
  loc_005CBBFF: mov edx, var_E8
  loc_005CBC05: mov [ecx+0000000Ch], edx
  loc_005CBC08: mov edx, var_E0
  loc_005CBC0E: mov ecx, esp
  loc_005CBC10: mov eax, 00000003h
  loc_005CBC15: mov edi, [004011B4h] ; __vbaVarCat
  loc_005CBC1B: mov [ecx], eax
  loc_005CBC1D: mov eax, 00000002h
  loc_005CBC22: mov [ecx+00000004h], edx
  loc_005CBC25: lea edx, var_34
  loc_005CBC28: mov [ecx+00000008h], eax
  loc_005CBC2B: mov eax, var_D8
  loc_005CBC31: mov [ecx+0000000Ch], eax
  loc_005CBC34: lea ecx, var_A4
  loc_005CBC3A: push ecx
  loc_005CBC3B: lea eax, var_44
  loc_005CBC3E: push edx
  loc_005CBC3F: push eax
  loc_005CBC40: call edi
  loc_005CBC42: lea ecx, var_B4
  loc_005CBC48: push eax
  loc_005CBC49: lea edx, var_54
  loc_005CBC4C: push ecx
  loc_005CBC4D: push edx
  loc_005CBC4E: call edi
  loc_005CBC50: push eax
  loc_005CBC51: lea eax, var_64
  loc_005CBC54: lea ecx, var_74
  loc_005CBC57: push eax
  loc_005CBC58: push ecx
  loc_005CBC59: call edi
  loc_005CBC5B: push eax
  loc_005CBC5C: lea edx, var_D4
  loc_005CBC62: lea eax, var_84
  loc_005CBC68: push edx
  loc_005CBC69: push eax
  loc_005CBC6A: call edi
  loc_005CBC6C: lea ecx, var_18
  loc_005CBC6F: push eax
  loc_005CBC70: push ecx
  loc_005CBC71: call [004011B0h] ; __vbaStrVarVal
  loc_005CBC77: mov edx, [0061A13Ch]
  loc_005CBC7D: push eax
  loc_005CBC7E: push edx
  loc_005CBC7F: call [ebx+000000BCh]
  loc_005CBC85: cmp eax, esi
  loc_005CBC87: fnclex
  loc_005CBC89: jge 005CBCA3h
  loc_005CBC8B: mov ecx, [0061A13Ch]
  loc_005CBC91: push 000000BCh
  loc_005CBC96: push 0041E928h
  loc_005CBC9B: push ecx
  loc_005CBC9C: push eax
  loc_005CBC9D: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBCA3: mov ebx, Me
  loc_005CBCA6: mov edx, var_1C
  loc_005CBCA9: push edx
  loc_005CBCAA: lea edi, [ebx+00000034h]
  loc_005CBCAD: push edi
  loc_005CBCAE: call [004010B8h] ; __vbaObjSetAddref
  loc_005CBCB4: lea ecx, var_18
  loc_005CBCB7: call [004012ACh] ; __vbaFreeStr
  loc_005CBCBD: lea ecx, var_1C
  loc_005CBCC0: call [004012B0h] ; __vbaFreeObj
  loc_005CBCC6: lea eax, var_84
  loc_005CBCCC: lea ecx, var_74
  loc_005CBCCF: push eax
  loc_005CBCD0: lea edx, var_64
  loc_005CBCD3: push ecx
  loc_005CBCD4: lea eax, var_54
  loc_005CBCD7: push edx
  loc_005CBCD8: lea ecx, var_44
  loc_005CBCDB: push eax
  loc_005CBCDC: lea edx, var_34
  loc_005CBCDF: push ecx
  loc_005CBCE0: push edx
  loc_005CBCE1: push 00000006h
  loc_005CBCE3: call [00401038h] ; __vbaFreeVarList
  loc_005CBCE9: mov eax, [edi]
  loc_005CBCEB: add esp, 0000001Ch
  loc_005CBCEE: lea edx, var_108
  loc_005CBCF4: mov ecx, [eax]
  loc_005CBCF6: push edx
  loc_005CBCF7: push eax
  loc_005CBCF8: call [ecx+00000020h]
  loc_005CBCFB: cmp eax, esi
  loc_005CBCFD: fnclex
  loc_005CBCFF: jge 005CBD12h
  loc_005CBD01: mov ecx, [edi]
  loc_005CBD03: push 00000020h
  loc_005CBD05: push 0041E938h
  loc_005CBD0A: push ecx
  loc_005CBD0B: push eax
  loc_005CBD0C: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBD12: mov eax, [edi]
  loc_005CBD14: lea ecx, var_10C
  loc_005CBD1A: push ecx
  loc_005CBD1B: push eax
  loc_005CBD1C: mov edx, [eax]
  loc_005CBD1E: call [edx+00000034h]
  loc_005CBD21: cmp eax, esi
  loc_005CBD23: fnclex
  loc_005CBD25: jge 005CBD38h
  loc_005CBD27: mov edx, [edi]
  loc_005CBD29: push 00000034h
  loc_005CBD2B: push 0041E938h
  loc_005CBD30: push edx
  loc_005CBD31: push eax
  loc_005CBD32: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBD38: xor eax, eax
  loc_005CBD3A: cmp var_10C, si
  loc_005CBD41: setz al
  loc_005CBD44: xor ecx, ecx
  loc_005CBD46: cmp var_108, si
  loc_005CBD4D: setz cl
  loc_005CBD50: or eax, ecx
  loc_005CBD52: jz 005CBE88h
  loc_005CBD58: mov edx, [ebx]
  loc_005CBD5A: push ebx
  loc_005CBD5B: call [edx+00000304h]
  loc_005CBD61: push eax
  loc_005CBD62: lea eax, var_24
  loc_005CBD65: push eax
  loc_005CBD66: call [004010A0h] ; __vbaObjSet
  loc_005CBD6C: mov var_11C, eax
  loc_005CBD72: mov eax, [edi]
  loc_005CBD74: lea edx, var_1C
  loc_005CBD77: mov ecx, [eax]
  loc_005CBD79: push edx
  loc_005CBD7A: push eax
  loc_005CBD7B: call [ecx+000000B4h]
  loc_005CBD81: cmp eax, esi
  loc_005CBD83: fnclex
  loc_005CBD85: jge 005CBD9Bh
  loc_005CBD87: mov ecx, [edi]
  loc_005CBD89: push 000000B4h
  loc_005CBD8E: push 0041E938h
  loc_005CBD93: push ecx
  loc_005CBD94: push eax
  loc_005CBD95: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBD9B: lea ebx, var_20
  loc_005CBD9E: mov eax, var_1C
  loc_005CBDA1: push ebx
  loc_005CBDA2: mov ecx, 00000008h
  loc_005CBDA7: sub esp, 00000010h
  loc_005CBDAA: mov var_94, ecx
  loc_005CBDB0: mov ebx, esp
  loc_005CBDB2: mov var_8C, 004209C4h ; "LNo"
  loc_005CBDBC: mov edx, [eax]
  loc_005CBDBE: push eax
  loc_005CBDBF: mov [ebx], ecx
  loc_005CBDC1: mov ecx, var_90
  loc_005CBDC7: mov var_114, eax
  loc_005CBDCD: mov [ebx+00000004h], ecx
  loc_005CBDD0: mov ecx, var_8C
  loc_005CBDD6: mov [ebx+00000008h], ecx
  loc_005CBDD9: mov ecx, var_88
  loc_005CBDDF: mov [ebx+0000000Ch], ecx
  loc_005CBDE2: call [edx+00000030h]
  loc_005CBDE5: cmp eax, esi
  loc_005CBDE7: fnclex
  loc_005CBDE9: jge 005CBE00h
  loc_005CBDEB: mov edx, var_114
  loc_005CBDF1: push 00000030h
  loc_005CBDF3: push 0041EA14h ; "S"
  loc_005CBDF8: push edx
  loc_005CBDF9: push eax
  loc_005CBDFA: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBE00: mov eax, var_20
  loc_005CBE03: lea ecx, var_44
  loc_005CBE06: mov var_2C, eax
  loc_005CBE09: lea eax, var_34
  loc_005CBE0C: push eax
  loc_005CBE0D: push ecx
  loc_005CBE0E: mov var_20, esi
  loc_005CBE11: mov var_34, 00000009h
  loc_005CBE18: call [004010D4h] ; rtcTrimVar
  loc_005CBE1E: mov edx, var_11C
  loc_005CBE24: lea eax, var_44
  loc_005CBE27: lea ecx, var_18
  loc_005CBE2A: push eax
  loc_005CBE2B: mov ebx, [edx]
  loc_005CBE2D: push ecx
  loc_005CBE2E: call [004011B0h] ; __vbaStrVarVal
  loc_005CBE34: mov edx, ebx
  loc_005CBE36: mov ebx, var_11C
  loc_005CBE3C: push eax
  loc_005CBE3D: push ebx
  loc_005CBE3E: call [edx+000000A4h]
  loc_005CBE44: cmp eax, esi
  loc_005CBE46: fnclex
  loc_005CBE48: jge 005CBE5Ch
  loc_005CBE4A: push 000000A4h
  loc_005CBE4F: push 0041E5E8h
  loc_005CBE54: push ebx
  loc_005CBE55: push eax
  loc_005CBE56: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBE5C: lea ecx, var_18
  loc_005CBE5F: call [004012ACh] ; __vbaFreeStr
  loc_005CBE65: lea eax, var_24
  loc_005CBE68: lea ecx, var_1C
  loc_005CBE6B: push eax
  loc_005CBE6C: push ecx
  loc_005CBE6D: push 00000002h
  loc_005CBE6F: call [00401040h] ; __vbaFreeObjList
  loc_005CBE75: lea edx, var_44
  loc_005CBE78: lea eax, var_34
  loc_005CBE7B: push edx
  loc_005CBE7C: push eax
  loc_005CBE7D: push 00000002h
  loc_005CBE7F: call [00401038h] ; __vbaFreeVarList
  loc_005CBE85: add esp, 00000018h
  loc_005CBE88: mov eax, [edi]
  loc_005CBE8A: push eax
  loc_005CBE8B: mov ecx, [eax]
  loc_005CBE8D: call [ecx+000000C4h]
  loc_005CBE93: cmp eax, esi
  loc_005CBE95: fnclex
  loc_005CBE97: jge 005CBEADh
  loc_005CBE99: mov edx, [edi]
  loc_005CBE9B: push 000000C4h
  loc_005CBEA0: push 0041E938h
  loc_005CBEA5: push edx
  loc_005CBEA6: push eax
  loc_005CBEA7: call [00401074h] ; __vbaHresultCheckObj
  loc_005CBEAD: push 0041E938h
  loc_005CBEB2: push esi
  loc_005CBEB3: call [00401274h] ; __vbaCastObj
  loc_005CBEB9: push eax
  loc_005CBEBA: lea eax, var_1C
  loc_005CBEBD: push eax
  loc_005CBEBE: call [004010A0h] ; __vbaObjSet
  loc_005CBEC4: push eax
  loc_005CBEC5: push edi
  loc_005CBEC6: call [004010B8h] ; __vbaObjSetAddref
  loc_005CBECC: lea ecx, var_1C
  loc_005CBECF: call [004012B0h] ; __vbaFreeObj
  loc_005CBED5: mov var_4, esi
  loc_005CBED8: push 005CBF24h
  loc_005CBEDD: jmp 005CBF23h
  loc_005CBEDF: lea ecx, var_18
  loc_005CBEE2: call [004012ACh] ; __vbaFreeStr
  loc_005CBEE8: lea ecx, var_24
  loc_005CBEEB: lea edx, var_20
  loc_005CBEEE: push ecx
  loc_005CBEEF: lea eax, var_1C
  loc_005CBEF2: push edx
  loc_005CBEF3: push eax
  loc_005CBEF4: push 00000003h
  loc_005CBEF6: call [00401040h] ; __vbaFreeObjList
  loc_005CBEFC: lea ecx, var_84
  loc_005CBF02: lea edx, var_74
  loc_005CBF05: push ecx
  loc_005CBF06: lea eax, var_64
  loc_005CBF09: push edx
  loc_005CBF0A: lea ecx, var_54
  loc_005CBF0D: push eax
  loc_005CBF0E: lea edx, var_44
  loc_005CBF11: push ecx
  loc_005CBF12: lea eax, var_34
  loc_005CBF15: push edx
  loc_005CBF16: push eax
  loc_005CBF17: push 00000006h
  loc_005CBF19: call [00401038h] ; __vbaFreeVarList
  loc_005CBF1F: add esp, 0000002Ch
  loc_005CBF22: ret
  loc_005CBF23: ret
  loc_005CBF24: mov eax, Me
  loc_005CBF27: push eax
  loc_005CBF28: mov ecx, [eax]
  loc_005CBF2A: call [ecx+00000008h]
  loc_005CBF2D: mov eax, var_4
  loc_005CBF30: mov ecx, var_14
  loc_005CBF33: pop edi
  loc_005CBF34: pop esi
  loc_005CBF35: mov fs:[00000000h], ecx
  loc_005CBF3C: pop ebx
  loc_005CBF3D: mov esp, ebp
  loc_005CBF3F: pop ebp
  loc_005CBF40: retn 0004h
End Sub
