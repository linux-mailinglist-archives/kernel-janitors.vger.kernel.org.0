Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487BB1D770F
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 May 2020 13:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgERLav (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 May 2020 07:30:51 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:59312 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbgERLav (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 May 2020 07:30:51 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04IBSax6064445;
        Mon, 18 May 2020 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3hJmbFBQ/c+pV/4LSjZbaFju2v8iBBdkolOJiGRiDPQ=;
 b=qu7z3q4tQS9KkxXBDR8pbEbSPFWluIznEmbReAosOSdTorYzd3JUG8MDMQ4X/DzOV8oc
 7zFXC63UwcDTzAwQn5qPgFyhioWWinjGIFgpWT326m9HWl20BEplEarsFslbkq1uu5VH
 /RTjq7tEFy2KTC+qyocax+nNT9M9hjNOeMt44hfmYXc58ApZqQTd/CXZkQR7f411gzg9
 eJuw+Je3Z3uPmO++Nb6/am2pZ8nsbMmxQ0Wi4w+yziyL08Vu+xisGKDlHBl+hP83w+pU
 wDLh+eFcD+CsnXld9JhInR7yByhJVmuh2mxl5He/5AOzjxH2jCw3KGXZ4f4P1Cop23k4 sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 3128tn63vn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 May 2020 11:30:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04IBSUMf119827;
        Mon, 18 May 2020 11:30:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 313ghynvuh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 May 2020 11:30:17 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04IBU3J3001467;
        Mon, 18 May 2020 11:30:03 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 18 May 2020 04:30:03 -0700
Date:   Mon, 18 May 2020 14:29:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/etnaviv: Fix a leak in submit_pin_objects()
Message-ID: <20200518112955.GA48709@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9624 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005180104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9624 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1011 cotscore=-2147483648 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005180103
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If the mapping address is wrong then we have to release the reference to
it before returning -EINVAL.

Fixes: 088880ddc0b2 ("drm/etnaviv: implement softpin")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Untested.

 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3b0afa156d92..54def341c1db 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -238,8 +238,10 @@ static int submit_pin_objects(struct etnaviv_gem_submit *submit)
 		}
 
 		if ((submit->flags & ETNA_SUBMIT_SOFTPIN) &&
-		     submit->bos[i].va != mapping->iova)
+		     submit->bos[i].va != mapping->iova) {
+			etnaviv_gem_mapping_unreference(mapping);
 			return -EINVAL;
+		}
 
 		atomic_inc(&etnaviv_obj->gpu_active);
 
-- 
2.26.2

