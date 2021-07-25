Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399533D4E71
	for <lists+kernel-janitors@lfdr.de>; Sun, 25 Jul 2021 18:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhGYPTc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 25 Jul 2021 11:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhGYPTJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 11:19:09 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F87BC061757;
        Sun, 25 Jul 2021 08:59:39 -0700 (PDT)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1m7gXR-0000SM-Ca; Sun, 25 Jul 2021 17:59:37 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 16/18] staging: rtl8188eu: simplify path_adda_on
Date:   Sun, 25 Jul 2021 17:59:00 +0200
Message-Id: <20210725155902.32433-16-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

path_adda_on's is2t parameter is always false.
Remove some code that would be called only for is2t == true.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/phy.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
index 62f979ceadc6..faa94dc7190c 100644
--- a/drivers/staging/rtl8188eu/hal/phy.c
+++ b/drivers/staging/rtl8188eu/hal/phy.c
@@ -711,19 +711,13 @@ static void reload_mac_registers(struct adapter *adapt, const u32 *mac_reg,
 	usb_write32(adapt, mac_reg[i], backup[i]);
 }
 
-static void path_adda_on(struct adapter *adapt, const u32 *adda_reg,
-			 bool is_path_a_on, bool is2t)
+static void path_adda_on(struct adapter *adapt, const u32 *adda_reg, bool is_path_a_on)
 {
 	u32 path_on;
 	u32 i;
 
-	if (!is2t) {
-		path_on = 0x0bdb25a0;
-		phy_set_bb_reg(adapt, adda_reg[0], bMaskDWord, 0x0b1b25a0);
-	} else {
-		path_on = is_path_a_on ? 0x04db25a4 : 0x0b1b25a4;
-		phy_set_bb_reg(adapt, adda_reg[0], bMaskDWord, path_on);
-	}
+	path_on = 0x0bdb25a0;
+	phy_set_bb_reg(adapt, adda_reg[0], bMaskDWord, 0x0b1b25a0);
 
 	for (i = 1; i < IQK_ADDA_REG_NUM; i++)
 		phy_set_bb_reg(adapt, adda_reg[i], bMaskDWord, path_on);
@@ -870,7 +864,7 @@ static void phy_iq_calibrate(struct adapter *adapt, s32 result[][8],
 				    dm_odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 	}
 
-	path_adda_on(adapt, adda_reg, true, false);
+	path_adda_on(adapt, adda_reg, true);
 	if (t == 0)
 		dm_odm->RFCalibrateInfo.bRfPiEnable = (u8)phy_query_bb_reg(adapt, rFPGA0_XA_HSSIParameter1,
 									   BIT(8));
-- 
2.20.1

