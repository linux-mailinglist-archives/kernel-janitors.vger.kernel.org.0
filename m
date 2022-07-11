Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A65256BF19
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Jul 2022 20:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238702AbiGHRo7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 Jul 2022 13:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238259AbiGHRo6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Jul 2022 13:44:58 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 08 Jul 2022 10:44:57 PDT
Received: from smtp.smtpout.orange.fr (smtp-12.smtpout.orange.fr [80.12.242.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AE9CA6050E
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Jul 2022 10:44:57 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 9ruuoDchN3JPE9ruuoQx6z; Fri, 08 Jul 2022 19:37:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 08 Jul 2022 19:37:26 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Cheng Xu <chengyou@linux.alibaba.com>,
        Kai Shen <kaishen@linux.alibaba.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-rdma@vger.kernel.org
Subject: [PATCH 2/2] RDMA/erdma: Use the non-atomic bitmap API when applicable
Date:   Fri,  8 Jul 2022 19:37:22 +0200
Message-Id: <3f311a4ebfff657c3e9ccbe754baf8be6ece4306.1657301795.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2764b6e204b32ef8c198a5efaf6c6bc4119f7665.1657301795.git.christophe.jaillet@wanadoo.fr>
References: <2764b6e204b32ef8c198a5efaf6c6bc4119f7665.1657301795.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Usages of the 'comp_wait_bitmap' bitmap is protected with a spinlock, so
non-atomic functions can be used to set/clear bits.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/hw/erdma/erdma_cmdq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/erdma/erdma_cmdq.c b/drivers/infiniband/hw/erdma/erdma_cmdq.c
index 0489838d9717..e3d426668788 100644
--- a/drivers/infiniband/hw/erdma/erdma_cmdq.c
+++ b/drivers/infiniband/hw/erdma/erdma_cmdq.c
@@ -47,7 +47,7 @@ static struct erdma_comp_wait *get_comp_wait(struct erdma_cmdq *cmdq)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	set_bit(comp_idx, cmdq->comp_wait_bitmap);
+	__set_bit(comp_idx, cmdq->comp_wait_bitmap);
 	spin_unlock(&cmdq->lock);
 
 	return &cmdq->wait_pool[comp_idx];
@@ -60,7 +60,7 @@ static void put_comp_wait(struct erdma_cmdq *cmdq,
 
 	cmdq->wait_pool[comp_wait->ctx_id].cmd_status = ERDMA_CMD_STATUS_INIT;
 	spin_lock(&cmdq->lock);
-	used = test_and_clear_bit(comp_wait->ctx_id, cmdq->comp_wait_bitmap);
+	used = __test_and_clear_bit(comp_wait->ctx_id, cmdq->comp_wait_bitmap);
 	spin_unlock(&cmdq->lock);
 
 	WARN_ON(!used);
-- 
2.34.1

