Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA23920D3
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Aug 2019 11:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfHSJ7O (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Aug 2019 05:59:14 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45808 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfHSJ7O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Aug 2019 05:59:14 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7J9rhaa098649;
        Mon, 19 Aug 2019 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=/JPBDryUKLOaTIk25HI3UZTIzR+WQxu3bdPh/x3jHB4=;
 b=XNGwQkDNGSQuvpl7FFpKB/LhwnWOZ5gk2seoUthcqIUrQLvtyqh+Pr3jQ2nhJHyv+Fe4
 XxNmvSmfSlLlL7pDgxA7Jb4RL1Nl36gEyNrWHwuPe1pabvlU6WTEzVjSohKbT7j9xN/g
 WnNMb2tkMmmIxS/G+7/lWcbbNEdVxQxNAv3txXapa2KDCGu7NQO9mlATgXlZkzP2YyKO
 ZCz12jGbuc+p2BtowYSwRMB3csfuUo+wN1vGvH8HJzqKZ5xw7Y4ShBh9Ja+xa/JK1czX
 I3KKGJXK7l59G3SnMgQod9QG8FgXKqNGdB4j+z3rkIfMeyPak3sECIabm8m73jB4vQ/K dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2ue90t6hsr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Aug 2019 09:58:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7J9wYPq020419;
        Mon, 19 Aug 2019 09:58:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2ufb46j328-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Aug 2019 09:58:40 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7J9wKgK001195;
        Mon, 19 Aug 2019 09:58:20 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 19 Aug 2019 02:58:20 -0700
Date:   Mon, 19 Aug 2019 12:58:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alasdair Kergon <agk@redhat.com>,
        Dmitry Fomichev <dmitry.fomichev@wdc.com>
Cc:     Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] dm zoned: Potential NULL dereference in dmz_do_reclaim()
Message-ID: <20190819095814.GA19905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908190114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908190113
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function is supposed to return error pointers so it matches the
dmz_get_rnd_zone_for_reclaim() function.  The current code could lead to
a NULL dereference in dmz_do_reclaim()

Fixes: b234c6d7a703 ("dm zoned: improve error handling in reclaim")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 2a5bc51fd6d5..595a73110e17 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1588,7 +1588,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 	struct dm_zone *zone;
 
 	if (list_empty(&zmd->map_seq_list))
-		return NULL;
+		return ERR_PTR(-EBUSY);
 
 	list_for_each_entry(zone, &zmd->map_seq_list, link) {
 		if (!zone->bzone)
@@ -1597,7 +1597,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 			return zone;
 	}
 
-	return NULL;
+	return ERR_PTR(-EBUSY);
 }
 
 /*
-- 
2.20.1

