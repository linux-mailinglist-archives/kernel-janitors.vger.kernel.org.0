Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6CA617FB2
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Nov 2022 15:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiKCOiV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Nov 2022 10:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiKCOiL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Nov 2022 10:38:11 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3536817E3A
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Nov 2022 07:38:10 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o7so1835422pjj.1
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Nov 2022 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jW54++uxyK7o2UooQPLlMKo+gL8kv6ho/UXj8hUPhI=;
        b=zENNyTmOQJnACganlVlNM6ScQjFQKKpReAFnE/oqWsb8Gj6Fyg4+68z47Dz8WLB9Ha
         79niGL33xijYPthgcEtDeVKv4FJmTtEt9GMq8ey89Obt6DR6/gVyFrvd5RLKG1xyoRUa
         21oJJ3wZyx+yrCc8oZO6leD8hVMCwhypAPY9PN1xNNzRN/cnONML/yfg4mXO/EjCBOvs
         Nxze/d6ZdQ4OExxQTPNq5h691M4ZUcoa+tOBsXG+VRgof7s38jVAnHnfcr7lAaButfZ5
         ULpsqZu3/wUSWmqN2IftVZH/pUBCpfbUshel9RDjKyjXiAMzPkM3l3rvdkrQZ7hx0VKV
         Vy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jW54++uxyK7o2UooQPLlMKo+gL8kv6ho/UXj8hUPhI=;
        b=PHTtfFmEMNl+ADH6gd19mQ5xHJLUeREuUsBhAPPBir4uKD0umD/OyNOONqj0OAUo1R
         wROy2+LYzM1C5Ipjo95vHzysvfaAWzK/0shJ/VW3wX2GkEjM9aRiwKGpio2bHnTR+WCq
         KWo+5EUefYlKG05KLWrlG4fV22szspCCXlStVKVjT+Yk0uBPwPmUhLrKX32jcjZ2+4fQ
         pKiDlgzEs6E9bM8rFywSW/NrABpFv1uqdT+9lyOI7aQx4NJkPIVeLyNRTdmHLNuF1vfU
         x/dt7dtLB0FACcOip0NYcFu32SY9sRPPLpy8p6fO+NNq1icqoZxK9MBU3UT86yppzhHT
         yS/Q==
X-Gm-Message-State: ACrzQf00uRmL8cNPYiLRVzKtYhMVeSPxhjPfox+9qoO1d3fZadfvHRzH
        Cyq1yh2tNRAbPv/ARGLSZ8fsKw==
X-Google-Smtp-Source: AMsMyM4wMzAK86+nYOWWWsv4WqWfzyQ2ZaZKkuC45UErEcaEryqAvX3PAA72zoWjbq1McC8sReqDMg==
X-Received: by 2002:a17:902:f552:b0:186:cdb2:b864 with SMTP id h18-20020a170902f55200b00186cdb2b864mr30199874plf.24.1667486289741;
        Thu, 03 Nov 2022 07:38:09 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id w4-20020aa79544000000b0056c360af4e3sm864938pfq.9.2022.11.03.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:38:09 -0700 (PDT)
Date:   Thu, 3 Nov 2022 20:08:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: SPEAr: Make read-only array sys_clk_src static
Message-ID: <20221103143807.tamhepos3cureoga@vireshk-i7>
References: <20221103143654.85275-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103143654.85275-1-colin.i.king@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 03-11-22, 14:36, Colin Ian King wrote:
> Don't populate the read-only array sys_clk_src on the stack but instead
> make it static and add in a missing const. Also makes the object code a
> little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/cpufreq/spear-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
> index 7d0d62a06bf3..c6fdf019dbde 100644
> --- a/drivers/cpufreq/spear-cpufreq.c
> +++ b/drivers/cpufreq/spear-cpufreq.c
> @@ -39,7 +39,7 @@ static struct clk *spear1340_cpu_get_possible_parent(unsigned long newfreq)
>  	 * In SPEAr1340, cpu clk's parent sys clk can take input from
>  	 * following sources
>  	 */
> -	const char *sys_clk_src[] = {
> +	static const char * const sys_clk_src[] = {
>  		"sys_syn_clk",
>  		"pll1_clk",
>  		"pll2_clk",

Same questions from longhaul patch apply here too.

-- 
viresh
