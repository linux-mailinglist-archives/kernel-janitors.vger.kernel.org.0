Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4163023C3
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 Jan 2021 11:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbhAYKch (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 05:32:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38766 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbhAYKcB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 05:32:01 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8hmJU031918;
        Mon, 25 Jan 2021 08:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=F8WaLsNJWUQI+LXTocUPFqCAXty0gR2e0Bt3bTfUCi4=;
 b=yncWZh3xVNc3zqhUZCKA9kU4XtMJesr+hFUclqnzzOlRohYzX5gMQ/idqbbM+09pe8xq
 iscYvDh1ha4w+WcGHCW6y/ilAyV0qZrOTjJ0+aB4AYEUKcMlxPerRBgEiusjJKtYUfL8
 vqFXdwMIAOqETwEeBXUNhOAq/dsb1cfHnehr9tbUW8CgR9pdfsJmAywmIdX4zQ7AtyK8
 xPwMVzSleam3ZpYWTbht/2s3a5Ue0OGRy/8uGjPJ6ox0PYAdOtITJekVZrTbAiFHOeQO
 CrMlJWAfZPQU6HmEEEtOVKFVfhlNxG97xNPAOIICjo9mNd1/M6+i8mihG8WiCJ7Sit0H rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 368b7qm5hu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:47:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8aQcS081072;
        Mon, 25 Jan 2021 08:45:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 368wpw9njv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 08:45:28 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10P8jJe4020882;
        Mon, 25 Jan 2021 08:45:19 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 00:45:18 -0800
Date:   Mon, 25 Jan 2021 11:45:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harry Wentland <harry.wentland@amd.com>,
        George Shen <george.shen@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Wenjing Liu <wenjing.liu@amd.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Wyatt Wood <wyatt.wood@amd.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Jaehyun Chung <jaehyun.chung@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Yongqiang Sun <yongqiang.sun@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Anson Jacob <anson.jacob@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix a potential NULL dereference
Message-ID: <YA6FFK+F1XbGbYVJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250051
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The debug printk dereferences "link->link_enc" before we have ensured
that it is non-NULL.  Fix this potential NULL derefence by moving the
printk after the check.

Fixes: 1975b95ad4e7 ("drm/amd/display: Log link/connector info provided in BIOS object table")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index c16af3983fdb..4d31b2fae1f9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -1525,13 +1525,13 @@ static bool dc_link_construct(struct dc_link *link,
 	link->link_enc =
 		link->dc->res_pool->funcs->link_enc_create(&enc_init_data);
 
-	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
-
 	if (!link->link_enc) {
 		DC_ERROR("Failed to create link encoder!\n");
 		goto link_enc_create_fail;
 	}
 
+	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
+
 	link->link_enc_hw_inst = link->link_enc->transmitter;
 
 	for (i = 0; i < 4; i++) {
-- 
2.29.2

