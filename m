Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE79564861
	for <lists+kernel-janitors@lfdr.de>; Sun,  3 Jul 2022 17:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbiGCPXs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 3 Jul 2022 11:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiGCPXr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 3 Jul 2022 11:23:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE8662D0
        for <kernel-janitors@vger.kernel.org>; Sun,  3 Jul 2022 08:23:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t19so11120831lfl.5
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Jul 2022 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=mukokvmdIYpshRi5srsoqv5gXvSOoxDOJ4frz1F7EBQzpUjeBseIHiMGHty8LXGnOH
         /jYvbKXT5CnJTtMbEDPgS2L/e/r2F9ATpW8Xh6Mk4NzLkoYhvEf8I32owGuFsPJDWFNQ
         8O0i0jlT9OagmEdeDszyJVUWeAkP+KNW3XJ2z7oSLmDYUeOMM5EfkfuzfWJ5UGUcJul4
         euZh5l3Z6bea3dPEMPGLtFVe7x05fB13Z2y5r8DOGf6YocVw0gEqrzpbxHMTcKjb1+IW
         MAnDWnvB5oBRF2O4MY2yUWzgKrzXnluGpxoHjIfIXN1pU5+/ir9gekUkgjpJXYWvRfUX
         vX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=RQ1zpGOSzjLzAAVpH589nY3uSHIBplwT9m/TIKtk930uB8PMGRG2/hD1ZDhKufmxrJ
         7W/zu4j0whTGcQNPQ1mvHNpnk4JoyokmNZtWV8w8PEPgQ97zkNldKcpio32hkfTXNR1V
         S2iUVhU2OX+7YU6JyFIw+svInmMptOJPhd+3huclUNynMiwUqX8pNQ/0VlmPZ6qoqbXu
         IAp0XzBy8TQbr6YeolduhfiE3bD8lw1L/ZSqFLtfuMdrLwd6zU/9cehne8PvgbzZqnu1
         gyE6CDkeZcw+m5etKkj01i5yIWvfTBDrIx6IrV//61quGJPXOYOTs75qgd1SMWk957Bf
         YoHw==
X-Gm-Message-State: AJIora8V77EdUJTMTdmlSUDtr+x7uQ1Rg/NEQy9aujBgldpbbA0zZvD6
        rx6WM677gojJRAD0vkv0+q66TWqpgxZAajiWYCY=
X-Google-Smtp-Source: AGRyM1utCJB7ZoDJQ64n+8J/Au73Jkb/q7Pco8JII0n00n6o16sngOZcotTlV4ykgPN7W3E2oeljDQ8EjiP9Y0LIcAU=
X-Received: by 2002:a05:6512:32c2:b0:47f:86b2:a657 with SMTP id
 f2-20020a05651232c200b0047f86b2a657mr16343161lfg.672.1656861823808; Sun, 03
 Jul 2022 08:23:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:1343:b0:1d5:b05e:ef1d with HTTP; Sun, 3 Jul 2022
 08:23:43 -0700 (PDT)
Reply-To: jam6es@yahoo.com
From:   qu <quaaa6@gmail.com>
Date:   Sun, 3 Jul 2022 08:23:43 -0700
Message-ID: <CAE+6RbcmZ9Ginc9XTWA+4YYZkWhC839OF87CX_Yj3w0JX3WBPA@mail.gmail.com>
Subject: =?UTF-8?Q?=C2=BFEst=C3=A1s_ah=C3=AD_para_hablar_conmigo_para_obtener_m=C3=A1s_?=
        =?UTF-8?Q?informaci=C3=B3n_sobre_la_transferencia=2C_por_favor=3F?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


