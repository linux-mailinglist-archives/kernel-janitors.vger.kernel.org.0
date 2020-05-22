Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2951DDF24
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 May 2020 07:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgEVFNX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 May 2020 01:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbgEVFNV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 May 2020 01:13:21 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240C5C05BD43
        for <kernel-janitors@vger.kernel.org>; Thu, 21 May 2020 22:13:21 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s3so11551471eji.6
        for <kernel-janitors@vger.kernel.org>; Thu, 21 May 2020 22:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MWHQvFpaWXA6nLt3wiLhFrrphRE3s7yxYwyGrpAyCCM=;
        b=Lr2U5tw3AowCbUkTYoqFdKDRVE1y5tShPYT2nKRYPcQSFbe7yLJBuUDAhTM+megEwA
         aivo5+nWC+g53adSl4NUU0zFcsrVFR7lPcz/Cy0K406aPEMkZOC9zcT8D4rcFJIRASpa
         JmP0U6C0zTVigc+48r7GpI20gLcm4zgApshrNPruaAS9utb7qEjrxXq9FiJMqzU4oSxK
         NiTidua7XbaVUmo+hoMpgJMOV8KzYuBT7tAU9KJfFZ3RLcvg7l7i04NK6TNQ4FQLTtea
         lblwWAlyOOwFH/D/8wAked+Wt6Iv1wS0sY9FscTihu3339ZpKG1Vhx32cG4vK8byv3MK
         NTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MWHQvFpaWXA6nLt3wiLhFrrphRE3s7yxYwyGrpAyCCM=;
        b=hDAa+65f65FTfZ93V4vNRkDmmRmPGqnWudGhnNCnEfdsPIRDvFjT58tYdtvMc1/ptO
         wYRoH3HlUUfdzzSBhY4T5Vt/sHnfrTsbHSBgyCiN05aShxkpMPGGa5MwpRZAq6zXHoUM
         oiZ5H1Rm1MvvLRyHnUcrD4yxroFQ6+DqpvMbD3zSDbmF4CjCgSEjVJ3oHzO9OQ85pE4W
         fybgWiV+5HICaelhM/7jlHL+hrgmSRCOOWVikCc9vF6fq8+LSNl6fxS3vWGo/na4Gu5L
         EiauNEEIhPKQZZqOmQ80Tdkfi0glv74QFAse2uQNi0uG4Ms9L+MdSePYlr/esanl8SRL
         VAHA==
X-Gm-Message-State: AOAM531jsUlvPjUv3ERbahydpr9YqGh1cORc8KQUoJ9XecbltcB8wMWB
        YgOZLg46dwBbe/sK8/xHz4Y9PP0NoGPjlM7+PWJIvQ==
X-Google-Smtp-Source: ABdhPJzZxiF70JkXGmjOELNN0LmRH4kyPtlEx4e9CMFAS4mjQopoe0fUhygSewFtJRDauvv9xcgvb103OXHkbfqDMAQ=
X-Received: by 2002:a17:907:36d:: with SMTP id rs13mr6765653ejb.478.1590124399660;
 Thu, 21 May 2020 22:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200519120347.GD42765@mwanda> <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
In-Reply-To: <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Fri, 22 May 2020 07:13:08 +0200
Message-ID: <CAMGffEmC215iOmtT_iZizey=jnbgWneE5f5zapYvdJi5WYDM1w@mail.gmail.com>
Subject: Re: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in find_or_create_sess()
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 2:52 PM Jinpu Wang <jinpu.wang@cloud.ionos.com> wrote:
>
> On Tue, May 19, 2020 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The alloc_sess() function returns error pointers, it never returns NULL.
> >
> > Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Thanks Dan,
> Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Hi Jason,

Could you also queue this fix for for-next?

Thanks
