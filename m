Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75731D4D67
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 May 2020 14:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgEOMHV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 May 2020 08:07:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:47372 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgEOMHU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 May 2020 08:07:20 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04FC6bHj060986;
        Fri, 15 May 2020 12:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=+w+qMJL5qpqG93GwokgbYaw4uytxGs6s1y/FgpYaxpE=;
 b=DPL3WYO4ATRLMc597dc/nqE8KDtIHPs+MJnsFUQaUDZo6X5CSw0W53xC+oNSq4w1Vgma
 RUf+lMAU6Jyf+/l4LSGyYAKTw93rMiMRlPcKUJiXyXElz9oD2HszsIzlEas2dTkUKMRY
 0WuhEy3nip3Mn0cByJxle1iR2YxdObOPfER2+ebg8Ve530YXy2ypyHp3p45blUqFrSRh
 X/bmR3wLzj3ZpzeZWb5ZHXsLYRCIbpYt6apCyTPnJaw5CAJbZgKIiZrmxNS5HEWrR2NT
 gCc2r46mCPFzvItF4eJGu2pgs7jXTxi5bPRj6EvqyHmJg0GoUSk5nSxyif4V6UqmA7CH jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 3100ygaj0e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 12:07:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04FC49Y0104758;
        Fri, 15 May 2020 12:07:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 3100yer6uc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 May 2020 12:07:07 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04FC75eu031091;
        Fri, 15 May 2020 12:07:06 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 15 May 2020 05:07:05 -0700
Date:   Fri, 15 May 2020 15:06:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nvme: delete an unnecessary declaration
Message-ID: <20200515120659.GA575846@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 cotscore=-2147483648 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005150105
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The nvme_put_ctrl() is implemented earlier as an inline function so
this declaration isn't required.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvme/host/nvme.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index f3ab17778349..86f152e777bc 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -497,7 +497,6 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 void nvme_uninit_ctrl(struct nvme_ctrl *ctrl);
 void nvme_start_ctrl(struct nvme_ctrl *ctrl);
 void nvme_stop_ctrl(struct nvme_ctrl *ctrl);
-void nvme_put_ctrl(struct nvme_ctrl *ctrl);
 int nvme_init_identify(struct nvme_ctrl *ctrl);
 
 void nvme_remove_namespaces(struct nvme_ctrl *ctrl);
-- 
2.26.2

