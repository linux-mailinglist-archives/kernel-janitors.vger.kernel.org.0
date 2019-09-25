Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7848BE4B3
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 20:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437947AbfIYSgi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 14:36:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:6220 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437697AbfIYSgh (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 14:36:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 11:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; 
   d="scan'208";a="340492191"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by orsmga004.jf.intel.com with ESMTP; 25 Sep 2019 11:36:37 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 11:36:36 -0700
Received: from fmsmsx113.amr.corp.intel.com ([169.254.13.68]) by
 FMSMSX119.amr.corp.intel.com ([169.254.14.227]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 11:36:35 -0700
From:   "Verma, Vishal L" <vishal.l.verma@intel.com>
To:     "Williams, Dan J" <dan.j.williams@intel.com>,
        "Weiny, Ira" <ira.weiny@intel.com>
CC:     "Jiang, Dave" <dave.jiang@intel.com>,
        "Busch, Keith" <keith.busch@intel.com>,
        "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Thread-Topic: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Thread-Index: AQHVc8yfjpwRrvESakuTYdbqlYtrt6c9Lg8A
Date:   Wed, 25 Sep 2019 18:36:35 +0000
Message-ID: <ff7ff4f5b4289d189a7c347591a5c35876ea804f.camel@intel.com>
References: <20190925181056.11097-1-ira.weiny@intel.com>
In-Reply-To: <20190925181056.11097-1-ira.weiny@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
x-originating-ip: [10.232.112.164]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD0C650088AFED4EBC5C98E45C47D4B3@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gV2VkLCAyMDE5LTA5LTI1IGF0IDExOjEwIC0wNzAwLCBpcmEud2VpbnlAaW50ZWwuY29tIHdy
b3RlOg0KPiBGcm9tOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+DQo+IA0KPiBEb24n
dCBsZWF2ZSBjbGFpbV9jbGFzcyBzZXQgdG8gYW4gaW52YWxpZCB2YWx1ZSBpZiBhbiBlcnJvciBv
Y2N1cnMgaW4NCj4gYnR0X2NsYWltX2NsYXNzKCkuDQo+IA0KPiBXaGlsZSB3ZSBhcmUgaGVyZSBj
aGFuZ2UgdGhlIHJldHVybiB0eXBlIG9mIF9faG9sZGVyX2NsYXNzX3N0b3JlKCkgdG8gYmUNCj4g
Y2xlYXIgYWJvdXQgdGhlIHZhbHVlcyBpdCBpcyByZXR1cm5pbmcuDQo+IA0KPiBUaGlzIHdhcyBm
b3VuZCB2aWEgY29kZSBpbnNwZWN0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSXJhIFdlaW55
IDxpcmEud2VpbnlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbnZkaW1tL25hbWVzcGFj
ZV9kZXZzLmMgfCAxOSArKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KT25lIG1pbm9yIG5pdCBiZWxvdywgYnV0
IG90aGVyd2lzZSBpdCBsb29rcyBnb29kIHRvIG1lOg0KUmV2aWV3ZWQtYnk6IFZpc2hhbCBWZXJt
YSA8dmlzaGFsLmwudmVybWFAaW50ZWwuY29tPg0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9udmRpbW0vbmFtZXNwYWNlX2RldnMuYyBiL2RyaXZlcnMvbnZkaW1tL25hbWVzcGFjZV9kZXZz
LmMNCj4gaW5kZXggNWIyMmNlY2VmYzk5Li5hMDIwYzE2NmUxZTcgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvbnZkaW1tL25hbWVzcGFjZV9kZXZzLmMNCj4gKysrIGIvZHJpdmVycy9udmRpbW0vbmFt
ZXNwYWNlX2RldnMuYw0KPiBAQCAtMTUxMCwxNiArMTUxMCwxOSBAQCBzdGF0aWMgc3NpemVfdCBo
b2xkZXJfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICB9DQo+ICBzdGF0aWMgREVWSUNFX0FU
VFJfUk8oaG9sZGVyKTsNCj4gIA0KPiAtc3RhdGljIHNzaXplX3QgX19ob2xkZXJfY2xhc3Nfc3Rv
cmUoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpidWYpDQo+ICtzdGF0aWMgaW50IF9f
aG9sZGVyX2NsYXNzX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqYnVmKQ0K
PiAgew0KPiAgCXN0cnVjdCBuZF9uYW1lc3BhY2VfY29tbW9uICpuZG5zID0gdG9fbmRucyhkZXYp
Ow0KPiAgDQo+ICAJaWYgKGRldi0+ZHJpdmVyIHx8IG5kbnMtPmNsYWltKQ0KPiAgCQlyZXR1cm4g
LUVCVVNZOw0KPiAgDQo+IC0JaWYgKHN5c2ZzX3N0cmVxKGJ1ZiwgImJ0dCIpKQ0KPiAtCQluZG5z
LT5jbGFpbV9jbGFzcyA9IGJ0dF9jbGFpbV9jbGFzcyhkZXYpOw0KPiAtCWVsc2UgaWYgKHN5c2Zz
X3N0cmVxKGJ1ZiwgInBmbiIpKQ0KPiArCWlmIChzeXNmc19zdHJlcShidWYsICJidHQiKSkgew0K
PiArCQlpbnQgcmMgPSBidHRfY2xhaW1fY2xhc3MoZGV2KTsNCg0KTmVlZCBhIGJsYW5rIGxpbmUg
aGVyZSBzZXBhcmF0aW5nIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyBhbmQgY29kZS4NCg0KPiArCQlp
ZiAocmMgPCBOVkRJTU1fQ0NMQVNTX05PTkUpDQo+ICsJCQlyZXR1cm4gcmM7DQo+ICsJCW5kbnMt
PmNsYWltX2NsYXNzID0gcmM7DQo+ICsJfSBlbHNlIGlmIChzeXNmc19zdHJlcShidWYsICJwZm4i
KSkNCj4gIAkJbmRucy0+Y2xhaW1fY2xhc3MgPSBOVkRJTU1fQ0NMQVNTX1BGTjsNCj4gIAllbHNl
IGlmIChzeXNmc19zdHJlcShidWYsICJkYXgiKSkNCj4gIAkJbmRucy0+Y2xhaW1fY2xhc3MgPSBO
VkRJTU1fQ0NMQVNTX0RBWDsNCj4gQEAgLTE1MjgsMTAgKzE1MzEsNiBAQCBzdGF0aWMgc3NpemVf
dCBfX2hvbGRlcl9jbGFzc19zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmJ1
ZikNCj4gIAllbHNlDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+IC0JLyogYnR0X2NsYWlt
X2NsYXNzKCkgY291bGQndmUgcmV0dXJuZWQgYW4gZXJyb3IgKi8NCj4gLQlpZiAoKGludCluZG5z
LT5jbGFpbV9jbGFzcyA8IDApDQo+IC0JCXJldHVybiBuZG5zLT5jbGFpbV9jbGFzczsNCj4gLQ0K
PiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IEBAIC0xNTM5LDcgKzE1MzgsNyBAQCBzdGF0aWMg
c3NpemVfdCBob2xkZXJfY2xhc3Nfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiAgCQlzdHJ1
Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKQ0K
PiAgew0KPiAgCXN0cnVjdCBuZF9yZWdpb24gKm5kX3JlZ2lvbiA9IHRvX25kX3JlZ2lvbihkZXYt
PnBhcmVudCk7DQo+IC0Jc3NpemVfdCByYzsNCj4gKwlpbnQgcmM7DQo+ICANCj4gIAluZF9kZXZp
Y2VfbG9jayhkZXYpOw0KPiAgCW52ZGltbV9idXNfbG9jayhkZXYpOw0KPiBAQCAtMTU0Nyw3ICsx
NTQ2LDcgQEAgc3RhdGljIHNzaXplX3QgaG9sZGVyX2NsYXNzX3N0b3JlKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gIAlyYyA9IF9faG9sZGVyX2NsYXNzX3N0b3JlKGRldiwgYnVmKTsNCj4gIAlpZiAo
cmMgPj0gMCkNCj4gIAkJcmMgPSBuZF9uYW1lc3BhY2VfbGFiZWxfdXBkYXRlKG5kX3JlZ2lvbiwg
ZGV2KTsNCj4gLQlkZXZfZGJnKGRldiwgIiVzKCV6ZClcbiIsIHJjIDwgMCA/ICJmYWlsICIgOiAi
IiwgcmMpOw0KPiArCWRldl9kYmcoZGV2LCAiJXMoJWQpXG4iLCByYyA8IDAgPyAiZmFpbCAiIDog
IiIsIHJjKTsNCj4gIAludmRpbW1fYnVzX3VubG9jayhkZXYpOw0KPiAgCW5kX2RldmljZV91bmxv
Y2soZGV2KTsNCj4gIA0KDQo=
