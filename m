Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8115B4F20
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Sep 2022 15:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiIKNho (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 11 Sep 2022 09:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiIKNhn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Sep 2022 09:37:43 -0400
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7982EF34
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Sep 2022 06:37:42 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id XN9XoviJTAOp2XN9XoK3kI; Sun, 11 Sep 2022 15:37:41 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Sep 2022 15:37:41 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] checkpatch: Add ida_simple_... functions to the deprecated_apis list
Date:   Sun, 11 Sep 2022 15:37:38 +0200
Message-Id: <940595394dfbaf4f9aa3c2411cc3d6a73558c43e.1662903451.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From include/linux/idr.h:
/*
 * ida_simple_get() and ida_simple_remove() are deprecated. Use
 * ida_alloc() and ida_free() instead respectively.
 */

So, add them to the list of deprecated functions.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 88365749ed2e..9cffa6fbacec 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -813,6 +813,8 @@ our %deprecated_apis = (
 	"cond_synchronize_sched"		=> "cond_synchronize_rcu",
 	"kmap"					=> "kmap_local_page",
 	"kmap_atomic"				=> "kmap_local_page",
+	"ida_simple_get"			=> "ida_alloc(_min|_max|_range)",
+	"ida_simple_remove"			=> "ida_free",
 );
 
 #Create a search pattern for all these strings to speed up a loop below
-- 
2.34.1

