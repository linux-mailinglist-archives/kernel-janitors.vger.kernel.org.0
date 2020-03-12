Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91620182F61
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 12:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgCLLi5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 07:38:57 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60740 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgCLLi5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 07:38:57 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CBWddV162866;
        Thu, 12 Mar 2020 11:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iGXT7eu1hSl8BMZGeJVU++wfkK6X8r1GtDze0h7kfsw=;
 b=DDAvu0Y01jqlT9TTqzlLwPQW2mRJgw+/cZcBMqBEltRl8YAPhOdatmfQVAZUChDu9EUr
 MIZdGYmw3uWJexp0GwCes45p4yHqZxD7mtCYlGf2Z3LFEXlZ076X+iyXqNAtrcmNwfqG
 Ar/WPapFj8+fybSu49OUo+qhFR0/yEdxK+9+XTcCssKy5wOr0OEvvcksHghg3oZ1pY+2
 dr2Ftr1/Jy/FCtlTbv6KVOzWIvloWEw4gh1sO5pAqW2hYgyFR+/5uJeHPTFeUgDHl1jm
 mFLjDFCP6kwy2qZnW3C2sOGPg+QwUJHNhyD58Ew4CDFcLCBvB+vdzNOZTBwKTl2eEK54 1g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2ym31us2n7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 11:37:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CBbDZq138691;
        Thu, 12 Mar 2020 11:37:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2yp8p72epn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 11:37:43 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02CBbeAg008328;
        Thu, 12 Mar 2020 11:37:40 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 12 Mar 2020 04:37:39 -0700
Date:   Thu, 12 Mar 2020 14:37:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Woodhouse <dwmw2@infradead.org>,
        Megha Dey <megha.dey@linux.intel.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/vt-d: Unlock on error paths
Message-ID: <20200312113730.GF20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120063
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There were a couple places where we need to unlock before returning.

Fixes: 91391b919e19 ("iommu/vt-d: Populate debugfs if IOMMUs are detected")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iommu/intel-iommu-debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel-iommu-debugfs.c b/drivers/iommu/intel-iommu-debugfs.c
index 8d24c4d85cc2..6a495b103972 100644
--- a/drivers/iommu/intel-iommu-debugfs.c
+++ b/drivers/iommu/intel-iommu-debugfs.c
@@ -289,11 +289,12 @@ static int dmar_translation_struct_show(struct seq_file *m, void *unused)
 		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
 		if (!(sts & DMA_GSTS_TES)) {
 			seq_puts(m, "DMA Remapping is not enabled\n");
-			return 0;
+			goto unlock;
 		}
 		root_tbl_walk(m, iommu);
 		seq_putc(m, '\n');
 	}
+unlock:
 	rcu_read_unlock();
 
 	return 0;
@@ -444,7 +445,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
 		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
 		if (!(sts & DMA_GSTS_IRES)) {
 			seq_puts(m, "Interrupt Remapping is not enabled\n");
-			return 0;
+			goto unlock;
 		}
 
 		if (iommu->ir_table) {
@@ -475,6 +476,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
 		}
 		seq_putc(m, '\n');
 	}
+unlock:
 	rcu_read_unlock();
 
 	return 0;
-- 
2.20.1

