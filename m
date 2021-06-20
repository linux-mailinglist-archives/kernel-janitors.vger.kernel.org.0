Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AB83ADDE9
	for <lists+kernel-janitors@lfdr.de>; Sun, 20 Jun 2021 11:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhFTJv6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 20 Jun 2021 05:51:58 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:28347 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhFTJv5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Jun 2021 05:51:57 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d58 with ME
        id KMph2500g21Fzsu03MpiTb; Sun, 20 Jun 2021 11:49:44 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Jun 2021 11:49:44 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     yisen.zhuang@huawei.com, salil.mehta@huawei.com,
        davem@davemloft.net, kuba@kernel.org, huangguangbin2@huawei.com,
        tanhuazhong@huawei.com, zhangjiaran@huawei.com,
        moyufeng@huawei.com, lipeng321@huawei.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] net: hns3: Fix a memory leak in an error handling path in 'hclge_handle_error_info_log()'
Date:   Sun, 20 Jun 2021 11:49:40 +0200
Message-Id: <bcf0186881d4a735fb1d356546c0cf00da40bb36.1624182453.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If this 'kzalloc()' fails we must free some resources as in all the other
error handling paths of this function.

Fixes: 2e2deee7618b ("net: hns3: add the RAS compatibility adaptation solution")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
index bad9fda19398..ec9a7f8bc3fe 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
@@ -2330,8 +2330,10 @@ int hclge_handle_error_info_log(struct hnae3_ae_dev *ae_dev)
 	buf_size = buf_len / sizeof(u32);
 
 	desc_data = kzalloc(buf_len, GFP_KERNEL);
-	if (!desc_data)
-		return -ENOMEM;
+	if (!desc_data) {
+		ret = -ENOMEM;
+		goto err_desc;
+	}
 
 	buf = kzalloc(buf_len, GFP_KERNEL);
 	if (!buf) {
-- 
2.30.2

