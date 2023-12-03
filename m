Return-Path: <kernel-janitors+bounces-550-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503E80271D
	for <lists+kernel-janitors@lfdr.de>; Sun,  3 Dec 2023 20:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4055F280DF3
	for <lists+kernel-janitors@lfdr.de>; Sun,  3 Dec 2023 19:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A239018B09;
	Sun,  3 Dec 2023 19:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MS4EngJt"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40D9B4
	for <kernel-janitors@vger.kernel.org>; Sun,  3 Dec 2023 11:48:15 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 9sRor2SAvaCTP9sRprMITc; Sun, 03 Dec 2023 20:48:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1701632894;
	bh=TtuieOqB3d5/4LucYB7b5rnfDifiCNhm6IjslDyNUYo=;
	h=From:To:Cc:Subject:Date;
	b=MS4EngJtRAiKHXOhDy56XDRMvJvD38MihZwlUI9BM1bvLFwWgSWqc7ARwSYqGx4+M
	 9aUEU2XHOXW/zTqWH9JCKxmxNHJqJOi6GyXM8jZA6tdC9Cm0RpQRZC/vKOThwNyhkc
	 Kk4pdzOxdqhd3Z16ftNUZtK0cgW9wgUHfqwoAFiG2A6AlCS/+r0dl0Bc4h1rKonw3P
	 83axw2HhH/MCu290ZmatMZIFnHJCOjU4SZEmumRe7klgCZ2mtKqQ1s4+9T34CmsWr7
	 54WEOyacF3tDZjfJ25dy/AyUsd4z/ETkLBuXJ6B3tHjWfObNnjv3GCNEWKLe5t5wmg
	 5uqzNG4j/Cthg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Dec 2023 20:48:14 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Song Liu <song@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-raid@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] md/md-multipath: Convert "struct mpconf" to flexible array
Date: Sun,  3 Dec 2023 20:48:06 +0100
Message-Id: <03dd7de1cecdb7084814f2fab300c9bc716aff3e.1701632867.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'multipaths' field of 'struct mpconf' can be declared as a flexible
array.

The advantages are:
   - 1 less indirection when accessing to the 'multipaths' array
   - save 1 pointer in the structure
   - improve memory usage
   - give the opportunity to use __counted_by() for additional safety

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
On my x86_64 system, with configured with allmodconfig, I have:

Before the change:
=================
struct mpconf {
	struct mddev *             mddev;                /*     0     8 */
	struct multipath_info *    multipaths;           /*     8     8 */
	int                        raid_disks;           /*    16     4 */

	/* XXX 4 bytes hole, try to pack */

	spinlock_t                 device_lock;          /*    24    72 */
	/* --- cacheline 1 boundary (64 bytes) was 32 bytes ago --- */
	struct list_head           retry_list;           /*    96    16 */
	mempool_t                  pool;                 /*   112   200 */

	/* size: 312, cachelines: 5, members: 6 */
	/* sum members: 308, holes: 1, sum holes: 4 */
	/* last cacheline: 56 bytes */
};

struct multipath_info {
	struct md_rdev *           rdev;                 /*     0     8 */

	/* size: 8, cachelines: 1, members: 1 */
	/* last cacheline: 8 bytes */
};

size drivers/md/md-multipath.o
   text	   data	    bss	    dec	    hex	filename
  12863	   1041	     16	  13920	   3660	drivers/md/md-multipath.o


After the change:
================
struct mpconf {
	struct mddev *             mddev;                /*     0     8 */
	int                        raid_disks;           /*     8     4 */

	/* XXX 4 bytes hole, try to pack */

	spinlock_t                 device_lock;          /*    16    72 */
	/* --- cacheline 1 boundary (64 bytes) was 24 bytes ago --- */
	struct list_head           retry_list;           /*    88    16 */
	mempool_t                  pool;                 /*   104   200 */
	/* --- cacheline 4 boundary (256 bytes) was 48 bytes ago --- */
	struct multipath_info      multipaths[];         /*   304     0 */

