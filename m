Return-Path: <kernel-janitors+bounces-3533-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 909278D7964
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Jun 2024 02:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DBD1B21317
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Jun 2024 00:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925B21862;
	Mon,  3 Jun 2024 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GtQviHh4"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845D625;
	Mon,  3 Jun 2024 00:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717375060; cv=none; b=Z2UJTRSgFfyZf8HQqvvXhKIYc5k5R9y88DAmK71ORgM710vbHbsjiA892VuvPvHy+vCV5OOlFs/JCY5hAEiErjWoUm+3Pdc+OdW9bwQmXheu0nDKcH663iMj7tvWxtsaIRRb6T2MPd36780Ubz3wsNnomHLO6k0xNPndqs8QkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717375060; c=relaxed/simple;
	bh=kdpFuQTuCSLNRU2EL+jLXtx8jipwlUsdIWkrfismr70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=FTdblHiiG42wfBLEbl6f7tagqUvKmuNWRtvXdBVwxj0YBPhjaTO3pLWdtFyK5T7tuJmmj7l6vqhZYNul+25ZyHxVMJ7rqc9Co8zaprxHchskKLk3WzdfDwWuUDm2PG1GeBxM1onlaaoIuO3IRN17sDGIxzTrgTgiSfoXOeZ5Kb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GtQviHh4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452NgCVZ029983;
	Mon, 3 Jun 2024 00:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gI23069akMvv2fLPXYYcSC
	TFV09EJupDQM5/X6eZXMI=; b=GtQviHh4QfXIpYC/XJTYu3uGqqDBP2fbEExWgT
	T9OP7YIdlxKV3H63+gq3RccikmQWrjzkIxczGEhHvuIB3H8w1Hx52RNKKY4+es26
	Qpj8ALOvEtDMuzd4XWsRUbozIjobUIpr4Y0CkJKf3wIm1TEgCs/5dJq8sLRXHp2/
	EoBzIDzBapY7YUY/8vy7MxW6fzk9vIFOfCecK0Cgzbg9LX/ShYMJm1NGk5f50Ser
	NFA/g2PTMT/UWrqGdO19rPElQBuhye/PB4qMZ/58zP6J51KgaYFbPqUhqLIe6gki
	0y/cugFGr6UGwoc5+Pz/814gdZWv9LKPAMl8oqBxXUgfZP3Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7djnw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 00:37:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4530bTpn029167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 00:37:29 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 17:37:29 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 2 Jun 2024 17:37:28 -0700
Subject: [PATCH] xen/blkback: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240602-md-block-xen-blkback-v1-1-6ff5b58bdee1@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEcQXWYC/x2MQQrCMBAAv1L27EIMwaJfEQ+bZGuXtqlsqgRK/
 +7qbeYws0NlFa5w63ZQ/kiVtZicTx2kkcqTUbI5eOeDuziPS8Y4r2nCxsVoimTscgzXkH3f0wC
 WvpQHaf/t/WEeqTJGpZLG32yW8m64UN1Y4Ti+leS1yYUAAAA=
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Jens Axboe
	<axboe@kernel.dk>
CC: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gIsLlGKjs2kiMEpeW4_9gb3LGjvCXwcn
X-Proofpoint-GUID: gIsLlGKjs2kiMEpeW4_9gb3LGjvCXwcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030003

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/xen-blkback/xen-blkback.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/block/xen-blkback/blkback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 944576d582fb..838064593f62 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1563,5 +1563,6 @@ static void __exit xen_blkif_fini(void)
 
 module_exit(xen_blkif_fini);
 
+MODULE_DESCRIPTION("Virtual block device back-end driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("xen-backend:vbd");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240602-md-block-xen-blkback-0db494d277af


