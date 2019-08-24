Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5249BE4D
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Aug 2019 16:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfHXOwZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 24 Aug 2019 10:52:25 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:50598 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfHXOwZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Aug 2019 10:52:25 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7OEn2DL153324;
        Sat, 24 Aug 2019 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=nqFrskOYKqh+upYdC438izxEDmWPqvC8isHQd+5nCFI=;
 b=CuzZeVUG6acjf5PE58kgmrCYrs3opCzmdSnVeYUDULNX+fHEi8CO3p+bKmOndVKRRxiB
 se71B9a2+oTlrzODaY33gCNy9oHzmb57NjiFjMBXY2z/A7jMnZEpdxJpTfa1MDYFBWsj
 /JETkQ74sR/idtmdQ2yAk05bK9sjfwOB9OAyZW521Rm+aCsVhvQ18IASqoL0GnuFlQz6
 bIHn5eXMf4zWSwaJ7DTN2ivz4BO2YsXdXOGiAk4Bhw4yxASh6kTf8cbMHW02aoGB+SmI
 FOP6xkMV17ARNiTismA/HC9j3IcwY2mWX75pXpVk3wjsPdbWAsCkB6n3hxh2se3Ya8cw EA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2ujw6ysarv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Aug 2019 14:51:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7OElss1164640;
        Sat, 24 Aug 2019 14:51:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2ujw7823df-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Aug 2019 14:51:57 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7OEpskQ026708;
        Sat, 24 Aug 2019 14:51:54 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 24 Aug 2019 07:51:53 -0700
Date:   Sat, 24 Aug 2019 17:51:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corey Minyard <minyard@acm.org>,
        Kamlakant Patel <kamlakantp@marvell.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ipmi_ssif: Fix locking on probe error path
Message-ID: <20190824145147.GB5337@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9359 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908240163
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9359 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908240163
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If the allocations failed then we returned with the lock held.  This
patch moves the allocations infront of the locking.

Fixes: 714acbc6cc39 ("ipmi_ssif: avoid registering duplicate ssif interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/char/ipmi/ipmi_ssif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 205726926bd3..9cf2efd33f19 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -1683,7 +1683,6 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	u8		  slave_addr = 0;
 	struct ssif_addr_info *addr_info = NULL;
 
-	mutex_lock(&ssif_infos_mutex);
 	resp = kmalloc(IPMI_MAX_MSG_LENGTH, GFP_KERNEL);
 	if (!resp)
 		return -ENOMEM;
@@ -1694,6 +1693,8 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -ENOMEM;
 	}
 
+	mutex_lock(&ssif_infos_mutex);
+
 	if (!check_acpi(ssif_info, &client->dev)) {
 		addr_info = ssif_info_find(client->addr, client->adapter->name,
 					   true);
-- 
2.20.1

