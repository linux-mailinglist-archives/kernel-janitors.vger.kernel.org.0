Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D37C60DE61
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Oct 2022 11:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbiJZJpT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Oct 2022 05:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbiJZJpO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Oct 2022 05:45:14 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0547E1E3ED
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 02:45:13 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q7ww52012227;
        Wed, 26 Oct 2022 09:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=m3xv2q79ViagvyZW0aRoyreGBh5ciieponxH0VcEQGo=;
 b=l3fSUDNb55o1y0ryCMiULeOs4DrPukkB3SNBDZ/u3zEstlF/O5V5cfYzHeQgtcUhaFIg
 h4Rfg1aYoAIe8L+a/CEcpsvayCcvpmQ5onCI6upwVm4PIqJwlW/by4QmBV1bcn5w+sEJ
 M7t6TQnzXu8+HAoTnckkhcgTwm5h/1ykQubANgx6SmXqCZ13TdHNgAZr8CkofUtOuT3M
 M9uTPAk2UrkY74bGjPAJW6+iHGjyoSJo7YsMijpKFECyU/dYztZFoL6xGl29vLxwN4ds
 5sAwkk0jooLH9oBzP8Gy/8C3N5TpvwFe6I3g2NNh0CUSACZnWujo5o5Jj5XRCq8mFYyo jw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc741xjgh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Oct 2022 09:44:49 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q6kDIA021971;
        Wed, 26 Oct 2022 09:44:48 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kc6ybvccr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Oct 2022 09:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfRm+d1S0uJLKTSm0gxR55GWN1W7x9jd7r73oH3w90+qiH54tXa1Xlz4qU2HI2n1g1G04aaRKJunQbCHTV3+U3PcfQniGwFx4jZDCt8Rih9kEOtWx5nrfaVnSmt1zlCSMRBsFn9rUWrcc6jsAGeXwOpiQo9uLl5nf/FJ30fOFUfzTkbHN0LrpohJdDOUCBOlqUbB0WSJSFAldRqSOHXTh2lgIS2lOHgeC1bmf7Xmobyrq/LqtqIazdE7smU4FB5+0hBhC5Q1Z9xLCV3ePY5hYcrdGtXErBuGcyiw0TSrAk2DfnAiQGlyGVYqMWfhdM11BBHdGWS7sUMNCku38nav0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3xv2q79ViagvyZW0aRoyreGBh5ciieponxH0VcEQGo=;
 b=obUDGfCcLlHUVODMB6Btbvo8np1lbjCtebew+ZiIOWejClNL6J6MPGRDh6KQKMEaNZZbi+ABob1557W8niG6lptFS9Sgt1hTaGfhcnN4CPuUZMifcM5pcIUGSWy16bJVppRu8PsJ91TyEwmnauRDg0JJSJUReqUv2bzbS0EHxGsXLuKmE2ERrSYmTsQ6+5rRc/Q6rR59VuAD1qbYzD1vBIUwLnPKNNS8J/VRpRxVKSzqpzgj2M/bBBGaxMUJwqgIld/yfAfYcL9VWiOw6QEOv5m47MAeSi/aBpRJVKxd+4XHonJEsDC4sw2rc0Jg3+xEQ6wPFRpfVCLUNnfOMYAuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3xv2q79ViagvyZW0aRoyreGBh5ciieponxH0VcEQGo=;
 b=xR9VnAqKOTagNv4XOenMa7KaPWr3MpTEjOnTAPUSdAvyQjyP5ey5roAg35H5k1aoFyWYYa2skiGJA7B3qUkG69kg5CuTvmXcEeui//IHcv9wnAVGcdyadtRcU0eNC0cKWGNwso5jtwaSI8Z8+Vjt8xZq7OWvi4TVPiEBOf3bUyA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5864.namprd10.prod.outlook.com
 (2603:10b6:303:18f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 26 Oct
 2022 09:44:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 26 Oct 2022
 09:44:46 +0000
Date:   Wed, 26 Oct 2022 12:43:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Vanessa Page <Vebpe@outlook.com>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
Message-ID: <Y1kBRu55H//AR9vw@kadam>
References: <Y1gCALFWXYYwqV1P@kili>
 <MN2PR17MB33758BC764511BB48B64192AB8319@MN2PR17MB3375.namprd17.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR17MB33758BC764511BB48B64192AB8319@MN2PR17MB3375.namprd17.prod.outlook.com>
X-ClientProxiedBy: JN2P275CA0042.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::30)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MW4PR10MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbfd01d-1e92-4182-f96b-08dab736b7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSZI4QUeArM2ZP+06BiaOIXCHjBnkxYJQDaVZ72va6uY2JojH8GkEQIotY2DK3dh4y71Lsb9dO/2wJ7Pt+VezwLnYOcFi2x2M5D6otrSZPlSo4HDcOW5u5mMQhWDgyysAqVxMhbYeBOBsS4XmwCM750KB9MZWJAl3r7lf/j35fx7T8IjtagvbnTvrJM9cg15Uu2LtwTBntOkMM+47FWJ72U1mfx0zhLZLD8aIay5E/LwjdGfKAsx5lMLmc6XBlWxyb+IVqD4H9MPRj+PBYaVtAcid3MIHprCLHqqI7ebJGlx48yWQocQ+dIXgNvvKkdF2JhesrRoCiVdZT03EyN8uZuZ5g2nrLLSyCDjkUroZ2wagpyce2a7cDMXspTyVrzrs4RSpV5h4WL2KUmfo1Og+jfFxWHp2xKLGo6zw4lONVQJbZUVSju29TjfIq6cvp7r642/7RmEtB9paHMUCBgRQ6248iIfEKo+aYtZrAnTSRz6Qt/JzkDdwenujLI3UkHdeJs6fPRjKalmDJfzjS/6p87W/rW0CxDh9iZEovoNKZKi7wW5Fq9loC+LjmmL5UUU9oTGGHWhnQ/1hNcALT7L1VKNOa/Hrm775fdKtDCiR8yv1L7EuK18kLrOFXf0Sw9ATk0p/DfwyzOt3u9GbN8fqCNd+B84bHx6uk4Nf29b6mgzo3jnHNBClFbjHmvllSlqjRD2FkhFYlVkNlO5nrNPTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199015)(6486002)(6666004)(33716001)(86362001)(186003)(38100700002)(26005)(2906002)(66556008)(66476007)(54906003)(44832011)(4744005)(6916009)(5660300002)(6506007)(478600001)(4326008)(8936002)(66899015)(6512007)(316002)(9686003)(41300700001)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dBvmucCAqP+163txiSFJvFLZELfiUKzejHlp0imzEjLvanTTPf4TAu5r+Xo?=
 =?us-ascii?Q?fd25AmMkV2BvdgeYBuRtQgbO/gLyTksZzqvNArobxuhmKWgU377jCF88tBjD?=
 =?us-ascii?Q?Y/hlWQBCia4cPVe6+DGEnZCFEWCjBfUDVqOnxyFpRe31q/D7XQWT/Ujj5N/v?=
 =?us-ascii?Q?v4cEGczdHRjg1HIisCCfb33XNcCdSN7Qb7nDD1cBKAMcHGBg1Bzyi82FLuHJ?=
 =?us-ascii?Q?VqBlBu9c4gBtbK8GNcNHQuxOU/jybVnABso84nDFauYnQFfFzNa+dd0zFN4t?=
 =?us-ascii?Q?yMSAdO+WkiheuH9EkpnPnCi/x2PBqFCGM6cYwj+2/NlXIW8frFeMBEs1nQ5b?=
 =?us-ascii?Q?5wu7UBXjSWezBlKLyJDuzPUkXKEGdNfSOmak5yZSQvZAJG3c39pbAb8HrAc7?=
 =?us-ascii?Q?ydIwf2C49gRhQE+tTMqbGfjDPeOCD5D1PRzWaGNyJK6guLaGlFMeapHWyvYJ?=
 =?us-ascii?Q?Eng1UONjYZ1TdrK7hbwDCpA7nvlD48GhlbMQJ82iOOdRzKKcxIV805Inqbjt?=
 =?us-ascii?Q?wnsUUdmWFp30snRJEmTj73RnZMmTwXoTvIO3uJEgD4WlUaYh9rs5Mtkb5SRt?=
 =?us-ascii?Q?8hWbJjUgCI4uhnFS6n0cREPd0K4g1KunZEHDo5tpa3uMlKtWvWvYTpWCyVpY?=
 =?us-ascii?Q?w3meHikmxf3InLXFghKYOVzCkzhC0lBwRusasZ1ll78Yg5HYRk3btgJDkZ00?=
 =?us-ascii?Q?EV/FvDaeja6LV+WElY07vqZ1mkEvTNUzOiTsrm16qGX0OHAh3P5JMeKxoLgY?=
 =?us-ascii?Q?PASpKCNHT1yRD6omIrJfmrx1S9t1cB8dUj3mR93Otkc8AUGNN/icMKb+tdFK?=
 =?us-ascii?Q?9HBW85CMqyDiRqd6misV2oq4SEraNngPTMkcIOW45oPEBxOh+tWbT5rxuieL?=
 =?us-ascii?Q?ScCZCyp9zwASwU/THf6K4Gq7nsibxLtjtFNh41Rpxp7vxVxyy0sxgR4sB9jc?=
 =?us-ascii?Q?bk0acFsSSB52MBO7NRNfbOe6soytyTPnWCL7vk7EFP5g0zYjGqn7cZLwBTTB?=
 =?us-ascii?Q?MnKONEaEd0melsrrii20GMrw8aed6NebtCaZIxzq2AZY4zwVNOTe+c8mRxZ5?=
 =?us-ascii?Q?xRiSu8xTNdbl8JGdrFH64wENGE3DMNt0O+Q+p6jGgFkA+0TK3fVPkdIaSWlX?=
 =?us-ascii?Q?P21Dvt1PXUFR7virHbwzpNYRKTHSfICfg/N5sesjoT3IL9n1z57Drn8t+nJG?=
 =?us-ascii?Q?3PLe0nNBBUxXLu4DxgZZ/LlaYRuzgGohIvER+Uv2ES9c9wl5836ltJc0gfbu?=
 =?us-ascii?Q?FyT3BLTrVcH9tfCreZEgPVDMicm7aDLa0yBWG9e6UASB7WmeOd8DQaJs3eCj?=
 =?us-ascii?Q?o/Zj04nYcYFoDzNXtqzrvY0Qhm5kPDdJTQibCljJ5ig1ejGLKV/Ljlp1TDEk?=
 =?us-ascii?Q?CCeGGqIThYog+8Dk10Fqh9EH0f7UcKMNQnxrJGKKjg5iqhpHx5EcV5Wo9FU8?=
 =?us-ascii?Q?lS+2ZLQCo2OwkMeTh5GmjgkQbXj0uYwdbCw1ryfI449bF8mKveMMQkvEtdVs?=
 =?us-ascii?Q?CryJ1rKyNtFG1viD816oF3pcLY+VKzDfbKuBRdKLcsSagIgWWYgBg634FTPC?=
 =?us-ascii?Q?3G3d1+JgnvrIC+sbIg9i41tGWXHAhpXNMY8tKZClG29v6t7FkDpSprDMOa5G?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbfd01d-1e92-4182-f96b-08dab736b7d2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 09:44:46.8395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HC2gJxQRWBB50gWP6f26jpPgSonmEKQbfFmWFxl41TwggtuhWVMB63XtuQ/WXEZkMP0AqeHxdJ7IPbsFz7gILDhatbeAKLrE97ZsECxmhII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_05,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=700 phishscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260054
X-Proofpoint-GUID: 9r403wB-AZqF4YrJ231G5H5DAWRvo4bJ
X-Proofpoint-ORIG-GUID: 9r403wB-AZqF4YrJ231G5H5DAWRvo4bJ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 25, 2022 at 04:03:37PM +0000, Vanessa Page wrote:
> On its 64 dysfunctional delusional system

Hey Venessa,

I had been told you were removed from the linux-mtd@lists.infradead.org
list but I guess not.  I've sent you an unsubscribe email, if you just
click on the URL then you won't get these emails any more.

regards,
dan carpenter

