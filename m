Return-Path: <kernel-janitors+bounces-345-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF87F135A
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 13:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EEA51C2178D
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 12:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D8811711;
	Mon, 20 Nov 2023 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpu1ivGu"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DDDFD
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 04:31:15 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40839652b97so13881135e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 04:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700483474; x=1701088274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+ygfjyW2dtt7SNYdGG+a1RKbTlkp8CN0gh3juIVK50=;
        b=gpu1ivGulkhKvdk5so7NtuqUMLlTWTuX2mLaMv/JBLnR0LBsI2dEjcgi7Qp7MSKHn2
         FygvSfqECuoRMQCyIuRPi9ZOLY9a5PMZppkIIzTLBbYmgvtY8jF2jBTmhqSVXhsZS+yS
         csbso2McCRZwKQgOsE69KSLlhM2kpAm++D1lLEoCWTdEz23Pnov9FSY60q90uSx+L6u9
         oA8nK54+DUqOlEBcLBGLwtqoORc8Q1uVQj7lX4ET3zsOODF86cTNubXKLLPmtv0ciQyz
         0JmQBuNQxfgrF6DXu5vx0NrivkQ9ed6rxwGA4DSVX4qZUD0GMneKiXEmSYnw4AFoVgHJ
         WHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700483474; x=1701088274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+ygfjyW2dtt7SNYdGG+a1RKbTlkp8CN0gh3juIVK50=;
        b=YLEgY7vwLcwNJRzXk4a2gDLipj2Z/CK7leWsDVra8EzoIyjyt6HoanvYGXngWoC2GD
         oU424HgTInEX9/Y86qgtJWg0VjL6sIBF2zaZu9LRB0q4cfwjh0hfc/mtIHZgguDLt6wO
         d0B+PJMyV5VEvcxHbXx6JMlf+VBbJxA8q2GimfhG/J8fcqw5RhV3jionXiUtO5dCYdVU
         TTacYbF41WMPDIYr/1pCMm6j/4ZX0ypuVGqs6Vr7Z36hqVlkOz2uGwWHvAPxjV/V8DgB
         ni7a96GHBVqVuuHb++MakmjG+8oFzCitncN7NNUznRzDGI+HOciR2VIq5RaGsRsV3nf+
         RO7g==
X-Gm-Message-State: AOJu0Yy6FG9x3yqH1NegwI6mm50YR2KzfpK1UNlIqgEXIopY0ObpKmkP
	tx0tXLyaksc3iYm9zSO1RYJgYA==
X-Google-Smtp-Source: AGHT+IFH5ZY2W8nrgFtr/VHzEM4XPB2oiuC34QYENqeI3k2VGALPT0oPN0iCaxJHt7hbpyaLHA4VRA==
X-Received: by 2002:a5d:4382:0:b0:32d:a7b0:62b with SMTP id i2-20020a5d4382000000b0032da7b0062bmr3677437wrq.26.1700483474267;
        Mon, 20 Nov 2023 04:31:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d4-20020a5d4f84000000b0032d96dd703bsm11077492wru.70.2023.11.20.04.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:31:13 -0800 (PST)
Date: Mon, 20 Nov 2023 07:31:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Su Hui <suhui@nfschina.com>,
	"Jes.Sorensen@gmail.com" <Jes.Sorensen@gmail.com>,
	"kvalo@kernel.org" <kvalo@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] wifi: rtl8xxxu: correct the error value of 'timeout'
Message-ID: <456145f7-9c6e-4231-aec4-9c02511b6550@suswa.mountain>
References: <20231113054917.96894-1-suhui@nfschina.com>
 <e8b847437ab242d18108d9364360bb8a@realtek.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b847437ab242d18108d9364360bb8a@realtek.com>

On Tue, Nov 14, 2023 at 06:42:50AM +0000, Ping-Ke Shih wrote:
> > diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> > b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> > index 43ee7592bc6e..9cab8b1dc486 100644
> > --- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> > +++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> > @@ -4757,6 +4757,12 @@ void rtl8xxxu_gen1_init_aggregation(struct rtl8xxxu_priv *priv)
> >          *   RxAggPageTimeout = 4 or 6 (absolute time 34ms/(2^6))
> >          */
> > 
> > +       /* REG_RXDMA_AGG_PG_TH + 1 seems to be the timeout register on
> > +        * gen2 chips and rtl8188eu. The rtl8723au seems unhappy if we
> > +        * don't set it, so better set both.
> > +        */
> > +       timeout = 4;
> > +
> >         page_thresh = (priv->fops->rx_agg_buf_size / 512);
> >         if (rtl8xxxu_dma_agg_pages >= 0) {
> >                 if (rtl8xxxu_dma_agg_pages <= page_thresh)
> 
> The logic here is:
> 
> 	page_thresh = (priv->fops->rx_agg_buf_size / 512);
> 	if (rtl8xxxu_dma_agg_pages >= 0) {
> 		if (rtl8xxxu_dma_agg_pages <= page_thresh)
> 			timeout = page_thresh;
> 
> Do you know why 'timeout = page_thresh;'? Intuitively, units of 'timeout' and
> 'thresh' are different. Maybe, we should correct here instead?
> 

Yeah.  That's strange.  I'm not convinced this fix is correct.  I'm
hesitant to suggest this but maybe the following is the correct fix?
It just silences the warning but doesn't change runtime.

I don't know.  *shrug*.  One thing that we could do is just leave the
warning as-is until someone who knows better than we do can take a look
at it.

regards,
dan carpenter

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
index 43ee7592bc6e..68d9b4a0ee63 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
@@ -4759,16 +4759,16 @@ void rtl8xxxu_gen1_init_aggregation(struct rtl8xxxu_priv *priv)
 
 	page_thresh = (priv->fops->rx_agg_buf_size / 512);
 	if (rtl8xxxu_dma_agg_pages >= 0) {
-		if (rtl8xxxu_dma_agg_pages <= page_thresh)
-			timeout = page_thresh;
-		else if (rtl8xxxu_dma_agg_pages <= 6)
-			dev_err(&priv->udev->dev,
-				"%s: dma_agg_pages=%i too small, minimum is 6\n",
-				__func__, rtl8xxxu_dma_agg_pages);
-		else
-			dev_err(&priv->udev->dev,
-				"%s: dma_agg_pages=%i larger than limit %i\n",
-				__func__, rtl8xxxu_dma_agg_pages, page_thresh);
+		if (rtl8xxxu_dma_agg_pages > page_thresh) {
+			if (rtl8xxxu_dma_agg_pages <= 6)
+				dev_err(&priv->udev->dev,
+					"%s: dma_agg_pages=%i too small, minimum is 6\n",
+					__func__, rtl8xxxu_dma_agg_pages);
+			else
+				dev_err(&priv->udev->dev,
+					"%s: dma_agg_pages=%i larger than limit %i\n",
+					__func__, rtl8xxxu_dma_agg_pages, page_thresh);
+		}
 	}
 	rtl8xxxu_write8(priv, REG_RXDMA_AGG_PG_TH, page_thresh);
 	/*

