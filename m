Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B0B486CB4
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Jan 2022 22:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244463AbiAFVuN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Jan 2022 16:50:13 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:62239 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244458AbiAFVuM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jan 2022 16:50:12 -0500
Received: from pop-os.home ([90.11.185.88])
        by smtp.orange.fr with ESMTPA
        id 5aeAntVBq2lVY5aeBnSlMk; Thu, 06 Jan 2022 22:50:11 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 06 Jan 2022 22:50:11 +0100
X-ME-IP: 90.11.185.88
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     arnd@arndb.de, hch@infradead.org, akpm@linux-foundation.org,
        awalls@md.metrocast.net, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 04/16] media: Remove usage of the deprecated "pci-dma-compat.h" API
Date:   Thu,  6 Jan 2022 22:50:07 +0100
Message-Id: <e89f4b29b9f7e0c711a3ccc16a009f49f416e1fc.1641500561.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

A coccinelle script has been used to perform the needed transformation.
It can be found in [3].

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/
[3]: https://lore.kernel.org/kernel-janitors/20200716192821.321233-1-christophe.jaillet@wanadoo.fr/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/pci/cx18/cx18-queue.h |  6 +++---
 drivers/media/pci/ivtv/ivtv-queue.h | 25 ++++++++++++++-----------
 drivers/media/pci/ivtv/ivtv-udma.h  |  8 ++++----
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-queue.h b/drivers/media/pci/cx18/cx18-queue.h
index e0a34bd6539e..26f2097c0496 100644
--- a/drivers/media/pci/cx18/cx18-queue.h
+++ b/drivers/media/pci/cx18/cx18-queue.h
@@ -15,15 +15,15 @@
 static inline void cx18_buf_sync_for_cpu(struct cx18_stream *s,
 	struct cx18_buffer *buf)
 {
-	pci_dma_sync_single_for_cpu(s->cx->pci_dev, buf->dma_handle,
+	dma_sync_single_for_cpu(&s->cx->pci_dev->dev, buf->dma_handle,
 				s->buf_size, s->dma);
 }
 
 static inline void cx18_buf_sync_for_device(struct cx18_stream *s,
 	struct cx18_buffer *buf)
 {
-	pci_dma_sync_single_for_device(s->cx->pci_dev, buf->dma_handle,
-				s->buf_size, s->dma);
+	dma_sync_single_for_device(&s->cx->pci_dev->dev, buf->dma_handle,
+				   s->buf_size, s->dma);
 }
 
 void _cx18_mdl_sync_for_device(struct cx18_stream *s, struct cx18_mdl *mdl);
diff --git a/drivers/media/pci/ivtv/ivtv-queue.h b/drivers/media/pci/ivtv/ivtv-queue.h
index 586b0bf63c26..b8fc2669a358 100644
--- a/drivers/media/pci/ivtv/ivtv-queue.h
+++ b/drivers/media/pci/ivtv/ivtv-queue.h
@@ -17,20 +17,20 @@
 
 static inline int ivtv_might_use_pio(struct ivtv_stream *s)
 {
-	return s->dma == PCI_DMA_NONE || (SLICED_VBI_PIO && s->type == IVTV_ENC_STREAM_TYPE_VBI);
+	return s->dma == DMA_NONE || (SLICED_VBI_PIO && s->type == IVTV_ENC_STREAM_TYPE_VBI);
 }
 
 static inline int ivtv_use_pio(struct ivtv_stream *s)
 {
 	struct ivtv *itv = s->itv;
 
-	return s->dma == PCI_DMA_NONE ||
+	return s->dma == DMA_NONE ||
 	    (SLICED_VBI_PIO && s->type == IVTV_ENC_STREAM_TYPE_VBI && itv->vbi.sliced_in->service_set);
 }
 
 static inline int ivtv_might_use_dma(struct ivtv_stream *s)
 {
-	return s->dma != PCI_DMA_NONE;
+	return s->dma != DMA_NONE;
 }
 
 static inline int ivtv_use_dma(struct ivtv_stream *s)
@@ -41,15 +41,16 @@ static inline int ivtv_use_dma(struct ivtv_stream *s)
 static inline void ivtv_buf_sync_for_cpu(struct ivtv_stream *s, struct ivtv_buffer *buf)
 {
 	if (ivtv_use_dma(s))
-		pci_dma_sync_single_for_cpu(s->itv->pdev, buf->dma_handle,
-				s->buf_size + 256, s->dma);
+		dma_sync_single_for_cpu(&s->itv->pdev->dev, buf->dma_handle,
+					s->buf_size + 256, s->dma);
 }
 
 static inline void ivtv_buf_sync_for_device(struct ivtv_stream *s, struct ivtv_buffer *buf)
 {
 	if (ivtv_use_dma(s))
-		pci_dma_sync_single_for_device(s->itv->pdev, buf->dma_handle,
-				s->buf_size + 256, s->dma);
+		dma_sync_single_for_device(&s->itv->pdev->dev,
+					   buf->dma_handle, s->buf_size + 256,
+					   s->dma);
 }
 
 int ivtv_buf_copy_from_user(struct ivtv_stream *s, struct ivtv_buffer *buf, const char __user *src, int copybytes);
@@ -70,15 +71,17 @@ void ivtv_stream_free(struct ivtv_stream *s);
 static inline void ivtv_stream_sync_for_cpu(struct ivtv_stream *s)
 {
 	if (ivtv_use_dma(s))
-		pci_dma_sync_single_for_cpu(s->itv->pdev, s->sg_handle,
-			sizeof(struct ivtv_sg_element), PCI_DMA_TODEVICE);
+		dma_sync_single_for_cpu(&s->itv->pdev->dev, s->sg_handle,
+					sizeof(struct ivtv_sg_element),
+					DMA_TO_DEVICE);
 }
 
 static inline void ivtv_stream_sync_for_device(struct ivtv_stream *s)
 {
 	if (ivtv_use_dma(s))
-		pci_dma_sync_single_for_device(s->itv->pdev, s->sg_handle,
-			sizeof(struct ivtv_sg_element), PCI_DMA_TODEVICE);
+		dma_sync_single_for_device(&s->itv->pdev->dev, s->sg_handle,
+					   sizeof(struct ivtv_sg_element),
+					   DMA_TO_DEVICE);
 }
 
 #endif
diff --git a/drivers/media/pci/ivtv/ivtv-udma.h b/drivers/media/pci/ivtv/ivtv-udma.h
index 0eef104e03b9..12b9426b2db2 100644
--- a/drivers/media/pci/ivtv/ivtv-udma.h
+++ b/drivers/media/pci/ivtv/ivtv-udma.h
@@ -23,14 +23,14 @@ void ivtv_udma_start(struct ivtv *itv);
 
 static inline void ivtv_udma_sync_for_device(struct ivtv *itv)
 {
-	pci_dma_sync_single_for_device(itv->pdev, itv->udma.SG_handle,
-		sizeof(itv->udma.SGarray), PCI_DMA_TODEVICE);
+	dma_sync_single_for_device(&itv->pdev->dev, itv->udma.SG_handle,
+				   sizeof(itv->udma.SGarray), DMA_TO_DEVICE);
 }
 
 static inline void ivtv_udma_sync_for_cpu(struct ivtv *itv)
 {
-	pci_dma_sync_single_for_cpu(itv->pdev, itv->udma.SG_handle,
-		sizeof(itv->udma.SGarray), PCI_DMA_TODEVICE);
+	dma_sync_single_for_cpu(&itv->pdev->dev, itv->udma.SG_handle,
+				sizeof(itv->udma.SGarray), DMA_TO_DEVICE);
 }
 
 #endif
-- 
2.32.0

