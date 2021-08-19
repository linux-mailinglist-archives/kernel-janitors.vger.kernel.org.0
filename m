Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1607A3F1F6F
	for <lists+kernel-janitors@lfdr.de>; Thu, 19 Aug 2021 19:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbhHSR5v (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 19 Aug 2021 13:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhHSR5u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Aug 2021 13:57:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4285DC061575
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Aug 2021 10:57:14 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id a201-20020a1c7fd2000000b002e6d33447f9so5800357wmd.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Aug 2021 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qp2znENGjNE6am4araAHOS3yFZnocvS1VA7PpjH0CYg=;
        b=mkYlZ5ZKQ7rA1IysviyTzbO+MGnjWk9cRypg2AqlmTBKatavByifoW/1orDHXzvPRy
         GHH8QqZH7YMR8gx6MyVk/8AoVy4agGQ/xR4E6cS+5qmuYkNrGSt1xOT3QA5695YWFayp
         6Nvzoottrg7I5MTA67cfj1kFnCI89UdL00x1ae0OKH/h17UNOesCsONtpovzZ3xommbR
         1wIRAPGeJK521Ql9T+1QD3hY4MXokCJlc5SHaRdZ5R9N1+Yu1Sav+ddjPLwPXdATpXgq
         tXsvYVHptyn8a++LRaJYqBqxWefmVT+Ixqa5RW0VeDaywjUCTownCI0uFfXTmxs9IH6m
         kumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qp2znENGjNE6am4araAHOS3yFZnocvS1VA7PpjH0CYg=;
        b=GMNb2ckuYnaBpiryVI7KVaowriyuMUckXVcP1tNrfjKCujYIaAiEholg/Uy+IUqami
         L69AUp5/GW5ftOS2nIJUqPCpPjtCTaFNDhhtVupia8pAani/aVbXve3069BY5Q8FUOFn
         G6jlKtDM7/2M0/E/trBDFskvVEmYPFTmvM61CNjmc+pRR7LQoZaGUfxBdfwQEMb3xpxS
         Grpk37wq9GmUs+LLwxHGuoKL507sYCihNEfD4sVU4rHs6bK2xzvLRRRfsxsOc1ts8I7y
         +J4nwPtQ3Z7d4tfF8eWPK6vmBrVsHjW2dC7M9qryR6GP8Fyepqc+YuZSpXszvnUGxiNj
         rMcA==
X-Gm-Message-State: AOAM533Nel8Q34ADbM42/cpJgmCOBZwSOs20HKpeMNIpgcE+CnZKCvvl
        0cCUzueAQJI0EFdxDsPd+p0Vw5SW2yzw76j5lJovgA==
X-Google-Smtp-Source: ABdhPJxg35G3Ri2pIoXnwotEAV+S/DBC2+/pO/JqBlYi7QTbklhJWunGwvnywU1M/QOFsjx+ZaZbaATVwVQ4vW/BZOg=
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr14670231wmj.103.1629395832665;
 Thu, 19 Aug 2021 10:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210817105404.13146-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817105404.13146-1-lukas.bulwahn@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Fri, 20 Aug 2021 01:57:01 +0800
Message-ID: <CABVgOSnPVy0St9QHHt_ePFqFmR2MWzLK4BKmky2k2+ABECZbkw@mail.gmail.com>
Subject: Re: [PATCH] clk: staging: correct reference to config IOMEM to config HAS_IOMEM
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 17, 2021 at 6:54 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 0a0a66c984b3 ("clk: staging: Specify IOMEM dependency for Xilinx
> Clocking Wizard driver") introduces a dependency on the non-existing config
> IOMEM, which basically makes it impossible to include this driver into any
> build. Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> IOMEM
> Referencing files: drivers/staging/clocking-wizard/Kconfig
>
> The config for IOMEM support is called HAS_IOMEM. Correct this reference to
> the intended config.
>
> Fixes: 0a0a66c984b3 ("clk: staging: Specify IOMEM dependency for Xilinx Clocking Wizard driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Whoops! Thanks for picking up on this: I thought I'd fixed it, but it
was actually for another driver.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David
