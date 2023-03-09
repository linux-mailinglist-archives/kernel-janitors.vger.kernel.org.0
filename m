Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E326B1F7D
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Mar 2023 10:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCIJK2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Mar 2023 04:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjCIJJv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Mar 2023 04:09:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6544A88EEE
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Mar 2023 01:09:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3FA54B81EA6
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Mar 2023 09:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74427C433EF;
        Thu,  9 Mar 2023 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678352981;
        bh=BJpDLLGSbf0JY409g2Z5Y3znzLrkWGN8coeHCLZfjtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F6S0Zx6rtJfft77ADuWW12+28sV/emIjyiCH3kHnx1zQHcvOAsBJyEpxcz9TIAkil
         rJs6+Siw+ZcGWVXp36GLcYjWTFsfwX2h12YCYFwowCsEc63PWGSJNMV2pesxJX/ulb
         JdzmWgA+jvgPvGi7BK6cOnuls9Hh/bSYMMiunni4=
Date:   Thu, 9 Mar 2023 10:09:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Charlie Sands <sandsch@northvilleschools.net>,
        Mahak Gupta <mahak_g@cs.iitr.ac.in>,
        Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
Message-ID: <ZAmiUmR2qRJhitds@kroah.com>
References: <Y/YfzZeFCAPiZ6RV@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/YfzZeFCAPiZ6RV@kili>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 22, 2023 at 04:59:41PM +0300, Dan Carpenter wrote:
> Here the code is testing to see if skb->len meets a minimum size
> requirement.  However if skb->len is very small then the ETH_HLEN
> subtraction will result in a negative which is then type promoted
> to an unsigned int and the condition will be true.
> 
> Generally, when you have an untrusted variable like skb->len, you
> should move all the math to the other side of the comparison.
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  This is basic algebra of moving parts of the
> equation from one side to the other and I am surprisingly bad at
> something that I was supposed to have learned in 9th grade.
> 
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This driver is now deleted, so no need to worry about this anymore.

thanks,

greg k-h
