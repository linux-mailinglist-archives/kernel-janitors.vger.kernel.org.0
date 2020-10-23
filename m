Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B5A296992
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Oct 2020 08:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372259AbgJWGMv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Oct 2020 02:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898360AbgJWGMu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Oct 2020 02:12:50 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5239CC0613CE
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Oct 2020 23:12:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w21so328410pfc.7
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Oct 2020 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sEILgJLNi06NCo6epaYREQDcaIzCOIdwa2hMmhI70Jg=;
        b=iEqMXrLl0RL9xxIe+yfy28ibTGW9XVZWczPvCKUllYRfiEFmJPM2anznMKLapDG9GX
         h7fnY0QO9J39RQvjjk6GD2akI/wjl1Mypvlg3BnfAVpyz9zhgpfuAQTjAXsBtCG5Exa5
         lxczUH9ovOtGzrFI/jP4wdP8IYbl1WAsqECR1KiSM7OSkr/+q8/tTjMMF2R5lWvKiINW
         SAfOCr02zbJAmeQJhWNSACGYQwgOsAk3WxHmdTiN5sumdBi8BI41NGlRqv1gibcDhA/7
         tGQ/GqL5zqisZz6Doa8Q/FVduwMTQPnLFWR+Rm5Cox9874x7+V4mYixHU/h1T3TOGmn5
         HN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sEILgJLNi06NCo6epaYREQDcaIzCOIdwa2hMmhI70Jg=;
        b=AuBGCbGJEpkWvkK3RwUrZPgUvTwOqKaXHVQjEVl1A8p61iWDxw0ca1bua+e3lBxFiE
         sJc8FoIumbslifAPN6as45jjL1GI3cauD+B4h7A88hHAIc97G9ZAG4mUoXOpOIGOTi0i
         9KJGdTvwCnrxSLEoIgGNP8AlgYstxfHFX0aCWqioeyB+DpoPebHZyyk9jOoepAifF/tu
         kXz4od+08GJVZxjNWaElvyANIOf0/ps8UcdnEdVadjgCtlA9DTKmmHQ6FIpfImYrNCjp
         PksQRO5exeQTDmSei98nMS/oL6VF5L54riNEZypRCRQeN0Fx3WWspPIUWt2sn2rzdJUT
         EcsQ==
X-Gm-Message-State: AOAM532rcv1iJmkmEvTMlPihLt+IUp879yi8eBMQiAMuhJ3wd82Tv5pn
        X3w90b03qqftUa4z3+XjpkFWr2GlgD8VWg==
X-Google-Smtp-Source: ABdhPJxwrBrDCshuFRMlZZPQRHvFk4BrZKTWyVBbDUgWGljRIN46qOVADLDi8JM3k8vZHA67hjjKQw==
X-Received: by 2002:a63:8f5d:: with SMTP id r29mr840712pgn.18.1603433568888;
        Thu, 22 Oct 2020 23:12:48 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id t15sm743131pjy.33.2020.10.22.23.12.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 23:12:48 -0700 (PDT)
Date:   Fri, 23 Oct 2020 11:42:46 +0530
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
        srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH] sched/fair: check for idle core
Message-ID: <20201023061246.irzbrl62baoawmqv@vireshk-i7>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022071145.GM2628@hirez.programming.kicks-ass.net>
 <20201022104703.nw45dwor6wfn4ity@vireshk-i7>
 <34115486.YmRjPRKJaA@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34115486.YmRjPRKJaA@kreacher>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22-10-20, 13:45, Rafael J. Wysocki wrote:
> On Thursday, October 22, 2020 12:47:03 PM CEST Viresh Kumar wrote:
> > And I am not really sure why we always wanted this backup performance
> > governor to be there unless the said governors are built as module.
> 
> Apparently, some old drivers had problems with switching frequencies fast enough
> for ondemand to be used with them and the fallback was for those cases.  AFAICS.

Do we still need this ? Or better ask those platforms to individually
enable both of them.

-- 
viresh
