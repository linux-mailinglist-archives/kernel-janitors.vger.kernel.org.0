Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEA1304816
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jan 2021 20:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388869AbhAZFxZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Jan 2021 00:53:25 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:51912 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729678AbhAYQC0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 11:02:26 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBAUjk042006;
        Mon, 25 Jan 2021 11:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=wPullc5Bu3+R1BBsmC867SgbXXzzTXKO3sGsYZn2Yts=;
 b=BRt1bG4eRUGTS+bs/+Vg8hfKBQwmlHFBLSVLRVkj8qVNSqELhqZkcNqONF6Se3hvO33z
 nEfou9S+th39T9vqO3qIhjxwi1c48hePsnhs6TRuY9OshxktmHwnGUVqI6clZyQ7KdWz
 vmiWq90IXMd3PY0Y64oTQfsbYZ9DV1mt4g1ZveWLH3nuaVPEvp4UFT8s5PZPikpmFmj+
 OstuCCRMLrYE9iwgktsJmRkqj3p8smNC26dkl/y1CqQ/QmVO3HcKqzrHqPWD75cYrBM0
 CimMXcH16FE01bzffSOpiEs8Fxr1jqUehcJYRRG/EXSd+TER9359Jy1ni53yq0/iDKMQ /A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 368brkcrgs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 11:13:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBBTTh055713;
        Mon, 25 Jan 2021 11:13:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 368wjpjsc9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 11:13:07 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10PBD1WH001794;
        Mon, 25 Jan 2021 11:13:03 GMT
Received: from mwanda (/10.175.173.24)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 03:13:00 -0800
Date:   Mon, 25 Jan 2021 14:12:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Clemens Ladisch <clemens@ladisch.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/2] ALSA: oxfw: remove an unnecessary condition in
 hwdep_read()
Message-ID: <YA6ntkBxT/4DJ4YK@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122071354.GI20820@kadam>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250065
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "count" isn't clamped properly and
"oxfw->dev_lock_changed" is false then it leads to an information
leak.  But it turns out that "oxfw->dev_lock_changed" is always
set and the condition can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: this version just removes the condition

 sound/firewire/oxfw/oxfw-hwdep.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index 9e1b3e151bad..a0fe99618554 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
-	if (oxfw->dev_lock_changed) {
-		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
-		event.lock_status.status = (oxfw->dev_lock_count > 0);
-		oxfw->dev_lock_changed = false;
+	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
+	event.lock_status.status = (oxfw->dev_lock_count > 0);
+	oxfw->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
-	}
+	count = min_t(long, count, sizeof(event.lock_status));
 
 	spin_unlock_irq(&oxfw->lock);
 
-- 
2.29.2

