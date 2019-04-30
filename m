Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF267F449
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Apr 2019 12:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfD3KgL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 Apr 2019 06:36:11 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:55258 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfD3KgK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Apr 2019 06:36:10 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UAJA5T055840;
        Tue, 30 Apr 2019 10:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=wJ+r9ZIsCaVDkwmGC9gDgTWzl28sutAUufex4KBJt0M=;
 b=ZtpHeSMI5BPvJDSMBhRdMs2VqMmolgaRRS8CYhK3Pq3dD5bCxKjBrDZwfrnLQcoXcoR0
 j0QIOimKNR4VWUsnxPlViroo6yZA7SHV1hW8mV335Ffy3/IGz4eKxvrn6TmO8wIbY36s
 qmbOv6X50EMnxI9q57FOXWYDjyodQmWutnvMfurKD+KvImEBN+fSPSaE8p9YNXhRaJHn
 APNdHW1Nz8z2qvMKla4C6LlmnvcM0mpIprl/XvNGVYI/k5LvN9oDdFYsaoRDxgx47HKM
 h2ZVvFsbQRL5hQ3l/xo4mWkfrafIYZK8TEFhZcRx5He0z9kkj0jLr+ZzSZAccNQH2anu LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2s4ckdbwgp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Apr 2019 10:36:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UAWf4r113199;
        Tue, 30 Apr 2019 10:34:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2s4d4aeebe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Apr 2019 10:34:06 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UAY6rP029803;
        Tue, 30 Apr 2019 10:34:06 GMT
Received: from mwanda (/196.97.65.153)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 30 Apr 2019 03:34:05 -0700
Date:   Tue, 30 Apr 2019 13:33:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: kpc2000: fix resource size calculation
Message-ID: <20190430103359.GA7064@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300069
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300069
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The code is calculating the resource size wrong because it should be
inclusive of the "res->end" address.  In other words, "end - start + 1".
We can just use the resource_size() function to do it correctly.

Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc_i2c/i2c_driver.c | 2 +-
 drivers/staging/kpc2000/kpc_spi/spi_driver.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c b/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c
index 6bb6ad4abe87..1fc30dc687f9 100644
--- a/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c
+++ b/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c
@@ -632,7 +632,7 @@ int pi2c_probe(struct platform_device *pldev)
     priv->adapter.algo = &smbus_algorithm;
     
     res = platform_get_resource(pldev, IORESOURCE_MEM, 0);
-    priv->smba = (unsigned long)ioremap_nocache(res->start, res->end - res->start);
+    priv->smba = (unsigned long)ioremap_nocache(res->start, resource_size(res));
     
     priv->pldev = pldev;
     pldev->dev.platform_data = priv;
diff --git a/drivers/staging/kpc2000/kpc_spi/spi_driver.c b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
index b38149b752fb..e568dec04800 100644
--- a/drivers/staging/kpc2000/kpc_spi/spi_driver.c
+++ b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
@@ -452,7 +452,7 @@ kp_spi_probe(struct platform_device *pldev)
         goto free_master;
     }
     
-    kpspi->phys = (unsigned long)ioremap_nocache(r->start, r->end - r->start);
+    kpspi->phys = (unsigned long)ioremap_nocache(r->start, resource_size(r));
     kpspi->base = (u64 __iomem *)kpspi->phys;
     
     status = spi_register_master(master);
-- 
2.18.0

