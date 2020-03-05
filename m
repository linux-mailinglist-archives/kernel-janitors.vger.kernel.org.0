Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EEA17A3BC
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Mar 2020 12:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgCELKh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Mar 2020 06:10:37 -0500
Received: from ulan.pagasa.dost.gov.ph ([202.90.128.205]:46182 "EHLO
        mailgw.pagasa.dost.gov.ph" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725816AbgCELKg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Mar 2020 06:10:36 -0500
X-Greylist: delayed 1234 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Mar 2020 06:10:36 EST
Received: from webmail.pagasa.dost.int ([10.10.11.8])
        by mailgw.pagasa.dost.gov.ph  with ESMTP id 025Anfta006497-025Anftc006497
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 5 Mar 2020 18:49:41 +0800
Received: from localhost (localhost [127.0.0.1])
        by webmail.pagasa.dost.int (Postfix) with ESMTP id 1CBB22981B52;
        Thu,  5 Mar 2020 18:43:20 +0800 (PST)
Received: from webmail.pagasa.dost.int ([127.0.0.1])
        by localhost (webmail.pagasa.dost.int [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id BIkK50s4X8gG; Thu,  5 Mar 2020 18:43:19 +0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by webmail.pagasa.dost.int (Postfix) with ESMTP id 1FB432981B3C;
        Thu,  5 Mar 2020 18:43:19 +0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.10.3 webmail.pagasa.dost.int 1FB432981B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pagasa.dost.gov.ph;
        s=96B9A03E-48B0-11EA-A7E8-92F42F537CE2; t=1583404999;
        bh=RC75T5p3JPNk7JUNB+lH0UfaFQO1Ac584gPL3SIL6h8=;
        h=Date:From:Message-ID:MIME-Version;
        b=xHc5B7KnlGFRNYXBU5OuhWgEqsghdPLaQz0PdU8WGQ1R46wftqj2xd6PvBrmkXauF
         SP5NF7NeSvI/25lSqSdoL0IsMXih928s/pdi6Rrb64mNL4315hsbSbqj0AXenqx+jm
         Tb9hyLhFHdEGTi2ND6KncdohPGPrPfSeI8W29jl4=
X-Virus-Scanned: amavisd-new at pagasa.dost.int
Received: from webmail.pagasa.dost.int ([127.0.0.1])
        by localhost (webmail.pagasa.dost.int [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id sidyCPLbnJHg; Thu,  5 Mar 2020 18:43:18 +0800 (PST)
Received: from webmail.pagasa.dost.int (webmail.pagasa.dost.int [10.11.1.8])
        by webmail.pagasa.dost.int (Postfix) with ESMTP id 3DBEB2981B10;
        Thu,  5 Mar 2020 18:43:17 +0800 (PST)
Date:   Thu, 5 Mar 2020 18:43:17 +0800 (PST)
From:   "Juanito S. Galang" <juanito.galang@pagasa.dost.gov.ph>
Message-ID: <1907161523.3574945.1583404997226.JavaMail.zimbra@pagasa.dost.gov.ph>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.15_GA_3899 (ZimbraWebClient - GC79 (Win)/8.8.15_GA_3895)
Thread-Index: SZ7MY2jMKs/qcT/kYa55SVDyLt9UwA==
Thread-Topic: 
X-FEAS-DKIM: Valid
Authentication-Results: mailgw.pagasa.dost.gov.ph;
        dkim=pass header.i=@pagasa.dost.gov.ph
To:     unlisted-recipients:; (no To-header on input)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Herzlichen Gl=C3=BCckwunsch Lieber Beg=C3=BCnstigter,Sie erhalten diese E-M=
ail von der Robert Bailey Foundation. Ich bin ein pensionierter Regierungsa=
ngestellter aus Harlem und ein Gewinner des Powerball Lottery Jackpot im We=
rt von 343,8 Millionen US-Dollar. Ich bin der gr=C3=B6=C3=9Fte Jackpot-Gewi=
nner in der Geschichte der New Yorker Lotterie im US-Bundesstaat Amerika. I=
ch habe diese Lotterie am 27. Oktober 2018 gewonnen und m=C3=B6chte Sie dar=
=C3=BCber informieren, dass Google in Zusammenarbeit mit Microsoft Ihre "E-=
Mail-Adresse" auf meine Bitte, einen Spendenbetrag von 3.000.000,00 Million=
en Euro zu erhalten, =C3=BCbermittelt hat. Ich spende diese 3 Millionen Eur=
o an Sie, um den Wohlt=C3=A4tigkeitsheimen und armen Menschen in Ihrer Geme=
inde zu helfen, damit wir die Welt f=C3=BCr alle verbessern k=C3=B6nnen.Wei=
tere Informationen finden Sie auf der folgenden Website, damit Sie nicht sk=
eptisch sind
Diese Spende von 3 Mio. EUR.https://nypost.com/2018/11/14/meet-the-winner-o=
f-the-biggest-lottery-jackpot-in-new-york-history/Sie k=C3=B6nnen auch mein=
 YouTube f=C3=BCr mehr Best=C3=A4tigung aufpassen:
https://www.youtube.com/watch?v=3DH5vT18Ysavc
Bitte beachten Sie, dass alle Antworten an (robertdonation7@gmail.com=C2=A0=
 ) gesendet werden, damit wir das k=C3=B6nnen
Fahren Sie fort, um das gespendete Geld an Sie zu =C3=BCberweisen.E-Mail: r=
obertdonation7@gmail.comFreundliche Gr=C3=BC=C3=9Fe,
Robert Bailey
* * * * * * * * * * * * * * * *
Powerball Jackpot Gewinner
