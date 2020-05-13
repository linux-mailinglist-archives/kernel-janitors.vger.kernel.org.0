Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930D21D1E8E
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 May 2020 21:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390392AbgEMTIh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 May 2020 15:08:37 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6424 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732218AbgEMTIh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 May 2020 15:08:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ebc45690000>; Wed, 13 May 2020 12:07:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 13 May 2020 12:08:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 13 May 2020 12:08:36 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 May
 2020 19:08:36 +0000
Subject: Re: [PATCH] mm/hmm/test: fix an error code in hmm_dmirror_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
CC:     <linux-mm@kvack.org>, <kernel-janitors@vger.kernel.org>
References: <20200513094225.GE347693@mwanda>
X-Nvconfidentiality: public
From:   Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <86b773ef-bc31-7d1c-f271-583c1f0a420a@nvidia.com>
Date:   Wed, 13 May 2020 12:08:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200513094225.GE347693@mwanda>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589396842; bh=mINCvI4gI2qbbvGcwy+fHHBtl4Zj+bEhAa8NpAUA6aE=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=b5Et0h+N1drl4gzSU1TbCxwevl3nCnM+akbvWqzLpuhPrlXfaWsSHF1eJLq6pHcEp
         bEU54aPiolAQ5OpVdm0SrBYJQAT/WlMz3gjG85JEnxUNqIa+3lRb4Zcv8gs0aPE0xT
         djGg/aHPSyvmLWaI59mKB/eLZ4e5GlryCjB/o1unV/WIYOzSvz3i84unuUdV14EY9E
         OswKxrD0zhGq/o1Q8kQPa8E3cOCucKB+hLF+wh5B+KYA1uJC3Jh89ajOd/qPkwtJsb
         A4srYh5HIbx1NTZeGO9aZh/YWza/k87/RehE3O/1HCn56a/lCFu/vkv3hFNMmlC7Go
         jiqePHTWR6+ZQ==
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 5/13/20 2:42 AM, Dan Carpenter wrote:
> If the allocation fails, then this should return -ENOMEM instead of
> success.
> 
> Fixes: a149d2eb654b ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   lib/test_hmm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 00bca6116f930..b4d9434e49e72 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1119,8 +1119,10 @@ static int __init hmm_dmirror_init(void)
>   	 * make the code here simpler (i.e., we need a struct page for it).
>   	 */
>   	dmirror_zero_page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
> -	if (!dmirror_zero_page)
> +	if (!dmirror_zero_page) {
> +		ret = -ENOMEM;
>   		goto err_chrdev;
> +	}
>   
>   	pr_info("HMM test module loaded. This is only for testing HMM.\n");
>   	return 0;
> 

Thanks for fixing this. It looks like Wei Yongjun beat you to it
and Jason Gunthorpe has applied it to the hmm tree.

https://lore.kernel.org/linux-mm/20200512195932.GB9154@ziepe.ca/
