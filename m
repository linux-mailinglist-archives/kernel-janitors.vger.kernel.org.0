Return-Path: <kernel-janitors+bounces-6961-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB8A22978
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Jan 2025 09:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76A197A1F81
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Jan 2025 08:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9AA1AF0CD;
	Thu, 30 Jan 2025 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3zFRLgg"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D719DF8D
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Jan 2025 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225011; cv=none; b=rYqA3UZPjODuZ1Y2LvlCeuIGgCVocSIQMhGxhRQ2QpBZOgZ6s3MoiQkL3+ZYGfSO3JdCDdFqsaiAnqgjqRyXpZW+nW0KN4fn0zcwfEVxKGdl+xHtftBXkePIyBCOT3jP99PfyKE+IqfZze7/ToyXKJTai31oufOISk5majS1Jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225011; c=relaxed/simple;
	bh=thFpIKSrzc48zBWfFcfPLiqFrhjEdaU6F0FW+zf4rsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nch1UwUs8vBodoD3vFFvnYVSh/lChs5sp+YrzE0XgdU8iFaFX4YZHy2gCAaKxseXexAZEAkw6rvHigi4xVAY3fqtyw3JFT84BHmODkYgOHa3lnidRGqjNZNlt9oLQTYppYyDdl1u46ULndxiFxwFBpka8zUHkgHG7A6OslUMhRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3zFRLgg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso2898975e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Jan 2025 00:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738225007; x=1738829807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbemEf+xhUc2mT3lWThkeJWiexh/Of8vPXBaz6+0qAg=;
        b=g3zFRLggPFw0YtjBkN6YnEFRlZMZW9LTQXOBwWWYMPG0QndvItFdHI8KWn5lFbs+Fg
         mNGM8mryHwjJFpsBw8gluchHkA5fqxMlaYGBojfjn3MbH7KX3DNRSKrnOmIuj8HrrpSy
         Rw4hFUZjbTp+8unK9frVIWeWY60yGLOhxL1heS3pt6edPBh9ge/EXqIq+bX3T7SoZjIH
         j3HiatdDWSBG24X59yvSKGI58SKls9nukbw9oL02TfJ/Tsw2WYzoCO2SAzBDM+xLqHxQ
         7knVL4nsCO2RMAN1ifT0SGVLfUG7ln+VLGpxMvcV49U2TaTqawi79z2nRUtmk8x3qA6U
         iiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225007; x=1738829807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbemEf+xhUc2mT3lWThkeJWiexh/Of8vPXBaz6+0qAg=;
        b=FgPrgT3apyPcTE2EfXnhezFWIe1D8WqFv5YD6s34qcoEjV9lqSmE7hImoLsES629gy
         5fSaQzHleCS4xK1f1kzcCNL+g3OfMEg+wv+kMewrcIErjhrpC9JyYIA2s5E5rXPDYPn9
         E6N3csdWSo3Orm9DdKoi9gURkRuutIHX5DS2WGjHQL4NDhyeLHGnffKgROWPJ+b9IOKJ
         7M+klzUEEe/bo1dfIt9zNH4UiBY4cBwOsONczH9htgXqZfQn73v7UFbyA4WlEQ+pZnEC
         HpAjz+4+S8yiOmMcaS7kQXc0/eetQy/BRGst9PvuPdeaWkkc04S1/hEOJQWHvYImzdeO
         uyXw==
X-Forwarded-Encrypted: i=1; AJvYcCVz/5U30NdXOfIKoAalhavpms+ec56/aSLMhtnp5rIHW2rp7PAuvIhuxow7wGD+6Qb7TM4Gjeidmk4lUR4qcls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwcrYo5WzrGzmfISLmOjW8artevs6Kjdj8kV8Ohyk6grIUZLg
	r+cCm2rBdmdsAh+Nrs5uJKJiwEX1GVkpcbPjJamUo6ciE0XhL+hDImEZuOcxFgE=
X-Gm-Gg: ASbGncuypEC5JmgdeIbwbS886j8aO28vjArFMdVS9aD47LIVIxKI8HRhyMEGSsPOoLU
	eSLo4SnF2NAA4jBkX/vSxyu6mqUm3pkTbpiaNokulMtEThbfrh1W+n0dGjBAtQFTEq/xL6WBXCX
	QGUNtyN3mcpkGnZTOtbVS0X3Dz1kM0GITeqafwm4cw33eHYsAL3ZmFf4cdw1rtnmvZ8g9nbRghc
	QJbbwkDOeT9ZRXkgzYhh8zEqPM2bDsqZxz3yLYnUST0EwlZ+o4aMLd82EeyBMd3520pZPS2FUPI
	hBgUgQ5rNO16+HFDPmt7
