Return-Path: <kernel-janitors+bounces-182-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9A47E3472
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Nov 2023 05:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DE9CB20BE8
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Nov 2023 04:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05568F6B;
	Tue,  7 Nov 2023 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A579F2
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 04:17:23 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF2DED;
	Mon,  6 Nov 2023 20:17:20 -0800 (PST)
Received: from kwepemm000012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SPZbd4q3pzrTy6;
	Tue,  7 Nov 2023 12:14:05 +0800 (CST)
Received: from [10.174.178.220] (10.174.178.220) by
 kwepemm000012.china.huawei.com (7.193.23.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 7 Nov 2023 12:17:07 +0800
Message-ID: <29114526-7854-ca44-fa30-cb9a5090d9d2@huawei.com>
Date: Tue, 7 Nov 2023 12:17:06 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] scsi: scsi_debug: scsi: scsi_debug: fix some bugs
 in sdebug_error_write()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Douglas Gilbert <dgilbert@interlog.com>,
	<linux-scsi@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <7733643d-e102-4581-8d29-769472011c97@moroto.mountain>
From: Wenchao Hao <haowenchao2@huawei.com>
In-Reply-To: <7733643d-e102-4581-8d29-769472011c97@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.220]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000012.china.huawei.com (7.193.23.142)
X-CFilter-Loop: Reflected

On 2023/11/6 22:04, Dan Carpenter wrote:
> There are two bug in this code:
> 1) If count is zero, then it will lead to a NULL dereference.  The
>     kmalloc() will successfully allocate zero bytes and the test for
>     "if (buf[0] == '-')" will read beyond the end of the zero size buffer
>     and Oops.
> 2) The code does not ensure that the user's string is properly NUL
>     terminated which could lead to a read overflow.
> 
> Fixes: a9996d722b11 ("scsi: scsi_debug: Add interface to manage error injection for a single device")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: At first I tried to use strndup_user() but that only accepts NUL
>      terminated strings and the user string is normally not terminated.
> 
>   drivers/scsi/scsi_debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index 67922e2c4c19..0dd21598f7b6 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -1019,7 +1019,7 @@ static ssize_t sdebug_error_write(struct file *file, const char __user *ubuf,
>   	struct sdebug_err_inject *inject;
>   	struct scsi_device *sdev = (struct scsi_device *)file->f_inode->i_private;
>   
> -	buf = kmalloc(count, GFP_KERNEL);
> +	buf = kzalloc(count + 1, GFP_KERNEL);
>   	if (!buf)
>   		return -ENOMEM;
>   
Looks good,

Reviewed-by: Wenchao Hao <haowenchao2@huawei.com>

