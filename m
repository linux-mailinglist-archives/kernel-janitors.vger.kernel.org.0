Return-Path: <kernel-janitors+bounces-4450-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1F9241C0
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2024 17:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859A61F27152
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2024 15:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116861BA896;
	Tue,  2 Jul 2024 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LPueMaaE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8901BB6B7
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jul 2024 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719932483; cv=none; b=lYmPn7C4Jx46voUm1yPZmBmpKpW7LcAMUlvuX+4+N7Av99zRIyCs3O27TdVWzIVVkPj+RwBHr5zbB9yN+tBe48JWLxEOZ7J+ndo2FwyyKfLVVLxs3kabZkQNsH7mSoyL8l7EKpWTQv1b3eLOyKgCLFGhMnN4nMDLD1HTDPVHEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719932483; c=relaxed/simple;
	bh=50bsl9IFJSIXbFepQy0mLoLxioZTN4ZUMufXK5ax2R4=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=eJdqETXmtqgLqQtHdk1CTYpexbSs0uL9nj5F21pQTJny+BoAx2OhfY7uIS/1nLGzSZOgeMM2O0PnFlsYXIPbcmVf2NLkjQyfbI45ocRhXbDTSYg+L+rdzfofwZ7DCQ91G7EbfEnKnwF2B+sSI7b1nRfWT+pmok2bv4ThrmSDPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LPueMaaE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-79c076c0d83so257146885a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2024 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1719932481; x=1720537281; darn=vger.kernel.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdwQPB8/WgmyTCTJOTOxS5iplAACsbozoBQv06W1zr0=;
        b=LPueMaaEFYbBSI9aI7wB08Xk6HqD71LclbEBomDStvIatuWaqN6rrz7npfSNhnvq7y
         DQzIVjPw62dw0dO4WJ0C2c50lgPbVcwYfKl+9iRYLR/OtwL35TBlbaRPJHm/MrZ1F9ep
         LWWIIhqfohEADdE8NhNNa6OaqBGTSJ90JIs9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719932481; x=1720537281;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdwQPB8/WgmyTCTJOTOxS5iplAACsbozoBQv06W1zr0=;
        b=PtQh+VKgfbZWrESCeTH23zMJXh7TzefvdFXRDI9B2WbWF5+0exbt3UdOviYvzTCtuR
         o1DrbsjR/g7gqofJeJ2vrrC2+RdIBKL1YBCxot7ytUT75OFZOQznICC9Z4zHYz3YItUZ
         rDYGQTNVpeAcy0MVFlT0tWIYw2dmHqEfrxWg9fj+mLBf/KCJNo+LdzZgSHKhB8iVN0Dv
         mEkDxlUi4XTMQlIYpscKvwIRGibAT/ZAqSlXvmVyyqGWIMdID1VMLP2eA9qSqTWoOVJ1
         stkGxSz2cciS/klGL/ItYqB+b/h76D4cU5tCYRO988b+zYNqZEzsLNUAZlkYyio8QG/O
         EVFw==
X-Forwarded-Encrypted: i=1; AJvYcCUakw+dPaDadXJJgjXv6x0XyrUeUCIbqeF32kTzNef4ET4qUoGwLyqIn3DTdZLg6oJJPo0DJpEQRdoNmzsl6HZwNAW2M1l/gDAu/6kd+SwC
X-Gm-Message-State: AOJu0YzzlN6ojxHrsvO10JJbEmK/MtVZZDAXIsrVJJcFZb0IIbAF/hxB
	AOFo/EYp3m0Vg1VGY3kVeaX3r2YlL+bfsMhdxYX0dY8h4ehRXKE4XVhCbpIO5g==
X-Google-Smtp-Source: AGHT+IFFStNTYgGdj+GqsrGQpXiBJjbRncg8J9s6u9qrFknNapaz8Uy/bKd9ajTPLOK8cIfpA6gqbg==
X-Received: by 2002:a05:6214:300b:b0:6b5:44c:24ea with SMTP id 6a1803df08f44-6b5b709501emr102967926d6.16.1719932480617;
        Tue, 02 Jul 2024 08:01:20 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5bcf1acc0sm27300076d6.44.2024.07.02.08.01.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2024 08:01:20 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jonas Gorski <jonas.gorski@gmail.com>, Su Hui <suhui@nfschina.com>
CC: <kvalo@kernel.org>, <johannes.berg@intel.com>, <kees@kernel.org>, <a@bayrepo.ru>, <quic_alokad@quicinc.com>, <zyytlz.wz@163.com>, <marcan@marcan.st>, <petr.tesarik.ext@huawei.com>, <duoming@zju.edu.cn>, <colin.i.king@gmail.com>, <u.kleine-koenig@pengutronix.de>, <quic_jjohnson@quicinc.com>, <linville@tuxdriver.com>, <pieterpg@broadcom.com>, <meuleman@broadcom.com>, <frankyl@broadcom.com>, <stanley.hsu@cypress.com>, <wright.feng@cypress.com>, <ian.lin@infineon.com>, <chi-hsien.lin@cypress.com>, <zajec5@gmail.com>, <antonio@open-mesh.com>, <franky.lin@broadcom.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Date: Tue, 02 Jul 2024 17:01:09 +0200
Message-ID: <19073f6bf08.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAOiHx=n5rfCBkO8wfqpa=UgL==Ty9=s1f=roVHiaFy2acQOHtw@mail.gmail.com>
References: <20240702122450.2213833-1-suhui@nfschina.com>
 <CAOiHx=n5rfCBkO8wfqpa=UgL==Ty9=s1f=roVHiaFy2acQOHtw@mail.gmail.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH wireless 0/9] wifi: cfg80211: avoid some garbage values
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009400c2061c44fc14"

