Return-Path: <kernel-janitors+bounces-277-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D67EAA98
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Nov 2023 07:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976D21C20A8E
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Nov 2023 06:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7091B66C;
	Tue, 14 Nov 2023 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B3612A
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 06:43:06 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715A1D44;
	Mon, 13 Nov 2023 22:43:03 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AE6goAQ3719874, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AE6goAQ3719874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 14:42:51 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Tue, 14 Nov 2023 14:42:50 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 14:42:50 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Tue, 14 Nov 2023 14:42:50 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Su Hui <suhui@nfschina.com>,
        "Jes.Sorensen@gmail.com"
	<Jes.Sorensen@gmail.com>,
        "kvalo@kernel.org" <kvalo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtl8xxxu: correct the error value of 'timeout'
Thread-Topic: [PATCH] wifi: rtl8xxxu: correct the error value of 'timeout'
Thread-Index: AQHaFfU176HEg0cqUE+cx76xEkVz7LB5XczQ
Date: Tue, 14 Nov 2023 06:42:50 +0000
Message-ID: <e8b847437ab242d18108d9364360bb8a@realtek.com>
References: <20231113054917.96894-1-suhui@nfschina.com>
In-Reply-To: <20231113054917.96894-1-suhui@nfschina.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.69.94]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: Su Hui <suhui@nfschina.com>
> Sent: Monday, November 13, 2023 1:49 PM
> To: Jes.Sorensen@gmail.com; kvalo@kernel.org
> Cc: Su Hui <suhui@nfschina.com>; linux-wireless@vger.kernel.org; linux-ke=
rnel@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH] wifi: rtl8xxxu: correct the error value of 'timeout'
>=20
> When 'rtl8xxxu_dma_agg_pages <=3D page_thresh', 'timeout' should equal to
> 'page_thresh' rather than '4'. Change the code order to fix this problem.
>=20
> Fixes: 614e389f36a9 ("rtl8xxxu: gen1: Set aggregation timeout (REG_RXDMA_=
AGG_PG_TH + 1) as well")

I think this should fix
Fixes: fd83f1227826 ("rtl8xxxu: gen1: Add module parameters to adjust DMA a=
ggregation parameters")

> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  .../net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> index 43ee7592bc6e..9cab8b1dc486 100644
> --- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> +++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> @@ -4757,6 +4757,12 @@ void rtl8xxxu_gen1_init_aggregation(struct rtl8xxx=
u_priv *priv)
>          *   RxAggPageTimeout =3D 4 or 6 (absolute time 34ms/(2^6))
>          */
>=20
> +       /* REG_RXDMA_AGG_PG_TH + 1 seems to be the timeout register on
> +        * gen2 chips and rtl8188eu. The rtl8723au seems unhappy if we
> +        * don't set it, so better set both.
> +        */
> +       timeout =3D 4;
> +
>         page_thresh =3D (priv->fops->rx_agg_buf_size / 512);
>         if (rtl8xxxu_dma_agg_pages >=3D 0) {
>                 if (rtl8xxxu_dma_agg_pages <=3D page_thresh)

The logic here is:

	page_thresh =3D (priv->fops->rx_agg_buf_size / 512);
	if (rtl8xxxu_dma_agg_pages >=3D 0) {
		if (rtl8xxxu_dma_agg_pages <=3D page_thresh)
			timeout =3D page_thresh;

Do you know why 'timeout =3D page_thresh;'? Intuitively, units of 'timeout'=
 and
'thresh' are different. Maybe, we should correct here instead?



