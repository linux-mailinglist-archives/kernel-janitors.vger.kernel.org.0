Return-Path: <kernel-janitors+bounces-5726-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 140CC98AA2F
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 18:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6685DB23F61
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 16:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D952C193064;
	Mon, 30 Sep 2024 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4h7QNFk"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A2A1917D7
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Sep 2024 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727714731; cv=none; b=uUNmjL58yLkZsSybl+zbxv5ZwZlwnHYzb7ydz0FgRThDskKxpVEF/rMAASRz5gYxR+xbHV4NFAb1DBVetgRhMc8lTyzH+amCbpc/gJrYYa/sEBx0NfoTITjlj1Q1+YuMJMj806dVY9fEfw5vTM/17wIdTrI/VWqQyA2EQoY+P64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727714731; c=relaxed/simple;
	bh=As4xlKeH8pzXDzf4olvO/gak593BaigkLPoloN50dV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlIxTeuz1Pmo7Ub2vHzIzFVkLK+sX18SmD6z9mjBEmsyf/rUVpSzTkluxAtdfFvSAe9/nBd/AYbBJ1/xtuao3k6n+g0jPEa2wjfpXKRIeM6eLr7RcZ5lWAUBrn8TSU3iIWkhBW6nPU8GsS3oQCKW7569tocJzzzajfbVl61Npo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4h7QNFk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso3116177a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Sep 2024 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727714729; x=1728319529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvcxQTQeQJCxAAgL5ZNrVRQRYKFeNgf1iUtSk1J+SBQ=;
        b=o4h7QNFkYYbFrYyv0R4IXHYUG/90ykN7mh4lrr1eEeCT70W94WyCqAO1wRZr9wAX2D
         F9xu9ybZdZs1I5zgvKrPxmKGAsYwzhPEOjOQ5N/lqTa22w6XD6npn1YgrZRN/imTzzUg
         5ATHy0zX9wq9VDuA1FJ2cy7UyWEOHqhC33mXQi5dUbv0s4+qmY6GpC99lhwzCZO7TPLU
         vdiwc6HtIy1lOIchzrzj/jhChkCh28kfcON8pMhuqIYEW6lhBsFvl9BkMI2RtBK+yq8M
         SQbc+7ClStHEQAxbP1QaovXk7AYZS9TjgprxqJClWC2EORMhfvOUNjCiuCfo7h1ewsnv
         tqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727714729; x=1728319529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvcxQTQeQJCxAAgL5ZNrVRQRYKFeNgf1iUtSk1J+SBQ=;
        b=fAlkwyZhcoxexO+XFE0ON9arLNmMsyzJqieSC+BdD6hm0XJqmw0Bkd3ec0l+WpFUwt
         cntkHRSxthxJULads3krJhepnWuk+Pe7HbW+9Asb/VT9tGqztMeR1wKrE9Kqb2mLHmGq
         FfU+Lgn3L3VpZlkn6HANoK4UaQu50E4yovNns8s/sbAov5IjypjdFxk7oG3scQYEOt2d
         DeJPCJGQG4Ka1cznINZOjV/23GE8nSAz8gRXWs8EUpjs/mKFBxfrnKq0X9LISHMkYiFR
         MDhIeOEyLgS9LD12ceUVkPNpoxhMirxYHAOVLyR/cS8EJQiukbE1BkkWllh02s3X0/77
         j43w==
X-Forwarded-Encrypted: i=1; AJvYcCUsF6ol6C3rSqlZFeXp6GRfBYZ4OCRazPlLgLImUlvgNkgJzmW9JunfuJmZz3AVBDmUEvwwPBj98/5/U5xLXtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+za0vt8zKi3Z8QJcAaBkheIkRqHAYM5EAhVOSCTixtPafDM3
	8CA+XhnetL1VCaDn21rsQ5Cwba/UrQRToVigv1ewnVWKnAo5Sjd3UQK3W4LvYnk=
X-Google-Smtp-Source: AGHT+IFZCWfdQrwy49Ce5W9jR5Wa05yMjvNskGuw5IOlhsx0iH8HMju8vYH03I+79lPN0n/TIp3wDQ==
X-Received: by 2002:a05:6a20:3b19:b0:1cf:53ea:7fbc with SMTP id adf61e73a8af0-1d4fa6a1496mr13517438637.18.1727714729181;
        Mon, 30 Sep 2024 09:45:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6561:7ef:acea:822e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649ae1fsm6412216b3a.8.2024.09.30.09.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:45:28 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:45:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-remoteproc@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Hari Nagalla <hnagalla@ti.com>,
	Martyn Welch <martyn.welch@collabora.com>,
	Suman Anna <s-anna@ti.com>, Wadim Egorov <w.egorov@phytec.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] remoteproc: k3: Call of_node_put(rmem_np) only once in
 three functions
Message-ID: <ZvrVppLgBjCB9FK+@p14s>
References: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>

On Tue, Sep 24, 2024 at 02:43:40PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Sep 2024 14:28:35 +0200
> 
> An of_node_put(rmem_np) call was immediately used after a pointer check
> for a of_reserved_mem_lookup() call in three function implementations.
> Thus call such a function only once instead directly before the checks.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 6 ++----
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 6 ++----
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 3 +--
>  3 files changed, 5 insertions(+), 10 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 8be3f631c192..d08a3a98ada1 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -576,11 +576,9 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
>  			return -EINVAL;
> 
>  		rmem = of_reserved_mem_lookup(rmem_np);
> -		if (!rmem) {
> -			of_node_put(rmem_np);
> -			return -EINVAL;
> -		}
>  		of_node_put(rmem_np);
> +		if (!rmem)
> +			return -EINVAL;
> 
>  		kproc->rmem[i].bus_addr = rmem->base;
>  		/* 64-bit address regions currently not supported */
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 09f0484a90e1..a16fb165fced 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -433,11 +433,9 @@ static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
>  			return -EINVAL;
> 
>  		rmem = of_reserved_mem_lookup(rmem_np);
> -		if (!rmem) {
> -			of_node_put(rmem_np);
> -			return -EINVAL;
> -		}
>  		of_node_put(rmem_np);
> +		if (!rmem)
> +			return -EINVAL;
> 
>  		kproc->rmem[i].bus_addr = rmem->base;
>  		/* 64-bit address regions currently not supported */
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 747ee467da88..d0ebdd5cfa70 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1001,12 +1001,11 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
>  		}
> 
>  		rmem = of_reserved_mem_lookup(rmem_np);
> +		of_node_put(rmem_np);
>  		if (!rmem) {
> -			of_node_put(rmem_np);
>  			ret = -EINVAL;
>  			goto unmap_rmem;
>  		}
> -		of_node_put(rmem_np);
> 
>  		kproc->rmem[i].bus_addr = rmem->base;
>  		/*
> --
> 2.46.1
> 

