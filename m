Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EF13F4039
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Aug 2021 17:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhHVPKd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 Aug 2021 11:10:33 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:45887 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233549AbhHVPKd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Aug 2021 11:10:33 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d74 with ME
        id kf9q2500B3riaq203f9q96; Sun, 22 Aug 2021 17:09:50 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Aug 2021 17:09:50 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     doshir@vmware.com, pv-drivers@vmware.com, davem@davemloft.net,
        kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] vmxnet3: switch from 'pci_' to 'dma_' API
Date:   Sun, 22 Aug 2021 17:09:48 +0200
Message-Id: <ef30cd7e2d3c14460ff5bc7ba6224d464722e8d9.1629644906.git.christophe.jaillet@wanadoo.fr>
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

The explicit 'err = -EIO;' has been removed because
'dma_set_mask_and_coherent()' returns 0 or -EIO, so its return code can be
used directly.

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
 drivers/net/vmxnet3/vmxnet3_drv.c | 47 +++++++++++++------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index e3c6b7e3bfdd..142f70670f5c 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -314,10 +314,10 @@ vmxnet3_unmap_tx_buf(struct vmxnet3_tx_buf_info *tbi,
 {
 	if (tbi->map_type == VMXNET3_MAP_SINGLE)
 		dma_unmap_single(&pdev->dev, tbi->dma_addr, tbi->len,
-				 PCI_DMA_TODEVICE);
+				 DMA_TO_DEVICE);
 	else if (tbi->map_type == VMXNET3_MAP_PAGE)
 		dma_unmap_page(&pdev->dev, tbi->dma_addr, tbi->len,
-			       PCI_DMA_TODEVICE);
+			       DMA_TO_DEVICE);
 	else
 		BUG_ON(tbi->map_type != VMXNET3_MAP_NONE);
 
@@ -585,7 +585,7 @@ vmxnet3_rq_alloc_rx_buf(struct vmxnet3_rx_queue *rq, u32 ring_idx,
 				rbi->dma_addr = dma_map_single(
 						&adapter->pdev->dev,
 						rbi->skb->data, rbi->len,
-						PCI_DMA_FROMDEVICE);
+						DMA_FROM_DEVICE);
 				if (dma_mapping_error(&adapter->pdev->dev,
 						      rbi->dma_addr)) {
 					dev_kfree_skb_any(rbi->skb);
@@ -609,7 +609,7 @@ vmxnet3_rq_alloc_rx_buf(struct vmxnet3_rx_queue *rq, u32 ring_idx,
 				rbi->dma_addr = dma_map_page(
 						&adapter->pdev->dev,
 						rbi->page, 0, PAGE_SIZE,
-						PCI_DMA_FROMDEVICE);
+						DMA_FROM_DEVICE);
 				if (dma_mapping_error(&adapter->pdev->dev,
 						      rbi->dma_addr)) {
 					put_page(rbi->page);
@@ -723,7 +723,7 @@ vmxnet3_map_pkt(struct sk_buff *skb, struct vmxnet3_tx_ctx *ctx,
 		tbi->map_type = VMXNET3_MAP_SINGLE;
 		tbi->dma_addr = dma_map_single(&adapter->pdev->dev,
 				skb->data + buf_offset, buf_size,
-				PCI_DMA_TODEVICE);
+				DMA_TO_DEVICE);
 		if (dma_mapping_error(&adapter->pdev->dev, tbi->dma_addr))
 			return -EFAULT;
 
@@ -1449,7 +1449,7 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 				new_dma_addr =
 					dma_map_single(&adapter->pdev->dev,
 						       new_skb->data, rbi->len,
-						       PCI_DMA_FROMDEVICE);
+						       DMA_FROM_DEVICE);
 				if (dma_mapping_error(&adapter->pdev->dev,
 						      new_dma_addr)) {
 					dev_kfree_skb(new_skb);
@@ -1467,7 +1467,7 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 				dma_unmap_single(&adapter->pdev->dev,
 						 rbi->dma_addr,
 						 rbi->len,
-						 PCI_DMA_FROMDEVICE);
+						 DMA_FROM_DEVICE);
 
 				/* Immediate refill */
 				rbi->skb = new_skb;
@@ -1546,7 +1546,7 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 				new_dma_addr = dma_map_page(&adapter->pdev->dev,
 							    new_page,
 							    0, PAGE_SIZE,
-							    PCI_DMA_FROMDEVICE);
+							    DMA_FROM_DEVICE);
 				if (dma_mapping_error(&adapter->pdev->dev,
 						      new_dma_addr)) {
 					put_page(new_page);
@@ -1559,7 +1559,7 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 
 				dma_unmap_page(&adapter->pdev->dev,
 					       rbi->dma_addr, rbi->len,
-					       PCI_DMA_FROMDEVICE);
+					       DMA_FROM_DEVICE);
 
 				vmxnet3_append_frag(ctx->skb, rcd, rbi);
 
