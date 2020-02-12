Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F20415A168
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 07:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgBLGsH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 01:48:07 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:60538 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgBLGsH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 01:48:07 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01C6h7F4039253;
        Wed, 12 Feb 2020 06:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=DOR9P4JivuJhFFmQRguvf8n2sDoY/uHWqlf2ec7Tgm0=;
 b=ax+NX60Cf8qbtNbI3RXiXpVgNBnnBV9Y4csNLIASC0kRcILZ94C8zeZHD8C9QPoAF4mg
 XpiMN7HlrrqNqJxHo00ZsMOzQtUlS+8feIpnBDJJqKaAKj509lvvmRrT9T5vtmePs66f
 PbMAzxBZWCCOstZjyQbtnzcPWoT3iUm65GTbiFDAeH/ifKtP3Q3JXoO8Zd+AOk2T1ECG
 AIZ1D8t5wrAMtW+l6TVC19FS/cv/LphGmFQC/O8bYWxjQmJE1gqaqQMDkLa3rh79TMc7
 GgnawxUztw611PCMI0+TgxArJ20lgfcC3VwrOLhNg+bEscCSrSKbv/TIT4D09eREWbvv GQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2y2p3sg4b6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Feb 2020 06:47:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01C6keUP092777;
        Wed, 12 Feb 2020 06:47:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2y26q2rntm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Feb 2020 06:47:55 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01C6lqNU020793;
        Wed, 12 Feb 2020 06:47:52 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 Feb 2020 22:47:51 -0800
Date:   Wed, 12 Feb 2020 09:47:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jens Wiklander <jens.wiklander@linaro.org>,
        Rijo Thomas <Rijo-john.Thomas@amd.com>
Cc:     Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>, tee-dev@lists.linaro.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] tee: amdtee: Fix error handling in amdtee_open_session()
Message-ID: <20200212064649.fbfipw4pqv3bkdfl@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9528 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 suspectscore=2 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002120053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9528 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=2 mlxlogscore=999 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002120052
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On these error paths the "sess" variable isn't freed.  It's a refcounted
pointer so we need to call kref_put().  The other problem is that the
error code isn't always set.

I re-arranged the code a bit so the error case is always handled before
the success case and the error paths are indented two tabs.

Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/tee/amdtee/core.c | 52 +++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
index 6370bb55f512..40f3ff4cfae6 100644
--- a/drivers/tee/amdtee/core.c
+++ b/drivers/tee/amdtee/core.c
@@ -212,6 +212,19 @@ static int copy_ta_binary(struct tee_context *ctx, void *ptr, void **ta,
 	return rc;
 }
 
+static void destroy_session(struct kref *ref)
+{
+	struct amdtee_session *sess = container_of(ref, struct amdtee_session,
+						   refcount);
+
+	/* Unload the TA from TEE */
+	handle_unload_ta(sess->ta_handle);
+	mutex_lock(&session_list_mutex);
+	list_del(&sess->list_node);
+	mutex_unlock(&session_list_mutex);
+	kfree(sess);
+}
+
 int amdtee_open_session(struct tee_context *ctx,
 			struct tee_ioctl_open_session_arg *arg,
 			struct tee_param *param)
@@ -236,14 +249,14 @@ int amdtee_open_session(struct tee_context *ctx,
 
 	/* Load the TA binary into TEE environment */
 	handle_load_ta(ta, ta_size, arg);
-	if (arg->ret == TEEC_SUCCESS) {
-		mutex_lock(&session_list_mutex);
-		sess = alloc_session(ctxdata, arg->session);
-		mutex_unlock(&session_list_mutex);
+	if (arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
 	}
 
-	if (arg->ret != TEEC_SUCCESS)
-		goto out;
+	mutex_lock(&session_list_mutex);
+	sess = alloc_session(ctxdata, arg->session);
+	mutex_unlock(&session_list_mutex);
 
 	if (!sess) {
 		rc = -ENOMEM;
@@ -259,40 +272,31 @@ int amdtee_open_session(struct tee_context *ctx,
 
 	if (i >= TEE_NUM_SESSIONS) {
 		pr_err("reached maximum session count %d\n", TEE_NUM_SESSIONS);
+		kref_put(&sess->refcount, destroy_session);
 		rc = -ENOMEM;
 		goto out;
 	}
 
 	/* Open session with loaded TA */
 	handle_open_session(arg, &session_info, param);
-
-	if (arg->ret == TEEC_SUCCESS) {
-		sess->session_info[i] = session_info;
-		set_session_id(sess->ta_handle, i, &arg->session);
-	} else {
+	if (arg->ret != TEEC_SUCCESS) {
 		pr_err("open_session failed %d\n", arg->ret);
 		spin_lock(&sess->lock);
 		clear_bit(i, sess->sess_mask);
 		spin_unlock(&sess->lock);
+		kref_put(&sess->refcount, destroy_session);
+		rc = -EINVAL;
+		goto out;
 	}
+
+	sess->session_info[i] = session_info;
+	set_session_id(sess->ta_handle, i, &arg->session);
+
 out:
 	free_pages((u64)ta, get_order(ta_size));
 	return rc;
 }
 
-static void destroy_session(struct kref *ref)
-{
-	struct amdtee_session *sess = container_of(ref, struct amdtee_session,
-						   refcount);
-
-	/* Unload the TA from TEE */
-	handle_unload_ta(sess->ta_handle);
-	mutex_lock(&session_list_mutex);
-	list_del(&sess->list_node);
-	mutex_unlock(&session_list_mutex);
-	kfree(sess);
-}
-
 int amdtee_close_session(struct tee_context *ctx, u32 session)
 {
 	struct amdtee_context_data *ctxdata = ctx->data;
-- 
2.11.0

