Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C1518812
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2019 11:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfEIJ7M (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 May 2019 05:59:12 -0400
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:44611
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725826AbfEIJ7M (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 May 2019 05:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf2ZRnKLFN32ECS+NNge+t6W94qxcIwYdfkPOoVOjXw=;
 b=DQa0aB85YKmtGT6ACy3dv5PdC3tI/0NrInGPXw/hQbzWlfwVYjfuOIisggsCa/l/0EKoAECOzIYPqDwqR1Owf5U8NJrjktxj/8lsmR46L0kDQEIVlal4JI7V26GtW7ZcHRhxAc0b+VOnQSiYo1zqnwRQ11qRYZu60Kq+HmxABrk=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3223.jpnprd01.prod.outlook.com (52.134.255.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 09:59:09 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 09:59:09 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [bug report] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Topic: [bug report] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Index: AQHVAbHZRQFwxQU1WkWgjPAb4+UPXqZfPcpwgANPFgCAAAKcUA==
Date:   Thu, 9 May 2019 09:59:08 +0000
Message-ID: <OSBPR01MB21033A9C4FA8CB03E379E0C5B8330@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20190503131010.GJ29695@mwanda>
 <OSBPR01MB2103C59136CB33ED587BC370B8310@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190509091815.GZ2239@kadam>
In-Reply-To: <20190509091815.GZ2239@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfecc24a-6060-419b-a687-08d6d464fadc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3223;
x-ms-traffictypediagnostic: OSBPR01MB3223:
x-microsoft-antispam-prvs: <OSBPR01MB32234A0BF4E3A2F28787BD17B8330@OSBPR01MB3223.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(396003)(39860400002)(346002)(376002)(189003)(51914003)(199004)(4326008)(71190400001)(256004)(229853002)(25786009)(66556008)(6916009)(6116002)(3846002)(2906002)(81156014)(81166006)(8936002)(102836004)(6506007)(8676002)(74316002)(68736007)(54906003)(55016002)(305945005)(6436002)(76176011)(99286004)(7736002)(71200400001)(33656002)(446003)(476003)(11346002)(486006)(44832011)(53936002)(6246003)(107886003)(66946007)(66476007)(76116006)(73956011)(66446008)(64756008)(66066001)(316002)(26005)(478600001)(186003)(14454004)(86362001)(7696005)(52536014)(9686003)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3223;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zglrUZi0CsNCBJP45egRhfu85c0p5EXfyB4t0b+2mvprDUyilNUNJGSv6eycRlj9rvtJYwCDhxAh8bCi/VfbKyrs40uaxQsvMlfuQAvxC7SIOEQwXSmTDWTAthAs6yd1BC5TU/5KPzwNFRbYntPE9PnqUJGiYq4lDOWH8XpUfExKmVb7bly+3PyLM9E47716B+wOwNtjHN5Ed3UxytWzX95X6TJPExjJuEadMql06bH0JhA+j2WKgBOzCUtzofR/RC/zDK/emeuoyl+h9DHqGI8e7AOCIdvtieTVRs+2DY20GvrT9aDiskLWb6Xp6S6AiTpWXTaJsATugVmUgiW30oVmGjHzbzuzeGxq8u2J3FjnlZlWXcwGV2Xk1j9LHmLYo5vmcatLa8xLyNVyxYj0KGK6YCyGEcVN2IggAaiUe7Y=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfecc24a-6060-419b-a687-08d6d464fadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 09:59:08.7554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3223
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan Carpenter,

Thanks for the feedback.

> Subject: Re: [bug report] phy: renesas: phy-rcar-gen2: Add support for
> r8a77470
>=20
> That check hasn't been released.  (It marks every "if (foo > bar) " as of=
f by
> one unless it can be proved as okay...

OK. Good to know.

> On Tue, May 07, 2019 at 06:54:10AM +0000, Biju Das wrote:
> > biju@be1yocto:/data/biju/linux-next$
> /data/biju/smatch/smatch_scripts/kchecker drivers/phy/renesas/
> >   CHECK   scripts/mod/empty.c
> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   CHECK   drivers/phy/renesas/phy-rcar-gen2.c
> > drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn:
> passing zero to 'PTR_ERR'
> > drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn:
> passing zero to 'PTR_ERR'
> > drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn:
> passing zero to 'PTR_ERR'
> > drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn:
> passing zero to 'PTR_ERR'
> >   CHECK   drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > drivers/phy/renesas/phy-rcar-gen3-usb2.c:602
> rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
> > drivers/phy/renesas/phy-rcar-gen3-usb2.c:670
> rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
> > biju@be1yocto:/data/biju/linux-next$
>=20
> Are you using the latest Smatch code?  I'm trying to figure out how to
> reproduce these false and it feels like it should be really easy to do a =
fresh
> clone and clean kernel tree but I can't make it work.
>=20
> I got them for a while, but I fixed it and I thought I had pushed all the=
 fixes...

I am sure ,I have used the latest snapshot from master branch.

Regards,
Biju
