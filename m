Return-Path: <kernel-janitors+bounces-7821-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD44A98367
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Apr 2025 10:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE0B816BEC2
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Apr 2025 08:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD14281357;
	Wed, 23 Apr 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozVjPv2E"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A2280CD6
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396487; cv=none; b=gmQKt7jB1BKM+TSOg8Ji6RdSbmaHszmYkQ7MLgCaVy9a9iPwC9m07KtL5piuGykYMpb2cyRnRfJY/29CEox2ljYobGt3l3XYNk7D+c9ydhr1pBMcZ8lA07UYejW/q/Cj+M5y7QeWrnk5P7U8CgSARV8li3YP1pIYVT0f2GREEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396487; c=relaxed/simple;
	bh=0XEqfSAxlPY5os2nxDoIwRW/AGhrDkurjFzqdCvEZyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1ZyAvk1Id1np/QYUX07NWERDnR1nMJOMQGj0ZRHBKYsiA8jW04WBX7nrs+NdFTah3Y/Mvm87LQ/jzWKuUJeJuEiNUJWDnfJnod4vnKGcRc5rkIUSSMdN4DwfKpdmvNDGUUVe+ECOKH8lVUCYqeLVgQI2x87ZMcxko0xet0VxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozVjPv2E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so55235095e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396482; x=1746001282; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8gf1/v5lhBj3nTJ7U9oiBRoFIhc/ib+8WshbuHJPe0=;
        b=ozVjPv2EvWvqWbFFDCuonjx+z/Lz6ZvSEDHCzbc5Nvo+TyqVBFmVK+BbmUqi/H3Roe
         8mPR5AVbtjfD26khBXumkCKjd5Yv1A3qg54Ko8heYdQIVHzLZJybbGQTuheMHwEd7Q0l
         NmNyldolTZZOnMFRAZtKu3M7tpiBIOIybRD8GRFeh2H7QoBAHY1UavFQnH0HtiCWdP+P
         /mOdAoGQp7ux3IY0XL46ZC6WYYicT3i2l4cScUfeCWsxl36nF3mDrCVnNMiVQGN56+Qv
         VThP5gs7A8TtKPNPWZem3XjY4fAM0ZZBqEtl91bUCwxLrAFIQo4S6puIRaCg2Enhzvf0
         +B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396482; x=1746001282;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8gf1/v5lhBj3nTJ7U9oiBRoFIhc/ib+8WshbuHJPe0=;
        b=w5EKpNmoHDQCgu2SHUcHYJYU/RSD2fGvydjvsWOZrVTRcio/4bkb+5RmoJMCdcqm1C
         GR7FDJevZ7hpbijHUa6+r3Ku1s0nJ295sOIyerJvG74K5RNz8gAif/M8hjlxS5sTnDbm
         85OtRbJegsjRL7clMhFG+YiahOA8Zob3vjCn0+TE2E/g+qLbNXbLrbCQpQs8lYcTx461
         N2jeLjZ14ZOrvuMgV7OXnlccehqvVKISqewgqjBB+YZvGcicq2gW09b+Brtanl6I1tZX
         jZ1cGmoaWsaTl9TaDJrgmJgj3Dq+paOJZH7DfkZrqFcl6SV9RWV17BhhRPZX3t/zSiyF
         QgEw==
X-Forwarded-Encrypted: i=1; AJvYcCWBXoNSHRWwgT4uKUatHicfOWLbeKIQbDb1LJRe5M9aZqbib1y/nWYb4AzugU7pykvmLYwj5yZGtWmBlA2Y0H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfxCX4ponXqCkyZpftJl34miLW5pyZ06crmkQOiN19R78AnID
	G+EdaFtCDx/3UfbDXFkCuawfuXcwl3bFEAZrsDTYJG27wYMJGCRAE/FSz1h5p12uXnW9U1dbuG5
	c
X-Gm-Gg: ASbGncu1FVFDinUAtINc1nDxXuONuhpPYiyrPOOFRFCv/u4u0YV7gvoZSe/4EARQfD8
	3RxG3KJVkOibD7zsnmy5cLpAUOUMsqPoK7Jl15spn9pFLp2p33ej1uGz165YrN+BjILXsqv4bCo
	euGtpSaboCxRkpFRPoJVCyCBelLqoc/jsQ1Fge4A4VpDFCLhi7KAigo8jbD8mbmZYfI7EXORpeY
	B4G5aI+oovEZDdNnrHKcZE8E8BybZLdKvRfTrq/q3a4WPqkRpFfksoHjAYU1MrkCjCr1h9YCA3W
	zJLhsThRF3alpDQBX2Ry3vAJXymvVuHvFw+v1yEglpD6Bw==
X-Google-Smtp-Source: AGHT+IHWYSrmnac2ZIJgkK3CcnsC+6t1hYnQGT7QpTZYVmOgik/OcS5nSxSw/Lh3KD6scYknsYVhAQ==
X-Received: by 2002:a05:600c:3c85:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-4406ab98242mr134584375e9.8.1745396482254;
        Wed, 23 Apr 2025 01:21:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092db2bd5sm16760175e9.26.2025.04.23.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:21:21 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:21:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <aAii_iawJdptQyCt@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

When the list_for_each_entry_reverse() exits without hitting a break
then the list cursor points to invalid memory.  So this check for
if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
variable to track if we found what we were looking for or not.

Fixes: c3f55241882b ("i2c: Support dynamic address translation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/i2c-atr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index d5aa6738370c..1aeaecacc26c 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -240,6 +240,7 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
 	struct list_head *alias_pairs;
+	bool found = false;
 	u16 alias;
 	int ret;
 
@@ -258,11 +259,14 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 		if (unlikely(list_empty(alias_pairs)))
 			return NULL;
 
-		list_for_each_entry_reverse(c2a, alias_pairs, node)
-			if (!c2a->fixed)
+		list_for_each_entry_reverse(c2a, alias_pairs, node) {
+			if (!c2a->fixed) {
+				found = true;
 				break;
+			}
+		}
 
-		if (c2a->fixed)
+		if (!found)
 			return NULL;
 
 		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
-- 
2.47.2


