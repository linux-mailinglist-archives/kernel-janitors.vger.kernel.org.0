Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70B43202D9
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 May 2019 11:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfEPJum (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 May 2019 05:50:42 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:8657
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726336AbfEPJum (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 May 2019 05:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itdevltd.onmicrosoft.com; s=selector1-itdevltd-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlln6xkVkmQ+cRxTtCYizP+P0SQAeJFGJI7636bPADk=;
 b=bnbkXVLLeHM717rrSDkSLyFNIiiRGUN0EAtTo9cmSR+M0Xx9HyLmpyViRVu4UQukYAoV+GbZjJONV0vJS6SuxTUU0850Enw7Nv/qmelwuGoYnPO91C6OdWQD7brpSFPLa25txjYCOD73qPXudQWKOJul9DtU3a+k6tCEPOdGNjc=
Received: from VI1PR08MB3168.eurprd08.prod.outlook.com (52.133.15.143) by
 VI1PR08MB3392.eurprd08.prod.outlook.com (20.177.58.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 09:50:38 +0000
Received: from VI1PR08MB3168.eurprd08.prod.outlook.com
 ([fe80::8e9:9487:4f0a:fdaf]) by VI1PR08MB3168.eurprd08.prod.outlook.com
 ([fe80::8e9:9487:4f0a:fdaf%3]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 09:50:38 +0000
From:   Quentin Deslandes <quentin.deslandes@itdev.co.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        Forest Bond <forest@alittletooquiet.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: vt6656: remove unused variable
Thread-Topic: [PATCH] staging: vt6656: remove unused variable
Thread-Index: AQHVC8oVWbJV7t4C7kCfosLx3wTTvKZtfwmAgAADAIA=
Date:   Thu, 16 May 2019 09:50:38 +0000
Message-ID: <20190516095035.GA1692@qd-ubuntu>
References: <20190516093046.1400-1-quentin.deslandes@itdev.co.uk>
 <20190516093951.GA19798@kroah.com>
In-Reply-To: <20190516093951.GA19798@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0001.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::13) To VI1PR08MB3168.eurprd08.prod.outlook.com
 (2603:10a6:803:47::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=quentin.deslandes@itdev.co.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.21.227.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1db8b4a7-409b-4b4b-1264-08d6d9e3f360
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:VI1PR08MB3392;
x-ms-traffictypediagnostic: VI1PR08MB3392:
x-microsoft-antispam-prvs: <VI1PR08MB339238EFAADA657E7EA78DBFB30A0@VI1PR08MB3392.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(136003)(376002)(366004)(396003)(39830400003)(346002)(189003)(199004)(5660300002)(86362001)(14444005)(71190400001)(53936002)(6246003)(4326008)(508600001)(256004)(14454004)(74482002)(71200400001)(316002)(7736002)(8936002)(33656002)(6116002)(3846002)(26005)(9686003)(52116002)(73956011)(11346002)(476003)(68736007)(6436002)(446003)(66446008)(64756008)(66556008)(66946007)(66476007)(6512007)(44832011)(2906002)(76176011)(186003)(25786009)(102836004)(6506007)(66066001)(54906003)(6916009)(33716001)(386003)(81166006)(81156014)(8676002)(99286004)(1076003)(486006)(6486002)(305945005)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB3392;H:VI1PR08MB3168.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: itdev.co.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mNRdsLrgKN4P6dJ8O/M2DDffxxBAB5cQXM3vgLCvvuV3KJtm47gQG9Y4II7Eq6CYRxszK8AfcU3aJCg99VEfhNq7zOrLuerF0orEJbwBiVgjkyJhLWt2czC99edAYH9Lbf/+gGjbc16rK32lTp+FQ/w3pzt8BAn1ruakN34Rg52ppoMnBqD7ZY5wCqkwDDR+9EtAlCCAHdIa1xIlKQOWGaxG/UG6NEScVyjUjTatUD57QwJrmp/rsvbPGRNxNuSk9wdtCvBBbu365a3YoRqbQTF+15ctrFtD9/sGlRfpnfb8atRSBmJt1hZFKZhPx96Pdz177jo+k7ieiSMszXRTFV1OrQ67/CflFfw4/ltLUxq4c1F+eZOOOPf0leoZS98RutwwOutQyrqiDjXS8IHgnj1HgOMejacjd0VlqgA7+4s=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FF8F9C1DB4869D41B6546706B2547035@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: itdev.co.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db8b4a7-409b-4b4b-1264-08d6d9e3f360
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 09:50:38.7910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2d2930c4-2251-45b4-ad79-3582c5f41740
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3392
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 16, 2019 at 11:39:51AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 16, 2019 at 09:31:05AM +0000, Quentin Deslandes wrote:
> > Fixed 'set but not used' warning message on a status variable. The
> > called function returning the status code 'vnt_start_interrupt_urb()'
> > clean up after itself and the caller function
> > 'vnt_int_start_interrupt()' does not returns any value.
> >=20
> > Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
> > ---
> >  drivers/staging/vt6656/int.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/vt6656/int.c b/drivers/staging/vt6656/int.=
c
> > index 504424b19fcf..ac30ce72db5a 100644
> > --- a/drivers/staging/vt6656/int.c
> > +++ b/drivers/staging/vt6656/int.c
> > @@ -42,13 +42,12 @@ static const u8 fallback_rate1[5][5] =3D {
> >  void vnt_int_start_interrupt(struct vnt_private *priv)
> >  {
> >  	unsigned long flags;
> > -	int status;
> > =20
> >  	dev_dbg(&priv->usb->dev, "---->Interrupt Polling Thread\n");
> > =20
> >  	spin_lock_irqsave(&priv->lock, flags);
> > =20
> > -	status =3D vnt_start_interrupt_urb(priv);
> > +	vnt_start_interrupt_urb(priv);
>=20
> Shouldn't you fix this by erroring out if this fails?  Why ignore the
> errors?
>=20
> thanks,
>=20
> greg k-h

I could, however 'vnt_start_interrupt_urb()' already call 'dev_dbg()' if
it fails. Nothing is done after this debug call except returning an
error code.

'vnt_int_start_interrupt()' should, IMHO, return a status code, but the
original developer may have good reasons not to do so.

Thank you,
Quentin
