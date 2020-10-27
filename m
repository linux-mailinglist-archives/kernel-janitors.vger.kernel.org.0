Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872C629A2E9
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Oct 2020 04:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410472AbgJ0DBe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 23:01:34 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40962 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410386AbgJ0DBd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 23:01:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id g12so6403955pgm.8
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Oct 2020 20:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XSrY80pt2g5cE2EaeKDNU0F8FtUDX6skKgTjuPhBQo8=;
        b=EpawPRk8ufiF8LS40RRwv8nZACvxn2yJRy+ddk3QFVkKIZ+FQquEw4DTjhcpAWSLM+
         0aLw4U9seTWYgu65qjq66A72O6JROPTAkkJtGpL5yWRbXDboKwBgLC1GLc55SZgkLBhO
         l4+kt8bfxZ0SLoA3NPFHhBsT4pxMbn9O3APk3J0tyj4E4zyw0DDeraz5yTE5IZ2ZadQ6
         uLx8YpFbFSDrfQZCKfHTYt+q+fftnqEw2Vh3fNZKUx+zvIe5aw+Ee1aEVQpU0V06qtRQ
         NNN/klOg3WB0atDm4ipcRA6P2QGWFRsRapQU8WaIYAs5WM0DtBqYaydzdC88WmwfyvWH
         hoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XSrY80pt2g5cE2EaeKDNU0F8FtUDX6skKgTjuPhBQo8=;
        b=g3QpmgUDDFicMQcBNwTPqdMtCyOvKbHvlVRgerNgbhdQRNUoLgxiozcttuPdxpOU5Q
         jJbFIyV/bpzaNzr8FcRrI5MavZOPupJ/SfyZTpdJSdpiE5+y2daOdpPZwWoRHbjlKI1e
         sq/0TFNIcEk77hbtpjuZmSWdW+ECx1omqbCpZdXjHtjzGQ9/xb2w2uO2NFnFhbpblEcM
         +WplL6fogmD7WyY9HPQplSaSQw5lqi+2LKleimoNsAC8Ems3Ix1V4iblEWtjfZO4T/Dk
         ErTC7LSVabYyjM0H09eMjkV/1GfCzzOkdeTlajR40L2QQ2LdNfNvKrxrmubRe7xnqieB
         dEgQ==
X-Gm-Message-State: AOAM533MhVBBPd3EAHJ/7uCPeiZ2t2mB00KfAaDXcH8r9E5R+TZ82x4x
        P3Y5sK/8QwrwXiJtM3srS6FwUg==
X-Google-Smtp-Source: ABdhPJyje3W7I1k4Yva4JDK63t3Cr2mJjNBzMqLcE/zbiyucpL9umftouCQpE7/nmXR7iW5OWk0uZA==
X-Received: by 2002:a65:4c41:: with SMTP id l1mr29023pgr.243.1603767693085;
        Mon, 26 Oct 2020 20:01:33 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id k77sm153828pfd.99.2020.10.26.20.01.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 20:01:32 -0700 (PDT)
Date:   Tue, 27 Oct 2020 08:31:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
        Valentin Schneider <valentin.schneider@arm.com>,
        Gilles Muller <Gilles.Muller@inria.fr>,
        srinivas.pandruvada@linux.intel.com,
        Linux PM <linux-pm@vger.kernel.org>,
        Len Brown <len.brown@intel.com>
Subject: Re: [PATCH v2] cpufreq: Avoid configuring old governors as default
 with intel_pstate
Message-ID: <20201027030130.uz2vl77dj7ii7gfv@vireshk-i7>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <8312288.dAKoTdFk2S@kreacher>
 <9382251.a2nkXps1mP@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9382251.a2nkXps1mP@kreacher>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23-10-20, 17:15, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Commit 33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by
> default without HWP") was meant to cause intel_pstate to be used
> in the passive mode with the schedutil governor on top of it, but
> it missed the case in which either "ondemand" or "conservative"
> was selected as the default governor in the existing kernel config,
> in which case the previous old governor configuration would be used,
> causing the default legacy governor to be used on top of intel_pstate
> instead of schedutil.
> 
> Address this by preventing "ondemand" and "conservative" from being
> configured as the default cpufreq governor in the case when schedutil
> is the default choice for the default governor setting.
> 
> [Note that the default cpufreq governor can still be set via the
>  kernel command line if need be and that choice is not limited,
>  so if anyone really wants to use one of the legacy governors by
>  default, it can be achieved this way.]
> 
> Fixes: 33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by default without HWP")
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Cc: 5.8+ <stable@vger.kernel.org> # 5.8+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
> 
> The v2 addresses a review comment from Viresh regarding of the expression format
> and adds a missing Reported-by for Julia.
> 
> ---
>  drivers/cpufreq/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