@@ -1677,13 +1677,13 @@ vmxnet3_rq_cleanup(struct vmxnet3_rx_queue *rq,
 			if (rxd->btype == VMXNET3_RXD_BTYPE_HEAD &&
 					rq->buf_info[ring_idx][i].skb) {
 				dma_unmap_single(&adapter->pdev->dev, rxd->addr,
-						 rxd->len, PCI_DMA_FROMDEVICE);
+						 rxd->len, DMA_FROM_DEVICE);
 				dev_kfree_skb(rq->buf_info[ring_idx][i].skb);
 				rq->buf_info[ring_idx][i].skb = NULL;
 			} else if (rxd->btype == VMXNET3_RXD_BTYPE_BODY &&
 					rq->buf_info[ring_idx][i].page) {
 				dma_unmap_page(&adapter->pdev->dev, rxd->addr,
-					       rxd->len, PCI_DMA_FROMDEVICE);
+					       rxd->len, DMA_FROM_DEVICE);
 				put_page(rq->buf_info[ring_idx][i].page);
 				rq->buf_info[ring_idx][i].page = NULL;
 			}
@@ -2419,7 +2419,7 @@ vmxnet3_set_mc(struct net_device *netdev)
 							&adapter->pdev->dev,
 							new_table,
 							sz,
-							PCI_DMA_TODEVICE);
+							DMA_TO_DEVICE);
 				if (!dma_mapping_error(&adapter->pdev->dev,
 						       new_table_pa)) {
 					new_mode |= VMXNET3_RXM_MCAST;
@@ -2455,7 +2455,7 @@ vmxnet3_set_mc(struct net_device *netdev)
 
 	if (new_table_pa_valid)
 		dma_unmap_single(&adapter->pdev->dev, new_table_pa,
-				 rxConf->mfTableLen, PCI_DMA_TODEVICE);
+				 rxConf->mfTableLen, DMA_TO_DEVICE);
 	kfree(new_table);
 }
 
@@ -3438,19 +3438,12 @@ vmxnet3_probe_device(struct pci_dev *pdev,
 	adapter->rx_ring_size = VMXNET3_DEF_RX_RING_SIZE;
 	adapter->rx_ring2_size = VMXNET3_DEF_RX_RING2_SIZE;
 
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64)) == 0) {
-		if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)) != 0) {
-			dev_err(&pdev->dev,
-				"pci_set_consistent_dma_mask failed\n");
-			err = -EIO;
-			goto err_set_mask;
-		}
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) == 0) {
 		dma64 = true;
 	} else {
-		if (pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) != 0) {
-			dev_err(&pdev->dev,
-				"pci_set_dma_mask failed\n");
-			err = -EIO;
+		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
+		if (err) {
+			dev_err(&pdev->dev, "dma_set_mask failed\n");
 			goto err_set_mask;
 		}
 		dma64 = false;
@@ -3459,7 +3452,7 @@ vmxnet3_probe_device(struct pci_dev *pdev,
 	spin_lock_init(&adapter->cmd_lock);
 	adapter->adapter_pa = dma_map_single(&adapter->pdev->dev, adapter,
 					     sizeof(struct vmxnet3_adapter),
-					     PCI_DMA_TODEVICE);
+					     DMA_TO_DEVICE);
 	if (dma_mapping_error(&adapter->pdev->dev, adapter->adapter_pa)) {
 		dev_err(&pdev->dev, "Failed to map dma\n");
 		err = -EFAULT;
@@ -3713,7 +3706,7 @@ vmxnet3_probe_device(struct pci_dev *pdev,
 			  adapter->shared, adapter->shared_pa);
 err_alloc_shared:
 	dma_unmap_single(&adapter->pdev->dev, adapter->adapter_pa,
-			 sizeof(struct vmxnet3_adapter), PCI_DMA_TODEVICE);
+			 sizeof(struct vmxnet3_adapter), DMA_TO_DEVICE);
 err_set_mask:
 	free_netdev(netdev);
 	return err;
@@ -3781,7 +3774,7 @@ vmxnet3_remove_device(struct pci_dev *pdev)
 			  sizeof(struct Vmxnet3_DriverShared),
 			  adapter->shared, adapter->shared_pa);
 	dma_unmap_single(&adapter->pdev->dev, adapter->adapter_pa,
-			 sizeof(struct vmxnet3_adapter), PCI_DMA_TODEVICE);
+			 sizeof(struct vmxnet3_adapter), DMA_TO_DEVICE);
 	free_netdev(netdev);
 }
 
-- 
2.30.2

