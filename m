Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 310F9973AB
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Aug 2019 09:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfHUHg0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Aug 2019 03:36:26 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:47620 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbfHUHg0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Aug 2019 03:36:26 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Tt8oUaJuLfPMHQUyZvVHnP5JlrhyOhLFdEv8AFHC1XbzQWV43BnRzx75kta8wlsYeGNah6F/iL
 4HkooCE3q7UoeP5wsetF96kDMdV7NfFMVIrKR8uMvUuZSTbBB1FCTjheAyOctg5ZvftStxn7KA
 Ncbmoy0uY7dxq8LhXe3fI3Q597LJnPCrqXkhnrzSu9L3SevFKgeYtMy/dwsdq0HvmeMJTNQZMI
 u3c2cSR6ae7i96NY+EUnVUM9VGEIN26qwWQ3L3qB+qPMDz8Nz7QcoTbEveZdmU5zK09A0FCEFS
 ZYM=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="45930593"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Aug 2019 00:35:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 00:35:23 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 21 Aug 2019 00:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/RQgAk1ueqpWsU3rgTnGUXKVNb6/p5HAEfirQM7ZyZkEa15le3TKsZtlur3fnD6hYLI8thiu1Wg3Kg73Tug5TzkvWgyWJNtWZ6W+Q63snDA1XUBXMXLoZzJDRtwSDmm+U9RstnmAvS5dkUQEWbmzk+Hueza2FwuqLpTvF+sirrX2jOs1oxZIjy4Okd3TIdRBgvTWLEv5Bbt8MxHUqVcOoB3h2fx62MPR0POJVeuP7p/pzZVqMD0BHxGtfSCC/CfCiDhD2Ghf4+9f2yuWS0X6nAeIZvpvfaMwiucKJ2OaCe1jqrwxDbD1CrrmhjBq3P1GRXC1V+ivgr37cfsSdkzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+fVtzxmUrnBz/vV6eqepDd/MrR4CJ6LyK5Rtl2JVaA=;
 b=NmlnuSWHpbz8yg8INdudRzz9WkhFDd+bLYWV9x104RUbl9gki050rauBR+1JZ7NXicULrbIcReaFsOsU1wmpY+Nw5u1TpJNBXlFWK2KdVuhavxudS8+MS2VK2viZ8mBBWdwEzBM+TnRw9zzxTPc9kCdJZVwHbyT4Zdxc89yu/QUa4gmKYFGvfEPjkWMMW1jJ0FYTwHGtm+c98erckavp3ZwnQ7391Ak3gdCYOShjPH8G3yDKm+9QyNFDAEVSCd3VDCxaD9fXtDhjnZxjDX+TUBXQjI/k1nFpFxlaAKcvvB4hZH9psD6TfrWQaA09qpZcGcEGKqcH30AS96cuHYrRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+fVtzxmUrnBz/vV6eqepDd/MrR4CJ6LyK5Rtl2JVaA=;
 b=fK/bRw+UpEeaUBzE990MNdqLKjLca0US6vzRr8iEPBfoQvEQEEX/mTuGgW5QJDSWF8VmqC+mJN3EVLR97GHPUhCmv6QVvIQ0nxtBnyPcUTtTNn7sy8EApm8z0Jc8ajgYl0CJm5CFGkhPo0W3f4RD7e7b0kVd1hoQ/EoMSUsVBZo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4191.namprd11.prod.outlook.com (20.179.151.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 07:35:21 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 07:35:21 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <dan.carpenter@oracle.com>, <marek.vasut@gmail.com>,
        <Cyrille.Pitchen@microchip.com>
CC:     <vigneshr@ti.com>, <richard@nod.at>,
        <kernel-janitors@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <miquel.raynal@bootlin.com>, <computersforpeace@gmail.com>,
        <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Topic: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Index: AQHVU0QrPPnbSj0lTEeIojqRI3TmEqcFP2eA
Date:   Wed, 21 Aug 2019 07:35:21 +0000
Message-ID: <568a064f-af88-bfd6-b50c-208f9cc9f8b0@microchip.com>
References: <20190815083252.GD27238@mwanda>
In-Reply-To: <20190815083252.GD27238@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0134.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::32) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a71ad79b-6da4-4b22-41fe-08d7260a1f53
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MN2PR11MB4191;
x-ms-traffictypediagnostic: MN2PR11MB4191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB4191B4B8B8E2A8592C8AA476F0AA0@MN2PR11MB4191.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(54906003)(6436002)(31696002)(66066001)(186003)(26005)(6512007)(86362001)(6116002)(2906002)(2616005)(64756008)(486006)(3846002)(476003)(316002)(4326008)(31686004)(66556008)(66476007)(11346002)(66446008)(25786009)(386003)(53936002)(7736002)(14444005)(53546011)(256004)(102836004)(6246003)(36756003)(446003)(110136005)(14454004)(66946007)(5660300002)(99286004)(52116002)(8936002)(71200400001)(6486002)(71190400001)(229853002)(8676002)(81166006)(305945005)(6506007)(478600001)(81156014)(6636002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR11MB4191;H:MN2PR11MB4448.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K7NgtsFSPmDe0WfSNZGaGsL1S/6YC+1ZatL3uB8VOJJyrLHfRWqKzo+xqmFJLZaM6hLDPR5mfry96MYU6DPXO2+7BnvVBnnoCkZaPxYypv3S3hJjL6jN8gBGC9FqB7CtdoU1M7eHQ41mpbT2txpYIDMIl+WmZyWEsQM8Tw3ajxAEDv8RpsLVZ7sibtQLFgKpd94KuIlBX5OdR+XrC7b38lZmvUwJSSrtJN9NrlJbgawICcO8KIPsq+e2e4a02momi9p1aYCmwRLImi72rU2yOa8pWAotOIp/PA7OtXKggwhDG0wPxkZ4t4uCrtG5i0TOoT6mydG2JlmqWMFRM/RnT75bnSwB2Nc3uKxmD9cWyMOtcqFiOgboHTZmbVyZ4blHtX9wAKoS46MJ9mrfPkhvmwdQ5QJuPvrY0YDRlR3iw50=
Content-Type: text/plain; charset="utf-8"
Content-ID: <024A93CC4742BC43B93E0E4F36AC1DB2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a71ad79b-6da4-4b22-41fe-08d7260a1f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 07:35:21.4592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFGx48J3UR+XgOuGGsJPDHzSWQIHHYhj1BNHDYmG+Syfw/Gg0VCYwSUlZk/NzbbWo+TBscJBGrngkgT1DvZLKS/GLqKQXtcI+clhdFw+KHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4191
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
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KDQpSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8
dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9tdGQvc3Bp
LW5vci9zcGktbm9yLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBpbmRleCA2M2Fm
ODc2MDliYWMuLjk4NmIwNzU0NDk1ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gQEAg
LTI5MDMsMTAgKzI5MDMsMTAgQEAgc3RhdGljIGludCBzcGlfbm9yX3JlYWRfcmF3KHN0cnVjdCBz
cGlfbm9yICpub3IsIHUzMiBhZGRyLCBzaXplX3QgbGVuLCB1OCAqYnVmKQ0KPiAgDQo+ICAJd2hp
bGUgKGxlbikgew0KPiAgCQlyZXQgPSBzcGlfbm9yX3JlYWRfZGF0YShub3IsIGFkZHIsIGxlbiwg
YnVmKTsNCj4gLQkJaWYgKCFyZXQgfHwgcmV0ID4gbGVuKQ0KPiAtCQkJcmV0dXJuIC1FSU87DQo+
ICAJCWlmIChyZXQgPCAwKQ0KPiAgCQkJcmV0dXJuIHJldDsNCj4gKwkJaWYgKCFyZXQgfHwgcmV0
ID4gbGVuKQ0KPiArCQkJcmV0dXJuIC1FSU87DQo+ICANCj4gIAkJYnVmICs9IHJldDsNCj4gIAkJ
YWRkciArPSByZXQ7DQo+IA0K
