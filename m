Return-Path: <kernel-janitors+bounces-5888-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 501BC993756
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2024 21:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A332844CC
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2024 19:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EBD1DE3C7;
	Mon,  7 Oct 2024 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKaKpawp"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34841DE2D6;
	Mon,  7 Oct 2024 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329427; cv=fail; b=bHtpYKf2Idrkc4X5URCJJM280zLP1iWexI/hE3IVoCz4l/AiZniqyYxvjuVi87IHLOut0cJbBsS21/4Om5z1NGpsMwP0+naW37tYimUivbQ28XUr0xA+4g5wZqsG90e6OH+M06cTypEIU5yatHMigVVcNk/PKT8owvdRceT6I5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329427; c=relaxed/simple;
	bh=E6yN5KY5ft8d24Re3pT2WpXCW/584Q5jLQLHus0R8s0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kd8XCGTzWyuv7hexe5ZiizVp9+tAEsoP8HIiW7n4cGYU7CPT99jyNUJ7qILn/YX5k6wh+EQ1hS5rhid/7ytLeVHjuBohBIB8BZqpmeBw4uTEw320I2uM3irec6y2XnGNI5Dfessi/NV7g6BXWZRWkjPb9gDUtVW2tA0SDWhnXQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKaKpawp; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728329425; x=1759865425;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=E6yN5KY5ft8d24Re3pT2WpXCW/584Q5jLQLHus0R8s0=;
  b=jKaKpawp65dkuj5Qi7tRhR0OUbgzSi/qmh2pHrYTzkWQ0+8fgrELP1MB
   etBHico0Gq+1fV3MHBx4GIukrai+j5s5HddY7dae691CIn38HAcpxkRQa
   n57cObbZohYPl5uINquM02mJ1xTmn9/ofQLjI3wDNwbYomWdwyqavzX+H
   dPXS4du+zI+9ZoNzUgBFBl7XEY8Nh8vLpJtI20N77F3De2zz/lYV1LNo/
   xuyfQAI0/t7zghB22PQHhuqr6SgnZorvkMJlTIrgEVxfjBojnAd8Nw/t3
   gi3/eGyr6K4c2dY2I8to0e6HsPYO7sx3UTGYPkpdRrEHFiv6ezxR9MXL0
   A==;
X-CSE-ConnectionGUID: pYaSLSw3R5aTyV1mQgZwXQ==
X-CSE-MsgGUID: j0ofGjfSRzusW4NQ/UEUyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="15114992"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="15114992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 12:30:25 -0700
X-CSE-ConnectionGUID: szbcD/kmTQm5DXXOQQhTgw==
X-CSE-MsgGUID: BI2aFBZoSFuAFwLrGjdzkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80545648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 12:30:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 12:30:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 12:30:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 12:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdJEgRTQelJcUwG30cXJuRJKlIPN0ZUXEZco1Uhysbw3AeqINDCxqjPbLnRJ/QcybZsaq90S6UmLIfRX2LRpgez0BlcwsNixxSx+iJtGeEa0UL0mjZ072r+uo0RF+0XYliOlY301XpLI6DhO4+urubDqROxu4UL8r35nbRR2AgRDt0r3sAqiMpSmx7H1e2UsGgz68ulhCwyvYnHaTtMr+Bzhu7ZxruHM1rF+AjtBdGdebfzCOBz5TRXhetIpTRAZ6oMDFyVaanISi09BRUD6f/qClz/dDWusEefbBXM4+h0XFp/PuzPav8tPU0OK2bSLITVYZLjscLhbagit95zacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGaBbczGkUkcCwsk6ttHb67/yWG6i0eIcbXkZd0/pag=;
 b=IBwlKEo0ucj+xXSO3oNh9QzIaKHrol1X3di4UxOrxioQhlxvJMNklVgQOMyDUxP3rW3rTIebPRHDmQD3ldCiWPE7xms3jYEJa/newdbbs1zbJreT7zol4Je3rM+ULJxPa1eRCU3GyfH5PD0SygUzzZmU18f5f7Lc/3ZV0/TK0b/LduyjUKEqAO40xgof6DY+cYrMv14S4o0lIWu6dzNSoaYRSbZYxHiohTgzRpxcXC0dj+o3WiUbk3oLJdddWNUtIkoMtw13w5MvJcXQTOw0dGEQeKu5DzPgetV75z4Kx9EkwlSmo4GF1shS+dHWruZko+fBWoyj7EP02IaGk5SVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 19:30:22 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 19:30:22 +0000
Date: Mon, 7 Oct 2024 15:30:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
CC: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drm/i915/display: Fix spelling mistake
 "Uncomressed" -> "Uncompressed"
Message-ID: <ZwQ2ykjAnDr6kER2@intel.com>
References: <20241002074903.833232-1-colin.i.king@gmail.com>
 <37201309-7143-4c28-93d5-f74ff9022190@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <37201309-7143-4c28-93d5-f74ff9022190@intel.com>
