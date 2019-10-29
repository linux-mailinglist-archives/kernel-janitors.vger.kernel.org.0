Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFCDE83FA
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 10:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731380AbfJ2JOh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 05:14:37 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:49300 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729876AbfJ2JOh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 05:14:37 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9T99iOK021131
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 02:14:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfpt0818;
 bh=h1A5yL1eoU5WY+m4Rnvwtv6n+DUkqK+DnLz4MK0KuHE=;
 b=Lh/jeoZqdrqJhy8Kaamjfw/Cq8mcY3H52Kecb859CXw49ERL7Cdr7+c1RM+ELqj0opgC
 L00WaIIiywd4ovvcaf7ahh6m/lB1nI7gwADe54vThportIrv46Y4o2vGRSwxTb3HNkSG
 kfDf9CetO/kOiDfCTY/lh337J9YQXOHLrrqaQvCFl6uQW5OfAeJmbtvSCofW6UdVzWBg
 sjEim26sOC9XZAR1jZYTAMITulAvilwFvY45d5hkzTZB+n15AWQinl+Q4SfoyJQeD2gm
 VIoF8bSEgqql5hnzusbU3+f0sfKvj3XplQWo2t8rTnoCGruWt5pSUgOoIeSd92za6hRZ VQ== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0a-0016f401.pphosted.com with ESMTP id 2vvkgq9e1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 02:14:36 -0700
Received: from SC-EXCH01.marvell.com (10.93.176.81) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 29 Oct
 2019 02:14:35 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (104.47.33.58) by
 SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 29 Oct 2019 02:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhnjvxYKdjwuRnpRuozK/VuA7hVul5u0qZN4I1iQPOZxZaBRuFgDqXJV8HKkh3EgXJtp+odzR6HTXnV0xOGXNFHIXyHow6z4RscHeyz9wfS8UBpY0sQVzVHPp+j1UtewUBwFA06jg7dAutyfJ3t/uqNsoC2xqE5M7ktHCku2sh0a2up3QVSLrNte4wapVC2qhIKwc2Y9AxlbO/wc9qOzPdD0VAGBivCldPqBTV71yjWQIVK6kVZmY7wm1+GhLcTkEbFIOlzK6AcOIxNUHxS0iw5c2lvo1uzZlMXQWyKNwJPrCu0+MjJdUprqJTpVKy9RiSFxD18XdAy9XWzc7iepUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1A5yL1eoU5WY+m4Rnvwtv6n+DUkqK+DnLz4MK0KuHE=;
 b=cmkvTy1KuoK1W/ncP0kXupzEZ2rtGgd5eS6ean85Xh4TTOI4/1PlNTkAA57iCLv+0rH/yMwhRGuWU9cN9okjWrMj3vQY2hx4Gt1imGF3+rhoM0tYjJVNirFduGUAOtvtYhD6impVg/0CyhYGUDUDLRgKefjJyiULgYpxr4yP9iOezcw4vrRuJtIsjj4v+4iyqus9yWO+oIXQigDoLUVllUl664+90RnzZK/5Fu2WrMvzsD0GP8jcOe+gyakr58OcvGtwf5ku6n3F7ZrrlFJQnXM5g2AtAkL82gpEM+aHJ3/TsvF/mi7lLHvr3V58xF9Ti9NIGduOFgRZSoVKiQxuXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector2-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1A5yL1eoU5WY+m4Rnvwtv6n+DUkqK+DnLz4MK0KuHE=;
 b=OuYuGsfoUliSemc2YoZDt8395r6k1GomqOUWM+cRuJyyVe5H6wjJdW6kfcYLn5hajATKJHBmfbh5sIpKCLnJ5/WBJRQ5JJYfJkdTVpa9kpKPVZnF1NTa8NqOFL7+xn2wSlLg6ZmYCjgYWzAS7sxkST5hh9FoVzm2UMFOJiIF6Gs=
