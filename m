Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30DD1CD698
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 May 2020 12:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgEKKbf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 May 2020 06:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729287AbgEKKbe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 May 2020 06:31:34 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55129C061A0E
        for <kernel-janitors@vger.kernel.org>; Mon, 11 May 2020 03:31:34 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id b8so4354367pgi.11
        for <kernel-janitors@vger.kernel.org>; Mon, 11 May 2020 03:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CqplYl+v02aohkq5RzICqUNP1BB3Vo0bAlpeWACTjsg=;
        b=OIBL1c2oNzdA2PW88y02Kjfx9QecMEVWtmhdOX5GmiAkqxQPazll/DY7jcMX0QhJBJ
         kD2Wm8bk/cKnXsWcaOGX6KZsLXPiDPI4ErKmMPTADvrqBOlc1FZx/RXhvdU4vOWYUUdi
         1AQwqke7d04b99Jcov11RRnRbbzPEGE7WzlCmM053XTdZvxp1WwW9r3ZRaHMqB5SxByq
         vitkEBdX1YsCPq2PyK/HYpU62qi8Br2QwOm1Ab7E7CFCaxirT8iYzHdcXsMYiKRao16z
         1ZmcJH1AUORI81vKWaLUPYsAECPrag5WjRYvJCfTMSg32l9743Vc1BT3cdJbhzJY5CCi
         JWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CqplYl+v02aohkq5RzICqUNP1BB3Vo0bAlpeWACTjsg=;
        b=UihZnfx8MVezHiGI6NhS5blXaNUn8uEw5GUCW3+BoTaGDPyqSmqsP2nbcd8VPsMXCN
         HH1z3n6YBl8vyMvghgzjW90106YBPUGOcp+r4NW2oo8jQWrB7/oW63R6ccityfgeToyj
         309MTMF6Y3EwreV6U7ckhvbXj5taSkuhpEw0YjMVoxfA3Ck/vnZWgd3KdAKd8KJd4V5G
         l4foClOk89kYTKgCH1aLEbvCJ2KlI06jaEgmuYurMSKEbtBvewbLwmKRi0YOVGZ9q6m6
         w9rhNk8CpVX+ppDVb8JJepaIzkQ+I8VJs0rImG5DXdZlporUBaa4WC/clQWedM/+bx6r
         AtYA==
X-Gm-Message-State: AGi0PuZOdc3PlOwvZwDFMu2tiOC+ynW1ACOCBOPwXAMm4QUPohgVMSRx
        3wT9dvVnqAYAketQbqnnRhWy
X-Google-Smtp-Source: APiQypKT9DJXaUsGN5QsdS+95yeBUKH3QXCgmQXSohCAoBOYC3R8g/K5YAe87nP1a2HOXw9ax/ANdg==
X-Received: by 2002:a62:1789:: with SMTP id 131mr15905969pfx.287.1589193093396;
        Mon, 11 May 2020 03:31:33 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id n23sm9552826pjq.18.2020.05.11.03.31.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:31:32 -0700 (PDT)
Date:   Mon, 11 May 2020 16:01:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] bus: mhi: core: Fix some error return code
Message-ID: <20200511103124.GA12753@mani>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509075654.175002-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 0509, Wei Yongjun wrote:
> Fix to return negative error code from the error handling case
> instead of 0 in mhi_init_dev_ctxt() and mhi_driver_probe().
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index eb2ab058a01d..1f8c82603179 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -291,6 +291,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* Setup cmd context */
> +	ret = -ENOMEM;
>  	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
>  						sizeof(*mhi_ctxt->cmd_ctxt) *
>  						NR_OF_CMD_RINGS,
> @@ -1100,6 +1101,7 @@ static int mhi_driver_probe(struct device *dev)
>  		}
>  	}
>  
> +	ret = -EINVAL;
>  	if (dl_chan) {
>  		/*
>  		 * If channel supports LPM notifications then status_cb should
> 
> 
> 
