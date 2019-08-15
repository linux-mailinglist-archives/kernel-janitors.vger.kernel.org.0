Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7128E676
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2019 10:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731022AbfHOIev (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Aug 2019 04:34:51 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42558 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730446AbfHOIev (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Aug 2019 04:34:51 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7F8XgSD024871;
        Thu, 15 Aug 2019 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=gG3j06ACRl/0PxTv3WPW8jRGeeDFbEtjRamT4x02tQQ=;
 b=JldSzA6b3/oxV2saYFnYiFYd23TyeZTQQiYtXi9Q8/Qa4HFWDyjj0Jwg+QX2I8DjrbIr
 2wUoGiAVsMRJdybPh808U3wa5cDYLuCeg04pjSJyGsejDHcJmqs5bfZC52q+CtGCgm5I
 sRSu97ck23QUDxO88IbDfEaqaL9IBjAa5O15343ruXKHtjg4MePcgOdutiqb2H97yzks
 Dwi3T52FOqCsu9xHAGjReW1U1zv1hSbWcF1PQ99GQ6R6iuin78xwDpmnBvEPsyKWWQiY
 OYYXG6ayAUMupEE8ffER8B49EC20Bpmpi7nNRLhMWUATf3muQFNoZyO9BMcGViMpAOWA 2A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2u9nvphr35-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Aug 2019 08:33:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7F8Wk1E041808;
        Thu, 15 Aug 2019 08:33:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2ucpys57jy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Aug 2019 08:33:45 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7F8Xi44021729;
        Thu, 15 Aug 2019 08:33:44 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 15 Aug 2019 01:33:44 -0700
Date:   Thu, 15 Aug 2019 11:33:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        =?iso-8859-1?Q?Jos=E9?= Roberto de Souza 
        <jose.souza@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/tgl: Fix TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT() macro
Message-ID: <20190815083336.GE27238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9349 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908150091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9349 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908150091
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This macro doesn't work because the right shift has higher precedence
than bitwise AND.

Fixes: 9749a5b6c09f ("drm/i915/tgl: Fix the read of the DDI that transcoder is attached to")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 4a947bd0a294..def6dbdc7e2e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9433,7 +9433,7 @@ enum skl_power_gate {
 #define  TRANS_DDI_SELECT_PORT(x)	((x) << TRANS_DDI_PORT_SHIFT)
 #define  TGL_TRANS_DDI_SELECT_PORT(x)	(((x) + 1) << TGL_TRANS_DDI_PORT_SHIFT)
 #define  TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val)	 (((val) & TRANS_DDI_PORT_MASK) >> TRANS_DDI_PORT_SHIFT)
-#define  TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val) (((val) & TGL_TRANS_DDI_PORT_MASK >> TGL_TRANS_DDI_PORT_SHIFT) - 1)
+#define  TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val) ((((val) & TGL_TRANS_DDI_PORT_MASK) >> TGL_TRANS_DDI_PORT_SHIFT) - 1)
 #define  TRANS_DDI_MODE_SELECT_MASK	(7 << 24)
 #define  TRANS_DDI_MODE_SELECT_HDMI	(0 << 24)
 #define  TRANS_DDI_MODE_SELECT_DVI	(1 << 24)
-- 
2.20.1

