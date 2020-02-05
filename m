Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35557153868
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Feb 2020 19:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbgBESoK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Feb 2020 13:44:10 -0500
Received: from mail-eopbgr680079.outbound.protection.outlook.com ([40.107.68.79]:15043
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727081AbgBESoK (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Feb 2020 13:44:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLlJLtDco3Q7EjGdLwrZ9/+39Wszlp6XQHWnOWGcZXbK92SWuO0D5kCXUjgSoVTQUUM00DAD/oPlFfQxR64nblHILd5GVKDZGPnsVxFdCcXv5IXElJlQrbikpaD9B+9WaYG133BF2qG1cfhINmmrXZf2zLyoFKw8sv7mqgepdZvlvR8kkr5qaHvfGdH2fDXeR+zwMxOeISHEUEvuOGF0/AHfeeKa3QBCDLKlD0OVsdQ5f/QrhdzmaSknEu3U+LKjXfMtDMCqAJ0FhWeN7AoN2L1Gaj1nmGxm5odJYgbRZoWjk399HQYPV0xcAyL9Bu5ZyKaK1VyZUGlJltVtp0YTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z04vBf/x8bFEZW+6z2oNLiDfLFPP05eGgeI3HGOEH0=;
 b=Py70AtBuDjUsicOVK10haZQxM4yPH/9GDM9tDm+Y6j7pnEI227JKVBkRzw6Znwdi/TGq0sOItkOKHen8foJykiy1FFcQNJXKqQbdG0Fs5pHS2AmJ7q1N+CIMH2NfiG2oZhMyHZ24ciZhyCsbapsD3fIcbiaI66/+7fBfBGc8P2j7dUBtEZNVexFbCr6jXpIWZPGwda3ItMdfEO7s3p8odZXWBw/DZkc/x4BzCY5R4b6YmocxYFtAvdb7lAPniHtfPVuuLrQeI1saHIPL0yaKQa26ETCRRD3lozR1gRWmM4KiAqk6xlLUEn+9r7tl5WeV++JC32XujVIOKtdd32Ma3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z04vBf/x8bFEZW+6z2oNLiDfLFPP05eGgeI3HGOEH0=;
 b=OAGUbtcpI/Mr1P8/hn3FdWYFDnEE9fR33kORmA0hbojuYljSH2h2Giidd0YHmBE9twyjMgBBTo9QD+9M7Id07CRq0YqG1LAEfErSGB+kaGrGs3LGM75LSQFf26ps8b0ECf4aggmpbTP8NZ2ATMle9z4v0vj2S1rfwPHeYMGrd30=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
Received: from DM6PR12MB4236.namprd12.prod.outlook.com (10.141.184.142) by
 DM6PR12MB3290.namprd12.prod.outlook.com (20.179.106.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Wed, 5 Feb 2020 18:44:06 +0000
Received: from DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::91ac:1f2d:b4ca:c0a4]) by DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::91ac:1f2d:b4ca:c0a4%6]) with mapi id 15.20.2707.020; Wed, 5 Feb 2020
 18:44:05 +0000
