Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E976D96AA
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Apr 2023 14:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbjDFMCn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Apr 2023 08:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237701AbjDFMC3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Apr 2023 08:02:29 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519E4BB9D
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Apr 2023 04:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZrJL4MAc8chmPnLf7um38/bhTfz3YfVmqyzcuaCtl/OKpXhldsPbj8C7Z3vBk5q3WPYHocAZppIu7FE3Tmf01m+TrVjh4qhQ1r5cuYcrOTi0NYnV7KB5CJp8MerTzpMYf8lkbfKVLRuFnHtxO3xIJRujPNWowzvdKaezA8U78U70tXePXi4lz3mpOK/Ne2lcQ/+EleOZRUtTJAk9obPyFg7fTTJrREgPOHkgw6L/zAgY0cePOSIeh9Jwt4Yedd0jJKdhwcJqCHgugGIZgfuyDb0XeXow3wK7ClrIUViDlz3kpIgCbDluesNW7AFvuF9c1JyHbvrySra40nSOAvDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS3go5CMLi4Fp/9BuGIrCbQMN7RHuHeYG7wQOKpw/aM=;
 b=llNnlCmwe8/TCpdEPaw5dScobcCnJShxS5Uxf8IwYE85Qz8pG58+Z0jhM/FdYZYAyrdUdIgGCzcvvQT4BjAzE+WXRC6pR6SOQusso7I9aa6e9rITisNp7rEUFPC6duGxTPxUsWbl/7ReZFPDBdWjo9hAbmYQMyeypIoocXGJMvN7I7xj0mstrXqlMsDGu4Y6K8XjOewMIQwL9U4JHbAxGRw7zE6+cziHEX/n7/FZfSobc2NmDFW6yeOW4hJKB9WgPZIR22TCchHfwhGGIrZWY9FoRTY2g06rXixk44RHyoSzf0s+4Ys6B0dZTI1N9ANa3EV9biMXCluCsjjOxpx/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS3go5CMLi4Fp/9BuGIrCbQMN7RHuHeYG7wQOKpw/aM=;
 b=1Bafmo2uNhuJaRKmzy6exEEil5EaJGgI6rIvqjPifNWQMR7ekBoYTSJDgna6afL0DzPuaokpJpHR8BfXqlqeKrKSSomCIWSwt5IQCPBulGoxwhfYjOiD7KPK0KAFrksiSEK+T6tt17dgT3SaJFC6My9v0jjghWS032eHc3f66Sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 11:58:58 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::b402:d898:3ff0:bfd1]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::b402:d898:3ff0:bfd1%6]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 11:58:58 +0000
