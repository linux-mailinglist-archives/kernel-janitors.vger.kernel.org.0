Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE023F4189
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Aug 2021 22:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhHVUnb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 Aug 2021 16:43:31 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:28650 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbhHVUnb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Aug 2021 16:43:31 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d51 with ME
        id kkin250043riaq203kins5; Sun, 22 Aug 2021 22:42:48 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Aug 2021 22:42:48 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     shshaikh@marvell.com, manishc@marvell.com,
        GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] qlcnic: switch from 'pci_' to 'dma_' API
Date:   Sun, 22 Aug 2021 22:42:45 +0200
Message-Id: <31df87ec75de7cdb52941c46f5b08beea603db67.1629664882.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

It has been hand modified to use 'dma_set_mask_and_coherent()' instead of
'pci_set_dma_mask()/pci_set_consistent_dma_mask()' when applicable.
This is less verbose.

It has been compile tested.

@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
---
 .../net/ethernet/qlogic/qlcnic/qlcnic_init.c  | 16 ++++------
 .../net/ethernet/qlogic/qlcnic/qlcnic_io.c    | 32 +++++++++----------
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  |  6 ++--
 3 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c
index e6784023bce4..3d61a767a8a3 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c
@@ -94,10 +94,8 @@ void qlcnic_release_rx_buffers(struct qlcnic_adapter *adapter)
 			if (rx_buf->skb == NULL)
 				continue;
 
-			pci_unmap_single(adapter->pdev,
-					rx_buf->dma,
-					rds_ring->dma_size,
-					PCI_DMA_FROMDEVICE);
+			dma_unmap_single(&adapter->pdev->dev, rx_buf->dma,
+					 rds_ring->dma_size, DMA_FROM_DEVICE);
 
 			dev_kfree_skb_any(rx_buf->skb);
 		}
