Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956052B4438
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Nov 2020 14:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgKPNAd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Nov 2020 08:00:33 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:34822 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgKPNAa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Nov 2020 08:00:30 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGD00AJ053317;
        Mon, 16 Nov 2020 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=bN1JOGDwmqyy+KHv+zxQrD8gAc0Gh6sp/wEQJplAPXk=;
 b=mlmTDdRkhp6zpryf6Vn+fxTa8g+SyUvRmgRVjYsY5bsdV7iICZbM5fk3BaOzTsEdH1jj
 bCXH4aaU1jWBd2jCdWjGEH0y+YgV65copq2+OvdvGhfmn4fJEz66431yOPIdHX+e1cf0
 SAOMDN+6md409CPXsAcYkbeayDEMY6BOGV8lviDLcjDGyFi3uKsJ7vgOMlmisXZRx/eg
 LEujLp3OGsaLi43tiM3Y/04u6GjOZ7IbepgQxlYFfbLADxNwKPy+Ndg+J4a1TzyS5nyb
 Sn6nqqiVOw/fVtArJ1cmNkIVtVbwD3o/4o8rWRZ7e2QnPz4qYGZtd9nRapIpMFzHVaNV 0w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 34t7vmvu1x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Nov 2020 13:00:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGCoiFl079689;
        Mon, 16 Nov 2020 13:00:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 34ts5unfdb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Nov 2020 13:00:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AGCxvQH023727;
        Mon, 16 Nov 2020 12:59:57 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 04:59:57 -0800
Date:   Mon, 16 Nov 2020 15:59:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Patrick Lai <plai@codeaurora.org>,
        xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sc7180: initialize the "no_headphone" variable
Message-ID: <20201116125950.GA44063@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160077
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "no_headphone" variable is never set to "false" so it could be
uninitialized.

Fixes: e936619b7ce7 ("ASoC: qcom: sc7180: Modify machine driver for sound card")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Apparently we recently turned off uninitialized variable warnings by
default in commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized")

 sound/soc/qcom/sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index e2e6567566af..de70fa792aea 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -316,7 +316,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *link;
 	int ret;
 	int i;
-	bool no_headphone;
+	bool no_headphone = false;
 
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-- 
2.29.2

