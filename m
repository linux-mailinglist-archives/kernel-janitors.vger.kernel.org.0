Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CFB43E672
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Oct 2021 18:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhJ1QrJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Oct 2021 12:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhJ1QrI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Oct 2021 12:47:08 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4905C061570
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Oct 2021 09:44:41 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id f8so4819137plo.12
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Oct 2021 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jSIfnI7MQAHzmYbWsa55tC1HPw8ddYjjYO0zKn+HJ8s=;
        b=ywUtE77eKqUVOePjgXz+r0KqYm7mtXBFy3cYHBMbed+RnvptTuh54lPXKIpoxULqoj
         ii9zyeMF4Vev0ewU33J3USJnKWMjUGyV1iIS5a4YL8YRbauaaWih5XZFU0z1xasrwUcg
         J/ogNZAqB+vRAD/JLE0eNxyDY9NWoKtyb03AfLDra0Asxw/49u0CfkNgz47gvVQNVCBZ
         mJLdoroh3KQrBJEqZ6ewVTDo3TyqnvowgBgWh84EYofvYJhdtkn0unmZ0cPVJcirwOoX
         SoeYo/F3NGSySBNA1bCqHqlrVWRJrnm7VIAodgGXqO1wKdmAo4C22piaxpbZHbG3Wh4y
         SgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jSIfnI7MQAHzmYbWsa55tC1HPw8ddYjjYO0zKn+HJ8s=;
        b=3YzE9+Rb0xbkV8vIdcA5eGjJ3JW1Tqxb307qz8bNlFwZdRJnwB5Q5h5TU0WCtaEON1
         Dix3NGLcgLHu1ZJA00LkDsBB1GtSTkUUoODwtLcP/+045Z+mgukTw5fV17fMwkeBxFsH
         ufehgxc2JzqiWqjhNG9EWnFZ7va4VMXiKJZ7N7td4TBhare407juGHDoU9aYd8+h7fp8
         8rG6emLAqLBDBrxXkTVuCHbLaQGTQgbuZaE6xJQkjHQfKiwMo2Wi+Vhjm5liLT35btsP
         1Fr7pOZudfOIsEnbLATTgyFIcIGwff5Wa73YCujNSVhnutHjLbEyZeEkICCkhhnFOnO3
         BjQw==
X-Gm-Message-State: AOAM532YCEydTdMcAOUEaBT1HYI00SKakg3Bbgt5pfXcCDvRaUtcuTz1
        ofAn+sGKb5MDuxPKT7JJw71phQ==
X-Google-Smtp-Source: ABdhPJx82C63B35ZWB+HVNntHTa/NJT3Hk+DKgJOMXkel40VGwu1VgN5Lw975JF9hobnf6bT22adMw==
X-Received: by 2002:a17:902:e789:b0:140:801:1262 with SMTP id cp9-20020a170902e78900b0014008011262mr4865442plb.42.1635439481231;
        Thu, 28 Oct 2021 09:44:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g17sm3349474pfc.193.2021.10.28.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:44:39 -0700 (PDT)
Date:   Thu, 28 Oct 2021 10:44:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Joe Perches <joe@perches.com>, suzuki.poulose@arm.com,
        mike.leach@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coresight: Use devm_bitmap_zalloc when applicable
Message-ID: <20211028164437.GA4045120@p14s>
References: <e5fe23370794e2f5442e11e7f8455ddb06e4b10a.1635016943.git.christophe.jaillet@wanadoo.fr>
 <663d3820f118c37a81529b3362b95e09c8e75e9f.camel@perches.com>
 <bb913ce7-bae6-3b3e-180f-946786f7d300@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb913ce7-bae6-3b3e-180f-946786f7d300@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Good day,

On Sat, Oct 23, 2021 at 10:09:14PM +0200, Christophe JAILLET wrote:
> Le 23/10/2021 � 21:36, Joe Perches a �crit�:
> > On Sat, 2021-10-23 at 21:24 +0200, Christophe JAILLET wrote:
> > > 'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()' to
> > > simplify code, improve the semantic and avoid some open-coded arithmetic
> > > in allocator arguments.
> > []
> > > diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> > []
> > > @@ -862,7 +862,6 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
> > >   	struct stm_drvdata *drvdata;
> > >   	struct resource *res = &adev->res;
> > >   	struct resource ch_res;
> > > -	size_t bitmap_size;
> > >   	struct coresight_desc desc = { 0 };
> > >   	desc.name = coresight_alloc_device_name(&stm_devs, dev);
> > > @@ -904,9 +903,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
> > >   	else
> > >   		drvdata->numsp = stm_num_stimulus_port(drvdata);
> > > -	bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
> > > -
> > > -	guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
> > > +	guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp, GFP_KERNEL);
> > >   	if (!guaranteed)
> > >   		return -ENOMEM;
> > >   	drvdata->chs.guaranteed = guaranteed;
> > 
> > guaranteed is also pretty useless
> > 
> 
> I agree, but removing it would make the line with devm_bitmap_zalloc() 86
> chars. This would not be consistent with the rest of the file and would
> (IMHO) require splitting.
> 
> Let see if the maintainer prefer saving one additional line of code, or
> keeping the logic in place.

I think we can get rid of @guaranteed and splitting is fine with me:

        drvdata->chs.guaranteed = devm_bitmap_zalloc(dev,
                                                     drvdata->numsp,
                                                     GFP_KERNEL);

Thanks,
Mathieu


> 
> CJ
> 
