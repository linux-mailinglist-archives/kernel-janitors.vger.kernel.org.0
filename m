Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849A32CD177
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Dec 2020 09:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388299AbgLCIl4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Dec 2020 03:41:56 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55832 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388226AbgLCIlz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Dec 2020 03:41:55 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38Z2e4104294;
        Thu, 3 Dec 2020 08:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=y0AkgjFKsjYvohIaOVdZyt2GdcZIXysd01eKOu8q7s4=;
 b=W6HEMhaIRCqtCpjon9WKYTuJkn8xRQmxCtFiVkE/VCjfhCnnXGiLF+PNTqfXVbaMcA7P
 Kn0dnmZANZdZD0bQxCpVd4aALVt3E9HUUNqXvmFGoPsicK4DZMuOSuNsvWHC2DSEBDyH
 aVmuVdER6/87I1+9aYtzis0YdcgUs1v3W/RscEJyc8qaC1hfW9St1KM/f86AqMEZxLar
 93xteFPI1TVG5AsOOr/ujAtJsHJWgZd7UnGZzLfVpjUSRpBC3WG9N+m+Hx9MwGrqujGl
 6z/fiS5Eed9EsAALExBnty2gWco1jWi8nP5WQzt+wftEKUQG6QXTNCsI1FugrGq2b6er Kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 353c2b4njt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Dec 2020 08:41:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38eU2k141822;
        Thu, 3 Dec 2020 08:41:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 35404qg187-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Dec 2020 08:41:04 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B38etlW020747;
        Thu, 3 Dec 2020 08:40:55 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Dec 2020 08:40:54 +0000
Date:   Thu, 3 Dec 2020 11:40:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Alan Cox <alan@linux.intel.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gma500: clean up error handling in init
Message-ID: <X8ikkAqZfnDO2lu6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030052
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The main problem with this error handling was that it didn't clean up if
i2c_add_numbered_adapter() failed.  This code is pretty old, and doesn't
match with today's checkpatch.pl standards so I took the opportunity to
tidy it up a bit.  I changed the NULL comparison, and removed the
WARNING message if kzalloc() fails and updated the label names.

Fixes: 1b082ccf5901 ("gma500: Add Oaktrail support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
index e28107061148..fc9a34ed58bd 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
@@ -279,11 +279,8 @@ int oaktrail_hdmi_i2c_init(struct pci_dev *dev)
 	hdmi_dev = pci_get_drvdata(dev);
 
 	i2c_dev = kzalloc(sizeof(struct hdmi_i2c_dev), GFP_KERNEL);
-	if (i2c_dev == NULL) {
-		DRM_ERROR("Can't allocate interface\n");
-		ret = -ENOMEM;
-		goto exit;
-	}
+	if (!i2c_dev)
+		return -ENOMEM;
 
 	i2c_dev->adap = &oaktrail_hdmi_i2c_adapter;
 	i2c_dev->status = I2C_STAT_INIT;
@@ -300,16 +297,23 @@ int oaktrail_hdmi_i2c_init(struct pci_dev *dev)
 			  oaktrail_hdmi_i2c_adapter.name, hdmi_dev);
 	if (ret) {
 		DRM_ERROR("Failed to request IRQ for I2C controller\n");
-		goto err;
+		goto free_dev;
 	}
 
 	/* Adapter registration */
 	ret = i2c_add_numbered_adapter(&oaktrail_hdmi_i2c_adapter);
-	return ret;
+	if (ret) {
+		DRM_ERROR("Failed to add I2C adapter\n");
+		goto free_irq;
+	}
 
-err:
+	return 0;
+
+free_irq:
+	free_irq(dev->irq, hdmi_dev);
+free_dev:
 	kfree(i2c_dev);
-exit:
+
 	return ret;
 }
 
-- 
2.29.2

