Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3847D36875B
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Apr 2021 21:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbhDVTnZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Apr 2021 15:43:25 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com ([40.107.236.78]:28960
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236668AbhDVTnZ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Apr 2021 15:43:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmSk6xGxJgnffT4Luo5YAeRjm7Q3M8nldmnZCt/FwP75NCvIGlce2y7c2m8Yqm4QOWD6bLLhqcn/jdTpYxfTr31bAYlOZODTBueGzZRBVSZ1EsNMUhbseUHFCyCw7sFrZAJONEhRq0gw244nfoPsGSqhZNWCYBcoVWHkZbHBDdBl2aUDFQc1f99vMFGaUGaPgdL1SqhOezJW4GxJWkSH+v3kCHgVnf7F8C6vOqY50YIfVjG0Cs2RVeWjmFD0GuWaVMSrY6rIr37cIhHmj5DNEkcCzdGHuK/bHrnewAzs+hci4I5cd/Fhzlje2Vi20O2MtMPn3YvV2wlPobNwRaPNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mBn2kdwmixhmUvKKlN+XMbk5KpwqYHTNAoX16Cxq4Q=;
 b=X2PP/HbnU3BOMOG1OTwzU5ORxTulGujlQaKOAsyt+Iaus9cC4Dl3EJRwqrrCObRuB1yhJy1/tu/HtM55+7JFLE8xpSqvnbd3NcBuP/nail70wOhoSTFpVezT6vO/RC4vUF9U18m58pAtR0SoRLgNK6AZeTLNi0sAQ4QhhJHtw/21yLUhHLnl5pFPit1w/9YDLfgAw/JipfFHGLMVTi5b36+d771cxID6MsvQxqwnqvVwiQlNrlZ/DhtQCPpCSKQv68wbyJc5dy7/MQvOt/N8EnwtYuvkHUoYLYJjJrZvn2zklyJGFlk/rxBr68RyND4RgE67dYqDKsUSYHjbEYuJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mBn2kdwmixhmUvKKlN+XMbk5KpwqYHTNAoX16Cxq4Q=;
 b=Nx6RcfcDmjk9wGdF6lXK6xMhwc/7K9UQdK+Tj1CQZCHqCb/TkERYhfZtGCV3DvFIaC56lVG7E3fBtIJ0MM9PaMfSreEhJbuWkiwq8s8QoLrNy9OlbCQDxX4kCWulcctlnu0usf5WpJvJNWaEZsJnUyjuL/MkjY8H2BDB7zpm6pI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2484.namprd12.prod.outlook.com (2603:10b6:207:4e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 22 Apr
 2021 19:42:48 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 19:42:48 +0000
Subject: Re: [PATCH][next] drm/amdkfd: fix uint32 variable compared to less
 than zero
To:     Colin King <colin.king@canonical.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Sierra <alex.sierra@amd.com>,
        Philip Yang <Philip.Yang@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210422123158.247332-1-colin.king@canonical.com>
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ec8393c8-f980-cb56-6b7e-c2c5f29fca78@amd.com>
Date:   Thu, 22 Apr 2021 15:42:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210422123158.247332-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::23) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24 via Frontend Transport; Thu, 22 Apr 2021 19:42:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68e0ba3e-3952-4a38-6a71-08d905c6ce9d
X-MS-TrafficTypeDiagnostic: BL0PR12MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2484E291C1EB93E05D38675292469@BL0PR12MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZiKzg3KXB3CXmkH9/8WlZKL0sys2Uu4N1UZMuDDdIZUukzFvn9N9h8YRKKDXOEKPa9fluFWEZNxFtZg9NLt5l20yAZ9Y5fQ0Na6dmx2OoYk18KXuyWu9fZCPOW+vC+WR1qRnJILXYXfrkapeK2J03FulRKouN+MJj/4cZsq18IP9CpAlDeLS9WDoyocalgTyGVYFUqbhhKgZfjrSISCl1BO8+PWp8EpM6p4RCU1wR3BeS4W2OQo9zibooW/Wj+1ewtoZuarXOZLoZOoWmQ7uXmkCitHqt6nT7gIq2jDpw6lP7UQXNYWWNwiJAsacRy1hEz9Wf8eP2w3ldxE1o1/EEZZP/uotDXaXm2e2NtVZ8HwBHzVMfUDW7F4OsHARYXhqcp7cLWsio1JFCASnuLqcSpsvYqPkwJfERKa6oNw8LEQviC6V5tEJw78jdNLz59VUZsInHySUE1xLAC58LyM0y1gQRaPm12Y9A3iP4A8ju15XSU6L1H+sl5e9u7YK87gH7CQVGOWO/dN5clrbPIUxQD0cj8YmPt7z4ZUVOMieSrKsRRokcrXZ9BP+FtWo9Wku3LJ+xIfVQHU6gVMOTkJPH9nHxh/aMeFY0A+/oNvNWa1LCVFexvhhNAJZZ0nfs7/EqlcZqM8/F07rd/lYQ8ZDIN3ST9NOX5nj5z43bbbtLO5ypV9fH5szKmk7wY1BE+bf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39850400004)(136003)(66946007)(31696002)(6486002)(110136005)(31686004)(66556008)(8936002)(4326008)(956004)(36756003)(66476007)(186003)(2906002)(478600001)(38100700002)(5660300002)(8676002)(86362001)(2616005)(83380400001)(16576012)(16526019)(316002)(44832011)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aUorSXpaZ21DU2xFR2hqZkpUVTBXR3lGQTFkQ1pNczVySWZjOUsxTTM0SzJ0?=
 =?utf-8?B?VmY1b29RSDZJN3VyNTlQMEN3VVJTemxXYkd6SVZIUUhsRW1PVmJHeVhPMmdP?=
 =?utf-8?B?QTNhQXI4S0FaVlpXd2RtYXo2TkRta1czVStGTjFLdy9hN2VUdnNKTHN2bEt2?=
 =?utf-8?B?V1VLSFFnWnBocFRnL0I3ZGpTdnRjSFJRa2Zvd2FOUDFZaTBMbFJNSGF5Z091?=
 =?utf-8?B?SGhWeUg0UEsvb0VZeE4vdVkrQVQyd1hnaHRlVnRmalplSGdFdTkzQi9wWENQ?=
 =?utf-8?B?R0RsU1crd1NCUVlOV0hSVmI2WitBSnR5cmo5UU5mK2NLQ1J1SFFmRjJEOWc2?=
 =?utf-8?B?ejlkd0ZuUHdsK3Z2UVY5TURPeGlYQWxSNVNFNjVOUjN5Q2x2akdpSWNqeHZv?=
 =?utf-8?B?RmZYSURWT2lJZDF6RHRTQkJjZWExbVZ5OFRuRHdHRGFOa3RHbXRuUEd5V2lq?=
 =?utf-8?B?U0dzejNnV2F1N0tRM0hYZ3EwK0NoN0NtUEM5YTFGZHFhOE1KVFFERUFlSVp5?=
 =?utf-8?B?eVlQUjFhbzNTUm8rSFZLQWhKdEJuYXEzZlJGZ2pQVnU1VXV2UVNjU2xCQlRK?=
 =?utf-8?B?L0s2a0V6akRrMENHWE15QjZpS1hYczBsa2ppWnZjVHBlWDVjcVZkZ2QzeXVS?=
 =?utf-8?B?cjdxWmVtR2MzM1hNT0EwMEZCRElPVDhzZnJWdzQxa25YK1B0Q2lGVzFmZU9m?=
 =?utf-8?B?WGpXRUpHZzRwRzAxUERRZnAvTnVBS0NlTTMvOWxoZ3Vqenk0Z1A0MlN5TGF3?=
 =?utf-8?B?T0U5bU1PYWREVnNaOUthdXZvU1RUb3ZJWUg3Zm1LaHNTSjNoQkRlcHYxZXZS?=
 =?utf-8?B?emhMdWZxZHpjTGwrTkJ1THoxZUtheWpZK2pWV3FKM29Lc1Y0VUV0VEN5cXZP?=
 =?utf-8?B?R0puZGhMcjJpU3lWR2IxbkVsaU9ia2paVTBOMENha2VFbzNIdFc3NVRhR3V1?=
 =?utf-8?B?NDVNYjhhR3A1dE81azVCZUMxVEEvcy9DTkJGNHdHT3FXa2ZteUFjWnNGWDNP?=
 =?utf-8?B?bE9WWFNVU0p6UzE1ejdWZlNNNVZnNUtaay9hOHJCOWRuLzRqUS83VDdiTllS?=
 =?utf-8?B?d3JvQ2JtSFc1VmR1SXNEdDNhajMzZktqU0h6RVJVOWNFZENxaW5OaHRVWG1z?=
 =?utf-8?B?bDR0NHpjNG01REdCRFFRbEJWdFMzeHc0YzZJbWg0S0JzL0ZEYzdmbzJ3UU9E?=
 =?utf-8?B?WGY4cy8wakJCaFprZzdRdGdrUklCeUV4MW9JZ0FKYVZlSDNxQkI0RXo2cWRy?=
 =?utf-8?B?Yi9PRzRySlQ4aVVYanFVODV3SzZ5Y3pMRllSNG03Zk5HZFRybmRFRFg1WHVS?=
 =?utf-8?B?M2ZMcnR1SXgxSDJFMmZJQ1l3clBTLzdWWHY0OWloWVlaZEVHRmhKTVpJRk93?=
 =?utf-8?B?aFh0cUlvTUpjQ3NNalRvRzdFb1Z3a2dqNVVFaVUrbldvZFBqcmR0SkprNCtS?=
 =?utf-8?B?SDQ0RDhCZmtraWxsVHNhLzcxZ1hrem1GZ0tNTm5tckxCaDZIdE05dFRLUFNk?=
 =?utf-8?B?Q1hIOW5XOGEwTUdzUUZabTZSVmVWcEJGNXNRTmR2YXpidlRIU0lWc0E4ZDNH?=
 =?utf-8?B?dXdaL1NpVFZSUlNveGdzZlVSNm5KYTMrQVpnWFFpV2MrVFZBNEtQZDh6RVRE?=
 =?utf-8?B?aE1sbjhqcmd2T2hlOGtjUUNiQjRqWFFMcDNUdzlHRUVqNnI5Wms2ZUFTV2ZF?=
 =?utf-8?B?c0VWZnpOK1J5a0pqWVgreHNhVS9jRlVhRnk2c1ZqVmRVeWw0RUFjRWJoLzFB?=
 =?utf-8?Q?oB4uB/iCGFH3drCv4CclV5nOPkoaMUgRMaa+EZQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e0ba3e-3952-4a38-6a71-08d905c6ce9d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 19:42:48.1744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFvAToNkLj+iGcvd4YLT1G+5q9uc5qVXtBhQPC/r5MlsBj2qHJt3BLKOYxiIrCUlHCl4zgEfUEJL+ZzjM/eupQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2484
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 2021-04-22 um 8:31 a.m. schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the call to kfd_process_gpuidx_from_gpuid is returning an
> int value and this is being assigned to a uint32_t variable gpuidx
> and this is being checked for a negative error return which is always
> going to be false. Fix this by making gpuidx an int32_t. This makes
> gpuidx also type consistent with the use of gpuidx from the callers.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: cda0f85bfa5e ("drm/amdkfd: refine migration policy with xnack on")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to amd-staging-drm-next.

Thanks,
  Felix


> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 0e0b4ffd20ab..bf3c8de85b4a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1330,7 +1330,7 @@ static void svm_range_unreserve_bos(struct svm_validate_context *ctx)
>   */
>  static int svm_range_validate_and_map(struct mm_struct *mm,
>  				      struct svm_range *prange,
> -				      uint32_t gpuidx, bool intr, bool wait)
> +				      int32_t gpuidx, bool intr, bool wait)
>  {
>  	struct svm_validate_context ctx;
>  	struct hmm_range *hmm_range;
