Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E8294987
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Aug 2019 18:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfHSQLd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Aug 2019 12:11:33 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:14709 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfHSQLc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Aug 2019 12:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1566231092; x=1597767092;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l/0rZR/21QQsnRaWat27wCS5R6P1+ev1sCocT8pucy8=;
  b=b4hOBkaa1aINfM7zftyo8piC1cLpBSbuEuYQmRYeohW1zZrw9WAHderP
   uIuZHOTlv8uxjiB/rwAbxdAqZ/U0g8RxEyCJc8mTUzG7wenE5UNPloZPC
   QSxA0DvOvu04SR6zdmf+0NrK3kbQbDmMDyNrkCoA0ezDXj5+pc+DRJAAM
   zs6I8vjKmYUhBEFWEQ1hqDrLQZhNb0w6JCblEIJIrGYone64t5MJRDZy4
   7SL9531dfG5WDjfU3kcazMuPHQjS7xZ5Rk54NaeKyBivVuW2qHt2/RW3S
   u/wlYNyTo8NeZ+4Ff3clqVyBzGJBV6JJlzsrezhqCsgcNyRpygPiCBVdM
   w==;
IronPort-SDR: 0lRV1rUdaDIvjUFfKWbsx+dfPb7Xg9rl/2CnZgiIMQksT8g5k+5b52yRuWjWcYqOcxZ5LyAalR
 9Yjm9guiNwgF6MOJiBZO/uGYTxl80/qcaF50wa8UJP6Q1/s5Qi8EocBV5RMcm+PixftMRcUghG
 pg5UC3dtS4lRtMU+/mNfEMkk+SD/801pkfQyzvG33604fVqj13z4PLoy3Yb00NjObBwBNCZ3n5
 xYeo6hq3yJtEne/2VaHaGzbWiGQ6JcAGpT4qo4fllvWzGyoYm3W0h83thduVQp2Gro4AR5VJnh
 jqg=
X-IronPort-AV: E=Sophos;i="5.64,405,1559491200"; 
   d="scan'208";a="222712813"
Received: from mail-dm3nam03lp2054.outbound.protection.outlook.com (HELO NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.54])
  by ob1.hgst.iphmx.com with ESMTP; 20 Aug 2019 00:11:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IakxQKdT1H/dfHs08TGWJ5KMOM1jg69+uJojFhgx9o956zlame3U2UavvLZNKomSrpzt+60cFd11BHpSAQ/csoWLsY20RId5hCUJlDJBF0jLVdAdUaAR3+QVyhp5DiRo+505bVNdLEqXcfYEsGhBQjg7jpt7EYZWh+3L+MoZHzW5zPDjtUOn18JSST4FrLR7uobaWOTjP18FAOqY7L9/T2SMuGnMIc2kxi0e6jQxoHH2N+XToMzP2yTVf/x6KlDorY1jLQbhj6ZrQeCHx2nQbb/R4ex4sbL3zSPZwaZxBZ/e5LUVEyR64FurpsWlzPOycgwM6wa4DOXeybE5Yoh/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/0rZR/21QQsnRaWat27wCS5R6P1+ev1sCocT8pucy8=;
 b=OsJFrjBObvZJEPI2roNwwju/WT5vUvyDxtbYP4I4YImkGfUNU3CBCUB6xkcVtGRQnyiQxZol5fvr4W1vmXNQ9wseewrcvf5ZEG+NyPpKDHZO/h0Jz9WAp+JhFz3AgstGieuuEXzQHlfTpyUXQ3gFSfnqsIqk2G0cO2HKgwZK0no035Z1FP+QI0aOUp0Up//p33Q3O1D0styhxAX6CuI0PMg4tqs4ngN1znovtHiu6iYJXiKgg/2Eq9JE5vu42Mxv57izs7mMAZxcBSubiLLX5+ltPqaAQ9Xo/Jd4l2OaZ2vheNONf5ZbrPR7JGrU28WhYSgZosGdM7Q/p2ROTH9xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/0rZR/21QQsnRaWat27wCS5R6P1+ev1sCocT8pucy8=;
 b=lu97F3wW3keAi1j9KsHEAghjvvvbnEsxDlSZIuiwdwjX0xOymfuHn/PAtUU3GZlUtOw7XrvjANwesonjs39O11Xa0/Va91RtAO7bwNcBVWsUcrLUy5EBEXk6kCqV6c1kGTNxOLXvOij7Dg8+najugkpIglhQ2yoWR7OoMxsWdjQ=
Received: from CO2PR04MB2328.namprd04.prod.outlook.com (10.166.95.11) by
 CO2PR04MB2341.namprd04.prod.outlook.com (10.166.94.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 16:11:19 +0000
Received: from CO2PR04MB2328.namprd04.prod.outlook.com
 ([fe80::b44d:f58f:f4bd:fdea]) by CO2PR04MB2328.namprd04.prod.outlook.com
 ([fe80::b44d:f58f:f4bd:fdea%12]) with mapi id 15.20.2178.018; Mon, 19 Aug
 2019 16:11:18 +0000
From:   Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To:     "agk@redhat.com" <agk@redhat.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     "dm-devel@redhat.com" <dm-devel@redhat.com>,
        "snitzer@redhat.com" <snitzer@redhat.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] dm zoned: Potential NULL dereference in dmz_do_reclaim()
