Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F5F296953
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Oct 2020 07:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897176AbgJWFLQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Oct 2020 01:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896922AbgJWFLQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Oct 2020 01:11:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2581DC0613D4
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Oct 2020 22:11:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y14so198322pfp.13
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Oct 2020 22:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bhDFTk2Ai9IvHYceetl+B1zPhbW6KMdcdI29Sg0Eo+M=;
        b=YcYR9zUcIUB4QIGYTdL3C7cdtzm1L9GbyIWrm9ZWiQ8goix/zhDkSZggOL5RqjkO/P
         wXfQzC5Dp20D6f1zcduUGvEar6jNSMUpS2LFjca49huhilc1uibA3ZlKnN3tNTMaE62T
         wzrkCCI34HrsTIFT3zj7VDqJt7Q+PO+P8zBixWe+RcojIdUkM5r9XNvLBpnesm9fO5Bz
         xtcBWcRNBXw6vEKO0VlENJYQvgIOy+qJS4vdgkO/6oDJbyCrCMTGs95Q3yiDuB0Zw8Hj
         2LV2FUftIvhnhhmd8sg7GuY9hj9ypsS0qDzjiDlru6xPdcERrBgQhonVTIGUJu5fg0nQ
         CpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bhDFTk2Ai9IvHYceetl+B1zPhbW6KMdcdI29Sg0Eo+M=;
        b=Tj296GhiSc27qL4HxFyCShOns1XMbDyqp7KUizDCogXakYAoHrU8kZOa54bloadj41
         jpqhJfr2KdAXObG3EczXMMEhRYRNHdKsAaGgfOQs3yNwAwCWCulRIaXvO6mtKUQUy0Im
         uN1k7CXsmS48I8Z5XpxfT9X90jkcx+arTExPDaOmj0JBYGF+z2zUqszV7U1mci4rcCin
         bJcdkdQScnPYEgBRIJ2EegdFpnlQDgpGrjnbKZjlN1OT3/UuG2MaS2aj+I/ywvk49nUJ
         hFfoEBMjDxiCE6TjlxE+8Ihfd7PWzIwwk75q1P3WeUI6yE6sdlcHA/J43YMVhJ35homh
         wvsw==
X-Gm-Message-State: AOAM533mh+OHaKBOKraDhsMNafphjOJ8o2UcZ7/UKVmw3pP29k5dqUjt
        u9maeqMF3MNflfOvo7gIgeje7A==
X-Google-Smtp-Source: ABdhPJyN98CytOuNDU/P9oEgDgKuEou0RaGFmC2Be4QHtDolgE6CQO010qLoOYGeIeKGV40ISqebMw==
X-Received: by 2002:a62:be04:0:b029:160:6c5:d7fe with SMTP id l4-20020a62be040000b029016006c5d7femr469851pff.21.1603429875495;
        Thu, 22 Oct 2020 22:11:15 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id y27sm499082pfr.122.2020.10.22.22.11.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 22:11:13 -0700 (PDT)
Date:   Fri, 23 Oct 2020 10:41:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     A L <mail@lechevalier.se>, Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
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
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-ID: <20201023051112.7p4qgr2opyoyeep4@vireshk-i7>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher>
 <20201022122949.GW2628@hirez.programming.kicks-ass.net>
 <c232b2.c086afce.17550fc4644@lechevalier.se>
 <CAKfTPtDUMdxWSKQgyjPCn+D-zYzpfgMEy0WYGAQzhcr1jnAX7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDUMdxWSKQgyjPCn+D-zYzpfgMEy0WYGAQzhcr1jnAX7w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22-10-20, 17:55, Vincent Guittot wrote:
> On Thu, 22 Oct 2020 at 17:45, A L <mail@lechevalier.se> wrote:
> >
> >
> >
> > ---- From: Peter Zijlstra <peterz@infradead.org> -- Sent: 2020-10-22 - 14:29 ----
> >
> > > On Thu, Oct 22, 2020 at 02:19:29PM +0200, Rafael J. Wysocki wrote:
> > >> > However I do want to retire ondemand, conservative and also very much
> > >> > intel_pstate/active mode.
> > >>
> > >> I agree in general, but IMO it would not be prudent to do that without making
> > >> schedutil provide the same level of performance in all of the relevant use
> > >> cases.
> > >
> > > Agreed; I though to have understood we were there already.
> >
> > Hi,
> >
> >
> > Currently schedutil does not populate all stats like ondemand does, which can be a problem for some monitoring software.
> >
> > On my AMD 3000G CPU with kernel-5.9.1:
> >
> >
> > grep. /sys/devices/system/cpu/cpufreq/policy0/stats/*
> >
> > With ondemand:
> > time_in_state:3900000 145179
> > time_in_state:1600000 9588482
> > total_trans:177565
> > trans_table:   From  :    To
> > trans_table:         :   3900000   1600000
> > trans_table:  3900000:         0     88783
> > trans_table:  1600000:     88782         0
> >
> > With schedutil only two file exists:
> > reset:<empty>
> > total_trans:216609
> >
> >
> > I'd really like to have these stats populated with schedutil, if that's possible.
> 
> Your problem might have been fixed with
> commit 96f60cddf7a1 ("cpufreq: stats: Enable stats for fast-switch as well")

Thanks Vincent. Right, I have already fixed that for everyone.

-- 
viresh
