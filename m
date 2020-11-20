Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3212BA460
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Nov 2020 09:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgKTILb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Nov 2020 03:11:31 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37728 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgKTILb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Nov 2020 03:11:31 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK8AhCT040413;
        Fri, 20 Nov 2020 08:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=AhZ4fxgQB/M0jZT9FwVmTGfd0DCAD2vwsStYfbDJIGw=;
 b=VHw3gzh/yaqVH+NOQ61A+3CAEcoUbNuG7446BA656bkqRGPZA3vXyKLZouiXmiIHSW+e
 rWEV7Ocx7b7BnYt0yR94dPcSSIoZSjKslq1VOzR/KcciwlOGshaXdKtU05VUerVE+ejv
 hzC3dXdB7K91WwmDYgBgmHBqtjcYPWhBeVbyJPC2RO5Uzo8EUDMXq/mJ/uJazRt2UqTh
 b/hyFZaU+oOMP1PfMhpsFmHH4P/AfwPHnaQJ5B9sUxGgfgBI7FbIblvwYVmGGyj7u342
 bJGvqoIHnYf0CMRJ/xeGK4Mr7/azoZcbp3e6n3lTM5kITwI1bxreAXyrZThfBP2TS+T1 Bw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 34t76m9d4q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 08:11:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK85jpS195071;
        Fri, 20 Nov 2020 08:11:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 34uspxac0d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Nov 2020 08:11:21 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AK8BLWF018059;
        Fri, 20 Nov 2020 08:11:21 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 20 Nov 2020 00:11:20 -0800
Date:   Fri, 20 Nov 2020 11:11:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc:     Edmund Dea <edmund.j.dea@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Message-ID: <20201120081113.GL18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117072103.GA1111239@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200053
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
The kernel will Oops when we pass it to kmb_dsi_host_unregister().

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: write a better commit message

 drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index a31a840ce634..8c43b136765c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
 	if (IS_ERR(kmb->kmb_dsi)) {
 		drm_err(&kmb->drm, "failed to initialize DSI\n");
 		ret = PTR_ERR(kmb->kmb_dsi);
-		goto err_free1;
+		goto err_clear_drvdata;
 	}
 
 	kmb->kmb_dsi->dev = &dsi_pdev->dev;
@@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_crtc_cleanup(&kmb->crtc);
 	drm_mode_config_cleanup(&kmb->drm);
  err_free1:
-	dev_set_drvdata(dev, NULL);
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
+ err_clear_drvdata:
+	dev_set_drvdata(dev, NULL);
 
 	return ret;
 }
-- 
2.28.0
