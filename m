Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D4DA8148
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 13:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfIDLnR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 07:43:17 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6641 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729122AbfIDLnR (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 07:43:17 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 5F0A4C1B84A24276A792;
        Wed,  4 Sep 2019 19:43:15 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019
 19:43:10 +0800
Subject: Re: [PATCH] f2fs: signedness bug in f2fs_fname_setup_ci_filename()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>
CC:     Chao Yu <chao@kernel.org>,
        <linux-f2fs-devel@lists.sourceforge.net>,
        <kernel-janitors@vger.kernel.org>
References: <20190904100239.GC7007@mwanda>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
Date:   Wed, 4 Sep 2019 19:43:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190904100239.GC7007@mwanda>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2019/9/4 18:02, Dan Carpenter wrote:
> The error handling doesn't work because "cf_name->len" is unsigned.

Dan, thanks for catching this, would you mind merging this into original patch,
since it's still in the dev branch. :)

Thanks,

> 
> Fixes: fbce5d4ab3ab ("f2fs: optimize case-insensitive lookups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/f2fs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 9de688a4e115..c83b666f9d7e 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -157,7 +157,7 @@ void f2fs_fname_setup_ci_filename(struct inode *dir,
>  	cf_name->len = utf8_casefold(sbi->s_encoding,
>  					iname, cf_name->name,
>  					F2FS_NAME_LEN);
> -	if (cf_name->len <= 0) {
> +	if ((int)cf_name->len <= 0) {
>  		kvfree(cf_name->name);
>  		cf_name->name = NULL;
>  	}
> 
