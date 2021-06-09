Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685F63A12B4
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Jun 2021 13:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239101AbhFIL2k (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Jun 2021 07:28:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39972 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239050AbhFIL2j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 07:28:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lqwM4-0004QW-NT; Wed, 09 Jun 2021 11:26:40 +0000
From:   Colin King <colin.king@canonical.com>
To:     Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-nvme@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] nvmet-rdma: remove redundant initialization of variable ret
Date:   Wed,  9 Jun 2021 12:26:40 +0100
Message-Id: <20210609112640.184904-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read,
it is being updated later on. The assignment is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvme/target/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
index 7d607f435e36..7ef2b55df80c 100644
--- a/drivers/nvme/target/rdma.c
+++ b/drivers/nvme/target/rdma.c
@@ -1545,7 +1545,7 @@ static int nvmet_rdma_cm_accept(struct rdma_cm_id *cm_id,
 {
 	struct rdma_conn_param  param = { };
 	struct nvme_rdma_cm_rep priv = { };
-	int ret = -ENOMEM;
+	int ret;
 
 	param.rnr_retry_count = 7;
 	param.flow_control = 1;
-- 
2.31.1

