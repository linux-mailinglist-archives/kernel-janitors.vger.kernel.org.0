Return-Path: <kernel-janitors+bounces-3427-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC028D524F
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 May 2024 21:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C101C23388
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 May 2024 19:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB8214BF86;
	Thu, 30 May 2024 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSOloOcX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68D14B96F
	for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097323; cv=none; b=kjY9EHXnFnpn7y4osyXxq43HVc7Zvh++qVTbbFTqzK7om1PMrVyCfi2nCUxCq4O9vQPHkXXYG3iDJAyFoOkGjcTUnJavu7h4pDzIQiEnpFpU+Fe0sCGFihh6hiQ0+a4Zh3KpqaehNHcJc/0v+Yqm7d6sjwJFt4JmBJwt/cTb/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097323; c=relaxed/simple;
	bh=JJhS1pPURI+aQlYnA8wo8o0Excof0LOY618hx1VqTvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL0LsraCv5lzjC+BrMCzJVZhC7qbFLA470iYtvaU9a1qFoq68+SpL7lk5dqvnri2H5CYob6kq2r1+VJY1dgbQ5A8QhAiY+inX7RuXjkrZrzpgAwYZIRDOaz/lwbp5TEn/rEy5Vp7VbbDk/L0Fub/9rTBEvKb0a4dF3ZRyyIKP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSOloOcX; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e96f298fbdso13304281fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717097320; x=1717702120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkBHvViNRUO3vQPOWF9hByywaR4nvfvUm5Gui6RAYuk=;
        b=fSOloOcXNXYxjmiGVNhuY9XV2m89Kq35vZE6kqgq3+cvDLroE+jm6izLHUcJIjEMe0
         ZHZgTYLFndK5txYHWfNEaFyqthvanH/pwRQqXLZXRA94wEZs0iqRwmuEGjRwLqL5rvFU
         hNLiKC+Qv0JeDWL/BMbjOol1e8T3HcwotIOpAchxK4s1hKA7aL2B6DxJ2xwzzbkhFl2q
         QTFjN2fgApUF1U6e4xRof73xvvfNVhmw1wtfTCwN2TmfI8WmCV+aDvC3WFQS+/8ebHKH
         EZv7qbWYmEdrvy5lkGhze+LwqviVAbeN+xwk3VAt4nFYRRmryley0+c3rg4yHKzlXFDF
         m8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097320; x=1717702120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkBHvViNRUO3vQPOWF9hByywaR4nvfvUm5Gui6RAYuk=;
        b=iTdQHMmiLSFQ/S4yRxWUCAVUAOCabeuh9WQSZ2f5b1YhZxwL4NDrYX9rmu15QNlNuM
         3P3Kmh8mZ8Y8BLYSNIlx1UuMHTrQJ1lDt+LMF1LVAY9um+DH6dXRhxbD0nhZNJH5BBqS
         afO16U1Ih/Rk9wOGZFsrlBBcTQYYBH6pBieWWEssCT10a2PPYnBm+o4xwkhBl2pgoTH6
         Fwie0QQQ4PkZxYyMWy2ukoCbIthnXNyd2zROWt/M/Jp6UtUG78Ww6I/Ya5jblRTn5UCT
         fbYyUvitEQakfHG4d9xcoz6CPY2Iy1gA1xK+Hwena8+FOoUgACWrBCESmm0QNe5SrTXS
         ZE6A==
X-Forwarded-Encrypted: i=1; AJvYcCW8dx7r++KU6hPskD0vwZTSsb1oPQnMkXvk1tIBE8AS4xjQ4R9OmW2MhXlrmxJYug+VDu69kylXgUQpRCmZxdRge5Z9Dp1hkELxFgLTGxDe
X-Gm-Message-State: AOJu0YwP1S5phnjm97KEFVcTBE5AEgUBTxyz3jvqXy9utYBceMoaXIbZ
	V5DDKF9/a0fBqc6LK3EkpCi2W4ldXm4QI/g+lUxBi7i+a74KyAvG3evHZFBUBpY=
X-Google-Smtp-Source: AGHT+IF/S3+edrbcvaVlQXG/c5PQFdSIR94fq5kVS7yYYPf+3CZ7HSU+p3YnKFoMkQ0CRC40m/czSQ==
X-Received: by 2002:a2e:8792:0:b0:2ea:83c9:2560 with SMTP id 38308e7fff4ca-2ea848493c5mr17255771fa.46.1717097319718;
        Thu, 30 May 2024 12:28:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c6d4b6sm131122a12.74.2024.05.30.12.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 12:28:39 -0700 (PDT)
Date: Thu, 30 May 2024 22:28:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: markus.elfring@web.de, Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Use memdup_user()
Message-ID: <1512f46e-112c-47ef-8620-add0f04ce86d@moroto.mountain>
References: <50d10f0b-d108-4057-be9c-a90e2398e810@web.de>
 <20240527083628.210491-2-thorsten.blum@toblux.com>
 <4c2c8a76-17c7-4dbb-96ff-8488c8e953ff@moroto.mountain>
 <1D5BDE66-ABB3-41D9-ACB0-FBAC207D55DC@toblux.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D5BDE66-ABB3-41D9-ACB0-FBAC207D55DC@toblux.com>

On Thu, May 30, 2024 at 04:15:51PM +0200, Thorsten Blum wrote:
> Hi Dan,
> 
> On 27. May 2024, at 12:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Also this check isn't great:
> > 
> > if (dev->policy_sz < header->length + 512)
> > 
> > header->length is a u32 that comes from the user, so the addition can
> > overflow.  I can't immediately see how to exploit this though since we
> > don't seem to use header->length after this (by itself).
> 
> How about
> 
> 	if (header->length > U32_MAX - 512 || dev->policy_sz < header->length + 512)
> 		return -EINVAL;
> 
> to prevent a possible overflow?

I've been thinking about this and actually we could do something simpler:

	if (dev->policy_sz < size_add(header->length, 512)) {

> 
> header->length is used in the next line
> 
> 	dev->policy_sz = header->length + 512;

Yeah, but it's not used by itself.  The "header->length + 512" has been
verified as a valid value whether it overflows or not.  Only
"header->length" is wrong.

> 
> and if the addition overflows, we end up setting dev->policy_sz to an 
> invalid value.

regards,
dan carpenter


