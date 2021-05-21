Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CE538C542
	for <lists+kernel-janitors@lfdr.de>; Fri, 21 May 2021 12:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbhEUKyF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 21 May 2021 06:54:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41080 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhEUKyD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 May 2021 06:54:03 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lk2lg-0002DN-DI; Fri, 21 May 2021 10:52:36 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Joe Thornber <ejt@redhat.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] dm btree: Fix potential read of array with negative index i
Date:   Fri, 21 May 2021 11:52:36 +0100
Message-Id: <20210521105236.43860-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to lower_bound can return -1 if the key is not found
with the bsearch, leading to a negative index access into
array node->keys[]. Ensure this cannot occur by checking for
a negative index before reading from the array.

Addresses-Coverity: ("Negative array index read")
Fixes: d69e2e7e28bd ("dm btree: improve btree residency")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/persistent-data/dm-btree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/persistent-data/dm-btree.c b/drivers/md/persistent-data/dm-btree.c
index b8d21b6e2953..266deaea5eea 100644
--- a/drivers/md/persistent-data/dm-btree.c
+++ b/drivers/md/persistent-data/dm-btree.c
@@ -1048,7 +1048,7 @@ static bool contains_key(struct btree_node *node, uint64_t key)
 {
 	int i = lower_bound(node, key);
 
-	if (le64_to_cpu(node->keys[i]) == key)
+	if (i >= 0 && le64_to_cpu(node->keys[i]) == key)
 		return true;
 
 	return false;
-- 
2.31.1

