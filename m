Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B4421EE8F
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 13:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgGNLAP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 07:00:15 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41746 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgGNLAO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 07:00:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EAutPp077213;
        Tue, 14 Jul 2020 10:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=1x6qwlrKTPePi024w3X15nL5DpllLeKkUGjkROHYtT8=;
 b=Kw4uvrnzymlb90KBHi07zkkSPrLT4fIr5u1kmOAECAjsi1kvliA62FDGeByGpzUBZmm2
 WUQnIsoiXmDxJQcxuVSKSNEXlG1ntqlw+wY6uyseKegDCd+7eJeudidIkjGVxCgMnfIC
 WVAMSq3k4wyG3KAXvGvvy+L/Zan1P4EgjrNXodtj30mtQaABdYWgJehmkTAe61WK3S4X
 TZD9se17A/OqC7faf80jAVP9Ck3u/AT3FrbB2phUoOcogcnABMqpi47hAkdw0gyPjRdR
 4J3pmoHJn8w6S8hCidF1sXbaXzMvjvGsTJWvhp9hxetEaX3pquI4OgkJXLO9U3op6PCz RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 32762ncj23-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 10:59:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EAva5t109870;
        Tue, 14 Jul 2020 10:57:41 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 327q0p0mcy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 10:57:40 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06EAvdhT023500;
        Tue, 14 Jul 2020 10:57:39 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 03:57:39 -0700
Date:   Tue, 14 Jul 2020 13:57:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nvme: remove an unnecessary condition
Message-ID: <20200714105732.GD294318@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140084
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

"v" is an unsigned int so it can't be more than UINT_MAX.  Removing this
check makes it easier to preserve the error code as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvme/host/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 3d00ea4e7146..5fb5e8ba531b 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3586,8 +3586,8 @@ static ssize_t nvme_ctrl_reconnect_delay_store(struct device *dev,
 	int err;
 
 	err = kstrtou32(buf, 10, &v);
-	if (err || v > UINT_MAX)
-		return -EINVAL;
+	if (err)
+		return err;
 
 	ctrl->opts->reconnect_delay = v;
 	return count;
-- 
2.27.0

