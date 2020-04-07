Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2271A0A11
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 11:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgDGJ2S (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 05:28:18 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:48824 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgDGJ2S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 05:28:18 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379Rqnr037094;
        Tue, 7 Apr 2020 09:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=dRQy+OdGx7nKKkc6yusn2BSd2EMXtJbhYxjtPjQfAEE=;
 b=giUkjfNvRCeBPt5O7emcsu+8JgcNJEjYBV8WaFEFezmymB9kHN25X5mp8FUVPN6cH/dW
 WCfX5xNZeafVw8Z/tEWu6/PXRzXMzV6MGCL/8C/mY8u04jX/gP0Om/NUJE+mNIsoRvcC
 fh0fTirRrwMs3ADrKzCLqmpcpl8rGAObm4JZm7zWzpgBYS8+5BKiz7jGbOwN04K8cKy/
 l/beGDNbLjaUHPeXl31xxdbx9tDyoN1F//kBu1iUbqpIcUK6FxXTTMPj8a6wXoDhYF1D
 CZPHxVSuFRiiOWqBxZ9emzzxqToeAqIyptTCnoG4Ite7C/UgdzOMhG3JlEwVaf6gk+eU WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 306j6mbqrk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:28:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RThg103029;
        Tue, 7 Apr 2020 09:28:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 30741dmdcn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:28:04 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0379S1QU030940;
        Tue, 7 Apr 2020 09:28:02 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 02:28:01 -0700
Date:   Tue, 7 Apr 2020 12:27:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: imx: Fix return in imx_mu_scu_xlate()
Message-ID: <20200407092753.GH68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=926
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=982 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This called from mbox_request_channel().  The caller is  expecting error
pointers and not NULL so this "return NULL;" will lead to an Oops.

Fixes: 0a67003b1985 ("mailbox: imx: add SCU MU support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 7906624a731c..9d6f0217077b 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -374,7 +374,7 @@ static struct mbox_chan *imx_mu_scu_xlate(struct mbox_controller *mbox,
 		break;
 	default:
 		dev_err(mbox->dev, "Invalid chan type: %d\n", type);
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (chan >= mbox->num_chans) {
-- 
2.25.1

