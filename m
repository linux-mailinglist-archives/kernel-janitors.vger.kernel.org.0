Return-Path: <kernel-janitors+bounces-4003-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FE907D0B
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 22:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D0F28188A
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2024 20:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD1B136E1C;
	Thu, 13 Jun 2024 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J0Uy44ZF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABF12FB09;
	Thu, 13 Jun 2024 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308806; cv=none; b=Wkmy8rcRjedgUrLeeq9hD6YP9SputjkJafAMjWw5Jo7grbbAuBxTxf7eUetUq3U04Hh/d1P9PCMuEyrbqnP7nio3xVYgK9Fw/9E85ljtKCC9TRQF5koxzrUwvv02eGhgVHfiDjHlUd0QQm+ytT009C24mxODqnG78Age8quUir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308806; c=relaxed/simple;
	bh=QfID5hH/PkIT9ghl2FsLukPWoI6/GWyrQRFztZF51zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MciTS2eO4dCd0ixVQONEqEckJ6e6BLQzZSXPgUZv8F1lUJqNw51u2/rNlYGeQ+nQvYVrLE4udgGGzNoHq6sWUapsNmaZEfUTjmQJFZZpCaHCf5NwAG48B/o/ePFmIQIbOrUAuZAvs1dw0MPHxzqTjtqT5fkhtLpFO2QTK6nCMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J0Uy44ZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJGLxq030412;
	Thu, 13 Jun 2024 20:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vKXbtEWcBNbYUqVysHrxXn
	FocFXdPFUqQvwvnRSBtKY=; b=J0Uy44ZFyWFX+WA98S9UmCol8En00v1lXFB58s
	Vrr/p7ow7D2GGAFNogJMgWJlqgVygk1eLPwh3NKHVlNT/ZF/BypxXJr97gq51mp6
	lX5KNqC3eJL0E9g9b3zqZFq+aoOTUOvbWbdnvWDH2cs1L1+NjQ5C2XUBdTlsG0jA
	kafRjsnEI1akHLqRszfpiZpO3t6FFGBZ8P44qoq0T/4ZdWBabLiqD+dkdYbofH+Q
	xqKxLrUCY2DQRbqRLvxU89q5PiJFhgdmF9rANFA0R3qFzDYyZz5Z++CZorVMyKy6
	LHJf/j06zivWZBThOq+o8SKkh1S6R/vCtGpoxhon4ZO8HUfQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q384ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 20:00:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DK00uD012943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 20:00:00 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 12:59:59 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 13 Jun 2024 12:59:59 -0700
Subject: [PATCH] regmap-i2c: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240613-md-arm64-drivers-base-regmap-v1-1-222be554d520@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAL5Pa2YC/x3M0QqDMAxA0V+RPC9Qrcq2Xxl7SGvUwNpJsokg/
 vs6Hw9c7g7GKmxwr3ZQXsXknQvqSwVxpjwxylAMjWta19ce04CkqW9xUFlZDQMZo/KUaEHvbtf
 QURfH6KEsFuVRtnP/eBafbVDKcf5PX5K/GyayDyscxw9O5tuyjQAAAA==
To: Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KNTixhFyTLqXPtbJaSUiNQAkXVrVZbI1
X-Proofpoint-GUID: KNTixhFyTLqXPtbJaSUiNQAkXVrVZbI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_12,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130142

With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/base/regmap/regmap-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index a905e955bbfc..c9b39a02278e 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -397,4 +397,5 @@ struct regmap *__devm_regmap_init_i2c(struct i2c_client *i2c,
 }
 EXPORT_SYMBOL_GPL(__devm_regmap_init_i2c);
 
+MODULE_DESCRIPTION("Register map access API - I2C support");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240613-md-arm64-drivers-base-regmap-3098b5a5cfc3


