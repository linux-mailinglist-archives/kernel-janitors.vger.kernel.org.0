Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2A7318B7C
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Feb 2021 14:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhBKNEu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Feb 2021 08:04:50 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:50083 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhBKNCW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Feb 2021 08:02:22 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lABam-0004CX-TI; Thu, 11 Feb 2021 13:01:09 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dave Kleikamp <shaggy@kernel.org>,
        jfs-discussion@lists.sourceforge.net
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] fs/jfs: fix potential integer overflow on shift of a int
Date:   Thu, 11 Feb 2021 13:01:08 +0000
Message-Id: <20210211130108.171493-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
arithmetic and then assigned to a signed 64 bit integer. In the case where
l2nb is 32 or more this can lead to an overflow.  Avoid this by shifting
the value 1LL instead.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: b40c2e665cd5 ("fs/jfs: TRIM support for JFS Filesystem")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: shift 1LL rather than using BIT_ULL macro as suggested by
    Dave Kleikamp.

---
 fs/jfs/jfs_dmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 94b7c1cb5ceb..7aee15608619 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1656,7 +1656,7 @@ s64 dbDiscardAG(struct inode *ip, int agno, s64 minlen)
 		} else if (rc == -ENOSPC) {
 			/* search for next smaller log2 block */
 			l2nb = BLKSTOL2(nblocks) - 1;
-			nblocks = 1 << l2nb;
+			nblocks = 1LL << l2nb;
 		} else {
 			/* Trim any already allocated blocks */
 			jfs_error(bmp->db_ipbmap->i_sb, "-EIO\n");
-- 
2.30.0

