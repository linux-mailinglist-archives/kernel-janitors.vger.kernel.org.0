Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C750C107973
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Nov 2019 21:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfKVU1B (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Nov 2019 15:27:01 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45057 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVU1A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Nov 2019 15:27:00 -0500
Received: by mail-qt1-f196.google.com with SMTP id 30so9250935qtz.12
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Nov 2019 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TuEJSat07gB1IHltKZEvc+y9sVWtpqAObc38RVhlHg0=;
        b=ZPNwk6afKIW5LdcIqrEVpFENUsOBQjX7BOurhZoa9oUBIsHu1KKcmUKaWCot2Q+48Z
         SGX4FOcognZAAp7qk1OyjjPiiR3ZS9bJzC6+k4M09o9xN5OPVPdFnHs4uD0+aCHzdvUl
         n2ZkL3ip5FLLzoLFnrg3S+wkYJtn5JMasBIkeM6Tfob2uKznZ0Y86d77OqQaTrrLwvt1
         EZX2qVp5UVqdXnJSPUN403GQBGujUnFUfKr7+GkQvDXRgp6HLpyY+1xunABdnLI/Snyy
         xDy5l78e0J7pDTy8SMlNua2a0swLp4IC6UpLZjUIHtQL35Vb0VFRQ59cCnNECJCTAEoA
         Mp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TuEJSat07gB1IHltKZEvc+y9sVWtpqAObc38RVhlHg0=;
        b=ON8ZeWfpsvLyl9F/1xU+KaEmNWUf9VRhFD8Y1VT+sfs7CSvNZlDcUCuOttT54pFEVu
         n1fQI5E33G9Kpzf8yZ/KdvktaLJh2pkfNIi/bXVyri18nLnJBVbYYGxsPvwiuYio1tOE
         QqntFZCl5Msyca+HnI0WzHFcj00rpzRxcI4s9laGyD/cXPdsMKkE1kTRh3MZxZxH9VO5
         oZE7MTWlSUUcZTdWImDdagR36PlyDVWFZEg1pjud4ND2VNQa20KykEPOOTSyHEaCMZBb
         EV4yFlH8bBdpnY2fXrJrg81Tpj5BzfkpVR5pW8lTaQUOAp8zeuuYRSSYnzFFjE42wFo4
         8t+A==
X-Gm-Message-State: APjAAAVFkUUKoDdCXChtRxxHGSx3/n9Rum+kjQNLVAmNVHQp0dhc2K+h
        Is/NUFCU+Fo2Ar/w1FhqR+PNxVA/E3U=
X-Google-Smtp-Source: APXvYqzkWEbBdtWdJtN3F5QnaVFyACvDHG6QXr8Rgqs/FHE1QO0QMaRfW07+SVgpG840pdDY+8eSjg==
X-Received: by 2002:ac8:2432:: with SMTP id c47mr16453020qtc.74.1574454419946;
        Fri, 22 Nov 2019 12:26:59 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id r48sm4048719qte.49.2019.11.22.12.26.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 12:26:59 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iYFW6-0002OB-U5; Fri, 22 Nov 2019 16:26:58 -0400
Date:   Fri, 22 Nov 2019 16:26:58 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Mike Marciniszyn <mike.marciniszyn@intel.com>,
        Dennis Dalessandro <dennis.dalessandro@intel.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] IB/hfi1: remove redundant assignment to variable ret
Message-ID: <20191122202658.GA9162@ziepe.ca>
References: <20191122154814.87257-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122154814.87257-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 22, 2019 at 03:48:14PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
> ---
>  drivers/infiniband/hw/hfi1/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
