Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BB51EE177
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jun 2020 11:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgFDJjl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Jun 2020 05:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgFDJji (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Jun 2020 05:39:38 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA7EC03E96E
        for <kernel-janitors@vger.kernel.org>; Thu,  4 Jun 2020 02:39:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id o26so4162209edq.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2020 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J7btnW3tsRxnIcXWy64DJz6nFcHS2EOi2Wpoy2UuEWQ=;
        b=QYPuNXUXgWjqVo65fdSoRHO9CgkgNI76FQMpdvgcNSunnwsKIobrL81g/G/D3F14GA
         xtaIXdN6O9X9bBEBEn4ru62fmVgnFkVqcDxfiNG87C+lwW8+tLFRSV7Btz2DGPiAuLyO
         D+z6aFktaf7jWvDMeM8FMthrfku1de5uPqUPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J7btnW3tsRxnIcXWy64DJz6nFcHS2EOi2Wpoy2UuEWQ=;
        b=un+/i7U8U+CPZW2T48nZo5A9+YMZVkmNPhjTMZa4KJ6bug7nN6erKlLIjNkWM2LYiB
         9Twf6chfb6aEsbdDmPJdSPGdDayfSBo0z7a9dsBpZ43SfMpdhOvznryYmzkqiIEMtgFP
         +jR/33XZwn7uxD+OrZdTNSgBek7Yq9uZGJJs5bzpbllQchRipUXRCUKUV2O76j9Ookb1
         KDF50HIcpR/h1cJMZJ9HsgF8cSCwOfLX0LQjGKs46cDQRE7G7AIxtbjLPKtsRvYARmMk
         AgWkzY1VrQztArIQ0COUk+bauHpTQ7pGBvwVZMc48QsQ2QBndaDodT/7ZLaTgaPefslR
         q88g==
X-Gm-Message-State: AOAM5327LRt/Z1lSWFxji20k3+aTGy9SKKZTnKUj8yi4XQ46WCYVKYZa
        HooOszXBjaap3BtXEFfEhP9xhgU/4ZN531gwZwGtnA==
X-Google-Smtp-Source: ABdhPJxKDysyrZZSn8pqHQJgaPL3tRQPi8ZTv3ZfjwOOzrRG9lOPs9ai1Upz60g4bD+J/4yiv2Uy2btGEws69dG3mnk=
X-Received: by 2002:a50:ee8f:: with SMTP id f15mr3506384edr.168.1591263575775;
 Thu, 04 Jun 2020 02:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200603154559.140418-1-colin.king@canonical.com>
 <CAOQ4uxhLW=MSk=RhUi51EdOticfk1i_pku6qjCp2QpwnpyL5sw@mail.gmail.com>
 <1edc291d-6e63-89d8-d48c-443908ddc0e8@canonical.com> <CAJfpegsyGmJYHJr8rmRTxScYGyNQ1ZdPMxprW1zoQmGhXg1wuA@mail.gmail.com>
 <78e9b4ed-f530-1fd0-07a2-aca5245a6bd8@canonical.com>
In-Reply-To: <78e9b4ed-f530-1fd0-07a2-aca5245a6bd8@canonical.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Thu, 4 Jun 2020 11:39:24 +0200
Message-ID: <CAJfpegvnMrYdn0pqZLK7BaPmfwd_8Xf=vECd3GVDa6++bh9D7Q@mail.gmail.com>
Subject: Re: [PATCH][next] ovl: fix null pointer dereference on null stack
 pointer on error return
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Amir Goldstein <amir73il@gmail.com>,
        overlayfs <linux-unionfs@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 4, 2020 at 11:27 AM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 04/06/2020 08:25, Miklos Szeredi wrote:
> > On Wed, Jun 3, 2020 at 6:15 PM Colin Ian King <colin.king@canonical.com> wrote:
> >>
> >> On 03/06/2020 17:11, Amir Goldstein wrote:
> >>> On Wed, Jun 3, 2020 at 6:46 PM Colin King <colin.king@canonical.com> wrote:
> >>>>
> >>>> From: Colin Ian King <colin.king@canonical.com>
> >>>>
> >>>> There are two error return paths where the call to path_put is
> >>>> dereferencing the null pointer 'stack'.  Fix this by avoiding the
> >>>> error exit path via label 'out_err' that will lead to the path_put
> >>>> calls and instead just return the error code directly.
> >>>>
> >>>> Addresses-Coverity: ("Dereference after null check)"
> >>>> Fixes: 4155c10a0309 ("ovl: clean up getting lower layers")
> >>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>>
> >>>
> >>> Which branch is that based on?
> >>> Doesn't seem to apply to master nor next
> >>
> >> It was based on today's linux-next
> >
> > Yeah, it's actually
> >
> > Fixes: 73819e26c0f0 ("ovl: get rid of redundant members in struct ovl_fs")
> >
> > So I'll just fold your patch.  There's still a change in the loop
> > count for later errors, but that's okay, since
> > ovl_lower_dir()/ovl_mount_dir_noesc() use the path_put_init() variant.
> > Actually ovl_lower_dir() can get rid of that path_put_init()
> > completely, since now the only caller will take care of that...
> >
> > Thanks for reporting!
> >
> > Miklos
> >
> Is there a reason for folding the fix and hence losing the Signed-off-by
> tag?

I generally prefer to fold small fixes for not yet merged patches.  In
this case it's more of a personal preference, but in other cases it
might have an effect on bisectability.

Thanks,
Miklos
