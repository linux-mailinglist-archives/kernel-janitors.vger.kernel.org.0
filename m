Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA4A3078AC
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Jan 2021 15:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbhA1OwB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Jan 2021 09:52:01 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42271 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbhA1OuT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jan 2021 09:50:19 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l58c4-0004GU-6X; Thu, 28 Jan 2021 14:49:36 +0000
From:   Colin King <colin.king@canonical.com>
To:     "J . Bruce Fields" <bfields@fieldses.org>,
        Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] nfsd: fix check of statid returned from call to find_stateid_by_type
Date:   Thu, 28 Jan 2021 14:49:35 +0000
Message-Id: <20210128144935.640026-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to find_stateid_by_type is setting the return value in *stid
yet the NULL check of the return is checking stid instead of *stid.
Fix this by adding in the missing pointer * operator.

Addresses-Coverity: ("Dereference before null check")
Fixes: 6cdaa72d4dde ("nfsd: find_cpntf_state cleanup")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/nfs4state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index f554e3480bb1..423fd6683f3a 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -5824,7 +5824,7 @@ static __be32 find_cpntf_state(struct nfsd_net *nn, stateid_t *st,
 
 	*stid = find_stateid_by_type(found, &cps->cp_p_stateid,
 			NFS4_DELEG_STID|NFS4_OPEN_STID|NFS4_LOCK_STID);
-	if (stid)
+	if (*stid)
 		status = nfs_ok;
 	else
 		status = nfserr_bad_stateid;
-- 
2.29.2

