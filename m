Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86087CDDE0
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2019 11:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfJGJC0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Oct 2019 05:02:26 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45800 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbfJGJCZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Oct 2019 05:02:25 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978xNGV034568;
        Mon, 7 Oct 2019 09:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=+9sHUYnl7Rq+MROQDknEnBJdttxVkDtS1pV81Z5rZ1E=;
 b=EP8ROu7c7AAtB35Z3jPzS9AaJNaSP6VU/KPnfD5rGV6SEXoWQTRJvdQE6KpYgudecmwA
 t55Sy8Spy8OWIURTtIgjlhotoyb/KvzkX7RhbLpNMOGdxWQu1qPEcc1O6Y9qU2TQK1Th
 Pujs4hEubYwtwER0fmHFLrs+a7UUjr9enxnL5aotmabUP1WxPaK1ojtf+BxPpEfPvPXr
 r/h9j+3Lo7XQZcifZ6qXWE4Zxp2e90TV+759MVF6GtzTCC3R+WdUV/ArQ2LZjRFqmRpm
 M2kITIS9HFnCcSjBTkUtXdsOA7Y5wGEAAVFtdiThS5kMBMe4rIwJDXAXlbhiqWtr8mnx 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2vejku5hd1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 09:02:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978xQqS190026;
        Mon, 7 Oct 2019 09:02:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2vf4ph5dc0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 09:02:17 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9792ESe013268;
        Mon, 7 Oct 2019 09:02:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Oct 2019 02:02:13 -0700
Date:   Mon, 7 Oct 2019 12:02:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rex Zhu <rex.zhu@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>
Cc:     Evan Quan <evan.quan@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: Fix error handling in
 smu_init_fb_allocations()
Message-ID: <20191007090206.GD3865@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070094
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error handling is off by one.  We should not free the first
"tables[i].bo" without decrementing "i" because that might result in a
double free.  The second problem is that when an error occurs, then the
zeroth element "tables[0].bo" isn't freed.

I had make "i" signed int for the error handling to work, so I just
updated "ret" as well as a clean up.

Fixes: f96357a991b9 ("drm/amd/powerplay: implement smu_init(fini)_fb_allocations function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index f1fbbc8b77ee..c9266ea70331 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -896,8 +896,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	struct smu_table_context *smu_table = &smu->smu_table;
 	struct smu_table *tables = smu_table->tables;
-	uint32_t i = 0;
-	int32_t ret = 0;
+	int ret, i;
 
 	for (i = 0; i < SMU_TABLE_COUNT; i++) {
 		if (tables[i].size == 0)
@@ -915,7 +914,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
 
 	return 0;
 failed:
-	for (; i > 0; i--) {
+	while (--i >= 0) {
 		if (tables[i].size == 0)
 			continue;
 		amdgpu_bo_free_kernel(&tables[i].bo,
-- 
2.20.1

