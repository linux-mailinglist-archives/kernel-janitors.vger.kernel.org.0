Return-Path: <kernel-janitors+bounces-267-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E922F7EA352
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 20:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A279D280F10
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 19:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527C322F16;
	Mon, 13 Nov 2023 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReDkv92V"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CBE225A1
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 19:10:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEE010F4;
	Mon, 13 Nov 2023 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699902640; x=1731438640;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2Z0NSkIr383y49R7xeDheZEPikylLWOey8rRfm2PhzM=;
  b=ReDkv92VEsFYS9t9kNBUoS6mgPMLNYoTfc1HLeJlKtqmGE+wIRVosTUx
   ud1DdCfdSxub4HXoC7ENL+oSFykeCePc/NpbEGNV7NZ/HmWGnVWal3HTB
   cNkhE7RJbPXhNl9bUv7DzR/7rW8HzsV0TbuK6zhUKU5QdNhk4xnHm1cs7
   u36mgwUKICU25UBitqQySS1t8JW1oV4hFg9GEXzg2qNfjpcWglkSdBX8w
   SBPLRmsvf0Zk5OKbxfgJDHmXfwLzgS5iJVXQtcrZuyRvEsaSKWRqZzOb5
   ASBPXDSYzphka3RJbArqHzAh78SBrYVeIIKjOyzwNpCs36ThpxYpoXmVx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369833598"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="369833598"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 11:10:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799274200"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="799274200"
Received: from alexdsou-mobl3.gar.corp.intel.com ([10.249.44.83])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 11:10:36 -0800
Date: Mon, 13 Nov 2023 21:10:28 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
    Mark Gross <markgross@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
    error27@gmail.com, vegard.nossum@oracle.com, darren.kenny@oracle.com
Subject: Re: [PATCH v3 1/4] platform/x86: hp-bioscfg: Simplify return check
 in hp_add_other_attributes()
In-Reply-To: <20231113185852.3579970-1-harshit.m.mogalapalli@oracle.com>
Message-ID: <12b1cd0-31b3-8981-ea35-666d59c07b45@linux.intel.com>
References: <20231113185852.3579970-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2031354540-1699902639=:1867"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2031354540-1699902639=:1867
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 13 Nov 2023, Harshit Mogalapalli wrote:

> All cases in switch-case have a same goto on error, move the return
> check out of the switch. This is a cleanup.
> 
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 5798b49ddaba..10676e1abc28 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -575,81 +575,79 @@ static void release_attributes_data(void)
>  /**
>   * hp_add_other_attributes() - Initialize HP custom attributes not
>   * reported by BIOS and required to support Secure Platform and Sure
>   * Start.
>   *
>   * @attr_type: Custom HP attribute not reported by BIOS
>   *
>   * Initialize all 2 types of attributes: Platform and Sure Start
>   * object.  Populates each attribute types respective properties
>   * under sysfs files.
>   *
>   * Returns zero(0) if successful. Otherwise, a negative value.
>   */
>  static int hp_add_other_attributes(int attr_type)
>  {
>  	struct kobject *attr_name_kobj;
>  	union acpi_object *obj = NULL;
>  	int ret;
>  	char *attr_name;
>  
>  	mutex_lock(&bioscfg_drv.mutex);
>  
>  	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
>  	if (!attr_name_kobj) {
>  		ret = -ENOMEM;
>  		goto err_other_attr_init;
>  	}
>  
>  	/* Check if attribute type is supported */
>  	switch (attr_type) {
>  	case HPWMI_SECURE_PLATFORM_TYPE:
>  		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
>  		attr_name = SPM_STR;
>  		break;
>  
>  	case HPWMI_SURE_START_TYPE:
>  		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
>  		attr_name = SURE_START_STR;
>  		break;
>  
>  	default:
>  		pr_err("Error: Unknown attr_type: %d\n", attr_type);
>  		ret = -EINVAL;
>  		goto err_other_attr_init;
>  	}
>  
>  	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
>  				   NULL, "%s", attr_name);
>  	if (ret) {
>  		pr_err("Error encountered [%d]\n", ret);
>  		kobject_put(attr_name_kobj);
>  		goto err_other_attr_init;
>  	}
>  
>  	/* Populate attribute data */
>  	switch (attr_type) {
>  	case HPWMI_SECURE_PLATFORM_TYPE:
>  		ret = hp_populate_secure_platform_data(attr_name_kobj);
> -		if (ret)
> -			goto err_other_attr_init;
>  		break;
>  
>  	case HPWMI_SURE_START_TYPE:
>  		ret = hp_populate_sure_start_data(attr_name_kobj);
> -		if (ret)
> -			goto err_other_attr_init;
>  		break;
>  
>  	default:
>  		ret = -EINVAL;
> -		goto err_other_attr_init;
>  	}
>  
> +	if (ret)
> +		goto err_other_attr_init;
> +
>  	mutex_unlock(&bioscfg_drv.mutex);
>  	return 0;

Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-2031354540-1699902639=:1867--

