Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D7D638E66
	for <lists+kernel-janitors@lfdr.de>; Fri, 25 Nov 2022 17:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiKYQmk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 25 Nov 2022 11:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiKYQmj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Nov 2022 11:42:39 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C51FAF2
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Nov 2022 08:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAUS9DNnTQSPzWstvnJuTxZ54TGjGXbbyt53m10xJpsK8z+yLjYTmouq9FKo3oA0oXsDuPV+DtwWYvKSyKiVI+QKWHQVNgCPpDkBSWSwMYYdkiDF6M6LyzJ8KSqbSR4UIZF1rVK8LjaqOxfLnppOPsBsF/nF//ykJtwdtd4NBIELw7FjXYj7JXqo7UNE1PFR3uBOR/8EolmCx6WQ5jix31Dh4MxtBPFbhh/md1BXcTdluH5q+25FTPJ53/snrfHhaZ5l3shBKd4aeos1B9RYgXMtjU46x7yy2R12ZbdzcZXxFc2hzewPDmuHIjOse1iaDNyAEg3CTTbUJlqpdODOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76SHyh0CcsINOqm+lzb415bkcHjPfOPfcKTK8DgbGJE=;
 b=Xk9YGp6OXxO+Oye//Cp/ElDJIEZmLjsr9tQJ+cMijPfn/BU83iz4yWgFOg5EgH0fMxQPeJVGlPLt7uvM/4Ohtl70o6bQlquxjah8JsHdz+Gmatllk6XxFHOc6lDd8jewqhMOn6s6zdWMqFZ45f7iclJc9zYvB6v8Ed5nfVbey56bm7rRiNm4Co8bGF9GjmsR+Db31hZKQI8S7ftkNxOxjLRK6RH3FW7dYugwMh8Mkq/0ZOp4rqXrusHWt1Bbg8iR9mxvdZ7xEJyiLAavK8vwKPequvWLPb1Qi7q8fcIlWrMeIP6vmDsEmqNAUB+TrL2vT7IyCcJr3rnNmXBzpK79kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76SHyh0CcsINOqm+lzb415bkcHjPfOPfcKTK8DgbGJE=;
 b=0eUVIUjhX4/UQHX07drYURSq0jGGqqL8TzetxvQD8iCtlv1em8O4299aaqsVNelRv66kkCOAkR5ojO/K1+SsSmUTTiBD5CzvOTjlImW+/duYXjTmx3lvweIxBFoI9vENZ6dSev2f+fv63RNCDV3Sk0afsy39D7OzX4t0Qt1dHOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 16:42:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 16:42:35 +0000
Message-ID: <5bc1e6bd-efc8-74f6-401e-a88b7f3894ee@amd.com>
Date:   Fri, 25 Nov 2022 11:42:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdkfd: Remove unnecessary condition in
 kfd_topology_add_device()
