Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5502F586120
	for <lists+kernel-janitors@lfdr.de>; Sun, 31 Jul 2022 21:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbiGaT6E (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 31 Jul 2022 15:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbiGaT6D (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 31 Jul 2022 15:58:03 -0400
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr [80.12.242.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49C7DF87
        for <kernel-janitors@vger.kernel.org>; Sun, 31 Jul 2022 12:58:01 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id IF4YopDbmkootIF4Zoa9NM; Sun, 31 Jul 2022 21:58:00 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 31 Jul 2022 21:58:00 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Deepak Rawat <drawat.floss@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] hyperv_setup_vram() calls vmbus_allocate_mmio(). This must be undone in the error handling path of the probe, as already done in the remove function.
Date:   Sun, 31 Jul 2022 21:57:57 +0200
Message-Id: <1781855facffbdba640ce2da3649cac424e76fed.1659297462.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This patch depends on	commit a0ab5abced55 ("drm/hyperv : Removing the
restruction of VRAM allocation with PCI bar size").
Without it, something like what is done in commit e048834c209a
("drm/hyperv: Fix device removal on Gen1 VMs") should be done.

Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 6d11e7938c83..fc8b4e045f5d 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -133,7 +133,6 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 	}
 
 	ret = hyperv_setup_vram(hv, hdev);
-
 	if (ret)
 		goto err_vmbus_close;
 
@@ -150,18 +149,20 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 
 	ret = hyperv_mode_config_init(hv);
 	if (ret)
-		goto err_vmbus_close;
+		goto err_free_mmio;
 
 	ret = drm_dev_register(dev, 0);
 	if (ret) {
 		drm_err(dev, "Failed to register drm driver.\n");
-		goto err_vmbus_close;
+		goto err_free_mmio;
 	}
 
 	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
 
+err_free_mmio:
+	vmbus_free_mmio(hv->mem->start, hv->fb_size);
 err_vmbus_close:
 	vmbus_close(hdev->channel);
 err_hv_set_drv_data:
-- 
2.34.1

