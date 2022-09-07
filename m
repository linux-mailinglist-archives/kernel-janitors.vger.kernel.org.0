Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFBB5B04B2
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Sep 2022 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiIGNFz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Sep 2022 09:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiIGNFt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Sep 2022 09:05:49 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E50D6D540
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Sep 2022 06:05:48 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t5so19554882edc.11
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Sep 2022 06:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=9JgfdaIQvQZ9l5SmCOLciVHAQhMDxaoqktdhOO0g2kU=;
        b=QUMS+E2KuX7582vTEmdy6i6XpIfHHvhmNul5Q3IP/Lrq83fDfB76Grm7vlBDzS9iW4
         lccDY5h2cxRe/6k2Ptk3NfagNy/RNEDbtGdosgjqEvOANRoKVvF7ew3bdoGcniDQfifm
         AGWL5YP4mYpfdClNIaK27NRo91KM9aUX/EvoRyk6f90FiFXJPqkonYm548I9PqRZNscq
         RdFn/CzcQN72+WFw01qF+oWJVS3ileNExZ4oElSNxIngvU85dg3BzWdxtwM0llSJ6CSq
         TtD+cE4vQxw09xuqmEeCClffQllhMJsLh0t0S3Pg9zoo4FVWrdzoZtUq+c14MlfeV/2/
         zxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9JgfdaIQvQZ9l5SmCOLciVHAQhMDxaoqktdhOO0g2kU=;
        b=eIKhRJ4ZnJYuK8BxC6rC5sJm2zBfhnuqZufVFyeQWyJvBRre02pHiNH41kGYRRQSUm
         jTKckltxSprIfI4IW7d+nC9qcl4dkxXkCykZNmaSMmPeTH66EjjSdps71clngnxQEIDw
         WGLGuDmZLKTMrPT7PV1MBjTCiFAU3IjLkL5ckNv3WfX88spgMpaiJTlCn7onElfhlWWt
         VkRn1FTGXP4uRD14Z2DWYys5Y7i5wfnP5ZHz34yeN83W7mMfL3FD3a/iwLUCK5lrZhFt
         aRzBbaz9SMTddalt0nhHwjYLcp/97n5z4J7p6lznIBb3Eq/HNfc+FQYprg68u+aFIsFM
         /vkQ==
X-Gm-Message-State: ACgBeo1WZ7OF5bgAqF9eS8EzoGKVSVuPGsTZqa2OjPFY2tUQUWoBETAq
        OqJuqYMxRhfAEduy8x8XKNNVrcRHhCO4lcC4g+o=
X-Google-Smtp-Source: AA6agR5pLbWvairRt6lRV8JRpzGOHQ6ihD6G1/yCBl8HaYB/FzamW39z4fyxvZJSWpUoV4bGaLDXcpBTWOTdMvllXFU=
X-Received: by 2002:a05:6402:1655:b0:44e:b208:746d with SMTP id
 s21-20020a056402165500b0044eb208746dmr3078831edx.229.1662555946773; Wed, 07
 Sep 2022 06:05:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f742:b0:72f:a24b:f828 with HTTP; Wed, 7 Sep 2022
 06:05:45 -0700 (PDT)
Reply-To: stefanopessina14@gmail.com
From:   Stefano Pessina <awajimokpebenjamintheodore@gmail.com>
Date:   Wed, 7 Sep 2022 06:05:45 -0700
Message-ID: <CAB_LvSGx=kZEzN7xiFnZviC5pfbDSVegeH4s09g79fqpfA82Kg@mail.gmail.com>
Subject: Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5063]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [awajimokpebenjamintheodore[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [stefanopessina14[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
I am Stefano Pessina, an Italian business tycoon, investor, and
philanthropist. the vice chairman, chief executive officer (CEO), and
the single largest shareholder of Walgreens Boots Alliance. I gave
away 25 percent of my personal wealth to charity. And I also pledged
to give away the rest of 25% this year 2022 to Individuals.. I have
decided to donate $2,200,000.00 to you. If you are interested in my
donation, do contact me for more details.......
