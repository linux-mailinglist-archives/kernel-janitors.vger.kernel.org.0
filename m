Return-Path: <kernel-janitors+bounces-7298-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7FA4BFB6
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 13:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB90A188D484
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 12:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976F020E03F;
	Mon,  3 Mar 2025 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+z8GQ6K"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B638202F9F
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741003340; cv=none; b=iOFAEo3y6XW31LQ/wMXghjNH1amX1ZEN64esnCQ6Lg0LqzGEjiVrDF00MamQ3YcInA9z9KVrmEsnAQmAONVre3/R9fDxtHkz3Ttzoq1RKaIgfTytdlWzZX8KUTFZ+kwT8q3ZMsV9XqxQd/Npe9Y/kU+FhUsf1exLnWwv09pZo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741003340; c=relaxed/simple;
	bh=uWrqL7qwHJ1xRe81W1yZdqN0xrTeQwVstuEoqTp4vdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5E96fS2FRd9LevXLr9tgv/yilCCvYKbdxA71cA68knxQiYx+k1WAJ8b7XSCqwVKBdS1v94SI6By/Rm1JbU29MVSOJZKLUNfQrZPPjiX7IDEw40AJR0iDxjCGIx885xDepTU26f8m/Zw/SZ9c1aPqyRccwfnd/6y8Wla+ewPxvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+z8GQ6K; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso2174486a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741003336; x=1741608136; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvjfazhXAUkX+q9ADQWctMmDsHuSAcb7Kglrffn5CF8=;
        b=J+z8GQ6KzwxpWwpV3YGxkzqQikDOY63gQurQH/Y/cL8OWNZA0azkubadKmtksdtqYc
         xU+gyI2iFllMV41ktZAsoFx6JyWM+JIlRLkVcyVsSNcwrfCqYXqikeJpr7XPutD6LMLW
         HENRTHMLZF48To0S3r/rpJLovnqUzJLhiJzyv6140a+OaqK+E9lX9/2tEmys/W9gYAYX
         wqFYDqbDkKSqk5stsLKfLF8p+o25nsxJxkcq6OBfHKa6Wc5jXQZnnjTJnjlhfK0XgbAG
         jY9JcMXhq9BB2LjMMI7FUIrkqpnSVpHfR0L7z6q/GJICdSX24UnNlUG49pN+M7GrYq4p
         o2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741003336; x=1741608136;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvjfazhXAUkX+q9ADQWctMmDsHuSAcb7Kglrffn5CF8=;
        b=HrTHUqVtC+un+V4fRA8vhkIwZLpFPTdxwPJp6xJcVbrUhDkBaTECghqPTO6xZLMkq5
         hxhzGjjxhJr8OkKzJp1SnddJRP3z1+GwTRmBRcLA1RCbe6iXUvc2UVKtWDS3ADR/oMam
         R+HYg1PM/CTOlwkOcdhNfY9w6f3ZB3QdRae8W60MDm1X8X/fGzz9LNaXxCdmQ9dLpRMY
         jRciyJ6i4kO9Fd4BsiAV6EEc2upCEKlQrDro6YBxQISzk9nrlC8y2zYUKUuuUFmFMlJs
         6+MBxpd7cb01A1EaFAmTFXbX5bEzm8amy9o1Y99nVzna5/ja2vw1So7J2GWvBsH2DfO8
         ofoA==
X-Forwarded-Encrypted: i=1; AJvYcCVBmeev2f99n9rklJQiZoiwq3DxXc/5FkBh4waq7CVvNpiyYFvo4jaCEWjWgDO2qpHS1LuGAinmTQgrb3VT3o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDEnGzUE+HKKZ3eUPSR8VOzmZGUGlq+kEXlSwUUkDR/Tf6GB5
	drIaf+I1nY0iNa92xwqBLz9PXzeZLxHg73nrXj9IXzZGC2o/RJMLMQ/VrbVdMXQ=
X-Gm-Gg: ASbGncshTXdrfPsLlvZubibV5bZgjQEKB8cjbWdPi3IjpNK0Mx2cttrYuYtzhFInNcr
	SsaqXgAZcmKEzKYTFDJ7rtHeklB/D9eZfuPXjLbheNx4WYDQfZ3jUTHBsjmqhT+uA+/8T2vzDaL
	rt6PJYiQASG4/f87THOmmYlNc7blxKJil95A7DVX9IbzazuCkBdK3vblq3XazpA9GVfqnO49LAR
	w4cXZ3Ext1x9bwIRLrE7AvquTl81qk64Er45dp8TgaoL2FdREFlsUAhUjrK1gorhqTkn1j2sHaO
	a03AoQc3oScMuJHhUz3ZxswJdp7x5oT0rfqLVtpDyuMN3/6Veg==
X-Google-Smtp-Source: AGHT+IEVLpvwi6O6OBs0WN+GyOzE3jpuGJmps4EUiNQjjGbXYoZLIY4WBBNb3SuJAGnkmtz62ElidA==
X-Received: by 2002:a05:6402:5190:b0:5db:f26d:fff1 with SMTP id 4fb4d7f45d1cf-5e4d6b62c36mr13405841a12.21.1741003336577;
        Mon, 03 Mar 2025 04:02:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c2f408cdsm6696931a12.0.2025.03.03.04.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 04:02:16 -0800 (PST)
Date: Mon, 3 Mar 2025 15:02:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ahmed Zaki <ahmed.zaki@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: Prevent use after free in
 netif_napi_set_irq_locked()
Message-ID: <5a9c53a4-5487-4b8c-9ffa-d8e5343aaaaf@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cpu_rmap_put() will call kfree() when the last reference is dropped
so it could result in a use after free when we dereference the same
pointer the next line.  Move the cpu_rmap_put() after the dereference.

Fixes: bd7c00605ee0 ("net: move aRFS rmap management and CPU affinity to core")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 9189c4a048d7..c102349e04ee 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -7072,8 +7072,8 @@ void netif_napi_set_irq_locked(struct napi_struct *napi, int irq)
 put_rmap:
 #ifdef CONFIG_RFS_ACCEL
 	if (napi->dev->rx_cpu_rmap_auto) {
-		cpu_rmap_put(napi->dev->rx_cpu_rmap);
 		napi->dev->rx_cpu_rmap->obj[napi->napi_rmap_idx] = NULL;
+		cpu_rmap_put(napi->dev->rx_cpu_rmap);
 		napi->napi_rmap_idx = -1;
 	}
 #endif
-- 
2.47.2


