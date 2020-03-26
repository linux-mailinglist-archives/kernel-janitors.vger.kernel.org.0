Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D626194BCC
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Mar 2020 23:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgCZWy3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Mar 2020 18:54:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38357 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgCZWy2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Mar 2020 18:54:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id c5so6314295lfp.5
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Mar 2020 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dketg2xmeCHjMWwyChFsYCLkTQHS2H7rmpcy40U5XQk=;
        b=Mz5JJuHy+EHtTW2ruQf6KS8rf1FyuAKeuMpuRqgexQnmQQXt6lXbg+bouBcIe/NI2b
         R1cEuYVS8YOPkYGJL/h8vPIKKTpgjeVLMEQKoTdrlx6KjEjvXsSQtn4JutgSGcLNu7FE
         HzaHp6I8DeDQygWQA5Xz+Ha5vDztHbTw+RVIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dketg2xmeCHjMWwyChFsYCLkTQHS2H7rmpcy40U5XQk=;
        b=bll47nJLhoduAee7rFbaFRk0uJRdZJ3nTr9ENJoRJ8Sd6RRNwrgK7OUTsJm1aIrm+h
         Am5+Fav7CrMNq0RGGnEkJGD2DI9rWS5EFleaQYasLH8eiWcSipoD5BbNhhxne0NkIxfT
         5rtdWq96j08w/0NhWYHTNBNO/acoZkOebIlOGwxH1m/eBbsQTLEJeHo46h4xzROYUqhQ
         1d04P2cN3Qyz7S4XbTDNcrH9qIEhv5PQC05UzuNolSlwojOVaCgAvKDwDRTHbyCdHzan
         ZiL5qbn72WC0kgCIG9BW0et5pGg7JzAqj7EjIpQdnE7hXdplCUvi6EOP42SGGybJkIU4
         jcZw==
X-Gm-Message-State: ANhLgQ3/shtpCT8+USU6MGS7yu1hpYipFgV/8iBJjzzjmpt6qmx0fIpj
        NXr+J/Tg1meExeHYlKRPHgp1D1O5UIU=
X-Google-Smtp-Source: ADFU+vsBOa9ozPBDiXYSnhe7UzFwz9iIsBYAR1j7anYaSU2lLfxDs7VaWExps84BWAeHcDaN4avMnw==
X-Received: by 2002:a05:6512:1042:: with SMTP id c2mr6912704lfb.6.1585263265792;
        Thu, 26 Mar 2020 15:54:25 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id x2sm2086578ljx.3.2020.03.26.15.54.23
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 15:54:24 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id n20so6281066lfl.10
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Mar 2020 15:54:23 -0700 (PDT)
X-Received: by 2002:ac2:5e70:: with SMTP id a16mr3366363lfr.152.1585263263622;
 Thu, 26 Mar 2020 15:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com>
 <20200304131035.731a3947@lwn.net> <alpine.DEB.2.21.2003042145340.2698@felia>
 <e43f0cf0117fbfa8fe8c7e62538fd47a24b4657a.camel@perches.com>
 <alpine.DEB.2.21.2003062214500.5521@felia> <20200307110154.719572e4@onda.lan>
 <0d5503e1d864f2588e756ae590ff8935e11bf9d6.camel@perches.com>
 <4d5291fa3fb4962b1fa55e8fd9ef421ef0c1b1e5.camel@perches.com> <00d11cf766237d9c12c2a06458962c4bae84fa78.camel@perches.com>
In-Reply-To: <00d11cf766237d9c12c2a06458962c4bae84fa78.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 26 Mar 2020 15:54:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3=D0uFHXFsEz2CAvFGTb8RV1KJH-eOCqR5JUQGvOqeA@mail.gmail.com>
Message-ID: <CAHk-=wg3=D0uFHXFsEz2CAvFGTb8RV1KJH-eOCqR5JUQGvOqeA@mail.gmail.com>
Subject: Re: [PATCH] parse-maintainers: Do not sort section content by default
To:     Joe Perches <joe@perches.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 26, 2020 at 9:47 AM Joe Perches <joe@perches.com> wrote:
>
> Linus? ping?

Applied and pushed out.

            Linus
