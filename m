Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABB01732BC
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 09:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgB1IWf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 03:22:35 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:58036 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgB1IWf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 03:22:35 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01S88oP1182320;
        Fri, 28 Feb 2020 08:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=I+bU3dY3lxD6K6D0f4wCrSdER2Nrs6Y/9UCyyPJOhJM=;
 b=I7tu14pcKXPM5Kv3ASR8+6QqSEJkcUwDUMhUFQf/nZ4LFuN7tmpi+b3vMFsF6Oik7FKz
 wtaIIGkvfrrr03vVmq5fvFvj2m6+yvyciukH0IldOK0JjK5mPnkkVN8jkjcbhh8iEyhJ
 sxzzylZKgUYCAiUjCeEqWUB5o1m9lmjdaFaI9HTG/+5UbJ5AbM4dnJjFqAtPadBvFb55
 VH/MJkm4dd/XHmIp2zNC9Z2eM3NVVo40n+Aovqp+TJJZZcee5RjWCxqsj0wxYoavL0G5
 Mr9cicb38vDp3DUgKQwRYf3o8ObTF4Ufb6WFynF3x1Q+jbs1LozYxD2PBPh8yesRn2ZU 9Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2ydct3h99k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 08:22:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01S8EOZj182451;
        Fri, 28 Feb 2020 08:22:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2ydj4q3d80-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 08:22:27 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01S8MO4A022656;
        Fri, 28 Feb 2020 08:22:25 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 28 Feb 2020 00:22:24 -0800
Date:   Fri, 28 Feb 2020 11:22:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        Wyatt Wood <wyatt.wood@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Use after free in dmub_psr_destroy()
Message-ID: <20200228080436.rmsqe3ytmxi3bwxn@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280069
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These lines need to be re-ordered so that we don't dereference "dmub"
after we just freed it.

Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 2c932c29f1f9..dc858b152c6e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context *ctx)
  */
 void dmub_psr_destroy(struct dmub_psr **dmub)
 {
-	kfree(dmub);
 	*dmub = NULL;
+	kfree(dmub);
 }
-- 
2.11.0

