Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C5214835
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 Jul 2020 20:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgGDS4x (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 4 Jul 2020 14:56:53 -0400
Received: from sonic305-20.consmr.mail.ir2.yahoo.com ([77.238.177.82]:37260
        "EHLO sonic305-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbgGDS4x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Jul 2020 14:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1593889010; bh=ZWeDLwf4cGlLDzTwCuOen1zTINlp5j+f2ywobrqBR9o=; h=Date:From:Reply-To:Subject:References:From:Subject; b=G/qOMmPPVuMssamCcRGuGHmd6e5CjgQSoIZJ1ZwMguFjBPM9x7ddyIAceDCDyK+ccgM4xC8AhTbrTDDkvYmY1JdFlX7My86GA9GSxF23vWi9ihBZWBnzIfXAFPJvjRSOtrfk90sitazkl9lnP2bIbbGrxCJXq0rfW3RbQ+zA0SrGqZRXDng/P3r7cuOqXSAER3zwC/zq1CDhIHjz4Z8X9vCVE3rvKml5tX0PcaVuVHlBFF1ngaV6Fg+ulabK+OWBqxvtnN+7mSH1tn1xGEZozKV+qtKLY7uJPDoU7JxHDS4RFatv+VqaIjwnr4v2305umZTXU/FFqacVa5CeqV0V6g==
X-YMail-OSG: IcnLVBIVM1kh2XmpmjxXzgkVgDDX6O0QNXROTeSps1A21pzmwQ9BeVkdRuPWi6R
 j19Sr_Lj5bqCeIEDC.13N1sVoMD4m19HTljdx0VMzvuNSOYt7ZrplR_hom3xPzSivhI3edN9pMZg
 ZrYQIy9XYXMuXXgrZo4Cz5mUvXqyUb4LV9q.PRQQdwCKmOlamNoktXVaQ7oxzDc5X8oQpl91Ffdy
 XyOTGe98xbDM144R_wE_SzZ06QyMvitSEPN82zcw0LAegPb2bQfon8ak7bm.UMLLeWMe5_zC1B4h
 AAV0lyy.UK.DIE0QxW7lqAwo74fW41UycKv9RIIOlf3r3O_uVfddIdba_M6HolGXr04UX_ZyCrFD
 Hrn3c6UDB5at5FaTGL_JJqzHD4A7sEATvHmAS9JO9PyFoLdhGOXpFSe8yo7pdWxgeG7oRmWOpgJB
 Jjf5Y.3wTuWuH.2HHXfPWyoHA8CvQw2inzKirGoidMBLzzobL4N0HqbXKmzt4h5QJ9jh6Xhn5JFP
 kyRuVW6rXvUXTk.KBlYxyCIVjOew3gzim6PU_xpUWKhELJ3zhCZInOUfYZJ1r78y89B9PZrGCNfA
 cKOf71W54TPaKCM1mIpJ.M_x8eaQfloMITnFaa5htbLpRjjTDCYw.nUyIJYJbO4Ke39tJ1bMtpyx
 kPEce3CqJoIB.kfrKV__9ONjCeR2SM2bPoaI7dOtbuB1F.rmmsBo1ytSOkaz9XqlFdljywDS63Pk
 Z2w3Nny_v.aW9c.Da3jMFtqoY9q3KVrpJFnEevwgEMWn5pnsstRQSgsGogIXNuECnt3X5tDq_qYk
 LRXpeGEdMLjvC53TDmZORcXSRGFsRK_hrCrQqehPBtqQHNtee7fOFHxQ1o_Qa9QX2nT_SQsb62g6
 kBUOaJtUYDjaloSxkkn6ySXU4vCNjmXR0PSBnjIzjUOSd2oKmaqLeYW5cgYRpWnRrGpDZMQif2YC
 cQTI1XEj6KUc676bIBTsbuYlNXf_H40NGeF0iQbPHZ47HqIzkYUJmBTifJejv0E_ffraj1hk7WaS
 jPegcZ_ZxULV8REE8Svdc2EG881rg2.DjsrrILD9GEgyN1zC5Dy2KuTpnCGj1CrZrVnGxdVTlSdQ
 zROv_h2iMsec4PFNNqGg50zv81jfK_euffwZMVZE67svJfULEAmr8luQ7.haEnSR3nBR0dIhSYjL
 STT7akzW0CI_nSQ66IOWoIP3HFbpWpieO4OEGgyfnByylMOD7emLi6VYkDVFvWf7ygxGqY3ka84M
 OKEr8Pnoh0BjYF.MwSaZhUFWPq699wzqD3IVWk4.Fa7WwYKd1Afao4aJpFds3Lh6O3DgvyTc-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Sat, 4 Jul 2020 18:56:50 +0000
Date:   Sat, 4 Jul 2020 18:56:47 +0000 (UTC)
From:   Theresa Han <serena@lantermo.it>
Reply-To: han.theresa2017@gmail.com
Message-ID: <1765726647.4468369.1593889007868@mail.yahoo.com>
Subject: =?UTF-8?Q?Ich_gr=C3=BC=C3=9Fe_dich_im_Namen_des_Herrn?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1765726647.4468369.1593889007868.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16197 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
To:     unlisted-recipients:; (no To-header on input)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ich gr=C3=BC=C3=9Fe dich im Namen des Herrn

Ich kann mir nicht vorstellen wie du dich f=C3=BChlen wirst Sie einen pl=C3=
=B6tzlichen Brief aus einem abgelegenen Land in der fernen Elfenbeink=C3=BC=
ste erhalten werden und wahrscheinlich von jemandem, mit dem Sie nicht gut =
verwandt sind. Ich appelliere an Sie, etwas Geduld zu =C3=BCben und meinen =
Brief zu lesen Umgang mit Ihnen in dieser wichtigen Transaktion
=20
Ich bin Frau Theresa Han, 65 Jahre alt, in der Elfenbeink=C3=BCste, an Kreb=
sleiden leidend. Ich war mit Herrn Johnson Han verheiratet, der bei der Reg=
ierung von Elfenbeink=C3=BCste als Auftragnehmer t=C3=A4tig war, bevor er n=
ach einigen Tagen im Krankenhaus starb
=20
Mein verstorbener Ehemann hat die Summe von US$2,5 Millionen (zwei Millione=
n f=C3=BCnfhunderttausend USD) bei einer Bank in der Elfenbeink=C3=BCste hi=
nterlegt. Ich habe an Krebs gelitten. K=C3=BCrzlich sagte mir mein Arzt, da=
ss ich aufgrund der Krebserkrankungen, an denen ich leide, nur noch begrenz=
te Lebenstage habe. Ich m=C3=B6chte wissen, ob ich Ihnen vertrauen kann, di=
ese Mittel f=C3=BCr Wohlt=C3=A4tigkeit / Waisenhaus zu verwenden, und 20 Pr=
ozent werden f=C3=BCr Sie als Entsch=C3=A4digung sein
=20
Ich habe diese Entscheidung getroffen, weil ich kein Kind habe, das dieses =
Geld erben w=C3=BCrde, und mein Ehemann Verwandte sind b=C3=BCrgerliche und=
 sehr wohlhabende Personen und ich m=C3=B6chte nicht, dass mein Ehemann har=
t verdientes Geld missbraucht wird
=20
Bitte nehmen Sie Kontakt mit mir auf, damit ich Ihnen weitere Einzelheiten =
mitteilen kann und jede Verz=C3=B6gerung Ihrer Antwort mir Raum geben wird,=
 eine weitere gute Person f=C3=BCr diesen Zweck zu gewinnen
=20
Warten auf Ihre dringende Antwort Mit Gott sind alle Dinge m=C3=B6glich
=20
Deine Schwester in Christus
=20
Frau Theresa Han
