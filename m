Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E164D294FEC
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Oct 2020 17:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502369AbgJUPX2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Oct 2020 11:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410083AbgJUPX1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Oct 2020 11:23:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CA3C0613CE
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Oct 2020 08:23:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id p15so3060670ljj.8
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Oct 2020 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s3e1JjsUo2rWbkuGSuidXfP58BXBPjf1jWv5q+e+0QQ=;
        b=Z6axDJLTptlywqtSv3CXF49wXx+VRsZrQ6NKJN+jQn1kNFhpKyEst0qmu3nlKxg9oe
         L+vtloFTH+zDfiqYyg6PnjGIWHpOKvNRsFuWnpv9o3HKi88gYcTrngVMyAHtDWTcXMp6
         LG3qsh8bTOCEWNmqEMpp7rw//brT4BFpfXAtJKSt95NRZDHU8Sun8bG6G7kQgQ7u3GqG
         dqrR0KzzRKV0wh3oxDYH2+75pEFY3403G6pHecWODMLG/mytzzwyqfLIzKAHA9mYrPND
         U2trPvkPL9g6P+Q/Q3X/aUkVZgrAmawZf6wVQex14E0BbwLu3mUY8Yx6vJFWq2JdXEkX
         6hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s3e1JjsUo2rWbkuGSuidXfP58BXBPjf1jWv5q+e+0QQ=;
        b=CJq58ewT4q3hxxsMRMNKgEDjg4/toaTh72HUbG3m5oharOb7qDlQMJuabivN7rOvsu
         2G9zkAOdQ7pR6V2qK9HKD8nNPN8cySPq80yg2+Rh/YBW/jvihrhORlYPVAmbOJe5B8PR
         QCohAiYVmnm0ePpn2AWZcmUKhxjk7uSROZyOUw5WC1+pYf7orXHYHyGwUH2jFgUyW5xC
         KmT3aa/cHux8ONivwqf70mVvTKC00VtqcL3iupISOw6e5cxdcR5NO0kVqLXD0W7PPUYg
         +rChr1Zom+972uMyZ7CgQLtbc5GBw27kw7j1YUtPsqlrHaVbfIng+Zt0sIK2PLGxCakX
         PiaA==
X-Gm-Message-State: AOAM532Ch88BjNs5cnK9YNM6T11ikwNhNCEhwPy+fnBjfWW9qKQEdKll
        lUjHZn6T33Jyn1b5znj2lfoztI0aUyqubTlUXVjf2Q==
X-Google-Smtp-Source: ABdhPJxHkodmSU3lnO9xHUP9D4Wv8Z9M0szOrgVLvd7FClutmER+Cp5/XZQzZ5RnKUqVs4qV7mb5woaEtBKBkI6axXU=
X-Received: by 2002:a05:651c:291:: with SMTP id b17mr1746305ljo.177.1603293805813;
 Wed, 21 Oct 2020 08:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201021112038.GC32041@suse.de> <20201021122532.GA30733@vingu-book>
 <20201021124700.GE32041@suse.de> <alpine.DEB.2.22.394.2010211452100.8475@hadrien>
 <20201021131827.GF32041@suse.de> <alpine.DEB.2.22.394.2010211522340.57356@hadrien>
 <20201021150800.GG32041@suse.de> <alpine.DEB.2.22.394.2010211714300.8475@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2010211714300.8475@hadrien>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 21 Oct 2020 17:23:14 +0200
Message-ID: <CAKfTPtAHx+B7rL8HZ=v7e+FNuanp9OLFvcwb+YGYxtmNqBavPw@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: check for idle core
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
        kernel-janitors@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Gilles Muller <Gilles.Muller@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 21 Oct 2020 at 17:18, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Wed, 21 Oct 2020, Mel Gorman wrote:
>
> > On Wed, Oct 21, 2020 at 03:24:48PM +0200, Julia Lawall wrote:
> > > > I worry it's overkill because prev is always used if it is idle even
> > > > if it is on a node remote to the waker. It cuts off the option of a
> > > > wakee moving to a CPU local to the waker which is not equivalent to the
> > > > original behaviour.
> > >
> > > But it is equal to the original behavior in the idle prev case if you go
> > > back to the runnable load average days...
> > >
> >
> > It is similar but it misses the sync treatment and sd->imbalance_pct part of
> > wake_affine_weight which has unpredictable consequences. The data
> > available is only on the fully utilised case.
>
> OK, what if my patch were:
>
> @@ -5800,6 +5800,9 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
>         if (sync && cpu_rq(this_cpu)->nr_running == 1)
>                 return this_cpu;
>
> +       if (!sync && available_idle_cpu(prev_cpu))
> +               return prev_cpu;
> +

this is not useful because when prev_cpu is idle, its runnable_avg was
null so the only
way for this_cpu to be selected by wake_affine_weight is to be null
too which is not really
possible when sync is set because sync is used to say, the running
task on this cpu
is about to sleep

>         return nr_cpumask_bits;
>  }
>
> The sd->imbalance_pct part would have previously been a multiplication by
> 0, so it doesn't need to be taken into account.
>
> julia
>
> >
> > > The problem seems impossible to solve, because there is no way to know by
> > > looking only at prev and this whether the thread would prefer to stay
> > > where it was or go to the waker.
> > >
> >
> > Yes, this is definitely true. Looking at prev_cpu and this_cpu is a
> > crude approximation and the path is heavily limited in terms of how
> > clever it can be.
> >
> > --
> > Mel Gorman
> > SUSE Labs
> >
