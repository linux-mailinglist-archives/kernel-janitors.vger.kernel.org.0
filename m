Return-Path: <kernel-janitors+bounces-4670-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E42930BC5
	for <lists+kernel-janitors@lfdr.de>; Sun, 14 Jul 2024 23:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365801C20CD5
	for <lists+kernel-janitors@lfdr.de>; Sun, 14 Jul 2024 21:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDE813F42D;
	Sun, 14 Jul 2024 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKHlMD85"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4703482EF
	for <kernel-janitors@vger.kernel.org>; Sun, 14 Jul 2024 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720992693; cv=none; b=q50aPvQANYz0LI+fuCN/mkjLcqNcFhMmYssRLXbAWuos4tJ4ymH3Ub2SL+tV6k12aK65Uf3c8x6zjFfAoqrAXmCQROlc7UDQtoFZEfF/cDr7x+UMpSnkqT/6iIJ4kHuXB2X7OWCOCVRoBp22dH4eKvJEBtZ+upx0HmtZ5aRr+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720992693; c=relaxed/simple;
	bh=2/IUcE/CbaM1/3rQiemxwHQJB6/uEWCEbZtq2kHAnNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDhCG3I0bxxFmmMQ39U/n6Bm38I5MFNUz0HUzESl3geTx7reaqvvX1jwYkqYrlcXRl+IacNijb/Ij9maezbXpfu6mYHVOjw/nGTuYhFNlroXJInCDcuJivwZu0X/+fy34X5HPeyNp0eUBZhFBzkTRFoV+dgD1K//J6jpCzvA7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKHlMD85; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720992690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PajJI1FmeG3mQqOJs0oxZQhueS2YJaoO1QjtHDZ8Om0=;
	b=NKHlMD8581WSNocdsN3qNAY1oOf5eLfuCZZhDfzkjK+iexqmiR1BOCeMuGIvq3IbyBGVdp
	OgoDvexDa0v+AMab9vZSegnkDxhGesCYZJElVcFzOrdDlalWRGlNYWJIy8jJa7OQ7QgowB
	vlYslzWp6Ndydv83jFkAYsfY3zTNXLM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-jiYLKS4gPjehBlF5Ad8x5w-1; Sun,
 14 Jul 2024 17:31:26 -0400
X-MC-Unique: jiYLKS4gPjehBlF5Ad8x5w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35E1F19560B2;
	Sun, 14 Jul 2024 21:31:25 +0000 (UTC)
Received: from [10.22.64.27] (unknown [10.22.64.27])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC5391956066;
	Sun, 14 Jul 2024 21:31:23 +0000 (UTC)
Message-ID: <975d2b0f-f84c-4c84-adf2-098fef59d90b@redhat.com>
Date: Sun, 14 Jul 2024 17:31:22 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/lockdep: Use seq_putc() in five functions
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <aa9e1986-8631-405e-96f5-86a0f5a1eab2@web.de>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <aa9e1986-8631-405e-96f5-86a0f5a1eab2@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 7/14/24 06:25, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 14 Jul 2024 12:18:16 +0200
>
> Single characters should be put into a sequence.
> Thus use the corresponding function “seq_putc”.
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   kernel/locking/lockdep_proc.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
> index e2bfb1db589d..4612d1c4f45e 100644
> --- a/kernel/locking/lockdep_proc.c
> +++ b/kernel/locking/lockdep_proc.c
> @@ -101,17 +101,17 @@ static int l_show(struct seq_file *m, void *v)
>
>   	seq_printf(m, ": ");
>   	print_name(m, class);
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>
>   	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>   		list_for_each_entry(entry, &class->locks_after, entry) {
>   			if (entry->distance == 1) {
>   				seq_printf(m, " -> [%p] ", entry->class->key);
>   				print_name(m, entry->class);
> -				seq_puts(m, "\n");
> +				seq_putc(m, '\n');
>   			}
>   		}
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   	}
>
>   	return 0;
> @@ -175,9 +175,9 @@ static int lc_show(struct seq_file *m, void *v)
>
>   		seq_printf(m, "[%p] ", class->key);
>   		print_name(m, class);
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   	}
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>
>   	return 0;
>   }
> @@ -379,7 +379,7 @@ static int lockdep_stats_show(struct seq_file *m, void *v)
>   	/*
>   	 * Zapped classes and lockdep data buffers reuse statistics.
>   	 */
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>   	seq_printf(m, " zapped classes:                %11lu\n",
>   			nr_zapped_classes);
>   #ifdef CONFIG_PROVE_LOCKING
> @@ -422,10 +422,10 @@ static void seq_line(struct seq_file *m, char c, int offset, int length)
>   	int i;
>
>   	for (i = 0; i < offset; i++)
> -		seq_puts(m, " ");
> +		seq_putc(m, ' ');
>   	for (i = 0; i < length; i++)
>   		seq_printf(m, "%c", c);
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>   }
>
>   static void snprint_time(char *buf, size_t bufsiz, s64 nr)
> @@ -512,7 +512,7 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
>   		seq_lock_time(m, &stats->write_waittime);
>   		seq_printf(m, " %14lu ", stats->bounces[bounce_acquired_write]);
>   		seq_lock_time(m, &stats->write_holdtime);
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   	}
>
>   	if (stats->read_holdtime.nr) {
> @@ -521,7 +521,7 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
>   		seq_lock_time(m, &stats->read_waittime);
>   		seq_printf(m, " %14lu ", stats->bounces[bounce_acquired_read]);
>   		seq_lock_time(m, &stats->read_holdtime);
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   	}
>
>   	if (stats->read_waittime.nr + stats->write_waittime.nr == 0)
> @@ -561,9 +561,9 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
>   			   ip, (void *)class->contending_point[i]);
>   	}
>   	if (i) {
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   		seq_line(m, '.', 0, 40 + 1 + 12 * (14 + 1));
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   	}
>   }
>
> --
> 2.45.2
>
Acked-by: Waiman Long <longman@redhat.com>


