Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BA022D42D
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Jul 2020 05:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgGYDNB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 24 Jul 2020 23:13:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:8276 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726572AbgGYDNA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Jul 2020 23:13:00 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id AF2EB982DC6F24ADC177;
        Sat, 25 Jul 2020 11:12:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 25 Jul 2020 11:12:52 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul" <vkoul@kernel.org>
CC:     YueHaibing <yuehaibing@huawei.com>,
        <linux-arm-msm@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] phy: qualcomm: fix platform_no_drv_owner.cocci warnings
Date:   Sat, 25 Jul 2020 03:16:24 +0000
Message-ID: <20200725031624.31432-1-yuehaibing@huawei.com>
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

Remove .owner field if calls are used which set it automatically
Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index a7241bf110d7..98c042c3b88d 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -557,7 +557,6 @@ static struct platform_driver qcom_ipq806x_usb_phy_driver = {
 	.probe		= qcom_ipq806x_usb_phy_probe,
 	.driver		= {
 		.name	= "qcom-ipq806x-usb-phy",
-		.owner	= THIS_MODULE,
 		.of_match_table = qcom_ipq806x_usb_phy_table,
 	},
 };





