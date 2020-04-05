Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3725919ED28
	for <lists+kernel-janitors@lfdr.de>; Sun,  5 Apr 2020 19:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgDERyh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 5 Apr 2020 13:54:37 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:40167
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbgDERyh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 5 Apr 2020 13:54:37 -0400
X-IronPort-AV: E=Sophos;i="5.72,348,1580770800"; 
   d="scan'208";a="344997099"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Apr 2020 19:54:34 +0200
Date:   Sun, 5 Apr 2020 19:54:34 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
In-Reply-To: <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
Message-ID: <alpine.DEB.2.21.2004051948120.3208@hadrien>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de> <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-662989409-1586109274=:3208"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-662989409-1586109274=:3208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 5 Apr 2020, Christophe JAILLET wrote:

> Le 05/04/2020 à 11:30, Markus Elfring a écrit :
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 5 Apr 2020 11:25:30 +0200
> >
> > The function “platform_get_irq” can log an error already.
> > Thus omit a redundant message for the exception handling in the
> > calling function.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >   drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c
> > b/drivers/gpu/drm/ingenic/ingenic-drm.c
> > index 9dfe7cb530e1..06ca752b76ee 100644
> > --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> > +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> > @@ -661,10 +661,8 @@ static int ingenic_drm_probe(struct platform_device
> > *pdev)
> >   	}
> >
> >   	irq = platform_get_irq(pdev, 0);
> > -	if (irq < 0) {
> > -		dev_err(dev, "Failed to get platform irq");
>
> Some 'dev_err' or equivalent functions sometimes don't have a trailing '\n'.
> (just like here)
> Do you think that it worth fixing? Or is it to low level value?
>
> According to a few grep, there seems to be quite a lot of them to fix.
>
> Julia, can 'coccinelle' be used for that?

Yes, it should be possible by writing some script code.

Something like

@initialize:python@
@@
... // define check_for_missing_nl (returning a boolean) and add_newline

@r@
constant str : script:python() { check_for_missing_nl str };
expression e;
@@

dev_err(e,str,...)

@script:python s@
str << r.str;
strnl;
@@

coccinelle.strnl = add_newline str

@@
constant r.str;
identifier s.strnl;
@@

dev_err(e,
- str
+ strnl
  ,...)

One would have to be a bit careful in add_newline to keep the "s even
though the code pretends that strnl is an identifier.

julia

>
> CJ
>
> > +	if (irq < 0)
> >   		return irq;
> > -	}
> >
> >   	if (soc_info->needs_dev_clk) {
> >   		priv->lcd_clk = devm_clk_get(dev, "lcd");
> > --
> > 2.26.0
> >
> >
>
>
--8323329-662989409-1586109274=:3208--
