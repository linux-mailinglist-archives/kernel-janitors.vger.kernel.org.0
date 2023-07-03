Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA6D745C15
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Jul 2023 14:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjGCMTT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 3 Jul 2023 08:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjGCMTI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 08:19:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4293010C2
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 05:19:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69f71a7easo69969221fa.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688386742; x=1690978742;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lii1qk0iOcZYWICJr2br350W927ez7amTIxsDQVx5s8=;
        b=TE0wZHaiO9VtvTKN/PWwgxgoPBXLzzcNIlIvaJEeDML8+m2ZyhUTZsHm+6rVByftkE
         WJQ7XOzCcHdgCwUlSmboiqcnFmhMe47rNohjpjwOBAxQRuMJJgddro1VLyY2crJfK8mI
         iwP70Lc+WnwgLkJRtjZNV5dXmF4jv0ujG3+8jHPR3hzGeCCvoTyzE9XRBYtn2DN3Y7u5
         /l+2IVDcvvg1h1rq6ySmIEDWqmjZpGVvuFkbLLevprAuCy/S4/pTz4Or+n1Sfz/aK4Lc
         qJecbIZj8nPzTOdImhneWFFDnR8DvJW9XOw2PYO6OpU20UqBa/G/0jTtn+KvfG0BAZ0Q
         Hcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688386742; x=1690978742;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lii1qk0iOcZYWICJr2br350W927ez7amTIxsDQVx5s8=;
        b=aTMlMFOnLuLWNy/NHM40FFSAk1cx+kuz4VyhW/Ha/rPdRkECjYtOYaAM6KUPFYT4JH
         P3yuIDmLb3K4PX5hZ9RU3oqFC+o7BCXiLr7tMMrSnQG+9tRWjUAG6FRaVrGFLPoYYyDI
         PnqV5blzZcRadI1f6qcShazde22txl5debb4czKKlLBHec2zwzDPL0Eb1yG5xalxAF3i
         pOounjOWThRTVZFHoMmqVhaSONlVl1CZU1dPBM9VCrObsOtvuUZAINmlsdRCZ2IpHAYI
         lPJk42vZhONP44N1ZItphNXazOmt5xFEfE4Ch6RQOA2q+FeR7o8SJfdtVDEUcsPkfcQz
         H/wQ==
X-Gm-Message-State: ABy/qLb+RnkzTlldDrtPI6ES6Ix8fqbFMEDmSwjFsrYY2AVgO+EGgvRe
        GDgy+UUJkoosQW8FLkJa6myskERUmnbhh40I4yY=
X-Google-Smtp-Source: APBJJlFhShal84Dfs2I8fGBNN3QstOfzflh04tQrV3lEw2Cxh8V0qEVf7bfIfXTBmhcdhSk83mBKhy+KWiaH8S6g2mo=
X-Received: by 2002:a05:6512:693:b0:4fa:21d4:b3ca with SMTP id
 t19-20020a056512069300b004fa21d4b3camr7855921lfe.2.1688386742108; Mon, 03 Jul
 2023 05:19:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:4293:b0:6f:64:17 with HTTP; Mon, 3 Jul 2023
 05:19:01 -0700 (PDT)
Reply-To: joebabm@hotmail.com
From:   Joel Baba <jdebabah@gmail.com>
Date:   Mon, 3 Jul 2023 12:19:01 +0000
Message-ID: <CAHOgiy7DE5A19ubjKDwADkYg8hZktXfrzLKhVM7xLpbY-=ES-A@mail.gmail.com>
Subject: God bless you.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.5 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5018]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jdebabah[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Greetings to you.

 It is my desire to solicit your assistance in proposing an urgent
transaction with mutual benefit that required maximum confidence.

I want you to let me know your stand in this proposal so that i can
send the details of the business to you and i will not fail to bring
to your notice that this transaction is hitch free and that you should
not entertain any atom of fear as all required arrangements have been
made for the transfer.

I am awaiting for your immediate response as you receive this mail.

Yours faithfully,

Joel Baba.
