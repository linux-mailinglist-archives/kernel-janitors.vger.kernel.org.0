Return-Path: <kernel-janitors+bounces-1077-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A952825B9F
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 21:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E30871F242C8
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jan 2024 20:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EBE1DFDD;
	Fri,  5 Jan 2024 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeH3Z9Ki"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F835887;
	Fri,  5 Jan 2024 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704486774; x=1736022774;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wbTeGMlBKA/AVTTq5b6G1kJb0VGKlmedWGZfUpkygms=;
  b=TeH3Z9KiZY5pZqalwQuPgH693J880lHHnpDX5jKdq2fogYGXnsh0jkJy
   iR1f7dQP/SKGo8XxWqlvfNs4IkZfwlrNTNCruV+9iPm24OVXKva7VLQY0
   CjN4Cu2Kk6mGBvWZTjwtlpEQG7c6C6GbVgBE3KTQH8VeeLfVE5iWvhrSy
   Xip8mg/lYKN4zeTD8RCnOzMVQ2RgFkXcl+g/av0V4NRuvry0/uYcLzKw6
   iKKNT9Y6SC0dO3cV+Sn4ZGtXdWtfQIEOSScmgnYI11ZVEJYOvx0SWPJ1c
   CqvmVXJxFXU5cJp53eff/jZK8XrY3crbLYVJ/u3jJksLxbEHYCOVQGnGy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="400337997"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="400337997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 12:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="904239728"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="904239728"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jan 2024 12:32:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:32:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:32:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 12:32:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 12:32:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOvju0H/Xd5gVw0YcgVQ4quy9C7hrgisfHHsfBgtzHAJuLabHNs8V+3H7Jl5NP0OeqFy9Upe89B3ZX2lwv1/NK62CYz5DdBBfDuceXcIL59BXsqoG0WDf5IClCJPfTwrkQ4gV6GpeBPCT2XxLYUB54A4dUAg8MqB9a1uFSEQ7Fp9JhbpunBRrVk+Gg8bf1wtXhv3Ss63uoq1MI2ZYJN4OIplaHsPmGFbvHKVJeWmF5ZNrIJLTgrhS6I05i6LUD5I+u6KHKRaVNj501a84CZIaxbxPoFqDC+HU5ieNTh6zrjhNj8xNwP3jkwKqnJqdbbyqNytWA8angKyaZQY92Oz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBtu4l3ZHak0YgPw3ewFT+G5AQ1ISOsCDvF45epAybs=;
 b=TOIqAjkAdH2ShRuHIrie55kkdTVlDyZ04bx0eHXAkyn3wIvWSpu5WrJfL51PXpXryFxHNMejJVeoIADYr5HSKRPPq2KjORdQtDXehIId9r54eFVmmKmczi2OlgzRN8vtUGLBntGt2e1Olf6rybzR/X/FDqtcStPS3lakFXG4rHc+suunRV3Tbq0AO7HWrjGK0Mvj9mxOTbn4ZhsmXLNCtwS/ZxdMwEW1Rgb1tXTC/t/2lUjSHU7xUz02M1CK4j5u3FLChv37hqa8dhBPuO+j0RfVAMHzmeKwgxxLTsZ57yicAaTHhw9aWCBNCYkkQuQuhk1cLmDk5gXgJdMxuDB3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.17; Fri, 5 Jan 2024 20:32:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 20:32:50 +0000
Date: Fri, 5 Jan 2024 20:31:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matt Roper
	<matthew.d.roper@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
	<thomas.hellstrom@linux.intel.com>, <kernel-janitors@vger.kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
	<linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
	<dri-devel@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/device: clean up on error in probe()