Message-ID: <701bef7f-77bb-63a6-429f-1293519a6b21@amd.com>
Date:   Thu, 6 Apr 2023 17:32:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] soundwire: amd: fix an IS_ERR() vs NULL bug
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <3be30516-a1b0-412b-8379-06011855e46f@kili.mountain>
From:   "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <3be30516-a1b0-412b-8379-06011855e46f@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::26) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: c22d5308-994b-4e2e-2d87-08db36964d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quuncmMDbWmRyBIUno8Eqa1gQOlpbEEkiEH9s0WxsvokZaxYQ5ZOlKNEhAvoDWlfKBg7fayBK1FriNzeO0FTemYq7neZm+27FmIrzqURFnq5hK+CuyLPkfli9jjEheAeNMhRnh7PdbraScEXBC4GsxjQybiIKCMRKD0+QEwMWLM0hzFevb6K2M2PJ/ImhUWa/OZQRD9A8O2IJtuqqI3SVSGRQ7DeN2PAhwVVsmySfw6Q2mxOInqGT3ZSNXLKpYN+rgUVV0Ka4d4YMF+LMAyQI7fKVAabIbtKEkxSBShRGLevKUxwovVboTMtZsfVKdR2bdt1ZaYMPUc5sPiNGWkd7g+3IfSEL716Ayg+WO2AT0T/a9mpBLPyf3k9koWuo+GmYZYIjbINUxiAyEesjyeXKiDNwYWxBqmTXf1js91b7WgepCgcrYxmSVBlDGOzs3ApWAFZ1gN0HpbjBAUveGqDY2DZI+IgwDNm3G4Stxq5YVdYOxB6KwKJWg6iGsRbFzhbNQWcqtwtoZoRzdgjvOHH8GNTIx4gK1Ed6fpkEjsN6cD17Ut4PlnBeMKkGd7m4gcvYcV7ni7bfBCBZ6az8yTC5cbMjRPcZxe5fEtiFdm8oUILE3rM/qRwWJ5P4wKqCCdNMKfjEyYlUu5zhq598XTErw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(36756003)(31696002)(86362001)(316002)(41300700001)(66946007)(66556008)(66476007)(8676002)(6916009)(4326008)(6486002)(54906003)(478600001)(5660300002)(8936002)(2906002)(38100700002)(186003)(53546011)(6666004)(6512007)(6506007)(26005)(2616005)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VuTkllSjc0dDNkN0N2dTlVbnhSdlpvZytXdmUveWlod1hXZWRETTZGM1lY?=
 =?utf-8?B?amE4RXNEencrNm9CN3NRb245RjIzclVpckEzQlIwdXhYanN3d2pjYWU5eXVC?=
 =?utf-8?B?Y1dWOXZpQlJtN2JxQzVqQVN6Z3owRHpRZWF5WUZ0TWJMM29hbzVZMzJ2QUZi?=
 =?utf-8?B?SWNxK1cxbkZETHlUY0E2RC93LzJuTlB0M3BtUkhpVXU4L2U0aEdTWC9Rb29z?=
 =?utf-8?B?eEZva3l0MDZMQllLQmQzYTloVzZHd2JuKzRoWldhM3BsSE84MlI5WWNXV1N0?=
 =?utf-8?B?Rm5LNUg4OTArYkpsU2JJSUxrUTk3a1lRNXRHejRuREZhL1FHWFBSeU9JV0RR?=
 =?utf-8?B?RTRYc1o4QjVWRmYvQlF6QXVyMHhlM3JMbUkrMVhjY1kwTWdjKzJXN1ZnSW5O?=
 =?utf-8?B?Mms4LytWcnJZRGhWeHFPME9PN2F3N2NqUVNWdkd1VitnMlgyRndLcURhdTBv?=
 =?utf-8?B?ZWNKeHF4TDVVb0pIL0NKZ2pkTFdReHppcFRjQlFlN2xzRXFVbDJOR0I3OGMv?=
 =?utf-8?B?SHRNQzhGakxueWo2Z3lJZmlsK3JnTDdWcU1INzBhZTlIQkdIc0RSRGR5Z0h4?=
 =?utf-8?B?Y0RYZ0sxTmYra0RZb3VQZm5MVDkyZXc1Y3krWHBuc3Jxcnd3a2J4dnhPbEhO?=
 =?utf-8?B?clFpMGMrYmt4MjBDRHFoR2VJUGo0aFJxNFJ5a3hJMWdaTnU2TkNrWjJhZWx5?=
 =?utf-8?B?QVBZc01abUw3c2x2dEhhbzdCdHVyblQrSmlyMWUxVGF2QUVqU09NcUNnaTBF?=
 =?utf-8?B?SkNGNnZrb3pxOXpCV1hiZnpjbEF3MExhdGRTUk45MkJoZnA0MEhhN2xYRWJp?=
 =?utf-8?B?Z3drT1BpR3JyOTFFWkN0LzBURFRzM01INkM5R0dqT0V1TWVJQWJRMVJqa0NB?=
 =?utf-8?B?UUN5SXBmWDNGZ3dBWnJrQWRlVERndWkzT0NjTUNMSGJHYWVzZGhmUFYzWnJq?=
 =?utf-8?B?RXFITkFKa2thdXpob2xJdnNvSzdTMnV4QmdVYytWZDBXL0o2dWViUzJSZWJ6?=
 =?utf-8?B?R1hoUDYwdzJEbEU0aGNKRjFzS21NbXFxK2ZPMEZ6ZDFyQm5qc3QwV3VyS3Zq?=
 =?utf-8?B?ZUxUREZybFRkREFYZDFuNmcvbGRxTjFXcEhsUDVLS0prNm9sS2FnelA3U2Ur?=
 =?utf-8?B?dFRLenVZdi8vaE9QSW5kOUcvUWZpd1hJOTE1QnRXS3dqTndFWklaRUlaRnZC?=
 =?utf-8?B?VGU1NnZ6dFVxbGFGTzlDbG5haFlTUUNUeTNJQThZQks1ZGZUT2pPOE1OTTds?=
 =?utf-8?B?NHhhZHlLR0NZSExmNVpHWTJ4eXdTYTcvVlRobmNaaHFzSHpRU3MybkpqQXox?=
 =?utf-8?B?aFVLZ0JYblZHMGVscEovcXgzdTBBa2lOSVA5YlhPUmczRnZ3cmZYaWx2SHEr?=
 =?utf-8?B?ZGxackZ4SEVqYTFmUENBbGMxemxHRGZmeDRuMUI2cHdVS3NNMmp6d2RUbFUy?=
 =?utf-8?B?alhFWUNWeW1JQVg4MUZTd01DVk1lQkhzaThuL2pKVFFUcVJCWjFWLzJOVDNW?=
 =?utf-8?B?S2pJTGRVMGdIbFBNRTBLSDF4em13LzUrYU1oMllBU0lQbVdIbU9rQlRxZlU4?=
 =?utf-8?B?Z1NMcUJ6OFAwVVNOOG43bExDNzYybTlvamc2TitMbDllVE9YR01FRnc4aWxE?=
 =?utf-8?B?UW0zS1lHZk1oQWU5VEEzUXBPOC9BeitHMlhkWlY2YU1KTGE2eFNVUmdyWGdE?=
 =?utf-8?B?azF2VkFYOHgzUitzVkhGYm1zMmVIQ3cvU2d4NUV6Y0ZySE5WTXlKRGVXZm9L?=
 =?utf-8?B?SWtYb2JNMFhEa1o0T0tUcjFScGptaUZMckxzR3diTVJWWGJ6SVBwQno2UGtH?=
 =?utf-8?B?c0pvdGlUQkNvK28vcHo4SE1FeGR0UGQreDZPQ3hJbEUrRGE2OU82Y0VoSDg4?=
 =?utf-8?B?aFZ1VXBiZ1FDQkFMNnlyL2hrWHdMakFadVo5NkF3UVVmdnN0MW5ZLzhPNytt?=
 =?utf-8?B?djg2Sk1uSXpYYklrR2ZidU44aU90eGxqRGlyR1JXZGZkbTZlZmNJL0tuR3ZN?=
 =?utf-8?B?SjdUamdCTU9vQkhhRkhXWEVCVDNFK3UzZkFGQ0NJRG9pOEhkQm1QeDdyMm11?=
 =?utf-8?B?NllibVQ1Mzl2RnpZNUpxTDRvYkdQTnpxYmtTcnM2V3VpcVlWT1BRRHhsY1h5?=
 =?utf-8?Q?ynRwN5G+QtFyg3emTXxPY3dpE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d5308-994b-4e2e-2d87-08db36964d7d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 11:58:58.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3u+aNJmcN54+edCMbcSXNAddo8G49xGaRS5PerVkH6w+DGBnSo3jdJ8M9pr4DDkT/qr6SkLDRal2rFcB8zKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/04/23 14:26, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error.  It never returns
> error pointers.  Update the error checking accordingly.
>
> Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/soundwire/amd_manager.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 9fb7f91ca182..9bb8ae8c5f32 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -910,9 +910,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
> -	if (IS_ERR(amd_manager->mmio)) {
> +	if (!amd_manager->mmio) {
This will break the functionality.  Condition should be
if (!amd_manager->acp_mmio)

>  		dev_err(dev, "mmio not found\n");
> -		return PTR_ERR(amd_manager->mmio);
> +		return -ENOMEM;
>  	}
>  	amd_manager->instance = pdata->instance;
>  	amd_manager->mmio = amd_manager->acp_mmio +

