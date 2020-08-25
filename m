Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1F62516D9
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Aug 2020 12:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgHYKra (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Aug 2020 06:47:30 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41586 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgHYKr3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Aug 2020 06:47:29 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PAjD40136601;
        Tue, 25 Aug 2020 10:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=XvFqJGnjaVhEvnjqbb7PvWLcd+LBfxppuO+39ZHs3is=;
 b=eghatQWdA9Fma9m9I0lZH+GKKCrUiRx0N9wgf9XqE9U7BmXK89LZQCZkkrU44HzrxZRr
 hbmyEPC8djWzwNrMjvFSFykz08azhcq3pWe/R3EZf+1Gu8YoHdjpPzkTJTI0y/g7HClB
 T9dHNqMbN/FFseYnkfi0pYo6ND94WKgzXbgfAPAx0Og6Am4eAFcSFpgcsT/SUGxmN1Xt
 trgX0VOF6mjUapyo0X2y8QCjU0oa2M1idx5OWxN5VxQn4EAHkHO3FauGC2JwCwy5uZiS
 gYVeq25xAF97jEPUrBZ9aX9TfmG1fG5peJR6Pu08btRziSEwyZWg8YMLR1cBWbmFDrne 9w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 333w6tr975-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 10:46:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PAilYF036945;
        Tue, 25 Aug 2020 10:46:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 333r9jqurt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 10:46:37 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07PAkWSj013893;
        Tue, 25 Aug 2020 10:46:32 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 Aug 2020 03:46:31 -0700
Date:   Tue, 25 Aug 2020 13:46:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Brent Lu <brent.lu@intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: hdac_hdmi: tidy up a memset()
Message-ID: <20200825104623.GA278587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250081
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ARRAY_SIZE() is the number of the elements but we want to use the
number of bytes.  Fortunately, in this case the value is the same so it
doesn't affect runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/hdac_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 869d1547ae5d..c61cce53f513 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -1474,7 +1474,7 @@ static int hdac_hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	struct hdac_hdmi_port *port;
 	struct hdac_hdmi_eld *eld;
 
-	memset(ucontrol->value.bytes.data, 0, ARRAY_SIZE(ucontrol->value.bytes.data));
+	memset(ucontrol->value.bytes.data, 0, sizeof(ucontrol->value.bytes.data));
 
 	pcm = get_hdmi_pcm_from_id(hdmi, kcontrol->id.device);
 	if (!pcm) {
-- 
2.28.0

