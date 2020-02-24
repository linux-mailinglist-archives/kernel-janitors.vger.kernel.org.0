Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FF716A458
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Feb 2020 11:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgBXKwC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Feb 2020 05:52:02 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49316 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbgBXKwB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Feb 2020 05:52:01 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OAmv0P041169;
        Mon, 24 Feb 2020 10:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=1x9nUWSxkkNRGXpwPPtWSO1xf67OnMRMas+fSsd2N58=;
 b=ZJNFZaC3wqjElHRm6yzeqnDRHbriuSw0dW2y7/6ZL3CKi3GI368IEqmQfEM7NZRulT5Z
 TXzjAjGn4lm4KHsWy9ovcHnCrKSyHFKvL4qDAd84ribDI3oPQlI3LvaY6sXDNHQS+cw4
 JL9DAdSWLDSws+pUXXZf6ATfig41GYahZ4gp0c8ZX0GIyFQ7ZC/uefZXTwfKOc0WXTwf
 CT7tKPGAXeqHKL+G1ZRap32Aly7vBAyeINYQAneK8mBCcz0NmMqdq0aDb3K9YXOwAVTP
 NCZx7BKLuzdrGP+6YKad+ytoRmRpQPWujtwjdxDqMnVhQegWfRO7Vuf+py0ybki5JEIU hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2yavxreh4g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Feb 2020 10:51:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OAoO1p093805;
        Mon, 24 Feb 2020 10:51:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2ybe10xwqv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Feb 2020 10:51:50 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01OApmBs002740;
        Mon, 24 Feb 2020 10:51:48 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 24 Feb 2020 02:51:47 -0800
Date:   Mon, 24 Feb 2020 13:51:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jens Wiklander <jens.wiklander@linaro.org>,
        Rijo Thomas <Rijo-john.Thomas@amd.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>,
        Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        tee-dev@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] tee: amdtee: fix memory leak in amdtee_open_session()
Message-ID: <20200224105139.b5nweo2guprmxteu@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66f82e29-b31c-490e-0353-f1028fd1a131@amd.com>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=2 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=2 bulkscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002240091
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On these error paths the "sess" variable isn't freed.  It's a refcounted
pointer so we need to call kref_put().  I re-arranged the code a bit so
the error case is always handled before the success case and the error
paths are indented two tabs.

Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In the first version I changed these to return negative error codes,
    but actually it's supposed to return success and the error code is
    stored in arg->ret.

 drivers/tee/amdtee/core.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
index 6370bb55f512..0026eb6f13ce 100644
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
@@ -236,15 +249,13 @@ int amdtee_open_session(struct tee_context *ctx,
 
 	/* Load the TA binary into TEE environment */
 	handle_load_ta(ta, ta_size, arg);
-	if (arg->ret == TEEC_SUCCESS) {
-		mutex_lock(&session_list_mutex);
-		sess = alloc_session(ctxdata, arg->session);
-		mutex_unlock(&session_list_mutex);
-	}
-
 	if (arg->ret != TEEC_SUCCESS)
 		goto out;
 
+	mutex_lock(&session_list_mutex);
+	sess = alloc_session(ctxdata, arg->session);
+	mutex_unlock(&session_list_mutex);
+
 	if (!sess) {
 		rc = -ENOMEM;
 		goto out;
@@ -259,40 +270,29 @@ int amdtee_open_session(struct tee_context *ctx,
 
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
+		goto out;
 	}
+
+	sess->session_info[i] = session_info;
+	set_session_id(sess->ta_handle, i, &arg->session);
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