To:     Dan Carpenter <error27@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
References: <Y4BxRRU+aiblAj2Y@kili>
Content-Language: en-US
From:   Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <Y4BxRRU+aiblAj2Y@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:610:e4::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9bd272-1526-4655-534b-08dacf040dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lHKNJdED2X7/buCJCAyK4HmnJaq8dS1lpKwtyhhRYyRBDDiOmUX/WKfEFYkHgJG3d9SlTW0+Gru6u+LaflgegHjGxX5NdizUyoW6mgecyWeAnB/PQKExugcNXLPyB2idC92yE7SovXuivfDU/VHeumcCTK8zuF99Mics/d1wbmVPxYMi6OW4/XKkSE/px378E3GOPrg3VZjQ0vFy2jNfC1g/BmqKKW+xkTu5a4pNS+W8k07mzfxUZj0yzV242DIIrtf5UKmmE8EOjYrm5ILMuQ7y37JQDpwrw3NyACh7Jz4YlY1BrSH0JqS39+4doDYAb8t+tvjPt0wx8M00ZyukJq73Y9phIG4uyOrNSO4GDa41CzYX8YUu9GKh5YHMiNc/ioOisBPaxjhtlT8j3VwbcVq6PaDs+juDg03GyEnmCl/hlRmC2OcQwLtxiCqCkg6UuuX+wf6eafgdrHiVK8M4AMcQZACOo7ih6+p3XYNo+a14VOrN5pNgb0pLT3JTYeazwxqCPyJEG3+50G5HwquNQwS80nB5UMTW4W2GHVp8zzwf+Xdql6xL+So+6YI4NQZ1qUbSPLCqzJbqex14coWlRHuRT+l8rr/d2v9aulZr0J1Al93mhVdYbzzfrLcsnTxBcPuItiVttXo8fR9vrzGAkZ6yKrE6wqjjiCkwuesrHIy0Yzgf9SA8srCZKrc2gV0Mks1EFzJdF2rVlFgv1bdK+RoGgJlimWhbAWxLq4BH4cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199015)(2906002)(4001150100001)(31686004)(4744005)(8936002)(44832011)(36756003)(4326008)(41300700001)(54906003)(8676002)(6916009)(83380400001)(36916002)(5660300002)(6486002)(66476007)(66946007)(316002)(66556008)(478600001)(186003)(53546011)(2616005)(6506007)(6512007)(26005)(6666004)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVp1TWxGVThHME9OUzNiUzMxZHMwK01zSWV5ay9qajZhM2xINlNTdGQzMXZE?=
 =?utf-8?B?bjZVZ3dSNDI0Zk1XcWUwZ21yOTkrTUxhemxMcFRpaEFSVnJOa1ZaR0pTSGRO?=
 =?utf-8?B?RWdvY2hKMExwZnVtRFl2MEFnTXVpbHEwZzJ3ZWpJRTcremk3SzBjc3JSTkRx?=
 =?utf-8?B?NjR0aHF0UW9may9nRGoyT0U4Q3lqdDRtY21pcFFKdExuRGdUbHZPYmx1TDAr?=
 =?utf-8?B?U3prVnR0MFRjcy9ZdHY0dFhILzBELzlQSmJXQU93OXY4TURBT1RodXo4NkxP?=
 =?utf-8?B?UkRIdlJGWHByaVE4R3dlSTdiT1ZwRU1mR0kvUTVpQlFiSjNrbnpsWUs1MFkv?=
 =?utf-8?B?dEJoNFRxU0dCZjdseDZxaVNFNDVyZjVOS1JkUHdzK2V0VHZQVTdYTXdXM1ND?=
 =?utf-8?B?MUZ2eUlKWnoyWmZoWllhUFYyNDg4UmRycVoyRllxR1JCTGV0aUNsWkRTUkJE?=
 =?utf-8?B?bzNBMnRHUlVGWU83Qy9CQTJYQnhNYk45QndFUXVCRXRwQmdXbXBoM0lGMldT?=
 =?utf-8?B?UTZGempWeWMrZ3o5NzY4SnF1M0o2QWxjSU5qVTAxaFl0bDFYMllwR2FHV2tJ?=
 =?utf-8?B?bmhHOG45WUpuVWhlQ0VOUi9RZ3pxUGlaZlJFbkZOZUZtUTVyeTlNbHYwUkhI?=
 =?utf-8?B?U1BtUlFWYWdzb2NhRGhsVVpXa1AwQVU2WDVndkJrZkp5ZUJVc2dKd1ZsV3Fm?=
 =?utf-8?B?Z0xzTUNoR092dmV6WUNNSmY1WS9kVkJnR1ZDNmFhVGRBdTI4M1Buc25uYlgv?=
 =?utf-8?B?VmpjVzRjYThWZjFReUFFSFBpVVBzMzQyMHdpNzliQmc1THJ1eFZLaUhCTVps?=
 =?utf-8?B?Y3Bsb1ZIZWNiMUNmVjl6dDNPNmtVL2U3eEFSQ21lNmtSRC9od3RKSWU5Q3dS?=
 =?utf-8?B?djg3R3cvYjEwT1RreWV6a2VYLzBDRGNmWFZ5QmhnS0hrYmRja3kzOEJSQnlr?=
 =?utf-8?B?M0Q1akVkQ0RLbVkvZVdkcTh1NWdZa3VPNGw4bWMvejF0OHdwamg5eURHb1ZQ?=
 =?utf-8?B?VTFDTXhFWVl4T0lYVHpFQjduK0VFbzNZcXB0RXJwb0w5V0ZiUnNlQi9rdGFB?=
 =?utf-8?B?am1JT3NhNGtCSjZmU29WK3BtYVdXYUVBbW5PeEJETDA3QWlvMnp2Z0UrdVg0?=
 =?utf-8?B?enI3aWdlQkJQQWw5OS96eWNRQXJwb2RaaWFCUjNRdUdwN3JKbDY4S2hod1Vz?=
 =?utf-8?B?SGtncGR3ZisyOTg0bXp2QU1pMDVXL3VDTEtVaWppN2JlOFZqQ2dvNit4RGJM?=
 =?utf-8?B?TTZ6YkZ2bzNBRXQzc0VQQzErWXF1NmUzVVhDMkt2a21MVFpZcGRjakRCMHF6?=
 =?utf-8?B?RUt5UUQ0T2VmbC9BQU9ER3N2Zmw4M2FOVGcyNXlVUGtualhJMDIvc3h4Nldn?=
 =?utf-8?B?UW9hd0EzMEhuZ0V2N3VZVzlRZXpFQ1RWcWdybDV3TjB1Sy9Qay9vQ0xYUVFi?=
 =?utf-8?B?YUxsZHNCZ0NHc1Ayb1BoSjRBUWlDUzd5MUdYK0t6MU9INzRsRURmK0hBRzJx?=
 =?utf-8?B?UERlak9GT2EvcSszTTRRRHlva01ZSnlxcVdXS0pNZG52dTAvZ3B4YTgzTVc0?=
 =?utf-8?B?OUpXS0RVNDVUSkNWQ1VwQW1hNzljOW5vWU9kVWgybG9aOHdYNldyOGs0SkRW?=
 =?utf-8?B?NkxmWm1XWU9BMVFxelVEQXhtUDJ2YS9kZnk3MElSclZ6cUwyZXBrMHU5bnkx?=
 =?utf-8?B?Q0ZQcytFODcwSE9KRTZUY05rVnBuRHZIaS9KNm40M2o5N21NRmpjSWtwQVUv?=
 =?utf-8?B?RURidlgvV3JZSW9aK3ZjMUNmZVY1UmNSV3RJTlZLRDdLSm9vdkFDbDk2WVov?=
 =?utf-8?B?T0g2TjFCOXhqSi9kV0t5OGlyYmx6dmpWZ3dtWENMODRLZGxuaEZyZWxlREVy?=
 =?utf-8?B?aWgvTVJySkNlYmFtVzVoeUdSZDFRby9nREFOZklKSVpDZDNhZTNMRzMyTHFK?=
 =?utf-8?B?QmZxNDlUbUp3cVJrSnVmaE9HOHRjdjIwWXlCQ09NYVlHcmZSSXMwdDJDQzNX?=
 =?utf-8?B?SEFPNTFZUk1lZHRsZkVsNHFuc0lQc1FXZVc3UmVpZUlVbER3U1JaakRvU2FR?=
 =?utf-8?B?Rk5tc1JTZ0V5VmZyVENVaEF2WGRRWXcxZWU5SEhwZGhoRWQvNUhQS2ZhY3dt?=
 =?utf-8?Q?hTD7TVLm2ijm4HcS0O075Z9+y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9bd272-1526-4655-534b-08dacf040dca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 16:42:35.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPYwP8m6vJwBHmECNG9s0ku6jpdSmfVPPIbxDmIRYl20SfNKuPo07f6CalengdpVWeEL9Bgot8qm09TErqtkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2022-11-25 02:39, Dan Carpenter wrote:
> We re-arranged this code recently so "ret" is always zero at this point.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I'm applying your patch to amd-staging-drm-next. Thank you!

Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 6f01ebc8557b..bceb1a5b2518 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -2012,10 +2012,9 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
>   
>   	kfd_debug_print_topology();
>   
> -	if (!res)
> -		kfd_notify_gpu_change(gpu_id, 1);
> +	kfd_notify_gpu_change(gpu_id, 1);
>   
> -	return res;
> +	return 0;
>   }
>   
>   /**
