Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC797312D22
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Feb 2021 10:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhBHJUi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 8 Feb 2021 04:20:38 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com ([40.107.93.64]:28128
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231645AbhBHJSo (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Feb 2021 04:18:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZokSq9IwaLi3k/KhI97+tSFm45uzBzSMsUE5qw/YWet4LHkhAnWz3rMOYsZqmi+3vzSiIGOHdRTalxzJrYtZxvNo0Zsb5dHLS/x8ctBxXDJdcGOURWByTALpH7NfolgwtpppABwPwNCRF6rWEQzM0ZzQm5VuRmUh00kWLP1P0kMaY5qfAmM41cXhlomYNbFOVPXvVpzif5xUY31PsP9MlD1u9v0b5RoiEp8wTOfUp4+yNgtDZt8HgjKoJ4g8Gbz4qDJ5Vpu1scPbzhmfSH6+3EmGxJuaiG5XV9expginbAyddYVhyPQK7HjYcR+1Az1VUMRYBizv6vXVxizPv/k5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWVfSUTKsJG5C1zHxDTA2BWQYcQeGPbEXwBdARyRcV0=;
 b=ll+Ar5uwrXf3y1PJ2FAoHDNmzaQnuIv7xU71n5ZQCi2oTlLPKla5s/vJj41vi3bXv+dw/HmfWK4NcmZpSwsCafmu3BGvxDifMvEnCL++bjEt/cG4rT7KWlJHDcQAZkH2VQ8Teno7/0Y+dOn9oE9Kosj9vODJVRuEYfDmGLaz3plgEtaitUvaopedP3HbQIIiEeDxFCn+G9l4PmuUppXryCEFaINGZZ4jlJMqi/RtEuTfj3NEU+kXVboUfOW3D0sCnRUeyDz9tdd1F7DDMgiTrMxR0JTxysrxCDuVO4bFbyQ0c2hs/8UYdChC7mHFGcC74cYRFW4Atpar/Xq6bBYxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWVfSUTKsJG5C1zHxDTA2BWQYcQeGPbEXwBdARyRcV0=;
 b=qro6vju+trKxDdmdPZLjzSTy04sW5Dv7GNgq+9Xh6GRybEOyaEA1QihplQeuJeRRpAV0VdIGxXABsZUtpD9vfb6/wiS6F8bOvDyEbRvPU99KbVXz01Q8CPziXE/eCPEqkaTlQHYZaKAznmvx3wE28MQwJjhvg4ZJn181hJYUL/w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 8 Feb
 2021 09:17:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:17:48 +0000
Subject: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a
 int
To:     Colin King <colin.king@canonical.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
        Junwei Zhang <Jerry.Zhang@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210207230751.8576-1-colin.king@canonical.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
Date:   Mon, 8 Feb 2021 10:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210207230751.8576-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0111.eurprd05.prod.outlook.com
 (2603:10a6:207:2::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM3PR05CA0111.eurprd05.prod.outlook.com (2603:10a6:207:2::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:17:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c6a72df-7bdc-4fe8-99dd-08d8cc126702
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551D7C5F3C1F8971DC26874838F9@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1La6OMCbVDdhYVxBL2jLLeuRQtm3WCiLgtmyqzRe0luBs48Q4q30FLuHzVyGGIOx2qFJOJ5a0RG97ABaOto2wnfOOM8SuiSfPySwO0k4RuTiZ3FD9Gtwd+WSR78cUl5ZX63uyQgV2zSz4ncaSnzdgYyFbnLMC1n8VsJ0X63SCtpI/jin/QBq9KiD6Ew383gQkGxXUjwoJomOomD7FXi8nBq6ZEp+iQ4xNDU9wh1oLHdfH8sQKGtxLHiPDuCfkz6wOb3EflpFU06vEhzYmRaIqUj/LUqch06LQEV0xUJhoFzulSftEDVUwkhBM81SNJ49KrylJzwYmDQ2GjZvpY7UzqSzKo/BU/Rdww0DlOddIojxO6ky6m+LpPMHS1pPjDzDztspIT6lztVw14TKZYQp8XHe8EpsEvRR3OVUT8s/xB+uLlvIhwT+zMGUDLeW+2/qHmuNcIj1sb54XzGoDiIjIWoruq4E/GwrL3v40aZC9fqLiHQF2kRxIBCdjWKrws+a/WkgQtuYy4CnumuLE7gwzrp1aRoy25LaeIEXhjE3O9O1waYEWVUhprMQB0/2GC9psKogwPol28XhedFmSJ//I17dbcsMrlD3WJSvyHcl0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(5660300002)(66946007)(31686004)(52116002)(4326008)(36756003)(66476007)(66556008)(110136005)(6486002)(2906002)(316002)(186003)(16526019)(8936002)(31696002)(8676002)(478600001)(6666004)(86362001)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SVdTVWU5cXVuaG9YSU9kVm1aUUgvL0dybldTV2V5SS8zemdHalpqam8vR0V5?=
 =?utf-8?B?N2VXYlo2WDA4ZktZTm0yMERMUzFJUWltKzJ4bjJYMFlRb2RnVlZEU2tKZ1Zh?=
 =?utf-8?B?QVlVcHdaemRSKzJZWEVUV3RnZ0UvN2dZcnpuMTdISnFzL1luYi9DL1c2ZzVK?=
 =?utf-8?B?aWdEaHk5MXg1OWpnMEs2UmlSYzNNRE9zK2VvK200VUdscDBqbU1yUFBvUkxS?=
 =?utf-8?B?YlJiMTlCano2WSsvZURxZ0djRUVTQ0haOW5nRjJad1ZETlV2bTFFblNJVTk1?=
 =?utf-8?B?TDF6VDRaaTFyQUV6UmFmVlZBLzNrWm9STENSWnU3UmpRajFraGo0WUFOL2pv?=
 =?utf-8?B?VlFSeXNDZExFbkY4SjZ2eGN5Q0wrMkhHWG1oY2dhRDFPUWdBQ1Fua2FDUlJ2?=
 =?utf-8?B?Zm80MkUyRkNmODFkbXZsYWRQWS9pN2tnOFVhQlZmUEFKZ3FrZlliREFobXlH?=
 =?utf-8?B?RTd3R0JPOHRnVVRDd3pmbFdYSnJGVUtZeDJ4V0RxYnpMbTVBcXQzWmljQXF0?=
 =?utf-8?B?MmZuUHpRbmVvcCtxb0x3cnlXd0dYaWU2a3htbFpxTjFkTFA1MHVGdGM5WW81?=
 =?utf-8?B?TU9RRXA3S204SDZJS3BQYndsRVZUdHcyaHI3cWZadHpoblJ2akFvY0JybnFV?=
 =?utf-8?B?NGdmSHJiVkZUVVQrNFhtRER2aUxBZ0hLRkkrMWtLTkdWQVhBSi92RWg4RDBX?=
 =?utf-8?B?NGVVUVZadjVudGwvMjVJSUlqOTRlZWlZaGJUUkdpWWNMbS9iTEVYT3JSeitx?=
 =?utf-8?B?enhhTzFRV25ZOWp0UEtGOW1GM3d1dFovOTVXU1BJbG4vbjRhRWQ1ZzVYemRB?=
 =?utf-8?B?N21MSHp0T1B1dnJVYmJnTFRYSUlRSmtqNWlVV3dlQ1I1Y29xSkhZR2hXYXVG?=
 =?utf-8?B?ZFZsSTN1WGROcWgyREw1eSttZGJtQU9PeUdTdG5UVHFscE9jSVFqdTdqTVd2?=
 =?utf-8?B?cyt6c2xZWGFjWVdPVy9ISy9QL2I5Q1FUaDhtUStPQTVYdG5xRnBvYUMzMUdl?=
 =?utf-8?B?K1VZVEJ2dEhuSXcwZlJnUlcyL1dSVG1vY2Nkdm8xTGR6U0NoRmswbHA4TVdo?=
 =?utf-8?B?dVBoQ0NYY3JHTGdsK1BYUEdzcURJWHZCcThOMnlOcEx0ZERFNDlyVUVuR0lk?=
 =?utf-8?B?UmMzUlpyYUtIdTRaeXo0Vit2MEZRWXdaRVhRcVkxVkxPeFlaL2QrODgycVpN?=
 =?utf-8?B?VC9uTnhpUE1HdURQcEpRNjVCWTZQNW9kMm80QWh0SHFlTjErbDB5Mms1MzFQ?=
 =?utf-8?B?MDQrRnF0THZNU0hibGdoZ3hVNm9mREpmNm91WGtHUnNhc1h3WDdKZDBLVDcy?=
 =?utf-8?B?clpMV2xDWmZmdWdsZEdoRVhzdEJEbU9raENHZzhtU0dwSlBLMXFEVEdPRERC?=
 =?utf-8?B?R0w1ZGEyRC8zSnpyNGpLbzRoeGQ4dFFxa25ZVVRCWEJGdzhZOXhVWWVzc2tp?=
 =?utf-8?B?ajh2K3NobEh0dmQ1aE96eUwxZk5heFhKZjJMRm5CYXpKcWV4NEFkVkdBMmJR?=
 =?utf-8?B?VmlKUmxuTFova0tKL0g1dHhuU0lwbXQ3K2RISmswVzhvcS9ZZTRrTURpdXVN?=
 =?utf-8?B?OVdnOFZST3BzRjlsanBxU1pHSjNuSmZYRGhYOVRjVE11QjB0RW9qekRVOUZU?=
 =?utf-8?B?czE2K3l1Mys1NXpjcEdrYXNyalFRK3pZRFJTMklhYkVKMVRpcUUyakFQR0k0?=
 =?utf-8?B?L2JsYi92dlFGdDBOT0J5M3kxMnZkWGRtRE9Pd0lQOEp1K3AxTkIzR3Q1Y05X?=
 =?utf-8?B?ek9qRldvY1dDZ09wNzBaZXJ0cGh0RXczV0tWQkJDQ01mWHV3TExrSEFyN1ZH?=
 =?utf-8?B?WXFGWXdwM2ZpNnJPamNQTENDSThrbzVaekNwR2pNQytOYWM3Ni9VYWwxbW1s?=
 =?utf-8?Q?6iFb6GlNvjZ2a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6a72df-7bdc-4fe8-99dd-08d8cc126702
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:17:48.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUP5/hnNJQ1SC+NeP5cAPR2kV7mk8RzHfkQO5YOtLWF/eOyIQTnA7DkxQvQclavz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 08.02.21 um 00:07 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The left shift of int 32 bit integer constant 1 is evaluated using 32
> bit arithmetic and then assigned to an unsigned 64 bit integer. In the
> case where *frag is 32 or more this can lead to an oveflow.  Avoid this
> by shifting 1ULL.

Well that can't happen. Take a look at the code in that function:

>                 max_frag = 31;
...
>         if (*frag >= max_frag) {
>                 *frag = max_frag;
>                 *frag_end = end & ~((1ULL << max_frag) - 1);
>         } else {
>                 *frag_end = start + (1 << *frag);
>         }

But I'm fine with applying the patch if it silences your warning.

Regards,
Christian.

>
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge page handling")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9d19078246c8..53a925600510 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_update_params *params,
>   		*frag = max_frag;
>   		*frag_end = end & ~((1ULL << max_frag) - 1);
>   	} else {
> -		*frag_end = start + (1 << *frag);
> +		*frag_end = start + (1ULL << *frag);
>   	}
>   }
>   

