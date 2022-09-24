Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B33FB5E8836
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Sep 2022 06:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbiIXEWY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 24 Sep 2022 00:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbiIXEWW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Sep 2022 00:22:22 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5575C13A061;
        Fri, 23 Sep 2022 21:22:20 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MZG335VqzzlVlT;
        Sat, 24 Sep 2022 12:18:07 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 12:22:18 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 12:22:17 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <sfrench@samba.org>
CC:     <linux-cifs@vger.kernel.org>, <samba-technical@lists.samba.org>,
        <kernel-janitors@vger.kernel.org>, <lsahlber@redhat.com>,
        <sunke32@huawei.com>
Subject: [PATCH] cifs: use list_move instead of list_del + list_add
Date:   Sat, 24 Sep 2022 12:32:59 +0800
Message-ID: <20220924043259.819006-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Using list_move() instead of list_del() + list_add().

Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 fs/cifs/cached_dir.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/cifs/cached_dir.c b/fs/cifs/cached_dir.c
index b58bed63db1e..68f86f052dba 100644
--- a/fs/cifs/cached_dir.c
+++ b/fs/cifs/cached_dir.c
@@ -389,8 +389,7 @@ void invalidate_all_cached_dirs(struct cifs_tcon *tcon)
 	INIT_LIST_HEAD(&entry);
 	spin_lock(&cfids->cfid_list_lock);
 	list_for_each_entry_safe(cfid, q, &cfids->entries, entry) {
-		list_del(&cfid->entry);
-		list_add(&cfid->entry, &entry);
+		list_move(&cfid->entry, &entry);
 		cfids->num_entries--;
 		cfid->is_open = false;
 		/* To prevent race with smb2_cached_lease_break() */
@@ -531,8 +530,7 @@ void free_cached_dirs(struct cached_fids *cfids)
 	list_for_each_entry_safe(cfid, q, &cfids->entries, entry) {
 		cfid->on_list = false;
 		cfid->is_open = false;
-		list_del(&cfid->entry);
-		list_add(&cfid->entry, &entry);
+		list_move(&cfid->entry, &entry);
 	}
 	spin_unlock(&cfids->cfid_list_lock);
 
-- 
2.31.1

