Return-Path: <kernel-janitors+bounces-4406-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8C91CBFB
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 11:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D46581F224BF
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E9B3C6AC;
	Sat, 29 Jun 2024 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OH1Tl9Fy"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-210.smtpout.orange.fr [193.252.23.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A889445
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Jun 2024 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719654959; cv=none; b=atIGW/ulJyqTltm2XGWmA3934vXI+r59BJdqZlHxuy05Qt5aFJD+FKMEgiG5Zjo46oGf8n28rxMyrPf0R98G0bdSVIQ/qm48WLbMkEqHbMf5xShppLVp5Ir+r8YqtWGE8W5wfXlE4hhui+uq9tLB6d2BmlAZze3OwccdEFJiEso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719654959; c=relaxed/simple;
	bh=CTxytHPvfb/tbeM9qNcteLgnLzKj/8mD28sRHCoF43I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxzWWwzJ7omHhieSb867nJ8DsooxzNlncCC7FHa7rBlgzZ75BSlclBDrNJLQhh4ca9KL07mHQlPDov+MWXmUcpmkHhkFUKtMu89dp1HhPsPWp5JZcygy36Rq8nrk8BmTH8fU+vOMdcIQRT8OGd/u1zdBjRx0zONK0g6rRj92Ljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OH1Tl9Fy; arc=none smtp.client-ip=193.252.23.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUFAs5cmx; Sat, 29 Jun 2024 11:19:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652781;
	bh=OIHS4bCoAp7XmybFd1o/p9MaqJ7r9GiTTKSXXLd53E0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OH1Tl9FyjuMMx4HmARLJfapnbS0a32MoPR7+1VKjwTwU/z6XOFxau1S89iYL0nNTG
	 FBmWeDrhea0TeEX0Lu3xNN+0+z5QzKnFF3aBBNHRPrT/E00VFDlaW5O4ZXwzNbyEzq
	 TyQP1fNOm9kdCMs8DIZ0layWZXx6TVXmXnO1mBiC7Za9+TXYpDgtRRjzd7bEgmz4XX
	 NrSS1dMehyJOJil0dR+A+UvsYSQRVIHx19WOaEbgjoWuCKn8uVqx6s+2sDmXKye+Ol
	 mPLW6ygkOlin0P//j7SV8OXiylbRcmevqxdEJDdFYLk+zzW6oxskgWmkU2OMgrZX3c
	 hdk+E9mrdyNCQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:41 +0200
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
Subject: [PATCH 1/4] soc: mediatek: pwrap: Constify struct pmic_wrapper_type
Date: Sat, 29 Jun 2024 11:19:30 +0200
Message-ID: <ee3160978ac6564663d044815f24cf79e2e0744e.1719652155.git.christophe.jaillet@wanadoo.fr>
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

'struct pmic_wrapper_type' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  45336	   8724	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index efd9cae212dc..0da0cdec5050 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2397,7 +2397,7 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 	.init_soc_specific = pwrap_mt8183_init_soc_specific,
 };
 
-static struct pmic_wrapper_type pwrap_mt8195 = {
+static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
 	.arb_en_all = 0x777f, /* NEED CONFIRM */
@@ -2423,7 +2423,7 @@ static const struct pmic_wrapper_type pwrap_mt8365 = {
 	.init_soc_specific = NULL,
 };
 
-static struct pmic_wrapper_type pwrap_mt8516 = {
+static const struct pmic_wrapper_type pwrap_mt8516 = {
 	.regs = mt8516_regs,
 	.type = PWRAP_MT8516,
 	.arb_en_all = 0xff,
@@ -2435,7 +2435,7 @@ static struct pmic_wrapper_type pwrap_mt8516 = {
 	.init_soc_specific = NULL,
 };
 
-static struct pmic_wrapper_type pwrap_mt8186 = {
+static const struct pmic_wrapper_type pwrap_mt8186 = {
 	.regs = mt8186_regs,
 	.type = PWRAP_MT8186,
 	.arb_en_all = 0xfb27f,
-- 
2.45.2


