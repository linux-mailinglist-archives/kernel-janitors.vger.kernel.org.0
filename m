Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A82522180
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 May 2022 18:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347539AbiEJQrN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 May 2022 12:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347569AbiEJQrE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 May 2022 12:47:04 -0400
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA50251339
        for <kernel-janitors@vger.kernel.org>; Tue, 10 May 2022 09:43:03 -0700 (PDT)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-2ef5380669cso186266517b3.9
        for <kernel-janitors@vger.kernel.org>; Tue, 10 May 2022 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=FRo/ATiHi18y5eGWMPtqMab2ppBYGs71AR/aSWrmm9o=;
        b=liwDaNTQWQ/B/zdGnBcgrFEhxJZoIR4WCzM1EF36vicCJxDeeO/ruw2Oj5SKP/a3AO
         gow1yGEek+PF7SbR0+nnoeHLUATbzbctyWCVUjUf6Z5niD2ef2ArvxbaQ3qfbWT5vG7U
         lDUgVEYG1j4hDDktGZ6OGkdQ6z7zojc9hWmAJx9m9rRj8D9GYJlVFTLZ35CW6gTr1sAv
         JtEaVNilBuGGAcyXAEzwOvFsxF84ifNqFilwo7WCfP6GvFRWzu0tPvmR/QzMnRqPXneU
         AYy72fIexiYV57XKXIcg7ph5PRYSXithgn89rmY74EXQ3tf1O/WUCwVpWPc1DR5io/ia
         fDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=FRo/ATiHi18y5eGWMPtqMab2ppBYGs71AR/aSWrmm9o=;
        b=tbmp4V0irbHLdpUqiDEynj+LzOElXWydU6Ds2yDYgMLbRI4kJvfVBKBbenqTraDmK7
         URbpSVLOdO+zBbP/KLPlMHm0MGfg1eGfVrphEMfnPIy5en+gkmSyNrisvz8bsJgcyp0f
         grriGPO4O84EVTL9btaH/AuirztwRSUZ1sNEuNeATys/BEF0ZuK13CbJdLPGYTHgCRic
         owGoUqdhaOADbt5JZ7Uz6jbwIuhPDuW+8RmpzxLhvFkqjrjaejdav30XtI/u9cpAmhyb
         qKqECT15Z7zlM8kMiDAfyz0nzFjJrhN3ujkXJuz7/yFecUp2K0TvNE5L3iwO+5wUoG6Q
         v7TA==
X-Gm-Message-State: AOAM533vf2gCmFG8LMVycMbZpKtjDNPPGuguDx4DICmL2yCx2V/qCyEa
        GLespjEvnK3hEo0emLwRXEvvK52Cy/uBunKyIHo=
X-Google-Smtp-Source: ABdhPJzYZ/KLn+EHRNF0DftiqS9fVR+eO22Kyc18ChENj3VAF2SXZO3VzxLEcNxSlqSgP4vMge79bMPyrDint2047sg=
X-Received: by 2002:a81:1b54:0:b0:2fa:f842:bd7b with SMTP id
 b81-20020a811b54000000b002faf842bd7bmr20165536ywb.170.1652200982605; Tue, 10
 May 2022 09:43:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:3cd:b0:28b:e76d:8ab with HTTP; Tue, 10 May 2022
 09:43:01 -0700 (PDT)
Reply-To: biiioqq@gmail.com
From:   Rev Sister Grace <kiasskiww@gmail.com>
Date:   Tue, 10 May 2022 22:13:01 +0530
Message-ID: <CAOWny3PnVuFHwpxjP4u5N-sY7q5fp8zBQpx8wh6Z6_Zw-s66+g@mail.gmail.com>
Subject: Rev Sis Grace Charity Work.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1144 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kiasskiww[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
My Name Is Rev Sister Grace, Contact me for a Charity donation of $2.2
MILLION Dollars to you for charity work. Send Your Full Name & Your
Phone No At: biiioqq@gmail.com
