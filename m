Return-Path: <kernel-janitors+bounces-21-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B47DB442
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 08:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 637A61C209EC
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 07:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DD46122;
	Mon, 30 Oct 2023 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="tQ9jPywQ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF25683
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 07:28:18 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939D9A2;
	Mon, 30 Oct 2023 00:28:16 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39U3ei0K021240;
	Mon, 30 Oct 2023 07:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=k8xJjWrcWKXPldA9YKlYtBPXjtNfajVMGGZoYYMVxIc=;
 b=tQ9jPywQInbVGR86ivd5swz3k7A1h2+qRtTPL2Dj993FTsRuYTxxMVMVLPWyMhauCqAw
 /vznMOdZqrMgIXKWUqoV63LwAoFWraj5ajN67TCf4tl7RJ+8UwnUtLU/G4JVC+zmW1FP
 YAImSJFSjrOjONWM6B9Pek/YGWadOlW4D1p4A/lkaIml5n6vlFs7juGHqubdwxSy+oKy
 pQh4tLw/0YdX0IO+KrEoCSJSloBb8semuvH8yxqo1h3gDVgENyRqf40+XqiPrcL1yYPa
 au/886ZasuTfYxR5EoFE/xB2jU87uT4p9qD/DOelaxUojzyr9ed8uejjLMsdnh6vkFt5 sg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0swtj3qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:28:03 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39U73KFs029508;
	Mon, 30 Oct 2023 07:28:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rr48pmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:28:00 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39U7RxXZ029637;
	Mon, 30 Oct 2023 07:28:00 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3u0rr48pm7-1;
	Mon, 30 Oct 2023 07:27:59 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Michal Simek <michal.simek@amd.com>,
        Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
        Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH next] PCI: xilinx-xdma: Fix error code in xilinx_pl_dma_pcie_init_irq_domain()
Date: Mon, 30 Oct 2023 00:27:57 -0700
Message-ID: <20231030072757.3236546-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_05,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=940 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300055
X-Proofpoint-ORIG-GUID: wBOheiCvW2FrvX3aPqokHcQtzunkk3Yq
X-Proofpoint-GUID: wBOheiCvW2FrvX3aPqokHcQtzunkk3Yq

Return -ENOMEM instead of zero(success) when it fails to get IRQ domain.

Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is found with smatch and the patch is only compile tested.
---
 drivers/pci/controller/pcie-xilinx-dma-pl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
index 2f7d676c683c..52f3211d11cd 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -576,7 +576,7 @@ static int xilinx_pl_dma_pcie_init_irq_domain(struct pl_dma_pcie *port)
 						  &intx_domain_ops, port);
 	if (!port->intx_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
-		return PTR_ERR(port->intx_domain);
+		return -ENOMEM;
 	}
 
 	irq_domain_update_bus_token(port->intx_domain, DOMAIN_BUS_WIRED);
-- 
2.39.3


