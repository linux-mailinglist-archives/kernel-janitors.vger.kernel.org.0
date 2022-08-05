Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBCA58B127
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Aug 2022 23:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbiHEVdY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Aug 2022 17:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237373AbiHEVdW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Aug 2022 17:33:22 -0400
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79F778210
        for <kernel-janitors@vger.kernel.org>; Fri,  5 Aug 2022 14:33:21 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id K4wYoXZvugtndK4wZoVbCl; Fri, 05 Aug 2022 23:33:20 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 05 Aug 2022 23:33:20 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Mark Brown <broonie@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH] spi: microchip-core: Simplify some error message
Date:   Fri,  5 Aug 2022 23:33:17 +0200
Message-Id: <fb894ecec68e03fb7fc9353027c8b1a2610833d7.1659735153.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Moreover, in the case of devm_clk_get() it would only display '0' because
'ret' is know to be 0 at this point.

Fixes: cdeaf3a99a02 ("spi: microchip-core: switch to use dev_err_probe()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-microchip-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index ce4385330b19..d352844c798c 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -548,12 +548,12 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 			       IRQF_SHARED, dev_name(&pdev->dev), master);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
-				     "could not request irq: %d\n", ret);
+				     "could not request irq\n");
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk),
-				     "could not get clk: %d\n", ret);
+				     "could not get clk\n");
 
 	ret = clk_prepare_enable(spi->clk);
 	if (ret)
-- 
2.34.1

