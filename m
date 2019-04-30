Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238BAF447
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Apr 2019 12:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfD3KfX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 Apr 2019 06:35:23 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36228 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfD3KfX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Apr 2019 06:35:23 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UAJO13046074;
        Tue, 30 Apr 2019 10:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=8ctM56McSVOq/R3AJL/IYMJ/+dpslPspDC72SA8b2Q0=;
 b=RvL1/bcqSX4wSWk6CbxCV9LCPwVjcEUgnSRoIyp7NjZm0ak0DUsxK3jV0SAydNrVcVm1
 PrqkYT00Py5VPmkP2gQvcz0uCQSYOvMUelLEgOAKZzITg5Vcck/KjJc9KkZU/tK9GiGq
 Ngt0LTPAuzyaaRk8J3tlJEnnbSGGU9hzfiF2yJGrWhub12z/00gtFlq01Z/F9uS+AKGq
 NXl/rBQjck9gGZCDhCYjigX/HWyojSvP8CeQncctinxHLV4vtHdy7xupR156+IZnEwKh
 EZLI0wWpp332qfYPWQg0+hnBkS9deKpGrvghclivTixRl4RnPeWl0AemG8EHnqvIo5IQ wQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2s5j5u0cd0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Apr 2019 10:35:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UAXcQw102811;
        Tue, 30 Apr 2019 10:35:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2s4yy9fa8e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Apr 2019 10:35:19 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UAZDh5030245;
        Tue, 30 Apr 2019 10:35:13 GMT
Received: from mwanda (/196.97.65.153)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 30 Apr 2019 03:35:12 -0700
Date:   Tue, 30 Apr 2019 13:35:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: kpc2000: Fix a stack information leak in
 kp2000_cdev_ioctl()
Message-ID: <20190430103505.GB7064@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300069
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300069
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The kp2000_regs struct has a 4 byte hole between ->hw_rev and ->ssid so
this could leak stack information to the user.  This patch just memsets
the whole struct to zero.

Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc2000/fileops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/kpc2000/kpc2000/fileops.c b/drivers/staging/kpc2000/kpc2000/fileops.c
index 4bfba59570e6..a6beca8dbac5 100644
--- a/drivers/staging/kpc2000/kpc2000/fileops.c
+++ b/drivers/staging/kpc2000/kpc2000/fileops.c
@@ -91,6 +91,8 @@ long  kp2000_cdev_ioctl(struct file *filp, unsigned int ioctl_num, unsigned long
 	case KP2000_IOCTL_GET_EVERYTHING: {
 		struct kp2000_regs temp;
 		int ret;
+
+		memset(&temp, 0, sizeof(temp));
 		temp.card_id = pcard->card_id;
 		temp.build_version = pcard->build_version;
 		temp.build_datestamp = pcard->build_datestamp;
-- 
2.18.0

