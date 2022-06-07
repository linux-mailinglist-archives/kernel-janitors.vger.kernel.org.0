Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A5253F92B
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jun 2022 11:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239055AbiFGJOh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jun 2022 05:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239057AbiFGJOb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 05:14:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752407CB36
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 02:14:26 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id m20so33817841ejj.10
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jun 2022 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dk8zUgPEAH8sJMme+gRlsmI7BdAAwGXVFJaTHtWa1SI=;
        b=mta/miane2BOFpJdhcvpeFowyrBnBk5zwHfeHjZr2z6BfChJKKpKZ4FJDj9BzcODVL
         YxdCJMy1VPdOhh4KAEy7BQwqxd5qnZ9mtMY3cNrAn0iIdLWHnjmo39+uEBBiT+A3Kabq
         upZpgepVumA3A9OXtepOkvXxOaMQJZr6cL0WyxTwDQpZFV6KdrBaSMQc6SRyRe5DcXss
         XSYmdsyT+j4hT63Y0ctmtoB7wusTrm5SD4wiJEJA9HTCx31UsvL125nwNd4n0hcO81Ug
         Q7w4K0ffPps0h9YHUjjWEm9D0tIXusp+EO6NXsZmsEoWmhbM8J4smam4ZAl9URGNxFjw
         1nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=dk8zUgPEAH8sJMme+gRlsmI7BdAAwGXVFJaTHtWa1SI=;
        b=s2DHCkjsjOOvO2S3eXrK+1rH2MmqeKNiXzhhXQETmxPweFZeKFKXB6nOnEiDdxg2vh
         e6FblXjEcsQnCdU8rMIi1wgo1Og6HQZWcUyoME1VdCQ7cKEyEyAXBhCAL6NSbOa7/i9H
         f9xKG0Kz458/+qJdjjp04Lx1lVSNIs50iRg4oyTPc/IQheqYKdM22i8GpNoLwhF0Jrce
         cog6vv0mxCdx0wEPiDo4VHP3Avx7RtpwfTFfHo/etV9+o3fSRTbE/rUF/YMUl9LBorrY
         7oeZtOOXwVYAUfBqIUXoOElwmhQB+rdR4VzlvTEMluhpDZfv91EDcnKGxN6VGCjYpEQs
         bcTw==
X-Gm-Message-State: AOAM532wtLHAfdI4Bll/Kbzq/6HZ8lTQBsBBVCQaP1tcDLKM71xuDkU3
        XLA0TdKwtBIEOqzyP7/nKRGqp6hc+bZnPwcqtF8=
X-Google-Smtp-Source: ABdhPJxmeVLWvogPIxDePVXNfI0jYsgb8fNDliBeKlAzcFDXEycCpJ+y2WQYz36rsQad9tP9zrB/8YYvoXKy5sLCv0o=
X-Received: by 2002:a17:906:6a27:b0:708:1282:cbe9 with SMTP id
 qw39-20020a1709066a2700b007081282cbe9mr26381041ejc.186.1654593264636; Tue, 07
 Jun 2022 02:14:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:21cc:0:0:0:0:0 with HTTP; Tue, 7 Jun 2022 02:14:24 -0700 (PDT)
Reply-To: robertbaileys_spende@aol.com
From:   Robert Baileys <yusifmaigari222@gmail.com>
Date:   Tue, 7 Jun 2022 11:14:24 +0200
Message-ID: <CA+gykmAZtaUeaSSXNTUDVZEUaXpsVZtHM3-swzUV7Y6upJZG_g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:630 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [yusifmaigari222[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [yusifmaigari222[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=20
Hallo, lieber Beg=C3=BCnstigter,

Sie haben diese E-Mail von der Robert Bailey Foundation erhalten. Ich
bin ein pensionierter Regierungsangestellter aus Harlem und ein
Powerball-Lotterie-Jackpot-Gewinner von 343,8 Millionen Dollar. Ich
bin der gr=C3=B6=C3=9Fte Jackpot-Gewinner in der Geschichte der New York Lo=
ttery
in Amerika. Ich habe diesen Wettbewerb am 27. Oktober 2018 gewonnen
und m=C3=B6chte Ihnen mitteilen, dass Google in Kooperation mit Microsoft
Ihre "E-Mail-Adresse" f=C3=BCr meine Anfrage hat und diese 3.000.000,00
Millionen Euro kosten wird. Ich spende diese 3 Millionen Euro an Sie,
um auch Wohlt=C3=A4tigkeitsorganisationen und armen Menschen in Ihrer
Gemeinde zu helfen, damit wir die Welt zu einem besseren Ort f=C3=BCr alle
machen k=C3=B6nnen. Bitte besuchen Sie die folgende Website f=C3=BCr weiter=
e
Informationen, damit Sie diesen 3 Mio. EUR Ausgaben nicht skeptisch
gegen=C3=BCberstehen.
https://nypost.com/2018/11/14/meet-the-winner-of-the-biggest-lottery-jackpo=
t-in-new-york-history/Sie
Weitere Best=C3=A4tigungen kann ich auch auf meinem Youtube suchen:
https://www.youtube.com/watch?v=3DH5vT18Ysavc
Bitte antworten Sie mir per E-Mail (robertbaileys_spende@aol.com).
Sie m=C3=BCssen diese E-Mail sofort beantworten, damit die =C3=BCberweisend=
e
Bank mit dem Erhalt dieser Spende in H=C3=B6he von 3.000.000,00 Millionen
Euro beginnen kann.
Bitte kontaktieren Sie die untenstehende E-Mail-Adresse f=C3=BCr weitere
Informationen, damit Sie diese Spende von der =C3=BCberweisenden Bank
erhalten k=C3=B6nnen.

E-Mail: robertbaileys_spende@aol.com

Gr=C3=BC=C3=9Fe,
Robert Bailey
* * * * * * * * * * * * * * * *
Powerball-Jackpot-Gewinner
E-Mail: robertbaileys_spende@aol.com
