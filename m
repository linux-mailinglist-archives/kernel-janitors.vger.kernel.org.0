Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7280E2D3CF3
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Dec 2020 09:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgLIIGe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Dec 2020 03:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728859AbgLIIGa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Dec 2020 03:06:30 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419EEC061793
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Dec 2020 00:05:50 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id a16so781614ejj.5
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Dec 2020 00:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+h4P+nIxMIn2Y17NPQM2gbJgkQrOgIbiZP/S+TvIccw=;
        b=iK+fifgp9ztTYCWBGhchDKiH6Xk+PoA9PRfKf3MQ2gjmRv3SgwbrcO6EzTaYEdZiYa
         HWgqerMK3ZpzmVGqKPOGJnViNSGmaExatmF4Tb3utBavWIrJ8l+6axfczdeHtXZsL5O3
         HiIqekm7wQMFs34n5uD6nvZtTQHIX6+u1CcqxjT6Hbwiduq9hqUzCagaXE/S9t7gWVD7
         Uep9yNb21BuT9RfYdbugersTEa/rcEX/u3Oe674CPwyO0JzR/kLblL4+T8DKioh0tvci
         K733wJYMvuRM2K+JK8GL4k9mkvkxsvZcAe4XXfxMTgJ6/sqxArCdsrxOUN8OTOdHf4Bo
         C1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+h4P+nIxMIn2Y17NPQM2gbJgkQrOgIbiZP/S+TvIccw=;
        b=uFYuw8NibQAXzYt9Nt6AeqVYdeJN0z3Lih+SedTSfCmOLHZyKiHrPCFTPKbXxMT8U8
         Caygw2ZgoLheLzq9to7FT9w8XWflvOdYEs5L7OhO8FlA65CCKH1VSCK355Ay7+A6VUaq
         /HepysYr0ZTU+FNWxiBbnsJZo9hS8UhhbfKflVy9Qhv1+knLkgfXH/8k6E4x3DreRPl4
         yGWHb6PKoNDh6YqMoAve2XUUiJWgy/NfFAgnL2uywY/Vo7nVza2ItKIvwP9QqOvMrO1f
         3a5/uoe5XbM7tqApgtOtHlre/BOpIOB5nuJM6tgDG/Li6n3brizjbzru2IGekKtoyyXF
         fiVQ==
X-Gm-Message-State: AOAM532uplRUrUyVTBh0usp57O8QX7LBmm/MuzHEgnxFvLqjiGfcIc4q
        zaBVG2j7j2TwDhcOqqvNfoAe4GmLqiIIXLbvoB2d+w==
X-Google-Smtp-Source: ABdhPJwV7Myf/TtvpWVIHTPvl6WzfnFktfXbV4T5cs7TAoX/XRTpUe1MdTRks785ev4S2kBQNQ02AJaJiAypkKqyIDg=
X-Received: by 2002:a17:906:16da:: with SMTP id t26mr1017805ejd.478.1607501148992;
 Wed, 09 Dec 2020 00:05:48 -0800 (PST)
MIME-Version: 1.0
References: <X9B0IyxwbBDq+cSS@mwanda> <CAMGffEn6a92UDBgzkR2L6wutNBpxY_xNf3cakvbivkaGRnk_uQ@mail.gmail.com>
 <20201209080323.GE2767@kadam>
In-Reply-To: <20201209080323.GE2767@kadam>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Wed, 9 Dec 2020 09:05:38 +0100
Message-ID: <CAMGffE=5PJhKujzdHyP_AsujfcABxRQoCSkC6HnM+AuxxcVCmQ@mail.gmail.com>
Subject: Re: [PATCH] block/rnbd-clt: Fix error code in rnbd_clt_add_dev_symlink()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Md Haris Iqbal <haris.iqbal@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Lutz Pogrell <lutz.pogrell@cloud.ionos.com>,
        linux-block <linux-block@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 9, 2020 at 9:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Dec 09, 2020 at 08:36:31AM +0100, Jinpu Wang wrote:
> > Hi Dan,
> >
> >
> >
> > On Wed, Dec 9, 2020 at 7:52 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > The "ret" variable should be set to -ENOMEM but it returns uninitialized
> > > stack data.
> > >
> > > Fixes: 64e8a6ece1a5 ("block/rnbd-clt: Dynamically alloc buffer for pathname & blk_symlink_name")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch. But there is already a fix from Colin merged in
> > block tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-5.11/drivers&id=733c15bd3a944b8eeaacdddf061759b6a83dd3f4
> >
> > There is still other problem through with commit 64e8a6ece1a5
> > ("block/rnbd-clt: Dynamically alloc buffer for pathname &
> > blk_symlink_name")
> >
> > I will send the fix today together with other changes.
>
> Ah...  Haha...  Sorry about that.  We already discussed this yesterday.
>
> What happens is that when I write a patch, I normally save it in my
> postponed messages until the next day.  But then I decided to not fix it
> but instead to just report it.  Unfortunately, I forgot to delete it and
> I also forgot about yesterday's discussion because I have the memory of
> a gnat.  :P
>
> regards,
> dan carpenter
>
No problem, thanks! :)
