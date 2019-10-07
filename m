Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74A8CDDEE
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2019 11:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfJGJFK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Oct 2019 05:05:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39930 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbfJGJFK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Oct 2019 05:05:10 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9793sAB190784;
        Mon, 7 Oct 2019 09:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=AZlVy/v5j7VXaRAfnO0tRAhrUXXKwmdhlGT9d3YgqK4=;
 b=qZ2P3mRzwZ8OsOK03Z3g/SIqb30W75bWP4pu4ZLdV4yAmOG4P0alAic3EjPe7y8OcAiX
 0kOSq4Fy/WdmwBxEEyki3SB9ojeCT//cY2dls/9/b9aFC4wHHpb7c/ZQXupkHaeNh6Yu
 vdc+8OysKod3czJRISDqzMUyM355z/efUaYmojJzSwE84mu2AEy09V4zQ7Zxifvntaa6
 +zoJUmMZQnaOTz+nYxsOftD7iyPMsfDFIFEib8ws13YWo8CFqdZCdnzzg5gK6OX84BqS
 gN+Rjhb/QObD7Zqp68SGiEhTuG4zIjkrXFVYKH1V5wmnbYUZHBoLShFNBHz17Sy+i4RH Vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2vek4q5fnr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 09:05:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9794ShF189353;
        Mon, 7 Oct 2019 09:05:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2vg1yth2m1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 09:05:03 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x97952lW013639;
        Mon, 7 Oct 2019 09:05:02 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Oct 2019 02:05:01 -0700
Date:   Mon, 7 Oct 2019 12:04:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
Message-ID: <20191007090454.GE3865@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070095
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function needs to drop the mutex before returning.

Fixes: f7e3a5776fa6 ("drm/amd/powerplay: check SMU engine readiness before proceeding on S3 resume")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 6a64f765fcd4..f1fbbc8b77ee 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1384,7 +1384,7 @@ static int smu_resume(void *handle)
 	ret = smu_start_smc_engine(smu);
 	if (ret) {
 		pr_err("SMU is not ready yet!\n");
-		return ret;
+		goto failed;
 	}
 
 	ret = smu_smc_table_hw_init(smu, false);
-- 
2.20.1

