Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E085C567C20
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Jul 2022 04:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbiGFCwH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 Jul 2022 22:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiGFCwG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Jul 2022 22:52:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309091A82E;
        Tue,  5 Jul 2022 19:52:05 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y16so23616949lfb.9;
        Tue, 05 Jul 2022 19:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DEOg8W7GOyI6FGw3kGnpXYvm9G5ZcuAYkvSFYjMDtvA=;
        b=d1iysm4fco0n/1ypP1+g7hvkDbocT4bsZtnUWGifLYIKzXHiNfmw4ROFbN91x8vdyI
         M/6DdftNU/Q0zqo9q481e9cd+uqjvkTZFFj6IYhzYnHU560iOu9hrUOq2Lt22a5dkA18
         9QsncO5gGBxx8DOJ1wJaWJsmWRhNhYmhEgyv/vriG3rWnzpbs0xRs7CX4/cR+OTyO/XA
         61EXNUhCP1Ky+4gOUH24oiCwP+DVPAoYl+NukKF0S6TXAjUn+vnvlQC7ojDAPJiFomWD
         wZYLLDKeqmycya8eQdMKhFPeOvVyy7EVq5pz3ktYkzIvRIZJXt3e2+CwSAsWfKvj6lz/
         txUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DEOg8W7GOyI6FGw3kGnpXYvm9G5ZcuAYkvSFYjMDtvA=;
        b=X2SRf8cXkZtbf2Hy8fIEntNcQ50VLSMg0EPbNgcQd4WyPMv7OFFVtdmEWM6RT+evtw
         lxWruvsy4yCwqCDrrtMY1LtIEcvRz2jFOsFRCB8Q4lX7AgEn3ZL+c/icBcu34Xu7b8G0
         aKngLn02YJqwqSNQec5NDaj6+1snYohoDGQwMK34y8PCTWf3y2cRA4tdk3JARgaH1dre
         hoGmXq4LdLfijUXcx1GByzoqDZKrXgRBX22h7kbvTATj4fz4Uv5JwShXQv03h2Dw7n52
         XvXCqAJuvopFpGlQ8V7zaYE4YNSlkg9lFWY0xURmN+nKDx8paubhHOnnw22K8PIWvfdr
         q5dw==
X-Gm-Message-State: AJIora/oXbZ4V6T1lMqOrecMt0EUKzbzxHMgKqgGv3GR3O0Z09lOMSR2
        CTIC4GXSSSwJ+ZVxes4F9pg0G09DqjlHptZnzb8=
X-Google-Smtp-Source: AGRyM1sWh0tQW3VPglMwUz1PcBY47ZE2cnB5+UmP6e3vmgCgCaC/BrlD6tfEhkDQHRKlPrS6iBvhMDNabe3sw/zH5kc=
X-Received: by 2002:a05:6512:108b:b0:47f:a41b:f2f1 with SMTP id
 j11-20020a056512108b00b0047fa41bf2f1mr25827182lfg.430.1657075923375; Tue, 05
 Jul 2022 19:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220704122537.3407-1-lukas.bulwahn@gmail.com> <20220704122537.3407-11-lukas.bulwahn@gmail.com>
