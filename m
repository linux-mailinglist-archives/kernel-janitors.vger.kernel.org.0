Return-Path: <kernel-janitors+bounces-447-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6507F9732
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Nov 2023 02:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36546280D5F
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Nov 2023 01:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1032E10EC;
	Mon, 27 Nov 2023 01:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 3B783119;
	Sun, 26 Nov 2023 17:35:36 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 514B96018CCDB;
	Mon, 27 Nov 2023 09:35:33 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: pkshih@realtek.com,
	kvalo@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	lizetao1@huawei.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless-next v3 1/2] wifi: rtlwifi: rtl8821ae: phy: remove some useless code
Date: Mon, 27 Nov 2023 09:35:11 +0800
Message-Id: <20231127013511.26694-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker warning:
Value stored to 'v1' is never read [deadcode.DeadStores]
Value stored to 'channel' is never read [deadcode.DeadStores]

Remove them to save some place.

Signed-off-by: Su Hui <suhui@nfschina.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
v3: 
 - same as v2.
v2:
 - fix the subject prefix problem

 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index 5323ead30db0..6df270e29e66 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -2038,15 +2038,9 @@ static bool _rtl8821ae_phy_config_bb_with_pgheaderfile(struct ieee80211_hw *hw,
 			 /*don't need the hw_body*/
 			if (!_rtl8821ae_check_condition(hw, v1)) {
 				i += 2; /* skip the pair of expression*/
-				v1 = array[i];
 				v2 = array[i+1];
-				v3 = array[i+2];
-				while (v2 != 0xDEAD) {
+				while (v2 != 0xDEAD)
 					i += 3;
-					v1 = array[i];
-					v2 = array[i+1];
-					v3 = array[i+2];
-				}
 			}
 		}
 	}
@@ -3543,7 +3537,6 @@ u8 rtl8821ae_phy_sw_chnl(struct ieee80211_hw *hw)
 	struct rtl_phy *rtlphy = &rtlpriv->phy;
 	struct rtl_hal *rtlhal = rtl_hal(rtl_priv(hw));
 	u32 timeout = 1000, timecount = 0;
-	u8 channel = rtlphy->current_channel;
 
 	if (rtlphy->sw_chnl_inprogress)
 		return 0;
@@ -3566,8 +3559,6 @@ u8 rtl8821ae_phy_sw_chnl(struct ieee80211_hw *hw)
 		rtl8821ae_phy_switch_wirelessband(hw, BAND_ON_2_4G);
 
 	rtlphy->sw_chnl_inprogress = true;
-	if (channel == 0)
-		channel = 1;
 
 	rtl_dbg(rtlpriv, COMP_SCAN, DBG_TRACE,
 		"switch to channel%d, band type is %d\n",
-- 
2.30.2


