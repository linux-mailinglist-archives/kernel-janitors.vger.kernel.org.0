Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD9D484B81
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Aug 2019 14:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387974AbfHGM3E (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Aug 2019 08:29:04 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33444 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387953AbfHGM3A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Aug 2019 08:29:00 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77CJ2Qw002975;
        Wed, 7 Aug 2019 12:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=skuCuQ4hN4RPMv++ey4fYGda1N9xL/Wcg5MzIe+uAfE=;
 b=4ZJ4+w1r8LbQyQgSg8Zfv9Oyffgz612/+TCaNqaDK8Wc5F+KKZNwUIuoJI+RPJnrlyz4
 xzjQxQjut1SqlUG7DDesFkK3UP5dme0/1LaP7sRxDEnSKkY3ZFAXXfeMtBWj+Dy9560R
 qU2gY2jMHeinUCLibu+q2CStrY10rijQMp815n/btXavrE8Z5WzZIsMjpWdIUqFNiBEb
 I+8GMrDB1tOlwRrstH5aq2OCVcMrQ51s0koA56FcloaHsX8yBS99IQzRog4e3MqyRNBo
 qflQu8WY5dtWO6NCX0Bl1f/c8ZVO/a2NEEZ7+WLUwJGocSjpzfu7H+paqrF5F+bEQkLQ Kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2u52wrbyxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Aug 2019 12:28:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77CHtEf159810;
        Wed, 7 Aug 2019 12:28:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2u75bwd2q9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Aug 2019 12:28:47 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x77CSfHG019271;
        Wed, 7 Aug 2019 12:28:41 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 07 Aug 2019 05:28:40 -0700
Date:   Wed, 7 Aug 2019 15:28:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: Fix some NULL vs IS_ERR() conditions
Message-ID: <20190807122832.GA10517@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908070137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908070137
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There were several places which check for NULL when they should have
been checking for IS_ERR().

Fixes: d8af05ff38ae ("drm/i915: Allow sharing the idle-barrier from other kernel requests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/selftest_context.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index d39b5594cb02..6e7e9a6fd235 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -86,8 +86,8 @@ static int __live_active_context(struct intel_engine_cs *engine,
 	}
 
 	ce = intel_context_create(fixme, engine);
-	if (!ce)
-		return -ENOMEM;
+	if (IS_ERR(ce))
+		return PTR_ERR(ce);
 
 	for (pass = 0; pass <= 2; pass++) {
 		struct i915_request *rq;
@@ -161,8 +161,8 @@ static int live_active_context(void *arg)
 	mutex_lock(&gt->i915->drm.struct_mutex);
 
 	fixme = live_context(gt->i915, file);
-	if (!fixme) {
-		err = -ENOMEM;
+	if (IS_ERR(fixme)) {
+		err = PTR_ERR(fixme);
 		goto unlock;
 	}
 
@@ -226,12 +226,12 @@ static int __live_remote_context(struct intel_engine_cs *engine,
 	 */
 
 	remote = intel_context_create(fixme, engine);
-	if (!remote)
-		return -ENOMEM;
+	if (IS_ERR(remote))
+		return PTR_ERR(remote);
 
 	local = intel_context_create(fixme, engine);
-	if (!local) {
-		err = -ENOMEM;
+	if (IS_ERR(local)) {
+		err = PTR_ERR(local);
 		goto err_remote;
 	}
 
@@ -274,8 +274,8 @@ static int live_remote_context(void *arg)
 	mutex_lock(&gt->i915->drm.struct_mutex);
 
 	fixme = live_context(gt->i915, file);
-	if (!fixme) {
-		err = -ENOMEM;
+	if (IS_ERR(fixme)) {
+		err = PTR_ERR(fixme);
 		goto unlock;
 	}
 
-- 
2.20.1

