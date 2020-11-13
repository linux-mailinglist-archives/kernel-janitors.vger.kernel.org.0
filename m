Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98C62B224A
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Nov 2020 18:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgKMR2L (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Nov 2020 12:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgKMR13 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Nov 2020 12:27:29 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0EDC0617A6
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Nov 2020 09:27:29 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id t15so3234627ual.6
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Nov 2020 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNeg4qP6VUUjIOr+EpogB4eFqk9juY9gyiBCzYtl5Fw=;
        b=eSoHOmCRpkW35KVQ2MpDLBLg7TiBXu6RgfAM9EYJrcogKGzZK3ZrJ0UeaNTaRtl5sx
         A66LbXrWPSVbH2BwoDyi0kDiZ8QB9ejt4wkdkO/b3wntF1zKPntpX03TUUiCngKDbfPU
         7waZgx5I9He1RJmz/ka1FrVQymueBbbSANj9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNeg4qP6VUUjIOr+EpogB4eFqk9juY9gyiBCzYtl5Fw=;
        b=EwJb7fSJwmGErnQB2ymTZGBs93lWulJFJRe7gtWtT9b9+sYszkrYzzp1jRvxU+iMWw
         pCtuXZ9hMJtdh0d7VPlIbkwdPH3LYzC7cKUjtphY3CaosQnaJljJJ597HtldhL53czBv
         IzmX9F5IWjAaIrXIFRPnkYJf8u7TN38p7/4piROXH9+NAQCMPNQLh6poxOPEVF4OmWYW
         70KfjJIqX+Dkv3Va2GJ+BB9A9t5oarNs8ejqx4awL8S2zM6SRYU79MwN/gxftWr3ksD6
         QADAREfr3trvJU/fF0C4Ox2Zb08VfjJCtxNVqPwxJya98YhHpqCdBQe3R0tZgldHKAHc
         OR6w==
X-Gm-Message-State: AOAM531Txa9Eu5jNaWbN6gWsr/8bzXhXnsTCq78kaRXCxpOOEmHEDJvE
        DzXrPpuudG4oOFw+/c9WdekjUJHSYeV5OA==
X-Google-Smtp-Source: ABdhPJwsBnwOCku/E6mKgb3YpIpBz7cRzgnim7OvlA6Cb/1Smu7+WSUI/zX0HQfyuFA8lNnmRI91QQ==
X-Received: by 2002:ab0:2745:: with SMTP id c5mr1708884uap.5.1605288446054;
        Fri, 13 Nov 2020 09:27:26 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id t74sm1039291vkt.44.2020.11.13.09.27.25
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:27:25 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id i62so2288619vkb.7
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Nov 2020 09:27:25 -0800 (PST)
X-Received: by 2002:a1f:2306:: with SMTP id j6mr1991952vkj.21.1605288440171;
 Fri, 13 Nov 2020 09:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20201113101419.GC168908@mwanda>
In-Reply-To: <20201113101419.GC168908@mwanda>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 13 Nov 2020 09:27:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V1tvAw-myadWTA0K_RzJ7R9oYzVuc5-y74Ov06M0dk0w@mail.gmail.com>
Message-ID: <CAD=FV=V1tvAw-myadWTA0K_RzJ7R9oYzVuc5-y74Ov06M0dk0w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: lpass-sc7180: Clean up on error in lpass_sc7180_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Fri, Nov 13, 2020 at 2:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Clean up the first driver if the second driver can't be registered.
>
> Fixes: 4ee9fe3e292b ("clk: qcom: lpass-sc7180: Disentangle the two clock devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/clk/qcom/lpasscorecc-sc7180.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 1a3925badd7c..9081649f476f 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -491,7 +491,13 @@ static int __init lpass_sc7180_init(void)
>         if (ret)
>                 return ret;
>
> -       return platform_driver_register(&lpass_hm_sc7180_driver);
> +       ret = platform_driver_register(&lpass_hm_sc7180_driver);
> +       if (ret) {
> +               platform_driver_unregister(&lpass_core_cc_sc7180_driver);
> +               return ret;
> +       }
> +
> +       return 0;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
