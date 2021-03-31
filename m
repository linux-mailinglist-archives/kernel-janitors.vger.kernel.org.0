Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE3B34A1E6
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Mar 2021 07:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhCZGeq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 Mar 2021 02:34:46 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14908 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCZGeR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 02:34:17 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F6Bwf38yzzkgg1;
        Fri, 26 Mar 2021 14:32:34 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 14:34:04 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <zhengyongjun3@huawei.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Serge Semin" <Sergey.Semin@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] bus: bt1-apb: Remove duplicated include from bt1-apb.c
Date:   Fri, 26 Mar 2021 14:47:56 +0800
Message-ID: <20210326064756.3262338-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/bus/bt1-apb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index b25ff941e7c7..74b1b712ef3a 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -22,7 +22,6 @@
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/time64.h>
-#include <linux/clk.h>
 #include <linux/sysfs.h>
 
 #define APB_EHB_ISR			0x00