	/* size: 304, cachelines: 5, members: 6 */
	/* sum members: 300, holes: 1, sum holes: 4 */
	/* last cacheline: 48 bytes */
};

struct multipath_info {
	struct md_rdev *           rdev;                 /*     0     8 */

	/* size: 8, cachelines: 1, members: 1 */
	/* last cacheline: 8 bytes */
};

size drivers/md/md-multipath.o
   text	   data	    bss	    dec	    hex	filename
  12470	   1041	     16	  13527	   34d7	drivers/md/md-multipath.o


So:
  - about 400 bytes of code are saved.
  - because of the way memory allocation works, 'struct mpconf' really
    uses 512 bytes of memory when allocated. So the "extra" memory that is
    allocated (512-304 = 208) can be used to store up to 26 multipaths,
    for free.

Finally, several places use pointer arithmetic to access the desired
structure, such as:
	for (i = 0; i < conf->raid_disks; i++) {
		tmp = conf->multipaths + i;
		if (tmp->rdev)

Should this be rewritten as:
	for (i = 0; i < conf->raid_disks; i++) {
		if (tmpconf->multipaths[i]->rdev)
in order to have the compiler be able to check boundaries defined by
__counted_by()?
---
 drivers/md/md-multipath.c | 12 +++---------
 drivers/md/md-multipath.h |  3 ++-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/md/md-multipath.c b/drivers/md/md-multipath.c
index d22276870283..6a23065a65f7 100644
--- a/drivers/md/md-multipath.c
+++ b/drivers/md/md-multipath.c
@@ -357,16 +357,13 @@ static int multipath_run (struct mddev *mddev)
 	 * should be freed in multipath_free()]
 	 */
 
-	conf = kzalloc(sizeof(struct mpconf), GFP_KERNEL);
+	conf = kzalloc(struct_size(conf, multipaths, mddev->raid_disks),
+		       GFP_KERNEL);
 	mddev->private = conf;
 	if (!conf)
 		goto out;
 
-	conf->multipaths = kcalloc(mddev->raid_disks,
-				   sizeof(struct multipath_info),
-				   GFP_KERNEL);
-	if (!conf->multipaths)
-		goto out_free_conf;
+	conf->raid_disks = mddev->raid_disks;
 
 	working_disks = 0;
 	rdev_for_each(rdev, mddev) {
@@ -384,7 +381,6 @@ static int multipath_run (struct mddev *mddev)
 			working_disks++;
 	}
 
-	conf->raid_disks = mddev->raid_disks;
 	conf->mddev = mddev;
 	spin_lock_init(&conf->device_lock);
 	INIT_LIST_HEAD(&conf->retry_list);
@@ -421,7 +417,6 @@ static int multipath_run (struct mddev *mddev)
 
 out_free_conf:
 	mempool_exit(&conf->pool);
-	kfree(conf->multipaths);
 	kfree(conf);
 	mddev->private = NULL;
 out:
@@ -433,7 +428,6 @@ static void multipath_free(struct mddev *mddev, void *priv)
 	struct mpconf *conf = priv;
 
 	mempool_exit(&conf->pool);
-	kfree(conf->multipaths);
 	kfree(conf);
 }
 
diff --git a/drivers/md/md-multipath.h b/drivers/md/md-multipath.h
index b3099e5fc4d7..fb49e151ac94 100644
--- a/drivers/md/md-multipath.h
+++ b/drivers/md/md-multipath.h
@@ -8,12 +8,13 @@ struct multipath_info {
 
 struct mpconf {
 	struct mddev			*mddev;
-	struct multipath_info	*multipaths;
 	int			raid_disks;
 	spinlock_t		device_lock;
 	struct list_head	retry_list;
 
 	mempool_t		pool;
+
+	struct multipath_info	multipaths[] __counted_by(raid_disks);
 };
 
 /*
-- 
2.34.1


