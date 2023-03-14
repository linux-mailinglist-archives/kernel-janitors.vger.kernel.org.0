Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3C16B9BBE
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Mar 2023 17:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjCNQhS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Mar 2023 12:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjCNQhF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Mar 2023 12:37:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FED6B5B49;
        Tue, 14 Mar 2023 09:36:32 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EEuYCL029403;
        Tue, 14 Mar 2023 16:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xE78rOhENvxzwN/jZO3oIOvhx6dV/6fT2Bvwxfynab4=;
 b=ZcaFvVT/u6bMROEFbQZ5gGSpzIP7YQ7MJX6kaloaQ7O9EgCgJdNFNENLioQiEA6ts7Uj
 non8071AFsWZT6Q9tUFmIdFgBD2z+C4eDIROPjyguKrkbn0Q4LU+M8Ct7E9wUL+xc4OR
 3VW7UuITT3IazA95oNHKHPmY1d0Yr5pWTjBTOzFzaSNkwW2Ip2jmmpiXyDd8iU7a8EBK
 x/rjjDhGJDkJ63DffmKmWwtKxTqgxcZezogCEVo0oMYYrWLsZIWl417Nx7EPyYA8nUEe
 WDZQKHQOJNRZ+yxDpDvL7SvkxmwNwYJzgiFG+ZKmflZFz9ZLLgRhrJ/2UrN8TBwn+/Te Uw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pau4mga0n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 16:35:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32EGZw6a015874
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 16:35:58 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 14 Mar
 2023 09:35:57 -0700
Message-ID: <9dc6c74f-8982-0ccb-af1b-e6ef22276886@quicinc.com>
Date:   Tue, 14 Mar 2023 09:35:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH][next] drm/msm/dp: Fix spelling mistake "Capabiity" ->
 "Capability"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230314082050.26331-1-colin.i.king@gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230314082050.26331-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AixY7ideUSUqI-B9Au3qBmqNQiHVj_eP
X-Proofpoint-ORIG-GUID: AixY7ideUSUqI-B9Au3qBmqNQiHVj_eP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_10,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140137
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 3/14/2023 1:20 AM, Colin Ian King wrote:
> There is a spelling mistake in a drm_dbg_dp message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 5a4817ac086f..42427129acea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>   	} else if (dp_link_read_psr_error_status(link)) {
>   		DRM_ERROR("PSR IRQ_HPD received\n");
>   	} else if (dp_link_psr_capability_changed(link)) {
> -		drm_dbg_dp(link->drm_dev, "PSR Capabiity changed");
> +		drm_dbg_dp(link->drm_dev, "PSR Capability changed");
>   	} else {
>   		ret = dp_link_process_link_status_update(link);
>   		if (!ret) {
