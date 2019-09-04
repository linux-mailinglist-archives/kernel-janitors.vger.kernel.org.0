Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A7AA8029
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 12:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfIDKPN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 06:15:13 -0400
Received: from elvis.franken.de ([193.175.24.41]:33547 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfIDKPN (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 06:15:13 -0400
X-Greylist: delayed 1462 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Sep 2019 06:15:12 EDT
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1i5Rw8-00008U-00; Wed, 04 Sep 2019 11:50:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3CA8EC2782; Wed,  4 Sep 2019 11:50:40 +0200 (CEST)
Date:   Wed, 4 Sep 2019 11:50:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: sonic: remove dev_kfree_skb before return
 NETDEV_TX_BUSY
Message-ID: <20190904095040.GA12628@alpha.franken.de>
References: <20190904094211.117454-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904094211.117454-1-maowenan@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 04, 2019 at 05:42:11PM +0800, Mao Wenan wrote:
> When dma_map_single is failed to map buffer, skb can't be freed
> before sonic driver return to stack with NETDEV_TX_BUSY, because
> this skb may be requeued to qdisc, it might trigger use-after-free.
> 
> Fixes: d9fb9f384292 ("*sonic/natsemi/ns83829: Move the National Semi-conductor drivers")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/net/ethernet/natsemi/sonic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/natsemi/sonic.c b/drivers/net/ethernet/natsemi/sonic.c
> index d0a01e8f000a..248a8f22a33b 100644
> --- a/drivers/net/ethernet/natsemi/sonic.c
> +++ b/drivers/net/ethernet/natsemi/sonic.c
> @@ -233,7 +233,6 @@ static int sonic_send_packet(struct sk_buff *skb, struct net_device *dev)
>  	laddr = dma_map_single(lp->device, skb->data, length, DMA_TO_DEVICE);
>  	if (!laddr) {
>  		printk(KERN_ERR "%s: failed to map tx DMA buffer.\n", dev->name);
> -		dev_kfree_skb(skb);
>  		return NETDEV_TX_BUSY;
>  	}

Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
