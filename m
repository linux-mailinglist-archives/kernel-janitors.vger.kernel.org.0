Return-Path: <kernel-janitors+bounces-2841-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C888B54A8
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Apr 2024 12:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80511C21856
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Apr 2024 10:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D7C2C85F;
	Mon, 29 Apr 2024 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuGJYnty"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C794829421
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2024 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714384820; cv=none; b=GSJ4O8wSlsUTpUXLZge48UzTq37pYM+K1OBfpDny9UrlN/SueJKy2qcPoctiVNTH7fVJjJ4VuLo2n8bDlCZMnzqJIrLe+8tAbqNaNvc3wBwdj810dftGpqTt/L89pS32b8p7KnaTIAvYdm1PcgrZOsXErpsDhBuSOQaFhPxY7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714384820; c=relaxed/simple;
	bh=/dZqyz1It+w2R7umVEzwzcTipCzDfzUlkwHTD8s6SOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUcHXWyt0TAEt9V3ENecQFQSjaGX4R7YK8W/xgtebDT1BKGBvEEbuWBI6wYCx2N35bfN0ld28C5b8Odd9dUis0jlQC//0QJNY2SmVhCD9hRt6J7O+D9ljDg/eycOk1i8ArIvluX8pV9YZr3koMX0cdmzPUu0+FeB40AlyvcJewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuGJYnty; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so65899841fa.2
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2024 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714384817; x=1714989617; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6herh9L8Ye+/rY/8ZqWIyzGEwHPKIW0DS7qwT7CViEU=;
        b=XuGJYnty+ZRGrIATEfSFGRS3XgebTfwirFADxAQKjI7u7kZRf6ugFzo8E2Ns8tq23n
         iDe1l5s228aPfXQZcnwCVmw8DF3bcAfJhe/CeDaJi7UIstQMwW9oubAaYCBVvp2wtFZO
         vcO7mwBVZGveMMEc/0rEzISnVow4/WMB+JKhnX1SS9lK95+LJjD5iOT9yicwLGqS3+jy
         a0FiYVYH3ASWjME152KcEP8tYwJhlV1xm7BFar17nJzvslq1TLK42k7AODtioh5L1TwX
         mQj+EGo1oC0YNxQ2wpDutTrOSaP19cmogDUT7/7zuhRYHlZ5YgUN9GeO4htMSSqT+UY1
         24tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384817; x=1714989617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6herh9L8Ye+/rY/8ZqWIyzGEwHPKIW0DS7qwT7CViEU=;
        b=KUII9d02G2EuguuGPkfhLE485VnuxG4eulKOnmq0+SZxAVIYbfyDkVt0ji56K7ACTF
         bXDgQcmhkdWaSkKerajk85/wFp03Vy0kr+T/D+5PomGCXr/ardXzaSgTK1H/DXxcDJuL
         1FydOcaeHi+PPi4/nEq7vL+sZVZyKQPkapSiRLFjGBtTw4TgzKmE0NYekGrA63Zxhi/v
         ystl/hw0hLXFw4oZ7th+1HkU/aDzXQ29t8rAFlXHLl62lJgpTwtQyokmCj27/gJaA22d
         x5DkqwQVmk3Dmrl7n636zwjWlfW9TSr0odVyYBcOw41ViSsZM36XG90JJhJzogv/NO07
         A14Q==
X-Forwarded-Encrypted: i=1; AJvYcCWglZcDZoZ6GonHD5P3vNzCKUOh+xWVhPvTy8aLKpTiHtkQghdiKC7T7BAWeymrubLUDkvsmK/94XLJDklYaT6ohslfqp8wHyj73nfI5A/1
X-Gm-Message-State: AOJu0Yz7QQBN9pHmGsMJMHB0XHby4JQLfE+WkJuMxZfHzEoFDIrsMb8u
	x7/Ds1snRuZnQIhWob4mFEqb4UEVYuX1jZ/NWUmNYVx7yTHXZIR4d16gyU0B7bI=
X-Google-Smtp-Source: AGHT+IHw8pGwH4w5X5Ob/iDCnRmh06lGOKdejVGcTb2jrtnhOlzwS6yCZfh7Y3XAS52rVxcDVy2pwg==
X-Received: by 2002:ac2:44cf:0:b0:51d:9aa7:23e with SMTP id d15-20020ac244cf000000b0051d9aa7023emr2088320lfm.65.1714384816684;
        Mon, 29 Apr 2024 03:00:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906249400b00a5910978816sm2568ejb.121.2024.04.29.03.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:00:16 -0700 (PDT)
Date: Mon, 29 Apr 2024 13:00:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] cxl/region: Fix missing put_device(region_dev)
Message-ID: <9254b051-3221-4877-b6ce-68bc2bb9f217@moroto.mountain>
References: <20240429013154.368118-2-lizhijian@fujitsu.com>
 <bdfa663d-9a00-484c-80f7-75d7fa130cd3@web.de>
 <2ea9506e-4be7-48a2-bcc8-4ae543a7f1b5@fujitsu.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ea9506e-4be7-48a2-bcc8-4ae543a7f1b5@fujitsu.com>

On Mon, Apr 29, 2024 at 08:26:19AM +0000, Zhijian Li (Fujitsu) wrote:
> 
> 
> On 29/04/2024 16:00, Markus Elfring wrote:
> > …
> >> Simply put_device(region_dev) if region_dev is valid in the error path.
> > 
> > Please improve the change description with a corresponding imperative wording.
> 
> Yeah, I always overlook this point. thank you.
> 

Greg has a bot that responds to Markus's reviews for USB.

https://lore.kernel.org/all/2024042547-shimmy-guileless-c7f2@gregkh/

regards,
dan carpenter


