Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE7127141F
	for <lists+kernel-janitors@lfdr.de>; Sun, 20 Sep 2020 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgITMJb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 20 Sep 2020 08:09:31 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:50059 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726484AbgITMJa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Sep 2020 08:09:30 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596492000"; 
   d="scan'208";a="468612197"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 20 Sep 2020 14:08:58 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mark Brown <broonie@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] spi/topcliff-pch: drop double zeroing
Date:   Sun, 20 Sep 2020 13:26:23 +0200
Message-Id: <1600601186-7420-12-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(*x),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/spi/spi-topcliff-pch.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1002,7 +1002,7 @@ static void pch_spi_handle_dma(struct pc
 	spin_unlock_irqrestore(&data->lock, flags);
 
 	/* RX */
-	dma->sg_rx_p = kcalloc(num, sizeof(*dma->sg_rx_p), GFP_ATOMIC);
+	dma->sg_rx_p = kmalloc_array(num, sizeof(*dma->sg_rx_p), GFP_ATOMIC);
 	if (!dma->sg_rx_p)
 		return;
 
@@ -1065,7 +1065,7 @@ static void pch_spi_handle_dma(struct pc
 		head = 0;
 	}
 
-	dma->sg_tx_p = kcalloc(num, sizeof(*dma->sg_tx_p), GFP_ATOMIC);
+	dma->sg_tx_p = kmalloc_array(num, sizeof(*dma->sg_tx_p), GFP_ATOMIC);
 	if (!dma->sg_tx_p)
 		return;
 

