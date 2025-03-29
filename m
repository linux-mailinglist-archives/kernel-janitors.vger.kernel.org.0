Return-Path: <kernel-janitors+bounces-7641-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D59A754DD
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Mar 2025 08:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 972053B03AB
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Mar 2025 07:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82AA192B82;
	Sat, 29 Mar 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="toNjNc9z"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018E18BC36
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Mar 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234902; cv=none; b=SnBdxxMZ5yvjCsnwqWo/ZdCJhUMiatDBO7iPzqqnZk37gHrMqO1xyVrojd/e7cjExhvzE0Sh5AnllQT640yFaORs7pVlJq8GiNKLxJKO9XnugwDGCBjpZklS5Kf2nlbOp3/UXQ5E/Ba6rU8WuBcRppOHDOPOjqtpIyNA4CRMF4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234902; c=relaxed/simple;
	bh=hlhm6x1Iba11hQIC2ruSqILP/CL0rPLRG6ghhSeB+Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9uXtGDV3d9XBG6hzvWmwsQDqOEL9HWuvx7ssg3QMplmsPcfYHdiXGrXosmrio04nZV53mio8d5ImlXk+PmN9+joBSSQnKOZI5Re0dVomzJwy3lJWZeIac9w6Ih+kJ9E2M+ibJTg1Vw3DMb3KEOtJrXadcI9oOLsBQRik6OOxAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=toNjNc9z; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtateVht; Sat, 29 Mar 2025 08:46:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234382;
	bh=KNdM5ts0wg1oqDwj15hlgi9Z0FrXnMRdaahatqUkprE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=toNjNc9z8A13w9pHBhyEt10kmMSCVLOwaRh8sQqF0KYujLm1+4+ltUK4HTV9XFkrj
	 UN4Li0VoUiMJ/noc5zosYfrUn6njUPMRx7/d57sQ3WY57/tPnN8LfvYv0v/5W2OHJH
	 MUAIhS6t8WH6wQmD3FAs12yYUtIMx1RqJ4b1yzVseCkZ04ymljsucsUyZo9gHY2WQZ
	 aLk+9hoAuv/JmNQqTddLhoNqrI5bnraOaoT5I72SkRVlFpp99pb2ACnpjYJcjcNXl4
	 jc8siBqdnbwKPXdEB5PHr4j76eOE81PZOoNv5vUR+dx0bzcgtbOtx16rk+lgKJ87sP
	 oOnJcRteUfvhw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:22 +0100
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
Subject: [PATCH 3/4] mfd: exynos-lpass: Move exynos_lpass_remove()
Date: Sat, 29 Mar 2025 08:45:47 +0100
Message-ID: <1de670e6b9fa33cb81a34e5f882e79b80e479490.1743231856.git.christophe.jaillet@wanadoo.fr>
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

In order be able to call exynos_lpass_remove() from the error handling
path of the probe, it first needs to be moved before the probe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/exynos-lpass.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index a2785ceea8bf..7fd8585ba35a 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -104,6 +104,15 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.fast_io	= true,
 };
 
+static void exynos_lpass_remove(struct platform_device *pdev)
+{
+	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		exynos_lpass_disable(lpass);
+}
+
 static int exynos_lpass_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -137,15 +146,6 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(dev);
 }
 
-static void exynos_lpass_remove(struct platform_device *pdev)
-{
-	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		exynos_lpass_disable(lpass);
-}
-
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
 {
 	struct exynos_lpass *lpass = dev_get_drvdata(dev);
-- 
2.49.0


