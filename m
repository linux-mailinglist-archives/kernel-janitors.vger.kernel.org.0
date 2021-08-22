Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34543F3E92
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Aug 2021 10:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhHVIEh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 Aug 2021 04:04:37 -0400
Received: from out02.smtpout.orange.fr ([193.252.22.211]:56933 "EHLO
        out.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbhHVIEh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Aug 2021 04:04:37 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d59 with ME
        id kY3s2500D3riaq203Y3soo; Sun, 22 Aug 2021 10:03:54 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Aug 2021 10:03:54 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     stf_xl@wp.pl, davem@davemloft.net, kvalo@codeaurora.org,
        kuba@kernel.org, luciano.coelho@intel.com
Cc:     linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] intel: switch from 'pci_' to 'dma_' API
Date:   Sun, 22 Aug 2021 10:03:50 +0200
Message-Id: <f55043d0c847bfae60087707778563cf732a7bf9.1629619229.git.christophe.jaillet@wanadoo.fr>
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
 .../net/wireless/intel/iwlegacy/3945-mac.c    | 54 ++++++-------
 drivers/net/wireless/intel/iwlegacy/3945.c    | 10 +--
 .../net/wireless/intel/iwlegacy/4965-mac.c    | 80 +++++++++----------
 drivers/net/wireless/intel/iwlegacy/common.c  | 19 +++--
 .../net/wireless/intel/iwlwifi/pcie/trans.c   | 10 +--
 5 files changed, 79 insertions(+), 94 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index 6ff2674f8466..b85854664af2 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -571,20 +571,18 @@ il3945_tx_skb(struct il_priv *il,
 
 	/* Physical address of this Tx command's header (not MAC header!),
 	 * within command buffer array. */
-	txcmd_phys =
-	    pci_map_single(il->pci_dev, &out_cmd->hdr, firstlen,
-			   PCI_DMA_TODEVICE);
-	if (unlikely(pci_dma_mapping_error(il->pci_dev, txcmd_phys)))
+	txcmd_phys = dma_map_single(&il->pci_dev->dev, &out_cmd->hdr, firstlen,
+				    DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(&il->pci_dev->dev, txcmd_phys)))
 		goto drop_unlock;
 
 	/* Set up TFD's 2nd entry to point directly to remainder of skb,
 	 * if any (802.11 null frames have no payload). */
 	secondlen = skb->len - hdr_len;
 	if (secondlen > 0) {
-		phys_addr =
-		    pci_map_single(il->pci_dev, skb->data + hdr_len, secondlen,
-				   PCI_DMA_TODEVICE);
-		if (unlikely(pci_dma_mapping_error(il->pci_dev, phys_addr)))
+		phys_addr = dma_map_single(&il->pci_dev->dev, skb->data + hdr_len,
+					   secondlen, DMA_TO_DEVICE);
+		if (unlikely(dma_mapping_error(&il->pci_dev->dev, phys_addr)))
 			goto drop_unlock;
 	}
 
@@ -1015,11 +1013,11 @@ il3945_rx_allocate(struct il_priv *il, gfp_t priority)
 
 		/* Get physical address of RB/SKB */
 		page_dma =
-		    pci_map_page(il->pci_dev, page, 0,
+		    dma_map_page(&il->pci_dev->dev, page, 0,
 				 PAGE_SIZE << il->hw_params.rx_page_order,
-				 PCI_DMA_FROMDEVICE);
+				 DMA_FROM_DEVICE);
 
