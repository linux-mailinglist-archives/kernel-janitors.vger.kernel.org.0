Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB8E279CC3
	for <lists+kernel-janitors@lfdr.de>; Sun, 27 Sep 2020 00:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgIZWRX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 26 Sep 2020 18:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbgIZWRX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 26 Sep 2020 18:17:23 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C16C0613CE
        for <kernel-janitors@vger.kernel.org>; Sat, 26 Sep 2020 15:17:23 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id cr8so3446352qvb.10
        for <kernel-janitors@vger.kernel.org>; Sat, 26 Sep 2020 15:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fS1w4x9W5u/SBOvIdM0MH2CcotIY3Vg+sHOvEKvWrnM=;
        b=ncQk+7I0w0b/kV5aRTi/q9bjG+7SWcGv1opTIuQpMwA05J3Orat6hoBr797TtB1eD7
         PBqMXU+8SeTgg/Ol8LpEZuTqSnvHF3UXV1XTdpt4ehfCYYSLmwxQVdDMuQ+/+r07rjGa
         ioM8BqTenCHYD7uWbHbXl8GF1WK772nDyB9k0LDaOCjF1HfZ1pVLzxZjL+b5KEdFRkHT
         ICgb0/7AJ2wi4exQsX+lNR+xs3R1eEQGTd677ANdRdiy+QKSWikQFafKT4yHb+gTSnDu
         CBifmwh3qIEi7XXZCLGGW6es9N7R1IoV5nEdQPZJ5PU9352j5Ln5QE9gMtOxxeit0bkF
         vsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fS1w4x9W5u/SBOvIdM0MH2CcotIY3Vg+sHOvEKvWrnM=;
        b=ZD9SnBvpL+wqhR/9uES/I18OcPCqPyoUf1/Rbq5tfS8wTTuRr+6KbJB61crjCBGbW6
         pQAtI3K5slN7nbOuk/l1C6zziXQJFLZGKgVwed1PGtBdtp3hDN7J8aMM3AvXGq6lPt3p
         5J+fUMrJJ9cn5I4IayF309y9xF2wpsttsWro3fhNnqMQ0XYQeA8tuXpyM2G123PRPBF5
         VBI9eeojiEbauYyRkX17R9HrxBjw4/PKgSul2XqxBclB/3YZrBxiqzx4gOEpXPwCLa1e
         nHab5v52m0d2gpBL/93hBmWrZ9eq8JZ2uxZ/JR1WJFPIZgZcHfZTnlsCMcK6sWtAkiiw
         zQWQ==
X-Gm-Message-State: AOAM533aTkeQXfvmM/7/4W1b4AlgBVNw4bouyZ0d3HbANGk8nNsDPcZZ
        g4ArcH+olb3QWGVKDnzEN43KPw==
X-Google-Smtp-Source: ABdhPJzOjN9AkTy4a5cxZoUD5COTuNKTBRR+2yz5oBOt1Hm6GdAFuqlmJuK32i8Vo+ARHWQHh4J04Q==
X-Received: by 2002:a0c:8d82:: with SMTP id t2mr5349604qvb.62.1601158641732;
        Sat, 26 Sep 2020 15:17:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id f8sm4906302qkb.123.2020.09.26.15.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 15:17:21 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kMIVM-001SWH-Bf; Sat, 26 Sep 2020 19:17:20 -0300
Date:   Sat, 26 Sep 2020 19:17:20 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] mm/hmm/test: use after free in
 dmirror_allocate_chunk()
Message-ID: <20200926221720.GK9916@ziepe.ca>
References: <d1b31586-426a-e0b1-803e-3eff30196c05@web.de>
 <20200926121402.GA7467@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926121402.GA7467@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 26, 2020 at 03:14:02PM +0300, Dan Carpenter wrote:
> The error handling code does this:
> 
> err_free:
> 	kfree(devmem);
>         ^^^^^^^^^^^^^
> err_release:
> 	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>                            ^^^^^^^^
> The problem is that when we use "devmem->pagemap.range.start" the
> "devmem" pointer is either NULL or freed.
> 
> Neither the allocation nor the call to request_free_mem_region() has to
> be done under the lock so I moved those to the start of the function.
> 
> Fixes: 1f9c4bb986d9 ("mm/memremap_pages: convert to 'struct range'")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
> v2: The first version introduced a locking bug
> v3: Markus Elfring pointed out that the Fixes tag was wrong.  This bug
> was in the original commit and then fixed and then re-introduced.  I was
> quite bothered by how this bug lasted so long in the source code, but
> now we know.  As soon as it is introduced we fixed it.
> 
> One problem with the kernel QC process is that I think everyone marks
> the bug as "old/dealt with" so it was only because I was added a new
> check for resource leaks that it was found when it was re-introduced.
> 
>  lib/test_hmm.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

Hi Andrew, 

I don't have have any hmm related patches this cycle, can you take
this into your tree?

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
