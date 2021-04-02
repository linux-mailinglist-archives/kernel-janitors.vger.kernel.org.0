Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A3B352A4F
	for <lists+kernel-janitors@lfdr.de>; Fri,  2 Apr 2021 13:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhDBLn1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 2 Apr 2021 07:43:27 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:52272 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbhDBLnZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Apr 2021 07:43:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132BcX2M073984;
        Fri, 2 Apr 2021 11:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ao9U5dvQsdaWV9YstHzsV5gFgSLEsPBaL2W+rjkc2DE=;
 b=KPbKe9VO7b28z93J8Po73/yN04BzK/e7U82onSYwDo9pJQB5IPuY3B0jCeXfT+FrF7Nl
 HSJCKLJRoFqk7Wn/tPKi3q0sZY3dKCS2Vm77sMMTVxpDo1IQKcjHwZt4BrtzNRBtPgvm
 1tx2Yno5d7puuoLMWM3GIHK/WUOQB0BwSoX78pIsjMVhtiLkYhGkVGxV0gsDhhe9ZuFg
 tsrT+CmvVg6g75dJsoByUdYp55sojbP3X6Nxxd9R0DKbUvWuK4b3mJAMYj5WnsD7xMNL
 7msM8fke+s2LA8nOyCcT9JRwLjTjJh4OLoW6UlwYttXX6tYp/7+cdFzexeaiYOBERQIZ Wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 37n2a04fq6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 02 Apr 2021 11:42:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132BdejO037091;
        Fri, 2 Apr 2021 11:42:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 37n2atyqwd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 02 Apr 2021 11:42:24 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 132BgGWQ000859;
        Fri, 2 Apr 2021 11:42:20 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 02 Apr 2021 04:42:16 -0700
Date:   Fri, 2 Apr 2021 14:42:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] ALSA: control - fix a leak in snd_ctl_led_init()
Message-ID: <YGcDETcdqVUIl1+y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020086
X-Proofpoint-GUID: cs-X96M9uQD64jsfNcc7ZHGwnWV4nsPk
X-Proofpoint-ORIG-GUID: cs-X96M9uQD64jsfNcc7ZHGwnWV4nsPk
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020086
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This unwind loop needs to free snd_ctl_leds[0] as well.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/core/control_led.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index d4fb8b873f34..202b475d0bf3 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -712,7 +712,7 @@ static struct snd_ctl_layer_ops snd_ctl_led_lops = {
 static int __init snd_ctl_led_init(void)
 {
 	struct snd_ctl_led *led;
-	unsigned int group;
+	int group;
 
 	device_initialize(&snd_ctl_led_dev);
 	snd_ctl_led_dev.class = sound_class;
@@ -730,7 +730,7 @@ static int __init snd_ctl_led_init(void)
 		dev_set_name(&led->dev, led->name);
 		if (device_add(&led->dev)) {
 			put_device(&led->dev);
-			for (; group > 0; group--) {
+			for (; group >= 0; group--) {
 				led = &snd_ctl_leds[group];
 				device_del(&led->dev);
 			}
-- 
2.30.2