X-ClientProxiedBy: MW3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:303:2b::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fd190b-0896-4e68-8c96-08dce7067c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1UZAUoZMGWuSTm46qVji3Awc4NGg1HrKe2A8tu1gvLcxOAIPxjO8Nyql5wLF?=
 =?us-ascii?Q?xOnTPGTtJlxX7h9zWYl1Uh54LxeRBeC5KD/UuzoOSg7n2j2txhE+fdsUSiru?=
 =?us-ascii?Q?Wqs+Ji40h1pe9nH6ogvzIgnquamH/oP46jfQyxr0KHtDM69OeuiFS/1OLL7o?=
 =?us-ascii?Q?OnJqAziXAG4sgREgvcUr4NeWbJQ3M+6+ZdUWo1z75Lcc9C0NBizfn56ocft0?=
 =?us-ascii?Q?pGlZMZZaBSFNr7WmU8oHlrxHK/Np94PP/gAiLJSf1vfOneuJ5cMhtg0PSV+p?=
 =?us-ascii?Q?DRSsZiGFTiso1DNkpVdgQQ7td9iKnOQZd4rz3Yc8oL8An9ppn5DeeC/qU9uZ?=
 =?us-ascii?Q?i9ozCpp2dW1uf39TKyKDs1kX7i0ac2eL+xDZrMhomNDke7YpnJNp6Dd1yBGS?=
 =?us-ascii?Q?BFBddGTi/AD3Wslh9FtsXy1UJZ3Y0Ljv39EPhxQTfAES4yX7rnkv/yHenjRD?=
 =?us-ascii?Q?iDchKLBhwbve1SkJ0QSV6/cFpggUcEtZVPvPqIBb0OQflI5ZtaZPjDpPYMix?=
 =?us-ascii?Q?/YOrYc7ThEAj8oUNzi/TJn2Wj71SzOs2BxH3CObTDXfnc9Wl6aobd2XkMDn+?=
 =?us-ascii?Q?UT4t1q2zJR6zOFrAdgEohoUX5HPQaBgfHok4Bq6PuAtgRIWuJhodaYr8Fl/P?=
 =?us-ascii?Q?mjp9rBn0xqBHKsCYLR6gWnWMzcdq983rfsWC86retTnJShwp+pmdF8s23HPH?=
 =?us-ascii?Q?pcWX6r5PGzG6chDUTwJypICZQBtycGDR0Ib43N+j0Ict5PIJrEVrtcSoPohe?=
 =?us-ascii?Q?Gja39G3vzPtTVU8zbS56MpGLj1AtW2ttNNgR42+Ec6Dx1l3Jqc55A/hTZ6UR?=
 =?us-ascii?Q?GLHE627jTI2n+77M103QVs5uCAaREEWWPN+Ie8CtUa9TTWqiR98BXZYvTXbh?=
 =?us-ascii?Q?7ya3MqUp2FCT6KgOPDh25WYaK/kZzxrPUGz8PrulXBHZlDzBsRGW+LmGJBKS?=
 =?us-ascii?Q?Lf/S5bYvhF9wyWsDKfLRs3hV+HQMrJ5Bvk+UX7GBZ5cpYbQM9y6x9KlmBg5n?=
 =?us-ascii?Q?bL7X+8S/mRRqq0ujfYLeLOFfcwHUwsvoaszHmB4Q+B9D6vXi5Q4sGp34pigo?=
 =?us-ascii?Q?Pk6RUjqFiIN8UKd1qAxkhTdmGFqlRNFox8QwHiBeZ5KPBu3JyWkcnu3GtXsc?=
 =?us-ascii?Q?li5kU4+HVJoQN4Bb6XeES1YgcPmMHXij9YbGGJ+CYF+sTo7crvvm6NrFy13l?=
 =?us-ascii?Q?7epJCkb3Q5piROoF+MGMCgwquZs14bbtdF+E+kySWXRRVFhxLja80gGqFzKw?=
 =?us-ascii?Q?x5rMy8xBtpq8gK3kP2PN8OdAqCWScLIAMoez63eyBw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2854.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qvh3BE2Xmdfv/QCeG0UUhNDNSMf2sBsWIixO2ocljV3wnn4emp0PnQvPLuOz?=
 =?us-ascii?Q?JkK4d6V7dcSM4IAsZ1Nayp0qFMLBSgxpfCFB7ihwcdikv9RWX90GxmkdFH9b?=
 =?us-ascii?Q?N6RTkNTrT+SZyGUxSvhV2AkbB+CR0veGnyPnxioW//VZDYBj5UPznbpWqK6j?=
 =?us-ascii?Q?kGJ6YL8pXVlcg1bSWbUvnZTsB1moB7fqejVxmQHgDuFH2UIykVqLNFnBp7Vg?=
 =?us-ascii?Q?7Sgm2j/Nu2/p2drckGnlE3yjt72shbVrjVMuDbt0CebvlL9tYaFbUZTmSShn?=
 =?us-ascii?Q?oa7nVrFdz622gtRuLTxlF4/pUu3S+D5adiQkMRMWtB+7Lf3qfvhYIgu+Qj3Y?=
 =?us-ascii?Q?Da0MiyEhj11q7lZpynynUjoZsWzpVUKKNoovyatkJjKpbhoRAYR7joXcbsH+?=
 =?us-ascii?Q?yyIOw4RzlMdW3IhQVvfixyduPl852CJsWDnjM+K7IN42ONFV5lKOjyNuo1iD?=
 =?us-ascii?Q?lJ9QPdLiIPe/pRzueT7Tv8QAHDYBP7d6+73l7YtWhNjqn2laDJQ4lRgx4XY3?=
 =?us-ascii?Q?ERTSbPqyHEKpElDjLq+ePYIYJJpJzPN0UBcms6MXgATPZT536SYJuotPyw8Q?=
 =?us-ascii?Q?bCazTmZHIp1TK6rMeXMg9gLDpSyrs/8fKF1VXpkVawQ2yv0fbtNS9x7RI98V?=
 =?us-ascii?Q?WQ2InzqOSvn49JbhxU6hN7iEnGI7U2shs9y3ty9aX7P3jpHUV7ICn/bEWebg?=
 =?us-ascii?Q?nZvdNPyYWiFaGs/IC5sH+goy9opaRuEAfuWimqo3G6VBzROEVB0BpwW7VWaD?=
 =?us-ascii?Q?2vlzlt11gWPpvommu8ex1jL2OjdJw2/j+DpOoXRB9rRknKZX0+5reC6UdZLW?=
 =?us-ascii?Q?S661hGk6pv7WGlkezlon49GNxUiHN+ubyc5RQWm1jL0FN44F2Lwi4Q4MzRnQ?=
 =?us-ascii?Q?fvvt4oDHAolEAnHLE5UOH6h6uJcbMpaGHpKQDxJilXyfc5vKzGs+Z2Qms5he?=
 =?us-ascii?Q?cWfpE/48XExANOxyyLFU0iOfO3Vzqjsjp8iO60jQvugz5darIiwcqdU6qDQL?=
 =?us-ascii?Q?6CSkNUDKPHdxLvd/inI9MBIMlMLCLgtHEaVbywO6j3SAzfG6vgt168lP91eT?=
 =?us-ascii?Q?/Z9NU1/2uGTfIXPXGcnkk7po9eutM9CWl3/NrPnzKvSJWFkTodN6VgyeWvNH?=
 =?us-ascii?Q?yQWBYt9CrRJGzbICbGwMbpcJYultW0PtzPDSh62LUAABWjbJ3DrAlyFZcEJZ?=
 =?us-ascii?Q?2qK5gMXB8y9x5E/mv3SMYXFxZjNQJXpwYGZUMf+g7OVEYqXqIlPleTk8+Rtp?=
 =?us-ascii?Q?ltvkxtKGYDlgUVOTjQUW+G5QWhRmYMvkvBL9T14zPFHAeb3L0q/v7ny3YcrK?=
 =?us-ascii?Q?kWvtecoQlhARMEY3Alj8nPX079EKAyK/QJ7zDOUYwrtkzt64iG2BOtggYWNS?=
 =?us-ascii?Q?ozmAuTU9vYTuNU2qH/4248Mi3PVTSINfuvGpPngNWM/ThQRYxOcqK5BYq4ow?=
 =?us-ascii?Q?i3rjTOt68ebiWkUUvikUWL1SwJKgWmBvIMgIRnrMuCV6D+u40yiAcNWdXmrX?=
 =?us-ascii?Q?2XZhuDKhj0CiaAw0ATfdmFihbfYYd9IFX71tMoat9jcxMHPQv9TEfd5v61KH?=
 =?us-ascii?Q?UJC1910ypi7mGRYpKeJO25E3QMcuurIkbnzy7CEN8x+O7tOFZ7hi9Tm0It+U?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fd190b-0896-4e68-8c96-08dce7067c7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 19:30:22.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqAw3388erTpfcLG8Bs5ObyEOmqqrnn9XWLxJ9KEh3KbbvtNGLDxxKBKvogCX5XdhDPhDtJXHXWx8BVedab50g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-OriginatorOrg: intel.com

On Wed, Oct 02, 2024 at 01:32:29PM +0530, Nautiyal, Ankit K wrote:
> 
> On 10/2/2024 1:19 PM, Colin Ian King wrote:
> > There is a spelling mistake in a drm_WARN message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

pushed, thanks

> > ---
> >   drivers/gpu/drm/i915/display/intel_display.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index 74311bb9d290..a5057ee4cbe5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -3811,7 +3811,7 @@ static void enabled_joiner_pipes(struct drm_i915_private *dev_priv,
> >   		 secondary_ultrajoiner_pipes);
> >   	drm_WARN(display->drm, (uncompressed_joiner_pipes & bigjoiner_pipes) != 0,
> > -		 "Uncomressed joiner pipes(%#x) and bigjoiner pipes(%#x) can't intersect\n",
> > +		 "Uncompressed joiner pipes(%#x) and bigjoiner pipes(%#x) can't intersect\n",
> >   		 uncompressed_joiner_pipes, bigjoiner_pipes);
> >   	drm_WARN(display->drm, secondary_bigjoiner_pipes !=

