Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378FF34A1E4
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Mar 2021 07:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhCZGer (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 Mar 2021 02:34:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14909 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhCZGeV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 02:34:21 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F6Bwn60DVzkggH;
        Fri, 26 Mar 2021 14:32:41 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 14:34:11 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <zhengyongjun3@huawei.com>, Damien Le Moal <damien.lemoal@wdc.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
CC:     <linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] pinctrl: Remove duplicated include from pinctrl-k210.c
Date:   Fri, 26 Mar 2021 14:48:04 +0800
Message-ID: <20210326064804.3262477-1-zhengyongjun3@huawei.com>
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
 drivers/pinctrl/pinctrl-k210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 8a733cf77ba0..f831526d06ff 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -15,7 +15,6 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/io.h>
 
 #include <dt-bindings/pinctrl/k210-fpioa.h>
 

