Return-Path: <kernel-janitors+bounces-7555-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8858A6306E
	for <lists+kernel-janitors@lfdr.de>; Sat, 15 Mar 2025 18:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1BB23BC1D2
	for <lists+kernel-janitors@lfdr.de>; Sat, 15 Mar 2025 17:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FBB20485B;
	Sat, 15 Mar 2025 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tXIJc2nM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE572E339D;
	Sat, 15 Mar 2025 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742058118; cv=none; b=AqQNdcxn9M3zyFgwT1TnInYN6E7AUEOK4dOh88qxWti5TfPDVORz6RjzWW1cTdEV1us6A+5u4MbmDEptvIrYJIdzuyvTSW7ZMlSi1NEqAaIXmtsVSFiofrfSW5YM8r7bMkQzuOnYil8hhIMSTWOE+5CsWBtmNfoHmIO3j5qaMts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742058118; c=relaxed/simple;
	bh=qsvDZBFJn+k2AhxkKXFKL3KNzYjE0N21z/rxR3lsLo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCcXwA0Vko/VvGylB9iM7zRjlptfHzXdhTh/SDOiDuiNJSdKn6Sut1XNH7M61XxiP5SNyq6cmqdUJy0zKk+e1zMIk8nn1L9AAXsiQVHS0RFQAXfVb4NkQ4J/NLDx6jDbq+gUUGODWPFqM70MoQf5x11zoQmQTXkmwo4//oTyWM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=tXIJc2nM; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id tUs8tc2fuYvuMtUsCtRRfC; Sat, 15 Mar 2025 18:00:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1742058033;
	bh=u2hd/aiDIzivl8fJWTXxpfToEX5iwbckZhgnX/3wwy0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=tXIJc2nMwfBAUeQG7gEuPtRhM2ohL971lvAiI/fr0v44zTwOZdAhikGq2mtn63Y9m
	 TByQo/Bemw6NS/qx0crPBllC+TxhSWkpHma109hZjtmDRBVcXJN1ec4bg3iImXw3nJ
	 cenhrxZt01HFXlX8YbwTIp6Qm4PXUTPPJdMfhIHQFj2+hTtv9rECVlVW5QhXbCQ1o/
	 B9KQKaTk52cwp23MPLSjfeO1Cq284SXlRizmJMSvOErpSCAvzRVp7IkZIS3xKbjnBo
	 McfR50wSdVi7N/ZUEo3hh/xp6KsPAm8/9nVxd2ugZyjOv3hSzTuAbIjPTW56W+PkIl
	 rwdGilaDthDxA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 15 Mar 2025 18:00:33 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Shawn Guo <shawn.guo@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pci@vger.kernel.org
Subject: [PATCH] PCI: histb: Remove an unneeded NULL test in histb_pcie_remove()
Date: Sat, 15 Mar 2025 18:00:36 +0100
Message-ID: <c369b5d25e17a44984ae5a889ccc28a59a0737f7.1742058005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_exit() handles NULL as a parameter, so there is no need for an extra
test.
This makes the code consistent with the error handling path of the probe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Follow up to commit d8dba4a635bc, where the NULL check from the patch in
the Link: was removed when applied.
---
 drivers/pci/controller/dwc/pcie-histb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index d84e46ca4490..1f2f4c28a949 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -432,8 +432,7 @@ static void histb_pcie_remove(struct platform_device *pdev)
 
 	histb_pcie_host_disable(hipcie);
 
-	if (hipcie->phy)
-		phy_exit(hipcie->phy);
+	phy_exit(hipcie->phy);
 }
 
 static const struct of_device_id histb_pcie_of_match[] = {
-- 
2.48.1


