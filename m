Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6007E53B5C7
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Jun 2022 11:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbiFBJLo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 2 Jun 2022 05:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiFBJLo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Jun 2022 05:11:44 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A0EA3393
        for <kernel-janitors@vger.kernel.org>; Thu,  2 Jun 2022 02:11:43 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2528TS48020499;
        Thu, 2 Jun 2022 09:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=+NvTtdPxVv4L+NmIYTezbe7PQQVJ728tod1uWudzs+Y=;
 b=s8ITVzTXvSaSIpSFKwlza/hlATGim8RvMlXLHwu2Nr6Q9Tjj3ZqFvv8ESmKC9ym0t5Un
 WAmHLxrELvq70xBYSCSAdY6OpcD3afHI0P5fM/4xXkL+Nw7ef6yUqZqflC8WU6p8tRKq
 ket3vU1+/DrZ47nrnGVTPdzORbwkswaB+5CYX5mcCueh1SChiMIo9g3SXYA/EqMgszFi
 6kU8jCuy1r00Gk4Qh0VgMN2Dlr6zPCws+OWyHCWKOmgjDoQn5+4r5/VoYor9hvYwxlpl
 rFn2L3A3d8kDfUJwANntpKEoR+KaR0qLWvIx80MXbeOpyU/a2WQU1h9ApoFIQScrz7B9 6w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbcahsxtt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Jun 2022 09:09:51 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25291WNE028449;
        Thu, 2 Jun 2022 09:09:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gc8k18t21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Jun 2022 09:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJBkXcqWjNOU5qSxDeXOhIJ+iD6k07ePdWfl+ggaoBgmiOnfEFeatha/9lTxZVyKvfeWhS7H2DTqzqhmENcFxBjbSzpeQH07C0CyIie30NgGv71YmN2VsZs9E77Bd2lXy3MAb6FdC//1tMTA05zk/DTeMgPN+C099EXJb/bekbrRhI2EpThJl8DvXeedjVa0DDLBBtXQIYWo4wQtZX0buTUv8nB5pH2yrsevlRu28d5M1g43P4+S8fbAjuSEjrVIRexdJy6XOHNJWx8M8MFiSdKap5D5y1XEYpLN4uDxfN43nTlhKGzymAiI4CAlKX5DHqvgrXYgLSdPzqDaEIkNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NvTtdPxVv4L+NmIYTezbe7PQQVJ728tod1uWudzs+Y=;
 b=A83M6W0zNkowhbMORzh/GBCVyXS0gnnwqE8epwr2g6olg2/O476eB1uZot7f8xmXBtal9F8Ih5nPSai3h+Ha+LxZRCfMRs+ubmRQbP2lNl74s96pVTpCMg68baPFmg0mJTfFiH3hbv43r2TgJ7SUYeD92O8IcUlO57A3em8HNzXx7lRgekvY/zoAcBTFaGb2Dz7BKumXMZa+F0B5qEy/PIWcDzKH39jn9Pfiik+E1Tz4Q9NdhmGD3mUITe4hxnADpgV6PtUVDbeLv03fXVekfPwk7xNmqJTfPx10wnxymPczQrJaHveAX/bJQ/d3Os6awkYEE7aa7g1424+vYgM49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NvTtdPxVv4L+NmIYTezbe7PQQVJ728tod1uWudzs+Y=;
 b=JQhDWKWqMkz3g/qTB30ABmxvrbZ21sS5uu0/B5PMDGdH60Axy3UP2jA0W6vV+GqIkkN9YefW6buwSWr9WU6rHSCVHPvi3lvsjcMlGQaNDOGfiK1b7rUTTr/USBfEJrvKV8wVS6H0+mOGQubLxWgYICT+n3EBo9LMUSQsHl1GPRc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4474.namprd10.prod.outlook.com
 (2603:10b6:806:11b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:09:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 09:09:47 +0000
Date:   Thu, 2 Jun 2022 12:09:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SOF: ipc-msg-injector: Fix reversed if statement
Message-ID: <Yph+T3PpGCdPsEDj@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yph+Cd+JrfOH0i7z@kili>
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0140.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb52588b-417a-432c-259d-08da4477a462
X-MS-TrafficTypeDiagnostic: SA2PR10MB4474:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB4474A9BBF9B0276A66A0D8ED8EDE9@SA2PR10MB4474.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgJMX1vh+Pqb9c2+EMGEx0ziSavdfzrxPLyH+r0ly0Ekv/UbDaFDs22C8TP5WAz0xNyafR35UZfGGHnzuzkcI31O3j7ja2M4he0Dn6MQLuwGiZx7eAEEyv/tj7kpp3EM3qGB01B0E9sy/EJ+5V7aS0WMzz3Vb012I0tYv5OpvTqi9hMAuJ++GWWM0a13+uwGeziokwFDTw0TONXswrYxBjSeZrSOFcecCC/my85QZbMl0taJz3nA/wdQPOumFSw0i2qidFTKIWXWJSrdslzaYNdaOcI3U7HMBurnjivRDW3lBiek3h3L4L9XtbIhUlxCvo8ct48A+eW0CC0z2gn+fHtGfa33wfl9HO0O9ric8yMsLAsya0vbgsVyDD+DKdUsoFyYzPHXpZzgmN+uhSLTYpf7kmwfJ6KbCf1ACwmNpSgIP0fFzBupVpOLPKSK9oTMvAVkwRFWxvZV1TlZx5lYiEky1BuwGkI+qRjjWq6FPl94utusBZ5twTlOX5Kw/S4cH47LYJXSfIIQ7yeSwsowoAGRwWia4zkcQVnE8pk2RTs8JGCVkcUg+NLWgFX2KUjwArm061KrhdopPVP8byd4m8NoP+IsWYgLHwnn/IrRRL7ne3t/9/us7NyWqnmE6HqIUfmWMCoj4z46b+Cda7C8YxwIlpy6SX7lR8MLjOGEROPmXSH0d+PpyOjJu9MLckAAKVosjdQif/vGft1poGGoQKk6rW18VtPEpAPHN0U0hcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(186003)(83380400001)(66946007)(38350700002)(38100700002)(66476007)(66556008)(316002)(4326008)(5660300002)(2906002)(8936002)(44832011)(7416002)(54906003)(26005)(6506007)(6512007)(6666004)(9686003)(52116002)(110136005)(508600001)(6486002)(33716001)(8676002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kcXK5cWs5xXyc7CMqGNjHbXsrSyJgR/Zr3Zis4bMpPZ/Y5j/FqmZOKCo7aIS?=
 =?us-ascii?Q?bmgrksCI2LOSdhEiiqzE6TNLZZJBhvvuD9v6qDKRjXJ2TqH5x6hF3mdgpUNI?=
 =?us-ascii?Q?+FVHXLZ1rZxtjeGVpyzVMGE2vP7Sb9CKLP9AtdEBIXyoelbtUpq/9L88jCTt?=
 =?us-ascii?Q?IqaHBR8E9GIBoLkW2CKIw4kAE6EJhNzyARsBICaQ5myTnNYHXEFRdy7u4QNm?=
 =?us-ascii?Q?RYEuC56/JmaMh/QSbSM2qRKo8JjvkmCs3Sqc+bLWAQbucbFCD2nqK3zBrH4O?=
 =?us-ascii?Q?4/nb04EfjYPAcuxP3GgbXGSClXFFvkD0Lj7G1H9FW4Xo9n2+TVMxAFi6G/5r?=
 =?us-ascii?Q?DWVuOZ7HrZp3dAAPodVpVjQ8bYFcWsD3e+rMCR+9bto4RmotMmtAidn5WiJk?=
 =?us-ascii?Q?sNVQ7EMZN2ibDUCq4swxVIV5wa6VMnvJCkCdIsbP2zyTMM417UDqDp3nBdf5?=
 =?us-ascii?Q?ToomWVWkug5FDKbM6suLElyohsyWOx6k6ZgsofOJ5m/npg7G3UeXAs//tKBs?=
 =?us-ascii?Q?vdQhvbjwuO2tVxEK9WnCHdxr/TOwqQ0o352998KtXMhmUcY1Poige58aQ/TZ?=
 =?us-ascii?Q?jWxPRBc8U5n53ucsj/qAIjAccYoQB34OJZLSARx5p1HIESfoXMana54tw05Z?=
 =?us-ascii?Q?LJQrmiOM3O7sOktZpTESpAeDIAOKG2/gCkpnBJqi13fkEnqcOrp971VpQ11U?=
 =?us-ascii?Q?tYW7mVYmznpAfEQqblyhd0cNERsUQP/bDMQ3hIAW6tl0q73UHgjl2ES7gRZ6?=
 =?us-ascii?Q?YQmrYITjx7wz0Bl4nxHLmUtaLmUePZIBSAIpX0UGjorZt38PARGjpkroic19?=
 =?us-ascii?Q?nnLCKApcdeKfCpI/1IvlS+z3TO550GydGM6np8DePY9RHtLNxmt8pB+J/LUh?=
 =?us-ascii?Q?dypMDesl23XZ4CG4sZK8VGlGy1DNkPicfF0lnHKLlTgZv2tmEwmp9VBCeSju?=
 =?us-ascii?Q?Bg6uL85muvn6az0LdKc9tyd3V9XQFGnR8XDuGn30YWnXE9zW6VHw5xCc1pcu?=
 =?us-ascii?Q?aljJ0kFNV6enfoPAjhnqdPoLnd5gNTXKdZFMfK9IfbNBInzwtvc6Wo9uASkO?=
 =?us-ascii?Q?HEYsqn5h5QefxUZAv59nq2kgFuzEpikqHFZ4vRbFjsPfI6uXjlmpxm3CVV2e?=
 =?us-ascii?Q?pY4WQbznzdXjpMgs534NULNwLbG0uECxt1i/zMgCBAN2rb+yZv7PAQnxcUfG?=
 =?us-ascii?Q?3fCkLRSlfxoJHzKhbe1/1B6YCKWBoaFIazzMvm67esYnHvhfVURT5qGBD93L?=
 =?us-ascii?Q?AMrjlH/4G66mlfAkmpJiI4Ds+GFP76106JE5IEpxLgi1O7XxlTT7zW1sEAQ3?=
 =?us-ascii?Q?Sm7g/8tAkDKbbWoEa2SplotYMvlHSckVA5hLwu3RqUvDGexsKNHUUr7H94lW?=
 =?us-ascii?Q?bZ/4oaO/K6clIxo7VrM0fcaiCUh/eSCu7bSi+HECte8T3MQzQ2PoxKYmL2ha?=
 =?us-ascii?Q?e7FIcKRZz7CeM7nUKRHccKMZxwSkI81NtDcctaRgCbXDKwZK7GvDwF+ghDS2?=
 =?us-ascii?Q?H64cTQ6EQZeOHXKvq4uDba+wDYDbGSdk+93IJHDKjvA/9/FYlrC9Jws7ba/h?=
 =?us-ascii?Q?VjF1ZjHculEcgRP88IEDH1xzU6yufyZkjBQYtji4z3DjmK8AFVOyR9zD+n1j?=
 =?us-ascii?Q?b7O9NVDcnEImjxNapcotRmMPVx+tNnrkNCnQxDmiUS/HXAR+VSQFXZBlYc03?=
 =?us-ascii?Q?Ak1LQAh6FGIjjWgeSy6FUxxdUvLwPbXC0HYm5u0C9u6+417oQT70wANuLM7B?=
 =?us-ascii?Q?3XPwa2gQbDTr2ueLcJIL9bmtPyvfADs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb52588b-417a-432c-259d-08da4477a462
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:09:47.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP51cJ3Le8RNqExJ4+KmCaz/k8PGHol5ALGljLQFPjmYPQlUzfY/d+DJdOrLS9dRT4+2702XR4uhkdUUx7pF5Ut8gr11HG8h88/huIoV0HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4474
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-02_01:2022-06-01,2022-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020037
X-Proofpoint-ORIG-GUID: cMSD2OMfgMsPG5ViKE14Dby5dMDI7ldW
X-Proofpoint-GUID: cMSD2OMfgMsPG5ViKE14Dby5dMDI7ldW
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This if statement is reversed.  In fact, the condition can just be
deleted because writing zero bytes is a no-op.

Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/sof-client-ipc-msg-injector.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index 030cb97d7713..6bdfa527b7f7 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -200,16 +200,14 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 		return -EFAULT;
 
 	count -= size;
-	if (!count) {
-		/* Copy the payload */
-		size = simple_write_to_buffer(ipc4_msg->data_ptr,
-					      priv->max_msg_size, ppos, buffer,
-					      count);
-		if (size < 0)
-			return size;
-		if (size != count)
-			return -EFAULT;
-	}
+	/* Copy the payload */
+	size = simple_write_to_buffer(ipc4_msg->data_ptr,
+				      priv->max_msg_size, ppos, buffer,
+				      count);
+	if (size < 0)
+		return size;
+	if (size != count)
+		return -EFAULT;
 
 	ipc4_msg->data_size = count;
 
-- 
2.35.1

