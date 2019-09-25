Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664AABDC8C
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 13:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403781AbfIYLAX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 07:00:23 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33038 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390611AbfIYLAX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 07:00:23 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PAsJCX084519;
        Wed, 25 Sep 2019 11:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=JlYPfVEI1m9TVlmBmEumCGhGjRSxJ5NEbZHZwmv7OTU=;
 b=HJsKYhf6F/aCP19RmFtTPu2DebP+tKssA5NErnrewY1+slVWAeoz3xmO3MOVkm5b+B5e
 WZ61Pv8ewaqVMO0KxONetQgnwK3M1eGWGQFi/wqROKZtsEQXLoTt2ruoR7xhfPPdR3+C
 cNfvK2MB1ImLQBNit3YJWdVa1UKOY8/zmHSGzwR9FXBWtL68yCAJ3wGocLvA7qUunIEu
 6eykNp8hjbLE0fio68HacXE1wxO1LRYqLAKqTZ1DVI1wR2rx20eLkuK4pecPE4nKDlhW
 Fk42xZ0FDTA62xFCkR3JWksoRN7i5//8xB+deg/6X4SFzcX1imjbV4ppzZMd2wo5IVQR rA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2v5cgr3thd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Sep 2019 11:00:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PAwm7Y034236;
        Wed, 25 Sep 2019 11:00:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2v7vnxsare-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Sep 2019 11:00:16 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8PB0FKR007981;
        Wed, 25 Sep 2019 11:00:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 25 Sep 2019 04:00:15 -0700
Date:   Wed, 25 Sep 2019 14:00:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Ira Weiny <ira.weiny@intel.com>, linux-nvdimm@lists.01.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Message-ID: <20190925110008.GK3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909250112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250112
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ndns->claim_class" variable is an enum but in this case GCC will
treat it as an unsigned int so the error handling is never triggered.

Fixes: 14e494542636 ("libnvdimm, btt: BTT updates for UEFI 2.7 format")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvdimm/namespace_devs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index cca0a3ba1d2c..669985527716 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1529,7 +1529,7 @@ static ssize_t __holder_class_store(struct device *dev, const char *buf)
 		return -EINVAL;
 
 	/* btt_claim_class() could've returned an error */
-	if (ndns->claim_class < 0)
+	if ((int)ndns->claim_class < 0)
 		return ndns->claim_class;
 
 	return 0;
-- 
2.20.1

