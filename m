Return-Path: <kernel-janitors+bounces-4416-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8322591D9FD
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jul 2024 10:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45014B22179
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jul 2024 08:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB8A824AF;
	Mon,  1 Jul 2024 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5QgfmyB"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F02C6BB
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jul 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719822807; cv=none; b=sZ9aLaK09DAaqETjVWeFsyn+BgVDEZiyYCQG7wS58PVPgTtM6G5VDWf/W73asH3UYBJVIfJJ4/TFH1ceQ0OyaaDjtQXF/CiE4c4Nhmob1JZ+YR1Lw52C+haQNJbCHSRhvEqdc21MPlMdjGQUA1GmmGmGpjfNLOqCooFztNBg2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719822807; c=relaxed/simple;
	bh=hQ3wIo8jfp+1QpIFa1TH6fMJr5lMyi6hFqlV4E+krQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvyH1DjS6uVjGZ0tbiFd1zrVI4SqvLXU8m8REVRt08oOtlXczUw2Y2P1uSA8fwmQQES7P/yPd4ROqSg81aGkvCkmlMuwEX/3p5Db4bU6eNthd3GDsJF2h4zT0ePV0VCMRdZRhog2+YDU77M+Bb1rFwswmVXbPegW1gd0pL+bhFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5QgfmyB; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d5611cdc52so1364091b6e.0
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jul 2024 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719822805; x=1720427605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plmjyndby8wCrQ0dzhsOGEIbNYKVIMLD81+XwlR3F9w=;
        b=J5QgfmyBoeorJkdPqoFp/l1yjZR+g9jGrNHMV60lcxA7aP4+p+/wSXJPZJnIjmjgrR
         feW1hPvaTGbIbuOzyDJO9G1VYh1dfdkqponINWu4NfKvkf3NRjZH3hCuZStGx7UOBQz/
         oVtcBEHpsYO2zWTIlp7qXKsomqbl/M/ZwnqF6ntFBmqy5uvqKJmX29IDFbqt60ckBJUn
         OFTBKlUsT079gl7t8AM/EeeXQ7BFrOcJ48JY3CdNB+Q0CcP9yUtZe4UyrSkPJB3Dkq/Z
         cf4faQNQMPn+RZz3Um9kbHS8aoP8QExhIB4ubNCfnmshpN4s6x4Ylwlw/lAW4/GjUQOh
         tJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822805; x=1720427605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plmjyndby8wCrQ0dzhsOGEIbNYKVIMLD81+XwlR3F9w=;
        b=LfqRIkHfW1QOD1iZP8UdtM7hi/xgB9fjaETyEjhbyyPfMtUGzl71/nFXUy0BKUfEoN
         /+qDztEgT/V4a1mNhsZtoYAsK7TZ+TIJHPhCNOb+GxDs+uxuOaa1dNqe7qBJWr8Hmqt9
         U7uiEI0DtIgPiUFeEL/zqH7gqrA1zVCex0eNHfeguJA8fX1HyMtcGV0mXH8tY7fzr7+D
         DexLcjeHwXpmJFN5vsrM1yjpGmSmnYhE/m+NdabJDPO0aBb6bYME8TAJd3Xu/YNkoRFA
         IcwOpBX1zRGKZ/2OQskXgy53wWfzhcr3zzGB2bLMopjFjA3pmI6jteZ8FFxdtrd7W/l/
         V5TA==
X-Forwarded-Encrypted: i=1; AJvYcCVG3FRXwmK/s5Aak95idsfE5/+Bt2rh9iYPXDKOu/aWPFh2HWGZY7Qos0lItPiHBEtvJ6EsdZ9UC1MUCGO8h13FkvMtJAcjDAznbocTgY8e
X-Gm-Message-State: AOJu0YyygZuNIHJZxECkhz08Gr0l7Sm2Y593iw1q5vJhbi9dQma4CMG3
	FpGJ5EBu0/E6am3sC0VWnlh6yGvnJldh2lekkhr160je+tya58O2iaknyBZnd/o=
X-Google-Smtp-Source: AGHT+IE1oWZE1bOQ7gPCQ6D2Kkco7qOvhQLh2xnubHsY9YThCuK7aoKubwEBd7IojI4Hbf8ohqHZIQ==
X-Received: by 2002:a05:6808:14ca:b0:3d6:31eb:69b1 with SMTP id 5614622812f47-3d6b54975afmr7594905b6e.58.1719822803407;
        Mon, 01 Jul 2024 01:33:23 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf63esm5885051b3a.123.2024.07.01.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 01:33:22 -0700 (PDT)
Date: Mon, 1 Jul 2024 14:03:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240701083320.c3r4aussa4qojewq@vireshk-i7>
References: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>

On 14-06-24, 23:08, Jeff Johnson wrote:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes three additional files which, although they did not
> produce a warning with the powerpc allmodconfig configuration, may
> cause this warning with specific options enabled in the kernel
> configuration.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

