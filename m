Return-Path: <kernel-janitors+bounces-2215-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B9387D9C0
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Mar 2024 11:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5467F281FB8
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Mar 2024 10:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F20A17BB3;
	Sat, 16 Mar 2024 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WTdzJWpJ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7565F171CC
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710584312; cv=none; b=Zo3vRcV3ySialoHAOh45eRkUZxPIB4FmxZEENOBAIlVhQsQd6oM/fFmrsfe0xv8PqlGy43keuhYAYr99QzhWt/4ukox4FP4An/7s1BtE5xc1DtjurDQUCiKrNHg2GEgESFGyqutSI6nMhwTBdsW5DhdPbRBfWKk5+Sodoy92yuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710584312; c=relaxed/simple;
	bh=4Qv2iv24BM4N5rhWKQHGpMd7hu0rv8dZU6QY+sNN2E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbQgCSErBIMjUdPeNirvNCMkaCl1WQr1Tv8UQsTdg/4MLu2blxeqUKofMbV9lhPPwEREDxfo4MPW+9KzL6y+gbf4sXphIPJQuAOpgcgO4vNNThoP/zZnnOlKwf2CgXh7Ui645QGOejnu6dcHdfSyLqLiM0z8oyLNpJM2VyulDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WTdzJWpJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a44e3176120so379455166b.1
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1710584309; x=1711189109; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZibTUb2beDDFO7s5+ADcLRkljFQu8UZ08PzSzzRuyg=;
        b=WTdzJWpJQFkXRVSj5q3JW7j5DKXi9cJMEAcf92e/UoXhvX80a+Iqe8d7V/6RN5KRvA
         IcmDAha/uGTRBem3WuXRQP+c4K76D7gvOAKBpoFM5F50tGPdO1Q3wN68yXOFQGog/3qr
         xL63oyeY5bydHvb4aem4tfiMa0RFX3atsCtiF27uNeeAh4qNVcQhm7G8Vu4jShUt4wNi
         hnnuv1+WjeewFaq9g+xt7Y4IakJmg8pzS9p8qKpYxjX4DsUnoHx0dRxC4MoDm10oJZK8
         PUOtnNTTJJ1N96MfAEPqgBvYb1VEa24CiG+UMvTA6goA5QmPGpe+bk5zaModpId795YD
         C5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710584309; x=1711189109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZibTUb2beDDFO7s5+ADcLRkljFQu8UZ08PzSzzRuyg=;
        b=NhDC5N0xcOvG3PIH2+sJHtzpLZNNBfWvavdODhvrT9EKZ6FyGuxkoK34t3hWgeqRlA
         2QMhPZtAXRyi1Gzy6CoOnuptcZYmmcfONS5ammgU+bs+w8GA29qkLa3G+7tO8aTXbKDb
         VTvs2RoQ/q9ctLlFTSKfI5y8WGij7UQKntLn23rHAA/DwlDVUJhqCAwwIzHH9FseIx6n
         UhqTEbmEUEnInxtWMQ6QccCJ5OdHNRtsHMXXmPNYIzkOg98z5uieyDC9r0I1c8cpSz8o
         d9j8AQtS6x7+cx1gp+A/SHGBilPvB7kwRNOhFf+rWkuL9i/KgkdbNtOdo4oNdxzx4ISA
         mYSA==
X-Forwarded-Encrypted: i=1; AJvYcCXDjolwbAds63Z2IDSkFQxdcjDUVGgf1zrWq5bKPFUhwxmiAY47Mxvgw4owZR1rhF7ntXyeNhq217avOfYCtAprLlGIHQC9QziUSa+7Xc+M
X-Gm-Message-State: AOJu0Yyliz3D1KDwYcwbR94oKJOmegGqIwbekVFC2JmqTpmgW+Y88x0F
	bwZ72umjAnL1KyBcFGVR9RVtb11/V6jm7pPYyP0BYpN0LuxXSSiGr/FaaJPI+VQ=
X-Google-Smtp-Source: AGHT+IFitShcfWanROCLOse88lz09EK1cUssei37FAjOLrcSJZWLjhOVIh2v4/mYPjn0bG2OwVQx6A==
X-Received: by 2002:a17:907:968c:b0:a46:220c:a55 with SMTP id hd12-20020a170907968c00b00a46220c0a55mr4297795ejc.73.1710584308724;
        Sat, 16 Mar 2024 03:18:28 -0700 (PDT)
Received: from localhost (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.gmail.com with ESMTPSA id m18-20020a1709060d9200b00a46ac55d8f5sm112562eji.26.2024.03.16.03.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:18:28 -0700 (PDT)
Date: Sat, 16 Mar 2024 11:18:27 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Use common error handling code in
 rcsi2_parse_dt()
Message-ID: <20240316101827.GA3058508@ragnatech.se>
References: <8b4203dc-bc0a-4c00-8862-e2d0ed6e346b@web.de>
 <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>
 <260d82b6-e7fc-40c3-b414-50a883709fd7@moroto.mountain>
 <ZeWnD9YrXLWJYmhT@kekkonen.localdomain>
 <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>
 <20240316094652.GC2092253@ragnatech.se>
 <0b77e146-df2f-4fe1-a4e8-206a62a5ac59@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b77e146-df2f-4fe1-a4e8-206a62a5ac59@moroto.mountain>

On 2024-03-16 12:54:23 +0300, Dan Carpenter wrote:
> On Sat, Mar 16, 2024 at 10:46:52AM +0100, Niklas Söderlund wrote:
> > Hi Dan,
> > 
> > On 2024-03-04 14:16:56 +0300, Dan Carpenter wrote:
> > > On Mon, Mar 04, 2024 at 10:48:47AM +0000, Sakari Ailus wrote:
> > > > Hi Dan,
> > > > 
> > > > On Fri, Mar 01, 2024 at 04:42:01PM +0300, Dan Carpenter wrote:
> > > > > Sakari Ailus pointed out in another thread that we could use __free()
> > > > > instead.  Something like this:
> > > > > 
> > > > 
> > > > Looks good to me.
> > > 
> > > Thanks for checking!  I've never used these before.
> > > 
> > > > 
> > > > We could merge this with your SoB (pending Niklas's review). :-) The driver
> > > > has been since moved under drivers/media/platform/renesas/rcar-vin/ .
> > > 
> > > Alright.  I can resend this as a proper patch.
> > 
> > Please do.
> > 
> > I do find the idea of scoped operations and the syntax
> > 
> >     struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
> > 
> > a bit foreign in a C context. But I think the intention is clear and it 
> > allows us to avoid having the remember to free the fwnode in error paths 
> > which is a nice thing.
> > 
> 
> I said I would send a couple of these but then Markus went ahead and
> sent the patches that I was going to write...  And then it was like,
> "Oh, these have some questionable style issues" so it wasn't clear what
> was happening and I lost track.

I have not been CCed on any other work in this area for this driver then 
what's in this thread at least. So if you know of no other work in 
another thread I think you can go a head and send a proper patch for 
this driver at least, if you want.

-- 
Kind Regards,
Niklas Söderlund

