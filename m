Return-Path: <kernel-janitors+bounces-105-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379417DE450
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 16:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7224F1C20DBE
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 15:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081714291;
	Wed,  1 Nov 2023 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dOSSpP4v"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A5413ACA
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 15:58:09 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5731A102
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 08:58:08 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id yDbZq0T7ydFbKyDbaqoC18; Wed, 01 Nov 2023 16:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698854286;
	bh=i21kCUborbDIm4AbDPL2tQN3AqBRzOGB4lpH+Cd5dY8=;
	h=From:To:Cc:Subject:Date;
	b=dOSSpP4vQt0MNdHx9PyLyIAn38jj8YspPHjD2QCCUf9Uxsof8mzZ3pfM3ULTChpMu
	 0IjIVsFBWuzWIjTIBOIOCp/PW9+q1UKBOgNU4UTcdyhrrxRz7zD3BB9+kBk+NCtMPu
	 mK3Re2YadiLmgBGIKlren4V71eaOizgHLuf/z2ZMKEI+m3fnoSWWoTbXYPFOUkGPT0
	 J+Ks83hInGhi5lEtFbAQal/dujHm6jAcqZSxpJ0+yM5Lh7CdKR1ZoaM8PPEzsuMxOM
	 gnMYGrfHWx+H9mNmaTQ68TbutnjMeC9hDytjv3V1RbedSFaznZYXFwgLAE7LpRIqt1
	 2VdzsVliFMI6w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 16:58:06 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-phy@lists.infradead.org
Subject: [PATCH] phy: core: Remove usage of the deprecated ida_simple_xx() API
Date: Wed,  1 Nov 2023 16:57:57 +0100
Message-Id: <d2323636c6cd2ec22f73a0ae6c2d34ac99b4abd5.1698854255.git.christophe.jaillet@wanadoo.fr>
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
 drivers/phy/phy-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 96a0b1e111f3..d9be6a4d5383 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -959,7 +959,7 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 	if (!phy)
 		return ERR_PTR(-ENOMEM);
 
-	id = ida_simple_get(&phy_ida, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&phy_ida, GFP_KERNEL);
 	if (id < 0) {
 		dev_err(dev, "unable to get id\n");
 		ret = id;
@@ -1232,7 +1232,7 @@ static void phy_release(struct device *dev)
 	dev_vdbg(dev, "releasing '%s'\n", dev_name(dev));
 	debugfs_remove_recursive(phy->debugfs);
 	regulator_put(phy->pwr);
-	ida_simple_remove(&phy_ida, phy->id);
+	ida_free(&phy_ida, phy->id);
 	kfree(phy);
 }
 
-- 
2.34.1


