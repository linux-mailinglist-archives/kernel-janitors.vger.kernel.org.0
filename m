Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFA36A3611
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Feb 2023 02:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjB0BDu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 26 Feb 2023 20:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjB0BDt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Feb 2023 20:03:49 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3CFB457
        for <kernel-janitors@vger.kernel.org>; Sun, 26 Feb 2023 17:03:47 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id k14so6470059lfj.7
        for <kernel-janitors@vger.kernel.org>; Sun, 26 Feb 2023 17:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weYNpobTz7e34lKnlfhxYchHcnpoQgNkJdKwW1l0gho=;
        b=Bg075geJRtLuk5nD33/cHYbxzauamLadOVEFdrO289zAmE3h2RG2Jlc10oLzP0aFlv
         9ULN6HxpTLct7w30955hFlDvGU/53vTcyAoqiegyfxmRdooh57F3JX0uXZLVG52cADDp
         pbUIOE0nXPd1/JLwzQT4PW8wVHn9a2eQ+7Ntf6BvV2WdAUQSj8/dRyndTpLCo4VEuVgX
         7KYXFq6IaRK6zXhv1SGp3EnmYQmjr4ezx4PCnwb8O/GpVTYSFK41X9swkjbTcLdT2zEL
         OFj5vQOMcoj5szGnljIgASkScI/NMp+7GgcBOyAUO+XTz2ljIkt0EZqeC/J8ql4XFfCR
         B4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weYNpobTz7e34lKnlfhxYchHcnpoQgNkJdKwW1l0gho=;
        b=TcGFyDPsN8JSJD9uvMtOgkQOR2zEBOiib1POZuMOCz2AcZJlJVBS5fUtZY6eqaZjgH
         3NHTWp81RrYZhNITX1GiBMY6sJOzwx3+hazPMmA49YzthoaqYq3V2jD4ZDFxbIcNm2L0
         HJfGmEipp0p1eS1MoKOYBH4ifksQSJ3On3dVcP3tFrDL20DVzvYzgaOfnZe451xGtPqs
         BnTgERsjWQ9ltv8AW2RtPO1GqO4SRkHnr28c4tCM5SvUNa/9bbT1u98swcC3+TyLldMP
         zTAQzGMctTq4BthBZihMS5lyMV4/G7htxFrQEYx3qlBP81N2q7ufD8v/JqMbxDBPTMM1
         mP9g==
X-Gm-Message-State: AO0yUKWjLBAFVme0VfgaMlDJ0PH2XwluCT6h9kIXqZXHcAOsx3NVfgae
        dIDkaJpw0bey5g2JA1Cs6O/UJT1WtR8eCjQBFQ0=
X-Google-Smtp-Source: AK7set+8B2eXY795400Ygu65cTPLrxfKe9xyDBnQCL3BplyEWYhocag/7r+D61SM7SGjuSIaII2D2WAXHIihef4q8m4=
X-Received: by 2002:a05:6512:73:b0:4d5:ca42:e43a with SMTP id
 i19-20020a056512007300b004d5ca42e43amr6997518lfo.3.1677459825939; Sun, 26 Feb
 2023 17:03:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a89:b8f:0:b0:187:2c43:10df with HTTP; Sun, 26 Feb 2023
 17:03:45 -0800 (PST)
From:   Adel Aldoseri <adelaldoseri1@gmail.com>
Date:   Sun, 26 Feb 2023 17:03:45 -0800
Message-ID: <CAECeVmTV+NDTVNWw8ORBv88TT99RyCvZkwkZbzTFMdcDQ15cQQ@mail.gmail.com>
Subject: We finance viable projects only
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Attention: Sir

Our Company is willing, ready to help you grow your network and offer
you Loan funds to complete and fund your existing Projects. We can
send you our Company Terms and Condition after review of your project
plan and executive summary of your project, if you are serious and
Interested contact us for further Information:


Best regards,

Adel Aldoseri
