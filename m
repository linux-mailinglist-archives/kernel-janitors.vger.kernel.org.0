Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD67D144A
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 18:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731083AbfJIQlO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 12:41:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41860 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731417AbfJIQlO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 12:41:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so1960014pfh.8
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4KCOuyU/ywH5UdEeKKy1ZD5cSa0qM6JRtRuTi6ZEGfg=;
        b=KdRyUgsnV+XebI3lT10g3MSaM0BW6c17+YU4pUx+2eA+C9am1YEdku6d6tBGCdXm2c
         W04Hb/MWT6rZjMR+dwzmQq1sDhw8PjMnfxOk6EG4alrLHwtojAXHHcvd1/2vZaNj1ikx
         4lIXwa8qgSRdy9uDvik5vjDrWjfTTdwTGAmkqU1AGTC4I3a1alWEbZTXvqYuNB7MgXFh
         RyMjomorAY5pHNMW1A29VDRSLitZHRhdG0Fz7giZTJXeaiLPM8EHhjTh7a9sVdAkXwni
         +9xyhywhTJsFJEz/Ely4TDIoHVC0Us0NGQszz6LqNiaUU/Ulh03mZCkJGJkmBMElv0DZ
         l6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4KCOuyU/ywH5UdEeKKy1ZD5cSa0qM6JRtRuTi6ZEGfg=;
        b=ZJA8AcVsN3DyhEEA/Spgzl1ULMyDoIK2ySz8Sn6t4Z+WB0b2ZZU91beIlAvqd+fQGU
         HDcei6NDZ86cu8m4C4Dxpb6rggUUSHiAeAmNM9fifcymITAuLfTFDbt+RA9iQEJA6SLV
         HfJD9oo6+TRE9SnGTwL+WgTwLlwEs5DYYka8MyhGnEMWH5cWap+TVmxWUSy4ytIIu0xk
         Y/uMt4WGCBvfYdCX1TYELXkpwQN4uf7dUh81X/b4mECVe3S1kfnXH8hoMGhYV+ZG8sRR
         kVnzMrgcpH3VKVwFxamCuDGrkJK9w2D9vwurTK8VgzIYVLcEchjTwOBM8Vk1c6MV2WDt
         rwXQ==
X-Gm-Message-State: APjAAAV7cySbvywl/O2ULsq3j5oTJDpU9waCIozyVe2RvDjt8gX9mjPY
        rWlJPE6Mjegk3LzSwzdy2Y+TaddQatdETM6trzIH7IEQ
X-Google-Smtp-Source: APXvYqxxtqdLlqdJ+oeX5eyUnxCGbj6bA/T+ZV6iNXBuLdhXsG5XJ83Ds5MVom+4xZBSMAzFV1PS/jlj78IrXr5cH9Y=
X-Received: by 2002:a65:464b:: with SMTP id k11mr5449394pgr.263.1570639271341;
 Wed, 09 Oct 2019 09:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com> <20191009122735.17415f9c@gandalf.local.home>
In-Reply-To: <20191009122735.17415f9c@gandalf.local.home>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 9 Oct 2019 09:40:59 -0700
Message-ID: <CAKwvOdkvgeHnQ_SyR7QUqpsmtMPRe1SCJ_XJLQYv-gvLB6rbLg@mail.gmail.com>
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joe Perches <joe@perches.com>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 9, 2019 at 9:27 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 9 Oct 2019 09:13:17 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > On Wed, Oct 9, 2019 at 8:09 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > I'm curious. How many warnings showed up when you applied this patch?
> >
> > I got zero for x86_64 and arm64 defconfig builds of linux-next with
> > this applied.  Hopefully that's not an argument against the more
> > liberal application of it?  I view __must_check as a good thing, and
> > encourage its application, unless someone can show that a certain
> > function would be useful to call without it.
>
> Not at all, I was just curious, because I would have expected patches
> to fix possible bugs with it.

Ah, granted, I was surprised, too.  Maybe would be helpful to mention
that in the commit message.
-- 
Thanks,
~Nick Desaulniers
