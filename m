Return-Path: <kernel-janitors+bounces-113-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20377DEA72
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 02:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B1292819C1
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 01:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C39015BE;
	Thu,  2 Nov 2023 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9915AC
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 01:52:14 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 7727D121;
	Wed,  1 Nov 2023 18:52:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 72A4A60292B89;
	Thu,  2 Nov 2023 09:52:00 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] gfs2: remove dead code in __acquires
Date: Thu,  2 Nov 2023 09:51:42 +0800
Message-Id: <20231102015141.1355762-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang static analyzer complains that value stored to 'gh' is never read.
The code of this line is useless after commit 0b93bac2271e
("gfs2: Remove LM_FLAG_PRIORITY flag"). Remove this code to save space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/gfs2/glock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 3772a5d9e85c..347f8a020c82 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1524,7 +1524,6 @@ __acquires(&gl->gl_lockref.lock)
 		return;
 	}
 	list_add_tail(&gh->gh_list, insert_pt);
-	gh = list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list);
 	spin_unlock(&gl->gl_lockref.lock);
 	if (sdp->sd_lockstruct.ls_ops->lm_cancel)
 		sdp->sd_lockstruct.ls_ops->lm_cancel(gl);
-- 
2.30.2


