Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C61E56514F
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Jul 2022 11:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbiGDJt7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 Jul 2022 05:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbiGDJt5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Jul 2022 05:49:57 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF192AD9
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Jul 2022 02:49:54 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-31caffa4a45so5146927b3.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Jul 2022 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=E61+1ZXk0XLFmLKS8+LHaQBAQCUVSplsnRDmkf+keqM=;
        b=pPVgJzn0l7WCALlprPBh0UkhLNiJiYW3VkIbneiWwZzExEW2PkGSolGt2kU5X5PSap
         M7jlDf71GDTHGfNtio8ojK/Tiv1Zsj8v+auLe1fCW9d/dAtH8IJT9EHTchQewfwmurTW
         wS18sa8yBa0hNj6arat6dVrxjSFfu7p1TyNdEcLg++5wFXp6AkjEJPjzXmPYyiKj6LpR
         acYinupynn/osQLB1aHbMVbuWmJcc9myVFN0VfJAWZrww45+fStou3oVB7d2zbjL29fa
         JiReTwz6ycT/B2MI5n96mCu36B0q5t9gA5O3rgQwmhu2wTDuwWNhZNa0RQzzbzmHavSd
         7YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=E61+1ZXk0XLFmLKS8+LHaQBAQCUVSplsnRDmkf+keqM=;
        b=R9on8bbEGJNUvLRPLolRXsVuyb/ydN4SeeB+Bd+mLyswoGExzKzXMQYBFNycqYtgHj
         Nss18CpLGWhc99hKqMtAd33YkCe1L72N5D2q2DTJQC/MaY1mpmA1EZn7dQ4xzjIq18Dc
         kiY4fLsBmpjWVGbA3EsNPe2smRbPboXTriuOYdD5kYeJjuza4sAXzu+xSP+lynLzdutd
         XEjSP7QTorgtdJ38GEWfxHbDLrFLa+56QRxaXPfAbk9zqEPCUg6WmR8uorznerYwHwVf
         69WR7o8B++re8UvFFf+LKXT38u4v1qwS0UMfTnm6zkrT5xQ3zK4dGcP2Pz93JpnXoJ6V
         L/2g==
X-Gm-Message-State: AJIora91JD3jjVCp/jO/rRlosDMTWvgh29JHMmwUl+Pi0wDBiV9BUJxE
        frRlJcWzwYzl49zvuFIuNPQ1/VV3LWERuU84+js=
X-Google-Smtp-Source: AGRyM1tO0khrh8548MvwXdCch/DX7SNlysETTnVE+pXiiyx40TvtgNvwhfNqxvEPQrvRr17Zb3aAbzqAY3GZoOrR+XI=
X-Received: by 2002:a81:174e:0:b0:31c:88f9:55fb with SMTP id
 75-20020a81174e000000b0031c88f955fbmr8537054ywx.74.1656928192952; Mon, 04 Jul
 2022 02:49:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:5286:b0:2e2:3648:8c0d with HTTP; Mon, 4 Jul 2022
 02:49:52 -0700 (PDT)
Reply-To: hj505432@gmail.com
From:   "Barrister. Ben Waidhofer" <musamuhammadyusuf2@gmail.com>
Date:   Mon, 4 Jul 2022 02:49:52 -0700
Message-ID: <CAEfE=vHFLZAUhbcgKT8YMs617KOaFVQA5iyBO4So984fcuzhQg@mail.gmail.com>
Subject: Investment offer
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

                                                 Barrister. Ben Waidhofer.
                                                    Chambers & Partners.
                                                       42 Parker Street
                                                            London
                                                         WC2B 5PQ.


......I am the above named person from the stated law firm in London. I act
for Mr. Andrew Walker, a former loyalist and a personal Friend to the
President of Russia Vladimir Putin presently in London; he flew into
the UK months ago before the invasion of Ukraine by Russian government.
The sum of $3.5b was deposited in a Private bank in Switzerland for
the procurement of MIC war equipment from North Korea to fight the
war, but he has decided to back out of the initial plan to divert part
of the fund for investment in a viable venture.

There is a need for a matured and trusted individual or corporate
organization to receive part of the fund. All the needed documentation
will be perfected here in London.

You are at liberty to respond for more detail.

Thanks.
Regards,
Barrister. Ben Waidhofer
