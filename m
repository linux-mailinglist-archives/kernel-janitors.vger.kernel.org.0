Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8B061DA01
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Nov 2022 13:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiKEMi5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 5 Nov 2022 08:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiKEMix (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Nov 2022 08:38:53 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6CF165A3
        for <kernel-janitors@vger.kernel.org>; Sat,  5 Nov 2022 05:38:51 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u6so7177818plq.12
        for <kernel-janitors@vger.kernel.org>; Sat, 05 Nov 2022 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=ZV2TcGDoVIbq1v5Mx1L1rUnUNhUQbze72wuOuh+wa69lbnQcoFfWFbkhfb7gZAMr2W
         ByUyHxmNJ+EgAzfkEbgt2p4DOLQzRBGtUuogzeUQqAM9RqI4JEUvU9sSGNzhT5Afew3Q
         d4OngWwLOFgISkd6x5vooHRKK9Az4aJczFzroYPLH7Dt+vGVCRowVZ5uZAV52Cgy+A2F
         D3j8/lIwVLi3bxecncjVVFxwzOJ1xg3DK6jhFVflm1wFbGzu0e/ikP7247t4mqip1Jkf
         Njk6WVMatLJ/Jf10pKJi5H9vXXx7mlCmIY7ZKhF8dEeWXppRLVuVdsqFZujt6LQJeXIn
         5+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=Lyp4qX9jVsb3h1tZ/FUDcR9ds1QT0wm28avmxba9xmMKrD/tlXoPazymubXXBLQgSX
         eqvxzvTYGlQu6Ym1gTn25eeWWnj/M5uZjuR9MkvGn/THK/pCvdPILpT9eDlXoYSXM0mG
         5X3oofGhdv2H9OivZhstyqHYAaBYsFHvTOCaI0RPn1qHhBsDIEAZLbAzmgruPw3UTXJO
         Xiabb0UVA0Mfp+Hh78nDP4tKnH31vTBMLIBYEENKG1Nti5EyivbvcDKXy/cJpIgBxkLo
         eKFi1t4SKihDhTwjkAbxmPNMm5VZz6oKRHt+wDNiMckogWvniZCAqLjvqy4pID37c1Qg
         RjUw==
X-Gm-Message-State: ACrzQf2QDHnii5GB2w4Qcs464ey7zugW06OQCUpn7GSiIbS1rgqphjXQ
        0nC/bsf0VOra/bUUqpRe0/F+YgSxUqlCzjWcqwU=
X-Google-Smtp-Source: AMsMyM4kXiQfEHD7xTnbuAFjuPJHm46vGSi/KRiuWhPRjTwiHbLpMEWmL5EuXvVkMsm5T5CXDTvs4U+iY+YcWl58B1s=
X-Received: by 2002:a17:90b:4ac3:b0:213:3918:f276 with SMTP id
 mh3-20020a17090b4ac300b002133918f276mr57019553pjb.19.1667651930232; Sat, 05
 Nov 2022 05:38:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:2e91:b0:83:922d:c616 with HTTP; Sat, 5 Nov 2022
 05:38:49 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <wamathaibenard@gmail.com>
Date:   Sat, 5 Nov 2022 15:38:49 +0300
Message-ID: <CAN7bvZJ4rp_NOu942tGepXyrWhRuYBiZxGOwGAGice4B=GS3aA@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
