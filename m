Return-Path: <kernel-janitors+bounces-8285-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1CADF32F
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Jun 2025 18:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E75BE1894799
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Jun 2025 16:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA29C2FEE1A;
	Wed, 18 Jun 2025 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZ48aJb1"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D8F2FEE38
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Jun 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265681; cv=none; b=a2Itdlv3fQLzEtt7uZ92m1HDYF1O2GhjzIqE0RvRCtwHYMRGBTXcOroUarXVIV2mHzR1JIZfcovFDmQ0UIibbghhAEAD9K2ghfzfISCtNE3oJYrl5fV5CcYSAucmiMIzztdC9/o/WmDCntT3tmvBtYNkBXbIcVzxgzTt/e+rUQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265681; c=relaxed/simple;
	bh=sXlM/5b6UbLkhX3RwTHPV6FZAK/HSY1yU+UtlGN4JQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opmPmPclJEzGczyxUIyI7+lp8NMcBB9E5EzAACGd3WMRiRPMc9Iq0eiIvAuedL3mWGgmOihfHKVIeO00fNDStd7OsujIbZFAjiYkbnWs0CXg3ekRwF21Pd7XIgnz2soGfajVG4SXkJHUyGg1bgrAATLDcsBuKSSR1epPdXsxsU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZ48aJb1; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40ab5bd9088so15318b6e.0
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jun 2025 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750265678; x=1750870478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ2gcooOP07f9omnCEawJUw60wsToiKqAdT6b09wVWg=;
        b=ZZ48aJb1dMdpytzm74junYZ8Q+Zxr0HKOLUY8GU7LcZGT8KsJW4bRX8oDXCB9MQfGW
         doigudOaVfs3errm7BS6qWAuRyZ8WEjMHQDdjOJle7J306Xg7Wi8AhKnwN1EMpj7ovHN
         ueToXRxF2mFKjYgjL+iuYfMuyDBmM4eu/bswkBD4elxJlJu5sD/zSzIBKM8Yij4LfT78
         kOVgBpol8j24TrrGtLlMzflYQHig+eHy/TfaWnhgOZiodNi7SwD7ODGxl0DRRlVoDob2
         UfQwmo9lSm+7dT2f8UF4InJqBa/vA1iS0W5h2IgCpLmy3RaTTPbZHf/WBJzRAuBqBi0o
         lwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265678; x=1750870478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ2gcooOP07f9omnCEawJUw60wsToiKqAdT6b09wVWg=;
        b=fsqqzyeOkXSQJKulaqSQ/3iLFKfaHoSypdsQrOleW2gLCnoJlmtvIrIgIja9yYb6CX
         cvnQVOcJbVGDD6M/kGfk7k+/oBMpOqTm5BZP58hoqfYuj9eOUFtl5CYRV528zPQ8EB6d
         zeo3mwu5OQPObTWtX2CnAqABoWMRc0PiCR37l2x/0avxyC8DjGLiHMV/0zgddCno5cRG
         PArUxcmKHFtBUFeEEiZ8OULyI3HB0y4tIw4yIMnr9CfWjkAdakhBUG+SUbrImlHus7zt
         VjK1o7ilRzpHMN7yjIWcszc/nCGL/xQwoqTn0t36rc2fARJFiWh0/ef0xfFBgJuzRgaF
         eCpw==
X-Forwarded-Encrypted: i=1; AJvYcCWvqnFmwV9u8SqD/og93LkwN+Vf1HtzVdiw0i6sNsNft5z5OMFGJYjAgtiTHbk1rNzIIXzZ/MNOIVWBApXuTY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvlLlZ2IDMUvFdG4B/cXsjeew4bVm5hLdBSbIOINQUDEko1Nnr
	MkeI8ZXwqJtn+WAzjkkfBKDY8sWasJFPQ7e/hUVhg5Q73NAx5bowi1GxZvMicOxHFOY=
X-Gm-Gg: ASbGnct9tok2GMzyqeaHnTarR84DkkulndEonMlD5oL0cUEylv9xz6sxNTErRjGgm8H
	rFR9VdLwzDM0JbzK74Vz2d4Gn7s1OEnNQKscqNAgYeUACyqBmsQIWhddQxPdAayjTZNwttKD+dw
	nVk3bku0rEhXWxTJuNkahhGWAiiaX/QvtM4ssn+p/4nKjAfC+z+jx00+A1Wf8kwMnbXNFP3fATu
	WYcLxfQ4mgiLQNbBAF3HLq8nPk3gaQaqgR6WB7kRgmxTst0zh/5ISmAk7ZX5Bm70FW1j0yOiA/S
	CBAINvr8Ov1haR/IZDRQ2c+DyxHt5WS/YwRc6euuW7yEOnx6A3NxQ+4dxHWKQ7TbGXbz+A==
X-Google-Smtp-Source: AGHT+IGZt/Sr44zCZuiDpdUzJJJDzC8/TeAfQmItZfKDDSRquAFIHhPkjBQpw4diPA+6hMtv0/zkrA==
X-Received: by 2002:a05:6808:3083:b0:40a:54f8:2cac with SMTP id 5614622812f47-40a7c196bf8mr13387419b6e.37.1750265678596;
        Wed, 18 Jun 2025 09:54:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740b2808sm2399744b6e.6.2025.06.18.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:54:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:54:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frederic Weisbecker <frederic@kernel.org>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <419d4155-af68-4264-81df-f882c481534f@suswa.mountain>
References: <aEKvMfJ63V7i-6xU@stanley.mountain>
 <aFAxtBT7z4XphADq@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFAxtBT7z4XphADq@intel.com>

On Mon, Jun 16, 2025 at 11:01:08AM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 06, 2025 at 12:04:49PM +0300, Dan Carpenter wrote:
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -290,7 +290,12 @@ struct smoketest {
> >  static struct i915_request *
> >  __mock_request_alloc(struct intel_context *ce)
> >  {
> > -	return mock_request(ce, 0);
> > +	struct i915_request *rq;
> > +
> > +	rq = mock_request(ce, 0);
> > +	if (!rq)
> > +		return ERR_PTR(-ENOMEM);
> 
> I believe we should fix mock_request and make it to stop replacing the
> error per NULL, and make the callers to check for IS_ERR instead of is not NULL.
> 
> Then don't need to make up an error here.
> 

Sure, can do.

regards,
dan carpenter


