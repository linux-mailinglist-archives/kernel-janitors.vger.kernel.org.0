Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B17161540F
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Nov 2022 22:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbiKAVQm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Nov 2022 17:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbiKAVQO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:16:14 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBB61DF2F
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:35 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybeoWfNn; Tue, 01 Nov 2022 22:15:34 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:34 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 30/30] kstrtox: Remove strtobool()
Date:   Tue,  1 Nov 2022 22:14:18 +0100
Message-Id: <fb186d487370cd4ef70929f03d46cd16be6b9c8d.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

strtobool() is the same as kstrtobool().
All uses of strtobool() have been turned into kstrtobool().

So strtobool() can now be removed as well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/kernel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index fe6efb24d151..244b92041cb0 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -20,7 +20,7 @@
 #include <linux/compiler.h>
 #include <linux/container_of.h>
 #include <linux/bitops.h>
-#include <linux/kstrtox.h>
+//#include <linux/kstrtox.h>
 #include <linux/log2.h>
 #include <linux/math.h>
 #include <linux/minmax.h>
-- 
2.34.1

