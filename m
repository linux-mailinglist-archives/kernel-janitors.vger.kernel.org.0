Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EA614C81B
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 Jan 2020 10:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgA2JbM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 Jan 2020 04:31:12 -0500
Received: from mail-eopbgr80123.outbound.protection.outlook.com ([40.107.8.123]:17639
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726010AbgA2JbM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Jan 2020 04:31:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzUH5IJgyDFqcmgpX4/qByscx1qF9xPbjAEoMoZmUNpoii6ha+sjv57QEjPO1tcQWMjfYwTB8lKtiv3w9tvCk/IAhMXcHhzhn1FZn6MXoJnDceK3jUfLhBfF0A5TiVqJ3xdUB+hIHFO+JzilSEhsnV0NT8syv1bZ9T+DbVfnyo38WFKUKPI8WKdrtufybZcgW1vw2HH3n9nJdpHfno11kQCSaT0HOJblqcYhENcOkzX7Fu3NZvjbMJtoYHxbXyla70KRSi39cok428JY8FAvjFAqggUEX1hTz6nopQKjHnndqyKy1zw6yPRem8iQp/vpe0S53747p84PNAUC4/FtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltjWNUYv9Za7TBteZ5z5LMm27pUqUpPwrE6oYsvS7sQ=;
 b=mR+mMQ3idZYI6Lr25Te3g3qI768KFMZXNF2TQMTuQq7Apkk9i9Is7NMaOOUZS4JV/ubyDNnnvXQI9DR4hEy59IhkJe1t8xo0FSM52a2+jB+XwO9DaohydYEomL5HZWDmyn36yJi4AqRtwbUuyjF3+Q2ZXdsXGVUlvdnfXIS+qK7vfQxclUKnT6xLU1JK7dJesyTcdBAd638saCfP/LaKzQfRzEKxj7l4Agnfz2kPrIQyC8um3KdRwxjDCrPLmmQiwiXwPVq2LEgjQbfxHjFhHA3q//SH6tscEeRr5jqMgIvAGO9cZ7t9shTAP1zsumqANdRLrxO5/LOTwOI4FgXmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltjWNUYv9Za7TBteZ5z5LMm27pUqUpPwrE6oYsvS7sQ=;
 b=Gs6F2kcz3D/DfgxBjzewjgihM9LXxWt8HOEYS8HQVOIkAtXK2jEnW5kKAjgFNhg9KEXqQHiAvwNCGrauYsjKy2wYwEzZFomyM9Z/qShHTtGtGB0E+c1VNZPQcDl302AQwdsB2Xt07VaT8QJK/84aM+p3fW8QhwduyVdqOA+0bps=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3578.eurprd02.prod.outlook.com (52.134.68.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Wed, 29 Jan 2020 09:31:01 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 09:31:01 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR05CA0268.eurprd05.prod.outlook.com (2603:10a6:3:fc::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend Transport; Wed, 29 Jan 2020 09:31:00 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Joe Perches <joe@perches.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Johan Hovold <johan@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Thread-Topic: [PATCH][next][V2] i2c: xiic: fix indentation issue
Thread-Index: AQHV1PvGmbkS3JsMKku+pbwF3sqcKKf+WLcAgAAReoCAAADJgIACM4iAgAAX7YCAAApngIAAotGA
Date:   Wed, 29 Jan 2020 09:31:00 +0000
Message-ID: <9cb18fbb-179b-ed17-04ad-af85769b25c0@axentia.se>
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
 <20200127120535.GC1847@kadam>
 <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
 <35ed6501-3b26-36a9-d332-d4ed3366ebd8@axentia.se>
 <3b287fb5-e344-c13a-2803-09c2958b9b0d@canonical.com>
 <60cd544bfba4251cf656f377c20ccf8b470a92dc.camel@perches.com>
In-Reply-To: <60cd544bfba4251cf656f377c20ccf8b470a92dc.camel@perches.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR05CA0268.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::20) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b390e00a-a57a-4d6d-f9b6-08d7a49df40c
x-ms-traffictypediagnostic: DB3PR0202MB3578:
x-microsoft-antispam-prvs: <DB3PR0202MB357829395EB0C11E94A8110DBC050@DB3PR0202MB3578.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(39830400003)(346002)(366004)(376002)(189003)(199004)(8936002)(66446008)(64756008)(66556008)(81166006)(81156014)(8676002)(508600001)(66476007)(66946007)(6486002)(4326008)(31686004)(2616005)(86362001)(956004)(71200400001)(31696002)(2906002)(36756003)(52116002)(316002)(16576012)(26005)(53546011)(110136005)(186003)(54906003)(5660300002)(16526019);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3578;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bh8E8+CdJrqGt5XfAJ3ANZDi9RWUYqgOHIzrg+BLZhv5HxXd+U7kwCjUmZoZMATIyQYyRaRBa68V+R/TgBmyYqQ3icQuiSh54ul2+B4dJrlevTQCmcPNruUHCHTCi7ZEMqcXwOCvP4XuwHp8GPwvykdrpRqfLLsIhlh1phko8P6P/n0X6U7nenH0v6AA0GG4Q1kdji1dYrbP5TbexaEbJCqYWKvS4zlr2rrqw7NdQHK0MALhlBL5eybP7OS5/n2xoAZyxWScQNqReOds46zBqMZ6KvURqENh8/1gh4o5NpMc/yBaKKJ8ZXuY/3nrI47cFwXsy/KSpenHiq4Pkp35ssliwb4/GSHMC99JXoNacsxsUzmTPfpjNJi6yBbz53cS53X0s0YVr2p/S69R4MlZrsl5lordUXwG8Y6oHB/yeflIyhhAosu8Gfc+q5BvhNhB
x-ms-exchange-antispam-messagedata: TKqIV2f5BOTXvMuBcXMuSMCbQEumetMVTUhjYAuybRcSPvHBUN12vIQe/bt3oiMI1b6KNGuqrZQZLBNPTUZV0g7q+3H14RTvL/AHH0ikDDoA/hDjhIhKQEBmEQvUfDe1m4Il0sEN/BNvlbijPFjVzA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <906744DEC9C4064CA29594D64B3FCF31@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b390e00a-a57a-4d6d-f9b6-08d7a49df40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 09:31:00.8865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gElm0IaVfOsv01RfdHukLqfw3bLzQN5PUkcRk3d3gzQl/GQ+We7I99Nn44Irgwzn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3578
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gMjAyMC0wMS0yOSAwMDo0OCwgSm9lIFBlcmNoZXMgd3JvdGU6DQo+IE9uIFR1ZSwgMjAyMC0w
MS0yOCBhdCAyMzoxMCArMDAwMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+PiBPbiAyOC8wMS8y
MDIwIDIxOjQ1LCBQZXRlciBSb3NpbiB3cm90ZToNCj4+PiBPbiAyMDIwLTAxLTI3IDEzOjA4LCBD
b2xpbiBJYW4gS2luZyB3cm90ZToNCj4+Pj4gT24gMjcvMDEvMjAyMCAxMjowNSwgRGFuIENhcnBl
bnRlciB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDEyOjAzOjAyUE0gKzAx
MDAsIE1pY2hhbCBTaW1layB3cm90ZToNCj4+Pj4+PiBPbiAyNy4gMDEuIDIwIDExOjIzLCBDb2xp
biBLaW5nIHdyb3RlOg0KPj4+Pj4+PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGVyZSBpcyBhIHN0YXRlbWVudCB0aGF0
IGlzIGluZGVudGVkIG9uZSBsZXZlbCB0b28gZGVlcGx5LCByZW1vdmUNCj4+Pj4+Pj4gdGhlIGV4
dHJhbmVvdXMgdGFiLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gVjI6
IGZpeCB0eXBlIGluIGNvbW1pdCBtZXNzYWdlDQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy14aWljLmMgfCAyICstDQo+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy14aWljLmMNCj4+Pj4+Pj4gaW5kZXggYjE3ZDMwYzlhYjQwLi45MGMxYzM2MjM5NGQgMTAwNjQ0
DQo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+Pj4+Pj4+ICsr
KyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+Pj4+Pj4+IEBAIC0yNjEsNyArMjYx
LDcgQEAgc3RhdGljIGludCB4aWljX2NsZWFyX3J4X2ZpZm8oc3RydWN0IHhpaWNfaTJjICppMmMp
DQo+Pj4+Pj4+ICAJCXhpaWNfZ2V0cmVnOChpMmMsIFhJSUNfRFJSX1JFR19PRkZTRVQpOw0KPj4+
Pj4+PiAgCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkgew0KPj4+Pj4+PiAgCQkJ
ZGV2X2VycihpMmMtPmRldiwgIkZhaWxlZCB0byBjbGVhciByeCBmaWZvXG4iKTsNCj4+Pj4+Pj4g
LQkJCQlyZXR1cm4gLUVUSU1FRE9VVDsNCj4+Pj4+Pj4gKwkJCXJldHVybiAtRVRJTUVET1VUOw0K
Pj4+Pj4+PiAgCQl9DQo+Pj4+Pj4+ICAJfQ0KPj4+Pj4+PiAgDQo+Pj4+Pj4+DQo+Pj4+Pj4NCj4+
Pj4+PiBBcyB3YXMgc3VnZ2VzdGVkIGJ5IFBldGVyIHlvdSBzaG91bGQgYWxzbyBhZGQgRml4ZXM6
IDxzaGExPiAoInBhdGNoDQo+Pj4+Pj4gc3ViamVjdCIpDQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBJ
dCdzIG5vdCByZWFsbHkgYSBidWdmaXgsIGl0J3MganVzdCBhIGNsZWFudXAuDQo+Pj4+DQo+Pj4+
IEknbSBzdXJwcmlzZWQgaSB3YXNuJ3QgYXNrZWQgZm9yIGEgYnVnIG51bWJlciB0b28uDQo+Pj4N
Cj4+PiBWZXJ5IGZ1bm55Lg0KPj4NCj4+IEFwb2xvZ2llcyBmb3IgYmVpbmcgZmxpcHBhbnQuIEkg
ZGlkbid0IG1lYW4gdG8gb2ZmZW5kLiBNeSBiYWQgIzEuDQo+Pg0KPj4+IEkgcmVhbGl6ZSB0aGF0
IHlvdSwgdGhlIHRocmVlIGNvbXBsYWluZXJzIChKb2hhbiwgRGFuIGFuZCBDb2xpbiksIHRvZ2V0
aGVyDQo+Pj4gaGF2ZSBhbG1vc3QgMTAwMDAgY29tbWl0cy4gU28sIEkgZmVlbCBhIGJpdCBvdXRy
YW5rZWQuDQo+Pj4NCj4+PiBIb3dldmVyLCB0aGlzIHJpZGljdWxlIGlzIHVuZmFpci4NCg0KQW5k
IHRoZSA0dGggaGVhdnktd2VpZ2h0IHN0ZXBzIGluLCBhbmQgdGhlIGdyYW5kIHRvdGFsIGlzIG5v
dyB3ZWxsIHBhc3QNCjEwMDAwIGNvbW1pdHMuDQoNCj4gSXQncyBub3QgdW5mYWlyLg0KDQpBcmUg
eW91IHNheWluZyB0aGF0IGl0J3MgZmFpcj8/Pw0KDQo+IEluIF9ub18gc2Vuc2UgaXMgYSB3aGl0
ZXNwYWNlIG9ubHkgY2hhbmdlIGEgdmFsaWQgcmVhc29uDQo+IHRvIHVzZSBhICJGaXhlczoiIHRh
Zy4NCj4gDQo+IEEgd2hpdGVzcGFjZSBvbmx5IGNvZGluZy1zdHlsZSBpc3N1ZSBpcyBfbm90XyBh
IGJ1Zy4NCg0KUmlnaHQuIFRoYXQncyBvbmUgb3Bpbmlvbi4gQW5kIGl0IHNlZW1zIHRoYXQgbWFu
eSBsb25nIHRpbWUgY29udHJpYnV0b3JzIGFncmVlDQp0aGF0IHRoaXMgaXMgdGhlIGNhc2UuIFNv
IGl0IG11c3QgYmUgdGhlIG9ubHkgYWNjZXB0YWJsZSBvcGluaW9uLiBPcj8NCg0KSW4gbXkgYm9v
ayBjb2Rpbmctc3R5bGUgaXNzdWVzIGlzIGFib3V0IHRhc3RlLCBpLmUuIGlmIHlvdSB1c2Ugc3Bh
Y2VzIG9yIHRhYnMNCnRvIGluZGVudCwgYW5kIGlmIGFuZCB3aGVuIHlvdSBhZGQgYSBuZXctbGlu
ZSBiZWZvcmUgey4gRXRjLiBUaGlzIGZpeCBpcyBhYm91dA0KZGlyZWN0bHkgbWlzbGVhZGluZyBj
b2RlIHRoYXQgbm9vbmUgd3JpdGVzIG9uIHB1cnBvc2UuIENsZWFybHkgYSBidWcgaW4gbXkNCmJv
b2ssIGFuZCBub3Qgc29tZSBtZWFnZXIgInN0eWxlIiBpc3N1ZS4NCg0KPiBGcm9tIHN1Ym1pdHRp
bmctcGF0Y2hlczoNCj4gDQo+IElmIHlvdXIgcGF0Y2ggZml4ZXMgYSBidWcgaW4gYSBzcGVjaWZp
YyBjb21taXQsIGUuZy4geW91IGZvdW5kIGFuIGlzc3VlIHVzaW5nDQo+IGBgZ2l0IGJpc2VjdGBg
LCBwbGVhc2UgdXNlIHRoZSAnRml4ZXM6JyB0YWcgd2l0aCB0aGUgZmlyc3QgMTIgY2hhcmFjdGVy
cyBvZg0KPiB0aGUgU0hBLTEgSUQsIGFuZCB0aGUgb25lIGxpbmUgc3VtbWFyeS4NCg0KWW91IG5l
ZWQgdG8gcmVhZCB0aGF0IGNhcmVmdWxseS4gRG8geW91IHNlZSB0aGF0ICJlLmcuIiBwYXJ0PyBU
aGlzIHF1b3RlIHN0YXRlcw0KKm9uZSogZXhhbXBsZSBvZiBob3cgeW91IGNhbiBmaW5kIGEgYnVn
LiBJdCdzIG5vdCBzb21lIGV4aGF1c3RpdmUgbGlzdCBhbmQgdGh1cw0KInByb3ZlcyIgbm90aGlu
ZyB3aGF0LXNvLWV2ZXIuDQoNCkJlc2lkZXMsIHJlYWRpbmcgdGhlIGdpdCBiaXNjZXQgbWFudWFs
IHJldmVhbHMgdGhhdA0KDQoiSW4gZmFjdCwgZ2l0IGJpc2VjdCBjYW4gYmUgdXNlZCB0byBmaW5k
IHRoZSBjb21taXQgdGhhdCBjaGFuZ2VkIGFueSBwcm9wZXJ0eQ0KIG9mIHlvdXIgcHJvamVjdCIN
Cg0KU28sIGlmIHdlIGFyZSBiZWluZyByaWRpY3Vsb3VzLCB0aGFua3MgZm9yIHRoZSBzdXBwb3J0
ISBCZWxvdyBpcyB0aGUgcHJvb2YgdGhhdA0KSSBmb3VuZCBhIHJlYWxseSBob3JyaWJsZSAqYmlz
ZWN0YWJsZSogYnVnISBMb29rcyBsaWtlIGEgZml4ZXMtdGFnIHdhcyB3YXJyYW50ZWQNCmFmdGVy
IGFsbCEhITEhDQoNCk9uIGEgbW9yZSBzZXJpb3VzIG5vdGUgSSBjaGFsbGVuZ2UgeW91IHRvIGZp
bmQgYW55dGhpbmcgaW4gRG9jdW1lbnRhdGlvbi8gdGhhdA0KdGVsbHMgbWUsIHdpdGhvdXQgYW1i
aWd1aXR5LCB0aGF0IHRoZSBwYXRjaCBpbiBxdWVzdGlvbiBpcyAqbm90KiBmaXhpbmcgYSBidWcs
DQpiZWNhdXNlIHlvdXIgcXVvdGUgaXMgY2xlYXJseSBub3QgaXQuDQoNCkknbSAqb25seSogc2F5
aW5nIHRoYXQgaXQgaXMgbm90IGFsd2F5cyBzbyBkYW1uIGVhc3kgdG8gY2F0ZWdvcml6ZSBpc3N1
ZXMsIGFuZA0KdGhhdCBhIG1pcy1zdGVwIGRvZXMgbm90IHdhcnJhbnQgcmlkaWN1bGUuDQoNCkNo
ZWVycywNClBldGVyDQoNCg0KJCBjYXQgZmluZGVyLnNoDQojISAvYmluL3NoDQoNCmlmIGdyZXAg
J3JldHVybiAtRVRJTUVET1VUOycgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmM7IHRoZW4N
CiAgICBleGl0IDENCmZpDQokIGdpdCBiaXNlY3Qgc3RhcnQNCiQgZ2l0IGJpc2VjdCBiYWQNCiQg
Z2l0IGJpc2VjdCBnb29kIHY1LjUtcmMxDQpCaXNlY3Rpbmc6IDgxNCByZXZpc2lvbnMgbGVmdCB0
byB0ZXN0IGFmdGVyIHRoaXMgKHJvdWdobHkgMTAgc3RlcHMpDQpbMGRkMWUzNzczYWU4YWZjNGJm
ZGNlNzgyYmRlZmZjMTBmOWNhZTZlY10gcGlwZTogZml4IGVtcHR5IHBpcGUgY2hlY2sgaW4gcGlw
ZV93cml0ZSgpDQokIGdpdCBiaXNlY3QgcnVuIC4vZmluZGVyLnNoDQpydW5uaW5nIC4vZmluZGVy
LnNoDQpCaXNlY3Rpbmc6IDQwNiByZXZpc2lvbnMgbGVmdCB0byB0ZXN0IGFmdGVyIHRoaXMgKHJv
dWdobHkgOSBzdGVwcykNCltjYTc4ZmRlYjAwZmE2NTZmMDlhZmVlOTc3NzUwZTg1ZGE5MjlkMjU5
XSBNZXJnZSB0YWcgJ2RybS1maXhlcy0yMDIwLTAxLTAzJyBvZiBnaXQ6Ly9hbm9uZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9kcm0vZHJtDQpydW5uaW5nIC4vZmluZGVyLnNoDQpCaXNlY3Rpbmc6IDIxMCBy
ZXZpc2lvbnMgbGVmdCB0byB0ZXN0IGFmdGVyIHRoaXMgKHJvdWdobHkgOCBzdGVwcykNClthNWY0
OGM3ODc4ZDIzNjVmNmZmNzAwOGU5MzE3YWJiYzE2ZjY4ODQ3XSBNZXJnZSBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldA0KcnVubmluZyAuL2Zp
bmRlci5zaA0KQmlzZWN0aW5nOiAxMDIgcmV2aXNpb25zIGxlZnQgdG8gdGVzdCBhZnRlciB0aGlz
IChyb3VnaGx5IDcgc3RlcHMpDQpbN2RhMzdjZDA1MjBlNzE3MDdhMTE5MDAyMjM3Nzk0MWI5Y2Vj
M2IwYl0gTWVyZ2UgdGFnICdzdGFnaW5nLTUuNS1yYzYnIG9mIGdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvc3RhZ2luZw0KcnVubmluZyAuL2ZpbmRl
ci5zaA0KQmlzZWN0aW5nOiA1MiByZXZpc2lvbnMgbGVmdCB0byB0ZXN0IGFmdGVyIHRoaXMgKHJv
dWdobHkgNiBzdGVwcykNClswNDBhM2MzMzYyM2JhNGJkMTE1ODhhYjA4MjAyODFiODU0YTNmZmFm
XSBNZXJnZSB0YWcgJ2lvbW11LWZpeGVzLXY1LjUtcmM1JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvam9yby9pb21tdQ0KcnVubmluZyAuL2ZpbmRlci5z
aA0KQmlzZWN0aW5nOiAyNiByZXZpc2lvbnMgbGVmdCB0byB0ZXN0IGFmdGVyIHRoaXMgKHJvdWdo
bHkgNSBzdGVwcykNCltiM2VjOTQ2OTc1NzM3Yjk0OTEzN2ZiYjFhMmRiOWU3Y2M1YjlhZTgyXSBp
MmM6IHRlZ3JhOiBDaGVjayBETUEgY29tcGxldGlvbiBzdGF0dXMgaW4gYWRkaXRpb24gdG8gbGVm
dCB0aW1lDQpydW5uaW5nIC4vZmluZGVyLnNoDQpCaXNlY3Rpbmc6IDEzIHJldmlzaW9ucyBsZWZ0
IHRvIHRlc3QgYWZ0ZXIgdGhpcyAocm91Z2hseSA0IHN0ZXBzKQ0KW2U4ZDUxZTk2MjkzNmJmNDUy
N2Y0MWRiMzE4ZDUzYTgwMDA2ZjJiZjddIGRvY3M6IGkyYzogdXNlIHRoZSBuZXcgQVBJIGluICd3
cml0aW5nLWNsaWVudHMnDQpydW5uaW5nIC4vZmluZGVyLnNoDQpCaXNlY3Rpbmc6IDYgcmV2aXNp
b25zIGxlZnQgdG8gdGVzdCBhZnRlciB0aGlzIChyb3VnaGx5IDMgc3RlcHMpDQpbNGEyZDVmNjYz
ZGFiNjYxNDc3MmQ4ZTI4Y2ExOTBiMTI3YmE0NmQ5ZF0gaTJjOiBFbmFibGUgY29tcGlsZSB0ZXN0
aW5nIGZvciBtb3JlIGRyaXZlcnMNCnJ1bm5pbmcgLi9maW5kZXIuc2gNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FVElNRURPVVQ7DQpCaXNlY3Rpbmc6IDMgcmV2aXNp
b25zIGxlZnQgdG8gdGVzdCBhZnRlciB0aGlzIChyb3VnaGx5IDIgc3RlcHMpDQpbNDBiMmVjMTI1
MWMzNzBiYzU1NTc1NjhlMjU5ZDQwNThjNjUxZDQwNV0gaTJjOiBoaWdobGFuZGVyOiBVc2UgcHJv
cGVyIHByaW50ayBmb3JtYXQgZm9yIHNpemVfdA0KcnVubmluZyAuL2ZpbmRlci5zaA0KQmlzZWN0
aW5nOiAxIHJldmlzaW9uIGxlZnQgdG8gdGVzdCBhZnRlciB0aGlzIChyb3VnaGx5IDEgc3RlcCkN
CltjOWQwNTk2ODFiODQ2ZjVkMGEyODA5NTBlYTRkYzU4NDk1YjliN2E5XSBpMmM6IHhpaWM6IGRl
ZmVyIHRoZSBwcm9iZSBpZiBjbG9jayBpcyBub3QgZm91bmQNCnJ1bm5pbmcgLi9maW5kZXIuc2gN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FVElNRURPVVQ7DQpCaXNl
Y3Rpbmc6IDAgcmV2aXNpb25zIGxlZnQgdG8gdGVzdCBhZnRlciB0aGlzIChyb3VnaGx5IDAgc3Rl
cHMpDQpbYjRjMTE5ZGJjMzAwYzdhNmVlMmRhNzBkNWM3YmExNDc0N2IzNTE0Ml0gaTJjOiB4aWlj
OiBBZGQgdGltZW91dCB0byB0aGUgcnggZmlmbyB3YWl0IGxvb3ANCnJ1bm5pbmcgLi9maW5kZXIu
c2gNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FVElNRURPVVQ7DQpi
NGMxMTlkYmMzMDBjN2E2ZWUyZGE3MGQ1YzdiYTE0NzQ3YjM1MTQyIGlzIHRoZSBmaXJzdCBiYWQg
Y29tbWl0DQpjb21taXQgYjRjMTE5ZGJjMzAwYzdhNmVlMmRhNzBkNWM3YmExNDc0N2IzNTE0Mg0K
QXV0aG9yOiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUB4aWxpbnguY29t
Pg0KRGF0ZTogICBUaHUgSmFuIDkgMTc6MDc6NTggMjAyMCArMDUzMA0KDQogICAgaTJjOiB4aWlj
OiBBZGQgdGltZW91dCB0byB0aGUgcnggZmlmbyB3YWl0IGxvb3ANCg0KICAgIEFkZCB0aW1lb3V0
IHRvIHRoZSByeCBmaWZvIGVtcHR5IHdhaXQgbG9vcC4gQWxzbyBjaGVjayBmb3IgdGhlIHJldHVy
bg0KICAgIHZhbHVlIGZvciB4aWljX3JlaW5pdCBhbmQgcGFzcyBpdCB0byB4aWljX3N0YXJ0X3hm
ZXIuDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90
aS5kYXR0YUB4aWxpbnguY29tPg0KICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTaW1layA8bWlj
aGFsLnNpbWVrQHhpbGlueC5jb20+DQogICAgU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3
c2FAdGhlLWRyZWFtcy5kZT4NCg0KOjA0MDAwMCAwNDAwMDAgY2EzMDFmYzJkZjAxOWJiMmFjZDA3
YmRkYWJlNGFmYTQ5MmFkOGY2NSAyMmQ3MTllZjM1MWJmNDg5N2I0NjVkMTA2MzBlMzBlN2M1Y2Y2
NjVmIE0gICAgICBkcml2ZXJzDQpiaXNlY3QgcnVuIHN1Y2Nlc3MNCg==
