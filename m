Return-Path: <kernel-janitors+bounces-65-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC8C7DCA19
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 10:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DF3FB20E2C
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C1118E32;
	Tue, 31 Oct 2023 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaavC45i"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A903FE6
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 09:51:19 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CFB1738
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:51:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3418331f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698745873; x=1699350673; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uS5kIhEwY6Pd5tMtZfalMIAUckhOrrSMyGLxR7DTu2A=;
        b=qaavC45iYB81LDUVzRaQXLG5jsLNkdDvIA8YID89QwGO3ihOzevOS/2+gYT6J9eZox
         BGCIdUNrALsjbVTpXgul/Cb3fQbUAz015I3UMx+LSyZ9+kXw/WC4U2ZtyIQOr+xUNI4c
         rAIiWFvhjIdZnbbxqV6BcNzOL1jM0/9bkEL8fq+O7ldtdLWn7Z8u4rIsWja6OsNigvTU
         hSGxLDY7f9nZh0rRZrPQyfPfr3pCZY1HVdkZ8rs/W2gyGapl1i744Mh+wzJZk9beS8YO
         cqlCiHQSnTEuiiTe7w7kAKHwIb5XXKiGxD0gEdD5/5cGEgm9ouGdjLv17uohw3FZFab4
         jvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698745873; x=1699350673;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uS5kIhEwY6Pd5tMtZfalMIAUckhOrrSMyGLxR7DTu2A=;
        b=HHnag2XLDjdNcuBLOXFyFFczDBu+AP62OWCEwVPW6NxC4GJ9zTpl7YpwbMxAE34UXo
         gZMzHgcq2ZdUVMUlSfG2J8NSgF3DHmOkUNBIfDrERfPPYAZaBgGddqPM5K80UTmv3Cl4
         2PBoMXsgYrd39EYmHzc9i2H7NvlzH8edTSPCqF35ma491g/W6X4cNNCa9qOieyr3whqg
         m2KfQOg62HduQaTrTDoYpwhs8ByySfS8eOfVfEtWNsBIYYOHpBzEZDpNiXAC8bXRuJpV
         sK2s6DZV0O6VO9iWDxCxUDSx5mQbAA2Y4s5ybQLV0MbXUS5ssin0F+KonBrZ26kJhvHe
         8jwA==
X-Gm-Message-State: AOJu0YxZu3d9sBzvgN8LqFSYwdSM3o583NWXzbHvNpgu8hvwmpOnW4eU
	3v/V1Te8GdZgpLxYgqieYXoRug==
X-Google-Smtp-Source: AGHT+IHJgWi4F34SEWxXBx7HVimrqe6w3C5UDD/SMZQZcN7gHe6mZAEbNQV6GWWsNWZh8BZwodgqdA==
X-Received: by 2002:a5d:6208:0:b0:32d:9e62:b443 with SMTP id y8-20020a5d6208000000b0032d9e62b443mr7103616wru.71.1698745872918;
        Tue, 31 Oct 2023 02:51:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d458b000000b0032d9337e7d1sm1106962wrq.11.2023.10.31.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:51:12 -0700 (PDT)
Date: Tue, 31 Oct 2023 12:51:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Safonov <0x7f454c46@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net/tcp_sigpool: Fix some off by one bugs
Message-ID: <ce915d61-04bc-44fb-b450-35fcc9fc8831@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "cpool_populated" variable is the number of elements in the cpool[]
array that have been populated.  It is incremented in
tcp_sigpool_alloc_ahash() every time we populate a new element.
Unpopulated elements are NULL but if we have populated every element then
this code will read one element beyond the end of the array.

Fixes: 8c73b26315aa ("net/tcp: Prepare tcp_md5sig_pool for TCP-AO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis and review.

 net/ipv4/tcp_sigpool.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_sigpool.c b/net/ipv4/tcp_sigpool.c
index 65a8eaae2fec..55b310a722c7 100644
--- a/net/ipv4/tcp_sigpool.c
+++ b/net/ipv4/tcp_sigpool.c
@@ -231,7 +231,7 @@ static void cpool_schedule_cleanup(struct kref *kref)
  */
 void tcp_sigpool_release(unsigned int id)
 {
-	if (WARN_ON_ONCE(id > cpool_populated || !cpool[id].alg))
+	if (WARN_ON_ONCE(id >= cpool_populated || !cpool[id].alg))
 		return;
 
 	/* slow-path */
@@ -245,7 +245,7 @@ EXPORT_SYMBOL_GPL(tcp_sigpool_release);
  */
 void tcp_sigpool_get(unsigned int id)
 {
-	if (WARN_ON_ONCE(id > cpool_populated || !cpool[id].alg))
+	if (WARN_ON_ONCE(id >= cpool_populated || !cpool[id].alg))
 		return;
 	kref_get(&cpool[id].kref);
 }
@@ -256,7 +256,7 @@ int tcp_sigpool_start(unsigned int id, struct tcp_sigpool *c) __cond_acquires(RC
 	struct crypto_ahash *hash;
 
 	rcu_read_lock_bh();
-	if (WARN_ON_ONCE(id > cpool_populated || !cpool[id].alg)) {
+	if (WARN_ON_ONCE(id >= cpool_populated || !cpool[id].alg)) {
 		rcu_read_unlock_bh();
 		return -EINVAL;
 	}
@@ -301,7 +301,7 @@ EXPORT_SYMBOL_GPL(tcp_sigpool_end);
  */
 size_t tcp_sigpool_algo(unsigned int id, char *buf, size_t buf_len)
 {
-	if (WARN_ON_ONCE(id > cpool_populated || !cpool[id].alg))
+	if (WARN_ON_ONCE(id >= cpool_populated || !cpool[id].alg))
 		return -EINVAL;
 
 	return strscpy(buf, cpool[id].alg, buf_len);
-- 
2.42.0


