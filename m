Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579191A8A3D
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Apr 2020 20:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504468AbgDNSvh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Apr 2020 14:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504465AbgDNSve (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Apr 2020 14:51:34 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613B2C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2020 11:51:34 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id l13so8374910qtr.7
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Apr 2020 11:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+pj2d/UhEffZ+BGtjmYawglygVQvC6XutQRC9yavuQ8=;
        b=Fi9Gct8ywSHuMzlhqXmHeEouwgNdM/N6XscrCf6dfjOWwL3xnqOO7wmCo9DI1kK9+M
         PvFGEOIM5KxqND8BqDNIyDixTdJHNANHf9DxV4JSJXTyCQ5KOO3ajb6ButNl55OVqrSt
         DpF6PtOmcDiaDXJuy+cCA6Qg6VEAAzDXxPA35roai1S6TnDTNUReZ1hdVUq0sPLN7fCZ
         LPLRr3ZrknbT2Sx1hOPUyA6DuO+C1FS4vz07+CHmu23jNZARj9FbiH+JFyqKWlcKDTIu
         +gTrVk2EhuBmFG0PTWpkpP89xMzrzkyAPRKFL0LdAuUWyI0m/BT+lxZYa/MKuf2/n3jk
         EzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+pj2d/UhEffZ+BGtjmYawglygVQvC6XutQRC9yavuQ8=;
        b=JX6stfdd3pt6M6WgELaYkHi0ToF9FwgufJjALW2hn7StkgrJ0/rK/8xvAUItxdXPTi
         uvzOwrYI0/H5naugq6uhndezaSuO+huAM1paZYml/0/ip2OPKVB+QS1qydNxViefrrgl
         9IKILxTJ7G6jpZxgEAXlwE/bnNHnRw9BlWih0a9Hyfx2bxH2FfRINU6FZvtCDwW4aQQP
         16rdfAl5aFDrrY0aCbMW4gKRAZtqXlxNQQZsH/iURWqaiiP3upW18WYrZPlJXuDL5mlL
         yjRRO/r1oo07aSiEV50k6jf1jF6XcNGY9NS+btF+bqJiH5/T6yJUjWiTauUHIfexCYaZ
         gLTw==
X-Gm-Message-State: AGi0PuYTcPiCLzQbU5q9elnoGqw/PtpV80S8VB4Zv5rxs75+vnx3YA4c
        E9qyLpb7plmcvpt2HDPONLj3oA==
X-Google-Smtp-Source: APiQypJPbl2HYS41QgZwy6Kbla3bs4hTTS8H3zzlkOxdjWX2b0lK6R609TRSaWWLbYrQN5WnpagJpg==
X-Received: by 2002:ac8:3874:: with SMTP id r49mr17790847qtb.66.1586890293466;
        Tue, 14 Apr 2020 11:51:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id t35sm1715044qte.92.2020.04.14.11.51.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 11:51:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jOQei-0001C3-DP; Tue, 14 Apr 2020 15:51:32 -0300
Date:   Tue, 14 Apr 2020 15:51:32 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Faisal Latif <faisal.latif@intel.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        Doug Ledford <dledford@redhat.com>, sindhu.devale@intel.com,
        linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i40iw: fix null pointer dereference on a null wqe
 pointer
Message-ID: <20200414185132.GA4556@ziepe.ca>
References: <20200401224921.405279-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401224921.405279-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 01, 2020 at 11:49:21PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the null check for wqe is incorrect and lets a null wqe
> be passed to set_64bit_val and this indexes into the null pointer
> causing a null pointer dereference.  Fix this by fixing the null
> pointer check to return an error if wqe is null.
> 
> Addresses-Coverity: ("dereference after a null check")
> Fixes: 4b34e23f4eaa ("i40iw: Report correct firmware version")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>
> ---
>  drivers/infiniband/hw/i40iw/i40iw_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
