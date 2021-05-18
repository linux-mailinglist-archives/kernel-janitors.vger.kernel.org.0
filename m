Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73113879C0
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 May 2021 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243064AbhERNW1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 May 2021 09:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240830AbhERNW0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 May 2021 09:22:26 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27239C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 18 May 2021 06:21:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id p6so5058332plr.11
        for <kernel-janitors@vger.kernel.org>; Tue, 18 May 2021 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eij78DTYm6LdNyJPrTT7rIc4tl9S27pR1VqAL0ye5eg=;
        b=i3pMD4EzmEx0IQ02hRhTPfWzHAZxoHQCiYfbjxNP823FZ/30gTRWPWGpibKir53wDG
         5Y8bC28z0VPmH9l0Btv2arydjw0pIGMo6+1IJ1Jiu9VG0xn4MHgOefKpmwc1OnJxP/A7
         nC950+rJqjW66it6AZo2SWrI8rlHWNQF9ujtGqENUM3Kg9WUrBr1eYHb1b2JU3tuXgd0
         PtcEWdMj6op4rGBFmIBnCwwmk6WqEPdCaXz+UVjy+mZvqlMTClxYQO2stfqHIVMNlCgl
         qvBYy6QqFo3qj0+0xb/NcyU6YM8XUgzAucXH2GP4hbq56Cm+Zj2/HeHnk/V4WWYJTFjc
         w2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eij78DTYm6LdNyJPrTT7rIc4tl9S27pR1VqAL0ye5eg=;
        b=X6dlk0tbNDzuTMqbLwBIBac0QHUsSYcsAAizQ+Ktq9jzC9NG1GHDZ27GC78VE2P5UT
         YsIWD1myDfG88s795n7uqUi08H13b2uneeSxbnzsogsNoPOXTCiFkV5RFDegyXmgDr2x
         IBWZpXkx//Kvq71dnUtqrPCAB/5mhkCx/cA00ShUEs/KR4UIz5oHvXWZ+ObrKq9q2uea
         4Y0GBiyBxT30npfrCxaVFehZ4TBbgs0K1iSb74Y9AkZlicgHKs73GGSVCmlVP+1rIl/d
         yWlT+Xq8cSn72rEJtFT7fbGJxZLvgDTvG+MB5AX7m1622WK2Gbbm1+4BpZDIS8/omVYx
         H7lQ==
X-Gm-Message-State: AOAM532B4sQcIJ3AzVSgjH2w24yjQ29v/9ngyFifhuf0lRZq3DX+3FqX
        /lOC1xsQ42ve4ThPbCnQ9JVlSui0484KCOudyLUA8Q==
X-Google-Smtp-Source: ABdhPJyEB0vA70S0lI3WHu3HCNasA37Y5tjILdnUF6+2WrHYIGLEwPF3u5iNV46DS4+EpEvgiHCl+6xIZzDLKE+vwLQ=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id j15mr5529715pjl.19.1621344068626;
 Tue, 18 May 2021 06:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <YKOGogHasIyvF8nj@mwanda>
In-Reply-To: <YKOGogHasIyvF8nj@mwanda>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 18 May 2021 15:20:57 +0200
Message-ID: <CAG3jFytpOb8KeNCjCJ7gq20LQK3UGA9PgGne+cR2kZdADS-Oxg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix a ternary type promotion bug
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hey Dan,

Thanks for submitting this.

On Tue, 18 May 2021 at 11:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The ti_sn_aux_transfer() function returns ssize_t (signed long).  It's
> supposed to return negative error codes or the number of bytes
> transferred.  The "ret" variable is int and the "len" variable is
> unsigned int.
>
> The problem is that with a ternary like this, the negative int is first
> type promoted to unsigned int to match "len" at this point it is a high
> positive value.  Then when it is type promoted to ssize_t (s64) it
> remains a high positive value instead of sign extending and becoming a
> negative again.
>
> Fix this by removing the ternary.
>
> Fixes: b137406d9679 ("drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen w/out pre-enable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index bb0a0e1c6341..45a2969afb2b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1042,7 +1042,9 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>         pm_runtime_mark_last_busy(pdata->dev);
>         pm_runtime_put_autosuspend(pdata->dev);
>
> -       return ret ? ret : len;
> +       if (ret)
> +               return ret;
> +       return len;
>  }
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applying to drm-misc-fixes.
