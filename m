Return-Path: <kernel-janitors+bounces-643-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83A80BC76
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 18:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9A39280C63
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 17:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A4419BD9;
	Sun, 10 Dec 2023 17:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mkWMq5TB"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCCBFA
	for <kernel-janitors@vger.kernel.org>; Sun, 10 Dec 2023 09:51:57 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CNy4r77eNxqX7CNy4r8b6X; Sun, 10 Dec 2023 18:51:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702230716;
	bh=I+oLHrfSteD1fM5wZcNGUaFi+cT/ZUrP8W7m+tITsR4=;
	h=From:To:Cc:Subject:Date;
	b=mkWMq5TBbq7Mt5b0vqjmNsCy44MG2vlYUyENYi5GtepUNxLqKPZnXgx5x90e79Xu4
	 kK3Vk+ulADvk2FkP248VX7Nx2QyglnFw5TqYDsn7aN28tqEIrdMloZ/tBfOAmG2DDf
	 JD5mPXyCkPWtBy3/fQJZosYogQcBjzVHqnHODhTGFHouy6YOb+U5QaYoo5F6B0faif
	 slLqRoNkhCuRZx2G+d93TRM2X94o1VS/eKxPUpdPyykrBBfePH5piqer/h0nY4WPvy
	 hJCBt1nMacbOMxAbnocPtbXHqgW195NJCgVcgIZOC0ptbTnaXsbiV3IvRJpOGXEn3r
	 kN/rjptAc/3Ug==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Dec 2023 18:51:56 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	virtualization@lists.linux.dev
Subject: [PATCH] vdpa: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 10 Dec 2023 18:51:50 +0100
Message-Id: <d7534cc4caf4ff9d6b072744352c1b69487779ea.1702230703.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/vdpa/vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index a7612e0783b3..d0695680b282 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -131,7 +131,7 @@ static void vdpa_release_dev(struct device *d)
 	if (ops->free)
 		ops->free(vdev);
 
-	ida_simple_remove(&vdpa_index_ida, vdev->index);
+	ida_free(&vdpa_index_ida, vdev->index);
 	kfree(vdev->driver_override);
 	kfree(vdev);
 }
@@ -205,7 +205,7 @@ struct vdpa_device *__vdpa_alloc_device(struct device *parent,
 	return vdev;
 
 err_name:
-	ida_simple_remove(&vdpa_index_ida, vdev->index);
+	ida_free(&vdpa_index_ida, vdev->index);
 err_ida:
 	kfree(vdev);
 err:
-- 
2.34.1


