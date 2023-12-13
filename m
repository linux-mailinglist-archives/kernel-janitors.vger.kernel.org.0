Return-Path: <kernel-janitors+bounces-649-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E401780C526
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 10:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E8C32811EE
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 09:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035B2219F3;
	Mon, 11 Dec 2023 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="rrp8brAq"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E851C8;
	Mon, 11 Dec 2023 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1702288053; x=1733824053;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8jq9d+vMJL266tpgH7mUbAwOrsS3806RJ59zg2n+dQg=;
  b=rrp8brAqL+ajEVDIsdIMV/TpIc70jmE7pKGGcfcSK48BNlGIbbMySnHE
   zuolh1hB0YezyvGAYhQlm1p4EKLRbcVRumSIi7FRnH/E7R1aRP39fU0LF
   MpmTVxBhpGXmiredG4RcBtnxgThI6iFPGf4jiErjJ66tgigYNkcbWkjgf
   c=;
X-IronPort-AV: E=Sophos;i="6.04,267,1695686400"; 
   d="scan'208";a="599839440"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 09:47:31 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
	by email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com (Postfix) with ESMTPS id 4672E40BB6;
	Mon, 11 Dec 2023 09:47:30 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:50711]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.107:2525] with esmtp (Farcaster)
 id d68a7cb1-b01e-4be6-93dd-ec21cdd2c154; Mon, 11 Dec 2023 09:47:29 +0000 (UTC)
X-Farcaster-Flow-ID: d68a7cb1-b01e-4be6-93dd-ec21cdd2c154
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 09:47:29 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 09:47:27 +0000
Message-ID: <19bc8b00-1126-4a29-a127-7c9597b3672d@amazon.com>
Date: Mon, 11 Dec 2023 10:47:27 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: nsm: remove selecting the non-existing config CBOR
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	<aws-nitro-enclaves-devel@amazon.com>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231211074242.22999-1-lukas.bulwahn@gmail.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20231211074242.22999-1-lukas.bulwahn@gmail.com>
X-ClientProxiedBy: EX19D041UWA004.ant.amazon.com (10.13.139.9) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDExLjEyLjIzIDA4OjQyLCBMdWthcyBCdWx3YWhuIHdyb3RlOgo+IENvbW1pdCBiOTg3Mzc1
NWE2YzggKCJtaXNjOiBBZGQgTml0cm8gU2VjdXJlIE1vZHVsZSBkcml2ZXIiKSBhZGRzIE5pdHJv
Cj4gU2VjdXJpdHkgTW9kdWxlIHN1cHBvcnQsIHdoaWNoIHNlbGVjdHMgdGhlIG5vbi1leGlzdGlu
ZyBjb25maWcgQ0JPUi4KPgo+IEluIHRoZSBkZXZlbG9wbWVudCBvZiB0aGUgY29tbWl0LCB0aGVy
ZSB3YXMgaW5pdGlhbGx5IHNvbWUgY29kZSBmb3IgQ0JPUgo+IGluZGVwZW5kZW50IG9mIHRoZSBk
cml2ZXIsIGFuZCB0aGUgZHJpdmVyIGluY2x1ZGVkIHRoaXMgY29kZSB3aXRoIHRoZSBsaW5lCj4g
J3NlbGVjdCBDQk9SJy4gVGhpcyBjb2RlIGZvciBDQk9SIHdhcyBsYXRlciByZWR1Y2VkIHRvIGl0
cyBiYXJlIG1pbmltdW0gb2YKPiBmdW5jdGlvbmFsaXR5IGFuZCBpbmNsdWRlZCBpbnRvIHRoZSBk
cml2ZXIgaXRzZWxmLiBUaGUgc2VsZWN0IENCT1IgcmVtYWluZWQKPiB1bm5vdGljZWQgYW5kIHdh
cyBsZWZ0IGJlaGluZCB3aXRob3V0IGhhdmluZyBhbnkgZnVydGhlciBwdXJwb3NlLgo+Cj4gUmVt
b3ZlIHNlbGVjdGluZyB0aGUgbm9uLWV4aXN0aW5nIGNvbmZpZyBDQk9SLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogTHVrYXMgQnVsd2FobiA8bHVrYXMuYnVsd2FobkBnbWFpbC5jb20+CgoKWWlrZXMuIFRo
YW5rcyBmb3IgdGhlIGNhdGNoIQoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBHcmFmIDxncmFmQGFt
YXpvbi5jb20+CgoKQWxleAoKCj4gLS0tCj4gICBkcml2ZXJzL21pc2MvS2NvbmZpZyB8IDEgLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21pc2MvS2NvbmZpZyBiL2RyaXZlcnMvbWlzYy9LY29uZmlnCj4gaW5kZXggODkzMmI2Y2Y5NTk1
Li40ZmIyOTFmMGJmN2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9taXNjL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL21pc2MvS2NvbmZpZwo+IEBAIC01NjYsNyArNTY2LDYgQEAgY29uZmlnIE5TTQo+
ICAgICAgICAgIHRyaXN0YXRlICJOaXRybyAoRW5jbGF2ZXMpIFNlY3VyaXR5IE1vZHVsZSBzdXBw
b3J0Igo+ICAgICAgICAgIGRlcGVuZHMgb24gVklSVElPCj4gICAgICAgICAgc2VsZWN0IEhXX1JB
TkRPTQo+IC0gICAgICAgc2VsZWN0IENCT1IKPiAgICAgICAgICBoZWxwCj4gICAgICAgICAgICBU
aGlzIGRyaXZlciBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUgTml0cm8gU2VjdXJpdHkgTW9kdWxl
Cj4gICAgICAgICAgICBpbiBBV1MgRUMyIE5pdHJvIGJhc2VkIEVuY2xhdmVzLiBUaGUgZHJpdmVy
IGV4cG9zZXMgYSAvZGV2L25zbQo+IC0tCj4gMi4xNy4xCj4KCgoKQW1hem9uIERldmVsb3BtZW50
IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVm
dHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFn
ZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6
IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


