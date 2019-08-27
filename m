Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8930C9E6F1
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Aug 2019 13:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfH0Lmz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Aug 2019 07:42:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5223 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbfH0Lmz (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Aug 2019 07:42:55 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 308CF158C85466B87F03;
        Tue, 27 Aug 2019 19:42:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 27 Aug 2019 19:42:42 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-serial@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] tty: serial: linflexuart: Use DEFINE_SPINLOCK() for spinlock
Date:   Tue, 27 Aug 2019 11:46:14 +0000
Message-ID: <20190827114614.102037-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 26b9601a0952..8aea7822b731 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -136,7 +136,7 @@ MODULE_DEVICE_TABLE(of, linflex_dt_ids);
 #ifdef CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE
 static struct uart_port *earlycon_port;
 static bool linflex_earlycon_same_instance;
-static spinlock_t init_lock;
+static DEFINE_SPINLOCK(init_lock);
 static bool during_init;
 
 static struct {
@@ -922,10 +922,6 @@ static int __init linflex_serial_init(void)
 	if (ret)
 		uart_unregister_driver(&linflex_reg);
 
-#ifdef CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE
-	spin_lock_init(&init_lock);
-#endif
-
 	return ret;
 }



