Return-Path: <kernel-janitors+bounces-1256-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D982BAED
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 06:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA0921C23A5F
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 05:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037E85B5D9;
	Fri, 12 Jan 2024 05:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BzzlD9E4"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109B468C
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso62897545e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jan 2024 21:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705037944; x=1705642744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiDn8fsb/vXv/L6J68RoIu0fEKZtx7X8DsFKfCb3Tp4=;
        b=BzzlD9E470tbDBa9frFIfNDUzGTTlgOALAgb+LIHil2I7SvemXLVsqttRhjHGF+z7r
         iygKNej/douUq4nG5u3Mpy13/+7hvM/mesbsJi3rdFxun4d3boCIIrWxn/Ley3R5TZUV
         wRYxm6IfyGCemKGquYbuxl0tX6ZifEmP8MB/1KW905mjsUxf2u1IsdTxcGvffzxJYVSI
         es6vLF08rOkyAxHk/0wOd5K5Y06hXBQQd+xoVDo9ybVGmG+TppF8Dh6sQVpn0q45EArY
         MNzuBhu/ys6gelJJsT1VE0j/6BGxq7RHOwBSP8z1ocq6NHUd5eW7z7RseE15rXdQ4O3Y
         qyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705037944; x=1705642744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiDn8fsb/vXv/L6J68RoIu0fEKZtx7X8DsFKfCb3Tp4=;
        b=Na/B6mcXYMmFQRD34WK5mutClchQ7YJKzIXS6sQNnJI9AdCbOB81Od2ga1sFsSRro5
         Cc/cB3e94XvUgxHIrR0pMRg8axBz0yGdeqJ8HHMiUql0jujxwA7QgHFcXqANoKN2UVu2
         Lz0OFW4T3XZxt+QRxTAUrbJXXsgJ40K5UpJSz/k5QauWkVM4rdEqYkF0Wo+XKvycHwKv
         IpQ4F5+OlWBUM6V2mgsj3lL7vjFFuKzQ5Mx+rBxn5fZNP6vNItLLSNRlvMput/q6wG1M
         aB/ywvym1gZws+218wJC3B+lrAaXuZ9uUvkhMifEIiMN5TGwFRAx9KkTuhohgV2K1goA
         koGA==
X-Gm-Message-State: AOJu0Yw60Bx+T61u9MBt3oNpBVkgRR0usiOyjJzo0yZhCvf432cGacsF
	caWbBSw6zJgyo3knzvUr8YtrxvFIBXaOnF+i+YeMHCBbep0=
X-Google-Smtp-Source: AGHT+IFvjBPtLo9ob+nA2/xoB/tttzpKEBPy46eXB6Vhxa8Xq+l2uSGXivag26hLaecBrG00w06FWw==
X-Received: by 2002:a05:600c:208:b0:40d:8f0c:db8a with SMTP id 8-20020a05600c020800b0040d8f0cdb8amr211644wmi.278.1705037944133;
        Thu, 11 Jan 2024 21:39:04 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b0040d84bb7d6csm2019856wmi.0.2024.01.11.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 21:39:03 -0800 (PST)
Date: Fri, 12 Jan 2024 08:39:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kunit: Fix a NULL vs IS_ERR() bug
Message-ID: <fc3a2fbf-2a4f-4730-8151-6176e29f9df0@moroto.mountain>
References: <39b4278f-35d2-4071-a3aa-ec49705272af@moroto.mountain>
 <CABVgOSmxsfxZ9tPpnJZF+3FUymw0Lv=zsBx5UGYD+83-qnAagw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSmxsfxZ9tPpnJZF+3FUymw0Lv=zsBx5UGYD+83-qnAagw@mail.gmail.com>

On Fri, Jan 12, 2024 at 07:39:14AM +0800, David Gow wrote:
> On Thu, 11 Jan 2024 at 02:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The kunit_device_register() function doesn't return NULL, it returns
> > error pointers.  Change the KUNIT_ASSERT_NOT_NULL() to check for
> > ERR_OR_NULL().
> >
> > Fixes: d03c720e03bd ("kunit: Add APIs for managing devices")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Nice catch, thanks!
> 
> Reviewed-by: David Gow <davidgow@google.com>
> 
> > It's a pity that there isn't a KUNIT_ASSERT_NOT_ERR_PTR() macro...
> 
> I think we'll add one, but I'm not yet totally convinced that it would
> be better than using ASSERT_NOT_ERR_OR_NULL() in cases like this,
> where we're:
> 1. In a test; and,
> 2. using the pointer afterwards, expecting it to be valid
> (dereferencing it and/or passing it to functions which will)
> 
> This is largely because it'd be nicer, if the pointer is NULL (due to
> a bug), to get a more explicit assertion failure, rather than a crash.
> It does make the test code less indicative of how the APIs are meant
> to be used elsewhere, though, and annoys the static analysis, though.
> 
> Thoughts?

It doesn't annoy any static checkers because nothing looks for it.

Expecting that this test code might be buggier than normal code probably
isn't unreasonable so I guess that makes sense.

regards,
dan carpenter


