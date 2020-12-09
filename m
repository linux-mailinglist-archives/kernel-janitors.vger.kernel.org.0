Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69CD2D3BC0
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Dec 2020 07:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgLIG6N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Dec 2020 01:58:13 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:53382 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgLIG6N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Dec 2020 01:58:13 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96tRj6084325;
        Wed, 9 Dec 2020 06:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=npaGBODiUebhrnP5uVe/n/+Gmor/ZdeOhj8yDGqH2iQ=;
 b=zWY0nC5F+6wqHT6KOF/AX6qzs4ESHQp9NGUK9p61usz0Vu036cJ9TMfhAB2/SahN3Q4l
 +aiqCsRnTTknZi+S5R0w8vYskshuFR3rXJBOpquNIUT3GEySwZTfiI8RjPuDrwDty1p7
 IMKTJp9VxOis8wBYU94yygX7NrgWozn59yPmX7oBkfG5dz5yWZuhJPudvclS41T91xhb
 zGEJlDpH9bqpgfeCbI8T6JC7SUj1xuxAQAKPeoz+iTxxfzHCtQcji+mwH0H5h7Bx0ts4
 8a62fbxIWXoZlt7ugr+JA9MyBRHAQXlM92zUKCZJ1UxTeEqAFkgCR1knLvjsoBZEYfst yA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 357yqbxn52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 06:56:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96oaDZ138696;
        Wed, 9 Dec 2020 06:54:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 358m3ytq82-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 06:54:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B96sKIj003448;
        Wed, 9 Dec 2020 06:54:20 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 22:54:19 -0800
Date:   Wed, 9 Dec 2020 09:54:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Luo Meng <luomeng12@huawei.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        James Schulman <james.schulman@cirrus.com>,
        Adam Brickman <Adam.Brickman@cirrus.com>,
        Vlad Karpovich <Vlad.Karpovich@cirrus.com>,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in
 wm_adsp_create_control()
Message-ID: <X9B0keV/02wrx9Xs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090047
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error handling frees "ctl" but it's still on the "dsp->ctl_list"
list so that could result in a use after free.  Remove it from the list
before returning.

Fixes: 2323736dca72 ("ASoC: wm_adsp: Add basic support for rev 1 firmware file format")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/wm_adsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index e61d00486c65..dec8716aa8ef 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1519,7 +1519,7 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 	ctl_work = kzalloc(sizeof(*ctl_work), GFP_KERNEL);
 	if (!ctl_work) {
 		ret = -ENOMEM;
-		goto err_ctl_cache;
+		goto err_list_del;
 	}
 
 	ctl_work->dsp = dsp;
@@ -1529,7 +1529,8 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 
 	return 0;
 
-err_ctl_cache:
+err_list_del:
+	list_del(&ctl->list);
 	kfree(ctl->cache);
 err_ctl_subname:
 	kfree(ctl->subname);
-- 
2.29.2

