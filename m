Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591C04E4FFD
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Mar 2022 11:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243406AbiCWKGy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Mar 2022 06:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238997AbiCWKGy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Mar 2022 06:06:54 -0400
Received: from ha.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91EA775E70;
        Wed, 23 Mar 2022 03:05:24 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by ha.nfschina.com (Postfix) with ESMTP id D74EF1E80D93;
        Wed, 23 Mar 2022 18:04:36 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from ha.nfschina.com ([127.0.0.1])
        by localhost (ha.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ogp0T_Jy8HPp; Wed, 23 Mar 2022 18:04:34 +0800 (CST)
Received: from localhost.localdomain (unknown [101.228.254.169])
        (Authenticated sender: yuzhe@nfschina.com)
        by ha.nfschina.com (Postfix) with ESMTPA id BECE51E80D8B;
        Wed, 23 Mar 2022 18:04:33 +0800 (CST)
From:   yuzhe <yuzhe@nfschina.com>
To:     trond.myklebust@hammerspace.com, anna@kernel.org,
        linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, liqiong@nfschina.com
Cc:     yuzhe <yuzhe@nfschina.com>
Subject: [PATCH] NFSv4: remove unnecessary (void*) conversions.
Date:   Wed, 23 Mar 2022 03:05:14 -0700
Message-Id: <20220323100514.182532-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

No need cast (void*) to (struct idmap *).

Signed-off-by: yuzhe <yuzhe@nfschina.com>
---
 fs/nfs/nfs4idmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index f331866dd418..6d4d602235be 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -668,7 +668,7 @@ idmap_pipe_downcall(struct file *filp, const char __user *src, size_t mlen)
 {
 	struct request_key_auth *rka;
 	struct rpc_inode *rpci = RPC_I(file_inode(filp));
-	struct idmap *idmap = (struct idmap *)rpci->private;
+	struct idmap *idmap = rpci->private;
 	struct key *authkey;
 	struct idmap_msg im;
 	size_t namelen_in;
@@ -735,7 +735,7 @@ static void
 idmap_release_pipe(struct inode *inode)
 {
 	struct rpc_inode *rpci = RPC_I(inode);
-	struct idmap *idmap = (struct idmap *)rpci->private;
+	struct idmap *idmap = rpci->private;
 
 	nfs_idmap_abort_pipe_upcall(idmap, -EPIPE);
 }
-- 
2.25.1

