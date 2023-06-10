Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDC972AC9B
	for <lists+kernel-janitors@lfdr.de>; Sat, 10 Jun 2023 17:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234676AbjFJPbk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 10 Jun 2023 11:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjFJPbj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Jun 2023 11:31:39 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E795184
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Jun 2023 08:31:38 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so2368873b3a.3
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Jun 2023 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686411098; x=1689003098;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUxwqeyLhIlZPaDi9POs0iED5OhxGTIzC6dHqJXBqsw=;
        b=UYsNiFVDO26s+PJmW3P56xI35jIeRhptMcKNXf49KidAj7lBqvFT2FcL49dOAyLAMV
         qXp+UOYfj39lR7Osam5E6wvPaohXhDKr6OJ/E4ECBWLSRKuCCk5VB+G4KdMpoTSokTTp
         LX5+lJcL3uYUXEeVad3naFnY+Mj/jwZoUh18smWeS16UpPN3V4X97/42bXCycoMfOQzG
         JTdj/cEOk7tYlrUZuB9H3idY+Ro154SWTcdR/iwRi/6Ci3+/V+663Uv65Sxs7G3Qq5oJ
         E+jvDTp7NYCij4dThWVeCznDkwxQeP61Gtcm4aCVWo8mi/lpvB4MN3a5U24+KJ3+eWqx
         /I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686411098; x=1689003098;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUxwqeyLhIlZPaDi9POs0iED5OhxGTIzC6dHqJXBqsw=;
        b=MpZyIZ9jOh/G3h6U2k7ya2NxnkVD49i88WkYNIFP7wavqrNLhx2DcTx7vKdxwGvF3i
         s2fR1pNWeJuDCSQAO7CiyJ+3lTXIGueVL2J2rU5eYXhB6cUgDZxt8McXodH9ZrquLQbT
         4t/giKs6lGx58tkujT2pLN8le3nkDst0cGgT56ytuz0rl/PuhHXo2b2UsNEfAjuZ6tiw
         I/TF+05unQWb1QbxVKfDM675jym/vLsQqRW2TPTuTmB8k1NKBohDufP5a5c7FP5uLfhR
         IKT3zqXfD4grAr679FZ3UEG/Z1aqbq1qla5ovXyrUQTV11vomoZbLauWmed9ZvVhrTMo
         4Chw==
X-Gm-Message-State: AC+VfDyoKX/f7e0uCOROzLothBuTui0WIStO59ULwVCyQ87qJDAVitzF
        7KDA+ui6fjR9fvd2KxViYcPuoiR+G53V6EPfU73f1P1MFgNBDA==
X-Google-Smtp-Source: ACHHUZ47m4A2WE1QGCStl+Gnk/g1mExT8q22HNjZKurdibTtAwIQ9RdFVYZAqjZMHo7r/5VyjZrqMMAEwTOWFXuVdFk=
X-Received: by 2002:a17:903:1390:b0:1b0:2bc1:94bc with SMTP id
 jx16-20020a170903139000b001b02bc194bcmr1953058plb.65.1686410730422; Sat, 10
 Jun 2023 08:25:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:902:ef46:b0:1b3:9bac:79c0 with HTTP; Sat, 10 Jun 2023
 08:25:30 -0700 (PDT)
Reply-To: markusblocher3@gmail.com
From:   Markus Christoph Bloche <franciscankiruka806@gmail.com>
Date:   Sat, 10 Jun 2023 16:25:30 +0100
Message-ID: <CAESW4wAOnPykBFh20KhNf1CUKv7N9ZTzwSL5YDuAGh9Gkp39Uw@mail.gmail.com>
Subject: =?UTF-8?Q?SPENDE_IN_H=C3=96HE_VON_1=2E000=2E000=2C00_EURO_AN_SIE_UND_IHR?=
        =?UTF-8?Q?E_FAMILIE?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

 ich bin Markus Christoph Bloche,
Vorstandsvorsitzender/CEO/Gesch=C3=A4ftsf=C3=BChrer,
Dottikon ES Holding AG. Ein Schweizer Gesch=C3=A4ftsmann, Investor und
Pr=C3=A4sident/CEO/Gesch=C3=A4ftsf=C3=BChrer, Dottikon ES Holding AG. Ich b=
in dabei
Das Ruder von 9 Unternehmen, deren Vorsitzender ich bin
Evide AG, Chairman, Chief Executive Officer und MD bei Dottikon Es
Holding AG, Pr=C3=A4sident und Chief Executive Officer von Dottikon Exclusi=
ve
Synthesis AG, Hairman f=C3=BCr Frugan Holding AG,
Vorstandsvorsitzender der agrocult AG und Vorstandsvorsitzender der
Cultivport AG (beide sind
Tochtergesellschaften der Frugan Holding AG) und Pr=C3=A4sident der Evolma
Holding AG.
Ich habe promoviert und mache derzeit einen Bachelor-Abschluss
von der Eidgen=C3=B6ssischen Technischen Hochschule. Ich habe beschlossen, =
aufzugeben
Jedes Jahr spende ich 25 Prozent meines Privatverm=C3=B6gens f=C3=BCr wohlt=
=C3=A4tige
Zwecke und an die Armen
seit dem Ausbruch der globalen Pandemie, die viele zu Verlusten gef=C3=BChr=
t hat
ihren Job und viele L=C3=A4nder versuchen immer noch, sich zu erholen. Ich
und meine Familie
Ich habe zugestimmt, 25 % meines Privatverm=C3=B6gens an Einzelpersonen aus=
zugeben
Jahr 2023 aus dem Gewinn meines Unternehmens, um zur Reduzierung des
Hochs beizutragen
Armutsquote, die durch diese globale Pandemie und die anhaltende verursacht=
 wird
Krieg zwischen Russland und der Ukraine, der viele L=C3=A4nder betroffen
hat. Also habe ich
beschlossen, 1.000.000,00 Euro an Sie zu spenden. Kontaktieren Sie
mich noch heute auf meinem
Pers=C3=B6nliche E-Mail: markusblocher3@gmail.com. mit Ihrem
Spendencode: EGIP/EWU2023/28392.
Sie k=C3=B6nnen auch =C3=BCber den folgenden Link mehr =C3=BCber mich lesen=
:
https://en.wikipedia.org/wiki/Markus_Blocher.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dies ist noch einmal Ihr Spendencode: EGIP/EWU2023/28392.
Bitte antworten Sie mit dem SPENDENCODE auf meine pers=C3=B6nliche E-Mail:
markusblocher3@gmail.com.
  Wir hoffen, Sie und Ihre Familie mit dieser Spende gl=C3=BCcklich zu mach=
en.
Um zu best=C3=A4tigen und sicherzustellen, dass dies 100 % legitim und echt
ist. Besuchen Sie mich bitte
Verifizierte Google-Seite zur Best=C3=A4tigung und um mehr =C3=BCber mich z=
u erfahren:
https://www.bloomberg.com/profile/person/6131291?leadSource=3Duverify%20wal=
l,
Mit freundlichen Gr=C3=BC=C3=9Fen.
Markus Christoph Blocher, Pr=C3=A4sident/CEO/Gesch=C3=A4ftsf=C3=BChrer, Dot=
tikon ES
Holding AG.
