Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51FA2ADE80
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Nov 2020 19:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731260AbgKJSic (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Nov 2020 13:38:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:36722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgKJSi2 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Nov 2020 13:38:28 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2E76206F1;
        Tue, 10 Nov 2020 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605033506;
        bh=o1BESqzm8fBdi/X16H0n+RhuelYV3JhYq2tyea7TYx0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pyg1U9fcoUMM/AOVDy2cg0BRr2EGQN+i3y+JBKB0VE4LOzs6M0VoPHU47Xtsqt8CB
         PmvuTUxTkX8dgGVF6UACpcNHL3Qn9crtbBlCXI5+FgtLWid5pQLsumuw/TuQCs4Uvx
         wqDKP/HcDNd5bnd3/pjHETGyP3GkjaXJiiJES4JU=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 4B99E35226CB; Tue, 10 Nov 2020 10:38:26 -0800 (PST)
Date:   Tue, 10 Nov 2020 10:38:26 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        Qian Cai <cai@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH][next] cpumask: allocate enough space for string and
 trailing '\0' char
Message-ID: <20201110183826.GV3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201109130447.2080491-1-colin.king@canonical.com>
 <737d5be9eb5af55b1a61bd8bfb49b1829a3ff916.camel@redhat.com>
 <e0458a3f-7635-bc80-9496-731bdfceed0d@windriver.com>
 <20201110152437.GS3249@paulmck-ThinkPad-P72>
 <6050d075-52cc-d1b8-51c4-4d0dac62a42e@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6050d075-52cc-d1b8-51c4-4d0dac62a42e@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 10, 2020 at 03:34:05PM +0000, Colin Ian King wrote:
> On 10/11/2020 15:24, Paul E. McKenney wrote:
> > On Mon, Nov 09, 2020 at 11:57:15PM -0500, Paul Gortmaker wrote:
> >>
> >>
> >> On 2020-11-09 8:07 p.m., Qian Cai wrote:
> >>> On Mon, 2020-11-09 at 13:04 +0000, Colin King wrote:
> >>>> From: Colin Ian King <colin.king@canonical.com>
> >>>>
> >>>> Currently the allocation of cpulist is based on the length of buf but does
> >>>> not include the addition end of string '\0' terminator. Static analysis is
> >>>> reporting this as a potential out-of-bounds access on cpulist. Fix this by
> >>>> allocating enough space for the additional '\0' terminator.
> >>>>
> >>>> Addresses-Coverity: ("Out-of-bounds access")
> >>>> Fixes: 65987e67f7ff ("cpumask: add "last" alias for cpu list specifications")
> >>>
> >>> Yeah, this bad commit also introduced KASAN errors everywhere and then will
> >>> disable lockdep that makes our linux-next CI miserable. Confirmed that this
> >>> patch will fix it.
> >>
> >> I appreciate the reports reminding me why I hate touching string handling.
> >>
> >> But let us not lose sight of why linux-next exists.  We want to
> >> encourage code to appear there as a sounding board before it goes
> >> mainline, so we can fix things and not pollute mainline git history
> >> with those trivialities.
> >>
> >> If you've decided to internalize linux-next as part of your CI, then
> >> great, but do note that does not elevate linux-next to some pristine
> >> status for the world at large.  That only means you have to watch more
> >> closely what is going on.
> >>
> >> If you want to declare linux-next unbreakable -- well that would scare
> >> away others to get the multi-arch or multi-config coverage that they may
> >> not be able to do themselves.  We are not going to do that.
> >>
> >> I have (hopefully) fixed the "bad commit" in v2 -- as part of the
> >> implicit linux-next rule "you broke it, you better fix it ASAP".
> >>
> >> But "bad" and "miserable" can be things that might scare people off of
> >> making use of linux-next for what it is meant to be for.  And I am not
> >> OK with that.
> > 
> > They would need to use much stronger language to scare me off.  That said,
> > what on earth is the point of running tests if they do not from time to
> > time find bugs?  ;-)
> 
> For me, part of the QA process is statically analyzing linux-next to
> catch bugs before they land in linux. I think other testing is equally
> worth while as catching bugs early saves time and money.

All kidding aside, the fact that this appeared in -next was due to a
mistake on my part, namely failing to push the changes before starting
the test.  Please accept my apologies, and I will continue to do my
best to avoid this sort of thing.

							Thanx, Paul

> Colin
> 
> > 
> >> Thanks,
> >> Paul.
> >> --
> >>
> >>>
> >>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>>> ---
> >>>>   lib/cpumask.c | 2 +-
> >>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/lib/cpumask.c b/lib/cpumask.c
> >>>> index 34ecb3005941..cb8a3ef0e73e 100644
> >>>> --- a/lib/cpumask.c
> >>>> +++ b/lib/cpumask.c
> >>>> @@ -185,7 +185,7 @@ int __ref cpulist_parse(const char *buf, struct cpumask
> >>>> *dstp)
> >>>>   {
> >>>>   	int r;
> >>>>   	char *cpulist, last_cpu[5];	/* NR_CPUS <= 9999 */
> >>>> -	size_t len = strlen(buf);
> >>>> +	size_t len = strlen(buf) + 1;
> >>>>   	bool early = !slab_is_available();
> >>>>   	if (!strcmp(buf, "all")) {
> >>>
> 
