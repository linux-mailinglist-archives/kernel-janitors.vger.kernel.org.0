Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93821480EC
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Jan 2020 12:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390296AbgAXLPi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 24 Jan 2020 06:15:38 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:49841 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390020AbgAXLPg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Jan 2020 06:15:36 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 19993546-1500050 
        for multiple; Fri, 24 Jan 2020 11:15:33 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Dan Carpenter <dan.carpenter@oracle.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200124103123.GL1847@kadam>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Sean Paul <seanpaul@chromium.org>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-janitors@vger.kernel.org
References: <20200124101311.drryaegcdc7d4x7e@kili.mountain>
 <157986125623.2524.13979010293671565726@skylake-alporthouse-com>
 <20200124103123.GL1847@kadam>
Message-ID: <157986453128.2524.3980064063029834231@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf: fix locking in sync_print_obj()
Date:   Fri, 24 Jan 2020 11:15:31 +0000
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2020-01-24 10:31:23)
> On Fri, Jan 24, 2020 at 10:20:56AM +0000, Chris Wilson wrote:
> > Quoting Dan Carpenter (2020-01-24 10:13:12)
> > > This is always called with IRQs disabled and we don't actually want to
> > > enable IRQs at the end.
> > > 
> > > Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/dma-buf/sync_debug.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> > > index 101394f16930..952331344b1c 100644
> > > --- a/drivers/dma-buf/sync_debug.c
> > > +++ b/drivers/dma-buf/sync_debug.c
> > > @@ -107,15 +107,16 @@ static void sync_print_fence(struct seq_file *s,
> > >  static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
> > >  {
> > >         struct list_head *pos;
> > > +       unsigned long flags;
> > >  
> > >         seq_printf(s, "%s: %d\n", obj->name, obj->value);
> > >  
> > > -       spin_lock_irq(&obj->lock);
> > > +       spin_lock_irqsave(&obj->lock, flags);
> > 
> > Exactly, it can be just spin_lock() as the irq state is known.
> > 
> 
> I did consider that but I wasn't sure how this is going to be used in
> the future so I took a conservative approach.

Sure, it's debug so not critical (lists within lists to a seqfile, ouch)

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
