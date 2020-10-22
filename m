Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973CB2961F0
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Oct 2020 17:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368830AbgJVPzk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Oct 2020 11:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S368828AbgJVPzk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Oct 2020 11:55:40 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF34C0613D2
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Oct 2020 08:55:38 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d24so2877430lfa.8
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Oct 2020 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B94icV4D08fxyuirqbKeFO0+DC+wlmdI2voSS4HfZkU=;
        b=a2nKAl/sqxzLJINGxnAcG79JnKWGYCmMmuWi6RLsPwlt8nfkLwLdwSCvUnGbYmvpDc
         MTtsMtfwNkk61IAUxdkGoxqSSE4mfXosqmIbjbqIXbhlJ64j8dtDUqPdL9MX5a9Ax0HD
         Rv2e55ThnRf8lCBFvLT6PAhunCxPg1WKog1urbAK+HFv0/226fGSqAnLvRfPTBuXbjAq
         6KpnS7uicUbF8HKROESoEfa8ju/MtMe9z/nflL8aJU3e58ZP34DX2DMtboHRKvD82NDP
         PonzLbcWohXeAEbjL0MWPvuESfQxC7FQGhnM2wNnX1xndf1k+ASUEZQfYlDyMKoSRch2
         rZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B94icV4D08fxyuirqbKeFO0+DC+wlmdI2voSS4HfZkU=;
        b=iWK5gYqK1ERVU+8TSrUBWbE4CPeJ2fhebwbUtonrkHmz0IJzXyBJfELmV0LACtYSN8
         ubAXe/6ette8WHnPOMnv0Ma7cQLyQWvXNVaxS8SYyvJ6mznrtK32tfBxqYCHxR3DQmo4
         1pnPULSYs3OFixr5sbv8ONmmBjxmhA2aiXuHtQ8tVNGEQl54Am0JogpKzXgx5gIwIJ/o
         ri15U+KgXLQ7UzFLs7AX+AIScee0rXNzE9Ojnyc0vcqeGvGH85GGUzohjgbDxLjCjjQH
         HCGmqUTB1/S34isLuzk9FpzZo0jDHx+M5SCYzqdaTPU4ocr9iuO0wyWOqFkikotJ2C4D
         NCvg==
X-Gm-Message-State: AOAM531Yzjthzn4GxI7SYf4veGUbOyvP6gHqEQRoz5oB8EGFV+/qp0zs
        vboJ4ERmsdYbYSQ4IQHVk1jQCNCyU6wuK9hDO8ntXQ==
X-Google-Smtp-Source: ABdhPJxjTfQ97C9WLxpurCzxc+miwHEpL6de8vQZrEHqh3ZUhywXAETlIEZ+DuxXsY3QpVxYIRruL9ABkcGz1M0Z5RU=
X-Received: by 2002:a05:6512:2090:: with SMTP id t16mr979176lfr.83.1603382136420;
 Thu, 22 Oct 2020 08:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher> <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher> <20201022122949.GW2628@hirez.programming.kicks-ass.net>
 <c232b2.c086afce.17550fc4644@lechevalier.se>
In-Reply-To: <c232b2.c086afce.17550fc4644@lechevalier.se>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Thu, 22 Oct 2020 17:55:24 +0200
Message-ID: <CAKfTPtDUMdxWSKQgyjPCn+D-zYzpfgMEy0WYGAQzhcr1jnAX7w@mail.gmail.com>
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
To:     A L <mail@lechevalier.se>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Julia Lawall <julia.lawall@inria.fr>,
        Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
        kernel-janitors@vger.kernel.org,
        Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Gilles Muller <Gilles.Muller@inria.fr>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Len Brown <len.brown@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 22 Oct 2020 at 17:45, A L <mail@lechevalier.se> wrote:
>
>
>
> ---- From: Peter Zijlstra <peterz@infradead.org> -- Sent: 2020-10-22 - 14:29 ----
>
> > On Thu, Oct 22, 2020 at 02:19:29PM +0200, Rafael J. Wysocki wrote:
> >> > However I do want to retire ondemand, conservative and also very much
> >> > intel_pstate/active mode.
> >>
> >> I agree in general, but IMO it would not be prudent to do that without making
> >> schedutil provide the same level of performance in all of the relevant use
> >> cases.
> >
> > Agreed; I though to have understood we were there already.
>
> Hi,
>
>
> Currently schedutil does not populate all stats like ondemand does, which can be a problem for some monitoring software.
>
> On my AMD 3000G CPU with kernel-5.9.1:
>
>
> grep. /sys/devices/system/cpu/cpufreq/policy0/stats/*
>
> With ondemand:
> time_in_state:3900000 145179
> time_in_state:1600000 9588482
> total_trans:177565
> trans_table:   From  :    To
> trans_table:         :   3900000   1600000
> trans_table:  3900000:         0     88783
> trans_table:  1600000:     88782         0
>
> With schedutil only two file exists:
> reset:<empty>
> total_trans:216609
>
>
> I'd really like to have these stats populated with schedutil, if that's possible.

Your problem might have been fixed with
commit 96f60cddf7a1 ("cpufreq: stats: Enable stats for fast-switch as well")


>
> Thanks.
>
