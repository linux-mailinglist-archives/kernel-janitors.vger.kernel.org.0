Return-Path: <kernel-janitors+bounces-4785-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B702939308
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jul 2024 19:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CDEC1C2101E
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jul 2024 17:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB53C28370;
	Mon, 22 Jul 2024 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="djbMJbL9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8275716EB58;
	Mon, 22 Jul 2024 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721668501; cv=none; b=uz5LRupepc5lx1xv7ANLSuIuy7hvZtZ/EskP0JjaIMG3rsq4pBhfW00N8kTrEUzMJ9UCUAIkE/jTQDFwgH0RMFv/61G7lYevuoBLuzHHE6N2zqdC3GvO31AhcOkNc+kKDUePVUP9zsP9SkZ3CzgkIXmlkYMNjnL5umBKjJ2ZJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721668501; c=relaxed/simple;
	bh=txky++HVzek3k5qMTEIxRzRys85RHmGx5x+kEiX6lsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=S2+QxhkCdGGdCnu/YgY4PsPv5Ms843nloFDKnPs5quGswz6bYVNYpXSLQedoYn3Za0ooL9t0B76oIe/D9jnSpIChYWPCgvbXg0QNfCte6QRwTV2YbTZAyoTAUrLuS1XTZBtAkNJZFig8Ij+Vi7khs/wabvRPus6RY8Q71i/trGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=djbMJbL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MAnGu9016652;
	Mon, 22 Jul 2024 17:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DJuEf0+ffGnn080Fj8jr6M
	4q22Ojwqr9XmAvJUN0tcw=; b=djbMJbL98VL/INNvjMmJltsn1RzMovYvqBlg7J
	i1VEGSRVzjC3TToXfs84+TmpnpDlv0wJ6K/7WzzotKWZzOxlAy8c4OIm2y6VxfZZ
	tyt4fqlAR0YINb9E6pZMjAHjc12Y9NBK01lULioiNEXiszkt36Ofjc+pbfXKPeHb
	O4prrhC7DbfvSQqokjBAwobdApk7elLCWt05s7NC8NFnK9j40DJhkFwBqBJdIPLQ
	2UeDDtkc9Z2XSHJWAT6GhtPy95AgmuDUBwS/lIA9LM8Ph/UMjckjHNAyYF/y3at3
	2VreLE4twYGchrxER9B2yBB6TtOj/y1YjEwi8gs88iRt9VVA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5m6vgjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 17:14:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46MHEY69007338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 17:14:34 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 10:14:33 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 22 Jul 2024 10:14:32 -0700
Subject: [PATCH v2] cpufreq: powerpc: add missing MODULE_DESCRIPTION()
 macros
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHiTnmYC/42OQQ6CMBBFr2K6dgyFisSV9zAsSjvIJNLCFCqGc
 HcLJ3D5kv/f/6sIyIRB3E+rYIwUyLsE+fkkTKfdC4FsYpFnucpKqaC3MPgP8mDAMkXkAGaYW8Y
 RSluoK6pKlgpFEgyMLS2H/FknbnRAaFg70+3KN7l5gV6HCXmPdxQmz9/jSpR76a/VKEGCRZUVy
 la31uaPcSZDzlyM70W9bdsP5VQafeUAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar
	<viresh.kumar@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Nicholas
 Piggin" <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lFISRuN1Pb2YJbtbhedmbtS_Q1m3UrZf
X-Proofpoint-ORIG-GUID: lFISRuN1Pb2YJbtbhedmbtS_Q1m3UrZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_11,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220129

With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

This includes three additional files which, although they did not
produce a warning with the powerpc allmodconfig configuration, may
cause this warning with specific options enabled in the kernel
configuration.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Per Michael Ellerman updated maple-cpufreq.c and powernv-cpufreq.c
  descriptions
- Did not carry forward Viresh Kumar's Acked-by due to this change
- Link to v1: https://lore.kernel.org/r/20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com
---
 drivers/cpufreq/maple-cpufreq.c   | 1 +
 drivers/cpufreq/pasemi-cpufreq.c  | 1 +
 drivers/cpufreq/pmac64-cpufreq.c  | 1 +
 drivers/cpufreq/powernv-cpufreq.c | 1 +
 drivers/cpufreq/ppc_cbe_cpufreq.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
index f9306410a07f..690da85c4865 100644
--- a/drivers/cpufreq/maple-cpufreq.c
+++ b/drivers/cpufreq/maple-cpufreq.c
@@ -238,4 +238,5 @@ static int __init maple_cpufreq_init(void)
 module_init(maple_cpufreq_init);
 
 
+MODULE_DESCRIPTION("cpufreq driver for Maple 970FX/970MP boards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index ee925b53b6b9..5fc9cb480516 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -269,5 +269,6 @@ static void __exit pas_cpufreq_exit(void)
 module_init(pas_cpufreq_init);
 module_exit(pas_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for PA Semi PWRficient");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Egor Martovetsky <egor@pasemi.com>, Olof Johansson <olof@lixom.net>");
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 2cd2b06849a2..9d3fe36075f8 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -671,4 +671,5 @@ static int __init g5_cpufreq_init(void)
 module_init(g5_cpufreq_init);
 
 
+MODULE_DESCRIPTION("cpufreq driver for SMU & 970FX based G5 Macs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 50c62929f7ca..bc55723b4d87 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -1160,5 +1160,6 @@ static void __exit powernv_cpufreq_exit(void)
 }
 module_exit(powernv_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for IBM/OpenPOWER powernv systems");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vaidyanathan Srinivasan <svaidy at linux.vnet.ibm.com>");
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
index 5ee4c7bfdcc5..98595b3ea13f 100644
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c
+++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
@@ -168,5 +168,6 @@ static void __exit cbe_cpufreq_exit(void)
 module_init(cbe_cpufreq_init);
 module_exit(cbe_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for Cell BE processors");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");

---
base-commit: 933069701c1b507825b514317d4edd5d3fd9d417
change-id: 20240614-md-powerpc-drivers-cpufreq-6d345e48164e


