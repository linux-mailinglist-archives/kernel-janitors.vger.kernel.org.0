Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7307A17C9
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Sep 2023 09:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjIOHvS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Sep 2023 03:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbjIOHvQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 03:51:16 -0400
X-Greylist: delayed 577 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 15 Sep 2023 00:51:03 PDT
Received: from mail.innovatebizlab.com (mail.innovatebizlab.com [217.61.112.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946D4193
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 00:51:03 -0700 (PDT)
Received: by mail.innovatebizlab.com (Postfix, from userid 1002)
        id F368A82930; Fri, 15 Sep 2023 09:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=innovatebizlab.com;
        s=mail; t=1694763667;
        bh=wvil646weoWMA5JjxcTHGdry6YE1uZbSEvjBB8Nwnwo=;
        h=Date:From:To:Subject:From;
        b=BkXRsFbxtSpJIRsZ/LuIx1pMSMUWK2rGQ4SNBlQ7P+KYosdgHy7P9moOs6uHtLGrf
         BiImpfmP+a/a5TAklPyTSlyR82b4qJQiCToMQo1jmQpUcD7qR1KgVvWu0myr8krNhc
         jeIrcvGTkT2QrwJeKufBc/O9QYGU+DcN8BjgMSzt9dZzWVufo94bW8rCwENS/fwSNv
         mb5sd2zGWtU5thFyDCDqJFyMc1zuxhUl882KAvoaZWzu0wC4fqwz0aDy4LYXd3E2o1
         ObVIXfsz49dP8qDTJwJ98BBry3b5G0fA1JG50rX/PV8FcWJncsw9e1Vp8WIjup8A1y
         j692f3UkAbmmA==
Received: by mail.innovatebizlab.com for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 07:40:54 GMT
Message-ID: <20230915084500-0.1.n.1h24.0.87agzp0i7k@innovatebizlab.com>
Date:   Fri, 15 Sep 2023 07:40:54 GMT
From:   =?UTF-8?Q? "Kry=C5=A1tof_Prus=C3=ADk" ?= 
        <krystof.prusik@innovatebizlab.com>
To:     <kernel-janitors@vger.kernel.org>
Subject: =?UTF-8?Q?Je=C5=99=C3=A1bov=C3=BD_a_dopravn=C3=AD_stroje?=
X-Mailer: mail.innovatebizlab.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM28,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [217.61.112.62 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4995]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: innovatebizlab.com]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [217.61.112.62 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: innovatebizlab.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.8 FROM_FMBLA_NEWDOM28 From domain was registered in last 14-28
        *      days
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

V=C3=A1=C5=BEen=C3=AD,

hled=C3=A1te je=C5=99=C3=A1by nebo jinou manipula=C4=8Dn=C3=AD techniku?

Zastupuj=C3=AD evropsk=C3=A9ho l=C3=ADdra ve v=C3=BDvoji a stavb=C4=9B je=
=C5=99=C3=A1b=C5=AF r=C5=AFzn=C3=A9ho druhu (mj. mostov=C3=BD, port=C3=A1=
lov=C3=BDch a samohybn=C3=BDch je=C5=99=C3=A1b=C5=AF a speci=C3=A1ln=C3=AD=
ch =C5=99e=C5=A1en=C3=AD), poj=C3=ADzdn=C3=BDch je=C5=99=C3=A1b=C5=AF, v=C4=
=9B=C5=BEov=C3=BDch je=C5=99=C3=A1b=C5=AF, kladkostroj=C5=AF a n=C3=A1hra=
dn=C3=ADch d=C3=ADl=C5=AF pro manipula=C4=8Dn=C3=AD techniku.

Na=C5=A1e za=C5=99=C3=ADzen=C3=AD vyr=C3=A1b=C3=ADme z nejkvalitn=C4=9Bj=C5=
=A1=C3=ADch materi=C3=A1l=C5=AF a pou=C5=BE=C3=ADv=C3=A1me u nich modern=C3=
=AD technologii. Garantujeme komplexn=C3=AD podporu =E2=80=93 po=C4=8D=C3=
=ADnaje v=C3=BDrobou, p=C5=99es mont=C3=A1=C5=BE, zprovozn=C4=9Bn=C3=AD, =
pro=C5=A1kolen=C3=AD oper=C3=A1toru a kon=C4=8De dod=C3=A1vkou p=C5=99=C3=
=ADslu=C5=A1enstv=C3=AD, n=C3=A1hradn=C3=ADch d=C3=ADl=C5=AF a servisem v=
 re=C5=BEimu 24 h/den. =20

Poskytujeme aplikaci pro sledov=C3=A1n=C3=AD =C4=8Dinnosti je=C5=99=C3=A1=
bu v re=C3=A1ln=C3=A9m =C4=8Dase. P=C5=AFsob=C3=ADme ve 73 a m=C3=A1me 11=
 v=C3=BDrobn=C3=ADch z=C3=A1vod=C5=AF, d=C3=ADky =C4=8Demu=C5=BE jsme sch=
opni rychle reagovat na Va=C5=A1e po=C5=BEadavky a jsme d=C5=AFv=C4=9Bryh=
odn=C3=BDm partnerem.=20

V=C3=BDrobn=C3=AD procesy prob=C3=ADhaj=C3=AD v souladu s mezin=C3=A1rodn=
=C3=ADmi normami IEC, FEM, DIN, EN, kvalita je potvrzena certifik=C3=A1te=
m ISO 9001:2015.

Pokud se chcete sezn=C3=A1mit s na=C5=A1imi =C5=99e=C5=A1en=C3=ADmi, nev=C3=
=A1hejte se na m=C4=9B obr=C3=A1tit.


S pozdravem
Kry=C5=A1tof Prus=C3=ADk
