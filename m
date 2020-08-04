Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF00C23B895
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Aug 2020 12:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgHDKQ1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Aug 2020 06:16:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:46296 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgHDKQV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Aug 2020 06:16:21 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 074ABwQX012801;
        Tue, 4 Aug 2020 10:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=4A9RD7nCDWseickGulZsfwZQlkUSpJu0c0HKLpM7CZ4=;
 b=CDiQhMQrKcxOCf9QLGXLDBeSJkglEU1iUjAEjAn7DS+qmsaNqfMw9G559KnCW0CCzvo+
 tgDDMSdsr6+yC4FEB7NeEfWrRVi74i6NmDuy4qjYtZun89kcKz3UQ9xievJtwhMCGWWI
 sVRq0MKC3nU7BCfGJ0oZAjKpmq4TGALTE0mKZkl1zlusAbBN3LQmKuX8qYoK7JIBueg6
 waf3sXzl5COxrrbjGPGCu7lxo0jq32HQB2UBHtXo3ClkJ2daIYxtKXJLDReZsEoLICp7
 9oPNyKfXjlQuL+Enyn86GQUc9v8cVA+CBKhzvhnAT6vOqBxlj5+4DObBiMvhzq5FkQHr QA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 32nc9yj1ak-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 04 Aug 2020 10:16:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 074ACqZ7089866;
        Tue, 4 Aug 2020 10:16:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 32pdnpte3v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Aug 2020 10:16:12 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 074AG8Ds029725;
        Tue, 4 Aug 2020 10:16:10 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 04 Aug 2020 03:16:07 -0700
Date:   Tue, 4 Aug 2020 13:16:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Johan Hovold <johan@kernel.org>,
        Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc:     Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: greybus: audio: Uninitialized variable in
 gbaudio_remove_controls()
Message-ID: <20200804101601.GA392148@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9702 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9702 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040076
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "err" variable is not meaningful so there is no need to print it.
It's uninitialized on the first iteration through the loop.

Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/greybus/audio_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 8b100a71f02e..237531ba60f3 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -173,8 +173,7 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
 		id.index = control->index;
 		kctl = snd_ctl_find_id(card, &id);
 		if (!kctl) {
-			dev_err(dev, "%d: Failed to find %s\n", err,
-				control->name);
+			dev_err(dev, "Failed to find %s\n", control->name);
 			continue;
 		}
 		err = snd_ctl_remove(card, kctl);
-- 
2.27.0

