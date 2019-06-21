Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B8D4ED1E
	for <lists+kernel-janitors@lfdr.de>; Fri, 21 Jun 2019 18:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfFUQ0I (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 21 Jun 2019 12:26:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38955 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUQ0H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jun 2019 12:26:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so3862480pfe.6
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jun 2019 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QGGXbtGqjT/8JHl90NENFneOyMcVx1pmW8SwPMxZhnc=;
        b=VNSfaSrYn6JtJnDJSfOqnDLzSNCiB097bMhMBgHC9puUkpdT8+LRmSz/4mvXIOC1H8
         6io6zQW68Cgj10MjA9+mZqbwu1ZM1h31FIB2uQMoAvk5oRFhAmQzNyPZ0R8wLwrLikUs
         OF8qHdeD2VyayW2MUP5Tj8YbN5YGsfIYBZdEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QGGXbtGqjT/8JHl90NENFneOyMcVx1pmW8SwPMxZhnc=;
        b=C0HIpPjF50vQQCzmZu8G5dJ1Sw9ykdnTc0kTFb8VGlDtZ1AOfv+py7jgODpTo8ZhFK
         rwALymp6Cl6y0GnOwTyUVO/dAey4fCllf+UKZirwRfQ745Z1i9b//3G4NcxL9dXc9thE
         4FuPZsxa5IWEDzmj1u67tYVyf4dDm/BUzFIXiU/fE4krttekxsmVU98iKMxLmvh4Nmeq
         gQmSmugtQm5TQPlu/KuzTluPkSRGQvYm3o/A6mDie3/NjGwPTBtPa3JSlv5Orzh+NQSc
         Y/GgPRZ7/qzPiMW9yRDU34wA4Qc3f6gfD6iOZlt/mxJRuQAt82kuFNqSbjZ8Ub+r+x05
         o8Gg==
X-Gm-Message-State: APjAAAX7vhIo0zfodZIvnK1y+ika0PJlkYVHtTPZhDFsSKE6T+ZAgFjs
        eYgdhtUj3bq4mia/C9HNcNQD8nUmOHk=
X-Google-Smtp-Source: APXvYqw+SAN38dAvhi9oOLlGxcfaCHaZKK0bjk3Eto0s1p7ZRDvaj47kiKISLINxAAKjKSmW6FFpfQ==
X-Received: by 2002:a65:5302:: with SMTP id m2mr19204195pgq.369.1561134367215;
        Fri, 21 Jun 2019 09:26:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e22sm3198234pgb.9.2019.06.21.09.26.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 09:26:06 -0700 (PDT)
Date:   Fri, 21 Jun 2019 09:26:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Colin King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] lkdtm: remove redundant initialization of ret
Message-ID: <201906210920.E133B26C@keescook>
References: <20190614094311.24024-1-colin.king@canonical.com>
 <20190621140347.GA7011@kroah.com>
 <20190621140509.GB7011@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621140509.GB7011@kroah.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 21, 2019 at 04:05:09PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 21, 2019 at 04:03:47PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jun 14, 2019 at 10:43:11AM +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > The variable ret is being initialized with the value -EINVAL however
> > > this value is never read and ret is being re-assigned later on. Hence
> > > the initialization is redundant and can be removed.
> > > 
> > > Addresses-Coverity: ("Unused value")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > Acked-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  drivers/misc/lkdtm/core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> > > index bba093224813..92df35fdeab0 100644
> > > --- a/drivers/misc/lkdtm/core.c
> > > +++ b/drivers/misc/lkdtm/core.c
> > > @@ -390,7 +390,7 @@ static int __init lkdtm_module_init(void)
> > >  {
> > >  	struct crashpoint *crashpoint = NULL;
> > >  	const struct crashtype *crashtype = NULL;
> > > -	int ret = -EINVAL;
> > > +	int ret;
> > >  	int i;
> > >  
> > >  	/* Neither or both of these need to be set */
> > > -- 
> > > 2.20.1
> > > 
> > 
> > With this patch now applied, I get this build warning:
> > drivers/misc/lkdtm/core.c: In function lkdtm_module_init:
> > drivers/misc/lkdtm/core.c:467:9: warning: ret may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   return ret;
> >          ^~~
> > 
> > So are you _sure_ it shouldn't be initialized?
> 
> In looking at the code in my tree, ret is used uninitialized with this
> patch, so maybe coverity is wrong, or I don't have all of the needed
> patches?

The path went away when the check for debugfs_create_file() was removed.
I thought that patch was in your tree already?

In master, this is the path to "return ret" without prior assignment:

                de = debugfs_create_file(cur->name, 0644, lkdtm_debugfs_root,
                                         cur, &cur->fops);
                if (de == NULL) {
                        pr_err("could not create crashpoint %s\n", cur->name);
                        goto out_err;
                }


-- 
Kees Cook
