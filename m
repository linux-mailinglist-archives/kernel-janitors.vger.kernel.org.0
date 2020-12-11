Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A612D8142
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 22:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390817AbgLKVq4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 16:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390810AbgLKVqm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 16:46:42 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2605C0613CF
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Dec 2020 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hdv0a9V3+tspYcXx56XU7Wm5wIrbtmUO7wb5Jsv2R6w=; b=YOV/+sfeiX8P7/k6vQUAim95bq
        eXIcRmNVqm7x7jGp0oc1AUtFKlqZPJ2z/J8IwWpIVgsfSUF9e4BOtN4pxVQrAAKYU2zuOZpq+yrzZ
        4RTNmaTj1Hsy4hTOqOEHrgOdNYAj7IyAu0cQKn21ky4S/pLvRRM17vNCBvNYQJ0AH9YpjZ8XlmGAK
        IyMP79AwMrlkwAGi5u9Fxopj/A2LgEgkNLnQw36vPXVzoCuR7OYfxkUXP96ytSMUUpC84SwjxcJ07
        WL145WdWK0xqaZy6oW7agjqOYd01ACtnt/CTdVdSdALMB30G9KE/nYAIf/83OCg39tNOQsjtykNbj
        uJPwPbuw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1knqEa-000655-Qj; Fri, 11 Dec 2020 21:45:52 +0000
Date:   Fri, 11 Dec 2020 21:45:52 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mina Almasry <almasrymina@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Linux-MM <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-ID: <20201211214552.GC2443@casper.infradead.org>
References: <X9NGZWnZl5/Mt99R@mwanda>
 <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Dec 12, 2020 at 01:19:28AM +0530, Souptick Joarder wrote:
> > @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
> >
> >                 if (unlikely(add < 0)) {
> >                         hugetlb_acct_memory(h, -gbl_reserve);
> > +                       ret = add;
> 
> This function returns int but ret is long type.
> Does it need correction ?

I wouold say "no", because 'ret' isn't returned _by_ this function (*),
its purpose is to capture the return value from other functions.

(*) OK, it is, if ret < 0.  But ret < 0 really means "Is this an error
number", which can be perfectly well represented in an int, short or long.
char is too small ;-)

So the range of values which will be placed in 'ret' is (-4096-LONG_MAX]
