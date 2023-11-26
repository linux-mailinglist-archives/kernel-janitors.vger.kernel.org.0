Return-Path: <kernel-janitors+bounces-438-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E027F91C8
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Nov 2023 09:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AA8C281222
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Nov 2023 08:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BDE613D;
	Sun, 26 Nov 2023 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pXlPEQDb"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D9C119
	for <kernel-janitors@vger.kernel.org>; Sun, 26 Nov 2023 00:08:39 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 7ABkrYL9QVgeS7ABtr7Ror; Sun, 26 Nov 2023 09:08:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700986119;
	bh=lh71l96E6zVf9+1IM040Rgb2giV9A1CJHlxg8pa/sT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pXlPEQDb8VmLZKUDWPEkg5SPAXTKe8Pw0JQXpfdEqlBz1yixrApVXYGyRNe8ZnpDF
	 UoZuNFKpft6AVYekTzvYwyPX39x7c1y61/y+ep6xQ5LbArwjVD5iz2DWZwAJjoMch5
	 onCEt6jb+Y0+r1KtbnWYe3My637GRNU2tyrsctscZ+bZamd2Z38JEPEIkrITexykV/
	 6cJVhdLRh4sGpMhIfAYu53utWZ7lCChICy7ceGXGdovEDugAzgAyiNzBvDH4mpOJ3Y
	 H6AeOYumd5NIVpddrxPODXrTPtxJSnV2f+sSMOWruquMRuvaemiEW9Qj5tUhj00Dux
	 3Dz/L1NriyoEg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Nov 2023 09:08:39 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] mux: Slightly reorder 'struct mux_chip'
Date: Sun, 26 Nov 2023 09:08:12 +0100
Message-Id: <90be77e27b96d47acc9f20416d8fdc01f9cb601b.1700986053.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d17bd9b622dbe3f7cb2f18736ef3138a6927f86c.1700986053.git.christophe.jaillet@wanadoo.fr>
References: <d17bd9b622dbe3f7cb2f18736ef3138a6927f86c.1700986053.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on pahole, 2 holes can be combined in the 'struct mux_chip'. This
saves 8 bytes in the structure on my x86_64.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/mux/driver.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
index c29e9b7fb17b..09d519af521b 100644
--- a/include/linux/mux/driver.h
+++ b/include/linux/mux/driver.h
@@ -56,15 +56,15 @@ struct mux_control {
 /**
  * struct mux_chip -	Represents a chip holding mux controllers.
  * @controllers:	Number of mux controllers handled by the chip.
- * @dev:		Device structure.
  * @id:			Used to identify the device internally.
+ * @dev:		Device structure.
  * @ops:		Mux controller operations.
  * @mux:		Array of mux controllers that are handled.
  */
 struct mux_chip {
 	unsigned int controllers;
-	struct device dev;
 	int id;
+	struct device dev;
 
 	const struct mux_control_ops *ops;
 
-- 
2.34.1


