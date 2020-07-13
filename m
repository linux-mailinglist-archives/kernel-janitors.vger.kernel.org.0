Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA7321D407
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Jul 2020 12:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgGMKyb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Jul 2020 06:54:31 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41602 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgGMKya (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jul 2020 06:54:30 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06DAqq0G170356;
        Mon, 13 Jul 2020 10:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5p1H8Inq6fO6+rbbZ/c2hQS2caboJT505k68LpcR9fQ=;
 b=lxMgaEUSs+HOtpGnJ/klzw93aoEd/f5QeM85ngkYzw2c+cdYz1LnlDpO5TdR4RI1K0N+
 K8Kk/GSV30eCVnyZcYWn23AWr1RkUQzMAVeUUonrMQ6ltnh6MrQgxmXwtJyDLEh4KHlL
 E766IDCvYbfl9Lb49PkwS++JtTRTwqTvcmluLgkwj9RQtN81sh+1WABlMXO3cY/o2ZHK
 Z0iCN06gPP1PWDer6lvtuouNoewLaYi97L56EluD3HJSoSbD36Dp5nQG2XWocYkxviem
 OEyOJFjmR6LaXqWmKi48gV5V/yg1K9/isgBa+gXaHbmb1QuwypR36W93Gba+HjhGSodg ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 3275ckx9rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 10:53:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06DArULv111093;
        Mon, 13 Jul 2020 10:53:37 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 327qb0anau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jul 2020 10:53:37 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06DArVkA011340;
        Mon, 13 Jul 2020 10:53:33 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jul 2020 03:53:30 -0700
Date:   Mon, 13 Jul 2020 13:53:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>, Mark Hills <mark@xwax.org>
Cc:     Takashi Iwai <tiwai@suse.com>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Chuhong Yuan <hslester96@gmail.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: echoaudio: re-enable IRQs on failure path
Message-ID: <20200713105324.GB251988@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9680 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9680 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007130082
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This should be spin_unlock_irq() instead of spin_lock().

Fixes: 6c3312544873 ("ALSA: echoaudio: Prevent races in calls to set_audio_format()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/echoaudio/echoaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index e81f42811f45..6aeb99aa2414 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -721,7 +721,7 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 	spin_lock_irq(&chip->lock);
 
 	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index))) {
-		spin_unlock(&chip->lock);
+		spin_unlock_irq(&chip->lock);
 		return -EINVAL;
 	}
 
-- 
2.27.0

