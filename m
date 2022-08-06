Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54EB58B818
	for <lists+kernel-janitors@lfdr.de>; Sat,  6 Aug 2022 22:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbiHFUHa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 6 Aug 2022 16:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiHFUH2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Aug 2022 16:07:28 -0400
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B6CE035
        for <kernel-janitors@vger.kernel.org>; Sat,  6 Aug 2022 13:07:27 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id KQ4xoJ2tYsfCIKQ4xoRKcu; Sat, 06 Aug 2022 22:07:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 22:07:26 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Fix a typo in a comment
Date:   Sat,  6 Aug 2022 22:07:22 +0200
Message-Id: <de1b1134f056ea7563bb0a9bb2f66ede1475728d.1659816434.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

o and t are swapped.
s/mtdpsotre/mtdpstore/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/mtdpstore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index e13d42c0acb0..7ac8ac901306 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -401,7 +401,7 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	/*
 	 * kmsg_size must be aligned to 4096 Bytes, which is limited by
 	 * psblk. The default value of kmsg_size is 64KB. If kmsg_size
-	 * is larger than erasesize, some errors will occur since mtdpsotre
+	 * is larger than erasesize, some errors will occur since mtdpstore
 	 * is designed on it.
 	 */
 	if (mtd->erasesize < info->kmsg_size) {
-- 
2.34.1

