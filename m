Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1D3478F47
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Dec 2021 16:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbhLQPN7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Dec 2021 10:13:59 -0500
Received: from mga09.intel.com ([134.134.136.24]:26061 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232151AbhLQPN6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Dec 2021 10:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639754038; x=1671290038;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zFMCLYfSFYT1RRews134Beb73o6GoN6IqunWfiJUsh0=;
  b=KCqgVux44ytfDZdZoA2nI/UxUHUuZhiZx0B1HJqOvENXJOjoi/QyBoK7
   P7LxqKUipaiWdVROixLlTBUdO8UZyNu/6RUds8R1rYRs8AV09f6n38XWq
   +XvXZ0TOwNeII30fKrfmNKWP1U9Y7OGFcISo66KJIXNtt6VEcrjevZHyo
   NN1X36Zc9I+3qIrURJAaje5As47E3W1zL+eUqryGktkFzTluiPAjyj2oz
   OPFZwKbE6NMmH3Ek4Y7EnFAhKE7oWng5c7aeQHFW1wYQpEG6ItwjcZ80R
   OPxJyANpT630hUaV1siVYnfeIOPckw+degN57bElYsIWmLsc81aZ7fD6F
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239580745"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="239580745"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 07:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="662865843"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2021 07:13:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 07:13:57 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 07:13:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 07:13:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 07:13:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYGaOKZ35i2sAcRdpvAfdzXILz3XlH80tWaRoGRj1xHAb2PfcD8nqKvKKL7L8ADuWDNyr/AkKeLUahj+wwiFdf4gdkN2dGjWCAxjONQEjHP9KJhfWlve9dgXtCRSY48Pokzn5DyIt8DUa2ZLtU459AdZ3eEGmI1CuK5O4Iiqdu1kDVcSP/fuotZFQVVJ1/T39Mx5l8GHKE0ENfnoi26Spe164xKLxxqP1Tzrw9DaB+EMKA1nU6zDQw1FDlPFY10PZAI7DMk88c4McQyzICBV+addxxnE8ZcpKZ3kXHoeFmMVb4g3idHnvwvLdZcidEh2oe6Rn9sQQVGq3cJsMxYxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkRqtexB13RavuhUF/4pix5mVqsNbQEJ6AnyouiWiW0=;
 b=dl9oqAwa6u+R6QUoP0Bzcsc85NNYG1+CJWt9b459IzPF1YL0HLzUX+7mM9hWNNWRwOkeaWD0z66PY3fkwiAHEIYEWLBfm2lLiLjPb9JCfPh2ojXhjLK22iVqRVmFHchi8VcjHfm/M69zHqsmz42zmjaZJtsLkKcB23hMmfRvNFrXp873Dqp8i+T7kQhwVqqsYK0/BWsF8gNO7MAw/bT3z54p5KsUUTIvWoIxtjDI4L9Zqt8qSbk4SzULNbOcW4dhGott/emuWKF0jWJ5bK8Yfb0he3OiquirSfwv3ScS+a0JTgeCpa7wF4X5S+Lq6KT7vmudx8DpfCxTdGTqS/jeww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB4036.namprd11.prod.outlook.com (2603:10b6:405:82::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 15:13:54 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 15:13:54 +0000
Message-ID: <a28f15cf-b8fe-3214-f353-1fe4565adb8b@intel.com>
Date:   Fri, 17 Dec 2021 16:13:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH] ASoC: qdsp6: fix a use after free bug in open()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>
CC:     <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <kernel-janitors@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <20211217150007.GB16611@kili>
From:   Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211217150007.GB16611@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::17) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eaaf7c4-f731-475c-b500-08d9c16fd708
X-MS-TrafficTypeDiagnostic: BN6PR11MB4036:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB403669AE69930CA105195D9DE3789@BN6PR11MB4036.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQspmuQknNGNDh/U+62ScDWO95UScW8VdLza1vt3Ksp3aX/QcMOMaL0nDzG6zxv6YHi2nJhA7U8Z2RxRq0mXFdJi5xgI2APkDhFkuvN+wDrcwINwcacALnZUd4oT+0s0FWZSZh1RMYFSGS5jkAggtnKjapUz7JJKsgiEnLffaUkIZjUKP/+MZo4w3rFqxiMT9ok5Q8xNeXrjK7X1H05T2yMwNBEoMytW1X3rtDjj2mxtwWCA3D02WOZ4kJJ0tm6mT1Cv7nJEHQgh/j1Dj4+rehRjQ55M+iPKvHC101sqgWY8IxergMoslF4gJCLUSFdBz6AehM6jJ2pKvtJXq+etz4bKDP2323L0snxzK/FpHV74R+vmSejO+uk2RiXgaL9rmiNaeRQS4NcGYnldfYFOlR6Khiz20gG5xke7Sk/Sdzt8GQuNWjJtaXTZD/txq55pTAw4NwQbYDLxDfZfHL3YGsySU/dBwOoCipSJQoEJfHPtHQNHDNDQxGvvAMz5ObqfP4oj9IwsZCUjT86z1p0eNfj9Jhoap8rLhkmaKzMwMqpu5qju9FWE9VvvwOBK8NcyHvUrn9BPjDTAiTwXFoGOvekFiDp2cuNv8yGH9uoos8YrN3EWZ4exZyjPYRHeyS1hzzRmbM/fmdQR1LtEQ6bfMLMuKRXgH/3rAJ0uC3D6JMxhupuw+um6M3Sv+o6qOMwwfjp7kg+VbTESQ6g3JwKCNP3mCzIxcPopnUFNngC0xIBK2+RrKiW6QyYP7qp77vNf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4049.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(36756003)(6666004)(4326008)(83380400001)(86362001)(186003)(31686004)(53546011)(5660300002)(31696002)(6506007)(2616005)(26005)(66556008)(8676002)(508600001)(8936002)(4001150100001)(66946007)(66476007)(6486002)(6512007)(38100700002)(110136005)(2906002)(7416002)(82960400001)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0k2ZUFhclEvekY0Q0hiWllIYkVJdyt3aDk3S0huM0oyZTkrRXBkcHFqazlT?=
 =?utf-8?B?cFcvU0JxdTUyUTRFaWZOc2VJdEw0NU42Tkl3K1FHNFZ1ZFJpMHRPVC93QmFF?=
 =?utf-8?B?dk1CaVFpSTBjR24yUndWM2ZmSWV1dk0wQ0ppS2JrdWh5YTh1LzBBd0l5aTRF?=
 =?utf-8?B?VGVlOUY4QjE5WHFmeGtKYnNWaHA0RFlpcGk4VkdPQmVWdWVBM1VZdzkxaG9l?=
 =?utf-8?B?SkRYR3ZaN095OVZuN1FEWXNnbEUvWTRMdnhpaTExa0VXY2N6d2o5UWEyclhY?=
 =?utf-8?B?djY2blRRcjFjRnFRT2xySVlETVA0bVN3eWtzbEFPMEdJYXVvUjdiZWtwMFZR?=
 =?utf-8?B?QU82a3ZRYVhTS3huck83ZHNyOHYvU005UVZPcVVjYURoWjNSSmNvMHlSbDRy?=
 =?utf-8?B?d2pDZFp0TVRJK1dKVTh6TXBhNitncHFHRUdTMWlWK2xvaENiN0dWRTlDRnZY?=
 =?utf-8?B?b1hrLzlhRERET1dPOW9ObnZIQkwxNGY4QXljam9Icm0wRysvWitnaDYyQ1RJ?=
 =?utf-8?B?Um0rUjhrVVN0WVZDYWJpbU5lS0gwZ3FtM0JZbnBoQ29wWnNRdUcyZWJqWkdD?=
 =?utf-8?B?dG9zNWR0ampmUFJ5SzhwYzdEUkFYR0NabkpPZ0NYYm5DQ1RQNm1ocndIVWJl?=
 =?utf-8?B?SnE3TktvTWtuMjV2U0w5OWRTV0NCdmpEN2hDYVF5bEVUM2JpekRYc0lWREJW?=
 =?utf-8?B?eXBJSkkybnBZV3ZUTUJjMzlCekFwamJOWVJmZHFPK0I2UGV2dW1UTnVqTi80?=
 =?utf-8?B?RjhXbkt3aVFva2lvNW1Qa3ZxTmR2RTRlVFdMUk5qbUdpZXMwWWV5ak5KNEUv?=
 =?utf-8?B?N1JXNVFSYlZrdVlVRVZRSjNweURmYU1BcUpjUFJGdmJVU3ZnZy9aRVdGK0xO?=
 =?utf-8?B?aEZFNUJzZmFnKy83UzBsdG5MbWFSTWhtaVpKN3o4NUZ5WlQyamtCdnFKN1pu?=
 =?utf-8?B?Z2J1ZEg3NzU2UUxkQllEWmZMZFJERXdSb1g3a1FXMW1jajZ2SFZvREVrY1Zl?=
 =?utf-8?B?ZmM1ajhEc1dCWUdFd3FHOVg3bUZuMVVINXN1SWhSM21FQTRNOGo4cWVYckJ1?=
 =?utf-8?B?aXptNW9PR2FCV1grK0F0ZmZiTm5zazZyTVF3M3dodWRreXQyUjhoKzNkdDBL?=
 =?utf-8?B?bjVVYXBjeTJ5OWdieExsMmF3ZDZCcWIxRWpmUGlxNVNqNUNjQTZFZHowOUlu?=
 =?utf-8?B?ZllZN093NFRPQ1Z5QS9DOFJ3OW5Kc2NFSGJodkhBL002VFNBbFZ5QUl6Q2Fp?=
 =?utf-8?B?cjJWWEdqakZ5Q1FpN1NudDJRbTFVYTFmNFJudXhGUnIycFFUcXYwQ2FVeWQ4?=
 =?utf-8?B?OHV6c1ZjdEJNME8wQ3UzdDdMdlVHNk1lWlVFTVllc0N2SVpPK05sQWtsYkJa?=
 =?utf-8?B?Nm5kYU5JdzE3aWVBZWgySlJsczFTYTRuV0lZNTkxU3B4a2ZZZmFUT0duUHJV?=
 =?utf-8?B?bGJ6alA4UHd4TURJeS8xUkgybTRrRmpkR0UweFpteTJRVkI0UUVITjh6OStR?=
 =?utf-8?B?SEs0b3JLcEc2c04zZ21Xejd3SWZaWGpSb1A5UDVjUTBsNkh4bUxVV1JRU2U4?=
 =?utf-8?B?NWNRVXFxTVV4UGVYblRyZmg0Zk0zVXJHQVVva3p6dHlpWmNNOUpyUjZlcVVm?=
 =?utf-8?B?aUV4SG1EcVlpNXdQbWZzWHI5MS9lbXg4SXUrUHJrZ05WalRISHBNcUxlVWNt?=
 =?utf-8?B?Qm12NzhvbTd4UEZmOE5rci9tNjBEWGlmYzNYVDRUc1R3YnVUWHd6SFZoVFdK?=
 =?utf-8?B?aGR4MGVxUWNURDFSZGxkYlJvUyszU0d0YnRkZEs4S1U0ZXdNd0tZU3ljS01o?=
 =?utf-8?B?SjBVR3JBZ0d4UXZKcitia0NBMEJhbmUwcFVVbTlENXdhRU4zb3RINUxEWlNU?=
 =?utf-8?B?VndKdEcxUFZXUjVTd2lub3Z6RUlFMmxkWGtsS1hYNVNVZ011WVZqWHJ2SDhw?=
 =?utf-8?B?VkpzYjVsTGxJNjRpK0xsSWdQMnRhWTIwTlRUTDhMV3hWd2d2Z2JJdE1sRXY0?=
 =?utf-8?B?bUpFV3FTU3h2cjRBWnpKZWdrTmRaQlFocVhUenJ6cWZDQjNaVlJwZWs5bEhn?=
 =?utf-8?B?Z3RvOXRxUllhS3JiMWN1MFJJRnpzOWJreGxMNzFkeTVsaDJ5NWJsNUZOQUg4?=
 =?utf-8?B?Rm04OEJVQm0yVE9KdXhTUHJBejduRzBmZHQrdzhKTjRkU29qRWNJN2loYjdx?=
 =?utf-8?B?eHNEZXFGSmQwMUI0NzR3VGFYTFZxR3FpWWF1Qk1QTUE5a0MzQ2NmNnVaN0lU?=
 =?utf-8?Q?VtxRT0pHQjzzOHeFLyhCbeJjNpU770/vIzpubP/wvk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaaf7c4-f731-475c-b500-08d9c16fd708
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 15:13:54.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8jFu2z3w+MEo0Wx2eFvi8EjFF6HpT8FYkkBxQMXabNetJUFrlMwV59z6R0AiBEqppy95o1C3biAHdKvGi59vEiRQFXg7ZfN20m007HEp60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4036
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021-12-17 4:00 PM, Dan Carpenter wrote:
> This code frees "graph" and then dereferences to save the error code.
> Save the error code first and then use gotos to unwind the allocation.
> 
> Fixes: 59716aa3f976 ("ASoC: qdsp6: Fix an IS_ERR() vs NULL bug")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   sound/soc/qcom/qdsp6/q6apm.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 3e007d609a9b..f424d7aa389a 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -615,7 +615,7 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
>   	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
>   	if (!graph) {
>   		ret = -ENOMEM;
> -		goto err;
> +		goto put_ar_graph;
>   	}
>   
>   	graph->apm = apm;
> @@ -631,13 +631,15 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
>   
>   	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
>   	if (IS_ERR(graph->port)) {
> -		kfree(graph);
>   		ret = PTR_ERR(graph->port);
> -		goto err;
> +		goto free_graph;
>   	}
>   
>   	return graph;
> -err:
> +
> +free_graph:
> +	kfree(graph);
> +put_ar_graph:

Hello Dan,

The patch looks good! My only suggestion is a readability improvement, 
but I'm unaware of the convention chosen for qcom directory so you may 
choose to ignore it:

Function q6apm_graph_open() has two separate return paths: a happy path 
ending in 'return graph' and an error path which eventually ends with 
'return ERR_PTR(ret)'. Current goto label-naming convention suggests 
it's a happy path nonetheless.

s/free_graph/err_alloc_port/ and s/put_ar_graph/err_alloc_graph/ tells 
reader upfront that they are in the error path.


Regards,
Czarek

>   	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
>   	return ERR_PTR(ret);
>   }
> 
