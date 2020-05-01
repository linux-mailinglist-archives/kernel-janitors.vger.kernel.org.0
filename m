Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD6C1C195F
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 17:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgEAPYJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 11:24:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:25819 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729623AbgEAPYC (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 11:24:02 -0400
IronPort-SDR: ntsT+1LZcKEMJjSji8aS+k0L1KfS4d4hlSpbSQyq1EJJ3cADn9UzjTqZzySEiwy66/2J6BSWdn
 kecTv0q7ETIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 08:24:02 -0700
IronPort-SDR: 47tymbPfl9qbTTlfysUzknikXccfyXgrbod4kYl4O78cywd5rglwBV6HBEZ8t3NQ+M9AjVwqUQ
 n7VPmxEa4G+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; 
   d="scan'208";a="433341664"
Received: from marshy.an.intel.com (HELO [10.122.105.159]) ([10.122.105.159])
  by orsmga005.jf.intel.com with ESMTP; 01 May 2020 08:24:01 -0700
Subject: Re: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        gregkh@linuxfoundation.org, atull@kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
 <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
From:   Richard Gong <richard.gong@linux.intel.com>
Message-ID: <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
Date:   Fri, 1 May 2020 10:40:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 4/29/20 1:52 AM, Christophe JAILLET wrote:
> Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
> shorter 'devm_kcalloc(...)'.
> 
It doesn't make much sense.
Actually devm_kcalloc returns devm_kmalloc_array(.., flag | __GFP_ZERO).

> 'ctrl->genpool' can not be NULL, so axe a useless test in the remove
> function.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/firmware/stratix10-svc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index 739004398877..c228337cb0a1 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1002,8 +1002,7 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>   	if (!controller)
>   		return -ENOMEM;
>   
> -	chans = devm_kmalloc_array(dev, SVC_NUM_CHANNEL,
> -				   sizeof(*chans), GFP_KERNEL | __GFP_ZERO);
> +	chans = devm_kcalloc(dev, SVC_NUM_CHANNEL, sizeof(*chans), GFP_KERNEL);
>   	if (!chans)
>   		return -ENOMEM;
>   
> @@ -1086,8 +1085,7 @@ static int stratix10_svc_drv_remove(struct platform_device *pdev)
>   		kthread_stop(ctrl->task);
>   		ctrl->task = NULL;
>   	}
> -	if (ctrl->genpool)
> -		gen_pool_destroy(ctrl->genpool);
> +	gen_pool_destroy(ctrl->genpool);
>   	list_del(&ctrl->node);
>   
>   	return 0;
> 

Regards,
Richard
