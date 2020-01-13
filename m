Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC9413921D
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Jan 2020 14:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgAMNYp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Jan 2020 08:24:45 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46810 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgAMNYp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jan 2020 08:24:45 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DDMeRq116202;
        Mon, 13 Jan 2020 13:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Ga946dKjkWL6cw2gC4q2vcikz/DRqUl8k49hkbQNN44=;
 b=erLYBBdiZE73upde6C3zUurIz10Re6RCdcFehNJt5jWIAw483zwcjJWdhlkxZH2OFd89
 Lgb8W+YkosBsiDLtSmKCbtDZjUwMjxqU6kCM5tlJ+hpcUmnXkB20Dz/1unzU3mlRaEbT
 Bj1k4uvo3Qj1HzB+zkK5Bqmh0zrXxXSenehl1G44As3VTICecYWxwfe1ZYIZZ3kvcJyj
 Rz/YugKSoeMH3Kx9SYn+6BP1HSapP/i4nGkepPndqIJuJ2edKjaCKRYqTOtqLqkfFZKF
 FZ3WE81olddiQLsVr9sogOnOUM+gpUTcMF3lf0odJoxCM7RZKXawICWOecSULmnwsLCx uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2xf74rxw6f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jan 2020 13:24:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DDOBx0084936;
        Mon, 13 Jan 2020 13:24:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2xfrh62vs6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jan 2020 13:24:15 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00DDNsNN007011;
        Mon, 13 Jan 2020 13:23:55 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 05:23:54 -0800
Date:   Mon, 13 Jan 2020 16:23:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Richard Weinberger <richard@nod.at>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-mtd@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ubi: Fix an error pointer dereference in error handling code
Message-ID: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9498 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001130112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9498 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001130112
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
and we try to kfree() it which results in an Oops.

This patch re-arranges the error handling so now it only frees things
which have been allocated successfully.

Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
---
 drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1c7be4eb3ba6..6b544665318a 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1137,7 +1137,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	struct rb_node *tmp_rb;
 	int ret, i, j, free_peb_count, used_peb_count, vol_count;
 	int scrub_peb_count, erase_peb_count;
-	unsigned long *seen_pebs = NULL;
+	unsigned long *seen_pebs;
 
 	fm_raw = ubi->fm_buf;
 	memset(ubi->fm_buf, 0, ubi->fm_size);
@@ -1151,7 +1151,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	dvbuf = new_fm_vbuf(ubi, UBI_FM_DATA_VOLUME_ID);
 	if (!dvbuf) {
 		ret = -ENOMEM;
-		goto out_kfree;
+		goto out_free_avbuf;
 	}
 
 	avhdr = ubi_get_vid_hdr(avbuf);
@@ -1160,7 +1160,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	seen_pebs = init_seen(ubi);
 	if (IS_ERR(seen_pebs)) {
 		ret = PTR_ERR(seen_pebs);
-		goto out_kfree;
+		goto out_free_dvbuf;
 	}
 
 	spin_lock(&ubi->volumes_lock);
@@ -1328,7 +1328,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avbuf);
 	if (ret) {
 		ubi_err(ubi, "unable to write vid_hdr to fastmap SB!");
-		goto out_kfree;
+		goto out_free_seen;
 	}
 
 	for (i = 0; i < new_fm->used_blocks; i++) {
@@ -1350,7 +1350,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (ret) {
 			ubi_err(ubi, "unable to write vid_hdr to PEB %i!",
 				new_fm->e[i]->pnum);
-			goto out_kfree;
+			goto out_free_seen;
 		}
 	}
 
@@ -1360,7 +1360,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (ret) {
 			ubi_err(ubi, "unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
-			goto out_kfree;
+			goto out_free_seen;
 		}
 	}
 
@@ -1370,10 +1370,13 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	ret = self_check_seen(ubi, seen_pebs);
 	dbg_bld("fastmap written!");
 
-out_kfree:
-	ubi_free_vid_buf(avbuf);
-	ubi_free_vid_buf(dvbuf);
+out_free_seen:
 	free_seen(seen_pebs);
+out_free_dvbuf:
+	ubi_free_vid_buf(dvbuf);
+out_free_avbuf:
+	ubi_free_vid_buf(avbuf);
+
 out:
 	return ret;
 }
-- 
2.11.0

