Return-Path: <kernel-janitors+bounces-634-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4280BC4B
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 18:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2E4B208C7
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Dec 2023 17:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6481863E;
	Sun, 10 Dec 2023 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iySQgHrO"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF4CBD
	for <kernel-janitors@vger.kernel.org>; Sun, 10 Dec 2023 09:17:15 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CNQWrHujroJwrCNQXrDwLo; Sun, 10 Dec 2023 18:17:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702228633;
	bh=aurnWtncV7Q1TSEkm/6CYQqUg0/hz67stY/BfmCeZBs=;
	h=From:To:Cc:Subject:Date;
	b=iySQgHrOimU8UrWY2H6752ATWXqMQfNcZmXjNkLTNmktMAtyBKNMFhhoMCZ/IJm50
	 2J8zeKjcPZXftwO4SpFc5sILyaWGXFxUIcpeUMnl9bJG44YlNeCTPm/guO1AEf53kZ
	 f0341g9cxYGLx33XdTVeq+YIPwda8m7yffQZkFOdOfJFJ0anR3trdeekzE9ZNJot1F
	 UYkyHs20FNDT3B+tFeytXAwUYJxfofJr45XJYIAQPfMHqeaHKeikDUS6x+XUV87R8P
	 SA1o++NwCM86wrLtFTRd8Y1y9ieOyu+KVm5ZpIBtxdm+kdu0RDX8KOH5MXuLztKS73
	 xQrhEwvIxHEeQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Dec 2023 18:17:13 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mux: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 10 Dec 2023 18:17:10 +0100
Message-Id: <727714bdfcd69d21e7f2a0c5c7426fcb70439b91.1702228605.git.christophe.jaillet@wanadoo.fr>
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
 drivers/mux/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 775816112932..78c0022697ec 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -64,7 +64,7 @@ static void mux_chip_release(struct device *dev)
 {
 	struct mux_chip *mux_chip = to_mux_chip(dev);
 
-	ida_simple_remove(&mux_ida, mux_chip->id);
+	ida_free(&mux_ida, mux_chip->id);
 	kfree(mux_chip);
 }
 
@@ -111,7 +111,7 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
 	mux_chip->dev.of_node = dev->of_node;
 	dev_set_drvdata(&mux_chip->dev, mux_chip);
 
-	mux_chip->id = ida_simple_get(&mux_ida, 0, 0, GFP_KERNEL);
+	mux_chip->id = ida_alloc(&mux_ida, GFP_KERNEL);
 	if (mux_chip->id < 0) {
 		int err = mux_chip->id;
 
-- 
2.34.1


