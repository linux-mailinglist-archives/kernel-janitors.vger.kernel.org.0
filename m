Return-Path: <kernel-janitors+bounces-7285-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C544AA4BBB3
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 11:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539443A2BA7
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 10:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E121EE7DD;
	Mon,  3 Mar 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFB/Uj9f"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8101E570E
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996517; cv=none; b=fECa+vx44nAnvsPVxOYUy0P0MglguyLXqtyn5mu+B7hJacCSWNtGc7F8JEgZt69TrOiV1dJnnzmvhoNDn4pE+4Vp1l3e4JpzTx3+8uv2NQz5SZy7wubIKcjgeA6Y7qW/nmbDpG93PMATkTWytOctopmZGVRfMot5etPI5+r6zX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996517; c=relaxed/simple;
	bh=Fg0PMUf71HrKqLcTdAMEOyWnPDpROLGy0gLEnbMjfIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jE68A+dSrZFvdNon7RALCblYlPsmyzPt9UPWHo4XfwY+Zh1Z6bJYse0ZAUebvuaZBdPOZae0MmkLVomkcy3/LJ2hwC4ffoEXyKiQpOvKWplKqPEaIzFKxyN5oj1H11w/3LLtmOwrOT7m0TdwyQk/WSnWroWTDFlx56K4S/EjpE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFB/Uj9f; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso5729601a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740996514; x=1741601314; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GjBFcA67rMS7ZHAwLBuRWTDfKIm2qOaBa66RMYQiiBE=;
        b=KFB/Uj9fe1HQqhfh294N7SmosO9Bl0Uyrom98f3vxF/vx2yjJcd49hG6tdxfHMWVU5
         avqx5k1KEL+cioBmDPZDYBcY3fHa4pqfLHTqesF5N+tRzDEN5JX+DTE19/F0dIaWX1Bg
         1apLKX1lxhh4vsZJ0nPSIE7BeSuddlTJevQ76g6uIZJSyTMov+O6lVpC5TOQ75pNhhaa
         Q5BrDlFuC64Tq1NRm66fkV5+HdF26K0hz8dvDIT/caMUDpQy0afbpNHjndM8L3T7ttob
         BP1kSbL4dqIG2CddQ94zMRKZ4LMkHJEZhsTWBAkJtm4atZJbn2yU9iM3UwEiDXaGiUn9
         MwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996514; x=1741601314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjBFcA67rMS7ZHAwLBuRWTDfKIm2qOaBa66RMYQiiBE=;
        b=DS1lOzODNV+ijQsyR4KgmDx8gM8tbqwC0QGTNhR+0/buvT24TLACojoFe9UjxTOC1W
         LlrQpU4JrR134hyk0saSjSVRB/MtjxIoMR9QN8BI9PE273yfjQro0dKBwhwPlvmt+KY3
         ki4Kozu2FLtdo5YBWxFyfQKzXLf7+GmBGa4wj/JYcV1kQVtsmkgXrGf6hm8Ev/mbo2R9
         hS3emkrg4lZ+Uf6S7pDDvmdtXSflGNWoZxtfBYRmViIDTJWUwSZ++Q9BYq9cdfzzQWWR
         6X5iUvZkSmnTbCIhmOEXP6JWno6mYGnlO6AYqprsKLCoJu0c1hE4Ih17rffgt+5yujt0
         WhLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBmi3MRZGWXiyzyTkkmURRvZabl8ws6SSYlO20ug1zpKls7TyjwJgcowShdrB12BVgA7ilpk5HtUUxfBLSFUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy50Ss+0db8Xbz5rV72AmaujzuYrJgrljEUeUuzx8EYvqGY071
	bRNmIOmiDGE6wbEGx5jXLmdTLqRaP9UJ0Dctufy4Aurexw7tFlGLkNwjeHQQwrgpGhtkO+ztQY6
	Q
X-Gm-Gg: ASbGnctOBr+EfMXZbNsaCuiqtO5wl67lTjiO2yCHreoMTRtEXLfVQ/gkbyxoVHwfIQ3
	qQ8v96MtXtuDf3zhdBy7MZ/ntflgWYskaOpRN2yiIEKokssJNy2+AnMOkN3BUNBm1IdHfTT9s5S
	DyAPkuedFGM/dcm+ZGb+1HNq/uLzrD4vgDYAQUpcr7GOFMbZM91BpLVB9RJNP0v8+N5vXOmYDI+
	iz3yHmgA/Wyz5HXtffuhQul2ZSlCtEFSAgAOJUyuahAZlGbNvr4X64KBnRnC4K6ylMAgOCCa8T/
	ZmxDuI7pSjrykNm3EQvSDXUXquKsKfVQl0TVnjNNvDNQd9Lg4w==
X-Google-Smtp-Source: AGHT+IEPxlHoiKz/rey+mSNj9p6SHZuD3oFGIyaUPKEFRRWxafVAlE/vcmhJEnz4DfJOlevycDZ6wA==
X-Received: by 2002:a05:6402:274a:b0:5e4:c235:de10 with SMTP id 4fb4d7f45d1cf-5e4d6b7b21fmr11376850a12.32.1740996514382;
        Mon, 03 Mar 2025 02:08:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3b6cfd0sm6648394a12.28.2025.03.03.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:08:34 -0800 (PST)
Date: Mon, 3 Mar 2025 13:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>

On Mon, Mar 03, 2025 at 10:19:06AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 13 Apr 2023 21:35:36 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the function “au1100fb_setmode”.
> > 
> > Thus avoid the risk for undefined behaviour by moving the assignment
> > for the variable “info” behind the null pointer check.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> Should also get
> 
> Cc: stable@vger.kernel.org
> 
> to ensure this is backported to stable.

It's not a bugfix, it's a cleanup.  That's not a dereference, it's
just pointer math.  It shouldn't have a Fixes tag.

Real bugs where we dereference a pointer and then check for NULL don't
last long in the kernel.  Most of the stuff Markus is sending is false
positives like this.

regards,
dan carpenter


