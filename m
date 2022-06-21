Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF487552EBD
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jun 2022 11:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348992AbiFUJj2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Jun 2022 05:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349192AbiFUJjY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Jun 2022 05:39:24 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22670275D1
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jun 2022 02:39:24 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p69so11812930ybc.5
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jun 2022 02:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=h/jNG5hg7pw3qbZJsJ7/O7yTdyMF9oaAqqeSAK5vwrGEejYUjatvjXYi9CfRCdUN7+
         KjP/WCFvT8I92O2z5wgpsaQ0jcsEwpBxXigAJAQS5SK+C8ThiuMQNrPDzM35CCqMOJ+w
         GBkxduRioS7i6nHcyXthl3mZqwQerBFDpOn3TG72mc+LF3FY1dZ9YhOl0p4qsvUFchha
         x6XZLIZ+Gczns9m2WYpDTzlG+cUGlJgXbqpd7Xq15GQCjfbyAKkYsmppFgoRrbgJW3EH
         rErljVN0YQSRCbbwSNvPtoEWqk2L3NjeKPO58uL1LcwSvdWcUGuEt0lB/g4kmrSwWafe
         yIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=TYAPf3dRuIYtRB3RtGUd2/usOk7VZVh7TOmC2MTxrolIgPdDXCDvqa6oAeZ17bMu7Y
         nLVKU39Yqwc+2NSZJv9ngaxcDWaY5g5NDfPS5+qQp6k4VOKZKO8tPz8ZPp+vv4OZHQCF
         o6NjETCOo94/TWLFgVuyvalcrpcXQ6EkqksUCp5ITQ2OUGtLHhHjbxBgwGj53qoef2TI
         UWQ7eJOrWSrk3INiH4wSswGzHW6KpCCP2IoXNXczfpAhUadsY+M01qjZr8S/+G8Q1NT+
         qFyytqujlYrm//38m4JrlTD6OKjn7zWb8gCUOLiegTel5uMfJ/ct8lgp5kXbpolkdhaL
         YcOg==
X-Gm-Message-State: AJIora8OsLibFWEfyvf/+776ddrM5nZsDawpNQ9+nd43FTnMKLdsjQQT
        DsS0D2eMGiE5ZB8HpzlUEubgQennpRpmxMWT3nA=
X-Google-Smtp-Source: AGRyM1sanxJnrjzNvMQMrOlD8K2c656wwbNTXk8tdAjEGDFs09CqIR+mQnkI3ogcblPWOzX1AqvlQqvw7FWP0msTnxw=
X-Received: by 2002:a05:6902:1205:b0:669:22dc:e8ad with SMTP id
 s5-20020a056902120500b0066922dce8admr8595434ybu.371.1655804362970; Tue, 21
 Jun 2022 02:39:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:e10a:b0:2d9:e631:94d0 with HTTP; Tue, 21 Jun 2022
 02:39:22 -0700 (PDT)
Reply-To: dimitryedik@gmail.com
From:   Dimitry Edik <lsbthdwrds@gmail.com>
Date:   Tue, 21 Jun 2022 02:39:22 -0700
Message-ID: <CAGrL05YaSev49ZJ7fa3MrewJ+V8jgEUTAvWTZ-J7LGC2S9d28w@mail.gmail.com>
Subject: Dear Partner,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lsbthdwrds[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dear,

My Name is Dimitry Edik from Russia A special assistance to my Russia
boss who deals in oil import and export He was killed by the Ukraine
soldiers at the border side. He supplied
oil to the Philippines company and he was paid over 90 per cent of the
transaction and the remaining $18.6 Million dollars have been paid into a
Taiwan bank in the Philippines..i want a partner that will assist me
with the claims. Is a (DEAL ) 40% for you and 60% for me
I have all information for the claims.
Kindly read and reply to me back is 100 per cent risk-free

Yours Sincerely
Dimitry Edik
