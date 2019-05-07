Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F2F15DC1
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 May 2019 08:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfEGGyQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 May 2019 02:54:16 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:64144
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726253AbfEGGyQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 May 2019 02:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhvpes3VpmOQ0xZwFecuemYcOit9Os33qosHMvXrFfc=;
 b=Bh2IsawivUizAs9dHCWe9QhxJ2WyPyibbV4LEKoeJ7PVIuX9ThbbOqR6q+thlyOFv+H0/keR6hENFhxZu6SKkpQ1XlnXv9tWzdB005gsyYRhPKpb+yy6YnSv3Az34eEzEIdudfSS4mIM8M+swRCGa5Y9jVXMeO03dOPLwlX5kg0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2038.jpnprd01.prod.outlook.com (52.134.240.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 06:54:10 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 06:54:10 +0000
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
Thread-Index: AQHVAbHZRQFwxQU1WkWgjPAb4+UPXqZfPcpw
Date:   Tue, 7 May 2019 06:54:10 +0000
Message-ID: <OSBPR01MB2103C59136CB33ED587BC370B8310@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20190503131010.GJ29695@mwanda>
In-Reply-To: <20190503131010.GJ29695@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e8341f3-da04-47ef-4ced-08d6d2b8cedb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2038;
x-ms-traffictypediagnostic: OSBPR01MB2038:
x-microsoft-antispam-prvs: <OSBPR01MB2038C43FD5E29D2C118C23D9B8310@OSBPR01MB2038.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:294;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(366004)(136003)(346002)(189003)(199004)(51914003)(13464003)(3846002)(6116002)(52536014)(5660300002)(6246003)(68736007)(33656002)(6916009)(9686003)(6436002)(229853002)(53936002)(25786009)(4326008)(66476007)(73956011)(66446008)(55016002)(2906002)(107886003)(76116006)(478600001)(14454004)(64756008)(66556008)(66946007)(81166006)(26005)(81156014)(8676002)(11346002)(44832011)(486006)(53546011)(476003)(446003)(305945005)(86362001)(71200400001)(71190400001)(102836004)(8936002)(186003)(74316002)(7736002)(66066001)(316002)(7696005)(256004)(14444005)(99286004)(76176011)(6506007)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2038;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IB1uEpTgByv+1EEteNqd4Oa2Z4shH6e3HHrvRS9PZEge+tl3b8WrSg5YkKBLb9sucgIXgq2U+xH4BYuAWFo4iwdVIBjQ1S/+ha5dUbr1fxMBloRD7xxi0erApxDZrVSyP9uQhAcVar0U4TptA5evokBSBkvYfe71+egsFCKl6AV3ff2fmVobA45+CSYVxz+kbYV7uFx6Wiv4IYF7u6ylJsVG/9R/KZrw0RhovXWhCRmu/ze6T6viSWhc0xEpyhQnSwa6nkgnHpdJJgwDG6nlQDL1JgF41+lGhlKPPcX6WfICWEISDZ6ouZW7mXcuJgc2YVC9rGIssLV2fOo9X6zLGgB4dfnNIzd9FXUGIob0vVxSbgz908+nxcNV02kU+xmy8l+8clCT3wOtYYdh9ZqMq2TZ6VFE801KaVxeRS4SvlA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8341f3-da04-47ef-4ced-08d6d2b8cedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 06:54:10.3976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2038
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan Carpenter,

Thanks for the report.   Yes, the hardcoded check  "channel_num > 2" to be =
replaced with=20
some variable check to fix this issue.

How to reproduce this issue? So that I can I provide a fix.

I tried using smatch tool, but I get a different warning.

biju@be1yocto:/data/biju/linux-next$ make -j8 uImage LOADADDR=3D80008000 CH=
ECK=3D"/data/biju/smatch/smatch -p=3Dkernel" C=3D1 | tee warns.txt
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHECK   drivers/phy/renesas/phy-rcar-gen2.c
drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
  CC      drivers/phy/renesas/phy-rcar-gen2.o
  AR      drivers/phy/renesas/built-in.a
  AR      drivers/phy/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CHECK   init/version.c
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.o
  KSYM    .tmp_kallsyms1.o
  KSYM    .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map
  OBJCOPY arch/arm/boot/Image
  Kernel: arch/arm/boot/Image is ready
  GZIP    arch/arm/boot/compressed/piggy_data
  AS      arch/arm/boot/compressed/piggy.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-5.1.0-rc6-next-20190423-00
Created:      Tue May  7 07:40:23 2019
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    4671240 Bytes =3D 4561.76 kB =3D 4.45 MB
Load Address: 80008000
Entry Point:  80008000
  Kernel: arch/arm/boot/uImage is ready
biju@be1yocto:/data/biju/linux-next$ /data/biju/smatch/
c2xml           compat/         ctags           Documentation/  graph      =
     obfuscate       smatch_data/    sparse          sparsei         test-d=
issect    test-lexing     test-parsing    validation/    =20
cgcc            compile         cwchash/        example         gvpr/      =
     smatch          smatch_scripts/ sparsec         sparse-llvm     test-i=
nspect    test-linearize  test-unssa     =20
biju@be1yocto:/data/biju/linux-next$ /data/biju/smatch/smatch_scripts/kchec=
ker drivers/phy/renesas/
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHECK   drivers/phy/renesas/phy-rcar-gen2.c
drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn: passing=
 zero to 'PTR_ERR'
  CHECK   drivers/phy/renesas/phy-rcar-gen3-usb2.c
drivers/phy/renesas/phy-rcar-gen3-usb2.c:602 rcar_gen3_phy_usb2_probe() war=
n: passing zero to 'PTR_ERR'
drivers/phy/renesas/phy-rcar-gen3-usb2.c:670 rcar_gen3_phy_usb2_probe() war=
n: passing zero to 'PTR_ERR'
biju@be1yocto:/data/biju/linux-next$

regards,
Biju

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: 03 May 2019 14:10
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] phy: renesas: phy-rcar-gen2: Add support for r8a774=
70
>=20
> Hello Biju Das,
>=20
> The patch b7187e001a10: "phy: renesas: phy-rcar-gen2: Add support for
> r8a77470" from Apr 10, 2019, leads to the following static checker
> warning:
>=20
> 	drivers/phy/renesas/phy-rcar-gen2.c:403 rcar_gen2_phy_probe()
> 	warn: array off by one? 'data->select_value[channel_num]'
>=20
> drivers/phy/renesas/phy-rcar-gen2.c
>    262  static const u32 pci_select_value[][PHYS_PER_CHANNEL] =3D {
>    263          [0]     =3D { USBHS_UGCTRL2_USB0SEL_PCI,
> USBHS_UGCTRL2_USB0SEL_HS_USB },
>    264          [2]     =3D { USBHS_UGCTRL2_USB2SEL_PCI,
> USBHS_UGCTRL2_USB2SEL_USB30 },
>=20
> This select array has three elements.
>=20
>    265  };
>    266
>    267  static const u32 usb20_select_value[][PHYS_PER_CHANNEL] =3D {
>    268          { USBHS_UGCTRL2_USB0SEL_USB20,
> USBHS_UGCTRL2_USB0SEL_HS_USB20 },
>=20
> But this one only has two.
>=20
>    269  };
>    270
>    271  static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data =3D=
 {
>    272          .gen2_phy_ops =3D &rcar_gen2_phy_ops,
>    273          .select_value =3D pci_select_value,
>    274  };
>    275
>    276  static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data =3D {
>    277          .gen2_phy_ops =3D &rz_g1c_phy_ops,
>    278          .select_value =3D usb20_select_value,
>    279  };
>=20
> [ snip ]
>=20
>    382          for_each_child_of_node(dev->of_node, np) {
>    383                  struct rcar_gen2_channel *channel =3D drv->channe=
ls + i;
>    384                  u32 channel_num;
>    385                  int error, n;
>    386
>    387                  channel->of_node =3D np;
>    388                  channel->drv =3D drv;
>    389                  channel->selected_phy =3D -1;
>    390
>    391                  error =3D of_property_read_u32(np, "reg", &channe=
l_num);
>    392                  if (error || channel_num > 2) {
>                                      ^^^^^^^^^^^^^^^ The code seems to as=
sume they all
> have 3 elements
>=20
>    393                          dev_err(dev, "Invalid \"reg\" property\n"=
);
>    394                          return error;
>    395                  }
>    396                  channel->select_mask =3D select_mask[channel_num]=
;
>    397
>    398                  for (n =3D 0; n < PHYS_PER_CHANNEL; n++) {
>    399                          struct rcar_gen2_phy *phy =3D &channel->p=
hys[n];
>    400
>    401                          phy->channel =3D channel;
>    402                          phy->number =3D n;
>    403                          phy->select_value =3D data->select_value[=
channel_num][n];
>                                                     ^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^ Smatch
> warning.
>=20
>    404
>    405                          phy->phy =3D devm_phy_create(dev, NULL,
>    406                                                     data->gen2_phy=
_ops);
>    407                          if (IS_ERR(phy->phy)) {
>    408                                  dev_err(dev, "Failed to create PH=
Y\n");
>    409                                  return PTR_ERR(phy->phy);
>    410                          }
>    411                          phy_set_drvdata(phy->phy, phy);
>    412                  }
>    413
>    414                  i++;
>    415          }
>=20
> regards,
> dan carpenter
