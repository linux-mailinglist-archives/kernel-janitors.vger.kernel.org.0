Return-Path: <kernel-janitors+bounces-1857-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DF85F59F
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 11:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16B428946E
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 10:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098F93A8C9;
	Thu, 22 Feb 2024 10:26:17 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id BE4EC3C481;
	Thu, 22 Feb 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708597576; cv=none; b=nSvWAv1Zb+rATCXVUqQ7ua2nb6eKoajNQ2nHbeUC8YBT7hzaPvqHvIEXnnHCtjJXUWlmOCbzAMVPXM83l4s33r57oikR4W8aNaE5s96S3E7ozOBfERRMd2uJR7ZVbvKZJ7LaP64ghGRhBUJYpbJAX+13Vj7mKn3nlAHj59+iUtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708597576; c=relaxed/simple;
	bh=Rm+Yj2UuZ1027lvdPwgeiZQLrr3sHaHO5cTHO1idRqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G6pfVhou3QvsIsUHgvSK9LgyiZD8E6u8zQI31mun11HkxUs78/jVYaqsbHnVMBF5umGRrLNNu2NajhtLrOWMPep1MNIcaPtOrMU0W4JGdOb+/ce4bBRNvxk8Ltl1mccPOxqxsCZmdq5upA8lMn94hv87dD4SJ+MRVm+lEjgprc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 093096032FDD7;
	Thu, 22 Feb 2024 18:25:52 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: hubcap@omnibond.com,
	martin@omnibond.com
Cc: Su Hui <suhui@nfschina.com>,
	xiyuyang19@fudan.edu.cn,
	cymi20@fudan.edu.cn,
	tanxin.ctf@gmail.com,
	devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] orangefs: Fix possible NULL deference in orangefs_mount
Date: Thu, 22 Feb 2024 18:25:49 +0800
Message-Id: <20240222102548.1426561-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scripts/coccinelle/null/deref_null.cocci complains:
fs/orangefs/super.c:584:18-25: ERROR:
ORANGEFS_SB ( sb ) is NULL but dereferenced.

When memory allocation for orangefs_sb_info_s fails, ORANGEFS_SB(sb)
is NULL and ORANGEFS_SB(sb)->no_list will result in NULL deference.
Add a judgement to fix this NULL deference problem.

Fixes: ac2c63757f4f ("orangefs: Fix sb refcount leak when allocate sb info failed.")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/orangefs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index 5254256a224d..c056c86e2482 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -581,7 +581,8 @@ struct dentry *orangefs_mount(struct file_system_type *fst,
 
 free_sb_and_op:
 	/* Will call orangefs_kill_sb with sb not in list. */
-	ORANGEFS_SB(sb)->no_list = 1;
+	if (ORANGEFS_SB(sb))
+		ORANGEFS_SB(sb)->no_list = 1;
 	/* ORANGEFS_VFS_OP_FS_UMOUNT is done by orangefs_kill_sb. */
 	deactivate_locked_super(sb);
 free_op:
-- 
2.30.2


