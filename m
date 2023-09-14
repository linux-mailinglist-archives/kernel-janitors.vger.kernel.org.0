Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1327A0F06
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Sep 2023 22:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjINUbe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Sep 2023 16:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjINUb1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 16:31:27 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7762707
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 13:31:23 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id gszUqMvFz7mcCgszhqSuk1; Thu, 14 Sep 2023 22:31:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1694723482;
        bh=c1IUka5tijpIrp0HcvGSlR2aksa59ckg6dwZ4iF3jNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Nq8wEKbOwyagqkhVYlXixP+fuOOqU8zwUvxYo6II81d5G4IkN0J0t3Nf+/UaVUTfw
         yQh6KOw1za3vgcL8WO9nEpJUo6zZiN2jJxvdDS3kq93kfpDqj01vJEKdW7BrcxHnV6
         zRKqvZsvZa0kF9c7uC9fHidpGwVFGtt3SafoXXB//Wo/kyK3EG+1y+nOJmawmnEcV9
         X+7Vo/4J/l8Nm4spTLkfl1zKyKkCvG51dtOVQy+ini++O8oMm0iZ7NEX4mCoMTdBly
         wuLvQzI08zUcZYd+ryss/AoT7/lKvx8BgD4QSLuksdc2c2JELJgKLnoLS474/Rx72p
         TK4vxugtfiFpw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 14 Sep 2023 22:31:22 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 5/5] clk: imx: imx8: Simplify clk_imx_acm_detach_pm_domains()
Date:   Thu, 14 Sep 2023 22:31:06 +0200
Message-Id: <b95fbefbb960573637e78ab71bfd889ae7a9d49c.1694722339.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694722339.git.christophe.jaillet@wanadoo.fr>
References: <cover.1694722339.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The return value of clk_imx_acm_detach_pm_domains() is never used.
Simplify the code and turn it into a void function.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/imx/clk-imx8-acm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index c744fb78bb44..735b08296cc8 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -310,20 +310,18 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
  * @dev: deivice pointer
  * @dev_pm: multi power domain for device
  */
-static int clk_imx_acm_detach_pm_domains(struct device *dev,
-					 struct clk_imx_acm_pm_domains *dev_pm)
+static void clk_imx_acm_detach_pm_domains(struct device *dev,
+					  struct clk_imx_acm_pm_domains *dev_pm)
 {
 	int i;
 
 	if (dev_pm->num_domains <= 1)
-		return 0;
+		return;
 
 	for (i = 0; i < dev_pm->num_domains; i++) {
 		device_link_del(dev_pm->pd_dev_link[i]);
 		dev_pm_domain_detach(dev_pm->pd_dev[i], false);
 	}
-
-	return 0;
 }
 
 static int imx8_acm_clk_probe(struct platform_device *pdev)
-- 
2.34.1

