Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF4E74C136
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 Jul 2023 08:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbjGIGL6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 9 Jul 2023 02:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbjGIGL5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jul 2023 02:11:57 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFD6D2
        for <kernel-janitors@vger.kernel.org>; Sat,  8 Jul 2023 23:11:53 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a1ebb79579so2705517b6e.3
        for <kernel-janitors@vger.kernel.org>; Sat, 08 Jul 2023 23:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688883112; x=1691475112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=TNlM2c57nVKBvWhH0bKyXwn9YhO+z9E1gQM1L3M4xo8Xo6XiMGGicEg+f+HyBV55im
         rpaLCAHmxeG5dnYG74RvxcgLKupPFXs/PZ48PLWhJ0qfRkDJCZtfa3SF5ScWBM+/wj5o
         0wEWjEyPI8GaBbxEdKmIjBEkO1EfB+P4KSutngDYH0WkA8YcH9DyigumrHfTtfyeeGD3
         eWK+h7EAuYhSmy9gOwtikolnorMfeZQQmNx9E6rGKeQRyM1y/kqq0YRVRpR8fsLQPoYy
         fx89rQ1tXJkxrhTQ15k+4bhzL4loWzaVSpkC3kmYeypeo76wMI9dumJTUPczpMy7TISL
         5f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688883112; x=1691475112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=Q9HpwfO4NhIZ5YGj00t2xF4yIrBdJfnGdz45gjkPnAeWaHEJ/3EKlbjJSSiPdgDfnP
         Cf/EvB/3ucLfXXXmxjEJ7Aj5H2y9EiMiGm/3tfmBHs7vGoHDU9iKlK6yLrU5hQ8oYE+u
         zP9zRStw4RUjKWxFOwQ/p6bpX21Q1N8yRwBJDP+0pUm9AukUt2QtKt85Hf1L3dZpZqQo
         XndvIHmIZHTnqT8Hxti/DKtv4bjWvKQaUU5vtaVBD3GFD0Lcs0nUC3qCg9OsoME3Pinx
         3RiDFscyR/j6d0xl8i4reYWxkee5S3RSC3gNgr56LwdwyhI+Qlo5Vq6yZKjRgm78HBnH
         Vrfw==
X-Gm-Message-State: ABy/qLbsV7tDJ+WZhZSrmJJnIkghBeirU9A3r1KnAGQeAxtFsn4qj3H5
        BqpzyNazXyqriWGG3139h9rRi04okDJCaoVX/jk=
X-Google-Smtp-Source: APBJJlGkUv4ZYdK3ASzVrnEJ2tc+hrX/uAnaZUPyCNMAPG3Y24FEs2gqYvCv2PY3A6Y8m71qwiBVroUVnNHEr8G2y0A=
X-Received: by 2002:a05:6808:d52:b0:3a3:fd7d:1e33 with SMTP id
 w18-20020a0568080d5200b003a3fd7d1e33mr1450827oik.53.1688883112657; Sat, 08
 Jul 2023 23:11:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:18b:b0:122:db4b:7f79 with HTTP; Sat, 8 Jul 2023
 23:11:52 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly.info@gmail.com>
Date:   Sun, 9 Jul 2023 06:11:52 +0000
Message-ID: <CABAHEt6nU3+uQdgeE8c2f_MPmBCxVj5+MT45r2KGtbAvNa42TA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dear,

I am interested to invest with you in your  country with total trust
and I hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that I can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
