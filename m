Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6F1377B5E
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 May 2021 07:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhEJFFn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 May 2021 01:05:43 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:7382 "EHLO
        mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229533AbhEJFFm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 01:05:42 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ACvwUP6y5J53lGjZXTkYRKrPwK71zdoMgy1kn?=
 =?us-ascii?q?xilNoH1uA6ilfq+V98jzuSWftN9VYhAdcLO7Scy9qBHnlaKdiLN5VYtKHjOW21?=
 =?us-ascii?q?dAR7sN0WKN+VHd8mHFh4xg/JYlQuxFBNr8AUMSt6vHyQOzeuxO/OW6?=
X-IronPort-AV: E=Sophos;i="5.82,286,1613430000"; 
   d="scan'208";a="380964918"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 May 2021 07:04:00 +0200
Date:   Mon, 10 May 2021 07:03:59 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
In-Reply-To: <20210510043508.GO1922@kadam>
Message-ID: <alpine.DEB.2.22.394.2105100703230.3126@hadrien>
References: <20210509004112.421100-1-eantoranz@gmail.com> <alpine.DEB.2.22.394.2105092315330.24280@hadrien> <20210510043508.GO1922@kadam>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Mon, 10 May 2021, Dan Carpenter wrote:

> On Sun, May 09, 2021 at 11:17:42PM +0200, Julia Lawall wrote:
> > ---------------------------
> >
> > Patch of a recent linux next:
> >
> > diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> > index 2e35354b61f5..ff75e928772a 100644
> > --- a/arch/arm/mach-pxa/cm-x300.c
> > +++ b/arch/arm/mach-pxa/cm-x300.c
> > @@ -531,7 +531,7 @@ static int cm_x300_u2d_init(struct device *dev)
> >  		pout_clk = clk_get(NULL, "CLK_POUT");
> >  		if (IS_ERR(pout_clk)) {
> >  			err = PTR_ERR(pout_clk);
> > -			pr_err("failed to get CLK_POUT: %d\n", err);
> > +			pr_err("failed to get CLK_POUT: %pe\n", err);
>
> It has to print the pointer and not the err.   So it should be:
>
> 			pr_err("failed to get CLK_POUT: %pe\n", pout_clk);

Oops!  Thanks.  That is easy to fix.

julia

>
> But really someone needs to introduce an %e (and everyone can see the
> need for %e but it's just a matter of finding someone who is feeling
> motivated).
>
> regards,
> dan carpenter
>
>
