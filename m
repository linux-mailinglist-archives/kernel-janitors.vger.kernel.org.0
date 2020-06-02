Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021DB1EC3D4
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jun 2020 22:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgFBUlJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Jun 2020 16:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgFBUlI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Jun 2020 16:41:08 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C797C08C5C0
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Jun 2020 13:41:07 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 1so64109vsl.9
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jun 2020 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AVYyMcSjnY3DuRRAEtT7qSzzRscOr9lxW6mXOV2xasY=;
        b=FYsG3oRfmrsRcDXZ/KWnWuTlpM499kKjm22ELuoiYyFcRqV+DouPNMpOn60f9gQ+fR
         1TvRZ4la0xj5YwiudOHKVg7Lao+c/dgsQlc3xRnLT5FG1/hv8MI04/dbKUBnKOL22cLC
         57DYrAh4B8gPtiuwRYJqG9R5GyVgZZlTxVs4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVYyMcSjnY3DuRRAEtT7qSzzRscOr9lxW6mXOV2xasY=;
        b=bsGtE/lDJi/koiKiJpUYAupCuZZhR8d6QoX4MUZeaeXGnhzTqKzWTuddg6L62VAmmm
         ckNM4fgW6dPB+aDjU+IPliQERIFU0jpRnfx1AhECLGbpMmBq/NlLa5UYZbtoY1ebEYwL
         /qbJnlDFg1qQyMek94I1MkH+bbFaHbwkFKWa+npVW1dTSM62qEa94H9/3zsid2lmBhd3
         lw0afn+LZ7+QV990GWm9vzTjuhQQ/UzUJnSkQdz4Y5PHohE9D1lBIs79Nm9Q8PnPuVtU
         gFdkKmHUEKPsjCrKAfLF/1+8Y3SS5LJdV/Uh5mX3ykC7FnD46ShBT/whNy/Qcdm8+TSW
         TZAA==
X-Gm-Message-State: AOAM531qKsYHBlMzUIExwGiUr1oEWSm+s3QhKC+FyY3h+nY5iLEczGW9
        3zJJM5jBFFFwuOle9V8t2SA0A2w7S24=
X-Google-Smtp-Source: ABdhPJxs7TPteDvCl635nLgAewvdjCBW+aOGkRx/i95tyT82VdStUEdmXRP+0zq4PaV1kY8MnfOogQ==
X-Received: by 2002:a67:7fc4:: with SMTP id a187mr19224259vsd.139.1591130465980;
        Tue, 02 Jun 2020 13:41:05 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id x136sm13090vkx.13.2020.06.02.13.41.04
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 13:41:04 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id j13so85367vsn.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jun 2020 13:41:04 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr20199765vsx.169.1591130464160;
 Tue, 02 Jun 2020 13:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 2 Jun 2020 13:40:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WOp9yVGt9hosO6fGTSqstjqO=nddTLr5tD04cfvHHL7A@mail.gmail.com>
Message-ID: <CAD=FV=WOp9yVGt9hosO6fGTSqstjqO=nddTLr5tD04cfvHHL7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: debug: mark a function as __init to save some memory
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, paulmck@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Sun, May 31, 2020 at 4:00 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'debug_monitors_init()' is only called via 'postcore_initcall'.
> It can be marked as __init to save a few bytes of memory.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/arm64/kernel/debug-monitors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seems OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
