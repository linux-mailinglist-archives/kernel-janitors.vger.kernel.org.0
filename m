Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62712CD18D
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Dec 2020 09:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgLCInL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Dec 2020 03:43:11 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56840 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729960AbgLCInI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Dec 2020 03:43:08 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38Z2Vg104308;
        Thu, 3 Dec 2020 08:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zJcrQdKGeXSGDinnwfXZFzwW0YR5wODCt/2ON3lTHSo=;
 b=WuS24ufAwiHrCut+Kn8buwOcA/9DBBvZeBaUG3W8ohAYadWqU6gMP/wDP5rdzcORZI6N
 VlJ+KSc5hQxKU5GJIyMRrGSBs4dcByltWTJLF0MEiGF1cZuhxlu+wIHjmHoXnyDJbuCL
 kM1/h4GrMjgMvcmd4XhSThTJykoJ++7x0pkdfPbUgl6womJsGcqy87elpowlOjWF+xCx
 Cbi9HEqWaIELSf2nrmPsDky9Fc3iILrJXlX41T+fuyx5eA6X7EjBNgID111pIlz012s/
 YmoQ+DKQyuz1XXqECp87+Wfwm8pmGUye2mdz8K+BvX8sG4nxyX5hsyV1+aiLfBXyxk/g uw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 353c2b4npx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Dec 2020 08:42:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38YTY3122579;
        Thu, 3 Dec 2020 08:40:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 35404qg08k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Dec 2020 08:40:04 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B38dvmC029951;
        Thu, 3 Dec 2020 08:39:59 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Dec 2020 00:39:57 -0800
Date:   Thu, 3 Dec 2020 11:39:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liang Yang <liang.yang@amlogic.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Yixun Lan <yixun.lan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: rawnand: meson: Fix a resource leak in init
Message-ID: <X8ikVCnUsfTpffFB@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030052
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Call clk_disable_unprepare(nfc->phase_rx) if the clk_set_rate() function
fails to avoid a resource leak.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index a76afea6ea77..817bddccb775 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1044,9 +1044,12 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 
 	ret = clk_set_rate(nfc->device_clk, 24000000);
 	if (ret)
-		goto err_phase_rx;
+		goto err_disable_rx;
 
 	return 0;
+
+err_disable_rx:
+	clk_disable_unprepare(nfc->phase_rx);
 err_phase_rx:
 	clk_disable_unprepare(nfc->phase_tx);
 err_phase_tx:
-- 
2.29.2

