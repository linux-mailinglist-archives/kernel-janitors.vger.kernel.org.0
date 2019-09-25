Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDF0BE3BF
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 19:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729611AbfIYRtL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 13:49:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:36234 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727420AbfIYRtL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 13:49:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 10:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; 
   d="scan'208";a="188843951"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2019 10:49:10 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 10:49:09 -0700
Received: from fmsmsx113.amr.corp.intel.com ([169.254.13.68]) by
 fmsmsx163.amr.corp.intel.com ([169.254.6.229]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 10:49:09 -0700
From:   "Verma, Vishal L" <vishal.l.verma@intel.com>
To:     "Williams, Dan J" <dan.j.williams@intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "Weiny, Ira" <ira.weiny@intel.com>
CC:     "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        "Jiang, Dave" <dave.jiang@intel.com>,
        "Busch, Keith" <keith.busch@intel.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Thread-Topic: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Thread-Index: AQHVc5B5rM1ZYUSIHUSOStf/1XoAG6c9GkyAgAAAZICAAAaWgA==
Date:   Wed, 25 Sep 2019 17:49:08 +0000
Message-ID: <c4a097f38fb4a51c9bca183bf72b356f00826c10.camel@intel.com>
References: <20190925110008.GK3264@mwanda>
         <71808ca30f4e367931bf58fa3e1798371c2a5044.camel@intel.com>
         <2807E5FD2F6FDA4886F6618EAC48510E8991FB01@CRSMSX101.amr.corp.intel.com>
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E8991FB01@CRSMSX101.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
x-originating-ip: [10.232.112.164]
Content-Type: text/plain; charset="utf-8"
Content-ID: <82D51A1FF533B84288B2B0655C7F884C@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gV2VkLCAyMDE5LTA5LTI1IGF0IDExOjI1IC0wNjAwLCBXZWlueSwgSXJhIHdyb3RlOg0KPiA+
IE9uIFdlZCwgMjAxOS0wOS0yNSBhdCAxNDowMCArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToN
Cj4gPiA+IFRoZSAibmRucy0+Y2xhaW1fY2xhc3MiIHZhcmlhYmxlIGlzIGFuIGVudW0gYnV0IGlu
IHRoaXMgY2FzZSBHQ0Mgd2lsbA0KPiA+ID4gdHJlYXQgaXQgYXMgYW4gdW5zaWduZWQgaW50IHNv
IHRoZSBlcnJvciBoYW5kbGluZyBpcyBuZXZlciB0cmlnZ2VyZWQuDQo+ID4gPiANCj4gPiA+IEZp
eGVzOiAxNGU0OTQ1NDI2MzYgKCJsaWJudmRpbW0sIGJ0dDogQlRUIHVwZGF0ZXMgZm9yIFVFRkkg
Mi43DQo+ID4gPiBmb3JtYXQiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9udmRp
bW0vbmFtZXNwYWNlX2RldnMuYyB8IDIgKy0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbnZkaW1tL25hbWVzcGFjZV9kZXZzLmMNCj4gPiA+IGIvZHJpdmVycy9udmRpbW0vbmFtZXNw
YWNlX2RldnMuYyBpbmRleCBjY2EwYTNiYTFkMmMuLjY2OTk4NTUyNzcxNg0KPiA+ID4gMTAwNjQ0
DQo+ID4gPiAtLS0gYS9kcml2ZXJzL252ZGltbS9uYW1lc3BhY2VfZGV2cy5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL252ZGltbS9uYW1lc3BhY2VfZGV2cy5jDQo+ID4gPiBAQCAtMTUyOSw3ICsxNTI5
LDcgQEAgc3RhdGljIHNzaXplX3QgX19ob2xkZXJfY2xhc3Nfc3RvcmUoc3RydWN0IGRldmljZQ0K
PiA+ICpkZXYsIGNvbnN0IGNoYXIgKmJ1ZikNCj4gPiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+
ID4gDQo+ID4gPiAgCS8qIGJ0dF9jbGFpbV9jbGFzcygpIGNvdWxkJ3ZlIHJldHVybmVkIGFuIGVy
cm9yICovDQo+ID4gPiAtCWlmIChuZG5zLT5jbGFpbV9jbGFzcyA8IDApDQo+ID4gPiArCWlmICgo
aW50KW5kbnMtPmNsYWltX2NsYXNzIDwgMCkNCj4gPiA+ICAJCXJldHVybiBuZG5zLT5jbGFpbV9j
bGFzczsNCj4gPiA+IA0KPiA+ID4gIAlyZXR1cm4gMDsNCj4gPiANCj4gPiBMb29rcyBzdHJhaWdo
dGZvcndhcmQsIGFuZCBhIGdvb2QgY2F0Y2guDQo+ID4gUmV2aWV3ZWQtYnk6IFZpc2hhbCBWZXJt
YSA8dmlzaGFsLmwudmVybWFAaW50ZWwuY29tPg0KPiANCj4gSSdtIG5vdCBzdXJlIHRoaXMgaXMg
cmVhbGx5IGEgZ29vZCBmaXguICBUaGlzIGxlYXZlcyBuZG5zLT5jbGFpbV9jbGFzcyBzZXQgdG8g
YW4gaW52YWxpZCB2YWx1ZS4gIElzIHRoYXQgb2s/DQo+IA0KDQpIbSwgaXQgaXMganVzdCBpbiBh
IHN0b3JlIG9wZXJhdGlvbiBmb3IgdGhlIGhvbGRlcl9jbGFzcyBzeXNmcw0KYXR0cmlidXRlLiBp
ZiBjbGFpbV9jbGFzcyB3YXMgbmVnYXRpdmUsIHRoYXQgc3RvcmUgd2lsbCBqdXN0IGZhaWwuDQoN
CkZyb20gdGhlIHVzZXJzcGFjZSBzaWRlLCB0aGlzIG1lYW5zIHRoZSAnbW9kZScgZW5mb3JjZW1l
bnQgQVBJIHdpbGwNCmZhaWwuIFR5cGljYWxseSwgJ25kY3RsJyBkb2Vzbid0IHJlcXVpcmUgdGhl
IGVuZm9yY2VtZW50IHRvIHN1Y2NlZWQsDQpzaW5jZSB3ZSBjYW4gZGlzYW1iaWd1YXRlIG5hbWVz
cGFjZXMgZXZlbiB3aXRob3V0IGl0LCBzbyBpdCBkb2Vzbid0DQpibG9jayBuYW1lc3BhY2UgY3Jl
YXRpb24gZXRjLg0KDQpPbiB0aGUga2VybmVsIHNpZGUsIGNsYWltX2NsYXNzIGdldHMgdXNlZCBi
eSBidHRfZGV2cy5jIGR1cmluZyBwcm9iZSwNCmFuZCBsb29rcyBsaWtlIHRoaXMgY2FzZSwgYXMg
aXQgY3VycmVudGx5IHN0YW5kcywgd291bGQgZmFpbCB0aGUgQlRUDQpwcm9iZSAobmRfYnR0X3By
b2JlKCkpLiBJIHRoaW5rIHRoaXMgaXMgd2hhdCB3ZSB3YW50Pw0KDQpJIGd1ZXNzIGl0IGNhbiBi
ZSBtYWRlIGEgYml0IGNsZWFyZXIgYnkgc3RvcmluZyBOVkRJTU1fQ0NMQVNTX1VOS05PV04NCmV4
cGxpY2l0bHkgaW4gaG9sZGVyX2NsYXNzX3N0b3JlKCksIGJ1dCB0aGF0IGNhbiBiZSBhIHNlcGFy
YXRlDQppbXByb3ZlbWVudCBmcm9tIHdoYXQgdGhpcyBwYXRjaCBpcyBhZGRyZXNzaW5nLg0K
