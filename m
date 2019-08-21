Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6277D9749B
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Aug 2019 10:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfHUIWJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Aug 2019 04:22:09 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:31817 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfHUIWI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Aug 2019 04:22:08 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: vECwdq1aDFTAwmkGku2QYZNw90USW7OybrjgKsE3xWAgPCK1Hu7aR5u3zCbXRMEfes3LTJlcti
 VphSAtBDmXVJYl8KlF0SUazJ5+sp3YCZ54BRFj3fKIXNkhw9De09kdt+PZldedkc5Y9/5OcW/J
 KeZKy4GjnRHhUItDwrUWcPjqpQOtsFCsLHLfE/KINkAmuWChGHkbjdqytNInbIUi4t8Z8fsMIQ
 Bzi1X/BLG0nDRlvBoYhUOylNmCf/LwVYBD8Y/c3NknkAxxBZ/01vuA1+w9A/H1yMvhHIMZ5MSv
 gCc=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="46037443"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Aug 2019 01:21:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 01:21:51 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 21 Aug 2019 01:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4/dBTQAIG5O4Q19OCEUvcmqbqmmSXOcFdWudPOrAP/Pcd75IEqktHL9G78F8J3+Jx583LX3jjVlvF/QM1SrLblC96slYu69XGPvgbBQz77b9ewpn00QaLwI/SpRh7LcxdWRtUqAUseIEnnawhmiJIxeCRUGzTJDdcL/Si3fQIEwc0Z2StXBipPrPZj8YJ5pgobFunqrk5pr3pvgfJvBloZEWe4xAb2QHfjglU834ZqIVrHeIc7zn9uGnrLXY62qwdgRKZ4WiqbMSNifDJdPFTkkeAjzcaMB7tnSK7cmNw+oVRqDESZY2upuNvqqR2ub8mtKDyRRbUMvaI4c11hL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0N/PNy3qjEYy+OSAgZO1XPi4CuK1rUyiF/ritMVUY=;
 b=TXVvMaAYnpkUvIYVNmr13fGR4FiZRLz40qPJpVlReLirim72SDdoMkpENkZuFqRjgn6FqAr4cIaICvPDl1rRsGzxu25QwP68mMdK2oZuLXfT5llpiMtFTwMrogdmrghwJfjtjGFj19j9DqEuFjE5srv627C3STsu+LAtqVWimSDHtn7IHUxC1BRCo/1XBiGEnxpEKqw7AkMrpDlpaW5pZ6x/2hETD/L0A9ZzfJQ0b24pYv6v+6+ZSOge9fNXXM0vna87gcvw1dV8cCUZeciOAxDHW6wDOuVQPetJeiDk9+kmunPtMhywWeJ8o0jW75p21MfhkQsg+8F9xfgA2eSVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0N/PNy3qjEYy+OSAgZO1XPi4CuK1rUyiF/ritMVUY=;
 b=k7pdeqBGSWq8Rp/tOdrwqbh79wlLeEyL0tgoOUEBMFjLVAw3mLh/IKAfkZUqHyNpC++stfRHJedoZzTrmmky6V/8V+xc/+wAdkZSMIgSg0wF89HHyyJw1ycjHlKflT05y+/I6mJYYZJNRZnWDBjURtRxwlI3eh51YOy2G0yRKV8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3918.namprd11.prod.outlook.com (10.255.180.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 08:21:45 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 08:21:45 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <dan.carpenter@oracle.com>, <marek.vasut@gmail.com>,
        <Cyrille.Pitchen@microchip.com>
CC:     <vigneshr@ti.com>, <richard@nod.at>,
        <kernel-janitors@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <miquel.raynal@bootlin.com>, <computersforpeace@gmail.com>,
        <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Topic: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Index: AQHVU0QrPPnbSj0lTEeIojqRI3TmEqcFTFmA
Date:   Wed, 21 Aug 2019 08:21:45 +0000
Message-ID: <dd7530d3-33e9-7d7c-e29b-fe786b159394@microchip.com>
References: <20190815083252.GD27238@mwanda>
In-Reply-To: <20190815083252.GD27238@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0197.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 236e7b12-c06d-4191-b923-08d726109a76
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR11MB3918;
x-ms-traffictypediagnostic: MN2PR11MB3918:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3918DB36B951EDD4A640B2BBF0AA0@MN2PR11MB3918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(66446008)(66476007)(64756008)(102836004)(486006)(52116002)(8936002)(36756003)(110136005)(446003)(2616005)(81156014)(316002)(81166006)(8676002)(6116002)(3846002)(31686004)(2906002)(26005)(966005)(11346002)(54906003)(76176011)(186003)(478600001)(71200400001)(71190400001)(14454004)(25786009)(66946007)(6306002)(53936002)(6246003)(229853002)(99286004)(4326008)(476003)(5660300002)(6506007)(6486002)(386003)(53546011)(6636002)(256004)(66066001)(86362001)(6436002)(305945005)(7736002)(14444005)(4744005)(6512007)(66556008)(31696002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR11MB3918;H:MN2PR11MB4448.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fXTC84tduy87B7tzvRA+BxfBRvXsEGKi4HfbEmliF83geseElnokVLJhzFlar+jbMsK1j+/d+x3okYzXbCCC+1qJPr/5Iq0qME58u4uPEMmULG6DVQ5OgMEEmrz508uGGXgwmvO5YfHgXI+idYjE5w7FWTFIA0wgdgT6cxNn3GACLmDs2Mq24xWum8NLOYM+uI9Txx36mo9U44XoagMoKmU97uhf5JPvFr91TDMCxSyKDO1VlLPXXFOmDKUIb8aS2i5Sy9mooMgCQ7Cv/WmLNt6EVtgf6jvUAyMYMLolyoKXYpWHmAKOdJZmHU6Q7CDu77MSjixlTQx8/8sUHb2vbCaxkHkAWOpE2/2HfSQTa0CFSsK4xZZbvwDlmddqteJOqRxDbC9iS7AkKZcp+OQu8YC1s/RjX+P3eXNAoJPLrK4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B3EF980CAA6DB418A75105AD54D5212@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 236e7b12-c06d-4191-b923-08d726109a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:21:45.2226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qL7xu1IMqRBP+V3LxlPh3njkPrH5kPgUbAbseD8NYtiFIvX0+c509WG4IzgC6nowMyIq5NICvBShGAbVm8ritzn1k3kM25ivEfqwpetoR64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3918
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQoNCk9uIDA4LzE1LzIwMTkgMTE6MzIgQU0sIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IEV4dGVy
bmFsIEUtTWFpbA0KPiANCj4gDQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaWYgInJldCIgaXMgbmVn
YXRpdmUgdGhlbiB3aGVuIHdlIGNoZWNrIGlmDQo+ICJyZXQgPiBsZW4iLCB0aGF0IGNvbmRpdGlv
biBpcyBnb2luZyB0byBiZSB0cnVlIGJlY2F1c2Ugb2YgdHlwZQ0KPiBwcm9tb3Rpb24uICBTbyB0
aGlzIHBhdGNoIHJlLW9yZGVycyB0aGUgY29kZSB0byBjaGVjayBmb3IgbmVnYXRpdmVzDQo+IGZp
cnN0IGFuZCBwcmVzZXJ2ZSB0aG9zZSBlcnJvciBjb2Rlcy4NCj4gDQo+IEZpeGVzOiBmMzg0YjM1
MmNiZjAgKCJtdGQ6IHNwaS1ub3I6IHBhcnNlIFNlcmlhbCBGbGFzaCBEaXNjb3ZlcmFibGUgUGFy
YW1ldGVycyAoU0ZEUCkgdGFibGVzIikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
c3BpLW5vci5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiANCg0KU2luY2UgdGhlIGJ1ZyB3YXMgbm90IGludHJvZHVjZWQgaW4g
dGhlIHByZXZpb3VzIHJlbGVhc2UgYW5kIHdlIGFyZSBxdWl0ZSBsYXRlDQpmb3IgbXRkL2ZpeGVz
LA0KDQpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L210ZC9saW51eC5naXQsDQpzcGktbm9yL25leHQgYnJhbmNoLg0KDQpUaGFua3MsDQp0
YQ0K
