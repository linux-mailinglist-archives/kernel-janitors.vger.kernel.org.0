Return-Path: <kernel-janitors+bounces-1432-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A338389C6
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jan 2024 09:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3D21F2769B
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jan 2024 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555FB57313;
	Tue, 23 Jan 2024 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgRXNyiL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05F2B9CD
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000215; cv=none; b=B15iIn9IIxcv5TwBuG52HTybt1KYR+MBA7S8iWaS2laa1zSHZX3OD0/2WfTYSdt3zKTFMY0zxKJE8TSZb+33m7Up5AlD0N8C8M3A0Nrc+R49one7OgUxdZnKn5zt3P+oC+AAWAG1PN/Z0lK8baODCI8eBhiceR8MXX+y/C7Mm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000215; c=relaxed/simple;
	bh=IfZpzISfWAZNbaikyXYCaqj+bGCHCToXByFRkBXSgDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IryBRRVmnzKdluj6S2m8uopQykj34pisNOIG9SU9HtCyE7tg8qf5j2cqvARX+ff2Bsswk2j0yc7E26buwTNkILRex5nPj9erzURAnWoCyLDqR8XtXX6SdRXBXO8MMKYXkd2d5CaCyAWmHkHEtbksTQUP4kfVJjIAfiwcJw1bA04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgRXNyiL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e490c2115so30641335e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 00:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706000212; x=1706605012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GcK6zvLFuwSh9mo7ySciDzTNwWqWuU+gHFUQY91mYpM=;
        b=xgRXNyiL/ZKFtO/4ezv/wb6r4TXI5dvnUEevyYHetK+1qfBvjKx3xJ5qEqijn7fKdd
         4j9RnG4MjHXkILX6w2d2xLdWztqzDx6ApNZrDSJKAuCXSgO0Qs6QyA/RBvqyEj14eZQD
         lHgtVwz2ecVlDiMZofVBc4HsM2jJtrv1UZ0TE6xl+G7O4FvEB7PtyyyceYW/SIRe0lyA
         VWW21QzWHzMwEDsOUF3NkOe/7ZLRDXmMtFz2BvoU9AYNNoX4KoXeoJl5/dIl1gD/1YB7
         Z6HqMWlclnZOPEq3R4iHcR+Zn5sUAa2ckGwg24zH4GTcYkv/Yl/+xBfhqrRBJLClqC4J
         HpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000212; x=1706605012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcK6zvLFuwSh9mo7ySciDzTNwWqWuU+gHFUQY91mYpM=;
        b=jbR2v1Vm4jVqoq3UdsrHIYdxjV4ZjmghO5TmL3dMIFEKQ+MjUO9frNRNrfsdaWUtTb
         U/PE5IhqpCuwaqbu7QNC8xO6VjdjmPwGTkxYJaFS29RhDDjN6IcUXC6kQw8GlOI2KFp0
         GD8lPGKX/2C15u7fSdvVwBOhYOxCFlBsXGrwnWvUTylz9cyClnAY9NLKxOHRYswQZcf6
         Xw7dYGJbRW86EjpEiqLEemrf7g2ZkQrgPKwdiVE9SRmPkynxYAt3dN3OlHKRck3tKgoy
         yjWcV/0jtTTZxNsOZCIk8cij1b3YWsrnRSwnmNhLmYFByQuUq+24V8zdVn33P+FQc9+C
         xThg==
X-Gm-Message-State: AOJu0Yw/FB3buJ3Xs6HaOypTUipo8KIIEkRIElcH/tL/ghbqKGlYTR9S
	oHm7GFSyW4F1Di7i/+Brr76+ZqkSD0w4V9hjv5HVHGBULhftzoIOzj5PBPnFPL0=
X-Google-Smtp-Source: AGHT+IE83CqPYcjrXGj6lFrWB/MgUBCFYVdyddu4KjguVtrvYTGjEjec+5PDM6H+aqHZoQ35inLXdg==
X-Received: by 2002:a05:600c:1f05:b0:40d:80a1:867 with SMTP id bd5-20020a05600c1f0500b0040d80a10867mr276491wmb.146.1706000212591;
        Tue, 23 Jan 2024 00:56:52 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c154600b0040e880ac6ecsm21864357wmg.35.2024.01.23.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:56:52 -0800 (PST)
Date: Tue, 23 Jan 2024 11:56:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>, Felix Fietkau <nbd@nbd.name>
Cc: Colin Ian King <colin.i.king@gmail.com>, nouveau@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Message-ID: <fe659736-500f-4e59-a9c7-ad894155a675@moroto.mountain>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
 <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
 <55f0983a-300e-40bb-9142-6f4683914402@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55f0983a-300e-40bb-9142-6f4683914402@moroto.mountain>

Let's CC Felix on this one because he might know the answer.

All day long I spend looking at code like this:

net/core/dev.c:724 dev_fill_forward_path() info: returning a literal zero is cleaner
net/core/dev.c:732 dev_fill_forward_path() info: returning a literal zero is cleaner

net/core/dev.c
   696  int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
   697                            struct net_device_path_stack *stack)
   698  {
   699          const struct net_device *last_dev;
   700          struct net_device_path_ctx ctx = {
   701                  .dev    = dev,
   702          };
   703          struct net_device_path *path;
   704          int ret = 0;
   705  
   706          memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
   707          stack->num_paths = 0;
   708          while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
   709                  last_dev = ctx.dev;
   710                  path = dev_fwd_path(stack);
   711                  if (!path)
   712                          return -1;
   713  
   714                  memset(path, 0, sizeof(struct net_device_path));
   715                  ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
   716                  if (ret < 0)

This if condition might trick you into thinking that ->ndo_fill_forward_path()
can return non-zero positive numbers, but it can't.  It returns zero on
success or negative error codes on failure.  Smatch is doing cross
function analysis so we know this.

   717                          return -1;
   718  
   719                  if (WARN_ON_ONCE(last_dev == ctx.dev))
   720                          return -1;
   721          }
   722  
   723          if (!ctx.dev)
   724                  return ret;

Is this intentional or not?  Who knows?  If this were an obvious bug,
I could fix it right away but ambiguous stuff like this takes way more
time to deal with.

   725  
   726          path = dev_fwd_path(stack);
   727          if (!path)
   728                  return -1;
   729          path->type = DEV_PATH_ETHERNET;
   730          path->dev = ctx.dev;
   731  
   732          return ret;

Obviously this is intentional, but if you were tricked by the checking
earlier then you might assume that ret is some positive value from the
last iteration through the loop.  "return 0;" is so much clearer.

   733  }

regards,
dan carpetner


