Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE6211C8DE
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Dec 2019 10:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbfLLJLw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Dec 2019 04:11:52 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:54410 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfLLJLw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Dec 2019 04:11:52 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBC987hc156885;
        Thu, 12 Dec 2019 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=apFQtpYWhtnhDzXLeU+JUSWtnnNzkWC9WeZlV0kDKrQ=;
 b=KM8E7ezClI4ovsnhUD0ljvv6/XltZ7VSuz1Vh5dlh1W643sxycwHor2AKdatF1fz6BbT
 CqoVzW3U83exRu9t2B3ak91kFepMo02rzRRAJztKUpeQ46WmvSkZWj8uZlZOxV/dgJFX
 LHYMWnX5nDBOjR/ZurmzuH6RiZYQHG0jb3Ts66rFf4KZ6dFjSk5lk6HTSVJYrBrW+CGJ
 i4fvGXayYCWVnIqvRcxGGJkwOYfs0jJr4fj6eChQXejoEvoqrWP93BB2Gjzua4ua0IYC
 xmjeQspHGGaS0YWSneORGfbRDaU4NyRjYTewTSbQRuOwyFhhNUZ543PBO9ItyKqPj8cR Pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2wr41qhnvw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Dec 2019 09:11:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBC9A2oj183154;
        Thu, 12 Dec 2019 09:11:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2wu3k0t4fg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Dec 2019 09:11:44 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBC9BeKC016945;
        Thu, 12 Dec 2019 09:11:41 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 12 Dec 2019 01:11:40 -0800
Date:   Thu, 12 Dec 2019 12:11:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        =?iso-8859-1?Q?Jos=E9?= Roberto de Souza 
        <jose.souza@intel.com>, Imre Deak <imre.deak@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/bios: fix off by one in parse_generic_dtd()
Message-ID: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9468 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912120064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9468 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912120064
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "num_dtd" variable is the number of elements in the
generic_dtd->dtd[] array so the > needs to be >= to prevent reading one
element beyond the end of the array.

Fixes: 33ef6d4fd8df ("drm/i915/vbt: Handle generic DTD block")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 1aeecdd02293..d1e27ee86e53 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -338,7 +338,7 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
 
 	num_dtd = (get_blocksize(generic_dtd) -
 		   sizeof(struct bdb_generic_dtd)) / generic_dtd->gdtd_size;
-	if (dev_priv->vbt.panel_type > num_dtd) {
+	if (dev_priv->vbt.panel_type >= num_dtd) {
 		DRM_ERROR("Panel type %d not found in table of %d DTD's\n",
 			  dev_priv->vbt.panel_type, num_dtd);
 		return;
-- 
2.11.0

