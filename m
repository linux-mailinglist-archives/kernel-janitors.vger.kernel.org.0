Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328147BE493
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Oct 2023 17:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376462AbjJIPWJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Oct 2023 11:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376537AbjJIPWI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Oct 2023 11:22:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969D6B7;
        Mon,  9 Oct 2023 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864925; x=1728400925;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sEofFecSmaDF37OJ7ccOL4SO9sql8clgD5YpkI04CzM=;
  b=Qg37AGhP29FcW2QlO34/kPjzObEZ6UAMGO/TpiNIUi9TuNGZt8wWvr5b
   mT/ywyBEPUPe/aBrvaHO7qd5zZhu+k8TfzTI2wCECvO02CPc0R2agn6r0
   JQhsxqSJd6fY+dZy6c08LJDWtDc4lBeQhFhRenUviWVPG8dKuJoO76pty
   BbAcyky8N8o3T0AjVEGzfVJv2soxy0dUTDbT/vkzvbQnmncxO7sTpzpQT
   mKdMg47KMOfeAfB4dCODIsjoXIxtZuVDOWsuhxjqn0MPLjk4Mr8TmZnwY
   POO2zLBk9LXXHLoSS4fIaJK8hvwHTIzb5q4kFfol7NhkU59uIfazgUfHJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="374495741"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="374495741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782525034"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782525034"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 08:19:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 08:19:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 08:19:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 08:19:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 08:19:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9HQ+OgmBa0kv6sHss/4r1NBgdDYt2gz0t0GbD8mKngGy7T/Ie9DXxpPWFXNhQjCMvE2OcQxv1XBqu7/i0zdkW5iOT4ZT4vQnLjTTMv7h3m+9MIcLp7CZ42VIn6knD2eW4QBCT+vhfQ2r/Y1RqhM3DnMfd7jcEQd0F69cibQnMEMxKhUzgklPCvE/IPLnxJrBiFU3qG9LQmHyBpTLuGs0BPJm84XJ2QJo09BaONmTE0eJ44JjzXLy3Rq/X5kWAe6tPvYsMZYEFQDyvyQdulLcAUljxkGfNI7ecZlNV0YRetfX3hIKgsGMTMaNsxryty6bXYjkouRZQastGtlh61k5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX2rWLuJBo1pGNhoEDuGw3Y2qhRbRUa09h2RYCXCjBc=;
 b=nqiA4u8DpkGrWcWQCpdUIQyE12GAQG5Kd+MHxsmoBAQ545Ps7rTH+jJm63saaD5DT7spwHuUW3E0c9+91au9rwuab548Y9LhBtm2SpafVqAjthbaCpRP9NbVEIFDLO5vUlOfDEh0sbDqPWmDmpH+XKN+mNvFyHqbuknsy0IKBK/pycSM907nTubP0UtdfE78k+ZqUJWNIDiQE09ls/37+jNLGZtSDYcgBzuE0CPDjCCl6C/WVMnf3fLdm3IyoaOkhiubbh8o48tFR1Mm/zwkdN1EW6v6/Fq9NlpBHO5bVeod8tHYulu31//Bp2/N4GJll+1AbNgrPmkrNe9XvvxsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 15:19:36 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::b598:4b13:38aa:893e]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::b598:4b13:38aa:893e%6]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 15:19:36 +0000
