Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D362B18DB
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Nov 2020 11:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgKMKPs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Nov 2020 05:15:48 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41546 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKMKPr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Nov 2020 05:15:47 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAA4c8020423;
        Fri, 13 Nov 2020 10:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=O9lMpZFP41yaCeA000myOwBOAFcWscTOgS6iGKjFjOQ=;
 b=kpYgf3v/rE9/nCUwL+CTjfB7S/jZjoXFKlZ4trv9cFvdmzvnW4NI3xc4vWurmmceTEs3
 Es0oKmKapouWCYMwgvKgI/MxwAQOv3GfPVBbfyQ+T6zU5Sp8FaCr+1ezSztjfmFH1K3e
 o8WE7rP9uew9xRwWWZPLsQXlTGd8dTXY2+potFPKct0oqih1Ohs01i2H1m0RBG+xx7oM
 2fVFuVxmPLVM7mfrp5+iOH8uS2DEILpTsLgw5VBpF+YuiBcfJBoJ/9o2QAD5D+6+g0NA
 k6scAPwI5+wlRs+G5hD+zzUlfKKDGhMzgiJ5kyRXyrE9FGoe3rpmtvpSUCOtHaBRvWRi Tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 34nh3ba1b0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Nov 2020 10:14:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAAIcH179222;
        Fri, 13 Nov 2020 10:12:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 34rtktbrgr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Nov 2020 10:12:56 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ADACmdE011460;
        Fri, 13 Nov 2020 10:12:51 GMT
Received: from mwanda (/10.175.206.108)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 13 Nov 2020 02:12:47 -0800
Date:   Fri, 13 Nov 2020 13:12:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: firewire: Clean up a locking issue in
 copy_resp_to_buf()
Message-ID: <20201113101241.GB168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130061
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The spin_lock/unlock_irq() functions cannot be nested.  The problem is
that presumably we would want the IRQs to be re-enabled on the second
call the spin_unlock_irq() but instead it will be enabled at the first
call so IRQs will be enabled earlier than expected.

In this situation the copy_resp_to_buf() function is only called from
one function and it is called with IRQs disabled.  We can just use
the regular spin_lock/unlock() functions.

Fixes: 555e8a8f7f14 ("ALSA: fireworks: Add command/response functionality into hwdep interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
index 0f533f5bd960..9f8c53b39f95 100644
--- a/sound/firewire/fireworks/fireworks_transaction.c
+++ b/sound/firewire/fireworks/fireworks_transaction.c
@@ -123,7 +123,7 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
 	t = (struct snd_efw_transaction *)data;
 	length = min_t(size_t, be32_to_cpu(t->length) * sizeof(u32), length);
 
-	spin_lock_irq(&efw->lock);
+	spin_lock(&efw->lock);
 
 	if (efw->push_ptr < efw->pull_ptr)
 		capacity = (unsigned int)(efw->pull_ptr - efw->push_ptr);
@@ -190,7 +190,7 @@ handle_resp_for_user(struct fw_card *card, int generation, int source,
 
 	copy_resp_to_buf(efw, data, length, rcode);
 end:
-	spin_unlock_irq(&instances_lock);
+	spin_unlock(&instances_lock);
 }
 
 static void
-- 
2.28.0

