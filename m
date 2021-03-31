Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968D635065F
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Mar 2021 20:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhCaSci (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 31 Mar 2021 14:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhCaScU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Mar 2021 14:32:20 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B7C06174A
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Mar 2021 11:32:19 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id n140so20920139oig.9
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Mar 2021 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qpDJgLSf+XhBZgWjOA4HUIRo8TMIOMt4qQN8xcUT7Yc=;
        b=RtkjC0li+ibQ4Jqa4lRUa7G264zhtqFQ0ippTOexSIit4u0rgqCjWmvEi59FLRlMJw
         C5hGgoCAT+8X5Kekza3SlgPOZrermppqx8iclo+ZGv4pOiGm8ijyOryQEWcdaDvg3HHM
         7HNknHiNiQ8NGjA6BRXHp3flO7hmlITbC7q+UWXljyawBsgHl+vIId6wnt4wSzuMNrxi
         XA9Hkdm9GBzSRo0BqVo0CMtXFewl6RpbRQAY6N4lZF5d1/eaz5rXGKzogaFHVggYOmbT
         yv95yUjZ+5Qj3sNovTijK8saN4Mm3GpY7Jm93T88BLJToE9P3dMchHidaBzTdz8l7MKT
         PtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qpDJgLSf+XhBZgWjOA4HUIRo8TMIOMt4qQN8xcUT7Yc=;
        b=Aq5LcsLXAlk08oY/5yV97o/l6XIvFTIUGDVNXXmTBXXpcEodaBe4o62xzUiA5k58nF
         tuM4WIDMt3n7au9JcNpJd+R6iLJdpaw+9GqWqYgiL7yKeU8IuThYCjUAiH++skdOX6A4
         L4NJs1rpfWS1FH0GGBfD8uAzOdpVCHqRVaB+St0da273O+MVrVCoO1DcHocKG6pwkqQX
         tMZwr4d+AT1WMSu+h/DwH+shPsxSN9IDlthyI7Ho7lg65InrDFj22xm4lOXTxaOxy+E2
         ZhIybt3pvWpaiE2GYDBnGFTVT+a78RnL3ysgD9vIHRebNPSeWnkex/rcvCVI31GKLYRJ
         9n3A==
X-Gm-Message-State: AOAM530u4tNyaHP84BQODvu6ZRiBIsrgyY8sy53yEh4lJ9RBUpXoSzR3
        qnM5xUU/kT389lSi/aNeTQREqg==
X-Google-Smtp-Source: ABdhPJw9aZIIFK4bl49eSq1vxFZv/ytgNjkVTf40RbmdsFrI/AGg7PHyskOnmBX5Uo3IKDlviOZN8g==
X-Received: by 2002:aca:d442:: with SMTP id l63mr3114260oig.49.1617215538553;
        Wed, 31 Mar 2021 11:32:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d1sm577516oop.0.2021.03.31.11.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 11:32:18 -0700 (PDT)
Date:   Wed, 31 Mar 2021 13:32:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] soundwire: qcom: Fix a u8 comparison with less
 than zero
Message-ID: <20210331183216.GM904837@yoga>
References: <20210331140944.1421940-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331140944.1421940-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed 31 Mar 09:09 CDT 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable devnum is being checked for a less than zero error return
> however the comparison will always be false because devnum is an 8 bit
> unsigned integer. Fix this by making devnum an int.  Also there is no
> need to iniitialize devnum with zero as this value is no read, so
> remove the redundant assignment.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b08ecb9b418c..ec86c4e53fdb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  	struct qcom_swrm_ctrl *swrm = dev_id;
>  	u32 value, intr_sts, intr_sts_masked, slave_status;
>  	u32 i;
> -	u8 devnum = 0;
> +	int devnum;
>  	int ret = IRQ_HANDLED;
>  
>  	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> -- 
> 2.30.2
> 
