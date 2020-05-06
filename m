Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCA21C72B2
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 May 2020 16:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgEFOWF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 May 2020 10:22:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3872 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726114AbgEFOWF (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 May 2020 10:22:05 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 00477FDBF74F54D848AA;
        Wed,  6 May 2020 22:21:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 22:21:49 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Namjae Jeon <namjae.jeon@samsung.com>,
        Sungjong Seo <sj1557.seo@samsung.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-fsdevel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] exfat: fix possible memory leak in exfat_find()
Date:   Wed, 6 May 2020 14:25:54 +0000
Message-ID: <20200506142554.123748-1-weiyongjun1@huawei.com>
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

'es' is malloced from exfat_get_dentry_set() in exfat_find() and should
be freed before leaving from the error handling cases, otherwise it will
cause memory leak.

Fixes: 5f2aa075070c ("exfat: add inode operations")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/exfat/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index c241dd177f1a..48f4df883f3b 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -681,6 +681,7 @@ static int exfat_find(struct inode *dir, struct qstr *qname,
 			exfat_fs_error(sb,
 				"non-zero size file starts with zero cluster (size : %llu, p_dir : %u, entry : 0x%08x)",
 				i_size_read(dir), ei->dir.dir, ei->entry);
+			kfree(es);
 			return -EIO;
 		}



