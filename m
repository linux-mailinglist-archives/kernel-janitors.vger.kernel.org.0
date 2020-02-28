Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 315D01737F2
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 14:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgB1NIy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 08:08:54 -0500
Received: from mail-bn8nam11on2055.outbound.protection.outlook.com ([40.107.236.55]:6177
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725876AbgB1NIy (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 08:08:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlRIW1rFKhCxDC9ghR+zzj5SbAAY6t4uOk1iNUkIYkxgUuY+a4WJqKc06SgWuPPmKab4ybf12GZoM8Eofgzx3hjQ8Sob20GW8ARFSC17d8zC/fjlYWQ5v9V5I1zYcw6TQUEvMBD8anUtb2KrJj+fEuvGONUoPdV+cZpbENJcxNXNtSCiLzCdX4jRJ6JkCsAjXN5/PpZ18fVBhxjNdB3NSGQUMDQxx403N8aRH1FPvIwJ4mva3qgXcuw0eyI1A9ta+fNyelTByhtFub7uzbN+RbA7LWWZZ1HZm741eAiAAA0gKLqwLT435U3BrlGnGoa13lbFfOzxwLOPy7WQ7o0T3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JC5msBKzXExikFXLPYANnI049Q9ZCoUvg++wbgdql0=;
 b=OrZXM7tOodpwDkvHS+C6eyfaV/js+DYmcOM+UdWnlz7XVxsoKJ8QelOZYvgxNuXVYYJuzp8k8eOZtzmtMs4PhAUmRWfrZzGB6/hvMdJ3YKjlx/M9Fr+PzdN8BtfJKpP4dVxE0fLQKGgYelzHglgNVMJwqE9v05qu+EW2BwwqdlaYbPS9PDV+u4TPg7iGbBcpP2Ykzu3bAngCeLRwPT9OcbbJZ5kbOYm5kRtIYrFxKKl/udjd6Q4uXWHOyH5ff8rL9ceCaybxoNfrhlzGzHh7v5iHV+pK/snU34DW37dlXyQh5XgNseoqDkqYiu1Vs70v6fPR9E8hgNd7ia/1s/HDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JC5msBKzXExikFXLPYANnI049Q9ZCoUvg++wbgdql0=;
 b=1UlFuXdSZC/sJCQHtIkVSewyUVDlc5TLPScKvf+lopdvmZt5fZHPSv4p2FHmZE0xwU1lK2dOCR7P3+rXXbA2+L0MpzxIa0y05Z9j7Oi3mSH9v99uB7culffPseHAAJBkQvgUW/+CsRn87Xkb3jM2i8VXsQ+zDDI4a5f0cEx8W78=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3319.namprd12.prod.outlook.com (2603:10b6:a03:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 28 Feb
 2020 13:08:51 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5f8:d155:b213:ef50]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5f8:d155:b213:ef50%3]) with mapi id 15.20.2750.024; Fri, 28 Feb 2020
 13:08:51 +0000
Subject: Re: [PATCH v2] drm/amd/display: Fix dmub_psr_destroy()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Wyatt Wood <wyatt.wood@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200228105833.2jdsy7sxpeoo3lvy@kili.mountain>
From:   "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <e425f3fd-a517-c10b-aab4-05d8315983de@amd.com>
Date:   Fri, 28 Feb 2020 08:08:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200228105833.2jdsy7sxpeoo3lvy@kili.mountain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::23) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.1.94] (165.204.55.250) by YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18 via Frontend Transport; Fri, 28 Feb 2020 13:08:50 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9dec5fc-d4e2-4a0c-51b6-08d7bc4f5ae7
X-MS-TrafficTypeDiagnostic: BYAPR12MB3319:|BYAPR12MB3319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3319EA55F8FC8C2B578874AAECE80@BYAPR12MB3319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0327618309
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(189003)(199004)(31686004)(5660300002)(4744005)(8936002)(6636002)(66476007)(66556008)(86362001)(66946007)(52116002)(6666004)(31696002)(2906002)(4326008)(2616005)(316002)(16576012)(54906003)(36756003)(110136005)(956004)(81156014)(8676002)(81166006)(6486002)(16526019)(478600001)(26005)(53546011)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3319;H:BYAPR12MB3560.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bYhPseu15iKQqsGD9woDZF0LaX7IxJzC4w+FEFBv3HvVrO/Cp4sSLSWYZl1i8EDICGM0F2HmxBSn8weQsV3PGnNUqhnNRbFk1AwjqS2um6ut5HWDPgKEHUN8OcHiqIgy3TjfMqt5WTW4BC2hEYbGnhWJXH23eP+BE/PlWGaoD1W96J5NLerNlQK5D6QivkmIHh2WOdG9gSKNhF6UyL1EkAsB3mafsY2ObR3IieYWOhZI89ADAKAozxEg3O72d/74JboleSKShqTjDdkD1hg4aQo5GNERzDKgkZrcx4Fkv82FTO5Lz4EwZD9hp18CkKvuN6UVoJTPN32DRxc3/1qW7Z1iZyTb9Iqlp+x6ze65nLXUg0BaOCuPsELlmRps/dpA0+mAb1/X+DtXGaByA0SOZYl+gK3Uvsr7DCJ+T34T/dLxm4aAXuzvrRz2AY5mZWdR
X-MS-Exchange-AntiSpam-MessageData: TEaXxbUn/2d509FV9e1+gB3PFYEXR1Em9031t0pFp0erqz1qCOlbw6u5PPfVRTeWfsbk8Zu6J895MTneE1lNF6gMJZOD2fqkCIdeeVchPkVGBcF3wGj7wKP9upYxiNrpP7Z146GLwLq2KL+EjJStxg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dec5fc-d4e2-4a0c-51b6-08d7bc4f5ae7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2020 13:08:51.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svSBld8TmNBGX4uaWrhD+AjwVoduH+CHAVJlQLb19SWRVmKyyBUeRsboiRjdxI/wDQ/6QQ9DtQEvqlSFn6SBKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3319
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020-02-28 5:58 a.m., Dan Carpenter wrote:
> This is freeing the wrong variable so it will crash.  It should be
> freeing "*dmub" instead of "dmub".
> 
> Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 2c932c29f1f9..f0936cb3c056 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context *ctx)
>    */
>   void dmub_psr_destroy(struct dmub_psr **dmub)
>   {
> -	kfree(dmub);
> +	kfree(*dmub);
>   	*dmub = NULL;
>   }
> 

