Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E03826AAAF
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Sep 2020 19:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbgIORaK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Sep 2020 13:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgIOR3y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Sep 2020 13:29:54 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC8EC06174A
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2020 10:29:53 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id k14so3880496edo.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2020 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SlyX5qFvMN3KiboyllxLciToK2Eq4o7JzV2O6OwBIsw=;
        b=jndKH7zPjuT+Yy8CprIBxo1iTRcTUheSW1BJZMKuVBjDMhYq0L3y4DaJALchKU0bWV
         /DG6HGyrAEcz92/BEzogfoheUq2NoOqWgUDoFeeALWTSjU7t6cmDtPMvcMOFw3IakuWp
         gTraMfBlRb4r8fMQ5MmQhdTGA8v2635Dv7yTHmUW7c4FifhvFkeow+fmjxnyULOz9cNa
         h1HY7N4mglhjyAyOCRnfI4Cdt1T65RO98WM5J4PiOI3ffCzhLE0AI3h6weRFWLf3hKMm
         EKJFo5+5hvJXNo5Y4rFLV8xJX6gMUJcVSH99V+Jsd8X0JKE85PLJ2LMkkl1g2xhe0pJp
         aGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SlyX5qFvMN3KiboyllxLciToK2Eq4o7JzV2O6OwBIsw=;
        b=IcznL18KK30Ry/qp5wlbCUPkQ8x6X0Erc0OjZYQ4h0W7eInx+dINlj9fBKVaLQHvWT
         6vdriUgPVgU+jG72XWY4KuIxS75wy8Nn+aYzh/9UXSJQ6naUym9JTUR1gFFEhurZ27wR
         S4C+0rWkgDjhuxnPHsmOxo4xKKJNf8x9dKCgmHKeovnVBef4eL0k7UkyGLwgD3mU/UCw
         ZcuSmrG98/oX/4PsVNk1CCW9VX18OxLTDwbGlBNmVCaNEzZJsCCPDwCabGPvID8GJsxL
         afY9Yk2Ecv0OCucky/R8+513HSwi8MXe6m4SmHE0oxipkHCV5/sXcaGpDmaRKLGWhMq6
         P22A==
X-Gm-Message-State: AOAM5337RULaMp5BmQmhFQyBSBt0OZF9uJVqQ98to1RUQHLbkVveeleU
        vOhcuGADHHpfFog0FZJQYc/JTM82P9fGDnNONlj15Q==
X-Google-Smtp-Source: ABdhPJyTXQP46Cu/TV0meUS7Ki8Jvai2uP0B7f5/avU/VxUKH5b+mSAJAXEN/96XuLNIG/fdWfb7f8IfAIdjG+sZPvs=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr23870682edn.104.1600190989874;
 Tue, 15 Sep 2020 10:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200915162049.36434-1-colin.king@canonical.com>
In-Reply-To: <20200915162049.36434-1-colin.king@canonical.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 15 Sep 2020 10:29:39 -0700
Message-ID: <CABXOdTcnAzFh81GuJ0Niqu6t2pF5AmwgFoXHf766XcXct_F+5g@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: cdn-dp: fix sign extension on an int
 multiply for a u64 result
To:     Colin King <colin.king@canonical.com>
Cc:     Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Zhong <zyw@rock-chips.com>,
        Guenter Roeck <groeck@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 15, 2020 at 9:20 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable bit_per_pix is a u8 and is promoted in the multiplication
> to an int type and then sign extended to a u64. If the result of the
> int multiplication is greater than 0x7fffffff then the upper 32 bits will
> be set to 1 as a result of the sign extension. Avoid this by casting
> tu_size_reg to u64 to avoid sign extension and also a potential overflow.
>
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: 1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> index 9d2163ef4d6e..33fb4d05c506 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> @@ -658,7 +658,7 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
>          */
>         do {
>                 tu_size_reg += 2;
> -               symbol = tu_size_reg * mode->clock * bit_per_pix;
> +               symbol = (u64)tu_size_reg * mode->clock * bit_per_pix;
>                 do_div(symbol, dp->max_lanes * link_rate * 8);
>                 rem = do_div(symbol, 1000);
>                 if (tu_size_reg > 64) {
> --
> 2.27.0
>
