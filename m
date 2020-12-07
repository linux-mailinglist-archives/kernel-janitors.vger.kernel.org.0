Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52072D1542
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 16:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgLGP4I (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 10:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgLGP4H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 10:56:07 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D244C061749
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Dec 2020 07:55:27 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id d2so6512380pfq.5
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Dec 2020 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3td4ucaRKYIb7ByOjIhGjC1jXmU1jM2LNP5rlfMLIE=;
        b=r84J+brDsEFP+0AbpWya7rvgFVTK/w/s0NFXt//4X1mHsqg0NyEUlH+QX/dbfEgLnQ
         tql56F81625QdeWOXN1huRcQn7VatXtmDjoSqQyZ867PlS0BaJXBJWUb6+wOT6lQsAIP
         dUfK32igG/VbuLfdLOKCb4szbHZXvB1LBPSNDjMdkBErys8SEkTH4N8TZWw8N8yPb1Hi
         +eNxuYqH09oqaEBhHdU1ZR98rkCNKh+ZyEML1ONyso+hJGvyoQJTnhakQCk1aFPrXU4p
         J7EIFzVJbW9hTxcy5FhdatYp13BSBZTwM/4BipTxiGuxcx9K5YcOYyqTbKBlXWRKRfHh
         6m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3td4ucaRKYIb7ByOjIhGjC1jXmU1jM2LNP5rlfMLIE=;
        b=lUwo6NXrXnIU1WdRRAiaEfU8/nLJ0YmMhdTcMbkkd64cM5hejTLFRYq+TKK1YvVFim
         auYiAdCdvoSKxX2aO1NUUwrxF6MDmtuTmX+ZhIInZY+rbo/CLpGgaKst7d/sYilFPYgb
         IwbpmNs4sVPj8uZLs5i3v9TwwUP6RUv9F9WhBf3LEHPP+QIgrU7CeY80myJ1of3gHeKx
         ywXy/fzcTrmjJ69oJZgQYh3OPr0K6lhIWImHCHE9m06MZ3sh0692HgWSy474M83D3kOY
         T+DW12M/57kG/hg/BmCc8X/KADxv/FAopagW+Vx+732LIMsChMmDTkde/LGs8LMipxb/
         RBtw==
X-Gm-Message-State: AOAM532BA2DmM19+lViWsI0tTAULnbnYXJCZrRaO+wUe5oSXBfkg+5mA
        mxi8JqhbyETlPb5wP846guCo7x8A1KKi4K44lU8=
X-Google-Smtp-Source: ABdhPJy67ej7Tj9WCuxLm8FAFAnOL4AYsfV1pKnwcslFMmPrTF3LsFGe4YfWbXvynktoH4/FA3+pUx1DSa6tD03vEAg=
X-Received: by 2002:a63:471f:: with SMTP id u31mr18791287pga.74.1607356527125;
 Mon, 07 Dec 2020 07:55:27 -0800 (PST)
MIME-Version: 1.0
References: <X84nbdgv0a/ak2ef@mwanda> <20201207131446.GA852@paasikivi.fi.intel.com>
In-Reply-To: <20201207131446.GA852@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 17:56:15 +0200
Message-ID: <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
To:     Arnd Bergmann <arnd.bergmann@linaro.org>,
        kbuild test robot <lkp@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

+Cc: some people who involved in different kernel source checkers

On Mon, Dec 7, 2020 at 3:19 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> > The "ret" variable isn't set on the no-op path where we are setting to
> > on/off and it's in the on or off state already.
> >
> > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Thanks for the patch.
>
> This issue has been fixed by another patch here:
>
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>

This has been reported by 3 or 4 different people. I'm wondering if
it's possible to introduce a common database to somehow reduce the
amount of patches against the same findings.

-- 
With Best Regards,
Andy Shevchenko
