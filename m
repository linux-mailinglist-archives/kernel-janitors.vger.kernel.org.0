Return-Path: <kernel-janitors+bounces-7727-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60BA89F92
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Apr 2025 15:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 164723BC29B
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Apr 2025 13:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D3F13AD05;
	Tue, 15 Apr 2025 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nIsw5QmH"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB61EA91;
	Tue, 15 Apr 2025 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724136; cv=fail; b=KZHjleGQIYhroe5988YZ9ovX8Gt4EQ8T5nGG8cXFEIZy3rtwW7/GlxIjZ4BMVLSNLKwYGAZTe48EZDMlNCZmbYR6DHix5QXO4o4TIkbFKmgspn4FHm7R+sBKrkSr0vxYhVg/ZwYFoTDPXyL669kN7GZ8oghs6akaDjcvKK9hVso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724136; c=relaxed/simple;
	bh=Z2kAg/c50dGRVXRYCAW1JBrEkkojMNUC/wphXaWLlXg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cNXCe6ict3yKBwRKAsCmnYpLLESzcY6Id4NdHJ2KWBmicvJJ33hF8MJmi3m4Or4zttN/aOd7oKpieHKA8cKyIxilyJvXrLmeUdvor22EcAs6sePIvLJET2f/J0v3LbnDykXlsLD/Cp7TNfg9IBKkc/vXh8SGCapFnM0uq/JbaXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nIsw5QmH; arc=fail smtp.client-ip=40.107.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn96vFX3q7Ag8tNZDbee6cboRIAZGmDH4jC7efs0O/A/DplO9jh//W1ae7+ajfsYnOMpPmBKHOOiewN4u58Q5eZ7AlXk4yxmAiaSAGIDXgA3N/6/lvhKUpkCtcJEYFdhxjlrs/8D2gQhufQqI9rh1cUlAGBGerjwhNnnEL4NKV9ifmm5zfjS0yu+TZSt5rdY0bvZWigCDmYQOSkVmgb5z88r00qJRmFYUGiObr9J2CsocnGl/ghfd+tjWGGEVGptt3YKOOwXmORf91RYSH5wU58L9i5jWwDBU+8+E+ZPwEcQLZ7UWFl43D5HTuioqInq2bAGsb1sGbfBMuFdODdxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ09OyS/pbDtT+JbnqEb1gCI76Q67boGk6J5L11bxPM=;
 b=wzQf1ZuTKEhfe6vKnCVsWiB3GEP4PsH6TbaxYFv8XW7wRgZVKSKH9QeIrwrnFKC96b21HgU3gD33L+LuXzOw/aCStrpu2/inmf1faWHXdBIganBjIkgqeeQTnGg/t04aEDLti7TsmM3lUMkrvdUR47QnIvkFtWv//9AY1erJgDsJuP2nZD6E29t+UuTxwN/IVdKA89V4PyOn2ld+7z/Stm++DVNaR4sdxb+afut3/Mq4RZNKHHiLnYG3xeAuBSw7Aawg7Qbpe1FNhkEGZGrzKGBLp3gG+Kqs76ho/a8elpFA9Y09A43004FUsIoQ9YTbQOLLg2oaqQIZoHtkCjuOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ09OyS/pbDtT+JbnqEb1gCI76Q67boGk6J5L11bxPM=;
 b=nIsw5QmHhtKFNUaK6706NDx1NxhYjabUfUHw0xcR3e6AIsA+fr6ULAxLqkQEoAPjlaSdes32pN0UKKJQ8vvXkrUve8loO69s4A8Nttj/76SF1UQ+tKA84OvkATHRaRrSTphp0f8PrWee8MOSuW9/lxm1Hn8lNt733vCr6kidK+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5338.namprd12.prod.outlook.com (2603:10b6:408:103::23)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 13:35:32 +0000
Received: from BN9PR12MB5338.namprd12.prod.outlook.com
 ([fe80::a140:210f:ff90:335c]) by BN9PR12MB5338.namprd12.prod.outlook.com
 ([fe80::a140:210f:ff90:335c%4]) with mapi id 15.20.8655.021; Tue, 15 Apr 2025
 13:35:31 +0000
