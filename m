Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9ED3D3A0D
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Jul 2021 14:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbhGWLle (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Jul 2021 07:41:34 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:36301 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbhGWLld (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jul 2021 07:41:33 -0400
Received: from ubuntu-CJ.home ([80.15.159.30])
        by mwinf5d50 with ME
        id YcN32500M0feRjk03cN3ls; Fri, 23 Jul 2021 14:22:04 +0200
X-ME-Helo: ubuntu-CJ.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Jul 2021 14:22:04 +0200
X-ME-IP: 80.15.159.30
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     song@kernel.org, linux-raid@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] md/bitmap: Use 'atomic_inc_return' instead of hand-writing it
Date:   Fri, 23 Jul 2021 14:21:57 +0200
Message-Id: <bb63b5d4e985be4bafa7a1922e6992fa81b399c4.1627042861.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'atomic_inc/atomic_read' is equivalent to 'atomic_inc_return' which is
less verbose.
So use the later.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
First time a play with atomic functions, so apologies if I misunderstood
something
---
 drivers/md/md-bitmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
index e29c6298ef5c..9d47a2ca1cf3 100644
--- a/drivers/md/md-bitmap.c
+++ b/drivers/md/md-bitmap.c
@@ -1396,8 +1396,8 @@ int md_bitmap_startwrite(struct bitmap *bitmap, sector_t offset, unsigned long s
 
 	if (behind) {
 		int bw;
-		atomic_inc(&bitmap->behind_writes);
-		bw = atomic_read(&bitmap->behind_writes);
+
+		bw = atomic_inc_return(&bitmap->behind_writes);
 		if (bw > bitmap->behind_writes_used)
 			bitmap->behind_writes_used = bw;
 
-- 
2.30.2

