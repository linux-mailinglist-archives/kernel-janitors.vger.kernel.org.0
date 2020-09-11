Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54648265ED5
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Sep 2020 13:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgIKLfU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Sep 2020 07:35:20 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44030 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIKLe4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Sep 2020 07:34:56 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BBYI22163979;
        Fri, 11 Sep 2020 11:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=TY728FLXsxQLEMj5OXRiFgA39enBUpp2x73f+NEb6vk=;
 b=M6y3igm6jVeMO14GuByLsMEmmGkGgu+uTunbGWWIkxz92zcrDb/IS81u1Vrx4ciPVZBw
 9EEm5sofkM5aRLfZ8HdbmWAv0B2U7OdatpfzaDy9Bmx51tgsqgMgGzRP00V+7XP3pq4n
 +QZuaVVSqPhgCLTHjn9M3V9/z6QrNBUqeuzD+3qUEMN9noBDPkHnHqZAG7qzeYRSnNwO
 WdZNsUn1uM+h+BfRi6t4BPDB/Dz1LNyWarx1Osj/b2VsdLjUejIvvWnF4X1e5CFJIX6b
 YTbHZHVPGkuH+w1gXhVng/fkLdlhetnInOufj4kf0liVAip612L88O6iSkLNbSqUsb1F pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 33c3andju9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Sep 2020 11:34:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BBVBmH091790;
        Fri, 11 Sep 2020 11:34:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 33cmkcprt8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Sep 2020 11:34:32 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08BBYNmo013580;
        Fri, 11 Sep 2020 11:34:23 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Sep 2020 04:34:22 -0700
Date:   Fri, 11 Sep 2020 14:34:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Andi Shyti <andi.shyti@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: test the correct variable in
 igt_gem_ww_ctx()
Message-ID: <20200911113414.GC367487@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009110094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110095
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a copy and paste error here.  The "obj" should be "obj2".  The
current code could result in an Oops.

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
2.28.0

