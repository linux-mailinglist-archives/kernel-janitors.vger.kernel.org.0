Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DA21A52D0
	for <lists+kernel-janitors@lfdr.de>; Sat, 11 Apr 2020 18:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgDKQHy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 11 Apr 2020 12:07:54 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:59091 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgDKQHy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 11 Apr 2020 12:07:54 -0400
Received: from localhost.localdomain ([90.126.162.40])
        by mwinf5d41 with ME
        id RU7r2200N0scBcy03U7rZa; Sat, 11 Apr 2020 18:07:53 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 Apr 2020 18:07:53 +0200
X-ME-IP: 90.126.162.40
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, NShubin@topcon.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] remoteproc: Add missing '\n' in log messages
Date:   Sat, 11 Apr 2020 18:07:50 +0200
Message-Id: <20200411160750.32573-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 791c13b709dd ("remoteproc: Fix NULL pointer dereference in rproc_virtio_notify")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/remoteproc/remoteproc_virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index b48b78e00284..0d4cc0fc5858 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -337,8 +337,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	if (rproc->ops->kick == NULL) {
 		ret = -EINVAL;
-		dev_err(dev, ".kick method not defined for %s",
-				rproc->name);
+		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
 		goto out;
 	}
 
-- 
2.20.1

