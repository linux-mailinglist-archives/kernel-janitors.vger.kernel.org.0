Return-Path: <kernel-janitors+bounces-1221-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA282A7FE
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jan 2024 08:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE01C28757D
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jan 2024 07:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F170DD30F;
	Thu, 11 Jan 2024 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQ+rEmOL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD967D2E5
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jan 2024 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e60e135a7so1200195e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 23:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704956711; x=1705561511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c88q11mFDQYeOknv4qGIC5GF5jF3N1odbQAn/Kw8ulo=;
        b=SQ+rEmOL/hhQGFGrC9UgmZlZLoS8F2hjsUBHJ4hzatmNfRfLhl6TBg+e+kMRJCZeMh
         QFO5t6Y4kn2HPWgw0pl0OYr4fVHC4rWaZtKJWtRLJPCOWD/bo52B3uokLxcEgTcg/k/Y
         aJs7u9ciJSEeCPe1wi+zwoaT/1ulRSCROFgBc7SlrpuDzdYwrft0W4y6/R8IXctCdfH7
         yDEK+QY78wcSE8GXeYUYyuKGeJngXIUKel6IdVZK1FbW6DmxMQgeIqx0c8uWy2s+e194
         Iopz1AUEEVmS+kIFv6/QIGF5Ki5GSe82ALCx8CeLdktMvEXqGsqo/hF8t3XRr6Q60qEN
         BNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704956711; x=1705561511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c88q11mFDQYeOknv4qGIC5GF5jF3N1odbQAn/Kw8ulo=;
        b=eYJxZne3yTVSCfxqBOrGUWBvOcYPHSxQrBCpc9ygyl3IMuigJoRU/TTfQa0q9IIIce
         CnaDcLI9h5n4w03jyNVpXpwiwTiGkF1gaG+n8i7JDBE9Gp0WaMRNnNrQeEhsd4pbpEoc
         XZB1PRwfq+j91eMJTs6FJkE99GvoHCgEtPyF4KjWhSgtwPSyDKa0N9n3XkbGot0FZV/s
         nOg+dE5wmZX66wQiBOiy5djY9bi3ClEWymqFAiUI7yRL6VCsVoUOfBWFoisf8QnLRGsv
         sf3jCOmWfHnk+cGP9dp4BJNzQ0bKKG/To2JitNvDR+mX/180ALv3xvjGLIc2jxewli22
         GFAg==
X-Gm-Message-State: AOJu0Yw/vkVsZ8//vFF0hLFr48aahrNMaEFzHKm8PUJrHgVieU6KNs6H
	FEgqPjUdf+MnMvebLs0VVT+ovy6XTwQTRg==
X-Google-Smtp-Source: AGHT+IHraH0bMQyaz+uMRCytwOtol9Gq5cxDzerj0uxebgaEpl+uNnUwWjD3VHOPJawqhaIplc/rFQ==
X-Received: by 2002:a05:600c:3581:b0:40d:7259:4732 with SMTP id p1-20020a05600c358100b0040d72594732mr106983wmq.32.1704956711026;
        Wed, 10 Jan 2024 23:05:11 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b0040e541ddcb1sm717002wms.33.2024.01.10.23.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 23:05:10 -0800 (PST)
Date: Thu, 11 Jan 2024 10:04:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, "cocci@inria.fr" <cocci@inria.fr>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Drivers: hv: vmbus: One function call less in
 create_gpadl_header() after error detection
Message-ID: <4ba5ab3c-80ae-448f-9377-01087ec9e858@moroto.mountain>
References: <6d97cafb-ad7c-41c1-9f20-41024bb18515@web.de>
 <SN6PR02MB4157AA51AD8AEBB24D0668B7D4692@SN6PR02MB4157.namprd02.prod.outlook.com>
 <82054a0a-72e5-45b2-8808-e411a9587406@web.de>
 <SN6PR02MB4157CA3901DD8D069C755C72D4692@SN6PR02MB4157.namprd02.prod.outlook.com>
 <d3c13efc-a1a3-4f19-b0b9-f8c02cc674d5@moroto.mountain>
 <SN6PR02MB415710A52835BC82B1FA1EAFD4692@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB415710A52835BC82B1FA1EAFD4692@SN6PR02MB4157.namprd02.prod.outlook.com>

On Wed, Jan 10, 2024 at 10:17:17PM +0000, Michael Kelley wrote:
> From: Dan Carpenter <dan.carpenter@linaro.org> Sent: Wednesday, January 10, 2024 10:38 AM
> > 
> > The second half of the if statement is basically duplicated.  It doesn't
> > need to be treated as a special case.  We could do something like below.
> > I deliberately didn't delete the tabs.  Also I haven't tested it.
> 
> Indeed!  I looked at the history, and this function has been
> structured with the duplication since sometime in 2010, which
> pre-dates my involvement by several years.  I don't know of
> any reason why the duplication is needed, and agree it could
> be eliminated.
> 
> Assuming Markus is OK with my proposal on the handling of
> memory allocation failures, a single patch could simplify this
> function quite a bit.
> 
> Dan -- do you want to create and submit the patch?  I'll test the
> code on Hyper-V.  Or I can create, test, and submit the patch with
> a "Suggested-by: Dan Carpenter".

I messed up the if statement the first couple times I tried to think
about it so I don't trust myself here.  Could you give me the
Suggested-by tag?

regards,
dan carpenter


