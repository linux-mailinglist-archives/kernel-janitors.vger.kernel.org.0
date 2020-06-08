Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E8B1F1AD0
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jun 2020 16:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgFHOSh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 8 Jun 2020 10:18:37 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:35274 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgFHOSh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Jun 2020 10:18:37 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058EICZK048153;
        Mon, 8 Jun 2020 14:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=X97QZ5zC4kwhjVyHidZdwnag2CuHGEbuIIJVCbqKndI=;
 b=SeH5H0iVfSAmAF4BjVTkZAdAYxtSrulbK+YapwFNkm5uBQ0hzEGIcz5jgeSxf9XbcXYp
 V/Xy9jdHWQdo9Lt3UiZ3cFp4UYm5mAsr2q7YC54I2dk/VQbkouGfLWKanfxqsSllEaGj
 WnNZkqEEgKS+zMht1vU/R8p0CN0oMPGFyIfBusbkbyUv1zOrdTGbDgS9BnhWcZgh/7/a
 v8tW7rz8TXJqZv6FNut4N4F7ibbBXdOE7WPRbBxb25RkGFLYkPphhrEAEvhPIfhXKTN8
 OQDCqwhbQLdlfNxazJafQgR1DzzpHirQ3dOh5HzlXf3Cbp2iEioaqxFGteu78oRwsXtC xQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 31g2jqy56y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 08 Jun 2020 14:18:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058EIIl9195039;
        Mon, 8 Jun 2020 14:18:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 31gn22wf6v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Jun 2020 14:18:31 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 058EIUuD032103;
        Mon, 8 Jun 2020 14:18:30 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 08 Jun 2020 07:18:30 -0700
Date:   Mon, 8 Jun 2020 17:18:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Evan Quan <evan.quan@amd.com>, Kent Russell <kent.russell@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: Fix buffer overflow in
 arcturus_get_unique_id()
Message-ID: <20200608141823.GD1912173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006080106
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The comments say that the "sn" buffer is used to hold a 16-digit HEX
string so the buffer needs to be at least 17 characters to hold the
NUL terminator.

Fixes: 81a16241114b ("drm/amdgpu: Add unique_id and serial_number for Arcturus v3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index df7b408319f76..a575cb9d1574c 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2266,7 +2266,7 @@ static void arcturus_get_unique_id(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t top32, bottom32, smu_version, size;
-	char sn[16];
+	char sn[20];
 	uint64_t id;
 
 	if (smu_get_smc_version(smu, NULL, &smu_version)) {
-- 
2.26.2

