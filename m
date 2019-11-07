Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B15F3781
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Nov 2019 19:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfKGSrZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 Nov 2019 13:47:25 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:33821 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfKGSrY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Nov 2019 13:47:24 -0500
Received: by mail-il1-f193.google.com with SMTP id p6so2779461ilp.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Nov 2019 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LlH/emK43X7VQlux0XjazW6nVpP1+OhxUnqAKnN/vBs=;
        b=JEB1F12iTYfjJYno9PiUHEyIvfvFi+cWQhuSPBKHPuy1ugZuXn4+uxYA3Ey4McDqlF
         PvDtJzEOxJSnnwrAitdgUXRRfeq3SlbXPFIE6k67sa3xWjywqkMIXl2xZ9MziBmUPsAl
         QX+sIqfsd0HwsZoDRs/WK9nqC6eBfcG0Vm9gLGk8eQg56BI/CqY5tritxhJkvt3pb2a5
         uCR5rJtp8GXjIT4bMlrgdU4gghxt2xZNnrZRtp0lqc0S4lQ5JDbicq98gKRi039be6sD
         LumACIvxVvtdh2nbwrwLoZJm2SfXnunI5xJzIHARQGFZ8A8Qw0M/nwMrX0Oah7XPbLBt
         FE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlH/emK43X7VQlux0XjazW6nVpP1+OhxUnqAKnN/vBs=;
        b=EBx4HgAah+jBPX9P2oKyneXopdIeJewVIORqlVnTR0Rf9nRndzkl8vN98UOLieQ2zq
         b9bWTbnVLi+7LUXi+7/GrofRn0EnIqR5cZj81Oi7Zs6UzOPQtAM0ryuYyCXUphrwjID9
         5yws0+leCISU6IPaOg5QywS1sNyf7pCcHVreL/dKVPlMg8NRb3yEpqLmf3H7wJ+gvfm6
         7l95dSxGinV3Lcy8uTz/pFnD8rfhWMu5ywbNQ/ERJI4dMeEM5TxTqXChoumJ7lIlUfdw
         e0S1ZHEPUqhHVXbyR0S9XJkCNr+FfooABs/hIgXRKFEToq/Usy0jM7mm9kLc6TqFZRTz
         3Brg==
X-Gm-Message-State: APjAAAXQn7QsF7aTaP6puKwY/7Oz917KRbh/nuc5YDB/aVJRFm8EMu91
        E+CAMkRMaCnu0vPWA0x4wkZH8/FMeUvd3PSSNVZGHQ==
X-Google-Smtp-Source: APXvYqzAVWigadbsfFuHoFmMfkvGVyLArpcA4tXnCqWDWZyByyzokkk8+aogfdz1WchCA9laZjOZIHtQihQ5pjFV66o=
X-Received: by 2002:a92:350a:: with SMTP id c10mr6317836ila.140.1573152441970;
 Thu, 07 Nov 2019 10:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20191106115651.113943-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106115651.113943-1-weiyongjun1@huawei.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 7 Nov 2019 11:47:11 -0700
Message-ID: <CANLsYkxKAC9FLYkFjuehj_oFHTVyd=8_R8bAKjPxTXQyAGkwYw@mail.gmail.com>
Subject: Re: [PATCH -next] coresight: replicator: Fix missing spin_lock_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 6 Nov 2019 at 04:57, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
>
> This is detected by Coccinelle semantic patch.
>
> Fixes: 0093875ad129 ("coresight: Serialize enabling/disabling a link device.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 43304196a1a6..e7dc1c31d20d 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -248,6 +248,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>         }
>         dev->platform_data = pdata;
>
> +       spin_lock_init(&drvdata->spinlock);

I have applied both patches but removed the "Fixes" line since the
commit is only visible in my local coresight next tree.

Thanks,
Mathieu

>         desc.type = CORESIGHT_DEV_TYPE_LINK;
>         desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
>         desc.ops = &replicator_cs_ops;
>
>
>
