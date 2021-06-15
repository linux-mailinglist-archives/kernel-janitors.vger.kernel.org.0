Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43483A8737
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Jun 2021 19:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhFORNo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Jun 2021 13:13:44 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:7280 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhFORNn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 13:13:43 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G4F8r1zZjz1BLkg;
        Wed, 16 Jun 2021 01:06:36 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 16 Jun 2021 01:11:36 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Erik Kaneda <erik.kaneda@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
CC:     <linux-acpi@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] ACPI: PRM: make symbol 'prm_module_list' static
Date:   Tue, 15 Jun 2021 17:21:57 +0000
Message-ID: <20210615172157.2841280-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sparse tool complains as follows:

drivers/acpi/prmt.c:53:1: warning:
 symbol 'prm_module_list' was not declared. Should it be static?

This symbol is not used outside of prmt.c, so marks it static.

Fixes: cefc7ca46235 ("ACPI: PRM: implement OperationRegion handler for the PlatformRtMechanism subtype")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/acpi/prmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
index 33c274698d07..31cf9aee5edd 100644
--- a/drivers/acpi/prmt.c
+++ b/drivers/acpi/prmt.c
@@ -50,7 +50,7 @@ struct prm_context_buffer {
 #pragma pack()
 
 
-LIST_HEAD(prm_module_list);
+static LIST_HEAD(prm_module_list);
 
 struct prm_handler_info {
 	guid_t guid;

