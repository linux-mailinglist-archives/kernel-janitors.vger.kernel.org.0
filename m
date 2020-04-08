Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71C991A1FAA
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Apr 2020 13:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgDHLPJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Apr 2020 07:15:09 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44240 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgDHLPJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Apr 2020 07:15:09 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 038BD0rN189325;
        Wed, 8 Apr 2020 11:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=fjhhviIGr/rXpBHAV0fq3rzPJmoQ9bnVe4b14251RXs=;
 b=rNe1w2NJigpyMZTbSGqMh8pg2zaBFHyeP1t65yDXwTURh5wdavKzQvD2ki7mEgUk1oNp
 J9JLbwMqUY0LvwEsQ02VyTbyKUYDaoAdvmkgNhRgCyTr8eB28TirorxSL08gDHPP9384
 j/1ntHZBLW8ZbV0YTvhsB78xhsr4y4IA2VRuZi3VPXMK0i3mqqAeSgcZiAiHqlWlWdNp
 4cziBxnu+gh4lzkW3qaHvbkeaX+JClgxkDDwLBI6MTw8jmHVdbnMtl8LXmgBsieEc4Nf
 +e4CcJMfxnQd0qubPicug+PNo6NX8BQuH6x+Nk8nCC2dT7jP5CxQS6PpJCC2vcQLaLHG Ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 309ag3983d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Apr 2020 11:15:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 038BCikr059163;
        Wed, 8 Apr 2020 11:15:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 309ag1kdbw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Apr 2020 11:15:04 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 038BF2AE025155;
        Wed, 8 Apr 2020 11:15:02 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 Apr 2020 04:15:01 -0700
Date:   Wed, 8 Apr 2020 14:14:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     dxu@dxuuu.xyz
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] kernfs: Add option to enable user xattrs
Message-ID: <20200408111456.GA250869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=657 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=712 clxscore=1011
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080094
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Daniel Xu,

The patch 0c47383ba3bd: "kernfs: Add option to enable user xattrs"
from Mar 12, 2020, leads to the following static checker warning:

	fs/kernfs/inode.c:379 kernfs_vfs_user_xattr_rm()
	error: uninitialized symbol 'removed_size'.

fs/kernfs/inode.c
   366  static int kernfs_vfs_user_xattr_rm(struct kernfs_node *kn,
   367                                      const char *full_name,
   368                                      struct simple_xattrs *xattrs,
   369                                      const void *value, size_t size, int flags)
   370  {
   371          atomic_t *sz = &kn->iattr->user_xattr_size;
   372          atomic_t *nr = &kn->iattr->nr_user_xattrs;
   373          ssize_t removed_size;
   374          int ret;
   375  
   376          ret = simple_xattr_set(xattrs, full_name, value, size, flags,
   377                                 &removed_size);
   378  
   379          if (removed_size >= 0) {
                    ^^^^^^^^^^^^^^^^^
There are some path where simple_xattr_set() doesn't initialize
"removed_size" on allocation failure.

   380                  atomic_sub(removed_size, sz);
   381                  atomic_dec(nr);
   382          }
   383  
   384          return ret;
   385  }

regards,
dan carpenter
