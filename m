Return-Path: <kernel-janitors+bounces-5461-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A094F97964D
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 Sep 2024 12:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1A4B1C20E30
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 Sep 2024 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69071C4629;
	Sun, 15 Sep 2024 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bmtKmoke"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-208.smtpout.orange.fr [193.252.23.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E41C3F3B
	for <kernel-janitors@vger.kernel.org>; Sun, 15 Sep 2024 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726395756; cv=none; b=KZxaZ2xeqIjXp+lvrKZTrnLzceKxEcbL0jpz3eRIg9KsczlXnCZx1tKOAv+U3UOboZUG6ntH8wLPo5rytjr6rYeeG2HGh4VdYQuHIvDlrFYAULkm1GEp5xAzv3GyYShKVYTJIm/R12HmP1VK6sJVi79S7OeocaKal6cQ5PpY6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726395756; c=relaxed/simple;
	bh=OU121EH3o4oNFUMkKEQJk2Axn51rBYd2m3eyMY5uI+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlF/lKH5Wy2+FbI4XT8XfJ+gn8GHJoHsBqrlHypkowhjxJxrw0t8fv5S+FVyM/6V4OILPJc8OOKRv+1JAOahx62QlCSE6qaVdBXndTQg8cU6FovSqc4SdBG9hyvnKNUPaomcJJ5AkP5XlW2rxb+ySVgl4jRHL5ID6wF200flTYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bmtKmoke; arc=none smtp.client-ip=193.252.23.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pmOdsbBSBEyYjpmOds4NCu; Sun, 15 Sep 2024 12:22:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726395746;
	bh=pf3gB7OINiM24+3hvi+hf8vNJkXkS4txKpVd54g/XEk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bmtKmokedW7XLT6H76D4hhh4SycDGMbapwut5bWGn8EZ78Pd2vzVs0WtPBqluEgMj
	 qMYDbadJ0Imru+KPx3ascteN4xiMHNpg+TlsybVPM9tbyef5lYU9H5vITEDqCaCUCd
	 5IPQJyHnABNT/yWfyRXgII6W3BAoza05EE7DnStniJ0nHG0km/oSIxcnH1v6nRQAWE
	 Z6Zg2glkYjswINBbeRTzfsPPpWe1pFHQJB1kc/aQIx37ELhsDVV/Lk8YBiwnvmowhQ
	 7O1fKecDUXjZyrUqVbJblBCdO5cVH2RIBql0UWHGa86GDfAUnTWh2Qfv6H5YsmXfd/
	 Q1/kSdUbexPnA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Sep 2024 12:22:26 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-crypto@vger.kernel.org
Subject: [PATCH 1/2] crypto: caam: Fix the pointer passed to caam_qi_shutdown()
Date: Sun, 15 Sep 2024 12:22:12 +0200
Message-ID: <c76ff86fe3ec40776646f4e5ebd5f0900ca48b37.1726395689.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type of the last parameter given to devm_add_action_or_reset() is
"struct caam_drv_private *", but in caam_qi_shutdown(), it is casted to
"struct device *".

Pass the correct parameter to devm_add_action_or_reset() so that the
resources are released as expected.

Fixes: f414de2e2fff ("crypto: caam - use devres to de-initialize QI")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative review with care.
---
 drivers/crypto/caam/qi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c
index f6111ee9ed34..8ed2bb01a619 100644
--- a/drivers/crypto/caam/qi.c
+++ b/drivers/crypto/caam/qi.c
@@ -794,7 +794,7 @@ int caam_qi_init(struct platform_device *caam_pdev)
 
 	caam_debugfs_qi_init(ctrlpriv);
 
-	err = devm_add_action_or_reset(qidev, caam_qi_shutdown, ctrlpriv);
+	err = devm_add_action_or_reset(qidev, caam_qi_shutdown, qidev);
 	if (err)
 		goto fail2;
 
-- 
2.46.0


