Return-Path: <kernel-janitors+bounces-218-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FC7E8349
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 20:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE234B20FF2
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 19:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAC43B2BB;
	Fri, 10 Nov 2023 19:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sBF5L2r2"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AEC3B291
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 19:59:29 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A4EEA
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 11:59:27 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 1Xf2r9Jy2UC9i1Xf2rWXK2; Fri, 10 Nov 2023 20:59:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699646365;
	bh=JGFpthYiqaRPY244yP6qRl5S2GlMr+W8XYeFguG1JEM=;
	h=From:To:Cc:Subject:Date;
	b=sBF5L2r2secVj5RLVeh89KKXdDCnhOApxbEbYwQRDf1TWzlHI5fsZX1tRpwS+a6kp
	 5xMS5UHKIUUFVCAaOrMXVP0WhcOjgw3Cg5GN/aw6TAp3he1AFKRmtTx9+PaqL88KS2
	 AtSdDLpy/oNvAanGcvAsUDhwtbO2xHBd2+TUvVgan2wvtql3yedRnmJOecSTe5E5CD
	 mNFlN7ZtEZwIAF0Y4u41JNYiG2FYkgUhwbShqWsxKgt2sK1wB4yaPbwPB+sT+K1xwS
	 McmyOJEWVkT90BY25TYuubZpD4CeR2tn70bf4mVftWPCA7nnH5fgMZSbwjubRitrHI
	 bYXOVBY9pzKZQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 10 Nov 2023 20:59:25 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ntfs3@lists.linux.dev
Subject: [PATCH] fs/ntfs3: Slightly simplify ntfs_inode_printk()
Date: Fri, 10 Nov 2023 20:59:22 +0100
Message-Id: <8c9196e6d3b4f5416183a498d3c9ebcf84f22ced.1699646339.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size passed to snprintf() includes the space for the trailing space.
So there is no reason here not to use all the available space.

So remove the -1 when computing 'name_len'.
While at it, use the size of the array directly instead of the intermediate
'name_len' variable.

snprintf() also guaranties that the buffer if NULL terminated, so there is
no need to write an additional trailing NULL "To be sure".

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ntfs3/super.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 9153dffde950..dcc8984a10a4 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -122,13 +122,12 @@ void ntfs_inode_printk(struct inode *inode, const char *fmt, ...)
 
 	if (name) {
 		struct dentry *de = d_find_alias(inode);
-		const u32 name_len = ARRAY_SIZE(s_name_buf) - 1;
 
 		if (de) {
 			spin_lock(&de->d_lock);
-			snprintf(name, name_len, " \"%s\"", de->d_name.name);
+			snprintf(name, sizeof(s_name_buf), " \"%s\"",
+				 de->d_name.name);
 			spin_unlock(&de->d_lock);
-			name[name_len] = 0; /* To be sure. */
 		} else {
 			name[0] = 0;
 		}
-- 
2.34.1


