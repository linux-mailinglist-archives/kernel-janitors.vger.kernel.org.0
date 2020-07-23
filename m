Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BBC22B389
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Jul 2020 18:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbgGWQcX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Jul 2020 12:32:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54655 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgGWQcX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jul 2020 12:32:23 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jye8l-0005AK-7G; Thu, 23 Jul 2020 16:32:15 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ping-Ke Shih <pkshih@realtek.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtlwifi: btcoex: remove redundant initialization of variables ant_num and single_ant_path
Date:   Thu, 23 Jul 2020 17:32:14 +0100
Message-Id: <20200723163214.995226-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables ant_num and single_ant_path are being initialized with a
value that is never read and are being updated later with a new value.
The initializations are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
index a4940a3842de..4949f99844b5 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -1318,7 +1318,7 @@ bool exhalbtc_bind_bt_coex_withadapter(void *adapter)
 {
 	struct rtl_priv *rtlpriv = adapter;
 	struct btc_coexist *btcoexist = rtl_btc_coexist(rtlpriv);
-	u8 ant_num = 2, chip_type, single_ant_path = 0;
+	u8 ant_num, chip_type, single_ant_path;
 
 	if (!btcoexist)
 		return false;
-- 
2.27.0

