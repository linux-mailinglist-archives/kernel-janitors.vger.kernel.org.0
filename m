Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF64F44419
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 18:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730977AbfFMQet (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 12:34:49 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38393 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730752AbfFMHtf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 03:49:35 -0400
Received: by mail-qt1-f193.google.com with SMTP id n11so19353768qtl.5
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xROEx50vg3PrTIRbBL87vn9xq3zmqd182DXiss4gqbM=;
        b=q3wHpbh5ZcLjlQW7kj7YYZuO2MWWre3rKFc1xRiJRLPzhfF+0X6mVWIIMfzvS7Rsiu
         qlPzgPoi0qh7StRWKqeJwocEpa4r/p/0lRP7wTbxbWhwGRycC1XHHnsa7tARYuIaHZnm
         j4fLn76lVPiHH7mJirtdmCF6+fHru+SnN8zCtaQN7+7PoewJmPVd16kR6ZrQZ/OpXdP8
         klOVVdV4cUYSIuz7trkXErJMZt7wxUdrHLY+SR+Rc+VfJ21s3amIh7TVMbdmHYZLN7gZ
         hdO61fuW89DO1MElkjaiiN2Xw4u7bb1mVsfdNf85byeAIDhSG0GKhEeZ38Xl8sFqqo2p
         a21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xROEx50vg3PrTIRbBL87vn9xq3zmqd182DXiss4gqbM=;
        b=aL+80dYxDE+2mMRpJzZomLALmdw75/L+rvea/rFzgWCRfC6Hg3r3gkf0sD5Vmr4sbA
         FeHmRpJggyCrA1fu4O6Bx1bGg0Uf8bZPFXJMGV5V0bD7FfCWkk0uZSYc94/FvqhLn73m
         4UIf/zbQthWpsVD/RYp9Fw92gnkvjyTRfh/1IcP/FVlwpN0YcPPe15TreZKmKhSHeAlt
         gTR6MyhJE4jKRB6xgJpfFCCxO3zhdgiTSPzo+UbWrsdRxBiUCV0YLdyqQnREUeYGpQW+
         W20PIRm4yj6wqITJWwjLz3A8QaoRJHg0rUA9FScNtRRvYTS7FUzAP43HpwiadFDF/oif
         UfsQ==
X-Gm-Message-State: APjAAAWqSvWZuaThYRoKbWuq74hPuAbXLo/pTM3A3Bu/CVUV4I776i1U
        LuwDiCvXjojtWVyrx03HkjYMvQ==
X-Google-Smtp-Source: APXvYqwEurFoZHKAEhOSIDN36DqZuW8gdc1FPaANBB2DIiStrJOy1JF8fsQVRp2blw4EqjOl1eZlsQ==
X-Received: by 2002:ac8:3668:: with SMTP id n37mr29172383qtb.236.1560412174396;
        Thu, 13 Jun 2019 00:49:34 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1322-146.members.linode.com. [45.79.223.146])
        by smtp.gmail.com with ESMTPSA id s44sm1537967qtc.8.2019.06.13.00.49.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 00:49:33 -0700 (PDT)
Date:   Thu, 13 Jun 2019 15:49:22 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-ID: <20190613074922.GB21113@leoy-ThinkPad-X240s>
References: <20190613065815.GF16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613065815.GF16334@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Jun 12, 2019 at 11:58:15PM -0700, Dan Carpenter wrote:
> The "drvdata->atclk" clock is optional, but if it gets set to an error
> pointer then we're accidentally return an uninitialized variable instead
> of success.

You are right, thanks a lot for pointing out.

I'd like to initialize 'ret = 0' at the head of function, so we can
has the same fashion with other CoreSight drivers (e.g. replicator).

 static int funnel_probe(struct device *dev, struct resource *res)
 {
-	int ret;
+	int ret = 0;

If you agree, could you send a new patch for this?

Thanks,
Leo Yan

> Fixes: 78e6427b4e7b ("coresight: funnel: Support static funnel")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 5867fcb4503b..fa97cb9ab4f9 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -244,6 +244,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	}
>  
>  	pm_runtime_put(dev);
> +	ret = 0;
>  
>  out_disable_clk:
>  	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> -- 
> 2.20.1
> 
