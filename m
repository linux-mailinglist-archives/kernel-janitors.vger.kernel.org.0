Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4CD5B2EB7
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Sep 2022 08:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiIIGVb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Sep 2022 02:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiIIGV2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Sep 2022 02:21:28 -0400
Received: from mail-oa1-x44.google.com (mail-oa1-x44.google.com [IPv6:2001:4860:4864:20::44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10DB1098C8
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Sep 2022 23:21:27 -0700 (PDT)
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-1278624b7c4so1523516fac.5
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Sep 2022 23:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=ZwPxd8LtjEuPX3lP8M/ewsRzKiwOr4k1fCds3gC7Jk4=;
        b=XVs1INvHXkpPGUOwUrp6CpqpW/2cAOUyT9O4F/XAxsY7FCJig9tRd3OxIFv3pgOX+6
         sQk2HY267V+QdPlzZqk7vTVnHt+S4oGztTjTuhhSsNe//aEqrqt6E3QrbZjlQpSptdcd
         sfmCVN2mPZEYkvb9KyfOzCSm5IlxniJIMbHICt1NE9aBIZFhFaho1XSo+vw84ZeefuSZ
         pjwUO5CI8V+1ZmWnHEwOL5e+PzFkt/q3jnYGtuVpZc8NNPayAua9VuEsr13sadhSc4Oy
         RA/n5PJMqoOdL6nI9tP5q5H+6eyHDPSp21lIOVKmFXqsWkCSXUr2zYqskSmo9HvcSZri
         /ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZwPxd8LtjEuPX3lP8M/ewsRzKiwOr4k1fCds3gC7Jk4=;
        b=hEHke4IJWR3sffyHxDiVT95YEeKBu88nmtoA/DT8SNoxyXKs2JURtYZsswmWHlgtpb
         XqNdHPDlZNoUxFZ7XMxtUwIDKOmCcD8rRAfhLj88pZaJ9xezM4EjGXPmwRCCHnoDC3wF
         uxta/unCrp1plgBSqIYpGKQux9BYnkzcpUWePH7lRa3tDuR+6wbHxEUYGpfKv3w8B/qc
         WZXofxIC42IxGtW+AFechlQRHpZ6QC9BecR/QykOfqNj0fPo7LoJFJUk5IDI7wk2tYCs
         5ir74zNWvia3x9rjMeOWBEEQSuPZO66g5ciBSZKH9qHN5BFDD1ldxVrwcaD6DRFm5EF8
         nefQ==
X-Gm-Message-State: ACgBeo1PTMpMYVNOXFCFwrlh2xXEMzydesBxC+r1OG4mIpw2D2kJsUh+
        YVkEFnAxjqWuPBnRJbqUEa0bKPlUvyirGGo1nl8=
X-Google-Smtp-Source: AA6agR5dSi7GcWoW99/eKsPN8BiqZ06Ox8DXrIZssWpkNK9LloKS4jC8B//ehyILIor6tXLNhujApgeLEBhGfpJxdWw=
X-Received: by 2002:a05:6870:562c:b0:127:bbe4:3f35 with SMTP id
 m44-20020a056870562c00b00127bbe43f35mr4109337oao.284.1662704486339; Thu, 08
 Sep 2022 23:21:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:6f15:b0:b5:cc21:cff4 with HTTP; Thu, 8 Sep 2022
 23:21:25 -0700 (PDT)
Reply-To: stefanopessina14@gmail.com
From:   Stefano Pessina <ekereuke50@gmail.com>
Date:   Thu, 8 Sep 2022 23:21:25 -0700
Message-ID: <CAEqfuO2WBqyhketF6b4_BqX8eU3FcXoUvZoWy=s2v_SkgoJikQ@mail.gmail.com>
Subject: Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [stefanopessina14[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ekereuke50[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ekereuke50[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
I am Stefano Pessina, an  Italian business tycoon, investor, and
philanthropist. the vice chairman, chief executive officer (CEO), and
the single largest shareholder of Walgreens Boots Alliance. I gave
away 25 percent of my personal wealth to charity. And I also pledged
to give away the rest of 25% this year 2022 to Individuals.. I have
decided to donate $2,200,000.00 to you. If you are interested in my
donation, do contact me for more info
