Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F8A302BA8
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 Jan 2021 20:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731807AbhAYTch (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 14:32:37 -0500
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:52962
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731577AbhAYTcB (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 14:32:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kayt0BfvmKzXNtwAlmY3GEs0wX9m3K3uAKRVTsU5VfO2Eh92CMjUjDCFw2OxlFFUbgLLxBfBQUSMWnRKJ+b26MJLj8eLUOsn2Fp75MWMW4OMw2E8PsOclz2X3c+qNPOOO847AEuqlnUeNH1XaYbfoD3c0Ozz7log24VYrm5+TlchBra05q7ruzKibNVbARXEkI4wMVHDoK3b+ivV2UH1mX8a7pXPE1iSt2oAxnpB0Uv+HsRT+EKGzBk9nlYsW6HhfOzfQXJUyzKkcfglCM0LNtp7RkYpYHCEJJKuJ0Lpmu7vfxrDiOOEgOIM5xKX/YDT+v5aKRHXPoWrBowzaQYgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHlHrCg+FqfGnKqJzaq4g8iduIViPaQu/5CbENXQDUM=;
 b=FUwaYpWgaTFy61Nhz8TmQNhpMe92mVhufFNKR46ByrxgmMXvbPD+8plWPo06N6ndNdrOBVuHduscmsU4DaDzqzflSZ4sWUEePxC2QQFqio7fVqewxw8cbOLvTUsspst+7vEl0zWiTHbBYuVjHTHAZbyf9mbEwcdaeDMCoH5tb0V1pF6wl0ykG+qtvdL9wyeky9moLUf8iUwQ9v8h6v2EZRMtC1tDl+cuPrvX/qMViQ09Oyd2YtwCiL39ICL5F6lwVQD5erRtN9LzC/mbneNn4tZ6juXwsD8elVuyqagmYRr3Pf2NS7wF4/yFpWTMlUqg+2QHLRqGIBb9Fj00n3P2sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHlHrCg+FqfGnKqJzaq4g8iduIViPaQu/5CbENXQDUM=;
 b=PS3LOAQPLAJ4Zhby9gJtfmb/A6vjSLD4bDaJqSLlt6xURaEZjRZEAp0fIQbz96veMUGIITa0dJFrc4tJr8Yk8lquq2MpUHdeGZ55WHoGLdAbCqK7IRnE9tXRNfG91y/OWKbMezg+J/Vlobk9xMHTXuIYPJKT3vV60dOGgZOqt1s=
Received: from (2603:10b6:208:8f::18) by
 BLAPR05MB7460.namprd05.prod.outlook.com (2603:10b6:208:297::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5; Mon, 25 Jan
 2021 19:13:44 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1%4]) with mapi id 15.20.3805.015; Mon, 25 Jan 2021
 19:13:43 +0000
From:   Zack Rusin <zackr@vmware.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Krastev <krastevm@vmware.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in
 vmw_setup_pci_resources()
Thread-Topic: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in
 vmw_setup_pci_resources()
Thread-Index: AQHW8vbARj6RHwPVgU+U12IuhzxyVKo4tnUA
Date:   Mon, 25 Jan 2021 19:13:43 +0000
Message-ID: <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
References: <YA6FMboLhnE3uSvb@mwanda>
In-Reply-To: <YA6FMboLhnE3uSvb@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c4ad504-0f3b-486a-1b56-08d8c165553f
x-ms-traffictypediagnostic: BLAPR05MB7460:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR05MB746009291BFF455D89F3DCF5CEBD9@BLAPR05MB7460.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4FHd9JJpi+dXKwM4b2uh0YkDKlJhQjwErmsfxgdDUq4Kdc5sHWXX27KXdcZ1RWUIumdGDprt+Wcj2g7ZT/k2DiEX9aZ5tKbbccRnm13qut3Z2edvbTTxdeeEyMMgmlLVkEKbQbLK1zWYEdvdlpVtl0e53vNVhRtb6sqSVhhiJ2ckzFas1W7gmyGzoEOaxBgYWZQHRgpJpg4w1kKos1grD3PgWhJnfzU0povek7LJ9Kz+WeX3xkOHqAYtDKVEwcAXHj0ZUY+EEXoNu9WWsnxZK2IK3jIU7efCbrBjnwwj2H42qQDIcFAud6N4fPZ0is/gugrhMA/JegwfhYd131YT0o0RbmLR5NcYpbraUq0hxQ5quxlZilpT/FN8R+wECx74xDCYY7Wei4j6OaVZqdArL3xlZiQlq/1Ss3ZR+yVmYc70bnh1xhgeHSBkrnRtSyv8pChBaxNKqY55h/6Kr96XtOdVFnSJhsmfz/ri8U2fYqiBJploeae/wezyHb6no02t5jZWG6pZNP0maWswzX61QJndVM4yMFtmJST004JPnLZSpSVbZCfEd1zZMdhWxC2Gya4ywuj6RCtqXZBQV6m/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR05MB5186.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(8936002)(54906003)(86362001)(71200400001)(76116006)(4326008)(66476007)(66556008)(64756008)(66946007)(6512007)(66446008)(8676002)(33656002)(478600001)(316002)(2616005)(26005)(4744005)(2906002)(5660300002)(186003)(53546011)(6916009)(6486002)(36756003)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y3dnWC93Nk0zTzNrc25xelE2cW1Ma3d4UDF1N216M1BaV3gzd0pBaFBhbmJM?=
 =?utf-8?B?clVLU3B3QUJ4UjdmNlJwTkNwWEVsMG0yM29xNkVQanJjYzdvck5uNEwvUzBT?=
 =?utf-8?B?MS9QeU9uNjBLVkxOSThURXBPb3RCSlNyOHA1T2V5S3VuNDVDTjJ2Rjg3aEI0?=
 =?utf-8?B?ZlArQURBSlRqdWROVVZiQkZpbWhWSHB5eS80YWdrbEFLaUpzSzJXZW1GZlli?=
 =?utf-8?B?U09TQ3RwOW1vdG83Mkc3Rm0xbjE3OTUvaTRuTXlieThSNHFXczlyZi9MNHBY?=
 =?utf-8?B?c2xGd1JZVVVyVjhUSG9vSWp1QVJoalVnblJiMjVsR0hNRWdDVWQ2L3VzTlZX?=
 =?utf-8?B?Y2ZwRGs1anBNWVVjYlJTTy9YSWxLWktPMHBZZzFNZURRc2tFTDZ3VTg5ckhz?=
 =?utf-8?B?MnlQemk2NndBTHUwaWlnYzJ4R3J6SFJDK09FWWYwcWxtTll3WGxpQVlkcmg0?=
 =?utf-8?B?WSthYWwzeloxSEwzWWNLR1d2VXVYNHd3WTBMNVZwUDhyWXFBdXlBWmJjeWZu?=
 =?utf-8?B?QzVZcWpzTHcxYm5sNFhLVysyMTRjeFpWZU5SZTZmYS9aNEdtUStrSEdrWHpP?=
 =?utf-8?B?VExON2lmQ0FXTkYrWm1oL3U4NDE2MTBMWjdRTE0vc0RZTUdJU3RZR3FROGc4?=
 =?utf-8?B?TGhBdVRxZEpCb1NOWUgvTmx3RzVxbHYrWnFDeWtVSURUZCsraEpIbmhzQnpi?=
 =?utf-8?B?UEEyL1VrWGVZWVI5ZUJkUzRFOXhOT1ZOR1BUT2c4NXFLcTdmUHl2ZGJ0NHNC?=
 =?utf-8?B?US9kM0lxYS93bTZZOUVWaDJoQ25jWUVGa2dUOCtuNUxsTC9TTFVYZURlc2pp?=
 =?utf-8?B?eXF1ci83RGdibXdSYVBEMXJWRGFCZWgyZlBhSEl0ZmpjbGhkQWhNNmVNTTNX?=
 =?utf-8?B?TG4wNmt5UDI1WUlBejVXeU5SOXNaQTZyeHFnclJpdkVmd2hCUmFUWSs0U0l0?=
 =?utf-8?B?aXJ0MnQzM2pGUENOK0Zab04yck5UWUFUWTZjcDRsaGVTbGxnNG9saGw3eHpN?=
 =?utf-8?B?cUw0a2ZUZzZNMG1kakJuUXdQZHM5dnlTa0xjdkxBUnN2QW1xZjdjL3RDRThL?=
 =?utf-8?B?M0dEWEJtS3IrN09pK1VsVXkxa1Y2UldwdlN2Y2NYSXovRGRMSmtkcjdNZFRm?=
 =?utf-8?B?bjl5aUk1NC9uUnVQS283Z09mN2ZEN2pWT2FDdWJlSWE2NDNyVnUxWVduQVJp?=
 =?utf-8?B?NWZRQmFmRldka3JtMkFSaWo2enJmL3ZsSHpiY2N5eTZTcENpRVVkUmpSV1hU?=
 =?utf-8?B?TWVyUGp4cUk5cnBaSXdLVlBnalR2enlEUFpvTU56bXlxTVZwNmFJTHgvKzhY?=
 =?utf-8?B?WjdCWldiT2M1WlNEUXcyMkJ5VWxnbE9QS3RzY2s2WFdQbFY2R0ZIbzB5TmtM?=
 =?utf-8?B?Z2Y0YTIrSGJUNzZKQ1NiQ2wzTloza3BBTXNDcXhWczJrSUpDN09uMm1OTUcz?=
 =?utf-8?B?b2tNdVJMUFF3cXh5TGpsZHZDOGhPK1hiUkh0SXVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F38D4D58AF7AF4AA2E59931E38983C5@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4ad504-0f3b-486a-1b56-08d8c165553f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 19:13:43.7852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XzRH5sXIlU3uDXH5aBZagtRtP/kAGEG/U9V+z+Kftao3d0KPpz2YMgLfGpgWFsRayP5F39OznsejpPeePnvmbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7460
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQoNCj4gT24gSmFuIDI1LCAyMDIxLCBhdCAwMzo0NSwgRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBkZXZtX21lbXJlbWFwKCkgZnVuY3Rp
b24gbmV2ZXIgcmV0dXJucyBOVUxMLCBpdCByZXR1cm5zIGVycm9yDQo+IHBvaW50ZXJzIHNvIHRo
ZSB0ZXN0IG5lZWRzIHRvIGJlIGZpeGVkLiAgQWxzbyB3ZSBuZWVkIHRvIGNhbGwNCj4gcGNpX3Jl
bGVhc2VfcmVnaW9ucygpIHRvIGF2b2lkIGEgbWVtb3J5IGxlYWsuDQo+IA0KPiBGaXhlczogYmU0
Zjc3YWM2ODg0ICgiZHJtL3Ztd2dmeDogQ2xlYW51cCBmaWZvIG1taW8gaGFuZGxpbmciKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQoN
ClRoYW5rcywgRGFuLg0KDQpJIGhhdmUgYSBwYXRjaCBiYXNlZCBvbiB5b3VyIHJlcG9ydCB0aGF0
IGZpeGVzIHRoYXQgdG9vIGJ1dCBpdCBjb21lcyB3aXRoIGEgcmVmYWN0b3JpbmcuIEnigJlkIGJl
IGhhcHB5IHRvIHJlYmFzZSBpdCBvbiB0b3Agb2YgeW91cnMganVzdCB0byBnZXQgeW91cnMgaW4g
YmVmb3JlLiBJZiB5b3XigJlkIGxpa2UgSSBjYW4gcHVzaCB5b3VyIHBhdGNoIHRocm91Z2ggZHJt
LW1pc2MtbmV4dCwgaWYgbm90Og0KDQpSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13
YXJlLmNvbT4NCg0Keg0KDQoNCg==
