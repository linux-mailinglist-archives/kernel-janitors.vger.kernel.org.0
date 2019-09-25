Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B899BE354
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 19:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505154AbfIYRYL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 13:24:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:31218 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505152AbfIYRYL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 13:24:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 10:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; 
   d="scan'208";a="188838288"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2019 10:24:10 -0700
Received: from fmsmsx113.amr.corp.intel.com ([169.254.13.68]) by
 FMSMSX103.amr.corp.intel.com ([169.254.2.82]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 10:24:09 -0700
From:   "Verma, Vishal L" <vishal.l.verma@intel.com>
To:     "Williams, Dan J" <dan.j.williams@intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        "Jiang, Dave" <dave.jiang@intel.com>,
        "Busch, Keith" <keith.busch@intel.com>,
        "Weiny, Ira" <ira.weiny@intel.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Thread-Topic: [PATCH] libnvdimm/namespace: Fix a signedness bug in
 __holder_class_store()
Thread-Index: AQHVc5B5rM1ZYUSIHUSOStf/1XoAG6c9GkyA
Date:   Wed, 25 Sep 2019 17:24:09 +0000
Message-ID: <71808ca30f4e367931bf58fa3e1798371c2a5044.camel@intel.com>
References: <20190925110008.GK3264@mwanda>
In-Reply-To: <20190925110008.GK3264@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
x-originating-ip: [10.232.112.164]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCF587D42594D44D9B798B21BC52A6BD@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gV2VkLCAyMDE5LTA5LTI1IGF0IDE0OjAwICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgIm5kbnMtPmNsYWltX2NsYXNzIiB2YXJpYWJsZSBpcyBhbiBlbnVtIGJ1dCBpbiB0aGlz
IGNhc2UgR0NDIHdpbGwNCj4gdHJlYXQgaXQgYXMgYW4gdW5zaWduZWQgaW50IHNvIHRoZSBlcnJv
ciBoYW5kbGluZyBpcyBuZXZlciB0cmlnZ2VyZWQuDQo+IA0KPiBGaXhlczogMTRlNDk0NTQyNjM2
ICgibGlibnZkaW1tLCBidHQ6IEJUVCB1cGRhdGVzIGZvciBVRUZJIDIuNyBmb3JtYXQiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9udmRpbW0vbmFtZXNwYWNlX2RldnMuYyB8IDIgKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbnZkaW1tL25hbWVzcGFjZV9kZXZzLmMgYi9kcml2ZXJzL252ZGltbS9uYW1l
c3BhY2VfZGV2cy5jDQo+IGluZGV4IGNjYTBhM2JhMWQyYy4uNjY5OTg1NTI3NzE2IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL252ZGltbS9uYW1lc3BhY2VfZGV2cy5jDQo+ICsrKyBiL2RyaXZlcnMv
bnZkaW1tL25hbWVzcGFjZV9kZXZzLmMNCj4gQEAgLTE1MjksNyArMTUyOSw3IEBAIHN0YXRpYyBz
c2l6ZV90IF9faG9sZGVyX2NsYXNzX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hh
ciAqYnVmKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiAgCS8qIGJ0dF9jbGFpbV9jbGFz
cygpIGNvdWxkJ3ZlIHJldHVybmVkIGFuIGVycm9yICovDQo+IC0JaWYgKG5kbnMtPmNsYWltX2Ns
YXNzIDwgMCkNCj4gKwlpZiAoKGludCluZG5zLT5jbGFpbV9jbGFzcyA8IDApDQo+ICAJCXJldHVy
biBuZG5zLT5jbGFpbV9jbGFzczsNCj4gIA0KPiAgCXJldHVybiAwOw0KDQpMb29rcyBzdHJhaWdo
dGZvcndhcmQsIGFuZCBhIGdvb2QgY2F0Y2guDQpSZXZpZXdlZC1ieTogVmlzaGFsIFZlcm1hIDx2
aXNoYWwubC52ZXJtYUBpbnRlbC5jb20+DQoNCg0K
