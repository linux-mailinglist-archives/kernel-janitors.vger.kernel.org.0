Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6055526FFD4
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Sep 2020 16:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgIRO3N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Sep 2020 10:29:13 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43142 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgIRO3M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Sep 2020 10:29:12 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08IEOSew007518;
        Fri, 18 Sep 2020 14:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=fEb5Kid1irTc2joYqo9a5JVHMXpytQUPvcPKE8t/MnM=;
 b=BNqw4zwMMFB1PQEzEAd74kBVu5u8Gym56egxxU7I4b23a4PoLcRmfJRafvy8z9u//Ag1
 qEBxIR68AB9ZZUp7l/y7bST1qGVO2B/P0shpwLtAxZDuSrTzMG0AU3cn5OCv+yywb9JY
 ++mYvI1k6hedsJ0gkis9aUa1QulNROkoYfazPDQihoP8VoEd4l7Dm2G61+uKbn4qQwps
 gnUtzjSwrU3iWqxFe8FK3r6dNQ/QQB1p3NbH4tp86+16O9XuDzvxsrHfMXIXvAcdkHqK
 J0DLoCcUH/l2uTrYqZ43mdQOZZ1KvRToIAtv7PjUyHXY+mZEFxLNLmD80RU5n0/ksiAh Gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 33j91e15fv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Sep 2020 14:28:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08IEQ8Rr165202;
        Fri, 18 Sep 2020 14:28:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33khppskbh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Sep 2020 14:28:18 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08IESB6w029128;
        Fri, 18 Sep 2020 14:28:11 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Sep 2020 14:28:02 +0000
Date:   Fri, 18 Sep 2020 17:27:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corey Minyard <minyard@acm.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Xianting Tian <tian.xianting@h3c.com>,
        openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ipmi: msghandler: Fix a signedness bug
Message-ID: <20200918142756.GB909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180117
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The type for the completion codes should be unsigned char instead of
char.  If it is declared as a normal char then the conditions in
__get_device_id() are impossible because the IPMI_DEVICE_IN_FW_UPDATE_ERR
error codes are higher than 127.

    drivers/char/ipmi/ipmi_msghandler.c:2449 __get_device_id()
    warn: impossible condition '(bmc->cc == 209) => ((-128)-127 == 209)'

Fixes: f8910ffa81b0 ("ipmi:msghandler: retry to get device id on an error")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 2 +-
 drivers/char/ipmi/ipmi_si_intf.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 555c3b1e4926..8774a3b8ff95 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -319,7 +319,7 @@ struct bmc_device {
 	int                    dyn_guid_set;
 	struct kref	       usecount;
 	struct work_struct     remove_work;
-	char		       cc; /* completion code */
+	unsigned char	       cc; /* completion code */
 };
 #define to_bmc_device(x) container_of((x), struct bmc_device, pdev.dev)
 
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 164f85007080..0b3dbc7e39fd 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -1344,7 +1344,7 @@ static int try_get_dev_id(struct smi_info *smi_info)
 			resp + 2, resp_len - 2, &smi_info->device_id);
 	if (rv) {
 		/* record completion code */
-		char cc = *(resp + 2);
+		unsigned char cc = *(resp + 2);
 
 		if ((cc == IPMI_DEVICE_IN_FW_UPDATE_ERR
 		    || cc == IPMI_DEVICE_IN_INIT_ERR
-- 
2.28.0

