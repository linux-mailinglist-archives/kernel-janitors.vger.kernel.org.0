Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E5731BEBF
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Feb 2021 17:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhBOQRT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 Feb 2021 11:17:19 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:41980 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhBOP7r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Feb 2021 10:59:47 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FFncPI096510;
        Mon, 15 Feb 2021 15:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=/jt2JJ/DfjR1OlH6tBCcf9qWPcgljJpwfUrXp0Yi6QM=;
 b=K2r544vBO+R3H89WELNzk4w1i2Zc0l96bmTB17uxZHNkGCDMbmGsrD9pSivrdBpq/8Dx
 1TGU/msnf22lvAZ4SCNj6lAgrBjA/VUYQpGOxOSlBkU2DXtNsrYbs4i7vL60U+Iwvdm2
 9bsNF+8G9LTrFy/LIElr0Ql+A6BEwNqVpW7cKJO2O8qH6dXfwvKC7qGNnt8kpKamuOkY
 b1m0wOQGlp6FTZ7VKemh0jJbEBImrmCeT7zw/Brue3Uv9/Z+lLeGvWjgtfoZX26Edb//
 lrOmL4eD6poTXkZOSYEo4DtB9HMBINJ3UVfzf6QNfmChPpfTvkHsfW2I48gx+8ESB5fs 8Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 36pd9a3wya-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Feb 2021 15:58:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FFnxJn009988;
        Mon, 15 Feb 2021 15:58:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 36prpvsfcx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Feb 2021 15:58:46 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11FFwaIX003437;
        Mon, 15 Feb 2021 15:58:36 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 15 Feb 2021 07:58:35 -0800
Date:   Mon, 15 Feb 2021 18:58:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftest: Fix an error code in
 mock_context_barrier()
Message-ID: <YCqaI95UW9L7Mg/L@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150125
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150125
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If the igt_request_alloc() call fails then this should return a
negative error code, but currently it returns success.

Fixes: 85fddf0b0027 ("drm/i915: Introduce a context barrier callback")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index d3f87dc4eda3..c30b583522ca 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1942,6 +1942,7 @@ static int mock_context_barrier(void *arg)
 	rq = igt_request_alloc(ctx, i915->gt.engine[RCS0]);
 	if (IS_ERR(rq)) {
 		pr_err("Request allocation failed!\n");
+		err = PTR_ERR(rq);
 		goto out;
 	}
 	i915_request_add(rq);
-- 
2.30.0

