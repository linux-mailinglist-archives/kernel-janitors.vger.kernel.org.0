Return-Path: <kernel-janitors+bounces-7389-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7CEA501FF
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Mar 2025 15:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8607173DB8
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Mar 2025 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13174156C74;
	Wed,  5 Mar 2025 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fd3tapdV"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95508156225
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185036; cv=none; b=qNI4OQflo4ZyUQlHGCvH+xY9IIPifupSK6WM69gAJesjHEXS5koVf5anfXB5vU02L41nxt+B7BCXnjUHB5NUAWhg/VobPn9+Ez7LIafKUpLfGGHbf6UWiKoLLSU5EuTZjuIaspVYDB7dgdrRspiKRvneNe0uOHCJiKgssVGcd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185036; c=relaxed/simple;
	bh=GLHxuJC3pKx2JCbDiPTnnHOfBH2jnLbmpChMQgQJVNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8gllNjbGMSE7H8m/0z0n3yZwIX+tJVI+mIojlSzx9Q5tF3qCnqYxJ09IfObANzfk9OXMFkRQ0uPRfuJtiM/m4QOV9rsZNuT359ZF1LYFka/GQnaLKinuSJBoBycyPI3afxUo241qZ3l5Y9qVmMWzkvcjkOea27e/NL8oiV4ETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fd3tapdV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so45065615e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741185033; x=1741789833; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0yOXShCD331pfPEJ3FsGxKQVoIHXaBgZZkBDARsPvQ=;
        b=Fd3tapdVWpeqLoigBVG8bTL6r1OHXdiAA/m6cjC3Sji4Fw6PhCsbQbtXzygebnPJsx
         yVPIlaAQTuAJa/SWeADhUZXbUEBGoHf2AkSbRcex2XKIxNLk9nu5XlGFrGVIYkylUP/J
         7B+FuH2nn2m2S2G/2Hi+9a3cXY9yHvZPtqH1dCZHzbsGxxrDSfrbHDp2CzCxQdXApuIm
         dYGzOi2C3t95vi+fpEAyfYyD3IFg5TecMZWed9+vafT8vlAVgbq2awhg/9ej8Zi6zfYf
         dfoe4KnaCZWysXokWPWOFwWBE472hY1LJMDOL6+xZ/UVU9Ff/3ZJjpwMwWgF1mhNidoU
         2crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185033; x=1741789833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0yOXShCD331pfPEJ3FsGxKQVoIHXaBgZZkBDARsPvQ=;
        b=A5S3WtiVVqDIyf0XEK8ls77oOLB5Fe45wEFZA/lrV/vCbgpM+Tr73Tk58/xuEMG2ml
         4tRWl7k4moYvgjHIxOMTx76Do9F6Jv9kFKtU+xldbEjMJk7Dror3kZD6xyWmHxNZUAK+
         nPXIUCoFxncLzi0ISe/I/MklZGfx+lhK7q+piHFkRUhxAt6ZjPXQys7EkESf1ejX+R1l
         vQqy9j+EyLNZx2Zn2WIZdZKKzll3viL63oiaLAn/Z0AZQFZh7R2oBvV2LoGUF01JSYjW
         cLEd88np9UvLGkBwAJ/pXLMPZkCf91sDwisKhjwl25o5at3Su5F6pPY+yDYDeBgi54wT
         wP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiGBJs+h1t3l3uUdvABcx4WB6EUyKEx7R3Ls8l2hNAZM6y1PkJWnFG2INk7IjFNw8+1RCdhevfDd7EiFDe4/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwODP5Eot9dBv4CXtr3OG7cMAREVM1uo+7KjVyn4m9l5AHE9ZGS
	KwpvqNPPTlFvImmkfROaqnB9DCLdMJ7BjLrIwNmLK7eNqKRPz0mK/0eZv5RnbqA=
