Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5EFC48EA7
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Jun 2019 21:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbfFQT1b (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 17 Jun 2019 15:27:31 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35304 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbfFQT1b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jun 2019 15:27:31 -0400
Received: by mail-io1-f65.google.com with SMTP id m24so23961423ioo.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2019 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9Oc7ZhRD3F3wXh7rQZIFZBIqOJRb70vgbqk6ZylyKs=;
        b=jLrmxlt5HekviTDg4h9uqSmRgH3b0TRYfXS0MLnsFWdqKx4w7TePcVbPdyGajBZ5T7
         E0/MgkfLKKRFYdi4U/7cMNAC/5BD62ZV7jZDA3ZIlvdPLYG+lUq17VnbFRFmKcxBuijW
         b98VN0Hvx3L/bguKSJU68ZIk28pnHD1YfpnuGcqvMJVT80TFJybKvwSDGmg/WTMGyb5E
         MJajgGG46mMfU5JzBy1BUM19j9gCBKCe7x7XgYhEzhlzBEn1hybyqb59cTV/qpUDXiVo
         QB+ZGIrZuE5tY8P3wtvgueICm2JuGumEi96mvV4Ojoc6WIJs30xltebpiZh+JwiyMFDM
         ySEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9Oc7ZhRD3F3wXh7rQZIFZBIqOJRb70vgbqk6ZylyKs=;
        b=rtcF+0S6uY1eb+p6OTQa2DrNDsdO2P6nVwTeQ+CG7e5ygSmoodWU0q9KAGpsH4/Jb3
         2ZQlzkbABtI5X43KK78pZCEtthCBBSKeozdKl6wtLVB1nyJ/fAo99xZ1rXYrzHyrlEWA
         XmhcVGYyWO/3ODwSKMr6uUYQTlqi8wTFTOUcsIqOANZVn5sJcMBDJkm5lRo8EbN9rUm2
         TlxnPqQ+djsEFcl6bC60wAi8odHXYD7zstOqK+B0xs40xhKix/yt6RB9kKeCHRiN/tcK
         qTpQiTtvRdCPPDPXYhiW2IVjWJS3joEjmjEPoE/kiXwLe5QUrAIh3EtoBhKC+G7Af3xY
         p3RA==
X-Gm-Message-State: APjAAAWnXWkiMhGHIsdplJUztLtxWFuhGzMa1KNwB4UGbDmRUnk2iYFz
        wSUbwSeLCzdT7hw5FPlA942exB/n+QWy8CNC3jetWg==
X-Google-Smtp-Source: APXvYqwqAHJMpEIe+s+0XLSNvUalfFg//jHiamKU+Pa2/iD933a4OCsuMlXY4LBxYgwVV/deZOGHC6idGCgYYa5QioY=
X-Received: by 2002:a5d:9613:: with SMTP id w19mr10341810iol.140.1560799650660;
 Mon, 17 Jun 2019 12:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190613065815.GF16334@mwanda>
In-Reply-To: <20190613065815.GF16334@mwanda>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 17 Jun 2019 13:27:19 -0600
Message-ID: <CANLsYkxnze-aJXwr6ogR_AjcXefjufgOnwgqnX0vVtkzkzAsVw@mail.gmail.com>
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Leo Yan <leo.yan@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 13 Jun 2019 at 00:59, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "drvdata->atclk" clock is optional, but if it gets set to an error
> pointer then we're accidentally return an uninitialized variable instead
> of success.
>
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
>         }
>
>         pm_runtime_put(dev);
> +       ret = 0;

Applied - thanks.

>
>  out_disable_clk:
>         if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> --
> 2.20.1
>
