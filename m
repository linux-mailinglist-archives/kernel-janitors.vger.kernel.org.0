Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C15928AA89
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Oct 2020 22:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgJKU6Q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 11 Oct 2020 16:58:16 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14397 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729321AbgJKU6Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Oct 2020 16:58:16 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8371760001>; Sun, 11 Oct 2020 13:56:22 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 11 Oct
 2020 20:58:15 +0000
Subject: Re: [PATCH] mm/hmm/test: Fix an error code in
 dmirror_allocate_chunk()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-mm@kvack.org>, <kernel-janitors@vger.kernel.org>
References: <20201010200812.GA1886610@mwanda>
From:   Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e9a5c5cc-b301-54f0-2200-117a82ae420a@nvidia.com>
Date:   Sun, 11 Oct 2020 13:58:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201010200812.GA1886610@mwanda>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602449782; bh=3gzE4h0sY7m4wDIeJCED4vDnvda9FNSHqpTCIrN3G9s=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=XQk8IZPavTeGcChntTFGGo6lIZrqGett6cNtpY97nteyToTBOj/u2CcKi7g+7Yute
         QU2Zi6G8Yp6iiU9q2o7caBUtyckM9aEh30+xBPNbmx2pFvMppbhP7hGGlGwTYvgZg1
         258mDlEGmZwJldRw73aS7D+/iCHTXTjJnGAzwav5TLmiv4Xp/H0dCG//ItD6WIgDmo
         WQ2S7n2k6AOQFKTH+OH7pHUlziOZiwPGQPuyTWcqs1xdHZozeF8E413yDiNNV2vm/f
         a0q5De4KQlCvGfcP8zqU0qK6zwT2MQqy0wcUzxyCCC02mwZmGmCDhHmUsBcYjNuHDw
         Mf08ZRGfejiYw==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 10/10/20 1:08 PM, Dan Carpenter wrote:
> This is supposed to return false on failure, not a negative error code.
> 
> Fixes: 170e38548b81 ("mm/hmm/test: use after free in dmirror_allocate_chunk()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I messed this up earlier...  My devel version of Smatch prints too much
> garbage so I missed the warning when I first wrote the patch.  :/
> Sorry.
> 
>   lib/test_hmm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index e151a7f10519..80a78877bd93 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -461,7 +461,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>   
>   	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>   	if (!devmem)
> -		return -ENOMEM;
> +		return false;
>   
>   	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>   				      "hmm_dmirror");

Thanks for fixing this.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
