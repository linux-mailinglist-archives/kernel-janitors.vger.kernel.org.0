Return-Path: <kernel-janitors+bounces-58-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8C7DC6ED
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 08:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD7D1C20BC7
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 07:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C861810790;
	Tue, 31 Oct 2023 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CZetOe+J"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB56FD304
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 07:10:31 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5557FC0;
	Tue, 31 Oct 2023 00:10:24 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UMxSWv015820;
	Tue, 31 Oct 2023 07:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=aFlek+gaXhKJbUVTWsJQV470BEu2g6P29DQzCjLhqfc=;
 b=CZetOe+JyVmF3OoVrSmlkLhMZViXF1Md5+FfqPUrtcGkXCb5qCxJOlsKhTFHWGPlgUw6
 ms8b6XB674rjj2aTPpWMSfw78bbwnllALDQ7SGNRGiAZnEFAzM5MoLX/ru3Xa+hopqrk
 +Dq/0ICsFztptZziC+ls7hiKmINVjk+MzHYHd8wu0Bk4Oy0JkSiOeb1OiQrfdJatJydA
 SZwAQzeCXgHwWsr+beYGa7ZxUTUtxgyFSKbmCfiHwa54Xzd4cz9WgBuFRDdjgBwrEqeD
 wUA8/jx1gcQ0CVYqbR36lSKYGwrS8kiiVPZNe4940l6LbRttCVj85H7K+VdBTBq5/SpS uw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0t6b4ajk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Oct 2023 07:10:06 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39V6JGmo038030;
	Tue, 31 Oct 2023 07:10:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rrbgwbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Oct 2023 07:10:05 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39V7A4Jw007065;
	Tue, 31 Oct 2023 07:10:04 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3u0rrbgw9q-1;
	Tue, 31 Oct 2023 07:10:04 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
        dm-devel@lists.linux.dev, Christian Loehle <christian.loehle@arm.com>,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH next] dm delay: Fix missing error code in delay_ctr()
Date: Tue, 31 Oct 2023 00:10:00 -0700
Message-ID: <20231031071000.374939-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310054
X-Proofpoint-GUID: QUuMXlOHf8bZnh_gOpoi-WhjpTvpxUXg
X-Proofpoint-ORIG-GUID: QUuMXlOHf8bZnh_gOpoi-WhjpTvpxUXg

When worker thread allocation fails, return error instead of
zero(success).

Also when kthread_create fails it returns ERR pointers and not NULL, so
fix that as well.

Fixes: c1fce71d29b2 ("dm delay: for short delays, use kthread instead of timers and wq")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Smatch complained about the missing error code.
This patch is only compile tested.
---
 drivers/md/dm-delay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index 3d91804923eb..efd510984e25 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -280,8 +280,10 @@ static int delay_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		 */
 		dc->worker = kthread_create(&flush_worker_fn, dc,
 					    "dm-delay-flush-worker");
-		if (!dc->worker)
+		if (IS_ERR(dc->worker)) {
+			ret = PTR_ERR(dc->worker);
 			goto bad;
+		}
 	} else {
 		timer_setup(&dc->delay_timer, handle_delayed_timer, 0);
 		INIT_WORK(&dc->flush_expired_bios, flush_expired_bios);
-- 
2.39.3


