Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E6A1CF3F9
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 14:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgELME7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 08:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729477AbgELME6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 08:04:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11834C061A0E
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 05:04:58 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so13301168ljl.6
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5btP7gtbpjtG0BhO1UsxQRV4a7bUgE/wIxxtvB4r82k=;
        b=zc2w2MLiS0a8rnKvBR7UNWYE0BbONekozXpNgUqpFZ5kVRg6+oI64tWi9lfGivgNeb
         0xSZwWlbpp/ikbEom6DC9FZDRsko9yRHoXbMTuo/u1I+b77ubHC6tJbNZNCr4PyKXwUi
         gmbc+fu5UbWh1Bta2gBmK2Uit91iJEnEjIP+z41JS8IHO1tSoWXbs9pJm5we8/OsUBSk
         wJG/1Y+j7+2mqdSALCXTh6BPXPi2GTgvWnvDHTRALQ1NkXHztiY+UaKX5G+XGnAkVxzm
         DPKV2Wi8rW9BIu759OOt4uInwbttKSx65J3XY5GsVfHXBlSahmJuIO2atCuXwtGbg85G
         EaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5btP7gtbpjtG0BhO1UsxQRV4a7bUgE/wIxxtvB4r82k=;
        b=ikeunK8vXQdi9jjfsxdb50t1hzXmm3HQ6i5291eeHlQJxj393wKRj0Myk/7zXO0z7r
         qRitTgdy9zczJ3kcgkDRC73XnX9yeWKDWwCXEk0a7Kntk7VpdkRLT3/NKTX882UEbSo3
         NXlAwvVlENuyHXYiyJAW0GsIX+l1EdcmFn3FOwaI5DXbEHGLebTGIk3c53ZDReA74Yna
         5d9TWB3kqENMUonb1iwMjXFaYEKDrqso2qIjrRpuePe6pwGKIINiBWxTdm4DY/LQivCa
         ZKvLcCGJjpgZKSdadWPC1B21Ggw0Ce3MAaIzG/Hheg+vGtUUkJ87GH3nGwUckxzF2jwv
         z/5g==
X-Gm-Message-State: AOAM5309PwwSnFK1mdluNUgynLsGdm65CmIXP/98yV6unDx5scJ/r2Fz
        gr6Q/g/bOfSVqrcXq0PjXziuc6xEUv6wvJ6UJ6gM6w==
X-Google-Smtp-Source: ABdhPJwQSmzg18wDAiNLVctzzlRZrCjXxz1QtookN6JLhJ4bNY7gw2amRj0dviJQShJhEFaL/quWNpl+3GN1FMqhN7s=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr13584425ljp.277.1589285096459;
 Tue, 12 May 2020 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141459.87624-1-weiyongjun1@huawei.com> <20200430073145.52321-1-weiyongjun1@huawei.com>
In-Reply-To: <20200430073145.52321-1-weiyongjun1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 14:04:45 +0200
Message-ID: <CACRpkda2-EHn3BrMtGoTV4uax6G0JJekEjnnLL1FT+2YQFawTQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] drm/mcde: dsi: Fix return value check in mcde_dsi_bind()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 30, 2020 at 9:30 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> The of_drm_find_bridge() function returns NULL on error, it doesn't return
> error pointers so this check doesn't work.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 - > v2: add fixes and fix the subject

Already applied v1, no big deal anyways, its a nonurgent fix.

Yours,
Linus Walleij
