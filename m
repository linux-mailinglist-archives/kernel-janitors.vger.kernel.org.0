Return-Path: <kernel-janitors+bounces-4479-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8349279D9
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jul 2024 17:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C72E9B2670F
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jul 2024 15:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBB41B11FC;
	Thu,  4 Jul 2024 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mW/GZCwd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077A1AEFFF
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jul 2024 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106366; cv=none; b=gfVaaNCWTX/J4GE5GrkdSa2N0VmR0o+1aud8qFAkUQsopV1AZqyLzsfCOxO1v+D7GlGr+1v3WILHMTz2mLc9cnSM3FRJX+MemDU3k9KYp6DBkKlB96/tsRUwUZz2h65MKAPxsHgfzObliTjXqBBGO2l0y9z3/9WsKrgWCC9MlVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106366; c=relaxed/simple;
	bh=GW7lGQVvoINycqpkDuvFso5boq2/G2LMAD35CBY3e+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofZ7A2M1u0Njj5P6HCven1WNWePGbiykPBJaI+pyzkqY0ypY+y1GPeBiiTA+uRWxP0K59+JKQ6lsnWMxHVgSdVQxjRREH4CT615HSIIxoF9uGacJLrvX9AQIJZIoLeLRrW8/0fmPgEW9zV3AxflUwACHI7+MjX/HQyJCv1WOiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mW/GZCwd; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25e3b8637c9so84033fac.3
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jul 2024 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106364; x=1720711164; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNuQK2cmBkSQYJ6c7VDkHOb8OIuBPIO52OK/qSuYR/Q=;
        b=mW/GZCwdMLuDCYGHfBumEj2WD7SxreB62nSDklaqbApugm9/RaOiK4bbQVQRNByIs2
         ssG3T4Dq/fO+Z65sLxzPcWweLic064yhcs0p71aaQ7KIMv5p/nbCL98VE+xzLtGJFHJo
         CQ4SynEF6t9GpRfphbr5qrJA4tYs3Pwwm0D42ywT300Pfrnc+xuHn8D02+MS9Nt5VhIk
         zT6ET+ofEwqRRv9LWGzr5p4oWEZsJmOIcxKd9yi3vm/zO4QjH7ADG5ZqgzRSaeK266zm
         aIlAPpG5gB1YtSLywpR+MbqDfimZ3YUxf4Ce0VhhJ0ibwB5Bf/mdMmWIx2Xhsz8ljKwZ
         RWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106364; x=1720711164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNuQK2cmBkSQYJ6c7VDkHOb8OIuBPIO52OK/qSuYR/Q=;
        b=aDfZ1L+OLkTd3XRev5q2wdIhJzQIxBZuMGu/rAMDwFJ5Rm6pJtXFuituPPIRXi8x8g
         9rDt0Ug5WBvg+ynKtSBrE5Oleiama8oa3V+MMzFoM4YLs6TQDYNStg0Cu83PqWDZP1f3
         MYid85ZpZkEFEK74yBWU8aTsWp0xwxjEHbgbirw/GKx83qb+R+SKay81qzIENOHKs3VC
         p/RiRsv86rl9uHcHeNCMzEVn521IGOwukfSs3s6I+S8lz0PDeNc4nq507ZzDUgtMPBhI
         ovsmN8N1GFQdZPQm5j9g/OXa+o89BFlT3+7Hmb0Aw3gV3AnfI45KZrUO7tDiGBqMCrzu
         nLnw==
X-Forwarded-Encrypted: i=1; AJvYcCWD/2H1m3Fxk2kadhZvuTjgO2V2GWeF36Sk6vYcuBjYxB7f1VSnalqkPFHmUvsppiYaOJ5VkEGn5rK2+nDIlEyhtmUiU0opFeP3VmWBxxoA
X-Gm-Message-State: AOJu0Yxc5+6cqkFFRM9fomgRzUXELZ9cBuzslMSXnH9NNXUKcImVk6sy
	B/pukDQZ8x4XYiKLJZUyj6PWTmD2vn1dbZT7ptllnB2VP1wBb72oAd4P79H46cjYNhNb3OqzHMg
	D
X-Google-Smtp-Source: AGHT+IFOSX1RgZBOPwSdETXKnceKwdzsvK0Bgb6C66NIKvTohb08sSlA2qq83eKVPmd1LfCeS+jAvQ==
X-Received: by 2002:a05:6870:171e:b0:254:8ca4:a189 with SMTP id 586e51a60fabf-25e2bb48b9emr1726668fac.17.1720106361830;
        Thu, 04 Jul 2024 08:19:21 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25d8e339b40sm3259752fac.43.2024.07.04.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:19:21 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:19:19 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yonghong Song <yonghong.song@linux.dev>,
	Christian Brauner <brauner@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH bpf-next] bpf: remove unnecessary loop in
 task_file_seq_get_next()
Message-ID: <ZoWJF51D4zWb6f5t@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

After commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU") this
loop always iterates exactly one time.  Delete the for statement and pull
the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/bpf/task_iter.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/task_iter.c b/kernel/bpf/task_iter.c
index ec4e97c61eef..02aa9db8d796 100644
--- a/kernel/bpf/task_iter.c
+++ b/kernel/bpf/task_iter.c
@@ -261,6 +261,7 @@ task_file_seq_get_next(struct bpf_iter_seq_task_file_info *info)
 	u32 saved_tid = info->tid;
 	struct task_struct *curr_task;
 	unsigned int curr_fd = info->fd;
+	struct file *f;
 
 	/* If this function returns a non-NULL file object,
 	 * it held a reference to the task/file.
@@ -286,12 +287,8 @@ task_file_seq_get_next(struct bpf_iter_seq_task_file_info *info)
 	}
 
 	rcu_read_lock();
-	for (;; curr_fd++) {
-		struct file *f;
-		f = task_lookup_next_fdget_rcu(curr_task, &curr_fd);
-		if (!f)
-			break;
-
+	f = task_lookup_next_fdget_rcu(curr_task, &curr_fd);
+	if (f) {
 		/* set info->fd */
 		info->fd = curr_fd;
 		rcu_read_unlock();
-- 
2.43.0


