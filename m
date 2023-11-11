Return-Path: <kernel-janitors+bounces-226-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FAB7E8CC9
	for <lists+kernel-janitors@lfdr.de>; Sat, 11 Nov 2023 22:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3621F20F9E
	for <lists+kernel-janitors@lfdr.de>; Sat, 11 Nov 2023 21:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8121DA29;
	Sat, 11 Nov 2023 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fr2LCtM8"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD41D6AB
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 21:02:15 +0000 (UTC)
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [IPv6:2001:41d0:203:375::b0])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3AF2D64
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 13:02:14 -0800 (PST)
Date: Sat, 11 Nov 2023 16:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1699736531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h71eiJiYUIXKHjvWV8U3pwxJhAF67oyh2afFpTVLWW0=;
	b=fr2LCtM8LEhD4XJvWckMcGz6FY2ao00sQvcv5uKfFpg/wxbsNiJ7g5gOZYJMmAj3sGjuLh
	v3Cq82PrIfIVVOu48vT8x1IEA78x5DWSkzJti2KgISQwPBLUxgcyOUj4gKMdrBH4yqs1+N
	MGdZwZn5Jag7ALyObef45KLiuFPmU98=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bcachefs: remove redundant initialization of
 variable level
Message-ID: <20231111210208.qra7xhf2nd4pqvst@moria.home.lan>
References: <20231111204528.339603-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111204528.339603-1-colin.i.king@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Nov 11, 2023 at 08:45:28PM +0000, Colin Ian King wrote:
> Variable level is being initialized a value that is never read, the
> variable is being re-assigned another value several statements later
> on. The initialization is redundant and can be removed. Cleans up
> clang scan build warning:
> 
> fs/bcachefs/btree_iter.c:1217:11: warning: Value stored to 'level'
> during its initialization is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

since we're no longer gnu89, we can simply declare the variable when
it's first used, like so:

diff --git a/fs/bcachefs/btree_iter.c b/fs/bcachefs/btree_iter.c
index 96bdf0c6051c..104172f6822b 100644
--- a/fs/bcachefs/btree_iter.c
+++ b/fs/bcachefs/btree_iter.c
@@ -1214,8 +1214,6 @@ __bch2_btree_path_set_pos(struct btree_trans *trans,
 		   struct btree_path *path, struct bpos new_pos,
 		   bool intent, unsigned long ip, int cmp)
 {
-	unsigned level = path->level;
-
 	bch2_trans_verify_not_in_restart(trans);
 	EBUG_ON(!path->ref);
 
@@ -1231,7 +1229,7 @@ __bch2_btree_path_set_pos(struct btree_trans *trans,
 		goto out;
 	}
 
-	level = btree_path_up_until_good_node(trans, path, cmp);
+	unsigned level = btree_path_up_until_good_node(trans, path, cmp);
 
 	if (btree_path_node(path, level)) {
 		struct btree_path_level *l = &path->l[level];

