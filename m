Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51BFF6FDFB7
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 May 2023 16:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbjEJONf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 May 2023 10:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237248AbjEJONd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 May 2023 10:13:33 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9009410E5
        for <kernel-janitors@vger.kernel.org>; Wed, 10 May 2023 07:13:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ac80ed7f26so79050491fa.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 May 2023 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683728011; x=1686320011;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=ifKpXvo9YdF/uAc2MfMApCkOiv6Yo9y70lFr/yNefVlaeEBdpJuyCkgZiJ7zqXZ2F3
         nVlw+gJvDV82jeSB3MuLfom3xSJ8VSu7VgcgvH8pnL7i6jbi84GJmoYvG6r+5pQw9lzQ
         BBnKtH1y9qjyLHUU4+1bAF46akmda1mPjoPvyJuR/bUKVsN5WLEnpgKm6mF/RkltJm1g
         UAtgrS2rcXok6rn/aEWK8qOi1Hh7tumJqJlb7LP5dSlxylURuJ0OPL5job/UE6aviRhr
         lLrmPlEq8ncFpm6QwL4QzUzlngY8/ORVHxppR7WpsSa0DYdofbTNjt6sUzBGn8eWigJ6
         VR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728011; x=1686320011;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=ZAR6VMy9Y8fmbjRqDDRDlUKVOtEcy0zpkXq3PRXLeE+2qBPYdOCrtpVkzPIlprvxCU
         eCI2Hi3wnb2JebbfT13OeczJjUm0cBIYjo1y8db0CzyVhXCnH3iV9+XPRNMjGeWCCI+x
         Nlj6xUZ4E39mnZupgf5dz8oUISw7fX8Z08TuTbuxkDa27PfXR8FM+a9x99epRu8XZ1Ha
         DOhFEzsMnC4Hij5ZxZAkX8oclbVXaulEjYHXL4u7RXquZ297gw7A9j86R6ddK+pFb6/g
         9HQp9QUlkSV4QW9GSCgrpBj8UQhzN9pepipPJv9xPOO5wDsZMKiWMj7oi62E/c3VJZhc
         tqGg==
X-Gm-Message-State: AC+VfDw8e7veQWkfg9c7nx4fHD0gKO/87EEe80HHaYTQwkOm30rv5bE0
        0/iFINckpNN1HmYuxtc8MxCA8GdkfGMzPGeBoL0=
X-Google-Smtp-Source: ACHHUZ7r3xWTxFdleElTZorFlj321f0KGUBq6Fur5f4kfK/+oTLlHWwa9uvrfVHb0v3il1K7LCNLseEXK1Jw/uI1iPs=
X-Received: by 2002:a2e:8618:0:b0:2ad:9acb:484e with SMTP id
 a24-20020a2e8618000000b002ad9acb484emr2138740lji.49.1683728010565; Wed, 10
 May 2023 07:13:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98cf:0:b0:2ac:a011:b92d with HTTP; Wed, 10 May 2023
 07:13:29 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <info.ninacoulibaly11@gmail.com>
Date:   Wed, 10 May 2023 07:13:29 -0700
Message-ID: <CAKjR=UT6eb+AqG3pseemXDHcUOrAf9QavMGPaQnQo3f1CUjQiA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
