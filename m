Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED15E1B2CB
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 May 2019 11:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfEMJYF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 May 2019 05:24:05 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:42700 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbfEMJYF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 May 2019 05:24:05 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4D9IpkZ099049;
        Mon, 13 May 2019 09:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=xfkjogPojG0Pm/y32JShR1cqog8lZbULmD215jD6V3U=;
 b=UgeVz5jDUzHOOuxdzbFTOs5nEOIT8kpt5vIF5U/s2eDs3ckcufExBUZ9veT4sFG0sa4M
 eMyM9b+/WFwZi8wDdw2kgzifye6QLtmoNLarIpbHAsb480Y4fg/37tLwTQJElGz49L1R
 PE45MJaHoo89rnavKmuXkOfx6g11g4RkkluLqAPhxbNabevRHjgjS/uiNyljCf1GeRZl
 Q3dw0vanSAaDfgyAbnDRBvbYKoupIQDjPrKMRmEmqi2pbkRab/S4yMkEwlFQwdmxHENT
 hdsVY+SLOeDCajstpAHC5xAg9Qrg1VltTMQItP3gDSQ3VM6f5lt+e4lebNpfID4cPXKA 0Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2sdnttdne0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 May 2019 09:22:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4D9LHcr101697;
        Mon, 13 May 2019 09:22:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2se0tverff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 May 2019 09:22:58 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4D9Mr5V008481;
        Mon, 13 May 2019 09:22:53 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 May 2019 09:22:52 +0000
Date:   Mon, 13 May 2019 12:22:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zhenyu Wang <zhenyuw@linux.intel.com>,
        Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
Cc:     Zhi Wang <zhi.a.wang@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Fix an error code in
 ppgtt_populate_spt_by_guest_entry()
Message-ID: <20190513092244.GA12077@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9255 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905130067
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9255 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905130067
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

"ret" is uninitialized on this path but it should be -EINVAL.

Fixes: 930c8dfea4b8 ("drm/i915/gvt: Check if get_next_pt_type() always returns a valid value")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 08c74e65836b..244ad1729764 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1076,8 +1076,10 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_populate_spt_by_guest_entry(
 	} else {
 		int type = get_next_pt_type(we->type);
 
-		if (!gtt_type_is_pt(type))
+		if (!gtt_type_is_pt(type)) {
+			ret = -EINVAL;
 			goto err;
+		}
 
 		spt = ppgtt_alloc_spt_gfn(vgpu, type, ops->get_pfn(we), ips);
 		if (IS_ERR(spt)) {
-- 
2.18.0

