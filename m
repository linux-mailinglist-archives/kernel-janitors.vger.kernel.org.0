Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C07583C0C
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Jul 2022 12:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbiG1Kaf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Jul 2022 06:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbiG1Kaf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jul 2022 06:30:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AE7643C;
        Thu, 28 Jul 2022 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=U3nI+Dk03TsFhKliasBzCqNdnQznxo+muaRKiNshSuY=; b=DoknfXSTWH6Zj0VygdQvr0QmiU
        n3MBGvZvhPEFAiDYNcsplITEjAUg8GjB0EjIdovXr9DMAWKceqzB1X00wpuAfOPT0rd14gfho5lej
        Cea7D/u12vnurMUcIqiJUIVdZ7fxAY2iHbUkSlC4ghl7mLfwL+46das3fo0EemF3c0MCYQaDOoWE/
        Gpdw7ThlFbzXOJYPg1N8thEeDwUQ/0eOakgSxbfT1lF340nCCBAc1+Oo9XL+StraJ1EeOTvqvwj+S
        w2bhehT6r2x+aMyEKKmGn2cive6opClxIfPNulf55c6iZfVzSev7RjV84AJaerI1G3Na5uq2NqbC6
        C7gY0xbA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oH0mM-003kPI-If; Thu, 28 Jul 2022 10:30:06 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 09FD998040A; Thu, 28 Jul 2022 12:30:05 +0200 (CEST)
Date:   Thu, 28 Jul 2022 12:30:04 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yu Zhe <yuzhe@nfschina.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        liqiong@nfschina.com
Subject: Re: [PATCH] x86/aperfmperf: use time_is_before_jiffies(a + b) to
 replace "jiffies - a > b"
Message-ID: <YuJlLK4x9aUuqHQZ@worktop.programming.kicks-ass.net>
References: <20220727031405.26892-1-yuzhe@nfschina.com>
 <YuFhIgsUgNJ+o9xG@worktop.programming.kicks-ass.net>
 <ecd4dcc3-321c-e228-96a3-bac08c56794a@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecd4dcc3-321c-e228-96a3-bac08c56794a@nfschina.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 28, 2022 at 10:55:51AM +0800, Yu Zhe wrote:
> 在 2022年07月28日 00:00, Peter Zijlstra 写道:
> 
> > On Wed, Jul 27, 2022 at 11:14:05AM +0800, Yu Zhe wrote:
> > > time_is_before_jiffies deals with timer wrapping correctly.
> > Please explain how the current code does not.
> 
> 1. If the timer wrap changes in the future you won't have to alter your code.
> 
> 2. unsigned long ut;
> 
>    ut = ULONG_MAX + 4;
> 
>    printf("time_after(ut, ULONG_MAX), ut:%d, %d --> %d\n", ut,
>              time_after(ut, ULONG_MAX), (ULONG_MAX - ut) < 0);
> 
> 
>    In this case, time_after returns true, it's correct.

Now try the same with the existing code...
