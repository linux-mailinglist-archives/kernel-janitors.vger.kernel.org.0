Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5B97A07BF
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Sep 2023 16:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240409AbjINOsW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Sep 2023 10:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240357AbjINOsS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 10:48:18 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D75C1FD0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:48:14 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso1081381276.3
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694702893; x=1695307693; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EKF0T0zAUhQoZRitQ2MLePZaTopAwYUl0Una5eIOS4I=;
        b=EMPbKkRrJ4xunoX/wE0AXcdOEm3dMXDg/oMYKeqPY0z6/tpHU9hycYH7EAJHz8kyqB
         m2VVAwee2+H3RvNn3B1s4tctVPLtf/lKSPEbDv08EyM5t4Wm57LRy9cSvjqAqh7aK5Jk
         gGikHU0/0DVbLVPaoo9AgbMx9CZbR+CMzI9CjvU0yVi3PHVynwvzCJUajG1HDswH70Ju
         8Dk3Lwst5aoDMcm/3TC39fZjJGa9aMRdpIyZsc8a5Vvstu4GL4eIu09jbtVViOLNUTTq
         xTdNc9LoKNQLiV4aQbimey+rH8KFuRtTBmxRfQlu2LKZae1WfLBplgNuQrQexLIMSaKm
         CTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702893; x=1695307693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKF0T0zAUhQoZRitQ2MLePZaTopAwYUl0Una5eIOS4I=;
        b=wdOFqxzn7MxEqi0mH8ztC+k+AMdfmdc/PbS7LRv6TlDrwn1haGIfM0lBf8Y+bxefO6
         iN7kw5qhzthqaHOm6Xd3x3vyeUMFjCaQLwWCBjH40wjB1GYIdK3jwIck2CMY4iF3WQZk
         8nByWPOgzLZZZTOctt8DWtZEfx+Hl+kJ3W7s9FKWBVquoYjF36TTaeZpMxxO/LENfiGx
         LyI4/3KMc/kT2dg08IOGuJKEHO/9gbfpEGMOj6StJjKeVaLVNhP0m6BYlCuFAPTXgL16
         KGrYhCUuTWjp1tCKpAnFnBd/jcBWAf6LTtt7Gx76qyIoB8K35VXH8ooKDMNy1ZpJbLA+
         mZgg==
X-Gm-Message-State: AOJu0Yxd5Ta92HqckybDfgEf/fwUHu2+efcIpMql+xKMIIcHnGnQApxZ
        Trg6PCvD6wJr9OssLAkbn327RQtMR3tQl50jn7u2cQ==
X-Google-Smtp-Source: AGHT+IGSlFamOIT/G3C3WlIsE63iqRpU58Q+hPmZ2BJoB5zJjrYZqaVHHpnVGsRIKAGvS1YS3rjcS1gyRMTtYMrVB7g=
X-Received: by 2002:a25:109:0:b0:d07:5b87:ec56 with SMTP id
 9-20020a250109000000b00d075b87ec56mr5330060ybb.14.1694702893555; Thu, 14 Sep
 2023 07:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <a8af0a08-8405-43cc-bd83-85ff25f572ca@moroto.mountain>
In-Reply-To: <a8af0a08-8405-43cc-bd83-85ff25f572ca@moroto.mountain>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Sep 2023 16:47:37 +0200
Message-ID: <CAPDyKFq60V2OLe8K9RkuEZCUQHVwoDZCOtOt6w3nDw1P-reEWg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-sprd: Fix error code in sdhci_sprd_tuning()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Wenchao Chen <wenchao.chen@unisoc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 7 Sept 2023 at 11:54, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Return an error code if sdhci_sprd_get_best_clk_sample() fails.
> Currently, it returns success.
>
> Fixes: d83d251bf3c2 ("mmc: sdhci-sprd: Add SD HS mode online tuning")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> This is from static analysis and has not been tested.
> ---
>  drivers/mmc/host/sdhci-sprd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index 649ae075e229..6b84ba27e6ab 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -644,6 +644,7 @@ static int sdhci_sprd_tuning(struct mmc_host *mmc, struct mmc_card *card,
>         best_clk_sample = sdhci_sprd_get_best_clk_sample(mmc, value);
>         if (best_clk_sample < 0) {
>                 dev_err(mmc_dev(host->mmc), "all tuning phase fail!\n");
> +               err = best_clk_sample;
>                 goto out;
>         }
>
> --
> 2.39.2
>
