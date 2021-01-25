Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5521B3035BD
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jan 2021 06:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388837AbhAZFwy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Jan 2021 00:52:54 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53290 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728403AbhAYMui (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 07:50:38 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8i4vV032099;
        Mon, 25 Jan 2021 08:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=0HPq+6EYLiiRpU33Hq6oTNTTVEZXscu67/qpHBjpegc=;
 b=SnUtsHfc4iEkbjpu73f4MDVqSCWIVMGRvwKAoTepvWnMBhgwdTHm/RihxwGM9S4HUmEw
 W2D8A9JFIk8XwHBZEucf0DJsDZ7RT+iZr0W3i0RXAhvdNp/pzaRsBgK1wguMlXBj0sS0
 7UzlNB5oAkADynKijik+6dhsIAdJBjrfcSIF/FrycQkh2iR3QdyEWMVguC7XyGLzlKIR
 OF8PPXTJ8T/ln0NFcbRXVcu+2vl5loyPRzUc1NhGEn5pQCswCmLmi3xA6Sud5zHA9qZQ
 Hb+H4WxDLZeyso0A0hCNKD7KnmKLtSZS8CTaKsbpZ2FUh73GMtCzBnFTkNq3TiAZNYoi fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 368b7qm5hf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:47:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8kQcS117314;
        Mon, 25 Jan 2021 08:47:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 368wpw9qye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:47:23 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10P8lMGd024951;
        Mon, 25 Jan 2021 08:47:22 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 00:47:21 -0800
Date:   Mon, 25 Jan 2021 11:47:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Matthew Auld <matthew.auld@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gem: Fix oops in error handling code
Message-ID: <YA6FkPn5S4ZDUGxq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code will Oops when it tries to i915_gem_object_free(obj) because
"obj" is an error pointer.

Fixes: 97d553963250 ("drm/i915/region: convert object_create into object_init")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 551935348ad8..a1e197a6e999 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -753,22 +753,18 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 	mutex_lock(&i915->mm.stolen_lock);
 	ret = drm_mm_reserve_node(&i915->mm.stolen, stolen);
 	mutex_unlock(&i915->mm.stolen_lock);
-	if (ret) {
-		obj = ERR_PTR(ret);
+	if (ret)
 		goto err_free;
-	}
 
 	obj = i915_gem_object_alloc();
 	if (!obj) {
-		obj = ERR_PTR(-ENOMEM);
+		ret = -ENOMEM;
 		goto err_stolen;
 	}
 
 	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
-	if (ret) {
-		obj = ERR_PTR(ret);
+	if (ret)
 		goto err_object_free;
-	}
 
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 	return obj;
@@ -779,7 +775,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 	i915_gem_stolen_remove_node(i915, stolen);
 err_free:
 	kfree(stolen);
-	return obj;
+	return ERR_PTR(ret);
 }
 
 bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj)
-- 
2.29.2

