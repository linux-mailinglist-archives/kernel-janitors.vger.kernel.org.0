Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7302DB58
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 May 2019 13:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfE2LEV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 May 2019 07:04:21 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:58434 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfE2LEV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 May 2019 07:04:21 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TB3rK3050351;
        Wed, 29 May 2019 11:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=/dOi6b63bF6FhujuHMYrWgc0GTNTW1VuZCOhNzc+LXM=;
 b=uzQxAiN6E00f9nCIr2c97tQ+CnvaNyg0ktwV6/2v4aE2tlrbf1rfvz614kiMSlASQvcI
 94eY1WqzpE+8TbTQ3oQJnMk1XKYI1xm3bG2t8s8CtUkZl9GdiFg2g+HQV45lM0N1UqEa
 gwj6auMllKfWHEVrMXTS1MI3WmiPFkuoL5xE+lwTdkjJqYgC3LKGT3M2vLWfcMaocJYd
 AN8q2eWVSGc29rWObK9sQvUQrhHwEgEz7+g93JJ+5Gm8GfM4wMv+CETozktP29CxWxsF
 IYfiXeS76XsOeRYk7dyn+v0WpIWv1E4X+CMChTaJqxSNsZo8UyWmwxq7untzX1Ib8D9h mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2spu7dh4t2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 11:04:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TB3tRQ171803;
        Wed, 29 May 2019 11:04:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2srbdxaqdq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 11:04:10 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TB457n011770;
        Wed, 29 May 2019 11:04:05 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 29 May 2019 04:04:04 -0700
Date:   Wed, 29 May 2019 14:03:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Matthew Auld <matthew.william.auld@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: selftest_lrc: Check the correct variable
Message-ID: <20190529110355.GA19119@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290075
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We should check "request[n]" instead of just "request".

Fixes: 78e41ddd2198 ("drm/i915: Apply an execution_mask to the virtual_engine")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index a8c50900e2d4..13674f836955 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1526,8 +1526,8 @@ static int mask_virtual_engine(struct drm_i915_private *i915,
 
 	for (n = 0; n < nsibling; n++) {
 		request[n] = i915_request_create(ve);
-		if (IS_ERR(request)) {
-			err = PTR_ERR(request);
+		if (IS_ERR(request[n])) {
+			err = PTR_ERR(request[n]);
 			nsibling = n;
 			goto out;
 		}
-- 
2.20.1

