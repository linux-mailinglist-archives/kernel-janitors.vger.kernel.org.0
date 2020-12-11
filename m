Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CDF2D73A0
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 11:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388831AbgLKKMs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 05:12:48 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49520 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394155AbgLKKMI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 05:12:08 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBAAMgZ177659;
        Fri, 11 Dec 2020 10:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=dDjXR4HvUucCFPBwA+1lLICYiGfgeGfP0Xy+rsz4Fqo=;
 b=rBGLmQw/lSQvmISYaDyJ62wCl65bRdQlWfqw1m8LhJj3UWeS3QcHM+W+9FmbpG3k8GDg
 zhEdu2j7T5EFwuIp998/vNamEkp7aXeEK80ZXOZ1OJaxGkM+FUVVSTHtAZEfZU2txoBM
 3MoU6QThADMUJ7EBGzUhe5MGuR3HGTKqBCwVwOboMgSHv8cIefPuCEr53pzGn9jT17c8
 tFD1tt/O3YWvZrI2D/dbhZkw5FYRyYdKcXiiuCTsrbYU4YiR+W7kOK+EQGJTRx1Fe73C
 s5r+I2VIG1tFB58sfl9vS5IwTN/k6IGyCIgixd0TuSERaM3vB3zVfdZBbNn3dzd3CACe lA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 3581mr9vmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 10:10:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA0wpd152494;
        Fri, 11 Dec 2020 10:10:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 358kst39gw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Dec 2020 10:10:21 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBAAKmV025554;
        Fri, 11 Dec 2020 10:10:20 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Dec 2020 02:10:19 -0800
Date:   Fri, 11 Dec 2020 13:10:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Tzung-Bi Shih <tzungbi@google.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8183: delete some unreachable code
Message-ID: <X9NFg3KVm16Gx6Io@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110062
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This has a goto followed by an unreachable return statement.  The goto
is correct because it cleans up so the current runtime behavior is fine.
Let's delete the unreachable return statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 48e81c5d52fc..cc4f8f4d3dab 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -584,7 +584,6 @@ int mt8183_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			__func__, aud_clks[div_clk_id],
 			rate, ret);
 		goto ERR_SET_MCLK_RATE;
-		return ret;
 	}
 
 	return 0;
-- 
2.29.2

