Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5237734FCE7
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Mar 2021 11:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbhCaJdU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 31 Mar 2021 05:33:20 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15054 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbhCaJcy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Mar 2021 05:32:54 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9LdK3x8CzNrHZ;
        Wed, 31 Mar 2021 17:30:13 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:32:45 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] memory: fsl-corenet-cf: Remove redundant dev_err call in ccf_probe()
Date:   Wed, 31 Mar 2021 17:32:44 +0800
Message-ID: <20210331093244.3238-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/memory/fsl-corenet-cf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/fsl-corenet-cf.c b/drivers/memory/fsl-corenet-cf.c
index 0309bd5a1800..e15c962d4540 100644
--- a/drivers/memory/fsl-corenet-cf.c
+++ b/drivers/memory/fsl-corenet-cf.c
@@ -192,10 +192,8 @@ static int ccf_probe(struct platform_device *pdev)
 	}
 
 	ccf->regs = devm_ioremap_resource(&pdev->dev, r);
-	if (IS_ERR(ccf->regs)) {
-		dev_err(&pdev->dev, "%s: can't map mem resource\n", __func__);
+	if (IS_ERR(ccf->regs))
 		return PTR_ERR(ccf->regs);
-	}
 
 	ccf->dev = &pdev->dev;
 	ccf->info = match->data;

