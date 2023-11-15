Return-Path: <kernel-janitors+bounces-84-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E87DD894
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 23:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47EAF28184C
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 22:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EC127452;
	Tue, 31 Oct 2023 22:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNt+AXsT"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EBB20333
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 22:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E213AC433C9;
	Tue, 31 Oct 2023 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698792465;
	bh=uW1kAs4Hu3zlaOFxuayVPq7jvgYsrqUYDI9NXhfEGuo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=rNt+AXsTxLmRoM+i2Do/iF1sAU4KhXvDy83JQ+60HSLXrKTsLJVGclCtwydrwoLyY
	 DfJji34SEEEO7tyfNNa3nuB8tcNGcY+TOObTBeJC9uMKJnAz1UpJpf3LQDa7Vyd98E
	 V1RakDJsQx7tEQSQNrGcn8NDvdEvDNdQHjSNkA9jhtgurHIAGOZl7D7CqTRIKUHI4h
	 TxCvEYvOGJfWaSmHDYyeIzAGnE+KLAmHgOeKD3uTdgLkYlWtE7L4+kmYZU2QOZa0+a
	 3pLWlzJtDY/pV5peuW1mav85dJmDKCBGXsTNeucldgS3rsNcDXQJ1rk1kn1btavK+o
	 XTvrMrttx5YsQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 75B1CCE0DE2; Tue, 31 Oct 2023 15:47:44 -0700 (PDT)
Date: Tue, 31 Oct 2023 15:47:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH] refscale: Optimize process_durations()
Message-ID: <a6943003-da31-4ac7-8944-c7dc06381148@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bbbab32e3e104bdc2238724a6a4a85e539f49ddd.1698512661.git.christophe.jaillet@wanadoo.fr>
 <ozbrmbywamyfkv3amsf2dfdacwmi25serwhc75h6fpsahklsmo@rm43srgxumef>
 <bcd6bfe1-9891-4f22-86ad-361330e47e9d@paulmck-laptop>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcd6bfe1-9891-4f22-86ad-361330e47e9d@paulmck-laptop>

On Tue, Oct 31, 2023 at 11:21:14AM -0700, Paul E. McKenney wrote:
> On Mon, Oct 30, 2023 at 09:55:16AM -0700, Davidlohr Bueso wrote:
> > On Sat, 28 Oct 2023, Christophe JAILLET wrote:
> > 
> > > process_durations() is not a hot path, but there is no good reason to
> > > iterate over and over the data already in 'buf'.
> > > 
> > > Using a seq_buf saves some useless strcat() and the need of a temp buffer.
> > > Data is written directly at the correct place.
> > 
> > Makes sense.
> > 
> > Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> 
> Queued and pushed, thank you all!

But an allmodconfig build complains about seq_buf_putc() being undefined,
that is, not exported.  I suspect that other seq_buf_*() functions in
this patch might also be complained about.

I am dropping this for the moment.  Please make it pass an allmodconfig
build so that I can pull it in again.  Please see below for the commit.

							Thanx, Paul

------------------------------------------------------------------------

commit a1ef9b4cff53c509f412c354c715449d7f2e159b
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Sat Oct 28 19:04:44 2023 +0200

    refscale: Optimize process_durations()
    
    The process_durations() function is not on a hot path, but there is
    still no good reason to iterate over and over the data already in 'buf',
    but this is exactly what the current use of strlen() and strcat() do.
    
    Using a seq_buf saves some useless strcat() and the need of a temp buffer.
    Data is written directly at the correct place.
    
    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
    Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
    Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

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

