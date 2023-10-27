Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3BE7D9EE0
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Oct 2023 19:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbjJ0R2i (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Oct 2023 13:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjJ0R2h (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 13:28:37 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136AEAB;
        Fri, 27 Oct 2023 10:28:36 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RDUqcs003218;
        Fri, 27 Oct 2023 17:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=p6dG+kpIoF/iHNddbsnwUE/KqqM8kV5CcnouCGK8hBU=;
 b=Bp2Q1BlhhhGbGtG3BjikUSLR5Td8ZbvJnA2TfXnULo5XNdIxZN8L/QLUDO5QMBww/y17
 4bPzRPsCXfkS0UB6GHBZP7+YvA8aTbwPPaEEAC23lYGHcgSkl+le5Fy4SfFH4qSpjv0z
 vPRi1dxmvykedH5kUI5Nl70flPsXZEYGdReJqzdrae+TFqqvcQU+xkCkOsbsR2epfvd2
 QzH643nEQPLH8nMJbY2VvxLQ6Q5vCBQtibGzEjvcsiTkPQdYUGMPqrzStK2DpjtmL1pN
 +ibOOxzD7zskENtPTwsWHZqR9PZQBsiUlkFEAA6nhAOR5M+NRm2xiZD+8vToAHdmHA+u Sg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyxmv9y5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Oct 2023 17:28:31 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39RHLsa2025874;
        Fri, 27 Oct 2023 17:28:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqmh4ee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Oct 2023 17:28:29 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39RHSTKR010403;
        Fri, 27 Oct 2023 17:28:29 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3tywqmh4bk-1;
        Fri, 27 Oct 2023 17:28:29 +0000
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH v2] i915/perf: Fix NULL deref bugs with drm_dbg() calls
Date:   Fri, 27 Oct 2023 10:28:22 -0700
Message-ID: <20231027172822.2753059-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_16,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270151
X-Proofpoint-GUID: kaDHCum3BgONr6fRSNERLsTiL3rM08tv
X-Proofpoint-ORIG-GUID: kaDHCum3BgONr6fRSNERLsTiL3rM08tv
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

When i915 perf interface is not available dereferencing it will lead to
NULL dereferences.

As returning -ENOTSUPP is pretty clear return when perf interface is not
available.

Fixes: 2fec539112e8 ("i915/perf: Replace DRM_DEBUG with driver specific drm_dbg call")
Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
v1 --> v2: Remove the debug calls as they don't add much value and
-ENOTSUPP is a good enough return value.
---
 drivers/gpu/drm/i915/i915_perf.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 2f3ecd7d4804..7b1c8de2f9cb 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4227,11 +4227,8 @@ int i915_perf_open_ioctl(struct drm_device *dev, void *data,
 	u32 known_open_flags;
 	int ret;
 
-	if (!perf->i915) {
-		drm_dbg(&perf->i915->drm,
-			"i915 perf interface not available for this system\n");
+	if (!perf->i915)
 		return -ENOTSUPP;
-	}
 
 	known_open_flags = I915_PERF_FLAG_FD_CLOEXEC |
 			   I915_PERF_FLAG_FD_NONBLOCK |
@@ -4607,11 +4604,8 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
 	struct i915_oa_reg *regs;
 	int err, id;
 
-	if (!perf->i915) {
-		drm_dbg(&perf->i915->drm,
-			"i915 perf interface not available for this system\n");
+	if (!perf->i915)
 		return -ENOTSUPP;
-	}
 
 	if (!perf->metrics_kobj) {
 		drm_dbg(&perf->i915->drm,
@@ -4773,11 +4767,8 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
 	struct i915_oa_config *oa_config;
 	int ret;
 
-	if (!perf->i915) {
-		drm_dbg(&perf->i915->drm,
-			"i915 perf interface not available for this system\n");
+	if (!perf->i915)
 		return -ENOTSUPP;
-	}
 
 	if (i915_perf_stream_paranoid && !perfmon_capable()) {
 		drm_dbg(&perf->i915->drm,
-- 
2.39.3

