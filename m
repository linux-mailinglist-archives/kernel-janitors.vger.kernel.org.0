Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D621CE2E6
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 May 2020 20:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731028AbgEKShX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 May 2020 14:37:23 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:34154 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbgEKShX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 May 2020 14:37:23 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BIU5av047473;
        Mon, 11 May 2020 18:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=CZOwzpemRnd78zgwoxIdVl8m13SuOTE/kD6NJ7g+w6k=;
 b=QIsfYpGwul6BKrwim6pMahlhi6Xx7ZzI8GpTf3qm3TPzrCxr5R490SR/0jtf8PsPtJAH
 3q0H6N6tWSwg0TKoM2Wz0UpK/QJkGvqAt9EZ67Cj3Zqzu6JH4kjTQDPqIlPwf/R+eJIw
 8DaylgaLP6DCevWUHZ+oZyDkTFLMKZXGSbc50yFG4c78I2S+C+1+nFT5uUTgphxG8n9I
 YJMbc//tkH5V8tLPK6bHAYXLcNcZvfMOXhXVitKYGVf0rPSNj5w9jjjAQhW7WZnkaP5L
 B3quaDW2CMXmdqZZSM4d7bOv2iYA11u3oBhPCv644JhgFfBzdl87PYuPetwPWYSzuy87 CQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 30x3gsetud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 18:37:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BITgeQ174117;
        Mon, 11 May 2020 18:37:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 30x69rht64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 May 2020 18:37:16 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04BIbEuJ010078;
        Mon, 11 May 2020 18:37:15 GMT
Received: from mwanda (/10.175.212.140)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 11 May 2020 11:37:10 -0700
Date:   Mon, 11 May 2020 21:37:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/hmm/test: Fix some copy_to_user() error handling
Message-ID: <20200511183704.GA225608@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110141
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes which weren't
copied but we want to return negative error codes.  Also in dmirror_write()
if the copy_from_user() fails then there is some cleanup needed before
we can return so I fixed that as well.

Fixes: 5d5e54be8a1e3 ("mm/hmm/test: add selftest driver for HMM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_hmm.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 00bca6116f930..fd4889f7b3d90 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -360,9 +360,11 @@ static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 		cmd->faults++;
 	}
 
-	if (ret == 0)
-		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
-					bounce.size);
+	if (ret == 0) {
+		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+				 bounce.size))
+			ret = -EFAULT;
+	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
 	return ret;
@@ -412,10 +414,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
 		return ret;
-	ret = copy_from_user(bounce.ptr, u64_to_user_ptr(cmd->ptr),
-				bounce.size);
-	if (ret)
-		return ret;
+	if (copy_from_user(bounce.ptr, u64_to_user_ptr(cmd->ptr),
+			   bounce.size)) {
+		ret = -EFAULT;
+		goto fini;
+	}
 
 	while (1) {
 		mutex_lock(&dmirror->mutex);
@@ -431,6 +434,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 		cmd->faults++;
 	}
 
+fini:
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
 	return ret;
@@ -715,9 +719,11 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
-	if (ret == 0)
-		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
-					bounce.size);
+	if (ret == 0) {
+		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+				 bounce.size))
+			ret = -EFAULT;
+	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
 	return ret;
@@ -886,9 +892,10 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 			break;
 
 		n = (range.end - range.start) >> PAGE_SHIFT;
-		ret = copy_to_user(uptr, perm, n);
-		if (ret)
+		if (copy_to_user(uptr, perm, n)) {
+			ret = -EFAULT;
 			break;
+		}
 
 		cmd->cpages += n;
 		uptr += n;
@@ -911,9 +918,8 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 	if (!dmirror)
 		return -EINVAL;
 
-	ret = copy_from_user(&cmd, uarg, sizeof(cmd));
-	if (ret)
-		return ret;
+	if (copy_from_user(&cmd, uarg, sizeof(cmd)))
+		return -EFAULT;
 
 	if (cmd.addr & ~PAGE_MASK)
 		return -EINVAL;
@@ -946,7 +952,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 	if (ret)
 		return ret;
 
-	return copy_to_user(uarg, &cmd, sizeof(cmd));
+	if (copy_to_user(uarg, &cmd, sizeof(cmd)))
+		return -EFAULT;
+
+	return 0;
 }
 
 static const struct file_operations dmirror_fops = {
-- 
2.26.2

