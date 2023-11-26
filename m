Return-Path: <kernel-janitors+bounces-439-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C667F91E4
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Nov 2023 09:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B76E2811F0
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Nov 2023 08:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F505683;
	Sun, 26 Nov 2023 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YWKlXNtl"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2D6B8
	for <kernel-janitors@vger.kernel.org>; Sun, 26 Nov 2023 00:56:37 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 7AwKrvcZTaCTP7AwKrtQT5; Sun, 26 Nov 2023 09:56:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700988995;
	bh=0Cu5CM2BqsYcvxp2RNXUeHx0kxVf5ZmlAz2vtUx9sAM=;
	h=From:To:Cc:Subject:Date;
	b=YWKlXNtlHLDvJcpcip/NPVrjv6yMoQdPtBjv9svhVtaaxcf4EJ2iHpLGQUp7rFbMy
	 ijC1S+NPPJOQ3k3Q1ljtO59wcaFaTS/CmUgHLsNqIiUU4s1Nvji0hDU2F6J5PFkBsb
	 Sa7e3hef9h2+cADOdb7jXErYX/TLCTwGs/RJWeN1wB2l5e9DuOag5Gp7Cc5U6YmEsH
	 p4nN5DJkr7L/s5MpjLQbcNK8pB3zqfi5jtdReQ0z0vggZBu23624RyIyWuP1HTHoon
	 qWOEszMqlraEEixfBTIB1LUfOnvBxjy4hS4N22DAPJ4+BP0J3/BFK87YEcrxXEx/iS
	 4QIEkvqqrcGbg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Nov 2023 09:56:35 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] lockdep: slightly reorder 'struct lock_class' to save some memory
Date: Sun, 26 Nov 2023 09:56:29 +0100
Message-Id: <801258371fc4101f96495a5aaecef638d6cbd8d3.1700988869.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on pahole, 2 holes can be combined in the 'struct lock_class'. This
saves 8 bytes in the structure on my x86_64.

On a x86_64 configured with allmodconfig, this saves 64kb of memory in
'kernel/locking/lockdep.o', certainly because of:
  struct lock_class lock_classes[MAX_LOCKDEP_KEYS];

Before:
   text	   data	    bss	    dec	    hex	filename
 102501	1912490	11531636	13546627	 ceb483	kernel/locking/lockdep.o

After:
 102181	1912490	11466100	13480771	 cdb343	kernel/locking/lockdep.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
After the reorder, pahole gives:

struct lock_class {
        struct hlist_node          hash_entry;           /*     0    16 */
        struct list_head           lock_entry;           /*    16    16 */
        struct list_head           locks_after;          /*    32    16 */
        struct list_head           locks_before;         /*    48    16 */
        /* --- cacheline 1 boundary (64 bytes) --- */
        const struct lockdep_subclass_key  * key;        /*    64     8 */
        lock_cmp_fn                cmp_fn;               /*    72     8 */
        lock_print_fn              print_fn;             /*    80     8 */
        unsigned int               subclass;             /*    88     4 */
        unsigned int               dep_gen_id;           /*    92     4 */
        long unsigned int          usage_mask;           /*    96     8 */
        const struct lock_trace  * usage_traces[10];     /*   104    80 */
        /* --- cacheline 2 boundary (128 bytes) was 56 bytes ago --- */
        const char  *              name;                 /*   184     8 */
        /* --- cacheline 3 boundary (192 bytes) --- */
        int                        name_version;         /*   192     4 */
        u8                         wait_type_inner;      /*   196     1 */
        u8                         wait_type_outer;      /*   197     1 */
        u8                         lock_type;            /*   198     1 */

        /* XXX 1 byte hole, try to pack */

        long unsigned int          contention_point[4];  /*   200    32 */
        long unsigned int          contending_point[4];  /*   232    32 */

        /* size: 264, cachelines: 5, members: 18 */
        /* sum members: 263, holes: 1, sum holes: 1 */
        /* last cacheline: 8 bytes */
};
---
 include/linux/lockdep_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
index 2ebc323d345a..857d785e89e6 100644
--- a/include/linux/lockdep_types.h
+++ b/include/linux/lockdep_types.h
@@ -127,12 +127,12 @@ struct lock_class {
 	unsigned long			usage_mask;
 	const struct lock_trace		*usage_traces[LOCK_TRACE_STATES];
 
+	const char			*name;
 	/*
 	 * Generation counter, when doing certain classes of graph walking,
 	 * to ensure that we check one node only once:
 	 */
 	int				name_version;
-	const char			*name;
 
 	u8				wait_type_inner;
 	u8				wait_type_outer;
-- 
2.34.1


