Return-Path: <kernel-janitors+bounces-4708-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8A931AFB
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jul 2024 21:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B2E3B21CD1
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jul 2024 19:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CAB137930;
	Mon, 15 Jul 2024 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m5F9/jQi"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56905131E38;
	Mon, 15 Jul 2024 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071638; cv=none; b=UrSYMO17EOmlty6T+V6uyJ9yqGIxf4SBDRtVKrPs6P7GjH8/jNZyOzAqry7KPbtVdYhhCGoR3hYe/WdWfOFI6j7mM2oy1qZjle3sW09FlUeF0RKdR0YQqHqcGIR5LJNCLat1I2mTgy6VyjRPDpfk4Wj9wlfogmtoOQwCuSzUbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071638; c=relaxed/simple;
	bh=Od/7R+7To3lklhe3axz55KltSN7STkLUfBM0lBheQFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=aBEE11NI/vRpwPbey+dmfmEr6GiKDcwDbHBvrkmGPUlkho3Uc9JIg+TDKcs0y0aOa6W+8SBLZdg23SVwzkUKZg49AV5nCT7J5ClSKba2BhbBhhny5bXVrc9Ouk0O6q01cGTRYoXWWLV8vUMb9FKZEwRCow5755Yy/yP7Cdo+m08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m5F9/jQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FH8uNa009494;
	Mon, 15 Jul 2024 19:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wG9JuMtMhBj5ZcDWoeNk/P
	F8owwW+73HInnokRoUMoc=; b=m5F9/jQiXRF8RxsAe4S5Xe4cjV5QA4+LIJIgPZ
	mciIXnEtZjQUwZSK7XSzRoq0vmHv8N1fEX8IWRparCatrXfa/t9o8eCAMZzgp5tJ
	FVK3vxzhVPSm8sKl7nC9RQ/2TLL2hkEsWn9SWeu5aWoun9tCtno2pGlEfJYDqWYm
	9ibviJ1rkGWQPGh3tUMu4gMhq+Q7ghslmzp4MXBjZnWJtNkMOzKrod9XmaMx7S03
	/gVsjiyFaYlHwP+It8IwcqMsNM0P4Hp2Y97BywVAfhnJHuS+/zqip7XCwx0BEHVi
	/1cJt0RA+X1H8Bw/rZGna6UQn7jKZbO3QOcD6qHJGZDHREYQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bexndc47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 19:27:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FJRB3O009629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 19:27:11 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 12:27:11 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 15 Jul 2024 12:27:09 -0700
Subject: [PATCH v2] vfio-mdev: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240715-md-vfio-mdev-v2-1-59a4c5e924bc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAx4lWYC/3WNyw6DIBREf8Ww7m0EfKWr/kfjAvBSb1KhBSU2x
 n8vuu9qcpI5MxuLGAgjuxUbC5gokncZxKVgZlTuiUBDZiZKUZW1kDANkCz5nJhAdty2lbZdazn
 LyjugpfWce/SZtYoIOihnxmPkRW5ZYVJxxnDUR4qzD9/zPPFD+vOTOHComrYxQy2F5uX9s5AhZ
 67GT6zf9/0HHJUUyskAAAA=
To: Kirti Wankhede <kwankhede@nvidia.com>,
        Alex Williamson
	<alex.williamson@redhat.com>
CC: <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XAz8szs6q0CFL25pzXQQq0k63H2VYoRv
X-Proofpoint-GUID: XAz8szs6q0CFL25pzXQQq0k63H2VYoRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150150

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. The following warnings are being
observed in samples/vfio-mdev:

WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o

Add the missing invocations of the MODULE_DESCRIPTION() macro to these
modules. And in the case of mtty.c, remove the now redundant instance
of the MODULE_INFO() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Of the almost 300 patches I've submitted tree-wide to fix these
issues, this is one of the 13 remaining. Hopefully this can make it
via your tree into the 6.11 merge window. If not, Greg KH has
indicated he'll take this as an -rc instead of waiting for 6.12.
---
Changes in v2:
- Updated the commit text to more fully describe the problem and solution.
- Removed the MODULE_INFO() from mtty.c
- Note I did not carry forward Kirti's Reviewed-by: due to this removal,
  please re-review
- Link to v1: https://lore.kernel.org/r/20240523-md-vfio-mdev-v1-1-4676cd532b10@quicinc.com
---
 samples/vfio-mdev/mbochs.c  | 1 +
 samples/vfio-mdev/mdpy-fb.c | 1 +
 samples/vfio-mdev/mdpy.c    | 1 +
 samples/vfio-mdev/mtty.c    | 2 +-
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 9062598ea03d..836456837997 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -88,6 +88,7 @@
 #define STORE_LE32(addr, val)	(*(u32 *)addr = val)
 
 
+MODULE_DESCRIPTION("Mediated virtual PCI display host device driver");
 MODULE_LICENSE("GPL v2");
 
 static int max_mbytes = 256;
diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 4598bc28acd9..149af7f598f8 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -229,4 +229,5 @@ static int __init mdpy_fb_init(void)
 module_init(mdpy_fb_init);
 
 MODULE_DEVICE_TABLE(pci, mdpy_fb_pci_table);
+MODULE_DESCRIPTION("Framebuffer driver for mdpy (mediated virtual pci display device)");
 MODULE_LICENSE("GPL v2");
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 27795501de6e..8104831ae125 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -40,6 +40,7 @@
 #define STORE_LE32(addr, val)	(*(u32 *)addr = val)
 
 
+MODULE_DESCRIPTION("Mediated virtual PCI display host device driver");
 MODULE_LICENSE("GPL v2");
 
 #define MDPY_TYPE_1 "vga"
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 2284b3751240..b382c696c877 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -2058,6 +2058,6 @@ module_init(mtty_dev_init)
 module_exit(mtty_dev_exit)
 
 MODULE_LICENSE("GPL v2");
-MODULE_INFO(supported, "Test driver that simulate serial port over PCI");
+MODULE_DESCRIPTION("Test driver that simulate serial port over PCI");
 MODULE_VERSION(VERSION_STRING);
 MODULE_AUTHOR(DRIVER_AUTHOR);

---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240523-md-vfio-mdev-381f74bf87f1


