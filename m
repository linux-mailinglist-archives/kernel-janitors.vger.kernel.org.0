Return-Path: <kernel-janitors+bounces-4404-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C191CBE1
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 11:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BED121F22373
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 09:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229C63C6AC;
	Sat, 29 Jun 2024 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="N18GjfXy"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B24084C
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Jun 2024 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719652853; cv=none; b=fB3FkU6ZGK1F2RZLukkwle+CIETc0xtsYT/jz241Cy3kEI46zVpgVynPBOK71BR92ARIQFi3UonSsnjnIIfdCIZjrbPasyqPW1QAm3VAFlX56dVlD0oiYRMSDxzTtwEaUw2zaAT3cmfps3iTXNdlnFLQQBDMz/9FIpJ3/yF+quE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719652853; c=relaxed/simple;
	bh=tIqb8K/9bSd8h5tSTEKj6fyRr0/9UPR6MjzTmhpbye4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7O6XcqcyvNoX+EbMSzCTdYhSYRHiI/PbvXeUws1sR6EBBqOYMeam+Ma2pNYZ2cz+6ER2r7+3r6CpbzVZxwsOEUJMtg1ZkvMjPXEPkFr+gUkwA1FqBjXWALUpTp7yed896dtg54r1Pn3aNkgOOmW2XnOY19oyxAmBnXkSeZY5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=N18GjfXy; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUFCs5cnD; Sat, 29 Jun 2024 11:19:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652782;
	bh=wyjA2BhEiXaiYu36IgBQtDPeZotGjNfhM/eFXVY5sOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N18GjfXyCMCL0Bfw0rX/L1yZjQLg+P+cbpJLsU0XO16j1gxXLhpcjJNjlggMXf4l3
	 Li/cp9PZBJgcuBcMsQrkdQ/hD8O3Lu1CAsj+Kgca5LOppYwNLBCZOuB0S3fhslsGmk
	 uIoiLCOl4UyP9mZEdED4duW5Ysc2JxaeD/lozPQQeNtP+QDxMewVpqaUUOXIC+Jt6p
	 t1xhs1NQ9hbf1YCx+28EbMroVUzK3UbiKywKVaAyGfWW1XNQyRQ1CR8FNj8KBh72CE
	 kE9NuwuDBMqbtARqPPRuoXFAaa89vYhN2DWPtlgTNgUFK4JYjDSfYPwrQAzZRkJ35m
	 18xZYF9C0NHFg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:42 +0200
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
Subject: [PATCH 2/4] soc: mediatek: pwrap: Constify some struct int[]
Date: Sat, 29 Jun 2024 11:19:31 +0200
Message-ID: <626783bb264a8b3b0c8cd7e1d9f9b241f0a494b6.1719652155.git.christophe.jaillet@wanadoo.fr>
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

These arrays are not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  52664	   1384	     16	  54064	   d330	drivers/soc/mediatek/mtk-pmic-wrap.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0da0cdec5050..d57553486383 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -483,7 +483,7 @@ enum pwrap_regs {
 	PWRAP_MSB_FIRST,
 };
 
-static int mt2701_regs[] = {
+static const int mt2701_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -569,7 +569,7 @@ static int mt2701_regs[] = {
 	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
 };
 
-static int mt6765_regs[] = {
+static const int mt6765_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -601,7 +601,7 @@ static int mt6765_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x1E0,
 };
 
-static int mt6779_regs[] = {
+static const int mt6779_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -640,7 +640,7 @@ static int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
-static int mt6795_regs[] = {
+static const int mt6795_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -725,7 +725,7 @@ static int mt6795_regs[] = {
 	[PWRAP_EXT_CK] =		0x14c,
 };
 
-static int mt6797_regs[] = {
+static const int mt6797_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -758,7 +758,7 @@ static int mt6797_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x1D4,
 };
 
-static int mt6873_regs[] = {
+static const int mt6873_regs[] = {
 	[PWRAP_INIT_DONE2] =		0x0,
 	[PWRAP_TIMER_EN] =		0x3E0,
 	[PWRAP_INT_EN] =		0x448,
@@ -769,7 +769,7 @@ static int mt6873_regs[] = {
 	[PWRAP_WACS2_RDATA] =		0xCA8,
 };
 
-static int mt7622_regs[] = {
+static const int mt7622_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -881,7 +881,7 @@ static int mt7622_regs[] = {
 	[PWRAP_SPI2_CTRL] =		0x244,
 };
 
-static int mt8135_regs[] = {
+static const int mt8135_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -954,7 +954,7 @@ static int mt8135_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x160,
 };
 
-static int mt8173_regs[] = {
+static const int mt8173_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1036,7 +1036,7 @@ static int mt8173_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x148,
 };
 
-static int mt8183_regs[] = {
+static const int mt8183_regs[] = {
 	[PWRAP_MUX_SEL] =			0x0,
 	[PWRAP_WRAP_EN] =			0x4,
 	[PWRAP_DIO_EN] =			0x8,
@@ -1087,7 +1087,7 @@ static int mt8183_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =			0xC28,
 };
 
-static int mt8195_regs[] = {
+static const int mt8195_regs[] = {
 	[PWRAP_INIT_DONE2] =		0x0,
 	[PWRAP_STAUPD_CTRL] =		0x4C,
 	[PWRAP_TIMER_EN] =		0x3E4,
@@ -1104,7 +1104,7 @@ static int mt8195_regs[] = {
 	[PWRAP_WACS2_RDATA] =		0x8A8,
 };
 
-static int mt8365_regs[] = {
+static const int mt8365_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1166,7 +1166,7 @@ static int mt8365_regs[] = {
 	[PWRAP_WDT_SRC_EN_1] =		0xf8,
 };
 
-static int mt8516_regs[] = {
+static const int mt8516_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1251,7 +1251,7 @@ static int mt8516_regs[] = {
 	[PWRAP_MSB_FIRST] =		0x170,
 };
 
-static int mt8186_regs[] = {
+static const int mt8186_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1377,7 +1377,7 @@ struct pmic_wrapper {
 };
 
 struct pmic_wrapper_type {
-	int *regs;
+	const int *regs;
 	enum pwrap_type type;
 	u32 arb_en_all;
 	u32 int_en_all;
-- 
2.45.2


