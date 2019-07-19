Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2C06D94E
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jul 2019 05:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfGSDSp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jul 2019 23:18:45 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2683 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726055AbfGSDSp (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jul 2019 23:18:45 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 99DB2B45C7281F96DB62;
        Fri, 19 Jul 2019 11:18:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 11:18:34 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Fontana <rfontana@redhat.com>
CC:     YueHaibing <yuehaibing@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] pinctrl: sprd: Fix platform_no_drv_owner.cocci warnings
Date:   Fri, 19 Jul 2019 03:24:14 +0000
Message-ID: <20190719032414.85369-1-yuehaibing@huawei.com>
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
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
index 3b65aeab7244..06c8671b40e7 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
@@ -940,7 +940,6 @@ MODULE_DEVICE_TABLE(of, sprd_pinctrl_of_match);
 static struct platform_driver sprd_pinctrl_driver = {
 	.driver = {
 		.name = "sprd-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = sprd_pinctrl_of_match,
 	},
 	.probe = sprd_pinctrl_probe,



