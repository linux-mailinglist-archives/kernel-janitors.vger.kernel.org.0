Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EA168644A
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Feb 2023 11:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBAKcS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Feb 2023 05:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjBAKcR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Feb 2023 05:32:17 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3749044B7
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Feb 2023 02:32:16 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C245133BDD;
        Wed,  1 Feb 2023 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675247534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ART/YkiTrYg+jQn43kBcwYu4uICVAq+oi+dZSKACtVY=;
        b=CNsbz7lbxY06bgIX+hana8zOtFRxUCN8WSQDcogK611GRvPRqMtbem0dmNa7R5Gt2nqVkj
        4fHbic35TandcDwWpXi3S4O2zGB8P6rid2VeDymYijz9DvtIYCal80hLJYr7kJ4VrwNxej
        CJJMXxsqwwrtsXefApmOk6OPRVeS/I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675247534;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ART/YkiTrYg+jQn43kBcwYu4uICVAq+oi+dZSKACtVY=;
        b=seHE4nl9mgJ+qonk4I8kLd0UHlZpzkjlzLi/1yb20EELQTAp1KqXZKbCKdvu6XpjtZgTI9
        T6Jdq6pJLzP3FcCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E4E813A10;
        Wed,  1 Feb 2023 10:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ff6qJa4/2mMlAwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 10:32:14 +0000
Message-ID: <c1072a01-9919-f1d8-c281-3e1bc1dc4f36@suse.de>
Date:   Wed, 1 Feb 2023 11:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Dan Carpenter <error27@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Javier Martinez Canillas <javierm@redhat.com>
References: <Y9JHzImRcUaa0mi1@kili> <Y9Kn3UQ8WGUtgJgi@orome>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y9Kn3UQ8WGUtgJgi@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qaN10g7MCmG0ivSFVpvTYcCJ"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qaN10g7MCmG0ivSFVpvTYcCJ
Content-Type: multipart/mixed; boundary="------------WhPdVrp8xfhlMYi3Dr1tEgFV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Dan Carpenter <error27@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <c1072a01-9919-f1d8-c281-3e1bc1dc4f36@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
References: <Y9JHzImRcUaa0mi1@kili> <Y9Kn3UQ8WGUtgJgi@orome>
In-Reply-To: <Y9Kn3UQ8WGUtgJgi@orome>

--------------WhPdVrp8xfhlMYi3Dr1tEgFV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjAxLjIzIHVtIDE3OjE4IHNjaHJpZWIgVGhpZXJyeSBSZWRpbmc6DQo+IE9u
IFRodSwgSmFuIDI2LCAyMDIzIGF0IDEyOjI4OjQ0UE0gKzAzMDAsIERhbiBDYXJwZW50ZXIg
d3JvdGU6DQo+PiBUaGUgZGV2bV9tZW1yZW1hcCgpIGZ1bmN0aW9uIGRvZXNuJ3QgcmV0dXJu
IE5VTEwsIGl0IHJldHVybnMgZXJyb3INCj4+IHBvaW50ZXJzLg0KPj4NCj4+IEZpeGVzOiA5
YTEwYzdlNjUxOWIgKCJkcm0vc2ltcGxlZHJtOiBBZGQgc3VwcG9ydCBmb3Igc3lzdGVtIG1l
bW9yeSBmcmFtZWJ1ZmZlcnMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8
ZXJyb3IyN0BnbWFpbC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkv
c2ltcGxlZHJtLmMgfCA0ICsrLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IEdvb2QgY2F0Y2ghIEFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dCwgdGhhbmtzLg0KDQpJIGhhdmUgY2hlcnJ5LXBpY2tlZCB0aGUgcGF0Y2gg
aW50byBkcm0tbWlzYy1uZXh0LWZpeGVzLg0KDQo+IA0KPiBUaGllcnJ5DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------WhPdVrp8xfhlMYi3Dr1tEgFV--

--------------qaN10g7MCmG0ivSFVpvTYcCJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaP64FAwAAAAAACgkQlh/E3EQov+Dd
Cw//VUqRC9g4byAsrdDWyPkUsAZz4pFUVmgv/YlIsOddCteWJtKjllaVKdxDPuTuSRF7GTWvc33C
ZmWzionGCK3ZRSMMQv4WjUDhMy0PHDuXdws36DjmY4VPRRJuTco7AyCOVEiFhD3oWG370RkfBx3X
IQQwjQIT3L5V3BBQsCeSLwLzeo+WaFCKvAUMexN3rYmIyTYemvsCJTeIGwOlmfjCsHBRPhpLMp/J
ss7oRTnCx1fcpnx65hCWJhR0gJybK1GuC377R2vKB7YWmGWKh0bXdyCtQD7QqRthVF6Gj3Q3cub3
nsAVhkqPemQ44GXpMysOu4/NWC8rHpDQ6wRoa34UyrX5/UHqFKpaChb4rh5zZ9kydf5ldbVhgthj
l4914HuYuPm2AlXqyHZyHNiPBe8hVBX4lmdUQaaRlGNGvpLryphr73fhVKnRMwmFZq1j5v70WJDj
NPbzbiPsdZvxTzmVEuNAsI1G3dLkdDgmEADQhSS+Pfb8bq6NXP/xuD/F6ZXwcs21NNl97ecZHfjr
iQR1GdNgUgkn2JcuAy9Wz4w0H/Iw/NYNq1Q+jhNQcXaBZ77sad+c+WbXyJ76cnF8QU1I9IlJiALT
CHPHL3xeDUMdw37BBhMg+AsZpzDN/2QQEPKVA7a43EWDM3k/V4UxfSBkv5LfeTit0y87shAbwz/m
400=
=+sb/
-----END PGP SIGNATURE-----

--------------qaN10g7MCmG0ivSFVpvTYcCJ--
