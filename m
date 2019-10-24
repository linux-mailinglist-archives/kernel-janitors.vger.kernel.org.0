Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C212E3DAC
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Oct 2019 22:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfJXUxj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 24 Oct 2019 16:53:39 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47920 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbfJXUxj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Oct 2019 16:53:39 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OKmxts114037;
        Thu, 24 Oct 2019 20:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=XzYkpls0mGKqdG0KuT3/x44DM6Nq0EWYShTlbULF7VQ=;
 b=HwvS4QFq5egQPgTBvuA02cbbyTBrC/K2DKEkfnhZlAySXlZLzKRdkU/yYFjDxMvjZYAO
 Nf40ZL+Kfy07xdpYxYwE/igAL96NCojH2gnOuHCIw7OgDIobyIWRWNMd8vn/TJZJtO+x
 QriwM40ddPL/HLeYJe+/mmwL+kQ45evDG+6q+RxyvL6MphcGbMxbSaX5fr3NmEvGc0Wv
 6B2pPwE+Xj5cndo0BDjIsMs60lecEYXMGB5CTqlQROVf56BYruCf98zMhe9jM0EXJZMR
 tM2VxEhrEE6Vf60Gak24m/xUj8sAbUs2TZ3ePyl0+PE6Wr6eA27fF2IiprJO/Dd2jNwR PQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2vqu4r61bf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Oct 2019 20:53:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OKrJWv121105;
        Thu, 24 Oct 2019 20:53:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2vu0fq2cja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Oct 2019 20:53:20 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9OKrGkY009895;
        Thu, 24 Oct 2019 20:53:16 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 24 Oct 2019 13:53:15 -0700
Date:   Thu, 24 Oct 2019 23:53:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20191024205306.GA14416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240196
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910240195
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Originally this error path used to leak "bin" but then we accidentally
applied two separate commits to fix it and ended up with a double free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hi Stephen,

I think this one is actually just a linux-next issue and the Fixes tag
would point to commit f8593384f83f ("Merge remote-tracking branch
'drm/drm-next'").

The original commits are 0d352a3a8a1f ("drm/v3d: don't leak bin job if
v3d_job_init fails.") and commit 29cd13cfd762 ("drm/v3d: Fix memory leak
in v3d_submit_cl_ioctl").

I'm not totally sure how you guys address this normally but presumably
you are experts at dealing with merge issues.  :)

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
2.20.1

