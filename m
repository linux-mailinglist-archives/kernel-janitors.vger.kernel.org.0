Return-Path: <kernel-janitors+bounces-2219-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630087DAD5
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Mar 2024 17:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B397B20AB6
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Mar 2024 16:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2211B974;
	Sat, 16 Mar 2024 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="O+ZeE9CL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3850BF510
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710606775; cv=none; b=n2617HqfG3vajmt9UOF7neEqGW1NWLIIQoSC1iEpp3HwNhvlYFq8FD7+KNmnMTKrsi4X250tF2jiIll+yX+MnHY6Y5MqU9MG3eYNnpJDNGEdlt0sDDJl15y/m+Cs/twBGGnSTYH6KZys4gd8MS7ajKIZArAe/HxL1/VW6iA+x7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710606775; c=relaxed/simple;
	bh=CK3MIQ+LHn6aar5yvtRcHf096sLPPsqQQO8tyaHQJ94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2rTUEZr18/5SDFZaatvi5WT2H/0l+yRVAzqpO8tLq3+t+IbRamOnr1BhSc5AaR9MFI8LE0QR86SASJVeUPyIaWrMIEMnynAcjJ3g10xRroPpA3ePmAnQf/8cM2X1Sg8bU+05psAZ0tmN2KSL393sRzPu2z7gcGeu6X7GXSl+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=O+ZeE9CL; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id lWwfrdx0634cQlWwfroueZ; Sat, 16 Mar 2024 17:31:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1710606702;
	bh=fk+ucFrD3yqbJl/SXn+CcoirbFuY/lHmnVNwfXo1N/c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=O+ZeE9CLB0dJs9eF0Hts9ozgB9/lFOORZUnwJ488VlyjOZIlSosYFRg/YHCxIjcWr
	 BFeeCRMynmt2mDGet0ywofvfYrDgo399NXEXIBFRDF/+C8l1gi1pyRTVrOtUHIp0wE
	 ZcHZnjBrupKJjxytrNLIJNVnFyYZG4kTcYw9bj5hAZeyA2KbrEbTQmTf1kKqudXmns
	 kpNFTrnsFzoyRp1fwvgWOc9aQrG0sAIJo4H0esZrgTmtm5Ld5cMMK2jx7suK5wxBEJ
	 T7pD0ZqM+GQNpN16TYq3R/fUh89UwcYi0FKOXvjN2sApIaRcRiVojeV2yzJz2Fb41z
	 MunWsmR4VjxUg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Mar 2024 17:31:42 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Linus Walleij <linus.walleij@linaro.org>,
	Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] bus: ts-nbus: Fix an error handling path in ts_nbus_probe()
Date: Sat, 16 Mar 2024 17:31:36 +0100
Message-ID: <6c887c85434edb17d2217c5198c48018dfa97923.1710606677.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If of_platform_populate() fails, we must shutdown the FPGA, as already done
in the remove function.

Fixes: 5b143d2a6ede ("bus: add driver for the Technologic Systems NBUS")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This patch is speculative and based on the output of one of my scripts that
tries to spot calls in .remove function that are not also in the error
handling path of the probe. I'm not familiar with the pwm_ API.

I don't think that the locking in the remove function is needed here.

Review with care.
---
 drivers/bus/ts-nbus.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index baf22a82c47a..fa1bb9b78446 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -309,13 +309,19 @@ static int ts_nbus_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, ts_nbus);
 
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
-	if (ret < 0)
-		return dev_err_probe(dev, ret,
-				     "failed to populate platform devices on bus\n");
+	if (ret < 0) {
+		dev_err_probe(dev, ret,
+			      "failed to populate platform devices on bus\n");
+		goto err_disable_pwm;
+	}
 
 	dev_info(dev, "initialized\n");
 
 	return 0;
+
+err_disable_pwm:
+	pwm_disable(ts_nbus->pwm);
+	return ret;
 }
 
 static void ts_nbus_remove(struct platform_device *pdev)
-- 
2.44.0


