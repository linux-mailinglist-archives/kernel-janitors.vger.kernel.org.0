Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319311A0A2A
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 11:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgDGJcl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 05:32:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:56102 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgDGJcl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 05:32:41 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RpuX154402;
        Tue, 7 Apr 2020 09:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ofhnTbmFVZJydO8WmJVJgVAR1Yv/7jKFIzflzSYarR4=;
 b=pyJA1/RWvBHPobpRzEK5I9s5sGcNij/nFRF2cM0mx5XU3Xd3uQ4P29BDCWWzYHzzqEt7
 A1abN9AQurEPtY0t21RQj0a0cL5yY8EI5YDEQteT9zgQxsrmQ2HujIz6Ye3JHvT+TXpF
 3j6h8n2Th1lzuFHRh9v8PBByGAgAIBBCyNe7OK22CkjnANbdR7iosZ/4KNzxSc/3hAK1
 P+uoSfyzIUU2vHqorxwtJLLbx4U+UJzG/XIFtF8SyZ0fLq0nSSl5/vgMMRJWxFYLaC9c
 dNbNn5XcapQEH50wRZ6i1M7ekr+NGJL8PN5Cab4zi2jTdh5+iFXyK7HuALtW0kezhZM/ Ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 308ffd9s9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:32:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RS3A102991;
        Tue, 7 Apr 2020 09:30:37 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 30741dmmss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:30:37 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0379UYRd032022;
        Tue, 7 Apr 2020 09:30:35 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 02:30:33 -0700
Date:   Tue, 7 Apr 2020 12:30:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     tee-dev@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] tee:  remove unnecessary NULL check in tee_shm_alloc()
Message-ID: <20200407093028.GK68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "ctx" isn't checked consistently:

    drivers/tee/tee_shm.c:164 tee_shm_alloc()
    warn: variable dereferenced before check 'ctx' (see line 95)

I audited the callers and "ctx" can't be NULL so the check can be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/tee/tee_shm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index bd679b72bd05..8895cb910166 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -161,8 +161,7 @@ struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 flags)
 		}
 	}
 
-	if (ctx)
-		teedev_ctx_get(ctx);
+	teedev_ctx_get(ctx);
 
 	return shm;
 err_rem:
-- 
2.25.1

