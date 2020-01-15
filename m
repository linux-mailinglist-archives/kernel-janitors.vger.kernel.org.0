Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 739E213CB4E
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Jan 2020 18:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAORqs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Jan 2020 12:46:48 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54396 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgAORqs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Jan 2020 12:46:48 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHd2G9084874;
        Wed, 15 Jan 2020 17:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=KRiWwueiP8Z1EkoCa8M+5HzOaiYvTlULg/trtqvMRFc=;
 b=Babr94xZtkhmu2xEO5xpY2bVrGsPMqBnpCrHahMaPsz+knOu1MbtArNJK5uHtkSb6uki
 g9LVpflTONOwD6RnQivGwu6id+rNAszaAW3/VjpEVYA0X/3OT76yXgF9PJvLuYa3u6c9
 r+I52CNN+YXJDLk89ds5km6S0uYrG/OYpyL+Pz9/nXI9zwIsKesrZigWU0Mk6OciTd0y
 xviIRU6r0AHEjoQYTjLX0RO0YeatranQ3AnzOzy1iEag34+GZm8Kxp3QuUS+LwDBXruJ
 Bo3ILtbAp5Qw79dKqHG1T2fTYtDufSSIqWo1yIJfrWBQQcX0KJu8X33S4R5omkX0zsVn 0Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2xf74sdp2h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 17:46:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHd2Ym019547;
        Wed, 15 Jan 2020 17:46:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xhy21t2mu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 17:46:21 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00FHkHb1015851;
        Wed, 15 Jan 2020 17:46:19 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 Jan 2020 09:46:13 -0800
Date:   Wed, 15 Jan 2020 20:46:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>,
        Alexander Tsoy <alexander@tsoy.me>
Cc:     Takashi Iwai <tiwai@suse.de>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shuah Khan <shuah@kernel.org>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: unlock on error in probe
Message-ID: <20200115174604.rhanfgy4j3uc65cx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150135
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We need to unlock before we returning on this error path.

Fixes: 73ac9f5e5b43 ("ALSA: usb-audio: Add boot quirk for MOTU M Series")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 2f582ac7cf78..827fb0bc8b56 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -602,7 +602,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (! chip) {
 		err = snd_usb_apply_boot_quirk_once(dev, intf, quirk, id);
 		if (err < 0)
-			return err;
+			goto __error;
 
 		/* it's a fresh one.
 		 * now look for an empty slot and create a new card instance
-- 
2.11.0

