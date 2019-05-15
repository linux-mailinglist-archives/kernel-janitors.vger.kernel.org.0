Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40741EB20
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2019 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfEOJjf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 May 2019 05:39:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48916 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOJjf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 May 2019 05:39:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9ckbo118949;
        Wed, 15 May 2019 09:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ncogVXqXtGlJZE/6XQZasq2H+a/9MatI+TuqSMcpnik=;
 b=poeUQ3HpofWe15NeBAg9ASPdgbmwLgUPC3qgNr6nGxw+DlhU1Uvxw8H0/fFhrBS8ohKg
 jKQlAEimY7YJF6HgPTxswx9QKOk+oqlWOwU7jPgWePT0eR285j7AFXeuBVTDemKzbeWs
 tEIGURFm9qkcI32pRFJs0gQKUMJL3aX62IJtXWqn2r2L93BZ+2BhC0kI3wJQlt/rbdRv
 JJLAX+UX5OYP6jGUAW1wWTOFuxftpKKab3/pBeKnSuGaLQ+Kib9IJv62iEzY+G2RYBhb
 WHHPsfXI5asqkoEknnT7+LIgBzQHwd4Na1c2Nmq8KTiGMJW3PzeNT8NnQPcQRq5CAQPr rA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2sdq1qkhdk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 May 2019 09:38:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9bmtb154136;
        Wed, 15 May 2019 09:38:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2sdmebmw22-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 May 2019 09:38:51 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4F9chnM021125;
        Wed, 15 May 2019 09:38:43 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 May 2019 02:38:42 -0700
Date:   Wed, 15 May 2019 12:38:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.net>, popcornmix <popcornmix@gmail.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dominic Braun <inf.braun@fau.de>,
        Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Elwell <phil@raspberrypi.org>,
        linux-rpi-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vc04_services: prevent integer overflow in
 create_pagelist()
Message-ID: <20190515093831.GE3409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150062
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150062
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The create_pagelist() "count" parameter comes from the user in
vchiq_ioctl() and it could overflow.  If you look at how create_page()
is called in vchiq_prepare_bulk_data(), then the "size" variable is an
int so it doesn't make sense to allow negatives or larger than INT_MAX.

I don't know this code terribly well, but I believe that typical values
of "count" are typically quite low and I don't think this check will
affect normal valid uses at all.

The "pagelist_size" calculation can also overflow on 32 bit systems, but
not on 64 bit systems.  I have added an integer overflow check for that
as well.

The Raspberry PI doesn't offer the same level of memory protection that
x86 does so these sorts of bugs are probably not super critical to fix.

Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_2835_arm.c   | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index a9a22917ecdb..a5b5840ff91a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -368,9 +368,18 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 	int dma_buffers;
 	dma_addr_t dma_addr;
 
+	if (count >= INT_MAX - PAGE_SIZE)
+		return NULL;
+
 	offset = ((unsigned int)(unsigned long)buf & (PAGE_SIZE - 1));
 	num_pages = DIV_ROUND_UP(count + offset, PAGE_SIZE);
 
+	if (num_pages > (SIZE_MAX - sizeof(struct pagelist) -
+			 sizeof(struct vchiq_pagelist_info)) /
+			(sizeof(u32) + sizeof(pages[0]) +
+			 sizeof(struct scatterlist)))
+		return NULL;
+
 	pagelist_size = sizeof(struct pagelist) +
 			(num_pages * sizeof(u32)) +
 			(num_pages * sizeof(pages[0]) +
-- 
2.20.1

