Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66821E8FCF
	for <lists+kernel-janitors@lfdr.de>; Sat, 30 May 2020 10:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgE3IjI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 30 May 2020 04:39:08 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:25702 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728404AbgE3IjI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 30 May 2020 04:39:08 -0400
Received: from localhost.localdomain ([93.23.15.192])
        by mwinf5d20 with ME
        id kwf52200C48dfat03wf5Mf; Sat, 30 May 2020 10:39:06 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 30 May 2020 10:39:06 +0200
X-ME-IP: 93.23.15.192
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ccaulfie@redhat.com, teigland@redhat.com
Cc:     cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dlm: Fix a typo in a comment
Date:   Sat, 30 May 2020 10:39:03 +0200
Message-Id: <20200530083903.578271-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

s/locksapce/lockspace/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index e93670ecfae5..f17e091daab3 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -859,7 +859,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
  * until this returns.
  *
  * Force has 4 possible values:
- * 0 - don't destroy locksapce if it has any LKBs
+ * 0 - don't destroy lockspace if it has any LKBs
  * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
  * 2 - destroy lockspace regardless of LKBs
  * 3 - destroy lockspace as part of a forced shutdown
-- 
2.25.1

