Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE235A9BCC
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Sep 2022 17:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbiIAPfr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Sep 2022 11:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbiIAPfp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Sep 2022 11:35:45 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA046F56A
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Sep 2022 08:35:43 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281FIgfF028411;
        Thu, 1 Sep 2022 15:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=k3jhOi/18aqXzObtn/UvjH1Vjp+lrALC3R1MFoWRLIk=;
 b=HSqO1mOCyzjuJX9MEYDOVD1AdEd2ddoCQCZJxoYyPgNraY34bcpCZxrCFKOMhIbzg/ex
 9EnHztMUxgyewaO3PIJvSqLfDrMYu8mK2l8rFiVZzEbRsqWYR2NeyKABXVqMLZ9LItzl
 S9INAOmo3bEMAW3KSR2nJZh+ocGejzFsKlWeEJnsTg/+tNcNbEavMMXqBiCMFAqDPAaz
 pGpE42Ics+96OqzQvdmcREJGQr/RUJPLAHnh5RBQ4qEajLWtFg5e6yJaoI57O5dREJQP
 X10GVEHcMqfmQuXfWMtR9fRjTJl+Pkpx7DpVoMg+Tch67pCIU6pc+741+w4Zejh4swm1 FQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79pc49nb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 15:35:31 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 281E1TW1036927;
        Thu, 1 Sep 2022 15:35:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jarpb6jyn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 15:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iecDb0ZbHR0gPXmS1viD1Nw0QW+2ArTkrHcjfMOuZbdVu0GEX7d5RlBkvcMEBB/dXc1n4zIWJy5odyRsKojgh0JKZtFXxxGEiZW0xW8u81p3lT+wqwASWXH31J/oaCyAMOWzpCBOY970AW/JXoEaE/znfYYI+udECLLmoKn9Pelp1nmZQJtziMOqNqaWddI6WoA+KxPb8HrVKaD5tPIzpXfaFxZJWuOa7OuRjsdQSXPQZtkCcak7wZ0zYt3DtqykKQR3SbnhEx/keBV8Z7Sx0ZFPmrIBROa+w3oQ8RSgLo+dvVDT2pEUKkXUWyq4oEKremXyfRRYhjPc911wwnEMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3jhOi/18aqXzObtn/UvjH1Vjp+lrALC3R1MFoWRLIk=;
 b=BrYkeh+8x/FnBZPYgICsZelEnu3wAwbY2i6nZx9I1+iaF4kN/kcmfPL+MzRrZeTxlcDksHZMpvxgdTDJLk+KFTRoIyf4Si3ZUwt2ph8knp1BlnF5RqL4/ORsugA0C6tYk80pqbgUEHgrNtTJBbfa/DEFnCc/OVFIsFm8oO3MwuBeh9B9KEYLLKWRBWQwn72HsipYZ8qDzSUMcBZyOJeOF6vqA4oRjuOQxvC9UsyeiLY8fGsyI5IdZoLMUTYxySSKqrwmLBSpCFnkAACSOBrbp8N/cJbxKQox8Mhj6GJYWpVKjdyRlX6Agrvn6zXGZe4NbvjeTmbQqmaWGItlpCMAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3jhOi/18aqXzObtn/UvjH1Vjp+lrALC3R1MFoWRLIk=;
 b=MfMFIaWq1dZHp6MhDWuOBdf0xGewH2sfuDlwKb6cwhNuFe9Kfd+VKnij9dUyq2p4NC4vu/1ugYUPM+97E3OENfSvP/k1nS/uXGE8Kehon4Iw3BDjwHU0SgD3/BTTkThCieoRdNGnNVwaOsa5rbLR5w3lviNu6itU+PpfWtk4pUw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS0PR10MB6030.namprd10.prod.outlook.com
 (2603:10b6:8:ce::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 15:35:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 15:35:29 +0000
Date:   Thu, 1 Sep 2022 18:35:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/grants: prevent integer overflow in
 gnttab_dma_alloc_pages()
Message-ID: <YxDROJqu/RPvR0bi@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77eaa148-93f1-48ad-e950-08da8c2f999a
X-MS-TrafficTypeDiagnostic: DS0PR10MB6030:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMEBtgElVZNcTC7vK2IGsTdnLdfXnTJles9buPnuiDfGSyW8R/eHx7lUva+HROlYB2/3uctLeMIhoS1y06/ztu3BCuZiQTmiCzwH7jZPVx+yTtLax5Gxe4pc3Uh4h7DmJlwFgAHCwlVcxAFmxvI5vOZfiwe9RfCCaq6Xb+mNKzpeXH8YHFYnY0MTy9hBMjwBMdmA/qR72rF+JJYxQsUbAGXG1DLh2HYSBmTL8rEF9LptGkHLJqAnbpqNNMm8cUDBA5SHUHWMpnWfnCZD2EGhu3KWGOuIrh2U2UphGNc3XLwk+vtJ+iyX+ItW8SfUgmdO+WAXjlX49jVPRitOoQUVDdMEWfsNuP7K4WUGA0sKhHqLJQBO00ESKz+aIBcZFFHhUUfTIVgeKfQe035W8ZaFmJX3/kd3xdMLWIZ6vp78RdFojEYp/1NMqRg50jpgEhRLlkrB2QMgdllCKU5RNnohoawtb474xPkfsPk+FIvVfOw4L6PfcYp1S92h1dPhmgRUOFIWL1cJb74nmTL3920tbBbovT52s6TaKqBh1eQebE7pfoS5SslHnQyP0rVQlgPR7IPDR3ayXZ1VsZHY2ofjat4+0O5ggjED1M/QIK70ErXHYZyXU6dF2s9/iYCnE945gMgXhU3BlaoOVpPFvkM4A/L52OJDHa92J9g6sXMDOLnVlXQCkjvxv0eVJZWUR2dcGHYOwsNI8p1xJ2icMjZNvJX0qO/eBdFP0ebhNHUrab3bdQmyfMom5sib7fIZci7YOS9cq5tzLbFw5i/1XZcEBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(366004)(39860400002)(396003)(346002)(376002)(6506007)(33716001)(66476007)(66556008)(4326008)(8676002)(6666004)(52116002)(316002)(8936002)(6512007)(26005)(86362001)(478600001)(6486002)(38350700002)(6916009)(38100700002)(54906003)(41300700001)(186003)(2906002)(66946007)(9686003)(4744005)(44832011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wqq5pH6n1jT5FpG05kp42IfyeWga2HrVWYvd7L3Cq4cUzpa/Sf8jXcOSW47P?=
 =?us-ascii?Q?a1oFz1b3JylFHsJZ4/KSnhExzbG3iIX3mYmbvYECkK4Q3w1vEIlMQ+SDMtby?=
 =?us-ascii?Q?BS5upisidMAlUo+0LIiOTmclMcV/OHGxfUOmSHxh1FFJGFJn1ubMH/lS7XkA?=
 =?us-ascii?Q?B1Z78jS+76KXCKitSPSpp5yvCGfcMSNstkvFgWDmtsYlJG+8aRptBa4Pl2uq?=
 =?us-ascii?Q?InJe0f/3PASjyBOzJ08NS8z0KMtB95UHXkdrKCHwgj4iKsMpKvVcZRxzBHfM?=
 =?us-ascii?Q?JLQqu8L7Rsdx5KIPptCjZ7ZRm0YLC86XAY0+oCZaQFeAKXfQyfoTxlNwBqmC?=
 =?us-ascii?Q?+yEjy5p2CaA2xBvHl4WW0rEClaPOCHf+aY5kf7DhAy9oxCTExH4kVOB0diNQ?=
 =?us-ascii?Q?qglsLpXqcDga9bZwcpgFqlD6zcXQRT578XaTspnb+4I32165+rSW654wBhjE?=
 =?us-ascii?Q?ryq8FGAraizMVstBKkvow8a3WTFxEwpwMUfXK1c14WiWZufIZbOu+9ds50B8?=
 =?us-ascii?Q?2VMpH5UzBclTouIm5OLEfDMmS43WcXKOVsC3L7bQkv0Si3HfaujTGiFif+Ue?=
 =?us-ascii?Q?v+B/6SmDG0E/Yy0VHnIWyGJ9EiY7X8ABlK3osFLHzcqN+RujFvC1EAHrF/KJ?=
 =?us-ascii?Q?htZVh1nYVCcbKjvIIbRKmc7ekycdc1bJ600EX/a9yM+j2G6ziTU+B1FDbHUX?=
 =?us-ascii?Q?dTjtIp5VEYVVIosGYrTba2wiBOr5NmoHB+PIcu6iWEqC7GBqeeRITiGKT3k2?=
 =?us-ascii?Q?D848WrIWIm6FcwElghgErzWTOSTkdWSYM2obM3CI2+nzX2RUVN9kyj6TODsu?=
 =?us-ascii?Q?0/XQa2xNSvq8IqJM0IQQZaMAXNvX/1w6EQmq+skWv8fQkFn6q4fPeRBMDcNm?=
 =?us-ascii?Q?7B53eq0wfw0rJ/hQF3gH+q9JAzv2RwhS5YqEQMmZlMKH6QQNg7unEooU9+aQ?=
 =?us-ascii?Q?wGT5piQmicdXxe4EfM1UnZznx5ovn4LkumvpbOsgjkNy5UpU8DKEG3Dhwqpq?=
 =?us-ascii?Q?8vSMilLIL6NZwp65i0i1OjKQWOFYOA0ngVTZCXHdHttnc0dPwXs3hl5sC2SV?=
 =?us-ascii?Q?7JjkZA1nYqDR/Agw2xKpEgVKaaEaKKtRVO9PrtqUyHoNz00RTwWcBFUpM0Wy?=
 =?us-ascii?Q?HTo+vDLFdBx6whteautV8ac3UO9j5o5V4qoLzFF45b2ZOIw1SembGMRyi5UJ?=
 =?us-ascii?Q?V+y1DNJMFsCTSo8vcZHyvJ9B9/KFCqnpBkyFfVlp0WNLIROmu0rTw0hsusKp?=
 =?us-ascii?Q?cSSaefDyusjpDmK7SojNbBTi/4GkVSnOpZYf3bTzZOc6BscAgFKDX4W2VXph?=
 =?us-ascii?Q?lBdWWum1xJAAXYZNToYzaBidWECBgnt74s6jiBufgAF/IZ4uLtydl7qvZfcS?=
 =?us-ascii?Q?wXqtaYoRYph+Rl2PshrC/kU4YshxptaUR+LLUx+t4aEB41kOGYyte1sja7ZR?=
 =?us-ascii?Q?JNKMhPLQLcofHn6kDvLXkplj+km9o3ojM//VQxjy7J267LFiRGA0GdxgrtE/?=
 =?us-ascii?Q?f31o9PHcdDp8RLSK8d/rehnFlval3FlsNRX1NyIsXweSLZon5FbOyRYtQXHE?=
 =?us-ascii?Q?IdWGUi7bmcbQpqe9YbGb6zDk+MScoIYfaaw73DPJeBrIDjR1NyxNa75x68I/?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eaa148-93f1-48ad-e950-08da8c2f999a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:35:29.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRUbNFHeRBDsjfn3i3hC7aUv3/Xzwx6qQBYgAPHQjgs5I2tFEf5c8fEccMLAqVOcopX9bSCKJ5PQxanHMdtxpS3T4mNGBAKV9Pylbjc2bZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6030
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_10,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010070
X-Proofpoint-ORIG-GUID: xivjyUq_5x4pYqFe-WbC4hN2Nwk1Q1ar
X-Proofpoint-GUID: xivjyUq_5x4pYqFe-WbC4hN2Nwk1Q1ar
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The change from kcalloc() to kvmalloc() means that arg->nr_pages
might now be large enough that the "args->nr_pages << PAGE_SHIFT" can
result in an integer overflow.

Fixes: b3f7931f5c61 ("xen/gntdev: switch from kcalloc() to kvcalloc()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/xen/grant-table.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 738029de3c67..e1ec725c2819 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1047,6 +1047,9 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 	size_t size;
 	int i, ret;
 
+	if (args->nr_pages < 0 || args->nr_pages > (INT_MAX >> PAGE_SHIFT))
+		return -ENOMEM;
+
 	size = args->nr_pages << PAGE_SHIFT;
 	if (args->coherent)
 		args->vaddr = dma_alloc_coherent(args->dev, size,
-- 
2.35.1

