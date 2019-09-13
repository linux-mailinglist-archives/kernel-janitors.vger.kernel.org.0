Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22836B21E0
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Sep 2019 16:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbfIMOYo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Sep 2019 10:24:44 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:18653
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbfIMOYo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Sep 2019 10:24:44 -0400
X-IronPort-AV: E=Sophos;i="5.64,501,1559512800"; 
   d="scan'208";a="319324023"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 16:24:36 +0200
Date:   Fri, 13 Sep 2019 16:24:37 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>
cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: Queries of an aspiring kernel developer
In-Reply-To: <20190913141935.GA309@SARKAR>
Message-ID: <alpine.DEB.2.21.1909131623300.2767@hadrien>
References: <20190912142517.GA22751@SARKAR> <20190913132310.GQ20699@kadam> <20190913141935.GA309@SARKAR>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Fri, 13 Sep 2019, Rohit Sarkar wrote:

> On Fri, Sep 13, 2019 at 04:23:10PM +0300, Dan Carpenter wrote:
> > On Thu, Sep 12, 2019 at 07:55:17PM +0530, Rohit Sarkar wrote:
> > > Hi Dan,
> > > First things first, I know that sending private emails is frowned upon
> > > but I was unsure if this would belong in the list.
> >
> > This does belong on the list.  Especially the kernel-janitor list.
>
> Added kernel-janitors and kernel-newbies to the thread.
> > > Secondly I will keep
> > > this as short as possible. (I know you are lazy :) )
> > >
> > > I have been interested in kernel development for a long time and want to
> > > contribute to the community while learning and having fun.
> > > Till now I have sent some minor patches:
> > > [1]: Fixes typo
> > > [2]: Checkpatch fix
> > > [3]: Replaces snprintf with scnprintf
> > >
> > > I now would like to work on something that is not too trivial (like a
> > > typo/checkpatch fix) and not too complex. I am finding it difficult to
> > > come up with something substantial to work on.
> >
> > The various intern project probably have ideas.  Julia Lawall may know.
> >
> Sure, will get in touch with her.
>
> > > It would really help me if you could point me in a direction where I could
> > > focus my efforts on.
> >
> > What I always tell people is to pick a small driver from staging.  The
> > iio drivers are pretty small.  Just try to fix it as much as possible.
> > Read it and re-read it and patch it and patch it.  As you go you will
> > learn more until you are the expert of that driver.  Try to get it
> > moved out of staging.
>
> This sounds nice. Would this require any external hardware for testing?
> > regards,
> > dan carpenter
> Thanks a lot for taking the time to reply.

Dan's suggestions are fine.  You may want to take a fairly recent driver
from staging (to check using git log) to be sure that the work has not
already been done by others.

julia
