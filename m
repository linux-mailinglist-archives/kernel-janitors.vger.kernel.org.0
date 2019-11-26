Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA3109E47
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfKZMuU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:50:20 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:57606 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfKZMuU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:50:20 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCnLEo128298;
        Tue, 26 Nov 2019 12:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1tULCOdZtJgAhl4pLWcZ8NHA5tNDVBdmjjDfGzHnUHA=;
 b=LdevkYMY5O3MGyGpN8JaDGmkK8LUs4mjeCIhMyoDUhdFs5HfI7Ta1IFw5KTMENHtB0ut
 kQ3r6GMa3Q1BZ0z9NAgXlBGlqfb7mNADWpXhJjB+sk1uj2XPlVNYPo4KvH+viJjOfEOk
 OSaXnqkAtiEYTkrjqt3keA+/ZTdcogOCALgIYXV2OlJtdg+KP8q6lcRK4OtlBj/gtDtS
 IFMfwlxYtG0qGA1rUkRymVPmIRm+Git6CX+9bgqJf1K9a+bv4G8rLMcVkL1QuLoCqAI6
 dpvCYqEwk7Isa2LqwqVj8HwOZFGjQGcU3E0sYTnqsPeEbsGZtc1eyxGfmNd2ikOZ5mOm BA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2wewdr6fcc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:50:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCiXo7172077;
        Tue, 26 Nov 2019 12:50:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2wgvfjf04n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:50:14 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQCoC3Q005686;
        Tue, 26 Nov 2019 12:50:12 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Nov 2019 04:50:12 -0800
Date:   Tue, 26 Nov 2019 15:50:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Bruce Chang <yu.bruce.chang@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: unmap the correct pointer in
 i915_error_object_create()
Message-ID: <20191126125003.zpczouqpyr7njwha@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260115
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We should be unmapping "page" instead of "s".  This code originally used
kmap_atomic() before it was changed to kmap().  The two mapping
functions are different which leads to this common mistake.

Fixes: 3e749f5199e1 ("drm/i915: Avoid atomic context for error capture")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 3c85cb0ee99f..6fe23446303b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1045,7 +1045,7 @@ i915_error_object_create(struct drm_i915_private *i915,
 
 			s = kmap(page);
 			ret = compress_page(compress, s, dst);
-			kunmap(s);
+			kunmap(page);
 
 			drm_clflush_pages(&page, 1);
 
-- 
2.11.0

