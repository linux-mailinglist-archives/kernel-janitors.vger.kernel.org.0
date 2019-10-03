Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D684DC9B9D
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2019 12:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbfJCKCj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Oct 2019 06:02:39 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:42383 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729871AbfJCKCi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Oct 2019 06:02:38 -0400
Received: by mail-vk1-f195.google.com with SMTP id f1so480932vkh.9
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Oct 2019 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4hTN5hXof2GeuSSClgWGL0co9GQPORmGjn5ytO1C4rQ=;
        b=kuAvisrbiGJNldB6damtdIToQrgJw3+m03ZmkRjensLqLh3IE9sjcJH+06+xKcNmJz
         KuVdX9NnQN4EdNRsVnJXmL5DHjimS37ulpntX/ZTqzJnWvFwy7An+wn2fDl70hp7x/lg
         zwq6sUed+cLzYz+J6hPhAJDvU6a+nG7TI6KrNukLxnXRZuVCWC4ATLhD3gLFBPHsN//y
         2gO7VGVQGkdwL1f157Fy5wAeDhqdaIZeNTA8+pW5XxvkmCP+Z30ypQ2cyycS7uBoDK29
         3m1KCM7piFFHPeVDIgNFtR34RRxEEc670E813H25BfqWdwWXAIxW4WiDbxnmCzpU9PQA
         FqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hTN5hXof2GeuSSClgWGL0co9GQPORmGjn5ytO1C4rQ=;
        b=LKv9RueREgZ/DwDcrJebExdWxVenFQK9NBmsCI1bGKsdiqRV2svZZz1EiZCe3zwrOP
         Jo/5FxENj7IvVfVD+lSoUoQqkBWd8QwEciKn1OJJIITLSCySxS2g+q/7x9r2upMC7ltd
         7mh1WnpdkycItTUIJaQit3UlQMINgqEZ0Lvf9cg6kWHuVS0SS2OK5di1r5a9Dw4l/95G
         nV8oyt08Qh//YXlRaaPeqFPHdZrj2t7WSZLvan/ZQyT6mytfPVF3j3Umd+/qoAIaG1Ye
         y3bxa0eYu7W5/u6Ag/GKhdoe/FtGKwhDtFvlwQn1wHfQnBg+euRwVBFktIvcCTXT9oEJ
         4lpg==
X-Gm-Message-State: APjAAAVRqmj7GlN1p4cDaGheoJ9H/PSSNlDB5CIrNAVQgnoECtnTN/XU
        FyBg6JRg6Vn9RkNtfTzZouk05xt2TZ2/gSyx4V+Orw==
X-Google-Smtp-Source: APXvYqyooxUx5UM4VsemSzYrJ/eZau3LpIq4PKSGS1jZsFBPN38kXKo1d9K+rI9mPE+pJUGBNBD8fvNGRl+5g0gXDNk=
X-Received: by 2002:a1f:8c50:: with SMTP id o77mr4532311vkd.52.1570096957636;
 Thu, 03 Oct 2019 03:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190922115443.11693-1-colin.king@canonical.com>
In-Reply-To: <20190922115443.11693-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:02:01 +0200
Message-ID: <CAPDyKFoHsOJKmQBT05Xqt0H+aeTdy-AWQ8-ej2CUheS2w6_jiA@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: fix indentation issue
To:     Colin King <colin.king@canonical.com>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 22 Sep 2019 at 13:54, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of statements that are indented by an extra
> space, clean this up by remove the extraneous spaces.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 79c55c7b4afd..bf0048ebbda3 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -3441,8 +3441,8 @@ int dw_mci_runtime_resume(struct device *dev)
>          * Restore the initial value at FIFOTH register
>          * And Invalidate the prev_blksz with zero
>          */
> -        mci_writel(host, FIFOTH, host->fifoth_val);
> -        host->prev_blksz = 0;
> +       mci_writel(host, FIFOTH, host->fifoth_val);
> +       host->prev_blksz = 0;
>
>         /* Put in max timeout */
>         mci_writel(host, TMOUT, 0xFFFFFFFF);
> --
> 2.20.1
>
