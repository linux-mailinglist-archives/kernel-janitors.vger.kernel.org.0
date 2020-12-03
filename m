Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B302CD1B6
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Dec 2020 09:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbgLCIsY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Dec 2020 03:48:24 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:48058 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgLCIsX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Dec 2020 03:48:23 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38hf2u099371;
        Thu, 3 Dec 2020 08:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=M+k/zGDQThbNKCjsn4dd82clzTq/I1N4YqLVvEgK2U8=;
 b=W9/M7hTPW+Ltz4AkDw8vKYMJgtVHnBvkVzh88+CCh2h9xAVrqI7sQgIArYvwVnNjk0oe
 zcw7hwCCgNkoeetyaC8Ohup4UjDO1jBvzeNod2Ym2L/MWbzweC+Hq0f9ip2Z9+jGWtVY
 xuZfNP8+3gi1KQvpnb3kB5TmkqY2XDTvfhgU6OZy0Cj/96/Wdk/XnLFYuFcJ6uCpu+I1
 0h4oeUSB0sPaMA2MsXrRepMrcgLAT5s0cw/RguI0NmdiFaJMtqZqXYTzhFdJrfRj530v
 bWpiVf38Y54yxOoKOJAYAdwa8V2x68mtG8F0s1lgsuGJSR4h6uqwxCE84Fu+xO3fim3Q Hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 353dyqvms4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Dec 2020 08:47:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38eNqh133268;
        Thu, 3 Dec 2020 08:45:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 3540avq27e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Dec 2020 08:45:29 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B38jR35001450;
        Thu, 3 Dec 2020 08:45:27 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Dec 2020 00:45:26 -0800
Date:   Thu, 3 Dec 2020 11:45:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Andi Shyti <andi.shyti@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: Check the correct variable
Message-ID: <X8ilneOcJAjwqU4t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030053
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a copy and paste bug in this code.  It's supposed to check
"obj2" instead of checking "obj" a second time.

Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 23a6132c5f4e..412e21604a05 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
 		return PTR_ERR(obj);
 
 	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
-	if (IS_ERR(obj)) {
-		err = PTR_ERR(obj);
+	if (IS_ERR(obj2)) {
+		err = PTR_ERR(obj2);
 		goto put1;
 	}
 
-- 
2.29.2

