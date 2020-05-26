Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A61D719FA0C
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Apr 2020 18:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbgDFQXF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Apr 2020 12:23:05 -0400
Received: from mail-co1nam11on2043.outbound.protection.outlook.com ([40.107.220.43]:44000
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728921AbgDFQXE (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Apr 2020 12:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPltItHwHEM1RQhzDgZpuZpXNzMfUoNeuEOeA0CKGmAfs5cRzCylBrUNbf2S+IQS4wFLzpnNc7ON3OJa4RlPM39PrBvjFtLUx+h1Z1rDyUY2cOjZTcNK5YXdKyL1WJLz1SxgOVJ3P5gSYS4R9CzfiMhHoAFEfr0qs43i4xuHhQoNQvnwxBipwHJ00tYXE9Q3BXtwmLtLPiPeFUNTIjyZtq2UrJMjRWeEDHJ0dRiClJVwIl7Dwvz15XjQIwBCOT7YVt5NDzW3mgMMtnUWIPZhCk0N+NXRWBN8bEmp0ZT7U7PDMxko/AlMk3k+KfvcJzjq+9QV5W5WwN3IJx9BYf37aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+b4xn3UnB1cRcN5bHicB/Rr+KIfYutiUnamdhvAlj0=;
 b=cPYQ6d4H8lPpDKtdsfH0DgrbYTWsZd2OAIP83Esa5lRDvS10s8Ok2mjJk19/6Xh41qFtIklE4bEjnzsGX5lRl2dmfIaaQRRi0ScAqQDYn3lmSrQREDTfTmSd9ojeq7MvNqJuxeV7PCZin6BKA87aWyWaL7LdHi6tXNQQc6G/pGs7bZXPPV7uujW40fUyApdM14Kj5hYHGodv18FUHivQgYZmsOGPo91K7HH+Wuyvs6oQrfe5HB3w0Erge6p9ORoGmb+qj7ZH1FWxBvNQBlPSiEl/d/wUkPqRwN+ObqGzWfRGiE8qADt9RN79ZWRD5k2KXd6KL9iPo+Y35/Hf7n3L1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+b4xn3UnB1cRcN5bHicB/Rr+KIfYutiUnamdhvAlj0=;
 b=Tf68/t5cJKBD0TqJc/etzucvKTxFCRpgq3kxMl9/0+1RBEzRtlxwlMOWIoIk/UOYOCCCkE/AiaHDIqhDCsPf5Q3zn4D+syzNcUQj+9S1vNQYX10aPfMxATSYvk5dXRO23R8U/fBI2aMzmVu9v1kAhLXC7m2icN0GQcFkkzq0+ZY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3382.namprd12.prod.outlook.com (2603:10b6:a03:a9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Mon, 6 Apr
 2020 16:22:58 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d%5]) with mapi id 15.20.2835.023; Mon, 6 Apr 2020
 16:22:58 +0000
Subject: Re: [PATCH net-next] drm/amd/display: Fix link_detect_sink()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Melissa Wen <melissa.srw@gmail.com>
Cc:     "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        kernel-janitors@vger.kernel.org, Chris Park <Chris.Park@amd.com>,
        Zhan Liu <Zhan.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Wenjing Liu <Wenjing.Liu@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
        Nikola Cornij <nikola.cornij@amd.com>,
        David Airlie <airlied@linux.ie>, Lucy Li <lucy.li@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Galiffi <David.Galiffi@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>
References: <20200406091910.GA5405@mwanda>
From:   "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <7ab9e9de-8d78-7f63-f2b3-c1e9669faa6d@amd.com>
Date:   Mon, 6 Apr 2020 12:22:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200406091910.GA5405@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::40) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Mon, 6 Apr 2020 16:22:54 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27456643-5e0b-408d-449d-08d7da46c491
X-MS-TrafficTypeDiagnostic: BYAPR12MB3382:|BYAPR12MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3382BDBE55F2B174282620FCECC20@BYAPR12MB3382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3560.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(956004)(52116002)(6666004)(316002)(66946007)(2616005)(8676002)(31686004)(26005)(66556008)(66476007)(54906003)(16576012)(110136005)(16526019)(186003)(53546011)(81156014)(8936002)(4326008)(478600001)(31696002)(81166006)(86362001)(2906002)(5660300002)(36756003)(6486002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubq8aqPFJASppfpTnjch3zYP37biumgi3e7mYpYEhxU5GV2UpE2BxOd20OKhdVxG3WZYnCYh23nAC/R3jmW32Csn0JFo/d9Q4lqIM23clwMPmDkP8DAecAKjMm633lEY9ps3LRFjUi3UNDRhCbC6Kp9IEJjHr8zlBIGP7lasfzCgjtwDGijbJN1QZhfsC37aVKu4QTII40fdU6tTsCK/mTh9zhHOPW90HLlzw4g2AGanPdmy84IvkjWKwVKRUWcvasqBTHSKsXsY/dDhApDEKOYcOV9LO3BhDuFJFz7zikS5xgzuHR+26QBXXkT2rPtdBGm+Sh1wJKZJUweb7TWWnp/tbDzsy3kBFnuVeTB61WNM65+JNNNsgbMz3MpXy+8HM28CbAL0aa3ymBVZJnBpEesIPQuyqtUY/5G0WQj7wzSQktcfBYvq35Abp5vzSsT+
X-MS-Exchange-AntiSpam-MessageData: nYSFGdDcuJSkMNAVXyMwlazyWHs4GVk+SMwGXIvG5yAVn1QhLZZhf3juqID+9MPnYAoLmemm7JPFPgvINqRTOuF92tlsCAjTSSN/ADmInrENldAtSuRgcjlgqFIt9qN0q8/fI46o1QiT4oGTtQyl7w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27456643-5e0b-408d-449d-08d7da46c491
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2020 16:22:58.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtofpBfBJ31OrsRzboNu2WouXSu6LmX8+rjrw01hXnGRfskseEF/xRZS+sIjyuCM0vdBM61BHnp2fBQjKshlcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3382
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2020-04-06 5:19 a.m., Dan Carpenter wrote:
> This TODO stub originally had curly braces but we deleted them as part
> of a clean up.  Unfortunately that changes the behavior of the code
> because now the switch statement is part of the if statement.  Smatch
> complains that the indenting doesn't make sense.
> 
>      drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:425
>      link_detect_sink() warn: if statement not indented
> 
> Also I changed "ZAZTODO" to just "TODO".  The ZAZ isn't used anywhere
> else.
> 
> Fixes: 621514aa4140 ("drm/amd/display: codestyle cleanup on dc_link file until detect_dp func")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'd prefer just dropping the block, but either method is:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Since that previous patch broke most sink detection...

Regards,
Nicholas Kazlauskas

> ---
> Another idea is we should just delete this stub.  Stub code is generally
> against kernel style.  I can send a V2 if people want.
> 
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index a93997ff0419..188670d374a3 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -423,7 +423,7 @@ static enum signal_type link_detect_sink(struct dc_link *link,
>   
>   	/* PCIE detects the actual connector on add-on board */
>   	if (link->link_id.id == CONNECTOR_ID_PCIE)
> -		/* ZAZTODO implement PCIE add-on card detection */
> +		; /* TODO implement PCIE add-on card detection */
>   
>   	switch (link->link_id.id) {
>   	case CONNECTOR_ID_HDMI_TYPE_A: {
> 

