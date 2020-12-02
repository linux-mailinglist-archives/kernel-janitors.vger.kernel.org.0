Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4EAB2CB534
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 07:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387447AbgLBGpL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 01:45:11 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38142 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgLBGpJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 01:45:09 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26PTEm141766;
        Wed, 2 Dec 2020 06:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Ud5mJWaTikiaizD1PdzSqH7vTBAmR8zuz14js794kn4=;
 b=pybjdSviHikOQx7WrIoHpxOqqiIRL51aZcmKG6EGdYFAopmgAuhcL04X6B6S9s0yOV5G
 85kAFMbq2y2A25wtfHBkmhcl0+x62F16I2rBEAEVPi1AX4aAI6o0adAMvFJlwzpmr0Pt
 6dRyE+wS+ZBAzkXyvbfW49gmJRRnhRTpr+zrOIaNYbZrU3eqjc5stlHBP22CBBH0mrD6
 nkvAFsTUA/cG43fBu6ydeiFzJGwVGGjMKtafmeBuZJ3GL3c9CW47r/gTRQLcVrl2ZJmr
 8thsRhRvQpZZ3LtwYndeCbcfql5sbDZIPlNo7PxDSnPGnO+WoTaCodYhSd/QN0Cl/zz3 eA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 353dyqph5p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 06:44:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26PMBX091369;
        Wed, 2 Dec 2020 06:44:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3540fy52n4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 06:44:05 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B26hwDQ012760;
        Wed, 2 Dec 2020 06:43:58 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Dec 2020 06:43:57 +0000
Date:   Wed, 2 Dec 2020 09:43:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ian Abbott <abbotti@mev.co.uk>, Al Viro <viro@zeniv.linux.org.uk>
Cc:     H Hartley Sweeten <hsweeten@visionengravers.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Xin Tan <tanxin.ctf@gmail.com>,
        Michel Lespinasse <walken@google.com>,
        Xiyu Yang <xiyuyang19@fudan.edu.cn>,
        B K Karthik <bkkarthik@pesu.pes.edu>,
        Divyansh Kamboj <kambojdivyansh2000@gmail.com>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Staging: comedi: Return -EFAULT if copy_to_user() fails
Message-ID: <X8c3pfwFy2jpy4BP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020039
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020039
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return -EFAULT on error instead of the number of bytes remaining to be
copied.

Fixes: bac42fb21259 ("comedi: get rid of compat_alloc_user_space() mess in COMEDI_CMD{,TEST} compat")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hi Al, this goes through your tree.

 drivers/staging/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index d99231c737fb..80d74cce2a01 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -2987,7 +2987,9 @@ static int put_compat_cmd(struct comedi32_cmd_struct __user *cmd32,
 	v32.chanlist_len = cmd->chanlist_len;
 	v32.data = ptr_to_compat(cmd->data);
 	v32.data_len = cmd->data_len;
-	return copy_to_user(cmd32, &v32, sizeof(v32));
+	if (copy_to_user(cmd32, &v32, sizeof(v32)))
+		return -EFAULT;
+	return 0;
 }
 
 /* Handle 32-bit COMEDI_CMD ioctl. */
-- 
2.29.2

