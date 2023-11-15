Return-Path: <kernel-janitors+bounces-258-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBAD7E9E60
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 15:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BBBDB20A18
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63D8210F5;
	Mon, 13 Nov 2023 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaPAEa+S"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112920B0C
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 14:15:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69844D4C;
	Mon, 13 Nov 2023 06:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699884956; x=1731420956;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=4SqTZZ5GG3sF0sw3M3TuugAIG+MCZs94RA4pLur6IGc=;
  b=HaPAEa+S3s0cN7LKO6Zha3EyBPvfvh5jDUYRUt4eegy2GhGwzCfUwKOD
   kXLQ/ckL2pVBwSvZFBmRmyiP5zYOSb7y/ZFRPGZR5bePiMYS3THqAAgeC
   96N/wn7J64wwvqLMQwQp1i+Tz0HClcZq3RY6Zek0if1NhqXsMgdPwnFyc
   k7/9vRhKfI+gL1mL6Ycdjbti258o5O8r/E2We3tZ5BbPCvzew/eJnE/f0
   scXhXOGVGTcau5qW/NJk0RNPXKpGy1XO8FdUsPGgIbgOXSVCE0eRsJ7Le
   uOZwf5SQVkHgOpwJzKXeYzkQ9siG4vRyHFaYeIrS41i+f+1uUsRz5NRQL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370639790"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="370639790"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 06:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908059342"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="908059342"
Received: from alexdsou-mobl3.gar.corp.intel.com ([10.249.44.83])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 06:15:52 -0800
Date: Mon, 13 Nov 2023 16:15:50 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
    Mark Gross <markgross@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
    error27@gmail.com, vegard.nossum@oracle.com, darren.kenny@oracle.com, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
In-Reply-To: <c3b821fb-5df1-4c58-99bc-f3e99a6d1d94@oracle.com>
Message-ID: <a0b5d36a-aad8-eaf5-7241-85d1c874ff8@linux.intel.com>
References: <20231110142921.3398072-1-harshit.m.mogalapalli@oracle.com> <20231110142921.3398072-4-harshit.m.mogalapalli@oracle.com> <211e6c1e-9bfa-ac29-b6ba-e198c4f36688@linux.intel.com> <fb97e3ea-1bee-4d7d-a8d4-dd76107f75ef@oracle.com>
 <1b58df2d-b444-ddb7-7533-9911d35f8f7@linux.intel.com> <c3b821fb-5df1-4c58-99bc-f3e99a6d1d94@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-195486519-1699884748=:1867"
Content-ID: <9520be49-c073-1c2a-1df5-151267569738@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-195486519-1699884748=:1867
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <1eb3726-567f-368d-4d40-4419ba68c94f@linux.intel.com>

On Mon, 13 Nov 2023, Harshit Mogalapalli wrote:
> On 13/11/23 7:01 pm, Ilpo J�rvinen wrote:
> > On Sat, 11 Nov 2023, Harshit Mogalapalli wrote:
> > > On 10/11/23 8:14 pm, Ilpo J�rvinen wrote:
> > > > On Fri, 10 Nov 2023, Harshit Mogalapalli wrote:
> > > > 
> > > 
> > > Thanks for the review.
> > > 
> > > > This changelog needs to be rewritten, it contains multiple errors. I
> > > > suppose even this patch could be split into two but I'll not be too
> > > > picky
> > > > here if you insist on fixing them in the same patch.
> > > > 
> > > 
> > > Any thoughts on how to split this into two patches ?
> > > 
> > > I thought of fixing memory leak in separate patch, but that would add more
> > > code which should be removed when we move kobject_put() to the end.
> > 
> Thanks for the suggestions.
> 
> > I meant that in the first patch you fix add the missing kfree(). Then in
> > the second one, you correct kobject_put() + play with goto labels. There's
> > no extra code that needs to be added and then removed AFAICT.
> > 
> 
> This is the problem I am trying to explain:
> 
> Let us say we do memory leak fixing in first patch:
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 351d782f3e96..7f29a746210e 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -612,6 +612,7 @@ static int hp_add_other_attributes(int attr_type)
>         default:
>                 pr_err("Error: Unknown attr_type: %d\n", attr_type);
>                 ret = -EINVAL;
> +               kfree(attr_name_kobj);
>                 goto err_other_attr_init;
>         }
> 
> @@ -637,8 +638,10 @@ static int hp_add_other_attributes(int attr_type)
>                 ret = -EINVAL;
>         }
> 
> -       if (ret)
> +       if (ret) {
> +               kfree(attr_name_kobj); ///// [1]

This relates to the 2nd problem (missing kobject_put()) and will be 
covered by the other patch. Don't try to solve this in the first patch
at all!

There are two indepedent problems:
- Before kobject_init_and_add(), kfree() is missing
- After kobject_init_and_add(), kobject_put() is missing

Solve each in own patch and don't mix the solutions.

I know both patches are needed to solve _both_ problems so it's fine to 
have "still broken" intermediate state as long as you didn't make things 
worse in the first patch which you didn't.

>                 goto err_other_attr_init;
> +       }
> 
>         mutex_unlock(&bioscfg_drv.mutex);
>         return 0;
> 
> Now when we want to move kobject_put() to goto label in next patch,
> we should remove the kfree [1], as kobject_put() already does a kfree().
> 
> If that sounds okay, I will split this into two patches, (first one, only
> fixing memory leak; and second one fixing missing kobject_put() calls on error
> paths)

-- 
 i.
--8323329-195486519-1699884748=:1867--

