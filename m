Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358BB173995
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 15:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgB1OPD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 09:15:03 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39844 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgB1OPD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 09:15:03 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01SEEIBJ103833;
        Fri, 28 Feb 2020 14:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6dxZTwffd0c+ZSsPkurZdTLE/IdiL/nikLAWgC2Ltek=;
 b=IwH749i5Y5keay9Q6cnOvT7Shy2HCjgSZb4cidO2vpbWyv06lE9IuXG+BHh52ZWoHlyo
 IGhHMuhYUMiKx1Qc6TrtG8DMcK4mzDR0iej3kDsehKVFY9LpV3WghgqseeRWP0pmQmWm
 4Tj2YvcWLsw3DTtlZ81lZwKrTcNRP88ipAbHiy+/QS19bOILms6JX5jQLwA6YElot8ND
 K86qxHnR8VFCzPn/I+UQF/MhEt0EmGtB9gxlraDKtTrsJ89u8QhHnSPQBuug/bSwqqDM
 euKzrZTuzmgie/gegnL80IL/tTBcptVVHUg0yp/EF5gC3ykuLCfKNyxCPWT6DyYRyvJR Cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2yf0dm9d4w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 14:14:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01SEEOi6029407;
        Fri, 28 Feb 2020 14:14:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2ydj4qw29m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 14:14:48 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01SEEipk003917;
        Fri, 28 Feb 2020 14:14:44 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 28 Feb 2020 06:14:43 -0800
Date:   Fri, 28 Feb 2020 17:14:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: Fix return in assert_mmap_offset()
Message-ID: <20200228141413.qfjf4abr323drlo4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280112
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The assert_mmap_offset() returns type bool so if we return an error
pointer that is "return true;" or success.  If we have an error, then
we should return false.

Fixes: 3d81d589d6e3 ("drm/i915: Test exhaustion of the mmap space")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  In theory it's correct, but when you're adding new error
paths it's always good to test.

 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index ef7c74cff28a..43912e9b683d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -570,7 +570,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 
 	obj = i915_gem_object_create_internal(i915, size);
 	if (IS_ERR(obj))
-		return PTR_ERR(obj);
+		return false;
 
 	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
 	i915_gem_object_put(obj);
-- 
2.11.0

