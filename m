Return-Path: <kernel-janitors+bounces-6442-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A89C706A
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Nov 2024 14:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F2ECB269C8
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Nov 2024 13:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F831F9EAA;
	Wed, 13 Nov 2024 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcsJ72je"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06F1DF25E
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731503423; cv=none; b=Xf+AJO0pPX+Kvwg2jayznig5rgkWYHAVc4tdLStM3/0ls6nhHmRGyYRQRQMSO/g/Etx4ZC9DfnC2RzHekxYY+rVgQ8QHVzx5paaBgWKmUbBAqVwTr8bmJQb4T8YSTW5D2/llNoNuOspXmEgMBaNmIADI8+4EV6dZBr80KrSlxxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731503423; c=relaxed/simple;
	bh=Opcmz9YYIaVdPWsOxhUqLPlpXQUP+f6SvaFPoN8x2S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrrfH4c4d5AY+qAEUXTgizbxskTL0uSOFDrmwOTnEJMTIi5JbhFiuoWuOD8IW1qV8Q5ZeBJlG5xRiQmSis7d/pBgN9xBZfGUmifdifBKYl/jJvN1lHsJMHiC/4zHJEuPc1wcvr0QVV+3/PuNAHHTaa4ez9RiGtI2teDlFqnGqNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcsJ72je; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4504615e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 05:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731503420; x=1732108220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrCyUIt2ww7l4E4yjLiYIeNzWk/0rCkfz0cRlXOTRlw=;
        b=WcsJ72jeySrgNlU53qllluOgJb/aFlqt3rKFw4SeoMUCnWGrbfxrzGbtgxtDjsAw+M
         XACker0FEQcyDNYqclFPOROgiRrxqAJCyQxPcDLUUwt8nab6qbMxsMv6m4PsJbohHHsV
         tZVXU578PZIEk0ZA0I4rO4U1NXmH7tz/zIFSRwuNSlYgGLlex/REIbYD+NHclwHPWSlY
         GJgGHPRNqNnmfsKnfU1TrjPNtT6maxijY5BAW1/0jhyLU621D0VscAZG1Q5B2Co3xCn1
         W/xnWqEt4JBwS7yJy1g2V4CwjCzAR5mTfpx1RVntMINbNhg+6+HQhm8y76IWP8iooVTw
         a1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731503420; x=1732108220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrCyUIt2ww7l4E4yjLiYIeNzWk/0rCkfz0cRlXOTRlw=;
        b=se7z4003dK858cQp8mxEP7RWtUohR7j4XcybwdCCJRutjPTXlbg2VJBGPAR+8MDi/U
         dl2EuskXs0hLa0c7CvjYomaCaAjSxRHmpvQB22iC2LgqV95YZy+wAZiBkldllgj2+YLb
         rwr0SM7aS/PicrTCFgqsVOv77F9Lkh4++NxiK7yz1lTfd+zsWLpjNZjODASpWFyN/J09
         VnIp69EOjq5LRrDD/19+KKaLi9yI8q1tJwUAN1/8rLhPw0ZgvGBTSngXGheX7iKs1trV
         qW8SHa53dq7G9BhWB0uXx0WvDBSMp1yaaGniH9ZJ7hsp7h5S3ytM2VGxFYkABnFG9AKe
         o2/g==
X-Forwarded-Encrypted: i=1; AJvYcCXHyKAUn4JSN7nMaOhTPes6eOQg5+XiOYUwDR5j06mLROZhrIUZ3xT7CenulDm9cZ3xYkPRTB/PVKT9ovStxtw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4oON843HgWOoy0yrVPN5M9e1MX7NkS37yiYINSp9wLY86I7tr
	eeEmCkKbYTaIDO4YSPz7KCfU8nPNsx65ExMcqZYjuKWfk+TABaGeGNVVpp9qv9s=
X-Google-Smtp-Source: AGHT+IE0LhHchWSjR1k9sQMVXr3w1p9/+8HBLDRMWC0wiutg6e3LOt2hgiDvsOk5dnHwLzxqCoRJPA==
X-Received: by 2002:a05:600c:354f:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-432b685c0a8mr175006505e9.9.1731503419662;
        Wed, 13 Nov 2024 05:10:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d550c159sm24063835e9.32.2024.11.13.05.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:10:19 -0800 (PST)
Date: Wed, 13 Nov 2024 16:10:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] xfrm: Add error handling when nla_put_u32()
 returns an error
Message-ID: <81088611-41d9-4472-94e6-3170418156c9@stanley.mountain>
References: <20241112233613.6444-1-everestkc@everestkc.com.np>
 <20241113105939.GY4507@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113105939.GY4507@kernel.org>

On Wed, Nov 13, 2024 at 10:59:39AM +0000, Simon Horman wrote:
> On Tue, Nov 12, 2024 at 04:36:06PM -0700, Everest K.C. wrote:
> > Error handling is missing when call to nla_put_u32() fails.
> > Handle the error when the call to nla_put_u32() returns an error.
> > 
> > The error was reported by Coverity Scan.
> > Report:
> > CID 1601525: (#1 of 1): Unused value (UNUSED_VALUE)
> > returned_value: Assigning value from nla_put_u32(skb, XFRMA_SA_PCPU, x->pcpu_num)
> > to err here, but that stored value is overwritten before it can be used
> > 
> > Fixes: 1ddf9916ac09 ("xfrm: Add support for per cpu xfrm state handling.")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> For future reference, I think the appropriate target for this tree
> is ipsec-next rather than next.
> 
> 	Subject: [PATCH ipsec-next] xfrm: ...

All these trees are a pain in the butt to track.  It's fine for people who only
work in one tree but for people doing static checker stuff, then we have to
deal with all 388 trees in linux-next.

I've changed my scripts to add [next] to my patches if Linus hasn't merged the
commit from the Fixes tag.  I still add net and net-next by hand but I'm going
to just automate that as well because doing it by hand has been failure prone.

But then if we try to add all the ipsec or whatever trees, it just becomes
unworkable.  I started to write a script which would look do the --is-ancestor
check based on the Fixes tag, but it take forever to update the git trees.  I
wasn't able to figure out a way to make this work.

Also once Linus merges the commit, there is no way to tell which tree the commit
goes to so it only applies to linux-next.  For networking, I already have the
script that greps the patch for -w net and grep -vw wireless.  But I don't want
to maintain a list greps for everyone's tree.

A lot of this scripting could be built into the CI system.  The CI system is
already doing some scripting based on the subject but we could do it based on
the Fixes tag instead.  If there isn't a Fixes tag, then it should go to
net-next.

regards,
dan carpenter


