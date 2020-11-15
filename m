Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A4A2B356A
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 Nov 2020 15:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgKOOnE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 15 Nov 2020 09:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgKOOnD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 15 Nov 2020 09:43:03 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F92C0613D1
        for <kernel-janitors@vger.kernel.org>; Sun, 15 Nov 2020 06:43:01 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id cw8so20689892ejb.8
        for <kernel-janitors@vger.kernel.org>; Sun, 15 Nov 2020 06:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hfEcfY5w3QyHGmc1GrUsrjUR/RKnJ/e1nTf9oT7EoXc=;
        b=WHxrZJi+vH6zpwxEzE4QRw66UiMV/TbeUslirc882GZZJ7uob+hcZqtmg4MwK8msBH
         gNZB8QlSsJnXwzn8mMdes/WQwMErvtRMG+AEFlxGrvel5wEk7fG3CYowLrLtLHXdhzU4
         +l36CIJrBQBFxIBw3wx4cQwTOh3HGqRpDvFLozplFowH7llq7NE8R6T59t0MIIKZlKM/
         ICaFmgC2BzqoY/xhFPDVOsG887SDlY7PDzuUf/jbn5d+uQxAB5f80i37EkmoX2qDO1cb
         h46ZP9O/vVZxhCBlWjwpojUE7Bi+Ey/HRBgygjdnbgakF17n/ZBbqYqeuOUFGTZLn4FQ
         y6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hfEcfY5w3QyHGmc1GrUsrjUR/RKnJ/e1nTf9oT7EoXc=;
        b=Cd4uuw53rii9FncOr0XCPN7RmxoB6fAPpcoWmtKLgckLda+sQD6QXSj9F5UwurKSIk
         4BEalyETpi09fkDrEl8IdHogkaRkfJtv5ppH7iqLf4TcfvdOL/wVXsYvDJEM0zvRXe8A
         p6VOQopbRwu0key6GrD+qNDu5WDYLZHyfr0GwFQEClv8YY4411uQpHn35ekxXgE+ffsp
         v8hXHvlX+yJYP5m8LSXbBXdXITBWKKkIikShd4SzXkbDt4iO2lP14qzdJoGEMFPjbLwC
         Evv5i7/0u+ya+LyM3NmPAoPLLZHshNp4qmnAhnqnxx1a6F/nJHYzkWJcPa7mkzonQltB
         OZiQ==
X-Gm-Message-State: AOAM530hj0m1Vn7M94iNKae/85t4B/nUNxpJSVITksa8iV0aqFbczhLV
        w32wV64BIdqwJdInFVqY6Z7xvPG5Bmf61aChmYt9
X-Google-Smtp-Source: ABdhPJyUiZf7FRbgtu3xET31wGb/IooI0N5pi3DZfisrcg++JRqQO7wyNZC8FuHoKa6bLe2pn7WmjzxdeclAcv92d1w=
X-Received: by 2002:a17:906:c096:: with SMTP id f22mr10303991ejz.488.1605451379603;
 Sun, 15 Nov 2020 06:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20201113085255.GA91999@mwanda> <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
 <20201114094516.GZ18329@kadam> <20201115030023.GA927@Ryzen-9-3900X.localdomain>
In-Reply-To: <20201115030023.GA927@Ryzen-9-3900X.localdomain>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 15 Nov 2020 09:42:48 -0500
Message-ID: <CAHC9VhRjUt4MBuzur-4gE4VhG2Ao2SJVP5ouWLs992nNtZwrzg@mail.gmail.com>
Subject: Re: [bug report] netlabel: fix our progress tracking in netlbl_unlabel_staticlist()
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Nov 14, 2020 at 10:00 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Sat, Nov 14, 2020 at 12:45:16PM +0300, Dan Carpenter wrote:
> > On Fri, Nov 13, 2020 at 09:41:01AM -0500, Paul Moore wrote:
> > > On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > Hello Paul Moore,
> > > >
> > > > The patch 866358ec331f: "netlabel: fix our progress tracking in
> > > > netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> > > > static checker warning:
> > > >
> > > >         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
> > > >         error: uninitialized symbol 'iter_chain'.
> > >
> > > Thanks Dan, I'll look at it today.  I'm a little confused as to why
> > > the compiler didn't flag that, but perhaps I just missed it.  Anyway,
> > > patch later today ...
> >
> > GCC has stopped warning about these for some reason.  Very frustrating.
>
> Most likely due to commit 78a5255ffb6a ("Stop the ad-hoc games with
> -Wno-maybe-initialized").

That does look like the culprit, thanks.  It looks like I need to
start training my fingers to type W=X more often now when building.

-- 
paul moore
www.paul-moore.com
