Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA86F1CE4C1
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 May 2020 21:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgEKTti (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 May 2020 15:49:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7490 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgEKTth (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 May 2020 15:49:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb9abca0000>; Mon, 11 May 2020 12:47:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 11 May 2020 12:49:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 11 May 2020 12:49:37 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 19:49:36 +0000
Subject: Re: [PATCH] mm/hmm/test: Fix some copy_to_user() error handling
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
CC:     Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>,
        <kernel-janitors@vger.kernel.org>
References: <20200511183704.GA225608@mwanda>
From:   Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <45d2a836-67d1-ad07-7a1d-0031865f6742@nvidia.com>
Date:   Mon, 11 May 2020 12:49:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200511183704.GA225608@mwanda>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589226442; bh=PBC+0STwLzeZBP0HEvdFrTGn0AxD5O/UYz1nIZQS02o=;
        h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ASQBGY0g2vzTx088oZmTchA4HHL5cP00ci4We3aT4tW4T3Mrl8rtFEqjvjCUT01LQ
         29EnYHyDnHNJNez1+LdvQQjja1Cuy2XpZK/H7AbeiRGv49YoDMiY/pHStX5GsDSUlO
         oOan2nQGcvYULMvYgfcoGI5sExwhxe6XXzjaJ9iNUfg+jZmxRbXLGzkQtachwertMu
         HQ/pFo+gt+6/Ov/YK3wBRhp/ZvsppyiryODmkMax20NwNZsFj1MVu9pPP12Jl7Ns8f
         /izTA2UzQeuoD3RIfbK9Ph5vdJ6gQ7FzGfqYUqvZupoMc3Zu3W5KKPLKxRT2+ip8Gk
         34+4STB22bbnA==
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 5/11/20 11:37 AM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes which weren't
> copied but we want to return negative error codes.  Also in dmirror_write()
> if the copy_from_user() fails then there is some cleanup needed before
> we can return so I fixed that as well.
> 
> Fixes: 5d5e54be8a1e3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for fixing this.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   lib/test_hmm.c | 41 +++++++++++++++++++++++++----------------
>   1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 00bca6116f930..fd4889f7b3d90 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -360,9 +360,11 @@ static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>   		cmd->faults++;
>   	}
>   
> -	if (ret == 0)
> -		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> -					bounce.size);
> +	if (ret == 0) {
> +		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> +				 bounce.size))
> +			ret = -EFAULT;
> +	}
>   	cmd->cpages = bounce.cpages;
>   	dmirror_bounce_fini(&bounce);
>   	return ret;
> @@ -412,10 +414,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>   	ret = dmirror_bounce_init(&bounce, start, size);
>   	if (ret)
>   		return ret;
> -	ret = copy_from_user(bounce.ptr, u64_to_user_ptr(cmd->ptr),
> -				bounce.size);
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(bounce.ptr, u64_to_user_ptr(cmd->ptr),
> +			   bounce.size)) {
> +		ret = -EFAULT;
> +		goto fini;
> +	}
>   
>   	while (1) {
>   		mutex_lock(&dmirror->mutex);
> @@ -431,6 +434,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>   		cmd->faults++;
>   	}
>   
> +fini:
>   	cmd->cpages = bounce.cpages;
>   	dmirror_bounce_fini(&bounce);
>   	return ret;
> @@ -715,9 +719,11 @@ static int dmirror_migrate(struct dmirror *dmirror,
>   	mutex_lock(&dmirror->mutex);
>   	ret = dmirror_do_read(dmirror, start, end, &bounce);
>   	mutex_unlock(&dmirror->mutex);
> -	if (ret == 0)
> -		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> -					bounce.size);
> +	if (ret == 0) {
> +		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> +				 bounce.size))
> +			ret = -EFAULT;
> +	}
>   	cmd->cpages = bounce.cpages;
>   	dmirror_bounce_fini(&bounce);
>   	return ret;
> @@ -886,9 +892,10 @@ static int dmirror_snapshot(struct dmirror *dmirror,
>   			break;
>   
>   		n = (range.end - range.start) >> PAGE_SHIFT;
> -		ret = copy_to_user(uptr, perm, n);
> -		if (ret)
> +		if (copy_to_user(uptr, perm, n)) {
> +			ret = -EFAULT;
>   			break;
> +		}
>   
>   		cmd->cpages += n;
>   		uptr += n;
> @@ -911,9 +918,8 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>   	if (!dmirror)
>   		return -EINVAL;
>   
> -	ret = copy_from_user(&cmd, uarg, sizeof(cmd));
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(&cmd, uarg, sizeof(cmd)))
> +		return -EFAULT;
>   
>   	if (cmd.addr & ~PAGE_MASK)
>   		return -EINVAL;
> @@ -946,7 +952,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>   	if (ret)
>   		return ret;
>   
> -	return copy_to_user(uarg, &cmd, sizeof(cmd));
> +	if (copy_to_user(uarg, &cmd, sizeof(cmd)))
> +		return -EFAULT;
> +
> +	return 0;
>   }
>   
>   static const struct file_operations dmirror_fops = {
> 
