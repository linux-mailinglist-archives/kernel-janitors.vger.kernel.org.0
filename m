Return-Path: <kernel-janitors+bounces-5747-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC598CED5
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Oct 2024 10:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255A51F23283
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Oct 2024 08:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F6219645D;
	Wed,  2 Oct 2024 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5bWtM38"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452446BA
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Oct 2024 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858199; cv=none; b=jvcrf6Tf6Gt7QhKnV5zDpHiYQxmX4eUt5ZO36bjTIJmDC7/ADSnlQ2uMW88AGJFgr66lL/8UwhyaSDzQ5sGnsMIldItf38p6JwTvRZc50bmLPlTjkqLaXE7t/b45C4W7QeeCIbpWENBEpTyrjea1YLPPosWDhtdAWrGEfWewTr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858199; c=relaxed/simple;
	bh=bNOrYjkHCBg/Fcd/LdNcDAu/YaCl9tCbo2Xxck+PiHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PhX9JvklYN3oRY1SYCBbjpUQ7ozQwdgQaiEDJ3GS2EEmraYe2lA1ehkDU7Q64Zc9ehi4NjWQr4zRvinnjxvHnxD9gDyT2PoKPx/1eDAtUfIfAMZwCvpulRhJSi4C02TmyztahFUOXjZ3IufPpUcil/zpE52pIAd9YYWJnizXW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5bWtM38; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so51803125e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727858195; x=1728462995; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kc6BiyuSD579Sv6LzlSE+1CxGu9PgjAtpw64mVktEYA=;
        b=a5bWtM38berS6MTkRq0hzVwB38eTLheAiA3K9tFXCpYJK0u272XC5zg32EpNqCcAy+
         mpmIyb7ZgQ7j6xpq0tMYDywixYOvV8+rf6ibo2s4SHVquZvmo8cEnEJKdDtSEpH8qRNP
         zAh4sH+0BFaaEg56jVwJPU1YBHjJbPQ3lLBP04JT+PRZkKnU7Iq4y/BNgACbOr8a0htL
         4FJLMYYG5X+laz8JPh/TZq1jY42Z1EairGY01POCR5Wu0Yk16IPswIduYjS50R4de0e2
         99Zd7tRIanhUHq1OmSVd823nyuQ+B3hfRnIkBnVMXRku9l2fL79JHq/Jln5Hpc9q4XGX
         2GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858195; x=1728462995;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kc6BiyuSD579Sv6LzlSE+1CxGu9PgjAtpw64mVktEYA=;
        b=KdnWLO0mdCS45dJlRr8deKjeFRvR9zwNg6CWTBfQbZCXgRsCPZM8EPQmA8W6Z+Fl/h
         KPP9paWnj7JLMk5MWi9FGt4Ko2S9dHATnCmzZMZT9oVmxjE9WkMCkt/0yyzfHKFbDTHx
         F/7Oa6ISlx7/u6rAZWiZSEm+0csuQw/62I98jGl2f6bAY4i7WjkmdpehSQnow+TB+Ktg
         85+34X4JC3Mgaw/bj6APUAdPyzbWygyGAyQsFto7nwVsUQE3LacHNOSTr9yxo5GOroRL
         pTojN3SLQ+rAvErJGfdjNdzgC+SyzxF40YuBxyAW9xeWVq/D3pJavviTwM29FH6s1MnK
         VIFA==
X-Forwarded-Encrypted: i=1; AJvYcCVbZydnvfT0d6HmPBCmZrRSVrpBiqnTsISYXKeyy5k9JjDykwAFKBZI0zQcO/Sk+TDBJyNPwwsQBa/iHq57IKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKPlFrbgus3bl5TH4d0G321ejy5tJE8GjP+H74ttjmw4kavz7
	+Fdj0pzBgq4d3fzgwiEAn/sm8udeZNm+JJN4I8ZWEuKuEUqjLkuIiUbUW9Z/GxSYVhiA0mfFRwT
	p
X-Google-Smtp-Source: AGHT+IE49N9Qfy5+dsTk1nkwupACM5L0mU69EfhPe8nDnMTvJtXqKCmy5mqr/pcTmPLWRDJ6zsXonA==
X-Received: by 2002:a05:600c:896:b0:42f:7717:ac04 with SMTP id 5b1f17b1804b1-42f77957a32mr15915725e9.16.1727858195297;
        Wed, 02 Oct 2024 01:36:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79eadd8csm12217495e9.16.2024.10.02.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:36:32 -0700 (PDT)
Date: Wed, 2 Oct 2024 11:36:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yu Kuai <yukuai3@huawei.com>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] blk_iocost: remove some dupicate irq disable/enables
Message-ID: <d6cc543a-e354-4500-b47b-aa7f9afa30de@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These are called from blkcg_print_blkgs() which already disables IRQs so
disabling it again is wrong.  It means that IRQs will be enabled slightly
earlier than intended, however, so far as I can see, this bug is harmless.

Fixes: 35198e323001 ("blk-iocost: read params inside lock in sysfs apis")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 block/blk-iocost.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index 9dc9323f84ac..384aa15e8260 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -3166,7 +3166,7 @@ static u64 ioc_qos_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
 	if (!dname)
 		return 0;
 
-	spin_lock_irq(&ioc->lock);
+	spin_lock(&ioc->lock);
 	seq_printf(sf, "%s enable=%d ctrl=%s rpct=%u.%02u rlat=%u wpct=%u.%02u wlat=%u min=%u.%02u max=%u.%02u\n",
 		   dname, ioc->enabled, ioc->user_qos_params ? "user" : "auto",
 		   ioc->params.qos[QOS_RPPM] / 10000,
@@ -3179,7 +3179,7 @@ static u64 ioc_qos_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
 		   ioc->params.qos[QOS_MIN] % 10000 / 100,
 		   ioc->params.qos[QOS_MAX] / 10000,
 		   ioc->params.qos[QOS_MAX] % 10000 / 100);
-	spin_unlock_irq(&ioc->lock);
+	spin_unlock(&ioc->lock);
 	return 0;
 }
 
@@ -3366,14 +3366,14 @@ static u64 ioc_cost_model_prfill(struct seq_file *sf,
 	if (!dname)
 		return 0;
 
-	spin_lock_irq(&ioc->lock);
+	spin_lock(&ioc->lock);
 	seq_printf(sf, "%s ctrl=%s model=linear "
 		   "rbps=%llu rseqiops=%llu rrandiops=%llu "
 		   "wbps=%llu wseqiops=%llu wrandiops=%llu\n",
 		   dname, ioc->user_cost_model ? "user" : "auto",
 		   u[I_LCOEF_RBPS], u[I_LCOEF_RSEQIOPS], u[I_LCOEF_RRANDIOPS],
 		   u[I_LCOEF_WBPS], u[I_LCOEF_WSEQIOPS], u[I_LCOEF_WRANDIOPS]);
-	spin_unlock_irq(&ioc->lock);
+	spin_unlock(&ioc->lock);
 	return 0;
 }
 
-- 
2.45.2


