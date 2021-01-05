Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B309E2EA85E
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Jan 2021 11:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbhAEKOW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 Jan 2021 05:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbhAEKOV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Jan 2021 05:14:21 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDCAC061574
        for <kernel-janitors@vger.kernel.org>; Tue,  5 Jan 2021 02:13:41 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2so18116834pfq.5
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Jan 2021 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZcX4Y9El5xUBmJWfRi6x8XZJYh+Q5OILJrvF0YI4Hl8=;
        b=iCg3wGjbkFaN18SMz51IyBbVwYQnG0wZgtBkavI7lNOpHquHvuRd9a2u1aZyjumDt7
         f85Pn0Ipip0IFlgDN2A9eLzFbAOr5TU3vtUBswnA+qlbceLDdT/kT9PBRFDohySS0DfB
         0refomOOVp6RXmmdMlDPECviM5IMvJs0S8WZPSUP/Fv1FhZAOqmj5ttpCxMBYmu5FGjd
         7oGzd30pI8aPkDLDS+lhLbm4tykOnxLFVn4gVcEuVcCF2NyfQvRgHH5OH0UayYXM0iHQ
         GFAYWvtcLOrLpsO2aIJ8lKEhi97VGuLkKlmwWw8EXnfwvbUCtP80iyj9TU0gxyTX037W
         igvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZcX4Y9El5xUBmJWfRi6x8XZJYh+Q5OILJrvF0YI4Hl8=;
        b=RhK0dpcNXXfKqgKE0IE//P/UJLpIVJ/GtT8e5ehLJ6fNNo62do50DIlrTO7M+OLqxB
         G8742uhVy6Jm6n4ZFj+6XQmitdZnPoDB34jZ7fThi/Otl2gCJJbk8y9Bo6MMuEov+Nhs
         uUpX/2Xg1/PSFdQ6Npg28OoLjovuKVVs1xTi6H6cOqx/gMLz9PLxKg33x548KAFjaS8L
         h9S5q5myLfS8ZYG7uUWkT3TjQk/b6nKMj/ckuWeiHRVouSCOzFBUqbK3L38nIME0JSso
         ENPPxxza8587vwLsCN0D5+ZgVUrIZUI8OoJ+qkLTaAcX4YsbJB29FVGLMndx6pR0yXzp
         tN+g==
X-Gm-Message-State: AOAM533UfkFblclo2sp/V5xCzoN2vKd6q6Tnf292C2e52VUjyGn+ylVQ
        xouvmPlXayFflmsngviEmkRd6a9fQetTMg==
X-Google-Smtp-Source: ABdhPJyiLG4M1vxlefSUAGzJ01x5r3WQKj0FeO3YE599FAMeSKhN5+mPmdrZe+Q2TfSX7C00cMMN2w==
X-Received: by 2002:a62:380a:0:b029:1a9:5aa1:6d0d with SMTP id f10-20020a62380a0000b02901a95aa16d0dmr67836574pfa.45.1609841620789;
        Tue, 05 Jan 2021 02:13:40 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id i25sm54160317pfo.137.2021.01.05.02.13.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 02:13:40 -0800 (PST)
Date:   Tue, 5 Jan 2021 15:43:37 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Stephen Warren <swarren@nvidia.com>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] cpufreq: powernow-k8: add null check to policy to
 avoid null pointer dereference
Message-ID: <20210105101337.fbet56iunnmkj6mn@vireshk-i7>
References: <20210105101103.58765-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105101103.58765-1-colin.king@canonical.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Please fix the subject as well :)

On 05-01-21, 10:11, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is an unlikely case where cpufreq_cpu_get returns a
> null policy and this will cause a null pointer dereference later on.
> Fix this by passing the policy to transition_frequency_fidvid from the
> caller and hence eliminating the need for the cpufreq_cpu_get and
> cpufreq_cpu_put.  Thanks to Viresh Kumar for suggesting the fix.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: b43a7ffbf33b ("cpufreq: Notify all policy->cpus in cpufreq_notify_transition()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: pass the policy to transition_frequency_fidvid rather than add
>     a null pointer check on the return from a cpufreq_cpu_get call.
> ---
>  drivers/cpufreq/powernow-k8.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
> index 0acc9e241cd7..b9ccb6a3dad9 100644
> --- a/drivers/cpufreq/powernow-k8.c
> +++ b/drivers/cpufreq/powernow-k8.c
> @@ -878,9 +878,9 @@ static int get_transition_latency(struct powernow_k8_data *data)
>  
>  /* Take a frequency, and issue the fid/vid transition command */
>  static int transition_frequency_fidvid(struct powernow_k8_data *data,
> -		unsigned int index)
> +		unsigned int index,
> +		struct cpufreq_policy *policy)
>  {
> -	struct cpufreq_policy *policy;
>  	u32 fid = 0;
>  	u32 vid = 0;
>  	int res;
> @@ -912,9 +912,6 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
>  	freqs.old = find_khz_freq_from_fid(data->currfid);
>  	freqs.new = find_khz_freq_from_fid(fid);
>  
> -	policy = cpufreq_cpu_get(smp_processor_id());
> -	cpufreq_cpu_put(policy);
> -
>  	cpufreq_freq_transition_begin(policy, &freqs);
>  	res = transition_fid_vid(data, fid, vid);
>  	cpufreq_freq_transition_end(policy, &freqs, res);
> @@ -969,7 +966,7 @@ static long powernowk8_target_fn(void *arg)
>  
>  	powernow_k8_acpi_pst_values(data, newstate);
>  
> -	ret = transition_frequency_fidvid(data, newstate);
> +	ret = transition_frequency_fidvid(data, newstate, pol);
>  
>  	if (ret) {
>  		pr_err("transition frequency failed\n");
> -- 
> 2.29.2

-- 
viresh
