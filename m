Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67579FD6EC
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Nov 2019 08:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKOH2P (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Nov 2019 02:28:15 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:40610 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfKOH2P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Nov 2019 02:28:15 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAF7PK9L072180;
        Fri, 15 Nov 2019 07:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=kShEmvEIV2LHdYJUNimhavJ4662/jmjscEAQx2pgszk=;
 b=fQyxU5mRGaf7tY/X2JzrhEINhg0bNSWueIFW7/U8PStiWRokqwTB2uOvuJDwwZWAkuuV
 EHtRTuNnHsALNxcpWAvYen8fJIj5azzu3OvfTftpb9ZMKakamCUT9wbEKXncTOCawxmO
 aHq/KHPp2rPS9G+xeo9yEJDBV8jYiC0YkMtrR7Wz8mUgHBhlauG7yhk+2RXNWx0fzqDV
 uQZieBOnc3Nv2MIe11D+miTldDfJYHL3f08pw/TCxHeVrB5V21g3jUGkE0N9gK5fIpTg
 1j7sJsO3GXk/kgAtBr5f0HRwlT/9ODP8NhF6yCLc+wOrSy39Tk9Ffe4A3q7VA9QS8c3A Kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2w9gxphhd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Nov 2019 07:27:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAF7Oaj7014107;
        Fri, 15 Nov 2019 07:27:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2w9h141c2q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Nov 2019 07:27:55 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAF7Rmln025094;
        Fri, 15 Nov 2019 07:27:49 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 14 Nov 2019 23:27:48 -0800
Date:   Fri, 15 Nov 2019 10:27:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        Junwei Zhang <Jerry.Zhang@amd.com>
Cc:     Christian K??nig <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Pan Bian <bianpan2016@163.com>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Release the correct object on error in
 amdgpu_benchmark_move()
Message-ID: <20191115072740.4gznld4t3ngbmcsd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911150066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9441 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911150066
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a typo so this unreserves "sobj" instead of "dobj".

Fixes: bb812f1ea87d ("drm/amdgpu: allocate gart memory when it's required (v3)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index d1495e1c9289..43d9d03bc7e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -114,7 +114,7 @@ static void amdgpu_benchmark_move(struct amdgpu_device *adev, unsigned size,
 		goto out_cleanup;
 	r = amdgpu_bo_pin(dobj, ddomain);
 	if (r) {
-		amdgpu_bo_unreserve(sobj);
+		amdgpu_bo_unreserve(dobj);
 		goto out_cleanup;
 	}
 	r = amdgpu_ttm_alloc_gart(&dobj->tbo);
-- 
2.11.0

