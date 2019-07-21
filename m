Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 439A86F2A9
	for <lists+kernel-janitors@lfdr.de>; Sun, 21 Jul 2019 12:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfGUKnn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 21 Jul 2019 06:43:43 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:50758 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfGUKnn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 21 Jul 2019 06:43:43 -0400
Received: from localhost.localdomain ([92.140.204.221])
        by mwinf5d33 with ME
        id fNjg2000X4n7eLC03Njht7; Sun, 21 Jul 2019 12:43:41 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 12:43:41 +0200
X-ME-IP: 92.140.204.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ccaulfie@redhat.com, teigland@redhat.com
Cc:     cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dlm: fix a typo
Date:   Sun, 21 Jul 2019 12:43:22 +0200
Message-Id: <20190721104322.30019-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

s/locksapce/lockspace

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 00fa700f4e83..9c95df8a36e9 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -870,7 +870,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
  * until this returns.
  *
  * Force has 4 possible values:
- * 0 - don't destroy locksapce if it has any LKBs
+ * 0 - don't destroy lockspace if it has any LKBs
  * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
  * 2 - destroy lockspace regardless of LKBs
  * 3 - destroy lockspace as part of a forced shutdown
-- 
2.20.1

