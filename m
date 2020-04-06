Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE3E419F82A
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Apr 2020 16:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgDFOpW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Apr 2020 10:45:22 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:35868 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgDFOpW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Apr 2020 10:45:22 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036EhkIV191714;
        Mon, 6 Apr 2020 14:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=hTZWWAIGZlG0eLNJqrTqr4brYA+GvbhknwQR5XEiU18=;
 b=e4qeawfmRxJJfnTo9l0HEbVhsnUW8GAP0vKa8nj3oKlQp5CNGLmYmc9LVc93rVCgueA0
 N04DQUyCAal/nEUSBjmCPyFRlT+EK4Gj4k/hqNye37Uj5mH7KfpbpzXJKB+z+LBH1U0w
 5Clea36TRHE5Ihdq7ZLlYkQxf+NkLHxx9pnrJBFszyEcHWlMIl5reH1ZTQhYIquyJ3Bw
 Di1TYbu2QShd1vUQbbSYiPWVg33y+UTl0mY/awIuYEfKzGCl3c6k/2FuXXsT0IZFlqxZ
 480HCRKS22kB1POEiUNP5NaEiv34iaHsvYwK+Fh2cumWOIsjed+/hTlGpZKXm8foBvrf fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 306hnqyab9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:45:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036EfOPa035081;
        Mon, 6 Apr 2020 14:45:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 30741armqw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:45:16 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 036EjGWs014620;
        Mon, 6 Apr 2020 14:45:16 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 Apr 2020 07:45:15 -0700
Date:   Mon, 6 Apr 2020 17:45:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] vdpa: Signedness bugs in vdpasim_work()
Message-ID: <20200406144509.GE68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060122
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "read" and "write" variables need to be signed for the error
handling to work.

Fixes: 2c53d0f64c06 ("vdpasim: vDPA device simulator")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 6e8a0cf2fdeb..b3c800653056 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -132,7 +132,8 @@ static void vdpasim_work(struct work_struct *work)
 						 vdpasim, work);
 	struct vdpasim_virtqueue *txq = &vdpasim->vqs[1];
 	struct vdpasim_virtqueue *rxq = &vdpasim->vqs[0];
-	size_t read, write, total_write;
+	ssize_t read, write;
+	size_t total_write;
 	int err;
 	int pkts = 0;
 
-- 
2.25.1

