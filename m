Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8A3567FD1
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Jul 2022 09:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiGFH30 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Jul 2022 03:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiGFH30 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 03:29:26 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703DB2253B
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 00:29:25 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266640Zq009612;
        Wed, 6 Jul 2022 07:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=2Qh2o2GpLp6P7S87+BVpxCGcCrS99+H8pR4qJzBo6Hc=;
 b=n00zv7/VZQDxF5zrEoWzKNOJ8Jd7SSo2qKsqMw39L3Zr4F/1hIjzJS3ZAfAnFVjCXcrt
 yaZv4lTNo5Q6b9rygvxrhE5/VCA8lASiY584wuQ8cF/96xHtNtFLJ6KepJ/3raHr4hlW
 9EAI/NNRZ293UFVHne5K6v9AM5mJj86uzY89ushLHMWl3R264vTnHtMbw2FgiC6OPcgT
 bccX9JZvxRsscaqSAylq3AhPU6LBfCJtXAOGYlwsTEq1GCcYgcg2s8f3teSXm5OfcLhM
 xH83m+wY0pVvqijqq+Gf124XLf9hYURdDvOWH+iPRXCDv2s9n5ujWDwQbPaDxXjmujxj Cg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubys3eu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jul 2022 07:28:37 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2667LHGA007244;
        Wed, 6 Jul 2022 07:28:36 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h4ud5ujvn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jul 2022 07:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPvUYPekt2gMHwuzJAkWJGcjdsCVrmo5SWh+KUVFxcVWtH+ii7UHz7Rl32Oj7SMvd78DO06YTgGzZUnfRk7NhT7WvtIItj0cbwMEPZqj7M1QT6+1rAi2atHIv5C9kprpo5TnZ3akAm6f2DvIHgMZ1/Mqr460B5p4euw0/wkV1FDfTrMfyq/kf9ZgML1RNS6QlOUf8ANGZLk4chpWLA28nrAboTk4VUpi6td9U4+rSw6r9B2lp5SzktBYBikXTTranLMAKYg5MyoAMXsmTMfDAjJNSOBjMWRouFpZGRxTRBg5zcFPZetpeyDZKETLA+B66Lg8ES0WfEsBxovz/p7Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Qh2o2GpLp6P7S87+BVpxCGcCrS99+H8pR4qJzBo6Hc=;
 b=mnTJw/d7qB1v8yOLnc+IOagk9/EQ7Y534CsfJLBaEXeg91R4M+lYw0rLRMY4p4mTTp8AIZU2yIHKnrlmxYJ8ZZErG3ubKn84bgwoNvVPIoK2SWGdM5GheFGzzFmlCSG1Sk9kiasBWZ4ohOjB+MA3dcwsn4aQvnjDkUwI52aPRtUsXLvXTbvHIUMWZ4J0/0tflDOxj0CQlGvRgJE5BcfyIeQl4JdvKVV63txqP33H6K/NWdY3fg72TbKgOm2oUvJRJse8+ht8Wu0QvVOSkSauGCccnL1WDImbEw4cmUV2WygU5Qxrqb1eyfpQOIilgPtxCZ0rqpLJMd38QShpaWbptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qh2o2GpLp6P7S87+BVpxCGcCrS99+H8pR4qJzBo6Hc=;
 b=h1xBGbNvTig8ybxs0Ve4x5IrRMmJD2mtt75T1FhIhv5o4v84ivCQQCtRMxGXoOk76pqg7pxjweUnLK3auHzaFyXJ/iiW4y5fe97WpMiTGGwW27Rg/jK9p9CYnC0EzN7x/KvKpUzPx5I4mf9NoUZKrFhqei1gRUdWdaQIUKkKI0c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4140.namprd10.prod.outlook.com
 (2603:10b6:5:21b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 07:28:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 07:28:34 +0000
Date:   Wed, 6 Jul 2022 10:28:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Fred Oh <fred.oh@linux.intel.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: SOF: debug: delete sof_dfsentry_write()
Message-ID: <YsU5lTzZND9cDRl0@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::24) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5417d02-068c-4aa7-70b5-08da5f212221
X-MS-TrafficTypeDiagnostic: DM6PR10MB4140:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVpBbzyv4lGwCoZVTvJqsj9KuU+zsS7Vrky9qR1fhwtmd9DS2QOZXcbWgSwZVsuoa9gSKdsqgOg/swJ4ykzMSK5w8TWsT3dDLdHJFVup02tLXGkne5bI/piDsMmcjMj4wnCjZ4RQoONvu8EGRItTBUa2BKunrEpibDCO08bINuPEm/LaILjcKc2zABrV+UO4rn2pI/moj075njxb3zrH6VrJZqYoWPZMfgDWKLfgNoJj6hOF3DJ2sCZEDevuSCUsg/DIu8kh5NsF71UO51ctqq7vYnEsRYGHiy6UL3AUpmM7PF8Vu6rEwEVYqS7izn3NhLJqPeqoLylQST5oWXih/QJEhfHjRfHDIpSGchHq4bcAM2ae8UdXD75lS9ks8t6L3wzvSLFZE/JLC4lgM5xisY8ZCcoLxQcFJNV6nPW/YT05785WqCF+yrcrgkx+WCk1PDJXGQYYr7Mj/tPTdPLcC89cXWf1ROStLRsh28ZURQl0rkLo+ffMfe5+13ykRY09fpF9yxOBYP2rEwQ5vGz5TZz57zthq+jakY5EoFhItnTUI9iBcUSVHswTbNg43KEHvbKOtswDt3mZjWQAVlAWhf1bbj0pwp97ZQuHCioI1BXnCNKzdai+/Ucgy/MJ2qZkNvnXfyKlqQ/TmVkkcrlMdDPJ5GS+WLkgytCbojRdmQej3fNcV/ZfOJwbJGJewQjGPR2iLc67Z2mNj5/T59MiCKHCZfeekHitpbjCE1BiQ/cjJN1HIZjzK6nTyy388Y5c13bpsS2B+eh7oLqwqBf+fAif2B6r6uH/D++y9QQYbxGJWvAuhyNlazhLuu4AVQyF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(39860400002)(396003)(346002)(376002)(136003)(8936002)(7416002)(5660300002)(54906003)(66476007)(66556008)(66946007)(4326008)(41300700001)(86362001)(6666004)(33716001)(316002)(110136005)(6486002)(186003)(26005)(6512007)(9686003)(6506007)(2906002)(38100700002)(52116002)(38350700002)(8676002)(44832011)(83380400001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16UV0xnt2tQAW/ksTjwDXf6ekAwj2fOBYhRNxFkXAJtyLN5F55myU04WIaMw?=
 =?us-ascii?Q?TAfHsR08MnvsuMA790UHKnxmKqTco7y5J40qmOjqdT5KbyVOE/iNidWJolS+?=
 =?us-ascii?Q?/INHbxCiv0O5doxkT2/AonBM2bk6oAX1OjHUTUBfw2KD86JfFhH7KfZfP0j0?=
 =?us-ascii?Q?KaSHtAu8kNIkyYx7jtd101X6LzPXu4MMcpOJX3/N0NtNJr7eI2O36NBbyRjD?=
 =?us-ascii?Q?vyPBGRFFpBXopMqpjXR2TCewGMNVwHzUXkvL2zsiYDKVNX3uUEf3PILegFIZ?=
 =?us-ascii?Q?/6cYouf4wYQemPJ05g4uMXP4p5kQHf78kfMmKYmUtj4HZyEDtaMNZz/PPS9p?=
 =?us-ascii?Q?GYabqYonUEmWpL//ws0YACUz0WdhqFqeagpjGNETACPn6/9lBxa8HmJVPbCh?=
 =?us-ascii?Q?5OQAJab9IHcSVUK2ZWiqrP/Ryo9FnHFC6BTzMIx7G3QoPh7QVj5n6ZQHMbvC?=
 =?us-ascii?Q?ot6SZHNkEnx2r9hA8tI2VUoF6bpZX9nbk+yreULC63+LwKMaZyriHhMZEXBC?=
 =?us-ascii?Q?kfeYKjSJDkI/wtKDxh3XOYRgpLqRqHCzH9KD6KNyUoF9N6dl7gWL6W1idSCd?=
 =?us-ascii?Q?IUzMUIzAcm6In1T75+kb4EKJuOfIpouqafOYxN6hyPmS6etrcBh4LTCOE/gm?=
 =?us-ascii?Q?riQ4uFLUhBGVCIpSQZUFgeKfeOsmreabb2MzZK0B1NEMrhRFHiziSJyXpLDi?=
 =?us-ascii?Q?fYQIIbKuAy7CVwS5YWiaTJNsDxw0NKNwrj5Ln5KqTyHv7VD0opX6Bh8MtXWi?=
 =?us-ascii?Q?MHA018WZvYbVMEOkbSO6nUXuWMAZeUYYLJkht65DKggfjw8GhME4GrCnV3WW?=
 =?us-ascii?Q?dEIRxMBYr5fUm53WEzwV4wYiDj/fgFg2/nRyYpvG6sGzI9eRHi5KW8yJZv5N?=
 =?us-ascii?Q?c2xgPvkZX5xXok8i45AA3Yudri5QWNniM4Al2s8Pre4LcLHWp1ZRvad0zZza?=
 =?us-ascii?Q?LO0YmF8oRP1PeclHYkUkqRQ/g2MKNeGkDRUmrH7jPBIP7IhMJc7YA/Z9u66J?=
 =?us-ascii?Q?g8jXwa2rwXD6AhhHwVjjlu6sG0zuxRNbb/636h6KwTWkktQMyAKGtnYs84NX?=
 =?us-ascii?Q?LIZntIW6z4KvcaTu9hf0RdMWRiHM/R/XwzctMEsLOVZz/s/mHK5TNrSp5BdI?=
 =?us-ascii?Q?K82PEI96TAGXfKLnu10F7BqLyuldjZa4naTjR45FQWwIti0v+z5K+xmFSja0?=
 =?us-ascii?Q?6W56iCuVZD1jrQ7uMfXRde0Oyc3Z2jgoUUegwZ1uLaXlXOmnrNyHtrp3b6rG?=
 =?us-ascii?Q?IRsDZj1DnrqPlgq5VtHsobaVTyujPwd1id2hAiF7QHdctb3jSggc5uKop7NO?=
 =?us-ascii?Q?hVEiODLnOHh3lst/DviZTjt6WvxfynYmwkAtlC0jGxAz7B5aeikPp8oFRlOd?=
 =?us-ascii?Q?jpFGsVSbdT+Q0gld9fmkjJp/xB6/B1wG4K9q4lY8HHVUAagysVl7v8nvLzjf?=
 =?us-ascii?Q?nMbgOmDZnlFBXXyhEXM2Wvgdjz5wcTvxzj82C/xy+qeLhhh5E49KwFafB+Lg?=
 =?us-ascii?Q?35Ly3gBkmwIoENzLTds1H0BV4ysch+NpaVyVU+lOPM7tAgfKeFGcr+xMdRal?=
 =?us-ascii?Q?CweH5VTNtixjW8dwy+F4Sbfhu0D7lQf4HuuHJ1fvYD4JABiY9k18GCEhotVa?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5417d02-068c-4aa7-70b5-08da5f212221
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:28:33.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVGzXN8SMSlauseeBO4jE1Dkd81+jnK0UL7SohIWeLQMeZa/9B3q50O1Nto3Z1l/bm4BLaG2zU262FMhOUVbU/1e4ZG2gjtYVURK5j6HUlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4140
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-06_04:2022-06-28,2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060027
X-Proofpoint-ORIG-GUID: 1BnYi9zmaCSqO3ELOWpqoqLadqL4Zgaj
X-Proofpoint-GUID: 1BnYi9zmaCSqO3ELOWpqoqLadqL4Zgaj
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sof_dfsentry_write() function used to have a purpose but now it is a
no-op.  It allocates a zeroed buffer, copies at least one byte of data
to it, and then frees it without doing anything.  Just delete the
function.

Fixes: 6e9548cdb30e ("ASoC: SOF: Convert the generic IPC flood test into SOF client")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From review.  Not tested.

 sound/soc/sof/debug.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index c5d797e97c02..00abc2000bfb 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -19,24 +19,6 @@
 #include "sof-priv.h"
 #include "ops.h"
 
-static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
-				  size_t count, loff_t *ppos)
-{
-	size_t size;
-	char *string;
-	int ret;
-
-	string = kzalloc(count+1, GFP_KERNEL);
-	if (!string)
-		return -ENOMEM;
-
-	size = simple_write_to_buffer(string, count, ppos, buffer, count);
-	ret = size;
-
-	kfree(string);
-	return ret;
-}
-
 static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 				 size_t count, loff_t *ppos)
 {
@@ -126,7 +108,6 @@ static const struct file_operations sof_dfs_fops = {
 	.open = simple_open,
 	.read = sof_dfsentry_read,
 	.llseek = default_llseek,
-	.write = sof_dfsentry_write,
 };
 
 /* create FS entry for debug files that can expose DSP memories, registers */
-- 
2.35.1