Received: from BL0PR18MB2275.namprd18.prod.outlook.com (52.132.30.141) by
 BL0PR18MB2305.namprd18.prod.outlook.com (52.132.10.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 29 Oct 2019 09:14:33 +0000
Received: from BL0PR18MB2275.namprd18.prod.outlook.com
 ([fe80::4152:b5a9:45c2:a981]) by BL0PR18MB2275.namprd18.prod.outlook.com
 ([fe80::4152:b5a9:45c2:a981%3]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 09:14:33 +0000
From:   Igor Russkikh <irusskikh@marvell.com>
To:     Egor Pomozov <epomozov@marvell.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Igor Russkikh" <Igor.Russkikh@aquantia.com>
Subject: Re: [EXT] [bug report] net: aquantia: add basic ptp_clock callbacks
Thread-Topic: [EXT] [bug report] net: aquantia: add basic ptp_clock callbacks
Thread-Index: AQHVjjlH8J/gAiM3zUmIBkVocVK08w==
Date:   Tue, 29 Oct 2019 09:14:33 +0000
Message-ID: <2c9b7262-d259-5fb1-0f4e-6634ed687284@marvell.com>
References: <20191028113158.GA32279@mwanda>
 <72AB2F04-F7D8-423C-9191-9373D53B1B59@marvell.com>
In-Reply-To: <72AB2F04-F7D8-423C-9191-9373D53B1B59@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:101:16::22) To BL0PR18MB2275.namprd18.prod.outlook.com
 (2603:10b6:207:44::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [95.79.108.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d471d7d-a577-4f8f-adac-08d75c506973
x-ms-traffictypediagnostic: BL0PR18MB2305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR18MB230598487CB34CA7284F77E9B7610@BL0PR18MB2305.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(6436002)(229853002)(7736002)(4326008)(305945005)(8936002)(25786009)(31686004)(6486002)(6116002)(6246003)(6512007)(110136005)(316002)(31696002)(476003)(2616005)(71190400001)(54906003)(478600001)(14454004)(486006)(86362001)(11346002)(5660300002)(446003)(71200400001)(81166006)(102836004)(66946007)(3846002)(53546011)(66476007)(6506007)(386003)(66556008)(186003)(36756003)(66066001)(52116002)(256004)(2906002)(76176011)(14444005)(99286004)(64756008)(66446008)(26005)(81156014)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR18MB2305;H:BL0PR18MB2275.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0EFjf74cS7NyJv3VWxgd2zGTLjHwGob1qH5mC1j7WszzN1LhEMtcoARNwd/nSK5H/0wZ3VJfDKUD5I7vbbKF+Kvdi41fgaoy8Zwp5/L3frKNDx7Xr19Dq663w6WssSZaMZVnsqyv8RayqBNj0CbbklQgwsVY9U5lSAeW/nU79M5wiDgg71FuiFQanVuz3hPPslnR8XF3I6PG5h1BDcBB7YmVJnM/MvAeRkwSzk4INXDGzqNlOPy19K1PnbzLXkiJqyl4vejZaeLrdYGoXV0FHhNLxee2Xx2nx2cTpKGVel6oxMjUE/sp5T/pQlLKt1KBI4EEYXZM3P2JXn0ZEjUye92oSuvSJYp3sZ8avvHN9R25AtltVcW4OXl4oPaoUUUW9jKsUufpiCtbGioo039tjC1m+re+tYdRXmgL59FPcKnqQQdyzTajrzxqlyLbfDW
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BC38EB6D1197644AB9023F46C98AE32@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d471d7d-a577-4f8f-adac-08d75c506973
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 09:14:33.4521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fjFA5NBCf+tcEob4qQ+BvkK2FHmI/fiZLc+ACtkhB/2KSszh/WgZ2fEFlgPWPgZeRWZ0sxluVzxNAzzDKTKVDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR18MB2305
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQpPbiAyOC4xMC4yMDE5IDE4OjI1LCBFZ29yIFBvbW96b3Ygd3JvdGU6DQo+IEhlbGxvIERhbiwN
Cj4gK0lnb3INCj4gDQo+IFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhlIGlzc3VlLiBXZeKAmWxs
IGZpeGVkIHNvb24uDQoNCg0KPj4gIDEyMDcgICAgICAgICAgY2xvY2sgPSBwdHBfY2xvY2tfcmVn
aXN0ZXIoJmFxX3B0cC0+cHRwX2luZm8sICZhcV9uaWMtPm5kZXYtPmRldik7DQo+PiAgMTIwOCAg
ICAgICAgICBpZiAoIWNsb2NrIHx8IElTX0VSUihjbG9jaykpIHsNCj4+ICAxMjA5ICAgICAgICAg
ICAgICAgICAgbmV0ZGV2X2VycihhcV9uaWMtPm5kZXYsICJwdHBfY2xvY2tfcmVnaXN0ZXIgZmFp
bGVkXG4iKTsNCj4+ICAxMjEwICAgICAgICAgICAgICAgICAgZXJyID0gUFRSX0VSUihjbG9jayk7
DQo+PiAgMTIxMSAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2V4aXQ7DQo+Pg0KPj4gVGhpcyBp
cyBhIGZhbHNlIHBvc2l0aXZlIGluIFNtYXRjaCBidXQgdGhlIGNvZGUgaXMgc3RpbGwgcHJvYmxl
bWF0aWMuDQo+Pg0KPj4gVGhlIGlzc3VlIGlzIHRoYXQgcHRwX2Nsb2NrX3JlZ2lzdGVyKCkgcmV0
dXJucyBlcnJvciBwb2ludGVycyBpZiB0aGVyZQ0KPj4gaXMgYW4gZXJyb3IgYW5kIGl0IHJldHVy
bnMgTlVMTCBpZiB0aGUgY2xvY2sgaXMgZGlzYWJsZWQgaW4gdGhlIGNvbmZpZy4NCj4+IElmICJj
bG9jayIgaXMgTlVMTCB0aGVuIHRoaXMgY29kZSByZXR1cm5zIFBUUl9FUlIoTlVMTCkgd2hpY2gg
aXMNCj4+IHN1Y2Nlc3MgYnV0IHNvIHRoYXQncyBhIGJ1Zy4NCj4+DQo+PiBUaGUgcXVlc3Rpb24g
aXMsIGlzIGl0IHJlYWxseSByZWFsaXN0aWMgZm9yIHBlb3BsZSB0byBydW4gdGhpcyBoYXJkd2Fy
ZQ0KPj4gd2l0aG91dCBhIHB0cCBjbG9jaz8gIElmIHNvIHRoZW4gd2Ugc2hvdWxkIGFsbG93IGl0
IGluc3RlYWQgb2YgZXJyb3JpbmcNCj4+IG91dCBoZXJlIHdoZW4gY2xvY2sgaXMgTlVMTC4gIElm
IG5vdCB0aGVuIHdlIHNob3VsZCBlbmZvcmNlIHRoYXQgaW4gdGhlDQo+PiBLY29uZmlnIGluc3Rl
YWQgb2Ygd2FpdGluZyB1bnRpbCBydW50aW1lLg0KDQpIaSBEYW4sIEknZCBzYXkgdGhhdHMgYSBm
YWxzZSBwb3NpdGl2ZS4NClRoZXJlIGV4aXN0IEhXIGNvbmZpZ3VyYXRpb24gd2hlcmUgUFRQIGlz
IGRpc2FibGVkIG9yIG5vdCBhdmFpbGFibGUuDQoNClBUUl9FUlIoTlVMTCkgaXMgMCwgc28gZXZl
bnR1YWxseSBkcml2ZXIgbm93IGZ1bmN0aW9ucyBjb3JyZWN0bHksIGFsbG93aW5nIHRvDQpwcm9j
ZWVkIGJ1dCBtYXJraW5nIHB0cCBmdW5jdGlvbmFsaXR5IGFzIGRpc2FibGVkLg0KDQpJIGFncmVl
IHRoYXQncyBhIGJpdCBjb3VudGVyaW50dWl0aXZlIGJ1dCBjb3JyZWN0Lg0KDQpSZWdhcmRzLA0K
ICBJZ29yDQo=
