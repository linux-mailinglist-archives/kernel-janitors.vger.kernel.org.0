Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFBB9734E
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Aug 2019 09:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfHUHZT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Aug 2019 03:25:19 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60812 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727758AbfHUHZT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Aug 2019 03:25:19 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7L7Nsnp096645;
        Wed, 21 Aug 2019 07:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1YiOw5vp2IiMUEcQ5k4z28G1MhXaEeAqH3xKQ4ND+0g=;
 b=V24qK2/zGD47e5njbolQsWso2DYednOqMm+XjcJIvZdUnQQKDceklMwx8Q8TeY2AsJTw
 VEuDGfNvMj5R+IluIBIPccay/F21c7yxucTkiJmhHydgFm3L6e5x5zl/Q6PD8iFFHTvW
 VgHzcJ/co3lgIgt4Xqkxq0BRgFPe8A4A0L4L7xvz8qXC1Be2DuV0XWRpnb/WHkhQ3FxH
 lUvNXLnMbomzMUBr2LDSw66d4KMM1ZCQ0FlZB0YA5HsPqIF3LCimVZrllpv6Y6PRewup
 l75TqTGABfblS3GPsdIHShTbrfI3osPWshp1Qz6Gn4qGR4eXUJvo8Ybrshajcy5Gt/ul Pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2ue9hpkdcc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Aug 2019 07:25:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7L7NjYE094845;
        Wed, 21 Aug 2019 07:25:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2ugj7q4e0d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Aug 2019 07:25:06 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7L7P31V001215;
        Wed, 21 Aug 2019 07:25:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 21 Aug 2019 00:25:03 -0700
Date:   Wed, 21 Aug 2019 10:24:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/tinydrm: fix a loop in debugfs code
Message-ID: <20190821072456.GJ26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code will likely crash if we try to do a zero byte write.  The code
looks like this:

        /* strip trailing whitespace */
        for (i = count - 1; i > 0; i--)
                if (isspace(buf[i]))
			...

We're writing zero bytes so count = 0.  You would think that "count - 1"
would be negative one, but because "i" is unsigned it is a large
positive numer instead.  The "i > 0" condition is true and the "buf[i]"
access will be out of bounds.

The fix is to make "i" signed and now everything works as expected.  The
upper bound of "count" is capped in __kernel_write() at MAX_RW_COUNT so
we don't have to worry about it being higher than INT_MAX.

Fixes: 02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 1961f713aaab..c4ee2709a6f3 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1187,8 +1187,7 @@ static ssize_t mipi_dbi_debugfs_command_write(struct file *file,
 	struct mipi_dbi_dev *dbidev = m->private;
 	u8 val, cmd = 0, parameters[64];
 	char *buf, *pos, *token;
-	unsigned int i;
-	int ret, idx;
+	int i, ret, idx;
 
 	if (!drm_dev_enter(&dbidev->drm, &idx))
 		return -ENODEV;
-- 
2.20.1

