Return-Path: <kernel-janitors+bounces-3919-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B070C9054D2
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Jun 2024 16:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627081F23453
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Jun 2024 14:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3817017E441;
	Wed, 12 Jun 2024 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RVlPVu6G"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D217D8BE;
	Wed, 12 Jun 2024 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201564; cv=none; b=aRNXR+eGydbJNSgxWApRPZbZPqn6Xn0dHTDtwFBDnXMgJaGIqFL9uiHExmKIDF73pJ44h6IvEVmX8WvZ9OoswTTsqzpn7Jw7ML5/KqwJ3yIupEjmFZpCMPAP5iTSuIuJvy0puTNvTwA9+GZC+wkKqoKGuM1Cu3jdapGqZYisKyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201564; c=relaxed/simple;
	bh=1h7oyWZtOlDIZIvEwGXdpgoBFJZDitp/SnMaJKTy7Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=GbRtsTmwDB5ULnCxeLNt5I7Ugf7vVTAyUQLkAg6FTe+JcQ9FDmLsKUd83IQKwkXYkl9/zxJ/xv/i+JEASK35MGbbs4lZeI7Pih+kT9Of5MyeTJL8DD30eBiSTmL39UhQnooe25UHm3ba0X6AHOhfjX0aFxB3J/KXwGpY8Bub/Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RVlPVu6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CDfxPV018718;
	Wed, 12 Jun 2024 14:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m0FmGfkNeKrMXUaZQgUR4Q
	N1A0zpT0OMtSwEyewWMhk=; b=RVlPVu6Gsy2fxTsmN7yw78lgLm6F89iuHYHj58
	9EPQDHabSythCMXwrn6S5VqQKCyOFpenkhrtXprNHS030yezFqTz8xRUlnAH2TMG
	I7yTO9QbPZojjhcITpw81ziMUnRxTvUkHXwIvCXfZ7VRc8vBYNIEM0vEr18Qm/Uh
	BcdvLKb5Oaw9Tq6E2lBqznBQlgfIay7lnKWMB4HVXRlk39soNTsGbhF44lIiL3s9
	yzBKu3el/hyG7fnlO02DMgOcndlIGJxQG0lJ4DAJm2CV4B791A5cNQ2D2ytZDY+4
	3JBmPp9+lthlS+Xq83w+nQh3YQa8yrtvsGiK9c0W5TUMz/5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8hbk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:12:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CECWGq010422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:12:32 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 07:12:32 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 07:12:31 -0700
Subject: [PATCH] backlight: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-video-backlight-v1-1-f4ca1beb36cc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM6saWYC/x3MSwrCMBAA0KuUWTuQxqDiVcRFPmMz2KYy04ZC6
 d2NLt/m7aAkTAr3bgehyspzaehPHcTsy0DIqRmssc5ceotTwiRcSRQrJ5ox+PgeecgLWucsXa0
 /m3SDFnyEXrz988ezOXglDOJLzL9y5LJuOHldSOA4vuR+X2aLAAAA
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
CC: <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2Srocz6UknqIcfJfrgXnSAhLzLIvGKlF
X-Proofpoint-ORIG-GUID: 2Srocz6UknqIcfJfrgXnSAhLzLIvGKlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=952 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120101

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/rt4831-backlight.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/video/backlight/platform_lcd.c     | 1 +
 drivers/video/backlight/rt4831-backlight.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 76872f5c34c5..b0af612834a7 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -143,5 +143,6 @@ static struct platform_driver platform_lcd_driver = {
 module_platform_driver(platform_lcd_driver);
 
 MODULE_AUTHOR("Ben Dooks <ben-linux@fluff.org>");
+MODULE_DESCRIPTION("Generic platform-device LCD power control interface");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:platform-lcd");
diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index 7d1af4c2ca67..c2f6fb29e1d0 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -229,4 +229,5 @@ static struct platform_driver rt4831_bl_driver = {
 module_platform_driver(rt4831_bl_driver);
 
 MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Richtek RT4831 Backlight Driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-video-backlight-2442e72a30d8


