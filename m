Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E56E8B30
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 15:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389517AbfJ2Otr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 10:49:47 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:8732 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389468AbfJ2Otr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 10:49:47 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9TEjfn7017821
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 07:49:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfpt0818;
 bh=MgCV3SWXY3XaLfT8A9UggYg6SDryOdvSY2N4QouVoOI=;
 b=cyIn8ezAbiAu06Xi0+lyKqgglkPae5ilK2AHqv7JJuw5Mk5+akz6d2cqDVM2Mv/1Y9ig
 TyyL47Zt6wY4Dm5XOaV5XYQWJ5someinScG6F6/EFr9tNZqtux4FHnUyB/gjAZ0X51Wl
 7dIzOZPUYcXbDQtBVzd+07o0vGrclnROpuKVMGQgIT7fzZZr8vABtxlkWxp7pP22pQ+4
 V6lKdie37gA83VPkPh4sis3HXgkT7y42PnlCHX5GiqCHSOseGjYIoNWV+j7KjFbqt0ui
 fOaLpTneWnoB+D+htMMSMN9zin+26dJW6edP5kpYEkc0wrBWftteIE7TkOd5bMKxj45+ bQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
        by mx0b-0016f401.pphosted.com with ESMTP id 2vvnnp1ths-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 07:49:45 -0700
Received: from SC-EXCH01.marvell.com (10.93.176.81) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 29 Oct
 2019 07:49:43 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (104.47.33.51) by
 SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 29 Oct 2019 07:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4opntdGgFuLFPOtUBCgVEBWphSICL6fa+tdPoCdyp4lcrpjjOGHunlOgZpI1Dc5txWiMhIyriUZBonBmXkQ+O84Bsa8unscSCcWVKfP9FuMf9Q5m7DDujYUhg0xZARdknYsdi0CThPmkyfrH4i/cgdM6gq8Jrmz/O1n+151LGvkDua/7rVqYh1kPP7rlUYch8BuuCCcVOKgKN/Q8m+0NVNpM7kdONC52L4DM5ltedTjsRGyD9fT8ogMHDKZbHeWJplvIovLi89ySFLTWMf9LRhLFWGQNPx+Ll8b+V41zGWJ7hBi5ufc+rnO98SZiYDHvYFb5/L8xojcGWlZoBDfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgCV3SWXY3XaLfT8A9UggYg6SDryOdvSY2N4QouVoOI=;
 b=RXWyEeBvYBFI/JrJd5KDmDICa2PR/HrcnrnVvl9G0aL1DL5AtKLJe3tad0U8OxQSUgOy1UVBH6so9Pl3BH4eYkgRG/5fHLmMPTdBIp6q1WeZ096Pt37pREev0wBmOOxp2o12DjgpJDYt+12tYX/6hBo7CxAFhgDIEiH6QAfxy0VxNZE+d4h/ZlgfPNQU8RgdBo+bj/rSIzJ0NNLWs81wRi995ufxGLjcyxZYvLQ2noKZbVCP6aDv6sVgrUFeAFytkj1S6fsstmJi3+i+t51vXBR8OW30Q2mZkebQWnFQMfq2vFVh0HYajXfc1srGaGSsCFVoVcI7QqDEb4t4hLEmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector2-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgCV3SWXY3XaLfT8A9UggYg6SDryOdvSY2N4QouVoOI=;
 b=Z78VqSLF4iZEjRtaOh5Lchtc1DUNrMAAOrm5WNVpNMSFu5+tY8Tt+FU7elgTM08dx1Mkn+2yiDCoM+I3XOqtllflKzf2k7DSLNnRhwgokhd5yQ3fTgk85AntH6RIpWG1yJe7SjArJj5s0rZ2lJj4tcFSpe89LlU7V820KPsaveE=
