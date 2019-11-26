Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0EC109D96
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbfKZMKx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:10:53 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60802 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfKZMKx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:10:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8qZ8110998;
        Tue, 26 Nov 2019 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=TcAyC+jPBlqbP92yV0gCUneIcEuu+5m1qwO8ZfDeIJw=;
 b=PQwQJaxDKY5PB0CpooI7CQU/g3FC1KqC1IQJ1G5oKDmRQ8YUkHR+XNeiGJ0zGb4ERceJ
 4XooYBajnj6/nZV/HZwvGrCz1VZ7b7iEjFkGPotLMdsV0JatLinyf4ITJfSKkAcbWAaV
 T31pDLQcFxYa0IQbBHDHJiVjHfkIxcCauHG5DaFZBxWKpSiDb52aC90ZNlQs+YbvvQMh
 ktK4BKucKG0xzHeWGQvNyXpUTUhniTP/7hXE0mVBeF2GHQnwngghNOzNJttfnI1hYLmC
 YuxqsRrOwG8rrb6E1evVPPKqbPh8WBmRutemxnWls8qPW82UaKXNU9xPwbPc4Pxfha4/ +g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2wevqq6dgx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:10:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8Q6a089316;
        Tue, 26 Nov 2019 12:10:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2wgvfjdere-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:10:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQCAeCV016379;
        Tue, 26 Nov 2019 12:10:40 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Nov 2019 04:10:40 -0800
Date:   Tue, 26 Nov 2019 15:10:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Cc:     Christian K??nig <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix a bug in jpeg_v1_0_start()
Message-ID: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=891
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=953 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260110
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Originally the last WREG32_SOC15() was a part of the if statement block
but the curly braces are on the wrong line.

Fixes: bb0db70f3f75 ("drm/amdgpu: separate JPEG1.0 code out from VCN1.0")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis (Smatch).  Not tested.

 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
index 553506df077d..a141408dfb23 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
@@ -522,7 +522,8 @@ void jpeg_v1_0_start(struct amdgpu_device *adev, int mode)
 		WREG32_SOC15(JPEG, 0, mmUVD_LMI_JRBC_RB_64BIT_BAR_HIGH, upper_32_bits(ring->gpu_addr));
 		WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_RPTR, 0);
 		WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR, 0);
-	}	WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
+		WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
+	}
 
 	/* initialize wptr */
 	ring->wptr = RREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR);
-- 
2.11.0

