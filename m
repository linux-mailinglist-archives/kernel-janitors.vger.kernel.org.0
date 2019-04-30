Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3F3EEEF
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Apr 2019 05:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbfD3DF0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 29 Apr 2019 23:05:26 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42803 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbfD3DF0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Apr 2019 23:05:26 -0400
Received: by mail-ot1-f67.google.com with SMTP id f23so10593203otl.9
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2019 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IWZIhQH13t7up+A8LAQ0WG0QKdeSgcY1YMpA39miM9M=;
        b=TTYmZcgryWx4jv0IxAfd8fDg3iAVensTO0uOB6gqkA/cTu0G1y0w3soe+/MdVWSty7
         U6DKE5QXP6rk/iQUIuQ/p7FVQ2OvkVPC+WIFwcDg4xxoopsFdmoCu1YW8lBPe+6gbpvF
         0fwk9tgqQqe6RpUb1/IDo2zTL00HxnH31CUwdW3byu5QT8W/b7+ypv6FzI0ZVDw+/cnt
         /aUxVeeadXzieV08coGaZejGHKUVujJ0F36f/8g8z6lRymuYBKS4gzyzhz4t07v91O9E
         cD2EmVztPrT6ZrBfLxM2i14kM7v/o07XXsy5CELZfBaT86I08optmaHLpF3N2NzoRbZg
         I7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IWZIhQH13t7up+A8LAQ0WG0QKdeSgcY1YMpA39miM9M=;
        b=mXBEXBFLK/jYKwGlT9KzUtOtkQb4WDU3R1b2ENec9fSyXHocCDn5MQVOi6WjjL2uK7
         BL2aHtobujnZAN/L7CeiLYPoYkIR23+seSFOA5VnKd6W+K+rBbqTazjJ4VYdfqltlBlQ
         sVqrRl9c95/Dkto0PBiQa35HODin0+I7nzZrvWfWybzn4RBdRiA9bCKicqQfSkDLjF9X
         PAa2NyxjLFQ0vMUTClBd1fxQ17gOU3YGpmxZXYhYMDqANZ1ctqroJwky4Ab6Iu6pj9DP
         GCEdYfLOTq42jtujeEBdhaoMGzvsQsmkwI73kgMUrzIwYq1t8rXbs4n2V/ZNy0eX23MC
         2KkQ==
X-Gm-Message-State: APjAAAUOIx8ZWkOCuyhNvYDybDfIfBrnpqPse3wU59VfkWrVv3xf/0pX
        IsRe+Oh9txHm2udjbpAULehPQZqYqoMM7Ky7XUorOw==
X-Google-Smtp-Source: APXvYqxSbr+MgQHT97JlimaGQfOmQJ3pSvxXhgdPQzpWhzrLX4J4I8y1k5W+BBYumzvXcYWqdcOtc8eS+ciBE2sDm20=
X-Received: by 2002:a9d:7ad9:: with SMTP id m25mr41025914otn.75.1556593525418;
 Mon, 29 Apr 2019 20:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190429123713.64280-1-weiyongjun1@huawei.com>
In-Reply-To: <20190429123713.64280-1-weiyongjun1@huawei.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Tue, 30 Apr 2019 11:05:14 +0800
Message-ID: <CAMz4ku+v+DS_7N+6yWzqGQvn3KiW-3ACNbXL1W4YjWSmu3AxwA@mail.gmail.com>
Subject: Re: [PATCH -next] ASoC: sprd: Fix to use list_for_each_entry_safe()
 when delete items
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Mon, 29 Apr 2019 at 20:27, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Since we will remove items off the list using list_del() we need
> to use a safe version of the list_for_each_entry() macro aptly named
> list_for_each_entry_safe().
>
> Fixes: d7bff893e04f ("ASoC: sprd: Add Spreadtrum multi-channel data transfer support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Yes, thanks for your fixes.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  sound/soc/sprd/sprd-mcdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
> index 28f5e649733d..df250f7f2b6f 100644
> --- a/sound/soc/sprd/sprd-mcdt.c
> +++ b/sound/soc/sprd/sprd-mcdt.c
> @@ -978,12 +978,12 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
>
>  static int sprd_mcdt_remove(struct platform_device *pdev)
>  {
> -       struct sprd_mcdt_chan *temp;
> +       struct sprd_mcdt_chan *chan, *temp;
>
>         mutex_lock(&sprd_mcdt_list_mutex);
>
> -       list_for_each_entry(temp, &sprd_mcdt_chan_list, list)
> -               list_del(&temp->list);
> +       list_for_each_entry_safe(chan, temp, &sprd_mcdt_chan_list, list)
> +               list_del(&chan->list);
>
>         mutex_unlock(&sprd_mcdt_list_mutex);
>
>
>


-- 
Baolin Wang
Best Regards