Received: from BL0PR18MB2275.namprd18.prod.outlook.com (52.132.30.141) by
 BL0PR18MB2290.namprd18.prod.outlook.com (52.132.31.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 29 Oct 2019 14:49:41 +0000
Received: from BL0PR18MB2275.namprd18.prod.outlook.com
 ([fe80::4152:b5a9:45c2:a981]) by BL0PR18MB2275.namprd18.prod.outlook.com
 ([fe80::4152:b5a9:45c2:a981%3]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 14:49:41 +0000
From:   Igor Russkikh <irusskikh@marvell.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Egor Pomozov <epomozov@marvell.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [EXT] [bug report] net: aquantia: add basic ptp_clock callbacks
Thread-Topic: [EXT] [bug report] net: aquantia: add basic ptp_clock callbacks
Thread-Index: AQHVjjlH8J/gAiM3zUmIBkVocVK08w==
Date:   Tue, 29 Oct 2019 14:49:40 +0000
Message-ID: <46c25334-e73d-f5fc-bff7-18e0490ecf90@marvell.com>
References: <20191028113158.GA32279@mwanda>
 <72AB2F04-F7D8-423C-9191-9373D53B1B59@marvell.com>
 <2c9b7262-d259-5fb1-0f4e-6634ed687284@marvell.com>
 <20191029100754.GG1922@kadam>
In-Reply-To: <20191029100754.GG1922@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MR2P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::13) To BL0PR18MB2275.namprd18.prod.outlook.com
 (2603:10b6:207:44::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [95.79.108.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 255705cd-3c7e-4b20-2ce4-08d75c7f3a76
x-ms-traffictypediagnostic: BL0PR18MB2290:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR18MB2290F824845289E6B023863EB7610@BL0PR18MB2290.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(189003)(199004)(52116002)(8676002)(5660300002)(81156014)(66556008)(386003)(6506007)(66446008)(478600001)(66476007)(81166006)(76176011)(6486002)(3846002)(64756008)(66946007)(229853002)(54906003)(8936002)(6116002)(99286004)(86362001)(2616005)(31696002)(11346002)(31686004)(25786009)(476003)(486006)(446003)(6246003)(186003)(2906002)(36756003)(6916009)(102836004)(4744005)(71200400001)(66066001)(71190400001)(26005)(14454004)(14444005)(256004)(4326008)(6512007)(7736002)(305945005)(6436002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR18MB2290;H:BL0PR18MB2275.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OKFp2Q5eo9jS7bBfIYYKko9pWP3EMZmfqv4gWoB1wJR5jOEsnYLGCZzE8nqnVZC1Iw929qkQjD1cTpNG0LGEkzfRe4+/GVyD8fegtprSU6cHq0T2au1TVna1SgqgEdlaCovfOnVDjZinB/LtKvKJO/7nhQnk2JwArqGKlzaDXGy/yX5DEPpgVRLrBfhvlraMDLDxVDiM/0VwDWtGaKUgqaLSKOLXHeO1u3DDPdzSiXMBWVU1y8nXoPXqBnQTSNXGY/Et4TFsYT/bTcctbdp3rd1O3TKswJFaXdc263lrg1I3MIeVAGROwW3j+MdGL4XeSugHe7iI42A7KM9UKb+NTwT43SSMEIylpC5I5poiw2oooRJMm07CPndKk1Y137E2hquPFhF/4Zv/0Xtr8X69tQwYRXwfMSFM8Ax94XN01bEE0ypjMuPk6jXW/uADLGdY
Content-Type: text/plain; charset="utf-8"
Content-ID: <242E691DBA49254D9A0D9DDF55AED88B@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 255705cd-3c7e-4b20-2ce4-08d75c7f3a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 14:49:41.0098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVe+VtyFPk+uy4crqsPTo8CaZr22HakK6E2L/Q3A6YRb42+N9wemst0cGCvkkuLxLRnoXf+k0EMc6QbgPG7Qmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR18MB2290
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_04:2019-10-28,2019-10-29 signatures=0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

DQo+PiBIaSBEYW4sIEknZCBzYXkgdGhhdHMgYSBmYWxzZSBwb3NpdGl2ZS4NCj4+IFRoZXJlIGV4
aXN0IEhXIGNvbmZpZ3VyYXRpb24gd2hlcmUgUFRQIGlzIGRpc2FibGVkIG9yIG5vdCBhdmFpbGFi
bGUuDQo+Pg0KPj4gUFRSX0VSUihOVUxMKSBpcyAwLCBzbyBldmVudHVhbGx5IGRyaXZlciBub3cg
ZnVuY3Rpb25zIGNvcnJlY3RseSwgYWxsb3dpbmcgdG8NCj4+IHByb2NlZWQgYnV0IG1hcmtpbmcg
cHRwIGZ1bmN0aW9uYWxpdHkgYXMgZGlzYWJsZWQuDQo+Pg0KPj4gSSBhZ3JlZSB0aGF0J3MgYSBi
aXQgY291bnRlcmludHVpdGl2ZSBidXQgY29ycmVjdC4NCj4gDQo+IEkgaGF2ZSBsb29rZWQgYXQg
aXQgYWdhaW4gYW5kIHRoZSAiIWNsb2NrIiBjaGVjayBzaG91bGQgYmUgcmVtb3ZlZA0KPiBiZWNh
dXNlIGl0IGlzIGRlYWQgY29kZS4gIEl0J3Mgbm90IHBvc3NpYmxlIGZvciBpdCB0byBiZSBOVUxM
IHRoZXJlDQo+IGJlY2F1c2UgYXFfcHRwX2luaXQoKSBpcyBhIGR1bW15IGZ1bmN0aW9uIGlmIHRo
ZSBQVFAgY2xvY2sgaXMgbm90DQo+IGVuYWJsZWQuDQoNCkhtLCBzZWVtcyB5b3UgYXJlIHJpZ2h0
LiBJJ3ZlIGFkZGVkIGV4Y2x1c2lvbiBjb2RlIHdpdGggYSBsYXRlciBjb21taXQNCmFuZCB5ZXMs
IHRoaXMgbWVhbnMgTlVMTCB3aWxsIG5ldmVyIGJlIGEgcmV0dmFsIGhlcmUuDQoNClRoYW5rcyBh
Z2FpbiwgSSdsbCBjbGVhbiBpdCB1cC4NCg0KLS0gDQpSZWdhcmRzLA0KICBJZ29yDQo=
