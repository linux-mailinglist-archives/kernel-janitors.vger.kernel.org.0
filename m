Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A54611594
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Oct 2022 17:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiJ1PLt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Oct 2022 11:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiJ1PLp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Oct 2022 11:11:45 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A285920C988
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Oct 2022 08:11:43 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v1so6968879wrt.11
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Oct 2022 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYsYDN/9U77er5LwBW/7flkKgbzRyFNT02oZoD9+In4=;
        b=HbC7E+FwUGdmEfhHnqMLLhXh061DSx67561QITOF82Mmf2C76MjQGDOF48NpXYdOSY
         RKzjMUeLnwoDLB/RVgdhs8Yk86lV8HIVFxB+4porUhyBPMad7PIpBj4/ZbI4PfCf5gRR
         OzqwUQiw497Yvf0PDeFj3hW3T7qZwA/fB/QuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYsYDN/9U77er5LwBW/7flkKgbzRyFNT02oZoD9+In4=;
        b=xk5ic75NyUBhco+SQhEs76qOX7mBZ6pczTNGe1or6KhGDvFOKhuHoFmgvXsvZR/zHP
         8fTpJrUtTs3tuz/pXZP/ZXmJzaEixyznKCGCmXtimsxzHP1UOtBJCB62p2oHqFSXi38P
         uKofAhVZrW9L5pLPXKTVJhHKJcNYr3Xr7CeO8JHOI6UX7/hmszt2E03AP6euxVGZGGcV
         BNrPWiw7IgmH3FRp4KfHoUNHrXz3z8KjpRc5pEWB+E/xIEAdrK1bvaTCT/qSsJEj4xV9
         llRk6zS7REmdkosTQSZCxJnRXKsfMtMfjK2XlIFgoReL1/vO9DjL/PBD74dMJ4IhZHDc
         0SbA==
X-Gm-Message-State: ACrzQf1E+yjU+Rl9YMvns5m/weU4+trzm5SQnjyLuEov+N5VmQWpxUn7
        4mSlJoJ1u/2vz2eNQB89M66tXw==
X-Google-Smtp-Source: AMsMyM692YCiSxcG76lFQQcRte83LusC1Q3bFUw+bKozbWIC/B6KBmpgx6sxqLUD+XRPVQ/i+FS8EQ==
X-Received: by 2002:adf:e3cc:0:b0:235:95b1:2124 with SMTP id k12-20020adfe3cc000000b0023595b12124mr30110484wrm.693.1666969902249;
        Fri, 28 Oct 2022 08:11:42 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-54-207.cust.vodafonedsl.it. [188.217.54.207])
        by smtp.gmail.com with ESMTPSA id i6-20020adfdec6000000b002366ded5864sm3974926wrn.116.2022.10.28.08.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:11:41 -0700 (PDT)
Date:   Fri, 28 Oct 2022 17:11:39 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Slark Xiao <slark_xiao@163.com>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: saa7164: remove variable cnt
Message-ID: <20221028151139.GB165737@tom-ThinkPad-T14s-Gen-2i>
References: <20221024151354.2166343-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024151354.2166343-1-colin.i.king@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On Mon, Oct 24, 2022 at 04:13:54PM +0100, Colin Ian King wrote:
> Variable cnt is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/media/pci/saa7164/saa7164-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
> index d5f32e3ff544..01d75ef2342d 100644
> --- a/drivers/media/pci/saa7164/saa7164-core.c
> +++ b/drivers/media/pci/saa7164/saa7164-core.c
> @@ -352,7 +352,7 @@ static void saa7164_work_enchandler(struct work_struct *w)
>  		container_of(w, struct saa7164_port, workenc);
>  	struct saa7164_dev *dev = port->dev;
>  
> -	u32 wp, mcb, rp, cnt = 0;
> +	u32 wp, mcb, rp;
>  
>  	port->last_svc_msecs_diff = port->last_svc_msecs;
>  	port->last_svc_msecs = jiffies_to_msecs(jiffies);
> @@ -405,7 +405,6 @@ static void saa7164_work_enchandler(struct work_struct *w)
>  
>  		saa7164_work_enchandler_helper(port, rp);
>  		port->last_svc_rp = rp;
> -		cnt++;
>  
>  		if (rp == mcb)
>  			break;
> @@ -429,7 +428,7 @@ static void saa7164_work_vbihandler(struct work_struct *w)
>  		container_of(w, struct saa7164_port, workenc);
>  	struct saa7164_dev *dev = port->dev;
>  
> -	u32 wp, mcb, rp, cnt = 0;
> +	u32 wp, mcb, rp;
>  
>  	port->last_svc_msecs_diff = port->last_svc_msecs;
>  	port->last_svc_msecs = jiffies_to_msecs(jiffies);
> @@ -481,7 +480,6 @@ static void saa7164_work_vbihandler(struct work_struct *w)
>  
>  		saa7164_work_enchandler_helper(port, rp);
>  		port->last_svc_rp = rp;
> -		cnt++;
>  
>  		if (rp == mcb)
>  			break;
> -- 
> 2.37.3
> 

Looks good to me.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
