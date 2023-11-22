Return-Path: <kernel-janitors+bounces-377-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D04957F4123
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 10:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BF692817D9
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 09:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559AE3B7B0;
	Wed, 22 Nov 2023 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 73DF947B2;
	Wed, 22 Nov 2023 01:03:28 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id ACEC660754528;
	Wed, 22 Nov 2023 17:02:59 +0800 (CST)
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
	linville@tuxdriver.com,
	Larry.Finger@lwfinger.net,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
Date: Wed, 22 Nov 2023 17:02:12 +0800
Message-Id: <20231122090210.951185-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231122090210.951185-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang staic checker warning:
drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c:184:49:
	The result of the left shift is undefined due to shifting by '32',
	which is greater or equal to the width of type 'u32'.
	[core.UndefinedBinaryOperatorResult]

If the value of the right operand is negative or is greater than or
equal to the width of the promoted left operand, the behavior is
undefined.[1][2]

For example, when using different gcc's compilation optimizaation options
(-O0 or -O2), the result of '(u32)data << 32' is different. One is 0, the
other is old value of data. Adding an u64 cast to fix this problem.

[1]:https://stackoverflow.com/questions/11270492/what-does-the-c-
standard-say-about-bitshifting-more-bits-than-the-width-of-type
[2]:https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf

Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index 6df270e29e66..89713e0587b5 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -106,7 +106,7 @@ u32 rtl8821ae_phy_query_bb_reg(struct ieee80211_hw *hw, u32 regaddr,
 		regaddr, bitmask);
 	originalvalue = rtl_read_dword(rtlpriv, regaddr);
 	bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
-	returnvalue = (originalvalue & bitmask) >> bitshift;
+	returnvalue = (u64)(originalvalue & bitmask) >> bitshift;
 
 	rtl_dbg(rtlpriv, COMP_RF, DBG_TRACE,
 		"BBR MASK=0x%x Addr[0x%x]=0x%x\n",
@@ -128,7 +128,7 @@ void rtl8821ae_phy_set_bb_reg(struct ieee80211_hw *hw,
 		originalvalue = rtl_read_dword(rtlpriv, regaddr);
 		bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
 		data = ((originalvalue & (~bitmask)) |
-			((data << bitshift) & bitmask));
+			(((u64)data << bitshift) & bitmask));
 	}
 
 	rtl_write_dword(rtlpriv, regaddr, data);
@@ -153,7 +153,7 @@ u32 rtl8821ae_phy_query_rf_reg(struct ieee80211_hw *hw,
 
 	original_value = _rtl8821ae_phy_rf_serial_read(hw, rfpath, regaddr);
 	bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
-	readback_value = (original_value & bitmask) >> bitshift;
+	readback_value = (u64)(original_value & bitmask) >> bitshift;
 
 	spin_unlock(&rtlpriv->locks.rf_lock);
 
@@ -181,7 +181,7 @@ void rtl8821ae_phy_set_rf_reg(struct ieee80211_hw *hw,
 		original_value =
 		   _rtl8821ae_phy_rf_serial_read(hw, rfpath, regaddr);
 		bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
-		data = ((original_value & (~bitmask)) | (data << bitshift));
+		data = ((original_value & (~bitmask)) | ((u64)data << bitshift));
 	}
 
 	_rtl8821ae_phy_rf_serial_write(hw, rfpath, regaddr, data);
-- 
2.30.2


