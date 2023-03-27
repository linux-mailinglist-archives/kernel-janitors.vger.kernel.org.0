Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CF56C9EAB
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Mar 2023 10:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbjC0IzG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Mar 2023 04:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjC0IyX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Mar 2023 04:54:23 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCD68A6F
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 01:50:03 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-17997ccf711so8501567fac.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679907003;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE0Q22t9nDUcBAUVsmYKmeg+5EtHh5OHc8AXl8b80GM=;
        b=BbKXn+y5lTlEYqQqkgsDydANlz4Hym2WeW/OPVlVJuyFF99JhlrjLE9QfrlPAb2Fws
         IS1JS9RM7jgmV/ceMp0SRy3O34Ntio0kx4aG3riRa66fnE5ZwFebl+m8GGE075AfEG7o
         N0G6aPN6+8lrJAseavIYcSZAiB2/BGhSySZ56GR07BA4OvcJJfmck0p5F6SynL4IhH4+
         5PoYfGCnnj1o5hEI4mBKB3FPoh06vX0PCLuGySwE6wmV3+8/kTzeUoLcba5aivo9yfAw
         SmQNxtlCP+De6N18U+GD7B7jAWxeWBfPb1yNJeU2AVSTzK0NpqiW96fewWiKcea8knmG
         IEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679907003;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE0Q22t9nDUcBAUVsmYKmeg+5EtHh5OHc8AXl8b80GM=;
        b=aQqO0NzlDPLPLspj5Gf6v6IuRIFoxvbadQ81t8e4jclheU25RVfu16ka39tf7wYkvX
         r0wYo7BXQC72KQd5b9uQdn12tDz1KPgbjdkPrmFlC0Ut+ewbEfw7KzTmjyA/A4MDHiTe
         bgwZcEuzOMmbBfFvOeRzXeQ1dFCOfbLKvLhORqGjDOygiPp6BFHfUIrjoeKB6t+9ApYj
         dYyWw4B8Z1J4xVLunMKwBz8FVNu2cbG4K9wUgdcouzR1fuwT/O3PiMCVwCnvhv/QFpyQ
         fsRDBYtjVR7AmOWjGZ85xUy6HBsoWrcHSaAQDnCXue26JBjzL1ipLI7qy2I0zvXesVBL
         91mw==
X-Gm-Message-State: AO0yUKVuMD/oZJvr5GzJFKVgVQcuacL5Wj0HgSS/AVRvV7HLCCc6LBdK
        Q3yPSiWiT63+tsmx08+ClIb71U8JIMru87n+PCQ=
X-Google-Smtp-Source: AK7set++fsvWogS/uNVLieWiuL0rsOf8y1LTglktwUFHYLfF2Tag764Y/SqIMsW6ht5l7AqGFFIatIZlYzi1CMtltt8=
X-Received: by 2002:a05:6870:1096:b0:177:8c4d:1ecd with SMTP id
 22-20020a056870109600b001778c4d1ecdmr3639555oaq.10.1679907002949; Mon, 27 Mar
 2023 01:50:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:b001:b0:10e:d722:2b3f with HTTP; Mon, 27 Mar 2023
 01:50:02 -0700 (PDT)
Reply-To: annamalgorzata587@gmail.com
From:   "Leszczynska Anna Malgorzata." <maaryy442@gmail.com>
Date:   Mon, 27 Mar 2023 01:50:02 -0700
Message-ID: <CAF9wmiM4-7SF8EXxbc8Mg7D8j-jFfA7HtotKtTpT9WKQoiGM-Q@mail.gmail.com>
Subject: Mrs. Leszczynska Anna Malgorzata.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.0 required=5.0 tests=ADVANCE_FEE_5_NEW,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:36 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [maaryy442[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [maaryy442[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [annamalgorzata587[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.8 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
I am Mrs. Leszczynska Anna Malgorzatafrom  from Germany Presently
admitted  in one of the hospitals here in Ivory Coast.

I and my late husband do not have any child that is why I am donating
this money to you having known my condition that I will join my late
husband soonest.

I wish to donate towards education and the less privileged I ask for
your assistance. I am suffering from colon cancer I have some few
weeks to live according to my doctor.

The money should be used for this purpose.
Motherless babies
Children orphaned by aids.
Destitute children
Widows and Widowers.
Children who cannot afford education.

My husband stressed the importance of education and the less
privileged I feel that this is what he would have wanted me to do with
the money that he left for charity.

These services bring so much joy to the kids. Together we are
transforming lives and building brighter futures - but without you, it
just would not be possible.

Sincerely,

Mrs. Leszczynska Anna Malgorzata.
