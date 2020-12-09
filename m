Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E8A2D3BBE
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Dec 2020 07:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgLIG5m (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Dec 2020 01:57:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39422 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbgLIG5m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Dec 2020 01:57:42 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96nU2m109622;
        Wed, 9 Dec 2020 06:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zQvQwgEwh6ZSWy3cEv5wNYjxvNMsY8WwOvAKLLggvr0=;
 b=HFBiHGOCwAXv0ssP3vBTzEj8J83wnUDSOSEhfNqeyrvoIlx+qySPIFULpnZCiE/3Ae9t
 M0Jho8ncnv7RFn+EtTz05Vs837526+fBBLDbip0RHtVPepfV9WYNfQYR4KwTQYRCv7hP
 M6vmFTYwDsF8Pdm/8bfQ+fCOHYhc6f1bqCHhmseUhzTBTwdvi+XlGIq5x3NTDEfS4mZr
 IF7xGVojIW5vSZC5b7tKHecKKEZR8jXRWL4JjpuZd1nMMbOZXoKmLLp0EE9LyraG7W/S
 fepnfr7lPDLTJG6MexKsMKP4oQD90EU1UkHnPX5Z1drWPpgblqvyfvWrlQ5G/7mWXmc7 ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 35825m6j7v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 06:55:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96oauo138807;
        Wed, 9 Dec 2020 06:55:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 358m3ytqvt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 06:55:02 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B96t0kF003683;
        Wed, 9 Dec 2020 06:55:01 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 22:55:00 -0800
Date:   Wed, 9 Dec 2020 09:54:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Steve Lee <steves.lee@maximintegrated.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: max98390: Fix error codes in max98390_dsm_init()
Message-ID: <X9B0uz4svyNTqeMb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These error paths return success but they should return -EINVAL.

Fixes: 97ed3e509ee6 ("ASoC: max98390: Fix potential crash during param fw loading")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/max98390.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index ff5cc9bbec29..bb736c44e68a 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -784,6 +784,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
+		ret = -EINVAL;
 		goto err_alloc;
 	}
 	dsm_param = (char *)fw->data;
@@ -794,6 +795,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 		fw->size < param_size + MAX98390_DSM_PAYLOAD_OFFSET) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
+		ret = -EINVAL;
 		goto err_alloc;
 	}
 	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
-- 
2.29.2

