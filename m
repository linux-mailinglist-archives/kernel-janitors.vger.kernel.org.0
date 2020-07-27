Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753D722EDB7
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jul 2020 15:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbgG0NmG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jul 2020 09:42:06 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57538 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgG0NmF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jul 2020 09:42:05 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RDalhA125037;
        Mon, 27 Jul 2020 13:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=C79hoc+bChITH02F5tCpLD3vLSaoHC5D5jC4/tNpnZQ=;
 b=ru9FHjwY/mUY8HtHss0i08Sck2VlGiFM+JAapqQ/1DaNbh1197LqjRmOhh8DXUDAji9f
 LCqINFEqC4cJdtAbjoA7Lsptjhvb2DMfWnTQ38m6/vt/XKpgMG9nv8pIxX41on97k38o
 oOYS+u9t7hmNpWxnoXKN3mkF2++zm5C8HeGofLx8ZGbpQjNCqJ9BE6enYO+5cUjVb7y1
 nT6EDYRqv646nHqgVIpavh50SqMz7UevJoZOyIXRUD1wKFzrvc60x0tkqULNhjIONw6v
 UwdCb+uk9fNhrODboTuAA/J1X5rNBI+r+PgVvN/PSQWMG+wu0gbvifH3/95ukqBcUa4A 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 32hu1j1ka2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 13:42:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RDcMq5007680;
        Mon, 27 Jul 2020 13:39:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 32hu5qqe7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 13:39:59 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06RDdmE1003749;
        Mon, 27 Jul 2020 13:39:48 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jul 2020 06:39:47 -0700
Date:   Mon, 27 Jul 2020 16:39:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Evan Quan <evan.quan@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: off by one bugs in
 smu_cmn_to_asic_specific_index()
Message-ID: <20200727133940.GA391897@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These tables have _COUNT number of elements so the comparisons should be
>= instead of > to prevent reading one element beyond the end of the
array.

Fixes: 8264ee69f0d8 ("drm/amd/powerplay: drop unused code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/smu_cmn.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smu_cmn.c b/drivers/gpu/drm/amd/powerplay/smu_cmn.c
index be4b678d0e60..5c23c44c33bd 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_cmn.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_cmn.c
@@ -166,7 +166,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
 
 	switch (type) {
 	case CMN2ASIC_MAPPING_MSG:
-		if (index > SMU_MSG_MAX_COUNT ||
+		if (index >= SMU_MSG_MAX_COUNT ||
 		    !smu->message_map)
 			return -EINVAL;
 
@@ -181,7 +181,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
 		return msg_mapping.map_to;
 
 	case CMN2ASIC_MAPPING_CLK:
-		if (index > SMU_CLK_COUNT ||
+		if (index >= SMU_CLK_COUNT ||
 		    !smu->clock_map)
 			return -EINVAL;
 
@@ -192,7 +192,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
 		return mapping.map_to;
 
 	case CMN2ASIC_MAPPING_FEATURE:
-		if (index > SMU_FEATURE_COUNT ||
+		if (index >= SMU_FEATURE_COUNT ||
 		    !smu->feature_map)
 			return -EINVAL;
 
@@ -203,7 +203,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
 		return mapping.map_to;
 
 	case CMN2ASIC_MAPPING_TABLE:
-		if (index > SMU_TABLE_COUNT ||
+		if (index >= SMU_TABLE_COUNT ||
 		    !smu->table_map)
 			return -EINVAL;
 
@@ -214,7 +214,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
 		return mapping.map_to;
 
 	case CMN2ASIC_MAPPING_PWR:
-		if (index > SMU_POWER_SOURCE_COUNT ||
+		if (index >= SMU_POWER_SOURCE_COUNT ||
 		    !smu->pwr_src_map)
 			return -EINVAL;
 
-- 
2.27.0

