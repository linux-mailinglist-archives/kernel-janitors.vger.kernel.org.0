Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8817E2D6B8A
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 00:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgLJXGC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Dec 2020 18:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391536AbgLJWcK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Dec 2020 17:32:10 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9DCC061793
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Dec 2020 14:31:54 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id 15so7600317oix.8
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Dec 2020 14:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+ZVJHFSrcvg/rM3/coktBI0ATZzEEYOYnQ3lqpo3zPA=;
        b=hqUoJ4fB1Go3B36ZXoSqCONvRMX3UglfC0KFpIREBDUqSWlcaJ1Fm51MG+zW7WCsaB
         t5XbdNuLFtPEIXQT0X0ZxGOtWF6Nef85e39e5KDbKVh6mzlonrCXEkMLk25rYa/hQsKv
         L1h8KGq/nzTDSQpUfRZyKWFuOU+G5Xukb3vBB3x5KBw3oLNh1hV6eDrJXgvUPMZ4y3TV
         F5ry2bcvkM767TUXw9gdlLo9jmrX/Orp6n1CD+DL+YBtVb74nA2j8b/p/zZcZsSpxaxN
         l9ZCYWlZArdz5YXxdg9flTbNqQ7E8IkaM6BMFSxcOjMimBwn5fA+DF0RQjPmAFhrMkST
         EG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+ZVJHFSrcvg/rM3/coktBI0ATZzEEYOYnQ3lqpo3zPA=;
        b=Y+8+BsYLyvW8KmDmy9BWTlUciJnC1ehkljmn6uZIeBHTjW8XRmLjOwmLKoR1WpDc8M
         BIQQlrO3lUvYLFBC2IDbRpityQm0skcKmW+z7WfQWDz/UkWJQ5Blstc4sfwt0Be44/4f
         xiybVdRSzT4KmMmxyeJGqiY0nraRDC5HZ8gx0f30TrH7kllaeO0yNCjbVMxYOMngOIqI
         mehTs2pcY2c0Rg3PPCiU5/Lz2/eoB8MPRrAMytjXBeOcHdMmY9/nSoWtKMJo6l7LIoUr
         XAmFhYfS3pzPMMtiWTeUgkYpT8xmyYoCVnHJu0rq15roGtsZyZz0QUi3dlxc1iyGWQdx
         /phw==
X-Gm-Message-State: AOAM530uhJxVoembQkIcUbwd80hAd4QMDgFeq+yWDpPXvFLHVT2yQyjw
        0VYoJrQhFRbyztLlRwDEqwXdxZ9yH2k7U5qp
X-Google-Smtp-Source: ABdhPJwexAnTD2OyB+f9YLdh4DYY/daLokkk5nfPNf9Bp86JdqDn2v42AAaZLxb9w+rOMqo4p6o35Q==
X-Received: by 2002:a17:90a:d194:: with SMTP id fu20mr6126132pjb.111.1607637343315;
        Thu, 10 Dec 2020 13:55:43 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 77sm6915281pfx.156.2020.12.10.13.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:55:42 -0800 (PST)
Date:   Thu, 10 Dec 2020 14:55:40 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Leo Yan <leo.yan@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coresight: cti: =?utf-8?Q?Redu?=
 =?utf-8?Q?ce_scope_for_the_variable_=E2=80=9Ccs=5Ffwnode?= =?utf-8?B?4oCd?=
 in cti_plat_create_connection()
Message-ID: <20201210215540.GA1860012@xps15>
References: <c1b09b27-9012-324f-28d0-ba820dc468a5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1b09b27-9012-324f-28d0-ba820dc468a5@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 09, 2020 at 09:42:20PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Dec 2020 21:34:48 +0100
> 
> A local variable was used only within an else branch.
> Thus move the definition for the variable “cs_fwnode” into
> the corresponding code block.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hwtracing/coresight/coresight-cti-platform.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 98f830c6ed50..ccef04f27f12 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -343,7 +343,6 @@ static int cti_plat_create_connection(struct device *dev,
>  {
>  	struct cti_trig_con *tc = NULL;
>  	int cpuid = -1, err = 0;
> -	struct fwnode_handle *cs_fwnode = NULL;
>  	struct coresight_device *csdev = NULL;
>  	const char *assoc_name = "unknown";
>  	char cpu_name_str[16];
> @@ -397,8 +396,9 @@ static int cti_plat_create_connection(struct device *dev,
>  		assoc_name = cpu_name_str;
>  	} else {
>  		/* associated device ? */
> -		cs_fwnode = fwnode_find_reference(fwnode,
> -						  CTI_DT_CSDEV_ASSOC, 0);
> +		struct fwnode_handle *cs_fwnode = fwnode_find_reference(fwnode,
> +									CTI_DT_CSDEV_ASSOC,
> +									0);

I have applied your patch.

Thanks,
Mathieu

>  		if (!IS_ERR(cs_fwnode)) {
>  			assoc_name = cti_plat_get_csdev_or_node_name(cs_fwnode,
>  								     &csdev);
> --
> 2.29.2
> 
