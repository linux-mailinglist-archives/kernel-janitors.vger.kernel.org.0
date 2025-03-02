Return-Path: <kernel-janitors+bounces-7259-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602CA4B319
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Mar 2025 17:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 359FE188BDDD
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Mar 2025 16:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE6F1EB187;
	Sun,  2 Mar 2025 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="WZKfENVw"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5D1E9B33
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932585; cv=none; b=ogA4Bbf5Khee5MudhUYRtG3Y1ygXiX938qEGzzd65LQv1aseBznbn0vHxqxGFjt7AJDbXGY23ViiOSThMy049N+Pjoo6dD4PMrWr3/vE6JuMh7cdMkFvnM9O/+fLMCCugvsqRm/mPRTGh7G8VCPe9fyKtpWozRqw02N6zWuHfe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932585; c=relaxed/simple;
	bh=fsTld9oZlagzwO1jLAdAh7LD4Z7V5RpIOEJifrFD6wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxtnE2NJCxh5HFY/bzHaE+vyeTXdHBDDBD8L8XZrIrY4QLNxAkEjNaCISMMjJnZ0KOrxdR83zHINemlfbRs6zcf8K8jpZWTAvZ27RUC8OyjyHpBu2LvAqas/JHh1ddymzO/8RCD8KprGC9aeoVlL53Zb5/NkTowflBQtn3sm3uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=WZKfENVw; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id om4YtTJnYVX8Kom4ntOvxG; Sun, 02 Mar 2025 17:22:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740932521;
	bh=mMxtNjaN1D/JnAddRo1l6ksJqaO6xXpwl4cipUHLflM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WZKfENVwhxUj6v4nxcNGyjBX+j+upnfCMMF4zedaTfdezmQZOAJQzYR7vnnE3ZqkL
	 E5Qr5nDtDvl4LNVgCHlJStd++9UYQHzaQ8PRvn2kqN7onrZGCRQR/OTaSzm4Kw5sPW
	 lv2mL+sB5nTdUKeVBewOyy2uL5xrpGgOugU9k05ZYV/yYi+q/LPkj4fuQXU0ZQhF1r
	 MSQdDAABsNB7dMU8iY2166YBUzTeFNcJHi1qxzYC9BXbX+0RpcnSk5hsK2ab1mBF3T
	 GLiAB5C6zrfeTdEX/j4RKefeVBvqQ8ucvwS90GDqU3f3OEhTSqRtVYpHV14IHUzDSL
	 rFxpPy4T7Zeew==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 17:22:01 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andersson@kernel.org,
	Michael.Srba@seznam.cz,
	konradybcio@kernel.org,
	jeffrey.l.hugo@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] bus: qcom-ssc-block-bus: Fix the error handling path of qcom_ssc_block_bus_probe()
Date: Sun,  2 Mar 2025 17:21:35 +0100
Message-ID: <1b89ec7438c9a893c09083e8591772c8ad3cb599.1740932040.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
References: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If qcom_ssc_block_bus_pds_enable() fails, the previous call to
qcom_ssc_block_bus_pds_attach() must be undone, as already done in the
remove function.

In order to do that, move the code related to the power domains management
to the end of the function, in order to avoid many changes in all the error
handling path that would need to go through the new error handling path.

Fixes: 97d485edc1d9 ("bus: add driver for initializing the SSC bus on (some) qcom SoCs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.

It is also speculative. Power management interaction can be sometimes
tricky and I'm not 100% sure that moving this code in fine.

Review with care.
---
 drivers/bus/qcom-ssc-block-bus.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index c95a985e3498..7f5fd4e0940d 100644
--- a/drivers/bus/qcom-ssc-block-bus.c
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -264,18 +264,6 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	data->pd_names = qcom_ssc_block_pd_names;
-	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
-
-	/* power domains */
-	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
-
-	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
-
 	/* low level overrides for when the HW logic doesn't "just work" */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
 	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
@@ -343,11 +331,30 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 
 	data->ssc_axi_halt = halt_args.args[0];
 
+	/* power domains */
+	data->pd_names = qcom_ssc_block_pd_names;
+	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
+
+	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
+
+	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
+	if (ret < 0) {
+		dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
+		goto err_detach_pds_bus;
+	}
+
 	qcom_ssc_block_bus_init(&pdev->dev);
 
 	of_platform_populate(np, NULL, NULL, &pdev->dev);
 
 	return 0;
+
+err_detach_pds_bus:
+	qcom_ssc_block_bus_pds_detach(&pdev->dev, data->pds, data->num_pds);
+
+	return ret;
 }
 
 static void qcom_ssc_block_bus_remove(struct platform_device *pdev)
-- 
2.48.1


