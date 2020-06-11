Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884581F6F87
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jun 2020 23:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgFKVoC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Jun 2020 17:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgFKVoC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Jun 2020 17:44:02 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C427C03E96F
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2020 14:44:02 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id a137so6855757oii.3
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2020 14:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=PPVOjvFlKSkpltX3gd+lHL8hJFM73h9992UYDyk+rnE=;
        b=LAkd0anCKjaVqNrESUbjayZi3Pt947A30sNFH95fqMdNT8EPAmlVbgMV/zIlX87DAS
         W/c6upN6GsfKF+kJ6pI+dt3lOJUuCmt7zPWYsWJFrvbKddhXm7Vv6SIh8KZptVOM80CG
         dWqPUIA7a3E27YTLNRgiEMrPpQ2nN6gHLys/EYEAKzFvSlu9miXnYZS/Efo/PLt87LpT
         BZWEyWPo1hRI69cCAYChITiIsnODcJiXLEW9+3IrkNskrMJU1UOWDNYYZXrGCxXb8GrK
         BZLQ1ujpZDIACiyNbVaY67F5kcaFbCeUJKvAOMhViT7veHF3q8f0HLgVUmGVxzw46fof
         v2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=PPVOjvFlKSkpltX3gd+lHL8hJFM73h9992UYDyk+rnE=;
        b=Q6TSZTx9SSQfN2Q5QXUOlRVdnmRGIabX4wTmHD3CN2XXTmkE6mjG31ztSODRBcF0Bm
         Y5fLOCYg2mnHYUZ5eoxEXrnDex3k9M5TNrWCG5oep2mybGn8Yx3+H8nQmuQmmnlwlmhb
         l0f7sDRDmFnl8ZeIGhSdUx4Nx2t+ICILToLE6xLYg97rEGKdQP9joA0AvnZhfx/B0iJT
         fNDQHeG2CriVrlMX2UmntHUYCEYp3/r30tlgxPoPG/tvRo/mkh8oFrUirVjBjkeUQA4x
         11sBamA2kvUhZvLfLN9zIUyfxdfqSCbgVGgatGh/IkCHg+ftppocLhjyo2eQ96k4Tc40
         zhLw==
X-Gm-Message-State: AOAM530mjei4ZClsPQ8MF+QkgCc6CyL5fqYjH5zCsb/HgSkLrDPZIRhg
        f0ws+kawpZM67KnDTSl7UHHcFH1D9pRyhKKpeAKzRjPD6AI8Tg==
X-Google-Smtp-Source: ABdhPJy8UM9y069UNdekHtVJBNiVO7Z1VKI/olSejiFoMAURHuOk+vHV7tRsTyx4UIRiSO27MeOxXYfKj9KDLU2/t8Q=
X-Received: by 2002:a05:6808:34d:: with SMTP id j13mr51845oie.26.1591911841330;
 Thu, 11 Jun 2020 14:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200611213733.20226-1-garritfranke@gmail.com>
In-Reply-To: <20200611213733.20226-1-garritfranke@gmail.com>
From:   Garrit Franke <garritfranke@gmail.com>
Date:   Thu, 11 Jun 2020 23:43:50 +0200
Message-ID: <CAD16O87T7oFM92YefAkrTCy6R+0Hewi=H3HHUT4Hwnkv2i93+w@mail.gmail.com>
Subject: Fwd: [PATCH] sgi: remove unreachable debug output
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

---------- Forwarded message ---------
Von: Garrit Franke <garritfranke@gmail.com>
Date: Do., 11. Juni 2020 um 23:38 Uhr
Subject: [PATCH] sgi: remove unreachable debug output
To: <davem@davemloft.net>, <kuba@kernel.org>, <kernel-janitors@nver.kernel.org>
Cc: Garrit Franke <garritfranke@gmail.com>


Hi all,

this patch aims to clean up an unused DPRINTK macro inside meth.c, and
replace it with pr_debug from kernel.h.

Thanks for your time,
Garrit

Signed-off-by: Garrit Franke <garritfranke@gmail.com>
---
 drivers/net/ethernet/sgi/meth.c | 92 +++++----------------------------
 1 file changed, 12 insertions(+), 80 deletions(-)

diff --git a/drivers/net/ethernet/sgi/meth.c b/drivers/net/ethernet/sgi/meth.c
index 0c396ecd3..242f74772 100644
--- a/drivers/net/ethernet/sgi/meth.c
+++ b/drivers/net/ethernet/sgi/meth.c
@@ -32,19 +32,6 @@

 #include "meth.h"

