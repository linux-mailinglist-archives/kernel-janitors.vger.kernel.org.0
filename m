Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B22C0B1588
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Sep 2019 22:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfILUoz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Sep 2019 16:44:55 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:35055 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbfILUoz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Sep 2019 16:44:55 -0400
Received: from localhost.localdomain ([90.126.97.183])
        by mwinf5d20 with ME
        id 0kkr2100K3xPcdm03kkrw4; Thu, 12 Sep 2019 22:44:52 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 12 Sep 2019 22:44:52 +0200
X-ME-IP: 90.126.97.183
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mripard@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'
Date:   Thu, 12 Sep 2019 22:44:50 +0200
Message-Id: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.

Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
could also be a good candidate.
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 31ace114eda1..28765ccb1b12 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -129,7 +129,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 */
 	for (i = csi2rx->num_lanes; i < csi2rx->max_lanes; i++) {
 		unsigned int idx = find_first_zero_bit(&lanes_used,
-						       sizeof(lanes_used));
+						       BITS_PER_LONG);
 		set_bit(idx, &lanes_used);
 		reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, i + 1);
 	}
-- 
2.20.1

