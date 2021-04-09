Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB5A359EE7
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Apr 2021 14:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbhDIMgV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Apr 2021 08:36:21 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47158 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhDIMgU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 08:36:20 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CTwSN062804;
        Fri, 9 Apr 2021 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=N3hnaL+idNyjU9u947ccGos8YKp6lL4SCoXzC4GqEyw=;
 b=oy6wZE97SDJFCyIBKwig2YDmqMHhELq37puHiSgo99xuFWWqJE18MeM7A3Zj8c3rvcKq
 +gmQA0q6JpzSqQ1yclwHla7XjzfRzesh+g9tarzmux+sZUVrvgPmAbGbc7ECPvB0OQNl
 /NlQtNE+52D1sUhEQiuecrB5OLSOddbaotSDfjFjv8J9cW4ybWllxc4XBR/M+WW93j1N
 c3n0u/8AWnp4dYzid4ZCC3xg0mZMrbjAxh2mOzpMvgsP73p8c/T9inAR6e6NkESlD9HD
 scBh4HatCuOoLuL49bHJgL0cd+wi9MqphDAORzTcV7KpnJy+t15HSTbPutiJ2I56ISMA TA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 37rvas98y4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 12:34:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CUEeD185656;
        Fri, 9 Apr 2021 12:34:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 37rvbhjj0f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 12:34:55 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 139CYm3I006653;
        Fri, 9 Apr 2021 12:34:51 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 09 Apr 2021 12:34:48 +0000
Date:   Fri, 9 Apr 2021 15:34:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2 v2] ALSA: control - double free in snd_ctl_led_init()
Message-ID: <YHBJ4frGxErWB182@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7285f6-a257-d7a4-5cae-b36c95ef9efd@perex.cz>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090093
X-Proofpoint-GUID: UCNysrsh9FCldW0ZDyrH-jdjxuxg0A3U
X-Proofpoint-ORIG-GUID: UCNysrsh9FCldW0ZDyrH-jdjxuxg0A3U
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090093
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

"group - 1" was intended here instead of "group".  The current error
handling will double free the first item in the array and leak the last
item.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: The first patch wasn't right.  It fixed the leak but left the double
free.

 sound/core/control_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index d756a52e58db..93b201063c7d 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -734,7 +734,7 @@ static int __init snd_ctl_led_init(void)
 		if (device_add(&led->dev)) {
 			put_device(&led->dev);
 			for (; group > 0; group--) {
-				led = &snd_ctl_leds[group];
+				led = &snd_ctl_leds[group - 1];
 				device_del(&led->dev);
 			}
 			device_del(&snd_ctl_led_dev);
-- 
2.30.2

