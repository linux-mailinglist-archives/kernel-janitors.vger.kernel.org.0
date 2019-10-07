Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561A9CDDBC
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2019 10:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfJGIwc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Oct 2019 04:52:32 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39004 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727419AbfJGIwc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Oct 2019 04:52:32 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978n6NZ016363;
        Mon, 7 Oct 2019 08:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Y5VOBdhJYKoOEWNwAuCcUBHYzyxa8LK1tzzam4leBDU=;
 b=c0Ijq4zrQVBB/Q4fuLRAvEIQ73uV8fQTTSwebMH3HJ492aK3BNojbVjOkSvrovKi83Ik
 QqazFaG//MtXU7O9FnKwdP1qxFGfs7yKF+kd7MX94XeDwdqg+0YgdYi7MuHhPmTv3sGB
 Dj7/VEE2D5N8aeK0cOEDwefqWKdCRjuBecNeTVhq+6BPCXEbLn8BG14Pu+s5WFGtnpjf
 2dVKvQphNnyYFaE6C9owConaaLtoVz0hfUxCC9DRXrlmN01LnwyyimJUVL3E+HNSHC11
 vdu3MLE9+PMhzXP6XUzfZSSIq+UWySlDtcO9+9guYw4UANgXS38u/KJX189EKwKQ+xxj CA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2vektr595p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 08:52:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978nRPk168605;
        Mon, 7 Oct 2019 08:52:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2vf4ph51hd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 08:52:23 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x978qJsS013670;
        Mon, 7 Oct 2019 08:52:19 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Oct 2019 01:52:18 -0700
Date:   Mon, 7 Oct 2019 11:52:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felix Kuehling <Felix.Kuehling@amd.com>,
        Yong Zhao <Yong.Zhao@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdkfd: Fix a && vs || typo
Message-ID: <20191007085210.GC3865@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070092
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the current code if "device_info" is ever NULL then the kernel will
Oops so probably || was intended instead of &&.

Fixes: e392c887df97 ("drm/amdkfd: Use array to probe kfd2kgd_calls")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 0db273587af4..070c9b5593c9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -498,7 +498,7 @@ struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
 	device_info = kfd_supported_devices[asic_type][vf];
 	f2g = kfd2kgd_funcs[asic_type];
 
-	if (!device_info && !f2g) {
+	if (!device_info || !f2g) {
 		dev_err(kfd_device, "%s %s not supported in kfd\n",
 			amdgpu_asic_name[asic_type], vf ? "VF" : "");
 		return NULL;
-- 
2.20.1

