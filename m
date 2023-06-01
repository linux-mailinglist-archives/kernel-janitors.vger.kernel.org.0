Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6AB71954E
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Jun 2023 10:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjFAIU2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Jun 2023 04:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbjFAIU0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jun 2023 04:20:26 -0400
X-Greylist: delayed 837 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Jun 2023 01:20:23 PDT
Received: from mail.ettrick.pl (mail.ettrick.pl [141.94.21.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7538E9F
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jun 2023 01:20:23 -0700 (PDT)
Received: by mail.ettrick.pl (Postfix, from userid 1002)
        id 16949AA2AB; Thu,  1 Jun 2023 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ettrick.pl; s=mail;
        t=1685606516; bh=ZOVeXw1jXE9TbyZP9aLdRwM96AORcRfum8b+rry5JMw=;
        h=Date:From:To:Subject:From;
        b=PXJBNXvoe7Ywr8SEtHN+ydXfJO21YCKEOXtYYrVqyrUt2fQPimLRXsBTqVBZT0YEO
         T3W1W/mQawo+tdJt2GtrhWREAMieDEivMWIJeSdtti0J6ndhPzXNwlE4r1Tp3sCnJj
         DbPTiBUI/+20cG80uXcuWQibCHBIZcVuDDJsG5fM+wAMGyZbxuPyOJ85nf2DtX+AQ/
         N7GXUfbdk2IjWqnRPELQ3xK/n0ZpoKxEO/10X8PFoH5vBK/V9EZT+tzBJLMI+D0i4J
         AFGgRqDP5EMO3GXOmYdCdjTXtJjuJgrRpQKrUCn6D4gg6ZF0P31rGq9+MI+NFhD1z0
         ldOKQCXMJkidQ==
Received: by mail.ettrick.pl for <kernel-janitors@vger.kernel.org>; Thu,  1 Jun 2023 08:00:09 GMT
Message-ID: <20230601064500-0.1.ay.4c43r.0.bqajqcudu0@ettrick.pl>
Date:   Thu,  1 Jun 2023 08:00:09 GMT
From:   "Norbert Karecki" <norbert.karecki@ettrick.pl>
To:     <kernel-janitors@vger.kernel.org>
Subject: Fotowoltaika- propozycja instalacji
X-Mailer: mail.ettrick.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL,URIBL_CSS_A,
        URIBL_DBL_SPAM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: ettrick.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [141.94.21.111 listed in zen.spamhaus.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: ettrick.pl]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: ettrick.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dzie=C5=84 dobry,
=20
Czy rozwa=C5=BCali Pa=C5=84stwo monta=C5=BC systemu fotowoltaicznego?
=20
Instalacja fotowoltaiczna jest najlepszym sposobem na obni=C5=BCenie wyso=
ko=C5=9Bci rachunk=C3=B3w za pr=C4=85d (pozostaj=C4=85 tylko op=C5=82aty =
sta=C5=82e) i zabezpieczenie si=C4=99 przed rosn=C4=85cymi cenami energii=
 elektrycznej. Jest to w pe=C5=82ni odnawialne i bezemisyjne =C5=BAr=C3=B3=
d=C5=82o energii, dzi=C4=99ki czemu przyczyniamy si=C4=99 do ochrony =C5=9B=
rodowiska naturalnego.
=20
Dzia=C5=82amy od wielu lat na rynku energetycznym. Przygotujemy projekt, =
wycen=C4=99 oraz kompleksowo wykonamy i zg=C5=82osimy realizacj=C4=99 do =
zak=C5=82adu energetycznego.=20
=20
Czy chc=C4=85 Pa=C5=84stwo pozna=C4=87 nasz=C4=85 propozycj=C4=99? =20


Pozdrawiam,
Norbert Karecki
