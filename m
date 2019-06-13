Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04FA43CF9
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 17:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731953AbfFMPid (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 11:38:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37632 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731943AbfFMJ6P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 05:58:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id d11so6750000lfb.4
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UeQpwXCeDLPpi68/6pv3vrzu0yim26SWBWe/Hs+pCZQ=;
        b=lpOISga17qBlvACtZGt4+jtA8zbDfh+2i3A3HDY2kAHIuGNEha2LDJQ4TYvwPNRtt2
         WjccyF30xL8MNHpDpik9UtjU9Mvm7pmUL9WVFenm3WQAtbSsYUaSIgKUAb/h7NmieYVq
         vbJ04PVpH2CKlPzTjYoAD0LlYPtprXSTGaiewoQ/ZcYUUw4Je2qmaGnv5pllOzbXVuSq
         y8LhCGFLwHdfL1+ydGtLz6iiKpYBem0IKo1+oLLp0th3nFoUJ47+2HEhGYzSUpau2h6+
         jOIPgxr9ReC3ZSDN2raLeb1ru3QXSC1moV6zAtWF+d250y9X8ZypVbCXr4d8HF+kXE+i
         EIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UeQpwXCeDLPpi68/6pv3vrzu0yim26SWBWe/Hs+pCZQ=;
        b=Jcrr7chw9lyIvT9qlMq4La2puudt8F2N0/CBvkRpLG96+mSfimAm0DLQlbyCc3qytQ
         UAxGjKSxYoz3LUiGSThabv8dA0fXYxIbmV/uwKWaxmr1lcdEirKkUWhlvVUr+z+bXWso
         FR32HHj3kYMVYVVZ//YSwIf9i9HyEWcDO45G/ATREbBzEJj3Xf3P5c9gwIM/Sp6fdaes
         qHlP8K/kOyS8ILxIZuHo9JINY3u2+f59OVWyHk31SjIfbrrJikP8D6VRVnOFCLIsmS4O
         F3lXa5V3srBTldSgyqWfcs/+vJrmRycpjD24figQaBa//z3b0VCIAHUjwiFtiyabR763
         ovFg==
X-Gm-Message-State: APjAAAUky8gieV3S9g0o0fC8ZUdswiiOwlUVqjNViyti7/iQK7VntO9n
        iLPLPVSOfJUuDEWvkVsUISYyjt0Mz2xtX37ownZPdQ==
X-Google-Smtp-Source: APXvYqzzRYF2k/IXZZ7COJzFlNipdBNWGuSew0skOVez7AncsiN64/Xr0+4VQtJGG1EZMKfkyncDn3CcPqcgWkpZum4=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr9124106lfc.60.1560419893989;
 Thu, 13 Jun 2019 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190529113458.GG19119@mwanda>
In-Reply-To: <20190529113458.GG19119@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jun 2019 11:58:01 +0200
Message-ID: <CACRpkdZj=TPB_mDib6sQnDPLUJUtwhmrFqWSwcRMozJYFeuAaw@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix an uninitialized variable
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 29, 2019 at 4:25 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We never set "vblank" to "false".
>
> Current versions of GCC will initialize it to zero automatically at
> certain optimization levels so that's probably why this didn't show up
> in testing.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
