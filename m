Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD96359389
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Apr 2021 06:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhDIEEP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Apr 2021 00:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhDIEEM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 00:04:12 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975ADC061761
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Apr 2021 21:03:18 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so4311463pjb.2
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Apr 2021 21:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cZXp8zwbYNX+TsSnBOr40WCKeTdkFOXpBllvVSAkAdw=;
        b=C0VxXZ+xWqLIs9FayXTKWSuqdZTJyi7DtaTYAsEbIeAoecHQ/+laxKaSMUCTWRxaMR
         ehbF1rU5ZPcybd1VqaChGNXGLmKbvANiHNniBos9u6zpdYy0MV33KUFzxSQ9nujMEImj
         RYV+eqVXnt05M6rthifE91dfxc0k7SOBPoG0b9ueNCxDlmP4V3A7ID9rG/C7xQvsiOat
         /dbKPsizpAF/6DC++2rAXKpacdT2gNmcgOHCzJXw4mMmgveJmxdtHg/f1p/TC9kNBiuR
         TGObshL67iLewdTaKeg8EieWN/c2zSu4DXvRxhESL3pGYrgANViBIIiUlzXTvznk5xtU
         yIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cZXp8zwbYNX+TsSnBOr40WCKeTdkFOXpBllvVSAkAdw=;
        b=pSgbRyveLAfEhgVKQ4iDOGOaso/mScB14uNXUUitnWiPccE/f2Syxe22eGfYdyRstv
         cISTehuw7HCpFvmAOIEF0IJIQC6Sb9+B4J4/qheDfV0cxxz/JoZsumGmYefiH7FYEC9h
         NQIZuvZAF0FFlJjIEwtCKyipLtpgBr4p+rUyIk7nkItDEs2rKSfGOR3dbl5gmFnaWq/p
         ld82Go6isfVcdB9XLwRyPN8ALtd9hsUhzn7MuDjueuVMLwUDXMNPmKrWSh6OkTIwaMLh
         5i5dyTIbreBFIpYo2lv044pLkqV2mIDkXr10VzQsvi3blOeN8iTEMwSJ35IE5p3Bv7Vn
         W5TA==
X-Gm-Message-State: AOAM532p+80AeOBYO3MaVFg53otJdSTc3WHu/hFlhNU6kVrxbY0YxzJq
        1f6VYzl30gA9LBLM2pwAnqurKw==
X-Google-Smtp-Source: ABdhPJwSoqHUBHuicfDO98U9yIo7SwHnzTmDYWNgkwE/S40rJFWUgVoKn4+65QBmO8AYrIVds+qhcg==
X-Received: by 2002:a17:902:bc48:b029:e9:aebd:b509 with SMTP id t8-20020a170902bc48b02900e9aebdb509mr1440056plz.0.1617940998086;
        Thu, 08 Apr 2021 21:03:18 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id s6sm638704pfw.96.2021.04.08.21.03.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 21:03:17 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:33:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Chen Lifu <chenlifu@huawei.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ARM: spear: Fix build error with
 CONFIG_ARCH_SPEAR3XX
Message-ID: <20210409040315.vc55eogaxs4zu4xb@vireshk-i7>
References: <20210409015515.258653-1-chenlifu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409015515.258653-1-chenlifu@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09-04-21, 09:55, Chen Lifu wrote:
> commit 77f983a9df42 ("spi: pl022: Use GPIOs looked up by the core")
> deleted 'struct pl022_ssp_controller' member 'num_chipselect'.
> We get build error when CONFIG_ARCH_SPEAR3XX is set:
> arch/arm/mach-spear/spear3xx.c:42:3: error: 'struct pl022_ssp_controller' has no member named 'num_chipselect'
>    42 |  .num_chipselect = 2,
>       |   ^~~~~~~~~~~~~~
> arch/arm/mach-spear/spear3xx.c:42:20: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    42 |  .num_chipselect = 2,
>       |                    ^
> 
> Fix the issue by deleting the initialization of 'num_chipselect'
> in spear3xx.c.
> 
> Fixes: 77f983a9df42 ("spi: pl022: Use GPIOs looked up by the core")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>  arch/arm/mach-spear/spear3xx.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/arch/arm/mach-spear/spear3xx.c b/arch/arm/mach-spear/spear3xx.c
> index 8537fcffe5a8..f83321d5e353 100644
> --- a/arch/arm/mach-spear/spear3xx.c
> +++ b/arch/arm/mach-spear/spear3xx.c
> @@ -30,16 +30,6 @@ struct pl022_ssp_controller pl022_plat_data = {
>  	.dma_filter = pl08x_filter_id,
>  	.dma_tx_param = "ssp0_tx",
>  	.dma_rx_param = "ssp0_rx",
> -	/*
> -	 * This is number of spi devices that can be connected to spi. There are
> -	 * two type of chipselects on which slave devices can work. One is chip
> -	 * select provided by spi masters other is controlled through external
> -	 * gpio's. We can't use chipselect provided from spi master (because as
> -	 * soon as FIFO becomes empty, CS is disabled and transfer ends). So
> -	 * this number now depends on number of gpios available for spi. each
> -	 * slave on each master requires a separate gpio pin.
> -	 */
> -	.num_chipselect = 2,
>  };

A patch is already applied by Mark to fix this issue.

-- 
viresh
