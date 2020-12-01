Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185A42C97D3
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 08:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgLAHHz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 02:07:55 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60880 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAHHz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 02:07:55 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B16xEPm164026;
        Tue, 1 Dec 2020 07:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=wJUVjSwX0WKa308YFxrbEDoQPJuwuAbJnmH3mVM4apI=;
 b=PtQmyN22BXD1QKufzcGY4MfNVETuuxnsxHsqhHH4eL5iBojKMw26wRwORQI3LYRpZLXA
 JVyyGcYeh6WQ9+C19XD/4HDYOh8cxD1xNVILSTZN+8Z1NCWrlLa3BO+KI19Zaw3gvn5N
 uK9IlOQMFFpe8tsDDHxJilsUdmexogTilTE73+ZgO88iS+apELsDv3WNAEb+VYdFp3if
 /YskJ8jGip7ndZG17qLc4nucb2XblTCOIuSwGpEYkNY+8yG40J7Qm+i9KDZIo2YROBfu
 q6WOyjGaUzcvLFA/RoiOtcUT/7NCIGymNFVyjNLB7svtiqU3Ib2toMPPw3OrV6b6B9lm yA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 353dyqh093-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 07:06:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B171Ipb178074;
        Tue, 1 Dec 2020 07:04:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 3540fwfm3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 07:04:51 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B174ki8010592;
        Tue, 1 Dec 2020 07:04:46 GMT
Received: from mwanda (/41.210.145.16)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 30 Nov 2020 23:04:45 -0800
Date:   Tue, 1 Dec 2020 10:04:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Jianyong Wu <jianyong.wu@arm.com>
Cc:     Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        v9fs-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] 9p: Remove unnecessary IS_ERR() check
Message-ID: <X8XrAreZVDdLX+QH@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010045
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010045
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "fid" variable can't be an error pointer so there is no need to
check.  The code is slightly cleaner if we move the increment before
the break and remove the NULL check as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/9p/fid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/fid.c b/fs/9p/fid.c
index 79837f1b1c91..9d9de62592be 100644
--- a/fs/9p/fid.c
+++ b/fs/9p/fid.c
@@ -56,12 +56,11 @@ static struct p9_fid *v9fs_fid_find_inode(struct inode *inode, kuid_t uid)
 	h = (struct hlist_head *)&inode->i_private;
 	hlist_for_each_entry(fid, h, ilist) {
 		if (uid_eq(fid->uid, uid)) {
+			refcount_inc(&fid->count);
 			ret = fid;
 			break;
 		}
 	}
-	if (ret && !IS_ERR(ret))
-		refcount_inc(&ret->count);
 	spin_unlock(&inode->i_lock);
 	return ret;
 }
-- 
2.29.2

