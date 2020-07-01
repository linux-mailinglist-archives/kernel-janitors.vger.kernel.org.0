Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAAE210F0D
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Jul 2020 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731699AbgGAPYN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Jul 2020 11:24:13 -0400
Received: from mout.web.de ([212.227.15.4]:42171 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731586AbgGAPYM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Jul 2020 11:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593617035;
        bh=euWx0qAvefoSGlGols35uLjLdAprUektGoF0aIdreyQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=qTXDNIIcoMtKElehHMuAulYlIYbOxyFl7QRTtG4Z1plEys5FssyE8wrWaWS7ELEu9
         Ibs/krod2H7y/I3MUuHhbJDP6BSU6ITCZ9OdnYxiw57W46uK0EfVtgClMWvUJLlFaY
         pol0J1NCaLGonYWzN5aQxt5c+3j0Q+B+uX+pRRq4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.41.17]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LmLac-1jHrjc3oO2-00Zsu5; Wed, 01
 Jul 2020 17:23:55 +0200
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
To:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
 <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
 <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
 <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
 <648d287e-3636-1858-1439-103d317f8571@web.de>
 <34065299-03cf-5b62-db37-0acc9830be72@infradead.org>
 <35c7a2b7-a54c-ecd5-9903-efbb6e3c01d2@web.de>
 <20200701091914.7c8d35c4@lwn.net>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <638d1401-d5d2-43a9-22ee-a06eeb990ea2@web.de>
Date:   Wed, 1 Jul 2020 17:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701091914.7c8d35c4@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CyR2regn9R8xyw/vHU3iMzxtCuwH5pS8WfaFu30o6Ht2bhd2BLL
 aOJnb4Tzi5PSDrzrDGXEnI/FTsE9IAkR7e960L1tG3v9wacWBWZLrqKii44z15ypwoRCIUw
 7+fB2NtJeqQH9q+8l/so0LZf1bkKko6Yq4VvqYeXptLCySpL/votf7dugIqBuNOzEDBIJZx
 /k8XzHq/dwWT3PUVA1ThQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OmdqEC35pz8=:IW+2sOhZ7ZnAqi0Wu0wyB7
 SyGna8EvUAnmQDOFXFeCnlEB4QCADCKrowsy9fMes7b69wKG7YqX231oNEGblUUAy0CnlBSNh
 MXbzckQ5QN+USrFeDjNO+ckuZDYHPpDjh3XjfLYGfxp3BdBiZe9rxNRlvsOoT2ybPDt56NHdC
 2D9wGPTksaiWHI5DCjCsAgiPO6Lir5ZpvQi7T6gRA0rvXq9bm1xlLcd8XDm5WgfOMq0ciY69U
 oPWn3l6MUj4YYFQXnt9sluWVwrmS/34M5pcK4Obqh1M4bNRoXHOOT6zTAvUzzmVXW2Zvh6OQK
 iQe4WKnQmSiBF887ZPggWEax4Asdh02PXViB0T/h81meMGub5YcN/8D89i0dTKUw4dZ/ypyhK
 V6JhCOkRd1YcXVpR+Fdd2tl4S7LaM/1xpje46dEalGkJ+VHB62bY2ZQLNJla0H2u5ejvmF6EE
 LCMmEMbYZNavjSrY7Z+UKJ1T+PjkXCTKRwLFW1c78k5KN5AVQxvpcUnjOs62yUyOLAmqW/65m
 MI53gZMj5w94vpgPycPcHtEiT7jhTq0pXyXcLSRf9nNVmocieyxkA30YOg7QNGm+OG7H22o9Y
 6dgt5gECPGmRPoMmyM+pgUWZ0BJK12L05HSzMPc/dclDzlDL7LWyGORdcLT9UZEkg/MYcnk3/
 BZedEnolzx+Wah3kTUs1f36QRmxVz2ko6qjO8qH/x/hiaPRrCfOh/G8nWKEbBBHGuJQsIJ/yr
 GMtJZjLjACJUtfSjb328uvD6hKDgas1hiIYShfQsT3o+tbvt8OGMn3M2uH/qOjiwWRU+rgBhb
 UX+Q/TOEQZj8a0YS+v4afCz7saRWxehRIZeZlsK94N+pmyq/eyWUkapI+cqXreYK6eRmCBQ6e
 Vy+xD++23e1f3SE1eZXTfheUPdEom/OkTSdadeRH9gOzSABe2uQEqIdhykhK3wfZLp8AuRo9C
 Y3RnYiOot9GFQAQNjlaMiWYCOEE2RSQt7ehtKGMn10LSCHLheLaE2eMCGwHw+Wyvg/2GNT9m4
 ref88HN3rk5pqHsGTQ4+SS3Qx4tu0PR57oZkOjHpM1mT5XAEc1Qeo+YCDW8v57Wsd29MPLbXb
 U3uhHaasNR9SHeU7ak1KJYFjEEJLeWZMkOu9RA9+H5wWmLvx18HDYISz0oV6INtp2O8rzyzN+
 Z5FObh+Tj64Krq4Qyi99Pbp5Qjhf/iP+cbHUEpyVp6OTIOKlWL+CaG5snJo/s+Rg5NSzHg4Af
 CYSRKupk2Z3RqQO0m
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

>> I got an other software development impression.
>
> Markus, the patch is fine, we can end this here.

Do you care to improve the software documentation any further
according to the specification file extensions for build commands?

Regards,
Markus
