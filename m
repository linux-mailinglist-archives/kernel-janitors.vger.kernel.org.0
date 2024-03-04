Return-Path: <kernel-janitors+bounces-2063-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C7A870020
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Mar 2024 12:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF70C2844B1
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Mar 2024 11:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BA238FBA;
	Mon,  4 Mar 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sop8FN6d"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0538392
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709551023; cv=none; b=WttSDTFhlQOxp+6Dz65pdCbVz1P46uLzLXAmJhEcQNUhNdG/8UsTdVURSKFq+8Hjpl2fySe2fdFANgqb1AwvaxG9UHJgqeAoG8zCIzz7PqdfeOH6tCmXSwFn8zUgB7md4oBCMiXkzplqzb8obo2tNXNT/KLQ/7H9/iQALuJXp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709551023; c=relaxed/simple;
	bh=1BlIC2w6gZRcb1Jdtr26xUooK5VTCCvRxi1fD+9dmjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVFFvLQKMNeeNy6SqScD2fwpKCy1AbvUnCI0IWspNVf1Mmq8Jj1u62mGItKnzRu3SXnqCSP+F3AiErBN1sqFwzyGhmvs135uD9CRR1tcV+zA1QPeM+aDNrdipOmOlP45Z7ax10bd51lglI7hJVo0hTQB5LED69dOsMpuGxrgTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sop8FN6d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412e1b52934so5473985e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 03:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709551020; x=1710155820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPUD3naOzI7U6jLpCCkxFwa6T8a3pJ7jOrwXbJt7XTY=;
        b=Sop8FN6dK6CxzkRm+YtGJ5SIU8GCTvMBSK+QW/8ZmCwyQ71Qx0VlGTnjaBAoplBzn7
         /tPeYjx0RwbWoEZXZGJmBczDNLsKtAL0py3YxBi9yz5KSmAh9pRaw2EKCJNbkKkGLPCz
         Z/e5iIoGad0Su1hovQ/nQUbzFi1fukotQdzx2lgv/qCIoqxLNuEfqV610Lt26kxGcwqL
         7ldjC0jTx92vFJd4XU9rkuA4g3Sj9AkoiHExCye+KlxOiAvag8kurPvq5MKSE0bDnV7f
         c8CDDLO214JwHEnyubXlFt+7xvQaSLt4hqokjky01b9L1fcIzVC551gLxEfcJwr+OXvl
         BQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709551020; x=1710155820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPUD3naOzI7U6jLpCCkxFwa6T8a3pJ7jOrwXbJt7XTY=;
        b=fqdrYbU1u3yTvZ422AQc9FfSmviT6j0noYRXwz4kv83e56ZZIJi4FWOcG5cxjIQZjr
         4yIIwCA7mguWNtPZ3H2dErd4r2R5S4FWKCnuxHeqA8SvBFje2q36Zt8XMOOxootzL+CC
         1qc3/sz9dyPv5k8ISZKMnbHzU3ouqueCZGTG/vbcNASyyZe+KjwvWsdU6pqJcMn2+5uf
         l9OKSCPuYTU5GIjWW1grsDEpEmMEusQx1LMMoeWLieub9Qa4NpoaCLH6HrufNmjIzm7h
         JotKYe12fA1GjPbtQah+vVx4vcEQiENBcH/mLx5aAcd6N0heNo505TeU0ei++VLycR73
         vRhA==
X-Forwarded-Encrypted: i=1; AJvYcCWTbPeRQhHnJzHWDSoC6G5gXj6LwDVmso397iGPKiZFDijHd5hH4pRA20HO/4769MNl9UcN1Tn9BbWPo+u5m7oK0tj2wYSLiDlTQhlad18q
X-Gm-Message-State: AOJu0YwmvueHz87pV2u5DfWqGAP28VAeW8+JG/EjR7OP4YkPKdyx60Gf
	qlZwcAKyvg8SD8SlTGVcH59dZJePoeBmap3bDKP9MQ0heklijjiOc/uIgdbRjks=
X-Google-Smtp-Source: AGHT+IG6uK4fFqrEq/hLrMABlpzJKWFrWyb+lxIYdFMUfmF6a1mHNvSHt1pq4YpGXjO/LuODZzbRDQ==
X-Received: by 2002:a05:600c:3849:b0:412:e568:a123 with SMTP id s9-20020a05600c384900b00412e568a123mr1251187wmr.10.1709551020575;
        Mon, 04 Mar 2024 03:17:00 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c4f8600b0041273fc463csm17525439wmq.17.2024.03.04.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:17:00 -0800 (PST)
Date: Mon, 4 Mar 2024 14:16:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Use common error handling code in
 rcsi2_parse_dt()
Message-ID: <cc121bef-8bca-44e6-81aa-bf8e682bdaf5@moroto.mountain>
References: <8b4203dc-bc0a-4c00-8862-e2d0ed6e346b@web.de>
 <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>
 <260d82b6-e7fc-40c3-b414-50a883709fd7@moroto.mountain>
 <ZeWnD9YrXLWJYmhT@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeWnD9YrXLWJYmhT@kekkonen.localdomain>

On Mon, Mar 04, 2024 at 10:48:47AM +0000, Sakari Ailus wrote:
> Hi Dan,
> 
> On Fri, Mar 01, 2024 at 04:42:01PM +0300, Dan Carpenter wrote:
> > Sakari Ailus pointed out in another thread that we could use __free()
> > instead.  Something like this:
> > 
> 
> Looks good to me.

Thanks for checking!  I've never used these before.

> 
> We could merge this with your SoB (pending Niklas's review). :-) The driver
> has been since moved under drivers/media/platform/renesas/rcar-vin/ .

Alright.  I can resend this as a proper patch.

regards,
dan carpenter


