Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802FD1C41A4
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 May 2020 19:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgEDRNS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 May 2020 13:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730464AbgEDRNR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 May 2020 13:13:17 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8BEC061A0F
        for <kernel-janitors@vger.kernel.org>; Mon,  4 May 2020 10:13:17 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id b1so150948qtt.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 May 2020 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xeCp8Zrwfmf8a3z9DkYAyLqXwlT7p9atEj2RIaYLh7E=;
        b=ZgfyCK8kpnqFY19HbnATMIetrpoo6bWiym5loh3EhZy8JLDnOlCLIqcXvx7EvAYQDm
         SPtnyvHnwOced8TGzYf+csNgZrBwBqFM+jzW0WSQ/hXBpddb2VZO3D9zjmLnW8pXKFE3
         SsRW78F4Ee5sRHJrNTjgDZQMqoOEMotijHsI/z2sQErY4XEWMRON+cyRUFM8r7If1u/P
         uurDzr9gg1jkKjDnodz4lv3CuSzpD3ESks0dfIxBFlRzqykAr1ngCOcp0ZHp9YpDxRT/
         3Hf68G+V761KnBsu21Jsl8UFTGjOZIFpzFOzbSkjS8dGDvp8TMoDr5qmW2WMZ0siP1Nu
         J1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xeCp8Zrwfmf8a3z9DkYAyLqXwlT7p9atEj2RIaYLh7E=;
        b=Wm2R7zhHbcRvD8wa6pobnunwBtz401FLiSxapEfrbBD3RAeCYnRfQw2D/yiq8tWuvP
         ItV9pAIUaJ/87bfncR7+lZ77iMdMBjvbe4b+/GArXeCbaMxVmONMX8EAJwOyMyQISmpd
         AdDPdKvbSU+aPAqwSDAt1AtvPNpVU+uAhAPSXDpx1xLffEDHG38Zw3NPPziE8Fg+6S+7
         Be2NH9tP6WO60NSvvc3JAP78SKAAI7aZoL45/gyFUpJrtTIsLk6RrRfckBqNk1L1Mndv
         rLfX1+8dOpeUKECYYlIWMtHUjOEoWHpcloZcrsqNdVARRM4qfD88AJdotAiyuIde7OwQ
         GXkg==
X-Gm-Message-State: AGi0PuYnNLdMK2WiqIrTPrK+8Kd7CCW0oaoqTQmJgfF4CmqT6SoXqiiU
        cx52Y/lrBrKOZfxm+z6cE7hiFa9+8jM=
X-Google-Smtp-Source: APiQypLIjJjdX1GmVO6teq5X9lLz/HEAwSfURzK2wl4KgpSM0nYVuB2nVQDYrZ913HBmcqSqDlmKDQ==
X-Received: by 2002:ac8:3279:: with SMTP id y54mr45560qta.375.1588612395993;
        Mon, 04 May 2020 10:13:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id j92sm11082160qtd.58.2020.05.04.10.13.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:13:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jVeeZ-0002nw-4p; Mon, 04 May 2020 14:13:15 -0300
Date:   Mon, 4 May 2020 14:13:15 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Faisal Latif <faisal.latif@intel.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        Doug Ledford <dledford@redhat.com>,
        Shannon Nelson <shannon.nelson@intel.com>,
        Anjali Singhai Jain <anjali.singhai@intel.com>,
        linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i40iw: Fix error handling in i40iw_manage_arp_cache()
Message-ID: <20200504171315.GA10755@ziepe.ca>
References: <20200422092211.GA195357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422092211.GA195357@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 22, 2020 at 12:22:11PM +0300, Dan Carpenter wrote:
> The i40iw_arp_table() function can return -EOVERFLOW if
> i40iw_alloc_resource() fails so we can't just test for "== -1".
> 
> Fixes: 4e9042e647ff ("i40iw: add hw and utils files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>
> ---
>  drivers/infiniband/hw/i40iw/i40iw_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
