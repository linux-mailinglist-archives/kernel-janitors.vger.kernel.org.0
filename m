Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B707C69F2
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Oct 2023 11:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbjJLJqN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Oct 2023 05:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235569AbjJLJqL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Oct 2023 05:46:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC1CB7
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:46:08 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4066692ad35so8107645e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1697103966; x=1697708766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LrQiAxqlGKNF6MEwrNjQTS6wOHahnzLIVbZnvTgWfQ=;
        b=Bu3hiDsmqhDTlKZnbLYT2URaDHmCmyTefQ4xXUC0bwU2bSJRl4LXUKJkzqxiqyBA6U
         ERR26mEN++xCQbfBWzcENX2Yghre82F4ZFFZkJJ4L3zdyB2YGQsyidQtWZA7Q3pTMdM2
         G9m3rqljmKEjEUg8Yd/riCQJb6s9POsG6oESp+vVeQciMsZCpk2B1iHo+DSP/m1c3NRP
         BDJEDGZrKpTyUaeLQJ6Ccq1h7e+UlBgKFRDE2zGeNk/pJXJQVjhU5C5OtQvTqpQLb4Tq
         /9768Poa/Z7m4yDFKxeNJB+YKExY27NGAq4OY/EsKZUzAYw7+XL4R69ZetrumQE7PUp8
         0vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103966; x=1697708766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LrQiAxqlGKNF6MEwrNjQTS6wOHahnzLIVbZnvTgWfQ=;
        b=DkY8UGufKwUL4N2hbD2oML9g3Q/rypZO/hHFIlkEWE26Xr4Jn9c247/Ft6qiTI2M92
         7StL1q1ISApKuuujZ2rg/aJkSykQrB6Vk7lNa8BmSOm3HPSxhRG2q4ONEVzQoClNJMx1
         Op0JC0Nhecp+m0EvseeTVx2YGsrz6wt7F86tFbPY/3SCSFTvyGEMuRaE1ArfNSZn1wf2
         +8OHXS3EPgOlC22AbAwemlPeN3TiqVm8nz9/re9PDnb3nsk+gRjv0W2ofwOz/gOBctlb
         9v91lxgd0f8t1H1W/9CW/DeTsu1Y0N7P4/6bzDWsoem67oeq6vCDIP7CG5jgKMbG7gl/
         xgRQ==
X-Gm-Message-State: AOJu0YxldKJFC1t/dVBDXH934GoX/PmX83S6R668QKv6RDFeT4OJ/2PM
        bjxlU+HBbuDJyLEr6/z/Rnjt3w==
X-Google-Smtp-Source: AGHT+IFiLtT5Nc0mO1wfsGHF5m6vzalYohuo0bIDDh8rXBL43WWU0SIWdS8LTByNnHO2zC5j3VmHbw==
X-Received: by 2002:a05:600c:4686:b0:405:95ae:4a94 with SMTP id p6-20020a05600c468600b0040595ae4a94mr19961294wmo.5.1697103966588;
        Thu, 12 Oct 2023 02:46:06 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id z7-20020a7bc7c7000000b003fee567235bsm21408076wmk.1.2023.10.12.02.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:46:05 -0700 (PDT)
Message-ID: <f1d86cdc-d423-41bd-9b1e-43c6fec25dc5@nexus-software.ie>
Date:   Thu, 12 Oct 2023 10:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: clean up a check
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Robert Foss <rfoss@kernel.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/10/2023 10:42, Dan Carpenter wrote:
> Imagine that "->vfe_num" is zero, then the subtraction will underflow to
> UINT_MAX.  Plus it's just cleaner to use >= instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index be9d2f0a10c1..ddfe94377ee5 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -270,7 +270,7 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
>   	unsigned long time;
>   	u32 val;
>   
> -	if (vfe_id > camss->res->vfe_num - 1) {
> +	if (vfe_id >= camss->res->vfe_num) {
>   		dev_err(camss->dev,
>   			"Error: asked reset for invalid VFE%d\n", vfe_id);
>   		return -ENOENT;

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
