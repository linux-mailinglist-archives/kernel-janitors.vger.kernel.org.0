Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CE72A261B
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Nov 2020 09:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgKBI3I (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 2 Nov 2020 03:29:08 -0500
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:6987 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgKBI3H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Nov 2020 03:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1604305747; x=1635841747;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=IigxMWJoFi9y4Gd5/7rdQPSHQRc1mycdjNDKcBAqG2I=;
  b=a+bpocThotjtkjvcr/IomiTSDUERRKRKJ5hdb1WfDY0zAuaDS3Ff6UrC
   XuEojCFKVD8aFP1vmKn+GR7QGy3mBiiUcy+BKTll87y7i5U5wWzakui0a
   pG+RUAU8GySJDOX064fbZATELlOMz+uwvum7zpj+nvCBn2yDtVY7Sdga/
   c=;
X-IronPort-AV: E=Sophos;i="5.77,444,1596499200"; 
   d="scan'208";a="61899120"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 02 Nov 2020 08:29:00 +0000
Received: from EX13D16EUB003.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS id 4471EA18EF;
        Mon,  2 Nov 2020 08:28:59 +0000 (UTC)
Received: from 38f9d34ed3b1.ant.amazon.com (10.43.162.144) by
 EX13D16EUB003.ant.amazon.com (10.43.166.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 2 Nov 2020 08:28:57 +0000
Subject: Re: [bug report] nitro_enclaves: Add logic for setting an enclave
 vCPU
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Alexandru Vasile <lexnv@amazon.com>,
        <kernel-janitors@vger.kernel.org>
References: <20201030113033.GA3251003@mwanda>
 <6ed3d5cb-e49c-677e-80d4-e02ab14b251a@amazon.com>
 <20201102062013.GC12347@kadam>
From:   "Paraschiv, Andra-Irina" <andraprs@amazon.com>
Message-ID: <46fba46c-e196-1ee7-e27c-66ccfccd28c1@amazon.com>
Date:   Mon, 2 Nov 2020 10:28:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102062013.GC12347@kadam>
Content-Language: en-US
X-Originating-IP: [10.43.162.144]
X-ClientProxiedBy: EX13D47UWA004.ant.amazon.com (10.43.163.47) To
 EX13D16EUB003.ant.amazon.com (10.43.166.99)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

CgpPbiAwMi8xMS8yMDIwIDA4OjIwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IE9uIEZyaSwgT2N0
IDMwLCAyMDIwIGF0IDA1OjIzOjE4UE0gKzAyMDAsIFBhcmFzY2hpdiwgQW5kcmEtSXJpbmEgd3Jv
dGU6Cj4+Cj4+IE9uIDMwLzEwLzIwMjAgMTM6MzAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4+PiBI
ZWxsbyBBbmRyYSBQYXJhc2NoaXYsCj4+Pgo+Pj4gVGhlIHBhdGNoIGZmOGE0ZDNlM2E5OTogIm5p
dHJvX2VuY2xhdmVzOiBBZGQgbG9naWMgZm9yIHNldHRpbmcgYW4KPj4+IGVuY2xhdmUgdkNQVSIg
ZnJvbSBTZXAgMjEsIDIwMjAsIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljCj4+PiBjaGVj
a2VyIHdhcm5pbmc6Cj4+Pgo+Pj4gICAgICAgICAgIGRyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZl
cy9uZV9taXNjX2Rldi5jOjQ3MSBuZV9kb25hdGVkX2NwdSgpCj4+PiAgICAgICAgICAgZXJyb3I6
IHBhc3NpbmcgdW50cnVzdGVkIGRhdGEgJ2NwdScgdG8gJ2NwdW1hc2tfdGVzdF9jcHUoKScKPj4+
Cj4+PiBkcml2ZXJzL3ZpcnQvbml0cm9fZW5jbGF2ZXMvbmVfbWlzY19kZXYuYwo+Pj4gICAgIDEw
OTMgICAgICAgICAgc3dpdGNoIChjbWQpIHsKPj4+ICAgICAxMDk0ICAgICAgICAgIGNhc2UgTkVf
QUREX1ZDUFU6IHsKPj4+ICAgICAxMDk1ICAgICAgICAgICAgICAgICAgaW50IHJjID0gLUVJTlZB
TDsKPj4+ICAgICAxMDk2ICAgICAgICAgICAgICAgICAgdTMyIHZjcHVfaWQgPSAwOwo+Pj4gICAg
IDEwOTcKPj4+ICAgICAxMDk4ICAgICAgICAgICAgICAgICAgaWYgKGNvcHlfZnJvbV91c2VyKCZ2
Y3B1X2lkLCAodm9pZCBfX3VzZXIgKilhcmcsIHNpemVvZih2Y3B1X2lkKSkpCj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXgo+Pj4KPj4+ICAg
ICAxMDk5ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPj4+ICAgICAx
MTAwCj4+PiAgICAgMTEwMSAgICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJm5lX2VuY2xhdmUt
PmVuY2xhdmVfaW5mb19tdXRleCk7Cj4+PiAgICAgMTEwMgo+Pj4gICAgIDExMDMgICAgICAgICAg
ICAgICAgICBpZiAobmVfZW5jbGF2ZS0+c3RhdGUgIT0gTkVfU1RBVEVfSU5JVCkgewo+Pj4gICAg
IDExMDQgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnJfcmF0ZWxpbWl0ZWQobmVfbWlz
Y19kZXYudGhpc19kZXZpY2UsCj4+PiAgICAgMTEwNSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiRW5jbGF2ZSBpcyBub3QgaW4gaW5pdCBzdGF0ZVxuIik7Cj4+
PiAgICAgMTEwNgo+Pj4gICAgIDExMDcgICAgICAgICAgICAgICAgICAgICAgICAgIG11dGV4X3Vu
bG9jaygmbmVfZW5jbGF2ZS0+ZW5jbGF2ZV9pbmZvX211dGV4KTsKPj4+ICAgICAxMTA4Cj4+PiAg
ICAgMTEwOSAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1ORV9FUlJfTk9UX0lOX0lO
SVRfU1RBVEU7Cj4+PiAgICAgMTExMCAgICAgICAgICAgICAgICAgIH0KPj4+ICAgICAxMTExCj4+
PiAgICAgMTExMiAgICAgICAgICAgICAgICAgIGlmICh2Y3B1X2lkID49IChuZV9lbmNsYXZlLT5u
cl9wYXJlbnRfdm1fY29yZXMgKgo+Pj4gICAgIDExMTMgICAgICAgICAgICAgICAgICAgICAgbmVf
ZW5jbGF2ZS0+bnJfdGhyZWFkc19wZXJfY29yZSkpIHsKPj4+Cj4+PiBUbyBwcmV2ZW50IGEgYnVm
ZmVyIG92ZXJmbG93IHZjcHVfaWQgaGFzIHRvIGJlIGxlc3MgdGhhbiAibnJfY3B1X2lkcyIuCj4+
PiBJcyAibmVfZW5jbGF2ZS0+bnJfcGFyZW50X3ZtX2NvcmVzICogbmVfZW5jbGF2ZS0+bnJfdGhy
ZWFkc19wZXJfY29yZSIKPj4+IDw9IG5yX2NwdV9pZHM/ICBJZiBzbyB0aGVuIGl0J3MgZmluZS4K
Pj4gSGkgRGFuLAo+Pgo+PiBUaGFua3MgZm9yIHJlYWNoaW5nIG91dCB3aXRoIHJlZ2FyZCB0byB0
aGlzIHJlcG9ydGVkIGlzc3VlIGZyb20gdGhlIHN0YXRpYwo+PiBhbmFseXNpcy4KPj4KPj4gIm5y
X2NwdV9pZHMiIGlzIHVzZWQgd2hlbiB0aGUgbnVtYmVyIG9mIGNvcmVzIGlzIGluaXRpYWxpemVk
LCBzbyBpdCBzaG91bGQKPj4gYmUgZmluZS4gTGV0IG1lIGtub3cgaWYgSSBtaXNzIHNvbWV0aGlu
ZyBhbmQgYSBjaGVjayBoYXMgdG8gYmUgYWRkZWQgdG8KPj4gZGlyZWN0bHkgY29tcGFyZSB0byAi
bnJfY3B1X2lkcyIuCj4gWWVhaC4gIFRoYXQgd29ya3MuICBUaGFua3MgZm9yIHRha2luZyBhIGxv
b2sgYXQgdGhpcy4KPgoKT2ssIHRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cC4KCkFuZHJhCgoKCkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgKFJvbWFuaWEpIFMuUi5MLiByZWdpc3RlcmVkIG9mZmlj
ZTogMjdBIFNmLiBMYXphciBTdHJlZXQsIFVCQzUsIGZsb29yIDIsIElhc2ksIElhc2kgQ291bnR5
LCA3MDAwNDUsIFJvbWFuaWEuIFJlZ2lzdGVyZWQgaW4gUm9tYW5pYS4gUmVnaXN0cmF0aW9uIG51
bWJlciBKMjIvMjYyMS8yMDA1Lgo=

