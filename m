Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD0841087A
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 Sep 2021 21:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238898AbhIRT55 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 18 Sep 2021 15:57:57 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:54525 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234876AbhIRT54 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 15:57:56 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d62 with ME
        id vXwX250094m3Hzu03XwXTT; Sat, 18 Sep 2021 21:56:31 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Sep 2021 21:56:31 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     almaz.alexandrovich@paragon-software.com
Cc:     ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] fs/ntfs3: Remove a useless shadowing variable
Date:   Sat, 18 Sep 2021 21:56:28 +0200
Message-Id: <6cf8bdec16086835c771d797f83b7c298c3667fc.1631994909.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is already a 'u8 mask' defined at the top of the function.
There is no need to define a new one here.

Remove the useless and shadowing new 'mask' variable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ntfs3/bitfunc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/bitfunc.c b/fs/ntfs3/bitfunc.c
index bf10e2da5c6e..50d838093790 100644
--- a/fs/ntfs3/bitfunc.c
+++ b/fs/ntfs3/bitfunc.c
@@ -119,8 +119,7 @@ bool are_bits_set(const ulong *lmap, size_t bit, size_t nbits)
 
 	pos = nbits & 7;
 	if (pos) {
-		u8 mask = fill_mask[pos];
-
+		mask = fill_mask[pos];
 		if ((*map & mask) != mask)
 			return false;
 	}
-- 
2.30.2