-		if (unlikely(pci_dma_mapping_error(il->pci_dev, page_dma))) {
+		if (unlikely(dma_mapping_error(&il->pci_dev->dev, page_dma))) {
 			__free_pages(page, il->hw_params.rx_page_order);
 			break;
 		}
@@ -1028,9 +1026,9 @@ il3945_rx_allocate(struct il_priv *il, gfp_t priority)
 
 		if (list_empty(&rxq->rx_used)) {
 			spin_unlock_irqrestore(&rxq->lock, flags);
-			pci_unmap_page(il->pci_dev, page_dma,
+			dma_unmap_page(&il->pci_dev->dev, page_dma,
 				       PAGE_SIZE << il->hw_params.rx_page_order,
-				       PCI_DMA_FROMDEVICE);
+				       DMA_FROM_DEVICE);
 			__free_pages(page, il->hw_params.rx_page_order);
 			return;
 		}
@@ -1062,9 +1060,10 @@ il3945_rx_queue_reset(struct il_priv *il, struct il_rx_queue *rxq)
 		/* In the reset function, these buffers may have been allocated
 		 * to an SKB, so we need to unmap and free potential storage */
 		if (rxq->pool[i].page != NULL) {
-			pci_unmap_page(il->pci_dev, rxq->pool[i].page_dma,
+			dma_unmap_page(&il->pci_dev->dev,
+				       rxq->pool[i].page_dma,
 				       PAGE_SIZE << il->hw_params.rx_page_order,
-				       PCI_DMA_FROMDEVICE);
+				       DMA_FROM_DEVICE);
 			__il_free_pages(il, rxq->pool[i].page);
 			rxq->pool[i].page = NULL;
 		}
@@ -1111,9 +1110,10 @@ il3945_rx_queue_free(struct il_priv *il, struct il_rx_queue *rxq)
 	int i;
 	for (i = 0; i < RX_QUEUE_SIZE + RX_FREE_BUFFERS; i++) {
 		if (rxq->pool[i].page != NULL) {
-			pci_unmap_page(il->pci_dev, rxq->pool[i].page_dma,
+			dma_unmap_page(&il->pci_dev->dev,
+				       rxq->pool[i].page_dma,
 				       PAGE_SIZE << il->hw_params.rx_page_order,
-				       PCI_DMA_FROMDEVICE);
+				       DMA_FROM_DEVICE);
 			__il_free_pages(il, rxq->pool[i].page);
 			rxq->pool[i].page = NULL;
 		}
@@ -1213,9 +1213,9 @@ il3945_rx_handle(struct il_priv *il)
 
 		rxq->queue[i] = NULL;
 
-		pci_unmap_page(il->pci_dev, rxb->page_dma,
-			       PAGE_SIZE << il->hw_params.rx_page_order,
-			       PCI_DMA_FROMDEVICE);
+		dma_unmap_page(&il->pci_dev->dev, rxb->page_dma,
+			       PAGE_SIZE << il->hw_params.rx_page_order,
+			       DMA_FROM_DEVICE);
 		pkt = rxb_addr(rxb);
 
 		len = le32_to_cpu(pkt->len_n_flags) & IL_RX_FRAME_SIZE_MSK;
@@ -1260,11 +1260,11 @@ il3945_rx_handle(struct il_priv *il)
 		spin_lock_irqsave(&rxq->lock, flags);
 		if (rxb->page != NULL) {
 			rxb->page_dma =
-			    pci_map_page(il->pci_dev, rxb->page, 0,
-					 PAGE_SIZE << il->hw_params.
-					 rx_page_order, PCI_DMA_FROMDEVICE);
-			if (unlikely(pci_dma_mapping_error(il->pci_dev,
-							   rxb->page_dma))) {
+			    dma_map_page(&il->pci_dev->dev, rxb->page, 0,
+					 PAGE_SIZE << il->hw_params.rx_page_order,
+					 DMA_FROM_DEVICE);
+			if (unlikely(dma_mapping_error(&il->pci_dev->dev,
+						       rxb->page_dma))) {
 				__il_free_pages(il, rxb->page);
 				rxb->page = NULL;
 				list_add_tail(&rxb->list, &rxq->rx_used);
@@ -3616,9 +3616,7 @@ il3945_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
-	if (!err)
-		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (err) {
 		IL_WARN("No suitable DMA available.\n");
 		goto out_pci_disable_device;
diff --git a/drivers/net/wireless/intel/iwlegacy/3945.c b/drivers/net/wireless/intel/iwlegacy/3945.c
index 0597d828bee1..a773939b8c2a 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945.c
@@ -652,16 +652,16 @@ il3945_hw_txq_free_tfd(struct il_priv *il, struct il_tx_queue *txq)
 
 	/* Unmap tx_cmd */
 	if (counter)
-		pci_unmap_single(dev, dma_unmap_addr(&txq->meta[idx], mapping),
+		dma_unmap_single(&dev->dev,
+				 dma_unmap_addr(&txq->meta[idx], mapping),
 				 dma_unmap_len(&txq->meta[idx], len),
-				 PCI_DMA_TODEVICE);
+				 DMA_TO_DEVICE);
 
 	/* unmap chunks if any */
 
 	for (i = 1; i < counter; i++)
-		pci_unmap_single(dev, le32_to_cpu(tfd->tbs[i].addr),
-				 le32_to_cpu(tfd->tbs[i].len),
-				 PCI_DMA_TODEVICE);
+		dma_unmap_single(&dev->dev, le32_to_cpu(tfd->tbs[i].addr),
+				 le32_to_cpu(tfd->tbs[i].len), DMA_TO_DEVICE);
 
 	/* free SKB */
 	if (txq->skbs) {
diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index 341d6a2bc690..d8d8fef56af9 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -94,9 +94,10 @@ il4965_rx_queue_reset(struct il_priv *il, struct il_rx_queue *rxq)
 		/* In the reset function, these buffers may have been allocated
 		 * to an SKB, so we need to unmap and free potential storage */
 		if (rxq->pool[i].page != NULL) {
-			pci_unmap_page(il->pci_dev, rxq->pool[i].page_dma,
+			dma_unmap_page(&il->pci_dev->dev,
+				       rxq->pool[i].page_dma,
 				       PAGE_SIZE << il->hw_params.rx_page_order,
-				       PCI_DMA_FROMDEVICE);
+				       DMA_FROM_DEVICE);
 			__il_free_pages(il, rxq->pool[i].page);
 			rxq->pool[i].page = NULL;
 		}
@@ -342,11 +343,10 @@ il4965_rx_allocate(struct il_priv *il, gfp_t priority)
 		}
 
 		/* Get physical address of the RB */
-		page_dma =
-		    pci_map_page(il->pci_dev, page, 0,
-				 PAGE_SIZE << il->hw_params.rx_page_order,
-				 PCI_DMA_FROMDEVICE);
-		if (unlikely(pci_dma_mapping_error(il->pci_dev, page_dma))) {
+		page_dma = dma_map_page(&il->pci_dev->dev, page, 0,
+					PAGE_SIZE << il->hw_params.rx_page_order,
+					DMA_FROM_DEVICE);
+		if (unlikely(dma_mapping_error(&il->pci_dev->dev, page_dma))) {
 			__free_pages(page, il->hw_params.rx_page_order);
 			break;
 		}
@@ -355,9 +355,9 @@ il4965_rx_allocate(struct il_priv *il, gfp_t priority)
 
 		if (list_empty(&rxq->rx_used)) {
 			spin_unlock_irqrestore(&rxq->lock, flags);
-			pci_unmap_page(il->pci_dev, page_dma,
+			dma_unmap_page(&il->pci_dev->dev, page_dma,
 				       PAGE_SIZE << il->hw_params.rx_page_order,
-				       PCI_DMA_FROMDEVICE);
+				       DMA_FROM_DEVICE);
 			__free_pages(page, il->hw_params.rx_page_order);
 			return;
 		}
@@ -409,9 +409,10 @@ il4965_rx_queue_free(struct il_priv *il, struct il_rx_queue *rxq)
 	int i;
 	for (i = 0; i < RX_QUEUE_SIZE + RX_FREE_BUFFERS; i++) {
 		if (rxq->pool[i].page != NULL) {
-			pci_unmap_page(il->pci_dev, rxq->pool[i].page_dma,
+			dma_unmap_page(&il->pci_dev->dev,
+				       rxq->pool[i].page_dma,
 				       PAGE_SIZE << il->hw_params.rx_page_order,
-				       PCI_DMA_FROMDEVICE);
+				       DMA_FROM_DEVICE);
 			__il_free_pages(il, rxq->pool[i].page);
 			rxq->pool[i].page = NULL;
 		}
@@ -1815,20 +1816,18 @@ il4965_tx_skb(struct il_priv *il,
 
 	/* Physical address of this Tx command's header (not MAC header!),
 	 * within command buffer array. */
-	txcmd_phys =
-	    pci_map_single(il->pci_dev, &out_cmd->hdr, firstlen,
-			   PCI_DMA_BIDIRECTIONAL);
-	if (unlikely(pci_dma_mapping_error(il->pci_dev, txcmd_phys)))
+	txcmd_phys = dma_map_single(&il->pci_dev->dev, &out_cmd->hdr, firstlen,
+				    DMA_BIDIRECTIONAL);
+	if (unlikely(dma_mapping_error(&il->pci_dev->dev, txcmd_phys)))
 		goto drop_unlock;
 
 	/* Set up TFD's 2nd entry to point directly to remainder of skb,
 	 * if any (802.11 null frames have no payload). */
 	secondlen = skb->len - hdr_len;
 	if (secondlen > 0) {
-		phys_addr =
-		    pci_map_single(il->pci_dev, skb->data + hdr_len, secondlen,
-				   PCI_DMA_TODEVICE);
-		if (unlikely(pci_dma_mapping_error(il->pci_dev, phys_addr)))
+		phys_addr = dma_map_single(&il->pci_dev->dev, skb->data + hdr_len,
+					   secondlen, DMA_TO_DEVICE);
+		if (unlikely(dma_mapping_error(&il->pci_dev->dev, phys_addr)))
 			goto drop_unlock;
 	}
 
@@ -1853,8 +1852,8 @@ il4965_tx_skb(struct il_priv *il,
 	    offsetof(struct il_tx_cmd, scratch);
 
 	/* take back ownership of DMA buffer to enable update */
-	pci_dma_sync_single_for_cpu(il->pci_dev, txcmd_phys, firstlen,
-				    PCI_DMA_BIDIRECTIONAL);
+	dma_sync_single_for_cpu(&il->pci_dev->dev, txcmd_phys, firstlen,
+				DMA_BIDIRECTIONAL);
 	tx_cmd->dram_lsb_ptr = cpu_to_le32(scratch_phys);
 	tx_cmd->dram_msb_ptr = il_get_dma_hi_addr(scratch_phys);
 
@@ -1869,8 +1868,8 @@ il4965_tx_skb(struct il_priv *il,
 	if (info->flags & IEEE80211_TX_CTL_AMPDU)
 		il->ops->txq_update_byte_cnt_tbl(il, txq, le16_to_cpu(tx_cmd->len));
 
-	pci_dma_sync_single_for_device(il->pci_dev, txcmd_phys, firstlen,
-				       PCI_DMA_BIDIRECTIONAL);
+	dma_sync_single_for_device(&il->pci_dev->dev, txcmd_phys, firstlen,
+				   DMA_BIDIRECTIONAL);
 
 	/* Tell device the write idx *just past* this latest filled TFD */
 	q->write_ptr = il_queue_inc_wrap(q->write_ptr, q->n_bd);
@@ -3929,15 +3928,15 @@ il4965_hw_txq_free_tfd(struct il_priv *il, struct il_tx_queue *txq)
 
 	/* Unmap tx_cmd */
 	if (num_tbs)
-		pci_unmap_single(dev, dma_unmap_addr(&txq->meta[idx], mapping),
+		dma_unmap_single(&dev->dev,
+				 dma_unmap_addr(&txq->meta[idx], mapping),
 				 dma_unmap_len(&txq->meta[idx], len),
-				 PCI_DMA_BIDIRECTIONAL);
+				 DMA_BIDIRECTIONAL);
 
 	/* Unmap chunks, if any. */
 	for (i = 1; i < num_tbs; i++)
-		pci_unmap_single(dev, il4965_tfd_tb_get_addr(tfd, i),
-				 il4965_tfd_tb_get_len(tfd, i),
-				 PCI_DMA_TODEVICE);
+		dma_unmap_single(&dev->dev, il4965_tfd_tb_get_addr(tfd, i),
+				 il4965_tfd_tb_get_len(tfd, i), DMA_TO_DEVICE);
 
 	/* free SKB */
 	if (txq->skbs) {
@@ -4243,9 +4242,9 @@ il4965_rx_handle(struct il_priv *il)
 
 		rxq->queue[i] = NULL;
 
-		pci_unmap_page(il->pci_dev, rxb->page_dma,
-			       PAGE_SIZE << il->hw_params.rx_page_order,
-			       PCI_DMA_FROMDEVICE);
+		dma_unmap_page(&il->pci_dev->dev, rxb->page_dma,
+			       PAGE_SIZE << il->hw_params.rx_page_order,
+			       DMA_FROM_DEVICE);
 		pkt = rxb_addr(rxb);
 
 		len = le32_to_cpu(pkt->len_n_flags) & IL_RX_FRAME_SIZE_MSK;
@@ -4290,12 +4289,12 @@ il4965_rx_handle(struct il_priv *il)
 		spin_lock_irqsave(&rxq->lock, flags);
 		if (rxb->page != NULL) {
 			rxb->page_dma =
-			    pci_map_page(il->pci_dev, rxb->page, 0,
-					 PAGE_SIZE << il->hw_params.
-					 rx_page_order, PCI_DMA_FROMDEVICE);
+			    dma_map_page(&il->pci_dev->dev, rxb->page, 0,
+					 PAGE_SIZE << il->hw_params.rx_page_order,
+					 DMA_FROM_DEVICE);
 
-			if (unlikely(pci_dma_mapping_error(il->pci_dev,
-							   rxb->page_dma))) {
+			if (unlikely(dma_mapping_error(&il->pci_dev->dev,
+						       rxb->page_dma))) {
 				__il_free_pages(il, rxb->page);
 				rxb->page = NULL;
 				list_add_tail(&rxb->list, &rxq->rx_used);
@@ -6514,14 +6513,9 @@ il4965_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(36));
-	if (!err)
-		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(36));
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
 	if (err) {
-		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
-		if (!err)
-			err =
-			    pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 		/* both attempts failed: */
 		if (err) {
 			IL_WARN("No suitable DMA available.\n");
diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wireless/intel/iwlegacy/common.c
index 219fed91cac5..683b632981ed 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -2819,10 +2819,10 @@ il_cmd_queue_unmap(struct il_priv *il)
 		i = il_get_cmd_idx(q, q->read_ptr, 0);
 
 		if (txq->meta[i].flags & CMD_MAPPED) {
-			pci_unmap_single(il->pci_dev,
+			dma_unmap_single(&il->pci_dev->dev,
 					 dma_unmap_addr(&txq->meta[i], mapping),
 					 dma_unmap_len(&txq->meta[i], len),
-					 PCI_DMA_BIDIRECTIONAL);
+					 DMA_BIDIRECTIONAL);
 			txq->meta[i].flags = 0;
 		}
 
@@ -2831,10 +2831,10 @@ il_cmd_queue_unmap(struct il_priv *il)
 
 	i = q->n_win;
 	if (txq->meta[i].flags & CMD_MAPPED) {
-		pci_unmap_single(il->pci_dev,
+		dma_unmap_single(&il->pci_dev->dev,
 				 dma_unmap_addr(&txq->meta[i], mapping),
 				 dma_unmap_len(&txq->meta[i], len),
-				 PCI_DMA_BIDIRECTIONAL);
+				 DMA_BIDIRECTIONAL);
 		txq->meta[i].flags = 0;
 	}
 }
@@ -3197,10 +3197,9 @@ il_enqueue_hcmd(struct il_priv *il, struct il_host_cmd *cmd)
 	}
 #endif
 
-	phys_addr =
-	    pci_map_single(il->pci_dev, &out_cmd->hdr, fix_size,
-			   PCI_DMA_BIDIRECTIONAL);
-	if (unlikely(pci_dma_mapping_error(il->pci_dev, phys_addr))) {
+	phys_addr = dma_map_single(&il->pci_dev->dev, &out_cmd->hdr, fix_size,
+				   DMA_BIDIRECTIONAL);
+	if (unlikely(dma_mapping_error(&il->pci_dev->dev, phys_addr))) {
 		idx = -ENOMEM;
 		goto out;
 	}
@@ -3298,8 +3297,8 @@ il_tx_cmd_complete(struct il_priv *il, struct il_rx_buf *rxb)
 
 	txq->time_stamp = jiffies;
 
-	pci_unmap_single(il->pci_dev, dma_unmap_addr(meta, mapping),
-			 dma_unmap_len(meta, len), PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_single(&il->pci_dev->dev, dma_unmap_addr(meta, mapping),
+			 dma_unmap_len(meta, len), DMA_BIDIRECTIONAL);
 
 	/* Input error checking is done when commands are added to queue. */
 	if (meta->flags & CMD_WANT_SKB) {
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index bee6b4574226..d493be0a1d1b 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -3489,15 +3489,9 @@ struct iwl_trans *iwl_trans_pcie_alloc(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	addr_size = trans->txqs.tfd.addr_size;
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(addr_size));
-	if (!ret)
-		ret = pci_set_consistent_dma_mask(pdev,
-						  DMA_BIT_MASK(addr_size));
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(addr_size));
 	if (ret) {
-		ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
-		if (!ret)
-			ret = pci_set_consistent_dma_mask(pdev,
-							  DMA_BIT_MASK(32));
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 		/* both attempts failed: */
 		if (ret) {
 			dev_err(&pdev->dev, "No suitable DMA available\n");
-- 
2.30.2

