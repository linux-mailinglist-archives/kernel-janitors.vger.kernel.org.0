Return-Path: <kernel-janitors+bounces-205-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DDD7E7C6E
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 14:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50BC51C20AC5
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 13:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD8918E3C;
	Fri, 10 Nov 2023 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNbB2egm"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D18B134A7
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 13:15:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BE8371E8;
	Fri, 10 Nov 2023 05:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699622146; x=1731158146;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9XeZedIwQg8ZXfkQPaf33QRQVLu2yfGJUNSa/st/kWU=;
  b=MNbB2egm4dCHBRz825N0yMpxKimatmZafvjm4ZZLW+XEaLfP0Odpel2G
   sqgrP5V0196Q36uTbYADo6Qa/DSrEP7aX++FjpWBL37ruSHf0318qMe99
   LLdUx6XyGyfZk5icS6+cDF1/srkziboaLfV18q4QRx3j9QMPopcu36HV0
   NxFwINm64AHd/xZalsjk8SeTw+kDhyzBq8e5X3hNj8eafkaA35xTGxYw5
   9LfWdNqhjiOjO3aTJo6YyuxEIvzH1fsFYJaKU/UwFg4asPN2Oal37+5+S
   BIGj3OO3idcTRRBkmz5HcHym5qMC5iNp2Qf3H3pIKK+y6eGdZMfh626zz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456680773"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456680773"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 05:15:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792854238"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792854238"
Received: from joudin-mobl2.ger.corp.intel.com ([10.252.38.36])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 05:15:42 -0800
Date: Fri, 10 Nov 2023 15:15:40 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
    Mark Gross <markgross@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
    error27@gmail.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
In-Reply-To: <20231110090408.3383881-1-harshit.m.mogalapalli@oracle.com>
Message-ID: <e8f9ec8d-8920-2334-62d9-bb522f5e3a63@linux.intel.com>
References: <20231110090408.3383881-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Nov 2023, Harshit Mogalapalli wrote:

> 1. acpi_object *obj is unused in this function, so delete it, also
>    delete a unnecessary kfree(obj);
> 2. Fix a memory leak of 'attr_name_kobj' in the error handling path.
> 3. When kobject_init_and_add() fails on every subsequent error path call
>    kobject_put() to cleanup.
> 
> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202309201412.on0VXJGo-lkp@intel.com/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is only compile tested, based on static analysis.
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 5798b49ddaba..b28e52b64690 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -588,7 +588,6 @@ static void release_attributes_data(void)
>  static int hp_add_other_attributes(int attr_type)
>  {
>  	struct kobject *attr_name_kobj;
> -	union acpi_object *obj = NULL;
>  	int ret;
>  	char *attr_name;
>  
> @@ -596,8 +595,8 @@ static int hp_add_other_attributes(int attr_type)
>  
>  	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
>  	if (!attr_name_kobj) {
> -		ret = -ENOMEM;
> -		goto err_other_attr_init;
> +		mutex_unlock(&bioscfg_drv.mutex);

I don't understand why this has to be inside the mutex at all, cannot 
you just move it outside of the mutex and then there's no need to unlock?

> +		return -ENOMEM;
>  	}
>  
>  	/* Check if attribute type is supported */
> @@ -614,15 +613,15 @@ static int hp_add_other_attributes(int attr_type)
>  
>  	default:
>  		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> -		ret = -EINVAL;
> -		goto err_other_attr_init;
> +		kfree(attr_name_kobj);
> +		mutex_unlock(&bioscfg_drv.mutex);
> +		return -EINVAL;

Add a new label for unlock and goto to it instead.

>  	}
>  
>  	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
>  				   NULL, "%s", attr_name);
>  	if (ret) {
>  		pr_err("Error encountered [%d]\n", ret);
> -		kobject_put(attr_name_kobj);
>  		goto err_other_attr_init;
>  	}
>  
> @@ -647,10 +646,9 @@ static int hp_add_other_attributes(int attr_type)
>  
>  	mutex_unlock(&bioscfg_drv.mutex);
>  	return 0;
> -
>  err_other_attr_init:
> +	kobject_put(attr_name_kobj);

unlock:

>  	mutex_unlock(&bioscfg_drv.mutex);
> -	kfree(obj);
>  	return ret;
>  }
>  
> 


-- 
 i.


