Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A3127E476
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Sep 2020 11:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgI3JDP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Sep 2020 05:03:15 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58824 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3JDP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Sep 2020 05:03:15 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U8x5Kh062337;
        Wed, 30 Sep 2020 09:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=J8BixLmPCG+/UMQLvEIgqzyFL9iqxTWES2YfuUo0riQ=;
 b=GcxUuD3wfWj2mBb46I6n4M8kZoKd90sAkkxQYLKY54O9MCVp/J/kzpAr1FYLIwWXU/4O
 c/QhH31NgfFPFxl3ljeDlQx3TRR9GdCrFomkfBF/ehzJsyPSkpGi/Yu/R83J1225QwCV
 WBtID25qkHkEIMlGKJOMjfwFBXyax4Hymz22aALr4WA5snJzr1x+VG6dlOM6ewu7tB35
 exLkt/ozMr8NQ8Q3OwVBqaWanaJHVW3OcDmoOOww1zNgYInkhCFbFgsttsFM19LastTX
 CYmOs+o6HYMnMQHkblPQa6YKFdHPN14+4fGczMeFT/QX5Rn7zyE//7guD2YUCiX5eoUH pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 33sx9n7bex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 09:02:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U90U9o080916;
        Wed, 30 Sep 2020 09:02:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 33tfhytbm6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 09:02:56 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08U92kTR009794;
        Wed, 30 Sep 2020 09:02:47 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 02:02:45 -0700
Date:   Wed, 30 Sep 2020 12:02:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jamal Shareef <jamal.k.shareef@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vchiq: silence an uninitialized variable warning
Message-ID: <20200930090238.GA621698@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300072
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "userdata" can be passed to vchiq_bulk_transfer()
without being initialized.  Smatch is correct, however, in that
situation the "userdata" is not used so it doesn't cause a problem.
Passing an uninitialized variable will trigger a UBSan warning at
runtime so this warning is worth silencing by setting "userdata" to
NULL.

Fixes: a4367cd2b231 ("staging: vchiq: convert compat bulk transfer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 590415561b73..71b962777da5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -952,7 +952,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 {
 	struct vchiq_service *service;
 	struct bulk_waiter_node *waiter = NULL;
-	void *userdata;
+	void *userdata = NULL;
 	int status = 0;
 	int ret;
 
-- 
2.28.0

