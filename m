Return-Path: <kernel-janitors+bounces-349-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3707A7F1550
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 15:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1B2E2825C2
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 14:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57F11C287;
	Mon, 20 Nov 2023 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="as6b0PaR"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5B9BC
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 06:09:22 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso55671551fa.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 06:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700489360; x=1701094160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUT5G9wWKDux+q/3wEibNtR/ItuQhmKh/lwb8ikN/Rg=;
        b=as6b0PaRvP3yHBollblKs+tz7joLu75qq4EQo3nBJAcwjGZ6XirOvH7A8XavQHKPkX
         tWETe7HHKojaJacbQrEwOk8qovZbOkuPFM1wxa/3Sn3bHdRtpZIHyMs69z8QOKHMdh9V
         peeokx7CMuaLoi+3ma0uouS6fwuUxt/7y+kFI81mFTPsTVDDb7SP2H3+0Q6K2/Q6/V6a
         QNzOBRDQN64E4yTBlpOJybe+Dl59fxvZs9yX3kjLVUUULgUaNwCQ6Ce2PD/0fY3DQvq+
         7wtQRZdSJSAKo9RnWdH7Yg95SpzTNcAwAtV/Ili+MdbLroAe1VZbnhox6+3YEC6yMmGH
         GRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700489360; x=1701094160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUT5G9wWKDux+q/3wEibNtR/ItuQhmKh/lwb8ikN/Rg=;
        b=Up9dkG4udw3Xh4COUd8Yb17Mnq6hKCX3BPLvTniAccg6dnH54PSmx3WwqMlXn9BMo2
         SfP/uBsmvHUifsuQary5DDRbf8u6YPTlRcCR+oDKadj8uqC0PnirmV7FteKVCGhtP9pP
         dUbyqHBgASAODHrEJ67coW4Qm6jheSvuQ1qvZzb+SDPoM4eK4iazfco2rDQ9oMBrCz5K
         kbuWfMZ4+ZWGd9jUupYNO/H41gPYVXNh+oi4ogTqb9y7beXbgVIye6Su3m+78CC3IB26
         LCixRrnlMbBtYHgHcpOkjl/X1wFOuqc1x6S2B++Hfi0pxqOesqzl0ABeqlqN0GxaAzTq
         Kcyw==
X-Gm-Message-State: AOJu0YwQJaCgnc3Dxk1ScCPfHrbgkjJOrxj4SM1BSqUn1NG9Sh5IDgtu
	lZh8EDinWb8TNSoLDLJadq/gTg==
X-Google-Smtp-Source: AGHT+IFbXKYY9UNUZ8jVcSKkbWSASIFyrO+LxDhQ3+XU4oa71aGhP+E2nN9ls2SkWYQquuniadlVuA==
X-Received: by 2002:a2e:9101:0:b0:2c5:32b:28fa with SMTP id m1-20020a2e9101000000b002c5032b28famr6563347ljg.30.1700489360533;
        Mon, 20 Nov 2023 06:09:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020adfcc8b000000b0032d9337e7d1sm11358195wrj.11.2023.11.20.06.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:09:20 -0800 (PST)
Date: Mon, 20 Nov 2023 09:09:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Su Hui <suhui@nfschina.com>,
	"Jes.Sorensen@gmail.com" <Jes.Sorensen@gmail.com>,
	"kvalo@kernel.org" <kvalo@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: rtl8xxxu: correct the error value of 'timeout'
Message-ID: <4b34643f-812e-4aad-9a10-eee5bc553144@suswa.mountain>
References: <20231115050123.951862-1-suhui@nfschina.com>
 <ff8637fc05324c04a447ea505d8eba1b@realtek.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff8637fc05324c04a447ea505d8eba1b@realtek.com>

On Fri, Nov 17, 2023 at 02:53:52AM +0000, Ping-Ke Shih wrote:
> 
> 
> > -----Original Message-----
> > From: Su Hui <suhui@nfschina.com>
> > Sent: Wednesday, November 15, 2023 1:01 PM
> > To: Ping-Ke Shih <pkshih@realtek.com>; Jes.Sorensen@gmail.com
> > Cc: Su Hui <suhui@nfschina.com>; kvalo@kernel.org; linux-wireless@vger.kernel.org;
> > linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH v2] wifi: rtl8xxxu: correct the error value of 'timeout'
> > 
> > When 'rtl8xxxu_dma_agg_pages <= page_thresh', 'timeout' should equal to
> > 'page_thresh' rather than '4'. Change the code order to fix this problem.
> > 
> > Fixes: fd83f1227826 ("rtl8xxxu: gen1: Add module parameters to adjust DMA aggregation parameters")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> 
> Checking logic of agg_pages and agg_timeout, I think we should correct it
> by below changes. So, NACK this patch. 
> 
> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> index 43ee7592bc6e..c9e227aed685 100644
> --- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> +++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> @@ -4760,7 +4760,7 @@ void rtl8xxxu_gen1_init_aggregation(struct rtl8xxxu_priv *priv)
>         page_thresh = (priv->fops->rx_agg_buf_size / 512);
>         if (rtl8xxxu_dma_agg_pages >= 0) {
>                 if (rtl8xxxu_dma_agg_pages <= page_thresh)
> -                       timeout = page_thresh;
> +                       page_thresh = rtl8xxxu_dma_agg_pages;

Yeah.  That looks correct.  What I suggested earlier was wrong.

regards,
dan carpenter


