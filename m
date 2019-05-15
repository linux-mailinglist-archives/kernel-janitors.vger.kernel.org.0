Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA6FC1EB72
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2019 11:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEOJwh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 May 2019 05:52:37 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57768 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOJwh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 May 2019 05:52:37 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9iZr4108794;
        Wed, 15 May 2019 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=nOPM1tWCx9saDds42QB+n/eLWhRVDj2AGRg8QPgfMSk=;
 b=MbddDXWH8igVLX7/m0GJe6n8tEQcVB2E5gYj2kj7PVePgXFHY/O7mobbCW5uFprHPG5n
 M8XR9JaLsYXCqYeVlBNtL5y3y+Zt3THcQjP/navkDmfXvDVcJP4DirF95zGsL9eicv//
 LOFCTDukS7Psuva/NQTsE0DoD8jB1LjYSm6XwJLc0h/sjJ0TaK1jqkfgbAGi8lh4324w
 2Djj04TXhkwGQ1gx50zpg2BRUi/oNYtZYGsK7TpjpmTNuojUhY+YOWoECU3Z16XkHhYh
 fC22CPfdoTnYPB7GZ9/s5dEy+ML3QoMyscHFn/krNf1Pl52J9D/AoII9vtyv3KxA+8z4 +w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2sdnttupmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 May 2019 09:52:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9qOLS021944;
        Wed, 15 May 2019 09:52:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2sggdur2xg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 May 2019 09:52:31 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4F9qUsL006185;
        Wed, 15 May 2019 09:52:30 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 May 2019 02:52:30 -0700
Date:   Wed, 15 May 2019 12:52:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Adham Abozaeid <adham.abozaeid@microchip.com>,
        Johnny Kim <johnny.kim@atmel.com>
Cc:     Ajay Singh <ajay.kathat@microchip.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: wilc1000: Fix some double unlock bugs in
 wilc_wlan_cleanup()
Message-ID: <20190515095223.GG3409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150064
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150063
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If ->hif_read_reg() or ->hif_write_reg() fail then the code unlocks
and keeps executing.  It should just return.

Fixes: c5c77ba18ea6 ("staging: wilc1000: Add SDIO/SPI 802.11 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/wilc1000/wilc_wlan.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wilc1000/wilc_wlan.c b/drivers/staging/wilc1000/wilc_wlan.c
index 0a713409ea98..95eaf8fdf4f2 100644
--- a/drivers/staging/wilc1000/wilc_wlan.c
+++ b/drivers/staging/wilc1000/wilc_wlan.c
@@ -1076,13 +1076,17 @@ void wilc_wlan_cleanup(struct net_device *dev)
 	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
 
 	ret = wilc->hif_func->hif_read_reg(wilc, WILC_GP_REG_0, &reg);
-	if (!ret)
+	if (!ret) {
 		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		return;
+	}
 
 	ret = wilc->hif_func->hif_write_reg(wilc, WILC_GP_REG_0,
 					(reg | ABORT_INT));
-	if (!ret)
+	if (!ret) {
 		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		return;
+	}
 
 	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
 	wilc->hif_func->hif_deinit(NULL);
-- 
2.20.1

