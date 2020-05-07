Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796C41C8198
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 May 2020 07:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEGFhV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 May 2020 01:37:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3880 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbgEGFhV (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 May 2020 01:37:21 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 226588F91EE7F719A0CA;
        Thu,  7 May 2020 13:37:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 13:37:05 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jyri Sarha <jsarha@ti.com>, "Roger Quadros" <rogerq@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] phy: ti: j721e-wiz: Fix some error return code in wiz_probe()
Date:   Thu, 7 May 2020 05:41:09 +0000
Message-ID: <20200507054109.110849-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix to return negative error code from some error handling
cases instead of 0, as done elsewhere in this function.

Fixes: 091876cc355d ("phy: ti: j721e-wiz: Add support for WIZ module present in TI J721E SoC")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 1d12d1b1b63a..30ea5b207285 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -841,8 +841,10 @@ static int wiz_probe(struct platform_device *pdev)
 	}
 
 	base = devm_ioremap(dev, res.start, resource_size(&res));
-	if (!base)
+	if (!base) {
+		ret = -ENOMEM;
 		goto err_addr_to_resource;
+	}
 
 	regmap = devm_regmap_init_mmio(dev, base, &wiz_regmap_config);
 	if (IS_ERR(regmap)) {
@@ -859,6 +861,7 @@ static int wiz_probe(struct platform_device *pdev)
 
 	if (num_lanes > WIZ_MAX_LANES) {
 		dev_err(dev, "Cannot support %d lanes\n", num_lanes);
+		ret = -ENODEV;
 		goto err_addr_to_resource;
 	}
 
@@ -948,6 +951,7 @@ static int wiz_probe(struct platform_device *pdev)
 	serdes_pdev = of_platform_device_create(child_node, NULL, dev);
 	if (!serdes_pdev) {
 		dev_WARN(dev, "Unable to create SERDES platform device\n");
+		ret = -ENOMEM;
 		goto err_pdev_create;
 	}
 	wiz->serdes_pdev = serdes_pdev;



