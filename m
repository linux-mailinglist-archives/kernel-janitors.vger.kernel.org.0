Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D2675B096
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jul 2023 15:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjGTN7A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Jul 2023 09:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjGTN67 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jul 2023 09:58:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E861FD5;
        Thu, 20 Jul 2023 06:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFbeKVDc70FqWhtV+rMuZnDN1A2p4ITMKS8ASp/CnaTagYNTvQfDeMI0+EB8WRrmGXj2ddT9v1F7yGJkYkixL6Qkzb0MjV0TzgBtM5S4k66aSuTCRzen1QZZCR5PzMqP829eC/TlRWEm0mu815z8m9KazXZUJHWb+epjncBUAR+nfm4toy6uwQDhXwTBY2JeeZPt4eHFIsRzcWO9wPtB0BpgsbG3ihLh916rCnu6V0u7hQUsS/tqa4AcHCA1pd0OUE95avP23JU35/j9vDskSNNpPbNk84Y6RFdH2IPlEl1DB9xc8IhSg8ilpK53Fpy51GtBMOErwspZ8IxOfHNIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIq8aCCoA3TQSjzydgaNyrbVOC/I3BCrKZ3uPfhyYvQ=;
 b=Rgy8+lm24u9iDjCz47WC4TTUmRfzBUZFlabnV9uy4zGKr/YCTLX2tSue3yA8KH67Ouue/nBRn1q8EL6mD+tQvsp8IbghtUS8COBGQx9/+jCtNoxHPReX8qHcENGWHZsDxOmCAVYPQvTBOlB+5j7rTEj49bvaWpErbh/BNc+CffCCLgXm0XGr3RF4KzrpqSSrgiKeFrm7lFzGMCssjejJcjuJopyaeBkOfMsWvxYTtvhIBUa+kqCHPpmBIiDDtdcYXNOsEwmk0Cd7c25gJIo/0cd5HmF8z5wlP0gn6KYh2fMpMNEh28k6ePUyRIkNgfsX3YgFHXuJ4a5Z6iLOZ0cM5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIq8aCCoA3TQSjzydgaNyrbVOC/I3BCrKZ3uPfhyYvQ=;
 b=Il0Et/dbiv9K5Fk8+Gp5DcPGSg+Spogfp87swAHn1az38qM5EPkNO4GJgsGG+AuTOyblDmNtaQr/S0479aPdFb6lQAieqbdEScsZnZjdA+lMsWbeLyIOLfkWQK7tfKLv/emlWsqSwp0b7omuyphtDgF83NhudEAvSjJzS5WSu2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GVXPR04MB9973.eurprd04.prod.outlook.com (2603:10a6:150:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 13:58:53 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 13:58:53 +0000
From:   Frank Li <Frank.Li@nxp.com>
To:     frank.li@nxp.com, lpieralisi@kernel.org
Cc:     Zhiqiang.Hou@nxp.com, bhelgaas@google.com, imx@lists.linux.dev,
        kernel-janitors@vger.kernel.org, kw@linux.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mani@kernel.org, markus.elfring@web.de, minghuan.Lian@nxp.com,
        mingkai.hu@nxp.com, robh@kernel.org, roy.zang@nxp.com,
        xiaowei.bao@nxp.com
Subject: [PATCH v4 1/2] PCI: layerscape: Add support for Link down notification
Date:   Thu, 20 Jul 2023 09:58:33 -0400
Message-Id: <20230720135834.1977616-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GVXPR04MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 71571873-ba5b-49bd-8e3f-08db892973b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: US1OQTI+sn1/Sggz4hnj+ziy2sEO1sMJFRCxY8ZSyomNwGBK4ugTE1B3oUvd3/Np2XnFVPEkZP47CIHAcLpMARPfBxVx0fF0YCY4S6WTWBPtY84+MXFix47p2A+b+GtQfD7omXuzuJ6uKf0hBHfeOBQGczhENghqSeyRMxdSfgTW1oOhXxijlUYWDfQaO9EEQN6gvp5e8LkzW4d2W6kGjfjXPlNa/+QuqJ/Rj5d8yexjUerIIKoUdpgXXquy0N1Vv5suxyBxdyxkwkFAGHb3dWaqHVBbgT6mxeSAku7NYYm5A6AC0c34BvrQbNOiylU2Od5E5gygaasVctv9lM5vMhOoEWhZS9cZGS6IsULXHV06Cxmb7oT1zHuV73OaPqjrJ15tq0SSNOPBlu2HujAdDkIPNfqUUkkvViaA4cO7RQY7rqcyRYSmJwhux8RvPCBRSIJFowdZrR6kTgmBUnCYY02YAinCN6rbaBFcqYM67/4fC66W55G/nZsxsCwSOkskx14wjrKTBK59mlNNBTsSD7w/xSuoYjO9BOzMnBcAg0TPF1CIw0AiYO2e/BopLkUqkW2XJot4YWTvgupXKI+BhHnoYb4H+psgGMbwTtE1MU3oN+3g/te8sSwfXL1FT/aF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(66556008)(478600001)(6666004)(6486002)(52116002)(186003)(36756003)(316002)(6512007)(2616005)(5660300002)(6506007)(2906002)(15650500001)(1076003)(38100700002)(8936002)(66476007)(66946007)(7416002)(4326008)(8676002)(41300700001)(26005)(38350700002)(83380400001)(4744005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3BrVlXGiHaai3ark+suWXhE+cIKy/Vmo7ios8pXrr0agUFnM7o9EUBNwgv+h?=
 =?us-ascii?Q?+RmI6oH/8u1tL1PkYn95hH7xkFxhyMzKBUgqux0T3Jrvhobtz+HVTKElPYHm?=
 =?us-ascii?Q?C1+0C+q4CuKwQKWC3WBAN6qDfHY2/1xzssWAeMeIWt2KFyvRUTOTxXimZCpR?=
 =?us-ascii?Q?7uDD8GuxBYh9NbkDLPvfvk+a02ajT1lkL9vV4/S2gIG4e5GAzjS/mVcqI9oI?=
 =?us-ascii?Q?DJGhjX8PUAjmt4lBEf6qRydC7mqqrOCPLDvdbJkHwSuGoApuoqgiA5XuBSMK?=
 =?us-ascii?Q?KH63qj7gm4Vgspwx/Yfy25MBf1n6sq1hGVPayJZnS5XmCIDTKIxUg2i9cZvo?=
 =?us-ascii?Q?x1a8l6U+w3mD7WzSSzzRdDshaPJDLFL6ipGPzp+A8Xa6+cb3e/1LyCrr5Eod?=
 =?us-ascii?Q?1qpBfbpio+s9duRMR3oefj9wXFQEL3uPCcP6KRw3XFDWEGqg3zov1aTAE7tB?=
 =?us-ascii?Q?YbqXHYeV9vTyxCpjnPNPu7MIS/VS8eosu/DA/SyePMfwv9OnBiGOyXChZt/w?=
 =?us-ascii?Q?7dv90mj/OGyNjqsUllQPs3nWHN27xspXk7BNfDiXH/eGVexmjKowCwCendtC?=
 =?us-ascii?Q?mOhX0u2asFW6mWdHEplsOrWCdLNS9S+WJw9HeES/xrHRMI1KOrMmGbB/iNPZ?=
 =?us-ascii?Q?aHygyMNdzb5FVYtnRZXo6oefIFVHEmrut3zTyA5HYJUsvGqSKYI0uaMRqKC1?=
 =?us-ascii?Q?CJfSVMzbM0bXAzK3z9usxDlUAYOjwyVLTwQyP2z/3Cwy/ZplGHysKwiFvqJz?=
 =?us-ascii?Q?6grt0PQJTNyZAQnh2TPVXN+Ce4GHYiq1ggnjrgwRwAtwqGut2JXR9cdMr3WB?=
 =?us-ascii?Q?Fz0dPT3rtfrFCl7P7q2iujt8pi0qdsxPnQqlKGEOvS+A98cjNM+BmIqJvyrj?=
 =?us-ascii?Q?ftrIq40xo5QS4X0xYndp2tWmCgg0r8dt0Eq+mQJG9xGomDvFpILXjvPIoZWU?=
 =?us-ascii?Q?FOrooNNZWJdlBk4wxCDfG9ciCRJ453J8rb0J5EKoIQgzXUxFry2vJ25q3QWw?=
 =?us-ascii?Q?cOLJopZw06JKeHfp5DoYWHIXlseZIHpNJaAgX8AzJYB08dirTv4BJCs4wFgH?=
 =?us-ascii?Q?c50Tfz+NT/Li5ijxp7M5wjWa1jOtaPMCRwEHLr8ZtuU/fXvIx7QSBByGxUBJ?=
 =?us-ascii?Q?IvwAxrdwtyTTxLs4hrSQgPFhIQWYDndoRd9bC2sATWeSFFjlnIN0MAtUqH0T?=
 =?us-ascii?Q?dkERjljmILWSnbVj+WDctiCb2Tc/KiMpVVy7f4SP7eTAvCM1Bm8dYvx3XlSg?=
 =?us-ascii?Q?SejL1UQPlWuvd6yzh8PC8cxMxNalgXDkdPf5fW5m5Qa9qii7Xean+g4AHwOV?=
 =?us-ascii?Q?Frw4sDgSTeRdXVXp9CLg+dvP7evpVKmpcR/mlHH5136meCMatEx7W0gYh+fr?=
 =?us-ascii?Q?i592rCvLZ2ufGVRgwM3DNZspYUgsO6EG3ncoNK8/t1OrnmVD7Qbm7WigKDMl?=
 =?us-ascii?Q?4brh3dCkQCnWB2er9lPAJqqMhMyCZw7kKZFCEByuzuaxZQTAnL+/aU+PXr7w?=
 =?us-ascii?Q?gTS7sKCeLVCT8fIXby6/WgMCSPAnllFB84m7xTFveE5Ze5Qag/jyr9y5NE54?=
 =?us-ascii?Q?awVXPjMKPeTO1H3kWzU4Ke3JiyoEqZJDeaLBBy7s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71571873-ba5b-49bd-8e3f-08db892973b5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 13:58:53.4104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkZY38MRmpGUYyyOOYLaM8oy4Rc9D9kZO1xpNFGmp1dR2EADGlD3kEVZauyTEtb1lWcCNx3iWiruvSs3KVKNTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9973
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Add support to pass Link down notification to Endpoint function driver
so that the LINK_DOWN event can be processed by the function.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v4
 - none
Change from v1 to v2

 drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index de4c1758a6c3..e0969ff2ddf7 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -89,6 +89,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		dev_dbg(pci->dev, "Link up\n");
 	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
 		dev_dbg(pci->dev, "Link down\n");
+		pci_epc_linkdown(pci->ep.epc);
 	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
 		dev_dbg(pci->dev, "Hot reset\n");
 	}
-- 
2.34.1

