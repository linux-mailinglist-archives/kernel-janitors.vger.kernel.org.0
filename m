Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8629AABA
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2019 10:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393136AbfHWIwf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Aug 2019 04:52:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35579 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393110AbfHWIwf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Aug 2019 04:52:35 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i15J8-0006z2-K5; Fri, 23 Aug 2019 08:52:30 +0000
From:   Colin King <colin.king@canonical.com>
To:     Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
        linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>,
        netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] wimax/i2400m: fix calculation of index, remove sizeof
Date:   Fri, 23 Aug 2019 09:52:30 +0100
Message-Id: <20190823085230.6225-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The subtraction of the two pointers is automatically scaled by the
size of the size of the object the pointers point to, so the division
by sizeof(*i2400m->barker) is incorrect.  Fix this by removing the
division.  Also make index an unsigned int to clean up a checkpatch
warning.

Addresses-Coverity: ("Extra sizeof expression")
Fixes: aba3792ac2d7 ("wimax/i2400m: rework bootrom initialization to be more flexible")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wimax/i2400m/fw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wimax/i2400m/fw.c b/drivers/net/wimax/i2400m/fw.c
index 489cba9b284d..599a703af6eb 100644
--- a/drivers/net/wimax/i2400m/fw.c
+++ b/drivers/net/wimax/i2400m/fw.c
@@ -399,8 +399,7 @@ int i2400m_is_boot_barker(struct i2400m *i2400m,
 	 * associated with the device. */
 	if (i2400m->barker
 	    && !memcmp(buf, i2400m->barker, sizeof(i2400m->barker->data))) {
-		unsigned index = (i2400m->barker - i2400m_barker_db)
-			/ sizeof(*i2400m->barker);
+		unsigned int index = i2400m->barker - i2400m_barker_db;
 		d_printf(2, dev, "boot barker cache-confirmed #%u/%08x\n",
 			 index, le32_to_cpu(i2400m->barker->data[0]));
 		return 0;
-- 
2.20.1

