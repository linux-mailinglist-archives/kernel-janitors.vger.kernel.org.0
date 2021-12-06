Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252284690F3
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Dec 2021 08:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238634AbhLFHwn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Dec 2021 02:52:43 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:33973 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238615AbhLFHwb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Dec 2021 02:52:31 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=guanjun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UzWv6id_1638776941;
Received: from localhost(mailfrom:guanjun@linux.alibaba.com fp:SMTPD_---0UzWv6id_1638776941)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 06 Dec 2021 15:49:01 +0800
From:   'Guanjun' <guanjun@linux.alibaba.com>
To:     mst@redhat.com, xieyongji@bytedance.com
Cc:     jasowang@redhat.com, virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/1] vduse: moving kvfree into caller
Date:   Mon,  6 Dec 2021 15:49:01 +0800
Message-Id: <1638776941-34156-1-git-send-email-guanjun@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Guanjun <guanjun@linux.alibaba.com>

This free action should be moved into caller 'vduse_ioctl' in
concert with the allocation.

No functional change.

Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index c9204c62f339..477a5a592002 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1355,7 +1355,6 @@ static int vduse_create_dev(struct vduse_dev_config *config,
 err_str:
 	vduse_dev_destroy(dev);
 err:
-	kvfree(config_buf);
 	return ret;
 }
 
@@ -1406,6 +1405,8 @@ static long vduse_ioctl(struct file *file, unsigned int cmd,
 		}
 		config.name[VDUSE_NAME_MAX - 1] = '\0';
 		ret = vduse_create_dev(&config, buf, control->api_version);
+		if (ret)
+			kvfree(buf);
 		break;
 	}
 	case VDUSE_DESTROY_DEV: {
-- 
2.27.0

