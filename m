Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D6385FB1
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Aug 2019 12:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389994AbfHHKc4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Aug 2019 06:32:56 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39688 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389981AbfHHKc4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Aug 2019 06:32:56 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78ASYqu050949;
        Thu, 8 Aug 2019 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=U9mddLpT2oUhwBIhERUm/ujj+fo8KPR88Op7z8fL3zg=;
 b=Wh9F6bdu1qu5UBHaCR4GmvIVoL/cPFnP7sfqeOBmGQnat9NUOucR08M6Pvu8VdF464BN
 ZD4+8Eh9cWN8QGmG77SJzS+GnxEE9qAzv7X9z0SnuKPZBwIRY7s9K6xHAhtDqU2vKSXI
 DgNQwNwFi2gRMN8UmFPdB6xGXAblwPKkTG4wzU0NToSyLxCHW6Twe9GlrJhazdTvr6xT
 6iVXe5qncXAa+wqnWQ4rm6c/gPGSr8OyNmhrvX3cXSh9cmpNAoEdvK/zZSEXcIKPdEQ/
 pxAIoMJ34jISq1l9AhNj9B9xbYq+CnBGCfha4VUxbVeDrXq8kbuFPPbM3ZqOXYcDHXH3 4w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=U9mddLpT2oUhwBIhERUm/ujj+fo8KPR88Op7z8fL3zg=;
 b=x54brwplD4yOwO/nP374W2vXcxn0rUdNTACsLxsWTMMSlm4/NuclMEG4hhd276AQNLux
 /ToFbClkLBibox3uBbSTtIxKszgAcCysR/uQW/fkqfJh5oc47Y5lUiOUehw3pCtAWXuM
 g3Uu1JA2gceg6VCVugbhp1Z0ztVeZdVq09cAjs03r1IYVlVSN+oQIsDvEOucLtByUIT9
 x6LVXNngfzKuttaz71sEKhHUFeNCsu1RwdS5HQlp2JEoyQNF/wTvaGhhnqMHiFuZjhCQ
 Em3WQJ5M7P0ktyQT2OV7i6F4ylpsJTl7g0IpKyPY2L+h+ZXKoJ4infjm/59lYVl6UIxi Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2u8has8afa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Aug 2019 10:32:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78AWY1E042945;
        Thu, 8 Aug 2019 10:32:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2u763k4a6a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Aug 2019 10:32:48 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x78AWk2L023433;
        Thu, 8 Aug 2019 10:32:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 08 Aug 2019 03:32:45 -0700
Date:   Thu, 8 Aug 2019 13:32:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zhenyu Wang <zhenyuw@linux.intel.com>,
        Xiong Zhang <xiong.y.zhang@intel.com>
Cc:     Zhi Wang <zhi.a.wang@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Message-ID: <20190808103236.GB30506@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=981
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908080115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908080115
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We can't free "workload" until after the printk or it's a use after
free.

Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 32ae6b5b7e16..ac1dbb176874 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1525,9 +1525,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu, int ring_id,
 			if (!intel_gvt_ggtt_validate_range(vgpu,
 				workload->wa_ctx.indirect_ctx.guest_gma,
 				workload->wa_ctx.indirect_ctx.size)) {
-				kmem_cache_free(s->workloads, workload);
 				gvt_vgpu_err("invalid wa_ctx at: 0x%lx\n",
 				    workload->wa_ctx.indirect_ctx.guest_gma);
+				kmem_cache_free(s->workloads, workload);
 				return ERR_PTR(-EINVAL);
 			}
 		}
@@ -1539,9 +1539,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu, int ring_id,
 			if (!intel_gvt_ggtt_validate_range(vgpu,
 				workload->wa_ctx.per_ctx.guest_gma,
 				CACHELINE_BYTES)) {
-				kmem_cache_free(s->workloads, workload);
 				gvt_vgpu_err("invalid per_ctx at: 0x%lx\n",
 					workload->wa_ctx.per_ctx.guest_gma);
+				kmem_cache_free(s->workloads, workload);
 				return ERR_PTR(-EINVAL);
 			}
 		}
-- 
2.20.1

