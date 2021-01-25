Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E4F3023DB
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 Jan 2021 11:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbhAYKs0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 05:48:26 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:37578 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbhAYKr6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 05:47:58 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8j3SJ040201;
        Mon, 25 Jan 2021 08:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=o2Nx7oIrsFkzJnTXViOPNCb7fhUPfrH9fKJyb4uw0t0=;
 b=diM34xyMMrYUI5jeeVDv2DXfS13C3NQx//VsZi/k/AE+YhgRY3PRZCZU/UeHqcoAwBP5
 +B93uXA/xlIBGnVK0ifEozcNN2ogaFlIQWza8dPQVaRMA0e0MlPnKoqruOS/Onnmo4sI
 lBESSS8PPruDhcrdkskQYpFQcXVwBca0+v2WfDOR5NffWt2jJS30lI//SCNrc1QF89SQ
 Syb6kpF2BlJpxDX5hTijwHVE9cs0rBk1utSujL7SNn23vLf/CLvf0+lG35r/bTSSqL03
 0EOVWNXX+KJy/v6wJVmj63lUnTYW3+bA9wRVRXcqPmZNiJwbHz+Xxn8reo8k8C6bWvWN Yw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 3689aacb4n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:46:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8iwXM096692;
        Mon, 25 Jan 2021 08:46:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 368wck9r87-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:46:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10P8kSjL008094;
        Mon, 25 Jan 2021 08:46:28 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 00:46:28 -0800
Date:   Mon, 25 Jan 2021 11:46:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        Aaron Liu <aaron.liu@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jiansong Chen <Jiansong.Chen@amd.com>,
        Likun Gao <Likun.Gao@amd.com>,
        Liu ChengZhe <ChengZhe.Liu@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix bitwise vs logical negate
Message-ID: <YA6FW84XDSakXqNb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There was a mixup between logical and bitwise negate so it just sets
"data1" and "data2" to zero.

Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index 1961745e89c7..ab9be5ad5a5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
 
 	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
 		data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
-		data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
+		data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
-		data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
+		data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
-- 
2.29.2

