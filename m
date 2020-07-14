Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D235221F3A0
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 16:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgGNONm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 10:13:42 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56284 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgGNONl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 10:13:41 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EE2u3B015787;
        Tue, 14 Jul 2020 14:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=k3qxcqaX7DN4yU9D9CphW0Kj5lkwWimTwaZfF4Cpqjs=;
 b=SPedCDHON+JNoF5WsJLVicmaUA7aSVL2STe9+tHj6TarwD14pzvuQS56l6lfX4AV46wS
 6mYMiQUXTn8Zf8S6piKEWCZ2Gu4G+8IojxINXCC8sNT2kNhBcouxlJBydSCcygs7pev7
 KGD268WhvJtgnNiJDe+7SDCNt7Xvn8s7IKFTa/Ky1GYRLD1Z9FXA1pApHi84VW8K1IqO
 ZmzpUbPcGuARZ83GArz5fCjo3YGpmAKQREJswGDy6/uySU7JzZsko4Trget2dwYxhKTm
 YdLBzWqgCYa6nxzNiTy6tH5qirBXC2UlCSuhj1Yvi2X3823sLOdYLzQTYfNW4YHeJJhB Ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 32762ndf16-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 14:12:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EE7ZuK011954;
        Tue, 14 Jul 2020 14:12:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 327qb46n66-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 14:12:30 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06EECO6m016337;
        Tue, 14 Jul 2020 14:12:25 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 07:12:24 -0700
Date:   Tue, 14 Jul 2020 17:12:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-ID: <20200714141216.GA314989@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140108
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error code is not set on this error path.  It's either zero or
uninitialized at this point.

Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index deb6dec1b5ab..7aa73bb03381 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -329,6 +329,7 @@ static int live_noa_gpr(void *arg)
 	cs = intel_ring_begin(rq, 2 * 32 + 2);
 	if (IS_ERR(cs)) {
 		i915_request_add(rq);
+		err = PTR_ERR(cs);
 		goto out_rq;
 	}
 
-- 
2.27.0

