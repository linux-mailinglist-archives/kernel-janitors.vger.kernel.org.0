Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9045E6B21
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Sep 2022 20:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiIVSl5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Sep 2022 14:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiIVSl4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 14:41:56 -0400
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CD7DCE89
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 11:41:54 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id bR8woJNpLeT4cbR8woCJ3a; Thu, 22 Sep 2022 20:41:52 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 22 Sep 2022 20:41:52 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     yhs@fb.com, Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH v2] headers: Remove some left-over license text
Date:   Thu, 22 Sep 2022 20:41:40 +0200
Message-Id: <88410cddd31197ea26840d7dd71612bece8c6acf.1663871981.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove some left-over from commit e2be04c7f995 ("License cleanup: add SPDX
license identifier to uapi header files with a license")

When the SPDX-License-Identifier tag has been added, the corresponding
license text has not been removed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes since v1:
  - add tools/include/uapi/linux/tc_act/tc_bpf.h   [Yonghong Song <yhs@fb.com>]

v1: https://lore.kernel.org/all/2a15aba72497e78ff08c8b8a8bfe3cf5a3e6ee18.1662897019.git.christophe.jaillet@wanadoo.fr/
---
 include/uapi/linux/tc_act/tc_bpf.h        |  5 -----
 include/uapi/linux/tc_act/tc_skbedit.h    | 13 -------------
 include/uapi/linux/tc_act/tc_skbmod.h     |  7 +------
 include/uapi/linux/tc_act/tc_tunnel_key.h |  5 -----
 include/uapi/linux/tc_act/tc_vlan.h       |  5 -----
 tools/include/uapi/linux/tc_act/tc_bpf.h  |  5 -----
 6 files changed, 1 insertion(+), 39 deletions(-)

diff --git a/include/uapi/linux/tc_act/tc_bpf.h b/include/uapi/linux/tc_act/tc_bpf.h
index 653c4f94f76e..fe6c8f8f3e8c 100644
--- a/include/uapi/linux/tc_act/tc_bpf.h
+++ b/include/uapi/linux/tc_act/tc_bpf.h
@@ -1,11 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
 /*
  * Copyright (c) 2015 Jiri Pirko <jiri@resnulli.us>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_TC_BPF_H
diff --git a/include/uapi/linux/tc_act/tc_skbedit.h b/include/uapi/linux/tc_act/tc_skbedit.h
index 6cb6101208d0..64032513cc4c 100644
--- a/include/uapi/linux/tc_act/tc_skbedit.h
+++ b/include/uapi/linux/tc_act/tc_skbedit.h
@@ -2,19 +2,6 @@
 /*
  * Copyright (c) 2008, Intel Corporation.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
- * Place - Suite 330, Boston, MA 02111-1307 USA.
- *
  * Author: Alexander Duyck <alexander.h.duyck@intel.com>
  */
 
diff --git a/include/uapi/linux/tc_act/tc_skbmod.h b/include/uapi/linux/tc_act/tc_skbmod.h
index af6ef2cfbf3d..ac62c9a993ea 100644
--- a/include/uapi/linux/tc_act/tc_skbmod.h
+++ b/include/uapi/linux/tc_act/tc_skbmod.h
@@ -1,12 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
 /*
  * Copyright (c) 2016, Jamal Hadi Salim
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
-*/
+ */
 
 #ifndef __LINUX_TC_SKBMOD_H
 #define __LINUX_TC_SKBMOD_H
diff --git a/include/uapi/linux/tc_act/tc_tunnel_key.h b/include/uapi/linux/tc_act/tc_tunnel_key.h
index 3f10dc4e7a4b..49ad4033951b 100644
--- a/include/uapi/linux/tc_act/tc_tunnel_key.h
+++ b/include/uapi/linux/tc_act/tc_tunnel_key.h
@@ -2,11 +2,6 @@
 /*
  * Copyright (c) 2016, Amir Vadai <amir@vadai.me>
  * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_TC_TUNNEL_KEY_H
diff --git a/include/uapi/linux/tc_act/tc_vlan.h b/include/uapi/linux/tc_act/tc_vlan.h
index 5b306fe815cc..3e1f8e57cdd2 100644
--- a/include/uapi/linux/tc_act/tc_vlan.h
+++ b/include/uapi/linux/tc_act/tc_vlan.h
@@ -1,11 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
 /*
  * Copyright (c) 2014 Jiri Pirko <jiri@resnulli.us>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_TC_VLAN_H
diff --git a/tools/include/uapi/linux/tc_act/tc_bpf.h b/tools/include/uapi/linux/tc_act/tc_bpf.h
index 653c4f94f76e..fe6c8f8f3e8c 100644
--- a/tools/include/uapi/linux/tc_act/tc_bpf.h
+++ b/tools/include/uapi/linux/tc_act/tc_bpf.h
@@ -1,11 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
 /*
  * Copyright (c) 2015 Jiri Pirko <jiri@resnulli.us>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_TC_BPF_H
-- 
2.34.1

