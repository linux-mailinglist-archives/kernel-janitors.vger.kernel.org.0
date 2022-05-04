Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0ED519E94
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 May 2022 13:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239294AbiEDL5H (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 May 2022 07:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235325AbiEDL5H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 May 2022 07:57:07 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FC421E37
        for <kernel-janitors@vger.kernel.org>; Wed,  4 May 2022 04:53:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t6so1683480wra.4
        for <kernel-janitors@vger.kernel.org>; Wed, 04 May 2022 04:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=z+v8ugHyK4Bi1bsAOtuex5rzJWIULuLfF++ZnJg6JJs=;
        b=VFX6zkslq5lSBNJS0uhG0HG4wBnEenZ7sQ1I31Zndxt2Fs4tIQMaa+zSYumg/bpT2G
         cgFMiuDamF4RIQUkoTlLmwOOrztnN6OfwcRfPOU2Prka661JImkqZulb+ywgnG7NEl9W
         nKb0bu+AHQTZbU0e8X56UC39Xh+bOUSva2BEklnM/TdNfQRvjtViT5BHlqztFVz+LzSF
         WvC6oevRZhx2Y3zKvrPw94+EJZxS/7nbSAxZZP+PEE7F4hLV660NZJREZw2aNdn0EnoL
         Xmst6oAwK4lfpqNoHo93OqWzorF3T4/XiBcr0XSQaBoV1R6YpCqPf3KFcpVlA9d5m+7m
         0XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=z+v8ugHyK4Bi1bsAOtuex5rzJWIULuLfF++ZnJg6JJs=;
        b=aYN/Wj8c0sfT6JgkasgltE3q8nEdTYqiHHYq7gLg6n+AGYgK70Y7wlWqU28RT5E1tr
         zdP6UI9kS3C5287Dbcoa5pOX5qS5R3nC7KeqHIT/OUafO4vIDZ60EVZYMUnULndmMbKb
         tEBY2XS6ygbBOv8Ad6/iAdYQ+dec+rtR93BYyDEnUPlUC9MH1piNwZFdHCN3F6oqaAub
         FzqGMXXbCy2XWaeyf742+xb5uDdzlMAZrU5uKXyOwNvSU6bS+BVxn6ZYX4q+icel+bJ6
         lDu7w9QOpvh6tOFZr60EFtRwdKWMB1n3fR2o34N8fezXHXTsjElPmRhl2BPln4Z02Sbv
         UmZg==
X-Gm-Message-State: AOAM530o14Rb/Y7O6jPBPigTCZjyADz+tKHfRB+wD9oNT3rcQndN58k5
        WXiyr5KZBJw/yCKEhr1j+3ubVOLLlUGHDj3bNf0=
X-Google-Smtp-Source: ABdhPJx6EoxC9lvEPEIDKN9oJw5C+mCFEx8BpUsIHYcyas4XD7TAZMSKKIQZI3oXrGTw1xCGIlyTg+hWrUFIMa8IhBA=
X-Received: by 2002:adf:fc52:0:b0:20a:e296:6e8a with SMTP id
 e18-20020adffc52000000b0020ae2966e8amr15736548wrs.432.1651665209749; Wed, 04
 May 2022 04:53:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:4ecd:0:0:0:0 with HTTP; Wed, 4 May 2022 04:53:29
 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <stellamilojica@gmail.com>
Date:   Wed, 4 May 2022 04:53:29 -0700
Message-ID: <CAEoCe3JpCwZeN66Ex93rSmaM8zSZkpG1WaASJW0gK8jWZvugkQ@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:444 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [markwillima00[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [stellamilojica[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.


Thank you
Mr:Mark
