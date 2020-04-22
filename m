Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161931B3B24
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Apr 2020 11:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgDVJYI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Apr 2020 05:24:08 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57502 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgDVJYI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Apr 2020 05:24:08 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03M9Ik2c021841;
        Wed, 22 Apr 2020 09:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=dLtRYqGNB9RgcVygXcN07syddWJjMdr6zGGihKEe1WI=;
 b=N3cNlE7+XLHuBDccnIykeUBb9a1b3piPoiPenD+ZiTIHUEhFqv0MpNIj6G53+Rv57v0f
 rXhL2WUzqYrR3yBlPMVSxc1sb2IK8/bYbuO1ne7oJ6sydbsV7F2G+IpR57xpqFmmoCy8
 f09onpXJwQ/HpycvXqhJFVYcLFAo2Zclhik+aecXNdPktpdSfIT0cMyt/NMbIAA/H9eb
 27oQBTga9rxZ4WaAwAQc6ZWCf2yLSbuVssCNJa+Zf16fIb8hQ8ibc+QPLIFrrEtOvClF
 RFtEf/XMS/qQmBjV9ISzBUxac34M2Itzxiw4eBSCQvd5ZHL76jgdThZHOVElEhWEh9cA HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 30fsgm1nvc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Apr 2020 09:23:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03M9ILxw119121;
        Wed, 22 Apr 2020 09:23:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 30gb1j46hd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Apr 2020 09:23:14 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03M9N1Yp005013;
        Wed, 22 Apr 2020 09:23:06 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 Apr 2020 02:23:01 -0700
Date:   Wed, 22 Apr 2020 12:22:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix a limit check in
 proc_dump_substream_formats()
Message-ID: <20200422092255.GB195357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004220075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004220075
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This should be ARRAY_SIZE() instead of sizeof().  The sizeof() limit is
too high so it doesn't work.

Fixes: 093b8494f299 ("ALSA: usb-audio: Print more information in stream proc files")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index 5a36e192ebb0..889c550c9f29 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -140,7 +140,7 @@ static void proc_dump_substream_formats(struct snd_usb_substream *subs, struct s
 
 			snd_iprintf(buffer, "    Channel map:");
 			for (c = 0; c < map->channels; c++) {
-				if (map->map[c] >= sizeof(channel_labels) ||
+				if (map->map[c] >= ARRAY_SIZE(channel_labels) ||
 				    !channel_labels[map->map[c]])
 					snd_iprintf(buffer, " --");
 				else
-- 
2.26.1