--0000000000009400c2061c44fc14
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On July 2, 2024 4:02:39 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:

> Hi,
>
> On Tue, 2 Jul 2024 at 14:50, Su Hui <suhui@nfschina.com> wrote:
>>
>> Clang static checker (scan-build) has some warnings as follows.
>>
>> included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:16
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:2:
>> warning:Assigned value is garbage or undefined [core.uninitialized.Assign]
>> 123 |         __le32 data_le = cpu_to_le32(*data);
>> |         ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3:warning
>> Value stored to 'err' is never read [deadcode.DeadStores]
>>
>> There are some functions like brcmf_fil_{cmd,iovar,basscfg}_int_get()
>> which read the value of its parameter, but some callers have not
>> initialized these parameters which will be read. And this patchset fixes
>> these problems.
>
> The core issue here seems to be that
> brcmf_fil_{cmd,iovar,basscfg}_int_get() function (needlessly?) read
> from *data.
>
> So instead of forcing all callers of
> brcmf_fil_{cmd,iovar,basscfg}_int_get() to initialize *data first, I
> suggest changing brcmf_fil_{cmd,iovar,basscfg}_int_get() to just not
> read from it.
>
> I see no reason why they should care about what the previous value
> was, since they are supposed to overwrite it anyway.

The issue here is that these are generic functions and there is a reason. 
Some firmware API primitives allow/require the caller to pass selection 
parameters in *data. We wanted to keep the functions generic and leave out 
that knowledge. I suppose we could introduce a separate set of api 
functions for that purpose, but it seems like significant overhead to 
silence compiler warnings. Guess I underestimate the potential risk of 
leaking few bytes of stack data.


Regards,
Arend





--0000000000009400c2061c44fc14
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
2Gzj3QNJRLsZu1TLyOyBBIr/BE7UiY3RabgRzknBGAPmzhS+fmyM8OtM5BYBsFBrSUFtZZO2p/tf
Nbc24J2zf2peoZ8MK+7WQqummYlOnz+FyDkA9EybeNMcS5C+xi/PAgMBAAGjggHdMIIB2TAOBgNV
HQ8BAf8EBAMCBaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYI
KwYBBQUHMAGGNWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24y
Y2EyMDIwME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqG
OGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3Js
MCcGA1UdEQQgMB6BHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYB
BQUHAwQwHwYDVR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFIikAXd8CEtv
ZbDflDRnf3tuStPuMA0GCSqGSIb3DQEBCwUAA4IBAQCdS5XCYx6k2GGZui9DlFsFm75khkqAU7rT
zBX04sJU1+B1wtgmWTVIzW7ugdtDZ4gzaV0S9xRhpDErjJaltxPbCylb1DEsLj+AIvBR34caW6ZG
sQk444t0HPb29HnWYj+OllIGMbdJWr0/P95ZrKk2bP24ub3ZP/8SyzrohfIba9WZKMq6g2nTLZE3
BtkeSGJx/8dy0h8YmRn+adOrxKXHxhSL8BNn8wsmIZyYWe6fRcBtO3Ks2DOLyHCdkoFlN8x9VUQF
N2ulEgqCbRKkx+qNirW86eF138lr1gRxzclu/38ko//MmkAYR/+hP3WnBll7zbpIt0jc9wyFkSqH
p8a1MYICbTCCAmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1z
YTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMTv1t
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCHEpuiGSTh+tj9jQ0c
lbBFEX6PxCSaLD+AwUpZnKrMCzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yNDA3MDIxNTAxMjFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAWsdgkI0g3cy0UBzh0fqNfA43NBnWcTktPJ1l
CzRZrCVNpnsqJPjqGn3O8PadMicICDHa+TocZAkamrdxSHTXGXvSU3egSUxyrew75+O39wGkWpdS
hrObifdYKHK7dc6man0lMrIDBHPTeT5MhYuo+ytobtQHLCpeIzuhFkjZP1Cf5ufi6IpXFd54/js/
UHzlVc6Izo/PT/8C11/Lywq99tNM/P44Hfmg7TGpVHLGSzhCtqA2nJ7p8YKtmdAwae8IV6E1AiCO
VBfV/bL1m0tC8LMtLZHcJ2z9o0RsDMWijMz4CBAQOUXdrMFPiPKu64NMkLIWFfbe79pmqFb+HZ//
lQ==
--0000000000009400c2061c44fc14--

