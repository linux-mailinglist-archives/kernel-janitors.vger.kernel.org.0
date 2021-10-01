Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3184741F502
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 Oct 2021 20:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355766AbhJASgm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 Oct 2021 14:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354947AbhJASgl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Oct 2021 14:36:41 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A29C061775
        for <kernel-janitors@vger.kernel.org>; Fri,  1 Oct 2021 11:34:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x27so42249439lfu.5
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Oct 2021 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h17+SHB1hF/idn3CZToPuuO5Jqa52mgDL9LaLqNP76k=;
        b=XvZPJRVapHhXbnvxBH+dcTzSWQUb8QLF1Nvs1pcRhCxBeMs5Xcc3SYxz0PJk9MSVwB
         RO++xnwZyTvuSnUUevpLJg3QzOphbUQYQMzIEN8ZdDC/pBg7emCqlUyytJKci3smdWEz
         PGKQDIfcwTqn5uHKORxQ95mAv2mamNG7R4cbKDhOgNlMOni5vMR6VfkgZNz3f+w9r6LP
         RM5PrO44K4PTReIsJatKfc6ou546JK1Y/09aVpYq2fo16JNjbJ30np/Do4fvwBpz7Nls
         NnJBkqXWOyTByxBLP2U0JC6UhBtJUhfb9XBQKV7BuC/NtZW4K+K44hAwVBC/VzyF8UqV
         abdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h17+SHB1hF/idn3CZToPuuO5Jqa52mgDL9LaLqNP76k=;
        b=N8RUhto+qCqLqyxwigsaHRX/u+TkazCQnndC2DirpHxuetSr/GSFTfVZ50W8ZfJTcY
         c8FqrkTtq1lci7k8vq7RaXlII+d+/b8ar+eHWlTy/zooTmsheUGVbhocUZbp5ZVVSPnu
         xin4PVoxmvRKIFdV8IvMZZMO4hkfleA5OKTTqSXsJd+U+fwwR5blklBsvUEOsbT/pXCJ
         TyGzBNlpD0JEmNvCkywjx7T9r2jWuGm0/wnhpM4kCVCkIYLiUsSiibNufb3BU0ZYkdPb
         SZQlKQJKYvod6fTeXDfVV5NQ+f8lQfv3iGXazRw6SPzwvtvxNWPmOE4T8TFmqYA2/7WO
         OVrQ==
X-Gm-Message-State: AOAM530Luo5URsAlqc2rK5srFSSG5AsapPISSP08r3YywazHCjsjh3MB
        8D6SutF3OzpD5aNMqVZDGMAfG28rlj+zb0ME
X-Google-Smtp-Source: ABdhPJxAGb0vHrSPSZ+MiRYmStYTxz0nB8m1aCFfXoEXCgOVViaEkeSdPPdoKSd77/QxRlbcQSx0UQ==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr12844230ljn.35.1633113295365;
        Fri, 01 Oct 2021 11:34:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p14sm809515lfa.299.2021.10.01.11.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 11:34:54 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Fix null pointer dereference on pointer edp
To:     Colin King <colin.king@canonical.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Lyude Paul <lyude@redhat.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929121857.213922-1-colin.king@canonical.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c9a68b02-d9b6-e779-7659-2f92639e55b0@linaro.org>
Date:   Fri, 1 Oct 2021 21:34:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929121857.213922-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 29/09/2021 15:18, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The initialization of pointer dev dereferences pointer edp before
> edp is null checked, so there is a potential null pointer deference
> issue. Fix this by only dereferencing edp after edp has been null
> checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/edp/edp_ctrl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..fe1366b4c49f 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1116,7 +1116,7 @@ void msm_edp_ctrl_power(struct edp_ctrl *ctrl, bool on)
>   int msm_edp_ctrl_init(struct msm_edp *edp)
>   {
>   	struct edp_ctrl *ctrl = NULL;
> -	struct device *dev = &edp->pdev->dev;
> +	struct device *dev;
>   	int ret;
>   
>   	if (!edp) {
> @@ -1124,6 +1124,7 @@ int msm_edp_ctrl_init(struct msm_edp *edp)
>   		return -EINVAL;
>   	}
>   
> +	dev = &edp->pdev->dev;
>   	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>   	if (!ctrl)
>   		return -ENOMEM;
> 


-- 
With best wishes
Dmitry
