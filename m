Return-Path: <kernel-janitors+bounces-1884-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B851866B47
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Feb 2024 08:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5679B285955
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Feb 2024 07:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7811BF37;
	Mon, 26 Feb 2024 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iatEbTWA"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0838E1BF24
	for <kernel-janitors@vger.kernel.org>; Mon, 26 Feb 2024 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708933564; cv=none; b=Ka7yIpiqjIjqOHA5uKs0N4iqzy3+on2VRglcVDTQF1N2OUlUjxf7KhBgc/esj8UhB8IVF9OwQsQQYsNhZjaGaHiIF/cCrtzqD99PLT1xhE/4g4NYydNjBD4AQTCbAZ9hfkeqUUt6TWXhbUzYnSWVJKVuL/i1Cd1YBtGpY8kp+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708933564; c=relaxed/simple;
	bh=h+5Dv6785Zmd0pt42yZLFng7XfEtwH/z3aATiBwNDA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlUMSOzQxBX9jpmhMwodyLn9LXzISAQc1bhIsq9kbplVSl/M2N65ighic5jB9ps63n5krJv54075z7I8nzl1qsQkARITjFJMQ6N6WZPI3j0Mz/Lw7QigDa7GWA9H638JsdAhErICKP3irjUPAcwtm++4jTPKR/a3jI1N2oTq5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iatEbTWA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512d19e2cb8so4092803e87.0
        for <kernel-janitors@vger.kernel.org>; Sun, 25 Feb 2024 23:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708933561; x=1709538361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAYfpWmaOhg1tF+MJRg5o2tzCsvNMOZEF4/3huFTseo=;
        b=iatEbTWAu4SNJ1XRkxGN2jC4lqXVM7xAU3X4YIduPfoDU+VOWtANcVSUJGDoVELN2I
         7BiBxZAKlxBpur4BjQ6p7/WoPBPkt57dkND+uOjtnPRzNFLLGJSBXx4Hd2OIPadOtucU
         DwrmQz8Wc4O+OQkiifmkxzeyylpRiCY2fIUM3jEGh0+7/zouEoEMTWdX8xerE3e2uhX1
         W3CnrvuqdOxCaeOgkZd6/WXJIWYyQRsR6vGq1GxE8qYIKjziJJ/CEtBBcbWdMmETU2rX
         H2fUsrnHTlLF+Buua/FRcJGZObDi7zvzF2pSlRH0ZJ6x6rB5XHj20EpljJ43dBPxktz/
         IIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708933561; x=1709538361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAYfpWmaOhg1tF+MJRg5o2tzCsvNMOZEF4/3huFTseo=;
        b=F+b0u652IQEQ0MFiClylyL7MpCR1sRt+0wntcGQl2heHQlyhHQUHGbt72WAFXB4xXg
         XUdn6QsyjWWoMS2fnoHIYBSNXsUGeF/YYAupAg/1WagD+WahpzQF7D+8CqIJIaDW4POG
         kNmG6m9+ZBGA7lPfYdiE4DjbsCHOUq6bG7UE/e/WcGFv3o6MCOsCPU1uyzOvcHyBFKVf
         S5CYF5trtOi+y4WBs/aFHTnCLbLCSTechJHWRkNZe24OF7blcpjSiGnGbwZzZmqp866E
         eEZXT8S1Zcb5b4IQfi+jG9kVV1EGQSoFirnFOkiwgy/zlAQPhzy+b9GQ/HiKs/BKEMWo
         P1SA==
X-Forwarded-Encrypted: i=1; AJvYcCXTyLKCKQtcX8zQwPAIkyYQ4hKbS+5Lo55XNoPB3WQ7Xo7P0OULEWt9J6fgiKobh5a/uDbWu8UU5AHh/zzegm0vn5ziZlUb4IiRTLVfn3zE
X-Gm-Message-State: AOJu0YynPdisiA6NQQzaKNvscujCE2S/VZ2xArW8nOMTm8ImQkTVFsAW
	S5ikVBQOkEgp50Lhifkr7rl1aDeNp0eKLvUqk0Mb6h8MBcYbyzGz6z9kEjUNc4s=
X-Google-Smtp-Source: AGHT+IEv7KihlMlM8hb5fvNYPQQ0V9fBIE68IZ/Xf2GUjvygpJGivWRHioW96Uh4JhjECKpEjpb3mQ==
X-Received: by 2002:ac2:5059:0:b0:512:b04e:fb52 with SMTP id a25-20020ac25059000000b00512b04efb52mr3429365lfm.4.1708933561179;
        Sun, 25 Feb 2024 23:46:01 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k8-20020a0565123d8800b00512f63729casm577160lfv.25.2024.02.25.23.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 23:46:00 -0800 (PST)
Date: Mon, 26 Feb 2024 10:45:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] iio: adc: ti-ads1298: Fix error code in probe()
Message-ID: <9688be98-e88f-4626-bbd2-1c1789417afb@moroto.mountain>
References: <5f393a87-ca8b-4e68-a6f4-a79f75a91ccb@moroto.mountain>
 <e315c126-619c-48a1-a5d8-001e5ed01930@topic.nl>
 <20240224181354.76842da7@jic23-huawei>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224181354.76842da7@jic23-huawei>

On Sat, Feb 24, 2024 at 06:13:54PM +0000, Jonathan Cameron wrote:
> On Thu, 22 Feb 2024 08:10:25 +0100
> Mike Looijmans <mike.looijmans@topic.nl> wrote:
> 
> > Good catch on both patches.
> > 
> > If so desired, you have my
> > 
> > Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
> 
> Dan, here is a classic example of why I think any series with more than
> 1 patch could benefit from a cover letter. It gives somewhere for
> reviewers to give tags for the lot in a fashion b4 can understand.
> 
> Otherwise great find and applied to the togreg branch of iio.git
> with Mike's tag added to both of them!  Hopefully the fixes tags will
> remain stable - whilst in theory that tree doesn't get rebased, in practice
> it might if I messed anything up enough :( 

Sure.  I can start writing cover letters.

regards,
dan carpenter