Subject: Re: [PATCH] drm/amd/display: Fix some use after free bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Harry Wentland <harry.wentland@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Zhan Liu <zhan.liu@amd.com>, zhengbin <zhengbin13@huawei.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200205183714.6t5c7ewyovwjicm6@kili.mountain>
From:   Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Message-ID: <b9a18739-cada-05e8-d894-be8dcba9fb43@amd.com>
Date:   Wed, 5 Feb 2020 13:44:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200205183714.6t5c7ewyovwjicm6@kili.mountain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14)
MIME-Version: 1.0
Received: from [172.29.2.119] (165.204.55.250) by YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Wed, 5 Feb 2020 18:44:05 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6445892-fddd-4d34-269e-08d7aa6b60ae
X-MS-TrafficTypeDiagnostic: DM6PR12MB3290:|DM6PR12MB3290:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3290F85B54BE48C34764640BF9020@DM6PR12MB3290.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(86362001)(956004)(2616005)(2906002)(478600001)(16526019)(186003)(316002)(4326008)(6486002)(53546011)(26005)(31696002)(6636002)(36756003)(66556008)(5660300002)(66476007)(66946007)(110136005)(54906003)(31686004)(8936002)(16576012)(52116002)(81166006)(81156014)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3290;H:DM6PR12MB4236.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nR1+W5YGOLrd44YGDaJ8CpESWF//B7xYvjQHhQhsGIqnmbdM6ivglFdbEDKoxqCRTKd/Yn6X/58haFow62/cmB2jLjhAYFwfI0UWagqteTmkdx7fSsjFVK9tylrjgaOLamJ8mxXijzQP0nEIS4+yeV2Of7Cyc1rSw3z9F7jwdES5jTzEGP2mPl5TyBPhUy6hNLbhAtjoR0P8kgJJ8LV7OkY0BzLzn3x+2dfz9QtNXQR3/dK+xqGJTiDyp0fJZc7NcLVLL+9CJSv4WG4EmKA8Q34y4Fx3QrzuyfxZIIubhgmLc0UU742UsgR+sJa5QkdZeo5NOOn4W0ykHMMKy7j2HA4wbNONqP0ZYCsKhUWK+mbgSI1qYKGi6iySNQbSHM2BrSrTO8iOF86retfPIucEO/2Dg3FTSW/NWR7koYQWUhfzMKwljRlpaZqh/RDhUlI/
X-MS-Exchange-AntiSpam-MessageData: 6jlAPBMm1VDfXtHvfXsBsXgxIHHDglm0w4ub26nV3Yrz0SaYf9yPWLGUHsNM22bsCC++QdR6bH36CBylIygWgEy3+SUWqfVGdvH9V2r4uo/RDXcGbadtURs4v5dPEjxjd4Cdpe2txAnxKyUIcCBl2Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6445892-fddd-4d34-269e-08d7aa6b60ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 18:44:05.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R08bXWyTGthbKz3BiHv1tZEE1cmgT5khELoWFd6EyJ9GXg8CA7P/+5WixaL0BE3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3290
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

On 2020-02-05 1:38 p.m., Dan Carpenter wrote:
> These frees need to be re-ordered so that we don't dereference "hdcp_work"
> right after it's freed.  Also in hdcp_create_workqueue() there is a
> problem that "hdcp_work" can be NULL if the allocation fails so it would
> lead to a NULL dereference in the cleanup code.
>
> Fixes: 9aeb8a134a0a ("drm/amd/display: Add sysfs interface for set/get srm")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> index 1768a33b1dc3..f3330df782a4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> @@ -380,9 +380,9 @@ void hdcp_destroy(struct hdcp_workqueue *hdcp_work)
>   		cancel_delayed_work_sync(&hdcp_work[i].watchdog_timer_dwork);
>   	}
>   
> -	kfree(hdcp_work);
>   	kfree(hdcp_work->srm);
>   	kfree(hdcp_work->srm_temp);
> +	kfree(hdcp_work);
>   }
>   
>   static void update_config(void *handle, struct cp_psp_stream_config *config)
> @@ -555,11 +555,12 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
>   {
>   
>   	int max_caps = dc->caps.max_links;
> -	struct hdcp_workqueue *hdcp_work = kzalloc(max_caps*sizeof(*hdcp_work), GFP_KERNEL);
> +	struct hdcp_workqueue *hdcp_work;
>   	int i = 0;
>   
> +	hdcp_work = kcalloc(max_caps, sizeof(*hdcp_work), GFP_KERNEL);
>   	if (hdcp_work == NULL)
> -		goto fail_alloc_context;
> +		return NULL;
>   
>   	hdcp_work->srm = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, sizeof(*hdcp_work->srm), GFP_KERNEL);
>   
> @@ -602,9 +603,9 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
>   	return hdcp_work;
>   
>   fail_alloc_context:
> -	kfree(hdcp_work);
>   	kfree(hdcp_work->srm);
>   	kfree(hdcp_work->srm_temp);
> +	kfree(hdcp_work);
>   
>   	return NULL;
>   
