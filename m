Return-Path: <kernel-janitors+bounces-4447-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B356C923FB7
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2024 15:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A8A1C25D81
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2024 13:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C51B1B583F;
	Tue,  2 Jul 2024 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SD/4Xdcy"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F281B4C51
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jul 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719928649; cv=none; b=rqEaXal/eLtJa174otii5Rg4BU9SDKIZjXdw1OR0hahg3RFpKsRGyyj/b0osr5VRF+rFVejD0DgMjohG50dJ+DtVrSYg109EUu0SIdJnhAswcZAvwndqE0oErDbzv7fhoUj0M/ygeYkyDq32gVciT9RatamHjtDaxCHxt0xy7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719928649; c=relaxed/simple;
	bh=qt01brAtBuYeYDb5XU6vCoxDmnQV+1+Sre8GzSkYpTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/rjK8j3CXG0jgQpKrS/99G9hjeBDM7o+en/+5PQQBO1VBqNiD9nQUKZ5Pn7M3tkFLPndGWn32UwdniFRq+rJ2aFOcr5R3d3rH1GQuyWSBYNZWOJUOL1YppcR4I7kOn0a5T0dJXbAjvG/jiSGUWKImgyBECHIaHzJKK3aEJdhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SD/4Xdcy; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6f8d0a00a35so3977060a34.2
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2024 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719928647; x=1720533447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePmiEYi/a4AH0wn7ckFFYm2PTW/+uVYsAN+yRliA3Bs=;
        b=SD/4Xdcy4fe3ZVO3oqqPa9q++Hszs4ulZr+39UOdXOyvkdKhvwxmZKrmgdd8yCaT44
         hdfCXKvZYcDiQ3oUXQd/guxEeUHK4MZo+A/3YKrwPtSp0ZTcnPTsqWXmMiNY5mvRbNYL
         7ew+UjSEDqgPZqHhuchJkmRn0iHR2vzuDgvYouou/tFzOESIL5bAPGwn+631ctrH2xqI
         X0kdOTs4OyB0RI9VrakfixnBTs09+l5czZ7QAGxKniScmlgTDw/6rjmiqIzh24vGuuMO
         A0RGrmTmMiw6ig5S0YU4n0qwPMhZQPWQm0wiwN9pGD6uXJLcOIaXQ4ZoTyOLQACl5CZJ
         lutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719928647; x=1720533447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePmiEYi/a4AH0wn7ckFFYm2PTW/+uVYsAN+yRliA3Bs=;
        b=Aq3fQrECVVTeT2umIUOnU7z8QrQjx+/BYnjjTMJ7OrK3GrZUCB2D4f+G0Z+qPzi2Hi
         HYNqlMT0TUg5lKCyRo3n9gmTBrk1QbyXRy7aoA2nQPFRKMebYIlbHeFKJE6tFiPAZlP+
         2ndnYDNlKcitjNWBjNkWmtbYrs96MEyMuktpdiOxlglpELcft+Ht7PxURpu7EnMOLoCi
         DXj4SlbGvY+9r9TX/wodc9eO3tUOZ9zNzmtVYYD6r3i4v5gwctwnQr/fRc0Zz3CCXKuQ
         FaBtwppolePKuTPGEo/C6mwFRH7cRQPYRrcJLZ4kRqVVcxWK4hXgz1SFmrXVINYiQCnI
         Ft5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1PmcZFFK1fPlnXHs/pNj+/hmlAyLBQvrvXna7aDxo87gW6twdIgkGY2J8KZaZnb0G9tqtID0ViB9jGVknBuPzDtHhUQ8FP3+vgld+Glh1
X-Gm-Message-State: AOJu0YwsAthPFyYOheN6MeCrLLni6rgYHH2NUUdMPMuyPCOWW1/IcJ7g
	8hwt8k2VpYFDw+ukHgODu78+ScCs9cDd7JpUrs/xAHgsnunQKiw6bHWsKBAoY5w=
X-Google-Smtp-Source: AGHT+IH5Vk/edmC8lLAXOlWnBYfSKbo/eOsXpv1FuEvdKG37AODsGoiz394zQKMr5V6bCT7B+XImXQ==
X-Received: by 2002:a9d:7c84:0:b0:700:cf6e:e261 with SMTP id 46e09a7af769-70207708212mr10589665a34.31.1719928647061;
        Tue, 02 Jul 2024 06:57:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7ab6931sm1688615a34.31.2024.07.02.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:57:26 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:57:23 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: arend.vanspriel@broadcom.com, kvalo@kernel.org, johannes.berg@intel.com,
	kees@kernel.org, a@bayrepo.ru, marcan@marcan.st,
	quic_alokad@quicinc.com, zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com, duoming@zju.edu.cn,
	colin.i.king@gmail.com, frankyl@broadcom.com, meuleman@broadcom.com,
	phaber@broadcom.com, linville@tuxdriver.com,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless 1/9]  wifi: cfg80211: avoid garbage value of
 'io_type' in  brcmf_cfg80211_attach()
Message-ID: <ba67020a-04bb-46b8-bc05-751684f71e8a@suswa.mountain>
References: <20240702122450.2213833-1-suhui@nfschina.com>
 <20240702122450.2213833-2-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702122450.2213833-2-suhui@nfschina.com>

On Tue, Jul 02, 2024 at 08:24:44PM +0800, Su Hui wrote:
>  brcmf_fil_cmd_int_get() reads the value of 'io_type' and passes it to
>  brcmf_fil_cmd_data_get(). Initialize 'io_type' to avoid garbage value.

Since you're going to be resending anyway, please delete the space char
from the start of the line.

It's weird that brcmf_fil_cmd_data_get() uses the uninitialized data.
It looks like it just goes to great lengths to preserve the original
data in io_type...  So it likely is harmless enough but still a strange
and complicated way write a no-op.

regards,
dan carpenter


