Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443ECAE2B1
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Sep 2019 05:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404177AbfIJD7M (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Sep 2019 23:59:12 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:16558 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392966AbfIJD7M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Sep 2019 23:59:12 -0400
Received: from localhost.localdomain ([90.126.97.183])
        by mwinf5d81 with ME
        id zfz72000E3xPcdm03fz8gJ; Tue, 10 Sep 2019 05:59:10 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Sep 2019 05:59:10 +0200
X-ME-IP: 90.126.97.183
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     chenhc@lemote.com, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mips: Loongson: Fix the link time qualifier of 'serial_exit()'
Date:   Tue, 10 Sep 2019 05:59:07 +0200
Message-Id: <20190910035907.6430-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'exit' functions should be marked as __exit, not __init.

Fixes: 85cc028817ef ("mips: make loongsoon serial driver explicitly modular")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/loongson64/common/serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/common/serial.c b/arch/mips/loongson64/common/serial.c
index ffefc1cb2612..98c3a7feb10f 100644
--- a/arch/mips/loongson64/common/serial.c
+++ b/arch/mips/loongson64/common/serial.c
@@ -110,7 +110,7 @@ static int __init serial_init(void)
 }
 module_init(serial_init);
 
-static void __init serial_exit(void)
+static void __exit serial_exit(void)
 {
 	platform_device_unregister(&uart8250_device);
 }
-- 
2.20.1

