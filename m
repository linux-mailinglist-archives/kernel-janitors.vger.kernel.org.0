Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AFE1FF2EC
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Jun 2020 15:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730120AbgFRNXt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jun 2020 09:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbgFRNXq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jun 2020 09:23:46 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A483FC06174E
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2020 06:23:45 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r7so6071567wro.1
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2020 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:autocrypt:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=nwNkEuiN90L7gmcXgop8R5IO6T7PY5SDVkKjPc2w8n0=;
        b=LJlZv2gG9fJ5fBowx71J1Mkqgt/mmvnEXYwfh/kpdRgN5grjUzvi1TClThyy9cTCAh
         44f+qacqBffD5SC0wHIqLdnrW07LjPy87eBnbxmvwJpDZlJeW4vXXndzxjgMdxqYELuR
         6qKbo9PoZcnyb1K0PXi79xOmabdiOgymJhwL5VdWNr8vQCfMLbKCfLoPWngG46pwmiu/
         L0O0v05iVPSChPVLBYXijS1+rJ7XB0NFisfdGaxgD3pzi1q/55N9l1DjtRV/YMVnRAK2
         B83wZHiK5iZ7j9ZKu1p06BLy4PqyctBDiij8hoPJ3+xPFYCi30dR4NlAl3WOvwWuS/Kb
         WoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:content-language;
        bh=nwNkEuiN90L7gmcXgop8R5IO6T7PY5SDVkKjPc2w8n0=;
        b=Tncd41IbWKDix3aE51MUVr1kbDe308cmWWB3qKB5VRHuoz2+q8u0PUaDBNnuHyRlJv
         WcHK2JcMFlT0xYEwBbkYbTtqrB91DVpy9AJJiO6RlCm1iMASW76HWcaMCL20+cxUcBtz
         yFeswK9yS89qyWmm53IKF2XHAQpnxy1rWdn3TZgDe7BTMQIfq48SpA9+BsOsSMv+E5bs
         1475UrfCkAXaI8L5rFJe+4N28+u9sd05YmHU6eqLSjQMFyMe632+8Bim5i3duxLUvPpZ
         in9ERr9eCEsOPRX5R442HfaKUsF4IN0Q2BMLGQHCqeaLa4Xzu5C6FY372pm+nD1fV5mQ
         iSwg==
X-Gm-Message-State: AOAM531YakixKZmVMsqUrsmK+V7NINC7+j02bzHKo53aZLiecukIRa+9
        iBC238WRbIiFF9faOkFnMAqmLwg1
X-Google-Smtp-Source: ABdhPJwB3wc8UM3SX6DueiShjabiEDxM1dHAk0oAGNn3yfroEDdzwM65TZAPBjS6825WM1ggVOk9DQ==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr1624798wrt.174.1592486623969;
        Thu, 18 Jun 2020 06:23:43 -0700 (PDT)
Received: from [192.168.0.3] (host-82-61-132-230.retail.telecomitalia.it. [82.61.132.230])
        by smtp.gmail.com with ESMTPSA id c6sm3677326wma.15.2020.06.18.06.23.42
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 06:23:43 -0700 (PDT)
To:     kernel-janitors@vger.kernel.org
From:   Giacomo Picchiarelli <gpicchiarelli@gmail.com>
Autocrypt: addr=gpicchiarelli@gmail.com; keydata=
 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
Subject: [help][coccinelle] coccicheck failed
Message-ID: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
Date:   Thu, 18 Jun 2020 15:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------76987D1D935724D8FAD36ACF"
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------76987D1D935724D8FAD36ACF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Newbie here. I couldn't try the patch attached.=20
I'm using coccinelle (spatch version 1.0.4 with Python support and with P=
CRE support),=20
I'm having issues with the following command:

make coccicheck MODE=3Dpatch

"./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use A=
RRAY_SIZE

807 811

coccicheck failed"

Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> mast=
er, origin/master, origin/HEAD)
Merge: 69119673bd50 dbed452a078d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jun 17 11:29:37 2020 -0700

Suggestions?

--=20
Giacomo Picchiarelli <gpicchiarelli@gmail.com>
GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0


--------------76987D1D935724D8FAD36ACF
Content-Type: text/plain; charset=UTF-8;
 name="coccinelle_patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="coccinelle_patch.txt"

