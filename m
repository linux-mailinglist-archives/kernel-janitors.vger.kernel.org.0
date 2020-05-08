Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84E91CB241
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 May 2020 16:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgEHOtX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 May 2020 10:49:23 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:48560 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgEHOtW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 May 2020 10:49:22 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048ElnMD175280;
        Fri, 8 May 2020 14:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5H4orkD2izBpWqIS8JRYFxALT5OGEhF4U5DYeNYbJqE=;
 b=SO3A08b4wem/Yc3JPTC3wMm3HnFoPkx7u+gUwDgIdb/fNCBgII2Z9CDjhrtxTbx7WJEq
 P94n0C5RBsV/HIjmQa7nzVpMVo6HF709SrojCtmQSo4ub34id3jLd2X0ie/QZrFkt+jF
 DYYiPfK9lfdrFWaax9gRsL1OY+TRal/SXygAFCzJ95BkMce17s/fUrQjPIliW/XcVNII
 XhPvjOdmJ/v/jPUgV+Gyw6oAhAAX0KHVu7y+CiJ8ydKhLboLA8APYFmBNoD5C46hS72p
 A7A5cu1Jy4/BLbIKaskdkSwMVeOT2DKs7lGzTcOrrwhcDQPj8ZKZWjvfvv3c0xW1Mpa+ iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 30vtewuct1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 May 2020 14:48:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048ElsVV155765;
        Fri, 8 May 2020 14:48:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 30vtecpm3k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 May 2020 14:48:34 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 048EmPl1002703;
        Fri, 8 May 2020 14:48:31 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 08 May 2020 07:48:24 -0700
Date:   Fri, 8 May 2020 17:48:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaya Kumar <jayakumar.alsa@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: cs5535audio: Fix a math error in
 cs5535audio_build_dma_packets()
Message-ID: <20200508144818.GA411239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080132
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We want to allocate enough space for CS5535AUDIO_MAX_DESCRIPTORS + 1
elements and we also want the size to rounded up to PAGE_SIZE.  The
"+ 1" is because we don't use the zeroeth element.

CS5535AUDIO_MAX_DESCRIPTORS is 128.  Each element is 8 bytes.  So it
should be "(128 + 1) * 8 = 1032" but rounded up that becomes 4096.  In
the original code, it did the "+ 1" after rounding up so so it allocated
4097 bytes.  The DMA API will probably round this up to two pages.

Fixes: 9b4ffa48ae85 ("[ALSA] Add support for the CS5535 Audio device")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/cs5535audio/cs5535audio_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 4032b89b1fc1d..f6324636b355f 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -100,7 +100,7 @@ static int snd_cs5535audio_playback_close(struct snd_pcm_substream *substream)
 }
 
 #define CS5535AUDIO_DESC_LIST_SIZE \
-	PAGE_ALIGN(CS5535AUDIO_MAX_DESCRIPTORS * sizeof(struct cs5535audio_dma_desc))
+	PAGE_ALIGN((CS5535AUDIO_MAX_DESCRIPTORS + 1) * sizeof(struct cs5535audio_dma_desc))
 
 static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 					 struct cs5535audio_dma *dma,
@@ -118,7 +118,7 @@ static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 	if (dma->desc_buf.area == NULL) {
 		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
 					&cs5535au->pci->dev,
-					CS5535AUDIO_DESC_LIST_SIZE+1,
+					CS5535AUDIO_DESC_LIST_SIZE,
 					&dma->desc_buf) < 0)
 			return -ENOMEM;
 		dma->period_bytes = dma->periods = 0;
-- 
2.26.2

