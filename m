Return-Path: <kernel-janitors+bounces-423-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68FC7F6A83
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Nov 2023 03:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CA4E1F20F36
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Nov 2023 02:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B054B23CF;
	Fri, 24 Nov 2023 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 47071D72;
	Thu, 23 Nov 2023 18:04:33 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 55569602610F3;
	Fri, 24 Nov 2023 10:04:25 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: dan.carpenter@linaro.org,
	pkshih@realtek.com,
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
Subject: [PATCH v2 2/2] wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
Date: Fri, 24 Nov 2023 10:03:54 +0800
Message-Id: <20231124020352.1660621-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231124020352.1660621-1-suhui@nfschina.com>
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
other is old value of data. Let _rtl8821ae_phy_calculate_bit_shift()'s
return value less than 32 to fix this problem. Warn if bitmask is zero.

[1]:https://stackoverflow.com/questions/11270492/what-does-the-c-
standard-say-about-bitshifting-more-bits-than-the-width-of-type
[2]:https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf

Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2: 
 - fix the subject prefix problem
 - silence the warning by not return 32 bits rather than adding a type cast.(Thanks to Dan and Ping-Ke)

By the way, there some similar problems in
_rtl88e_phy_calculate_bit_shift(), _rtl92c_phy_calculate_bit_shift() and
so on...

 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index 6df270e29e66..52ab1b0761c0 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -31,7 +31,12 @@ static u32 _rtl8821ae_phy_calculate_bit_shift(u32 bitmask)
 {
 	u32 i = ffs(bitmask);
 
-	return i ? i - 1 : 32;
+	if (!i) {
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	return i - 1;
 }
 static bool _rtl8821ae_phy_bb8821a_config_parafile(struct ieee80211_hw *hw);
 /*static bool _rtl8812ae_phy_config_mac_with_headerfile(struct ieee80211_hw *hw);*/
-- 
2.30.2


