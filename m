Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089A42FD261
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jan 2021 15:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388450AbhATOKJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jan 2021 09:10:09 -0500
Received: from mga17.intel.com ([192.55.52.151]:21947 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388913AbhATNFS (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jan 2021 08:05:18 -0500
IronPort-SDR: 280Oa49bTsz73UvINcxsogLIaWhxDR5MChpsxHvzQEwZoTelpwJE6jh10ppiDwXi+iNvHwvxw5
 bbbb9mxQzPkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158873634"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="158873634"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 04:56:00 -0800
IronPort-SDR: 1v99U5vq/F+smE783HMvfPtX7hpqVEE/qe85bfTe/fYFyjtygxB6VnFGzBowwF7L08pMAbi/dq
 4/apgEH3lvbA==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="384825706"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.157.238]) ([10.249.157.238])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 04:55:58 -0800
Subject: Re: [PATCH] ASoC: topology: Fix memory corruption in
 soc_tplg_denum_create_values()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
References: <YAf+8QZoOv+ct526@mwanda>
From:   =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Message-ID: <5d5cce3b-916a-97ba-1c13-7ba5eba9bf38@linux.intel.com>
Date:   Wed, 20 Jan 2021 13:55:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YAf+8QZoOv+ct526@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/20/2021 10:59 AM, Dan Carpenter wrote:
> The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
> so it leads to memory corruption later in the function when the data is
> initialized.
> 
> Fixes: 5aebe7c7f9c2 ("ASoC: topology: fix endianness issues")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis, not from testing.  Obviously we don't
> want memory corruption, so my patch is an improvement.  But I feel like
> a better approach might be to change the type of dvalues[] to u32.  I
> took the less risky approach because I'm not an expert and can't test
> it.  But if someone else can take a look at it, then I'll redo the
> patch.
> 
>   sound/soc/soc-topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 950c45008e24..37a5d73e643b 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -902,7 +902,7 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
>   		return -EINVAL;
>   
>   	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
> -					   sizeof(u32),
> +					   sizeof(*se->dobj.control.dvalues),
>   					   GFP_KERNEL);
>   	if (!se->dobj.control.dvalues)
>   		return -ENOMEM;
> 

Looks good to me. And yes as we store already parsed value, dvalues 
could be changed to u32, but I would still change the sizeof as you did 
above.
