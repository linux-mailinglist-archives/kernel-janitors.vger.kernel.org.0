Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8108B1CE1F5
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 May 2020 19:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgEKRpR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 May 2020 13:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728046AbgEKRpR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 May 2020 13:45:17 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD9FC061A0C
        for <kernel-janitors@vger.kernel.org>; Mon, 11 May 2020 10:45:16 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id i19so10718620ioh.12
        for <kernel-janitors@vger.kernel.org>; Mon, 11 May 2020 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTMcsGbSNPLL7L+tUlyt0FenOS7bLLaekCh7ftl59gc=;
        b=Nfb99L6TDVBBWvt/W0lqIjZKrLZDJ/LXYKTvX3IvTOiMFZN/A1DIPF051AUp+7tDkX
         sVxPiC2nZH5U1Io2kW6fVGpMx0LndJCvV34Rtso3BcUX/uM3fh+Tn6Vv0dzctSr/Sr/h
         oOigNR9VZNxYR7ovbguI2IiC8jqBsgoBPcFVnPRW3diKX5sGiDRwDwEVYlkUdYFKgJJo
         a9K6d4sMtYVdzpts1rmuMGBOlg9MC0MDNS7lYCgvz8oZVIPDKCqPEbsSwSnIMt8JFDlO
         wPJa+exWgkN4H31DKuofRThFklXX4KwpyrWMoDwOYrBrEAy19dk1llmjWrb2Y9/Yp/2u
         xbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTMcsGbSNPLL7L+tUlyt0FenOS7bLLaekCh7ftl59gc=;
        b=UVDYm1RLd+NNDVc+G6MwoaYcffWizIDtKk4lTaF0lzo2XoVbahDN3XTfT5wFDZzpE1
         jEQP7S/1r8IK/jGU5p0pIv0exSknB93WwAw3e/MjpAosg2z5ZOerncIe33vTkW7rzHuv
         PfCHDw1GmnwRndBjnhZa6JTDXlo7PMZH+PM7M4apydWSe2CfsNZKP5etnNdVx48+/jjF
         xU+8HHRb4Mt3olepwdM203CDnsahnHl67B6EbCHLUgllsReQLGcIaFuA2XjjXaRuRSyj
         Yd5yIII4Ada5ggay+IsYXU+u9oSUyQryDUtEwmZs64BYnPPbVrAMet5BERLuweQUbSD0
         0FAw==
X-Gm-Message-State: AGi0PuY+aLdu6Zvm4H3swAlG2ktevcRTynYxui4GIr0qT4ZuVCaj+irW
        6WZQDAmBvjGJ/mH9VhWz14cr/WomEGAzYncUkC3egw==
X-Google-Smtp-Source: APiQypL8QQIH8rAW3VdEhTJm19ncep/OtoyHj8sVIDxfQabUswS2mLh+6DC+2Nmsa/EfSAbxASZU982W9dmlWpW0JZE=
X-Received: by 2002:a6b:dd06:: with SMTP id f6mr13132232ioc.90.1589219114664;
 Mon, 11 May 2020 10:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200509084237.36293-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509084237.36293-1-weiyongjun1@huawei.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 11 May 2020 11:45:03 -0600
Message-ID: <CANLsYkxn2QAHgGtmygbw4x-kmrzo2R5u3XDmDUz5EVAYg=SQyQ@mail.gmail.com>
Subject: Re: [PATCH -next] remoteproc/mediatek: fix invalid use of sizeof in scp_ipi_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Erin Lo <erin.lo@mediatek.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 9 May 2020 at 02:38, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.
>
> Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 2bead57c9cf9..ac13e7b046a6 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -132,8 +132,8 @@ static int scp_ipi_init(struct mtk_scp *scp)
>                 (struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
>         scp->send_buf =
>                 (struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
> -       memset_io(scp->recv_buf, 0, sizeof(scp->recv_buf));
> -       memset_io(scp->send_buf, 0, sizeof(scp->send_buf));
> +       memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
> +       memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
>         return 0;
>  }
>
>
>
