Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F43DA9DEF
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Sep 2019 11:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732169AbfIEJMD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Sep 2019 05:12:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57812 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733050AbfIEJMB (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Sep 2019 05:12:01 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E0CD22A09DF
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Sep 2019 09:12:00 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id m25so2432802ioo.1
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8YgkTckHnd+oBCtkJ3PeDRAfoIVwhj7X9BQME1lU8Rk=;
        b=AIwFMiy9TI2sHcYZwqMH9GdaNkpDHEPf4+K4qdJdMTOkmpg1X370HP4PVg6mqfKbPb
         ukckTfrCO0aWfR29jNUVjWHiKJv6BUDtFIT0033NRHkt0e/UvKBTV/wXYaZn6jAF8AEq
         hdYd9CeXXV0R0xV8Ls3HYplrFKO0j38R94NhnVpWgpS1cTdai+DkIndGQNO5z2QOXlpS
         LF5oKdsihWnoVt1xvp+96i2T/ZX1QA0IjMMFHHlfHA0b1BWVLq0u8+bo8nBvNdRWJrtk
         mfLOLdJgbbFjrLfYWdS0ViIFYOZweuPHQd0aiXxEvJrQAjsXPOwofWVprBgKo2PiB8ip
         BANA==
X-Gm-Message-State: APjAAAU3O9CzeOjyxkdD46WoZ18Q7/RQqMJWZ5hmiKZyGs9uPJ7XKNpA
        c9C2aSZr39sB369rJnfK+yyLux7JdoaXa8p65tsRbOrpVMPkHbcGPHV0GWSpb+asiNrkRrR3NJ3
        ofQJhJpDcikq/lPDRssVfOSH8cLrMpYZPZ1hYAWIlJO/L
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2974893ioj.100.1567674720332;
        Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrAdsLGhijKZkQDVkShWA1yVxV6uG4TFkYu7Bb2m8Nd+GkGxi48OkzyFxBIWpeZjPbwU+pUog6KRuQLHZzDhI=
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2974868ioj.100.1567674720115;
 Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190904141857.196103-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141857.196103-1-weiyongjun1@huawei.com>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Thu, 5 Sep 2019 11:11:49 +0200
Message-ID: <CACO55tsJt2Z-EQBpPw1=yq_jya2kJ5u5xs_xg=nhB8ZHwhjCoA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: add missing single_release()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        nouveau <nouveau@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Thu, Sep 5, 2019 at 9:14 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> When using single_open() for opening, single_release() should be
> used, otherwise there is a memory leak.
>
> This is detected by Coccinelle semantic patch.
>
> Fixes: 6e9fc177399f ("drm/nouveau/debugfs: add copy of sysfs pstate interface ported to debugfs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 7dfbbbc1beea..35695f493271 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -202,6 +202,7 @@ static const struct file_operations nouveau_pstate_fops = {
>         .open = nouveau_debugfs_pstate_open,
>         .read = seq_read,
>         .write = nouveau_debugfs_pstate_set,
> +       .release = single_release,
>  };
>
>  static struct drm_info_list nouveau_debugfs_list[] = {
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
