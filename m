Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4757BBE357
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 19:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634093AbfIYRZl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 13:25:41 -0400
Received: from mga18.intel.com ([134.134.136.126]:58419 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505167AbfIYRZl (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 13:25:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 10:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; 
   d="scan'208";a="196061069"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2019 10:25:37 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 10:25:37 -0700
Received: from crsmsx102.amr.corp.intel.com (172.18.63.137) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 10:25:36 -0700
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.249]) by
 CRSMSX102.amr.corp.intel.com ([169.254.2.63]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 11:25:34 -0600
From:   "Weiny, Ira" <ira.weiny@intel.com>
To:     "Verma, Vishal L" <vishal.l.verma@intel.com>,
        "Williams, Dan J" <dan.j.williams@intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        "Jiang, Dave" <dave.jiang@intel.com>,
        "Busch, Keith" <keith.busch@intel.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Thread-Topic: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Thread-Index: AQHVc5B5MqbPUorT3Ue1I+CXzfNkKKc9CYiA//+bscA=
Date:   Wed, 25 Sep 2019 17:25:33 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E8991FB01@CRSMSX101.amr.corp.intel.com>
References: <20190925110008.GK3264@mwanda>
 <71808ca30f4e367931bf58fa3e1798371c2a5044.camel@intel.com>
In-Reply-To: <71808ca30f4e367931bf58fa3e1798371c2a5044.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmFhNjYyMTYtY2ZmNi00MDM4LTk1N2MtMDg4ZDViNTQ1ZTkzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSE1jWmRSMTVaQTZvNDJnNmhIRENGUndPa3RXSEZRMVVjTTBMZmZzd25qV2YwNTEycUJva3FndWlVYzdCMk4yUiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.18.205.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

PiANCj4gT24gV2VkLCAyMDE5LTA5LTI1IGF0IDE0OjAwICswMzAwLCBEYW4gQ2FycGVudGVyIHdy
b3RlOg0KPiA+IFRoZSAibmRucy0+Y2xhaW1fY2xhc3MiIHZhcmlhYmxlIGlzIGFuIGVudW0gYnV0
IGluIHRoaXMgY2FzZSBHQ0Mgd2lsbA0KPiA+IHRyZWF0IGl0IGFzIGFuIHVuc2lnbmVkIGludCBz
byB0aGUgZXJyb3IgaGFuZGxpbmcgaXMgbmV2ZXIgdHJpZ2dlcmVkLg0KPiA+DQo+ID4gRml4ZXM6
IDE0ZTQ5NDU0MjYzNiAoImxpYm52ZGltbSwgYnR0OiBCVFQgdXBkYXRlcyBmb3IgVUVGSSAyLjcN
Cj4gPiBmb3JtYXQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9udmRpbW0vbmFtZXNwYWNl
X2RldnMuYyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udmRpbW0vbmFtZXNwYWNl
X2RldnMuYw0KPiA+IGIvZHJpdmVycy9udmRpbW0vbmFtZXNwYWNlX2RldnMuYyBpbmRleCBjY2Ew
YTNiYTFkMmMuLjY2OTk4NTUyNzcxNg0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbnZk
aW1tL25hbWVzcGFjZV9kZXZzLmMNCj4gPiArKysgYi9kcml2ZXJzL252ZGltbS9uYW1lc3BhY2Vf
ZGV2cy5jDQo+ID4gQEAgLTE1MjksNyArMTUyOSw3IEBAIHN0YXRpYyBzc2l6ZV90IF9faG9sZGVy
X2NsYXNzX3N0b3JlKHN0cnVjdCBkZXZpY2UNCj4gKmRldiwgY29uc3QgY2hhciAqYnVmKQ0KPiA+
ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gIAkvKiBidHRfY2xhaW1fY2xhc3MoKSBjb3Vs
ZCd2ZSByZXR1cm5lZCBhbiBlcnJvciAqLw0KPiA+IC0JaWYgKG5kbnMtPmNsYWltX2NsYXNzIDwg
MCkNCj4gPiArCWlmICgoaW50KW5kbnMtPmNsYWltX2NsYXNzIDwgMCkNCj4gPiAgCQlyZXR1cm4g
bmRucy0+Y2xhaW1fY2xhc3M7DQo+ID4NCj4gPiAgCXJldHVybiAwOw0KPiANCj4gTG9va3Mgc3Ry
YWlnaHRmb3J3YXJkLCBhbmQgYSBnb29kIGNhdGNoLg0KPiBSZXZpZXdlZC1ieTogVmlzaGFsIFZl
cm1hIDx2aXNoYWwubC52ZXJtYUBpbnRlbC5jb20+DQoNCkknbSBub3Qgc3VyZSB0aGlzIGlzIHJl
YWxseSBhIGdvb2QgZml4LiAgVGhpcyBsZWF2ZXMgbmRucy0+Y2xhaW1fY2xhc3Mgc2V0IHRvIGFu
IGludmFsaWQgdmFsdWUuICBJcyB0aGF0IG9rPw0KDQpJcmENCg0K
