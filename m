Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 872A41A071C
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 08:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgDGGPa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 02:15:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41919 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgDGGPa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 02:15:30 -0400
Received: by mail-pl1-f194.google.com with SMTP id d24so833196pll.8
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Apr 2020 23:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fEIqeEmnHR4VL1Tnz06wxL1tDtYZh8O0YFMdittrvdc=;
        b=y1pqSFEkmWsND2TA4O92usByCfgNi9LYD8b5RYzM2l4cL2WXaBRJQV/2+uhmDB8Aq6
         yuEq/8npHPWpl5vGpknMxFP862x9r6JTehMqgpLw5iRpwi65aiU58j4a9pDG/WvhYPb7
         bvcPFkeav++vUe9tGu9OJ0bHDyPwUYcxoZPi5rHq1V9nHvwVSl3SBaZe9w4oOj0qw9Jo
         tZbK/kjQowFso4aSfNCfqNLRgmsAemcEiWrLNgCnNZCW6KCpj2M3Z6OEALkwO/9xEBLH
         z/DMxC4Jej3xO6BMLJ7LzhKkdU2kR5z0UKbdX4PVFGkMWLdv61JFAiduFGrMwkNXEu7U
         bazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fEIqeEmnHR4VL1Tnz06wxL1tDtYZh8O0YFMdittrvdc=;
        b=EDCpYZAfbAHbA1SUySDzRDmqHGEUwtHRYkpFVv15wQdyB1Z0dVGej2gdjQMW0QF65z
         SZ5iiDjWCBnd5FGda0M/pPGENzBz95VJDO0taSepHGvbYOaghKBwuXT3bSSebHdc5kqF
         BHdywJhIKJDfaTNPIkF9dYsSaF6kYuC6PtJ2+AB+n7eoOjDzQOwuBGNO3sfF9p3lrqoD
         T5ok0P8kJpeURr5YLDfxG4KtUHee/6svIr1ZQ3Y4E9J+Y2d2MA++XekDfJ82+mPkSBec
         Wbtu/sTSYeuLl700k/WZhpPU8+gFwZhBEHU5LCy6h1BVMjiDayTyMkEg7UTGxCoJO+xd
         Deyg==
X-Gm-Message-State: AGi0PubEDwfzYqBGxhk2A/YjRHnwvqZgSII7ENpKQ3KJBRHQ2g/0Wo+v
        JC7p1av2S7T23f5JFQfHTvBmFQ==
X-Google-Smtp-Source: APiQypIku5Lm6YYYlW1dpEix4cJ2o/v/7l1PWYoX6qIkRNJjo8wpaP+/Kt4RgOl+bpzsQHMzs6HUVA==
X-Received: by 2002:a17:902:7c93:: with SMTP id y19mr961074pll.155.1586240128918;
        Mon, 06 Apr 2020 23:15:28 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id na18sm688432pjb.31.2020.04.06.23.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 23:15:28 -0700 (PDT)
Date:   Mon, 6 Apr 2020 23:15:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] soc: qcom: smp2p: Delete an error message in
 qcom_smp2p_probe()
Message-ID: <20200407061533.GA576963@builder.lan>
References: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun 05 Apr 09:12 PDT 2020, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 18:08:13 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks Markus, picked up for 5.8.

Regards,
Bjorn

> ---
>  drivers/soc/qcom/smp2p.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index c7300d54e444..07183d731d74 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -474,10 +474,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  		goto report_read_failure;
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "unable to acquire smp2p interrupt\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	smp2p->mbox_client.dev = &pdev->dev;
>  	smp2p->mbox_client.knows_txdone = true;
> --
> 2.26.0
> 
