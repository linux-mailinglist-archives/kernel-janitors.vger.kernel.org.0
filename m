Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7A09D0F9
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Aug 2019 15:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731993AbfHZNrC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Aug 2019 09:47:02 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47300 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbfHZNrB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Aug 2019 09:47:01 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QDi73o161127;
        Mon, 26 Aug 2019 13:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=crU5vbansQYj72/7izrQoi4P6lT6mqQVmGlGvifPqFo=;
 b=Dx/vG1Dv5vbGboJ4wJWqf3aFdUXGleAT+BJV43pb8Vh6xRL1tFPHwenfxNuJ7DgdjnZX
 mpGTURdrYOg+SgORBnOOHv7Ul4LYtE3wLYoAXPJe34zYM0SvJV+YORuCEQ/H8srgVPnI
 IxnOzeDwQ1ETS+dkc1hCrxRz4wHP8CoEh6FJs5+6m9A281jAi7k3Yf7/WWWNkTWlMajS
 bzTy+NY6PAaoFzm2HQN1rqJI/pZYejox7Qy8XPuBArTcxBf60IHl9uwM9+DiKUl3Sgrp
 ffbyWufpvINGBLDcN7fDnDDSQdCz2B7YHyD5P+I5flUjLEs/XhJbcrpzUEF2QD29Rhdp Pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2ujw7018yc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Aug 2019 13:45:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QDi7wG111548;
        Mon, 26 Aug 2019 13:45:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2ujw79jray-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Aug 2019 13:45:58 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7QDjvqi011325;
        Mon, 26 Aug 2019 13:45:57 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 26 Aug 2019 06:45:56 -0700
Date:   Mon, 26 Aug 2019 16:45:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc:     Hui Peng <benquike@gmail.com>, Wenwen Wang <wang6495@umn.edu>,
        Richard Fontana <rfontana@redhat.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: remove some dead code
Message-ID: <20190826134550.GA8842@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908260150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908260150
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We recently cleaned up the error handling in commit 52c3e317a857 ("ALSA:
usb-audio: Unify the release of usb_mixer_elem_info objects") but
accidentally left this stray return.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/mixer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a0468c4a6326..a607577f0097 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2633,7 +2633,6 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
 		err = -ENOMEM;
 		goto error_name;
-		return -ENOMEM;
 	}
 	kctl->private_value = (unsigned long)namelist;
 	kctl->private_free = usb_mixer_selector_elem_free;
-- 
2.20.1

