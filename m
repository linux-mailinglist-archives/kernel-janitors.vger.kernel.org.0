Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3DC1EB76
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2019 11:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfEOJxC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 May 2019 05:53:02 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:34296 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOJxB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 May 2019 05:53:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9iJxq123334;
        Wed, 15 May 2019 09:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=3z/ZITDsN/CZCVjpOcBaC3VoGrsdFz/v/qIHsdipx4w=;
 b=dy6REMmuR6tOqjgBLdhC3FKuJCbH/cthnKcWn7F9aUNyyHkNktmnzWN3Pqon/wQVbsV6
 ezkp3uiLIj1G1kXHvmY8YzjARrud2msbXOrxlg4SJLwGGzu28DmGKjOKOCKtc3kBobNH
 aD6KxveBmtBvb+28Ib1JEu/K58ZYeiUG2KQ1uBUY02ukRE+Aoaq1UXUHYkFCF4Xff+oA
 s/4mm40PGtb/8BbAfU1014CH17zWkZOsYonggNsu5l4swQ0UI8NYgCNK8Po2WLB2GUa5
 P0+98C/+5acM6koOsiAnXcFQbO1AhTrdRbO5kTuVxIik8FLTEspr4tCzQwzFQgGPNxNn 6A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2sdq1qkkjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 May 2019 09:52:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9qP2K022013;
        Wed, 15 May 2019 09:52:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2sggdur332-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 May 2019 09:52:56 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4F9qsl5028971;
        Wed, 15 May 2019 09:52:54 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 May 2019 02:52:53 -0700
Date:   Wed, 15 May 2019 12:52:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Matt Sickler <Matt.Sickler@daktronics.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: kpc2000: double unlock in error handling in
 kpc_dma_transfer()
Message-ID: <20190515095246.GH3409@mwanda>
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
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150063
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The goto err_descr_too_many; calls unlock_engine() so this unlocks
twice.

Fixes: 7df95299b94a ("staging: kpc2000: Add DMA driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc_dma/fileops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index 5741d2b49a7d..d96eaa5e72a6 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -116,13 +116,11 @@ int  kpc_dma_transfer(struct dev_private_data *priv, struct kiocb *kcb, unsigned
 	if (desc_needed >= ldev->desc_pool_cnt){
 		dev_warn(&priv->ldev->pldev->dev, "    mapped_entry_count = %d    num_descrs_needed = %d    num_descrs_avail = %d    TOO MANY to ever complete!\n", acd->mapped_entry_count, desc_needed, num_descrs_avail);
 		rv = -EAGAIN;
-		unlock_engine(ldev);
 		goto err_descr_too_many;
 	}
 	if (desc_needed > num_descrs_avail){
 		dev_warn(&priv->ldev->pldev->dev, "    mapped_entry_count = %d    num_descrs_needed = %d    num_descrs_avail = %d    Too many to complete right now.\n", acd->mapped_entry_count, desc_needed, num_descrs_avail);
 		rv = -EMSGSIZE;
-		unlock_engine(ldev);
 		goto err_descr_too_many;
 	}
 
-- 
2.20.1

