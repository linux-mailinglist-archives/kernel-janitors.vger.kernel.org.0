Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F777EAB3
	for <lists+kernel-janitors@lfdr.de>; Fri,  2 Aug 2019 05:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfHBDcG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Aug 2019 23:32:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3699 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726703AbfHBDcG (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Aug 2019 23:32:06 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6527F679240EDF7CAACF;
        Fri,  2 Aug 2019 11:32:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Fri, 2 Aug 2019 11:31:51 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <socketcan@hartkopp.net>, <davem@davemloft.net>,
        <netdev@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Mao Wenan" <maowenan@huawei.com>
Subject: [PATCH net-next] net: can: Fix compiling warning
Date:   Fri, 2 Aug 2019 11:36:43 +0800
Message-ID: <20190802033643.84243-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are two warings in net/can, fix them by setting bcm_sock_no_ioctlcmd
and raw_sock_no_ioctlcmd as static.

net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?

Fixes: 473d924d7d46 ("can: fix ioctl function removal")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 net/can/bcm.c | 2 +-
 net/can/raw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/can/bcm.c b/net/can/bcm.c
index bf1d0bbecec8..b8a32b4ac368 100644
--- a/net/can/bcm.c
+++ b/net/can/bcm.c
@@ -1680,7 +1680,7 @@ static int bcm_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	return size;
 }
 
-int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
+static int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
 			 unsigned long arg)
 {
 	/* no ioctls for socket layer -> hand it down to NIC layer */
diff --git a/net/can/raw.c b/net/can/raw.c
index da386f1fa815..a01848ff9b12 100644
--- a/net/can/raw.c
+++ b/net/can/raw.c
@@ -837,7 +837,7 @@ static int raw_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	return size;
 }
 
-int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
+static int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
 			 unsigned long arg)
 {
 	/* no ioctls for socket layer -> hand it down to NIC layer */
-- 
2.20.1

