Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9669F4AC61
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 22:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730877AbfFRUzu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 16:55:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38057 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730864AbfFRUzt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 16:55:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so972394ljg.5
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rgyz2cVF6lciICHj9aRxm3g8t9416ctrHS5B3PoGzGM=;
        b=er8IX2IUKbXU9cahan+PR49raLMPgXXPPUR2yIHqZPbkQsvl37yRNMqfD0QJCdAjv/
         Js7XnzEYA+84AFVz+WBmB839fafHCxPz6VNvQMgMq5clTEv658MFIY2euF6/qDtGFn5n
         /mCm3ynK8OYbMKS6yBEJaYs5AYJ0Te0crzo84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rgyz2cVF6lciICHj9aRxm3g8t9416ctrHS5B3PoGzGM=;
        b=YPt4QrqqaT+pv53AHPUKrGLZstjq8w+MwUwrZn1Kff/Kz6dcCptKSHzmsXceMcRcft
         dKGuP5NxHduuCkLg5DWhu8Z8Dmev4UnGDdV1DM2/Iqss0ZbO/XDhQaYP6B/re5LU3/CX
         S9uE7lfenpb5gCsP20G1aLclJUbqPyePMXxPSSpJCYe9vVB0pMBJUFdq7lHlO8tEmcdV
         6N6t+i9c22Ti+IZApwL6gU76B+D0zmN+/cvY1N8fhHleeo3QAe+vPgMp2ti9Jcq9tSLd
         fI51j8IppvJspGhsrYs+Avdm7ESqyx+E30pNSbKcJZARRpvOXyq9RkUT90MBVBZvEYkC
         WLtQ==
X-Gm-Message-State: APjAAAUKEuk0ObSG3ozBF/o3DN4wlZZJWIOh4t2Mta6lsYDtZnOLpoRW
        s3+T61W/QpZS4e24oKtev96slBejowE=
X-Google-Smtp-Source: APXvYqxURPxSLbw7u3Nyzjj5CpbzYz3XOKneebUIq1zCMKzIq1aQCmYa7ILOsVn8n/u690N6bVSb1Q==
X-Received: by 2002:a2e:980e:: with SMTP id a14mr54762499ljj.60.1560891346861;
        Tue, 18 Jun 2019 13:55:46 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q1sm2360139lfc.79.2019.06.18.13.55.45
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 13:55:45 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id a25so10343262lfg.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 13:55:45 -0700 (PDT)
X-Received: by 2002:a19:f808:: with SMTP id a8mr6231181lff.29.1560891345414;
 Tue, 18 Jun 2019 13:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
In-Reply-To: <20190618081645.GM16364@dell>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 18 Jun 2019 13:55:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
Message-ID: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 1:16 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>
> Ideally we can get a review too.

Looks fine to me, but obviously somebody should actually _test_ it too.

              Linus
