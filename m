Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F67146F666
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Dec 2021 23:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbhLIWGk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Dec 2021 17:06:40 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:53086 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhLIWGj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Dec 2021 17:06:39 -0500
Received: from ubuntu-CJ.sitez.s.ibrowse.com ([146.0.31.27])
        by smtp.orange.fr with ESMTPA
        id vRVGmeNDKMNzvvRVHmHIOZ; Thu, 09 Dec 2021 23:03:04 +0100
X-ME-Helo: ubuntu-CJ.sitez.s.ibrowse.com
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 09 Dec 2021 23:03:04 +0100
X-ME-IP: 146.0.31.27
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm: Remove some useless memset
Date:   Thu,  9 Dec 2021 23:03:00 +0100
Message-Id: <bdde4a5fd5337deb84b7d9e530e7bc83ef17ebec.1639087275.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'bufs' is an array embedded in an structure (struct drm_device_dma) which
is kzalloc just a few lines above.
So there is no need to explicitly memset each element on the array. It is
already cleared.

Remove the useless memset.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/drm_dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index eb6b741a6f99..df4837dc5030 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -51,8 +51,6 @@
  */
 int drm_legacy_dma_setup(struct drm_device *dev)
 {
-	int i;
-
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA) ||
 	    !drm_core_check_feature(dev, DRIVER_LEGACY))
 		return 0;
@@ -64,9 +62,6 @@ int drm_legacy_dma_setup(struct drm_device *dev)
 	if (!dev->dma)
 		return -ENOMEM;
 
-	for (i = 0; i <= DRM_MAX_ORDER; i++)
-		memset(&dev->dma->bufs[i], 0, sizeof(dev->dma->bufs[0]));
-
 	return 0;
 }
 
-- 
2.32.0

