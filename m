Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE231C4706
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 May 2020 21:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgEDT2k (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 May 2020 15:28:40 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:6485 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725956AbgEDT2k (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 May 2020 15:28:40 -0400
X-IronPort-AV: E=Sophos;i="5.73,353,1583190000"; 
   d="scan'208";a="448154490"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 May 2020 21:28:38 +0200
Date:   Mon, 4 May 2020 21:28:38 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     kernel-janitors@vger.kernel.org
Subject: Re: question about lists
In-Reply-To: <20200504192339.GW2014@kadam>
Message-ID: <alpine.DEB.2.21.2005042128110.13990@hadrien>
References: <alpine.DEB.2.21.2005032308500.2533@hadrien> <20200504192339.GW2014@kadam>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Mon, 4 May 2020, Dan Carpenter wrote:

> On Sun, May 03, 2020 at 11:10:01PM +0200, Julia Lawall wrote:
> > Hello,
> >
> > I was wondering what is the point of code like the following:
> >
> >         INIT_LIST_HEAD(&bb->list);
> >         list_add(&bb->list, &s->workload->shadow_bb);
> >
> > As far as I can see, list_add will initialize both fields of the list_head
> > structure without looking at their values, so why is the INIT_LIST_HEAD
> > needed?
>
> Yeah.  You're right.  It's not needed.

OK, there seem to be a good number of them, so I wondered if I missed
something.

thanks,
julia
