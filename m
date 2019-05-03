Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E02312D79
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2019 14:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfECMZv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 May 2019 08:25:51 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36410 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfECMZu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 May 2019 08:25:50 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43COb36107641;
        Fri, 3 May 2019 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ceWt8vhd+vPLCGDRTc4L2ZdfVL6RSbvaLc1St5DpuCA=;
 b=x9yNi406P2rabVuaIqMq3eo6vORo0ZDq3txjDfB2U18tnSCi/lAqlMRtdr5I+xVwod2g
 ZBt6OuYZ1lddQbg24F7UPF6SxuHOH7yncWVy03emkI/QWpxQfx0n6FyqCEUK3VtAFm6y
 Wr72mzLnwD38NhuUjFR6Vj3pUDX0mROiyFrsrlidxu4ZvxZp5Rz3HyNmvEdNtEOECDyx
 CZPLe3l6GSoixAhxVCHPy64w4RxBfeO7HLYdh8o2eWJcOf360Bnq/M5JyQonzlNWg5UZ
 ZmtOkvT55itCPO0hDnd7IW9LRO/4wRS8sNhqF3emjLjFeDb/ZeKpYkKLkEjYFfL41/Wh Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2s6xhyxcad-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 12:25:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43CP9LD029893;
        Fri, 3 May 2019 12:25:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2s6xhhkgjd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 12:25:42 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x43CPcWG007319;
        Fri, 3 May 2019 12:25:38 GMT
Received: from mwanda (/196.104.111.181)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 03 May 2019 05:25:38 -0700
Date:   Fri, 3 May 2019 15:25:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "James (Qian) Wang" <james.qian.wang@arm.com>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/komeda: Potential error pointer dereference
Message-ID: <20190503122525.GA29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=989
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905030078
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030078
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We need to check whether drm_atomic_get_crtc_state() returns an error
pointer before dereferencing "crtc_st".

Fixes: 7d31b9e7a550 ("drm/komeda: Add komeda_plane/plane_helper_funcs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 07ed0cc1bc44..c7e5fc6e5500 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -64,7 +64,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	crtc_st = drm_atomic_get_crtc_state(state->state, state->crtc);
-	if (!crtc_st->enable) {
+	if (IS_ERR(crtc_st) || !crtc_st->enable) {
 		DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
 		return -EINVAL;
 	}
-- 
2.18.0

