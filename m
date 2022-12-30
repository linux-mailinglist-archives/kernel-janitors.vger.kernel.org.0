Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1935F6563D5
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Dec 2022 16:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiLZPZ1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Dec 2022 10:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbiLZPZ0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Dec 2022 10:25:26 -0500
X-Greylist: delayed 561 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Dec 2022 07:25:21 PST
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4750D43
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Dec 2022 07:25:21 -0800 (PST)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
        by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 013101B7;
        Mon, 26 Dec 2022 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paragon-software.com; s=mail; t=1672067549;
        bh=vROiKSym8cI4wQS/SSI2A7qFfbXsoMydSXWspjPpWl4=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=opKq4WXuxvDL25/p+VNd0TA3bdByvsGER6ZxROyvWuZjY8lqtqxJEPSIRJNL/5cfn
         T95PlGxSvaUhyyyb8hHqCALudLnkZJufqhrf1sf7jLt1prNvEj7GB6ohSnLQt60O5a
         dzjgF2WyHAZqPh8HLf7vbUnihzkM4nNuKp01ggYI=
Received: from [192.168.211.153] (192.168.211.153) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 26 Dec 2022 18:15:57 +0300
Message-ID: <d14a1700-e36a-9fc7-ffc3-464de93cd355@paragon-software.com>
Date:   Mon, 26 Dec 2022 19:15:57 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fs/ntfs3: Uninitialized variable bug in ntfs_d_compare()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <Y0kug+IlQhJyyg25@kili>
From:   Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <Y0kug+IlQhJyyg25@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.153]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 14.10.2022 13:40, Dan Carpenter wrote:
> Smatch detected an uninitialized variable bug:
>
>      fs/ntfs3/namei.c:487 ntfs_d_compare() error: uninitialized symbol 'uni1'
>
> Fixes: a3a956c78efa ("fs/ntfs3: Add option "nocase"")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   fs/ntfs3/namei.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> index 315763eb05ff..5d3a6ce3f05f 100644
> --- a/fs/ntfs3/namei.c
> +++ b/fs/ntfs3/namei.c
> @@ -431,10 +431,8 @@ static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
>   
>   	/* First try fast implementation. */
>   	for (;;) {
> -		if (!lm--) {
> -			ret = len1 == len2 ? 0 : 1;
> -			goto out;
> -		}
> +		if (!lm--)
> +			return len1 == len2 ? 0 : 1;
>   
>   		if ((c1 = *n1++) == (c2 = *n2++))
>   			continue;
> @@ -442,10 +440,8 @@ static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
>   		if (c1 >= 0x80 || c2 >= 0x80)
>   			break;
>   
> -		if (toupper(c1) != toupper(c2)) {
> -			ret = 1;
> -			goto out;
> -		}
> +		if (toupper(c1) != toupper(c2))
> +			return 1;
>   	}
>   
>   	/*

Thanks for work, this bug has already been fixed:

https://lore.kernel.org/ntfs3/20221004232359.285685-1-nathan@kernel.org/

