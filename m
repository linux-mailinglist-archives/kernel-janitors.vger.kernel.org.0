Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9511E3574
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 May 2020 04:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgE0CTq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 May 2020 22:19:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5344 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725836AbgE0CTq (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 May 2020 22:19:46 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4F2C7D1A5900A20FFD4E;
        Wed, 27 May 2020 10:19:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Wed, 27 May 2020 10:19:33 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-hwmon@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregister() on error in amd_energy_init()
Date:   Wed, 27 May 2020 02:24:17 +0000
Message-ID: <20200527022417.105620-1-weiyongjun1@huawei.com>
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

Add the missing platform_driver_unregister() before return
from amd_energy_init() in the error handling case.

Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counters")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwmon/amd_energy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index bc8b643a37d5..e95b7426106e 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
 		return ret;
 
 	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
-	if (!amd_energy_platdev)
+	if (!amd_energy_platdev) {
+		platform_driver_unregister(&amd_energy_driver);
 		return -ENOMEM;
+	}
 
 	ret = platform_device_add(amd_energy_platdev);
 	if (ret) {