X-Gm-Gg: ASbGncsBfUOAZaCm/ngZgazZH0YejHWhDZXVadR+mr0FHgYxgIunxDOa4Y8h98vfRiM
	/DhPmMwjnQwl1l/mj/DPWy6RLmlQKRpm/5QR1V7UAY+wRXSQM080sSwvSE7qHUb2fVWW6UfGpOT
	gbYv47b80/DjbimfcSGLkfbjO5B4trpLuZhWGhEk2iGOCBiE09t36aABcfn+AuW/CA3q8rM4BXZ
	LkJnT84p3DOdAmjGWuv5nOem/G+HHYb93/wW3z9ANNUG17rQOE9UbijWtZEAFiNkBCzGoI/mI9S
	CnNFAWT2vosmB1JOA0YsUyRGaTRxEiBYUmUFbYBrPrvWggj24g==
X-Google-Smtp-Source: AGHT+IHFtdp8P9AwIBs/SYYRDTy7hEWSk3RAiMKjuzC82tpdeKPpX7kjP/l1pi94ZuG5P/EuaCVziw==
X-Received: by 2002:a05:6000:1844:b0:390:f698:ecd0 with SMTP id ffacd0b85a97d-3911f726495mr2931784f8f.11.1741185032737;
        Wed, 05 Mar 2025 06:30:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485d785sm21057865f8f.83.2025.03.05.06.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:30:32 -0800 (PST)
Date: Wed, 5 Mar 2025 17:30:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?utf-8?B?4oCc?=
 =?utf-8?Q?undefined_behaviour=E2=80=9D=3F?=
Message-ID: <ed9e65a7-6cdf-4d93-83a8-464b47a4bc1d@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
 <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
 <20250305141732.26b91742@pumpkin>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305141732.26b91742@pumpkin>

On Wed, Mar 05, 2025 at 02:17:32PM +0000, David Laight wrote:
> On Wed, 5 Mar 2025 11:51:59 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> > > >>> The address of a data structure member was determined before
> > > >>> a corresponding null pointer check in the implementation of
> > > >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> > > >>>
> > > >>> Thus avoid the risk for undefined behaviour by removing extra
> > > >>> initialisations for the variable “c” (also because it was already
> > > >>> reassigned with the same value behind this pointer check).  
> > > > There is no undefined behavior here.  
> > > 
> > > Is there a need to improve the wording precision?
> > > 
> > > There are words which denote a special meaning according to aspects of
> > > the programming language “C”.
> > > https://en.cppreference.com/w/c/language/behavior
> > > 
> > > Dereferences of null pointers are treated in special ways.  
> > 
> > This not a dereference.  It's just pointer math.
> 
> And the 'fun' starts because NULL isn't required to use the all-zero
> bit pattern.
> Regardless of the bit-pattern, things like (void *)(1 - 1) are valid
> NULL pointers.
> 
> Of course, while C allows this, I doubt NULL has ever been other than 0.
> (It was 0 on a system I used many years ago where the O/S invalid pointer
> was ~0.)

Kernel style guidelines don't even allow if (p == NULL) so we would be
screwed.  :P

> 
> I know Clang has started warning about arithmetic on NULL.

Huh.  You're right.

$ clang -Weverything test.c
test.c:13:22: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   13 |         printf("%p\n", NULL + 1);
      |                        ~~~~ ^
test.c:13:22: warning: arithmetic on a pointer to void is a GNU extension [-Wgnu-pointer-arith]
   13 |         printf("%p\n", NULL + 1);
      |                        ~~~~ ^
test.c:11:14: warning: unused parameter 'argc' [-Wunused-parameter]
   11 | int main(int argc, char *argv[])
      |              ^
test.c:11:26: warning: unused parameter 'argv' [-Wunused-parameter]
   11 | int main(int argc, char *argv[])
      |                          ^
test.c:13:17: warning: unsafe pointer arithmetic [-Wunsafe-buffer-usage]
   13 |         printf("%p\n", NULL + 1);
      |                        ^~~~
/usr/lib/llvm-19/lib/clang/19/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
   26 | #define NULL ((void*)0)
      |              ^~~~~~~~~~
5 warnings generated.

Well, that's stupid.

regards,
dan carpenter


