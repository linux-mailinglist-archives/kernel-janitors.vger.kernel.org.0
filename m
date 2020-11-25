Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E4F2C496F
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Nov 2020 22:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbgKYU7j (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Nov 2020 15:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgKYU7j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Nov 2020 15:59:39 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D8CC0613D4
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Nov 2020 12:59:29 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id i17so3748760ljd.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Nov 2020 12:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSc+USIpYmzMEHaLwlR/SOzDt5gT00VeWyTNIbEhUIs=;
        b=M04Q+nJNQ64PNRROT/3tOL0jupqO3QrHou/ful+jKNW2Tnc5EqT1kzFVo31TvCxJpa
         vWDxJpgmyAvIdvqOfpnoO0MzXwzR69WnX9v84j9YfJsMiDuTGlMbK4mLxlbX/BW5PelV
         9a25glA2jNbCbCKda1zAE+UgGGcNVQW/u4/BqG3PNYnjqOOeX4bP5qwsvgqta2sFCom7
         eR9ArC1Vs7xf4OeBy5gHKlB0/zsq6qkj0YqSK0SzRVrzMpbjDIEYLxLTjhZvfUZ2poRe
         PYWCie8FZPdAbq7aH/rFHHxHzJXUKgp1HmEJ7lvD6xTZw1qvaDtloTnzJerZG4pN5P0I
         5w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSc+USIpYmzMEHaLwlR/SOzDt5gT00VeWyTNIbEhUIs=;
        b=C0RlEF2OYNw0h1uPnilK0yW1NpPiM/lMJM8ThbE6aMpZooVkZDQ46Vk5wkPlHMEKxL
         WLlhLteE2z4q1xj2MXfXcokrfmNrOxxHYxeGzNcXnZUh/+/DpxDNT120gUmRoh39EpJp
         5dOQ55Lk8/4kxzES+pml0+xP3/5iN48qpQGco0M2PrpdPtKDVCpsy6YK2CfTbseueLac
         MCVqYVZ4+5M1L42YE31DBdJUSxZHILJi39zuS0SAQMmha/heOT6bzTb90Nb5GLW3BbSm
         BVxai0ino0tSZEnC97VOKQTGY32ClzrWn715nAnyJH/5wSVI5jQwUucDbvwrESkhjDwc
         1YSw==
X-Gm-Message-State: AOAM531uKsOhWsbu76BKJZOur734vpI1WiSizawawF56I1CwCOIlwKWq
        uYD3iB9LVvGbiPvilidwtrpCXQLXvApVm5YUb1mwdlecRlDxzQ==
X-Google-Smtp-Source: ABdhPJwVX3EcY7GPmnzEgXyZTSKFqwyBVhx9q5jqicnILRhlTpWEhBlLh80EasIgAOmyhBRHb6FiPzKjzTcZOErgx0I=
X-Received: by 2002:a05:651c:c2:: with SMTP id 2mr1997756ljr.104.1606337967492;
 Wed, 25 Nov 2020 12:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20201124121528.395681-1-colin.king@canonical.com>
In-Reply-To: <20201124121528.395681-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Nov 2020 21:59:16 +0100
Message-ID: <CACRpkdbh_d14y2a3zA2HZvfx1hSWw8wQBQ7WZGgp2f4wqzdwkw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/mcde: fix masking and bitwise-or on variable val
To:     Colin King <colin.king@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 24, 2020 at 1:15 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The masking of val with ~MCDE_CRX1_CLKSEL_MASK is currently being
> ignored because there seems to be a missing bitwise-or of val in the
> following statement.  Fix this by replacing the assignment of val
> with a bitwise-or.
>
> Addresses-Coverity: ("Unused valued")
> Fixes: d795fd322063 ("drm/mcde: Support DPI output")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Nice catch!
Patch applied.

Yours,
Linus Walleij
