Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F24C24D7020
	for <lists+kernel-janitors@lfdr.de>; Sat, 12 Mar 2022 18:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiCLRco (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 12 Mar 2022 12:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCLRcn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 12 Mar 2022 12:32:43 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921616D18F
        for <kernel-janitors@vger.kernel.org>; Sat, 12 Mar 2022 09:31:36 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id i8so17564888wrr.8
        for <kernel-janitors@vger.kernel.org>; Sat, 12 Mar 2022 09:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=p4GORicRfKYMmuTaUvzvYC0X6pcYWYL8sK1k4bp9fMA=;
        b=YZAU44im/NZXAgq48JxioVPnsbhNh7JPJ85N998emO78NyWEGNwaCRauxynBFNdlFx
         GgeGquyJTCutkGy5/JkJ9M+Jl+yl8NeyCr+i1WsvNPh7Srxn4Jkbw2r94Ol3OAyOCvIH
         34OEcJfjR6TAoh+Cr8EyYWLtaxQRLsW3eqx/1I9CBio73TwwbU1Cr2XOHT7RLHl8Rj08
         /0M6Owc6D7GY9DVqj/WfFk+ZN3+51i1cdpAvehOFLpA8Dwcfc8ZjW5p2WXBTlGpygN12
         +8b9MkhRBGuQjxlSsRSa1H1hOZrbn1qhQeyN3r/dwMeLNS8/OUEpZVmTfBu5yEwf/CJS
         lyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=p4GORicRfKYMmuTaUvzvYC0X6pcYWYL8sK1k4bp9fMA=;
        b=qVLfTwVIaCDCEx+u8cNq4zqJJjp0EZvqqRoHzh90aDQmZwz4NTpV7zwWR0OU2FAokW
         /RaCxQKJEyovsdei6sf4H/biY09xyzQhW45TqOoXSyvB4u16NOlPnQ/YSBO3avISbf3g
         GcyeeSoKFO96hztEaMwld7gYLdDWHcai1dp6WMMCQMx5dbEbcnLXg2lpDXLrcg5AirC5
         kKsLxiAw61Ym7kv5cRTFHouS1DZ5DTMNSKqBg60k9E2B84K9P3502g7qfj3uaACTnvrD
         Jk8TM5Pnk1ghoZ4uCX2nI6wt1wpIdf31EuUxS5IlkRLsy/kx4Mv3XPCNoVbXLeSnwVdx
         2Wuw==
X-Gm-Message-State: AOAM533JXOrdj/OsIa2X9FOfersRNejEG0MHAv1VDDpY5Y+cINzQV1/8
        pdjtQXVS5U4EoroDs/LbSjA=
X-Google-Smtp-Source: ABdhPJyCoBd9ucgxS+ca+AyyasgCsajTU2ArqIG9w1D09FeiOcJcRc5lXTwblReQ+XJD91GDsRavmA==
X-Received: by 2002:a5d:64a2:0:b0:203:7b32:9b4 with SMTP id m2-20020a5d64a2000000b002037b3209b4mr10907308wrp.559.1647106295236;
        Sat, 12 Mar 2022 09:31:35 -0800 (PST)
Received: from DESKTOP-26CLNVD.localdomain ([197.210.71.145])
        by smtp.gmail.com with ESMTPSA id f2-20020a056000128200b001f1f39d05b0sm9255972wrx.100.2022.03.12.09.31.30
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Mar 2022 09:31:34 -0800 (PST)
Message-ID: <622cd8f6.1c69fb81.6a28a.592f@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <khadijatabdullahigaya@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler  <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <info@gmail.com>
Date:   Sat, 12 Mar 2022 09:31:25 -0800
Reply-To: mariaelisabethschaeffler88@gmail.com
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschieden, 1.500.=
000,00 Euro an Sie zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich f=FCr weitere Informationen.

Unter folgendem Link k=F6nnen Sie auch mehr =FCber mich lesen

https://www.forbes.com/profile/maria-elisabeth-schaeffler-thumann/#443b4a6e=
19c7

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email:mariaelisabethschaeffler88@gmail.com

