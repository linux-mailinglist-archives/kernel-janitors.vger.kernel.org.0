Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2682B571D28
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Jul 2022 16:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbiGLOoW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 Jul 2022 10:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbiGLOoB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Jul 2022 10:44:01 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA42BE689
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 07:43:28 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CCtVLq022829;
        Tue, 12 Jul 2022 14:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1Uy3TxkuEEmZkoYv7yCvLo1/HmHRDfuJe89blRC3Yt0=;
 b=yTl6R3Nag4erz9/tfN5/oSJaUgyxE+p8R+mF1eEi3poGFozg309iqM+2ccIlmiIKLG6k
 eXH956zby+F70bJ3jouH9nq8lLJZCWafwlBcTu9IK2BdJvHM8f3IAsrkCvvfzCWr8A78
 1a3wr9FLepTD0BW78e2kx7O2xY/MBzhTHTW8xD27SuJcbwtxYxf4TacojPCIYQo//anv
 8mBp2Gjz13vijWzmmGmMBpXvqH9wZOb3mWDhUCDig8jJJX7QVM7d3jzaJuWSR1DQbNt4
 WJY3tOF2mrYwNSZ9K+bo/7NZi50UrTv8SOisvUdZOUQqlWH4r8DfWvZOjopBtHMJd8eZ Ew== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrf1mj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jul 2022 14:42:31 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26CEaAbd020820;
        Tue, 12 Jul 2022 14:42:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h7043se1m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jul 2022 14:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcBxItplAeA7XeJ44ntlJQdoZZG0H0DcrlUOglyNUJrzm4P+PSSnpo3R+PInfpKRHIGhBbn6j0uuZH32nfN3/r1FUMLsTlMY2qnDaB+xLenwGcgjPjf5Q723KjhnmPLwUx9bFXRrJlbZ8Qa22jtBQjZBNx+5Gr6/dRS2lUeOpSkQNPnZDhrBirlMv1csQAdYDLSToPOFewfJqKiQnbEx6LlkhywWH6K1/HqhjYgovKOk12bP/ZAORbnXlQRODTCcrLmChL6w1i+aYGOAGyBysEXO7AauRbqKYbYiGKWB3tLGuyNLh04rdvDXKabXGm2TQZCiaLcBEKzQBa+hmIrB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Uy3TxkuEEmZkoYv7yCvLo1/HmHRDfuJe89blRC3Yt0=;
 b=ATo91/es7+vKOkAo4ZHS5ZecftxiMdYVaLPpeo7jy+yataTWlgZL8ZQ93wztARVSKsZAgbIIsFGCCza5x16ildfyA/tSI4aN9f/KTOUkdnRWvTqSVJKSNG2pf4xpsDz7k5AOoLkssvYi3LO/0YL6U7jVh9rEPQT2xIZhNLYETUU2GERBgoGRJQe2gdSm7LllM8M7ABsuUyJcBur8z6jJ04web87y+geYUgnIce5/nGJKfdkCzBwA1BOhQ2rdGt4kxhQH7odOHR90rwHas7Bibi10LAH7kCNWbdwUUbGimJ9dx2cWWbWNMGJ/hqil0q73wAH9DtC4vrbxRTtNkrRZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Uy3TxkuEEmZkoYv7yCvLo1/HmHRDfuJe89blRC3Yt0=;
 b=mwP1cCpNrY1Pgvg5OsPpCyuDI4DNs4UaFdVCi5bD7bd68XqZ//jgw6kgO5e3Yz+DzRm6aaulCuLNLeRuLyxO7Nbh4xhVJeX16zLVpESKBymAOnj8mFk1s8/TtDxX6FM4W2i3ubA67vWQqVRIRo5DogEa3aeK8V13m0sIMXvi3jc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BL0PR10MB2913.namprd10.prod.outlook.com
 (2603:10b6:208:31::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:42:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 14:42:26 +0000
Date:   Tue, 12 Jul 2022 17:42:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: amd: Fix error pointer dereference
Message-ID: <Ys2IRPHWGIwuVs21@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0142.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9135dd0e-3969-495b-5b27-08da6414bd51
X-MS-TrafficTypeDiagnostic: BL0PR10MB2913:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afvIVbg2Q8ngHW6I/N3wUUGaCpqlK23PFut316rK27IZ7x1fa/aCX/tpyeEgQovbXJJ6Od0TQEIT72S6rPxb+r4RLaUhc3kBK31WauE2wJkA/SHhaTQA2/ZrIFCZXAje/XqwHqvEfvlXIn6vROXU/pfLSto/aNROQP94b0ExwDQy3quJt5SJSTRPGLM2QmHkzFewCkUBnWkdC6FzdziiYonGv/gcI3fOZHXmh6RlbylnuTyXLqRB6UDz3jP1EOkrvCiAQ3u3JFSvXFzD+MdozMMjBpj/1CGcqaxAb1W4EOhTaNXZ/5Rq6sifeSf/o5R54JTERZ66XoKUGbfBLtme4NLLXdc1EUwpCzIKwZ4y+PUrj+0csVB6Y8YXaxVZctHoeHweECukCXhB5RQg1869CH3vtvLwutD34Uw6JjmUrSjbcscXmkEzqs5zFUCdjoYJfemikM9CuRFNm7Pqw01Witi3ZY5xo8ZdlfJHNXbcSekL91gv+XQG89uonASWEH6aPoXooRoqqq0sb4m2eQKFd+HpFOYZuDgvYPJrIC9/TFxa95npvpoUkYD7Kc8RP4pOy3E3s9iM+bd4QeYLsHihr8NfqCmoPyMej2DB+k+XjRKLcT/hOWWnmdDcwmDw/411hiHHhH2Qwox4GUkcNRCAxBWU/7hJOcvLlJcgb4u3PcvkeJb2jUKAQQS0cItO52HbW22pkTmdY5+AunVsFvhusvGAU+xTUJ9IN4Crw7lSlGwFo3ZSk/KQeQcqkSUOa6uMoFG3Jj/9aXgcy+pCaJN6hXdIS3ZSi89UsfZG36cQdWDgAyQCLz0ZVHBCHnWjjkLt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(39860400002)(346002)(396003)(366004)(136003)(6512007)(6666004)(41300700001)(9686003)(8936002)(86362001)(26005)(66476007)(4326008)(8676002)(66556008)(83380400001)(33716001)(52116002)(6506007)(6916009)(478600001)(66946007)(6486002)(44832011)(38100700002)(38350700002)(2906002)(5660300002)(4744005)(54906003)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1W6PR0BcrqdtzYk8HfYIKjH/IxkGJnHLZ1WjKvC/YStS/uBw2Hfzl5/1ddW?=
 =?us-ascii?Q?CMo6jYdWo0jpzYmEnePJtZMNU6E14D9maTxllrcaKaFTQzDiDkzVZJSCT9f6?=
 =?us-ascii?Q?kV6PB4O8ph+rsNYf6F0TXLZLVXplgvy+waUavM0BvsKFEi6Az+SafR3ThRA/?=
 =?us-ascii?Q?6WCvghTg3/BRouyKDkV/RPDwelL8eKxJlRckK1M3i/E5Cohtj5u44fgF7Vzm?=
 =?us-ascii?Q?j2dXtUvvdNAFojMaYjZd+0LK56TEVkb/g2LlXKjBKv+ze/GdhMXjvocjcbqB?=
 =?us-ascii?Q?TE/uIlc6aibTpShcysSR1LoV3GJt8svkjDk4L5i2xbmdE14Wnlr8F6f3Zsbv?=
 =?us-ascii?Q?09cgpPqsXleuUzD6nbRZ67G007C/t7xqnMuB7Gul9kcVRKIgCMiu0qESuMvC?=
 =?us-ascii?Q?jd9MvIu2GhVKaLOCY7J6iRNC8onntCkYCxT29WF7wjM/0izcPGZuon0Y2m+w?=
 =?us-ascii?Q?OySDghxZ9DsPdSDSakXQcinZNCxp2i9Hoo8dmqO5tEMDHqaj8gYmRUa7d1L6?=
 =?us-ascii?Q?0U3YWZOAe+ZBHSVhjiXQAlJa486Oo+g7Z1sl+qKoPCuTpJEBsgCDQVD3h+OO?=
 =?us-ascii?Q?8pTYq71eDyZIM5BMTz58+J8r9yAT1iUCmt2lWstdwxnz0u7FCETktHh+SqBd?=
 =?us-ascii?Q?5fI6lFx9HoAHh7Oa0RRuJxep5aKsiCicNPHhKTA9WlAk42/Xx3LoWx6mcETZ?=
 =?us-ascii?Q?rZVd311GN56zqMpnzMtMQ+tuw4SPP/F7JhdR4FSzNt9qJWJIhKJozUsOVUHX?=
 =?us-ascii?Q?oXPFaXtqwvcGGAXp02Va3MC23zyMxIupbTphm69AP+/7j9a3P9nHxnY8JUNi?=
 =?us-ascii?Q?gSb/JULN7ZZq69ocguCauIbwUibV5YKjZf1Q/JdcMOjs/Gj93oJMBnslskLn?=
 =?us-ascii?Q?O88MxnvM81pkgwNUs4upf9K6gswXglErV8G0EU5/P5OuN8WhQ158bWcrbco6?=
 =?us-ascii?Q?xp7aQdc3z19rhhmmp2YwgUC+j9DGNApY/l4YdtTOXdbh9yt2fhcmDI9fUAAK?=
 =?us-ascii?Q?Gy55/mfidADI2bGSaEBxqBS+lqN52qJtFJHbBgmUCVv1Bws9tqUiHSU5BvJG?=
 =?us-ascii?Q?8WJisvrtrhlI6rSXa131SRPBFKCujgdRlbZjEC4GWCyh6FPo+mFoR7UUAClE?=
 =?us-ascii?Q?RLkiqv/R45wbDLnk3hln3ecg5SS+dvjgjL6UuaVLi37q1IY2OCcHA8SkQuEB?=
 =?us-ascii?Q?WgynmPX6R1+4cr2NWRzCqO9kNNdltGDN9WLMJF73oFqvMnCADst1OunuJHGA?=
 =?us-ascii?Q?b1qTfUjHRy1H1MOSgahNG7oj6mhQGhgzqnoH+i9rnXKN/RDLt2VcNDG+MIXC?=
 =?us-ascii?Q?nJHD1HE4t3SotJ3kLpNgghIZQMIquv6NlnYpFJdjR17jU/s0VzGpEPau2wkJ?=
 =?us-ascii?Q?nqt8Rot+EnT6lYhpUudDMic5G6PUwDZHF2YUq8HjHlyALsFq4+B9drMWzCnf?=
 =?us-ascii?Q?mZ2kaaeRCjo8FJALlVMmSo9o0JiMIh8BdhFjckkHMBbcD5uK51+0vnAiV61F?=
 =?us-ascii?Q?9ahvCv1gs0rsnzdd7hBUChJaOT93GDH182m4MQ41uEv+Ou+LFgY4Ue/8ETR7?=
 =?us-ascii?Q?eMzL3PNnlO6lCFPtX82Ohlef7RDKPEfspAUXKgoIzXGjUkPAt7bQwCP/tCoQ?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9135dd0e-3969-495b-5b27-08da6414bd51
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:42:26.6257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH0op5ebQWgdppGFj6nMPra7mVfdrqt6CbZ1DSzUsCcRVgzu/KmIG7Nsc/rGRm+ydGuS9e0zPQpL99vs44wp00T0TC04DgXLYi2fKqLY1Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2913
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-12_08:2022-07-12,2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120057
X-Proofpoint-GUID: HXNBJNpHdjsXzs3eMl2Ef0EezvSJ-VW5
X-Proofpoint-ORIG-GUID: HXNBJNpHdjsXzs3eMl2Ef0EezvSJ-VW5
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "gpio_pa" pointer is an error pointer, there is no need to try
put it.  Calling gpiod_put() on it will lead to an error pointer
dereference.

Fixes: 02527c3f2300 ("ASoC: amd: add Machine driver for Jadeite platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/acp-es8336.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index d501618b78f6..2fe8df86053a 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -212,7 +212,6 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
 	if (IS_ERR(gpio_pa)) {
 		ret = dev_err_probe(card->dev, PTR_ERR(gpio_pa),
 				    "could not get pa-enable GPIO\n");
-		gpiod_put(gpio_pa);
 		put_device(codec_dev);
 		return ret;
 	}
-- 
2.35.1

