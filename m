Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E8397155
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Jun 2021 12:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhFAKXp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Jun 2021 06:23:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39655 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhFAKXo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 06:23:44 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lo1X7-0007kz-SD; Tue, 01 Jun 2021 10:22:01 +0000
From:   Colin King <colin.king@canonical.com>
To:     Eli Billauer <eli.billauer@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] char: xillybus: Fix spelling mistake "overflew" -> "overflowed"
Date:   Tue,  1 Jun 2021 11:22:01 +0100
Message-Id: <20210601102201.8489-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/xillybus/xillyusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 1e15706af749..2ec8eca3eeee 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1000,7 +1000,7 @@ static int process_bulk_in(struct xillybuffer *xb)
 			return -EIO; /* We got really unexpected data */
 
 		if (bytes != fifo_write(fifo, p, bytes, xilly_memcpy)) {
-			dev_err(dev, "Misbehaving FPGA overflew an upstream FIFO!\n");
+			dev_err(dev, "Misbehaving FPGA overflowed an upstream FIFO!\n");
 			return -EIO;
 		}
 
-- 
2.31.1

