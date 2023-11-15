Return-Path: <kernel-janitors+bounces-183-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9457E347D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Nov 2023 05:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1D43B20C2D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Nov 2023 04:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3E69469;
	Tue,  7 Nov 2023 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17729445
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 04:19:31 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C43FC;
	Mon,  6 Nov 2023 20:19:30 -0800 (PST)
Received: from kwepemm000012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SPZfC0G8lzrV03;
	Tue,  7 Nov 2023 12:16:19 +0800 (CST)
Received: from [10.174.178.220] (10.174.178.220) by
 kwepemm000012.china.huawei.com (7.193.23.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 7 Nov 2023 12:19:28 +0800
Message-ID: <b14dd6dd-4960-1a6a-7973-65f627d2b554@huawei.com>
Date: Tue, 7 Nov 2023 12:19:27 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] scsi: scsi_debug: delete some bogus error checking
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
References: <c602c9ad-5e35-4e18-a47f-87ed956a9ec2@moroto.mountain>
From: Wenchao Hao <haowenchao2@huawei.com>
In-Reply-To: <c602c9ad-5e35-4e18-a47f-87ed956a9ec2@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.220]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000012.china.huawei.com (7.193.23.142)
X-CFilter-Loop: Reflected

On 2023/11/6 22:05, Dan Carpenter wrote:
> Smatch complains that "dentry" is never initialized.  These days everyone
> initializes all their stack variables to zero so this means that it will
> trigger a warning every time this function is run.
> 
> Really, debugfs functions are not supposed to be checked for errors in
> normal code.  For example, if we updated this code to check the correct
> variable then it would print a warning if CONFIG_DEBUGFS was disabled.
> We don't want that.  Just delete the check.
> 
> Fixes: f084fe52c640 ("scsi: scsi_debug: Add debugfs interface to fail target reset")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Add some more text to the commit message about CONFIG_DEBUGFS
> 
>   drivers/scsi/scsi_debug.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index 0dd21598f7b6..6d8218a44122 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -1132,7 +1132,6 @@ static const struct file_operations sdebug_target_reset_fail_fops = {
>   static int sdebug_target_alloc(struct scsi_target *starget)
>   {
>   	struct sdebug_target_info *targetip;
> -	struct dentry *dentry;
>   
>   	targetip = kzalloc(sizeof(struct sdebug_target_info), GFP_KERNEL);
>   	if (!targetip)
> @@ -1140,15 +1139,9 @@ static int sdebug_target_alloc(struct scsi_target *starget)
>   
>   	targetip->debugfs_entry = debugfs_create_dir(dev_name(&starget->dev),
>   				sdebug_debugfs_root);
> -	if (IS_ERR_OR_NULL(targetip->debugfs_entry))
> -		pr_info("%s: failed to create debugfs directory for target %s\n",
> -			__func__, dev_name(&starget->dev));
>   
>   	debugfs_create_file("fail_reset", 0600, targetip->debugfs_entry, starget,
>   				&sdebug_target_reset_fail_fops);
> -	if (IS_ERR_OR_NULL(dentry))
> -		pr_info("%s: failed to create fail_reset file for target %s\n",
> -			__func__, dev_name(&starget->dev));
>   
>   	starget->hostdata = targetip;
>   
Looks good, thanks for the fix.

Reviewed-by: Wenchao Hao <haowenchao2@huawei.com>

