Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F16215A8DD
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 13:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgBLMM5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 07:12:57 -0500
Received: from mail-dm6nam12on2081.outbound.protection.outlook.com ([40.107.243.81]:18892
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727535AbgBLMM5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 07:12:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx9mDLsAsgYYXIcPOJNERvc7QKvm0OQ/A5bhPGJbZLYUrnDHhwCAzYHmDu9WHtIti70Cik8DNDVVPvljrVdCayfoQ2iV1MaVarA2xO9uSrUUqWsZOF3klZwkHhjVqPe+7xmIPrFdURA1sXmM5RMNqTwa4105hLAbdZ4/gjHwrNO0UNy/WyvDuacF5+b0UHFXbN0EaBbW7c3jm1DgSjPrZafHnri1tKwWItd0I0cUXe0/LOfvX594BPTXm49Ef193sC19laDDtdR8zikiUzSeoaJW6K5Q6cojA0Q3Vw/2w5HrnwlIuTcEIHPcba4qDVSAb7En36qM7CDdMVU4y10x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f7ppoqe2PTs7uz+8tx2oOXv7ne69gyeVjOuNrw6I8U=;
 b=Mldb6Loh6ILOhfETiq8/05cy7tB59+NohHkFiy48XwJed9GytYed773RTkAkeRhz9TNIBmE6D6Jpd6Vf3HO7DsGSzDQJ2YJ7hB7F2yxpwPzkxAC/fUXLuYd1zzM5MoNs73CHcnAqpsMSim9QbSLr7JndqUD/MyKJ+zjogk98pHjU6o94su/bSz6uBUQTKwtsCs0oHSns9NVUdyZm1w6IXaTdVOPNPcZzKeNLN2E08csMlMLPwRPH2r0Gqol/meLyWUXW6PIvkFj+bY/2r/qIDUvKqsC1HhZRi4Lw3U+wWGYnz5U1EsrISwmcMN6+uH1TQhpSawpKr44WBAtrW4Uc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f7ppoqe2PTs7uz+8tx2oOXv7ne69gyeVjOuNrw6I8U=;
 b=pbgjuALzn9G54c4DLDt//hHZnUhgJ2A4KGZEzvQkAykYH5/0PryTmjNN+O80UohQ/74UMzR/4y3wLo842vtyJj+dgPJdR40yx6R7GdADWrnss2yW2f+/nL6lPj0Dh4XuzlvkxNrPtnb0KPGwfciXGFtDS8CzWBPccEwA5TDkWKg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2360.namprd12.prod.outlook.com (52.132.208.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Wed, 12 Feb 2020 12:12:25 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.021; Wed, 12 Feb
 2020 12:12:24 +0000
Subject: Re: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Alex Deucher <alexander.deucher@amd.com>
Cc:     "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jonathan Kim <Jonathan.Kim@amd.com>,
        Philip Yang <Philip.Yang@amd.com>,
        "Tianci.Yin" <tianci.yin@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
Date:   Wed, 12 Feb 2020 13:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Wed, 12 Feb 2020 12:12:22 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4c546c6-21fd-4362-2216-08d7afb4d1b1
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:|DM5PR12MB2360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB23604604FE04503CF797D25A831B0@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(2616005)(86362001)(316002)(5660300002)(6636002)(8936002)(66574012)(52116002)(8676002)(66946007)(66476007)(2906002)(66556008)(478600001)(4326008)(31686004)(31696002)(81166006)(81156014)(6486002)(110136005)(54906003)(6666004)(16526019)(186003)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB2360;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +x1HZ1k8Fj4zfnTrfC9ODqqzR63moetRlW6wyCWEsQaKQpHcF1NLR/jiiwJ/X/MFAAGFnYD5kwt3OHJQBi4eebOHQYdrJBdGzbhHq64+ZESXRZcnkG7AwuUqJgi2vhEolsVx1eiBzOexzZEIvlltypwpIALw+GhDRF0lY60qjRWCS4SAGigk2dmXtSfvapk8kVdjb9nKfgnTnv70LmDSh9IfolIsazsvPvH62xi7kTuEQgaEEKh4bJD5bSiMjLigTKEHUeScL0OHjdPSZZjoFSgAIfx6js7rULLByU4qWqlCoNH/naUfoClPLjzNJJRyposUG/2qQLznjNY4XCxhFP3kPkDNsDqGvEk2fMWV20JO+SRteP42JWXWWKC2nU2ZlcCeSwVYY+cA64qYAoVihSjXUe8TyF25eeApmkKtAhYkdjYQd6amryKxmRrZCNWK
X-MS-Exchange-AntiSpam-MessageData: 5fBUy1TVT22lxZW/nAMlj4PyHHdiWWxb1DWLYHPILWDv5QSDLadkgt/jeKFmpG/lEKqMvc/S84d0E8V6UvWiPtR5tTMritiWEXLBqUiZC0MfoRR6SfpUiZx4MzByF4dr42s+VLkZpvnmGpZNrzAOkGr+ISjkfQ1vJRptaM2zZoFOgv1f9Rm1h1awjU9Pm+k/5AKptNHsdUas4mY4mgB/nw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c546c6-21fd-4362-2216-08d7afb4d1b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 12:12:24.8563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkrzvCzYUo37GhD9UBVAvo+hDgZ/kvFdtsBe9qTVa4j/BZu0txvblvgEKNssahtf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 12.02.20 um 13:07 schrieb Dan Carpenter:
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return a negative error code to the user.
>
> Fixes: 030d5b97a54b ("drm/amdgpu: use amdgpu_device_vram_access in amdgpu_ttm_vram_read")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Alex do you want to pick that up or should I do this?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 15f5451d312d..660867cf2597 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2280,7 +2280,6 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
>   {
>   	struct amdgpu_device *adev = file_inode(f)->i_private;
>   	ssize_t result = 0;
> -	int r;
>   
>   	if (size & 0x3 || *pos & 0x3)
>   		return -EINVAL;
> @@ -2294,9 +2293,8 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
>   		uint32_t value[AMDGPU_TTM_VRAM_MAX_DW_READ];
>   
>   		amdgpu_device_vram_access(adev, *pos, value, bytes, false);
> -		r = copy_to_user(buf, value, bytes);
> -		if (r)
> -			return r;
> +		if (copy_to_user(buf, value, bytes))
> +			return -EFAULT;
>   
>   		result += bytes;
>   		buf += bytes;

