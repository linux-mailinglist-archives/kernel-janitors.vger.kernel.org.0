Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF50BAE09
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Sep 2019 08:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393401AbfIWGyg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Sep 2019 02:54:36 -0400
Received: from mail-eopbgr00077.outbound.protection.outlook.com ([40.107.0.77]:9846
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393389AbfIWGyf (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Sep 2019 02:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr/UOvffhiEOEfzGlp/vSELCtLmA3aBVac6SW6glkAQ=;
 b=xL1Xl3962NvpWnvNqScgWnqp+HHmFhGe9+g2DbfN+OM4+0e9BfCbqDSBLf/cCgsYmlmkVTPfjj2s4DZObK0pxOy/jWQiD9F0HsYky0j7ppVk4Tqd46VHfW2dwbTiNqnSzUynmyo5tinB9smt65hqtL2BvGVxxm/B1/Ar5+3FFXs=
Received: from DB6PR0802CA0047.eurprd08.prod.outlook.com (2603:10a6:4:a3::33)
 by AM4PR0802MB2305.eurprd08.prod.outlook.com (2603:10a6:200:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 06:54:31 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by DB6PR0802CA0047.outlook.office365.com
 (2603:10a6:4:a3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 06:54:31 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 06:54:29 +0000
Received: ("Tessian outbound 968ab6b62146:v31"); Mon, 23 Sep 2019 06:54:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ed9bbb742a6d71f
X-CR-MTA-TID: 64aa7808
Received: from dedbbdc7622c.2 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.12.57])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 28BC0D02-DC55-4C7C-BDD0-584ACABE3532.1;
        Mon, 23 Sep 2019 06:54:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dedbbdc7622c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Sep 2019 06:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA44zHr9fZNWgcNlmMR82KkkeXMW79Y+FANWWxtffiC2BCNhDfuORfgxxRAAe1NugzeC18LLesbxUx3zdh9nWMTHDRfklnaoPO9fFVNta5e8aWbwksOEHdgZpbfJEXi6mTm2fWwV5cf+AgVypeg4IAdZwQeDMmo4FcKKKWWLt0ZDTNilh2daFPZ/k3xnBDcakGi0Cnp8SJu90FUIAiwGDdwM/SkQt1osWhShjVww+4YwYku4KYIOq8CQiiqov/cvwlFTh0J5thUFFqlY/y9jy+DNF2zReAYUql6KBCmmr6HEUtP9mBTYDJaA35CNCI7FsA5r94NeLNvnaAsEMRo6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr/UOvffhiEOEfzGlp/vSELCtLmA3aBVac6SW6glkAQ=;
 b=js6TgIP9lkJc02r0RTwXENPkUQUyvzxJ2yOvoa4fKQUnWOj6d3+nh36Ntgy5gvaO3eYCrvSqeRuJa3qQ1pevTHNC3AvKbVu74eULHv0hw8nnMBmVvxEjAQN3MP2yOdm2iB27XJ+0Pqt1zjrU3gDbKoa0OchSkRmNxiexJyj4FdEI0BgDAU/x6Ug0/+HcBQXtKn4G+K+vm53naj68tAqmovV79rLjeoRcI52bcxivIaENUVsev3oV3LMi9NnBXZ0MJS9G9aAVJSSWmL/uU4P9A8qp/hkNs+HbvwOtArnjM2EAq0e1uZH2MLDyG8AeavKmZ/nS4nTWiaulAF5xwitkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr/UOvffhiEOEfzGlp/vSELCtLmA3aBVac6SW6glkAQ=;
 b=xL1Xl3962NvpWnvNqScgWnqp+HHmFhGe9+g2DbfN+OM4+0e9BfCbqDSBLf/cCgsYmlmkVTPfjj2s4DZObK0pxOy/jWQiD9F0HsYky0j7ppVk4Tqd46VHfW2dwbTiNqnSzUynmyo5tinB9smt65hqtL2BvGVxxm/B1/Ar5+3FFXs=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 06:54:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 06:54:18 +0000
From:   "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To:     Markus Elfring <Markus.Elfring@web.de>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        nd <nd@arm.com>
Subject: Re: [PATCH] drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Topic: [PATCH] drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Index: AQHVcKUcmq8GSSSejEasIcMzV2KNa6c41h2A
Date:   Mon, 23 Sep 2019 06:54:18 +0000
Message-ID: <20190923065411.GA29903@jamwan02-TSP300>
References: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
In-Reply-To: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d47cc6b3-fb34-4c03-548b-08d73ff2e1c0
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB4752;
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|VE1PR08MB4752:|AM4PR0802MB2305:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB230512835EF7C3644B148F35B3850@AM4PR0802MB2305.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(4326008)(81156014)(66946007)(2906002)(6512007)(9686003)(11346002)(476003)(256004)(14444005)(66066001)(71190400001)(33716001)(33656002)(64756008)(8676002)(66446008)(14454004)(66476007)(66556008)(478600001)(486006)(6246003)(7736002)(305945005)(1076003)(446003)(52116002)(5660300002)(6436002)(6916009)(316002)(76176011)(6486002)(71200400001)(186003)(55236004)(386003)(6506007)(102836004)(26005)(229853002)(8936002)(54906003)(25786009)(86362001)(58126008)(81166006)(99286004)(3846002)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4752;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: NY1OuCZ2BIcKpCt0Sl6gG1UDhSwahwjbSqplYnu3fbLoKMbboMEOCOyXfa582hf65wWg69XPUOjTrGZkhFLq/RwFiUr0H1N97Q6V87QxlWnhNmS0h3fmeo29v9Seolgqn4CxZbkYaqFtCjrSBySkxQIi1gQqEw4Yzok6VnI1v+6vzcKuZREDcnCfhT5ULPniZLVuKxobkYd6AzgioSP88H20/I/g4U2SmmBKDmOWuYrsmT13La6wP4BgDvjWrhgUCGBJ3qxKvcZDjkIkRWLmjDjhzPqZR2CFlzZB/de7/tqX7PGTpNLSgg6IShx1cfL/HfwaUCpWLgZ6VYWPNuvMn/QOKMnkA60lUoUT7rkRdpYTOBPDfoK9gr7rZbY5jbLRnybGvBrtfnQvytb+U7tJ8NrKU3Exjr/pLK0MSOHZ4wg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F4D6190879F7344895855F7CC4AB2ACE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(7916004)(376002)(396003)(39850400004)(136003)(346002)(189003)(199004)(8676002)(81156014)(81166006)(476003)(33716001)(450100002)(6116002)(23726003)(3846002)(6512007)(229853002)(9686003)(2906002)(5660300002)(336012)(50466002)(70206006)(86362001)(36906005)(58126008)(76130400001)(14454004)(54906003)(486006)(25786009)(1076003)(126002)(356004)(478600001)(70586007)(26826003)(316002)(305945005)(4326008)(7736002)(6862004)(11346002)(446003)(63350400001)(76176011)(99286004)(102836004)(386003)(186003)(33656002)(26005)(14444005)(8746002)(6506007)(47776003)(8936002)(46406003)(66066001)(6486002)(6246003)(97756001)(22756006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM4PR0802MB2305;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9bdd355b-6fb7-4e9d-17cb-08d73ff2daec
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM4PR0802MB2305;
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: lkoaIpNqI8L8H9wKrRKCCysOOweR7fhZZPzY6XSMUxxAicv49RcasM9pr4pcVPTeVFQvyBEuY+x322xvHoFR7jrg5jFQ+fQOaaJyWL+It30xQK/2OLKs64ikMcb9lz4VSce5leWWzQVLFm/APgpXZwL8AKt0vbX8QxFTT/IL/93JeDoBSIPZ33g95pUZ3PxrfFTYVgBM1LHJZCR+qRMTZhNfjLDpV4t6qdLTSlVdFRiRM7jVQbZH4u4BIgbvf40F/7DkwPXIex7fIWspc30iAcaPOXPnWbVNwStDlNI420zmG7u7EMTCXRoZYla0HvBdS/Yfpo4hNs4BV8afl+8vkyEpXBDMRYu46fqugcpkqCX7Ap1JH+lCVGj3BfaBvWoV2mRQSDY4KwOaAxDbjGPrC5/zkP2IL3acZ1mH/OxLo+I=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:54:29.6997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d47cc6b3-fb34-4c03-548b-08d73ff2e1c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2305
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 21, 2019 at 07:50:46PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 19:43:51 +0200
>=20
> Simplify this function implementation by using a known wrapper function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gp=
u/drm/arm/display/komeda/komeda_dev.c
> index ca64a129c594..a387d923962e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -172,19 +172,12 @@ struct komeda_dev *komeda_dev_create(struct device =
*dev)
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	const struct komeda_product_data *product;
>  	struct komeda_dev *mdev;
> -	struct resource *io_res;
>  	int err =3D 0;
>=20
>  	product =3D of_device_get_match_data(dev);
>  	if (!product)
>  		return ERR_PTR(-ENODEV);
>=20
> -	io_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!io_res) {
> -		DRM_ERROR("No registers defined.\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
>  	mdev =3D devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
>  	if (!mdev)
>  		return ERR_PTR(-ENOMEM);
> @@ -192,7 +185,7 @@ struct komeda_dev *komeda_dev_create(struct device *d=
ev)
>  	mutex_init(&mdev->lock);
>=20
>  	mdev->dev =3D dev;
> -	mdev->reg_base =3D devm_ioremap_resource(dev, io_res);
> +	mdev->reg_base =3D devm_platform_ioremap_resource(pdev, 0);

Hi Markus:

Thank you for the patch.

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.co=
m>


>  	if (IS_ERR(mdev->reg_base)) {
>  		DRM_ERROR("Map register space failed.\n");
>  		err =3D PTR_ERR(mdev->reg_base);
> --
> 2.23.0
