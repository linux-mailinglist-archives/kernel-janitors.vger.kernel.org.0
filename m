Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52AA1ADD4D
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Apr 2020 14:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgDQMZq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Apr 2020 08:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728976AbgDQMZp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Apr 2020 08:25:45 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A5AC061A10
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Apr 2020 05:25:45 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id 37so738222qvc.8
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Apr 2020 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b3iFtRhJs5VqWIfspmC5p02IfQnZ1OBoJDiilSZitow=;
        b=Z9Ljm0d8QguBsl++bS9kVtdhIXM4iGBa3wZPoDF+/p5QDbbf+Ecx1WOeV/KWVqEAXj
         ABy5J6+w2bDlgPY3w06H5Xmi/cS0kRvv5T8Ra6TZWtYIBGQu5I4Rx4AHl3+T2gROjJUI
         0J0m16+FNgCJ90BwzGrj3pRV6Zus7SXB4Rjqp3UWJLn4YHfKIy4u4rXgTAeGs3KE6EUt
         wQD9z1iG0OEn/tMOLZCt4+Kkayd7XfuvCsNuXdb4ntlg7V35JxLrywkpo+GJvWBjweCZ
         Ep0gCRUjFRU+1N/O3lHk6ytDkXA+SH1mGrPuTDCuKZHiafjG1shCNAuJ0aW6sHAig3B0
         xd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b3iFtRhJs5VqWIfspmC5p02IfQnZ1OBoJDiilSZitow=;
        b=k5vzfnn3EmS8voQJKK6XSJ91/B/3/7RCD1B8cTedJzuqcAGP/u+ssaq+mQg+U3zzGd
         Q//aQuE9+uKIENZBe+qfL7oC9D/e6NssIrc4kbfQi5D19Kb7GgW7p1WY1EXa7B0dnF7p
         lNSOuu5dTq0D5kKNtMdVR4ozoXvX7CD6MypJXwsxUxesp5xOaDDNJVemCDw504uj9Uq2
         eZo+R5766Q9KEdUa6t2J3oSIqM2CoaDvoPQcekuEZ3Vc/ZLHftUsPLXUwfwiIJx2BB8H
         OULhXJcciekAW6T3piV9uY+LS53MrZLCRPQk3pPT9JHG45/AeGQxKQ1HFr2TNAnw5rgV
         oFfw==
X-Gm-Message-State: AGi0PuZF7/buGoej3AwEg5GFB2k4QwrmZ1n2uO6/yowxLZ+URK2RGViy
        1oBTAtk45fCOCOQ1Po7lDOi1DA==
X-Google-Smtp-Source: APiQypKRejHQkO6SPjqQHCzSrXkoqY5ngsJkDP3GjBxzcNqfAerdMXzQrgdeW6YJO40tzYBCUCmAeQ==
X-Received: by 2002:ad4:4c4d:: with SMTP id cs13mr2347165qvb.207.1587126344506;
        Fri, 17 Apr 2020 05:25:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id k2sm17252465qte.16.2020.04.17.05.25.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 05:25:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jPQ3y-0006eb-6h; Fri, 17 Apr 2020 09:25:42 -0300
Date:   Fri, 17 Apr 2020 09:25:42 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>, g@ziepe.ca
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        selvin.xavier@broadcom.com, devesh.sharma@broadcom.com,
        dledford@redhat.com, leon@kernel.org, colin.king@canonical.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-ID: <20200417122542.GC5100@ziepe.ca>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
 <20200416130847.GP1163@kadam>
 <20200416184754.GZ5100@ziepe.ca>
 <20200417112624.GS1163@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417112624.GS1163@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 17, 2020 at 02:26:24PM +0300, Dan Carpenter wrote:
> On Thu, Apr 16, 2020 at 03:47:54PM -0300, Jason Gunthorpe wrote:
> > On Thu, Apr 16, 2020 at 04:08:47PM +0300, Dan Carpenter wrote:
> > > On Tue, Apr 14, 2020 at 03:34:41PM -0300, Jason Gunthorpe wrote:
> > > > The memcpy is still kind of silly right? What about this:
> > > > 
> > > > static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
> > > > {
> > > > 	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
> > > > 	int cpy_len;
> > > > 
> > > > 	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
> > > > 	if (cpy_len >= len || cpy_len < 0) {
> > > 
> > > The kernel version of snprintf() doesn't and will never return
> > > negatives.  It would cause a huge security headache if it started
> > > returning negatives.
> > 
> > Begs the question why it returns an int then :)
> 
> People should use "int" as their default type.  "int i;".  It means
> "This is a normal number.  Nothing special about it.  It's not too high.
> It's not defined by hardware requirements."  Other types call attention
> to themselves, but int is the humble datatype.

No, I strongly disagree with this, it is one of my pet peeves to see
'int' being used for data which is known to be only ever be positive
just to save typing 'unsigned'.

Not only is it confusing, but allowing signed values has caused tricky
security bugs, unfortuntely.

Jason
