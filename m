Return-Path: <kernel-janitors+bounces-6037-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69B99C0A5
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Oct 2024 09:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 358621F2336F
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Oct 2024 07:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A442D145FE0;
	Mon, 14 Oct 2024 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="1qlRRVC5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF1014373F
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889462; cv=none; b=E9ONSKiLWEwXtedP3FWYXY19KST8FGMeuaNEqKmfjITQS9NhjJ9rWAz/JfUgsDA8nHKy6ix6KsUqktMiitOOlMJPQ2ir/pM4bh02HjR7JWz6fi6dW9Gbi5UaHFlBtK0aoWCoBZ3Fsf0HGo9RRVwfSIHwQXRvSarq05vkuc/WC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889462; c=relaxed/simple;
	bh=NNv6gvfmx2HjUFMGU+o2ltt/UiZOt25h1rUaIZXBx2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnkscYN+X68Iy9mmyXv2U0HCFlExLatvSsFEMQgxJxy4eakrcSfYSkaYHTOP3MKjNyaJ1nWS5FtWU+SOcFvQop3MEgg/C32IzxtPkvKNriPH8eRhlrQNb9IG+aMqyAsM3J+PXbP48hU1tkXgDgVJ9ovz22CjudC/ABmCa/tL+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=1qlRRVC5; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so8424401fa.1
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 00:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728889459; x=1729494259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGaIhPPoqC5MI9WRgwGY99B8fU3f7PY4Vcuv5+yQqFs=;
        b=1qlRRVC5r5zo5QpkK4ITdgJm27XooPDYEPA9lLISmwFFfWFtpUAVjGtp1M50zt6vzE
         6d3ocD9PKu7DPWMe6eD3POXL5jASG6wVGhCu/e5Y7Bv8uLDP/oBTsj82LzCsAfIkqNM7
         fswnm54f2Po2PNeSSvl9/AKPW2eyuXPKE3JmSYtuPlwp8PsnLrQcfUabpKHikwyVeV89
         GFDnBftcA7RC8JAZzIxHc77uhWD/vHNK8x5dmVkQU8kPSEFy76djUNKE2SviqJeJJWHV
         /p4HScwn4u7+yoBwYmX6neZAtHgvEmIeI7UBn+nCkq/QfCfDCfYlNsQT0zOgRqz4dkOm
         leKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889459; x=1729494259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGaIhPPoqC5MI9WRgwGY99B8fU3f7PY4Vcuv5+yQqFs=;
        b=qP2Pk3quqTnETg7Rowy2NEHHUurWrPueAde7D4as0VmF3+uVh/PivP5jfk0csvwfzd
         F5q72JNbRUSxu7b9FJFu6srMcB8oklIIfBYOh8pSUDb1Lakd9Fui8c5bTE/lLA9i4PKE
         NjA4WiEVgH7BphhTDTRaLsRY99ZozP2xbS96MQYqHZy4+tdYGp+odxJStn33cduIBE8S
         5T3nF93sLR9QBsV2st7pZWGtdPrk72Vo/6NPOtESiE1sQgAOJJo3PBn6eXWCfdIcY+Ar
         3g4/bp24f1WHI9kUj9INS9BsqRmIQOND2ktPoGR4Ey1w1vqpWDGma9kKzJDDg0qQydME
         uRJg==
X-Gm-Message-State: AOJu0Yxjh37v9NxtB6RPjiB3VsoW0inM1gdXQF+FQvaZKK/3cpLGpg41
	YQMqikG+9cQ2w0UisZaqH4B7nX5hvPXOIihzE3uBHvnqvfxfVSk93R06/C1ARR9wVQTQoICaRWj
	VbzA=
X-Google-Smtp-Source: AGHT+IEm+t/0wxGBRiGGCCWGQXQM/paXJQi/z5wDFT45Y4vSsDzbKlZTz1XXD3y2hVv/E6wIFsje1Q==
X-Received: by 2002:a2e:6111:0:b0:2f9:ce91:dea9 with SMTP id 38308e7fff4ca-2fb327a6df0mr33120871fa.32.1728889458495;
        Mon, 14 Oct 2024 00:04:18 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d2196sm4631649a12.7.2024.10.14.00.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 00:04:18 -0700 (PDT)
Message-ID: <7982b197-8ca6-4621-b983-2a6b24aad2b6@blackwall.org>
Date: Mon, 14 Oct 2024 10:04:16 +0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] net: bridge: replace call_rcu by kfree_rcu for
 simple kmem_cache_free callback
To: Julia Lawall <Julia.Lawall@inria.fr>, Roopa Prabhu <roopa@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, vbabka@suse.cz, paulmck@kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
 <20241013201704.49576-9-Julia.Lawall@inria.fr>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241013201704.49576-9-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2024 23:16, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were made using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  net/bridge/br_fdb.c |    9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
> index 642b8ccaae8e..1cd7bade9b3b 100644
> --- a/net/bridge/br_fdb.c
> +++ b/net/bridge/br_fdb.c
> @@ -73,13 +73,6 @@ static inline int has_expired(const struct net_bridge *br,
>  	       time_before_eq(fdb->updated + hold_time(br), jiffies);
>  }
>  
> -static void fdb_rcu_free(struct rcu_head *head)
> -{
> -	struct net_bridge_fdb_entry *ent
> -		= container_of(head, struct net_bridge_fdb_entry, rcu);
> -	kmem_cache_free(br_fdb_cache, ent);
> -}
> -
>  static int fdb_to_nud(const struct net_bridge *br,
>  		      const struct net_bridge_fdb_entry *fdb)
>  {
> @@ -329,7 +322,7 @@ static void fdb_delete(struct net_bridge *br, struct net_bridge_fdb_entry *f,
>  	if (test_and_clear_bit(BR_FDB_DYNAMIC_LEARNED, &f->flags))
>  		atomic_dec(&br->fdb_n_learned);
>  	fdb_notify(br, f, RTM_DELNEIGH, swdev_notify);
> -	call_rcu(&f->rcu, fdb_rcu_free);
> +	kfree_rcu(f, rcu);
>  }
>  
>  /* Delete a local entry if no other port had the same address.
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


