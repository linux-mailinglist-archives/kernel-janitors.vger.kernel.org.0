Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAD23282C
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Jun 2019 07:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfFCF5G (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 3 Jun 2019 01:57:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43547 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfFCF5F (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jun 2019 01:57:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id c6so9931586pfa.10
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Jun 2019 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zCVkve2M1JFNC36HFwV7VaJz6MYidoQvY09V4Dotmhs=;
        b=V8jrh86cjCL32w4Tzw0n6Miqz2LZfT2LMhtp0fxasBP5KpPCc/baTt59nbUzabGM8+
         TzqOBX7mqbuDRBjtLx++QnVVYWty947udQGmsF35jbOEYAPLrC6z1y+12hLBzJIl2My/
         0wyCGR6Uc/W9DZGa/sky6cknZx6pExyufkFgCc2A2l7/HzYX9Zg++DFjXJDEzhVcBppG
         XC6L6M9Kb9YIRryD7ybHJOt6DbM3tYXlmYI9x7RPRjFIroJKdLCJO8dl5LA5bx887B9q
         h3fXAK8yy41keON/b2FtLa+IgXvkwl0LGNyyD1Pzl1iTekC42g1VsOF5xpmb9ZDsKsBO
         WH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zCVkve2M1JFNC36HFwV7VaJz6MYidoQvY09V4Dotmhs=;
        b=tZaowaQj4nNuh7GM9Ye3P6XpRzZ/or7DaXW1sgeFfgwwFNJyron3klnmWhV0GUK038
         HmuuWEnC82qO2JZeNOxYw92GSVbG7K1Bxo8YHUSdBMj0Sjk3NUXYq7QIN/VfWLVw1rL7
         DKYt1foHCpUdCPFeBpRkCF3nyIvUxseUBAAt84Qg3zadwI1nmtxPnY6XhVn4NGW86/En
         Ff9j9afky/JOudTETYOl/yviWWLHSopDRswPayFeJt6uj9thbM34jezUpBz8tcTBaH/j
         c0+jGKFmqWU4ySUwRKOjgWyLl7VtXJI3TGm3KKgfttVGnWwM1BsT0ERCO1rWwBdmF4ka
         724A==
X-Gm-Message-State: APjAAAW6RMk4RQFyb9fB95xF2tQxhn/jgrlo4lzWenNNLv1NlqeGUyM8
        jPqNvgLXJjwCUbJ1FztdVzhOVg==
X-Google-Smtp-Source: APXvYqxpNVebNIRrfQYo00U/X6UMvFYJBMC94A84BEV3vcQFHqnhGlBex5c/vWJYgikWpd14iShJJA==
X-Received: by 2002:a65:44c8:: with SMTP id g8mr26175730pgs.443.1559541425059;
        Sun, 02 Jun 2019 22:57:05 -0700 (PDT)
Received: from localhost ([122.172.66.84])
        by smtp.gmail.com with ESMTPSA id j14sm13675062pfe.10.2019.06.02.22.57.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 22:57:04 -0700 (PDT)
Date:   Mon, 3 Jun 2019 11:27:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] cpufreq: armada-37xx: Remove set but not used
 variable 'freq'
Message-ID: <20190603055702.thhlyazwqmekdvyd@vireshk-i7>
References: <20190601074338.64187-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190601074338.64187-1-yuehaibing@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01-06-19, 07:43, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/cpufreq/armada-37xx-cpufreq.c: In function 'armada37xx_cpufreq_avs_setup':
> drivers/cpufreq/armada-37xx-cpufreq.c:260:28: warning:
>  variable 'freq' set but not used [-Wunused-but-set-variable]
> 
> It's never used since introduction in commit 1c3528232f4b ("cpufreq:
> armada-37xx: Add AVS support")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
> index 0df16eb1eb3c..aa0f06dec959 100644
> --- a/drivers/cpufreq/armada-37xx-cpufreq.c
> +++ b/drivers/cpufreq/armada-37xx-cpufreq.c
> @@ -257,7 +257,7 @@ static void __init armada37xx_cpufreq_avs_configure(struct regmap *base,
>  static void __init armada37xx_cpufreq_avs_setup(struct regmap *base,
>  						struct armada_37xx_dvfs *dvfs)
>  {
> -	unsigned int avs_val = 0, freq;
> +	unsigned int avs_val = 0;
>  	int load_level = 0;
>  
>  	if (base == NULL)
> @@ -275,8 +275,6 @@ static void __init armada37xx_cpufreq_avs_setup(struct regmap *base,
>  
>  
>  	for (load_level = 1; load_level < LOAD_LEVEL_NR; load_level++) {
> -		freq = dvfs->cpu_freq_max / dvfs->divider[load_level];
> -
>  		avs_val = dvfs->avs[load_level];
>  		regmap_update_bits(base, ARMADA_37XX_AVS_VSET(load_level-1),
>  		    ARMADA_37XX_AVS_VDD_MASK << ARMADA_37XX_AVS_HIGH_VDD_LIMIT |
> 

Applied. Thanks.

-- 
viresh
