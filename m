Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70733381D50
	for <lists+kernel-janitors@lfdr.de>; Sun, 16 May 2021 09:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhEPHpj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 16 May 2021 03:45:39 -0400
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:39939 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhEPHpi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 May 2021 03:45:38 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d54 with ME
        id 5KkN2500G21Fzsu03KkNnW; Sun, 16 May 2021 09:44:23 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 May 2021 09:44:23 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch,
        ezequiel@collabora.com
Cc:     dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/virtgpu: Fix a resource leak in an error handling path
Date:   Sun, 16 May 2021 09:44:21 +0200
Message-Id: <6486962009b4ef496feeca565f2b9376daebac32.1621150940.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occurs after calling 'virtio_gpu_init()', 'virtio_gpu_deinit()'
must be called as already done in the remove function.

Fixes: d516e75c71c9 ("drm/virtio: Drop deprecated load/unload initialization")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 33bf5f53ae31..ca77edbc5ea0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -125,11 +125,13 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-		goto err_free;
+		goto err_deinit;
 
 	drm_fbdev_generic_setup(vdev->priv, 32);
 	return 0;
 
+err_deinit:
+	virtio_gpu_deinit(dev);
 err_free:
 	drm_dev_put(dev);
 	return ret;
-- 
2.30.2

