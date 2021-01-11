Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF6A2F1709
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 15:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbhAKNGF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 08:06:05 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33114 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730398AbhAKNGD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 08:06:03 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BCxfnQ169119;
        Mon, 11 Jan 2021 13:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=QzqsbCCKI0RL4oUr8n341RuAVNnubA+r3Yt2zfTtmgw=;
 b=gvQcaCcvCFVmWh9IMKQ+zgdvNZh9a9sDlk3sZi8dteCbuJ8x3b7iA4uUXIWvrXmwX3vm
 6VtZnfifZ3KnXfhMgkEo6NFmk/L0djOlaY5Y7sJ3HYJwwzdWdWWr8188UbUBn1LT30Si
 n/Kp6M0tNaIJQdeyA2nP19FgfLbpDFhflD2pyah3CwL3yPLqXyAfIPaGdo9j1MpXec+L
 aJkybswQgXoeNfOsBMBsif53jAq++cWyNJxGphN8Vva8Ivpw3HWm8fAn/qAy+CFGK6Hu
 QYVLLCCb+0YmRDC/QZPwHtkJZQVxym9cgIrNIB1QrSz0mibDJEgRjRwu/CJGDMFuFeT9 zg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 360kcyh1nh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 Jan 2021 13:05:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BD1MkF055356;
        Mon, 11 Jan 2021 13:03:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 360ke4yk8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Jan 2021 13:03:06 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10BD2tqN018552;
        Mon, 11 Jan 2021 13:02:55 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 11 Jan 2021 05:02:54 -0800
Date:   Mon, 11 Jan 2021 16:02:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Andi Shyti <andi.shyti@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: Fix some error codes
Message-ID: <X/xMdcewtft7+QFM@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110077
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These error paths return success instead of negative error codes as
intended.

Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
Fixes: 2d19a71ce68f ("drm/i915/selftests: Exercise long preemption chains")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 95d41c01d0e0..0f9fbae98158 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -2679,8 +2679,10 @@ static int create_gang(struct intel_engine_cs *engine,
 		goto err_obj;
 
 	cs = i915_gem_object_pin_map(obj, I915_MAP_WC);
-	if (IS_ERR(cs))
+	if (IS_ERR(cs)) {
+		err = PTR_ERR(cs);
 		goto err_obj;
+	}
 
 	/* Semaphore target: spin until zero */
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
@@ -2707,8 +2709,10 @@ static int create_gang(struct intel_engine_cs *engine,
 	i915_gem_object_unpin_map(obj);
 
 	rq = intel_context_create_request(ce);
-	if (IS_ERR(rq))
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
 		goto err_obj;
+	}
 
 	rq->batch = i915_vma_get(vma);
 	i915_request_get(rq);
@@ -3264,8 +3268,10 @@ static int live_preempt_user(void *arg)
 
 			rq = create_gpr_client(engine, global,
 					       NUM_GPR * i * sizeof(u32));
-			if (IS_ERR(rq))
+			if (IS_ERR(rq)) {
+				err = PTR_ERR(rq);
 				goto end_test;
+			}
 
 			client[i] = rq;
 		}
-- 
2.29.2