-#ifndef MFE_DEBUG
-#define MFE_DEBUG 0
-#endif
-
-#if MFE_DEBUG>=1
-#define DPRINTK(str,args...) printk(KERN_DEBUG "meth: %s: " str,
__func__ , ## args)
-#define MFE_RX_DEBUG 2
-#else
-#define DPRINTK(str,args...)
-#define MFE_RX_DEBUG 0
-#endif
-
-
 static const char *meth_str="SGI O2 Fast Ethernet";

 /* The maximum time waited (in jiffies) before assuming a Tx failed. (400ms) */
@@ -101,7 +88,7 @@ static inline void load_eaddr(struct net_device *dev)
        int i;
        u64 macaddr;

-       DPRINTK("Loading MAC Address: %pM\n", dev->dev_addr);
+       pr_debug("Loading MAC Address: %pM\n", dev->dev_addr);
        macaddr = 0;
        for (i = 0; i < 6; i++)
                macaddr |= (u64)dev->dev_addr[i] << ((5 - i) * 8);
@@ -141,24 +128,8 @@ static int mdio_probe(struct meth_private *priv)
                priv->phy_addr=i;
                p2=mdio_read(priv,2);
                p3=mdio_read(priv,3);
-#if MFE_DEBUG>=2
-               switch ((p2<<12)|(p3>>4)){
-               case PHY_QS6612X:
-                       DPRINTK("PHY is QS6612X\n");
-                       break;
-               case PHY_ICS1889:
-                       DPRINTK("PHY is ICS1889\n");
-                       break;
-               case PHY_ICS1890:
-                       DPRINTK("PHY is ICS1890\n");
-                       break;
-               case PHY_DP83840:
-                       DPRINTK("PHY is DP83840\n");
-                       break;
-               }
-#endif
                if(p2!=0xffff&&p2!=0x0000){
-                       DPRINTK("PHY code: %x\n",(p2<<12)|(p3>>4));
+                       pr_debug("PHY code: %x\n", (p2 << 12) | (p3 >> 4));
                        break;
                }
        }
@@ -166,7 +137,7 @@ static int mdio_probe(struct meth_private *priv)
        if(priv->phy_addr<32) {
                return 0;
        }
-       DPRINTK("Oopsie! PHY is not known!\n");
+       pr_debug("Oopsie! PHY is not known!\n");
        priv->phy_addr=-1;
        return -ENODEV;
 }
