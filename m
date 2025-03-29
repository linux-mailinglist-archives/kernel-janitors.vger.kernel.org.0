Return-Path: <kernel-janitors+bounces-7640-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDAA754DC
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Mar 2025 08:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5C4188EB5E
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Mar 2025 07:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B127D18DB0D;
	Sat, 29 Mar 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gMqSk2Sb"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB5A179A7
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Mar 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234900; cv=none; b=cdOQs7+FWgNlPgsno3YiH1fNbcW3DVLTkZsv0zCjIFotFD2XNS4Ghl/25Boo/Ct3GjLW7QYYeqz67VxPiv6EV7tdkVjNaZkzDGTiZt5RnIt5ucEPvdWTQswXa7QOvtXuE//KrNHb0AX0bWlHCQVy9NSBAgrp8SQT4tpMN7ASNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234900; c=relaxed/simple;
	bh=duZT+wz2v9SXSXUndHbCY9Wa4VglcZG5ovPv+XecIc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMfKM9WjwT+yY0zxfjdTPHEaUYXFKvIzP+1ReEhYOcQ+utslIfgujJyYIC2uUxh+jv6LgaJRKB4wVJvDtb99BvGmv95vN/4KgWm3Rrb9sJRSd+njhRklIAj4ZcLGCXL+/Geg8aVrVGLKep2Wx+lmdiqx7lqHq+DdwCHj4ev9nf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=gMqSk2Sb; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtbteVkC; Sat, 29 Mar 2025 08:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234384;
	bh=388xrznfvx3yUimg5kNws/DNZuCQE1j80sB1rbo3xPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gMqSk2Sb96QmihcEfm2HH+vPYGVUcku53uvdvYXABZH++CMEHLYHCGS41nAOtVnnx
	 hdyCnNSeMgSTKbDo0nmbONgBqUrLnruKolB7Coxuy+XgG4J0Csg1vAd7+ll5rte7hI
	 DIXcQva1JvEQL8EjYqZiP80ZnqjZa/sf3rFqMCZZ0IxAYheyrfpOTNXxe81LbG/LE7
	 Te4kQ0JvtSWczjdjEoFS3qzrlVba4EXxKUgoj53l71j3b5KwrSpCi2AhIjqczF7C2H
	 YF9yRqYzzb5RaMTSgWtnZ+l0N0vZFBVGc0uNLf/91tG0HuMbKEZMSnG/Dr44kf5Mti
	 YujWgPBiN4FMw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:24 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	beomho.seo@samsung.com,
	ideal.song@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 4/4] mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
Date: Sat, 29 Mar 2025 08:45:48 +0100
Message-ID: <d224865a16b50498279b044a819e1e187d01bb28.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If devm_of_platform_populate() fails, some clean-up needs to be done, as
already done in the remove function.

Add the needed error handling path.

Fixes: c695abab2429 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/mfd/exynos-lpass.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 7fd8585ba35a..9f2601e4e583 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -118,6 +118,7 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct exynos_lpass *lpass;
 	void __iomem *base_top;
+	int ret;
 
 	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
 	if (!lpass)
@@ -143,7 +144,15 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	exynos_lpass_enable(lpass);
 
-	return devm_of_platform_populate(dev);
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		goto err_remove_exynos_lpass;
+
+	return 0;
+
+err_remove_exynos_lpass:
+	exynos_lpass_remove(pdev);
+	return ret;
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
-- 
2.49.0


