Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4882D5789DC
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Jul 2022 20:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiGRSzS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Jul 2022 14:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGRSzR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Jul 2022 14:55:17 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDC62F038
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 11:55:16 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-10cf9f5b500so25065272fac.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=jKPGJydhTUOyZkqTwIzXkKPrbHwKFTeIQ9mP2UjeRWeOc1u9pwe8t/0wfH08ImITWd
         85au7tUFMUnG0bqn/ZrRYeol4R2YfRMb3YkMTKmMvcUH0PXpuw3BA1XdxKbfOdtKE4QO
         g77PJdeyKiISX89wF8Hmyv6jIfhfPru6HE9APMGaWFYb7tdZGNdc7cLTDG3goqy+ItKe
         DiNPHqdRNZjOVj/mqwcYQexGsEW/0ZEWy4SCi7LQOaLX9qTqqccKCIHrBpgK4oIm6WCJ
         o3OhMJfNCb7qw94TfCVRFkOa2qe6q6LzCr44bVHeKJAYfGYPaFwrl2eVXXE8UNQL6ep/
         Oohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=WoMZD30PLTVB0VsTDsJM6NDElTBfb1RTYk4S8FERzKYVFO3J1mko/dKkFZ0cmuPvCQ
         OA79X//wllDTHicg2K7g2CyJwWpOwItI2bC6JneesdHWsy/UbXZTLMnh2YZVvckfRHna
         0iytSDOnpjUiF5pewMLhnpoD85fTuXlFyTeANeLrfGXIrdMGe4smpKp+J6IMp5Qft2w4
         Efjvpig1RDpIUq7IoLUw8B7Mo5i9DQQ5CUOhLvIr2P/hYXL1z81wrHDTnvdB1Rtw3bcs
         eqAuINhbTP9qRjGFlZmfIUiQqwgO+1l6Hgo8S2i+umgBkWdl5CWmcZgyuNmhgG5Sjp0X
         fmIw==
X-Gm-Message-State: AJIora+Irjjx5mxGg7vELF+LbkcBk/+9C8Dvs1T3K1DsKa8X4klpVKLK
        nTmkzFdfV+oSqNqJI+jHWnGyStdD2V7jACVQviovR+7fx+8=
X-Google-Smtp-Source: AGRyM1vWOSU5aL1EJHPCeeo23sW5XVJ5aUKBjVcBmcuswqCzn+sbfNfdhd8MxzsX9GP3mjK+A7Ahj+PVJGiPm7Lqx84=
X-Received: by 2002:a54:4683:0:b0:33a:5a4c:ace with SMTP id
 k3-20020a544683000000b0033a5a4c0acemr6957496oic.256.1658170504815; Mon, 18
 Jul 2022 11:55:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6850:b093:b0:314:5f48:8afc with HTTP; Mon, 18 Jul 2022
 11:55:03 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <gonwse11@gmail.com>
Date:   Mon, 18 Jul 2022 10:55:03 -0800
Message-ID: <CALtkzuuCfWb0wSGh=3YjEs5bFkr_rGmeULBR_pJfE7wZjv++1Q@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gonwse11[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gonwse11[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
