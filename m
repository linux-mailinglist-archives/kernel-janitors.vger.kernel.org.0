Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F69129A2E5
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Oct 2020 04:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410160AbgJ0DBK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 23:01:10 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:39859 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410165AbgJ0DBJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 23:01:09 -0400
Received: by mail-pg1-f181.google.com with SMTP id o7so7201151pgv.6
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Oct 2020 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IsOYX4+IMgZ8Q0J4+yeY1Ll/vwg/3Aaa1rF+y/oAfEM=;
        b=Xc8v4nuuTGnMpLDnwNWJAGRAYADx4FdZr9teVWPLOxOoF8L3TZLe/lULZuXwO5qTl2
         UKDDN5Zyc7827L+GiNa/4Eeczs6WBG+M2ZRcFr5mRFw+sUK4vAP/qkAqiybrdSHcTRKS
         uIp/0ZizoXq7UFXvXYBW1Zju90LyzE/oYOMF12n8lM8cHXqUHb90K+JHEZ6y5JgUy0bp
         fe5bX5WU+NpvFLIe+Yj+bd5wq3eWksiIp4WW0Xp0m4lMBuT0TR7b6IlIygiigOuaGLrs
         yBxvHgiO78JQ8OpAGCWgGCobTUjMjc9isWg/BE380suaS/DjioAmGHuu4EW5p04l9aOj
         hBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IsOYX4+IMgZ8Q0J4+yeY1Ll/vwg/3Aaa1rF+y/oAfEM=;
        b=uI6HydEjdmTvss35tusRK39arQUwrod3+5q4qZQH5ZX93sSKM7YY7gLs/LxulYZGlT
         dT8B3w+G/Z7VGPA/3PFzkLrdiFdbz/q5PbnT5ICB0unYaiHXSH+xq56zztmP88agkG8a
         5hakx3UjEaB3Hxt/WLy8ZUEgJYXecEQgD6VXvpw4oXqPHq/876vgLRly4QWyghPXFueS
         SnK1KN5KYZv8Spph/uh4UIi96GOw06cyuws0L9odyIU84xrpPHyMLDFBWUhlaOXp3PAP
         skymWUxAnS9/lB2Zf5yOk4hfbyQI77MQg4EiHgk9/TIAsFFdzP00j6VrTsNvPLHWXeKW
         zLpA==
X-Gm-Message-State: AOAM530eVCajp4gICTas7HMx/ZgLuXs2nRVDgBHh6IifyJiUQQrBY8Un
        um6fLvUWDd8GsH4Ojf9nS5q35w==
X-Google-Smtp-Source: ABdhPJxEFfeSAqJ90cUQO42tv5frhgMoEDuwOEgI1aIKK+gtKf+SGe1pacesaW5PGjjXpV5p0puS1Q==
X-Received: by 2002:a62:6044:0:b029:151:1a04:895 with SMTP id u65-20020a6260440000b02901511a040895mr165226pfb.34.1603767667543;
        Mon, 26 Oct 2020 20:01:07 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id jy19sm147632pjb.9.2020.10.26.20.01.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 20:01:06 -0700 (PDT)
Date:   Tue, 27 Oct 2020 08:31:04 +0530
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
        srinivas.pandruvada@linux.intel.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH] sched/fair: check for idle core
Message-ID: <20201027030104.fkklavfx5igdy62p@vireshk-i7>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201023061246.irzbrl62baoawmqv@vireshk-i7>
 <2251006.PXaUfaNY4o@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2251006.PXaUfaNY4o@kreacher>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23-10-20, 17:06, Rafael J. Wysocki wrote:
> On Friday, October 23, 2020 8:12:46 AM CEST Viresh Kumar wrote:
> > On 22-10-20, 13:45, Rafael J. Wysocki wrote:
> > > On Thursday, October 22, 2020 12:47:03 PM CEST Viresh Kumar wrote:
> > > > And I am not really sure why we always wanted this backup performance
> > > > governor to be there unless the said governors are built as module.
> > > 
> > > Apparently, some old drivers had problems with switching frequencies fast enough
> > > for ondemand to be used with them and the fallback was for those cases.  AFAICS.
> > 
> > Do we still need this ?
> 
> For the reasonably modern hardware, I don't think so.
> 
> > Or better ask those platforms to individually
> > enable both of them.
> 
> Bu who knows what they are? :-)

I was planning to break them and let them complain :)

-- 
viresh
