Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7671C661512
	for <lists+kernel-janitors@lfdr.de>; Sun,  8 Jan 2023 13:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbjAHMdA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 8 Jan 2023 07:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjAHMc7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Jan 2023 07:32:59 -0500
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1857BBF5C
        for <kernel-janitors@vger.kernel.org>; Sun,  8 Jan 2023 04:32:56 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id EUr7pusmESTJGEUr7pUBmi; Sun, 08 Jan 2023 13:32:54 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Jan 2023 13:32:54 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     viro@zeniv.linux.org.uk
Cc:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] fs/dcache: Remove unneeded math.h and rculist.h includes
Date:   Sun,  8 Jan 2023 13:32:52 +0100
Message-Id: <028298a8b70a67a70bc7b7eb0b07d9780fc1e5f3.1673181086.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

<linux/math.h> and <linux/rculist.h> are not used by <linux/dcache.h>.
Remove them.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've built:
  arch/mips		(cross-built)
  arch/powerpc	 (cross-built)
  drivers/crypto/caam/
  drivers/gpu/drm/msm/
  drivers/infiniband/hw/hfi1/
  drivers/net/ethernet/amd/xgbe/
  drivers/net/ethernet/freescale/dpaa2/
  drivers/net/wireless/marvell/libertas/debugfs.o
  drivers/s390/cio/ccwgroup.o   (cross-built)
  drivers/usb/gadget/function/f_mass_storage.o
  fs/
  kernel/events/core.o
  kernel/sysctl.o
  lib/
  net/unix/af_unix.o
  security/

Let see if build-bots spot something I've missed.
---
 include/linux/dcache.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 6b351e009f59..c4db829d48cf 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -4,8 +4,6 @@
 
 #include <linux/atomic.h>
 #include <linux/list.h>
-#include <linux/math.h>
-#include <linux/rculist.h>
 #include <linux/rculist_bl.h>
 #include <linux/spinlock.h>
 #include <linux/seqlock.h>
-- 
2.34.1

