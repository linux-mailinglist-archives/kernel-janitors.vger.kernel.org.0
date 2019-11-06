Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF14F1A6F
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Nov 2019 16:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732135AbfKFPwv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Nov 2019 10:52:51 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56795 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732052AbfKFPwu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Nov 2019 10:52:50 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iSNc0-0002aC-Ci; Wed, 06 Nov 2019 15:52:48 +0000
From:   Colin King <colin.king@canonical.com>
To:     "Darrick J . Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] xfs: remove redundant assignment to variable error
Date:   Wed,  6 Nov 2019 15:52:48 +0000
Message-Id: <20191106155248.266489-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable error is being initialized with a value that is never read
and is being re-assigned a couple of statements later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/xfs/xfs_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index b3188ea49413..2302f67d1a18 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1362,7 +1362,7 @@ xfs_fc_fill_super(
 {
 	struct xfs_mount	*mp = sb->s_fs_info;
 	struct inode		*root;
-	int			flags = 0, error = -ENOMEM;
+	int			flags = 0, error;
 
 	mp->m_super = sb;
 
-- 
2.20.1

