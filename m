Return-Path: <kernel-janitors+bounces-8536-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E554DAF9EEF
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Jul 2025 09:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C22C5437BD
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Jul 2025 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E27D289E1B;
	Sat,  5 Jul 2025 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OkbVjjqG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16001289376
	for <kernel-janitors@vger.kernel.org>; Sat,  5 Jul 2025 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702356; cv=none; b=ppUBCovKuSLNkEqwW/wVc+Hh0CaL6fsPOBqD0cAxqIzMKsZ9UkehTO27GIPiY3O3wxu3DT791Xaz9QqnSf97QOETtTTGxOo3SFDJ3SBEvaijB8BksNCTcJodF0uPQxSyqINxn+uWaXbLlAV+QEWbOkXe3UidOYYGODj/4WeUnTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702356; c=relaxed/simple;
	bh=RubWeoGD7YmfAjBkG9mnREmRf9RsDJcz+ZcKpddWwKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBDUfq5qu7yIv4w7mLB6otD5npD32JvK5CEBPDyUJa83/qffjxBgOLwRObd5dylcOi2stbkkXBuPBoG6tJo746TI3GkVTWIrQSTkSrhrZTH/HjLTiCkb9w5h3OhHkzHQs1hi7cFbGytR4cE3hp2KyaSv5bjK+TNHlyfu5AIvC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OkbVjjqG; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XxmRuIndJIhD3XxmouGNfJ; Sat, 05 Jul 2025 09:58:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751702295;
	bh=Gh+K9CUjRI08vkOxjKoTjZXj+DSeFO94gLVQU5XQqQU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OkbVjjqG19/dFr73A0TxfxrRKajx2MBtWxK7Jw7jCXI0cPVIhNWTwc36UfnTfuJWM
	 8B1dwmIjQeJYZObqgUqrj+jbtdt4WfMxWwRPOz4lPupKr6+a2x6fedZz1P6/ehEBzP
	 7KcYCX731nWY/qOmEG7ql4esHvTVTvsKYnqu37VXnXm+dfuP4KfeZO6FSNaMb8NtNn
	 znkwPjpQZkAXazQMnDVovKoUQSVV68xxKKAoSiRmx1kjE/8lGwZUGkpNv7UBt/qcnB
	 T7C0CtW4G0fh6yBHZZ4NH2HFpmr5jzpoY3ggqoHuYQPxHonv1Hakko7grDgp6T6Xvr
	 gwmkfb7l6Lmow==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 09:58:15 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	andi.shyti@kernel.org,
	miaoqinglang@huawei.com,
	grygorii.strashko@ti.com,
	wsa@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] i2c: omap: Fix an error handling path in omap_i2c_probe()
Date: Sat,  5 Jul 2025 09:57:38 +0200
Message-ID: <af8a9b62996bebbaaa7c02986aa2a8325ef11596.1751701715.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after pm_runtime_use_autosuspend(), a corresponding
pm_runtime_dont_use_autosuspend() should be called.

In case of error in pm_runtime_resume_and_get(), it is not the case because
the error handling path is wrongly ordered.
Fix it.

Fixes: 780f62974125 ("i2c: omap: fix reference leak when pm_runtime_get_sync fails")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 485313d872e5..ef1193e0e62d 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1523,9 +1523,9 @@ omap_i2c_probe(struct platform_device *pdev)
 	if (omap->mux_state)
 		mux_state_deselect(omap->mux_state);
 err_put_pm:
-	pm_runtime_dont_use_autosuspend(omap->dev);
 	pm_runtime_put_sync(omap->dev);
 err_disable_pm:
+	pm_runtime_dont_use_autosuspend(omap->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return r;
-- 
2.50.0


