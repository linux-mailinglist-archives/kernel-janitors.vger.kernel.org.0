Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16D9359150
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Apr 2021 03:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhDIBWf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Apr 2021 21:22:35 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16849 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIBWf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 21:22:35 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGgKh4yBHz9xZH;
        Fri,  9 Apr 2021 09:20:08 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 09:22:11 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC:     <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] coresight: core: Make symbol 'csdev_sink' static
Date:   Fri, 9 Apr 2021 01:32:15 +0000
Message-ID: <20210409013215.488823-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sparse tool complains as follows:

drivers/hwtracing/coresight/coresight-core.c:26:1: warning:
 symbol '__pcpu_scope_csdev_sink' was not declared. Should it be static?

This symbol is not used outside of coresight-core.c, so this
commit marks it static.

Fixes: 2cd87a7b293d ("coresight: core: Add support for dedicated percpu sinks")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3e779e1619ed..6c68d34d956e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -23,7 +23,7 @@
 #include "coresight-priv.h"
 
 static DEFINE_MUTEX(coresight_mutex);
-DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 
 /**
  * struct coresight_node - elements of a path, from source to sink