Message-ID: <ZZhnO9JlP8h/Q/EG@DUT025-TGLU.fm.intel.com>
References: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baf0a1d-8aa9-4ae6-4937-08dc0e2d7c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITXVeWvtMnKj4jS1NGGj4j9YI/TGlhowbmkpRNQm5Xb3Iy4gPux/HiQGUMB9n2jmkCjTzQ5JMYvi7hGSaA1nVmllj7wTIS5ssdPf3JE0pzdP6T4u5s/NOdZHIWQJCc70lHaaaKCq51vkth8W6FfikThz/pqM6i++3edOm/hPI998bVyfR4ZHykas0jHB6/T/adrOCRGSeLavL8jS6yxCY2dzWkkAiImFVUsbxJPky7RoOATQ13JzJjYFy6yZel65uDiFiYaoeqjIfuKUCKgrG1Y00sjBKmckbxaOhq3XgdmfotGtbS2kcCTBA8vg4dCKFttlArpIO2uKe4wYFBCRG4cV/An8us+hhvykjPqgggvchypdlK4hpJWNS5LpfSFsH7uXGfaiB0EAB2BKQoZuJzcX3ywsYIxPRnFozPmTq2bU39FivGXQpz3pGyRnQGnrmyIrhwCBoh7riG+JnOA7aqXF0XOXOQS2gy9a5qxBtq5BqTRby3lqKo9jjGNM9ySvRL5kw2tQelQy1+OmTHZCsaNYXx9pHBK3r9wuXllJYE6gGL5mJI9HC1b2x+apcHysYp0qCSv2zBul2lCMwYnwk8jwAF/kzZB2qxYiO0gLqyfOZsYYwT5JSzUBDNP3CQu1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(26005)(6486002)(6506007)(6512007)(478600001)(83380400001)(2906002)(41300700001)(66476007)(54906003)(66556008)(66946007)(316002)(6916009)(8676002)(8936002)(44832011)(5660300002)(4326008)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IbOI/r3MfIKGFTqqEfocRex9Mzo5ZeTtfGWlCOB1XwItTAPH3UAjwy528VMD?=
 =?us-ascii?Q?6dzm57EkdFgW8pwdQbsYTNxAPLXJGY/yPlrAjsZRlr31+nRn4kn7K5E0sG13?=
 =?us-ascii?Q?aegvxmZU/DcH+J4BLNovV2IDxs3HTASigMKUbPXsb7tfJuRpPEspj0roFjqU?=
 =?us-ascii?Q?O4xnJCcd38O449bhQzbmnugTRDX6sfWTej96kLteBJxklOlRUWCH0+W3TP5M?=
 =?us-ascii?Q?1ED5kQe10SpTNSlmKvXvLeCqUa24ivSrmk6RBwkrCRqmopFfh+WV9tqd6otw?=
 =?us-ascii?Q?LwGpSykgxIF3pHYPDDxS/+Jx0/4jegMskvGtiA5wpfGRcDxx/TDtSdr+4BQV?=
 =?us-ascii?Q?yAznyVcodJI/5QFoynoQ23uS/OiiUlHoAasSAZPRogaotJQHD2+kzbsET7QH?=
 =?us-ascii?Q?lkwLJY2pgSoBqmHeGUKUvwJPb2Uh712eWXq8hd2fLkal0OGwToCerufm+fQk?=
 =?us-ascii?Q?K5P2OnsVCK176Gq0y3p5TEipYN67MlZCX9qd3DgQ8ACxU7NnIyJLCGGpJi0d?=
 =?us-ascii?Q?y1aeEBLo5H77MgbmnyWDq4QYZfZYTsn08tNC76jScmlmO3Lmj74S8HQjVeI5?=
 =?us-ascii?Q?a9nRU+Q+my+APryE+Of/HH00UmWponr1pNzCTXRn529M8o7myik7Q8e1p9fc?=
 =?us-ascii?Q?CfIJ5v/mctFew0ml/ayYwYRVgxtvAX6tr3O0Y6TF9oquOwQRBi5WqVFXT0B2?=
 =?us-ascii?Q?rAv7Z0A2FGyCbHIXgJ++7duPFgNRlOhHYpocrNspBc3ldh4jOFwDfUi0s7gL?=
 =?us-ascii?Q?43sRkxlPW9sthy9yokp9l+JZGNEi3BKjqTZ/ibM5XN/s1e/slJ0xvOI/6fJm?=
 =?us-ascii?Q?hdmC6ORfqpnGdh0ala3HKcmf7AY7XKFiMHj8WdP8J5ZPOwuWD2rMyHAX3yG2?=
 =?us-ascii?Q?yoMnykXx6tRRUV2Fkazibsgw1CWEAv4eD5xB4pVO7/Zi1cTU35zyDiK+Kce3?=
 =?us-ascii?Q?MDyz0oV+pgitqg6oBGKGAK+ZjVIvod6+n42AhRXfI5icpjUUmPff3C+vHf3E?=
 =?us-ascii?Q?o8HXBwH3+Oto5XzYz1SPhJ6SLP8He0SGm4jfgfzKw45Hk0XB2S3eDBlXMor3?=
 =?us-ascii?Q?lDWaV+nz8CXzivxP8XQaijjcG2Qg9A+Nwr2eHEISxDCjIRV+ZG6Dil1Ixxhy?=
 =?us-ascii?Q?j/eLMOBdaRRfUXtJCGG8IjAUB8ULCFezvbHng3+VVuDuxGu+SAtN5mxhl5+d?=
 =?us-ascii?Q?ZQW3pRajU5eX1/k4ZVB+VjKzAk10fiweqLA+v7+mRv9HbbqD8WRvMd5xa7P2?=
 =?us-ascii?Q?tQKG5lUzhVTTQjNpKMdwcRdjha/lgNAeVWGdMcW0ehW/jywkYua9v3ydW4Gy?=
 =?us-ascii?Q?zZcVo5CL+zu/iPbZ67i+gUJENSMLFr2ci57LKT+g7Qfg9ji1tgZUdoPbTAck?=
 =?us-ascii?Q?cQLckSJJZAYBcHUAB+jzAwvp46Isl+FE4mFhKMDuZ41VrYWDjNxI+QhZKng5?=
 =?us-ascii?Q?lkJ5sD82LRJbfQHybBEKuuVEhiLn12BYjgq1yNw3f+VwVJzJNR+d4c8VmQDW?=
 =?us-ascii?Q?lMSGleLJ9OAbDIz07tCioCS1VGWfsFS3hOTTBui/Sf9OoZmPFCKireCJ59nc?=
 =?us-ascii?Q?f8ji6GuIFp6ywXMpl9kDvV4svYg8yBV8pI0Iy8YygrG87jIAhv4hlPTIggif?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baf0a1d-8aa9-4ae6-4937-08dc0e2d7c5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 20:32:50.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHxgsCUsISuO9Bixvu9592golvTogpw/4wkhMXJH6fblCluHuMCTVZhUrDiAelxE7rDFxhStDpD1wM4pMR1KNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
X-OriginatorOrg: intel.com

On Fri, Jan 05, 2024 at 03:22:23PM +0300, Dan Carpenter wrote:
> This error path should clean up before returning.
> 
> Smatch detected this bug:
>   drivers/gpu/drm/xe/xe_device.c:487 xe_device_probe() warn: missing unwind goto?
> 
> Fixes: 4cb12b71923b ("drm/xe/xe2: Determine bios enablement for flat ccs on igfx")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> Speeking of static analysis, someone should probably run Sparse on this
> driver.  There are some missing annotations.
> 
> drivers/gpu/drm/xe/xe_mmio.h:65:72: warning: incorrect type in argument 1 (different address spaces)
> drivers/gpu/drm/xe/xe_mmio.h:65:72:    expected void const volatile [noderef] __iomem *addr
> drivers/gpu/drm/xe/xe_mmio.h:65:72:    got void *
> 
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d9ae77fe7382..b8d8da546670 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -484,7 +484,7 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	err = xe_device_set_has_flat_ccs(xe);
>  	if (err)
> -		return err;
> +		goto err_irq_shutdown;
>  
>  	err = xe_mmio_probe_vram(xe);
>  	if (err)
> -- 
> 2.42.0
> 

