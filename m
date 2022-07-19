Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B1E579FDD
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Jul 2022 15:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237743AbiGSNlB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Jul 2022 09:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbiGSNkj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 09:40:39 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A4595C34
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 05:54:37 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o1so11032102qkg.9
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4//TcUJ8SzvR/9+UQbiqNirtFm4ekBGYafD48m4fgXw=;
        b=bw//v/Sb0Usv3hreJD5Bl5g5aef0nQBdJHMEspOjPcX3qjqI+Kd390Gd0U3irma5F9
         yAsilVx6MknfhOzF6PYWaXpWF7NGt85aKdWaSPx5MjqN7Nr7em3SDCP6sjhd8Si7fDJX
         d0TGKk+dstEedaIw8ci3AQRVyj/u5Tkk6VMM1YMV62RwtWXE3gf1Jw1ai4ucZVWXkpcW
         iREAD9Pc17JrJo1nHUpd6SfPUPPRhyh1T78qyiayuBHIJFgnwbhCJeDEjb3Q4zuww3oT
         SY9ARIxhXJAmujVCRhc3DFCCO/Qw2pDYiVquJIf8Bklk03V7cc2dmvSeTKC3QBYxWU1f
         PKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4//TcUJ8SzvR/9+UQbiqNirtFm4ekBGYafD48m4fgXw=;
        b=d3kblweqA1vQAUNTNTzyfVtTzoyqPOElzxjK+Sm5kru7GPlMjdt1ion1XixQ8gYvUQ
         igAlCEIOny0fi6KEL1gcCX6vVWoFfV16v57hGjHnVmLmr0PS+vEfFZJGJY8kHFnjlCj0
         2q2+4yYxUWARlGL/96OW0BwuMYuebuLfUceC0NScr6drPcg3DJtToyjPqneuGlCh4auV
         b+ZFjolstXxSQiu4S3I0OUEpC0GfBOB4aNI/LK5rWhwjJu4eUjqpze3m3uDZe/vk1UjS
         XM0D3Tf8CgI6yM7AMZWpFUgvERA/BDEoAHA3U473GOnBAefm8/bPeNnTRc3CPHY4Q5R2
         DLwQ==
X-Gm-Message-State: AJIora8PBgujNAlfq5Hu2JDM4q/BbDBShwcsUqcMZYO5yvH+/4p8iF0A
        1VQQr4/3MjAzdXQo59zyhSuWOg==
X-Google-Smtp-Source: AGRyM1sJgd23NfvsjciMfUciRS7nLonmQrKLW5Eh40rnB5q5SYexVoLyz4n41e4km+Z+8u1qN9FDuw==
X-Received: by 2002:a05:620a:1d0a:b0:6b5:e416:12dd with SMTP id dl10-20020a05620a1d0a00b006b5e41612ddmr6848351qkb.209.1658235275978;
        Tue, 19 Jul 2022 05:54:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id t13-20020ac8760d000000b0031eb5648b86sm10613738qtq.41.2022.07.19.05.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 05:54:35 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1oDmkE-000ktA-KF; Tue, 19 Jul 2022 09:54:34 -0300
Date:   Tue, 19 Jul 2022 09:54:34 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Cheng Xu <chengyou@linux.alibaba.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Kai Shen <kaishen@linux.alibaba.com>,
        Leon Romanovsky <leon@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-rdma@vger.kernel.org
Subject: Re: [PATCH 1/2] RDMA/erdma: Use the bitmap API to allocate bitmaps
Message-ID: <20220719125434.GG5049@ziepe.ca>
References: <2764b6e204b32ef8c198a5efaf6c6bc4119f7665.1657301795.git.christophe.jaillet@wanadoo.fr>
 <670c57a2-6432-80c9-cdc0-496d836d7bf0@linux.alibaba.com>
 <20220712090110.GL2338@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712090110.GL2338@kadam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 12, 2022 at 12:01:10PM +0300, Dan Carpenter wrote:

> Best not to use any auto-formatting tools.  They are all bad.

Have you tried clang-format? I wouldn't call it bad..

Jason
