Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702733025FD
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 Jan 2021 15:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbhAYOA7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 09:00:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36122 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729199AbhAYOAB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 09:00:01 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBATaP041976;
        Mon, 25 Jan 2021 11:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=IHBhLaGj6UWDWi1eekSLz6D/GroKcem/weopQXWweGo=;
 b=oS+SniZqR7QRSMGKFC6PQzV8iiRzxvSdqMNtjDbNZsA3fOKIwWnfFzvGVm/CNuufivwe
 lZ3GJUKz6sp0R+zjHOaKuP+DlzONBomiSRF7kvAsmiVUvvPFBECqarX5YgJ8blCtSzPF
 Lp/xPURH9TeQfGGT+G9SR4aVyeFzkblxX3U63+jO2n2qz9vDMSiztCSeoUBRy/d76ck/
 pR9G79WUp1ke9N737RuDuUAFEOwWDsN0wpMLGJFwyQxfGPjf4M5mfAk51L8duJsjqgPn
 HNgvHO4+byRngwT9yYrl0VdyFSX4fSDThv2NMJw5yw4XwphpUTn5wu/2EYt/eLg9eJOE WA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 368brkcrkd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 11:13:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBAxdC007182;
        Mon, 25 Jan 2021 11:13:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 368wckeewf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 11:13:53 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10PBDpKI025099;
        Mon, 25 Jan 2021 11:13:51 GMT
Received: from mwanda (/10.175.173.24)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 03:13:51 -0800
Date:   Mon, 25 Jan 2021 14:13:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Clemens Ladisch <clemens@ladisch.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: fireface: remove unnecessary condition in
 hwdep_read()
Message-ID: <YA6n6I8EcNAO5ZFs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122071354.GI20820@kadam>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250065
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "count" is not clamped when "ff->dev_lock_changed"
and it leads to an information leak.  Fortunately, that's not actually
possible and the condition can be deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: just delet the condition

 sound/firewire/fireface/ff-hwdep.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index 4b2e0dff5ddb..ea64a2a41eea 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
-	if (ff->dev_lock_changed) {
-		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
-		event.lock_status.status = (ff->dev_lock_count > 0);
-		ff->dev_lock_changed = false;
+	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
+	event.lock_status.status = (ff->dev_lock_count > 0);
+	ff->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
-	}
+	count = min_t(long, count, sizeof(event.lock_status));
 
 	spin_unlock_irq(&ff->lock);
 
-- 
2.29.2