@@ -139,16 +137,16 @@ void qlcnic_release_tx_buffers(struct qlcnic_adapter *adapter,
 	for (i = 0; i < tx_ring->num_desc; i++) {
 		buffrag = cmd_buf->frag_array;
 		if (buffrag->dma) {
-			pci_unmap_single(adapter->pdev, buffrag->dma,
-					 buffrag->length, PCI_DMA_TODEVICE);
+			dma_unmap_single(&adapter->pdev->dev, buffrag->dma,
+					 buffrag->length, DMA_TO_DEVICE);
 			buffrag->dma = 0ULL;
 		}
 		for (j = 1; j < cmd_buf->frag_count; j++) {
 			buffrag++;
 			if (buffrag->dma) {
-				pci_unmap_page(adapter->pdev, buffrag->dma,
-					       buffrag->length,
-					       PCI_DMA_TODEVICE);
+				dma_unmap_page(&adapter->pdev->dev,
+					       buffrag->dma, buffrag->length,
+					       DMA_TO_DEVICE);
 				buffrag->dma = 0ULL;
 			}
 		}
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
index af4c516a9e7c..29cdcb2285b1 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
@@ -587,9 +587,9 @@ static int qlcnic_map_tx_skb(struct pci_dev *pdev, struct sk_buff *skb,
 	nr_frags = skb_shinfo(skb)->nr_frags;
 	nf = &pbuf->frag_array[0];
 
-	map = pci_map_single(pdev, skb->data, skb_headlen(skb),
-			     PCI_DMA_TODEVICE);
-	if (pci_dma_mapping_error(pdev, map))
+	map = dma_map_single(&pdev->dev, skb->data, skb_headlen(skb),
+			     DMA_TO_DEVICE);
+	if (dma_mapping_error(&pdev->dev, map))
 		goto out_err;
 
 	nf->dma = map;
@@ -612,11 +612,11 @@ static int qlcnic_map_tx_skb(struct pci_dev *pdev, struct sk_buff *skb,
 unwind:
 	while (--i >= 0) {
 		nf = &pbuf->frag_array[i+1];
-		pci_unmap_page(pdev, nf->dma, nf->length, PCI_DMA_TODEVICE);
+		dma_unmap_page(&pdev->dev, nf->dma, nf->length, DMA_TO_DEVICE);
 	}
 
 	nf = &pbuf->frag_array[0];
-	pci_unmap_single(pdev, nf->dma, skb_headlen(skb), PCI_DMA_TODEVICE);
+	dma_unmap_single(&pdev->dev, nf->dma, skb_headlen(skb), DMA_TO_DEVICE);
 
 out_err:
 	return -ENOMEM;
@@ -630,11 +630,11 @@ static void qlcnic_unmap_buffers(struct pci_dev *pdev, struct sk_buff *skb,
 
 	for (i = 0; i < nr_frags; i++) {
 		nf = &pbuf->frag_array[i+1];
-		pci_unmap_page(pdev, nf->dma, nf->length, PCI_DMA_TODEVICE);
+		dma_unmap_page(&pdev->dev, nf->dma, nf->length, DMA_TO_DEVICE);
 	}
 
 	nf = &pbuf->frag_array[0];
-	pci_unmap_single(pdev, nf->dma, skb_headlen(skb), PCI_DMA_TODEVICE);
+	dma_unmap_single(&pdev->dev, nf->dma, skb_headlen(skb), DMA_TO_DEVICE);
 	pbuf->skb = NULL;
 }
 
@@ -825,10 +825,10 @@ static int qlcnic_alloc_rx_skb(struct qlcnic_adapter *adapter,
 	}
 
 	skb_reserve(skb, NET_IP_ALIGN);
-	dma = pci_map_single(pdev, skb->data,
-			     rds_ring->dma_size, PCI_DMA_FROMDEVICE);
+	dma = dma_map_single(&pdev->dev, skb->data, rds_ring->dma_size,
+			     DMA_FROM_DEVICE);
 
-	if (pci_dma_mapping_error(pdev, dma)) {
+	if (dma_mapping_error(&pdev->dev, dma)) {
 		adapter->stats.rx_dma_map_error++;
 		dev_kfree_skb_any(skb);
 		return -ENOMEM;
@@ -903,13 +903,13 @@ static int qlcnic_process_cmd_ring(struct qlcnic_adapter *adapter,
 		buffer = &tx_ring->cmd_buf_arr[sw_consumer];
 		if (buffer->skb) {
 			frag = &buffer->frag_array[0];
-			pci_unmap_single(pdev, frag->dma, frag->length,
-					 PCI_DMA_TODEVICE);
+			dma_unmap_single(&pdev->dev, frag->dma, frag->length,
+					 DMA_TO_DEVICE);
 			frag->dma = 0ULL;
 			for (i = 1; i < buffer->frag_count; i++) {
 				frag++;
-				pci_unmap_page(pdev, frag->dma, frag->length,
-					       PCI_DMA_TODEVICE);
+				dma_unmap_page(&pdev->dev, frag->dma,
+					       frag->length, DMA_TO_DEVICE);
 				frag->dma = 0ULL;
 			}
 			tx_ring->tx_stats.xmit_finished++;
@@ -1147,8 +1147,8 @@ static struct sk_buff *qlcnic_process_rxbuf(struct qlcnic_adapter *adapter,
 		return NULL;
 	}
 
-	pci_unmap_single(adapter->pdev, buffer->dma, ring->dma_size,
-			 PCI_DMA_FROMDEVICE);
+	dma_unmap_single(&adapter->pdev->dev, buffer->dma, ring->dma_size,
+			 DMA_FROM_DEVICE);
 
 	skb = buffer->skb;
 	if (likely((adapter->netdev->features & NETIF_F_RXCSUM) &&
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index a4fa507903ee..75960a29f80e 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -2343,11 +2343,9 @@ qlcnic_setup_netdev(struct qlcnic_adapter *adapter, struct net_device *netdev,
 
 static int qlcnic_set_dma_mask(struct pci_dev *pdev, int *pci_using_dac)
 {
-	if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(64)) &&
-			!pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)))
+	if (!dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)))
 		*pci_using_dac = 1;
-	else if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) &&
-			!pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32)))
+	else if (!dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)))
 		*pci_using_dac = 0;
 	else {
 		dev_err(&pdev->dev, "Unable to set DMA mask, aborting\n");
-- 
2.30.2

