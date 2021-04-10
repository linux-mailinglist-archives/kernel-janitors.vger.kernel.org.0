Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE25B35B0B0
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Apr 2021 00:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhDJWS7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 10 Apr 2021 18:18:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232659AbhDJWS6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 18:18:58 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B07060FE6;
        Sat, 10 Apr 2021 22:18:43 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lVLw9-006l0U-GN; Sat, 10 Apr 2021 23:18:41 +0100
Date:   Sat, 10 Apr 2021 23:18:40 +0100
Message-ID: <8735vxg4vz.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, avagin@gmail.com,
        0x7f454c46@gmail.com, mark.rutland@arm.com, tglx@linutronix.de,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] arm64: vdso: correct definition of macro vdso_clocksource_ok
In-Reply-To: <CAOc6etaqPprFHidXwRy+wNWqDr9FXe2=dDN9H81ODHwXpbX5yA@mail.gmail.com>
References: <20210410181117.23967-1-eantoranz@gmail.com>
        <874kgeezc6.wl-maz@kernel.org>
        <CAOc6etaqPprFHidXwRy+wNWqDr9FXe2=dDN9H81ODHwXpbX5yA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: eantoranz@gmail.com, catalin.marinas@arm.com, will@kernel.org, avagin@gmail.com, 0x7f454c46@gmail.com, mark.rutland@arm.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 10 Apr 2021 20:58:22 +0100,
Edmundo Carmona Antoranz <eantoranz@gmail.com> wrote:
> 
> On Sat, Apr 10, 2021 at 1:03 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > Hi Edmundo,
> 
> Sup!
> 
> >
> >
> > No difference? Have you simply tried removing the macro and witness
> > the effect? If it made no difference, why have the macro at all then?
> 
> Oh, come on! so having the macro defined so that you can do things like
> 
> lib/vdso/gettimeofday.c:34:#ifndef vdso_clocksource_ok
> 
> counts as "a difference" to you? XD ok ok ... so, I have deleted
> "extended linux kernel C preprocessor knowledge" from my linkedin
> profile.

If you want to look cool on Linkedin, the C preprocessor really is the
wrong thing to boast about. Consider adding things like iron oxide,
which will definitely boost your visibility.

> I can safely assume that this is a big resounding NACK, right? :-D

Not necessarily a NAK, because I don't like doing that. But I find
this an unnecessarily change and a fairly pointless divergence from an
established practice. Others may agree with you.

But it was worth pointing out that "it actually makes no difference to
have the macro defined or not" wasn't quite the right thing to put in
the commit message.

>
> >
> > Also, run this, for example:
> >
> > git grep '^\#define' arch/arm64/include/asm/| awk '$2 == $3 { print }'
> >
> > Are you going to "fix" these too?
> >
> > Thanks,
> 
> Thank you for the lesson, man. Still have a lot of stuff to learn in
> front of me.

We all do.

	M.

-- 
Without deviation from the norm, progress is not possible.
