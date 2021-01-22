Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FF93006E2
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Jan 2021 16:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbhAVPPB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Jan 2021 10:15:01 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46378 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbhAVPCJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Jan 2021 10:02:09 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MExdJ4158489;
        Fri, 22 Jan 2021 15:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=9cyFxZuLd/5Jx8UWrCwdx5yXVU5tyxIcPIwUK1lmS58=;
 b=WuOJ8V4inpfH0XK+e57zLud4Zxr071VxEImrgdwpWaJBvvlHWCAjVtsyT3zxmKX9Xgky
 /OH8gr/mo0au2E6Q9qDT3fKKT7qXqbnWdI8IF2DQM3DvbMOS2p6pdJSplUwT8URhNwjh
 QWcXJBPpI/YRxhUMJK7JXnojCoHO85o03l2u3AALry+pGaMAcuL8VeT6ju9WkSXTkdXt
 H85x3CMHT9stw8dNGz5qnpqBbYw5dDAlHJddKH1WCFDWqqv4M/Evf1ilcsslbwIGefIf
 O80TOLMsqCxeihSRNlp5NRs6To+ohCc/6e4IdTDoivRS3+CykzB/IotElzTUycav1Z8U dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 3668qamfte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 15:01:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MF0wxm192353;
        Fri, 22 Jan 2021 15:01:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 3668r15jtt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 15:01:15 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10MF1CbP020773;
        Fri, 22 Jan 2021 15:01:13 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 22 Jan 2021 07:01:11 -0800
Date:   Fri, 22 Jan 2021 18:01:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rob Springer <rspringer@google.com>
Cc:     Todd Poynor <toddpoynor@google.com>,
        Ben Chan <benchan@chromium.org>, Richard Yeh <rcy@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Joseph <jnjoseph@google.com>,
        Simon Que <sque@chromium.org>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: gasket: Fix sizeof() in gasket_handle_ioctl()
Message-ID: <YAroue0qiuf35rkS@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220085
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "gasket_dev->num_page_tables" variable is an int but this is copying
sizeof(u64).  On 32 bit systems this would end up disclosing a kernel
pointer to user space, but on 64 bit it copies zeroes from a struct
hole.

Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is an API change.  Please review this carefully!  Another potential
fix would be to make ->num_page_tables a long instead of an int.

 drivers/staging/gasket/gasket_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gasket/gasket_ioctl.c b/drivers/staging/gasket/gasket_ioctl.c
index e3047d36d8db..c4abac35c1ca 100644
--- a/drivers/staging/gasket/gasket_ioctl.c
+++ b/drivers/staging/gasket/gasket_ioctl.c
@@ -318,7 +318,7 @@ long gasket_handle_ioctl(struct file *filp, uint cmd, void __user *argp)
 	case GASKET_IOCTL_NUMBER_PAGE_TABLES:
 		trace_gasket_ioctl_integer_data(gasket_dev->num_page_tables);
 		if (copy_to_user(argp, &gasket_dev->num_page_tables,
-				 sizeof(uint64_t)))
+				 sizeof(gasket_dev->num_page_tables)))
 			retval = -EFAULT;
 		else
 			retval = 0;
-- 
2.29.2