In-Reply-To: <20220704122537.3407-11-lukas.bulwahn@gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 6 Jul 2022 10:51:26 +0800
Message-ID: <CAJy-AmmM3fzY6OqaqLuugqGFJiNkTi-BqWyUUPfMAspLsUiAug@mail.gmail.com>
Subject: Re: [PATCH 10/11] docs: zh_CN: align to submitting-drivers removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gTW9uLCBKdWwgNCwgMjAyMiBhdCA4OjI2IFBNIEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdh
aG5AZ21haWwuY29tPiB3cm90ZToNCj4NCj4gQWRqdXN0IHRoZSBDaGluZXNlIHRyYW5zbGF0aW9u
IHRvIHRoZSByZW1vdmFsIG9mIHN1Ym1pdHRpbmctZHJpdmVycyBpbiB0aGUNCj4gRW5nbGlzaCBr
ZXJuZWwgZG9jdW1lbnRhdGlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgQnVsd2FobiA8
bHVrYXMuYnVsd2FobkBnbWFpbC5jb20+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNA
a2VybmVsLm9yZz4NCg0KPiAtLS0NCj4gIC4uLi96aF9DTi9rZXJuZWwtaGFja2luZy9oYWNraW5n
LnJzdCAgICAgICAgICB8ICAgMyArLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNz
LzUuUG9zdGluZy5yc3QgIHwgICAzICstDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nl
c3MvaG93dG8ucnN0ICAgICAgfCAgIDEgLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9j
ZXNzL2luZGV4LnJzdCAgICAgIHwgICAxIC0NCj4gIC4uLi96aF9DTi9wcm9jZXNzL3N1Ym1pdHRp
bmctZHJpdmVycy5yc3QgICAgICB8IDE2MCAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDUgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNjYgZGVsZXRpb25zKC0pDQo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9zdWJtaXR0
aW5nLWRyaXZlcnMucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9rZXJuZWwtaGFja2luZy9oYWNraW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL2tlcm5lbC1oYWNraW5nL2hhY2tpbmcucnN0DQo+IGluZGV4IGYyYmMx
NTRjNWJjYy4uMmM4NWRkZmJmZDNhIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9rZXJuZWwtaGFja2luZy9oYWNraW5nLnJzdA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9rZXJuZWwtaGFja2luZy9oYWNraW5nLnJzdA0KPiBA
QCAtNjMzLDggKzYzMyw3IEBAIEMrKw0KPiAgICAg5paH5Lu277yI5peg6K665aaC5L2V5L2g55qE
5ZCN5a2X6YO95bqU6K+l5Zyo5rqQ5paH5Lu255qE6aG26YOo77yJ44CC57u05oqk5Lq65ZGY5oSP
5ZGz552A5oKo5biM5pyb5Zyo5a+5DQo+ICAgICDlrZDns7vnu5/ov5vooYzmm7TmlLnml7blvpfl
iLDor6Lpl67vvIzlubbkuobop6PnvLrpmbfvvJvov5nmhI/lkbPnnYDlr7nmn5Dpg6jliIbku6Pn
oIHlgZrlh7rmm7TlpJrmib/or7rjgIINCj4NCj4gLS0gIOacgOWQju+8jOWIq+W/mOiusOWOu+mY
heivuyBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCDvvIwNCj4g
LSAgIOS5n+iuuOi/mOaciSBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1kcml2ZXJz
LnJzdCDjgIINCj4gKy0gIOacgOWQju+8jOWIq+W/mOiusOWOu+mYheivuyBEb2N1bWVudGF0aW9u
L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdOOAgg0KPg0KPiAgS2VybmVsIOS7meWls+aj
kg0KPiAgPT09PT09PT09PT09PT09DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9wcm9jZXNzLzUuUG9zdGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9wcm9jZXNzLzUuUG9zdGluZy5yc3QNCj4gaW5kZXggNGVlN2RlMTNmMzcz
Li42YTQ2OWUxYzdkZWIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3Byb2Nlc3MvNS5Qb3N0aW5nLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9wcm9jZXNzLzUuUG9zdGluZy5yc3QNCj4gQEAgLTE5LDggKzE5LDcgQEAN
Cj4gIOWGheaguOW8gOWPkeekvuWMuuW3sue7j+WPkeWxleWHuuS4gOWll+eUqOS6juWPkeW4g+ih
peS4geeahOe6puWumuWSjOi/h+eoi++8m+mBteW+qui/meS6m+e6puWumuWSjOi/h+eoi+WwhuS9
vw0KPiAg5Y+C5LiO5YW25Lit55qE5q+P5Liq5Lq655qE55Sf5rS75pu05Yqg6L275p2+44CC5pys
5paH5qGj6K+V5Zu+5o+P6L+w6L+Z5Lqb57qm5a6a55qE6YOo5YiG57uG6IqC77yb5pu05aSa5L+h
5oGvDQo+ICDkuZ/lj6/lnKjku6XkuIvmlofmoaPkuK3mib7liLANCj4gLTpyZWY6YERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCA8
Y25fc3VibWl0dGluZ3BhdGNoZXM+YO+8jA0KPiAtOnJlZjpgRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vcHJvY2Vzcy9zdWJtaXR0aW5nLWRyaXZlcnMucnN0IDxjbl9zdWJtaXR0aW5n
ZHJpdmVycz5gDQo+ICs6cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QgPGNuX3N1Ym1pdHRpbmdwYXRjaGVzPmANCj4gIOWS
jCA6cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3N1Ym1pdC1j
aGVja2xpc3QucnN0IDxjbl9zdWJtaXRjaGVja2xpc3Q+YOOAgg0KPg0KPiAg5L2V5pe25a+E6YCB
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNz
L2hvd3RvLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvaG93
dG8ucnN0DQo+IGluZGV4IDEzMzRjZGIzMmEzYy4uMTQ1NTE5MGRjMDg3IDEwMDY0NA0KPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdA0K
PiBAQCAtOTYsNyArOTYsNiBAQCBMaW51eOWGheaguOS7o+eggeS4reWMheWQq+acieWkp+mHj+ea
hOaWh+aho+OAgui/meS6m+aWh+aho+WvueS6juWtpuS5oOWmguS9leS4jg0KPiAgICAgIOeahOS7
o+eggeOAgg0KPg0KPiAgICA6cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QgPGNuX3N1Ym1pdHRpbmdwYXRjaGVzPmANCj4g
LSAgOnJlZjpgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctZHJpdmVycy5yc3QgPHN1
Ym1pdHRpbmdkcml2ZXJzPmANCj4NCj4gICAgICDov5nkuKTku73mlofmoaPmmI7noa7mj4/ov7Dl
poLkvZXliJvlu7rlkozlj5HpgIHooaXkuIHvvIzlhbbkuK3ljIXmi6zvvIjkvYbkuI3ku4XpmZDk
uo4p77yaDQo+ICAgICAgICAgLSDpgq7ku7blhoXlrrkNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9pbmRleC5yc3QNCj4gaW5kZXggMzllOWM4OGZi
YWE2Li5hNjgzZGJlYTBjODMgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3Byb2Nlc3MvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3Byb2Nlc3MvaW5kZXgucnN0DQo+IEBAIC00MCw3ICs0MCw2IEBADQo+ICAu
LiB0b2N0cmVlOjoNCj4gICAgIDptYXhkZXB0aDogMQ0KPg0KPiAtICAgc3VibWl0dGluZy1kcml2
ZXJzDQo+ICAgICBzdWJtaXQtY2hlY2tsaXN0DQo+ICAgICBzdGFibGUtYXBpLW5vbnNlbnNlDQo+
ICAgICBzdGFibGUta2VybmVsLXJ1bGVzDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3N1Ym1pdHRpbmctZHJpdmVycy5yc3QgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3N1Ym1pdHRpbmctZHJpdmVycy5yc3QN
Cj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDk4MzQxZTdjZDgxMi4uMDAwMDAw
MDAwMDAwDQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mv
c3VibWl0dGluZy1kcml2ZXJzLnJzdA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDE2MCArMCww
IEBADQo+IC3vu78uLiBfY25fc3VibWl0dGluZ2RyaXZlcnM6DQo+IC0NCj4gLS4uIGluY2x1ZGU6
OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiAtDQo+IC06T3JpZ2luYWw6IDpyZWY6YERvY3Vt
ZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLWRyaXZlcnMucnN0DQo+IC0gICAgICAgICAgIDxz
dWJtaXR0aW5nZHJpdmVycz5gDQo+IC0NCj4gLeWmguaenOaDs+ivhOiuuuaIluabtOaWsOacrOaW
h+eahOWGheWuue+8jOivt+ebtOaOpeiBlOezu+WOn+aWh+aho+eahOe7tOaKpOiAheOAguWmguae
nOS9oOS9v+eUqOiLseaWhw0KPiAt5Lqk5rWB5pyJ5Zuw6Zq+55qE6K+d77yM5Lmf5Y+v5Lul5ZCR
5Lit5paH54mI57u05oqk6ICF5rGC5Yqp44CC5aaC5p6c5pys57+76K+R5pu05paw5LiN5Y+K5pe2
5oiW6ICF57+7DQo+IC3or5HlrZjlnKjpl67popjvvIzor7fogZTns7vkuK3mlofniYjnu7TmiqTo
gIU6Og0KPiAtDQo+IC0gICAgICAgIOS4reaWh+eJiOe7tOaKpOiAhe+8miDmnY7pmLMgIExpIFlh
bmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gLSAgICAgICAg5Lit5paH54mI57+76K+R6ICF77ya
IOadjumYsyAgTGkgWWFuZyA8bGVveWFuZy5saUBueHAuY29tPg0KPiAtICAgICAgICDkuK3mlofn
iYjmoKHor5HogIXvvJog6ZmI55CmIE1hZ2dpZSBDaGVuIDxjaGVucWlAYmV5b25kc29mdC5jb20+
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIOeOi+iBqiBXYW5nIENvbmcgPHhpeW91Lndhbmdj
b25nQGdtYWlsLmNvbT4NCj4gLSAgICAgICAgICAgICAgICAgICAgICAg5byg5beNIFpoYW5nIFdl
aSA8d2V6aGFuZ0BvdXRsb29rLmNvbT4NCj4gLQ0KPiAt5aaC5L2V5ZCRIExpbnV4IOWGheaguOaP
kOS6pOmpseWKqOeoi+W6jw0KPiAtPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gLQ0K
PiAt6L+Z56+H5paH5qGj5bCG5Lya6Kej6YeK5aaC5L2V5ZCR5LiN5ZCM55qE5YaF5qC45rqQ56CB
5qCR5o+Q5Lqk6K6+5aSH6amx5Yqo56iL5bqP44CC6K+35rOo5oSP77yM5aaC5p6c5L2g5oSfDQo+
IC3lhbTotqPnmoTmmK/mmL7ljaHpqbHliqjnqIvluo/vvIzkvaDkuZ/orrjlupTor6Xorr/pl64g
WEZyZWU4NiDpobnnm64oaHR0cHM6Ly93d3cueGZyZWU4Ni5vcmcvKQ0KPiAt5ZKM77yP5oiWIFgu
b3JnIOmhueebriAoaHR0cHM6Ly94Lm9yZynjgIINCj4gLQ0KPiAt5Y+m6K+35Y+C6ZiFIERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJz
dCDmlofmoaPjgIINCj4gLQ0KPiAtDQo+IC3liIbphY3orr7lpIflj7cNCj4gLS0tLS0tLS0tLS0N
Cj4gLQ0KPiAt5Z2X6K6+5aSH5ZKM5a2X56ym6K6+5aSH55qE5Li76K6+5aSH5Y+35LiO5LuO6K6+
5aSH5Y+35piv55SxIExpbnV4IOWRveWQjee8luWPt+WIhumFjeadg+WogSBMQU5BTkHvvIgNCj4g
LeeOsOWcqOaYryBUb3JiZW4gTWF0aGlhc2Vu77yJ6LSf6LSj5YiG6YWN44CC55Sz6K+355qE572R
5Z2A5pivIGh0dHBzOi8vd3d3LmxhbmFuYS5vcmcv44CCDQo+IC3ljbPkvb/kuI3lh4blpIfmj5Dk
uqTliLDkuLvmtYHlhoXmoLjnmoTorr7lpIfpqbHliqjkuZ/pnIDopoHlnKjov5nph4zliIbphY3o
rr7lpIflj7fjgILmnInlhbPor6bnu4bkv6Hmga/vvIwNCj4gLeivt+WPgumYhSBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2RldmljZXMucnN044CCDQo+IC0NCj4gLeWmguaenOS9oOS9v+eUqOea
hOS4jeaYr+W3sue7j+WIhumFjeeahOiuvuWkh+WPt++8jOmCo+S5iOW9k+S9oOaPkOS6pOiuvuWk
h+mpseWKqOeahOaXtuWAme+8jOWug+WwhuS8muiiq+W8ug0KPiAt5Yi25YiG6YWN5LiA5Liq5paw
55qE6K6+5aSH5Y+377yM5Y2z5L6/6L+Z5Liq6K6+5aSH5Y+35ZKM5L2g5LmL5YmN5Y+R57uZ5a6i
5oi355qE5oiq54S25LiN5ZCM44CCDQo+IC0NCj4gLeiuvuWkh+mpseWKqOeahOaPkOS6pOWvueix
oQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0NCj4gLUxpbnV4IDIuMDoNCj4gLSAgICAgICDm
raTlhoXmoLjmupDnoIHmoJHkuI3mjqXlj5fmlrDnmoTpqbHliqjnqIvluo/jgIINCj4gLQ0KPiAt
TGludXggMi4yOg0KPiAtICAgICAgIOatpOWGheaguOa6kOeggeagkeS4jeaOpeWPl+aWsOeahOmp
seWKqOeoi+W6j+OAgg0KPiAtDQo+IC1MaW51eCAyLjQ6DQo+IC0gICAgICAg5aaC5p6c5omA5bGe
55qE5Luj56CB6aKG5Z+f5Zyo5YaF5qC455qEIE1BSU5UQUlORVJTIOaWh+S7tuS4reWIl+acieS4
gOS4quaAu+e7tOaKpOiAhe+8jA0KPiAtICAgICAgIOmCo+S5iOivt+WwhumpseWKqOeoi+W6j+aP
kOS6pOe7meS7luOAguWmguaenOatpOe7tOaKpOiAheayoeacieWbnuW6lOaIluiAheS9oOaJvuS4
jeWIsOaBsOW9k+eahA0KPiAtICAgICAgIOe7tOaKpOiAhe+8jOmCo+S5iOivt+iBlOezuyBXaWxs
eSBUYXJyZWF1IDx3QDF3dC5ldT7jgIINCj4gLQ0KPiAtTGludXggMi42Og0KPiAtICAgICAgIOmZ
pOS6humBteW+quWSjCAyLjQg54mI5YaF5qC45ZCM5qC355qE6KeE5YiZ5aSW77yM5L2g6L+Y6ZyA
6KaB5ZyoIGxpbnV4LWtlcm5lbCDpgq7ku7YNCj4gLSAgICAgICDliJfooajkuIrot5/ouKrmnIDm
lrDnmoQgQVBJIOWPmOWMluOAguWQkSBMaW51eCAyLjYg5YaF5qC45o+Q5Lqk6amx5Yqo55qE6aG2
57qn6IGU57O75Lq6DQo+IC0gICAgICAg5pivIEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+44CCDQo+IC0NCj4gLeWGs+WumuiuvuWkh+mpseWKqOiDveWQpuiiq+aOpeWP
l+eahOadoeS7tg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAtDQo+IC3orrjl
j6/vvJogICAgICAgICAgICDku6PnoIHlv4Xpobvkvb/nlKggR05VIOmAmueUqOWFrOW8gOiuuOWP
r+ivgSAoR1BMKSDmj5DkuqTnu5kgTGludXjvvIzkvYbmmK8NCj4gLSAgICAgICAgICAgICAgIOaI
keS7rOW5tuS4jeimgeaxgiBHUEwg5piv5ZSv5LiA55qE6K645Y+v44CC5L2g5oiW6K645Lya5biM
5pyb5ZCM5pe25L2/55So5aSa56eNDQo+IC0gICAgICAgICAgICAgICDorrjlj6/or4Hlj5HluIPv
vIzlpoLmnpzluIzmnJvpqbHliqjnqIvluo/lj6/ku6Xooqvlhbbku5blvIDmupDnpL7ljLrvvIjm
r5TlpoJCU0TvvIkNCj4gLSAgICAgICAgICAgICAgIOS9v+eUqOOAguivt+WPguiAgyBpbmNsdWRl
L2xpbnV4L21vZHVsZS5oIOaWh+S7tuS4reaJgOWIl+WHuueahOWPr+iiqw0KPiAtICAgICAgICAg
ICAgICAg5o6l5Y+X5YWx5a2Y55qE6K645Y+v44CCDQo+IC0NCj4gLeeJiOadg++8miAgICAgICAg
ICAgIOeJiOadg+aJgOacieiAheW/hemhu+WQjOaEj+S9v+eUqCBHUEwg6K645Y+v44CC5pyA5aW9
5o+Q5Lqk6ICF5ZKM54mI5p2D5omA5pyJ6ICFDQo+IC0gICAgICAgICAgICAgICDmmK/nm7jlkIzk
uKrkurrmiJblrp7kvZPjgILlkKbliJnvvIzlv4XpnIDliJflh7rmjojmnYPkvb/nlKggR1BMIOea
hOeJiOadg+aJgOaciQ0KPiAtICAgICAgICAgICAgICAg5Lq65oiW5a6e5L2T77yM5Lul5aSH6aqM
6K+B5LmL6ZyA44CCDQo+IC0NCj4gLeaOpeWPo++8miAgICAgICAgICAgIOWmguaenOS9oOeahOmp
seWKqOeoi+W6j+S9v+eUqOeOsOaIkOeahOaOpeWPo+W5tuS4lOWSjOWFtuS7luWQjOexu+eahOmp
seWKqOeoi+W6j+ihjA0KPiAtICAgICAgICAgICAgICAg5Li655u45Ly877yM6ICM5LiN5piv5Y67
5Y+R5piO5peg6LCT55qE5paw5o6l5Y+j77yM6YKj5LmI5a6D5bCG5Lya5pu05a655piT6KKr5o6l
5Y+X44CCDQo+IC0gICAgICAgICAgICAgICDlpoLmnpzkvaDpnIDopoHkuIDkuKogTGludXgg5ZKM
IE5UIOeahOmAmueUqOmpseWKqOaOpeWPo++8jOmCo+S5iOivt+WcqOeUqA0KPiAtICAgICAgICAg
ICAgICAg5oi356m66Ze05a6e546w5a6D44CCDQo+IC0NCj4gLeS7o+egge+8miAgICAgICAgICAg
IOivt+S9v+eUqCBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdCDkuK3miYDm
j4/ov7DnmoQgTGludXgg5Luj56CB6aOODQo+IC0gICAgICAgICAgICAgICDmoLzjgILlpoLmnpzk
vaDnmoTmn5Dkupvku6PnoIHmrrXvvIjkvovlpoLpgqPkupvkuI4gV2luZG93cyDpqbHliqjnqIvl
uo/ljIXlhbENCj4gLSAgICAgICAgICAgICAgIOS6q+eahOS7o+eggeaute+8iemcgOimgeS9v+eU
qOWFtuS7luagvOW8j++8jOiAjOS9oOWNtOWPquW4jOacm+e7tOaKpOS4gOS7veS7o+egge+8jA0K
PiAtICAgICAgICAgICAgICAg6YKj5LmI6K+35bCG5a6D5Lus5b6I5aW95Zyw5Yy65YiG5Ye65p2l
77yM5bm25LiU5rOo5piO5Y6f5Zug44CCDQo+IC0NCj4gLeWPr+enu+akjeaAp++8miAg6K+35rOo
5oSP77yM5oyH6ZKI5bm25LiN5rC46L+c5pivIDMyIOS9jeeahO+8jOS4jeaYr+aJgOacieeahOiu
oeeul+acuumDveS9v+eUqOWwjw0KPiAtICAgICAgICAgICAgICAg5bC+5qih5byPIChsaXR0bGUg
ZW5kaWFuKSDlrZjlgqjmlbDmja7vvIzkuI3mmK/miYDmnInnmoTkurrpg73mi6XmnInmta7ngrkN
Cj4gLSAgICAgICAgICAgICAgIOWNleWFg++8jOS4jeimgemaj+S+v+WcqOS9oOeahOmpseWKqOeo
i+W6j+mHjOW1jOWFpSB4ODYg5rGH57yW5oyH5Luk44CC5Y+q6IO95ZyoDQo+IC0gICAgICAgICAg
ICAgICB4ODYg5LiK6L+Q6KGM55qE6amx5Yqo56iL5bqP5LiA6Iis5piv5LiN5Y+X5qyi6L+O55qE
44CC6Jm954S25L2g5Y+v6IO95Y+q5pyJIHg4Ng0KPiAtICAgICAgICAgICAgICAg56Gs5Lu277yM
5b6I6Zq+5rWL6K+V6amx5Yqo56iL5bqP5Zyo5YW25LuW5bmz5Y+w5LiK5piv5ZCm5Y+v55So77yM
5L2G5piv56Gu5L+d5Luj56CBDQo+IC0gICAgICAgICAgICAgICDlj6/ku6Xooqvovbvmnb7lnLDn
p7vmpI3ljbTmmK/lvojnroDljZXnmoTjgIINCj4gLQ0KPiAt5riF5pmw5bqm77yaICAg5YGa5Yiw
5omA5pyJ5Lq66YO96IO95L+u6KGl6L+Z5Liq6amx5Yqo56iL5bqP5bCG5Lya5b6I5pyJ5aW95aSE
77yM5Zug5Li66L+Z5qC35L2g5bCGDQo+IC0gICAgICAgICAgICAgICDkvJrnm7TmjqXmlLbliLDk
v67lpI3nmoTooaXkuIHogIzkuI3mmK8gYnVnIOaKpeWRiuOAguWmguaenOS9oOaPkOS6pOS4gOS4
quivleWbvg0KPiAtICAgICAgICAgICAgICAg6ZqQ6JeP56Gs5Lu25bel5L2c5py655CG55qE6amx
5Yqo56iL5bqP77yM6YKj5LmI5a6D5bCG5Lya6KKr5omU6L+b5bqf57q456+T44CCDQo+IC0NCj4g
LeeUtea6kOeuoeeQhu+8miAg5Zug5Li6IExpbnV4IOato+WcqOiiq+W+iOWkmuenu+WKqOiuvuWk
h+WSjOahjOmdouezu+e7n+S9v+eUqO+8jOaJgOS7peS9oOeahOmpsQ0KPiAtICAgICAgICAgICAg
ICAg5Yqo56iL5bqP5Lmf5b6I5pyJ5Y+v6IO96KKr5L2/55So5Zyo6L+Z5Lqb6K6+5aSH5LiK44CC
5a6D5bqU6K+l5pSv5oyB5pyA5Z+65pys55qE55S1DQo+IC0gICAgICAgICAgICAgICDmupDnrqHn
kIbvvIzljbPlnKjpnIDopoHnmoTmg4XlhrXkuIvlrp7njrDns7vnu5/nuqfkvJHnnKDlkozllKTp
hpLopoHnlKjliLDnmoQNCj4gLSAgICAgICAgICAgICAgIC5zdXNwZW5kIOWSjCAucmVzdW1lIOWH
veaVsOOAguS9oOW6lOivpeajgOafpeS9oOeahOmpseWKqOeoi+W6j+aYr+WQpuiDveatow0KPiAt
ICAgICAgICAgICAgICAg56Gu5Zyw5aSE55CG5LyR55yg5LiO5ZSk6YaS77yM5aaC5p6c5a6e5Zyo
5peg5rOV56Gu6K6k77yM6K+36Iez5bCR5oqKIC5zdXNwZW5kDQo+IC0gICAgICAgICAgICAgICDl
h73mlbDlrprkuYnmiJDov5Tlm54gLUVOT1NZU++8iOWKn+iDveacquWunueOsO+8iemUmeivr+OA
guS9oOi/mOW6lOivpeWwneivleehrg0KPiAtICAgICAgICAgICAgICAg5L+d5L2g55qE6amx5Yqo
5Zyo5LuA5LmI6YO95LiN5bmy55qE5oOF5Ya15LiL5bCG6ICX55S16ZmN5Yiw5pyA5L2O44CC6KaB
6I635b6X6amx5YqoDQo+IC0gICAgICAgICAgICAgICDnqIvluo/mtYvor5XnmoTmjIflr7zvvIzo
r7flj4LpmIUNCj4gLSAgICAgICAgICAgICAgIERvY3VtZW50YXRpb24vcG93ZXIvZHJpdmVycy10
ZXN0aW5nLnJzdOOAguacieWFs+mpseWKqOeoi+W6j+eUtQ0KPiAtICAgICAgICAgICAgICAg5rqQ
566h55CG6Zeu6aKY55u45a+55YWo6Z2i55qE5qaC6L+w77yM6K+35Y+C6ZiFDQo+IC0gICAgICAg
ICAgICAgICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcG0vZGV2aWNlcy5yc3TjgIINCj4gLQ0K
PiAt566h55CG77yaICAgICAgICAgICAg5aaC5p6c5LiA5Liq6amx5Yqo56iL5bqP55qE5L2c6ICF
6L+Y5Zyo6L+b6KGM5pyJ5pWI55qE57u05oqk77yM6YKj5LmI6YCa5bi46Zmk5LqG6YKjDQo+IC0g
ICAgICAgICAgICAgICDkupvmmI7mmL7mraPnoa7kuJTkuI3pnIDopoHku7vkvZXmo4Dmn6XnmoTo
oaXkuIHku6XlpJbvvIzlhbbku5bmiYDmnInnmoTooaXkuIHpg73kvJoNCj4gLSAgICAgICAgICAg
ICAgIOiiq+i9rOWPkee7meS9nOiAheOAguWmguaenOS9oOW4jOacm+aIkOS4uumpseWKqOeoi+W6
j+eahOiBlOezu+S6uuWSjOabtOaWsOiAhe+8jOacgA0KPiAtICAgICAgICAgICAgICAg5aW95Zyo
5Luj56CB5rOo6YeK5Lit5YaZ5piO5bm25LiU5ZyoIE1BSU5UQUlORVJTIOaWh+S7tuS4reWKoOWF
pei/meS4qumpseWKqA0KPiAtICAgICAgICAgICAgICAg56iL5bqP55qE5p2h55uu44CCDQo+IC0N
Cj4gLeS4jeW9seWTjeiuvuWkh+mpseWKqOiDveWQpuiiq+aOpeWPl+eahOadoeS7tg0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0NCj4gLeS+m+W6lOWVhu+8miAgIOeUseeh
rOS7tuS+m+W6lOWVhuadpee7tOaKpOmpseWKqOeoi+W6j+mAmuW4uOaYr+S4gOS7tuWlveS6i+OA
guS4jei/h++8jOWmguaenOa6kOeggQ0KPiAtICAgICAgICAgICAgICAg5qCR6YeM5bey57uP5pyJ
5YW25LuW5Lq65o+Q5L6b5LqG5Y+v56iz5a6a5bel5L2c55qE6amx5Yqo56iL5bqP77yM6YKj5LmI
6K+35LiN6KaB5pyfDQo+IC0gICAgICAgICAgICAgICDmnJvigJzmiJHmmK/kvpvlupTllYbigJ3k
vJrmiJDkuLrlhoXmoLjmlLnnlKjkvaDnmoTpqbHliqjnqIvluo/nmoTnkIbnlLHjgILnkIbmg7Pn
moTmg4UNCj4gLSAgICAgICAgICAgICAgIOWGteaYr++8muS+m+W6lOWVhuS4jueOsOaciempseWK
qOeoi+W6j+eahOS9nOiAheWQiOS9nO+8jOaehOW7uuS4gOS4que7n+S4gOWujOe+jueahA0KPiAt
ICAgICAgICAgICAgICAg6amx5Yqo56iL5bqP44CCDQo+IC0NCj4gLeS9nOiAhe+8miAgICAgICAg
ICAgIOmpseWKqOeoi+W6j+aYr+eUseWkp+eahCBMaW51eCDlhazlj7jnoJTlj5Hov5jmmK/nlLHk
vaDkuKrkurrnvJblhpnvvIzlubbkuI3lvbENCj4gLSAgICAgICAgICAgICAgIOWTjeWFtuaYr+WQ
puiDveiiq+WGheaguOaOpeWPl+OAguayoeacieS6uuWvueWGheaguOa6kOeggeagkeS6q+acieeJ
ueadg+OAguWPquimgeS9oA0KPiAtICAgICAgICAgICAgICAg5YWF5YiG5LqG6Kej5YaF5qC456S+
5Yy677yM5L2g5bCx5Lya5Y+R546w6L+Z5LiA54K544CCDQo+IC0NCj4gLQ0KPiAt6LWE5rqQ5YiX
6KGoDQo+IC0tLS0tLS0tLQ0KPiAtDQo+IC1MaW51eCDlhoXmoLjkuLvmupDnoIHmoJHvvJoNCj4g
LSAgICAgICBmdHAuPz8ua2VybmVsLm9yZzovcHViL2xpbnV4L2tlcm5lbC8uLi4NCj4gLSAgICAg
ICA/PyA9PSDkvaDnmoTlm73lrrbku6PnoIHvvIzkvovlpoIgImNuIuOAgSJ1cyLjgIEidWsi44CB
ImZyIiDnrYnnrYkNCj4gLQ0KPiAtTGludXgg5YaF5qC46YKu5Lu25YiX6KGo77yaDQo+IC0gICAg
ICAgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiAtICAgICAgIFvlj6/pgJrov4flkJFt
YWpvcmRvbW9Admdlci5rZXJuZWwub3Jn5Y+R6YKu5Lu25p2l6K6i6ZiFXQ0KPiAtDQo+IC1MaW51
eCDorr7lpIfpqbHliqjnqIvluo/vvIznrKzkuInniYjvvIjmjqLorqggMi42LjEwIOeJiOWGheag
uO+8ie+8mg0KPiAtICAgICAgIGh0dHBzOi8vbHduLm5ldC9LZXJuZWwvTEREMy8g77yI5YWN6LS5
54mI77yJDQo+IC0NCj4gLUxXTi5uZXQ6DQo+IC0gICAgICAg5q+P5ZGo5YaF5qC45byA5Y+R5rS7
5Yqo5pGY6KaBIC0gaHR0cHM6Ly9sd24ubmV0Lw0KPiAtDQo+IC0gICAgICAgMi42IOeJiOS4rSBB
UEkg55qE5Y+Y5pu077yaDQo+IC0NCj4gLSAgICAgICAgICAgICAgIGh0dHBzOi8vbHduLm5ldC9B
cnRpY2xlcy8yLjYta2VybmVsLWFwaS8NCj4gLQ0KPiAtICAgICAgIOWwhuaXp+eJiOWGheaguOea
hOmpseWKqOeoi+W6j+enu+akjeWIsCAyLjYg54mI77yaDQo+IC0NCj4gLSAgICAgICAgICAgICAg
IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy9kcml2ZXItcG9ydGluZy8NCj4gLQ0KPiAt5YaF5qC4
5paw5omLKEtlcm5lbE5ld2JpZXMpOg0KPiAtICAgICAgIOS4uuaWsOeahOWGheaguOW8gOWPkeiA
heaPkOS+m+aWh+aho+WSjOW4ruWKqQ0KPiAtICAgICAgIGh0dHBzOi8va2VybmVsbmV3Ymllcy5v
cmcvDQo+IC0NCj4gLUxpbnV4IFVTQumhueebru+8mg0KPiAtICAgICAgIGh0dHA6Ly93d3cubGlu
dXgtdXNiLm9yZy8NCj4gLQ0KPiAt5YaZ5YaF5qC46amx5Yqo55qE4oCc5LiN6KaB4oCd77yIQXJq
YW4gdmFuIGRlIFZlbuiRl++8iToNCj4gLSAgICAgICBodHRwOi8vd3d3LmZlbnJ1cy5vcmcvaG93
LXRvLW5vdC13cml0ZS1hLWRldmljZS1kcml2ZXItcGFwZXIucGRmDQo+IC0NCj4gLeWGheaguOa4
hea0geW3pSAoS2VybmVsIEphbml0b3IpOg0KPiAtICAgICAgIGh0dHBzOi8va2VybmVsbmV3Ymll
cy5vcmcvS2VybmVsSmFuaXRvcnMNCj4gLS0NCj4gMi4xNy4xDQo+DQo=
