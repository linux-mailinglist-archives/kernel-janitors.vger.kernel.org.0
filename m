Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6F311E25B
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Dec 2019 11:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfLMKwN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Dec 2019 05:52:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53504 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfLMKwN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Dec 2019 05:52:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBDAfs5Y007719;
        Fri, 13 Dec 2019 10:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Aj9j4Es74r/L4LO4yLAcbzAhmDLhHakszGWwKSqVark=;
 b=Cmwsi++TFejJin6v7sEDQOvZeubTTuoOwKJckEWePzzj2/p96v/ou9t3R+0rZxkgdMty
 OJp1A3xmtmw59RO04NVc7VLIplLu2JeEX/00+3fVhHeit0jcscAd5E3jHUtR5L70bO5f
 yA2by0d0CwCfz5TeNxhy4TG34SBMb8sbhro3EGsLRumlrEVrT27MIVIUcwFNJMjfWgWr
 0W2mtobJbAMdGBulG1XhxVLKJEt70XxQgMebq+XTosYJ3zg367qiloyJAEV2QdIQS6yg
 OlaLjD9GTlGEmVtpAMEpvVSLc2AxMUC/ccZiGHCjrZfplGkJmgh1E0cvQwa3FVzYqtAt sQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2wrw4nn9m9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Dec 2019 10:51:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBDAkwvP061354;
        Fri, 13 Dec 2019 10:51:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2wumsbmt7n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Dec 2019 10:51:01 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBDAoxMv002569;
        Fri, 13 Dec 2019 10:50:59 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 13 Dec 2019 02:50:58 -0800
Date:   Fri, 13 Dec 2019 13:50:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Matthew Auld <matthew.auld@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: remove a condition
Message-ID: <20191213105050.y2v5nylsuxvc44jj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9469 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=986
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912130086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9469 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912130086
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We know that "err" is non-zero so there is no need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 99c94b4f69fb..71a4ca38fbac 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1086,8 +1086,7 @@ static int __live_parallel_engine1(void *arg)
 		rq = i915_request_create(engine->kernel_context);
 		if (IS_ERR(rq)) {
 			err = PTR_ERR(rq);
-			if (err)
-				break;
+			break;
 		}
 
 		i915_request_get(rq);
-- 
2.11.0

