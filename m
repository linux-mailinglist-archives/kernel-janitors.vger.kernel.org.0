Return-Path: <kernel-janitors+bounces-1318-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17282E1DF
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jan 2024 21:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4BDBB221AA
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jan 2024 20:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3799E1AAD1;
	Mon, 15 Jan 2024 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="XgiFkJEo"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5EF1AAB9
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jan 2024 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id PTiQrb8lK37BnPTiQr8XQD; Mon, 15 Jan 2024 21:37:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705351072;
	bh=Xa4nvawba60HUR0P1FCCDS06tiKtKDZP0zKrGfgiTkY=;
	h=From:To:Cc:Subject:Date;
	b=XgiFkJEo2ub61G5YlQpZarbASRDD86oA15wjrBLzTK4MOr5V+S3hz2DHJB+KtkHDg
	 ChJQNMQDW/tfZTRvYSnJFscozPBSwuvjkannYzZI7z+8i/x9fTuYcIe155aJ/tT666
	 osCDiU9IG4jL6udoCDlQr98HvKrewzzgrqfhb1frhXRPJMN5/mlQ1cazHfywA3r1Qt
	 5fXIb2OMJekEpS5cMC4TDJkrJSmOl7Dvs+5BI/2pOqA+PzLFOkc8zKv4cQAZP0D7z0
	 RH46qmQIDlzjKVud8nv0p4UPsN805imMwPWoYl5Z6mGsZ53fx9pJzN9ScB3nI7jAjE
	 NVJN0SeSikHpw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Jan 2024 21:37:52 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ceph-devel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH] rbd: Remove usage of the deprecated ida_simple_xx() API
Date: Mon, 15 Jan 2024 21:37:47 +0100
Message-ID: <7d98d8d45a89fc2434dd71d573fe4c6986986513.1705351057.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, buInputt the one of
ida_alloc_max() is inclusive. So a -1 has been added when needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/block/rbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index a999b698b131..63897d0d6629 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -5326,7 +5326,7 @@ static void rbd_dev_release(struct device *dev)
 
 	if (need_put) {
 		destroy_workqueue(rbd_dev->task_wq);
-		ida_simple_remove(&rbd_dev_id_ida, rbd_dev->dev_id);
+		ida_free(&rbd_dev_id_ida, rbd_dev->dev_id);
 	}
 
 	rbd_dev_free(rbd_dev);
@@ -5402,9 +5402,9 @@ static struct rbd_device *rbd_dev_create(struct rbd_client *rbdc,
 		return NULL;
 
 	/* get an id and fill in device name */
-	rbd_dev->dev_id = ida_simple_get(&rbd_dev_id_ida, 0,
-					 minor_to_rbd_dev_id(1 << MINORBITS),
-					 GFP_KERNEL);
+	rbd_dev->dev_id = ida_alloc_max(&rbd_dev_id_ida,
+					minor_to_rbd_dev_id(1 << MINORBITS) - 1,
+					GFP_KERNEL);
 	if (rbd_dev->dev_id < 0)
 		goto fail_rbd_dev;
 
@@ -5425,7 +5425,7 @@ static struct rbd_device *rbd_dev_create(struct rbd_client *rbdc,
 	return rbd_dev;
 
 fail_dev_id:
-	ida_simple_remove(&rbd_dev_id_ida, rbd_dev->dev_id);
+	ida_free(&rbd_dev_id_ida, rbd_dev->dev_id);
 fail_rbd_dev:
 	rbd_dev_free(rbd_dev);
 	return NULL;
-- 
2.43.0