Message-ID: <f960f6be-deef-a17f-2163-5195d5cfbffc@intel.com>
Date:   Mon, 9 Oct 2023 08:19:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH net v2] ixgbe: fix crash with empty VF macvlan list
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Simon Horman <horms@kernel.org>
CC:     Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        <intel-wired-lan@lists.osuosl.org>, <netdev@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <ZSADNdIw8zFx1xw2@kadam>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <ZSADNdIw8zFx1xw2@kadam>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe535fc-c4b8-41ec-2403-08dbc8db2631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsWC549JCuizy6RBa2ZnCS/12rv6xZWHuqy8/4CzQKAUE7GfCx9j9pvvVY6wXpdn2zfLnUJqSKrwzQ4hzsUlEUqInILy+u5hL8nFC37bvs0CccLpNL1veLTY7MBJQPiUaFiW9Jsf8GH2PK3i/hOdDfVYFt+XRM28wD9H3gJqyEvWfJZ+C6XrwSbulKZx7Szw/RUr6pu3jt+wjGtGeVJBMg6HEb2vkKw8PeBx5BjgiVbqm3xZu/OUUuebfv4HY8w4FulHTaDvfzdlI+O8vLatx4i85fRGsz0fDNT2GuCZPH2sPjkiVgGq/jTz6tEJu2YKPkuDAG738Dhbf9r+0YM74AOyFdcQKOdSnapluURE5KU3USyW+V26d0jQaiw0YmD9Uvfzc/JwyE4uz/1ahcsaJHYr7NM4mQ6xXzNsdgwc9S3MpFQvs+HunU3ClcLF2eGhUWdchwxWSdkcPLSJC7L0SUx7UyyTXajhkN48j59bPM09EWMDEZ4n8HYCpnZFFfOYOZcEqHzusshA+AF1chAXKfVXBJRY8n204PxL6RoPMFk8uy/6Vm7NptcxVqvxQRTLavlC5Bn49bdtDMjaf/s5ZHFeZY+zrQkeaOmCtGqx5z7a5jIBRcf1HS/QL0gI1CIUj9e6NGmop1S+z4woUzp4xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6512007)(2616005)(26005)(66556008)(66946007)(66476007)(110136005)(316002)(54906003)(5660300002)(8936002)(8676002)(4326008)(44832011)(53546011)(6506007)(41300700001)(478600001)(2906002)(4744005)(6486002)(36756003)(38100700002)(82960400001)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZsR3hIS3MyOVJNNUxEaXJCMm9qK1AyemFxa1BDbW9NTjBsN2hGUEJtRlIy?=
 =?utf-8?B?QVdoaitaK2RoSmUyOVpmV2hMSFlzNHVQNjBST2ZpNVU4T2dlT0x1aWh2SUZ2?=
 =?utf-8?B?UUIxcFN2UWgyTHBaRlpQeVYvZmlWMmV1UVVDWHIzWGFZcmNoMEhUcW5PVUlK?=
 =?utf-8?B?ZlN0LzAyK2Fyam8zdU5uZ2RURHJSWnczaHpaY3R4Y2RrbWhpTldEYy9mY1VS?=
 =?utf-8?B?SGJvc1dEaWdVTEcxcitGMEtnL1hiQjhzamROSGk3eWZSZzJKSVprcHltUzcz?=
 =?utf-8?B?WUEvWmZVd244L0h1Q1RrYTJINjYzNnNtUTFLbFV5eHp0TmR3aHRQS1d4eTB3?=
 =?utf-8?B?MEUvNm1nMlF1MzhCY2lTbnJ4TUZoWG5JcUhSNDQvRTZNQ21KUW8xMjJIRW5H?=
 =?utf-8?B?cEJGVHFidlNJS2xseTFUV0NIN3h0a3I0Y05DSGg3dDJoQlBmZCt3ZVEyTjgw?=
 =?utf-8?B?YzdjNXlITS9XUVB4b3FURkpTa1JiUXR2c2Q0emRXMStHL0hNOFNkZHdZQUl0?=
 =?utf-8?B?Q3Boa1NIV2dvWlFNU2pmb2hFN0Y4cjErbzU4UDhxYklqNkdPVUNWTThIV0h4?=
 =?utf-8?B?TGNRcUUvenlldmkwY2dJOFlvc2hPOWJpZVl4REswQ0pVZHF4TlhFblU5RDFR?=
 =?utf-8?B?ZGJpYUZHbGhqNmV1TEdCc0owVVVXYkFDTUVtZnVPNHNkdlczTGJ2aGFWVlJy?=
 =?utf-8?B?QmxGWEdrUzlwdWVaSHV4ZGtLNUpLRnJQTjd6SEZINmFnMndLQnFSUW5YUUtD?=
 =?utf-8?B?WTFLZ0JLMm1ya1RSblVYaGg5SlF2UWQyeGVDaXc2cm5DNzhWRVVPNTFXZEN4?=
 =?utf-8?B?TXFDeDJxanpiK1dxaXpDc3lWYkQzVURVazdTSnVLbkx1SUtsS1NrR0wvS2pE?=
 =?utf-8?B?WmM0VzJ2YXIzcWpxZ3Njd0tBSUNoUDJoLzVEMTRSYWlDd2dqRGpFSUM1Z01w?=
 =?utf-8?B?bHZzcmh4dW01NmJvYmllL3FmRTREVnNMalFTb3JOT09Ed0kvM1p5WDBObWdi?=
 =?utf-8?B?MHpad2Y5Q1NwV29helVCRnZOU0tubHQ3MFJ5cXJhcURkM3RvNjRzbmtqOFRG?=
 =?utf-8?B?NGk1Vkg5d1NKT1lOYUs4QUZwSVY5QlN3WWplZFZzcWw4REVYcVB4cmhUUnBx?=
 =?utf-8?B?RVFzTS9UQWRqbVN5aGxxMGhHVVI1eFZDQUxpT1lZR3BQbGl1UGdMNlppSnJp?=
 =?utf-8?B?eS8xMzdxbm5yTE1sNzBTa2Fmd1VDSEQwV3hUcXVRRlNxMVcrd014WlpOSmZT?=
 =?utf-8?B?NituV3A1Q2lHNHdGVklRbnYvQXNoRVl3Qjg3L28rQjZXRXlrV2xhdWlHZnV0?=
 =?utf-8?B?dU4yNkhLZG1vRmNhUmNveGc4dU0vM3BlMzhhTXY3NGV5d1U3bDREbldYa0Zo?=
 =?utf-8?B?UEdwUTl6aEM5TzdmZytaWDQ2Z3J1b1UwUjd2QmwwSjlRS0U4MkJWaVVJWUx3?=
 =?utf-8?B?bkZHa1V1OG9tN0FveXMwcS9NeTM0elI5dDh4ckl3bUV2SVgwZENKQ3Jyb29i?=
 =?utf-8?B?T29NeWQ0TnRrT1V2ckRjOWRDRHAxTXYrWmZZZDZIUnZiUU13NVJScS8yanpP?=
 =?utf-8?B?RHdUZ21Wbm55U1BzeGE5L3lkeHhBR3cyZk1RTGhpK3FyeVpTbmpDSFdhM2Qw?=
 =?utf-8?B?bHc3Q1dsakVIMWVHajNQUWg4bjl6VUpTQ2N6UFd3OFJBMDdPemhYelIrVVZE?=
 =?utf-8?B?NWhscjBDdVBqS2VSSmFuekFFWlBnOTFtbHFhZEJHc1NoZTR5SVRXTUpvcCtS?=
 =?utf-8?B?ZGlJZjlEOXZHNktWa1plbFZFSXRGYzIyL0ltSFE5WDVPdEdPSU4yb3J0UDFv?=
 =?utf-8?B?Y0FBVXFxU0M4bEEySHF0UmlsNE9VdlF1MGc3RXRJUTlHY2EwMUJPZHQzdXFw?=
 =?utf-8?B?b0JPRmJQRGR3a2lHNkZ4Q2hXejZkSWJXSTl4TDhmak5QbndNK0dlMXFHWFBB?=
 =?utf-8?B?d2cyS05mVUltaGhDTjNQT05TUTk1bVdjbmNvTW9tV1NPeXJlekk0OU1ocVlp?=
 =?utf-8?B?MllPVnc2ODZWRTJhYXU2bHQvczhoU0RZRitCanJmbS9xUWpDSHFtQkk2c005?=
 =?utf-8?B?bmNxeFBPL3pMeCtsTjkydDVNRVI0ek5pZFpVc0hZeEpVRmJaRGdMMVZHYWU5?=
 =?utf-8?B?Zldwdzg4M3V6cHRjS3BUWFR5cHJ6NFAzRkc5ZkJyUUhYQy8zRHVjd1czT0lw?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe535fc-c4b8-41ec-2403-08dbc8db2631
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:19:36.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1bX2YIOZjtdh/xkQ8mmRQA+6ver1QUNUqR8N9HXgte+fpcrpZPP0YGKUwpeFrEv9z+EPkFw1oZjZIzZj8FNQizVf4XIER/cibkEUeb5cLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/6/2023 5:53 AM, Dan Carpenter wrote:
> The adapter->vf_mvs.l list needs to be initialized even if the list is
> empty.  Otherwise it will lead to crashes.
> 
> Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>


