Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDD1567F46
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Jul 2022 09:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiGFHC7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Jul 2022 03:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiGFHCz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 03:02:55 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C225620BEF
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 00:02:48 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26663xkS009604;
        Wed, 6 Jul 2022 07:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=j37b72CZrvUV/MFjMeoH+zmV1NaLmtwmUjmUdBheIJ4=;
 b=D4tyUpLLnY9vYiwYz/G/47rUP4JKGAz7kH/5jKM1j7Q3DGCIN7z8YK5wfwtOvongnBuJ
 2TwJETB9UbCKkp24Y0UDGFi17w2VFvUQ6wvZTOQK3QOABFqnmvN5TSN9qriSuewX9kD4
 1NHT0mQVyv3KV4A/Dd9N1dp0uXZiVY3VUDyitl/77FUj/17F5agOUQ4MfaBIH1xkD6OO
 0pfFGtjBdZVpeC6tGR4loTnioylN23J/2m097MoqPOl/kUiowyLoIFEdwa/J7501miSh
 qCjS0F3EjJpdiFN+VkZhmFwf2XmKCkPnhmQztUb/nqkYXzGttqrO/usU+02R+eGwCD7Q QQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubys1mg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jul 2022 07:01:37 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2666fk8t010875;
        Wed, 6 Jul 2022 07:01:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h4ud5je7e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jul 2022 07:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHPg5H8m0rIk/y6mXAvGLylPxUxJhIzqX1o89+hCCUbcbDByd3LUybUGSysfqxsgE3ZonixytuAxO3lAJd/1PVNPHnFpwH32QBBMsCK4xu0lMmCMHIbHPFUiC52LCpWmZDIcZBqIDD9ujlEBHcjiLp3fMTqsLmSBO9PniQoT/Rm0XGWFupUzQPeVcUjgBFPMLbbJNIc/pckudhJviMVoTmvnOBLhLLpa67JfZ4Fp8BEVvIXhod4IuwMFYpAZY4Ly03I28brmAiiUUA9c+GhGiMGLmfcstVSJAux1PMxLfszlrGoavXcEpH45RqGC4IwDlFaFnhiGAFbmEZOlbmuMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j37b72CZrvUV/MFjMeoH+zmV1NaLmtwmUjmUdBheIJ4=;
 b=YbaKLk64zHmllb/6tvNWIKdlnYDURThaVi4A3EuQFB+E85uwgCLQvgWZlM/m7xc/5gnbb9pbyfMzLM5DMa/RXz0Nc6CjCJsKmnzu4bfXmpgydDWvtZGMSYbSmNSsTtvk0sxrqElllr36uPctzdubVWj4XZZg20GYM77eompdHkiuFzFX9McHbGMzlIJbT3+/YpekI/k2dC35RRg69nRYbz+cubbO9jJ3xo/GdtA5S3K/OJN33Op/i8Ol6M8ItJ1adzpDp9cr/hxJKA4KSBQra724fmYd9Mwh5Er0flkZDW+PZsAmtljrYnc3+puTaoDVM9gV9hogUzFazLwJ6TVqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j37b72CZrvUV/MFjMeoH+zmV1NaLmtwmUjmUdBheIJ4=;
 b=omb8q43tqKVqZ0MaTkZgsmffcQFHUztBqE6ZqGcBlsa2u6jUtNPxt3doco7Dl9Vb2KFLRiJu7Ba7B+7iVLDrpCthSCsFpfBxU9a2jTuHJbMZk//U2naSjyz3zdBQLrtOSpGSoMwKk1Jvez4PhL4ulVxTHc9R7jpOGLiKEBdAJlY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4642.namprd10.prod.outlook.com
 (2603:10b6:303:6f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:01:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 07:01:33 +0000
Date:   Wed, 6 Jul 2022 10:01:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: SOF: ipc-msg-injector: fix copy in
 sof_msg_inject_ipc4_dfs_write()
Message-ID: <YsUzQPyZYMkhN/Q9@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0031.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a8003b3-be16-4379-92cd-08da5f1d5c77
X-MS-TrafficTypeDiagnostic: CO1PR10MB4642:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1LGeeh0L+PhPEepu8bSMiERU4303T/VTeg0IxzKzbZ3HTmji2kLmU0rDnY4+IJwKkxFTVQ0PiPUaIcYKtrac5U+eV1WJ/Sw4IdJaKg3zyESG6aVTeAHrrSmVWi2uz+AWRHFSRtOEcPUJe2KAiXocy7tKYe5YpVz/bCtew8fPHfWeR0rPanytoeN/WdWYiogBw/4nL2YlysUdoSYtRJzovhQoJhL/VTZ2EIhZ0PzD/deHFt0+4WdP/rvnBSYLteiog3woAeqF2tgSfmETCEv7GawzhXiBze81JK7wpwt5+UGjvZYc3iVbhO9aPwDx0cL7CxMLstS+fpIw4nRugf4obkcDdnO6d3MBhfpcPVZn7rrw0MfwwX3UMAEIhshgmN5eS7Z+HZUTOpHDOXCpugUCIpAWVHEU/Km5/YqT6QiOrm2FrknqnQwF3/OIzNEDlxDnI7ADIhhLRe312xRNlmq04MozxLlIHN+Buq036i0vINpGeZmp09tqgDjsSe4Is6n+lj4gcohE5J9htqJvW12qM/hNNrx/c319dNpVlm7jpQpFkwl6Gzv7s23tbiP2lVY/oKMu3BrSDcUcGQkCZNT5G2KD8SBdAId4JSqZn35Km+jRz8IauvX65o14CAKXVW7le1cP2Be2I/i+47vSJS7vO1r5hhlAL9RXGvlPN6TLxYvcGiwiWD+xhh2ltxAl/JL78GD+NS5oiJFGiqzX78Zzynv3p4ghk8vadaOYwf0pmScq1JzB4TePSksFD6qb5qNeYiRMNDImW7wcypLEeR8hq4yJMigV9DXEc6eLxb4G8NxfDY7GQA5YTR5WoPieIPM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(38100700002)(38350700002)(6486002)(186003)(6506007)(41300700001)(6666004)(52116002)(2906002)(66556008)(316002)(54906003)(8936002)(5660300002)(7416002)(44832011)(86362001)(6916009)(6512007)(26005)(9686003)(83380400001)(66946007)(66476007)(33716001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dcu4uPgV3BadwZ8WxVsCpfPoyE5C65emZ8I/JrcQkPiIUXa4IunQ7Tup27v2?=
 =?us-ascii?Q?Tt6wzrsAHjAxQm+mvDDImkART/xQ4Nk5hP32cO9R1waAN94Lwn18F/shJbb4?=
 =?us-ascii?Q?9p9SznbwSsU20bw9wCzbvWBOUEngfEYkMOI9XYD6G3v+Ki17vEKrjqt/HPtO?=
 =?us-ascii?Q?kxmlJWNwWOGX+w0mdmNNhxLAFcHoNeaXzUIf0LeNtPFr2P/bBKXwOPfHyQyA?=
 =?us-ascii?Q?Bij0pwhVBWnv8Hl5jE8ZBqBqYCN6WwEiiB2ALdcH2LOAaSBvBqNGn6jaM+xN?=
 =?us-ascii?Q?+FDKQuqtY0n/WlMhDcl62LnQnAeNaZvDB/BlG2yFNMXlLmK1loLOaBTPHaWW?=
 =?us-ascii?Q?xieoP9ntHp3k5aRgJ/kcA0GA2dShBuZMyPZ97xDVEUBx9jerdc9SOz2HSBo8?=
 =?us-ascii?Q?ogysuwIsHODSqOU9odQ7VrNUwne2KBUS5lTjA9i1C9saKaGNE80kRQVOqZmM?=
 =?us-ascii?Q?Zvy/8HpGw4ue1afC7HHjjNppQUWiekHGAgzrHrzJT3SFIqzY3PcKQtA+3jg3?=
 =?us-ascii?Q?H6En6Mu3btkJ5APwp2xQ4KCk6rEW5iw3iJkILtbR9htE7SGex6WamPBspp81?=
 =?us-ascii?Q?Z0OlEAVilXhhWxO4GZlwmKGyevodsCf/ATDRqrdvpT5hLe38Fi/vtyqSyEwo?=
 =?us-ascii?Q?+VSdEgpBnzwG7dkLyuoDHUKs3S+HqhHiHoER3Jc69zIOHxbN3LmgsH/+byho?=
 =?us-ascii?Q?9GujHvcJMV7NEro63Gp9KXW9b6i1sLDn4SiCMKnOm9gHJ5ad4BvzeZG2ZML8?=
 =?us-ascii?Q?kbM288EvBMt//8lc83TL9B3Jq4feAhyKvu7KFPquD944MCgOIqhJuQrAvlU3?=
 =?us-ascii?Q?M+MMOzrx6JCiJ0YR82+dJULQH1XCDkI8K9+HCP2INfm47zQpHi80Mv/a5GVS?=
 =?us-ascii?Q?5WlVH+QkIeqqh/Sbv6bUzQ5t9CYxN8/zcvgARySdhyOUdb0fV1rhRwUnwbDi?=
 =?us-ascii?Q?boiWGdzjfzGX3vQwBCGDLCKEhz1jgmySprFkkGzpOzYEum5BmbpAfQ95Y4uF?=
 =?us-ascii?Q?jGuX+pYLW/1hrrjMK9xz+0VyOGUKE2oTN2xhXiXoRAbcl/khyEaYSMX85ijy?=
 =?us-ascii?Q?9k+Yr4RoaCLL0NiNfwp0WAONxAISY6xmDWDAgCTDXfpVeMRpmc29iHWQTaxl?=
 =?us-ascii?Q?IlUU8rODzxY6Ro33k08ZL6A09Y3kt6/bOGZHLA6jG5sg/xXEp8kusuLVL2SV?=
 =?us-ascii?Q?74BsjqhuWIUMzuddW/lnFK/7OVqfkm7OoGgfjE357JBx/UKQ/mrknyVUjz/l?=
 =?us-ascii?Q?JKIbOX44I+MiR2Vyvh4q9aBteQaI+xCB53BpexfhFx0H9wUH+7rvl8SCP4xZ?=
 =?us-ascii?Q?x084Lakdeq0H8JSHko0gstsva1LdpB4476+P3vgeObWQXxJ2I1SKRpYtF8e4?=
 =?us-ascii?Q?3lY5DAZ8YmuW+QzefAdjyQcz3YxhXcgvhHQy+2GF+BTJ1DdCj4LZg4CE4Jsn?=
 =?us-ascii?Q?zHlcw70kTfT8Bxgh/e2dQX8f78LIfHOblTBA65u+kP8dUeet4vZjpTFs9cu1?=
 =?us-ascii?Q?gTXnnZJKD28BCGNsa6Qswcc/tyDIpvKc/TIuNdY4l3t5Xay/CPEnWiBwLYG+?=
 =?us-ascii?Q?xJvzlBfjxS4IQg+4czZjR+GPXuzRm45eNQRiiyYvCaaSdwnCFwQUi3h11bPU?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8003b3-be16-4379-92cd-08da5f1d5c77
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:01:33.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIhMsxEFc/eSH+S7NJTQTEHbWCxllF7oQSDTsM4tt6RDLmHEkqAWJLpAQW2rC1d3NZ18iEZBdsDO/mpBUTV8YITPHiPnaN/D6hS8f8UmDzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-06_03:2022-06-28,2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060025
X-Proofpoint-ORIG-GUID: pxChNEagIh-e9ItmM9Ey81ZD-79XgCna
X-Proofpoint-GUID: pxChNEagIh-e9ItmM9Ey81ZD-79XgCna
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The bug here is that when we copy the payload the value of *ppos should
be zero but it is sizeof(ipc4_msg->header_u64) instead.  That means that
the buffer will be copied to the wrong location within the
ipc4_msg->data_ptr buffer.

Really, in this context, it is simpler and more appropriate to use
copy_from_user() instead of simple_write_to_buffer() so I have
re-written the function.

Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.  I believe this function is mostly
used to write random junk to the device and see what breaks.  So
probably it works fine as-is.

 sound/soc/sof/sof-client-ipc-msg-injector.c | 27 ++++++++-------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index 6bdfa527b7f7..e8ab173e95b5 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -181,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_msg_inject_priv *priv = cdev->data;
 	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
-	ssize_t size;
+	size_t data_size;
 	int ret;
 
 	if (*ppos)
@@ -191,25 +191,18 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 		return -EINVAL;
 
 	/* copy the header first */
-	size = simple_write_to_buffer(&ipc4_msg->header_u64,
-				      sizeof(ipc4_msg->header_u64),
-				      ppos, buffer, count);
-	if (size < 0)
-		return size;
-	if (size != sizeof(ipc4_msg->header_u64))
+	if (copy_from_user(&ipc4_msg->header_u64, buffer,
+			   sizeof(ipc4_msg->header_u64)))
 		return -EFAULT;
 
-	count -= size;
+	data_size = count - sizeof(ipc4_msg->header_u64);
+	if (data_size > priv->max_msg_size)
+		return -EINVAL;
 	/* Copy the payload */
-	size = simple_write_to_buffer(ipc4_msg->data_ptr,
-				      priv->max_msg_size, ppos, buffer,
-				      count);
-	if (size < 0)
-		return size;
-	if (size != count)
+	if (copy_from_user(ipc4_msg->data_ptr, buffer, data_size))
 		return -EFAULT;
 
-	ipc4_msg->data_size = count;
+	ipc4_msg->data_size = data_size;
 
 	/* Initialize the reply storage */
 	ipc4_msg = priv->rx_buffer;
@@ -221,9 +214,9 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 
 	/* return the error code if test failed */
 	if (ret < 0)
-		size = ret;
+		count = ret;
 
-	return size;
+	return count;
 };
 
 static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)
-- 
2.35.1

