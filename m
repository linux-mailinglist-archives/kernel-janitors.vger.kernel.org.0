Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3BF4D1B92
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Mar 2022 16:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245669AbiCHPWX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Mar 2022 10:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbiCHPWW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 10:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1623C4DF4E
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646752885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mbYT+mQV69L07Y5e1RX6+MZSdhQ1u9n+Wejp5VgtP+Q=;
        b=O7HcRmE5mzGXf+ZJqsJXXi7fBV1X4FWfaTBCe5ktJxJybjCXnenqw0xAQO0ZkUy5kEpwXl
        cDoBEriI3Cri+cVV4SvIrFDPf/8VFxKKNeBI1GXJ6KuIHP0OlMS1V4f218Wj6H8ZvBLmSv
        Roju/qDm08U+7up/8nXRpXa6MsSU0cE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-mLFP83pENYGVUUMkqG64Aw-1; Tue, 08 Mar 2022 10:21:24 -0500
X-MC-Unique: mLFP83pENYGVUUMkqG64Aw-1
Received: by mail-ed1-f69.google.com with SMTP id i5-20020a056402054500b00415ce7443f4so9862979edx.12
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 07:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mbYT+mQV69L07Y5e1RX6+MZSdhQ1u9n+Wejp5VgtP+Q=;
        b=aqDci9tnR8NKD1KcROXuh1M5FDEr50rGSG+lGjKkeaPSiQUbWpJH2Lqxj9B4Y89Z/G
         TuTxARtwz0ufVvBa8kwfDEBTsqKNhuSMmUGJwP7mBrHTepuCKLonS9IeT3C+xTtbn8DE
         ZbdlUcwb8kAYvHnzfSr6d5W6IGwZMKrZbrrsWE7oGPl312S/Eof6qTS8q1FwReegFOod
         C79Labbpa9ICwAp64pqqMmlEW8q8OFn3Obk7my2qiJDUv4DpAEWFRs8pQImXXmYCJ6Xn
         u+oS/MlxKS8cWkUaUYLt8rdybIdgYZTVWe86EhsrQOihA2ZgZLRvJWXvK7Xx7F66uzh1
         Q9sA==
X-Gm-Message-State: AOAM5308VVWj/VufAHQkd2E7IVAxaswMmzw4dXNtOmFEXH8XguYM7ozx
        ANIEuEaObEHsSZHclEbVF7b8d5BDRf6y04Ha3RVwHFa+9ufjbV6ijvGxIYg5nUKMkYVo8cdhtM/
        ufnQl8OfMsbDRktMXCkAjI3PkmGvE
X-Received: by 2002:a17:906:3ec9:b0:6bb:2eb9:84f with SMTP id d9-20020a1709063ec900b006bb2eb9084fmr13617239ejj.86.1646752882782;
        Tue, 08 Mar 2022 07:21:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3rNiVTf6eT4CF+lg7atnitRG6bFQKjVQT2DbYgx4ZO5cBZAdGR8gw+h+vCo7CBzIw8Mtvrw==
X-Received: by 2002:a17:906:3ec9:b0:6bb:2eb9:84f with SMTP id d9-20020a1709063ec900b006bb2eb9084fmr13617216ejj.86.1646752882534;
        Tue, 08 Mar 2022 07:21:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm6027458ejc.81.2022.03.08.07.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 07:21:21 -0800 (PST)
Message-ID: <7f6d3091-d305-9aa1-f0cb-93c6d0a1850b@redhat.com>
Date:   Tue, 8 Mar 2022 16:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix
 uncore_freq_common_init() error codes
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220304131925.GG28739@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220304131925.GG28739@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 3/4/22 14:19, Dan Carpenter wrote:
> Currently the uncore_freq_common_init() return one on success and
> zero on failure.  There is only one caller and it has a "forgot to set
> the error code" bug.  Change uncore_freq_common_init() to return
> negative error codes which makes the code simpler and avoids this kind
> of bug in the future.
> 
> Fixes: dbce412a7733 ("platform/x86/intel-uncore-freq: Split common and enumeration part")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  .../x86/intel/uncore-frequency/uncore-frequency-common.c        | 2 +-
>  drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index e4d5a7960234..84eabd6156bb 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -231,7 +231,7 @@ int uncore_freq_common_init(int (*read_control_freq)(struct uncore_data *data, u
>  		++uncore_instance_count;
>  	mutex_unlock(&uncore_lock);
>  
> -	return (!!uncore_root_kobj);
> +	return uncore_root_kobj ? 0 : -ENOMEM;
>  }
>  EXPORT_SYMBOL_NS_GPL(uncore_freq_common_init, INTEL_UNCORE_FREQUENCY);
>  
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> index 791af0e287e4..c61f804dd44e 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -225,7 +225,7 @@ static int __init intel_uncore_init(void)
>  
>  	ret = uncore_freq_common_init(uncore_read_control_freq, uncore_write_control_freq,
>  				      uncore_read_freq);
> -	if (!ret)
> +	if (ret)
>  		goto err_free;
>  
>  	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,