X-Google-Smtp-Source: AGHT+IHhtr9w91Nho4TPvuAAvm8MqwAGRZsNV86QLdJ6VOdB7b7cJnCAZnjkLka/hqqB6XtKlVfCAg==
X-Received: by 2002:a05:600c:870a:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-438dc3cbadcmr53604745e9.17.1738225007382;
        Thu, 30 Jan 2025 00:16:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df1esm50323705e9.27.2025.01.30.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 00:16:46 -0800 (PST)
Date: Thu, 30 Jan 2025 11:16:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	oe-kbuild-all@lists.linux.dev,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net] xfrm: fix integer overflow in
 xfrm_replay_state_esn_len()
Message-ID: <f86c7660-0910-4ca2-9ff9-d2d142a968c7@stanley.mountain>
References: <018ecf13-e371-4b39-8946-c7510baf916b@stanley.mountain>
 <202501230035.cFbLTHtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501230035.cFbLTHtZ-lkp@intel.com>

I've added linux-hardening to the CC.

This is a fortify false positive.  I can't reproduce it on x86 with
gcc-14.  Perhaps it only affect mips?  It's a W=1 warning so it shouldn't
be a blocker in that sense.

regards,
dan carpenter

On Thu, Jan 23, 2025 at 12:53:14AM +0800, kernel test robot wrote:
> Hi Dan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/xfrm-fix-integer-overflow-in-xfrm_replay_state_esn_len/20250121-191827
> base:   net/main
> patch link:    https://lore.kernel.org/r/018ecf13-e371-4b39-8946-c7510baf916b%40stanley.mountain
> patch subject: [PATCH net] xfrm: fix integer overflow in xfrm_replay_state_esn_len()
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501230035.cFbLTHtZ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:389,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/mips/include/asm/processor.h:15,
>                     from arch/mips/include/asm/thread_info.h:16,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/mips/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/net/xfrm.h:7,
>                     from net/xfrm/xfrm_replay.c:10:
>    In function 'memcmp',
>        inlined from 'xfrm_replay_notify_bmp' at net/xfrm/xfrm_replay.c:336:7:
> >> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
>      120 | #define __underlying_memcmp     __builtin_memcmp
>          |                                 ^
>    include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
>      727 |         return __underlying_memcmp(p, q, size);
>          |                ^~~~~~~~~~~~~~~~~~~
>    net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_bmp':
>    net/xfrm/xfrm_replay.c:308:53: note: source object allocated here
>      308 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
>          |                                                    ~^~~~~~~~~~~~
>    In function 'memcmp',
>        inlined from 'xfrm_replay_notify_esn' at net/xfrm/xfrm_replay.c:402:7:
> >> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
>      120 | #define __underlying_memcmp     __builtin_memcmp
>          |                                 ^
>    include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
>      727 |         return __underlying_memcmp(p, q, size);
>          |                ^~~~~~~~~~~~~~~~~~~
>    net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_esn':
>    net/xfrm/xfrm_replay.c:360:53: note: source object allocated here
>      360 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
>          |                                                    ~^~~~~~~~~~~~
> 
> 
> vim +/__builtin_memcmp +120 include/linux/fortify-string.h
> 
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  118  
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  119  #define __underlying_memchr	__builtin_memchr
> 78a498c3a227f2 Alexander Potapenko 2022-10-24 @120  #define __underlying_memcmp	__builtin_memcmp
> a28a6e860c6cf2 Francis Laniel      2021-02-25  121  #define __underlying_strcat	__builtin_strcat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  122  #define __underlying_strcpy	__builtin_strcpy
> a28a6e860c6cf2 Francis Laniel      2021-02-25  123  #define __underlying_strlen	__builtin_strlen
> a28a6e860c6cf2 Francis Laniel      2021-02-25  124  #define __underlying_strncat	__builtin_strncat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  125  #define __underlying_strncpy	__builtin_strncpy
> 2e577732e8d28b Andrey Konovalov    2024-05-17  126  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

