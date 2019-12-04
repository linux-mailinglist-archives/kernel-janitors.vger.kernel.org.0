Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15782112141
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Dec 2019 03:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfLDCEk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Dec 2019 21:04:40 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7629 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726131AbfLDCEk (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Dec 2019 21:04:40 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 00030B68322770FDCDDD;
        Wed,  4 Dec 2019 10:04:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Dec 2019 10:04:27 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <eddie.huang@mediatek.com>, <sean.wang@mediatek.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <matthias.bgg@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Mao Wenan <maowenan@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] rtc: mt6397: drop free_irq of devm_xx allocated irq
Date:   Wed, 4 Dec 2019 10:02:09 +0800
Message-ID: <20191204020209.10363-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

rtc->irq is requested by devm_request_threaded_irq,
and request_threaded_irq. IRQs requested with this
function will be automatically freed on driver detach.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/rtc/rtc-mt6397.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5249fc99fd5f..d6a10111137a 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -293,7 +293,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_irq:
-	free_irq(rtc->irq, rtc);
 	return ret;
 }
 
-- 
2.20.1

