Return-Path: <kernel-janitors+bounces-2917-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1B8BAB9C
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2024 13:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2893B21339
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2024 11:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A40152789;
	Fri,  3 May 2024 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aX6+khFg"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3615218F
	for <kernel-janitors@vger.kernel.org>; Fri,  3 May 2024 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714736009; cv=none; b=fzZ2FCkL6ow6zdUcfOvXS0fE8DaPDA5GJIldOef7VrQITgKsxzuz0lxfXFesdOgsgyphYRxOnmFW1u5NYy0JELXyUYdqIJ/atbR3iv4AeQfda/AhNady+LOMJLNy0J7SdTR3jmwSKOlGtI2zMMgT99/7CveJ+nhJ/pTznOKWcTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714736009; c=relaxed/simple;
	bh=jdNr9HzoVl94UbxT5ZLc4/b71AkBZCNGvQPd4k/6VVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7fz/d0l8U5umW1p3CcjESRuY6/T7ZwcvF7rc9AiGLWBRURcp0gvnkp1Y7ngjTjqF8j9e02oiMakcKG/ujRBAN4JEvmrII0RnBfd/w7qfLRmhFtoO0P3GISfwUQaRdT2zI8rl5V5iwM/giJRbMVd9FZITwrrxuCrbV6BjY8AW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aX6+khFg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34c8592b8dbso5689576f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 03 May 2024 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714736006; x=1715340806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYKYS9o1+tjlc9KHGfIXM8/wUGmn4enyO6luvWTQQAI=;
        b=aX6+khFgh+CeP33k/2ejGxcRvPrNgJBxbG1aQEw2jM/euYyG+FT81Q8MnnLk2hBGQP
         xacVrsvA3gmt4KGrKNQxuZLmG/+Rp+AG1hAyjz7bt4/O9sVgw9JRj8y8+TFK3pkqUkUP
         B054UUt4JAOmxsRgSTBYO9JZf5SKjlj+dUH41heBFrYyXp0hR263qYTJhuFeohzokVFl
         FUn+MkNI9ctzQ0f0CxBGuCaYVFVFsD6I7HOUpb8DHNxcpfCA+jaLaWQgnKJGJpAMKdkW
         86I4SYjtQuc3DIComMMvkOMtk6YPwXNKvu8nq4TKwQvgoULL98G8u60suGsmN1urIzIh
         4eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714736006; x=1715340806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYKYS9o1+tjlc9KHGfIXM8/wUGmn4enyO6luvWTQQAI=;
        b=YmzFt04+RsAbjrwGIMrQ+CHokFZxsiUJ3S2UWM1KcRywFiAS+qmGYJPI03H48T71Qv
         pnXXwHOVytCzkX9JAFC+rMnjxw8jPPoU0Q+xCfNAYryxHse9NakF4x6SO1N5QZ9GOvT7
         FJQcKbbFm0ypTZMGf9RD5Usa/jbn/JM4FM23wwOTuChS1k2nixwc4geE5wUxZChWkJGL
         +xxSnW9cKtFhqKXkTRNzfcr4DMvhCKaK7dWSCRMt+7rmNrn6JmjfIRpTxMYB6rTIojRG
         yt4qiLZ7gB42dHCVYjoQrhJW3H0NO+8jWGXgZQfwnxc9PwqCZiUlobtFO03Bm/6WFQmn
         s2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTzJU3gHjjZqYxJw86L+Ad1J6fj1pxCu0kZeYt7JuNpcDS6SV39ruJQfqqaZNR2EN/gG3LF31ZZyv2uS8hTaS/B7csy+U4ZUqZfXtO/MWn
X-Gm-Message-State: AOJu0Yydw6hEjZNHW4+s8Nry6B1tchEO9sea2ThmVHn2+ZRTxUcy5lDf
	xxf6gzGQF17kegomjJccPaUFqTXHe+TMilhe1cIFsq9e2EYJXQJ2ecCPp35RHXY=
X-Google-Smtp-Source: AGHT+IHFM8Y9OVCT1J9cntIkypVbedCqaexA3eFHwjLabOtU69YxG+ZsibaJ11feF8n/Zsf4r27DdQ==
X-Received: by 2002:a5d:4f8f:0:b0:34d:7fbb:e93b with SMTP id d15-20020a5d4f8f000000b0034d7fbbe93bmr1833665wru.14.1714736005539;
        Fri, 03 May 2024 04:33:25 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p13-20020a056000018d00b0034e229a7d5bsm3576100wrx.7.2024.05.03.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:33:24 -0700 (PDT)
Date: Fri, 3 May 2024 14:33:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Reuter <jreuter@yaina.de>,
	Paolo Abeni <pabeni@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Lars Kellogg-Stedman <lars@oddbit.com>
Subject: Re: [PATCH net v2 1/2] ax25: change kfree in ax25_dev_free to
 ax25_dev_free
Message-ID: <4ec281f4-f7f8-436c-af0e-c8410ba79139@moroto.mountain>
References: <cover.1714690906.git.duoming@zju.edu.cn>
 <81bc171fb2246201236c341e9b7d799f509d7dd4.1714690906.git.duoming@zju.edu.cn>
 <89f07a73-90c6-4a81-9cec-7a1b7d61ea6b@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f07a73-90c6-4a81-9cec-7a1b7d61ea6b@web.de>

On Fri, May 03, 2024 at 07:36:54AM +0200, Markus Elfring wrote:
> > The ax25_dev is managed by reference counting, so it should not be
> > deallocated directly by kfree() in ax25_dev_free(), replace it with
> > ax25_dev_put() instead.
> 
> You repeated a wording mistake in the summary phrase from a previous cover letter.

Yeah.  That's true.  The subject should be changed to:

Subject: [PATCH] ax25: change kfree() in ax25_dev_free() to ax25_dev_put()

Another option would be:

Subject: [PATCH] ax25: use ax25_dev_put() in ax25_dev_free()

Otherwise the commit message is okay as-is.

regards,
dan carpenter


