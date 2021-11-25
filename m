Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F5545E14C
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Nov 2021 21:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242893AbhKYUKz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 25 Nov 2021 15:10:55 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:59230 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239620AbhKYUIy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Nov 2021 15:08:54 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id qL01mbjpXqYovqL01mK99E; Thu, 25 Nov 2021 21:05:41 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 25 Nov 2021 21:05:41 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     bryantan@vmware.com, vdasa@vmware.com, pv-drivers@vmware.com,
        dledford@redhat.com, jgg@ziepe.ca
Cc:     linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] RDMA/pvrdma: Use bitmap_zalloc() when applicable
Date:   Thu, 25 Nov 2021 21:05:40 +0100
Message-Id: <33e8b993bfa6b7164e9bee95e3c27fb2c53949ce.1637870667.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid some
open-coded arithmetic in allocator arguments.

Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
consistency.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_doorbell.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_doorbell.c b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_doorbell.c
index bf51357ea3aa..21ef3fb39915 100644
--- a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_doorbell.c
+++ b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_doorbell.c
@@ -63,7 +63,7 @@ int pvrdma_uar_table_init(struct pvrdma_dev *dev)
 	tbl->max = num;
 	tbl->mask = mask;
 	spin_lock_init(&tbl->lock);
-	tbl->table = kcalloc(BITS_TO_LONGS(num), sizeof(long), GFP_KERNEL);
+	tbl->table = bitmap_zalloc(num, GFP_KERNEL);
 	if (!tbl->table)
 		return -ENOMEM;
 
@@ -77,7 +77,7 @@ void pvrdma_uar_table_cleanup(struct pvrdma_dev *dev)
 {
 	struct pvrdma_id_table *tbl = &dev->uar_table.tbl;
 
-	kfree(tbl->table);
+	bitmap_free(tbl->table);
 }
 
 int pvrdma_uar_alloc(struct pvrdma_dev *dev, struct pvrdma_uar_map *uar)
-- 
2.30.2

