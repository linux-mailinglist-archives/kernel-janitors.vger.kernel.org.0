Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2302B3201
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 Nov 2020 04:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgKODAb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 14 Nov 2020 22:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgKODA3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Nov 2020 22:00:29 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4FDC0613D1
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Nov 2020 19:00:27 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id v12so10496829pfm.13
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Nov 2020 19:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NM04bhq4ZaeDRE81agCk1AGmjsVEZcWRKjtkqk2C9fw=;
        b=K5IGKmoj0ynR0sTvQNGPOtKhqFyZmd+75JJVW2XW0iCQzhHqSkmPhijjS4UQRx/qEy
         Dpn28TQPklD5+Z6ENl2SfPd7W5mwF92Zo0fh2Z918T3VBVuHsmSj2RG6Kco3ubIU5J6x
         HYvn4ir89zteWyXJt3KtBEZt1N3KrryZ7ZJgcCs3m8r0RXhTkyOHmtxBFbXXqjRuj5Kg
         S77IlHk2jJvP2K/QI1/tsgYbUpGyLCeqclUx0G8N/OWV4CjDE9gx3DQhV149YHEnfW1F
         LhzLYuAVK7bEPQ3jpsDSuLIzQIB5aVXIffFl+h8KyUvip1Qqz6xh+sMxr1NdDAxyT8PO
         OtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NM04bhq4ZaeDRE81agCk1AGmjsVEZcWRKjtkqk2C9fw=;
        b=jp77MGf75B+lOBIYUm2fmcSDbho4nfeWx4pcWKtTsZoe1BFKbN7kzNA6DSo9isn0ye
         poE6KamrbloviawmnUX+fJH5wTBYdXZA8tXSckRYOfZIFwvQ+f3Yvca6WrAMKfMpK5wK
         seGbVv4oF+iWOJtQauplR33BDa8Vf9Z2x3MKBoOhV7+L/EwekArBtZiubC4xNd3LO1g1
         Gd10B957+JIbwUZe/HtGaqFuAjR/loLZ5hLOLykZudvwbzs1aZ5USK52FurmmvyY2rVP
         JS4U0KtKBH7a5ujv6qRpvJMwLrCff4OYtXbXl67aEDYJMqpkd8qRLJnZHsL2ltcNxnu9
         i3tQ==
X-Gm-Message-State: AOAM533+4oUMFUhqCDHlnkK/NpN6sNCZkFQtCe1ZyznFYSw7nFYBVhV9
        OVDS0m3EJpjSK0rRV+P/G14=
X-Google-Smtp-Source: ABdhPJzdQmePlIoS+kraxRH5sedCINUs983Tfd4wc4WYmT1V8lx1WwY8JQIxHe8J7O4cubkmga8qYg==
X-Received: by 2002:aa7:942c:0:b029:18c:5ac1:d729 with SMTP id y12-20020aa7942c0000b029018c5ac1d729mr8556062pfo.12.1605409225861;
        Sat, 14 Nov 2020 19:00:25 -0800 (PST)
Received: from Ryzen-9-3900X.localdomain (ip68-98-75-144.ph.ph.cox.net. [68.98.75.144])
        by smtp.gmail.com with ESMTPSA id z7sm14441058pfq.214.2020.11.14.19.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 19:00:24 -0800 (PST)
Date:   Sat, 14 Nov 2020 20:00:23 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] netlabel: fix our progress tracking in
 netlbl_unlabel_staticlist()
Message-ID: <20201115030023.GA927@Ryzen-9-3900X.localdomain>
References: <20201113085255.GA91999@mwanda>
 <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
 <20201114094516.GZ18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114094516.GZ18329@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Nov 14, 2020 at 12:45:16PM +0300, Dan Carpenter wrote:
> On Fri, Nov 13, 2020 at 09:41:01AM -0500, Paul Moore wrote:
> > On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > Hello Paul Moore,
> > >
> > > The patch 866358ec331f: "netlabel: fix our progress tracking in
> > > netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> > > static checker warning:
> > >
> > >         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
> > >         error: uninitialized symbol 'iter_chain'.
> > 
> > Thanks Dan, I'll look at it today.  I'm a little confused as to why
> > the compiler didn't flag that, but perhaps I just missed it.  Anyway,
> > patch later today ...
> 
> GCC has stopped warning about these for some reason.  Very frustrating.

Most likely due to commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized").

Cheers,
Nathan
