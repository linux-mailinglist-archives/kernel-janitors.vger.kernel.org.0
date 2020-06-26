Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9324B20AFD1
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Jun 2020 12:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgFZKex (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 Jun 2020 06:34:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53856 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFZKex (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Jun 2020 06:34:53 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAS43N019172;
        Fri, 26 Jun 2020 10:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5+OZZTMSngmfBWHossxW7615CGl7K9Pe+5YWfY8MV0s=;
 b=Vzqpp/MASSKl5S5xtX61Wh9C1k0JIz/pE0RkUflVQ8pzeZDjtag/OH8R1xFCH9v7EZep
 InIOYxQg5N10CZzTH8GnlONSntGbrOs2C+gnBIrQn6/cb39Bw2V890Af4DCk03T5qRkn
 lt4V0XTOfmTGZ7lb+1W60Wylk0qa5CjiwE2iIg7OU46B00xWjRNgbJ2b+vbwRn2M9Kse
 fMmnFV0OdeMZ/znF/qhDO2T6VXEbSmDQ6gvNJSN+qJnaBBeunTtuWVogdY+830oaixBL
 FGV/TUF2fuO23NYbXW9GTrAbvIZSZptDIQntCbkwNbBtYBWczfefuAYX6LsqSVaFd7og uQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31uustwc3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 10:34:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QASKqH020384;
        Fri, 26 Jun 2020 10:34:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 31uurbwy43-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 10:34:46 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05QAYjeI011239;
        Fri, 26 Jun 2020 10:34:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 26 Jun 2020 10:34:44 +0000
Date:   Fri, 26 Jun 2020 13:34:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Jakob Bornecrantz <jakob@vmware.com>
Cc:     Roland Scheidegger <sroland@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Dave Airlie <airlied@redhat.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
Message-ID: <20200626103437.GB314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260076
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "entry" pointer is an offset from the list head and it doesn't
point to a valid vmw_legacy_display_unit struct.  Presumably the
intent was to point to the last entry.

Also the "i++" wasn't used so I have removed that as well.

Fixes: d7e1958dbe4a ("drm/vmwgfx: Support older hardware.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.  This bug celebrated its tenth
birthday last month.  :)

 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 16dafff5cab1..009f1742bed5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -81,7 +81,7 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 	struct vmw_legacy_display_unit *entry;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_crtc *crtc = NULL;
-	int i = 0;
+	int i;
 
 	/* If there is no display topology the host just assumes
 	 * that the guest will set the same layout as the host.
@@ -92,12 +92,11 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 			crtc = &entry->base.crtc;
 			w = max(w, crtc->x + crtc->mode.hdisplay);
 			h = max(h, crtc->y + crtc->mode.vdisplay);
-			i++;
 		}
 
 		if (crtc == NULL)
 			return 0;
-		fb = entry->base.crtc.primary->state->fb;
+		fb = crtc->primary->state->fb;
 
 		return vmw_kms_write_svga(dev_priv, w, h, fb->pitches[0],
 					  fb->format->cpp[0] * 8,
-- 
2.27.0

