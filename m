Return-Path: <kernel-janitors+bounces-425-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A07F6EEF
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Nov 2023 09:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EC991C20E77
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Nov 2023 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F894C6E;
	Fri, 24 Nov 2023 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B630D53;
	Fri, 24 Nov 2023 00:53:26 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AO8pJvQ53617164, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AO8pJvQ53617164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Nov 2023 16:51:21 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 24 Nov 2023 16:51:20 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 24 Nov 2023 16:51:15 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 24 Nov 2023 16:51:15 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Su Hui <suhui@nfschina.com>,
        "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>,
        "kvalo@kernel.org" <kvalo@kernel.org>,
        "nathan@kernel.org" <nathan@kernel.org>,
        "ndesaulniers@google.com"
	<ndesaulniers@google.com>,
        "trix@redhat.com" <trix@redhat.com>
CC: "lizetao1@huawei.com" <lizetao1@huawei.com>,
        "linville@tuxdriver.com"
	<linville@tuxdriver.com>,
        "Larry.Finger@lwfinger.net"
	<Larry.Finger@lwfinger.net>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
Thread-Topic: [PATCH v2 2/2] wifi: rtlwifi: rtl8821ae: phy: fix an undefined
 bitwise shift behavior
Thread-Index: AQHaHnqh3ek0X9cmrkSIvDKQ0v3B9rCJKRKA
Date: Fri, 24 Nov 2023 08:51:15 +0000
Message-ID: <167fbc7a77db447d90f696666f6f0a9b@realtek.com>
References: <20231124020352.1660621-1-suhui@nfschina.com>
 <20231124020352.1660621-2-suhui@nfschina.com>
In-Reply-To: <20231124020352.1660621-2-suhui@nfschina.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: Su Hui <suhui@nfschina.com>
> Sent: Friday, November 24, 2023 10:04 AM
> To: dan.carpenter@linaro.org; Ping-Ke Shih <pkshih@realtek.com>; kvalo@ke=
rnel.org; nathan@kernel.org;
> ndesaulniers@google.com; trix@redhat.com
> Cc: Su Hui <suhui@nfschina.com>; lizetao1@huawei.com; linville@tuxdriver.=
com; Larry.Finger@lwfinger.net;
> linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org; llvm@lists.=
linux.dev;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH v2 2/2] wifi: rtlwifi: rtl8821ae: phy: fix an undefined b=
itwise shift behavior
>=20

[...]

>=20
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> index 6df270e29e66..52ab1b0761c0 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> @@ -31,7 +31,12 @@ static u32 _rtl8821ae_phy_calculate_bit_shift(u32 bitm=
ask)
>  {
>         u32 i =3D ffs(bitmask);
>=20
> -       return i ? i - 1 : 32;
> +       if (!i) {
> +               WARN_ON_ONCE(1);
> +               return 0;
> +       }
> +
> +       return i - 1;
>  }

Personally, I prefer to use __ffs(), because in normal case no need additio=
nal '-1',
and abnormal cases should not happen.=20