ClBsZWFzZSBjaGVjayBmb3IgZmFsc2UgcG9zaXRpdmVzIGluIHRoZSBvdXRwdXQgYmVmb3Jl
IHN1Ym1pdHRpbmcgYSBwYXRjaC4KV2hlbiB1c2luZyAicGF0Y2giIG1vZGUsIGNhcmVmdWxs
eSByZXZpZXcgdGhlIHBhdGNoIGJlZm9yZSBzdWJtaXR0aW5nIGl0LgoKZGlmZiAtdSAtcCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9wcm9jZXNzcHB0
YWJsZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9w
cm9jZXNzcHB0YWJsZXMuYwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMjBfcHJvY2Vzc3BwdGFibGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX3Byb2Nlc3NwcHRhYmxlcy5jCkBAIC04OTAsNyAr
ODkwLDcgQEAgc3RhdGljIGludCBpbml0X3Bvd2VycGxheV90YWJsZV9pbmZvcm1hdAogCQkJ
CXBvd2VyX3NhdmluZ19jbG9ja19jb3VudCk7CiAJfQogCi0JcHB0YWJsZV9pbmZvcm1hdGlv
bi0+c21jX3BwdGFibGUgPSAoUFBUYWJsZV90ICopa21hbGxvYyhzaXplb2YoUFBUYWJsZV90
KSwgR0ZQX0tFUk5FTCk7CisJcHB0YWJsZV9pbmZvcm1hdGlvbi0+c21jX3BwdGFibGUgPSBr
bWFsbG9jKHNpemVvZihQUFRhYmxlX3QpLCBHRlBfS0VSTkVMKTsKIAlpZiAocHB0YWJsZV9p
bmZvcm1hdGlvbi0+c21jX3BwdGFibGUgPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAK
ZGlmZiAtdSAtcCBhL2RyaXZlcnMvbWVzc2FnZS9mdXNpb24vbXB0Y3RsLmMgYi9kcml2ZXJz
L21lc3NhZ2UvZnVzaW9uL21wdGN0bC5jCi0tLSBhL2RyaXZlcnMvbWVzc2FnZS9mdXNpb24v
bXB0Y3RsLmMKKysrIGIvZHJpdmVycy9tZXNzYWdlL2Z1c2lvbi9tcHRjdGwuYwpAQCAtMjU5
Myw3ICsyNTkzLDcgQEAgbXB0Y3RsX2hwX3RhcmdldGluZm8oTVBUX0FEQVBURVIgKmlvYywg
dQogICAgICAgIC8qIEdldCB0aGUgZGF0YSB0cmFuc2ZlciBzcGVlZHMKICAgICAgICAgKi8K
IAlkYXRhX3N6ID0gaW9jLT5zcGlfZGF0YS5zZHAwbGVuZ3RoICogNDsKLQlwZzBfYWxsb2Mg
PSAoU0NTSURldmljZVBhZ2UwX3QgKikgcGNpX2FsbG9jX2NvbnNpc3RlbnQoaW9jLT5wY2lk
ZXYsIGRhdGFfc3osICZwYWdlX2RtYSk7CisJcGcwX2FsbG9jID0gcGNpX2FsbG9jX2NvbnNp
c3RlbnQoaW9jLT5wY2lkZXYsIGRhdGFfc3osICZwYWdlX2RtYSk7CiAJaWYgKHBnMF9hbGxv
YykgewogCQloZHIuUGFnZVZlcnNpb24gPSBpb2MtPnNwaV9kYXRhLnNkcDB2ZXJzaW9uOwog
CQloZHIuUGFnZUxlbmd0aCA9IGRhdGFfc3o7CkBAIC0yNjU3LDcgKzI2NTcsNyBAQCBtcHRj
dGxfaHBfdGFyZ2V0aW5mbyhNUFRfQURBUFRFUiAqaW9jLCB1CiAJCS8qIElzc3VlIHRoZSBz
ZWNvbmQgY29uZmlnIHBhZ2UgcmVxdWVzdCAqLwogCQljZmcuYWN0aW9uID0gTVBJX0NPTkZJ
R19BQ1RJT05fUEFHRV9SRUFEX0NVUlJFTlQ7CiAJCWRhdGFfc3ogPSAoaW50KSBjZmcuY2Zn
aGRyLmhkci0+UGFnZUxlbmd0aCAqIDQ7Ci0JCXBnM19hbGxvYyA9IChTQ1NJRGV2aWNlUGFn
ZTNfdCAqKSBwY2lfYWxsb2NfY29uc2lzdGVudCgKKwkJcGczX2FsbG9jID0gcGNpX2FsbG9j
X2NvbnNpc3RlbnQoCiAJCQkJCQkJaW9jLT5wY2lkZXYsIGRhdGFfc3osICZwYWdlX2RtYSk7
CiAJCWlmIChwZzNfYWxsb2MpIHsKIAkJCWNmZy5waHlzQWRkciA9IHBhZ2VfZG1hOwpkaWZm
IC11IC1wIGEvZHJpdmVycy9uZmMvc3QtbmNpL3NlLmMgYi9kcml2ZXJzL25mYy9zdC1uY2kv
c2UuYwotLS0gYS9kcml2ZXJzL25mYy9zdC1uY2kvc2UuYworKysgYi9kcml2ZXJzL25mYy9z
dC1uY2kvc2UuYwpAQCAtMzMxLDcgKzMzMSw3IEBAIHN0YXRpYyBpbnQgc3RfbmNpX2hjaV9j
b25uZWN0aXZpdHlfZXZlbnQKIAkJICAgIHNrYi0+ZGF0YVswXSAhPSBORkNfRVZUX1RSQU5T
QUNUSU9OX0FJRF9UQUcpCiAJCQlyZXR1cm4gLUVQUk9UTzsKIAotCQl0cmFuc2FjdGlvbiA9
IChzdHJ1Y3QgbmZjX2V2dF90cmFuc2FjdGlvbiAqKWRldm1fa3phbGxvYyhkZXYsCisJCXRy
YW5zYWN0aW9uID0gZGV2bV9remFsbG9jKGRldiwKIAkJCQkJICAgIHNrYi0+bGVuIC0gMiwg
R0ZQX0tFUk5FTCk7CiAJCWlmICghdHJhbnNhY3Rpb24pCiAJCQlyZXR1cm4gLUVOT01FTTsK
ZGlmZiAtdSAtcCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Fsb2dpYy9xZWQvcWVkX3JkbWEu
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Fsb2dpYy9xZWQvcWVkX3JkbWEuYwotLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9xbG9naWMvcWVkL3FlZF9yZG1hLmMKKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvcWxvZ2ljL3FlZC9xZWRfcmRtYS5jCkBAIC0xMTc1LDcgKzExNzUs
NiBAQCBxZWRfcmRtYV9kZXN0cm95X2NxKHZvaWQgKnJkbWFfY3h0LAogCURQX1ZFUkJPU0Uo
cF9od2ZuLCBRRURfTVNHX1JETUEsICJpY2lkID0gJTA4eFxuIiwgaW5fcGFyYW1zLT5pY2lk
KTsKIAogCXBfcmFtcm9kX3JlcyA9Ci0JICAgIChzdHJ1Y3QgcmRtYV9kZXN0cm95X2NxX291
dHB1dF9wYXJhbXMgKikKIAkgICAgZG1hX2FsbG9jX2NvaGVyZW50KCZwX2h3Zm4tPmNkZXYt
PnBkZXYtPmRldiwKIAkJCSAgICAgICBzaXplb2Yoc3RydWN0IHJkbWFfZGVzdHJveV9jcV9v
dXRwdXRfcGFyYW1zKSwKIAkJCSAgICAgICAmcmFtcm9kX3Jlc19waHlzLCBHRlBfS0VSTkVM
KTsKZGlmZiAtdSAtcCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Nhdml1bS9saXF1aWRpby9v
Y3Rlb25fZGV2aWNlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYXZpdW0vbGlxdWlkaW8v
b2N0ZW9uX2RldmljZS5jCi0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Nhdml1bS9saXF1
aWRpby9vY3Rlb25fZGV2aWNlLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2F2aXVt
L2xpcXVpZGlvL29jdGVvbl9kZXZpY2UuYwpAQCAtMTE1Miw3ICsxMTUyLDcgQEAgb2N0ZW9u
X3JlZ2lzdGVyX2Rpc3BhdGNoX2ZuKHN0cnVjdCBvY3RlbwogCiAJCWRldl9kYmcoJm9jdC0+
cGNpX2Rldi0+ZGV2LAogCQkJIkFkZGluZyBvcGNvZGUgdG8gZGlzcGF0Y2ggbGlzdCBsaW5r
ZWQgbGlzdFxuIik7Ci0JCWRpc3BhdGNoID0gKHN0cnVjdCBvY3Rlb25fZGlzcGF0Y2ggKikK
KwkJZGlzcGF0Y2ggPQogCQkJICAgdm1hbGxvYyhzaXplb2Yoc3RydWN0IG9jdGVvbl9kaXNw
YXRjaCkpOwogCQlpZiAoIWRpc3BhdGNoKSB7CiAJCQlkZXZfZXJyKCZvY3QtPnBjaV9kZXYt
PmRldiwKZGlmZiAtdSAtcCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2hpc2lsaWNvbi9oaXg1
aGQyX2dtYWMuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2hpc2lsaWNvbi9oaXg1aGQyX2dt
YWMuYwotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9oaXNpbGljb24vaGl4NWhkMl9nbWFj
LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvaGlzaWxpY29uL2hpeDVoZDJfZ21hYy5j
CkBAIC0xMDI0LDcgKzEwMjQsNyBAQCBzdGF0aWMgaW50IGhpeDVoZDJfaW5pdF9zZ19kZXNj
X3F1ZXVlKHN0CiAJc3RydWN0IHNnX2Rlc2MgKmRlc2M7CiAJZG1hX2FkZHJfdCBwaHlzX2Fk
ZHI7CiAKLQlkZXNjID0gKHN0cnVjdCBzZ19kZXNjICopZG1hX2FsbG9jX2NvaGVyZW50KHBy
aXYtPmRldiwKKwlkZXNjID0gZG1hX2FsbG9jX2NvaGVyZW50KHByaXYtPmRldiwKIAkJCQlU
WF9ERVNDX05VTSAqIHNpemVvZihzdHJ1Y3Qgc2dfZGVzYyksCiAJCQkJJnBoeXNfYWRkciwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFkZXNjKQpkaWZmIC11IC1wIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3VuL3N1bmdlbS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3VuL3N1bmdlbS5j
Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N1bi9zdW5nZW0uYworKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdW4vc3VuZ2VtLmMKQEAgLTI5NTIsNyArMjk1Miw3IEBAIHN0YXRp
YyBpbnQgZ2VtX2luaXRfb25lKHN0cnVjdCBwY2lfZGV2ICoKIAkvKiBJdCBpcyBndWFyYW50
ZWVkIHRoYXQgdGhlIHJldHVybmVkIGJ1ZmZlciB3aWxsIGJlIGF0IGxlYXN0CiAJICogUEFH
RV9TSVpFIGFsaWduZWQuCiAJICovCi0JZ3AtPmluaXRfYmxvY2sgPSAoc3RydWN0IGdlbV9p
bml0X2Jsb2NrICopCisJZ3AtPmluaXRfYmxvY2sgPQogCQlwY2lfYWxsb2NfY29uc2lzdGVu
dChwZGV2LCBzaXplb2Yoc3RydWN0IGdlbV9pbml0X2Jsb2NrKSwKIAkJCQkgICAgICZncC0+
Z2Jsb2NrX2R2bWEpOwogCWlmICghZ3AtPmluaXRfYmxvY2spIHsKZGlmZiAtdSAtcCBhL2Ry
aXZlcnMvc2NzaS9mbmljL2ZuaWNfZGVidWdmcy5jIGIvZHJpdmVycy9zY3NpL2ZuaWMvZm5p
Y19kZWJ1Z2ZzLmMKLS0tIGEvZHJpdmVycy9zY3NpL2ZuaWMvZm5pY19kZWJ1Z2ZzLmMKKysr
IGIvZHJpdmVycy9zY3NpL2ZuaWMvZm5pY19kZWJ1Z2ZzLmMKQEAgLTU4LDcgKzU4LDcgQEAg
aW50IGZuaWNfZGVidWdmc19pbml0KHZvaWQpCiAJCQkJCQlmbmljX3RyYWNlX2RlYnVnZnNf
cm9vdCk7CiAKIAkvKiBBbGxvY2F0ZSBtZW1vcnkgdG8gc3RydWN0dXJlICovCi0JZmNfdHJj
X2ZsYWcgPSAoc3RydWN0IGZjX3RyYWNlX2ZsYWdfdHlwZSAqKQorCWZjX3RyY19mbGFnID0K
IAkJdm1hbGxvYyhzaXplb2Yoc3RydWN0IGZjX3RyYWNlX2ZsYWdfdHlwZSkpOwogCiAJaWYg
KGZjX3RyY19mbGFnKSB7CmRpZmYgLXUgLXAgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTJfcHJvY2Vzc3BwdGFibGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfcHJvY2Vzc3BwdGFibGVzLmMKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX3Byb2Nlc3NwcHRhYmxl
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9w
cm9jZXNzcHB0YWJsZXMuYwpAQCAtMjUyLDcgKzI1Miw3IEBAIHN0YXRpYyBpbnQgaW5pdF9w
b3dlcnBsYXlfdGFibGVfaW5mb3JtYXQKIAlwaG1fY29weV9jbG9ja19saW1pdHNfYXJyYXko
aHdtZ3IsICZwcHRhYmxlX2luZm9ybWF0aW9uLT5wb3dlcl9zYXZpbmdfY2xvY2tfbWF4LCBw
b3dlcnBsYXlfdGFibGUtPlBvd2VyU2F2aW5nQ2xvY2tNYXgsIEFUT01fVkVHQTEyX1BQQ0xP
Q0tfQ09VTlQpOwogCXBobV9jb3B5X2Nsb2NrX2xpbWl0c19hcnJheShod21nciwgJnBwdGFi
bGVfaW5mb3JtYXRpb24tPnBvd2VyX3NhdmluZ19jbG9ja19taW4sIHBvd2VycGxheV90YWJs
ZS0+UG93ZXJTYXZpbmdDbG9ja01pbiwgQVRPTV9WRUdBMTJfUFBDTE9DS19DT1VOVCk7CiAK
LQlwcHRhYmxlX2luZm9ybWF0aW9uLT5zbWNfcHB0YWJsZSA9IChQUFRhYmxlX3QgKilrbWFs
bG9jKHNpemVvZihQUFRhYmxlX3QpLCBHRlBfS0VSTkVMKTsKKwlwcHRhYmxlX2luZm9ybWF0
aW9uLT5zbWNfcHB0YWJsZSA9IGttYWxsb2Moc2l6ZW9mKFBQVGFibGVfdCksIEdGUF9LRVJO
RUwpOwogCWlmIChwcHRhYmxlX2luZm9ybWF0aW9uLT5zbWNfcHB0YWJsZSA9PSBOVUxMKQog
CQlyZXR1cm4gLUVOT01FTTsKIApkaWZmIC11IC1wIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
cWxvZ2ljL3FlZC9xZWRfcm9jZS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcWxvZ2ljL3Fl
ZC9xZWRfcm9jZS5jCi0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Fsb2dpYy9xZWQvcWVk
X3JvY2UuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9xbG9naWMvcWVkL3FlZF9yb2Nl
LmMKQEAgLTgyMiw3ICs4MjIsNyBAQCBzdGF0aWMgaW50IHFlZF9yb2NlX3NwX2Rlc3Ryb3lf
cXBfcmVxdWVzCiAJaWYgKCFxcC0+cmVxX29mZmxvYWRlZCkKIAkJcmV0dXJuIDA7CiAKLQlw
X3JhbXJvZF9yZXMgPSAoc3RydWN0IHJvY2VfZGVzdHJveV9xcF9yZXFfb3V0cHV0X3BhcmFt
cyAqKQorCXBfcmFtcm9kX3JlcyA9CiAJCSAgICAgICBkbWFfYWxsb2NfY29oZXJlbnQoJnBf
aHdmbi0+Y2Rldi0+cGRldi0+ZGV2LAogCQkJCQkgIHNpemVvZigqcF9yYW1yb2RfcmVzKSwK
IAkJCQkJICAmcmFtcm9kX3Jlc19waHlzLCBHRlBfS0VSTkVMKTsKZGlmZiAtdSAtcCBhL2Ry
aXZlcnMvc2NzaS9pYm12c2NzaS9pYm12c2NzaS5jIGIvZHJpdmVycy9zY3NpL2libXZzY3Np
L2libXZzY3NpLmMKLS0tIGEvZHJpdmVycy9zY3NpL2libXZzY3NpL2libXZzY3NpLmMKKysr
IGIvZHJpdmVycy9zY3NpL2libXZzY3NpL2libXZzY3NpLmMKQEAgLTcxNyw3ICs3MTcsNyBA
QCBzdGF0aWMgaW50IG1hcF9zZ19kYXRhKHN0cnVjdCBzY3NpX2NtbmQKIAogCS8qIGdldCBp
bmRpcmVjdCB0YWJsZSAqLwogCWlmICghZXZ0X3N0cnVjdC0+ZXh0X2xpc3QpIHsKLQkJZXZ0
X3N0cnVjdC0+ZXh0X2xpc3QgPSAoc3RydWN0IHNycF9kaXJlY3RfYnVmICopCisJCWV2dF9z
dHJ1Y3QtPmV4dF9saXN0ID0KIAkJCWRtYV9hbGxvY19jb2hlcmVudChkZXYsCiAJCQkJCSAg
IFNHX0FMTCAqIHNpemVvZihzdHJ1Y3Qgc3JwX2RpcmVjdF9idWYpLAogCQkJCQkgICAmZXZ0
X3N0cnVjdC0+ZXh0X2xpc3RfdG9rZW4sIDApOwpkaWZmIC11IC1wIGEvaW5jbHVkZS9yZG1h
L2liX3ZlcmJzLmggYi9pbmNsdWRlL3JkbWEvaWJfdmVyYnMuaAotLS0gYS9pbmNsdWRlL3Jk
bWEvaWJfdmVyYnMuaAorKysgYi9pbmNsdWRlL3JkbWEvaWJfdmVyYnMuaApAQCAtMjI5OCw3
ICsyMjk4LDcgQEAgc3RydWN0IGl3X2NtX2Nvbm5fcGFyYW07CiAJCQkJICAgICAgc3RydWN0
IGliX3N0cnVjdCkpKQogCiAjZGVmaW5lIHJkbWFfemFsbG9jX2Rydl9vYmpfZ2ZwKGliX2Rl
diwgaWJfdHlwZSwgZ2ZwKSAgICAgICAgICAgICAgICAgICAgICAgICBcCi0JKChzdHJ1Y3Qg
aWJfdHlwZSAqKWt6YWxsb2MoaWJfZGV2LT5vcHMuc2l6ZV8jI2liX3R5cGUsIGdmcCkpCisJ
KGt6YWxsb2MoaWJfZGV2LT5vcHMuc2l6ZV8jI2liX3R5cGUsIGdmcCkpCiAKICNkZWZpbmUg
cmRtYV96YWxsb2NfZHJ2X29iaihpYl9kZXYsIGliX3R5cGUpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAJcmRtYV96YWxsb2NfZHJ2X29ial9nZnAoaWJfZGV2LCBp
Yl90eXBlLCBHRlBfS0VSTkVMKQpkaWZmIC11IC1wIGEvZHJpdmVycy9tZXNzYWdlL2Z1c2lv
bi9tcHRiYXNlLmMgYi9kcml2ZXJzL21lc3NhZ2UvZnVzaW9uL21wdGJhc2UuYwotLS0gYS9k
cml2ZXJzL21lc3NhZ2UvZnVzaW9uL21wdGJhc2UuYworKysgYi9kcml2ZXJzL21lc3NhZ2Uv
ZnVzaW9uL21wdGJhc2UuYwpAQCAtNDk3Niw3ICs0OTc2LDcgQEAgR2V0TGFuQ29uZmlnUGFn
ZXMoTVBUX0FEQVBURVIgKmlvYykKIAogCWlmIChoZHIuUGFnZUxlbmd0aCA+IDApIHsKIAkJ
ZGF0YV9zeiA9IGhkci5QYWdlTGVuZ3RoICogNDsKLQkJcHBhZ2UwX2FsbG9jID0gKExBTlBh
Z2UwX3QgKikgcGNpX2FsbG9jX2NvbnNpc3RlbnQoaW9jLT5wY2lkZXYsIGRhdGFfc3osICZw
YWdlMF9kbWEpOworCQlwcGFnZTBfYWxsb2MgPSBwY2lfYWxsb2NfY29uc2lzdGVudChpb2Mt
PnBjaWRldiwgZGF0YV9zeiwgJnBhZ2UwX2RtYSk7CiAJCXJjID0gLUVOT01FTTsKIAkJaWYg
KHBwYWdlMF9hbGxvYykgewogCQkJbWVtc2V0KCh1OCAqKXBwYWdlMF9hbGxvYywgMCwgZGF0
YV9zeik7CkBAIC01MDIyLDcgKzUwMjIsNyBAQCBHZXRMYW5Db25maWdQYWdlcyhNUFRfQURB
UFRFUiAqaW9jKQogCiAJZGF0YV9zeiA9IGhkci5QYWdlTGVuZ3RoICogNDsKIAlyYyA9IC1F
Tk9NRU07Ci0JcHBhZ2UxX2FsbG9jID0gKExBTlBhZ2UxX3QgKikgcGNpX2FsbG9jX2NvbnNp
c3RlbnQoaW9jLT5wY2lkZXYsIGRhdGFfc3osICZwYWdlMV9kbWEpOworCXBwYWdlMV9hbGxv
YyA9IHBjaV9hbGxvY19jb25zaXN0ZW50KGlvYy0+cGNpZGV2LCBkYXRhX3N6LCAmcGFnZTFf
ZG1hKTsKIAlpZiAocHBhZ2UxX2FsbG9jKSB7CiAJCW1lbXNldCgodTggKilwcGFnZTFfYWxs
b2MsIDAsIGRhdGFfc3opOwogCQljZmcucGh5c0FkZHIgPSBwYWdlMV9kbWE7CkBAIC01MzIz
LDcgKzUzMjMsNyBAQCBHZXRJb1VuaXRQYWdlMihNUFRfQURBUFRFUiAqaW9jKQogCS8qIFJl
YWQgdGhlIGNvbmZpZyBwYWdlICovCiAJZGF0YV9zeiA9IGhkci5QYWdlTGVuZ3RoICogNDsK
IAlyYyA9IC1FTk9NRU07Ci0JcHBhZ2VfYWxsb2MgPSAoSU9Vbml0UGFnZTJfdCAqKSBwY2lf
YWxsb2NfY29uc2lzdGVudChpb2MtPnBjaWRldiwgZGF0YV9zeiwgJnBhZ2VfZG1hKTsKKwlw
cGFnZV9hbGxvYyA9IHBjaV9hbGxvY19jb25zaXN0ZW50KGlvYy0+cGNpZGV2LCBkYXRhX3N6
LCAmcGFnZV9kbWEpOwogCWlmIChwcGFnZV9hbGxvYykgewogCQltZW1zZXQoKHU4ICopcHBh
Z2VfYWxsb2MsIDAsIGRhdGFfc3opOwogCQljZmcucGh5c0FkZHIgPSBwYWdlX2RtYTsKZGlm
ZiAtdSAtcCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Nhdml1bS9saXF1aWRpby9vY3Rlb25f
ZHJvcS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2F2aXVtL2xpcXVpZGlvL29jdGVvbl9k
cm9xLmMKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2F2aXVtL2xpcXVpZGlvL29jdGVv
bl9kcm9xLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2F2aXVtL2xpcXVpZGlvL29j
dGVvbl9kcm9xLmMKQEAgLTI4MCwxMSArMjgwLDExIEBAIGludCBvY3Rlb25faW5pdF9kcm9x
KHN0cnVjdCBvY3Rlb25fZGV2aWMKIAlkZXZfZGJnKCZvY3QtPnBjaV9kZXYtPmRldiwgImRy
b3FbJWRdOiBudW1fZGVzYzogJWRcbiIsIHFfbm8sCiAJCWRyb3EtPm1heF9jb3VudCk7CiAK
LQlkcm9xLT5yZWN2X2J1Zl9saXN0ID0gKHN0cnVjdCBvY3Rlb25fcmVjdl9idWZmZXIgKikK
Kwlkcm9xLT5yZWN2X2J1Zl9saXN0ID0KIAkgICAgICB2emFsbG9jX25vZGUoYXJyYXlfc2l6
ZShkcm9xLT5tYXhfY291bnQsIE9DVF9EUk9RX1JFQ1ZCVUZfU0laRSksCiAJCQkgICBudW1h
X25vZGUpOwogCWlmICghZHJvcS0+cmVjdl9idWZfbGlzdCkKLQkJZHJvcS0+cmVjdl9idWZf
bGlzdCA9IChzdHJ1Y3Qgb2N0ZW9uX3JlY3ZfYnVmZmVyICopCisJCWRyb3EtPnJlY3ZfYnVm
X2xpc3QgPQogCQkgICAgICB2emFsbG9jKGFycmF5X3NpemUoZHJvcS0+bWF4X2NvdW50LAog
CQkJCQkgT0NUX0RST1FfUkVDVkJVRl9TSVpFKSk7CiAJaWYgKCFkcm9xLT5yZWN2X2J1Zl9s
aXN0KSB7CmRpZmYgLXUgLXAgYS9kcml2ZXJzL2NyeXB0by9jYXZpdW0vY3B0L2NwdHZmX21h
aW4uYyBiL2RyaXZlcnMvY3J5cHRvL2Nhdml1bS9jcHQvY3B0dmZfbWFpbi5jCi0tLSBhL2Ry
aXZlcnMvY3J5cHRvL2Nhdml1bS9jcHQvY3B0dmZfbWFpbi5jCisrKyBiL2RyaXZlcnMvY3J5
cHRvL2Nhdml1bS9jcHQvY3B0dmZfbWFpbi5jCkBAIC0yMzMsNyArMjMzLDcgQEAgc3RhdGlj
IGludCBhbGxvY19jb21tYW5kX3F1ZXVlcyhzdHJ1Y3QgYwogCiAJCQljX3NpemUgPSAocmVt
X3Ffc2l6ZSA+IHFjc2l6ZV9ieXRlcykgPyBxY3NpemVfYnl0ZXMgOgogCQkJCQlyZW1fcV9z
aXplOwotCQkJY3Vyci0+aGVhZCA9ICh1OCAqKWRtYV9hbGxvY19jb2hlcmVudCgmcGRldi0+
ZGV2LAorCQkJY3Vyci0+aGVhZCA9IGRtYV9hbGxvY19jb2hlcmVudCgmcGRldi0+ZGV2LAog
CQkJCQkJCSAgICAgIGNfc2l6ZSArIENQVF9ORVhUX0NIVU5LX1BUUl9TSVpFLAogCQkJCQkJ
CSAgICAgICZjdXJyLT5kbWFfYWRkciwKIAkJCQkJCQkgICAgICBHRlBfS0VSTkVMKTsKZGlm
ZiAtdSAtcCBhL2RyaXZlcnMvbWVzc2FnZS9mdXNpb24vbXB0ZmMuYyBiL2RyaXZlcnMvbWVz
c2FnZS9mdXNpb24vbXB0ZmMuYwotLS0gYS9kcml2ZXJzL21lc3NhZ2UvZnVzaW9uL21wdGZj
LmMKKysrIGIvZHJpdmVycy9tZXNzYWdlL2Z1c2lvbi9tcHRmYy5jCkBAIC03NjMsNyArNzYz
LDcgQEAgbXB0ZmNfR2V0RmNQb3J0UGFnZTAoTVBUX0FEQVBURVIgKmlvYywgaQogCiAJZGF0
YV9zeiA9IGhkci5QYWdlTGVuZ3RoICogNDsKIAlyYyA9IC1FTk9NRU07Ci0JcHBhZ2UwX2Fs
bG9jID0gKEZDUG9ydFBhZ2UwX3QgKikgcGNpX2FsbG9jX2NvbnNpc3RlbnQoaW9jLT5wY2lk
ZXYsIGRhdGFfc3osICZwYWdlMF9kbWEpOworCXBwYWdlMF9hbGxvYyA9IHBjaV9hbGxvY19j
b25zaXN0ZW50KGlvYy0+cGNpZGV2LCBkYXRhX3N6LCAmcGFnZTBfZG1hKTsKIAlpZiAocHBh
Z2UwX2FsbG9jKSB7CiAKICB0cnlfYWdhaW46CkBAIC05MDQsNyArOTA0LDcgQEAgc3RhcnRf
b3ZlcjoKIAkJaWYgKGRhdGFfc3ogPCBzaXplb2YoRkNQb3J0UGFnZTFfdCkpCiAJCQlkYXRh
X3N6ID0gc2l6ZW9mKEZDUG9ydFBhZ2UxX3QpOwogCi0JCXBhZ2UxX2FsbG9jID0gKEZDUG9y
dFBhZ2UxX3QgKikgcGNpX2FsbG9jX2NvbnNpc3RlbnQoaW9jLT5wY2lkZXYsCisJCXBhZ2Ux
X2FsbG9jID0gcGNpX2FsbG9jX2NvbnNpc3RlbnQoaW9jLT5wY2lkZXYsCiAJCQkJCQlkYXRh
X3N6LAogCQkJCQkJJnBhZ2UxX2RtYSk7CiAJCWlmICghcGFnZTFfYWxsb2MpCmRpZmYgLXUg
LXAgYS9kcml2ZXJzL25mYy9zdDIxbmZjYS9zZS5jIGIvZHJpdmVycy9uZmMvc3QyMW5mY2Ev
c2UuYwotLS0gYS9kcml2ZXJzL25mYy9zdDIxbmZjYS9zZS5jCisrKyBiL2RyaXZlcnMvbmZj
L3N0MjFuZmNhL3NlLmMKQEAgLTMxNSw3ICszMTUsNyBAQCBpbnQgc3QyMW5mY2FfY29ubmVj
dGl2aXR5X2V2ZW50X3JlY2VpdmVkCiAJCSAgICBza2ItPmRhdGFbMF0gIT0gTkZDX0VWVF9U
UkFOU0FDVElPTl9BSURfVEFHKQogCQkJcmV0dXJuIC1FUFJPVE87CiAKLQkJdHJhbnNhY3Rp
b24gPSAoc3RydWN0IG5mY19ldnRfdHJhbnNhY3Rpb24gKilkZXZtX2t6YWxsb2MoZGV2LAor
CQl0cmFuc2FjdGlvbiA9IGRldm1fa3phbGxvYyhkZXYsCiAJCQkJCQkgICBza2ItPmxlbiAt
IDIsIEdGUF9LRVJORUwpOwogCQlpZiAoIXRyYW5zYWN0aW9uKQogCQkJcmV0dXJuIC1FTk9N
RU07CmRpZmYgLXUgLXAgYS9kcml2ZXJzL3Njc2kvZXNhczJyL2VzYXMycl9pb2N0bC5jIGIv
ZHJpdmVycy9zY3NpL2VzYXMyci9lc2FzMnJfaW9jdGwuYwotLS0gYS9kcml2ZXJzL3Njc2kv
ZXNhczJyL2VzYXMycl9pb2N0bC5jCisrKyBiL2RyaXZlcnMvc2NzaS9lc2FzMnIvZXNhczJy
X2lvY3RsLmMKQEAgLTE1NDgsNyArMTU0OCw3IEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfZndf
YnVmZmVycyhzdHJ1Y3QgZXMKIAogCWEtPmZpcm13YXJlLm9yaWdfbGVuID0gbGVuZ3RoOwog
Ci0JYS0+ZmlybXdhcmUuZGF0YSA9ICh1OCAqKWRtYV9hbGxvY19jb2hlcmVudCgmYS0+cGNp
ZC0+ZGV2LAorCWEtPmZpcm13YXJlLmRhdGEgPSBkbWFfYWxsb2NfY29oZXJlbnQoJmEtPnBj
aWQtPmRldiwKIAkJCQkJCSAgICAoc2l6ZV90KWxlbmd0aCwKIAkJCQkJCSAgICAoZG1hX2Fk
ZHJfdCAqKSZhLT5maXJtd2FyZS4KIAkJCQkJCSAgICBwaHlzLApAQCAtMTg5NSw3ICsxODk1
LDcgQEAgaW50IGVzYXMycl93cml0ZV92ZGEoc3RydWN0IGVzYXMycl9hZGFwdAogCiAJaWYg
KCFhLT52ZGFfYnVmZmVyKSB7CiAJCWRtYV9hZGRyX3QgZG1hX2FkZHI7Ci0JCWEtPnZkYV9i
dWZmZXIgPSAodTggKilkbWFfYWxsb2NfY29oZXJlbnQoJmEtPnBjaWQtPmRldiwKKwkJYS0+
dmRhX2J1ZmZlciA9IGRtYV9hbGxvY19jb2hlcmVudCgmYS0+cGNpZC0+ZGV2LAogCQkJCQkJ
CSAoc2l6ZV90KQogCQkJCQkJCSBWREFfTUFYX0JVRkZFUl9TSVpFLAogCQkJCQkJCSAmZG1h
X2FkZHIsCkBAIC0yMDY0LDcgKzIwNjQsNyBAQCBpbnQgZXNhczJyX3dyaXRlX2ZzKHN0cnVj
dCBlc2FzMnJfYWRhcHRlCiByZV9hbGxvY2F0ZV9idWZmZXI6CiAJCQlhLT5mc19hcGlfYnVm
ZmVyX3NpemUgPSBsZW5ndGg7CiAKLQkJCWEtPmZzX2FwaV9idWZmZXIgPSAodTggKilkbWFf
YWxsb2NfY29oZXJlbnQoCisJCQlhLT5mc19hcGlfYnVmZmVyID0gZG1hX2FsbG9jX2NvaGVy
ZW50KAogCQkJCSZhLT5wY2lkLT5kZXYsCiAJCQkJKHNpemVfdClhLT5mc19hcGlfYnVmZmVy
X3NpemUsCiAJCQkJKGRtYV9hZGRyX3QgKikmYS0+cHBmc19hcGlfYnVmZmVyLApkaWZmIC11
IC1wIGEvZnMvOXAvdmZzX2lub2RlLmMgYi9mcy85cC92ZnNfaW5vZGUuYwotLS0gYS9mcy85
cC92ZnNfaW5vZGUuYworKysgYi9mcy85cC92ZnNfaW5vZGUuYwpAQCAtMjIzLDcgKzIyMyw3
IEBAIHY5ZnNfYmxhbmtfd3N0YXQoc3RydWN0IHA5X3dzdGF0ICp3c3RhdCkKIHN0cnVjdCBp
bm9kZSAqdjlmc19hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQogewogCXN0
cnVjdCB2OWZzX2lub2RlICp2OWlub2RlOwotCXY5aW5vZGUgPSAoc3RydWN0IHY5ZnNfaW5v
ZGUgKilrbWVtX2NhY2hlX2FsbG9jKHY5ZnNfaW5vZGVfY2FjaGUsCisJdjlpbm9kZSA9IGtt
ZW1fY2FjaGVfYWxsb2Modjlmc19pbm9kZV9jYWNoZSwKIAkJCQkJCQlHRlBfS0VSTkVMKTsK
IAlpZiAoIXY5aW5vZGUpCiAJCXJldHVybiBOVUxMOwpkaWZmIC11IC1wIGEvZHJpdmVycy9z
MzkwL2NyeXB0by96Y3J5cHRfZXAxMW1pc2MuYyBiL2RyaXZlcnMvczM5MC9jcnlwdG8vemNy
eXB0X2VwMTFtaXNjLmMKLS0tIGEvZHJpdmVycy9zMzkwL2NyeXB0by96Y3J5cHRfZXAxMW1p
c2MuYworKysgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL3pjcnlwdF9lcDExbWlzYy5jCkBAIC0x
OTUsMTEgKzE5NSwxMCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBlcDExX2NwcmIgKmFsbG9j
X2NwCiAJc2l6ZV90IGxlbiA9IHNpemVvZihzdHJ1Y3QgZXAxMV9jcHJiKSArIHBheWxvYWRf
bGVuOwogCXN0cnVjdCBlcDExX2NwcmIgKmNwcmI7CiAKLQljcHJiID0ga21hbGxvYyhsZW4s
IEdGUF9LRVJORUwpOworCWNwcmIgPSBremFsbG9jKGxlbiwgR0ZQX0tFUk5FTCk7CiAJaWYg
KCFjcHJiKQogCQlyZXR1cm4gTlVMTDsKIAotCW1lbXNldChjcHJiLCAwLCBsZW4pOwogCWNw
cmItPmNwcmJfbGVuID0gc2l6ZW9mKHN0cnVjdCBlcDExX2NwcmIpOwogCWNwcmItPmNwcmJf
dmVyX2lkID0gMHgwNDsKIAltZW1jcHkoY3ByYi0+ZnVuY19pZCwgIlQ0IiwgMik7CmNvY2Np
Y2hlY2sgZmFpbGVkCg==
--------------76987D1D935724D8FAD36ACF--
