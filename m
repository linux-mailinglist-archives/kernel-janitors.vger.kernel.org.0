Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 765EB1A0D7D
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 14:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgDGMWr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 08:22:47 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36648 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgDGMWr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 08:22:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037CDwfn015653;
        Tue, 7 Apr 2020 12:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=V7U/UPhdIVNmh0TGVMyOEl9Z22IuQG38qcPPCZe71G0=;
 b=DVk2Gc7awsJ2EpBHjclJ+73v062HkALtVJF48bzDR3AYITsmiI5g6cVg/vE0zF9g4bNe
 FfGwtINJBYsng9bPNbLC6Iibb0aPtB5u9qz5KUsOZ/erxxIe6PCfL4I5h+WheAxbkHB3
 yX/nEaJ4umB6X8yszgnMnp0my+zz3FMfheSZABbuKOVU8Z9xMw+n9MAyUZGTZSu1oZjx
 oxDbQNVCMvhh0x0PcpWARA6M6YWDGzYX4KUeL37d4ypgY+j3OXL+wvU84ju+H6N4566L
 7vo2Q4lALCEA0dwoO6F6InoNlW23a4RqVBVh/VlGN7jK4s6TsMKDwpTMk8PGOjqr1xfz ew== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 308ffdahj2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 12:22:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037CGd6o062588;
        Tue, 7 Apr 2020 12:22:13 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 3073ss0xjx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 12:22:13 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 037CLwwa000652;
        Tue, 7 Apr 2020 12:21:58 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 05:21:57 -0700
Date:   Tue, 7 Apr 2020 15:21:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        openipmi-developer@lists.sourceforge.net,
        linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ipmi: kcs: Fix aspeed_kcs_probe_of_v1()
Message-ID: <20200407122149.GA100026@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070106
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This needs to return the newly allocated struct but instead it returns
zero which leads to an immediate Oops in the caller.

Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 9422d55a0476..a140203c079b 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -271,7 +271,7 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
 	kcs->ioreg = ast_kcs_bmc_ioregs[channel - 1];
 	aspeed_kcs_set_address(kcs, slave);
 
-	return 0;
+	return kcs;
 }
 
 static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
-- 
2.25.1

