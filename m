Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216AC2859DE
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Oct 2020 09:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgJGHud (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Oct 2020 03:50:33 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:41422 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgJGHud (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Oct 2020 03:50:33 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0977fRC4146957;
        Wed, 7 Oct 2020 07:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=MbRybRL0oWTHVg9Db3cMI50wwADgdU7JagKyjCXDqzk=;
 b=g+0Lp6CqvRV0gm/bLgb+Tq/2MurahMyOrfMDTtIjiKP/8UhcZYHn1wfCJxaIMTzW5G7q
 ha4QxkfhlbO0jdqykryHaB5tQzJOPRcmk/MAsn8yMDmaWYQ/qJY9TcVXPi8zMD/k4ccY
 hnz0KfLle2LO25ocVZ4c/ZeNFq+gDHulV7gCPPsfzETGfR8VJC0rkhnh+0/od4cRy7wQ
 3jCLmuLaCR9glmX5Zm22JzxSBq/dlnsueB/2FbGHLugHUTztR5xeWB8JCCmVig0eBotS
 FW7Y0i+LRxh4LonMLvwgAXib7BHGTLJywTTw0l0SyE0WqQ4nqzZEf/RWnY0YJpHR7opB iA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 33xetb0bk4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 07 Oct 2020 07:49:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0977epMj130306;
        Wed, 7 Oct 2020 07:49:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 3410jy9vyv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Oct 2020 07:49:40 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0977nZjq019420;
        Wed, 7 Oct 2020 07:49:38 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 07 Oct 2020 00:49:35 -0700
Date:   Wed, 7 Oct 2020 10:49:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-ID: <20201007074928.GA2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9766 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9766 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070050
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "count" variable needs to be capped on every path so that we don't
copy too much information to the user.

Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/firewire/bebob/bebob_hwdep.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index 45b740f44c45..c362eb38ab90 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -36,12 +36,11 @@ hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
+	count = min_t(long, count, sizeof(event.lock_status));
 	if (bebob->dev_lock_changed) {
 		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
 		event.lock_status.status = (bebob->dev_lock_count > 0);
 		bebob->dev_lock_changed = false;
-
-		count = min_t(long, count, sizeof(event.lock_status));
 	}
 
 	spin_unlock_irq(&bebob->lock);
-- 
2.28.0

