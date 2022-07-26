Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4240F58170E
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jul 2022 18:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbiGZQNz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Jul 2022 12:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiGZQNy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jul 2022 12:13:54 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11F1222A6
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 09:13:53 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d10so13634428pfd.9
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2geObz/qPbQ0zmW0zjdppN56rmNh6IuNe6i2t19UWOo=;
        b=Rt9fgl5bro43McYvqHzz/+frXK4LzU7jzC5TYwXrlDZ+Y104g0z+vFvroXSdKc/njX
         RHH32uunrRXXvVwcxSxiS8RoFxTs+jY7BreaiUZ7ZubMf+Q7FAGJVVGOZVC191UUzVzM
         dOwrbWtu7DpDkBgo7UZIrp5VKDJmleOc66amyrSbxfCmySawyWmlSgZ3A62/WGxE8NSc
         klPM3Q+jghE4gyrPJiRbH1fjCxyhpN2I5/jCTVRl+Mrg7Np+aUH605Smt2Wkz3UtA0sQ
         U0vyWv1eYdUx+ku8lXeq0uhMZuxob/aqIn+zloLC0uZR5+9rHMFvQue/81TNJkqEOtH5
         Oh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=2geObz/qPbQ0zmW0zjdppN56rmNh6IuNe6i2t19UWOo=;
        b=Kuo9XnwmZQqLx6ayTaCvBFMFc64jwuEOpvyq0lgh9dXqBgpC5OO2geuk4RhiHQtTtT
         dNPkTViKJ1CeUkqrrVsWtkltm9zfFMjamMG8UF5Io7YUy4TOpPGIw1WvZp2pkT3at7uf
         k33bm2vgfwWF3PLQMPhGGcS6/k2T9VdLYdbkVZmiwWqiVZoy/15pruLpKdumq7X/LHkp
         nlGGMQHDJ5rMhUYWeivRcwfhK5SvnEo9A5jPk3/+LVQaA7x6twV8omEAl12IQt6NOtb6
         aOTC57Gc4Stwx1CsH1Oszsry7WDo7xxiwAT3SY+AylN7Qlq9fAZk2e2CWTTSFDv/kzOE
         rXyw==
X-Gm-Message-State: AJIora+B9Xjzu+jYyZEKycRsUPGkBcN0vVpMxDDioxTEK2jL7u6mxYUb
        AWqIFn2QwABMWab/p3YCEi3MDPNu9eKQN/ens3PwoRn6nboXnW1P
X-Google-Smtp-Source: AGRyM1tM1WXjX1qyBeNgdVfOZaathJcU+MReshQiI5oXGLN4CZZNNh1gXsXq2vp5m8sRzt45C5Xeu2DqvgP4RDxZnIo=
X-Received: by 2002:a67:cb11:0:b0:355:84b2:5c58 with SMTP id
 b17-20020a67cb11000000b0035584b25c58mr5062179vsl.43.1658852022650; Tue, 26
 Jul 2022 09:13:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:ea88:0:0:0:0:0 with HTTP; Tue, 26 Jul 2022 09:13:40
 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <ubagroup.tgo12@gmail.com>
Date:   Tue, 26 Jul 2022 09:13:40 -0700
Message-ID: <CADnAz76iUa+_xww5v1cdHuTFQKQA-8BC8Y_kWFDP_dd52VX+uA@mail.gmail.com>
Subject: =?UTF-8?Q?GOWY_T=C3=84ZELIK?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hormatly pe=C3=BDdalanyjy,
Bu haty size bir a=C3=BD =C3=B6=C5=88 iberipdim, =C3=BD=C3=B6ne sizden e=C5=
=9Fitmedim, =C3=BDok
Al=C3=BDandygy=C5=88yza ynan=C3=BDaryn we =C5=9Fonu=C5=88 =C3=BC=C3=A7inem =
size =C3=BDene iberdim,
Ilki bilen men dolandyryjy m=C3=BCdir Kristalina Georgi=C3=BDewa we
Halkara Wal=C3=BDuta Gaznasyny=C5=88 prezidenti.

Aslynda, t=C3=B6weregind=C3=A4ki =C3=A4hli p=C3=A4sgel=C3=A7ilikleri we mes=
eleleri g=C3=B6zden ge=C3=A7irdik
doly d=C3=A4l amaly=C5=88yz we t=C3=B6legleri =C3=BDerine =C3=BDetirip bilm=
ezligi=C5=88iz
opsi=C3=BDalary =C3=BC=C3=A7in size gar=C5=9Fy t=C3=B6leg t=C3=B6len=C3=BD=
=C3=A4r
=C3=B6=C5=88ki ge=C3=A7irimler, tassyklamak =C3=BC=C3=A7in sahypamyza giri=
=C5=88 38
=C2=B0 53=E2=80=B256 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 W.

Biz direktorlar ge=C5=88e=C5=9Fi, B=C3=BCtind=C3=BCn=C3=BD=C3=A4 banky we P=
ul gaznasy
Wa=C5=9Fington, Halkara Halkara Pul Gaznasy, B=C3=B6l=C3=BCm bilen bilelikd=
e
Amerikany=C5=88 Birle=C5=9Fen =C5=9Etatlaryny=C5=88 Gazna we k=C3=A4bir be=
=C3=BDleki der=C5=88ew guramalary
Amerikany=C5=88 Birle=C5=9Fen =C5=9Etatlarynda degi=C5=9Flidir. sargyt etdi
Da=C5=9Fary =C3=BDurt t=C3=B6leg t=C3=B6leg b=C3=B6l=C3=BCmimiz, United Ban=
k
Afrika Lome Togo, size $ VISA karto=C3=A7kasy bermek =C3=BC=C3=A7in
Gaznadan has k=C3=B6p pul almak =C3=BC=C3=A7in gaznadan 1,5 million.

Der=C5=88ewimizi=C5=88 dowamynda g=C3=B6zledik
t=C3=B6legi=C5=88izi=C5=88 korrumpirlenen i=C5=9Fg=C3=A4rler tarapyndan gij=
ikdirilendigine alada bildiri=C5=88
seri=C5=9Fd=C3=A4=C5=88izi hasaby=C5=88yza g=C3=B6n=C3=BCkdirm=C3=A4ge syna=
ny=C5=9F=C3=BDan Banky=C5=88
hususy.

Bu g=C3=BCn bolsa gaznany=C5=88yzy=C5=88 Karta berilendigini habar ber=C3=
=BD=C3=A4ris
UBA Bank tarapyndan VISA we eltip berm=C3=A4ge ta=C3=BDyn. Indi
UBA Bank m=C3=BCdiri bilen habarla=C5=9Fy=C5=88, ady jenap Toni
Elumelu, E-po=C3=A7ta: (cfc.ubagroup09@gmail.com)
bankomat VISA karty=C5=88yzy n=C3=A4dip almalydygyny a=C3=BDtmak =C3=BC=C3=
=A7in.

Hormatlamak bilen,

Hanym Kristalina Georgi=C3=BDewa
