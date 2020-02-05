Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1F315384B
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Feb 2020 19:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBESjh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Feb 2020 13:39:37 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:38864 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBESjh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Feb 2020 13:39:37 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015IcSdv182156;
        Wed, 5 Feb 2020 18:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Z+FS+vVUNB+rW/GXdOwYEx9fArjcCjQAyAkF5v3k+l0=;
 b=rd0AJbrYkH8HZJt7lYa1u6+Rs3B/yyJAc5CjVt3BEbC3tLzjg/gqy2Y0GoMHY1JmtJMH
 RXx0PrkUXjUoxx/CW6c3qvQCo2aaGzGphwkwCvF/WWhkuFO5aX3dvjbYcrSRC9e1lPnp
 Gq+g9Vj+X2qNeM94kIYCO/k9tsX49RIICHnzspLLiWYpFav1cJajGPASd2vKuMM8vEW/
 KfwtTllNTSD/kc9a3HzgAQDEkLI2ih2bRvT1J1TMp/+5j5XzOUYdibSmEQ6xsDt0/7KO
 Teltu/Fu3kLoxfarGxZytfMNvQnczqTG7s9IkabuHPAOJU919Y+M4l0hG8oepf4qlHxm yw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Z+FS+vVUNB+rW/GXdOwYEx9fArjcCjQAyAkF5v3k+l0=;
 b=Q/URagNpI9jPADQJUaO/d+RwSN5dZA7m0fxHyD6w28iJSG+/FFY5i62cBOzDnhbYxNND
 nYrkniKvDDC3Hun9JILmOteYT1dGfl9aPEpFkZTM/Bu+e4aiASGEFIP+ZfK+Wt2bFNda
 uznG2MYyIpdNAQluSLfqWGATQxNR6tBFDYmnIpkn3wbwSm/TUBYkbhcmzbxpOAyI7Jsm
 b4YsyMAuSvOR00iX8xORJN10j3IdYpaADfN21m8k29b+oPCyKDxHS0XakPsjHt92CxMy
 w3Fhk3p7hAO193anNAzgpFlBbHDJq/PEXLKbD/j7Xny7w1+RXeykPhI3ngFgZxW1U1KT GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2xykbpcx66-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 05 Feb 2020 18:39:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015IdGHE169356;
        Wed, 5 Feb 2020 18:39:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xykc7vvhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 05 Feb 2020 18:39:23 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 015Icert019042;
        Wed, 5 Feb 2020 18:38:40 GMT
Received: from kili.mountain (/10.175.200.151)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 05 Feb 2020 10:38:39 -0800
Date:   Wed, 5 Feb 2020 21:38:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Zhan Liu <zhan.liu@amd.com>, zhengbin <zhengbin13@huawei.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix some use after free bugs
Message-ID: <20200205183714.6t5c7ewyovwjicm6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9522 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002050142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9522 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002050142
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These frees need to be re-ordered so that we don't dereference "hdcp_work"
right after it's freed.  Also in hdcp_create_workqueue() there is a
problem that "hdcp_work" can be NULL if the allocation fails so it would
lead to a NULL dereference in the cleanup code.

Fixes: 9aeb8a134a0a ("drm/amd/display: Add sysfs interface for set/get srm")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index 1768a33b1dc3..f3330df782a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -380,9 +380,9 @@ void hdcp_destroy(struct hdcp_workqueue *hdcp_work)
 		cancel_delayed_work_sync(&hdcp_work[i].watchdog_timer_dwork);
 	}
 
-	kfree(hdcp_work);
 	kfree(hdcp_work->srm);
 	kfree(hdcp_work->srm_temp);
+	kfree(hdcp_work);
 }
 
 static void update_config(void *handle, struct cp_psp_stream_config *config)
@@ -555,11 +555,12 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
 {
 
 	int max_caps = dc->caps.max_links;
-	struct hdcp_workqueue *hdcp_work = kzalloc(max_caps*sizeof(*hdcp_work), GFP_KERNEL);
+	struct hdcp_workqueue *hdcp_work;
 	int i = 0;
 
+	hdcp_work = kcalloc(max_caps, sizeof(*hdcp_work), GFP_KERNEL);
 	if (hdcp_work == NULL)
-		goto fail_alloc_context;
+		return NULL;
 
 	hdcp_work->srm = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, sizeof(*hdcp_work->srm), GFP_KERNEL);
 
@@ -602,9 +603,9 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
 	return hdcp_work;
 
 fail_alloc_context:
-	kfree(hdcp_work);
 	kfree(hdcp_work->srm);
 	kfree(hdcp_work->srm_temp);
+	kfree(hdcp_work);
 
 	return NULL;
 
-- 
2.11.0

