Return-Path: <kernel-janitors+bounces-4599-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3C92EFB5
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 21:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C4B21ACF
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 19:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6A516F0E1;
	Thu, 11 Jul 2024 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="uKlfxmlZ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDAC16E876
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720726504; cv=none; b=iwgwbDvAfJk5HcqYyYDQIvODOghVnvuQ2jYKccJaEt5l64IPYQoqh5MRTeEhQyP+ZoWi1G6bSu1jhtFnngGYh4FeQM5JpktP7ARPUq85BKJ+T+5BAI1OqSzrgGCmDnl5n8Xp6yHJSrfso3Vy3XyCu3O7Dz+F5b/a111hIoBUCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720726504; c=relaxed/simple;
	bh=fxqHbexqa/XBA+b4kSaSE8iCXVy+Xhb2hvj+JR297Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKw3XiiiCU1//EIg00tKEMi/GRLDt/DZHdcP6eFsTq3X7ipaCwH+whbxD6bnm6Zg0P+T0wH8No8C155vrVHSphetrqHLL/lj3d1vOAhd5rTPY8DHzId1eW2xdsfJb7BnRrNBxcTmp0QJKHm5yQxx3chwwChJ5RUR5BImsYmiqm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=uKlfxmlZ; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.. ([77.131.3.214])
	by smtp.orange.fr with ESMTPA
	id RzZBsCMFrj4pfRzZEsIiRe; Thu, 11 Jul 2024 21:35:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720726501;
	bh=MaLM7B8grFGEA8Qhxc325Ffgm/J2Yg0HpAuW5vXtFvE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=uKlfxmlZm+QDK9dDFuhV//L6spwodsLDPA9Fqhg/ncr3a1Z9vkzcdMNckcJEsP7Cy
	 HHrKThLpkL6iNE/eHu3mDTKRFwbfrtvF3/VxzHRGzXyDptCEI+uX1bEd4BHazLP+nC
	 eeFMytPSvArCHyalNCDhdiJgVewvlteO9DNw9p/a6cj193aaaETA4ClxIsU1Tl2QMu
	 K4MKrlnKmSLdL/+8GRxsg6iTbNm9OF0tmxMBhp9S2RpOgXT62e9FSBfimxm1cgzrFH
	 rxx0zb5ZjRpC5bNoXBSuzOiW787NX+GytCf2gheKLtWTQVOaCKndKY+89u5KB85tm9
	 +lan4gygVrKsA==
X-ME-Helo: fedora..
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 11 Jul 2024 21:35:01 +0200
X-ME-IP: 77.131.3.214
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] phy: cadence: Sierra: Constify struct cdns_reg_pairs
Date: Thu, 11 Jul 2024 21:34:52 +0200
Message-ID: <c57ee8206ebba8c222d7d954335654384072b9ac.1720723132.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720723132.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720723132.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct cdns_reg_pairs' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  60489	   4342	     16	  64847	   fd4f	drivers/phy/cadence/phy-cadence-sierra.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  60521	   4310	     16	  64847	   fd4f	drivers/phy/cadence/phy-cadence-sierra.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/phy/cadence/phy-cadence-sierra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index d4eb93ce8232..6bb0ca3443f1 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -1544,7 +1544,7 @@ static void cdns_sierra_phy_remove(struct platform_device *pdev)
 }
 
 /* SGMII PHY PMA lane configuration */
-static struct cdns_reg_pairs sgmii_phy_pma_ln_regs[] = {
+static const struct cdns_reg_pairs sgmii_phy_pma_ln_regs[] = {
 	{0x9010, SIERRA_PHY_PMA_XCVR_CTRL}
 };
 
@@ -1609,7 +1609,7 @@ static struct cdns_sierra_vals sgmii_100_no_ssc_plllc1_opt3_ln_vals = {
 };
 
 /* QSGMII PHY PMA lane configuration */
-static struct cdns_reg_pairs qsgmii_phy_pma_ln_regs[] = {
+static const struct cdns_reg_pairs qsgmii_phy_pma_ln_regs[] = {
 	{0x9010, SIERRA_PHY_PMA_XCVR_CTRL}
 };
 
@@ -1675,7 +1675,7 @@ static struct cdns_sierra_vals qsgmii_100_no_ssc_plllc1_ln_vals = {
 };
 
 /* PCIE PHY PCS common configuration */
-static struct cdns_reg_pairs pcie_phy_pcs_cmn_regs[] = {
+static const struct cdns_reg_pairs pcie_phy_pcs_cmn_regs[] = {
 	{0x0430, SIERRA_PHY_PIPE_CMN_CTRL1}
 };
 
-- 
2.45.2


