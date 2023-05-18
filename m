Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED997078B2
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 May 2023 05:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjERD7R (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 17 May 2023 23:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjERD7Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 May 2023 23:59:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE92830E9
        for <kernel-janitors@vger.kernel.org>; Wed, 17 May 2023 20:59:14 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac8d9399d5so16687061fa.1
        for <kernel-janitors@vger.kernel.org>; Wed, 17 May 2023 20:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684382353; x=1686974353;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ICkI9RxfU9CXJISMRmfR9rrQObQEA6ISlslzsiv8Is=;
        b=h8B+WlW/rQrgS2QLogtDA9+rbb5nvhOQ6GRx+uYxBouQL3gAMp1/SGKZa3PJYAul/2
         YWrVWeWAz9xrFTi0Jdt2Q/0pAqOMXgCVeN6W2yEyeYpMnSNDdQIrZkC765rhu4a3CQym
         TX14m3s+59Z/IWJm8CbChv7tS3xVqTllWU8HomdVGWv7KUoGSJFvLCPyyW4WWMSHt0a9
         +ZzMd8TMyHhNd8h0Czb3bWsoCYHdSnqoihP/grlj9PXu9ZHMBNBgCy8arAWEVN9+g76I
         Arf5DYMed9kQ1AiNmoX+9CrfubQgpOgJYjmbmLn/FW6tCpKzihSpEV0kfJnCdN7TjFYo
         V5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684382353; x=1686974353;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ICkI9RxfU9CXJISMRmfR9rrQObQEA6ISlslzsiv8Is=;
        b=YZ2pj+8feCMMcNbP46gXdDmCO5r2s+SnT4Qcrt4TRUDfP6SmscTfrZju1hNnPXgwm4
         lEQbFuZSZKGOtkie7brNsiAYC796mfkaSfEtmxhjI19uh54N1H841FUZVwe5XVMZ0lfm
         1vJNpEDSuSilHeuofLvsVBrVimFadmUpr2y8j/Gqnk7sxoXtEpmiQNLqIH5qyJj3yAF/
         yNS2H8FcFLKrqOxT14R0GUuJAy6+n/yDOGKWZNV1DvJTr6Db2FR7pxg/jryAP5eXAuMX
         WX5hEQGeOXOjxzMGBq9RDrTIO3pmS+iEU240RSH2nQgMfQZ6aUxWJe1isRX01Z269aia
         3emg==
X-Gm-Message-State: AC+VfDyTIqeDrHIzV2ehB2bbvn0b8mEtmyFiC3BXkrdiAWjDkMmpkwRy
        AjfN0JTv3NPEzgPpMMseh4IvyZU39H3u6iUPph8=
X-Google-Smtp-Source: ACHHUZ5QTkBEJrxzqOafhSWPVd9onmmvuwQMPGsGFUB4fJCQtz/L3zSnV5iURbU2Z45aQsIQl/qQM6wUp2WB159ibk8=
X-Received: by 2002:a2e:854a:0:b0:2ad:d6cd:efdd with SMTP id
 u10-20020a2e854a000000b002add6cdefddmr6465421ljj.32.1684382352498; Wed, 17
 May 2023 20:59:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:63d4:0:b0:22f:3a39:53c4 with HTTP; Wed, 17 May 2023
 20:59:11 -0700 (PDT)
Reply-To: officialeuromillions@gmail.com
From:   Euro Millions <pete.wetzlinger@gmail.com>
Date:   Thu, 18 May 2023 04:59:11 +0100
Message-ID: <CAAik_9SwHinrNOeuESs18AkLFbb-Te1tOR6OmUP8=UPPLLQWFA@mail.gmail.com>
Subject: Aw
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Herzlichen Gl=C3=BCckwunsch, Sie haben am 16.=C2=A0May,=C2=A02023 =E2=82=AC=
650.000,00 bei den
monatlichen Euro Millions/Google Promo-Gewinnspielen gewonnen.

Bitte geben Sie die folgenden Informationen ein, damit Ihr
Gewinnbetrag an Sie =C3=BCberwiesen werden kann.
1.) Vollst=C3=A4ndiger Name:
2.) Telefon- und Mobilfunknummern:
3.) Postanschrift:
4.) Beruf:
5.) Geburtsdatum:
6.) Geschlecht:


Herr Anthony Deiderich
Online-Koordinator