Thread-Topic: [PATCH] dm zoned: Potential NULL dereference in dmz_do_reclaim()
Thread-Index: AQHVVnTErbZG/DKk902JuPlWENvAGKcCpIyA
Date:   Mon, 19 Aug 2019 16:11:18 +0000
Message-ID: <d53fb01681501c2a777f74a3acc145df37b97458.camel@wdc.com>
References: <20190819095814.GA19905@mwanda>
In-Reply-To: <20190819095814.GA19905@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dmitry.Fomichev@wdc.com; 
x-originating-ip: [199.255.45.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76243c75-4504-4f1e-cc25-08d724bfde9d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:CO2PR04MB2341;
x-ms-traffictypediagnostic: CO2PR04MB2341:
x-microsoft-antispam-prvs: <CO2PR04MB2341BE151ABACD18E10A4E33E1A80@CO2PR04MB2341.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(189003)(199004)(53936002)(118296001)(256004)(5660300002)(81156014)(81166006)(7736002)(25786009)(8676002)(6246003)(86362001)(4326008)(305945005)(36756003)(66946007)(316002)(66446008)(64756008)(66066001)(66556008)(66476007)(110136005)(54906003)(99286004)(486006)(446003)(11346002)(229853002)(2616005)(476003)(2906002)(76176011)(3846002)(6116002)(6512007)(91956017)(14454004)(76116006)(8936002)(6506007)(102836004)(186003)(2501003)(26005)(6436002)(6486002)(478600001)(71200400001)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:CO2PR04MB2341;H:CO2PR04MB2328.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RRZE5kz1HkDtKWDvJrjlLi1XkXp+A8ik+ygwuYzwaKvTXNU5uy+jMXoMOpM1qB2QpMYAsVxwL0FQPc9o45IleETsZ4fMo0BeO7yvtisAOrwqFfrYe0EZLSQEAkXFDtTdoo+dIhtWWGaplqkJ8q9rgiUzxlizCLnd7UR3DWjqqjsvit0Dy6tLnHYT5n+uDsCOT3PcCvJP/fO4QcxXAecjgV8l4FNmESpiyllWhmDB0tbPWlgFe9Z0K2M3qArrkh1bkvEcLJ2L8xigIA0vBPsM5m5GhpGjtvGxaW1ib9bSlk1sOnyyrRs5Zmx8k/I752ylwmtQdaZ44b4W5nfLlwxYj1PUXa+YhSpRgHxw9uAS2eXAIKj0H14Y7fi14hDHDHj3QF3Tghvb2ISy+2Yu72K2fQmC1mbVV3rydNpvOOnxhac=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7183DCDF3A8793459F8D2975F778DB12@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76243c75-4504-4f1e-cc25-08d724bfde9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 16:11:18.6522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYVs58iUB8QNMZs76OlXIQgNc/iNEhvART4Ol4TrE4/hgwgUlQ7kY7JtDZeUuXLPykvT79+KPeaNReZVeF7puA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2341
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

RGFuLA0KDQpPbiBNb24sIDIwMTktMDgtMTkgYXQgMTI6NTggKzAzMDAsIERhbiBDYXJwZW50ZXIg
d3JvdGU6DQo+IFRoaXMgZnVuY3Rpb24gaXMgc3VwcG9zZWQgdG8gcmV0dXJuIGVycm9yIHBvaW50
ZXJzIHNvIGl0IG1hdGNoZXMgdGhlDQo+IGRtel9nZXRfcm5kX3pvbmVfZm9yX3JlY2xhaW0oKSBm
dW5jdGlvbi4gIFRoZSBjdXJyZW50IGNvZGUgY291bGQgbGVhZCB0bw0KPiBhIE5VTEwgZGVyZWZl
cmVuY2UgaW4gZG16X2RvX3JlY2xhaW0oKQ0KPiANCj4gRml4ZXM6IGIyMzRjNmQ3YTcwMyAoImRt
IHpvbmVkOiBpbXByb3ZlIGVycm9yIGhhbmRsaW5nIGluIHJlY2xhaW0iKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyBiL2RyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRh
dGEuYw0KPiBpbmRleCAyYTViYzUxZmQ2ZDUuLjU5NWE3MzExMGUxNyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jDQo+ICsrKyBiL2RyaXZlcnMvbWQvZG0tem9u
ZWQtbWV0YWRhdGEuYw0KPiBAQCAtMTU4OCw3ICsxNTg4LDcgQEAgc3RhdGljIHN0cnVjdCBkbV96
b25lICpkbXpfZ2V0X3NlcV96b25lX2Zvcl9yZWNsYWltKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnpt
ZCkNCj4gIAlzdHJ1Y3QgZG1fem9uZSAqem9uZTsNCj4gIA0KPiAgCWlmIChsaXN0X2VtcHR5KCZ6
bWQtPm1hcF9zZXFfbGlzdCkpDQo+IC0JCXJldHVybiBOVUxMOw0KPiArCQlyZXR1cm4gRVJSX1BU
UigtRUJVU1kpOw0KPiAgDQo+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeSh6b25lLCAmem1kLT5tYXBf
c2VxX2xpc3QsIGxpbmspIHsNCj4gIAkJaWYgKCF6b25lLT5iem9uZSkNCj4gQEAgLTE1OTcsNyAr
MTU5Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG1fem9uZSAqZG16X2dldF9zZXFfem9uZV9mb3JfcmVj
bGFpbShzdHJ1Y3QgZG16X21ldGFkYXRhICp6bWQpDQo+ICAJCQlyZXR1cm4gem9uZTsNCj4gIAl9
DQo+ICANCj4gLQlyZXR1cm4gTlVMTDsNCj4gKwlyZXR1cm4gRVJSX1BUUigtRUJVU1kpOw0KPiAg
fQ0KPiAgDQo+ICAvKg0KDQp0aGFua3MgZm9yIG5vdGljaW5nIHRoaXMgLQ0KDQpSZXZpZXdlZC1i
eTogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9taWNoZXZAd2RjLmNvbT4NCg==
