Return-Path: <kernel-janitors+bounces-4781-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D193910C
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jul 2024 16:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017ED1F220A6
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jul 2024 14:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3103B1598F4;
	Mon, 22 Jul 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4VllzWq"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714316DC18;
	Mon, 22 Jul 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660041; cv=none; b=BNB004CfniFahEoig8tJTC4R2ZDauYWPUbms4dAkR3NJDHpsL+/HU/8iOB0Z7vFRq2pIPeQx1E5eH8ZZpUbmG+FaZty3MWLqDU5e2H3WzQ+9E60Dsf3JfsUmeDFjW1lQK+ZvLBk6HST2q8Gfg6dLvVRTZuoqRIYkiPmyyuz0/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660041; c=relaxed/simple;
	bh=1e0vV1UoVXTfp55GAjrIIBKq42BYmjjNqv/c6iRw9Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPeOpqylsp/AGqotSkg3qlSxu3BcFiv4+GUjjxsbMJ0zpBVeadOXDYCkMlnHtDEfUeOf35c2rEP5+vXmnCuGccb6Lol2e8vRPbkmLPMg16ndZykzb+cX3sbVZsZR3oQCn8ZUMLx+uQ/kBWXYebkan5qSpAFUUBu8Lzaruv3fzhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4VllzWq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721660039; x=1753196039;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1e0vV1UoVXTfp55GAjrIIBKq42BYmjjNqv/c6iRw9Pc=;
  b=V4VllzWq4s/6Xcz0AWBCf2XhxBIK9XnmZDqRvpDfEf9Gx+7g72fmqnqI
   RNwXhSwnl0HtU6RD8/WD30CxCDgy54S/JO7AbcTIRRwLVVHbPbaeesMgk
   8xOgA1j9Q8lvsw+RaokL1gzIVzI2Ym0kFVlytI5Z7ZCY2QOorlewDhJ8a
   zDKLZ+r1fHaSrBneWyhBhNcUR3Gnw/eksKhuz+v1ANWvFB8bRppQUQUTE
   MbEzsSvXN08yVKOHCP8TJqQVdWJ8XIPpZyWNprblo2eJXJ/k4oHfQORMI
   AijVGbZBSgLtf4ThVUazTqwealmV3gMOKbHXwKxfpn2Kj0U6AF4eFapIP
   g==;
X-CSE-ConnectionGUID: HOT2JT74TnCmgBxz4kbrlg==
X-CSE-MsgGUID: KuuN9yA5SFmZttOOoRpapA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36678542"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="36678542"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 07:53:58 -0700
X-CSE-ConnectionGUID: N8gUvA1JTg+HOj3rYIqe6w==
X-CSE-MsgGUID: yVQ10b+OQfu3aOpnlOw0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="57032016"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.125.109.188]) ([10.125.109.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 07:53:56 -0700
Message-ID: <7cb0179f-2b63-41c1-a17c-b3422feff501@intel.com>
Date: Mon, 22 Jul 2024 07:53:55 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntb: Constify struct bus_type
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 ntb@lists.linux.dev
References: <50a28f39b1f0d0201b2645d2a8239e1819dc924b.1721473166.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <50a28f39b1f0d0201b2645d2a8239e1819dc924b.1721473166.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/24 3:59 AM, Christophe JAILLET wrote:
> 'struct bus_type' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   69682	   4593	    152	  74427	  122bb	drivers/ntb/ntb_transport.o
>    5847	    448	     32	   6327	   18b7	drivers/ntb/core.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   69858	   4433	    152	  74443	  122cb	drivers/ntb/ntb_transport.o
>    6007	    288	     32	   6327	   18b7	drivers/ntb/core.o
> 
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
> Compile tested-only.
> ---
>  drivers/ntb/core.c          | 4 ++--
>  drivers/ntb/ntb_transport.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ntb/core.c b/drivers/ntb/core.c
> index d702bee78082..ed6f4adc6130 100644
> --- a/drivers/ntb/core.c
> +++ b/drivers/ntb/core.c
> @@ -72,7 +72,7 @@ MODULE_VERSION(DRIVER_VERSION);
>  MODULE_AUTHOR(DRIVER_AUTHOR);
>  MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
>  
> -static struct bus_type ntb_bus;
> +static const struct bus_type ntb_bus;
>  static void ntb_dev_release(struct device *dev);
>  
>  int __ntb_register_client(struct ntb_client *client, struct module *mod,
> @@ -298,7 +298,7 @@ static void ntb_dev_release(struct device *dev)
>  	complete(&ntb->released);
>  }
>  
> -static struct bus_type ntb_bus = {
> +static const struct bus_type ntb_bus = {
>  	.name = "ntb",
>  	.probe = ntb_probe,
>  	.remove = ntb_remove,
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index 77e55debeed6..a79f68e18d3f 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c
> @@ -314,7 +314,7 @@ static void ntb_transport_bus_remove(struct device *dev)
>  	put_device(dev);
>  }
>  
> -static struct bus_type ntb_transport_bus = {
> +static const struct bus_type ntb_transport_bus = {
>  	.name = "ntb_transport",
>  	.match = ntb_transport_bus_match,
>  	.probe = ntb_transport_bus_probe,

