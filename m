Return-Path: <kernel-janitors+bounces-4866-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D993FA2E
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Jul 2024 18:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488451C221BA
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Jul 2024 16:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5980015B542;
	Mon, 29 Jul 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R10ZU6Qs"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE91E4A2
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Jul 2024 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722268799; cv=none; b=oTAMQH/gt94us/G/gQS8C+mGSP9jwTWqBYzysazsjbi3OuJVyEWhLzt3oPQVREdw8MBh4TXywsWG0TjFigU5er/etffmkCx8yodkvXbJ1/lmtPMfl+uw2pENoitQChJs4RGcvhaAPTCUaD7SPpYHzCu9gok5l9S9ER5BhLVrBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722268799; c=relaxed/simple;
	bh=XlT0HYWbLqBz+dbZhicguoyqf4QgW3bMfFfjONXLltU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIaWGl4/FOYKq6cPoaRjlU1oFf7cMV+K+NOXCodYtbTi9ke5lidZUmBH6FRvVhOm0Hm3Pfx6COfrweIYBfnV9IbAF7uyMQa42yp6nhCRqR5N8vnTe3v+mjWCHO6olbGbgmczDduehPynH4Hm67HDfnifW9L4/yuHNwzgbg5116M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R10ZU6Qs; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7093abb12edso2699444a34.3
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jul 2024 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722268797; x=1722873597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKORujp1kv0/6IBUNhxzZiJOGLH+iRzT6G5ZfGPNOlo=;
        b=R10ZU6QsU1W2k25ailzgETe2aB9RJRWszEagOPudi5+JFggktOZsqDQYy8BG23Qy6v
         sAyGLPP1yfCMZczfcBkmTUWffIszbGrBYZ7CTGDbAE/nD1nfsJ9NdPhfy4iPcX9VRHxK
         8odEFC5QkduMqotHwFSR59O/CaIouLqcvYiWIYb43cGV9EK6XSCbBRog8Ir7KCaoEdQQ
         2LMXi8w3y+0j5FRYE7kOf+Wzl8NnzWwioUXt64tBFAr/yutw4sM25cwgjOjJDckyHmNG
         /K6W3AvkvC+wXMZGtIEUdM7NJzvefuJCKkEJAIb4A7jX1LCJs8v0as5q/KyImABigjPo
         0zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268797; x=1722873597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKORujp1kv0/6IBUNhxzZiJOGLH+iRzT6G5ZfGPNOlo=;
        b=wYEqY0/D+1RGSyi02OvMuRP5fDoYaUPa7CdkxtmZvXFcmDoJD8/xeB1FIpJLB78NE/
         tgZLOY2q2rFVZwWy9wTq8/MGG53l+mTEkF/USKN2XUt3npADtz1pt7hZkU7PGw/w8OJk
         KQVoATK8QY9OJLxge8Oyj5ik0xRMq6cNVttPkXtODSau8e6Gn54oZMXPImtc4ZaufN+Q
         UdUeBBpJSMMCQ5MDKaIcGrQtD03jShhAO0XkCdWBilnBbV1UvM294/JgwzEEFKe9DqmU
         cisf1ZbRahyR1Ljy3G3vscheQCB+2e0TSGfe16e1CYO5RUTVuqyEm13liT+MlAQXIjnP
         A+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyJAz2MvR+qFiOZfXB0ELS1P9jptnny+VXnnOGifyzwlXkuvnOpJQHJi/I4oesvXFNMU53Ga5PnuZamHwlkylaTDtkYIIFGaZPPULtNxmS
X-Gm-Message-State: AOJu0Yx/Mc0x5bc/skc6v1tsH0y7rEJDfev5l6B5TLrYYjBOaEXBM20D
	3doyOIsPHFxh8rLO3N/6dD5j58VHMVh0o8bWAY4u/oXaV9T0aBoarnv/Hb9lnz8=
X-Google-Smtp-Source: AGHT+IEIHagVgO9pv8gb/zQ7JpvS63INgCNeENDNmOULmSa/KXAfqwBHzEaMxKrukT2FJXfnEI3QZA==
X-Received: by 2002:a05:6870:c152:b0:260:ffaf:8126 with SMTP id 586e51a60fabf-267d4cfd510mr10157250fac.9.1722268797401;
        Mon, 29 Jul 2024 08:59:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-264fb59ec30sm1895997fac.0.2024.07.29.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:59:57 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:59:54 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev/hpfb: Fix an error handling path in
 hpfb_dio_probe()
Message-ID: <ac4c6712-c47b-4414-9640-3018bf09e8fa@suswa.mountain>
References: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
 <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>

On Mon, Jul 29, 2024 at 10:13:17AM +0200, Helge Deller wrote:
> On 7/28/24 20:29, Christophe JAILLET wrote:
> > If an error occurs after request_mem_region(), a corresponding
> > release_mem_region() should be called, as already done in the remove
> > function.
> 
> True.
> 
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> I think we can drop this "Fixes" tag, as it gives no real info.
> 

If we're backporting patches then these tags really are useful.  As
I've been doing more and more backporting, I've come to believe this
more firmly.

I don't necessarily think this patch is worth backporting, but leaving
the Fixes tag off doesn't mean it won't happen.  People quite often
leave the Fixes tags off of real fixes by mistake so AUTOSEL could still
pick it up.  You'd have to add:
Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > *Not* even compile tested only.
> 
> Ok.
> 
> > I don't know on what architecture it relies on.
> 
> HP300 are old HP machines with an m68k CPU.
> Not sure if someone still has such a machine :-)
> 

It surprised me how many patches we backport for ancient stuff.  But I
guess the risk/reward equation still works because if the code isn't
used there the risk is very small.

regards,
dan carpenter


