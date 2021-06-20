Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC88E3ADFAC
	for <lists+kernel-janitors@lfdr.de>; Sun, 20 Jun 2021 19:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhFTRz5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 20 Jun 2021 13:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhFTRzp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Jun 2021 13:55:45 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B551C061760;
        Sun, 20 Jun 2021 10:53:31 -0700 (PDT)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lv1dR-00012S-GA; Sun, 20 Jun 2021 19:53:29 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/13] staging: rtl8188eu: remove unnecessary if clause
Date:   Sun, 20 Jun 2021 19:52:54 +0200
Message-Id: <20210620175301.14988-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620175301.14988-1-martin@kaiser.cx>
References: <20210620175301.14988-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

if and else do the same thing.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index 22c9b20de342..d1086699f952 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -230,18 +230,8 @@ s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy)
 
 void Hal_InitPGData88E(struct adapter *padapter)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-
-	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
-		if (!is_boot_from_eeprom(padapter)) {
-			/*  Read EFUSE real map to shadow. */
-			EFUSE_ShadowMapUpdate(padapter);
-		}
-	} else {/* autoload fail */
-		/* update to default value 0xFF */
-		if (!is_boot_from_eeprom(padapter))
-			EFUSE_ShadowMapUpdate(padapter);
-	}
+	if (!is_boot_from_eeprom(padapter))
+		EFUSE_ShadowMapUpdate(padapter);
 }
 
 void Hal_EfuseParseIDCode88E(struct adapter *padapter, u8 *hwinfo)
-- 
2.20.1

