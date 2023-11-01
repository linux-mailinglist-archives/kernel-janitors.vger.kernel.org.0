Return-Path: <kernel-janitors+bounces-110-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564E7DE65E
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 20:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9827A2813AC
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Nov 2023 19:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFED219BAE;
	Wed,  1 Nov 2023 19:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nOUHl+xJ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1314291
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 19:23:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF438A2;
	Wed,  1 Nov 2023 12:23:37 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1IvWu1028689;
	Wed, 1 Nov 2023 19:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1ELBUMO6LQex2lRUX2C8oZVN6zgVigoUeDnZ1qMuQww=;
 b=nOUHl+xJiCxIyiD2mkRvdNI+nyJGGOGslaqMB3kNUEdVnz8E3IRLWoLzmJ1irSRvZgC4
 cYvpF7IqDV+BGy6RZRFFArKOGGRizgUcFbaR0Px6Do2sf7UkhmCoqt8N6FkqViKZX8ok
 gfEkw2YZGQ16GDPHBkqtLbVPSUWm+G3Yvy10LBIa1astAKamKxGv63jpXCpDt4eudIDt
 u8VGIEzUqj73vF3I3A0kOxyR/S77u2Vpk6XgMGTtAHfCskd6SHC0YO39/p7urtNMbk5a
 ljkxA5XaydDTvTbKAAIqON/lPEFn5bQrvok0gJADmsJvn2GWLkYgqwQJWpZFnqLL0063 Yw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u3s6p8kta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Nov 2023 19:23:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A1JNJbX016191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Nov 2023 19:23:19 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 1 Nov
 2023 12:23:18 -0700
Message-ID: <095b7283-3555-cc38-a73e-83efec8a9bf8@quicinc.com>
Date: Wed, 1 Nov 2023 12:23:18 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm: remove unnecessary NULL check
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Rob Clark <robdclark@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Su Hui
	<suhui@nfschina.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>
References: <ZSj+6/J6YsoSpLak@kadam>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZSj+6/J6YsoSpLak@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xXKfCEOlyY31BSOR2vplPqPVUMw_0k8W
X-Proofpoint-ORIG-GUID: xXKfCEOlyY31BSOR2vplPqPVUMw_0k8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_18,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0 mlxlogscore=843
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311010143



On 10/13/2023 1:25 AM, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around and now it's not.  The inconsistent NULL checking triggers a
> Smatch warning:
> 
>      drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>      variable dereferenced before check 'mdp5_kms' (see line 782)
> 
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Added a Fixes tag.  It's not really a bug fix and so adding the
> fixes tag is slightly unfair but it should prevent this patch from
> accidentally getting backported before the refactoring and causing an
> issue.
> 
> Btw, fixes tags are often unfair like this.  People look at fixes tags
> and think, "the fix introduced a bug" but actually it's really common
> that the fix was just not complete.  But from a backporting perspective
> it makes sense to tie them together.
> 
> Plus everyone introduces bugs.  If you're not introducing bugs, then
> you're probably not writing a lot of code.
> 
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


