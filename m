Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025E526CE0F
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Sep 2020 23:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgIPVJM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Sep 2020 17:09:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:26027 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbgIPP4J (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Sep 2020 11:56:09 -0400
IronPort-SDR: /uIUepa346xDDJ5PygkwINzoIXqCHUmNR+BluauigGcm8Ljx4DmfMdAjoGzFAGobqGp8yodheb
 Mq67R6bfmFnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="158784358"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="158784358"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 08:49:06 -0700
IronPort-SDR: zmPQAMpH5jtg2AZ1GH/TDjJJvGwUpdjEGuumwxOLOSnmgavkpuvZ3guz7OZUTaXYZh5si8FdVF
 aLUHqXu4ab5g==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="483358293"
Received: from annatere-mobl.ger.corp.intel.com (HELO btopel-mobl.ger.intel.com) ([10.252.62.158])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 08:49:04 -0700
Subject: Re: [PATCH] i40e, xsk: uninitialized variable in
 i40e_clean_rx_irq_zc()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc:     Tony Nguyen <anthony.l.nguyen@intel.com>,
        intel-wired-lan@lists.osuosl.org, kernel-janitors@vger.kernel.org
References: <20200916143228.GA764370@mwanda>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Message-ID: <850c79f4-de8a-1132-0e37-facbc09e4dfb@intel.com>
Date:   Wed, 16 Sep 2020 17:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916143228.GA764370@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020-09-16 16:32, Dan Carpenter wrote:
> The "failure" variable is used without being initialized.  It should be
> set to false.
> 
> Fixes: 8cbf74149903 ("i40e, xsk: move buffer allocation out of the Rx processing loop")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!

Acked-by: Björn Töpel <bjorn.topel@intel.com>

> ---
>   drivers/net/ethernet/intel/i40e/i40e_xsk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_xsk.c b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> index 6acede0acdca..567fd67e900e 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> +++ b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> @@ -281,8 +281,8 @@ int i40e_clean_rx_irq_zc(struct i40e_ring *rx_ring, int budget)
>   	unsigned int total_rx_bytes = 0, total_rx_packets = 0;
>   	u16 cleaned_count = I40E_DESC_UNUSED(rx_ring);
>   	unsigned int xdp_res, xdp_xmit = 0;
> +	bool failure = false;
>   	struct sk_buff *skb;
> -	bool failure;
>   
>   	while (likely(total_rx_packets < (unsigned int)budget)) {
>   		union i40e_rx_desc *rx_desc;
> 
