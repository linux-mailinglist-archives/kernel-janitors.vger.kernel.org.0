Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5599A136652
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Jan 2020 05:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731349AbgAJErr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Jan 2020 23:47:47 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:41254 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731263AbgAJErr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jan 2020 23:47:47 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00A4hnfE003901;
        Fri, 10 Jan 2020 04:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=10NW/kbbDQIwGfFKsIHZsUoPe+SBQcEKKLRWYX68McI=;
 b=bcJeGvlNabKTsLYdj7d3celtRITRlmAWfQ5uQqyHuwHBKZYqcikNESBEBxLqt3MD/g0S
 rJoYcu2VAPIoyp1BBOzdZKDko+y1NWe6slOD55vy2oPzEvBSrqRJrTA+asuDKBpI/Mxp
 9c7Cd5pFo1WU2LPGqJANs5Y/iqO4bMjgF8U0Jv6CjBItgQE2RySapTT+YfHc50Nno65f
 gNQxkQeGe2Ed5sWdGHgReig7oInvN3QWVOofNwStfx7eDQD8+rBJNvAg1cmD5h0wGY0k
 GjYonNyDPTk5QCtKOxEbsEqRKQysqMcooFdqAxiL0h4J4W1nPW98S4Vqd2R/n8u4YEP+ Ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2xajnqfhqw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Jan 2020 04:47:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00A4iCxb121691;
        Fri, 10 Jan 2020 04:47:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2xedhxa19q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Jan 2020 04:47:40 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00A4lbst012532;
        Fri, 10 Jan 2020 04:47:38 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 09 Jan 2020 20:47:37 -0800
Date:   Fri, 10 Jan 2020 07:47:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.net>, Dave Airlie <airlied@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/v3d: Fix a double free in the ioctl
Message-ID: <20200110044537.krkboolyohpb5y6z@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=977
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001100040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001100040
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code used to leak "bin" but then we accidentally merged two fixes
so now it's a double free.

Fixes: 77e0723bd27f ("Merge v5.4-rc7 into drm-next")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 549dde83408b..37515e47b47e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		ret = v3d_job_init(v3d, file_priv, &bin->base,
 				   v3d_job_free, args->in_sync_bcl);
 		if (ret) {
-			kfree(bin);
 			v3d_job_put(&render->base);
 			kfree(bin);
 			return ret;
-- 
2.11.0

