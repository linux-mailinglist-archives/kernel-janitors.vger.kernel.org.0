Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9F0A4B26
	for <lists+kernel-janitors@lfdr.de>; Sun,  1 Sep 2019 20:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbfIASX0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 1 Sep 2019 14:23:26 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34954 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728952AbfIASX0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Sep 2019 14:23:26 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so10857399lje.2
        for <kernel-janitors@vger.kernel.org>; Sun, 01 Sep 2019 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eRqNO50sqHwmWj5P/z58Oe0GaZOHE7FRmJRU0BNdRwA=;
        b=eq6vzzUPapsds+MIIuvqwfoZXAY0z41n2/7fdowjYx2O5oU38D0z/W/9glcxHRQa2e
         WYf410OXkTry4hw084nNU6/X7cFg1locgtY1vqUfOpwr826VafO+TCzi/6t+ttlshkC+
         Sijt9vi6vCi5dE6sI0/8gicWxGp5RchwTfcn7sp2LKVu62LRHYFb14OqYn/1pJpGmPef
         Aj7b+7Bjar191/oCxIVpcgP7PF40d+4DN5npPXMykV6beMkf4rgkProguELGZMDzpeLM
         PrbjKM3rbaqyDlThN1cmN4fO3M5I2yb3ZTA5WYMWuKdsF5nZiMa/eBim7YPJaP48caWx
         hkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eRqNO50sqHwmWj5P/z58Oe0GaZOHE7FRmJRU0BNdRwA=;
        b=iISl0RX/7xSoXpDy0mwfN26Cr5GspcE3Tgp5Gi3WVGyZlpFo03dKRR1M14C71V/znU
         VINmdimzV3xwuH0IdLhANqxdiv9kCmk4Kbq3O/fkZ/sGnWM0ZkOGS/7Tppl5iEEKnmtR
         muLun7l3krulBzQSY3my3BBWXMTJ0JPgGD4IDXJchipTY+LRiZ4EAF1ODuBPuZRApnPd
         m7j/1gFmC/mKyyMYgovrIKL3T83P22QlM4pCQOCE6hrsraOev/5odJT7IEdpYP3amPKb
         pGgrbwXq3GGRRQ47RX3YWFj7Mf5OIVgS9Mngk19OkqFBzdFBMfzmhuHtVz5xFgoMfca2
         Kk/g==
X-Gm-Message-State: APjAAAX2Q6meYstCXMp0H0TeTEixa/MktiWX8It2egt2JtIqNgiNNMuz
        M2WrG1ISND2jP13enlLd29b/5oiUkjCZtJws4xJq
X-Google-Smtp-Source: APXvYqxR838XZ/vlMKbRK5g41cM9jK0LAXal1wmVLKOlFPo3+6Zm04hAQdB16tAZbBIQ1PFDnVj27P0uotkvqRNwnFI=
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr14338697ljq.0.1567362204210;
 Sun, 01 Sep 2019 11:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190901155205.16877-1-colin.king@canonical.com>
In-Reply-To: <20190901155205.16877-1-colin.king@canonical.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 1 Sep 2019 14:23:12 -0400
Message-ID: <CAHC9VhR-dBHz_8=OH-8YbidMOO_ecqjioorUTr1GFDV1tTqCJw@mail.gmail.com>
Subject: Re: [PATCH] netlabel: remove redundant assignment to pointer iter
To:     Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Sep 1, 2019 at 11:52 AM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer iter is being initialized with a value that is never read and
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/netlabel/netlabel_kapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
> index 2b0ef55cf89e..409a3ae47ce2 100644
> --- a/net/netlabel/netlabel_kapi.c
> +++ b/net/netlabel/netlabel_kapi.c
> @@ -607,7 +607,7 @@ static struct netlbl_lsm_catmap *_netlbl_catmap_getnode(
>   */
>  int netlbl_catmap_walk(struct netlbl_lsm_catmap *catmap, u32 offset)
>  {
> -       struct netlbl_lsm_catmap *iter = catmap;
> +       struct netlbl_lsm_catmap *iter;
>         u32 idx;
>         u32 bit;
>         NETLBL_CATMAP_MAPTYPE bitmap;
> --
> 2.20.1

-- 
paul moore
www.paul-moore.com
