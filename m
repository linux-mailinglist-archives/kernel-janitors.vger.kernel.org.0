Return-Path: <kernel-janitors+bounces-6714-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54B9F4AFB
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Dec 2024 13:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75631188B42C
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Dec 2024 12:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FC81F2C49;
	Tue, 17 Dec 2024 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qul2Xkte"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7D1E282D
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Dec 2024 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438758; cv=none; b=ocv9vwRMmDNn/5rJVGM1ofryyHXkX4/xtcGvBraqwxN5qMC2nfrqB5Qiesy5hBu7AgLqagt5hjl0bEB8rh0aKWK854A3RHvDrPO7662/3uY7Gmuzu2FbW48uDwghHrdbSoaB+pbqG2ffTT4mVdc5C6EV5ScCrm/hGhdDdUL+3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438758; c=relaxed/simple;
	bh=YbfDs8LoY5asKM7zZM/qu8gLr3JGUTt7arQC8J9od4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=px0SaBXtkv0JXKR3etqx4aF0aC+JcBvAWT+fSDrzxbvFUuQ6+vzyMsyXB0beZxnTvJSAkr+Q4kdKJTspGrFxj7r/eJHENEfGMaaVBEHp7ip0APOFf8rh1E9hSG4sVwdFjs2YLCdqYMXq17XA6VMzo5meO8TPdjlGO58k0xLzMoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qul2Xkte; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so1811753a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Dec 2024 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734438755; x=1735043555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vadTVklg9DZ5KZn/j1FjuzNmgd1jDV/1Li8ndKsd3tw=;
        b=Qul2XkteNGKGuQGn2HWKJC0pzrkQhXq4k9nAgHHAhL1CeOEoBx5Wr3FfWpsXjffc4r
         t8MqNdhX3kjOpCrCCyY8MZ8txcn3F4Bry7Ibbb6vQ5osDMq3qOigAaxpPJCn28UxiyQD
         aibyBkIntJZr9HIbTgGVWHm6pcWTGq+usDYHh8kf01Z0GXKCOaa6DFmh4vF2DvQwikbw
         N+42qhZothYnYNppq60Y5ASH8oMBKwsNazRXdyBaRzW8xk4HvtWvGqIQFBM/iOI+IpHa
         tUYkhUIgwcb2faqdMZKBjIZP04rnBQLh1qpiIglkGQReTgfbNmM3IUh2p1mHQit0qYPi
         qflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734438755; x=1735043555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vadTVklg9DZ5KZn/j1FjuzNmgd1jDV/1Li8ndKsd3tw=;
        b=iFHgOUwXHvE0AdF6qr+2qYM/x4fr4/wbBAlqOXKeObvnUwLynCP+f/EEq7O5eBFOjN
         GITi6XOuo9kuwXQcT+zt3vu7ttUWt02ZzOpozLyzwPyQz/YZhrM8ln2wXaz0OsyVhqq4
         gQiuhULW/Y1m31S276e19U+b6QDKZqLlhAReEhY4gie0qIKhXtXAecnfLTmF5QrgiF0i
         GAvADdDkDyiEV/rTrnu3jBY5bK/exawCr/P3ZnJemeHPD89AdVR4JeMHznGwEW2cJY8H
         lrWpwFowc3o29ql/b7xIY4w4J849XqvpCh59XtkVg7NXZdJD3OwmitrdGSOa8K0PisqC
         gsPg==
X-Forwarded-Encrypted: i=1; AJvYcCVNCc+dLhmLkIqW95cdCX/qL/HZV82vvN2Upn4iMy/f8nljsgjUxIvSWT4RbgmSKuLouvHYvAimjib21CxrCFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyihih1Y2BRSABR3iJo5gG/l8wRIpma4viEfjnY5R+L81cJYRfL
	Dz1vnDvJZtuUKahmiWZckdO+gtuJHBm7IXffYRZiy6MMAmmqAMUuMKtcUR+GR5o=
X-Gm-Gg: ASbGncvHO/FL+iNnAqvAzUWAizkaIo/Idm41yRcEjlUNV3wFuPvkyYd3VBE+lWmXPC2
	f4pvbU1g5yPfrk+lzZKPyB6Y73FKPxtJ6GrhAyUtZMFIGXLnXqXRGgSXAmIm4K1GLC8WxlRkq3d
	LRAEyuKeXTzuxHG2nRkKhJZ7L6zadT4XUcuJmwjWCOLUV5xHi0Uth3kOnWgAxqjqoq1pnTUfetB
	DFHCu6IchgNgR53Ed3hGrwk4ZfsRdhqUzqfzUyd6/SptQ2lvoTC7SJyVs0jzw==
X-Google-Smtp-Source: AGHT+IHQ03iEFjc/Teha21bLrHNLnNIrRs6fDpiX/v4CZTbwJmuV1NtVhgiSm8VrPkB6aW1UmvcDog==
X-Received: by 2002:a05:6402:5288:b0:5d3:e8d1:a46 with SMTP id 4fb4d7f45d1cf-5d63c3bf48dmr17438136a12.30.1734438755313;
        Tue, 17 Dec 2024 04:32:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f271a6sm4407073a12.60.2024.12.17.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:32:34 -0800 (PST)
Date: Tue, 17 Dec 2024 15:32:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] xfrm: prevent some integer overflows in verify_
 functions
Message-ID: <053456e5-56e7-478b-b73e-96b7c2098d07@stanley.mountain>
References: <92dc4619-7598-439e-8544-4b3b2cf5e597@stanley.mountain>
 <Z2FompbNt6NBEoln@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2FompbNt6NBEoln@gondor.apana.org.au>

On Tue, Dec 17, 2024 at 08:03:38PM +0800, Herbert Xu wrote:
> On Tue, Dec 17, 2024 at 11:42:31AM +0300, Dan Carpenter wrote:
> >
> > +	if (algp->alg_key_len > INT_MAX) {
> 
> Why not check for UINT_MAX - 7? INT_MAX seems a bit arbitrary.
> 

That seems like basic algebra but we have a long history of getting
integer overflow checks wrong so these days I like to just use
INT_MAX where ever I can.  I wanted to use USHRT_MAX. We aren't allowed
to use more than USHRT_MAX bytes, but maybe we're allowed USHRT_MAX
bits, so I didn't do that.

regards,
dan carpenter