Message-ID: <2e066edc-e279-4252-ba67-b4be2b462084@amd.com>
Date: Tue, 15 Apr 2025 09:35:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/amdkfd: Fix kfd_smi_event_process()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <Z_44oq-aSZOsvxTN@stanley.mountain>
Content-Language: en-US
From: Eric Huang <jinhuieric.huang@amd.com>
In-Reply-To: <Z_44oq-aSZOsvxTN@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0192.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::35) To BN9PR12MB5338.namprd12.prod.outlook.com
 (2603:10b6:408:103::23)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5338:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 096fa7f5-7743-4af8-b308-08dd7c22648e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDJiNTlpYy9SYzdwZlI5SXdvdWJnVUFsQUFmaU1OWXp4OHFPR1ZVU09GMVcv?=
 =?utf-8?B?ZkFRcVJvZlpITStsa29pNHBGKzdjc1BURUU4R0M4V2FmNkhXNHBaNnFURVF0?=
 =?utf-8?B?UVpHWGZsM0VKUHdqd3k2cGw2M1dmSVpSTFpvNmt1bDVKV3AwYnR4ZkU1TUNM?=
 =?utf-8?B?MU9SakIvVERCNU5PUHpHU0VzeWcwckRGQXZzSk5WWWY0aEFteFczVzdJNHJK?=
 =?utf-8?B?QVRLaGdzU0NvNld2WFNFc1lPUkVkdjJEeXdaWXkrMmVPSG5BaFd1NzlBcHdr?=
 =?utf-8?B?Z0tkZ3VJTldNa004Z3hjVlJha1ZzV1RQZ25JTEFzTzh6bTlsMEwxZmpOdGdJ?=
 =?utf-8?B?bVZxRWNVcnJKVWYvNDFST1NVVVdTcDdOeldvQ0hwQTI5cWorTjlzREoxbDI5?=
 =?utf-8?B?Zm96bWx4ZW5jM2FwU3BlT2VzTVdGcmxtT2dOWG9EaWlZczUyS3FPdG1GcVJP?=
 =?utf-8?B?ZU5GalBBWnlrNlZUdFM2N1F1cWRVb2k1L3ZTbW1jSnd3ZmZXNWJsb2YvYm9J?=
 =?utf-8?B?T2preVQxNUZySjhZTldma3JRWkRqR3ArTzVvTmkwRkczRXFkdWY2V0hIWFdZ?=
 =?utf-8?B?Uk12MHo1bC9OcThWUWVvbm9iNUlJc1k3UkVNQWRvNjdlRDc0ODczQk1iR0pH?=
 =?utf-8?B?UkFLeWRFQy9rZ3BYMTdxMExKMDNBNk5Qak15c0RzMEpyQUd4aXk2T09jTlQz?=
 =?utf-8?B?QjlscHZMYTZ6blpUeTRBWVljcVZXSk5YemQxcm8reUt3QVRZbjlSdGpwTXVn?=
 =?utf-8?B?WlNLdzc2QU5pZnF4TFpRRGt6bno0NUxYSzdyZFVPOUlRenpUQWh4N1VmRkRM?=
 =?utf-8?B?ZmcxZ2tIK2J3d0VQc0RrTk9hZ1V3Vi9uWWd5U3lqdjJCNERWd3NsYUxjcm9j?=
 =?utf-8?B?U2VyVXVrWlM4S0cyVTA2Z3VEV1lINHVjZWZrWDhkM2lBZGFIbGpUSWFWV0NG?=
 =?utf-8?B?dk1KTTQwc2FieU5EdVhwSnZKTHhLbEhyUGpEczhsamJKUzh6Q3pZRkh4ZWlm?=
 =?utf-8?B?NE1QMysrMkNQWWFLZTNWTkIrWDRzaFM5bEFsdFFQdG1OWG9xVkorWmhucGl6?=
 =?utf-8?B?Y1E2RlRNSVNxRDBTcnF4Ui9vS0xmb2ZSbUFmZ1hvYWpScGplbVdTWWM0RWdm?=
 =?utf-8?B?dEdVZEF3czBHYkFkSkNBR1V5M2xaQmI1QVNWa0JFU3NaVG1YczB6VEVoYlY5?=
 =?utf-8?B?WWtBdjBhT0Y0dGh0Nm5SRm1OSHpaMTBTeUk5eCtNVDU4TFhUbzBNNCt5Vng4?=
 =?utf-8?B?eU1CVWZEVTd5dXV6MVhJakthZGJaUjhzdVNPSDJBOUhKOEZnNmN2cGNETmtQ?=
 =?utf-8?B?cnkvOGtvWm5kRC92YXFkZmhlZTBpZDJ5dElmNlB6OXkweGViQnJWdFlRZnY4?=
 =?utf-8?B?SXJGM0poNG1tbTZ6NFlza3FjYVRKN0RaT0N2ajFqNjVqYWRzL3cvTGlsUk5q?=
 =?utf-8?B?YkFCcHJhK202cENjbU5naHIwTGVXSnNvN0FraW1RcWowTjM0WWgwYnd2TmNw?=
 =?utf-8?B?RytPM1BFTVdCSHdmOEMxRlI4a1lRZURhS1VJWTBYVkFycEdUditxNTh1MTVY?=
 =?utf-8?B?MkJaVEJ3TkRoVC9SL2t3NzFGd0dobzR6dFEzTHFSSklhT0ttVUdOcG9GT0Mv?=
 =?utf-8?B?VlpQUG1DRk1SQTFvc2tTTjl5QmFBOU1FcVhvOWh6T0xsYlplZGJmQW1ORHlH?=
 =?utf-8?B?ai9mU0lGcXV3eG9CdDJlNk5DNnVMNVdZTnhUQ3AyeVhic000OC9leDJqcTRM?=
 =?utf-8?B?YnZmUUwwNGFLNGpLczhZak44NXRKNjUyaXZadXQ5d0RsdCs1Rm5lbjVWWGFO?=
 =?utf-8?B?M05hWE4raElONFhaY0xGQ3pXSThpNUoyWXh2UE9yWHI1Y3dhd3ExUjZMQjdU?=
 =?utf-8?B?WkJJSGZEenk5cld6ZzljZnM1YXJkOE1yektFTGxZRFJOVDk0NUNNdDMyTEFB?=
 =?utf-8?Q?IQ2NQ7VgDPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5338.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1F0K2pJVzlZUStqVUJqdVdtZkJ5TFNmNktvR05UZkFwVTJDcDU1Tm90UlNG?=
 =?utf-8?B?cXBCamRuUWxuazVPYWpnMnZlMCtSWFQ2Nzlwb1BhRHFtejcyUUVFYUxsYWZz?=
 =?utf-8?B?N1VjY2tyK2NmeFNOaXBCTm52YkxGU0ZTUmo3disyZUpnVG5OZzBhTEF0S0lv?=
 =?utf-8?B?T2RJS0hRc1ZnZlA4ZHJXYXlHN2VQRGg1d3Iwd3RUWVh2cFdqQzA5NGV0UDkv?=
 =?utf-8?B?Wlh2dzRHMExJVTFmQ2JFem9nNTJvNkRkU0RaS1F1NlF5b1RiRUpkc1I4RGM1?=
 =?utf-8?B?OGtscTY0a2R0eTU0QTYvYVdxczA2Rm9GZ0xINFZuMDdxT1hGSUh5ZE12VVdR?=
 =?utf-8?B?TGozNkZOSVYvMVF3WWE1RXJxczlaRldvbWdXQ3RFekhXZmJZVGNCY0E5bS9l?=
 =?utf-8?B?S0x5MGJxNlFkVmk4bUcxMHhsQWlncFhjMlAwOWNhTFloYU5YUUlId2ZMMmZC?=
 =?utf-8?B?ejU2UDNhaGMrSVFaalhmSnQ1b05GT0I2V3ljMVVMVWozWExKMVpRL0U4bHhn?=
 =?utf-8?B?TDRWQVl6Vkd0bWdocmk3SWRWZi9jTzJLS09nUDJud1ZnME9pWnJ1dUVHdWw1?=
 =?utf-8?B?THcvYnI0VERJTnVDNktDd3NOQlpQamJxMTJkaTJTK2hXMHVBcDc2WmVab3ZH?=
 =?utf-8?B?SjdKTDJubXBsbThKREwvUGdyNTRUSGo1RWNRYk8wYjdCazk0V1hiNTFLN2dO?=
 =?utf-8?B?eDVXZTY1bjhpWmRsSXdwZDVOaDFnR1hhTmwyanBwUkt0NHFoUWZWc05GaFJB?=
 =?utf-8?B?anVaSUhrQ2FJeUpYT2w0dExYL2ZOMDQ0QnZ2U2dzRDEwOXFqWnVYSXpZS1A2?=
 =?utf-8?B?T3hiZ2tBQVQ4UzFMQk5zYzhOME1tYUxPWFI5YTVRWGZpVVRPVVhGdXZqdWNa?=
 =?utf-8?B?UnY1N0szV0F3WnR5NDVvMVd4TlZ3RFRxU25uczRzdkZoWDYzQ2pkMkJpMHQx?=
 =?utf-8?B?ckppcWVibythYzc3TjFhZWlUdForOSs1MC82Q3VHd3RtdWdkMU1LY2F5UFBQ?=
 =?utf-8?B?UVVhUSsvc1c4SkRiSzYyRDJJSC9MZHVZdTBqd3dncThzODZHV1dlQzEyVmFC?=
 =?utf-8?B?SVZkMWV0SnV2a1Z1R0ZQbUZ2ditobmlGMmdtK21rSnRCRWdLU3B2b3k5TGNV?=
 =?utf-8?B?TVZiN1FFQkZGZzhveEp0MGk4N04vYk55cmZ6WjN5WTZ1SFBhNG52WXhWL21v?=
 =?utf-8?B?cHNnR25oaXl3Qmh1cXhLd0FzaERnZG9uSUFKeEVBMTBDMVlON2t4dDJ2TGsr?=
 =?utf-8?B?ejdOUStaQ1pRazJBTFVDbjdKdTgyUENBWE9VWmN5ekJhZlR3Z2pMMWVDcVhR?=
 =?utf-8?B?elFnRzkyNXJDWjlBZDRvTy9GKzJjc3h5aWNPZ2ZKZlpvUW5ETURsTFE1RVU3?=
 =?utf-8?B?YTJDM3hhbFNPYjYvUWwxTDIyZUxIL3RBbzVmUk40OEwyUlhzV3FXRWN3aWVB?=
 =?utf-8?B?ZEhPYUF5RVp2aDBTYTR0Q0NQTmFRZzJGNG5Vd1VKNkttemFGR1N2MTIzeSs3?=
 =?utf-8?B?UE9PenBseXJPeEJlTHFDYnRJVkJFbEI1eDdTdFlZSnR5UVhIOHpIcW43M3V6?=
 =?utf-8?B?a0hzN0N5eGJ4aUxtemttYkxqaW10YUwvVjJzd2FzbEFEc3hLWUVrbS8yUFg1?=
 =?utf-8?B?THZ0UjNtdHcxV1lLbThSdFNqYStKMjkrVnF0bHpseGR0U0k0OXhSdlpWVzVp?=
 =?utf-8?B?aHhCR1FZcnhsOXFnUUVKR0RucG9yMjF6RTFML0FsTmlxdkdsVk1WN0ZGcUw1?=
 =?utf-8?B?SlNkRU5rQ2VqRjdvZ0RHaXM4QW9jQXM4ZDBRVG5KcFhGU1F2NDFoNXZ4S0FK?=
 =?utf-8?B?cVp1OVo5Mzd0USsrTWlxc1Vxcm4wQzFsZ0RYQjFxZ3pDQTdObFE4T2g0Mm9J?=
 =?utf-8?B?UVBFT2xHVjFhdGF6TmE4TmVsbTFDRlI4MGFzTVAzK3ZGeURGeWczeE9Rc3Vv?=
 =?utf-8?B?cW9GRTBqTnJ6OTVUUFU3ejYrR3ZScUNWNk1tN3RKSkc1UWE4ZVVXN2dCdkVQ?=
 =?utf-8?B?c3poSWpjRWVGQWtKZk5IelFUWGpWbGdCRk5tVjBXQVdQaUhMTWtJODZaUVFN?=
 =?utf-8?B?Q0ZQcVVNSko5a1o0cUJSMWFGQmpSRWlmektOUkp6dE82ZnJUN2c2aXhBOWR5?=
 =?utf-8?Q?UeD3ZxQEcTSQA7vzK1ZhbYxFm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096fa7f5-7743-4af8-b308-08dd7c22648e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5338.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:35:31.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbAgrnUWlgPzOuCjYZuaOIoJDuhCUL7UpVddSdxerdxtzYaiA/DwLDeu0X0CbUzThh81TbvkSwj1hiRpEKhfyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

Thanks for the fix, I had the same patch submitted yesterday.

Regards,
Eric

On 2025-04-15 06:44, Dan Carpenter wrote:
> The "pdd->drm_priv" NULL check is reversed so it will lead to a NULL
> dereference on the next line.
>
> Fixes: 4172b556fd5b ("drm/amdkfd: add smi events for process start and end")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> index 727a4ce29fe6..c27fd7aec1c3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> @@ -350,7 +350,7 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
>   	struct amdgpu_task_info *task_info;
>   	struct amdgpu_vm *avm;
>   
> -	if (pdd->drm_priv)
> +	if (!pdd->drm_priv)
>   		return;
>   
>   	avm = drm_priv_to_vm(pdd->drm_priv);


