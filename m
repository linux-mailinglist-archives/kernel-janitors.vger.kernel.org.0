Return-Path: <kernel-janitors+bounces-4306-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CB915A2D
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Jun 2024 01:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 348F91C22464
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 23:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F3E1A2558;
	Mon, 24 Jun 2024 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WTyukIwy"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E1F4AECE;
	Mon, 24 Jun 2024 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719270057; cv=none; b=UuYH9n4Q5NQvWngH35HXZVDFTYVjacvaDkF0ojEocil3v4aVDqWzgBWBIMCB3N8NrviuF+WbNGNAV+iRs4Q+x5x4qsXOdNNEbKi11mDXS4fWh9Wl8a7WxMIA3mp8TFlH4li330PnQOaFa+u4dDtX/ipnNhRaHE0p/PszeWHveZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719270057; c=relaxed/simple;
	bh=Ec35imzGEuBbXxvRYJAo/TZyYqIrFfQ1Ebjn3oL/DFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q9wLXVslS3FczjsZ2aIbM96uclQ8VtmkzC6YNe/wUXBflRHhenlVgYHXgDB6QgJxmfwPvjRIFEpbeoHWvtEutmqQh7kDqxKnElEvjmWfJyMHl1hlIQgybxWjlNrLFmOipPWhTDjSibYVq12KJkTueHYMRpR/2DwHRJglCxSpRbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WTyukIwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OJ1Hmj031385;
	Mon, 24 Jun 2024 23:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hQLfmAiXIb2anfT/qj3Vwa6Wgr+wflqbuNpn7rd4dM=; b=WTyukIwyVNr3VUQ5
	8CTXPAo7quPHE52d8umIC8/n7gi7Ozqu98AkVoI1QdP+j+tbM1guToqxD5nBcQW6
	bBQKTcnJsomxTv6Asum5J+0rkbrizZq9ebR/QTKBtl/512ne/PgaqV1JIPU0m+oy
	zb9p49+24XmUdfjKS9r8t8O6iuTjSSC2KljINciVS6awIffMD7dc4h/8fPUdoij6
	lzNApvEpO0nCa+eH7slwULbUu0/plA8wat3dKGpQnvwWH+Y4r2ROII1+Xm7ieyN1
	zuWmG0YDt2YiMgsj3yVIJaPucyhYQLMJopSH4+bQrwD0oCg590LI8fiBFwnKKHRn
	VPmTgg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv4tjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 23:00:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ON0i87001796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 23:00:44 GMT
Received: from [10.48.244.142] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 16:00:43 -0700
Message-ID: <aae7de31-b027-4427-83e7-0943257ef229@quicinc.com>
Date: Mon, 24 Jun 2024 16:00:42 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/tests: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Christian Koenig <christian.koenig@amd.com>,
        Huang Rui
	<ray.huang@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240609-md-drivers-gpu-drm-ttm-tests-v1-1-d94123d95b4c@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240609-md-drivers-gpu-drm-ttm-tests-v1-1-d94123d95b4c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rbILnTa6iw5-rIVTROzockP09gxP5XVO
X-Proofpoint-ORIG-GUID: rbILnTa6iw5-rIVTROzockP09gxP5XVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_20,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406240184

On 6/9/2024 9:34 AM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_device_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_pool_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_resource_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_tt_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_bo_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 1 +
>  drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 1 +
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 1 +
>  drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 1 +
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 1 +
>  drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 1f8a4f8adc92..c18547c65985 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -619,4 +619,5 @@ static struct kunit_suite ttm_bo_test_suite = {
>  
>  kunit_test_suites(&ttm_bo_test_suite);
>  
> +MODULE_DESCRIPTION("KUnit tests for ttm_bo APIs");
>  MODULE_LICENSE("GPL");

FYI I'll be posting a v2 to resolve conflicts with recent MODULE_LICENSE()
changes and to handle the addition of new test modules.

/jeff

