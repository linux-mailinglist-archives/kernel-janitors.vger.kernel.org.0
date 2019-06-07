Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781A0384FB
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 09:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfFGH1f (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 03:27:35 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50554 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfFGH1f (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 03:27:35 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577EjJS060387;
        Fri, 7 Jun 2019 07:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=1l1gN+Cj3gB+hD12RqqJU++Iob/ZFBye8FgdiJ1WcTY=;
 b=nyE5axnLNNk26ju6uKOs//yJIaWmh1aqyalk/ZKyGELzA5uJtQWCILPkIgIMXkhLVTf0
 owqz/ZaTN9sH1exi+fP1bepa33ZUNPy7Jc+1zuO8JDD0Js0dqy4bKULs7c+UUSEO3efA
 hapXXp0gLA8piyN7ZM1FSoM37g9TWMtX1v5J0jlwR2S5hx7jYLsAzNByTQsQhMV7vEoe
 BThx23S1bPlCtd/i0lKo9RBrwjbkPkqPDgD57PvzMkqCtWBoV5sldaAT8bXVqVARI1ih
 9ILP+tnzyMr5wtOedIlwiEB+ydbE+smZHR9G0mN7owSI1LzZGNc0U/yVJVOR1lVelN8+ Qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2sugstvm04-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 07:27:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577QbRU086473;
        Fri, 7 Jun 2019 07:27:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2swnhb61mr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 07:27:21 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x577REfP027068;
        Fri, 7 Jun 2019 07:27:14 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 Jun 2019 00:27:13 -0700
Date:   Fri, 7 Jun 2019 10:27:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent out
 of bounds read
Message-ID: <20190607072704.GA25229@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070052
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This should check that "i" is within bounds before checking reading from
the array.

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d6f98d388ac2..6b03616d6bc3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 	if (ret)
 		goto out;
 
-	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
-		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
+	for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
+		    sii902x->audio.i2s_fifo_sequence[i]; i++)
 		regmap_write(sii902x->regmap,
 			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
 			     sii902x->audio.i2s_fifo_sequence[i]);
-- 
2.20.1

