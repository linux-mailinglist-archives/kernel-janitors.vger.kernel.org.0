Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE4E53C96E
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Jun 2022 13:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242736AbiFCLcI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 Jun 2022 07:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238542AbiFCLcH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Jun 2022 07:32:07 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08B36445
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Jun 2022 04:32:05 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a10so1417056wmj.5
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Jun 2022 04:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=Ne7HHNwxSaydM5AHEYVap/i9dOlaqnll6PdeU6Erki26cZ/QpXWefD2kCTMI57EI6D
         0Yy+AO4MYy5uSAKV5egZJB+T6y5VacLvM8jBzR42g7XV05fZC5wEH3umqe5f2HfWEPGM
         D5Xve++0TViIZk4XHLiYLAswplB4gNd9YsRHC9EQXnvVOGCVC2jr8+fo74/kx7wRXEgI
         ar/s6A3GmYpQQbXvWezGDTGSItKLPEoWWv8usXIxfUtRXfqhnheV4nQ01BVsFg0KqUFo
         uagrkSo34mz7lVRpHUdSciKD0TgDgPCma72SZFZqTGYwIpCmjYOAPKxNP6GnFstunx9c
         hSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=rmBfGxDnB9uXoC9t8bLlUE0DhAY0WTNslFNhllFw2jJOyKj3YgqlB3gjT2GGhqONwN
         VsTgs7JgoOEujG8IDFwfONJEFKsdANWFPs3z5GpdCjZGroBz/Wfm36QGpiphCbLyeINK
         wcSEkhp28blmOlmoEr6nbYJ8bkaLoOmTIdclDySL9bfTfOMhEAdgoyNSrhfOxC1LuKlW
         i+D3XXzr/4IMhuclDJk618n05v1gtU6J6/g2ifmrq+yEGcasVpr6PRHTBJ8NTiN58tbl
         AJZVpCRdAYCGID2PgegX6M7siXrHB8QapdR1mNb373NchzgnScH6nNALrY9lGco7A/8W
         +zgw==
X-Gm-Message-State: AOAM530JLbUKfOjice3BuZjjO6ULabMemK1v7aqBOPvddCz1mwM4TZ/R
        RErGLBGfXpIIgiCsU0o4SKX04I/CY5sCHq/7ECo=
X-Google-Smtp-Source: ABdhPJx2kyZxjIRyqi4zQRzwDHeoWLrI5lQQg2Zijb6DBHvAq0B31MkSaK22fLwfbiDH1yn6XcA74r8V/pPbibOtphg=
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr37962024wmk.77.1654255924047; Fri, 03
 Jun 2022 04:32:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64ed:0:0:0:0:0 with HTTP; Fri, 3 Jun 2022 04:32:03 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <mariamabdul888@gmail.com>
Date:   Fri, 3 Jun 2022 04:32:03 -0700
Message-ID: <CAP9xyD0_yeaJ02FRx7znZBb5GOYkW7c+NkAomSccKbXYh-OnLQ@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Hello,

Good day,

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
