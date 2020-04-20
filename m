Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985EF1B019F
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Apr 2020 08:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgDTGhA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Apr 2020 02:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725812AbgDTGhA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Apr 2020 02:37:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09FEC061A0C
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Apr 2020 23:36:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so8604755ljn.7
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Apr 2020 23:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wzzonVjiFqiRq0e4HZwoXw5dkwvtdDd69mGiOUp396o=;
        b=EK5Hw0hfRi7o3dbY+m85I9ucv5v66qj7OqXEX+bN5I9Ho7VT/zjTxzC2y5ndZgTLp4
         99OTCzzx86xo+9nnsmaeAPrYxiYN9gta1Bx8e4xL6A+TNCIk0Y1pOfMuVSP7+Ky9MxJk
         icD8NMJ2oyMpTn5IwdwkIHlirSgPG+o7M5F+xzma+LkxlV0FX8FM5Ph7L6kz31bjpW9e
         XS8DclfyqEzVx1oijfQjNr3mHsw12Z1jI94nHwFb3SIF/YqcMwdptQyO1Duhx3E8EA0y
         UiNNQzwCxyxQ6on2JJwBvZKFeFMuOWx+/42PfAS76D7/fUFHE3Kp3Pt464f+GOt6+t9R
         x41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wzzonVjiFqiRq0e4HZwoXw5dkwvtdDd69mGiOUp396o=;
        b=ImvLHVfDQkfxAz6faeLXl/HCpsXTKbXarlG2yRMM6O58aBlZeIzFhq2bbhFozBWU1U
         /DyeRZswBYhUQdal0GtXh0swMFkle6YLxAV+vvQRSFkXcvyJ7uXoweteeb+4AFOPP8BB
         wDwCdoD3+Q+5SsCxDDsbD2Cgx+Iu6bhGe43eXw5V571rigBXN2xqqh1YcWP6TnDC+ggC
         eJn51XkbD/Luz0xkKXgAEMEzT9mvE1PraT8uPd/P+U1ajMaRbs25ICb1c+KEQVG1R41M
         TB0xlmpMvbhxyqfX+QAD891XBYY+1Y6UbXgqKfWT7pCLZCS3qJWyN3+Gkk/o769fzM+a
         A48Q==
X-Gm-Message-State: AGi0PuZI4FuBbiTObfTz5jdWQurgZiP7nopa7ulPcRLFtmh6ByesxJ3Q
        UpOma6mypv0Rft5NargDXpfLzq7BLNpU4jovGDzqMg==
X-Google-Smtp-Source: APiQypKA679rD7AuS1a3F+mVgpCG1iaYgkNLaDrBfSG+xwFJq90YlS7Ir42YOcTAQVcDdf8Cg1XUizrVtpaTwD7CyVg=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr8783634ljn.125.1587364618355;
 Sun, 19 Apr 2020 23:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Apr 2020 08:36:47 +0200
Message-ID: <CACRpkda7DBqJ_3N7eyqBREFk1jQpRQokgOqLq-sGs9UpaaSfXg@mail.gmail.com>
Subject: Re: [PATCH RESEND] MAINTAINERS: adjust to renaming physmap_of_versatile.c
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Boris Brezillon <bbrezillon@kernel.org>,
        Sebastian Duda <sebastian.duda@fau.de>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Apr 18, 2020 at 12:10 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 6ca15cfa0788 ("mtd: maps: Rename physmap_of_{versatile, gemini}
> into physmap-{versatile, gemini}") renamed physmap_of_versatile.c to
> physmap-versatile.c, but did not adjust the MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches F: drivers/mtd/maps/physmap_of_versatile.c
>
> Rectify the ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT entry and now
> also cover drivers/mtd/maps/physmap-versatile.h while at it.
>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Boris, please pick or ack this patch.
> applies cleanly on current master and next-20200417

Patch applied to my Versatile tree.

Will send a pull request for this to ARM SoC soon.

Yours,
Linus Walleij
