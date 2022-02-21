Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFAF54BEAC3
	for <lists+kernel-janitors@lfdr.de>; Mon, 21 Feb 2022 20:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbiBUSUp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 21 Feb 2022 13:20:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbiBUSSk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Feb 2022 13:18:40 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DBAE017
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Feb 2022 10:09:54 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id q11so3724344pln.11
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Feb 2022 10:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ywbcNslcYAqkFxWzhZ8U1LD4SSP8DZ3rpRBf7rQmclU=;
        b=Y0lvOdC19DZYtEccu6OwoeSeiG5KGD258dHHSTL6zMu9rgxR8/VkwTZ62qjhGCttWf
         Nub3/9nvv8Z71OaTv4+/2vx2X/YkQ3ckpoyriGasS9xTb32VeIn7xNjmcr67pUzsFCfA
         TlIBENmkF8pAryMp2bmTOdfi57aNm1Vf5kxviz2IS2vzMqwqjFJB/K2Y0bkLb14k7Lca
         uX+TZSg99UaXSvkjgLHDUK2KoJaCPs1OjvJbQ08dT0fDiKznCuYBhVORiYnam3GIDqsY
         lVIrmfjv/C0ut9l5dbsnYQ9QqzCjdTdso1kzNtK8ht0cpCi0uayp6cVvznpsii/oAdaR
         W+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ywbcNslcYAqkFxWzhZ8U1LD4SSP8DZ3rpRBf7rQmclU=;
        b=MFYYAAtzGhh787j+ZstRmcj3bil6M/dBW3NPOdlFwkUZh73Fsh7GOsoopxDPKD8az1
         dL4wCW364R0kKvZMo27ZLsWAb2iTQENnYNAwpzTcsKtTxXchq1qWuWlceXT3NlvM4qP4
         xs/ME5aGbtQJLZbLTjrCyofr5ECtAf90+hpr/2d751RnnZJv+HHm3G0oyJwrewNRTvef
         ecJ3jiLlU471ib6IUqNp5yDdNBMrYL0vj4+j5YzF+99Q2MOnkZYlryr7GAPNGdSXrGuN
         8pN23W8IeRNlDDOhhG6wA1svxU48R3WLRLcWNwFpbeiFmk6FvuvhifAdvCVl/WhHw0FY
         rRFg==
X-Gm-Message-State: AOAM531lgHvIvX3QX+8WAirB4Ogri7a0zGa59xl6GK9nVBTIFh80X3IF
        Gs4BsY9fzPgZESSZDe9ptilqHWjLjT7umBRyLg==
X-Google-Smtp-Source: ABdhPJycJ4mbbf3nte518sY1SxXTORgbnV31789FwfNyod6+m8+xL0twMwHCZK+zpRqTgpWBDOeWpgEU2bPTSK/kYwY=
X-Received: by 2002:a17:902:dacf:b0:14d:682a:160c with SMTP id
 q15-20020a170902dacf00b0014d682a160cmr19805637plx.145.1645466993701; Mon, 21
 Feb 2022 10:09:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:90b:350c:0:0:0:0 with HTTP; Mon, 21 Feb 2022 10:09:53
 -0800 (PST)
From:   Martinient CLAUDE <gilba2002@gmail.com>
Date:   Mon, 21 Feb 2022 19:09:53 +0100
Message-ID: <CALGXLObZ-BnhpuzNrWNPChkO_OPzTjS7oOwFecxk8mRcCfPCCA@mail.gmail.com>
Subject: Re: SHARING Mme ROY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.1 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:636 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gilba2002[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gilba2002[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.8 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  3.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

     My name is Mr Claude MARTINIENT, I am married to Mrs Claudia ROY
of Canadian nationality, and she was a consulting engineer in the
Republic of Benin for nine (9) years and died subsequently of a
traffic accident with our daughter H=C3=A9l=C3=A8ne of 04 year.
    I plan to bequeath part of my fortune which was bequeathed to me
by my deceased wife then that after years of worries I had indulged in
substances, not recommended and currently hospitalized in Great
Britain I suffer from a brain tumor and after several health
examinations my doctor revealed to me that I would not survive any
longer and it is my assistant Mr. Fran=C3=A7ois ADAM who helps me to write
and read.
However, due to my current state of health, I have decided to divide
all my property with that of my late wife into three parts:
    - a Part for charities: help for orphans, the homeless, etc. .....
    - A part for my religious community: my church.
    - a part for an unknown natural and legal person living somewhere
in the world whose origins I do not know, hence the fear of course of
falling on a person of good character who can use this money wisely
and that is one of the reasons why I preferred to do my research
directly on Google .... Hence the chance of getting in touch with a
random person.

You run no risk by accepting this donation from me because the funds
are deposited in a banking establishment with all the supporting
documents thanks to my lawyer.
However, I ask you to contact my lawyer at his address for further
Email: offshorefiduciarysA@gmail.com
Greetings

              Mr Claude MARTINIENT
