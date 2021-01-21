Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5207E2FE254
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 07:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbhAUGKt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Jan 2021 01:10:49 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60258 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAUGKQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jan 2021 01:10:16 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L64nZ6056854;
        Thu, 21 Jan 2021 06:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5RP2nAGErznTpvSk/cGgU+T9P5emh+XNvStnJcJMHiU=;
 b=INvxb7JXl5Zl/ZkRE18bRSVZV4GeXU99WvUbIFHSCQSOI+ADLBayOIh0SBpiSh6gaFqU
 VMnq9HfLNrfZbfb7jDCIucLNqmye44Sp/BhO9EnzCn9jJ6b/nY2Vb9iy6wsV9Kwr9TSx
 vep5d8YEs4zgVjPvRfMae86w09jL0KTT+zsQyWrXfu5rRTOZ/sSiCmVujHWefvVy2lq3
 Y2OXDcbYV2+1bsOLQ+dFtXIRqMu5BREH1frWrhnAJLb97HlgXiH0NMS7zsamuKGxRmog
 5fkDgYCkwFHwzToWCqvcRWqRxqweGPQTqGn/SSTrc0uIM0lpB2C01SnPwUF6XXUj3O8X Ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3668qmwq9f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 06:09:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L64mP1002849;
        Thu, 21 Jan 2021 06:07:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 3668qxh0ma-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 06:07:22 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10L67A3K016079;
        Thu, 21 Jan 2021 06:07:10 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 20 Jan 2021 22:07:09 -0800
Date:   Thu, 21 Jan 2021 09:07:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, Imre Deak <imre.deak@intel.com>,
        Uma Shankar <uma.shankar@intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
Message-ID: <YAkaBa22zvbXKd4E@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This was supposed to be | instead of ||.

Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8a00e609085f..9c6f427b2703 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6955,8 +6955,8 @@ intel_dp_update_420(struct intel_dp *intel_dp)
 							intel_dp->downstream_ports);
 	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
 								 intel_dp->downstream_ports,
-								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
-								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
+								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV |
+								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV |
 								 DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
 
 	if (INTEL_GEN(i915) >= 11) {
-- 
2.29.2

