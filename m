Return-Path: <kernel-janitors+bounces-5047-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A3953CC3
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2024 23:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593F7B2376F
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2024 21:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E985A154C08;
	Thu, 15 Aug 2024 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ownhA4S/"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4231514C8
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723757731; cv=none; b=eIEsTmg2vkx7+3kWQSEoTja96W+fLpCdgyELWFkQM7YbzMwciUaaRaGpjwMuduVIo+fso64svDMlwEP8QyNkYcV9Xo45Bdeqw3+KT6Bp7Rr7FzoN6JHSrfptKBlfHisaSIJbU8mVc6wLd61KR5ZRgAHcj+7GSfQ4NDpKTjX+6Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723757731; c=relaxed/simple;
	bh=85Et3LyGgcYCRqsytarYA/vC6hXDLIfHk4wiH/W8rE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktp93kIOXrgiTMGSYuiFgrZcLj6RShyB6G379XWQN4Bfhf1Rftmz53QWtTXKRzFg5bdpmJyuMyPWYynpiIKmv5YRs/hXKCOoMgFavxzqo+xWDUd804OTnJETP2YzliX8gE3CniuSwToKxrYylaKob+Vt9iqqRIQfOyh7Jk+XL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ownhA4S/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efd530a4eso2215267e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723757728; x=1724362528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3qj4pRwTR/N7wlzw62isxsFLKmYb8ZSPKnFcg0zHHk=;
        b=ownhA4S/NM8+1eDFzbY31x4lmZUbDzilWITFviZ445CrT7AfxsLDYDHC4q/V4Cjq9n
         CyKJdvjsRS3qcBWGf0n00/OkYcEO37gEVr04H2n56cXzcUNb2ywZL69pqV51gV4YfvuG
         KQ+hunh/QmEI1o9BVjxEkGuWaLwOLbND5RuwihigHEpp7yBZABCfESzMGDl8ZPXX8RXf
         7/k4Nn4Ik2jsTtTF2eaicrZs26ejlTtCENEIS5l8tP8wIW8xM2aMPbMSbeoJPnbFsM8b
         temWLdbGD30b4iu6V43V409BvnR96EEgFo2ntLwjdPq3/dsUZhWoADE9RODfTX2hdbj1
         nHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723757728; x=1724362528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3qj4pRwTR/N7wlzw62isxsFLKmYb8ZSPKnFcg0zHHk=;
        b=b8MIuboZy67djbVGNpT/xn8I9FxDm316Tt8LogQV/2WyBdxuI5balYy0JLq9OibqOX
         OKSftA3zTVBGu3+vY2OHcUN7nIfF1NWwroa2o0xfWu50lLiAizqQX/3NMHEm2IlkShms
         OByijvY9aMCx2dD5vifSVYT4exmXmf4Th88KtnYKdydyyKmecPAsACkgaBlxO/iWSl/n
         V1uRrTEnX8ubE/buRBR8ZfzDGciSTE3VMyTT6QB3DGWAjNCAVdPVJy51PH6akfJkcMlT
         CTRBlRQke9IL8vA/PKsrSgFI4LwwrtRvoNlbds9TI2eJ9YIp0gjYwEAY0UTk3Y++Mw7y
         exgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmHo+uw0+UonS6Hx6IIZiHi37U6wwJRnkjVgzsZ39QE48x04riCpWraFiHt+6E5I1qFgLMuliIswNmxtjApdExd5CGQBwt/2ZmYs4yzeaS
X-Gm-Message-State: AOJu0Yz2jU4OaF9zqNri0dGGB3VfEOP093qz62jOL6X5bLfkUgUhtIDT
	vaeDxi8nfn4hAgwLZerco+Rp+jy/fEsg0JqbmGMQULTsjunhor3vwJRRV1kGTl8=
X-Google-Smtp-Source: AGHT+IFT9W9SFnvKshuI2BWN6mZ3Q4hg5XR9mCXiiuBQfp7/zdYTKLQa4abD4l7S+aPS+vI+TNXIKg==
X-Received: by 2002:a05:6512:3044:b0:52f:154:661b with SMTP id 2adb3069b0e04-5331c695ab8mr525621e87.11.1723757727607;
        Thu, 15 Aug 2024 14:35:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed794635sm4567135e9.42.2024.08.15.14.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 14:35:27 -0700 (PDT)
Date: Fri, 16 Aug 2024 00:35:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Rob Herring <robh@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Brian Masney <bmasney@redhat.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: ufshcd-pltfrm: Signedness bug in
 ufshcd_parse_clock_info()
Message-ID: <6beba3f4-dfa1-4871-829c-ed1e44b5bd39@stanley.mountain>
References: <404a4727-89c6-410b-9ece-301fa399d4db@stanley.mountain>
 <b613d16f-1167-456d-a5cd-807db875adb9@acm.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b613d16f-1167-456d-a5cd-807db875adb9@acm.org>

On Thu, Aug 15, 2024 at 10:47:30AM -0700, Bart Van Assche wrote:
> On 8/15/24 4:24 AM, Dan Carpenter wrote:
> > The "sz" variable needs to be a signed type for the error handling to
> > work as intended.
> 
> What error handling are you referring to? I haven't found any code that
> assigns a negative value to 'sz' in ufshcd_parse_clock_info(). Did I
> perhaps overlook something?
> 

Rob's patch in linux-next.

-       if (!of_get_property(np, "freq-table-hz", &len)) {
+       sz = of_property_count_u32_elems(np, "freq-table-hz");
+       if (sz <= 0) {
                dev_info(dev, "freq-table-hz property not specified\n");
                goto out;

regards,
dan carpenter


