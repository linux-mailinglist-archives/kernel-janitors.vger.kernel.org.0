Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDE671AC8
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jul 2019 16:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390716AbfGWOu0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 23 Jul 2019 10:50:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55705 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732532AbfGWOu0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Jul 2019 10:50:26 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hpw7T-0005z6-Am; Tue, 23 Jul 2019 14:50:23 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Whitmore <johnfwhitmore@gmail.com>,
        devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/staging/rtl8192u: fix indentation issue, remove extra tab
Date:   Tue, 23 Jul 2019 15:50:22 +0100
Message-Id: <20190723145022.11608-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A statement is indented one level too deeply; clean this up by
removing a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index ade14ef05730..c23e43b095d9 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -1334,7 +1334,7 @@ static void dm_CheckTXPowerTracking_ThermalMeter(struct net_device *dev)
 		return;
 	}
 	/*DbgPrint("Schedule TxPowerTrackingWorkItem\n");*/
-		queue_delayed_work(priv->priv_wq, &priv->txpower_tracking_wq, 0);
+	queue_delayed_work(priv->priv_wq, &priv->txpower_tracking_wq, 0);
 	TM_Trigger = 0;
 }
 
-- 
2.20.1

