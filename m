Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0FA2FE25F
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 07:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbhAUGNB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Jan 2021 01:13:01 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34022 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbhAUGMS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jan 2021 01:12:18 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L64inx056830;
        Thu, 21 Jan 2021 06:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=uidPYjAeACZRyzOOxUNENCvPuBjyBSqI1aLHV8h8sqU=;
 b=TVWUrVKbDXEQPLf+DyFxNeV/kp1YOCXpYKvavrdkfcerZGuwUa62s28tbclXtuCvITxO
 bO8LqApuj7tkW6KpNFIr42sKHZowrjY5AD9puYJ9hC4RZGSFug7hfXhshj2cTvJgRzax
 wKdc/7d6fWjeuDQUPsrJJF/fc9w6LJeT+7Rg2moq3tEPaXbSV7UzSNC++l5x+YypBIKu
 FuVcgkpneRHbEenype6ell5wJ+ZX8yEQ7WrIEcb2ooZDheKp9ijuc6QmprejRd977fFd
 Q6iGjH3aeocrtNLbqVPdS9r5ef2z7o2I84nvFMBAE8NqsFKhem7Sen1d+cnMgzM4jb3b DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 3668qmwqgw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 06:10:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L65i1K007615;
        Thu, 21 Jan 2021 06:10:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3668recuvq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 06:10:33 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10L6ANx5018550;
        Thu, 21 Jan 2021 06:10:26 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 20 Jan 2021 22:10:22 -0800
Date:   Thu, 21 Jan 2021 09:09:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] ALSA: oxfw: fix info leak in hwdep_read()
Message-ID: <YAkassrrWUtsW6aZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If "count" is too large and "oxfw->dev_lock_changed" is false then this
will copy beyond the end of the struct to user space.

Fixes: 8985f4ac1c42 ("ALSA: oxfw: Add hwdep interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/firewire/oxfw/oxfw-hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index 9e1b3e151bad..ca5477eeb663 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -35,12 +35,12 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
+	count = min_t(long, count, sizeof(event.lock_status));
 	if (oxfw->dev_lock_changed) {
 		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
 		event.lock_status.status = (oxfw->dev_lock_count > 0);
 		oxfw->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
 	}
 
 	spin_unlock_irq(&oxfw->lock);
-- 
2.29.2

