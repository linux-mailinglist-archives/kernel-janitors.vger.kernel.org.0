Return-Path: <kernel-janitors+bounces-5806-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E298F03D
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2024 15:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87F8282AAC
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2024 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56D019C542;
	Thu,  3 Oct 2024 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KuvmOa3x"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E02BAFC
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Oct 2024 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961689; cv=none; b=ZSfuplOOon+85OOF+iNRbZwShk7UnGjpz1h/UNcKI+chLErl2/cwY456aIfKqMxV4KGOnm6BC5M4HI+eOYqd+jR8aAuTI9UQFovbu2p+lv1sw8nHVLM+zmDB9UkXmtHZK0IQD0qQHFmj/JUM9SlyUdFePLLnHZuO2jRm815J8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961689; c=relaxed/simple;
	bh=Z9XgoL99teLoFoNiHQ/T7CPkBXrpsvXcREZF6sRxZW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmQrKCD5BpkAsg5e4NkuYriO/KykKqDbGdBtC5G556pDU2ce2MiUL9mZv414OQSOPJ9E03Y5eMu6rMd0RFP54xi7ymJbKWCrIPW6Pw8TjS4cEadhsJThY+7P3BaV3Cf2PYaTnWoKTY8TC+Ts/QKvEFOmHu7z+sJWvXY0hwwUFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KuvmOa3x; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8323b555a6aso61303639f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Oct 2024 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727961687; x=1728566487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eULbr4TsoYa61/A8JOQXACnDP0XDqLP86c5gLY8rbmg=;
        b=KuvmOa3xE23DvQqNzwQdvTvE5UhT8Hy6VUFmYTpwJghzgzoaJrBwB/tYraSIFIHWyt
         mADm1kMG7XwSax9hL7oYBhGdYm1XoO6htVT2oKF38jyOEMrfp8RESfeIWwLbhRR7jF6+
         8Z6akxnNGCrQw0/uvENuU9yNjxQoJmkN2mojbt79L95DHTd28xtx51Y55pp1VMN4XvDu
         G5yyvDmbDiffzSu6bDnXIFaRb7G5lKsPbEmhZD1Vy3UqssnW6rHc0raptuxb2bD7TP2J
         GKAxMr4g34QbCk54YS0wYRgjcY8ay+LpIH2xOyFHGHAA/cEZfUTro9WEfLJcpA/ZzVd8
         Hx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727961687; x=1728566487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eULbr4TsoYa61/A8JOQXACnDP0XDqLP86c5gLY8rbmg=;
        b=C0cLyrpnATL35CJEu4Lyq7Tvhl18uwk6PYsYrQjNMCo9sQeOYFhNKD7sFmEJ2v2H0x
         JEHHuPeMBEMkJ738zJCFyXPw7UmEbhtZavy2vH9DJMrHGaehr14jGI+R47dx3fmFfulS
         BlRrAE1/NKgkt25k8WufRfbHCH7ipwCtQ8W0+Sxs+0dK+LYaqWmS9sfb28L5ISl2jbjY
         l2Pc5KAY5cOzjUipccU1IvpVZpHyvH5AJDKotPTTqsH+tH+DIZWjLVf+R4km5VAq3vbQ
         S2+0PUhIv+oLm6illve7bfIZAdFe5qYt8qc8TBgKGsMiFrVbqBIxj8sXUeYsS27rtC2+
         dRMw==
X-Forwarded-Encrypted: i=1; AJvYcCW1PU2VDuLpXE8szF2n40dQ2ibD8xRkjDQKB4URyJ90x/Egxz8I0GnwomxlQ2l8moXDIQVw6XVnwCEGaEYvMAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LtJ+rCAWn4tD0Mr9cb3uGBr1d0StcQ0nNytmAoUNmu+BYl0/
	XtJ3BwlkqY+a0Xk7OKG36v+QJexu1AmOZGIVoTxa2TX2r0w1MUZ3JmpTKCQurMs=
X-Google-Smtp-Source: AGHT+IFjlNg/Smwj4Ff8kYKTAbnsTGM3VJQtCnUDqYyE6RIcRzBsFaxmzd9qPRCnay5mniXJok6JvQ==
X-Received: by 2002:a05:6602:6409:b0:82b:42f:41d5 with SMTP id ca18e2360f4ac-834d84c3930mr696767539f.16.1727961686848;
        Thu, 03 Oct 2024 06:21:26 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db55a63db7sm268802173.119.2024.10.03.06.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 06:21:26 -0700 (PDT)
Message-ID: <fe7ce685-f7e3-4963-a0d3-b992354ea1d8@kernel.dk>
Date: Thu, 3 Oct 2024 07:21:25 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] blk_iocost: remove some duplicate irq disable/enables
To: Dan Carpenter <dan.carpenter@linaro.org>, Waiman Long <longman@redhat.com>
Cc: Yu Kuai <yukuai3@huawei.com>, Tejun Heo <tj@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, cgroups@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>
References: <Zv0kudA9xyGdaA4g@stanley.mountain>
 <0a8fe25b-9b72-496d-b1fc-e8f773151e0a@redhat.com>
 <925f3337-cf9b-4dc1-87ea-f1e63168fbc4@stanley.mountain>
 <df1cc7cb-bac6-4ec2-b148-0260654cc59a@redhat.com>
 <3083c357-9684-45d3-a9c7-2cd2912275a1@stanley.mountain>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <3083c357-9684-45d3-a9c7-2cd2912275a1@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/3/24 6:03 AM, Dan Carpenter wrote:
>   3117                                  ioc_now(iocg->ioc, &now);
>   3118                                  weight_updated(iocg, &now);
>   3119                                  spin_unlock(&iocg->ioc->lock);
>   3120                          }
>   3121                  }
>   3122                  spin_unlock_irq(&blkcg->lock);
>   3123  
>   3124                  return nbytes;
>   3125          }
>   3126  
>   3127          blkg_conf_init(&ctx, buf);
>   3128  
>   3129          ret = blkg_conf_prep(blkcg, &blkcg_policy_iocost, &ctx);
>   3130          if (ret)
>   3131                  goto err;
>   3132  
>   3133          iocg = blkg_to_iocg(ctx.blkg);
>   3134  
>   3135          if (!strncmp(ctx.body, "default", 7)) {
>   3136                  v = 0;
>   3137          } else {
>   3138                  if (!sscanf(ctx.body, "%u", &v))
>   3139                          goto einval;
>   3140                  if (v < CGROUP_WEIGHT_MIN || v > CGROUP_WEIGHT_MAX)
>   3141                          goto einval;
>   3142          }
>   3143  
>   3144          spin_lock(&iocg->ioc->lock);
> 
> But why is this not spin_lock_irq()?  I haven't analyzed this so maybe it's
> fine.

That's a bug.

-- 
Jens Axboe

