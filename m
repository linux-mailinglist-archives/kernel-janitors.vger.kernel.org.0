Return-Path: <kernel-janitors+bounces-3053-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041C8C1059
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2024 15:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C46A2B2393C
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2024 13:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324F2155A34;
	Thu,  9 May 2024 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKHZ1adM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423415279B
	for <kernel-janitors@vger.kernel.org>; Thu,  9 May 2024 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715261187; cv=none; b=I2eOiSkk0qXZy+IETqnaH5JWhxNdlkIG+8MvJP0PQGeuw5X0J3f7I9xGEnBB0MUHRDNxLhrr2du5BxIfkOCizxg3pmZJwAW+IePa3oj5dv3Fpej7rbw32eG9MQ0eWH+tSZVlvrdsoMz149oOLHbXx24PyB2NzpDf/Hw4KjTjtSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715261187; c=relaxed/simple;
	bh=iPW6d4D3ByZWZoK0AJhXMbS0Dzq9QgTzpENfolzdfZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL4egK381eidRs4qyyVvrY1xF55feAenyyORnjSpfHkk3OlXWicnJMK+3U6HYRpEGEWRKaY7O6kHvz9XJ7kxVaBHGOmvW5FDVi2tt+TzaYhE2eJ9L8ck+u3TknrFet8Kb5VabwuzQBT28hfboVaKCJFaxRPgi9FeIxq2kJZWmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKHZ1adM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a599c55055dso231512266b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 09 May 2024 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715261183; x=1715865983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoLs6yuqNj5DmFmOIxYRS+0ntQ0Djpfj5wLe15EtH3A=;
        b=mKHZ1adM9DXDQhPe0iurbu9Tb2qxOyQ1L3mr873oFiHcRXAQJfozw8Bwv+N6noI+4W
         ORM3wzEnMczByDcD4/yUaKdyoixwjkNMVsMn6S8ge2X5Hn7pjAcT4ni70sHnUJZsNS36
         xRjJgGqbHTGBVMZV1588godUE6tMHzC1opffUjPwq19MJBYuTLA7ybacy1Dvil95xSEV
         A/o9MXw/I3Pf7/XiUEAuKM7bh1rQ+XFaYQySYdodZSFwERt9rbO/5QYQTmIplQIffR/I
         0Na22gLVCOcDIHeyWGD8KsTC12UtbTOHWe8glSKdtw6o3aALZe22IZBz08+xo5GjAyxC
         oQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715261183; x=1715865983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoLs6yuqNj5DmFmOIxYRS+0ntQ0Djpfj5wLe15EtH3A=;
        b=cmrY2BRNrwVSzPZTYdjJeHftcedlZavjZtRrT7V0is0c7vuFSGPcObra08r1Tne06f
         bgYmoJsF+dnmXAxIyEZpYxMwpYX0LoMw/4UqfQ3/W34uisbth9ixvVbuqoLJQD4CjeSA
         lMsW9Q0ZoVzponvfRz+q/Vt0UixWq86Tj0yr3FGCqFrpZmlclyWsJOhvSEv7TO7QHzmq
         UGzbezeyIpro9vTGTZk5JygsiPpNERHgvIC/Akh4L+Is9xP72z+KU1NUpHDQ0kKEsIjm
         9D1YrpxWw/I94kkZdON9qIaTrdgacxXQxflo59yt1zI9FR3h1QQ9Ea3X99y4IHDFU/HE
         cGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHMki+aVQFLxffIb3P5G7qzPZ4hLPQ9tGou5o4Jv+50bjjQxvp+uvgpQX1ig5ugtdcMvFuPEFZ0nmEu+qQJsUsDoJx5Pp+RhMs5cyVg3oI
X-Gm-Message-State: AOJu0Yx7m76cctByVKMm+a3ZnZxvCZ+JPlgqTq7E7HabtETiljw4GTFl
	hkjJSUAvhT0wpsDeII6SnODeTp9Kov81yAXxZpAfPsRE7wxF27fx8AFURTxd97M=
X-Google-Smtp-Source: AGHT+IGlqHqVrN5njgIPk6BsIHG4IojimK3+yANiWis1vE6LoHgDXD7w1YiU4Sh7s4wuvWa8BTszaA==
X-Received: by 2002:a50:d5da:0:b0:572:952e:7a5e with SMTP id 4fb4d7f45d1cf-5731d9f13abmr3665059a12.24.1715261183287;
        Thu, 09 May 2024 06:26:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2cb02fsm700789a12.78.2024.05.09.06.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 06:26:23 -0700 (PDT)
Date: Thu, 9 May 2024 16:26:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] NFSD: harden svcxdr_dupstr() and svcxdr_tmpalloc()
 against integer overflows
Message-ID: <70f5c9cf-aa7d-4309-8ed7-48e303ea1be7@moroto.mountain>
References: <332d1149-988e-4ece-8aef-1e3fb8bf8af4@moroto.mountain>
 <babdb32b-3f3a-4e46-8cbb-26f0ca49cc61@moroto.mountain>
 <ZjzNdLynC7WxwLno@tissot.1015granger.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjzNdLynC7WxwLno@tissot.1015granger.net>

On Thu, May 09, 2024 at 09:19:48AM -0400, Chuck Lever wrote:
> On Thu, May 09, 2024 at 01:48:28PM +0300, Dan Carpenter wrote:
> > These lengths come from xdr_stream_decode_u32() and so we should be a
> > bit careful with them.  Use size_add() and struct_size() to avoid
> > integer overflows.  Saving size_add()/struct_size() results to a u32 is
> > unsafe because it truncates away the high bits.
> > 
> > Also generally storing sizes in longs is safer.  Most systems these days
> > use 64 bit CPUs.  It's harder for an addition to overflow 64 bits than
> > it is to overflow 32 bits.  Also functions like vmalloc() can
> > successfully allocate UINT_MAX bytes, but nothing can allocate ULONG_MAX
> > bytes.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > I think my patch 1 fixes any real issues.  It's hard to assign a Fixes
> > tag to this.
> 
> I agree that this is a defensive change only. As it is late in the
> cycle and this doesn't seem urgent, I would prefer to queue this
> change for v6.11.
> 

Sounds good.  I would imagine that eventually it will make its way back
to the stable kernels but it's not a rush.

regards,
dan carpenter


