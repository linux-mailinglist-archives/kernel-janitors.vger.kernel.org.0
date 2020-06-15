Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EC81F9552
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jun 2020 13:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgFOL2N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 Jun 2020 07:28:13 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43930 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbgFOL2M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Jun 2020 07:28:12 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05FBS6cr059559;
        Mon, 15 Jun 2020 11:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=bW/5BY6xbS9kCz3oxAq+2lszNKPZYcPTz9MWUXSJJTQ=;
 b=wnMc+XgdTGjIpfovt6h+TkCHH8gpIP0F826ijhQJKbqm1QyVvXzg0IC0p9lMp3Te11Gv
 N9R1BZpmDr4CO3J/rmt/nIbSA7UnajrKa8y9cCG2FS6cFjX2OAe82nL0aLz5e6vx2FfZ
 mNySk3dCPo57La2K6rIEyoDxIGodC64zhIA2sZtcqCTL272d2DOW5QWMiOaPRePe/qKu
 XxAWUDlLAmUgP3VjHKdXHtJB0T3eVEnSF20LRJbYtG/PP74mPQxxdOHP4WeHrWx8ZtKR
 p69HftAValRgQbBFUXpJ97gcF+6FzuJpqYQe5SpG4ai4jAbPY4ZjIvEldqd5o8VeYLWy ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 31p6e5rgg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jun 2020 11:28:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05FBS5O2154092;
        Mon, 15 Jun 2020 11:28:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 31p6s54tys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 11:28:05 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05FBS15X010407;
        Mon, 15 Jun 2020 11:28:02 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 15 Jun 2020 04:28:01 -0700
Date:   Mon, 15 Jun 2020 14:27:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vc4: Fix an error code vc4_create_object()
Message-ID: <20200615112754.GB1207669@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006150092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006150092
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The vc4_create_object() needs to return NULL on error, not error
pointers.  If it returns an error pointer then that will lead to an
Oops in the callers.  Fortunately, in current kernels small allocations
always succed so this will never happen.

Fixes: c826a6e10644 ("drm/vc4: Add a BO cache.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 72d30d90b856c..0af246a5609ca 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -389,7 +389,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
-- 
2.26.2

