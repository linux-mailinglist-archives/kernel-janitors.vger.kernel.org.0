Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF97C359791
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Apr 2021 10:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhDIIUR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Apr 2021 04:20:17 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16866 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhDIIUO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 04:20:14 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGrc46wPnzlWy1;
        Fri,  9 Apr 2021 16:18:12 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 16:19:53 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Bob Peterson <rpeterso@redhat.com>,
        "Andreas Gruenbacher" <agruenba@redhat.com>
CC:     <cluster-devel@redhat.com>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] gfs2: use kmem_cache_free() instead of kfree()
Date:   Fri, 9 Apr 2021 08:29:57 +0000
Message-ID: <20210409082957.2909213-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

memory allocated by kmem_cache_alloc() should be freed using
kmem_cache_free(), not kfree().

Fixes: 7d6eec37a105 ("gfs2: Allocate bufdata object before taking log lock")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/gfs2/trans.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index c50de22d7cbf..1b47d08ac4fb 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -206,7 +206,7 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 	}
 	gfs2_log_lock(sdp);
 	if (bh->b_private) {
-		kfree(bd);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
 		bd = bh->b_private;
 	} else {
 		bh->b_private = bd;
@@ -246,12 +246,12 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 	}
 	gfs2_log_lock(sdp);
 	if (bh->b_private) {
-		kfree(bd);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
 		bd = bh->b_private;
 	} else {
 		lock_page(bh->b_page);
 		if (bh->b_private) {
-			kfree(bd);
+			kmem_cache_free(gfs2_bufdata_cachep, bd);
 			bd = bh->b_private;
 		} else {
 			bh->b_private = bd;

