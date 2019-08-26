Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA5209D052
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Aug 2019 15:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731939AbfHZNXM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Aug 2019 09:23:12 -0400
Received: from mail-eopbgr60079.outbound.protection.outlook.com ([40.107.6.79]:10053
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726953AbfHZNXL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Aug 2019 09:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6EoZ1ogx2AHuHdRwa/Y9pXhyIM25jjuoI38AR2rjyoR1SPt1h9v82o99yePqpTJ5OCak6sWA0Cs8dGNDB7RTosf0kvELHF0CE+NTzUriXRnv+x/ofegihezmaRsUz28GpsA8JlR8CC1elYYoXcmfxa3J/PdsDs3ihMeOrr/R0TMinywNAZTGWC+wF/CjkTN1EisEmeFaH0NQjN+dwcXlbTiRbyILNfsdnXumvkk6tLBkZQjUiW+6dmFsS31rGzC1V+wsXyyCs5aZ/BVTt5tZMoMUlTuXmeqEG3sX9eVSLUULfm5bY7k7e3Q0CvO7fz8y9t6PCMZ+l+PyoAgzvTWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KnCWMhXm9BiS+56dLkTE6qe3XJa97j6yAQM+7feA7Q=;
 b=YKbiL+Hj8Q1XgR1xt6l8/g3h+iMWKhPjxjBN3q0h56c6HG5HdvfbyQAO2K5QCCoICbsFTi5lb/6HmuwJOUcB5RtJkrN9kiXpjqmjFGYpywrIYTgdz6K6H6pkX+/ECi2IZWUA/3+OnFgDu9VIxmRfK8B0OCl8y63oV5q4dSfAWbQ7AP8i/6LSyi8743lUjyS+fv3o6gjNMzsKUhtUDMXjvYMk60WJAH5o1qBQFQimKoLlV8JiBFHeNPQhCJU8QgKBhorlQhg0Yo8CR2P8HIWTDzjg15kiH/ZC0JZk5Sj2SgAv4C+i5XnjauszO24q9mLlqzMkW5wEQQ7tbvIO0+FjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KnCWMhXm9BiS+56dLkTE6qe3XJa97j6yAQM+7feA7Q=;
 b=IOi2E6lCz5m4VpMk1OcVrEojpvIVs/rOsTl4geJ7+M3WOU1nFUzED0A4KKMWeprTJVD0xLE45q+ZHV+EAouZRmiAMb7sdVNc+EQAp+lI6aYfNrVzmWGAAP+WEt9rDcmnqKEUZUvAH/FeB3QEryMbtVDyv7DJ9Euofsoq0v2oIK8=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB4336.eurprd04.prod.outlook.com (52.134.122.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 26 Aug 2019 13:23:08 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 13:23:08 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "perex@perex.cz" <perex@perex.cz>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check
Thread-Topic: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check
Thread-Index: AQHVXBDgCtPrhV88m0i/O5piEeMtz6cNaqmA
Date:   Mon, 26 Aug 2019 13:23:07 +0000
Message-ID: <17ba2fb20a06d3e167005db6a225ef68f6b78777.camel@nxp.com>
References: <20190826131855.GA6840@mwanda>
In-Reply-To: <20190826131855.GA6840@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 719f797b-aa77-4f13-98e6-08d72a2888fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB4336;
x-ms-traffictypediagnostic: VI1PR04MB4336:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43365BF2DC5452DC7E595A72F9A10@VI1PR04MB4336.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(199004)(189003)(14454004)(36756003)(54906003)(71200400001)(81166006)(71190400001)(50226002)(118296001)(486006)(316002)(7736002)(25786009)(81156014)(11346002)(2616005)(7416002)(229853002)(99286004)(5660300002)(476003)(6246003)(86362001)(2906002)(446003)(44832011)(6512007)(66066001)(305945005)(4326008)(76176011)(478600001)(256004)(186003)(8936002)(91956017)(76116006)(2501003)(6486002)(8676002)(6116002)(66446008)(6436002)(26005)(66946007)(64756008)(66476007)(66556008)(110136005)(3846002)(53936002)(102836004)(4744005)(6506007)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4336;H:VI1PR04MB4094.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tdoEPlbcEw3hNoNF/pBwE/Aug8HhSMumxOM4i7XZBzp4sHaqx7NJZbH3aTBBoyT/hVMtKhGzEmCaAcyCdexEnU5EUq70o+uo58/6ZMDkc7PM+BYkAHZS/JzN7MH63BAHJeLn15ACDmSIBFed2AAE1kf5C5bGr5jCQpFxgKew+sKaor8/WJQga1rHwJbD/x0UCUX+4bH3E7qRYVLKTiDOOiyCrxzmfszUf+hmwZ/UgM9BLi4+/mI1aZfAqXivf/7bVEFtE17IJPZuIfdAM6SaA7GsK3KNusloLVZ2ISooH17Ie40W2TMjodcVoqFHoHkzCPIYHe9DsmT3UFlXUaOzVp6Fz53OaZge4G3TUFiM1tlKnTCV2lPo1//UDWRKbq/Dis/KA1pbneXbqoXmvMZYg5cRauia45cL53DWgKC0Z0s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C4EB5DE8D1910478CB520EFEE79939D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719f797b-aa77-4f13-98e6-08d72a2888fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 13:23:07.9909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iRuc0UGroRKP8kYyLhswQURY8KVdWukx4m37Zrno4nqqXdZycIyostHTQaDVCLrbzoOo7PlYrx2sNgRoc3MjXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4336
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTI2IGF0IDE2OjE4ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgZGV2aWNlX2xpbmtfYWRkKCkgZnVuY3Rpb24gb25seSByZXR1cm5zIE5VTEwgb24gZXJy
b3IsIGl0IGRvZXNuJ3QNCj4gcmV0dXJuIGVycm9yIHBvaW50ZXJzLg0KPiANCj4gRml4ZXM6IDIw
MmFjYzU2NWExZiAoIkFTb0M6IFNPRjogaW14OiBBZGQgaS5NWDggSFcgc3VwcG9ydCIpDQo+IFNp
Z25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCg0K
VGhhbmtzIERhbiEgTmljZSBjYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRh
bmllbC5iYWx1dGFAbnhwLmNvbT4NCg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9zb2YvaW14L2lteDgu
YyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL2lteC9pbXg4LmMgYi9zb3Vu
ZC9zb2Mvc29mL2lteC9pbXg4LmMNCj4gaW5kZXggZTUwMmY1ODQyMDdmLi40MWFkM2EzMTA4MDgg
MTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9zb2YvaW14L2lteDguYw0KPiArKysgYi9zb3VuZC9z
b2Mvc29mL2lteC9pbXg4LmMNCj4gQEAgLTIyNyw4ICsyMjcsOCBAQCBzdGF0aWMgaW50IGlteDhf
cHJvYmUoc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2KQ0KPiAgCQkJCQkJRExfRkxBR19TVEFURUxF
U1MgfA0KPiAgCQkJCQkJRExfRkxBR19QTV9SVU5USU1FIHwNCj4gIAkJCQkJCURMX0ZMQUdfUlBN
X0FDVElWRSk7DQo+IC0JCWlmIChJU19FUlIocHJpdi0+bGlua1tpXSkpIHsNCj4gLQkJCXJldCA9
IFBUUl9FUlIocHJpdi0+bGlua1tpXSk7DQo+ICsJCWlmICghcHJpdi0+bGlua1tpXSkgew0KPiAr
CQkJcmV0ID0gLUVOT01FTTsNCj4gIAkJCWRldl9wbV9kb21haW5fZGV0YWNoKHByaXYtPnBkX2Rl
dltpXSwgZmFsc2UpOw0KPiAgCQkJZ290byBleGl0X3Vucm9sbF9wbTsNCj4gIAkJfQ0K
