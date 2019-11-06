Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387B9F1B69
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Nov 2019 17:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731973AbfKFQhI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Nov 2019 11:37:08 -0500
Received: from mail-eopbgr150053.outbound.protection.outlook.com ([40.107.15.53]:25001
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727699AbfKFQhI (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Nov 2019 11:37:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgtgKaHM5rTLvGGlNdlii8gIy9i9vj0viLiOmIlKKlKnUKSydIcb3Ljf3lKwfY8VRrOsIIbueWs8e+6WMxEF0kCg4MtmQId/bQLjWt++eij54ROH0B+8LQ0lPkQnV2c3GYfiOUXxdz1shohzIqz5g3dAeWOhPifFxqlLW9tdUrN1PlNTVlUpDhs8ZOJe1XItPFNt+NAGtKEFHR2umXM8dtZtpnVHUArYghfYriSO32M/aZ5c4hMHJZebQ33j8Ov8cMPJ+CG6GySqPYpiqYDcI82bOZ0aU7RfabvrPcuhL5ECWPd27BgaeV+2MSn+r/w5zgzk2V5npPWp7ysPO9Uw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHNtKUMLPb2Vzxptn1zH3W/OY8Q0alFYgvKZHGIxfA0=;
 b=K5AmUAlTWbLUHxxq8rQfWRB4Iie85hK2Xe5qKrYUhYA7NiHIKmR6lLBZRPzdPBv+HPMR/5p2oJlLxlAwfFJ95HFV8mWEtkM503DE8Aox0YUBoDtgHIHafooaJwml7Ztk0iKjOpjJJcWS/1zHpZziIDpFdQv4dtA6sHUBRb1YpKT7//MI0FZt8nU8lN+M9gf6oDqOsTZS9jwzHF1MA+AvnNSLG5ZJPWAwqGSm693oBmNiBCSspn8YwU5SxAhX9SdV0yj4rWkzU9Qmbbh4A+4H/WKSZ7VAiy/VeBJ7IdVxupb9TqT+wOnlBJ6/enog52HktEH8tdUuS8QPTSk/MnWPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHNtKUMLPb2Vzxptn1zH3W/OY8Q0alFYgvKZHGIxfA0=;
 b=mkn92g+eWkPRLqGncYYJIVLhapyzPPWvhYmcMnAbTMxRWZHUEFM2ix1SpvTR1GmSq2o0wswuln/kbsLwj9H1+DYClZYVUSiqRvfRMuThpeQuKw0LxVs44V+cP/onB7rtXvneJMpun9J5+IrBXshIoasQBlbHi5ufx3Ps4G6oW80=
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com (10.172.245.7) by
 DB6PR0402MB2837.eurprd04.prod.outlook.com (10.172.247.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 16:37:05 +0000
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::4a8:4223:6954:59b9]) by DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::4a8:4223:6954:59b9%9]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 16:37:05 +0000
From:   Ioana Ciornei <ioana.ciornei@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] dpaa2-eth: add MAC/PHY support through phylink
Thread-Topic: [bug report] dpaa2-eth: add MAC/PHY support through phylink
Thread-Index: AQHVlHuF29raGclBMU6N8+44Yyj21Kd+V71w
Date:   Wed, 6 Nov 2019 16:37:04 +0000
Message-ID: <DB6PR0402MB278955B6020E0ECA1ED3992FE0790@DB6PR0402MB2789.eurprd04.prod.outlook.com>
References: <20191106082329.GA32733@mwanda>
In-Reply-To: <20191106082329.GA32733@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ioana.ciornei@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f2888142-db7f-4196-bfc9-08d762d78ee1
x-ms-traffictypediagnostic: DB6PR0402MB2837:
x-microsoft-antispam-prvs: <DB6PR0402MB28376C8C025988B8C90D5558E0790@DB6PR0402MB2837.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(189003)(199004)(51914003)(186003)(86362001)(64756008)(66446008)(305945005)(6506007)(74316002)(7696005)(5660300002)(316002)(76116006)(99286004)(66946007)(66556008)(66476007)(52536014)(76176011)(14454004)(3846002)(6116002)(4744005)(7736002)(478600001)(81166006)(81156014)(6916009)(55016002)(14444005)(9686003)(6246003)(44832011)(476003)(71200400001)(71190400001)(8676002)(8936002)(256004)(66066001)(26005)(102836004)(2906002)(11346002)(229853002)(4326008)(446003)(25786009)(33656002)(486006)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0402MB2837;H:DB6PR0402MB2789.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5pL5a/zVB6USLp7XOKIM+3xbCUpyD5pzYxJR9EXXm2++yXS+Ab1ZNOx03/G6C2jyfmttkwPfbTg2o/OHeSpBPC5sGahzua9x9RandOb2tFegOfbmv1kBfmubXnlMM75Lx/d+dopsa3DpjDh0/WA0d0+JXUInGKLuE+8EzNYezuxQhqoujnIKBHuObI7URj3X1AoEL7WAiSOkXleYcfpbpKtgVJ5JRg5COmwdK8FSaJO8g2x/dUHQumfUUlujPE4JreD0QyOucJ/NynzBf96/AYlLgFfpct3jqaFtR49dfQMlqEUAFrCJb+F++xGGHSBuliLwwHyav0cA7047goxDq4/tJWv/Ne94agIogdIbADKiaWvJleme5gk13nWu0nkwB/vN6jdYSfjNtQD/GVmoWTm+2UEwBL7EQxzAvjXNnPtjF2v6Ac5UYfnRou8Vl+qz
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2888142-db7f-4196-bfc9-08d762d78ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 16:37:04.8695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0M3zL6KxRcXNBJ3zcL1wetUI9KQPj/aYPKELSZjY+GpLBqnXgvzHWjiq+P5oAl3IKsgUfaCBnsueGF73HYJCrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2837
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> Subject: [bug report] dpaa2-eth: add MAC/PHY support through phylink
>=20
> Hello Ioana Ciornei,
>=20
> The patch 719479230893: "dpaa2-eth: add MAC/PHY support through
> phylink" from Oct 31, 2019, leads to the following static checker
> warning:
>=20
> 	drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:55
> dpaa2_mac_get_if_mode()
> 	warn: always true condition '(if_mode >=3D 0) =3D> (0-u32max >=3D 0)'
>=20
> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
>     44  static int dpaa2_mac_get_if_mode(struct device_node *node,
>     45                                   struct dpmac_attr attr)
>     46  {
>     47          phy_interface_t if_mode;
>     48          int err;
>     49
>     50          err =3D of_get_phy_mode(node, &if_mode);
>     51          if (!err)
>     52                  return if_mode;
>     53
>     54          if_mode =3D phy_mode(attr.eth_if);
>     55          if (if_mode >=3D 0)
>                     ^^^^^^^^^^^^
> This enum is unsigned so the condition is always true.
>=20
>     56                  return if_mode;
>     57
>     58          return -ENODEV;
>     59  }
>=20
> regards,
> dan carpenter

Thanks for the bug report, will send a fix.

Ioana
