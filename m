Return-Path: <kernel-janitors+bounces-1792-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955C85B224
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Feb 2024 06:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3AC9282760
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Feb 2024 05:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C678E56B8A;
	Tue, 20 Feb 2024 05:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0nkvVgq"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B155E56
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 05:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708405924; cv=none; b=uv+rExU58yNZqet2WiC5SbPCpzBKqUIEgo4mVm1ESWr1232sR9OUVFQituVuPpPCsA51HXLW5wOhYiqa77IpKL8O3c7La0dy7I3PArjW3Cq4iC3kZziS1r0Ay86lQRgRPcts3DycNU5EuVTKyma3iWnL89wUf7aVMv9IgiTI8rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708405924; c=relaxed/simple;
	bh=P+/HhRLclhnIoaOWdptZq/oDYI5tJKDJu31V4vnvpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAh9MYRuDcWKjQs2s/PYSfp/89rb7qBkBwROoIuCJaebxSxpvRjs9nLHl340wMWSaACHE5EsTiGSUNfFH3pa0ngItLNBr3nxdrmckkJyh/4GW/AoDZrJn3+CxRjC202C6JWnnljmdP8+pMlySNGDXyQtUeuIrb2kFcUhZIyk/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0nkvVgq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512b84bdaf1so1874525e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 21:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708405921; x=1709010721; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ho97+Z9XyV0V3EKFp1nj4w01pW7dIUQTWF51opt+P0k=;
        b=z0nkvVgqvrUlYCgPkRVoo/MkW+ZcCTslIch3mycrdlwr9/1Godr/RkDltgOCxoBcdw
         1I3nDr4I9dQciV0dTXPQl3FJtrCqZ7CBctQdx7BW9PT/RdFUtfWs+QWOQF/f0frLqX0y
         vgu1lCNXKfNyXIAiOY8hjUO1lKnetqc+Ln3BZzJVxzoH+moIH9Meg3D2jbInhiJEBBHd
         hH0EPrLR0cdjcTxXTHrFfwjv8kh8Zaspgn1wKJRngK2A06Fk+O3GokIQUcPUcWOPGgzq
         5A/e4ZCcFV7g1htR6l+/Sj3l5d9ja7ZXMRChLOtuJWvzJfQwbw/jopSmH1xqnofVdiVw
         7Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708405921; x=1709010721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho97+Z9XyV0V3EKFp1nj4w01pW7dIUQTWF51opt+P0k=;
        b=UHjCKZQeijC84GG4SGxHnS5OFD20ZVyv27TtzJ+gq3BxXbG6tlEC2NMMRshIxORpzr
         bLzsX3jhVcenQ/8MjdljXCEhBeSMO3FX09BItRVn7zx4CwvTVd1QwnXLt9DQ28SF/FDd
         gQBAYwT9oFB70/bWlZ2n8d4VBP4SfOhNPl/a6iEAupP7RTO1sJMP7+63hKS3vo3CT5Fe
         QvX/snsBgLnpvrLy2BMeCYGh2LbLX4fx0wIW/OHfq+oOv2H/xUGyYXmsnW7fiTi8JVBy
         3M8wnpLgWdsrNaHWWiNxyw2gUgXmC5SSZqdQV3Y5MT3wjqxfRndjYMAjcovO0UP3blje
         z6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXafwXWxZwm2DzTBwOgEShhGtr/kdlgxsT7XBNetJKF9ZYnftsB3WXh2d2BfaXK5pPkD7d5ZvFXY9U4L511/fyyssmW3Gj13qi0NhKSitlv
X-Gm-Message-State: AOJu0YxJb+L2Zcr8+81VBAdewumeiMAnZASUVsNYrC8i3QTXkdhgoLLN
	mBWNQI805aWLatZtiLDH/XDq/NGMsM3oJVey4MyueRO0DBJkW7KFIZbLCVyIlFY=
X-Google-Smtp-Source: AGHT+IHbqUb2KIKvVKoBjpRJDXqck41PHOxDu5LU7Bz4meGHEBaEjCnZ2bAV7RwH8TMbR2gh5uA+eA==
X-Received: by 2002:a19:f706:0:b0:511:9746:6794 with SMTP id z6-20020a19f706000000b0051197466794mr9220992lfe.60.1708405920674;
        Mon, 19 Feb 2024 21:12:00 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x19-20020a1709065ad300b00a3e786d8729sm2082419ejs.168.2024.02.19.21.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 21:12:00 -0800 (PST)
Date: Tue, 20 Feb 2024 08:11:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <bc59a084-73bb-46a8-b02b-0ef990020458@moroto.mountain>
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
 <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
 <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>

On Mon, Feb 19, 2024 at 06:59:02PM +0100, Christophe JAILLET wrote:
> Le 19/02/2024 � 09:37, Dan Carpenter a �crit�:
> > On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
> > > If 'list_limit' is set to a very high value, 'lsize' computation could
> > > overflow if 'head.count' is big enough.
> > > 
> > 
> > The "list_limit" is set via module parameter so if you set that high
> > enough to lead to an integer overflow then you kind of deserve what
> > you get.
> > 
> > This patch is nice for kernel hardening and making the code easier to
> > read/audit but the real world security impact is negligible.
> 
> Agreed.
> 
> That is what I meant by "and unlikely".
> Maybe the commit message could be more explicit if needed.
> 
> Let me know if ok as-is or if I should try to re-word the description.

No, it's fine.  But in the future if there is an integer overflow then
lets mention in the commit message who it affects or what the impact is.

regards,
dan carpenter


