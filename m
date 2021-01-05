Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848072EABC1
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Jan 2021 14:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbhAENUr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 Jan 2021 08:20:47 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46314 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbhAENUq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Jan 2021 08:20:46 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105DFwrg187489;
        Tue, 5 Jan 2021 13:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=VaQQH4yQYOVXFT1zmyl9uIWZ8nz/GQH8XQPhbggN880=;
 b=ObIGHWtSVE0fCop0Cm/mRSdSMZ7qNgCKrEIuE94uaKp1FWMdModqH87mdytnLv+iBGlr
 DI5vpbSbOoPxLPmI+s8USM1nHCjFRuPkOlUyUejt/QavuSt//yZSwCZxpE09w+UyaSLM
 y7USldwm0rI3oGYQN3YQ0yXjMNsiTher5Y/Jd7wvw5QdxJjIDBeWgUxcX2DUbsZNNsLw
 K75Ss+FZoBEYFC8edcqFQw9HcMMmgq4Zg0w9rophYwlFvhUJ+baOV255cJ+pyjXWNcQe
 bh2vmQ+bXSphvgVaBrsNWjEVm2vq7xZcsIOk3bvDvZPwA03XDU5CFARjr+FCA2bxNlx5 vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 35tgskrpyr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 05 Jan 2021 13:19:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105DGWXP039521;
        Tue, 5 Jan 2021 13:19:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 35v4rbcdew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Jan 2021 13:19:46 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105DJeLr009133;
        Tue, 5 Jan 2021 13:19:40 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 Jan 2021 05:19:39 -0800
Date:   Tue, 5 Jan 2021 16:19:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        Amarjargal Gundjalam <amarjargal16@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] staging: vchiq: delete obselete comment
Message-ID: <X/RnUjY3XkZohk7w@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050083
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This comment describes a security problem which was fixed in commit
1c954540c0eb ("staging: vchiq: avoid mixing kernel and user pointers").
The bug is fixed now so the FIXME can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f500a7043805..54770a9b4735 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -999,13 +999,6 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		userdata = &waiter->bulk_waiter;
 	}
 
-	/*
-	 * FIXME address space mismatch:
-	 * args->data may be interpreted as a kernel pointer
-	 * in create_pagelist() called from vchiq_bulk_transfer(),
-	 * accessing kernel data instead of user space, based on the
-	 * address.
-	 */
 	status = vchiq_bulk_transfer(args->handle, NULL, args->data, args->size,
 				     userdata, args->mode, dir);
 
-- 
2.29.2

