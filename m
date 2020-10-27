Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE0129AB1F
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Oct 2020 12:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899545AbgJ0Ls1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Oct 2020 07:48:27 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:38357 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899486AbgJ0Ls0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Oct 2020 07:48:26 -0400
Received: by mail-pl1-f174.google.com with SMTP id f21so620707plr.5
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Oct 2020 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UFoX/nPlMdfVA5ftTW+3xAKSzT05mQ8RbVahvp6lNY0=;
        b=qCyUwwqt7rpSBuYVKF4yqy7bF1pi3AV7jHWr1VCycFqyW3QNWqkoS0EOBuo2rkXwpm
         Py166u7NDG+jFS2hrFZccsCfo9UigarNhMBh7fp73DqvJrPCK6mVGDsA1+Y5VgI1X7JM
         XiWKzOifUlrhbUqqbT/G3iJ+75IWo752Ww5X1V7Zb5LYvzUxQKsTuJIfnkJWv2QUlL/Y
         XoEFMQe3OBHH8vprDnZUD0BrpOOBbJPanrFrw/NXmcGkswduyfi03rrhVYYOfMwS06qI
         bL6Wd7qrgRtXYHreqpHFJ5UXWHzQC0V8yPfkPYdvz7E8u/NHMjrlXrXVQehsP+BmFUDa
         y9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UFoX/nPlMdfVA5ftTW+3xAKSzT05mQ8RbVahvp6lNY0=;
        b=MuXPhYipksCvz/nzdVC3w8fJlm4g6DcYZw8B5e1z1ucdDUwcUpRUTUQVFsD6j+H0bA
         2KvHE01kP1Jp7jVx/XH75vPObXEIDaVdfEvMaECJOgTUvDUY7fWJmMdbuHf3xkI8DJnP
         uGXXQppGkQBW5GNrFTE2IILgdNx/ZcEFI2VtwBkKczex3zW5Gw/x2DxVw+ciSt0gtoIZ
         Vid2TdB/2Pu1agnHIXDpsmHP3YCCt7nlE60F2+pnw9WQZ8zFuFsl9y3wG8l53foFs6qW
         irCsN4eH6elvTsMYOXIrt04lWt6IY6EqKWg3NFpd7dBP0D7J3BOSVMAI3VF5plBfbXgd
         lRIw==
X-Gm-Message-State: AOAM533aGlWJPwcLmensxK7bXuMU4W6zJgxPcpPG2fLGV/ykbv/Fmz/F
        NvwE4H0vyHdMppD8ds2Nez65Bg==
X-Google-Smtp-Source: ABdhPJx+Rt0FrtY6sTkGXCX1xWUhXXmPLg/IT6YgUlkLQi0vVWpxEgVrwjp7rdpD1IamJ+344Bfq5g==
X-Received: by 2002:a17:90a:e697:: with SMTP id s23mr1627362pjy.16.1603799305891;
        Tue, 27 Oct 2020 04:48:25 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id f5sm1867196pgi.86.2020.10.27.04.48.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 04:48:24 -0700 (PDT)
Date:   Tue, 27 Oct 2020 17:18:22 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Julia Lawall <julia.lawall@inria.fr>,
        Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
        kernel-janitors@vger.kernel.org,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-kernel@vger.kernel.org,
        Gilles Muller <Gilles.Muller@inria.fr>,
        srinivas.pandruvada@linux.intel.com
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-ID: <20201027114822.vsh7vpwfnh2tvmpz@vireshk-i7>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022071145.GM2628@hirez.programming.kicks-ass.net>
 <20201022104703.nw45dwor6wfn4ity@vireshk-i7>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <20201027111133.ajlxn5lbnfeocfgb@e107158-lin>
 <jhjlffrq58y.mognet@arm.com>
 <20201027114214.irsgdlfvyo46jpww@e107158-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027114214.irsgdlfvyo46jpww@e107158-lin>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27-10-20, 11:42, Qais Yousef wrote:
> On 10/27/20 11:26, Valentin Schneider wrote:
> > 
> > On 27/10/20 11:11, Qais Yousef wrote:
> > > On 10/22/20 14:02, Peter Zijlstra wrote:
> > >> However I do want to retire ondemand, conservative and also very much
> > >> intel_pstate/active mode. I also have very little sympathy for
> > >> userspace.
> > >
> > > Userspace is useful for testing and sanity checking. Not sure if people use it
> > > to measure voltage/current at each frequency to generate
> > > dynamic-power-coefficient for their platform. Lukasz, Dietmar?
> > >
> > 
> > It's valuable even just for cpufreq sanity checking - we have that test
> > that goes through increasing frequencies and asserts the work done is
> > monotonically increasing. This has been quite useful in the past to detect
> > broken bits.
> > 
> > That *should* still be totally doable with any other governor by using the
> > scaling_{min, max}_freq sysfs interface.
> 
> True. This effectively makes every governor a potential user space governor.
> 
> /me not sure to be happy or grumpy about it

Userspace governor should be kept as is, it is very effective to get
unnecessary governor code out of the path when testing basic
functioning of the hardware/driver. It is quite useful when things
don't work as expected.

-- 
viresh
