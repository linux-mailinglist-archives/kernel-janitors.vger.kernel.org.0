Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A03B20AFCD
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Jun 2020 12:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgFZKe0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 Jun 2020 06:34:26 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33656 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFZKeZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Jun 2020 06:34:25 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAR4Cc046940;
        Fri, 26 Jun 2020 10:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=IAfRIdYKCllYxJ1FiYTz251nOrFbtonXh8Kly5PU5/I=;
 b=sa+BAMwNWoDm8Cp6oCyGHgff6qumUy5cKyufQCZiZ7bzJeT/cfmU1+aKqJDQ40cAthpo
 P7ABC8a4hsKmHdufAMdoEvE8iyGXQuc2mR/KluPnI9fEjs2YzWaESLbvGsKABrenL9Me
 w6/rKf7hp9AftR7eep7+hjmV17J5WNVNFMsUws7a39vAk5xtw2momztnSdbv18uG1DyK
 S9JeqlwLd/Y2iioGXVH9Q+Psh9t0q05glHfPgIOY6aLXJZXIpC5sRPQL10lOB9apjMwv
 Wwjikm8etz3JKRPFLwUnWmh9Q9hMavoiduvAdXlB8+haNakvflkky9N1r51ES1Mvb+jW GA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 31uut5wcwa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 10:34:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QATV3w089138;
        Fri, 26 Jun 2020 10:34:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 31uurtyna3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 10:34:16 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05QAY8R3027087;
        Fri, 26 Jun 2020 10:34:08 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 26 Jun 2020 10:34:07 +0000
Date:   Fri, 26 Jun 2020 13:34:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.net>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vc4: call ->post_disable() functions in
 vc4_dsi_encoder_disable()
Message-ID: <20200626103401.GA314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 cotscore=-2147483648 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006260076
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The problem is that the iterator is already at the list head so the
list_for_each_entry_from() loop is a no-op and we don't call the
the iter->funcs->post_disable() functions.  This should be
list_for_each_entry() instead.

Fixes: 033bfe7538a1 ("drm/vc4: dsi: Fix bridge chain handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index eaf276978ee7..f92d0e92fa72 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -754,7 +754,7 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 
 	vc4_dsi_ulps(dsi, true);
 
-	list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->post_disable)
 			iter->funcs->post_disable(iter);
 	}
-- 
2.27.0

