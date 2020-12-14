Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AAC2D9496
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Dec 2020 10:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439540AbgLNJJj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Dec 2020 04:09:39 -0500
Received: from mga12.intel.com ([192.55.52.136]:44226 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439528AbgLNJJh (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Dec 2020 04:09:37 -0500
IronPort-SDR: yO/aMWQsPCNIYumGzUGRyDFpemxmSd5VGDbpYySG/SkCBxnQu3KKHbTyBiO/Nwq0Y6qrtL+8dz
 GnB3zXiE6Sng==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="153909204"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="153909204"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 01:08:50 -0800
IronPort-SDR: xPzgKZQnh+ubZYnPU5ZhWL6WQZG2ZGvRNCMabknE6rXaPec5agfeZlzD3kxGvGly754p4ffykm
 SxJlsuAundzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="351224147"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2020 01:08:50 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 01:08:48 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 14:38:45 +0530
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 09:08:44 +0000
From:   "Rojewski, Cezary" <cezary.rojewski@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        "Mark Brown" <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Singh, Guneshwor O" <guneshwor.o.singh@intel.com>
Subject: RE: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Thread-Topic: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Thread-Index: AQHWz6VrP/elf/kqtEm4xays79ITg6n2UdQQ
Date:   Mon, 14 Dec 2020 09:08:44 +0000
Message-ID: <b3df1e4d04c84b02939321c6994ec978@intel.com>
References: <X9NEvCzuN+IObnTN@mwanda>
In-Reply-To: <X9NEvCzuN+IObnTN@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020-12-11 11:06 AM, Dan Carpenter wrote:
> Return -ETIMEDOUT if the dsp boot times out instead of returning
> success.
> 
> Fixes: cb6a55284629 ("ASoC: Intel: cnl: Add sst library functions for cnl platform")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.
> 
>   sound/soc/intel/skylake/cnl-sst.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
> index fcd8dff27ae8..1275c149acc0 100644
> --- a/sound/soc/intel/skylake/cnl-sst.c
> +++ b/sound/soc/intel/skylake/cnl-sst.c
> @@ -224,6 +224,7 @@ static int cnl_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
>   				"dsp boot timeout, status=%#x error=%#x\n",
>   				sst_dsp_shim_read(ctx, CNL_ADSP_FW_STATUS),
>   				sst_dsp_shim_read(ctx, CNL_ADSP_ERROR_CODE));
> +			ret = -ETIMEDOUT;
>   			goto err;
>   		}
>   	} else {
> 

Thanks for the patch, Dan.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

