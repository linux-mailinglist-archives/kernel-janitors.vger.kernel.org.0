Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B50A36F619
	for <lists+kernel-janitors@lfdr.de>; Sun, 21 Jul 2019 23:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfGUVgE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 21 Jul 2019 17:36:04 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:23106 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfGUVgE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 21 Jul 2019 17:36:04 -0400
Received: from localhost.localdomain ([92.140.204.221])
        by mwinf5d11 with ME
        id fZc0200024n7eLC03Zc0MN; Sun, 21 Jul 2019 23:36:02 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 23:36:02 +0200
X-ME-IP: 92.140.204.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net, tglx@linutronix.de, alexios.zavras@intel.com,
        gregkh@linuxfoundation.org, kstewart@linuxfoundation.org
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] iio: magnetometer: mmc35240: Fix a typo in the name of a constant
Date:   Sun, 21 Jul 2019 23:35:33 +0200
Message-Id: <20190721213533.9214-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Everything is about mmc35240_ except MMC53240_WAIT_SET_RESET (3 and 5
switched).

This is likely a typo. Define and use MMC35240_WAIT_SET_RESET instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/magnetometer/mmc35240.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 7de10281ad9e..425cdd07b4e5 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -53,7 +53,7 @@
 #define MMC35240_CTRL1_BW_SHIFT		0
 
 #define MMC35240_WAIT_CHARGE_PUMP	50000	/* us */
-#define MMC53240_WAIT_SET_RESET		1000	/* us */
+#define MMC35240_WAIT_SET_RESET		1000	/* us */
 
 /*
  * Memsic OTP process code piece is put here for reference:
@@ -225,7 +225,7 @@ static int mmc35240_init(struct mmc35240_data *data)
 	ret = mmc35240_hw_set(data, true);
 	if (ret < 0)
 		return ret;
-	usleep_range(MMC53240_WAIT_SET_RESET, MMC53240_WAIT_SET_RESET + 1);
+	usleep_range(MMC35240_WAIT_SET_RESET, MMC35240_WAIT_SET_RESET + 1);
 
 	ret = mmc35240_hw_set(data, false);
 	if (ret < 0)
-- 
2.20.1

