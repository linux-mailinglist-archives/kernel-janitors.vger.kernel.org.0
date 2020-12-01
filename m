Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007202C97D4
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 08:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgLAHId (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 02:08:33 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33548 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAHId (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 02:08:33 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B16xS3I164530;
        Tue, 1 Dec 2020 07:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=mime-version :
 message-id : date : from : to : cc : subject : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=3HisL07hMIGHTEQHbmBhCBHT9UuwvPjn8bGNEkPVAOk=;
 b=zBsTHaSKjhGGb1xvUJKYWnhCZPsreK78MH4hSlvphw22OixckqNVM7Qab7xpxtRWkn/s
 FBdmAJ2qoH5FSLO3nCMoo1qaVOLN0v55d6N5yJgTYeqROxaNFuniyTLUuR5v9dOwuAZk
 dZQGLtUyX6DbX+cyow+FSqpeO/tw7SQqge2sXUAuCqGRIgUJVNh95uPbNidzrQh/7hgF
 4xTpxcaxhFVBYUaoUH6z19R8+gW3HsKv/V1UXImL5crOeXzy8qvchF+LDNDOWlUPsm0M
 eYpJO8eerN4A3dw8q+6zK4nsn+l3UxfQk65bOh17H3LEZISfkv9KodWYAfYBSWedlXuC JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 353dyqh0as-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 07:07:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B170TCL062782;
        Tue, 1 Dec 2020 07:05:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 35404mgwe0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 07:05:15 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B175EES010795;
        Tue, 1 Dec 2020 07:05:14 GMT
Received: from mwanda (/41.210.145.16) by default (Oracle Beehive Gateway
 v4.0) with ESMTP ; Mon, 30 Nov 2020 23:04:25 -0800
MIME-Version: 1.0
Message-ID: <X8Xq7JvqR/LKzjB2@mwanda>
Date:   Mon, 30 Nov 2020 23:04:12 -0800 (PST)
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Jianyong Wu <jianyong.wu@arm.com>
Cc:     Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        v9fs-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] 9p: Uninitialized variable in v9fs_writeback_fid()
X-Mailer: git-send-email haha only kidding
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010045
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010045
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If v9fs_fid_lookup_with_uid() fails then "fid" is not initialized.

The v9fs_fid_lookup_with_uid() can't return NULL.  If it returns an
error pointer then we can still pass that to clone_fid() and it will
return the error pointer back again.

Fixes: 6636b6dcc3db ("9p: add refcount to p9_fid struct")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/9p/fid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/fid.c b/fs/9p/fid.c
index 50118ec72a92..79837f1b1c91 100644
--- a/fs/9p/fid.c
+++ b/fs/9p/fid.c
@@ -302,8 +302,7 @@ struct p9_fid *v9fs_writeback_fid(struct dentry *dentry)
 	struct p9_fid *fid, *ofid;
 
 	ofid = v9fs_fid_lookup_with_uid(dentry, GLOBAL_ROOT_UID, 0);
-	if (ofid && !IS_ERR(ofid))
-		fid = clone_fid(ofid);
+	fid = clone_fid(ofid);
 	if (IS_ERR(fid))
 		goto error_out;
 	p9_client_clunk(ofid);
-- 
2.29.2

