Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403396F5A31
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 May 2023 16:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjECOfI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 May 2023 10:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjECOfF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 10:35:05 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F737296
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 07:34:41 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1DB1A228FA;
        Wed,  3 May 2023 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683124465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bgp5FvF4QGWmZGIFXar9mUREceWHPttZvhBXr/qSGhM=;
        b=ghJWwgHkp5yOcUbwj5tAu9i6IxJHOCOBHXXzKIVhF9dchjs0Oy7f8DfOoXg3rPnBXQnsO/
        4gGiDludsgsNQd++aiFYGPlvPrmZ9CRvqDBSqPVXexypfBCNpIIKva54ANC6y8lhs9Iafu
        /BrUesvpfuKDYQdAn1rRD7Q0/EcoXWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683124465;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bgp5FvF4QGWmZGIFXar9mUREceWHPttZvhBXr/qSGhM=;
        b=/72xW2gI00fW3O4Y/wLb0NqGU9SNiqVMdTZxDhlsr91yt00pGpSlno6grW2K5pndYgTsv+
        rJYEruHQPUCnkBAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EADC41331F;
        Wed,  3 May 2023 14:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pI1tOPBwUmS9RwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 03 May 2023 14:34:24 +0000
Message-ID: <635b4dfa-8f9c-5926-1ed6-acfba6f673d0@suse.de>
Date:   Wed, 3 May 2023 16:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/udl: delete dead code
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Dave Airlie <airlied@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc:     Sean Paul <sean@poorly.run>, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qQTmuzsE4bbyaaVYioIKBfU1"
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qQTmuzsE4bbyaaVYioIKBfU1
Content-Type: multipart/mixed; boundary="------------EPWoBo0E0IQymTXVyBy04oUZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie
 <airlied@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc: Sean Paul <sean@poorly.run>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <635b4dfa-8f9c-5926-1ed6-acfba6f673d0@suse.de>
Subject: Re: [PATCH] drm/udl: delete dead code
References: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
In-Reply-To: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>

--------------EPWoBo0E0IQymTXVyBy04oUZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TWVyZ2VkLCB0aGFua3MhDQoNCkFtIDAyLjA1LjIzIHVtIDE0OjU5IHNjaHJpZWIgRGFuIENh
cnBlbnRlcjoNCj4gVGhlICJ1bm9kZSIgcG9pbnRlciBjYW5ub3QgYmUgTlVMTCBoZXJlIGFu
ZCBjaGVja2luZyBmb3IgaXQgY2F1c2VzDQo+IFNtYXRjaCB3YXJuaW5nczoNCj4gDQo+ICAg
ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmM6MjU5IHVkbF9nZXRfdXJiX2xvY2tl
ZCgpDQo+ICAgICB3YXJuOiBjYW4gJ3Vub2RlJyBldmVuIGJlIE5VTEw/DQo+IA0KPiBGb3J0
dW5hdGVseSwgaXQncyBqdXN0IGhhcm1sZXNzIGRlYWQgY29kZSB3aGljaCBjYW4gYmUgcmVt
b3ZlZC4gIEl0J3MNCj4gbGVmdCBvdmVyIGZyb20gY29tbWl0IGM1YzM1NGEzYTQ3MiAoImRy
bS91ZGw6IEZpeCBpbmNvbnNpc3RlbnQgdXJicy5jb3VudA0KPiB2YWx1ZSBkdXJpbmcgdWRs
X2ZyZWVfdXJiX2xpc3QoKSIpLg0KPiANCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX21haW4uYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gaW5k
ZXggMDYxY2I4OGMwOGEyLi4zZWJlMmNlNTVkZmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9tYWluLmMNCj4gQEAgLTI1NSw3ICsyNTUsNyBAQCBzdGF0aWMgc3RydWN0IHVyYiAqdWRs
X2dldF91cmJfbG9ja2VkKHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwsIGxvbmcgdGltZW91dCkN
Cj4gICAJbGlzdF9kZWxfaW5pdCgmdW5vZGUtPmVudHJ5KTsNCj4gICAJdWRsLT51cmJzLmF2
YWlsYWJsZS0tOw0KPiAgIA0KPiAtCXJldHVybiB1bm9kZSA/IHVub2RlLT51cmIgOiBOVUxM
Ow0KPiArCXJldHVybiB1bm9kZS0+dXJiOw0KPiAgIH0NCj4gICANCj4gICAjZGVmaW5lIEdF
VF9VUkJfVElNRU9VVAlIWg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
CkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZv
IFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFu
DQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------EPWoBo0E0IQymTXVyBy04oUZ--

--------------qQTmuzsE4bbyaaVYioIKBfU1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRScPAFAwAAAAAACgkQlh/E3EQov+A1
CRAAgDe1hu/HItpbBdJpKj8MmYtemdtgPkUS7O4N4fLBodSnFIfE+kTU4SaxuAmaSKFL9PpUIDQr
EH98I32lXyhAOQ5VuCeyGK/h8uLMZi/AYkvtTw6SejbhG6Nd333vJvBFxJqb+ULsM/fxVi31B1L3
hpQU17Si6lHuiiOxnrdJ167sLoI+Pur6YFe9muMSHuDPVJRv2kbbeyAwQyy+cqI5eUDBAdg8CqcR
GmMbqkjnMjOuaWXi354NAilCfQo5GcsJ9cMtcQoH7+zWtb6BedXeyciPf2WupyEMPpaoru/dpxWM
+i6usNX6Rr7A3vfK7x0L7P4GjHwX34JFEsLsk/o0dFV/qXGC1YrOlqUO/6OKgiWNOUGoOZ5oqwPW
ZgefUlkThjTUgBUW8s5EGfYMcjDiDwiwfWFVj6RxCDSDjf5r4B0mWuBaSkkCae5YtcjaGmRJsDK0
NwH8pjlK/jYNnR3jFGbu34+uOpIOMjkVW39cTgpDdqDkYxUqqrStaIHD2ITzj4T5dEbcf/rA6yO6
HZ0aD/q1m/9tllohl8YrDpm7QxI9NIRen9H/EMh5bEX1706P3MUUfti40GPnvqbMS/7nhOpRjEYs
IfmEnEIsDqaCncvMyZ0amSstCAdWy9hJFRSeMarQbleFHlBQOEXjQNGHuOr0uj9kuPt/hctO5PE/
5yI=
=sXUQ
-----END PGP SIGNATURE-----

--------------qQTmuzsE4bbyaaVYioIKBfU1--
