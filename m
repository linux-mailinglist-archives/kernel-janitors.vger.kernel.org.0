Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A65F1F78C6
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jun 2020 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFLNbC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 12 Jun 2020 09:31:02 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50988 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLNbA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Jun 2020 09:31:00 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05CDSO60140095;
        Fri, 12 Jun 2020 13:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=dkNafbu0R6soec7OXVt88dhN7/z9cAQVRbuqfTCkT8U=;
 b=p3C2wgF8/aKI4Lm8MInAKP5bIMoMVHXrxMrX+CD1tTpw/NwnqYUgaUx+/5vPXeSmVBuK
 uLttxJuAyWh/eu0iV4Pgx2F+8CMObV4/CT/d1YuaXjCz3Pdk1c1+L50aSlcNWi1jm1pE
 x7Aa72qWuu3XUoHXXQp7T8KdKUUlsBwPI4nRDmp5/RlxdBmNUBCCceTAwnigwHl3mQhT
 VlGS1fCp3V7d9G+83uCplwAeslkHPq0SI/yaAXGxH35rHk66zKdWwZhgRhNURMhsB/Ju
 EbN1RFqCDhqm7ok+f8m8HEHpr9KHreS3+3TcwutAcEOSPTCx17IPjPR7vH1/Cdde8gef Pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 31g2jrn3j9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Jun 2020 13:30:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05CDTTj0002054;
        Fri, 12 Jun 2020 13:30:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 31mamk851g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Jun 2020 13:30:45 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05CDPOH3017495;
        Fri, 12 Jun 2020 13:25:24 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 12 Jun 2020 06:25:23 -0700
Date:   Fri, 12 Jun 2020 16:25:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Garrit Franke <garritfranke@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: Fwd: [PATCH] sgi: remove unreachable debug output
Message-ID: <20200612132518.GH4151@kadam>
References: <20200611213733.20226-1-garritfranke@gmail.com>
 <CAD16O87T7oFM92YefAkrTCy6R+0Hewi=H3HHUT4Hwnkv2i93+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD16O87T7oFM92YefAkrTCy6R+0Hewi=H3HHUT4Hwnkv2i93+w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9649 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006120099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9649 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006120100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 11, 2020 at 11:43:50PM +0200, Garrit Franke wrote:
> ---------- Forwarded message ---------
> Von: Garrit Franke <garritfranke@gmail.com>
> Date: Do., 11. Juni 2020 um 23:38 Uhr
> Subject: [PATCH] sgi: remove unreachable debug output
> To: <davem@davemloft.net>, <kuba@kernel.org>, <kernel-janitors@nver.kernel.org>
> Cc: Garrit Franke <garritfranke@gmail.com>
> 
> 
> Hi all,
> 
> this patch aims to clean up an unused DPRINTK macro inside meth.c, and
> replace it with pr_debug from kernel.h.
> 
> Thanks for your time,
> Garrit

This doesn't work at all as a commit message.  Don't put "Hi all," in
the commit message.  It's not "unused" because it can be enabled if we
want to.

This patch is white space damaged and can't be applied.  Read the first
paragraph of Documentation/process/email-clients.rst

The netdev tree is closed until -rc1 is released.  Bugfixes are still
accepted but not clean ups like this.

