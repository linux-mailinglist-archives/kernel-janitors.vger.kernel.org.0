Return-Path: <kernel-janitors+bounces-4403-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA691CBDF
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 11:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6976AB21635
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 09:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6ADE3BBF4;
	Sat, 29 Jun 2024 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GLm2aW9j"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB33BB25
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Jun 2024 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719652795; cv=none; b=rWPJ+62FkIk7Tam1cb8/5RkbmDzH0Fd2imXHdJKw7aTDWD9VEDoqnvBDA/iYo5ZQDFLZlfpH2lgzqP4bJlRHhkdF2Q0pOzf3YSoDMdHcPdvovdOzI8DN+kI2PPLGlW38yOoGo2Yl5S9nNnZw+SdA91xsYpVlls6uZ0Cg+JlXxfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719652795; c=relaxed/simple;
	bh=JEqQTXN7i/UpjDTg0v2GMhy06AEN/B1xTgSE3FEecGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYfj2i0wJUye/UNQUnNFIhMsWUYKFLgjBWGRWI7NCmsHBx7GgX34Yofem+7kOJPM19GJSI2s1/wkieZI+iYeMiQHzL4joBaHV5sF5vbbZ+zr+l2am8XU695jd8z6BXnFvPW7Q1Qe8VV3Qqp4qAu7WYn9gQ8UXVe1gssApNroWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GLm2aW9j; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUFFs5cqZ; Sat, 29 Jun 2024 11:19:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652785;
	bh=SbC8eskPoxKJ+eN2Qq7W2GaCgbxx29oD7K2szf1j0QE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GLm2aW9jAdL1vITOmoKJ22fGy+4A6bXXIupEbaVhXFBjWbK4tAcN7p6wrh9akuhCi
	 9DIgF6Sgqyauc36H8w9LgJ3GDogS4OEERhmEcl6Bj9ASurrX+/k0Y+ZKl8xWSmXVB4
	 dMI678AoM5hbZYzDdRewj11b8KefFRB5pCdE0cI8KUmt++9xIN1XHYdpPdoY6uTVJH
	 tCGxCg6XRMKq6KoO1Wtw+H2uuPax70nAM/klCzp2ru/6xNMiIStjHNvJlbaURU7gd2
	 oE9Kt1a+VQlPW/1VBalZD1kANRAfeafe7iFBxr9hR3hEFQuO73Zx2A2C0XiJGBiRYH
	 Nk80KScPP8b9A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:45 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fparent@baylibre.com,
	fchiby@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 4/4] soc: mediatek: pwrap: Simplify some error messages
Date: Sat, 29 Jun 2024 11:19:33 +0200
Message-ID: <7e6f7dcded577091061e2bc3f86d6ec5f6c4be7d.1719652155.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
References: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_err_probe() already display the error code in a human readable form,
there is no need to add it explicitly to the message.

While at it, remove some useless {}.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 6981d6a1ab93..c55f4061b8ef 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2533,18 +2533,14 @@ static int pwrap_probe(struct platform_device *pdev)
 	}
 
 	clk = devm_clk_get_optional_enabled(wrp->dev, "sys");
-	if (IS_ERR(clk)) {
+	if (IS_ERR(clk))
 		return dev_err_probe(wrp->dev, PTR_ERR(clk),
-				     "failed to get clock: %pe\n",
-				     clk);
-	}
+				     "failed to get sys clock\n");
 
 	clk = devm_clk_get_optional_enabled(wrp->dev, "tmr");
-	if (IS_ERR(clk)) {
+	if (IS_ERR(clk))
 		return dev_err_probe(wrp->dev, PTR_ERR(clk),
-				     "failed to get clock: %pe\n",
-				     clk);
-	}
+				     "failed to get tmr clock\n");
 
 	/* Enable internal dynamic clock */
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_DCM)) {
-- 
2.45.2


