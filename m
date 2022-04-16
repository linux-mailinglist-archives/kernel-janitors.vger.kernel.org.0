Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0E95034B3
	for <lists+kernel-janitors@lfdr.de>; Sat, 16 Apr 2022 09:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiDPHq7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 16 Apr 2022 03:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiDPHq6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 Apr 2022 03:46:58 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C06F94E1
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Apr 2022 00:44:27 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id 79so1903819iou.7
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Apr 2022 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=WLytQdsOgAm2SCwXWhIlfiUxFYp8V6KJhxqFHEDChKeorU61bpUH0dIGlR8YlBIFZn
         diZgZUA370TREgWOTMvywwgaXNAQEn8Meq463qA5vJ51GfRM6HFArlX7SvJSLO3Tw3PT
         1KYPlvWsqnOJVw5P14sSxcbrtJmxIvWwm8ZgzqK+S2mPYyWSGW4ihcmDAtf4l+Wt1hFP
         VvFHNlLJsjt4rVhmZOBJMhD74zd0c1Pq6ihXTkCNIVnkCTpmwd5/aZnHIGilqjyVPx9G
         LiGFc4tH/iXUE67TzbojaC5MqPFtD/9ePUYbdqIkt1lkmfJKvtdxCQyNMDyrBf+b58Yr
         kBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=dNpvVRzGzPsdvOOYkRq+oJgmTQG6IdSzFpz8N+0Usdr0FWkUzZ8TtV1z8+CEeTOSwb
         KjBC1lM2LfaywGn5cYEOoQravt30EAT9BF4eqpAg4Ey6Y7aSQqcWPwPKoQK0dnkZgeEf
         614fFoWqK9r/XS9jp+eeDmxzI3UvtagxpekEZ8cesA2G2MvZFWBHSep9P2iFyDmhLa9a
         zyKycUUjVsKU0l3c+4c0m2xHgzzxfQX+2F0opgLq+bc02LMmhQaQHrY+SX5Otp54pOGG
         N6lFH5bnrNEPxWnWFBNwCqlSDtbYoe5VisTGnaDERD2CoPXSDuqlVIOEAsYT37akMJ2J
         0+Pg==
X-Gm-Message-State: AOAM533iz6c7DivK36mAlEwOwb/rglIjmdXz7ZJBWMqypiM8VX8Dn+lQ
        GK/HnnN9stVYpqDwhNCziobsPFXvjZl+7KlpcZk=
X-Google-Smtp-Source: ABdhPJwT5JAQijUAzuptGNTdBjReZccxsNjJ7Heww5sRuupRDeYEnJUh/WXc8vkJzY9+sjfh/zxDbHMFgqAcrWcUhvA=
X-Received: by 2002:a05:6638:12c2:b0:326:665f:5bc2 with SMTP id
 v2-20020a05663812c200b00326665f5bc2mr1049220jas.196.1650095066744; Sat, 16
 Apr 2022 00:44:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:1309:0:0:0:0 with HTTP; Sat, 16 Apr 2022 00:44:26
 -0700 (PDT)
Reply-To: daniel.seyba@yahoo.com
From:   Seyba Daniel <royhalton13@gmail.com>
Date:   Sat, 16 Apr 2022 09:44:26 +0200
Message-ID: <CALSxb2zRRtkrPOMBfVL9HRmcg_j2Af76EQdBJb6m45oLVUz8Hw@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [royhalton13[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [royhalton13[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
