Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A66974D8CE
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jul 2023 16:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbjGJOSl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Jul 2023 10:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbjGJOSi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 10:18:38 -0400
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4DADF
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 07:18:35 -0700 (PDT)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-576a9507a9bso82884047b3.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688998714; x=1691590714;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=BO/G3AnTcxIPSoCewIc4B0xqBuB+MlI5uUEnTPaAlr8vEfJzOXUA3EmbFNtgN/WS2/
         Mtwq8VVwAZjy7lgGVsIJt6cTkwZCfEIoFhwKlWBDUFmWgSNrroAEGemVT8tUOjjXL4LY
         hkqwhzof96ZJbeAERVJDek3wNC5LzHF3xLNlg+bZvjBtrqSfqO/wqwHoBTZGpzjx8Tjh
         PNctBUcNdqoFBHvmrAXsH/BzNC8jCwAo7usx4zVsW+bNEUWyJ5SKfTdlcbB0p8AntGOA
         iAyyE7QDpiDpXeWAmxXdQ+m6AvH+H+qinxVm+442sIQ9IkjyiVegBJ48eb+yL8sIAFsn
         AS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688998715; x=1691590715;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=F0Lsv53j5aUhJLFA/nidg++Oo0SPt1zzwq7mAnEdc6scNDmnbOj1p2cmwhDyMPu/b4
         qQqTJvni+zA1eLd8pYhQeQwxM8DPp8Ny+3iMmXjCOYvWy/Ft5zFIzipHa6tEcLWDtMDY
         2t2sRxd6SyjRqL+//Ni3qxeZA3BwQc1LdldVQEcJ2PBpTtZ7wlo2DhAQllPvTt/Ut4WL
         c5c5VFFYMFTUHe8pfgtElJI1QV3HVdQrvapdIsugXucMdvVmDYnZfGWq+ce+GsVQ5fEY
         //B8NciolPA5YG/Uo+REqyABNMbWnfrUu1mcN1K9LzfSEno1QjGJuFUrnaLn0L6VV9F6
         pFqg==
X-Gm-Message-State: ABy/qLZcxuz7PWN64NcyLJNJSyXZLI0Ctd0TNs44jRZaH0/i0gt0ZRvU
        7Xbjtoq+k/EBQdFpUfN3jZaulwb2CVP4YW6D6w4=
X-Google-Smtp-Source: APBJJlFafpOuH2q1nFse3mYzYb8jGvr1wiKIazFO4ZqiAUc0f97ZgGAkmZte/BBOnzgw8+BPm78I/zJx87xavc/HhOI=
X-Received: by 2002:a0d:cc8d:0:b0:56c:e5a3:3e09 with SMTP id
 o135-20020a0dcc8d000000b0056ce5a33e09mr12568730ywd.15.1688998714560; Mon, 10
 Jul 2023 07:18:34 -0700 (PDT)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: mrseedwards7@gmail.com
Received: by 2002:a05:7108:2b54:b0:31f:8363:fa4a with HTTP; Mon, 10 Jul 2023
 07:18:34 -0700 (PDT)
From:   "Mr. Sal Kavar" <salkavar2@gmail.com>
Date:   Mon, 10 Jul 2023 07:18:34 -0700
X-Google-Sender-Auth: CBK6z85jRvyFsb4sBfGyzHsuZdA
Message-ID: <CA+-WbAU63yRSbaHTWaUJPuSSG9hQqe5Si_rhFP9ycLbtPAvmiA@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:1144 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrseedwards7[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [salkavar2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrseedwards7[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.6 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  1.7 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I assume you and your family are in good health.

Overdue and unclaimed sum of $15.5m, (Fifteen Million Five Hundred
Thousand Dollars Only) when the account holder suddenly passed on, he
left no beneficiary who would be entitled to the receipt of this fund.
For this reason, I have found it expedient to transfer this fund to a
trustworthy individual with capacity to act as foreign business
partner.

You will take 45% 10% will be shared to Charity in both countries and
45% will be for me.

Yours Faithful,
Mr.Sal Kavar.
