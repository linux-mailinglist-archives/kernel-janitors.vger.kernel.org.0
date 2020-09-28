Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE2E27AA3B
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Sep 2020 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgI1JHw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Sep 2020 05:07:52 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43378 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgI1JHw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Sep 2020 05:07:52 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08S94xLQ017411;
        Mon, 28 Sep 2020 09:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Q15cfDi+iFiBJmoqPF0YaJiicxWKNYmOrAfOM7IwpWo=;
 b=KGYR3KWzSym/sRKJkv6METKdIIk4Ifnd2ahlL2mkc5yMESuzqUpdwQ3FKX13z26XLr2x
 VFMWPF/kbT/vxn/uKByiD79oOv9obxyBNaRX5QeXTWF7YL6nKCjIRfR3TBwB57/1OrMX
 im7X5awOn6ssxcJu/yM9jmMg3y6ASQVRoirJmFnorVWGN2jCnZXTvxIaWP8dJ8F+ijkn
 in12y2lTdvIGOIZZSuDqEt/WXLOyy2X7dR1KDmZWAp826QJXdf1xlAExl8ukJdXOu4BJ
 GRJrM34d7MvPWo/BMNwvUbVBqWJP/b4C/Yfz/1kHMI42bqnVQQL9mLU4wlVq/503V6Qk WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 33sx9muv8x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Sep 2020 09:07:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08S96KvA029274;
        Mon, 28 Sep 2020 09:07:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 33tfhw0wv7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Sep 2020 09:07:40 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08S97XD8007028;
        Mon, 28 Sep 2020 09:07:34 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Sep 2020 02:07:33 -0700
Date:   Mon, 28 Sep 2020 12:07:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: prime: Potential Oops in drm_gem_map_dma_buf()
Message-ID: <20200928090726.GB377727@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9757 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009280076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9757 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009280076
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code doesn't check if the call to ->get_sg_table() fails so it
could dereference an error pointer and Oops.

Fixes: c614d7e66c6a ("drm: remove prime sg_table caching")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_prime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 11fe9ff76fd5..1e2c7ff63f16 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -627,6 +627,9 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	else
 		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
 
+	if (IS_ERR(sgt))
+		return sgt;
+
 	ret = dma_map_sgtable(attach->dev, sgt, dir,
 			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret) {
-- 
2.28.0

