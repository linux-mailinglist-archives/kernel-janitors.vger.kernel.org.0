Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EAF2D1729
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 18:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgLGRJf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 12:09:35 -0500
Received: from mail-am6eur05on2076.outbound.protection.outlook.com ([40.107.22.76]:61568
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725822AbgLGRJe (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 12:09:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6eqVsqKXe3cWh5UHbu+QOUkIpNLfZ+TTKPeHxD1Rlvf8AjKTnfsZu70VnejWMSZujYhqYh+GKI/gbvqyaRKH36iBZt/pxb8qiNiVKwSmdb3avcCMxvQYDD1ObK7Ae6ZVxwcSVKRtKYiYb0L53EpAfa6Y6ZMi+E3qIyoCBD6DKqpbFSzVYimwsqC1ZuRNf8EWb7wVEAzPUmVQf3SzXSS+nUt5wMEYVYC3RpLPca7A67rRz4pDMZGGTIXNz8QI2lMrE6wWuorfMIJN9nB02zcUeoOyfZYdAVz/WhEsJFXo/cCb4AIDZO8AsgbiQl8uyNQCjyz55DHRJbbOwUpWL3MVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFFIMniBguEeXUdJYrLk4LstSXDKDO9wjNpZO/Q3iGo=;
 b=od8dEYaCsZHSkMVhUn/BAKaK0dAe+hecPj/pFKZz0cNE9SX9pr1H0ToMJZ3k1ttwfJH5MwvlPoQGIjIQf1Q9M2NPTozQcIBGVkZ8oqM9CCTJfGaHbaTvzIJRX+QuIDabIfpMCIOeKH5VwH1bmEFNduKW32Et+clKvbulRoNwfwcdrSM+/EU84LkwJ+wmyPo3EieEKdMHL0OI2D90fBT9pEScjqYiKeVaf2XW7tPw/3ILEbCETqzMgV3pp3zqldFce4Ed6fkR/WwNuNVC+N9I5Q9ZvB70xhx8xfQW8UXAsM5hlFTuzKFmovfexOM7ASTi/gUAtrEfbLw2xS1LxZ6Shw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFFIMniBguEeXUdJYrLk4LstSXDKDO9wjNpZO/Q3iGo=;
 b=fMu0amNE4n0Mm8mHtHovgwpgtPQ8oIl4te4hV75AJwEqJkFyxdwV+PS3a3jj9KKQxdhcC/y8wNjcaNMTaVhQ1iFjrSlqc4FKhTHg5XHQ/0fTpvtiydUUd+LLYOa2m70lR8kchRGg4yybXiYd4MjsuLeC+v9BbrpKbmqvCeJZ37I=
Received: from AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:aa::16)
 by AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:ed::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 17:08:14 +0000
Received: from AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5438:1932:b075:be6c]) by AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5438:1932:b075:be6c%6]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 17:08:14 +0000
From:   Adam Ward <Adam.Ward.opensource@diasemi.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Adam Ward <Adam.Ward.opensource@diasemi.com>
Subject: RE: [bug report] regulator: da9121: Add device variant regmaps
Thread-Topic: [bug report] regulator: da9121: Add device variant regmaps
Thread-Index: AQHWyk7MuH4J2nnATkSR9AhUCIpATqnr2LKw
Date:   Mon, 7 Dec 2020 17:08:14 +0000
Message-ID: <AM6PR10MB28077709482B54E7E9940E5FECCE0@AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM>
References: <X8pP/pZAj6W7/YfP@mwanda>
In-Reply-To: <X8pP/pZAj6W7/YfP@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac73e06a-34f4-41e7-821a-08d89ad2af0d
x-ms-traffictypediagnostic: AM6PR10MB3399:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB3399EB8785A358184A56D49ACBCE0@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E0pnUXLGccjT5z0TV5v4puU7USu7wxRGJQt2vei02LAYhWavBQBwrGJw4Qnx3vzTlIdXGSXi6fJgBvVgwXxXgKv+toLsHV4SMRTAYu/9CbHD0FaEmF4CXcdEDHM4Ijv/Nsugo1ZxR15RguQM17e9K5hlvWwdD2oN61a0YXH0y0JCqAaMjAeQw0DGqmav+hLaiM18DqZqasetOwOLA+XZUlz/G07UeB+BVm8zmoBKEnagJh6JJSsG/W1pwS0knkwLDtpG+VUEUNMfVpiqONu5ahQUqMYAey0G7a7eGeXH8pD1InO4/VIXNo/tumwGWG4SCV54uAQQ4bAghbiWzXTXLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(186003)(478600001)(86362001)(71200400001)(8676002)(33656002)(7696005)(66446008)(66946007)(8936002)(83380400001)(9686003)(76116006)(4326008)(55016002)(64756008)(52536014)(107886003)(5660300002)(6916009)(54906003)(66556008)(66476007)(26005)(4744005)(6506007)(2906002)(316002)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ARLrM6krC9VeURNEHoda7dHxoRN9c5kUjClsJMNBVcQlBApIA8I2lxbtoVbL?=
 =?us-ascii?Q?qUD+vRNie3U8T+MuQEm+qbN88ajtr7ZiKblVqA/m7DGh3enYbrhjjVnov3+Z?=
 =?us-ascii?Q?8EPzvxPUdaPn9EKgboMrsq32G7ALq7ijhIDutu91l/8/+Uz9hEEfpAe0dvdh?=
 =?us-ascii?Q?IwsDk/asrAOnhw9Szlh2qSGi7hjcpf0BvBQbw462Aa5287CrUTAIr0BczIQc?=
 =?us-ascii?Q?tLD1dJk+yLhZxYr/q8uLAkrptoHOG3M/WAMuvUiIi3ViYSrUcna3oY1PAne1?=
 =?us-ascii?Q?Fq+ASAsKf8d9NkqQmg2BWHqv2oMFnIwK59cW4x94UfDebSlJmn1//qFqsRQs?=
 =?us-ascii?Q?u/1ivkswms5PCpz4gn/BerN2+QFOvLGW7TgYTsCvl/1u7u3nyg4LcbSg0PV5?=
 =?us-ascii?Q?lfyvHfWEWGrqDmA4/QY7X4eOmPhB7ZiORahhTD8Ng/xWrA4wSbcWoXNPmFm6?=
 =?us-ascii?Q?RJ7PY4KqhMAxV5buX7tKRZMW+dgz9JvanEUUgwb9XItED5uWj/pysPTkAsuA?=
 =?us-ascii?Q?fZkSIyE0ToAa6KqF3JKTizazK5NDzOVqcNQE4+EamIxa23JcWGM/bEeph4Dp?=
 =?us-ascii?Q?1DjT8J7gRwBNPBSumj+633ctU2583nOUZYRthV/H2xYSZMa5JdBFbx6zRyIn?=
 =?us-ascii?Q?qK8m6vsdWekZ2R/mJhoaz3s8+eh3aK1w8N1fEcKxw2wlKBetOOCCxrCzSBmy?=
 =?us-ascii?Q?Vy8p+HMmgTOCL/3JpskGsIARLuf0qdTTfLupddQzq/MWDVePqn7LR1PMiT7R?=
 =?us-ascii?Q?T2Hsh7OGWRhxFEDlWGQ9/YCTCTNGZFPYvGGWpKi5UV4wjHscA104TUw7q2sE?=
 =?us-ascii?Q?v90vrCgq9+YHlycZKxaZQceu/7ZqZG0dEV3O+amE0TvqeBSjQRhWtSyz7p3P?=
 =?us-ascii?Q?uQSv7iNvCj3xKOfClOWNIAHWi2WV7aSlwSoVA8rSVQmSjG/f1j+dADMi7CMd?=
 =?us-ascii?Q?yvAjS4h+BGrX41dAaAFmE+Jz64vGq/k2Ay7pR0g7K9Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac73e06a-34f4-41e7-821a-08d89ad2af0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 17:08:14.3413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Nk0XXwxKS3PxdAmp+7zYGzsy70YnkFkTxacw9bcXFPlni95H4I/AUy7B3dXWnOVA9RhlwbslnFTZeHOUk7elA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3399
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 4 Dec 2020 15:05, Dan Carpenter wrote:

>    818          const char *name;
>                 ^^^^^^^^^^^^^^^^

>    868          if (!config_match) {
>    869                  dev_err(chip->dev, "Device tree configuration '%s=
' does not
> match detected device.\n", name);
>                                                                          =
                                      ^^^^
> "name" is never set.  What did you want it to be?

Ahh! Thought I'd removed that - thank you, another fine catch :-)

Regards,
Adam
