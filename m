Return-Path: <kernel-janitors+bounces-5462-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF16979655
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 Sep 2024 12:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B90D91F21EB0
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 Sep 2024 10:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573F319ADB9;
	Sun, 15 Sep 2024 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bYwi5Jui"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A5946C
	for <kernel-janitors@vger.kernel.org>; Sun, 15 Sep 2024 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726396291; cv=none; b=Grn/DpPuZCmkoQ+iIV0e1fUUQbAHyIuL+hYvaaGHpkRSOg8DmigS+XnlJSe0inuEPT8qpfmS8alcqjJWK40cmpEtyn2Tf0+rA5HwmvqiaTgC+W2GbL46G5c8zjCLqplMgS0sOVnAxpEBgY9M9PAKxWl3rRTdeqY7G8p8McIuF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726396291; c=relaxed/simple;
	bh=S74zkBCTJVoMvfgdF3C8kbmEEtlOZke6fPgWm/7apxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb3ervXhqlv9FGfp/EWyWEzxDxYo+oswbevhs1iyecOoJ0+yxQsGE0VJ1qbjoyZSuqQs+WezwVB4Qr4Qy45Ep9rPVthcvlSlVflos8/PCSBfzTVoJb8XGRp2uGKsdsO0zKp+eDVLIGwllZiPL4UjpYuXn7mg4H3Q9+Nguq7vIAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bYwi5Jui; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pmOdsbBSBEyYjpmOjs4NDf; Sun, 15 Sep 2024 12:22:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726395750;
	bh=QJU9nstI/6k1pq+QgbDB9umkGIEs7lvcbyaDAjb6GFA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bYwi5JuiVnX7Uxf1k9AANeU5InksWPESh2I3OXVqhDQUe5fcHmS9qtJwoSmHO3sSc
	 kmCxh15yDntdRBLPrwFRvMUOYToMPXvFEWl/3ZfyMRE0jxuCRyaQ7FO6n6XxXHJXKF
	 QjdXZiAID4h9ezA65mr0kWaLV6ITSJW4fn7Sjlu0Edw4gPI/ArUfihjmkorK5viseV
	 x7aOXTkeRoL5GNdLjWggDjmaRO10bKWOAcHnDq/9Tqou7gu7vlHvZxsRssP2XgHVpN
	 ZLHr5L3iQ5gjYtmU3n8jHDU0QA5VekHoLj5XNG7nQyx7YSulBntSMO4WsMzL57Hb+1
	 upMZTpu5q6TEw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Sep 2024 12:22:30 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-crypto@vger.kernel.org
Subject: [PATCH 2/2] crypto: caam: Slightly simplify platform_device()
Date: Sun, 15 Sep 2024 12:22:13 +0200
Message-ID: <27c5e9ef2c4b1d40470e4ea41988840e5d12926c.1726395689.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <c76ff86fe3ec40776646f4e5ebd5f0900ca48b37.1726395689.git.christophe.jaillet@wanadoo.fr>
References: <c76ff86fe3ec40776646f4e5ebd5f0900ca48b37.1726395689.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'ctrldev' and 'qidev' are the same.
Remove the former to slightly simplify the code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is a follow up to commit 6b175685b4a1 ("crypto: caam/qi - don't
allocate an extra platform device")
---
 drivers/crypto/caam/qi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c
index 8ed2bb01a619..7701d00bcb3a 100644
--- a/drivers/crypto/caam/qi.c
+++ b/drivers/crypto/caam/qi.c
@@ -733,7 +733,7 @@ static void free_caam_qi_pcpu_netdev(const cpumask_t *cpus)
 int caam_qi_init(struct platform_device *caam_pdev)
 {
 	int err, i;
-	struct device *ctrldev = &caam_pdev->dev, *qidev;
+	struct device *qidev = &caam_pdev->dev;
 	struct caam_drv_private *ctrlpriv;
 	const cpumask_t *cpus = qman_affine_cpus();
 	cpumask_var_t clean_mask;
@@ -742,8 +742,7 @@ int caam_qi_init(struct platform_device *caam_pdev)
 	if (!zalloc_cpumask_var(&clean_mask, GFP_KERNEL))
 		goto fail_cpumask;
 
-	ctrlpriv = dev_get_drvdata(ctrldev);
-	qidev = ctrldev;
+	ctrlpriv = dev_get_drvdata(qidev);
 
 	/* Initialize the congestion detection */
 	err = init_cgr(qidev);
-- 
2.46.0


