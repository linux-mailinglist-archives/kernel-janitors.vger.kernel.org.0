Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147F24A13F
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 14:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFRM6r (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 08:58:47 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44806 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFRM6r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 08:58:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICwcCV017719;
        Tue, 18 Jun 2019 12:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=VN1nlMuLCcvI+mqE18BsBbvixn8Eid8foVg4TrsGDOU=;
 b=Jw1oD4jYzSIQ/3hgo/6oZt6Rlx7VNXOMTIpAmMDTdVZIoIEODjjTskwOO6NQ0PxhpFcA
 tEG4wowNMlAPi6z0eSLjGJjfwAsuXjjKgEr6tptuYpoywTcd9Xd+RvuLMpS1Rq3mCiKe
 DqJvM/SAr/tx65B32Q8LZFoRNWq1H/BwtXszFbLmrfVDLUX+DlcTzrQXr/0cQe9XAY8u
 wMMTvfSbcPlYPnSiOSPxHG/pvJVIyDySqgKgfDaQtcngHk2mDcsPix+2MeOhn8dJjo86
 89d/TWMRXsgdVF3RrH9kpUAlzXZeDJyKkbJSdzUod27WW41aD3ICj8VCmnSRpJp9nyQJ Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2t4r3tmcgg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jun 2019 12:58:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICuRgp090773;
        Tue, 18 Jun 2019 12:56:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2t5mgbxb29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jun 2019 12:56:36 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5ICuWbl031932;
        Tue, 18 Jun 2019 12:56:32 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 18 Jun 2019 05:56:32 -0700
Date:   Tue, 18 Jun 2019 15:56:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-ID: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180107
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return -EFAULT.  This function is called from
__drm_legacy_infobufs() which expects negative error codes.

Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This goes through Al's tree and not through drm.  Presumably this patch
will just get folded into the original.

 drivers/gpu/drm/drm_bufs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 68dacf8422c6..8ce9d73fab4f 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1351,7 +1351,10 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
 				 .size = from->buf_size,
 				 .low_mark = from->low_mark,
 				 .high_mark = from->high_mark};
-	return copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags));
+
+	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
+		return -EFAULT;
+	return 0;
 }
 
 int drm_legacy_infobufs(struct drm_device *dev, void *data,
-- 
2.20.1

