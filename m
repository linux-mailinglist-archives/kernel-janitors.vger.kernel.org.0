Return-Path: <kernel-janitors+bounces-1962-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912086C26E
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Feb 2024 08:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80D121C22C13
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Feb 2024 07:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C252F4D11B;
	Thu, 29 Feb 2024 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwlJRQP4"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAD4CDE5
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Feb 2024 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191351; cv=none; b=Fw7crLnGcb/zP/QPRTmVVJra0+mMw02qXCvUpH65bKwdPcXRdQ13e893abFUOTaJQtguUlRtIsVsnXC6BFEDk+Xe+rFw8ymTaZIRP8ij1isgTD4Sw3JMce4XapLmvlwvlwPjCKVy9bsgHs/2E0h0CVFBmlA/caTzmXwYx4WafM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191351; c=relaxed/simple;
	bh=B2rMDekt5HtMATAH5NbOO/N+gagM+7TOQatckzXA2CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP4GD6+mfruPw7RUAJf8ECN5g8LP/eSDAr4E58yYT0axsKuaBIraSEBUWrSTmMJkUqZXokVHhMnPtb2kqcYRzmKbgMCmSwiylWXJLBtA6LwYftS0cgo6ZT6Ny7SEyGABx71iChmmJ3vHCDxyjATrwYSHx/2F2BhLYxLeM1ZbLWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwlJRQP4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412b40e023dso4186795e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709191347; x=1709796147; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSpkmdwZczDb3MWqwWIfoboagQrVL6Y3FYyvphJz1kY=;
        b=GwlJRQP4QjgGr3M8YAHEpOfftnGhTv5zK2HTol5P1NTIM2q2tFp7GJH/uMor+cJPcL
         GiAYVKhD/t104gC2Ai4431Pxs2C1erhGkDGwsXmfcGYUcZURLrK9SvVn8I6n4aJNEYy0
         HihMgELy4oo8fQyJMBz16TrNBaYf/edEh0QAKZ2HxqicFQsqvU7l2z2U4D2Phw8baBaO
         FtfTbfeLHNGe5ecQmLu8LMhLiYBElkesjqRA3JKpbfMpsm1scXDVqs1xt/mrZMcW+srz
         5JafF6GTazkxrNf3goXIfE4CK6VOaK5bylvjv9Y5Nh9zUYpa4fJHw1iueDMCyYdRDDcM
         Lm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191347; x=1709796147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSpkmdwZczDb3MWqwWIfoboagQrVL6Y3FYyvphJz1kY=;
        b=HUFR2KYm3CHoqJlNxfi2oflKi8GLlWB+Pda6gVv2ngey1PFXh7m3eUO6+AGXBY/Xx/
         U8NmOSuY4xvZaYaLJxQy2F022st1TvGBMCsMbvNlwwo3t57QfK8HHfFxp54gm/lb789P
         X1STc9fv6UhiOWxe1EMlPX8AfjiVpeubCdQOaY3HPAF3yrx3BQnh1aR7kM8X0qYJGBdT
         c8UHEbKrgmz5KUrkQ8WX/7pWUWG5yP9/+bWox8N5xMGGrDEd5EBqD/NUs2zc1jq++PZw
         /IKERw6XMQggoXC2SIbX1YOig5Arky4zkKKVTZUNOg9+XoNuHnqChqcwvvGfh72vU0Bk
         lPOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmKlANJjo4hbjIUfMJV4cTPxiX/Lg3Ay3LdLQQw50R05dq2kZZQRCddCiedgp8zt4nOf/e6bsNjh4zAxn2IeUcPPIM3TA3UaaJjm1ixSb5
X-Gm-Message-State: AOJu0YyBJj3p+Gwhmct205EUP0YfZMR7GPmWBu0YZgeRHYZKCnySafg/
	7lFTcHWult/I4K9kH2I1oyUrnZeDZDsKK6xW8VLLkHD43M7dzMnRlcsmffft9fM=
X-Google-Smtp-Source: AGHT+IFd5PRO4Rm9BiSKL65Z1o+8jKo2we3uU/kJCWedakJEnZxvvBIupcRo7apFrUM69zhmpKKPKg==
X-Received: by 2002:a05:600c:a4c:b0:412:afed:5cfb with SMTP id c12-20020a05600c0a4c00b00412afed5cfbmr1161716wmq.15.1709191347593;
        Wed, 28 Feb 2024 23:22:27 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b11-20020a5d634b000000b0033d6fe3f6absm908274wrw.62.2024.02.28.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:22:27 -0800 (PST)
Date: Thu, 29 Feb 2024 10:22:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH] lib/stackdepot: off by one in depot_fetch_stack()
Message-ID: <5d74dbd9-99e4-4ebe-a9a0-bd8f571d0f56@moroto.mountain>
References: <361ac881-60b7-471f-91e5-5bf8fe8042b2@moroto.mountain>
 <CA+fCnZd_eNHes56x3edzcYWeDKW2WRJYqrz_FyCks5wxtLdFdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZd_eNHes56x3edzcYWeDKW2WRJYqrz_FyCks5wxtLdFdQ@mail.gmail.com>

On Wed, Feb 28, 2024 at 06:10:31PM +0100, Andrey Konovalov wrote:
> On Fri, Feb 23, 2024 at 3:20 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The stack_pools[] array has DEPOT_MAX_POOLS.  The "pools_num" tracks the
> > number of pools which are initialized.  See depot_init_pool() for more
> > details.
> >
> > If pool_index == pools_num_cached, this will read one element beyond what
> > we want.  If not all the pools are initialized, then the pool will be
> > NULL, triggering a WARN(), and if they are all initialized it will read
> > one element beyond the end of the array.
> >
> > Fixes: b29d31885814 ("lib/stackdepot: store free stack records in a freelist")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From static analysis.  What seems to have happened is that originally
> > we stored the highest index instead of the number of elements and when
> > we changed the > to >= comparison was overlooked.
> >
> >  lib/stackdepot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> > index 8c795bb20afb..af6cc19a2003 100644
> > --- a/lib/stackdepot.c
> > +++ b/lib/stackdepot.c
> > @@ -447,7 +447,7 @@ static struct stack_record *depot_fetch_stack(depot_stack_handle_t handle)
> >
> >         lockdep_assert_not_held(&pool_lock);
> >
> > -       if (pool_index > pools_num_cached) {
> > +       if (pool_index >= pools_num_cached) {
> >                 WARN(1, "pool index %d out of bounds (%d) for stack id %08x\n",
> >                      pool_index, pools_num_cached, handle);
> >                 return NULL;
> > --
> > 2.43.0
> >
> 
> Hi Dan,
> 
> This patch needs to be rebased onto "lib/stackdepot: Fix first entry
> having a 0-handle", which is now in mm-stable.

I wrote it on top of that patch...  Backports will need to be adjusted
to handle it, I guess.  The "lib/stackdepot: fix first entry having a
0-handle" commit has this note:

    This bug has been lurking since the very beginning of stackdepot, but no
    one really cared as it seems.  Because of that I am not adding a Fixes
    tag.

I don't really know the code very well so I can't respond to that.

regards,
dan carpenter


