Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431E26A906F
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Mar 2023 06:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCCFWt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 Mar 2023 00:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCCFWs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Mar 2023 00:22:48 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A321714988;
        Thu,  2 Mar 2023 21:22:46 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id 7C1061A00AA7;
        Fri,  3 Mar 2023 13:23:30 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dwzXF7kyVtNh; Fri,  3 Mar 2023 13:23:29 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: yuzhe@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id D97361A0087A;
        Fri,  3 Mar 2023 13:23:28 +0800 (CST)
From:   Yu Zhe <yuzhe@nfschina.com>
To:     freude@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com
Cc:     linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, liqiong@nfschina.com,
        Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH v3] s390/zcrypt: remove unnecessary (void*) conversions
Date:   Fri,  3 Mar 2023 13:21:55 +0800
Message-Id: <20230303052155.21072-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230303013250.3058-1-yuzhe@nfschina.com>
References: <20230303013250.3058-1-yuzhe@nfschina.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/s390/crypto/zcrypt_msgtype6.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/s390/crypto/zcrypt_msgtype6.c b/drivers/s390/crypto/zcrypt_msgtype6.c
index 5ad251477593..a2e7fe33ba62 100644
--- a/drivers/s390/crypto/zcrypt_msgtype6.c
+++ b/drivers/s390/crypto/zcrypt_msgtype6.c
@@ -926,8 +926,7 @@ static void zcrypt_msgtype6_receive(struct ap_queue *aq,
 		.type = TYPE82_RSP_CODE,
 		.reply_code = REP82_ERROR_MACHINE_FAILURE,
 	};
-	struct response_type *resp_type =
-		(struct response_type *)msg->private;
+	struct response_type *resp_type = msg->private;
 	struct type86x_reply *t86r;
 	int len;
 
@@ -982,8 +981,7 @@ static void zcrypt_msgtype6_receive_ep11(struct ap_queue *aq,
 		.type = TYPE82_RSP_CODE,
 		.reply_code = REP82_ERROR_MACHINE_FAILURE,
 	};
-	struct response_type *resp_type =
-		(struct response_type *)msg->private;
+	struct response_type *resp_type = msg->private;
 	struct type86_ep11_reply *t86r;
 	int len;
 
@@ -1157,7 +1155,7 @@ static long zcrypt_msgtype6_send_cprb(bool userspace, struct zcrypt_queue *zq,
 				      struct ap_message *ap_msg)
 {
 	int rc;
-	struct response_type *rtype = (struct response_type *)(ap_msg->private);
+	struct response_type *rtype = ap_msg->private;
 	struct {
 		struct type6_hdr hdr;
 		struct CPRBX cprbx;
@@ -1240,7 +1238,7 @@ static long zcrypt_msgtype6_send_ep11_cprb(bool userspace, struct zcrypt_queue *
 {
 	int rc;
 	unsigned int lfmt;
-	struct response_type *rtype = (struct response_type *)(ap_msg->private);
+	struct response_type *rtype = ap_msg->private;
 	struct {
 		struct type6_hdr hdr;
 		struct ep11_cprb cprbx;
@@ -1359,7 +1357,7 @@ static long zcrypt_msgtype6_rng(struct zcrypt_queue *zq,
 		short int verb_length;
 		short int key_length;
 	} __packed * msg = ap_msg->msg;
-	struct response_type *rtype = (struct response_type *)(ap_msg->private);
+	struct response_type *rtype = ap_msg->private;
 	int rc;
 
 	msg->cprbx.domain = AP_QID_QUEUE(zq->queue->qid);
-- 
2.11.0

