Return-Path: <kernel-janitors+bounces-2848-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB68B5F40
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Apr 2024 18:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 715171F2112E
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Apr 2024 16:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7290F8594B;
	Mon, 29 Apr 2024 16:39:51 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ECD8529A;
	Mon, 29 Apr 2024 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714408791; cv=none; b=tDZKXyCZtI+pgEPWUl/ZAtSZNHqwPFirVObLYX62hj9FB/BDSPlFB/0SOJCbyspElj1fvT0bNsgiBSPhelMw2ek41nmsScoZ0ZMVXP808jgdzvFF3Vj3d5KLzwlyTGGPIIUcN8Ad29F1UKAO04MOBr1Pt4xFEg7oXb6X0HSPy/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714408791; c=relaxed/simple;
	bh=Wev12OxkAqraQWDSuLMLLN8uGNu7UeGEQlPZxgQavJM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WcOFuevvp1G8T6I5VWe19GHLumRoPMhC4u0ua0ICioea732Z6evyNCUYmd1/e3tJGFYAwl0KzysuIivZU7TWGuHpDzFxl6iHDtue/3QDj19j8ePeJECailxUtKhpXfcbz3RkYYxRvbsBEYMkPo8Nyc/Le9Qs3ywUipNfEXUVFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=fail smtp.mailfrom=linux.com; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linux.com
Received: by gentwo.org (Postfix, from userid 1003)
	id B9A7240A98; Mon, 29 Apr 2024 09:29:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id B8E7140A94;
	Mon, 29 Apr 2024 09:29:58 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:29:58 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@linux.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Matthew Wilcox <willy@infradead.org>, 
    Peter Zijlstra <peterz@infradead.org>, Pekka Enberg <penberg@kernel.org>, 
    David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] mm/slab: make __free(kfree) accept error pointers
In-Reply-To: <571761df-fe50-49e8-8d56-65fbdec9a185@moroto.mountain>
Message-ID: <6406512f-12de-1ab6-05c9-4583c0cb01e6@linux.com>
References: <285fee25-b447-47a1-9e00-3deb8f9af53e@moroto.mountain> <Zi8N66yehahl6D59@casper.infradead.org> <571761df-fe50-49e8-8d56-65fbdec9a185@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 29 Apr 2024, Dan Carpenter wrote:

> I've always thought freeing pointers that have not been allocated is
> sloppy so I like that kfree() doesn't allow error pointers.  We always
> catch it before it reaches production and that teaches people better
> habbits.  Personally, I like how free_netdev() only accepts valid
> pointers.

kfree() already checks for NULL and ZERO pointers. We should add these 
checks in *one* location.

Maybe issue a WARN_ONCE() and simply treat it as a NULL pointer if an 
error code is passed?