> 
> Signed-off-by: Garrit Franke <garritfranke@gmail.com>
> ---
>  drivers/net/ethernet/sgi/meth.c | 92 +++++----------------------------
>  1 file changed, 12 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sgi/meth.c b/drivers/net/ethernet/sgi/meth.c
> index 0c396ecd3..242f74772 100644
> --- a/drivers/net/ethernet/sgi/meth.c
> +++ b/drivers/net/ethernet/sgi/meth.c
> @@ -32,19 +32,6 @@
> 
>  #include "meth.h"
> 
> -#ifndef MFE_DEBUG
> -#define MFE_DEBUG 0
> -#endif
> -
> -#if MFE_DEBUG>=1
> -#define DPRINTK(str,args...) printk(KERN_DEBUG "meth: %s: " str,
> __func__ , ## args)
> -#define MFE_RX_DEBUG 2
> -#else
> -#define DPRINTK(str,args...)
> -#define MFE_RX_DEBUG 0
> -#endif
> -
> -
>  static const char *meth_str="SGI O2 Fast Ethernet";
> 
>  /* The maximum time waited (in jiffies) before assuming a Tx failed. (400ms) */
> @@ -101,7 +88,7 @@ static inline void load_eaddr(struct net_device *dev)
>         int i;
>         u64 macaddr;
> 
> -       DPRINTK("Loading MAC Address: %pM\n", dev->dev_addr);
> +       pr_debug("Loading MAC Address: %pM\n", dev->dev_addr);
>         macaddr = 0;
>         for (i = 0; i < 6; i++)
>                 macaddr |= (u64)dev->dev_addr[i] << ((5 - i) * 8);
> @@ -141,24 +128,8 @@ static int mdio_probe(struct meth_private *priv)
>                 priv->phy_addr=i;
>                 p2=mdio_read(priv,2);
>                 p3=mdio_read(priv,3);
> -#if MFE_DEBUG>=2
> -               switch ((p2<<12)|(p3>>4)){
> -               case PHY_QS6612X:
> -                       DPRINTK("PHY is QS6612X\n");
> -                       break;
> -               case PHY_ICS1889:
> -                       DPRINTK("PHY is ICS1889\n");
> -                       break;
> -               case PHY_ICS1890:
> -                       DPRINTK("PHY is ICS1890\n");
> -                       break;
> -               case PHY_DP83840:
> -                       DPRINTK("PHY is DP83840\n");
> -                       break;
> -               }
> -#endif
>                 if(p2!=0xffff&&p2!=0x0000){
> -                       DPRINTK("PHY code: %x\n",(p2<<12)|(p3>>4));
> +                       pr_debug("PHY code: %x\n", (p2 << 12) | (p3 >> 4));
>                         break;
>                 }
>         }
> @@ -166,7 +137,7 @@ static int mdio_probe(struct meth_private *priv)
>         if(priv->phy_addr<32) {
>                 return 0;
>         }
> -       DPRINTK("Oopsie! PHY is not known!\n");
> +       pr_debug("Oopsie! PHY is not known!\n");
>         priv->phy_addr=-1;
>         return -ENODEV;
>  }
> @@ -187,7 +158,7 @@ static void meth_check_link(struct net_device *dev)
>                  METH_PHY_FDX : 0;
> 
>         if ((priv->mac_ctrl & METH_PHY_FDX) ^ duplex) {
> -               DPRINTK("Setting %s-duplex\n", duplex ? "full" : "half");
> +               pr_debug("Setting %s-duplex\n", duplex ? "full" : "half");
>                 if (duplex)
>                         priv->mac_ctrl |= METH_PHY_FDX;
>                 else
> @@ -196,7 +167,7 @@ static void meth_check_link(struct net_device *dev)
>         }
> 
>         if ((priv->mac_ctrl & METH_100MBIT) ^ speed) {
> -               DPRINTK("Setting %dMbs mode\n", speed ? 100 : 10);
> +               pr_debug("Setting %dMbs mode\n", speed ? 100 : 10);
>                 if (duplex)
>                         priv->mac_ctrl |= METH_100MBIT;
>                 else
> @@ -284,7 +255,7 @@ int meth_reset(struct net_device *dev)
> 
>         /* Check for device */
>         if (mdio_probe(priv) < 0) {
> -               DPRINTK("Unable to find PHY\n");
> +               pr_debug("Unable to find PHY\n");
>                 return -ENODEV;
>         }
> 
> @@ -341,7 +312,7 @@ static int meth_open(struct net_device *dev)
>                           METH_DMA_RX_EN | METH_DMA_RX_INT_EN;
>         mace->eth.dma_ctrl = priv->dma_ctrl;
> 
> -       DPRINTK("About to start queue\n");
> +       pr_debug("About to start queue\n");
>         netif_start_queue(dev);
> 
>         return 0;
> @@ -358,7 +329,7 @@ static int meth_release(struct net_device *dev)
>  {
>         struct meth_private *priv = netdev_priv(dev);
> 
> -       DPRINTK("Stopping queue\n");
> +       pr_debug("Stopping queue\n");
>         netif_stop_queue(dev); /* can't transmit any more */
>         /* shut down DMA */
>         priv->dma_ctrl &= ~(METH_DMA_TX_EN | METH_DMA_TX_INT_EN |
> @@ -394,11 +365,7 @@ static void meth_rx(struct net_device* dev,
> unsigned long int_status)
>                                  priv->rx_ring_dmas[priv->rx_write],
>                                  METH_RX_BUFF_SIZE, DMA_FROM_DEVICE);
>                 status = priv->rx_ring[priv->rx_write]->status.raw;
> -#if MFE_DEBUG
> -               if (!(status & METH_RX_ST_VALID)) {
> -                       DPRINTK("Not received? status=%016lx\n",status);


This seems like an error conition that should be a pr_err() but don't
make it an error unless you have the hardware and can test it.

> -               }
> -#endif
> +
>                 if ((!(status & METH_RX_STATUS_ERRORS)) && (status &
> METH_RX_ST_VALID)) {
>                         int len = (status & 0xffff) - 4; /* omit CRC */
>                         /* length sanity check */
> @@ -413,7 +380,7 @@ static void meth_rx(struct net_device* dev,
> unsigned long int_status)
>                                 skb = alloc_skb(METH_RX_BUFF_SIZE, GFP_ATOMIC);
>                                 if (!skb) {
>                                         /* Ouch! No memory! Drop
> packet on the floor */
> -                                       DPRINTK("No mem: dropping packet\n");
> +                                       pr_debug("No mem: dropping packet\n");
>                                         dev->stats.rx_dropped++;
>                                         skb = priv->rx_skbs[priv->rx_write];
>                                 } else {
> @@ -433,21 +400,6 @@ static void meth_rx(struct net_device* dev,
> unsigned long int_status)
>                 } else {
>                         dev->stats.rx_errors++;
>                         skb=priv->rx_skbs[priv->rx_write];
> -#if MFE_DEBUG>0
> -                       printk(KERN_WARNING "meth: RX error:
> status=0x%016lx\n",status);
> -                       if(status&METH_RX_ST_RCV_CODE_VIOLATION)
> -                               printk(KERN_WARNING "Receive Code Violation\n");
> -                       if(status&METH_RX_ST_CRC_ERR)
> -                               printk(KERN_WARNING "CRC error\n");
> -                       if(status&METH_RX_ST_INV_PREAMBLE_CTX)
> -                               printk(KERN_WARNING "Invalid Preamble
> Context\n");
> -                       if(status&METH_RX_ST_LONG_EVT_SEEN)
> -                               printk(KERN_WARNING "Long Event Seen...\n");
> -                       if(status&METH_RX_ST_BAD_PACKET)
> -                               printk(KERN_WARNING "Bad Packet\n");
> -                       if(status&METH_RX_ST_CARRIER_EVT_SEEN)
> -                               printk(KERN_WARNING "Carrier Event Seen\n");
> -#endif

This is part of the same error condition.

>                 }
>                 priv->rx_ring[priv->rx_write] = (rx_packet*)skb->head;
>                 priv->rx_ring[priv->rx_write]->status.raw = 0;
> @@ -489,35 +441,15 @@ static void meth_tx_cleanup(struct net_device*

regards,
dan carpenter

