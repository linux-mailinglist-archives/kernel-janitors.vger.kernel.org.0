Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA2621F436
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 16:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgGNOhO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 10:37:14 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38766 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgGNOhO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 10:37:14 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EEW6k2036850;
        Tue, 14 Jul 2020 14:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=g+tBBX8wp9Z28/3jIHfYn157gf5FiDaDM00EKAUwJwc=;
 b=Rq8MaAwAm6bc0ECMwQNQWmZtnhpYoOwxyuOpgJhXYy/YTLW83lC90SwJEV29eicL+ZGz
 TFF0rJH1wPyax1pYqZoTWT/ueILeecMzDHIO6jD2yWwKZFdCTe2eVDyWHNtilkmvzHZ8
 i6pNxkD4UvAOZ0fRFXzNfqsy4p5emOTvx6VIsF6Dubr0uqhC7C8/cUGL89qVfBlW9fyD
 vVn3mlGbYp46xyN8DG6NGR8afLiRN1rjHHgiz/rjF1ngOGSjkJy+naSJy1DbvpOp+cHX
 5xRxvj9vu+fkW9GL/kA53LSz8b0Djzu5tvA2qcUzoIR7LJKRazoN8RgQsV/4rSuyEc+T 2A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 3274ur5sxh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 14:37:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EEScWZ121607;
        Tue, 14 Jul 2020 14:37:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 327qbxtmsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 14:37:02 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06EEb0EB024558;
        Tue, 14 Jul 2020 14:37:00 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 07:37:00 -0700
Date:   Tue, 14 Jul 2020 17:36:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-ID: <20200714143652.GA337376@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140112
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error code needs to be set on this path.  It currently returns
success.

Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix a different bug instead.  :P  Colin fixed mine already.

 drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index 0aa151501fb3..c232194c60a2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -358,6 +358,7 @@ static int live_noa_gpr(void *arg)
 		cs = intel_ring_begin(rq, 4);
 		if (IS_ERR(cs)) {
 			i915_request_add(rq);
+			err = PTR_ERR(cs);
 			goto out_rq;
 		}
 
-- 
2.27.0

