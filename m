Return-Path: <kernel-janitors+bounces-3771-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA73901701
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 Jun 2024 18:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD4928157F
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 Jun 2024 16:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8927547A76;
	Sun,  9 Jun 2024 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oH54ZGAu"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4D2C138;
	Sun,  9 Jun 2024 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717950923; cv=none; b=NOVXqeCSFEJIqVNagdFkyhby9NonUQL50s2my/Eyalwdp2h5PQZb5vSIvBrM2Sf5c632QmnoEChRN2LY69tv0rQYhyA2WRZl3ud427HwVhBEKh1JorUgIATwBxwPElaxJ2ofdw+Z2uJXL6Nmbs+EhhrAphS5j++sYeNJt1ihuqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717950923; c=relaxed/simple;
	bh=i82wRIg1FJ9izY6xDD9I3BrVV5hbns0VEV5ZrjVhwFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SowdUKey7pSyCtB0cv/KEtSI9JL4wu/jzpkN20z97/40lNWz3YS43BEZ+WsPP712D8nEbz0j+mJnbx1w+UlC/Tl5siUc9FUwB4VwM76cyhDfoUfwKfNGLeZtb/P4UdA2RqEWMzhNv6yLJR4/7A98xn5HZmRcMCNa1b7AtS10ZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oH54ZGAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459DkfFi020409;
	Sun, 9 Jun 2024 16:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hGdRGLBjpFozqNKWbB3thN
	ejwM99uKQmE5pOVTisNZo=; b=oH54ZGAukMJxfUCAg9H3UgfRGv4MGvjfW4jdHM
	ManqALFA465mKsFX7QL1klI50dTdLLtWlvRgDJ0YMHH4jU2sIAEWkzWXguTr8mxa
	/o9p7qHm7N67QdeMq2XyVLfEMf6ydFyOO8uP9gtrLKDIDJQvi4MpXpDJEj9tnX+a
	8W4eV8VULw9SIYHLr7tMZTeCzca6MqkbLtfmjZNXX7yIuvMlvIHdaxXOr0bPGKKR
	iD76eJl8YGq97pUo9NBrxAGybXro14NCHYt/1V+cd/lmNqqLW2TTJSkFGx4/uTSN
	ly/lNRudI2xqluvHxGiCuAhah8mUqDbjVTBrMERl4UFG9hbg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfcv1v0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 16:35:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 459GYxLG027369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 16:34:59 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 09:34:59 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 09:34:59 -0700
Subject: [PATCH] drm/ttm/tests: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-gpu-drm-ttm-tests-v1-1-d94123d95b4c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALLZZWYC/x3MywrCMBCF4Vcps3YgtiWiryIucpm0AyaWmbQUS
 t/d6OLA+TffAUrCpPDoDhDaWPlTWlwvHYTZlYmQY2voTT8aa+6YI0bhjURxWtb2M9baRloV083
 bIY2W/BCgEYtQ4v3PP1+tvVNCL66E+Ye+uaw7ZqeVBM7zC6uWBMaNAAAA
To: Christian Koenig <christian.koenig@amd.com>,
        Huang Rui
	<ray.huang@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dHidcDURqjcFrVOkfWh6rSxTRIaZq-Ci
X-Proofpoint-GUID: dHidcDURqjcFrVOkfWh6rSxTRIaZq-Ci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_12,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090130

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_device_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_pool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_resource_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_tt_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_bo_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 1 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 1 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 1 +
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 1 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc92..c18547c65985 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -619,4 +619,5 @@ static struct kunit_suite ttm_bo_test_suite = {
 
 kunit_test_suites(&ttm_bo_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_bo APIs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 19eaff22e6ae..5bdfa4f88438 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -209,4 +209,5 @@ static struct kunit_suite ttm_device_test_suite = {
 
 kunit_test_suites(&ttm_device_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_device APIs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7b7c1fa805fc..d9d29b34b23b 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -156,4 +156,5 @@ void ttm_test_devices_fini(struct kunit *test)
 }
 EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
 
+MODULE_DESCRIPTION("TTM KUnit test helper functions");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 0a3fede84da9..2d1928b615a0 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -433,4 +433,5 @@ static struct kunit_suite ttm_pool_test_suite = {
 
 kunit_test_suites(&ttm_pool_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_pool APIs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 029e1f094bb0..ade487fea179 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -332,4 +332,5 @@ static struct kunit_suite ttm_resource_test_suite = {
 
 kunit_test_suites(&ttm_resource_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_resource and ttm_sys_man APIs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index fd4502c18de6..d78e1e9896d8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -292,4 +292,5 @@ static struct kunit_suite ttm_tt_test_suite = {
 
 kunit_test_suites(&ttm_tt_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for ttm_tt APIs");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-gpu-drm-ttm-tests-f7b63f46eb3c


