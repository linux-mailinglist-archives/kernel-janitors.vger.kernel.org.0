Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041791EA864
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jun 2020 19:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgFAR14 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 1 Jun 2020 13:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAR1z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 1 Jun 2020 13:27:55 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AC4C08C5C0
        for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2020 10:27:55 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g28so9093115qkl.0
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jun 2020 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rP96bP6VHS9TeHJeGdUoDEYfJkP4LQceFnB5HubYOzw=;
        b=P6RwgixOqC5RlNfT20WL62Ws8X15jXEXiYG64uhAbucpL33u5vtJoUEQ+vhWwb/BLg
         nPUbefHIHHz4vloQwBdHF42RLvCON4P9RY+a6+HcHOB3dtnff1ucgwzuvmrMc8POyPYd
         2DF11x97dgLv6p6caGHu3EQtYFhUa42OvErXkxSJrSroVv7SFeQdUJvuF/OxEFO15Kbp
         dtcJAwBUaReA3EKXLqvi8v2keF0+bM1KofZ/ZIT7bet5v0VK+LcjfCQXgJCJgWIqAxKC
         Y9pEUXySMbKyDrhL5xjwRwFIXN7GuiMJB7GeTDACsWKs3i2WKUvgSpuQlsVl6Ka6DAtq
         l+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rP96bP6VHS9TeHJeGdUoDEYfJkP4LQceFnB5HubYOzw=;
        b=RUCakMU+SV+sO8VXGaPTmrN+5uF7DKBEzcfphcrqxV65jxAAuX6iKmWQXeSsYrIKG7
         aKxA21KNiae6F66oXTRgZhzeJ6E5DTFhSOiwchxVzcOrpn01NSnE/X19+e7qGE5oiYbA
         XmP7Iz3G7TNqAHCJn7o/GAaufE8iz9ABBeLNOfs0Ff19wDTI/dpn2qAKKmJF5kV6K0HS
         5bcjNOMNwwge8fudSz9fjXLWeP0FL7hrEFw03lp2gQNfWCKa+hS6viS3RfUFuGKCh/vU
         KJc2DyYHxXN+8nSqpTncIzsih5nzI3RcOYinbOnuoyBu9JpPmbSWwhznX8/JD+ROulSt
         ISYg==
X-Gm-Message-State: AOAM533WUiN8lunNJrZt73v2yyDMBl3axSCZ7+FcRyCIm2P1MyRGyI9S
        GMParbQDu/Z/r4g4cPkA08Vg0w==
X-Google-Smtp-Source: ABdhPJy7SpZKGc58CsHzwAOBldOQ4MAAWziUZt1G+tpGs58ZA+wKk+DQJiAKvZg5YfHWsky8RXbvJQ==
X-Received: by 2002:a37:a08e:: with SMTP id j136mr16395613qke.415.1591032474756;
        Mon, 01 Jun 2020 10:27:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id o3sm15575276qkj.97.2020.06.01.10.27.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 10:27:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jfoE5-0000fL-JB; Mon, 01 Jun 2020 14:27:53 -0300
Date:   Mon, 1 Jun 2020 14:27:53 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lijun Ou <oulijun@huawei.com>, Xi Wang <wangxi11@huawei.com>,
        "Wei Hu(Xavier)" <huwei87@hisilicon.com>,
        Weihang Li <liweihang@huawei.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/hns: Uninitialized variable in
 modify_qp_init_to_rtr()
Message-ID: <20200601172753.GA2538@ziepe.ca>
References: <20200529083918.GA1298465@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529083918.GA1298465@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 29, 2020 at 11:39:18AM +0300, Dan Carpenter wrote:
> The "dmac" variable is used before it is initialized.
> 
> Fixes: 494c3b312255 ("RDMA/hns: Refactor the QP context filling process related to WQE buffer configure")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
