Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C6D42E0D5
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Oct 2021 20:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233886AbhJNSKD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Oct 2021 14:10:03 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:52882 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbhJNSJ6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Oct 2021 14:09:58 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id b58xmB1SVBazob58xmY4d7; Thu, 14 Oct 2021 20:07:52 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 14 Oct 2021 20:07:52 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     axboe@kernel.dk, liushixin2@huawei.com, bhelgaas@google.com
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtip32xx: Remove redundant 'flush_workqueue()' calls
Date:   Thu, 14 Oct 2021 20:07:50 +0200
Message-Id: <0fea349c808c6cfbf549b0e33701320c7860c8b7.1634234221.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/block/mtip32xx/mtip32xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index d0b40309f47e..c91b9010c1a6 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4063,7 +4063,6 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 
 msi_initialize_err:
 	if (dd->isr_workq) {
-		flush_workqueue(dd->isr_workq);
 		destroy_workqueue(dd->isr_workq);
 		drop_cpu(dd->work[0].cpu_binding);
 		drop_cpu(dd->work[1].cpu_binding);
@@ -4121,7 +4120,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 	mtip_block_remove(dd);
 
 	if (dd->isr_workq) {
-		flush_workqueue(dd->isr_workq);
 		destroy_workqueue(dd->isr_workq);
 		drop_cpu(dd->work[0].cpu_binding);
 		drop_cpu(dd->work[1].cpu_binding);
-- 
2.30.2