@@ -187,7 +158,7 @@ static void meth_check_link(struct net_device *dev)
                 METH_PHY_FDX : 0;

        if ((priv->mac_ctrl & METH_PHY_FDX) ^ duplex) {
-               DPRINTK("Setting %s-duplex\n", duplex ? "full" : "half");
+               pr_debug("Setting %s-duplex\n", duplex ? "full" : "half");
                if (duplex)
                        priv->mac_ctrl |= METH_PHY_FDX;
                else
@@ -196,7 +167,7 @@ static void meth_check_link(struct net_device *dev)
        }

        if ((priv->mac_ctrl & METH_100MBIT) ^ speed) {
-               DPRINTK("Setting %dMbs mode\n", speed ? 100 : 10);
+               pr_debug("Setting %dMbs mode\n", speed ? 100 : 10);
                if (duplex)
                        priv->mac_ctrl |= METH_100MBIT;
                else
@@ -284,7 +255,7 @@ int meth_reset(struct net_device *dev)

        /* Check for device */
        if (mdio_probe(priv) < 0) {
-               DPRINTK("Unable to find PHY\n");
+               pr_debug("Unable to find PHY\n");
                return -ENODEV;
        }

@@ -341,7 +312,7 @@ static int meth_open(struct net_device *dev)
                          METH_DMA_RX_EN | METH_DMA_RX_INT_EN;
        mace->eth.dma_ctrl = priv->dma_ctrl;

-       DPRINTK("About to start queue\n");
+       pr_debug("About to start queue\n");
        netif_start_queue(dev);

        return 0;
@@ -358,7 +329,7 @@ static int meth_release(struct net_device *dev)
 {
        struct meth_private *priv = netdev_priv(dev);

-       DPRINTK("Stopping queue\n");
+       pr_debug("Stopping queue\n");
        netif_stop_queue(dev); /* can't transmit any more */
        /* shut down DMA */
        priv->dma_ctrl &= ~(METH_DMA_TX_EN | METH_DMA_TX_INT_EN |
@@ -394,11 +365,7 @@ static void meth_rx(struct net_device* dev,
unsigned long int_status)
                                 priv->rx_ring_dmas[priv->rx_write],
                                 METH_RX_BUFF_SIZE, DMA_FROM_DEVICE);
                status = priv->rx_ring[priv->rx_write]->status.raw;
-#if MFE_DEBUG
-               if (!(status & METH_RX_ST_VALID)) {
-                       DPRINTK("Not received? status=%016lx\n",status);
-               }
-#endif
+
                if ((!(status & METH_RX_STATUS_ERRORS)) && (status &
METH_RX_ST_VALID)) {
                        int len = (status & 0xffff) - 4; /* omit CRC */
                        /* length sanity check */
@@ -413,7 +380,7 @@ static void meth_rx(struct net_device* dev,
unsigned long int_status)
                                skb = alloc_skb(METH_RX_BUFF_SIZE, GFP_ATOMIC);
                                if (!skb) {
                                        /* Ouch! No memory! Drop
packet on the floor */
-                                       DPRINTK("No mem: dropping packet\n");
+                                       pr_debug("No mem: dropping packet\n");
                                        dev->stats.rx_dropped++;
                                        skb = priv->rx_skbs[priv->rx_write];
                                } else {
@@ -433,21 +400,6 @@ static void meth_rx(struct net_device* dev,
unsigned long int_status)
                } else {
                        dev->stats.rx_errors++;
                        skb=priv->rx_skbs[priv->rx_write];
-#if MFE_DEBUG>0
-                       printk(KERN_WARNING "meth: RX error:
status=0x%016lx\n",status);
-                       if(status&METH_RX_ST_RCV_CODE_VIOLATION)
-                               printk(KERN_WARNING "Receive Code Violation\n");
-                       if(status&METH_RX_ST_CRC_ERR)
-                               printk(KERN_WARNING "CRC error\n");
-                       if(status&METH_RX_ST_INV_PREAMBLE_CTX)
-                               printk(KERN_WARNING "Invalid Preamble
Context\n");
-                       if(status&METH_RX_ST_LONG_EVT_SEEN)
-                               printk(KERN_WARNING "Long Event Seen...\n");
-                       if(status&METH_RX_ST_BAD_PACKET)
-                               printk(KERN_WARNING "Bad Packet\n");
-                       if(status&METH_RX_ST_CARRIER_EVT_SEEN)
-                               printk(KERN_WARNING "Carrier Event Seen\n");
-#endif
                }
                priv->rx_ring[priv->rx_write] = (rx_packet*)skb->head;
                priv->rx_ring[priv->rx_write]->status.raw = 0;
@@ -489,35 +441,15 @@ static void meth_tx_cleanup(struct net_device*
dev, unsigned long int_status)
        while (priv->tx_read != rptr) {
                skb = priv->tx_skbs[priv->tx_read];
                status = priv->tx_ring[priv->tx_read].header.raw;
-#if MFE_DEBUG>=1
-               if (priv->tx_read == priv->tx_write)
-                       DPRINTK("Auchi!
tx_read=%d,tx_write=%d,rptr=%d?\n", priv->tx_read,
priv->tx_write,rptr);
-#endif
                if (status & METH_TX_ST_DONE) {
                        if (status & METH_TX_ST_SUCCESS){
                                dev->stats.tx_packets++;
                                dev->stats.tx_bytes += skb->len;
                        } else {
                                dev->stats.tx_errors++;
-#if MFE_DEBUG>=1
-                               DPRINTK("TX error: status=%016lx <",status);
-                               if(status & METH_TX_ST_SUCCESS)
-                                       printk(" SUCCESS");
-                               if(status & METH_TX_ST_TOOLONG)
-                                       printk(" TOOLONG");
-                               if(status & METH_TX_ST_UNDERRUN)
-                                       printk(" UNDERRUN");
-                               if(status & METH_TX_ST_EXCCOLL)
-                                       printk(" EXCCOLL");
-                               if(status & METH_TX_ST_DEFER)
-                                       printk(" DEFER");
-                               if(status & METH_TX_ST_LATECOLL)
-                                       printk(" LATECOLL");
-                               printk(" >\n");
-#endif
                        }
                } else {
-                       DPRINTK("RPTR points us here, but packet not done?\n");
+                       pr_debug("RPTR points us here, but packet not done?\n");
                        break;
                }
                dev_consume_skb_irq(skb);
@@ -561,7 +493,7 @@ static void meth_error(struct net_device* dev,
unsigned status)
                 *  Thus I stop processing Rx in this case. */
                priv->dma_ctrl &= ~METH_DMA_RX_EN;
                mace->eth.dma_ctrl = priv->dma_ctrl;
-               DPRINTK("Disabled meth Rx DMA temporarily\n");
+               pr_debug("Disabled meth Rx DMA temporarily\n");
                spin_unlock_irqrestore(&priv->meth_lock, flags);
        }
        mace->eth.int_stat = METH_INT_ERROR;
--
2.25.1
