Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BF1FE6BA
	for <lists+kernel-janitors@lfdr.de>; Fri, 15 Nov 2019 22:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKOVAX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 15 Nov 2019 16:00:23 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40057 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfKOVAX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Nov 2019 16:00:23 -0500
Received: by mail-qk1-f194.google.com with SMTP id z16so9229296qkg.7
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2019 13:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O2ZiPXcxOiy+M9Lvpig1+xN6nwmYl4rGDRQdufUv9tQ=;
        b=eL36vRAPQHS67240QT8y/Z/uh98ececvMUIuLqsRx/fEHjtfbWeKaPntMIZxUWbxbT
         5IdSpSWaEr1Jhn1zn00QzFm0mtIjyVFhZ8Xu283u9t1x55bd9zllEm3EBFGVOsy6AzQO
         2GKIErImw4w19Pc2r8lqhDzorECU53vs7SZV3KfYr61lRScv1GxVUdKRcXTsYgHtYRTn
         UAJS03kB+lWTNOonYv6mZw3EilVITvuTk80w2AmSMePOz1b1Y9me29Q6c2VK/4JAUn3o
         3g1Vp7cwAU60h/6IhjG7P45vN0OFnNO1tP6b2K/g5wvq7tEF6tSbMS60f0KF8yf69fQG
         ixRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O2ZiPXcxOiy+M9Lvpig1+xN6nwmYl4rGDRQdufUv9tQ=;
        b=j7oa8qRLqKacjb6B7ml8SPqL0dosXraLElHXP9jaq5lPvk70MdzdFFo8jlaI9q6Vql
         dBsnohkRa6V/04eFObIu9fOm6qBmD0nbFocEhMrLyfq8F36sPfoeFmskNFy0N2vctSvx
         P1SVr2Uh+we0PEcZ8a2Ja+FvcylPxhxlZIlJYZGQ967kZhN1O4hC0Lbf/GZUNIHZ+FCA
         VdlMcVb8QOuNz5RN8amrjDJcoOfp3GGIOXjDOPNS3UdMKR1q0A1ioawJtF/460fqGKVO
         wf5HidqRxQ1/SPkNRNF7RBu0cQZS14Ap0JWDzghpor/2uzFm/zrcyKQSxr04gkx9YGHi
         M7Ow==
X-Gm-Message-State: APjAAAXj+JT73S7eSSrmLN5t6snE1B4V/p6eMYpei5UnPjY1UPJZZfrD
        bKyxPkgrB24AQBO83k8K21Bjgw==
X-Google-Smtp-Source: APXvYqxfbTbNheGaAeTCaa5mJhw+2O2ku0CEpc54KfvKQBFOm9sUAiO3NZAYqXaFMR2xb7maXDBryw==
X-Received: by 2002:a37:8a01:: with SMTP id m1mr14700667qkd.147.1573851621968;
        Fri, 15 Nov 2019 13:00:21 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id w69sm4955246qkb.26.2019.11.15.13.00.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 13:00:21 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iVihY-0007hl-Tn; Fri, 15 Nov 2019 17:00:20 -0400
Date:   Fri, 15 Nov 2019 17:00:20 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     bharat@chelsio.com, dledford@redhat.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/iw_cgxb4: Fix an error handling path in
 'c4iw_connect()'
Message-ID: <20191115210020.GA29581@ziepe.ca>
References: <20190923190746.10964-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923190746.10964-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Sep 23, 2019 at 09:07:46PM +0200, Christophe JAILLET wrote:
> We should jump to fail3 in order to undo the 'xa_insert_irq()' call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure which Fixes tag to use because of the many refactorings in this
> area. So I've choosen to use none :).
> The issue was already there in 4a740838bf44c. This commit has renamed
> all labels because a new fail1 was introduced. I've not searched further.
> 
> Naming of error labels should be improved. Having nowadays a fail5
> between fail2 and fail3 (because fail5 was the last
> error handling path added) is not that readable.
> However, it goes beyong the purpose of this patch.
> 
> Maybe, just using a fail2a, just as already done in 9f5a9632e412 (which
> introduced fail5) would be enough.
> ---
>  drivers/infiniband/hw/cxgb4/cm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The disaster of the error label aside, this does fix the bug, so
applied to for-next

Thanks,
Jason
