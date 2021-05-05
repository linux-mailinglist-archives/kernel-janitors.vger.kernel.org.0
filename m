Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEA8374940
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 May 2021 22:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbhEEUVj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 May 2021 16:21:39 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:32358 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbhEEUVi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 May 2021 16:21:38 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d16 with ME
        id 18Lf2500B21Fzsu038Lf9L; Wed, 05 May 2021 22:20:41 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 05 May 2021 22:20:41 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     sakari.ailus@linux.intel.com, akinobu.mita@gmail.com,
        s.nawrocki@samsung.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: i2c: ov9650: Fix an error message
Date:   Wed,  5 May 2021 22:20:37 +0200
Message-Id: <067380a72bc900e184058d88b7d3247b95aee3f2.1620245957.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'ret' is known to be 0 here and printing -ENODEV wouldn't be really
helpful. So remove it from the error message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/ov9650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 4fe68aa55789..a9f13dc2f053 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1479,8 +1479,8 @@ static int ov965x_detect_sensor(struct v4l2_subdev *sd)
 		if (ov965x->id == OV9650_ID || ov965x->id == OV9652_ID) {
 			v4l2_info(sd, "Found OV%04X sensor\n", ov965x->id);
 		} else {
-			v4l2_err(sd, "Sensor detection failed (%04X, %d)\n",
-				 ov965x->id, ret);
+			v4l2_err(sd, "Sensor detection failed (%04X)\n",
+				 ov965x->id);
 			ret = -ENODEV;
 		}
 	}
-- 
2.30.2

