Return-Path: <kernel-janitors+bounces-8-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFDD7DA82B
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Oct 2023 19:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B98DB21164
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Oct 2023 17:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2CE17723;
	Sat, 28 Oct 2023 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FFFaV4Gt"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C90DF44
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Oct 2023 17:04:55 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2941E5
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Oct 2023 10:04:53 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id wmjwqs5Qa8ZI8wmjxqgmOJ; Sat, 28 Oct 2023 19:04:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698512691;
	bh=u3XpE1EDC+9oMRTYO51KW7vHfl6tXKZ9dZgi4Ew6grU=;
	h=From:To:Cc:Subject:Date;
	b=FFFaV4Gty5EI+wmhvij8pSq4owQ4Xx9sdgwF4xBqKES36Ps0obVUkc1iiRDUl/QGj
	 sGZxd6YF/cuLKS/bs+TDwAIHE7+W6luyIIxjK6pyXFCido6AvaqDjTK+WOFtmPso96
	 gx1/8xhj5yheGPzZkPggN7b/uds8sMfo+D5LXKDOWnmA7n7laLQCmYQj6BAwIprPZi
	 qW8pIBXHCTavVb7sROXP82UcJP1zcCbnjMKOhoYutKQCMkW3Kx0fEaMgdv1JPtzcy6
	 hRkjfo40TWJc6fMbM4yHziAvhHNEBknVMsCtecdshmPDUSRttNInYe7uQ0fYlecPHo
	 AspLu+cDjMoGw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Oct 2023 19:04:51 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	rcu@vger.kernel.org
Subject: [PATCH] refscale: Optimize process_durations()
Date: Sat, 28 Oct 2023 19:04:44 +0200
Message-Id: <bbbab32e3e104bdc2238724a6a4a85e539f49ddd.1698512661.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_durations() is not a hot path, but there is no good reason to
iterate over and over the data already in 'buf'.

Using a seq_buf saves some useless strcat() and the need of a temp buffer.
Data is written directly at the correct place.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/rcu/refscale.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index 2c2648a3ad30..861485d865ec 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -28,6 +28,7 @@
 #include <linux/rcupdate_trace.h>
 #include <linux/reboot.h>
 #include <linux/sched.h>
+#include <linux/seq_buf.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 #include <linux/stat.h>
@@ -890,31 +891,36 @@ static u64 process_durations(int n)
 {
 	int i;
 	struct reader_task *rt;
-	char buf1[64];
+	struct seq_buf s;
 	char *buf;
 	u64 sum = 0;
 
 	buf = kmalloc(800 + 64, GFP_KERNEL);
 	if (!buf)
 		return 0;
-	buf[0] = 0;
+
+	seq_buf_init(&s, buf, 800 + 64);
+
 	sprintf(buf, "Experiment #%d (Format: <THREAD-NUM>:<Total loop time in ns>)",
 		exp_idx);
 
 	for (i = 0; i < n && !torture_must_stop(); i++) {
 		rt = &(reader_tasks[i]);
-		sprintf(buf1, "%d: %llu\t", i, rt->last_duration_ns);
 
 		if (i % 5 == 0)
-			strcat(buf, "\n");
-		if (strlen(buf) >= 800) {
+			seq_buf_putc(&s, '\n');
+
+		if (seq_buf_used(&s) >= 800) {
+			seq_buf_terminate(&s);
 			pr_alert("%s", buf);
-			buf[0] = 0;
+			seq_buf_clear(&s);
 		}
-		strcat(buf, buf1);
+
+		seq_buf_printf(&s, "%d: %llu\t", i, rt->last_duration_ns);
 
 		sum += rt->last_duration_ns;
 	}
+	seq_buf_terminate(&s);
 	pr_alert("%s\n", buf);
 
 	kfree(buf);
-- 
2.34.1


