Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B0136458F
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Apr 2021 16:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbhDSOC1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Apr 2021 10:02:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32953 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhDSOC0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 10:02:26 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lYUTJ-0006Ax-1e; Mon, 19 Apr 2021 14:01:53 +0000
From:   Colin King <colin.king@canonical.com>
To:     Kalle Valo <kvalo@codeaurora.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] wlcore: Fix buffer overrun by snprintf due to incorrect buffer size Content-Type: text/plain; charset="utf-8"
Date:   Mon, 19 Apr 2021 15:01:52 +0100
Message-Id: <20210419140152.180361-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The size of the buffer than can be written to is currently incorrect, it is
always the size of the entire buffer even though the snprintf is writing
as position pos into the buffer. Fix this by setting the buffer size to be
the number of bytes left in the buffer, namely sizeof(buf) - pos.

Addresses-Coverity: ("Out-of-bounds access")
Fixes: 7b0e2c4f6be3 ("wlcore: fix overlapping snprintf arguments in debugfs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ti/wlcore/debugfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ti/wlcore/debugfs.h b/drivers/net/wireless/ti/wlcore/debugfs.h
index 715edfa5f89f..a9e13e6d65c5 100644
--- a/drivers/net/wireless/ti/wlcore/debugfs.h
+++ b/drivers/net/wireless/ti/wlcore/debugfs.h
@@ -84,7 +84,7 @@ static ssize_t sub## _ ##name## _read(struct file *file,		\
 	wl1271_debugfs_update_stats(wl);				\
 									\
 	for (i = 0; i < len && pos < sizeof(buf); i++)			\
-		pos += snprintf(buf + pos, sizeof(buf),			\
+		pos += snprintf(buf + pos, sizeof(buf) - pos,		\
 			 "[%d] = %d\n", i, stats->sub.name[i]);		\
 									\
 	return wl1271_format_buffer(userbuf, count, ppos, "%s", buf);	\
-- 
2.30.2

