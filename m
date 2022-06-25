Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F0E55A79A
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Jun 2022 08:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiFYG74 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 25 Jun 2022 02:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiFYG7y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Jun 2022 02:59:54 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA413B003
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jun 2022 23:59:53 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g186so4364801pgc.1
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jun 2022 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=jE0JLsfEdPpE7rbsOBNLVDtif/ZpFdFdV55NgbKwOcE=;
        b=EMAu06pqjmNmWzAmYLZo1saWvrqlhvKGy8eV0YaTIi+OWmKodY7HqkTeAykgFdZWZJ
         SZLLsrwxf589KTpuvsvTy0NlfQm2tyfaFqdpbttaT1vELrp056Rc5CW3hfZcHgZMEMIQ
         a0PU/WfLb/HWbHVn7ZYHHqXNMyKiXLmXho+4wSfWEyI5X2bGg3T4Wo+9DjONyfPXJj8w
         AB+lGPIonFomvhsskI9GU8opGyIuiEHmxQ1BcIjiJRwPZ6o6XuawmLkZzj1DHRRsH7uS
         wKIoq2Up0dtnD6rQOEW+ARaf9BnHH2KqMR5CZso9mHuwCB4er8+3d98zdciyyJ6QoNvd
         Vgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=jE0JLsfEdPpE7rbsOBNLVDtif/ZpFdFdV55NgbKwOcE=;
        b=QxCNcSlgYc7agBvMchLgvQT0Af5aJhAFcZ3GjizGjycC33YtLV/AsBmhXE4RcCXUhP
         hH4mSdExPobfhs0wS73X6Bkr26penLWfKSaSlMkRKkIVbPTaG5YR444j1JAy1AHz3ZY2
         nVEjOWG0lZLRhQieJ1Oy+bgZEOPU/7CQi6BDO8+q5OFht5nT90O1FyURI3fxqzvYnR1r
         OObrgpQaPIOUtOj7KQGoePD7QxUecErY8gUDo65alY6ary4JLeKPlGWL3P3wxdA8bBNy
         1INJtvlBAauzK4gtprAi41nQMsx+ncIE7BqjUhY8gBdLPdt31FR0Xk7T8qxmCGKWP/lM
         eP3A==
X-Gm-Message-State: AJIora/IAaT0pxcTPYEKPJrcpW8kogVM0g7w1TPk3hnnKQdB8O0Y5aUR
        uZSlk/kXPHkCjS1ijUQh1/k8zKblVQtKoGmde2Y=
X-Google-Smtp-Source: AGRyM1v0v9tH2O5ThAVeFyzugxyX4HmhjZJlzxd2KSa6l19yM+dyFfoiF2ukyySIzp/042nHMg7q5Wq1Br5sKZD2poU=
X-Received: by 2002:a63:3713:0:b0:40c:b98c:5e4b with SMTP id
 e19-20020a633713000000b0040cb98c5e4bmr2478435pga.8.1656140392878; Fri, 24 Jun
 2022 23:59:52 -0700 (PDT)
MIME-Version: 1.0
Sender: natodtoday@gmail.com
Received: by 2002:a05:7022:2190:b0:41:e49a:3a35 with HTTP; Fri, 24 Jun 2022
 23:59:52 -0700 (PDT)
From:   "Mrs Yu. Ging Yunnan" <yunnanmrsyuging@gmail.com>
Date:   Sat, 25 Jun 2022 06:59:52 +0000
X-Google-Sender-Auth: GKdJ2xqsaUDJy8T71-OrWOjJmx8
Message-ID: <CANfVWTRnPnqSHnM0WOw7TWGzWEfTuVWTBO6qeuCD+XwnF5ShQg@mail.gmail.com>
Subject: hello dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        LOTS_OF_MONEY,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

hello dear
I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it because all vaccines has been given to me but to
no avian, am a China woman but I base here in France because am
married here and I have no child for my late husband and now am a
widow. My reason of communicating you is that i have $9.2million USD
which was deposited in BNP Paribas Bank here in France by my late
husband which  am the next of  kin to and I want you to stand as the
beneficiary for the claim now that am about to end my race according
to my doctor.I will want you to use the fund to build an orphanage
home in my name there in   country, please kindly reply to this
message urgently if willing to handle this project. God bless you and
i wait your swift response asap.
Yours fairly friend,
Mrs Yu. Ging Yunnan.
