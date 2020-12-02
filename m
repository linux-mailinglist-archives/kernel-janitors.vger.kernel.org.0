Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C2C2CB560
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 07:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgLBGym (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 01:54:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48370 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbgLBGyl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 01:54:41 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26n49R185241;
        Wed, 2 Dec 2020 06:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=G0iLksHq8EygB3d265wGoCGJ5n184uc0UnsxKVGhK5I=;
 b=bvnw/u/9wO1KTb1lsPBVGKBYMhP481pAGnyB/VK/tQ68+Tbkco2MOKjJF6psHU3UAk15
 868LBKa86/JG9IxNFQnom7GFpgq9Aj2DmB6EqsuX3oPJxaCcM1wEYqz0zLoDUn/bdP1Y
 nhSZnnVidQ2wDiLMH+JzHYQLq51DWYTEogwc5qPcogtml15iRBPvFK56dNgcBQg01bcU
 duozuTyXo5ltfHC0F5O08CBARS/IMUxOqmdiT8BMJ4hxXpK2HwedvYEHwzOv2QSX4zWW
 DKmrumUx5gOim+fogDiyV6opnRvBq9mjG914K5OMAIZc4rgLRtbIzeS1+EMT51Th8Egt 6A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 353egkpg18-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 06:52:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26oK42061949;
        Wed, 2 Dec 2020 06:52:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 3540atpndd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 06:52:04 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B26psUD021371;
        Wed, 2 Dec 2020 06:51:54 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Dec 2020 22:51:54 -0800
Date:   Wed, 2 Dec 2020 09:51:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-ID: <X8c5gjZO7YN/CFsq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020040
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "decimator" variable is in the 0-7 range and it's unsigned so there
is no need to check for negative values.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/lpass-va-macro.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 3e6bbef26dcb..91e6890d6efc 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -844,17 +844,10 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
 
 	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
 			 VA_MACRO_DEC_MAX) {
-		if (decimator >= 0) {
-			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
-				    VA_MACRO_TX_PATH_OFFSET * decimator;
-			snd_soc_component_update_bits(component, tx_fs_reg,
-						0x0F, tx_fs_rate);
-		} else {
-			dev_err(va_dev,
-				"%s: ERROR: Invalid decimator: %d\n",
-				__func__, decimator);
-			return -EINVAL;
-		}
+		tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
+			    VA_MACRO_TX_PATH_OFFSET * decimator;
+		snd_soc_component_update_bits(component, tx_fs_reg, 0x0F,
+					      tx_fs_rate);
 	}
 	return 0;
 }
-- 
2.29.2

