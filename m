Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E360132854
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2020 15:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgAGOBm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jan 2020 09:01:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:22658 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728243AbgAGOBm (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jan 2020 09:01:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 06:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; 
   d="scan'208";a="211153910"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by orsmga007.jf.intel.com with ESMTP; 07 Jan 2020 06:01:41 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 7 Jan 2020 06:01:41 -0800
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.67]) by
 fmsmsx158.amr.corp.intel.com ([169.254.15.85]) with mapi id 14.03.0439.000;
 Tue, 7 Jan 2020 06:01:41 -0800
From:   "Souza, Jose" <jose.souza@intel.com>
To:     "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: fix an error code in intel_modeset_all_tiles()
Thread-Topic: [PATCH] drm/i915: fix an error code in
 intel_modeset_all_tiles()
Thread-Index: AQHVxVr9POwPSwHQ70mVoce+ZHUekKffwVkA
Date:   Tue, 7 Jan 2020 14:01:40 +0000
Message-ID: <04c2960a11f5361288d7d3a8a3bd16301b05c5e5.camel@intel.com>
References: <20200107130322.gdk5b6jurifr26c2@kili.mountain>
In-Reply-To: <20200107130322.gdk5b6jurifr26c2@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.251.129.53]
Content-Type: text/plain; charset="utf-8"
Content-ID: <44888AABAAB8484D846749EDE05267A9@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gVHVlLCAyMDIwLTAxLTA3IGF0IDE2OjAzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGVyZSBpcyBhIGN1dCBhbmQgcGFzdGUgYnVnIHNvIHdlIHJldHVybiB0aGUgd3JvbmcgZXJy
b3IgY29kZS4NCj4gDQo+IEZpeGVzOiBhNjAzZjViZDE2OTEgKCJkcm0vaTkxNS9kcDogTWFrZSBz
dXJlIGFsbCB0aWxlZCBjb25uZWN0b3JzIGdldA0KPiBhZGRlZCB0byB0aGUgc3RhdGUgd2l0aCBm
dWxsIG1vZGVzZXQiKQ0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBpbmRleCBkYTUyNjZlNzY3MzguLmE5NmJlZTY5OWE1
ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMNCj4gQEAgLTE0NDI0LDcgKzE0NDI0LDcgQEAgaW50ZWxfbW9kZXNldF9hbGxfdGlsZXMoc3Ry
dWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsIGludCB0aWxlX2dycF9pZCkNCj4gIAkJ
Y3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoJnN0YXRlLT5iYXNlLA0KPiAg
CQkJCQkJICAgICAgIGNvbm5fc3RhdGUtDQo+ID5jcnRjKTsNCj4gIAkJaWYgKElTX0VSUihjcnRj
X3N0YXRlKSkgew0KPiAtCQkJcmV0ID0gUFRSX0VSUihjb25uX3N0YXRlKTsNCj4gKwkJCXJldCA9
IFBUUl9FUlIoY3J0Y19zdGF0ZSk7DQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiAgCQljcnRjX3N0
YXRlLT5tb2RlX2NoYW5nZWQgPSB0cnVlOw0K
