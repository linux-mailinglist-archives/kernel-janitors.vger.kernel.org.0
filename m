Return-Path: <kernel-janitors+bounces-1260-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C982BB6F
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 07:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0C941F24626
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 06:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C42A5C900;
	Fri, 12 Jan 2024 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPASxGTR"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514E5D720
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3368d1c7b23so5288251f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jan 2024 22:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705042785; x=1705647585; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMDSp2ZNZdvA1/0x96e6idKEXK9ueWlbixOmKjycJeI=;
        b=mPASxGTRG4ee1EsbMUtyLbavfZwSNuWYoQ2tS7jA2O33T5m815dQsGECfJUq5smV5y
         rkI/FprsHB+As5Pm82Z9NlqURdjNipW3FNw9TQd3XmeD1sdCYYm+NT6Y+NLIDkvl2fi4
         +EshQEnELjsu+TREkJigi7yaUNAz04SjX6QL7mnoMuF/PS3EwlFvuc58N1Kp1xwDsW49
         Tad9FzEdwdkwSlmVb5nkypHZ9khY4BLpvXME6KsUDL7sdaEKw6Pq9pi0NT45PdmtEVgl
         i8xmhtMG6VLILGDmYiAJmeHtlxwHNVM866/U+vmQ2S7glyAQRhrgwQJ0/9RtX8YU4Qh+
         l8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705042785; x=1705647585;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aMDSp2ZNZdvA1/0x96e6idKEXK9ueWlbixOmKjycJeI=;
        b=KSj1gvj90opM7NCsB01jlza8rslQ13ceEhD/E3AVWOG8XoY5GBBCl7oYbk6r7ZR7xp
         AXYs3eIM6zb6ncu0pLNQXcAkmYzxegruAFzJaJnFK9/mgaMEoOk/gzqCZQzTF0LEoDjK
         hu5GE6YYXlKZxMLM7Ps5M8COirlaK7RIpb+PxJ1XR/M6rSGS7iMESTRBWhYp0IG/7OW1
         9gfjG4QYteeFWCb+wqgo/ju/D/Kgnt9ZanvooZpvZgkKWbcytfUYzm9qguKd1xkJlIAX
         yX4XfvKD8rEMrlyIbgsAvjpnjXJj+3U/JWur0qgSMqYITIsNzXd71qvJKirvMMMmPJBc
         PAGA==
X-Gm-Message-State: AOJu0Yz/ZizuMz8IYX6TuI6AaWn3SThzrQ97jzyD4lt22yyIWXZ0t0XB
	4c9/ti1zCNvTZxFJ51Lql85OdpSS955vDA==
X-Google-Smtp-Source: AGHT+IFIM8WcAUdOil9Y7u+h4e46rIteWp4Vx2BN9L2wWJb+W2y9/7uTleu8vvvEr7YShi+xUYEX6w==
X-Received: by 2002:a05:6000:cd:b0:336:77a5:479d with SMTP id q13-20020a05600000cd00b0033677a5479dmr436727wrx.123.1705042784923;
        Thu, 11 Jan 2024 22:59:44 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6d50000000b00336a0c083easm2990218wri.53.2024.01.11.22.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 22:59:44 -0800 (PST)
Date: Fri, 12 Jan 2024 09:59:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] netfs, fscache: Prevent Oops in fscache_put_cache()
Message-ID: <e84bc740-3502-4f16-982a-a40d5676615c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function dereferences "cache" and then checks if it's
IS_ERR_OR_NULL().  Check first, then dereference.

Fixes: 9549332df4ed ("fscache: Implement cache registration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: My first version introduced a race and a possible use after free.

 fs/netfs/fscache_cache.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/fscache_cache.c b/fs/netfs/fscache_cache.c
index d645f8b302a2..9397ed39b0b4 100644
--- a/fs/netfs/fscache_cache.c
+++ b/fs/netfs/fscache_cache.c
@@ -179,13 +179,14 @@ EXPORT_SYMBOL(fscache_acquire_cache);
 void fscache_put_cache(struct fscache_cache *cache,
 		       enum fscache_cache_trace where)
 {
-	unsigned int debug_id = cache->debug_id;
+	unsigned int debug_id;
 	bool zero;
 	int ref;
 
 	if (IS_ERR_OR_NULL(cache))
 		return;
 
+	debug_id = cache->debug_id;
 	zero = __refcount_dec_and_test(&cache->ref, &ref);
 	trace_fscache_cache(debug_id, ref - 1, where);
 
-- 
2.43.0


